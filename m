Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261FB30E838
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408778; cv=none; b=aCyqJGpjjcWvQATD3g9g9UuXrAKLmGea3cAaWAmEX3Ewy0hRTllk9iieKQs+lsmzprzc7JNC4tsJHwWumu3h1gjkonmc6RZ/y3lTvElrje2yDnAZAANb9V8TqqLX9L0CRXJFW5ObbxLN3/URiguZC5OjHNDeQYlA+2nUoNbJmFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408778; c=relaxed/simple;
	bh=J559weD5kUpaFu/yAoxMAXqRSs5m3TYOhd/sHenqb+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owY7MxXQJUYNiJbB87jMKZvevu/u40SJXVCJ8kqekHysQQv6C3S61NXcJNgtBOh8YkmXVvT155Ah8jZTDkq8uKZo76fyP24AJhoEincUOnl+CV0PcC5KZrwRPJfYzc9yugthSdg0wl9ZQUPFERnBlwgMFLO6HwWi4tK9FZVNRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o5UPnOpQ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o5UPnOpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LH
	Vz9svOhbr0+vbADkke0zIeA+ySfVqSs6u+KbFwfZ8=; b=o5UPnOpQPACJMes7DR
	ACg+t9dd3aunVKU/Qw+FCHbvEZaQj1RfnhfrAQVJv3yV9VS/4c1MWh1dW7GBDZx7
	rDULmyAtfblBzY8QC2XPZggBHIHCVdBsLLfci82F6O3rtlwhh8Mle41UiLjdH5Rw
	rA8xJ3F9ffTkOqI7+1o+TQWnA=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAnXN+M85hqmBQ1AQ--.47753S2;
	Thu, 03 Sep 2026 12:11:57 +0800 (CST)
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
Subject: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Thu,  3 Sep 2026 12:11:53 +0800
Message-ID: <20260903041154.2479761-2-sh_def@163.com>
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
X-CM-TRANSID:_____wAnXN+M85hqmBQ1AQ--.47753S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1kGr4rWFW3Cw1fZrWxXrb_yoWrJryUpa
	yDWa17Ja17ta1jqF18ZrWDua43Gwn7u347WF4kG39Ykr4rK3yFgr10qF4avF4YkrWFkFy2
	vr4q93y7Kr1UKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwg3gQGqY842P2AAA30

Proxy execution separates the scheduling context in rq->donor from the
execution context in rq->curr. sched_tick() invokes task_tick() for the
donor's scheduling class.

task_tick_numa() is currently called from task_tick_fair(). This works
when the donor is a fair task, but not when a fair task executes on
behalf of an RT or deadline donor. In that case the donor's task_tick()
still updates the execution task's sum_exec_runtime through
update_curr_common(), but task_tick_fair() is not invoked and NUMA scan
work for the execution task is not driven.

Move the NUMA tick handling one level up into sched_tick(), and invoke it
when the execution context is a fair task.

Do the same in sched_tick_remote() so full-dynticks CPUs continue to
receive NUMA tick handling after it is removed from task_tick_fair().

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  | 9 +++++++++
 kernel/sched/fair.c  | 7 ++-----
 kernel/sched/sched.h | 1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..15fcc218d2fe 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5794,6 +5794,11 @@ void sched_tick(void)
 		resched_curr(rq);
 
 	donor->sched_class->task_tick(rq, donor, 0);
+
+	if (rq->curr->sched_class == &fair_sched_class &&
+	    static_branch_unlikely(&sched_numa_balancing))
+		task_tick_numa(rq, rq->curr);
+
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
@@ -5891,6 +5896,10 @@ static void sched_tick_remote(struct work_struct *work)
 			}
 			curr->sched_class->task_tick(rq, curr, 0);
 
+			if (curr->sched_class == &fair_sched_class &&
+			    static_branch_unlikely(&sched_numa_balancing))
+				task_tick_numa(rq, curr);
+
 			calc_load_nohz_remote(rq);
 		}
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
-- 
2.54.0

