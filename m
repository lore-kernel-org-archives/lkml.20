Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2923FCB37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512040; cv=none; b=hnBxxvio5DtcnmqbSB8K1GfVOXrMUP6qh90Xbb5xtRV0SO5A69qHsiY2qpcOLrQslTLnOrCfXrEAyEevf67YNkpWDMwnSFVjVrY0uWO2gnlHoZsF6H13imjJj+byFHBFhb0KOcAyMiNlkbo9nbZWhrfDC0e8X6lSZmF+mBpeY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512040; c=relaxed/simple;
	bh=ujPoI3WZTYZJvu+8KsGsqjcJJ02tCGGjG7jqVeIHUw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQbB/RQslYVfS16r4xwMbmT/LX+1KKhivcXlJI0388zdgTDKdSEA3DE5voLXUTS9U8qyKi1aMoQStJo+Y4dO3T1wZVIIpxxJQHP0ngd/bD3AjBArlIia0tA8e5L+kA7+w18iVybbHel68HFyng/Un0aXbznuNel+c3H6SmEoYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UdscEhvB; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UdscEhvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=L8
	Sqz3pezr4ceawkMz9qGzXiScCqUayQXqF2L7MGyIc=; b=UdscEhvBHsLKHhHsrX
	1gY9f2W8U/+msd5qLjKYDB1ajdYDiGwqkDCgYaSZpDbmZxlS9/Gkl3CLYDNkY08H
	xCw6SXWushHqJ9lDoIpdId0DuEuOLXm6uCVZ7SVXL3o5w1FfLxr5PzRTtTRmM45O
	iL00MtHnxfOWe+NwtXo+cT2cE=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnpR3fhppqbSRxPw--.20264S2;
	Fri, 04 Sep 2026 16:52:48 +0800 (CST)
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
Subject: [PATCH v3 2/2] sched/cache: Drive cache task tick from execution context
Date: Fri,  4 Sep 2026 16:52:44 +0800
Message-ID: <20260904085244.799276-3-sh_def@163.com>
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
X-CM-TRANSID:QCgvCgCnpR3fhppqbSRxPw--.20264S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyxGw1DWr17XF15uF45Jrb_yoWrJFWUpa
	yDWa17Jr4kJayjgFy8Z3ykAr13G3sava43KFs5Jw4Fkr1rtw1Y9Fyjq3W2vr4Yvr10ka42
	vr4j9347Gr1jgr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjHqcUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QAbemqahuCAeAAA3m

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

Move cache tick handling into sched_tick_exec_ctx(), alongside NUMA tick
handling, and run it when the execution context is a fair task. Use the
same helper from sched_tick() and sched_tick_remote() so both tick paths
handle the execution context consistently.

Keep the remaining task_tick_fair() bookkeeping with its task argument,
since misfit, overutilized, and core scheduling state belong to the
scheduling context.

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  |  1 +
 kernel/sched/fair.c  | 11 +++++++----
 kernel/sched/sched.h |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 4db55e4ace9e..7b8d4b06207d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5771,6 +5771,7 @@ static void sched_tick_exec_ctx(struct rq *rq)
 
 	if (static_branch_unlikely(&sched_numa_balancing))
 		task_tick_numa(rq, curr);
+	task_tick_cache(rq, curr);
 }
 
 /*
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 55f0460e4ae3..c519bb193850 100644
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
@@ -15042,8 +15042,11 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (queued)
 		return;
 
-	task_tick_cache(rq, curr);
-
+	/*
+	 * Misfit, overutilized and core scheduling state belong to the
+	 * scheduling context, and therefore stay with @curr rather than
+	 * rq->curr. See sched_tick_exec_ctx() for execution-context work.
+	 */
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

