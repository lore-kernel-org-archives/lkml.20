Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241181;
	b=bJt2c9uowlFc4MsjIZgj8p6nhVwfPxGLhax+yfCPw5x2RTRUWPQgxwilut13seyr8k72
	 wmXxGXs2WWE+torkx6Bmce2KUfIwQLW6CQsqbPBbzh2fzfDWyX1zSLVkVKLj4InTHe+uP
	 2FUHXql2JZy7J2LiNdoJKlgFqjnzaA6Qw7Rp71W7TN1br7C0FzdfOP+v2kicy/S4x3uKL
	 BvaV3u4MHhM4UfDg/UpZnU9xWSu5Zbu+pfHDowi+amFC9gN7FS3lWn73PmM04h97Dx1h+
	 +W8CG6pTNMTBl3MnzX3+nqB5M6Tk/4PW0AH1ty5S/GUZJW5EvfAR2PFBMVs/4gr6TDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241181;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=YFJjnPZlqVOtgxJxNS0cfG/upG2shMTJq/0GydtZ0b0=;
	b=PRAXLfKKHfKUeNae8QMZBgdQAPD3rCFdtA85cc3JmgvLJXi9MsMeM9uK6qZg6XrTlOsa
	 dY4L8qPvdj1gay5vrDCbZq7rkm3zHhuTDO40VgQXSnYhnyTC/133mhRHLsr0xDAo4D4cc
	 vN3dL64p9prirDErWz2GoJVRJdGYmAfdCAUonK1w5T79rwy6bLd8DLde2ugao+C5wwO2+
	 fOJGCSdFIuLHVCOqm56cVo1t0ern6ia9k5DDjEJ4lCMYTVw9tn5oriL0JORcR7hcPJKye
	 Kh9M+ba4i5pLoi0ZmcCPGLvvikjmQFUiEyg1CimmBLA+BPzvpNCIhYYvtWQixwXD8Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6EE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSv507l9z171Yh;
	Thu, 29 Oct 2026 10:32:49 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSv227Y9z171YL;
	Thu, 29 Oct 2026 10:32:46 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 715005943;
	Thu, 29 Oct 2026 10:32:38 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:32:43 +0800
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
 Hildenbrand <david@kernel.org>, <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, <ljs@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>
Subject: [RFC PATCH v3 10/17] sched/cache: Pick the source rq/group with the highest affinity gain
Date: Thu, 29 Oct 2026 10:20:28 +0800
Message-ID: <20261029022036.4002331-11-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029022036.4002331-1-wujianyong@hygon.cn>
References: <20261029022036.4002331-1-wujianyong@hygon.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Current cache-aware source group/rq selection only counts tasks whose
preferred LLC is the destination LLC. It cannot identify aggregation
opportunities where the destination LLC is not a task's preferred LLC,
but moving there would improve affinity according to the LLC or NUMA
node affinity order.

Use the affinity gain calculation introduced in the previous commit
to select the source group and runqueue with the highest affinity
gain for the given destination.

Enable this calculation only when llc_aggr_tolerance is greater than 1,
allowing aggregation across multiple LLCs. When the tolerance is 1,
aggregation is limited to workloads that fit in a single LLC. In that
case, retain the original selection metric: count tasks whose preferred
LLC is the destination LLC. This targets aggregation directly toward
the preferred LLC without encouraging intermediate moves to other LLCs,
and avoids the additional affinity calculation overhead.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 82 +++++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb08ae66f465..e9a803433b16 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10339,6 +10339,10 @@ struct lb_env {
 	enum fbq_type		fbq_type;
 	enum migration_type	migration_type;
 	struct list_head	tasks;
+#ifdef CONFIG_SCHED_CACHE
+	/* Aggregation tolerance sampled once per balance pass. */
+	unsigned int		tol;
+#endif
 };
 
 /*
@@ -10653,7 +10657,7 @@ static bool get_node_stats(int node, unsigned long *util_out,
 	return true;
 }
 
-static enum llc_mig __maybe_unused can_migrate_llcs(int src_cpu, int dst_cpu,
+static enum llc_mig can_migrate_llcs(int src_cpu, int dst_cpu,
 				     struct task_struct *p, bool to_pref)
 {
 	unsigned long src_util, src_pre, src_cap, dst_util, dst_cap, dst_pre;
@@ -11504,7 +11508,7 @@ struct sg_lb_stats {
 	unsigned int nr_preferred_running;
 #endif
 #ifdef CONFIG_SCHED_CACHE
-	unsigned int nr_pref_dst_llc;
+	unsigned int affinity_score;	/* Affinity gain toward the destination */
 #endif
 };
 
@@ -11962,8 +11966,8 @@ static void record_sg_llc_stats(struct lb_env *env,
 }
 
 /*
- * Do LLC balance on sched group that contains LLC, and have tasks preferring
- * to run on LLC in idle dst_cpu.
+ * Consider cache-aware balancing for a group whose tasks would gain
+ * affinity by moving to the destination.
  */
 static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 			       struct sched_group *group)
@@ -11982,9 +11986,9 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 	if (env->sd->nr_balance_failed >= env->sd->cache_nice_tries + 1)
 		return false;
 
-	if (sgs->nr_pref_dst_llc &&
-	    can_migrate_llc(cpumask_first(sched_group_span(group)),
-			    env->dst_cpu, 0, true) == mig_llc)
+	if (sgs->affinity_score &&
+	    can_migrate_llcs(cpumask_first(sched_group_span(group)),
+			     env->dst_cpu, NULL, true) == mig_llc)
 		return true;
 
 	return false;
@@ -11994,10 +11998,8 @@ static bool update_llc_busiest(struct lb_env *env,
 			       struct sg_lb_stats *busiest,
 			       struct sg_lb_stats *sgs)
 {
-	/*
-	 * There are more tasks that want to run on dst_cpu's LLC.
-	 */
-	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
+	/* Prefer the group with the greater affinity gain toward dst_cpu. */
+	return sgs->affinity_score > busiest->affinity_score;
 }
 
 /*
@@ -12142,7 +12144,7 @@ static int calc_affinity_llc_score(struct sched_domain *sd, struct sched_domain
  * this_rq() stays stable for a whole pass, and two CPUs balancing at the same
  * time each get their own arrays.
  */
-static void __maybe_unused lb_affi_scratch(int **ids, int **weights, int *llc_max)
+static void lb_affi_scratch(int **ids, int **weights, int *llc_max)
 {
 	struct sched_domain *sd = rcu_dereference_all(this_rq()->sd);
 
@@ -12194,7 +12196,7 @@ static void __maybe_unused lb_affi_scratch(int **ids, int **weights, int *llc_ma
  * remain unchanged for the lifetime of the cache. The caller must
  * initialize *@last_node to -1 and *@num to 0.
  */
-static int __maybe_unused
+static int
 calc_affinity_score(struct sched_domain *sd, struct rq *rq, int src_cpu,
 		    int dst_cpu, int *affi_nodes, int *affi, int *last_node,
 		    int *num, int llc_max)
@@ -12248,6 +12250,12 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 {
 	int i, nr_running, local_group, sd_flags = env->sd->flags;
 	bool balancing_at_rd = !env->sd->parent;
+#ifdef CONFIG_SCHED_CACHE
+	int last_node = -1, node_num = 0, llc_max;
+	int *cache_data, *affi;
+
+	lb_affi_scratch(&cache_data, &affi, &llc_max);
+#endif
 
 	memset(sgs, 0, sizeof(*sgs));
 
@@ -12276,8 +12284,22 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			dst_llc = llc_id(env->dst_cpu);
 			if (llc_id(i) != dst_llc) {
 				sd_tmp = rcu_dereference_all(rq->sd);
-				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max)
-					sgs->nr_pref_dst_llc += sd_tmp->llc_counts[dst_llc];
+				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max) {
+					/*
+					 * At tolerance 1, aggregation is limited to
+					 * workloads that fit in one LLC. Only count
+					 * tasks preferring dst_llc, rather than scoring
+					 * intermediate moves along the affinity order.
+					 * Migration checks still enforce LLC headroom.
+					 */
+					if (env->tol > 1)
+						sgs->affinity_score +=
+						calc_affinity_score(env->sd, rq, i, env->dst_cpu,
+								    cache_data, affi, &last_node,
+								    &node_num, llc_max);
+					else
+						sgs->affinity_score += sd_tmp->llc_counts[dst_llc];
+				}
 			}
 		}
 #endif
@@ -13373,12 +13395,19 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 {
 	struct rq *busiest = NULL, *rq;
 	unsigned long busiest_util = 0, busiest_load = 0, busiest_capacity = 1;
-	unsigned int __maybe_unused busiest_pref_llc = 0;
+	unsigned int __maybe_unused busiest_affinity_score = 0;
 	struct sched_domain __maybe_unused *sd_tmp;
 	unsigned int busiest_nr = 0;
 	int __maybe_unused dst_llc;
 	int i;
 
+#ifdef CONFIG_SCHED_CACHE
+	int last_node = -1, node_num = 0, llc_max;
+	int *cache_data, *affi;
+
+	lb_affi_scratch(&cache_data, &affi, &llc_max);
+#endif
+
 	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
 		unsigned long capacity, load, util;
 		unsigned int nr_running;
@@ -13510,11 +13539,19 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 			dst_llc = llc_id(env->dst_cpu);
 
 			if (sd_tmp && (unsigned)dst_llc < sd_tmp->llc_max) {
-				unsigned int this_pref_llc =
-					sd_tmp->llc_counts[dst_llc];
-
-				if (busiest_pref_llc < this_pref_llc) {
-					busiest_pref_llc = this_pref_llc;
+				unsigned int affinity_score;
+
+				/* Use the same scoring policy as group selection. */
+				if (env->tol > 1)
+					affinity_score = calc_affinity_score(env->sd, rq,
+							    i, env->dst_cpu, cache_data,
+							    affi, &last_node,
+							    &node_num, llc_max);
+				else
+					affinity_score = sd_tmp->llc_counts[dst_llc];
+
+				if (busiest_affinity_score < affinity_score) {
+					busiest_affinity_score = affinity_score;
 					busiest = rq;
 				}
 			}
@@ -13732,6 +13769,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		.cpus		= cpus,
 		.fbq_type	= all,
 		.tasks		= LIST_HEAD_INIT(env.tasks),
+#ifdef CONFIG_SCHED_CACHE
+		.tol		= READ_ONCE(llc_aggr_tolerance),
+#endif
 	};
 	bool need_unlock = false;
 
-- 
2.34.1


