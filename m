Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3FC26FA60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=uGSfuYOeZqZUp0e45+T+B87N3fRgu2Y5H5FVNoZe2qxGDgRLywCtmtPAOFG0IijwrGpUNRgemHJ5BrIfe0oYZ06dUN+8SPdljistqQAxYQ4YNaM4igbMcCTUVGbLXU1aq7IGmiQF/lzqSk2D7D1uPW58hni9Or4nh+eUCuUffcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=eiDAiYashQdrTP60YC25FlxyJYl/HYAj5FWewh6K5zE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+3o4udHALVd9ifL7u/DAYDGua+I11308heAzrcWDFP7BqdL1wd0bB0fWsxvpIvUlQqt4lblNFip5EHmeNl6F7hpkxybTmoNlRskHrMPSDUoo4OU4xiWOznRgBd8b5bEifVpfH3+j1Kt6SF8G3NUWEY66V32yIh/jqDQgvQGGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CL0WlCzBJb6q;
	Thu, 27 Aug 2026 20:33:34 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CK57yVzBJb6c;
	Thu, 27 Aug 2026 20:33:33 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 7DE4436F1F84;
	Thu, 27 Aug 2026 20:29:51 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:32 +0800
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
Subject: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain calculation
Date: Thu, 27 Aug 2026 20:28:05 +0800
Message-ID: <20260827122816.756234-13-wujianyong@hygon.cn>
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

The cache-aware scheduler's current source runqueue selection logic
only matches a task's preferred LLC against the destination LLC.
This misses many migration opportunities that deliver improved NUMA
affinity even when preferred LLCs do not align.

As an illustrative example: source CPUs reside on NODE0, destination
CPUs on NODE1. A task on the source runqueue has its preferred LLC
located on NODE2. If the NUMA distance NODE0<->NODE2 is 20, and
NODE1<->NODE2 is 15, migrating this task reduces remote memory latency.
The existing policy cannot capture this beneficial case.

To fix this gap, implement a new scoring algorithm to quantify total
affinity promotion for a source runqueue given source and destination
LLCs. The algorithm operates in two distinct phases:

Iterate all system nodes, for the NUMA-level domain load balance, or
intra-node LLCs, for NODE-level domain load balance, and filter those that
yield improved affinity.
Take NUMA-level domain as an example. If tasks bound to NUMAi migrate from
the source CPU to destination CPU. Compute the distance delta Di for each
NUMAi, via:

  Di = node_distance(src_node, NUMAi) - node_distance(dst_node, NUMAi)

Aggregate total affinity promotion score for the candidate runqueue
by summing weighted contributions from all resident tasks. Per-task
weight and total score are calculated as follows:

  W_i = Rt_i * Di
  p = sum_i(W_i)

Here p is the total affinity gain of the runqueue; Rt_i denotes the
count of tasks on the runqueue with NUMAi as their preferred node,
tracked via rq->sd->node_count.

By this way, we can select the right src sched group or the src rq in load
balance.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 169 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfbd596992ab..505a1ea9537f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11920,6 +11920,7 @@ sched_reduced_capacity(struct rq *rq, struct sched_domain *sd)
 }
 
 #ifdef CONFIG_SCHED_CACHE
+extern int max_lid;
 /*
  * Record the statistics for this scheduler group for later
  * use. These values guide load balancing on aggregating tasks
@@ -11998,6 +11999,174 @@ static bool update_llc_busiest(struct lb_env *env,
 	 */
 	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
 }
+
+/*
+ * Get all LLCs that are closer to the destination LLC than to the
+ * source LLC inside a NUMA.
+ */
+static int get_affi_llcs(struct sched_domain *sd, int src_llc, int dst_llc,
+			 int *affi_llcs, int *affi)
+{
+	int j = 0, src_dist, dst_dist, cur_node;
+
+	if (src_llc == dst_llc || sd->flags & (SD_NUMA | SD_SHARE_LLC))
+		return 0;
+
+	cur_node = llc_to_node(src_llc);
+	if (cur_node != llc_to_node(dst_llc))
+		return 0;
+
+	for (int i = 0; i <= max_lid; i++) {
+		if (cur_node == llc_to_node(i)) {
+			src_dist = llc_intra_node_distance(src_llc, i, cur_node);
+			dst_dist = llc_intra_node_distance(dst_llc, i, cur_node);
+			if (src_dist < 0 || dst_dist < 0)
+				continue;
+			if (src_dist > dst_dist) {
+				affi[j] = clamp(src_dist - dst_dist, 1, 1024);
+				affi_llcs[j++] = i;
+			}
+		} else {
+			/*
+			 * Assume the distance between LLCm on nodeA and LLCn on nodeB follows:
+			 * llc_dist(LLCm, LLCn) = node_dist(nodeA, nodeB) + m + n,
+			 * where m and n represent the intra-node index of LLCm and LLCn
+			 * within their respective nodes. Under this definition, we derive:
+			 * llc_dist(src_llc, i) - llc_dist(dst_llc, i) = src_llc - dst_llc
+			 */
+			if (src_llc > dst_llc) {
+				affi[j] = clamp(src_llc - dst_llc, 1, 1024);
+				affi_llcs[j++] = i;
+			}
+		}
+	}
+
+	return j;
+}
+
+static int get_affi_numas(int src_node, int dst_node, int *affi_nodes, int *affi)
+{
+	int j = 0, src_dist, dst_dist, node;
+
+	for_each_node(node) {
+		src_dist = sched_cache_node_distance(src_node, node);
+		dst_dist = sched_cache_node_distance(dst_node, node);
+		if (src_dist < 0 || dst_dist < 0)
+			continue;
+
+		if (src_dist > dst_dist) {
+			affi[j] = clamp(src_dist - dst_dist, 4, 1024);
+			affi_nodes[j++] = node;
+		}
+	}
+
+	return j;
+}
+
+static int calc_affinity_numa_score(struct sched_domain *sd, int src_cpu, int dst_cpu,
+			int *affi_node, int *affi, int *last_node, int *num)
+{
+	int src_node, dst_node, score = 0;
+
+	src_node = cpu_to_node(src_cpu);
+	dst_node = cpu_to_node(dst_cpu);
+	if (src_node != *last_node) {
+		*last_node = src_node;
+		memset(affi_node, 0, (max_lid + 1) * sizeof(int));
+		memset(affi, 0, (max_lid + 1) * sizeof(int));
+		*num = get_affi_numas(src_node, dst_node, affi_node, affi);
+	}
+
+	for (int i = 0; i < *num; i++) {
+		if ((unsigned int)affi_node[i] < nr_node_ids)
+			score += sd->numa_counts[affi_node[i]] * affi[i];
+	}
+
+	return score;
+}
+
+static int calc_affinity_llc_score(struct sched_domain *sd_cur, struct sched_domain *sd,
+			int src_cpu, int dst_cpu, int *affi_llc,
+			int *affi, int *last_llc, int *num)
+{
+	int src_llc, dst_llc, score = 0;
+
+	src_llc = llc_id(src_cpu);
+	dst_llc = llc_id(dst_cpu);
+
+	if (src_llc != *last_llc) {
+		*last_llc = src_llc;
+		memset(affi_llc, 0, (max_lid + 1) * sizeof(int));
+		memset(affi, 0, (max_lid + 1) * sizeof(int));
+		*num = get_affi_llcs(sd_cur, src_llc, dst_llc, affi_llc, affi);
+	}
+
+	for (int i = 0; i < *num; i++) {
+		if ((unsigned int)affi_llc[i] < sd->llc_max)
+			score += sd->llc_counts[affi_llc[i]] * affi[i];
+	}
+
+	return score;
+}
+
+/*
+ * Scratch arrays used while scoring rqs during load balancing. They live on
+ * the bottom sched_domain of the CPU running the balance, so they share the
+ * sched_domain lifetime and need neither a separate allocation nor any RCU
+ * handling of their own. Load balancing runs with preemption disabled, so
+ * this_rq() stays stable for a whole pass, and two CPUs balancing at the same
+ * time each get their own arrays.
+ */
+static void lb_affi_scratch(int **ids, int **weights)
+{
+	struct sched_domain *sd = rcu_dereference(this_rq()->sd);
+
+	*ids = sd ? sd->affi_ids : NULL;
+	*weights = sd ? sd->affi_weights : NULL;
+}
+
+/*
+ * To locate a source sched group/rq during load balancing, we require
+ * a metric to evaluate the migration benefit of each rq. For cache-aware
+ * scheduling, the primary optimization target is affinity improvement.
+ *
+ * This implementation quantifies affinity gains for candidate rqs by
+ * computing an affinity score for each rq.
+ *
+ * The score is calculated given source LLC/node and destination LLC/node,
+ * under two distinct scenarios: NUMA-domain load balance and NODE-domain
+ * load balance. For NUMA-level balancing, affinity gain is accounted at
+ * NUMA granularity; for node-level balancing, evaluation proceeds at LLC
+ * granularity.
+ *
+ * Taking NUMA-level balancing as an example, the score is computed as:
+ * Di = node_distance(src_node, NUMAi) - node_distance(dst_node, NUMAi)   (1)
+ * Wi = Rt_i * Di                                                       (2)
+ * p  = sum_i Wi                                                        (3)
+ *
+ * Where:
+ * i        Index of a remote NUMA node
+ * Di       Affinity gain, derived from the difference between node
+ *          distance from source to NUMAi and distance from destination
+ *          to NUMAi
+ * Rt_i     Count of tasks on this rq whose preferred NUMA is NUMAi,
+ *          retrieved via rq->sd->node_count
+ */
+static int cal_affinity_score(struct sched_domain *sd, struct rq *rq, int src_cpu, int dst_cpu,
+			int *affi_nodes, int *affi, int *last_node, int *num)
+{
+	struct sched_domain *sd_tmp = rcu_dereference(rq->sd);
+
+	if (!affi_nodes || !affi || !last_node || !num || !sd || !sd_tmp)
+		return 0;
+
+	if (sd->flags & SD_NUMA)
+		return calc_affinity_numa_score(sd_tmp, src_cpu, dst_cpu, affi_nodes,
+						affi, last_node, num);
+
+	return calc_affinity_llc_score(sd, sd_tmp, src_cpu, dst_cpu, affi_nodes,
+				       affi, last_node, num);
+}
 #else
 static inline void record_sg_llc_stats(struct lb_env *env, struct sg_lb_stats *sgs,
 				       struct sched_group *group)
-- 
2.34.1


