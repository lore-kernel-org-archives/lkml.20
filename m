Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45CB23E334
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834017; cv=none; b=LtxBtQ7XQTXv2etjpuKCEEKz68OFvDuK6IZYrB8+96V7csq3kUaFHLQlQVkWLPTHUh3VxNbpcezaP+wFIe9XDTdfoQ+eIWHtoYsJPxMz0qKT8ZZ5RwcPCY9aJtmYLI+JutkMK2NCknO9xjRuS8pKFs3EGLm+Rv4b2FMLafCcxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834017; c=relaxed/simple;
	bh=FeLDcWgpWKGaPUSzfZKCP33RZkDy8PreL2CADI5XP6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0ojelD36w/uvHA1w+UW3+cNPiu0ZnTbUYC888lP1aBHBFSGy472gfztJ2GIcsRODZ5n/9qO5RV0Kb76u8tRKS3oUWSIWBJrVG+8awde9FtVOwzjqhhsgwjynLOTmNJNqb0Y+bN1zON8t5k7gmOHiuFBUOA2HQFkh6/c2zp9zKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bt0W12zBJb6L;
	Thu, 27 Aug 2026 20:33:10 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bs4rfxzBJY4k;
	Thu, 27 Aug 2026 20:33:09 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 44773103F;
	Thu, 27 Aug 2026 20:33:02 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:08 +0800
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
Subject: [RFC PATCH v2 03/23] sched/topology: Introduce a macro to traverse node
Date: Thu, 27 Aug 2026 20:27:56 +0800
Message-ID: <20260827122816.756234-4-wujianyong@hygon.cn>
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

Add a node traversal macro that leverages the refined node distance matrix
introduced in the prior patch.

For a given target CPU, the macro walks NUMA nodes sorted by ascending
distance entries taken from the matching row of the refined distance matrix.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/sched.h    |  16 ++++++
 kernel/sched/topology.c | 117 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 56acf502ba26..88b71e0f5ef0 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4108,6 +4108,22 @@ static inline bool sched_cache_enabled(void)
 
 extern void sched_cache_active_set(void);
 
+extern int sched_node_order_count(int cpu);
+extern int sched_node_order_at(int cpu, int idx);
+
+/*
+ * Walk every NUMA node in the system starting from @cpu's own node,
+ * nearest-first by the de-duplicated sched_cache_node_distance()
+ * matrix (topology.c), until every node has been yielded. @node
+ * receives the node id at each step (index 0 is always @cpu's own
+ * node).
+ */
+#define for_each_sched_node(cpu, node)					\
+	for (int __sn_idx = 0, __sn_nr = sched_node_order_count((cpu)); \
+	     __sn_idx < __sn_nr &&					\
+	     ((node) = sched_node_order_at((cpu), __sn_idx)) >= 0;	\
+	     __sn_idx++)
+
 #endif
 
 void sched_domains_free_llc_id(int cpu);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 4c68dfe86019..166ff4e65a99 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -701,6 +701,7 @@ static void rebuild_llc_node_map(int size);
 static int __rcu *sched_cache_node_dist_matrix;
 static int sched_cache_node_dist_size;
 static void rebuild_node_distance_matrix(int size);
+static void rebuild_node_order(int size);
 #endif
 
 static void update_top_cache_domain(int cpu)
@@ -1147,6 +1148,121 @@ static void rebuild_node_distance_matrix(int size)
 	kfree(matrix);
 }
 
+struct sched_node_order_topology {
+	int nr_node;
+	int *order;
+};
+
+static struct sched_node_order_topology __rcu *sched_node_order_topo;
+
+static void free_node_order_topology(struct sched_node_order_topology *topo)
+{
+	if (!topo)
+		return;
+	kfree(topo->order);
+	kfree(topo);
+}
+
+/*
+ * Generic {distance, id} sort key: candidates are ranked by @dist, with
+ * @id as a deterministic tie-break when two candidates land on the same
+ * @dist.
+ */
+struct dist_key {
+	int dist;
+	int id;
+};
+
+static int dist_key_cmp(const void *a, const void *b)
+{
+	const struct dist_key *ka = a, *kb = b;
+
+	if (ka->dist != kb->dist)
+		return ka->dist - kb->dist;
+	return ka->id - kb->id;
+}
+
+static void rebuild_node_order(int size)
+{
+	struct sched_node_order_topology *topo, *old;
+	struct dist_key *cand;
+	int root, i, k;
+
+	if (size <= 0)
+		return;
+
+	topo = kzalloc_obj(*topo);
+	if (!topo)
+		return;
+
+	topo->nr_node = size;
+	topo->order = kmalloc_array((size_t)size * size, sizeof(int), GFP_KERNEL);
+	cand = kmalloc_array(size, sizeof(*cand), GFP_KERNEL);
+	if (!topo->order || !cand) {
+		kfree(cand);
+		free_node_order_topology(topo);
+		return;
+	}
+
+	for (root = 0; root < size; root++) {
+		for (i = 0; i < size; i++) {
+			cand[i].id = i;
+			cand[i].dist = sched_cache_node_distance(root, i);
+		}
+
+		/* sched_cache_node_distance() guarantees no ties within a row. */
+		sort(cand, size, sizeof(*cand), dist_key_cmp, NULL);
+
+		for (k = 0; k < size; k++)
+			topo->order[root * size + k] = cand[k].id;
+	}
+	kfree(cand);
+
+	old = rcu_dereference_protected(sched_node_order_topo,
+					lockdep_is_held(&sched_domains_mutex));
+	rcu_assign_pointer(sched_node_order_topo, topo);
+	synchronize_rcu();
+	free_node_order_topology(old);
+}
+
+/*
+ * Return the total number of steps in @cpu's for_each_sched_node() walk,
+ * i.e. the number of nodes in the system. 1 if the topology cache isn't
+ * populated yet (e.g. very early boot).
+ */
+int sched_node_order_count(int cpu)
+{
+	struct sched_node_order_topology *topo = rcu_dereference_all(sched_node_order_topo);
+	int root = cpu_to_node(cpu);
+
+	if (root < 0)
+		return 0;
+	if (!topo || root >= topo->nr_node)
+		return 1;
+
+	return topo->nr_node;
+}
+
+/*
+ * Return the node id at position @idx (0-indexed, 0 == @cpu's own node)
+ * in @cpu's node's ascending sched_cache_node_distance() order. -1 if
+ * @idx is out of range, which ends the for_each_sched_node() walk.
+ */
+int sched_node_order_at(int cpu, int idx)
+{
+	struct sched_node_order_topology *topo = rcu_dereference_all(sched_node_order_topo);
+	int root = cpu_to_node(cpu);
+
+	if (root < 0)
+		return -1;
+	if (!topo || root >= topo->nr_node)
+		return idx == 0 ? root : -1;
+	if (idx < 0 || idx >= topo->nr_node)
+		return -1;
+
+	return topo->order[root * topo->nr_node + idx];
+}
+
 /*
  * Get the effective LLC size in bytes that @cpu's bottom sched_domain
  * can use. A CPU within a cpuset partition can only use a proportion
@@ -1218,6 +1334,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 
 	rebuild_llc_node_map(max_lid + 1);
 	rebuild_node_distance_matrix(nr_node_ids);
+	rebuild_node_order(nr_node_ids);
 	return true;
 err:
 	for_each_cpu(i, cpu_map) {
-- 
2.34.1


