# FinOps Odyssey — Question Bank

> 35 questions across 3 pillars. Each game draws 5 (2 INFORM + 2 OPTIMIZE + 1 OPERATE), always including at least 1 AI question.

---

## INFORM (10 questions)

### 🛰 ROGUE SATELLITE
*Untagged resources spike 40%. Finance cannot trace spend by team.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Enforce tagging policy + cost allocation | Tagging is FinOps foundation. Enables chargeback + accountability. |
| ❌ | Terminate everything untagged immediately | Too aggressive. Kills production. Visibility comes before action. |
| ❌ | Ignore until next quarterly review | Waste compounds. Untagged spend grows fast. Budget hit. |

---

### 🏢 SHARED ACCOUNT CHAOS
*3 teams share one AWS account. No way to split costs at month-end.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Showback/chargeback via account tagging | Tag-based allocation maps spend to owners. Foundation of accountability. |
| ❌ | Split bill equally across all teams | Unfair. Heavy users escape, light users overpay. Drives wrong behavior. |
| ❌ | Move all teams to one cost center | Kills accountability. No incentive to optimize. FinOps fails. |

---

### 📊 SPEND BLINDSPOT
*CFO needs real-time spend visibility across AWS, Azure, GCP. Now.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth Perspectives multi-cloud dashboard | Perspectives unifies multi-cloud spend. Single pane of glass. |
| ❌ | Export CSVs from each provider monthly | Too slow. By month-end, waste already happened. Need real-time. |
| ❌ | Build custom dashboards from scratch | Reinvent wheel. Months of dev time. Tool exists already. |

---

### 📉 RI COVERAGE COLLAPSE
*Reserved Instance coverage dropped to 20%. On-demand spend climbing.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Analyze usage patterns + buy RIs for steady-state | Match RIs to baseline. 30–72% savings on covered hours. |
| ❌ | Buy max RIs to cover everything | Over-commit risk. Stranded capacity if usage drops. Wasted commitment. |
| ❌ | Wait until next year to buy | Burning money. Every day on on-demand = lost savings. |

---

### 💼 BUDGET vs ACTUAL
*Finance asks for cloud budget vs actual report. Engineering has no answer.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth Budget Alerts + Reporting | Auto-alerts at 50/75/100% budget. Finance + Eng aligned. |
| ❌ | Eyeball provider console once a month | Too late. Anomalies invisible until billing day. Reactive = expensive. |
| ❌ | Email the dev team to slow down | Kills velocity. Wrong lever. Need data + automation. |

---

### 🧠 AI MODEL SPEND OPAQUE *(AI)*
*OpenAI + Bedrock + Claude API bills hit $80K/mo. No team breakdown.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Tag API keys per team + per use case | Key-level tagging maps token spend to teams. Foundation of AI FinOps. |
| ❌ | Pool all AI spend under R&D | No accountability. Heaviest users escape. Cost grows unchecked. |
| ❌ | Cap monthly spend hard at $80K | Blocks work. Need allocation, not arbitrary caps. Visibility first. |

---

### 🌍 EGRESS BILL SHOCK
*Data egress charges hit $40K/mo. No one knew where traffic was going.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Enable VPC flow logs + cost-per-flow analysis | Flow logs reveal hidden egress patterns. Targets cross-region waste. |
| ❌ | Disable internet gateway entirely | Breaks apps. Surgery, not amputation. Diagnose first. |
| ❌ | Switch ISPs for cheaper rates | Wrong layer. Cloud egress, not ISP. Look at actual traffic. |

---

### 🔮 FORECAST DRIFT
*Q3 actual spend 45% over forecast. Finance lost trust in numbers.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth ML forecasting + variance alerts | ML-based forecasts catch drift early. Variance alerts before quarter close. |
| ❌ | Pad next forecast by 50% for safety | Hides problem. Bigger budget = more waste. Fix the model, not the cushion. |
| ❌ | Stop forecasting. Just track actuals | No planning. Finance demands forecasts. Improve, don't abandon. |

---

### 🏷 TAG COMPLIANCE BLIND
*Policy says all resources need 5 tags. Reality: 60% have zero tags.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Tag compliance dashboard + automated enforcement | Dashboard shows gaps. Automation enforces at deploy time. |
| ❌ | Email engineering teams every Monday | Email fatigue. Doesn't scale. Automate enforcement. |
| ❌ | Accept it and move on | Giving up. Tagging is FinOps foundation. Cannot skip. |

---

### 📡 COMMITTED USE GAPS
*GCP CUDs bought 2 years ago. No tracking of utilization. Are they working?*

| # | Option | Result |
|---|--------|--------|
| ✅ | Commitment utilization report + true-up review | Track utilization vs commitment. Right-size at renewal. |
| ❌ | Cancel all CUDs and go on-demand | Overcorrection. CUDs save money when utilized. Measure first. |
| ❌ | Buy more CUDs to be safe | Blind spending. Could be over-committed already. Data first. |

---

## OPTIMIZE (10 questions)

### ⚡ OVERSIZED INSTANCE WAVE
*EC2 CPU at 6% utilization for 90 days. Big instances. Bigger bill.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Right-size based on utilization data | Right-sizing recovers 30–50% on overprovisioned compute. |
| ❌ | Wait for cloud provider price cut | Hope is not a strategy. Waste continues. Bleeds budget. |
| ❌ | Add more monitoring tools | Analysis paralysis. More tools, no action. Cost stays. |

---

### 🔥 IDLE RESOURCE BURN
*Dev environments running 24/7. Weekend + night = 70% pure waste.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Auto-shutdown schedule for non-prod | Schedules cut dev/test costs 65%. Run only when needed. |
| ❌ | Move dev to a cheaper region | Partial fix. Still wastes 24/7. Schedule was the answer. |
| ❌ | Charge each developer manually | Not scalable. Manual breaks at scale. Automate. |

---

### 💾 STORAGE METEOR SHOWER
*S3 Standard holding 3-year-old logs. Hot tier price for cold data.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Lifecycle policy → Glacier/Deep Archive | Lifecycle automation cuts storage 80%. Cold goes cold. |
| ❌ | Delete all old data without review | Compliance risk. Lost legal records. Worse than overspend. |
| ❌ | Buy more S3 capacity | Opposite of FinOps. Pays for waste forever. |

---

### ☀ SOLAR FLARE TRAFFIC
*On-demand spend 5x reserved rate. Workload is steady-state predictable.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Reserved Instances or Savings Plans | Commitment discounts 30–72% for steady-state. Predictable workload = lock it in. |
| ❌ | Keep on-demand for max flexibility | Overpay forever. Steady-state doesn't need flexibility premium. |
| ❌ | Rate-limit users to cut traffic | Hurts revenue. Wrong tradeoff. Optimize cost, not customer. |

---

### 🤖 GPU WORKLOAD SPIRAL *(AI)*
*AI training jobs on premium GPUs. No checkpointing. Costs spiral.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Spot instances + checkpointing strategy | Spot cuts AI training 70%. Checkpoints survive preemption. |
| ❌ | Buy dedicated on-prem GPU cluster | CapEx trap. Burst workloads need elastic compute. |
| ❌ | Cancel the AI initiative entirely | Kills innovation. FinOps optimizes, doesn't block. |

---

### 📸 SNAPSHOT SPRAWL
*Duplicate snapshots in 6 regions. No retention policy. Storage bill exploding.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Snapshot lifecycle policy + cross-region audit | Auto-purge old snapshots. Audit cross-region duplicates. |
| ❌ | Keep all snapshots forever just in case | Cost grows forever. 99% never used. Storage compounds monthly. |
| ❌ | Delete all snapshots immediately | DR risk. Need recovery points. Lifecycle, not slash-and-burn. |

---

### λ LAMBDA OVERPROVISION
*Lambda timing out on 3GB memory. Concurrency unlimited. Bill surprise.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Right-size memory + concurrency limits | Memory tuning cuts Lambda costs. Concurrency caps prevent runaway. |
| ❌ | Move everything to EC2 instead | Wrong tool. Serverless was right pattern. Tune, don't abandon. |
| ❌ | Bump memory to 10GB across the board | Overspend. Memory tax on every invocation. Tune per function. |

---

### 🎯 LLM TOKEN HEMORRHAGE *(AI)*
*GPT-4 calls in production. Average prompt = 8K tokens. Costs spiraling.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Prompt compression + smaller model routing | Compress prompts + route easy queries to smaller models. 60–80% savings. |
| ❌ | Switch to a cheaper provider entirely | Band-aid. Same prompts = same waste. Optimize prompts first. |
| ❌ | Cache nothing, always fresh calls | Opposite of FinOps. Caching identical prompts saves massively. |

---

### 🧬 VECTOR DB OVERSIZED *(AI)*
*Pinecone/Weaviate cluster running 24/7 at 5% query load. RAG app barely used.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Right-size pods + serverless tier for low traffic | Serverless vector DBs scale to zero. Match capacity to actual traffic. |
| ❌ | Add read replicas for resilience | Wrong direction. Already underutilized. Adding capacity adds cost. |
| ❌ | Migrate to bigger cluster pre-emptively | No usage data supports this. Optimize present before scaling future. |

---

### 🎨 INFERENCE ENDPOINT IDLE *(AI)*
*SageMaker endpoint provisioned 24/7. Used 2 hours/day. Premium GPU rate.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Serverless inference + async endpoints for batch | Serverless inference scales to zero. Async batches handle non-realtime needs. |
| ❌ | Keep endpoint warm for instant response | Overkill. 2hr usage = 22hr waste daily. Latency tradeoff worth it. |
| ❌ | Buy SageMaker savings plan to cut rate | Commits to waste. Discount on idle is still idle. Architecture first. |

---

## OPERATE (10 questions)

### ⚠ ORPHAN SERVICE LAUNCHED
*New cloud service in production. No cost owner. No budget. Spend climbing.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Assign cost owner + tag before deploy | Every resource needs an owner. Accountability = control. |
| ❌ | Let it run, sort out costs later | No accountability = uncontrolled growth. FinOps anti-pattern. |
| ❌ | Block all new launches indefinitely | Kills velocity. Govern, don't block. Enable + control. |

---

### 🔕 IGNORED ALERTS
*FinOps team alerts ignored by engineering. Anomalies fester for weeks.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Embed FinOps KPIs in sprint reviews | Make cost a first-class metric. Engineering owns spend impact. |
| ❌ | Send more alert emails to everyone | Alert fatigue. Volume hides signal. Wrong direction. |
| ❌ | FinOps team fixes everything alone | Central team can't scale. FinOps is a culture, not a person. |

---

### 🚨 FRIDAY ANOMALY
*Spend spike detected Friday 5pm. No one watching. Weekend ahead.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Auto-alerts + budget threshold triggers | Automation catches anomalies 24/7. Off-hours protected. |
| ❌ | Hire weekend ops staff to watch dashboards | Expensive + unreliable. Automation scales, humans don't. |
| ❌ | Check Monday morning, fix then | Weekend burn. 60+ hours of waste before action. Costly delay. |

---

### 🌐 MULTI-CLOUD MAZE
*3 cloud providers. 3 dashboards. No unified view. Finance furious.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth multi-cloud management | One platform, all clouds. Unified policy + reporting. |
| ❌ | Pick one provider, dump the others | Consolidation risk. Workloads optimized per cloud. Tool the answer. |
| ❌ | Manually reconcile spreadsheets monthly | Doesn't scale. Errors compound. Real-time impossible. |

---

### ☸ KUBERNETES BLOAT
*K8s cluster 30% over-provisioned. Requests > usage. Nodes underutilized.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth container rightsizing | Container-level right-sizing matches requests to actual use. |
| ❌ | Add more nodes to handle spikes | Wrong way. Already over-provisioned. Tune requests, not capacity. |
| ❌ | Increase pod requests for safety margin | Compounds waste. Padding hides inefficiency. Right-size first. |

---

### 🐢 CRAWL STAGE STUCK
*Team only reviews bills monthly. Always reactive. Never optimizing.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Move to real-time alerting + weekly reviews | Crawl→Walk→Run. Real-time data + cadence drives maturity. |
| ❌ | Wait for bigger budget to invest later | Delay = waste. FinOps maturity pays for itself fast. |
| ❌ | Outsource cost management completely | No internal culture. FinOps must be in-house ownership. |

---

### 📈 CFO DEMANDS ROI
*Executive asks: "What's our cloud ROI vs on-prem?" Need answer in 24h.*

| # | Option | Result |
|---|--------|--------|
| ✅ | CloudHealth TCO + Business Value dashboards | TCO modeling + business value reporting answers exec asks. |
| ❌ | Quote the AWS sales whitepaper | Not your data. Generic claims fail with real numbers. Tool the answer. |
| ❌ | Defer the question to next quarter | Erodes trust. Exec questions need exec-grade answers fast. |

---

### 💰 COST UP, REVENUE FLAT
*Cloud spend grew 300%. Revenue flat. Board questioning the strategy.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Unit economics: cost per business metric | Cost-per-customer or cost-per-transaction reveals true efficiency. |
| ❌ | Cut all cloud spend by 30% across the board | Blunt instrument. Kills growth investments. Need surgical cuts. |
| ❌ | Migrate everything back on-prem | Extreme reaction. Unit economics first. Diagnose before amputate. |

---

### 🛡 AI GOVERNANCE VOID *(AI)*
*Engineers spinning up GPU jobs ad-hoc. No approval. No budget review.*

| # | Option | Result |
|---|--------|--------|
| ✅ | AI workload policy + pre-deploy budget gates | Governance gates catch GPU spend before commit. Approve, then deploy. |
| ❌ | Block all GPU access except for ML team | Kills innovation. Govern, don't lock down. Enable + control. |
| ❌ | Review GPU bills monthly post-mortem | Too late. Money already spent. Need pre-deploy gates. |

---

### 🔄 AI MODEL SPRAWL *(AI)*
*Teams using 6 different LLMs across the org. No standard. No oversight.*

| # | Option | Result |
|---|--------|--------|
| ✅ | Approved model registry + central API gateway | Standard registry consolidates spend. Gateway enables governance + observability. |
| ❌ | Mandate one model for everyone | Kills use cases. Different models for different jobs. Govern, don't monopolize. |
| ❌ | Let each team pick freely. No oversight needed | Cost explosion. 6x bills, 6x risk. Standard + freedom within it. |

---

## Summary

| Pillar | Total | AI questions |
|--------|-------|-------------|
| INFORM | 10 | 1 (AI Model Spend Opaque) |
| OPTIMIZE | 10 | 4 (GPU Workload Spiral, LLM Token Hemorrhage, Vector DB Oversized, Inference Endpoint Idle) |
| OPERATE | 10 | 2 (AI Governance Void, AI Model Sprawl) |
| **Total** | **30** | **7** |

> **Game draw:** 2 INFORM + 2 OPTIMIZE + 1 OPERATE, always ≥ 1 AI question. Each correct answer = +$150 budget. Each wrong answer = −$300.
