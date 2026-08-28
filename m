Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1756E1922FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882542; cv=none; b=flHYG31YZKVNFItAp/qY0oy9WH5MRdVqlupKl0pt4GXdz+5HNqnz/AwbulW4m+7v1bQOw+JSr8zjuz+lZxmvIDQ+0t2CSl/8gEXvc1XaMdcZw+piq9hq0XAPGQsLpp6cwsrb3U2oKSogxsGWxNNDLouPDWkCe6hU/AUOkhoSdr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882542; c=relaxed/simple;
	bh=RB9Qy0pH6ejON+PJONje+rXCX8oFvu3YIb3N/Nqw/hQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ttg5JnDkB4Vfs5nrjuhFZdh6PGQ9fhynwKnxXb5/BgVshbjDFdgJ2hjyprCiQxaH0TVCfFW6bOXUKclbVAPpcbGquYZ5p219bLwjNmjuB6SsofF7/SnSS0zRUY8/KQ+pUdXvwBfOSG82rIGoaODNhf8LjL+Xr5GtwczCY8Oxs3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWM870JV2z34Dg;
	Fri, 28 Aug 2026 10:01:59 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWM864Fgfz34Dg;
	Fri, 28 Aug 2026 10:01:58 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 594BA596B;
	Fri, 28 Aug 2026 10:01:50 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:01:57 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>, <justin.he@arm.com>
Subject: [RFC PATCH v2 15/23] sched/cache: Judge migration eligibility in LLC granularity
Date: Fri, 28 Aug 2026 09:58:08 +0800
Message-ID: <20260828015808.784722-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827122816.756234-1-wujianyong@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

Helpers compute affinity gain has been introduced in the
previous patches. Leverage this helper to assess migration eligibility
during load balance, covering paths like can_migrate_llc_task and
alb_break_llc.

In alb_break_llc, change the logic to only handle runqueues with a single
task as we need the preferred LLC as a input to decide if it need migrate.

Runqueues holding multiple tasks are evaluated in can_migrate_task instead.
We move the NUMA affinity check ahead of active load balance logic here.
Without this reordering, multi-task runqueues skip alb_break_llc filtering,
which could trigger need_active_balance = true and set LBF_ACTIVE_LB
even when the task already resides on its optimal node, which is an
undesirable migration scenario we want to avoid.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 126 +++++++++++++++++---------------------------
 1 file changed, 49 insertions(+), 77 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5c35a43e5e38..0defdd4316b8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10562,54 +10562,6 @@ enum llc_mig {
 	mig_unrestricted	/* G: Don't restrict generic load balance migration */
 };
 
-/*
- * Check if task can be moved from the source LLC to the
- * destination LLC without breaking cache aware preferrence.
- * src_cpu and dst_cpu are arbitrary CPUs within the source
- * and destination LLCs, respectively.
- */
-static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
-				    unsigned long tsk_util,
-				    bool to_pref)
-{
-	unsigned long src_util, dst_util, src_cap, dst_cap;
-
-	if (!get_llc_stats(src_cpu, &src_util, &src_cap) ||
-	    !get_llc_stats(dst_cpu, &dst_util, &dst_cap))
-		return mig_unrestricted;
-
-	src_util = src_util < tsk_util ? 0 : src_util - tsk_util;
-	dst_util = dst_util + tsk_util;
-
-	if (!fits_llc_capacity(dst_util, dst_cap) &&
-	    !fits_llc_capacity(src_util, src_cap))
-		return mig_unrestricted;
-
-	if (to_pref) {
-		/*
-		 * Don't migrate if we will get preferred LLC too
-		 * heavily loaded and if the dest is much busier
-		 * than the src, in which case migration will
-		 * increase the imbalance too much.
-		 */
-		if (!fits_llc_capacity(dst_util, dst_cap) &&
-		    util_greater(dst_util, src_util))
-			return mig_forbid;
-	} else {
-		/*
-		 * Don't migrate if we will leave preferred LLC
-		 * too idle, or if this migration leads to the
-		 * non-preferred LLC falls within sysctl_aggr_imb percent
-		 * of preferred LLC, leading to migration again
-		 * back to preferred LLC.
-		 */
-		if (fits_llc_capacity(src_util, src_cap) ||
-		    !util_greater(src_util, dst_util))
-			return mig_forbid;
-	}
-	return mig_llc;
-}
-
 /*
  * Like get_llc_stats but for sched domain that above LLC level.
  * Based on get_llc_stats, we can accumulate utilization and cap for
@@ -10795,6 +10747,29 @@ static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 	return mig_unrestricted;
 }
 
+/* Decide if the migration improve the affinity */
+static bool if_to_prefer(int src_cpu, int dst_cpu, int pref_llc)
+{
+	int src_dist, dst_dist, src_node, dst_node, pref_node;
+
+	src_node = cpu_to_node(src_cpu);
+	dst_node = cpu_to_node(dst_cpu);
+	pref_node = llc_to_node(pref_llc);
+
+	if (src_node == pref_node && dst_node == pref_node) {
+		src_dist = llc_intra_node_distance(llc_id(src_cpu), pref_llc, pref_node);
+		dst_dist = llc_intra_node_distance(llc_id(dst_cpu), pref_llc, pref_node);
+	} else {
+		src_dist = sched_cache_node_distance(src_node, pref_node);
+		dst_dist = sched_cache_node_distance(dst_node, pref_node);
+	}
+
+	if (src_dist < 0 || dst_dist < 0)
+		return false;
+
+	return src_dist > dst_dist;
+}
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
@@ -10822,15 +10797,10 @@ static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
 		return mig_unrestricted;
 	}
 
-	if (cpus_share_cache(dst_cpu, cpu))
-		to_pref = true;
-	else if (cpus_share_cache(src_cpu, cpu))
-		to_pref = false;
-	else
-		return mig_unrestricted;
+	to_pref = if_to_prefer(src_cpu, dst_cpu, llc_id(cpu));
 
-	return can_migrate_llc(src_cpu, dst_cpu,
-			       task_util(p), to_pref);
+	return can_migrate_node(src_cpu, dst_cpu,
+			       p, to_pref);
 }
 
 /*
@@ -10844,33 +10814,35 @@ static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
 static inline bool
 alb_break_llc(struct lb_env *env)
 {
+	int pref_llc = -1;
+	bool to_pref = false;
+
 	if (!sched_cache_enabled())
 		return false;
 
 	if (cpus_share_cache(env->src_cpu, env->dst_cpu))
 		return false;
 	/*
-	 * All tasks prefer to stay on their current CPU.
-	 * Do not pull a task from its preferred CPU if:
-	 * 1. It is the only task running and does not exceed
-	 *    imbalance allowance; OR
-	 * 2. Migrating it away from its preferred LLC would violate
-	 *    the cache-aware scheduling policy.
+	 * We need the preferred LLC to decide whether we can perform migration.
+	 * Therefore, we need to obtain task_struct, which is only meaningful
+	 * in the case that only one task on the rq.
+	 * For cases with more than one task on the rq, we need to check
+	 * this in can_migrate_task().
 	 */
-	if (env->src_rq->nr_pref_llc_running &&
-	    env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable) {
-		unsigned long util = 0;
+	if (env->src_rq->nr_running == 1) {
 		struct task_struct *cur;
 
-		if (env->src_rq->nr_running <= 1)
-			return true;
-
 		cur = rcu_dereference_all(env->src_rq->curr);
-		if (cur && cur->sched_class == &fair_sched_class)
-			util = task_util(cur);
+		if (!cur || !cur->mm)
+			return false;
 
-		if (can_migrate_llc(env->src_cpu, env->dst_cpu,
-				    util, false) == mig_forbid)
+		if (cur->sched_class == &fair_sched_class)
+			pref_llc = llc_id(cur->mm->sc_stat.cpu);
+
+		to_pref = if_to_prefer(env->src_cpu, env->dst_cpu, pref_llc);
+
+		if (can_migrate_node(env->src_cpu, env->dst_cpu,
+				    cur, to_pref) == mig_forbid)
 			return true;
 	}
 
@@ -11022,14 +10994,11 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 
 	/*
 	 * Aggressive migration if:
-	 * 1) active balance
-	 * 2) destination numa is preferred
+	 * 1) destination numa is preferred
+	 * 2) active balance
 	 * 3) task is cache cold, or
 	 * 4) too many balance attempts have failed.
 	 */
-	if (env->flags & LBF_ACTIVE_LB)
-		return 1;
-
 	degrades = migrate_degrades_locality(p, env);
 	if (!degrades) {
 		/*
@@ -11055,6 +11024,9 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 		hot = degrades > 0;
 	}
 
+	if (env->flags & LBF_ACTIVE_LB)
+		return 1;
+
 	if (!hot || env->sd->nr_balance_failed > env->sd->cache_nice_tries) {
 		if (hot)
 			p->sched_task_hot = 1;
-- 
2.34.1


