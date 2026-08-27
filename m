Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D40324A047
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834036; cv=none; b=JbV2GGoc8rb0RwwwCGQHT3tjKPszuc2SDyELlXIuoDus8WOSlIzbJ7KuVrJybaAXGOTs0C9/ISKG8x/RpJhln5xRb0LQs77DAtOL360iYtaTu9czToCf4THfPOovSNzzMaO6akaDMf9SJWbEcF3r1pRfvFr/403fXHeEhJwhn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834036; c=relaxed/simple;
	bh=2ECsQADlVl8qXwC7tKfoaweftxp0IEk49G0TCi/1gKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVJt+LD9/MgJA9pBiCXodnFvQHf+jygEpAM/kFoLpVexNcjDc92cfXxxM6Pxu8g97hDe7TgcF4srBd7Y/nTRoNn0uSltsoMlvP1jGkpuKa0r59s9n0swoWppETCbK9h/msYH0oHjRfxuaYkbtTiTIlpq4l72/lW5rLAtCH8c7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CP0WlzzBJb6v;
	Thu, 27 Aug 2026 20:33:37 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CN13S7zBJb6n;
	Thu, 27 Aug 2026 20:33:36 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id B5BBF78AD;
	Thu, 27 Aug 2026 20:33:28 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:34 +0800
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
Subject: [RFC PATCH v2 13/23] sched/cache: Pick optimal src rq/group using affinity promotion metric
Date: Thu, 27 Aug 2026 20:28:06 +0800
Message-ID: <20260827122816.756234-14-wujianyong@hygon.cn>
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
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Current source group/rq selection only considers LLC preference and
overlooks potential NUMA affinity improvements. Utilize the affinity
gain calculation from the prior commit to choose optimal source sched
group and runqueue in load balancing.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 505a1ea9537f..584297528a9e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10653,7 +10653,7 @@ static bool get_span_stats(const struct cpumask *span, unsigned long *util_out,
  * Decide if migration should happen on a specific node.
  * The node here is an LLC or a NUMA.
  */
-static enum llc_mig __maybe_unused can_migrate_node(int src_cpu, int dst_cpu,
+static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 			struct task_struct *p, bool to_pref)
 {
 	const struct cpumask *span;
@@ -11983,8 +11983,8 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 		return false;
 
 	if (sgs->nr_pref_dst_llc &&
-	    can_migrate_llc(cpumask_first(sched_group_span(group)),
-			    env->dst_cpu, 0, true) == mig_llc)
+	    can_migrate_node(cpumask_first(sched_group_span(group)),
+			    env->dst_cpu, NULL, true) == mig_llc)
 		return true;
 
 	return false;
@@ -12203,6 +12203,12 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 {
 	int i, nr_running, local_group, sd_flags = env->sd->flags;
 	bool balancing_at_rd = !env->sd->parent;
+#ifdef CONFIG_SCHED_CACHE
+	int last_node = -1, node_num = 0;
+	int *cache_data, *affi;
+
+	lb_affi_scratch(&cache_data, &affi);
+#endif
 
 	memset(sgs, 0, sizeof(*sgs));
 
@@ -12232,7 +12238,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			if (llc_id(i) != dst_llc) {
 				sd_tmp = rcu_dereference_all(rq->sd);
 				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max)
-					sgs->nr_pref_dst_llc += sd_tmp->llc_counts[dst_llc];
+					sgs->nr_pref_dst_llc += cal_affinity_score(env->sd, rq, i,
+					    env->dst_cpu, cache_data, affi, &last_node, &node_num);
 			}
 		}
 #endif
@@ -13330,9 +13337,13 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 	unsigned long busiest_util = 0, busiest_load = 0, busiest_capacity = 1;
 	unsigned int __maybe_unused busiest_pref_llc = 0;
 	struct sched_domain __maybe_unused *sd_tmp;
+	int __maybe_unused dst_llc, __maybe_unused *cache_data, __maybe_unused *affi;
+	int __maybe_unused last_node = -1, __maybe_unused node_num = 0, i;
 	unsigned int busiest_nr = 0;
-	int __maybe_unused dst_llc;
-	int i;
+
+#ifdef CONFIG_SCHED_CACHE
+	lb_affi_scratch(&cache_data, &affi);
+#endif
 
 	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
 		unsigned long capacity, load, util;
@@ -13466,8 +13477,8 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 
 			if (sd_tmp && (unsigned)dst_llc < sd_tmp->llc_max) {
 				unsigned int this_pref_llc =
-					sd_tmp->llc_counts[dst_llc];
-
+					cal_affinity_score(env->sd, rq, i, env->dst_cpu,
+					    cache_data, affi, &last_node, &node_num);
 				if (busiest_pref_llc < this_pref_llc) {
 					busiest_pref_llc = this_pref_llc;
 					busiest = rq;
-- 
2.34.1


