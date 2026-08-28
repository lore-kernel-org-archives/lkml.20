Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08CD3F105D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883538; cv=none; b=MZ+w55F4eQA74HXIaLS+9gTlX4TrYwAo/3OQQwKgsA0egmkDDvXRcjG73cfTezwi5unKqYo5UIKHBZ0dPewn0bHbzk0DVazraKMgBrlbcuU2PhGUnSeJ+nK6r6j3KCL4cKtukm25hapT7sWbzGED55YJdKUv4Lt5hZi1aUnkCQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883538; c=relaxed/simple;
	bh=VQVGyqFAo1oiowdczvAr6J8yNHeVLTImkHqF32P6oe4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAm+BhScq62CV9UhNeqIeOuAHtP1085xh33CbmlykfGDHBzeOvjd3sJZx5oNwoNTHo0iCerIsFrOiQUpPQLPAAQakmKjdoyxLUql1JrGRs5AfWDNF5XKCGbejOZ4GPpCINwQV4DehaHU2hG75MVfF7Vwfmzkxud+oESEObrpBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMWP0pd6z3L52C;
	Fri, 28 Aug 2026 10:18:41 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMWM1FThz3L52C;
	Fri, 28 Aug 2026 10:18:39 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id ECF723104800;
	Fri, 28 Aug 2026 10:14:55 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:18:37 +0800
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
Subject: [RFC PATCH v2 22/23] sched/cache: Walk the preferred node from the preferred LLC
Date: Fri, 28 Aug 2026 10:14:41 +0800
Message-ID: <20260828021441.785736-1-wujianyong@hygon.cn>
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

for_each_llc_node_span() hands out a node's LLCs ordered by
llc_intra_node_distance() from that node's first LLC. That anchor is the
right one for every LLC outside the node, which all see the same order,
but not for the node the mm's preferred LLC lives in.

llc_intra_node_distance(a, b) is (rank_a + rank_b) % k + 1, so the order
seen from a rank-r anchor is a rotation of the order seen from rank 0.
With four LLCs per node and the anchor at rank 2, the canonical walk
yields distances 3, 4, 0, 2 instead of 0, 2, 3, 4. Callers that accumulate
while walking therefore treat farther LLCs as nearer ones.

Add llc_node_span_from() and for_each_llc_node_span_from(), which take the
anchor as an argument and undo the rotation, and use them wherever a
preferred LLC is already known. Nodes the anchor does not belong to keep
the canonical order, so only the preferred node's walk changes.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c     |  8 ++---
 kernel/sched/sched.h    | 17 +++++++++++
 kernel/sched/topology.c | 68 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index def42490fa2a..21513e3dd65a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10866,7 +10866,7 @@ static int mm_estimated_range_dist(int pref_cpu, u64 group_util,
 		int next_dist = INT_MAX;
 
 		for_each_sched_node(pref_cpu, node) {
-			for_each_llc_node_span(node, span) {
+			for_each_llc_node_span_from(node, llc_id(pref_cpu), span) {
 				int cpu = cpumask_first(span);
 				int dist = mm_cache_distance(pref_cpu, cpu);
 
@@ -10881,7 +10881,7 @@ static int mm_estimated_range_dist(int pref_cpu, u64 group_util,
 			break;
 
 		for_each_sched_node(pref_cpu, node) {
-			for_each_llc_node_span(node, span) {
+			for_each_llc_node_span_from(node, llc_id(pref_cpu), span) {
 				int cpu = cpumask_first(span);
 
 				if (mm_cache_distance(pref_cpu, cpu) != next_dist)
@@ -11030,7 +11030,7 @@ static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 		if (cpumask_test_cpu(dst_cpu, cpumask_of_node(node))) {
 			nu = 0;
 			nc = 0;
-			for_each_llc_node_span(node, span) {
+			for_each_llc_node_span_from(node, llc_id(target_cpu), span) {
 				get_span_stats(span, &u, &c);
 				nu += u;
 				nc += c;
@@ -11082,7 +11082,7 @@ static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 		}
 
 		/* Don't migrate if this is a good place to live. */
-		for_each_llc_node_span(node, span) {
+		for_each_llc_node_span_from(node, llc_id(target_cpu), span) {
 			get_span_stats(span, &u, &c);
 			if (cpumask_test_cpu(src_cpu, span)) {
 				if (fits_llc_capacity(u, c))
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e13775e9b177..409e889d660f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4128,6 +4128,8 @@ extern int sched_node_order_at(int cpu, int idx);
 extern int llc_node_stride;
 extern int llc_node_count(int node);
 extern const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc_out);
+extern const struct cpumask *llc_node_span_from(int node, int anchor_llc,
+						int index, int *llc_out);
 
 /*
  * Walk each individual LLC belonging to NUMA node @node, nearest-first
@@ -4140,6 +4142,21 @@ extern const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc
 	     ((span) = llc_node_span_by_dist((node), __lns_idx, NULL)) != NULL; \
 	     __lns_idx++)
 
+/*
+ * Same walk as for_each_llc_node_span(), but ordered from @anchor_llc when
+ * that LLC lives in @node. Callers that already have a preferred LLC should
+ * use this so the walk starts at the anchor instead of the node's first LLC;
+ * the two orders differ because llc_intra_node_distance() wraps modulo the
+ * node's LLC count. For any node the anchor does not belong to, this falls
+ * back to the canonical order.
+ */
+#define for_each_llc_node_span_from(node, anchor_llc, span)			\
+	for (int __lns_idx = 0, __lns_nr = llc_node_count((node));		\
+	     __lns_idx < __lns_nr &&						\
+	     ((span) = llc_node_span_from((node), (anchor_llc), __lns_idx,	\
+					  NULL)) != NULL;			\
+	     __lns_idx++)
+
 #endif
 
 void sched_domains_free_llc_id(int cpu);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 13d360070679..a0c3ec1278a6 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1022,6 +1022,25 @@ static int llc_local_rank_node_count(int node)
 	return count;
 }
 
+/*
+ * 0-based rank of @llc within its own NUMA node, -1 when unknown.
+ * Ranks are handed out in ascending LLC id order, so the node's first
+ * LLC always has rank 0.
+ */
+static int llc_local_rank(int llc)
+{
+	struct llc_local_rank_topology *topo;
+	int rank = -1;
+
+	rcu_read_lock();
+	topo = rcu_dereference(llc_local_rank_topo);
+	if (topo && llc >= 0 && llc < topo->nr_llc)
+		rank = topo->rank[llc];
+	rcu_read_unlock();
+
+	return rank;
+}
+
 static void rebuild_llc_node_map(int size)
 {
 	int *new_map, *old_map;
@@ -2854,25 +2873,62 @@ int llc_node_count(int node)
 
 /*
  * Return a pointer to the cached cpumask of the LLC at position @index
- * within NUMA node @node, ordered ascending by
- * llc_intra_node_distance() from that node's lowest-id LLC.
+ * within NUMA node @node, ordered ascending by llc_intra_node_distance()
+ * from @anchor_llc.
+ *
+ * @anchor_llc is only honoured when it belongs to @node. Pass -1, or an LLC
+ * from any other node, to get the canonical order anchored at the node's own
+ * first LLC - the order every LLC outside the node agrees on.
  */
-const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc_out)
+const struct cpumask *llc_node_span_from(int node, int anchor_llc, int index,
+					 int *llc_out)
 {
 	struct llc_aggr_topology *topo = rcu_dereference_all(llc_aggr_topo);
-	int llc;
+	int base, cnt, rank, self_slot, slot, llc;
 
 	if (!topo || node < 0 || node >= topo->nr_node)
 		return NULL;
-	if (index < 0 || index >= llc_local_rank_node_count(node))
+
+	cnt = llc_local_rank_node_count(node);
+	if (index < 0 || index >= cnt)
 		return NULL;
 
-	llc = topo->node_llc_by_dist[topo->node_offset[node] + index];
+	base = topo->node_offset[node];
+
+	if (anchor_llc < 0 || llc_to_node(anchor_llc) != node) {
+		llc = topo->node_llc_by_dist[base + index];
+	} else if (!index) {
+		llc = anchor_llc;		/* distance 0 */
+	} else {
+		rank = llc_local_rank(anchor_llc);
+		if (rank < 0)
+			return NULL;
+
+		/*
+		 * llc_intra_node_distance(anchor, x) is
+		 * (rank + rank_x) % cnt + 1, so walking that modular sum
+		 * ascending walks the distances ascending. The anchor itself
+		 * owns slot (2 * rank) % cnt and was already returned at
+		 * index 0, so step over it.
+		 */
+		self_slot = (2 * rank) % cnt;
+		slot = index - 1;
+		if (slot >= self_slot)
+			slot++;
+
+		llc = topo->node_llc[base + (slot - rank + cnt) % cnt];
+	}
+
 	if (llc_out)
 		*llc_out = llc;
 
 	return topo->llc_span[llc];
 }
+
+const struct cpumask *llc_node_span_by_dist(int node, int index, int *llc_out)
+{
+	return llc_node_span_from(node, -1, index, llc_out);
+}
 #endif /* CONFIG_SCHED_CACHE */
 
 const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
-- 
2.34.1


