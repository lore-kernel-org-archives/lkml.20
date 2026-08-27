Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543E223E342
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=N5tU6ppuOFLnkQDrnlshwl+N+CCzdlNnx2leRFC2gUnX9lM+18EwxATCM3O+eZktd+vKnTEGIDz95m+h47mxUuIOR/zXI77AWnQ1YBDcwBYuacOVqhviWeJ96JYYNqr8vxyr4vODshgdnFyWv/cQrk/WFNj7sEzNTW/Lu5dy4jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=HPyagUsnYpBzyY8QOscCyOaZtN63tOtXFs2+azNFKGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWqIuWSqCQ58mFqqLtR7syowZwOgNbj4q0BhQ/dxD0888C1FrRJCn6mP1zEtCfcX2up/8aWyGUirj2nTToKjbVRo78Ld6DUlZrtBAJIuTuRffYZh/s7z7UDEnxQVR6bJzPVnUnrY6ZGahwFwlTK0vuLjgzJhVXP8kaHqXcrdgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CL0WpZzBJb6r;
	Thu, 27 Aug 2026 20:33:34 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CH2D2CzBJb6r;
	Thu, 27 Aug 2026 20:33:31 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id D53FA78AD;
	Thu, 27 Aug 2026 20:33:23 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:29 +0800
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
Subject: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task migration decisions
Date: Thu, 27 Aug 2026 20:28:04 +0800
Message-ID: <20260827122816.756234-12-wujianyong@hygon.cn>
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

Cache-aware scheduling makes migration decisions purely based on LLC
affinity, allowing moves only toward a task's preferred LLC. This rigid
policy cannot handle workloads that do not fit within a single LLC.
A better approach is on-demand thread aggregation across LLCs: as the
thread count increases, additional LLCs are recruited to host threads,
enabling workload scaling at LLC granularity.

To realize this behaviour, we need to pick the next eligible LLC once
currently selected LLCs become saturated.

Earlier patches have built node-level and LLC-level distance matrices.
From these matrices we obtain a node-affinity sequence, and within each
node an intra-node LLC-affinity sequence. These sequences provide the
priority order used to pick subsequent LLC candidates.

This patch adds a helper routine to determine whether task migration
is permitted. It checks whether the destination CPU resides within the
first eligible LLC. Migration is permitted if this condition holds,
and vice versa.

The first eligible LLC is resolved via a two-stage policy. The first
stage operates at NUMA-node granularity: we iterate over the
node-affinity sequence to find the first node that can accommodate
the task. Once such a node is found, the second stage selects the
first capacity-available LLC within this node by walking the
intra-node LLC-affinity sequence.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 185 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index dc7bbdb1ab98..cfbd596992ab 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10610,6 +10610,191 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 	return mig_llc;
 }
 
+/*
+ * Like get_llc_stats but for sched domain that above LLC level.
+ * Based on get_llc_stats, we can accumulate utilization and cap for
+ * sched domain in the granularity of LLC.
+ */
+static bool get_span_stats(const struct cpumask *span, unsigned long *util_out,
+					unsigned long *cap_out)
+{
+	cpumask_var_t mask;
+	int cpu;
+	unsigned long util_tmp, cap_tmp, util = 0, cap = 0;
+	struct sched_domain *sd_tmp;
+
+	if (!span || !util_out || !cap_out)
+		return false;
+
+	if (!alloc_cpumask_var(&mask, GFP_ATOMIC))
+		return false;
+
+	cpumask_copy(mask, span);
+	for_each_cpu(cpu, mask) {
+		if (!get_llc_stats(cpu, &util_tmp, &cap_tmp)) {
+			free_cpumask_var(mask);
+			return false;
+		}
+
+		sd_tmp = rcu_dereference(per_cpu(sd_llc, cpu));
+		cpumask_andnot(mask, mask, sched_domain_span(sd_tmp));
+		util += util_tmp;
+		cap += cap_tmp;
+	}
+
+	*util_out = util;
+	*cap_out = cap;
+
+	free_cpumask_var(mask);
+	return true;
+}
+
+/*
+ * Decide if migration should happen on a specific node.
+ * The node here is an LLC or a NUMA.
+ */
+static enum llc_mig __maybe_unused can_migrate_node(int src_cpu, int dst_cpu,
+			struct task_struct *p, bool to_pref)
+{
+	const struct cpumask *span;
+	struct mm_struct *mm;
+	unsigned long dst_util, dst_cap, tsk_util = 0;
+	unsigned long src_util = 0, src_cap = 0;
+	unsigned long acc_util = 0, acc_cap = 0;
+	int node, target_cpu = src_cpu;
+	int get_src = 0;
+
+	if (!get_llc_stats(dst_cpu, &dst_util, &dst_cap))
+		return mig_unrestricted;
+
+	if (!get_llc_stats(src_cpu, &src_util, &src_cap))
+		src_cap = 0;
+
+	if (p) {
+		mm = p->mm;
+		if (mm) {
+			if (mm->sc_stat.cpu >= 0)
+				target_cpu = mm->sc_stat.cpu;
+		}
+		tsk_util = task_util(p);
+	}
+
+	dst_util = dst_util + tsk_util;
+
+	if (to_pref) {
+		unsigned long dst_pre = dst_util - tsk_util;
+
+		if (fits_llc_capacity(dst_util, dst_cap))
+			return mig_llc;
+
+		/*
+		 * The destination is over the margin. That is a reason to
+		 * refuse a task while the margin can still be met, but not
+		 * while every LLC of the node is over it: no placement
+		 * satisfies the margin then, and refusing every migration
+		 * leaves the imbalance in place.
+		 *
+		 * Let the task through when the move still lowers the peak,
+		 * that is when the source is noticeably heavier than the
+		 * destination and carries at least two more tasks worth of
+		 * utilization. The second condition keeps the destination
+		 * from becoming the heavier side, which would bounce the
+		 * task straight back.
+		 */
+		if (src_cap && util_greater(src_util, dst_pre) &&
+		    src_util >= dst_pre + 2 * tsk_util)
+			return mig_llc;
+
+		return mig_forbid;
+	}
+
+	for_each_sched_node(target_cpu, node) {
+		unsigned long u = 0, c = 0, nu, nc;
+
+		/*
+		 * The walk starts at the anchor, so the nodes it crosses before
+		 * reaching the source say nothing about this migration: the task
+		 * does not live there and is not going there. Judging them only
+		 * lets an unrelated node with room refuse the move. Start at the
+		 * node the task actually sits on.
+		 */
+		if (!get_src) {
+			if (!cpumask_test_cpu(src_cpu, cpumask_of_node(node)))
+				continue;
+			else
+				get_src = 1;
+		}
+
+		if (cpumask_test_cpu(dst_cpu, cpumask_of_node(node))) {
+			nu = 0;
+			nc = 0;
+			for_each_llc_node_span(node, span) {
+				get_span_stats(span, &u, &c);
+				nu += u;
+				nc += c;
+				if (cpumask_test_cpu(dst_cpu, span)) {
+					if (fits_llc_capacity(u + tsk_util, c))
+						return mig_llc;
+
+					/*
+					 * The destination is over the margin,
+					 * but so may be the source. Refusing
+					 * then leaves the peak where it is:
+					 * a LLC at seven tasks stays at seven
+					 * while a neighbour in the same node
+					 * sits at four, because taking one
+					 * more would put that neighbour over
+					 * the margin as well.
+					 *
+					 * Let the task through when the move
+					 * still lowers the peak, guarded the
+					 * same way as the aggregation path:
+					 * the source must be noticeably
+					 * heavier and carry at least two more
+					 * tasks worth of utilization, so the
+					 * destination cannot end up the
+					 * heavier side and bounce it back.
+					 */
+					if (src_cap &&
+					    util_greater(src_util, u + tsk_util) &&
+					    src_util >= u + 2 * tsk_util)
+						return mig_llc;
+
+					return mig_forbid;
+				/*
+				 * A nearer LLC only justifies vetoing this
+				 * migration if the task would actually fit
+				 * there, so account for its utilization the
+				 * same way the destination branch above does.
+				 * Without it a LLC already holding one task
+				 * per core still reads as having room and
+				 * vetoes every migration towards a farther,
+				 * genuinely idle LLC.
+				 */
+				} else if (fits_llc_capacity(acc_util + nu + tsk_util,
+						acc_cap + nc)
+						&& fits_llc_capacity(u + tsk_util, c)
+						&& !util_greater(u, dst_pre))
+					return mig_forbid;
+			}
+		}
+
+		/* Don't migrate if this is a good place to live. */
+		for_each_llc_node_span(node, span) {
+			get_span_stats(span, &u, &c);
+			if (cpumask_test_cpu(src_cpu, span)) {
+				if (fits_llc_capacity(u, c))
+					return mig_forbid;
+			} else {
+				if (fits_llc_capacity(u + tsk_util, c))
+					return mig_forbid;
+			}
+		}
+	}
+
+	return mig_unrestricted;
+}
+
 /*
  * Check if task p can migrate from source LLC to
  * destination LLC in terms of cache aware load balance.
-- 
2.34.1


