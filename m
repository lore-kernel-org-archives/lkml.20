Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16CE22A7F6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834018; cv=none; b=AkKIopqU7un6AHPgyUG3FTdUXlzctepxCmCbDSMSVxyed2czxLkdDO2P6D2hhuOZWWlnvwmxVLYCBLXx9YJYguekilyGvpJ9+ruUGN9KP8VbmOV1z+f4KqYHAr6Ac2tdIuZkRiBBQ259tKajxDu9OhBi3twdYODEsa91R8ebpVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834018; c=relaxed/simple;
	bh=VtHDZHyAh/8z+uELiq1yDMBPgqNw2Mx46VDt9QoyJEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svXbohTx8gDDZwOtPEBU/05nP2O88BzPJDGKB+8h4OX4h2Z8iwlv8g6FPEMvPeQq/7jRfRZtQtvJzWNcPMp9wRhjqGMiSuHUI9cmTD1xQatPB3ap536H/1bFiNnj5nosl95rGeHtCU9CX0QcK3GQfXRU220isTnPZrD8CHhiiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bx0W8wzBJb6S;
	Thu, 27 Aug 2026 20:33:13 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bw08t5zBJb63;
	Thu, 27 Aug 2026 20:33:12 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id CAC1E36F1F84;
	Thu, 27 Aug 2026 20:29:29 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:10 +0800
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
Subject: [RFC PATCH v2 04/23] sched/topology: Introduce a method to calculate the llc distance
Date: Thu, 27 Aug 2026 20:27:57 +0800
Message-ID: <20260827122816.756234-5-wujianyong@hygon.cn>
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

The previous patch addresses NUMA inter-node distance handling. This
patch shifts focus to the LLC layer and introduces a scheme to compute
pairwise distances between sibling LLCs inside one NUMA node.
The calculation only guarantees distinct distance values for all peers
when viewed from a single reference LLC; it does not enforce globally
unique distances for every arbitrary LLC pair on the node.

One valid calculation scheme is defined by the formula below:

  dist(LLC1, LLC2) = (rank1 + rank2) % k + 1

Constraints: LLC1 and LLC2 must reside on the identical NUMA node.
rank1 = local index of LLC1 within its node; rank2 follows the same rule.
k = total count of LLCs available on the node.

The formula never yields zero, so diagonal self-distance entries are
explicitly hardcoded to 0.

For demonstration, consider a NUMA node with four LLCs (local ranks 0~3):
        LLC0    LLC1    LLC2    LLC3
LLC0    0       2       3       4
LLC1    2       0       4       1
LLC2    3       4       0       2
LLC3    4       1       2       0

Sorting each matrix row in ascending order generates a unique LLC affinity
sequence, which drives thread migration policies implemented in follow-up
patches.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/topology.h |  1 +
 kernel/sched/topology.c  | 99 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/include/linux/topology.h b/include/linux/topology.h
index e01bc9ae6209..fe20ee9dc153 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -180,6 +180,7 @@ static inline int cpu_to_mem(int cpu)
 #ifdef CONFIG_SCHED_CACHE
 int llc_to_node(int llc);
 int sched_cache_node_distance(int node0, int node1);
+int llc_intra_node_distance(int llc1, int llc2, int node);
 #endif
 
 #if defined(topology_die_id) && defined(topology_die_cpumask)
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 166ff4e65a99..a47ed44f7b1f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -702,6 +702,21 @@ static int __rcu *sched_cache_node_dist_matrix;
 static int sched_cache_node_dist_size;
 static void rebuild_node_distance_matrix(int size);
 static void rebuild_node_order(int size);
+
+/*
+ * Per-LLC rank within its own node (0-based) plus each node's LLC
+ * count, used by llc_intra_node_distance() to derive a same-node LLC
+ * distance.
+ */
+struct llc_local_rank_topology {
+	int nr_llc;
+	int nr_node;
+	int *rank;		/* [nr_llc]: LLC's 0-based rank within its node */
+	int *node_count;	/* [nr_node]: number of LLCs in the node */
+};
+
+static struct llc_local_rank_topology __rcu *llc_local_rank_topo;
+static void rebuild_llc_local_rank(int size);
 #endif
 
 static void update_top_cache_domain(int cpu)
@@ -921,6 +936,39 @@ int sched_cache_node_distance(int node0, int node1)
 	return node_distance(node0, node1);
 }
 
+/*
+ * LLC distance restricted to same-node pairs, derived from each LLC's
+ * rank within its node (llc_local_rank_topo)
+ * dist = (rank1 + rank2) % k + 1, where k is the LLC count of
+ * the shared node. Except that @llc1 equals @llc2, the distance is 0.
+ * This formuler ensure that there is no identical distance between a
+ * certain llc with any of its sibling llcs in the same node.
+ *
+ * NOTE: It's the caller's responsibility to check if llc1 and llc2 are
+ * in the same node.
+ */
+int llc_intra_node_distance(int llc1, int llc2, int node)
+{
+	struct llc_local_rank_topology *topo;
+	int rank1, rank2, k;
+
+	if (llc1 == llc2)
+		return 0;
+
+	rcu_read_lock();
+	topo = rcu_dereference(llc_local_rank_topo);
+	if (!topo || llc1 >= topo->nr_llc || llc2 >= topo->nr_llc || node < 0) {
+		rcu_read_unlock();
+		return -1;
+	}
+	rank1 = topo->rank[llc1];
+	rank2 = topo->rank[llc2];
+	k = topo->node_count[node];
+	rcu_read_unlock();
+
+	return (rank1 + rank2) % k + 1;
+}
+
 static void rebuild_llc_node_map(int size)
 {
 	int *new_map, *old_map;
@@ -1263,6 +1311,56 @@ int sched_node_order_at(int cpu, int idx)
 	return topo->order[root * topo->nr_node + idx];
 }
 
+static void free_llc_local_rank_topology(struct llc_local_rank_topology *topo)
+{
+	if (!topo)
+		return;
+
+	kfree(topo->rank);
+	kfree(topo->node_count);
+	kfree(topo);
+}
+
+/*
+ * Compute each LLC's rank within its own node (ascending llc id) and
+ * each node's LLC count, consumed by llc_intra_node_distance() to
+ * derive a same-node LLC distance on the fly.
+ */
+static void rebuild_llc_local_rank(int size)
+{
+	struct llc_local_rank_topology *topo, *old;
+	int llc, node;
+
+	if (size <= 0)
+		return;
+
+	topo = kzalloc_obj(*topo);
+	if (!topo)
+		return;
+
+	topo->nr_llc = size;
+	topo->nr_node = nr_node_ids;
+	topo->rank = kcalloc(size, sizeof(int), GFP_KERNEL);
+	topo->node_count = kcalloc(nr_node_ids, sizeof(int), GFP_KERNEL);
+	if (!topo->rank || !topo->node_count) {
+		free_llc_local_rank_topology(topo);
+		return;
+	}
+
+	for (llc = 0; llc < size; llc++) {
+		node = llc_to_node(llc);
+		if (node < 0 || node >= nr_node_ids)
+			continue;
+		topo->rank[llc] = topo->node_count[node]++;
+	}
+
+	old = rcu_dereference_protected(llc_local_rank_topo,
+					 lockdep_is_held(&sched_domains_mutex));
+	rcu_assign_pointer(llc_local_rank_topo, topo);
+	synchronize_rcu();
+	free_llc_local_rank_topology(old);
+}
+
 /*
  * Get the effective LLC size in bytes that @cpu's bottom sched_domain
  * can use. A CPU within a cpuset partition can only use a proportion
@@ -1335,6 +1433,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 	rebuild_llc_node_map(max_lid + 1);
 	rebuild_node_distance_matrix(nr_node_ids);
 	rebuild_node_order(nr_node_ids);
+	rebuild_llc_local_rank(max_lid + 1);
 	return true;
 err:
 	for_each_cpu(i, cpu_map) {
-- 
2.34.1


