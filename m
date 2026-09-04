Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABFD407CF6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512039; cv=none; b=kh7A92idpmTL3UStVCZZLdk4bnqhzhjzJ/WB6iNqp5qvZlnG8KboZl/+Qb+IsBp0N7NtFdvnXeGWHPOPG5Dblc63qB009FO9/GDyI1K4VaXtkG4q8er8Psk/Q4Mw25Hab7NnOcCBGbLxksBBbAcXR3DHwfoTXQHHqD921Zk3zoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512039; c=relaxed/simple;
	bh=KkG7bTYiub/KZcutJMSAzwPmE080XoSZe9sBHx4wg7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2+AyDFkGJLgikFAe+QafhASunu58vwbDleJzmpdfechYH8D/DcqKQttloNWneJC1Mf2RZDMsmK3/G/SbtPylePmX3lMKuaM0xNg7/VCsgO5f/Eb3DEmoaHZ1Ds9IFIBTQ47k32ItHJD6MrushScyeXKcjgtEvK0y8vtgk9gGEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q8i2bPUT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q8i2bPUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hA
	x8w5AcMi7n+SFwKUZWgCYZLD2AoFWcDhf8c+ycqro=; b=Q8i2bPUT9VuiSlo2MG
	TULRZo0TqBFgH+ytd9iobBrtGQD9fl2C5Nn3r3bi+yj6px5iw26eHXIN7KjThvVT
	rgWBo1yrNmt9wKjoTTiQ3zBGkD0DJy0x82gM00aYbQjk2Ot9z7yb/A1staI9/ze9
	4HQ2KOigjd9syaIKdV3JHddCw=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDn9+fehppqOQ1sAg--.49843S2;
	Fri, 04 Sep 2026 16:52:47 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kprateek.nayak@amd.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	connoro@google.com,
	jstultz@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Fri,  4 Sep 2026 16:52:43 +0800
Message-ID: <20260904085244.799276-2-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260904085244.799276-1-sh_def@163.com>
References: <20260904085244.799276-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn9+fehppqOQ1sAg--.49843S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1kGr4rWFW3CF1Dtw18Krg_yoWrWFykpa
	yDWa1DJw4UKayjgF1xZrWDuw13Gwn7A347WFs5GrZYkr1rKw4Fgr1vqF1avF4Ykr40kFy2
	vr4qk3y7Kr1UKr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbUUUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwR8aeWqaht-MbAAA30

Proxy execution separates the scheduling context in rq->donor from the
execution context in rq->curr. sched_tick() invokes task_tick() for the
donor's scheduling class.

task_tick_numa() operates on state associated with the task actually
executing, including its mm and NUMA work state. With proxy execution,
rq->donor provides the scheduling context while rq->curr identifies the
execution context.

Task-level execution runtime is likewise accounted to rq->curr, and
task_tick_numa() uses that runtime to drive periodic NUMA scanning.
Keeping task_tick_numa() under task_tick_fair() also means that it is not
invoked when a fair task executes on behalf of an RT or deadline donor.

Move NUMA tick handling into a scheduler helper for the execution
context, and invoke it from both sched_tick() and sched_tick_remote().

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  | 14 ++++++++++++++
 kernel/sched/fair.c  |  7 ++-----
 kernel/sched/sched.h |  1 +
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..4db55e4ace9e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5762,6 +5762,17 @@ static int __init setup_resched_latency_warn_ms(char *str)
 }
 __setup("resched_latency_warn_ms=", setup_resched_latency_warn_ms);
 
+static void sched_tick_exec_ctx(struct rq *rq)
+{
+	struct task_struct *curr = rq->curr;
+
+	if (curr->sched_class != &fair_sched_class)
+		return;
+
+	if (static_branch_unlikely(&sched_numa_balancing))
+		task_tick_numa(rq, curr);
+}
+
 /*
  * This function gets called by the timer code, with HZ frequency.
  * We call it with interrupts disabled.
@@ -5794,6 +5805,8 @@ void sched_tick(void)
 		resched_curr(rq);
 
 	donor->sched_class->task_tick(rq, donor, 0);
+	sched_tick_exec_ctx(rq);
+
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
@@ -5890,6 +5903,7 @@ static void sched_tick_remote(struct work_struct *work)
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
 			curr->sched_class->task_tick(rq, curr, 0);
+			sched_tick_exec_ctx(rq);
 
 			calc_load_nohz_remote(rq);
 		}
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..55f0460e4ae3 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4425,7 +4425,7 @@ void init_numa_balancing(u64 clone_flags, struct task_struct *p)
 /*
  * Drive the periodic memory faults..
  */
-static void task_tick_numa(struct rq *rq, struct task_struct *curr)
+void task_tick_numa(struct rq *rq, struct task_struct *curr)
 {
 	struct callback_head *work = &curr->numa_work;
 	u64 period, now;
@@ -4491,7 +4491,7 @@ static void update_scan_period(struct task_struct *p, int new_cpu)
 
 #else /* !CONFIG_NUMA_BALANCING: */
 
-static void task_tick_numa(struct rq *rq, struct task_struct *curr)
+void task_tick_numa(struct rq *rq, struct task_struct *curr)
 {
 }
 
@@ -15042,9 +15042,6 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (queued)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
-
 	task_tick_cache(rq, curr);
 
 	update_misfit_status(curr, rq);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..4d619f272b15 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4152,6 +4152,7 @@ extern void sched_cache_active_set(void);
 void sched_domains_free_llc_id(int cpu);
 
 extern void init_sched_mm(struct task_struct *p);
+void task_tick_numa(struct rq *rq, struct task_struct *p);
 
 extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
 extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);

