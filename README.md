# 🚀 FinOps Odyssey: Quest for Lunar Savings

An 8-bit space arcade game for **CloudHealth's FinOpsX 2026 conference booth**. Players pilot a rocket to the moon, dodge cloud waste, answer FinOps decisions, and win a chance at a physical combination-lock prize.

---

## 🔗 Live URLs

| | URL |
|---|---|
| **Game** | `https://finops-odyssey.vercel.app/` |
| **Staff portal** | `https://finops-odyssey.vercel.app/ch-booth-staff.html` |

> Every `git push` to `main` auto-deploys to Vercel.

---

## 🎮 How the game works

Players open the game URL on phone or laptop — no login, no install.

1. **Pilot the rocket** through 3 mission phases: Pre-Launch → Translunar Injection → Lunar Landing
2. **Dodge waste asteroids**, collect FinOps coins (Visibility / Governance / Savings)
3. **Answer 5 FinOps quiz questions** drawn from a 30-question bank — always 2 INFORM + 2 OPTIMIZE + 1 OPERATE, always ≥1 AI question
4. **On mission success** → get a 3-digit combination number
5. **Screenshot it** → bring to the CloudHealth booth → try the lock → win

---

## 🎯 Operating at FinOpsX

### Before the conference

1. **Set the pool size** in the staff portal based on prize quantity:

   | Booth traffic | Suggested pool size | Win odds |
   |---|---|---|
   | Quiet morning | 10 | 1 in 10 |
   | Steady traffic | 30 | 1 in 30 |
   | Rush hour | 50–75 | 1 in 50 |
   | Down to last prize | 100 | 1 in 100 |

2. **Pick a number from the pool grid** → set that number on the physical lock

3. **Test end-to-end**: play a game on a phone, get a combo, verify it appears as "allocated" in the staff portal, verify the lock opens

### During the conference

**To award a prize:**
1. Player arrives with screenshot of their 3-digit combo
2. Staff scans their conference badge as usual
3. **Annotate badge scan with `GAME`**
4. Player tries their number on the lock
5. Match → prize. No match → consolation (swag, sticker)

**To change pool size mid-conference:**
1. Open staff portal → log in
2. Enter new size in "Reset & Resize Pool" → confirm
3. Pick a number from the new grid → update the lock

**To remove a leaderboard entry** (offensive name, competitor, test):
1. Open staff portal → log in
2. Find the entry → click **REMOVE** → confirm

---

## 🐛 Troubleshooting

### "Score won't save" / "Leaderboard empty"
- Open browser dev console (F12) → look for Supabase errors
- Check `SUPABASE_URL` and `SUPABASE_PUBLISHABLE_KEY` in `index.html`

### "Staff portal login fails"
- User must be invited via Supabase dashboard → Authentication → Users
- Did they accept the invite email and set a password?
- Try password reset from Supabase dashboard

### "1 IN — shows on the game"
- Pool config didn't load — check Supabase credentials in `index.html`

### "Reset pool fails with permission error"
- Session expired — log out and log back in

### "Game runs slow on mobile"
- Reduce particle effects: lower the `14` and `8` in `spawnExplosion`
- Reduce stars: change `length: 80` to `40` in `initBackground`

### "Touch controls don't work"
- Tap anywhere on the page first, then try controls

---

## 📊 Question bank

30 questions across 3 FinOps pillars:

| Pillar | Questions | AI-related |
|---|---|---|
| INFORM (visibility, allocation) | 10 | 1 |
| OPTIMIZE (waste, rightsizing) | 10 | 4 |
| OPERATE (governance, maturity) | 10 | 2 |
| **Total** | **30** | **7** |

To add or modify questions, edit the `FINOPS_EVENT_POOL` array in `index.html`.

---

## 👋 Questions?

Contact Govind / Tanuja / Siva — the FinOps game team.

> For original setup documentation, see [setup.md](setup.md).

**Good luck, and may your cloud spend be ever optimized!** 🚀💰
