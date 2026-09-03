Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C72D8370
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408776; cv=none; b=WSot3GXsBy4Ig50qdtP0EMeA9s8glCGCtO4kF/uGc21X0P1o8f56LKY+nYTQ8DqwZj/vRf7+TL/C4QcUMuRkaRiK/ONfgjrkOENBdHDNTGJCUt3LcLL7IySvP42CzC9ocxJWkZtYKsoZFc2HHw6iqOOMG/mnQpyErP9jYtaBIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408776; c=relaxed/simple;
	bh=f5iNqzWGAqJvjMg1sjcp9o4LLk8tqFvXbRKmdZ78/eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djNFEkZcHaWjhJeQJYGSusyybQ1Ha5vp3dprgISu2/1Ll2p2S+wjWvQ+x3ULfyayGE3RCKQ4vVtmX3xVHpFNQzz/s/lB/0JnAXjowK/PeKnIvsl9hXQSz05dqMg0f4Vlbnbd+cG2mzgd7Rfdq6h0gMuEzvbs5yY2mE0DhzuKkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p9/NOnWI; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p9/NOnWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=//
	nTbolChuMSeUTz/HtECCtpVHuJHhzWg+WlXu78Cws=; b=p9/NOnWIgeddkNbfFa
	IRiAFsg0a8l4bMx2fc0n62l4HskdvDZfiNZCo4l3xB4oXkj0ctxbyZPgvBPM+TeS
	grk0vxZZO1Ijlv+ir11JgpFWefEzbvOH+bInokEBAPXFoe79SoA8cIZQFs+7IGxm
	ywBxaMxfDpToufvXfZr0+Urq4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnEj+O85hqRfUqAQ--.44885S2;
	Thu, 03 Sep 2026 12:11:59 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 2/2] sched/cache: Drive cache task tick from execution context
Date: Thu,  3 Sep 2026 12:11:54 +0800
Message-ID: <20260903041154.2479761-3-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903041154.2479761-1-sh_def@163.com>
References: <20260903041154.2479761-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnEj+O85hqRfUqAQ--.44885S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyxGw1DWr17XF1fZw4xWFg_yoWrAF18pa
	yDWa1UJF4UtayjqF18ZrWDA3W3Wwn2ya42gFs5G3yFkr1rKw1FgFy0qa1avF4Yyr10ka42
	vr4jkry7Kr4UKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXyCJUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6g-gQGqY84-XgwAA3f

Cache-aware scheduling accounts CPU runtime to the mm of the task
actually executing. update_se() passes the execution task to
account_mm_sched() for this purpose.

With proxy execution, however, sched_tick() invokes task_tick() for the
scheduling context in rq->donor. task_tick_cache() is currently called
from task_tick_fair(), so it is skipped when a fair task executes on
behalf of an RT or deadline donor.

In that case account_mm_sched() continues to advance runtime accounting
for rq->curr, while task_tick_cache() does not advance the corresponding
mm scan epoch. Once the epoch becomes stale, account_mm_sched() can
invalidate the mm's preferred LLC.

Move cache tick handling one level up into sched_tick(), alongside NUMA
tick handling, and run it when the execution context is a fair task.

Do the same in sched_tick_remote() so full-dynticks CPUs retain cache
tick handling after it is removed from task_tick_fair().

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  | 16 ++++++++++------
 kernel/sched/fair.c  |  6 ++----
 kernel/sched/sched.h |  1 +
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 15fcc218d2fe..dfef97ef8217 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5795,9 +5795,11 @@ void sched_tick(void)
 
 	donor->sched_class->task_tick(rq, donor, 0);
 
-	if (rq->curr->sched_class == &fair_sched_class &&
-	    static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, rq->curr);
+	if (rq->curr->sched_class == &fair_sched_class) {
+		if (static_branch_unlikely(&sched_numa_balancing))
+			task_tick_numa(rq, rq->curr);
+		task_tick_cache(rq, rq->curr);
+	}
 
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
@@ -5896,9 +5898,11 @@ static void sched_tick_remote(struct work_struct *work)
 			}
 			curr->sched_class->task_tick(rq, curr, 0);
 
-			if (curr->sched_class == &fair_sched_class &&
-			    static_branch_unlikely(&sched_numa_balancing))
-				task_tick_numa(rq, curr);
+			if (curr->sched_class == &fair_sched_class) {
+				if (static_branch_unlikely(&sched_numa_balancing))
+					task_tick_numa(rq, curr);
+				task_tick_cache(rq, curr);
+			}
 
 			calc_load_nohz_remote(rq);
 		}
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 55f0460e4ae3..f335479ba562 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1774,7 +1774,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	}
 }
 
-static void task_tick_cache(struct rq *rq, struct task_struct *p)
+void task_tick_cache(struct rq *rq, struct task_struct *p)
 {
 	struct callback_head *work = &p->cache_work;
 	struct mm_struct *mm = p->mm;
@@ -1996,7 +1996,7 @@ static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
 
 void init_sched_mm(struct task_struct *p) { }
 
-static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
+void task_tick_cache(struct rq *rq, struct task_struct *p) { }
 
 static inline int get_pref_llc(struct task_struct *p,
 			       struct mm_struct *mm)
@@ -15042,8 +15042,6 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (queued)
 		return;
 
-	task_tick_cache(rq, curr);
-
 	update_misfit_status(curr, rq);
 	check_update_overutilized_status(task_rq(curr));
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4d619f272b15..5d1f5ee47bf1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4153,6 +4153,7 @@ void sched_domains_free_llc_id(int cpu);
 
 extern void init_sched_mm(struct task_struct *p);
 void task_tick_numa(struct rq *rq, struct task_struct *p);
+void task_tick_cache(struct rq *rq, struct task_struct *p);
 
 extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
 extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);
-- 
2.54.0

