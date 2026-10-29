Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241022;
	b=4kKCQsrdrawDNKpgh8CI8D5FK9lkP1xn6k6OppkjbZTt9T5BpdyRiIAGU8fqz1WQXrYn
	 5utdLWQcAyoeai2RgytVfzH03HIB3bwNfYHDnjYs/e2p6X0UnpfgafW+2PpeFMSugdd2q
	 iXE+XGWHR7tLdvtgdhS9mY/VUO1RLTeFeFXmmQip2Zeb4iyF9V1rTnH456bqxgxckplwV
	 YO77jU//KiFnDSiZppbQdrvgW/EHRVMVruj0tSA0NkwjmbiVGd66qn91M74ibRgw5VZ5T
	 FcLQt+fh1dZm2lvgoccHi0FT4oiU4ISYIv1jNm5IvSGqtMKjx7SJdyWzoIb4QMnts8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241022;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=anwB4tQveasnMNBaC79HF4iqwVuUGDsqZ8YnV4hzKPo=;
	b=OT8+/2dFBU/0tQZR8I9IwDkQa5OHNR/hXRI9DTQDUbTLrNVyYSxNehlZkJFSfrGKiZoi
	 H3RePUuySSZ5YHEx+HeRlOOusrTmPcAYiZ4XjfaUVprXrp1xSvGFWUxBLvFkcyfSZi1Ww
	 5HOmFp+hJd0lj/0zodzVuEQl4auLaG0yIQhvrdygLsYlH/WfWVXjDPgqyA6URDqT9jqfQ
	 qhuiORpIw2Y/xIZY2+KpIR85yzIqVOjL5ZYGikl9V+r+DZo2RarP+VARKupuZC9qOhoon
	 xFebsVp85QqCjOTVEDoKPRJf1f13zimqKd1mWsVL+G6crdWDdrBvkeM6zJzDdg4Nxjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51C2606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51C2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSr071g8zwXwL;
	Thu, 29 Oct 2026 10:30:08 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSr04TYHz171Yx;
	Thu, 29 Oct 2026 10:30:08 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id C5C2C5943;
	Thu, 29 Oct 2026 10:30:01 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:30:06 +0800
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
Subject: [RFC PATCH v3 06/17] sched/cache: Prioritize cache-preferred node selection over LLC selection
Date: Thu, 29 Oct 2026 10:20:24 +0800
Message-ID: <20261029022036.4002331-7-wujianyong@hygon.cn>
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

The LLC affinity sequence is rooted at the preferred LLC, and its node
order is rooted at the node containing that LLC. task_cache_work()
currently selects the preferred LLC by per-LLC occupancy alone. For a
workload spanning multiple nodes, small occupancy shifts between LLCs
can move the preferred LLC to another node and reorder the entire
sequence.

Occupancy aggregated over a larger set of CPUs is more stable: shifts
between LLCs of the same node cancel out in the node's sum. Make the
node-level decision on this sum first, then choose the LLC within the
selected node:

  1. Sum the thread group's occupancy over the LLCs of each node. If
     the busiest node exceeds twice the current cache-preferred node,
     switch to it and select its busiest LLC.
  2. Otherwise, stay on the current cache-preferred node and switch to
     its busiest LLC only if that exceeds twice the current preferred
     LLC.

This keeps the LLC affinity sequence stable. The node order changes
only when the workload's occupancy really moves to another node, and
switching LLCs within a node changes only the intra-node LLC order.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 162 +++++++++++++++++++++++++++++---------------
 1 file changed, 109 insertions(+), 53 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f15f5764818e..fe357d79b6e0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1824,14 +1824,47 @@ static inline void update_avg_scale(u64 *avg, u64 sample)
 	*avg += div64_s64(diff, divisor);
 }
 
+/*
+ * Accumulate the mm's occupancy over one LLC. Returns the sum over @span,
+ * stores the busiest CPU in @max_cpu and adds the CPUs running a thread of
+ * @mm to @nr_running.
+ */
+static unsigned long scan_llc_occ(struct mm_struct *mm, const struct cpumask *span,
+				  int *max_cpu, int *nr_running)
+{
+	unsigned long occ, m_occ = 0, a_occ = 0;
+	struct task_struct *cur;
+	int i, m_cpu = -1;
+
+	for_each_cpu(i, span) {
+		occ = fraction_mm_sched(cpu_rq(i),
+				per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
+		a_occ += occ;
+		if (occ > m_occ) {
+			m_occ = occ;
+			m_cpu = i;
+		}
+
+		cur = rcu_dereference_all(cpu_rq(i)->curr);
+		if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
+		    cur->mm == mm)
+			(*nr_running)++;
+	}
+
+	*max_cpu = m_cpu;
+
+	return a_occ;
+}
+
 static void task_cache_work(struct callback_head *work)
 {
-	int cpu, m_a_cpu = -1, nr_running = 0, curr_cpu;
 	unsigned long next_scan, now = jiffies;
-	struct task_struct *p = current, *cur;
-	unsigned long curr_m_a_occ = 0;
+	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
-	unsigned long m_a_occ = 0;
+	unsigned long m_a_n_occ = 0, curr_m_a_n_occ = 0, curr_m_a_occ = 0;
+	unsigned long pref_node_llc_occ = 0;
+	int cpu, m_a_n_cpu = -1, nr_running = 0, curr_cpu;
+	int pref_cpu, pref_node_llc_cpu = -1, new_cpu = -1;
 	cpumask_var_t cpus;
 
 	WARN_ON_ONCE(work != &p->cache_work);
@@ -1863,75 +1896,98 @@ static void task_cache_work(struct callback_head *work)
 	if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
 		return;
 
+	pref_cpu = READ_ONCE(mm->sc_stat.cpu);
+
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
 		get_scan_cpumasks(cpus, p);
 
 		for_each_cpu(cpu, cpus) {
-			/* XXX sched_cluster_active */
-			struct sched_domain *sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
-			unsigned long occ, m_occ = 0, a_occ = 0;
-			int m_cpu = -1, i;
+			const struct cpumask *node_span =
+				cpumask_of_node(cpu_to_node(cpu));
+			unsigned long a_occ, a_n_occ = 0, m_llc_occ = 0;
+			int m_llc_cpu = -1, m_cpu, k, nr_llc = 0;
 
-			if (!sd)
-				continue;
+			for_each_cpu_and(k, node_span, cpus) {
+				/* XXX sched_cluster_active */
+				struct sched_domain *sd =
+					rcu_dereference_all(per_cpu(sd_llc, k));
 
-			for_each_cpu(i, sched_domain_span(sd)) {
-				occ = fraction_mm_sched(cpu_rq(i),
-							per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
-				a_occ += occ;
-				if (occ > m_occ) {
-					m_occ = occ;
-					m_cpu = i;
+				/*
+				 * No sched domain, e.g. an isolated CPU: retire
+				 * the bit so the node is not walked again for it.
+				 */
+				if (!sd) {
+					__cpumask_clear_cpu(k, cpus);
+					continue;
 				}
 
-				cur = rcu_dereference_all(cpu_rq(i)->curr);
-				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
-				    cur->mm == mm)
-					nr_running++;
+				a_occ = scan_llc_occ(mm, sched_domain_span(sd),
+						     &m_cpu, &nr_running);
+
+				cpumask_andnot(cpus, cpus, sched_domain_span(sd));
+				nr_llc++;
+				if (a_occ > m_llc_occ) {
+					m_llc_occ = a_occ;
+					m_llc_cpu = m_cpu;
+				}
+				if (pref_cpu >= 0 && llc_id(pref_cpu) == llc_id(k))
+					curr_m_a_occ = a_occ;
+				/* record for numa node */
+				a_n_occ += a_occ;
 			}
 
 			/*
-			 * Compare the accumulated occupancy of each LLC. The
-			 * reason for using accumulated occupancy rather than average
-			 * per CPU occupancy is that it works better in asymmetric LLC
-			 * scenarios.
-			 * For example, if there are 2 threads in a 4CPU LLC and 3
-			 * threads in an 8CPU LLC, it might be better to choose the one
-			 * with 3 threads. However, this would not be the case if the
-			 * occupancy is divided by the number of CPUs in an LLC (i.e.,
-			 * if average per CPU occupancy is used).
-			 * Besides, NUMA balancing fault statistics behave similarly:
-			 * the total number of faults per node is compared rather than
-			 * the average number of faults per CPU. This strategy is also
-			 * followed here.
+			 * Nothing scanned for this node, none of its CPUs in the
+			 * mask is attached to a sched domain.
+			 */
+			if (!nr_llc)
+				continue;
+
+			/*
+			 * Remember the busiest LLC of the node the preference
+			 * currently points at, as opposed to the LLC the
+			 * preference itself points at, so that the LLC level
+			 * decision can be taken once, after the whole scan.
 			 */
-			if (a_occ > m_a_occ) {
-				m_a_occ = a_occ;
-				m_a_cpu = m_cpu;
+			if (pref_cpu >= 0 && m_llc_cpu >= 0 &&
+			    cpu_to_node(pref_cpu) == cpu_to_node(m_llc_cpu)) {
+				pref_node_llc_occ = m_llc_occ;
+				pref_node_llc_cpu = m_llc_cpu;
 			}
 
-			if (llc_id(cpu) == llc_id(READ_ONCE(mm->sc_stat.cpu)))
-				curr_m_a_occ = a_occ;
+			if (a_n_occ > m_a_n_occ) {
+				m_a_n_occ = a_n_occ;
+				m_a_n_cpu = m_llc_cpu;
+			}
 
-			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
+			if (pref_cpu >= 0 &&
+			    cpu_to_node(cpu) == cpu_to_node(pref_cpu))
+				curr_m_a_n_occ = a_n_occ;
 		}
 	}
 
-	if (m_a_occ > (2 * curr_m_a_occ)) {
-		/*
-		 * Avoid switching sc_stat.cpu too fast.
-		 * The reason to choose 2X is because:
-		 * 1. It is better to keep the preferred LLC stable,
-		 *    rather than changing it frequently and cause migrations
-		 * 2. 2X means the new preferred LLC has at least 1 more
-		 *    busy CPU than the old one(200% vs 100%, eg)
-		 * 3. 2X is chosen based on test results, as it delivers
-		 *    the optimal performance gain so far.
-		 */
-		WRITE_ONCE(mm->sc_stat.cpu, m_a_cpu);
-	}
+	/*
+	 * Avoid switching sc_stat.cpu too fast. The reason to choose 2X is
+	 * because:
+	 * 1. It is better to keep the preferred LLC stable, rather than
+	 *    changing it frequently and cause migrations
+	 * 2. 2X means the new preferred LLC has at least 1 more busy CPU than
+	 *    the old one(200% vs 100%, eg)
+	 * 3. 2X is chosen based on test results, as it delivers the optimal
+	 *    performance gain so far.
+	 *
+	 * Moving the preference to another node takes precedence over moving
+	 * it to another LLC of the node it already points at.
+	 */
+	if (m_a_n_occ > 2 * curr_m_a_n_occ)
+		new_cpu = m_a_n_cpu;
+	else if (pref_node_llc_cpu >= 0 && pref_node_llc_occ > 2 * curr_m_a_occ)
+		new_cpu = pref_node_llc_cpu;
+
+	if (new_cpu >= 0)
+		WRITE_ONCE(mm->sc_stat.cpu, new_cpu);
 
 	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
 	free_cpumask_var(cpus);
-- 
2.34.1


