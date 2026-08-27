Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177D222126C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=NN+PEp6aiWNpNbJ61U74Cf7IfQCLBjv1Kzidwz+fQxzIm8i/8UFrKIg/mQ/oAwMET2lZO8B9lflvKTLSjOURAKmjJEIIyDNUkIKXkut2mUpb3IYVWGuTThpa//xFHhyGXzlDJJ7OMFNSAXe7vZNoV9Hwit8DEr7objmm7cLlDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=Fx3X5Zd/pvjTIWuJ/X0SFAbjFHX2/eF0C5Pk15i4KzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6cq2vMjmkY/c+Wy6OItB/KTzlmcTGkpMTrlVXvAVUdWk3QEdDkTYDyKh+8iY1LkemgEcJXv9xkNVlIJ9/YhXH59JWX1WJYl/XEpAr2qJawuyA1cfWipRrW+RArJzSE4WgzkrFTVcsKFefQBNBjZHqD7mgNdX59j1Wa1cWxYu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C00WHczBJb6Y;
	Thu, 27 Aug 2026 20:33:16 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bz3jV1zBJb6W;
	Thu, 27 Aug 2026 20:33:15 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 1847978AD;
	Thu, 27 Aug 2026 20:33:08 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:13 +0800
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
Subject: [RFC PATCH v2 05/23] sched/topology: Introduce a macro to traverse LLC inside node
Date: Thu, 27 Aug 2026 20:27:58 +0800
Message-ID: <20260827122816.756234-6-wujianyong@hygon.cn>
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

Introduce a macro to traverse LLC only inside a node. Give a node id, this
macro can return the LLC cpumask in the order based on the LLC distance
construct in the previous patch.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/sched.h    |  14 +++
 kernel/sched/topology.c | 214 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 228 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 88b71e0f5ef0..38453a78c885 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4124,6 +4124,20 @@ extern int sched_node_order_at(int cpu, int idx);
 	     ((node) = sched_node_order_at((cpu), __sn_idx)) >= 0;	\
 	     __sn_idx++)
 
+extern int llc_node_count(int node);
+extern const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc_out);
+
+/*
+ * Walk each individual LLC belonging to NUMA node @node, nearest-first
+ * by the same-node-only llc_intra_node_distance() ordering instead of
+ * the plain ascending llc_id order of for_each_llc_in_node().
+ */
+#define for_each_llc_node_span(node, span)					\
+	for (int __lns_idx = 0, __lns_nr = llc_node_count((node));		\
+	     __lns_idx < __lns_nr &&						\
+	     ((span) = llc_node_span_by_dist((node), __lns_idx, NULL)) != NULL; \
+	     __lns_idx++)
+
 #endif
 
 void sched_domains_free_llc_id(int cpu);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a47ed44f7b1f..eaaca6c9a805 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -6,6 +6,7 @@
 #include <linux/sched/isolation.h>
 #include <linux/sched/clock.h>
 #include <linux/bsearch.h>
+#include <linux/sort.h>
 #include "sched.h"
 
 DEFINE_MUTEX(sched_domains_mutex);
@@ -698,6 +699,7 @@ static int			*sched_numa_node_distance;
 #ifdef CONFIG_SCHED_CACHE
 static int __rcu *llc_to_node_map;
 static void rebuild_llc_node_map(int size);
+static void rebuild_llc_aggr_windows(int size);
 static int __rcu *sched_cache_node_dist_matrix;
 static int sched_cache_node_dist_size;
 static void rebuild_node_distance_matrix(int size);
@@ -969,6 +971,24 @@ int llc_intra_node_distance(int llc1, int llc2, int node)
 	return (rank1 + rank2) % k + 1;
 }
 
+/*
+ * Number of LLCs in @node, sourced from llc_local_rank_topo
+ * (rebuild_llc_local_rank()).
+ */
+static int llc_local_rank_node_count(int node)
+{
+	struct llc_local_rank_topology *topo;
+	int count;
+
+	rcu_read_lock();
+	topo = rcu_dereference(llc_local_rank_topo);
+	count = (topo && node >= 0 && node < topo->nr_node) ?
+		topo->node_count[node] : 0;
+	rcu_read_unlock();
+
+	return count;
+}
+
 static void rebuild_llc_node_map(int size)
 {
 	int *new_map, *old_map;
@@ -1434,6 +1454,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 	rebuild_node_distance_matrix(nr_node_ids);
 	rebuild_node_order(nr_node_ids);
 	rebuild_llc_local_rank(max_lid + 1);
+	rebuild_llc_aggr_windows(max_lid + 1);
 	return true;
 err:
 	for_each_cpu(i, cpu_map) {
@@ -2585,6 +2606,199 @@ const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu
 
 #define llc_mask(cpu) arch_llc_mask(cpu)
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * For each node we remember where its slice of the flattened per-node
+ * LLC-id list (node_llc[]) starts (used by the for_each_llc_in_node()
+ * iterator; per-node LLC counts come from llc_local_rank_topo, see
+ * llc_local_rank_node_count()). We also cache each LLC's own cpumask
+ * (llc_span[]).
+ */
+struct llc_aggr_topology {
+	int nr_llc;
+	int nr_node;
+	int *node_offset;		/* [nr_node]: node's slice start in node_llc[] */
+	int *node_llc;			/* [nr_llc]: flattened per-node LLC ids, ascending */
+	int *node_llc_by_dist;		/* [nr_llc]: same slices as node_llc[], sorted by
+					 * llc_intra_node_distance() from each node's
+					 * lowest-id LLC instead of by id
+					 */
+	struct cpumask **llc_span;	/* [nr_llc]: cpumask of each LLC */
+};
+
+static struct llc_aggr_topology __rcu *llc_aggr_topo;
+
+static void free_llc_aggr_topology(struct llc_aggr_topology *topo)
+{
+	int i;
+
+	if (!topo)
+		return;
+
+	if (topo->llc_span) {
+		for (i = 0; i < topo->nr_llc; i++)
+			kfree(topo->llc_span[i]);
+		kfree(topo->llc_span);
+	}
+	kfree(topo->node_offset);
+	kfree(topo->node_llc);
+	kfree(topo->node_llc_by_dist);
+	kfree(topo);
+}
+
+static void rebuild_llc_aggr_windows(int size)
+{
+	struct llc_aggr_topology *topo, *old;
+	int *seen;
+	u8 *seen_llc;
+	int cpu, llc, node, i;
+
+	if (size <= 0)
+		return;
+
+	topo = kzalloc_obj(*topo);
+	if (!topo)
+		return;
+
+	topo->nr_llc  = size;
+	topo->nr_node = nr_node_ids;
+	topo->node_offset = kcalloc(nr_node_ids, sizeof(int), GFP_KERNEL);
+	topo->node_llc    = kcalloc(size, sizeof(int), GFP_KERNEL);
+	topo->node_llc_by_dist = kcalloc(size, sizeof(int), GFP_KERNEL);
+	topo->llc_span    = kcalloc(size, sizeof(struct cpumask *), GFP_KERNEL);
+	seen = kcalloc(nr_node_ids, sizeof(int), GFP_KERNEL);
+	seen_llc = kcalloc(size, sizeof(*seen_llc), GFP_KERNEL);
+	if (!topo->node_offset ||
+	    !topo->node_llc || !topo->node_llc_by_dist ||
+	    !topo->llc_span || !seen || !seen_llc) {
+		kfree(seen);
+		kfree(seen_llc);
+		free_llc_aggr_topology(topo);
+		return;
+	}
+
+	/* Cache each LLC's cpumask. */
+	for_each_possible_cpu(cpu) {
+		llc = per_cpu(sd_llc_id, cpu);
+		if (llc < 0 || llc >= size || seen_llc[llc])
+			continue;
+		seen_llc[llc] = 1;
+
+		topo->llc_span[llc] = kzalloc(cpumask_size(), GFP_KERNEL);
+		if (!topo->llc_span[llc]) {
+			kfree(seen);
+			kfree(seen_llc);
+			free_llc_aggr_topology(topo);
+			return;
+		}
+		cpumask_copy(topo->llc_span[llc], llc_mask(cpu));
+	}
+
+	for (i = 1; i < nr_node_ids; i++)
+		topo->node_offset[i] = topo->node_offset[i - 1] +
+					llc_local_rank_node_count(i - 1);
+
+	/* Fill node_llc[] (ascending llc_id per node). */
+	memset(seen_llc, 0, size * sizeof(*seen_llc));
+	for_each_possible_cpu(cpu) {
+		llc = per_cpu(sd_llc_id, cpu);
+		if (llc < 0 || llc >= size || seen_llc[llc])
+			continue;
+		seen_llc[llc] = 1;
+
+		node = llc_to_node(llc);
+		if (node < 0 || node >= nr_node_ids)
+			continue;
+
+		topo->node_llc[topo->node_offset[node] + seen[node]] = llc;
+		seen[node]++;
+	}
+	kfree(seen);
+	kfree(seen_llc);
+
+	/*
+	 * fill node_llc_by_dist[], the same per-node slices as
+	 * node_llc[] above but sorted ascending by
+	 * llc_intra_node_distance() from that node's lowest-id LLC (the
+	 * same one node_llc[]'s slice starts with) instead of by id. Used
+	 * by for_each_llc_node_span() to walk a node's own LLCs
+	 * nearest-first, unlike the plain id order of for_each_llc_in_node().
+	 * llc_intra_node_distance() guarantees no two same-node LLCs tie
+	 * from a fixed anchor's point of view, so this sort is unambiguous.
+	 */
+	for (node = 0; node < nr_node_ids; node++) {
+		struct dist_key *cand;
+		int base = topo->node_offset[node];
+		int cnt = llc_local_rank_node_count(node);
+		int anchor, k;
+
+		if (cnt == 0)
+			continue;
+
+		anchor = topo->node_llc[base];
+
+		cand = kmalloc_array(cnt, sizeof(*cand), GFP_KERNEL);
+		if (!cand) {
+			free_llc_aggr_topology(topo);
+			return;
+		}
+
+		for (k = 0; k < cnt; k++) {
+			int llc_id = topo->node_llc[base + k];
+
+			cand[k].id = llc_id;
+			cand[k].dist = llc_intra_node_distance(anchor, llc_id, node);
+		}
+
+		sort(cand, cnt, sizeof(*cand), dist_key_cmp, NULL);
+
+		for (k = 0; k < cnt; k++)
+			topo->node_llc_by_dist[base + k] = cand[k].id;
+		kfree(cand);
+	}
+
+
+	old = rcu_dereference_protected(llc_aggr_topo,
+					lockdep_is_held(&sched_domains_mutex));
+	rcu_assign_pointer(llc_aggr_topo, topo);
+	synchronize_rcu();
+	free_llc_aggr_topology(old);
+}
+
+/* Return the number of LLCs belonging to NUMA node @node. */
+int llc_node_count(int node)
+{
+	struct llc_aggr_topology *topo = rcu_dereference_all(llc_aggr_topo);
+
+	if (!topo || node < 0 || node >= topo->nr_node)
+		return 0;
+
+	return llc_local_rank_node_count(node);
+}
+
+/*
+ * Return a pointer to the cached cpumask of the LLC at position @index
+ * within NUMA node @node, ordered ascending by
+ * llc_intra_node_distance() from that node's lowest-id LLC.
+ */
+const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc_out)
+{
+	struct llc_aggr_topology *topo = rcu_dereference_all(llc_aggr_topo);
+	int llc;
+
+	if (!topo || node < 0 || node >= topo->nr_node)
+		return NULL;
+	if (index < 0 || index >= llc_local_rank_node_count(node))
+		return NULL;
+
+	llc = topo->node_llc_by_dist[topo->node_offset[node] + index];
+	if (llc_out)
+		*llc_out = llc;
+
+	return topo->llc_span[llc];
+}
+#endif /* CONFIG_SCHED_CACHE */
+
 const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_node_mask(cpu);
-- 
2.34.1


