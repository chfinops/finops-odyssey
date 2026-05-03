# 🚀 FinOps Odyssey: Quest for Lunar Savings

An 8-bit space arcade game built for **CloudHealth's FinOpsX 2026 conference booth**. Players pilot the CloudHealth rocket to the moon, dodge cloud waste, answer FinOps decisions, and win a chance at a physical combination-lock prize.

![Mission Phases](https://img.shields.io/badge/phases-3-orange)
![Questions](https://img.shields.io/badge/questions-30-blue)
![AI Questions](https://img.shields.io/badge/AI_questions-7-purple)
![Stack](https://img.shields.io/badge/stack-HTML5_+_Supabase_+_Vercel-green)

---

## 📦 What's in this repo

```
finops-odyssey/
├── index.html              # The game
├── admin.html              # Booth staff portal
├── config.example.js       # Supabase credentials template (copy → config.js, gitignored)
├── supabase_setup.sql      # One-time database setup
└── README.md               # This file
```

---

## 🎮 How the game works

**Players** open the URL on phone or laptop, no login. They:
1. Pilot the rocket through 3 mission phases (Pre-Launch → Translunar Injection → Lunar Landing)
2. Dodge waste asteroids, collect FinOps coins (Visibility / Governance / Savings)
3. Answer **5 FinOps quiz events** picked from a 30-question bank (always pillar-balanced 2-2-1, always ≥1 AI question)
4. On mission success, get a **3-digit combination number** drawn from a configurable pool
5. Take a screenshot, bring it to the booth, try it on the physical lock to win

**Booth staff** uses `admin.html` to:
- See live odds (1 in N, where N = pool size)
- View the pool of valid numbers + which have been allocated
- Pick a number to set on the physical lock
- Resize the pool (during reset only) to control win frequency
- Remove inappropriate leaderboard entries

---

## 🛠️ Setup: 4 systems, 30 minutes

### 1. Supabase (Database + Auth)

#### a) Create project
- Go to [supabase.com](https://supabase.com) → **New Project**
- Name it `finops-odyssey`
- Choose a region close to your audience
- Save the database password somewhere safe

#### b) Run the SQL
- Open **SQL Editor** in the Supabase dashboard
- Click **New Query**
- Paste the entire contents of `supabase_setup.sql`
- Click **Run**

This creates 3 tables (`scores`, `pool_config`, `allocations`), seeds an initial 100-number pool, and configures Row Level Security policies.

#### c) Get your API credentials
- Go to **Settings → API**
- Copy these two values:
  - **Project URL** (e.g. `https://abcdefg.supabase.co`)
  - **anon public key** (the long JWT string)

> ⚠️ The anon key is **safe to put in client-side HTML** — RLS policies prevent unauthorized writes. Never expose the **service_role** key.

#### d) Invite booth staff
- Go to **Authentication → Users**
- Click **Invite user** for each staff member who'll work the booth
- They'll get an email with a password setup link
- Only invited users can log into `admin.html`

---

### 2. Configure credentials

```bash
cp config.example.js config.js
```

Open `config.js` and fill in your values from step 1c:

```javascript
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

> ⚠️ `config.js` is gitignored — never commit it. Both `index.html` and `admin.html` load it automatically via `<script src="config.js">`.

---

### 3. GitHub (Source control)

#### a) Create the repo
```bash
# Rename game file to index.html (Vercel default)
mv finops_odyssey.html index.html

# Initialize git
git init
git add .
git commit -m "feat: initial FinOps Odyssey game"

# Create GitHub repo (using GitHub CLI)
gh repo create finops-odyssey --public --source=. --push

# Or manually: create repo at github.com, then:
git remote add origin https://github.com/YOUR_ORG/finops-odyssey.git
git branch -M main
git push -u origin main
```

#### b) Add a `.gitignore`
```
.DS_Store
.env
.env.local
node_modules/
*.log
config.js
```

> ⚠️ Never commit `config.js` — it contains your real Supabase credentials. Only `config.example.js` (with placeholder values) belongs in git.

---

### 4. Vercel (Hosting)

#### a) Connect GitHub
- Go to [vercel.com](https://vercel.com) → **Add New → Project**
- Import the `finops-odyssey` repo
- Framework Preset: **Other** (it's static HTML)
- Root Directory: `./`
- Build Command: *(leave empty)*
- Output Directory: *(leave empty)*
- Click **Deploy**

#### b) Custom domain (optional)
- Vercel dashboard → **Domains**
- Add `finops.cloudhealth.com` (or whatever)
- Follow DNS instructions to point a CNAME to `cname.vercel-dns.com`

#### c) Done
Every `git push` to `main` auto-deploys. You'll have:
- **Game**: `https://your-app.vercel.app/`
- **Admin**: `https://your-app.vercel.app/admin.html`

---

## 🎯 Operating the game at FinOpsX

### Pre-conference

1. **Adjust the pool size** in admin.html based on prize quantity:
   - Pool size = how many unique numbers exist
   - Lock combo is set to ONE of those numbers
   - Lower pool = higher win rate
   - Reset clears all allocations

2. **Test the flow** end-to-end:
   - Play a game on a phone, get a combo
   - Verify it shows up as "allocated" in admin.html
   - Verify the lock combo (one you pick) actually opens the lock

### During the conference

| Booth traffic | Suggested pool size | Win odds |
|---|---|---|
| Quiet morning | 10 | 1 in 10 |
| Steady traffic | 30 | 1 in 30 |
| Rush hour | 50–75 | 1 in 50 |
| Down to last prize | 100 | 1 in 100 |

**To change pool size mid-conference:**
1. Open `admin.html` → log in
2. Enter new size in "Reset & Resize Pool"
3. Confirm the warning (clears all current allocations)
4. **Pick a number from the new grid** → set lock to it
5. Game's "1 in X" display updates automatically on next page load

**To award a prize:**
1. Player arrives with screenshot of their 3-digit combo
2. Staff scans their conference badge as usual
3. **Annotate badge scan with `GAME`** (per requirement)
4. Player tries their number on the lock
5. If it matches → prize. If not → consolation (e.g. swag, sticker)

**To remove a leaderboard entry** (offensive name, competitor, test):
1. Open `admin.html` → log in
2. Find the entry in the leaderboard table
3. Click **REMOVE** → confirm

---

## 🔒 Security & privacy notes

- **No PII collected** by the game itself — just nicknames (8 chars max, alphanumeric)
- **Email addresses** only stored for booth staff via Supabase Auth (not collected from players)
- **Badge scanning** happens at the booth using existing scanner — game doesn't touch it
- **HTTPS** enforced by Vercel automatically
- **RLS policies** prevent direct database tampering even with the anon key
- **Admin updates** require Supabase Auth session (email + password)

---

## 🐛 Troubleshooting

### "Score won't save" / "Leaderboard empty"
- Open browser dev console (F12)
- Look for Supabase errors
- Most common: wrong `SUPABASE_URL` or `SUPABASE_ANON_KEY` in `config.js`, or `config.js` not present
- Or: RLS policies didn't get created — re-run `supabase_setup.sql`

### "Admin login fails"
- Did you invite the user via Authentication → Users?
- Did they accept the email invite and set a password?
- Try password reset from the Supabase dashboard

### "1 IN — shows on the game"
- Pool config didn't load — check Supabase URL/key
- Or pool_config table is empty — run the seed query in `supabase_setup.sql`

### "Reset pool fails with permission error"
- Logged-in user doesn't have an active session
- Log out and log back in
- Or: RLS policy missing — re-run setup SQL

### "Game runs slow on mobile"
- Reduce particle effects (set `for (let i = 0; i < (big ? 14 : 8); i++)` to lower numbers in `spawnExplosion`)
- Reduce stars: change `length: 80` in `initBackground` to `40`

### "Touch controls don't work"
- iOS Safari sometimes needs a tap on the page first to enable audio context (we don't use audio, but viewport sizing can be affected)
- Make sure `viewport-fit=cover` is in the meta tag (it is)

---

## 📊 Question bank

The game ships with **30 FinOps questions** across the 3 pillars:

| Pillar | Total | AI-related |
|---|---|---|
| INFORM (visibility, allocation) | 10 | 1 |
| OPTIMIZE (waste, rightsizing) | 10 | 4 |
| OPERATE (governance, maturity) | 10 | 2 |
| **TOTAL** | **30** | **7** |

Every game randomly picks **5 questions** with this distribution: **2 INFORM + 2 OPTIMIZE + 1 OPERATE**, and **always at least 1 AI-related question**.

To add or modify questions, edit the `FINOPS_EVENT_POOL` array in `index.html`.

---

## 🚀 Tech stack

- **Frontend**: Vanilla HTML5 Canvas + JavaScript (zero build step, no framework)
- **Styling**: Hand-rolled CSS with pixel-art aesthetic, Press Start 2P + Orbitron fonts
- **Database**: Supabase (Postgres + Auth + RLS)
- **Hosting**: Vercel (static, auto-deploy on git push)
- **Total moving parts**: 4 files, 1 database, 1 Vercel project

---

## 👋 Questions?

Contact Govind / Tanuja / Siva — the FinOps game team.

**Good luck, and may your cloud spend be ever optimized!** 🚀💰
