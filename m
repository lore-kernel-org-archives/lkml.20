Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241115;
	b=nvUXo5Ni0y8Y200iuLEbl6t92WgK8x1yiJkV1BNIDLPOIE6HQOjbOCFNr62HIPRYE6Y8
	 fpyxXCwUKe//KfL4JSDVLcQi5Z+ykQT9ICXbIRzzzGKl0gL4B4bsZPVGzUvWBwrybj+Sq
	 44DXHV9MZeZqfNE8S4n8LhX9WPVGmnfRycO7CxsFdkV38tKUnZb/lbENSJ71oRYpwrIN5
	 urKUG6GjBHjRiFLF1Y7NWjDdsUw6Qf4UGaZMs6dLccj73/EN/MCiI4Oxqrg7yA6xoV3G4
	 pNkCWcnzE0Dk92ok4D1d6j/ZUFv1HIM6Gr8bdbu+L5KUkXDEF5MXbXA13EggZqR5MVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241115;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9aFJa4+KMeIO4WO/6NZChZxQ865vWWG8sAysXFnliLk=;
	b=ctcmKJ18Dgbla3HHy4pBDBjX1+/kN8ZxaI3yPqstG90EKdILDjoRC9yksd+jBDCs0XLG
	 x6wvOVXPXC88UdDsPfnf8V53xLCxhXol63rTrrZLh5z9hmK78E6rGgPR1v23GDaysXuB0
	 lxf0N182oLhhuKg0/1yLoWpvk3jCCLucefqVkbt0dMRDhWSFerxzRyNL9UvnjRkGsEmHo
	 Z5LfLEpfuUq/fCnxcPjWucC2y8cy52vcJkGMxLEv9yI8icBUIYm0D07BJ4YL/SXKtgyfo
	 7d1KQ+TudK0kg/yvA0zBLRZAyUSuHuDzOMZ/cw8/vSjc1AhtwN+IVYHm90JL2Ov8igA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE2D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE2D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSsq05ztzw0FT;
	Thu, 29 Oct 2026 10:31:43 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSsm6h0Yz171YM;
	Thu, 29 Oct 2026 10:31:40 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 1929F5943;
	Thu, 29 Oct 2026 10:31:33 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:31:38 +0800
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
Subject: [RFC PATCH v3 08/17] sched/cache: Introduce helpers for task migration decisions
Date: Thu, 29 Oct 2026 10:20:26 +0800
Message-ID: <20261029022036.4002331-9-wujianyong@hygon.cn>
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

Cache-aware aggregation must accommodate workloads that need more than
one LLC. Use the node and intra-node LLC affinity sequences established
by earlier patches to distinguish moves toward the preferred region
from moves away from it, and consult utilization to permit expansion.

Add get_node_stats() to accumulate a node's utilization, capacity and LLC
count without allocating memory in the load balance path.

Extend fits_llc_capacity() to support both <= and < comparisons against
the aggregation threshold. Reaching the threshold after arrival is
allowed; departure checks reject a move if the remaining utilization
falls below the threshold.

For moves toward the preferred region, permit a move if the destination
LLC fits the task, or if the source is noticeably busier and remains no
lighter than the destination after the move.

For moves away, walk the cached affinity sequence from the source node
to the destination. Within one node, leave the source LLC at or above
the threshold, and permit moves that reduce LLC imbalance without
reversing the source and destination utilization ordering.

Across nodes, require the source node to remain at or above the
threshold after departure. An intervening node vetoes expansion if its
aggregate utilization still fits after charging one task per LLC, or
per pair of LLCs when its raw distance to the cache-preferred node is
less than the destination's. This estimates average LLC headroom rather
than guaranteeing room in an individual LLC.

At the destination, permit a fitting or balancing move; otherwise leave
the decision to generic load balancing. Nodes preceding the source or
following the destination do not participate in the decision.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 185 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 180 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index fe357d79b6e0..4eb7cede9080 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10478,7 +10478,7 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
  *
  * (default: ~50%, tunable via debugfs)
  */
-static bool fits_llc_capacity(unsigned long util, unsigned long max)
+static bool fits_llc_capacity(unsigned long util, unsigned long max, bool inclusive)
 {
 	u32 aggr_pct = llc_overaggr_pct;
 
@@ -10489,6 +10489,9 @@ static bool fits_llc_capacity(unsigned long util, unsigned long max)
 	if (cpu_smt_num_threads == 1)
 		aggr_pct = (aggr_pct * 3 / 2);
 
+	if (inclusive)
+		return util * 100 <= max * aggr_pct;
+
 	return util * 100 < max * aggr_pct;
 }
 
@@ -10592,8 +10595,8 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 	src_util = src_util < tsk_util ? 0 : src_util - tsk_util;
 	dst_util = dst_util + tsk_util;
 
-	if (!fits_llc_capacity(dst_util, dst_cap) &&
-	    !fits_llc_capacity(src_util, src_cap))
+	if (!fits_llc_capacity(dst_util, dst_cap, false) &&
+	    !fits_llc_capacity(src_util, src_cap, false))
 		return mig_unrestricted;
 
 	if (to_pref) {
@@ -10603,7 +10606,7 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 		 * than the src, in which case migration will
 		 * increase the imbalance too much.
 		 */
-		if (!fits_llc_capacity(dst_util, dst_cap) &&
+		if (!fits_llc_capacity(dst_util, dst_cap, false) &&
 		    util_greater(dst_util, src_util))
 			return mig_forbid;
 	} else {
@@ -10614,13 +10617,185 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 		 * of preferred LLC, leading to migration again
 		 * back to preferred LLC.
 		 */
-		if (fits_llc_capacity(src_util, src_cap) ||
+		if (fits_llc_capacity(src_util, src_cap, false) ||
 		    !util_greater(src_util, dst_util))
 			return mig_forbid;
 	}
 	return mig_llc;
 }
 
+/* Accumulate a NUMA node's utilization and capacity at LLC granularity. */
+static bool get_node_stats(int node, unsigned long *util_out,
+			   unsigned long *cap_out, int *nr_llcs)
+{
+	unsigned long util = 0, cap = 0;
+	const struct cpumask *span;
+	int nr = 0;
+
+	if (!util_out || !cap_out || !nr_llcs)
+		return false;
+
+	for_each_llc_node_span(node, span) {
+		unsigned long util_tmp, cap_tmp;
+
+		if (!get_llc_stats(cpumask_first(span), &util_tmp, &cap_tmp))
+			return false;
+
+		util += util_tmp;
+		cap += cap_tmp;
+		nr++;
+	}
+
+	*util_out = util;
+	*cap_out = cap;
+	*nr_llcs = nr;
+
+	return true;
+}
+
+static enum llc_mig __maybe_unused can_migrate_llcs(int src_cpu, int dst_cpu,
+				     struct task_struct *p, bool to_pref)
+{
+	unsigned long src_util, src_pre, src_cap, dst_util, dst_cap, dst_pre;
+	int target_node, src_node, dst_node, dst_distance;
+	int node, target_cpu = src_cpu, n_llc;
+	unsigned long tsk_util = 0;
+	bool got_src = false;
+
+	if (!get_llc_stats(src_cpu, &src_util, &src_cap) ||
+	    !get_llc_stats(dst_cpu, &dst_util, &dst_cap))
+		return mig_unrestricted;
+
+	if (p) {
+		struct mm_struct *mm = p->mm;
+
+		if (mm)
+			target_cpu = READ_ONCE(mm->sc_stat.cpu);
+		target_cpu = target_cpu >= 0 ? target_cpu : src_cpu;
+
+		tsk_util = task_util(p);
+	}
+
+	/* Utilization of the destination LLC before the task moves in. */
+	dst_pre = dst_util;
+	src_pre = src_util;
+	src_util = src_util < tsk_util ? 0 : src_util - tsk_util;
+	dst_util = dst_util + tsk_util;
+
+	if (to_pref) {
+		if (fits_llc_capacity(dst_util, dst_cap, true))
+			return mig_llc;
+
+		if (util_greater(src_pre, dst_pre) &&
+		    src_util >= dst_util)
+			return mig_llc;
+
+		return mig_forbid;
+	}
+
+	src_node = cpu_to_node(src_cpu);
+	dst_node = cpu_to_node(dst_cpu);
+	target_node = cpu_to_node(target_cpu);
+	dst_distance = node_distance(target_node, dst_node);
+
+	/*
+	 * For moves away from the cache preferred node, examine the source,
+	 * intervening nodes and destination in the cached affinity order.
+	 */
+	for_each_affi_node(target_cpu, node) {
+		unsigned long nu = 0, nc = 0;
+
+		if (!got_src) {
+			if (node != src_node)
+				continue;
+			got_src = true;
+
+			if (src_node == dst_node) {
+				/* Leave the source LLC at or above the threshold. */
+				if (fits_llc_capacity(src_util, src_cap, false))
+					return mig_forbid;
+
+				if (util_greater(src_pre, dst_pre) &&
+				    src_util >= dst_util)
+					return mig_llc;
+
+				/* Nodes beyond the destination cannot veto this move. */
+				break;
+			}
+
+			/* Cross-node moves must leave the source node filled. */
+			if (get_node_stats(src_node, &nu, &nc, &n_llc) && n_llc) {
+				nu = nu < tsk_util ? 0 : nu - tsk_util;
+				if (fits_llc_capacity(nu, nc, false))
+					return mig_forbid;
+			}
+			continue;
+		}
+
+		if (node != dst_node) {
+			if (!get_node_stats(node, &nu, &nc, &n_llc) || !n_llc)
+				continue;
+
+			/*
+			 * Estimate average LLC headroom in intervening nodes.
+			 * Charge one task per LLC, or per pair of LLCs when
+			 * this node is closer to the target than the destination.
+			 */
+			if (node_distance(target_node, node) < dst_distance)
+				nu += DIV_ROUND_UP(n_llc, 2) * tsk_util;
+			else
+				nu += n_llc * tsk_util;
+
+			if (fits_llc_capacity(nu, nc, true))
+				return mig_forbid;
+			continue;
+		}
+
+		if (fits_llc_capacity(dst_util, dst_cap, true))
+			return mig_llc;
+
+		if (util_greater(src_pre, dst_pre) && src_util >= dst_util)
+			return mig_llc;
+
+		break;
+	}
+
+	return mig_unrestricted;
+}
+
+/* Decide whether the destination precedes the source in the affinity order. */
+static bool __maybe_unused if_to_prefer(int src_cpu, int dst_cpu, int pref_llc)
+{
+	int src_rank, dst_rank, src_node, dst_node, pref_node;
+
+	if (pref_llc < 0)
+		return false;
+
+	src_node = cpu_to_node(src_cpu);
+	dst_node = cpu_to_node(dst_cpu);
+	pref_node = llc_to_node(pref_llc);
+	if (pref_node < 0)
+		return false;
+
+	if (src_node == dst_node) {
+		if (src_node == pref_node) {
+			src_rank = affi_llc_rank_of(pref_llc, llc_id(src_cpu),
+						 pref_node);
+			dst_rank = affi_llc_rank_of(pref_llc, llc_id(dst_cpu),
+						 pref_node);
+			if (src_rank < 0 || dst_rank < 0)
+				return false;
+			return src_rank > dst_rank;
+		}
+		/* Outside the cache preferred node, use ascending LLC IDs. */
+		return llc_id(src_cpu) > llc_id(dst_cpu);
+	}
+
+	src_rank = affi_node_rank_of(pref_node, src_node);
+	dst_rank = affi_node_rank_of(pref_node, dst_node);
+	return src_rank >= 0 && dst_rank >= 0 && src_rank > dst_rank;
+}
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
-- 
2.34.1


