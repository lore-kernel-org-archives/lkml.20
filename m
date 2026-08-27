Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BEB241CB7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=IbrslxMEO8QFQsKA2Wj+1O7uxzuMn3fA2PftNQhaNYmjj5YoQxdn3XdpcC5uBXWaPeshb5blKVWOQWc+ARSd8AJywun3Dh8MdS6PNhneNMITYWHlXLyjXDgKOUp2oWPV6ct5JIsgDieWUue5AdTh6OdAknmTBNATWUmWYXwt654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=5yKC19MbSQAjytJn6Ia8jWnPe9uPqicEcfz/gfJbET0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIciz6y9frtxkIC6cAW4TemKVd3rSVeRi2ln9hbVsmwuWu2iym9ZIBA5gGayGxpUc6CRyzGlwgWW95CBv/vu6QR9VvPlk6igpb/68NLDgrjD2UUmod6KVOW3m5k/bvxX3BTuH/xW5gZvZawoWLEpiad3zFfItlHSBUEWuMhNqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C60WLDzBJb6g;
	Thu, 27 Aug 2026 20:33:22 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C44rBxzBJb6b;
	Thu, 27 Aug 2026 20:33:20 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 432F178AD;
	Thu, 27 Aug 2026 20:33:13 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:19 +0800
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
Subject: [RFC PATCH v2 07/23] sched/cache: Prioritize preferred NUMA node selection over LLC selection
Date: Thu, 27 Aug 2026 20:28:00 +0800
Message-ID: <20260827122816.756234-8-wujianyong@hygon.cn>
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

In the current implementation, the preferred LLC is selected based on the
LLC with the largest running time of the thread group. However, the
preferred LLC may be prone to frequent migration when the workload
spreads across the entire system, especially when the number of CPUs
sharing an LLC is small. A better approach is to first select a preferred
NUMA node in the same way, and then select the preferred LLC within that
preferred NUMA node.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 131 +++++++++++++++++++++++++++-----------------
 1 file changed, 82 insertions(+), 49 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f15f5764818e..30de09ebd9f6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1826,12 +1826,13 @@ static inline void update_avg_scale(u64 *avg, u64 sample)
 
 static void task_cache_work(struct callback_head *work)
 {
-	int cpu, m_a_cpu = -1, nr_running = 0, curr_cpu;
 	unsigned long next_scan, now = jiffies;
 	struct task_struct *p = current, *cur;
-	unsigned long curr_m_a_occ = 0;
 	struct mm_struct *mm = p->mm;
-	unsigned long m_a_occ = 0;
+	unsigned long m_a_n_occ = 0, curr_m_a_n_occ = 0, curr_m_a_occ = 0;
+	unsigned long pref_llc_occ = 0;
+	int cpu, m_a_n_cpu = -1, nr_running = 0, curr_cpu;
+	int pref_cpu, pref_llc_cpu = -1, new_cpu = -1;
 	cpumask_var_t cpus;
 
 	WARN_ON_ONCE(work != &p->cache_work);
@@ -1863,6 +1864,13 @@ static void task_cache_work(struct callback_head *work)
 	if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
 		return;
 
+	/*
+	 * Sample the current preference once, up front. Re-reading it during
+	 * the scan would let a choice made while walking one node feed into
+	 * the comparison made for the next one.
+	 */
+	pref_cpu = READ_ONCE(mm->sc_stat.cpu);
+
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
@@ -1870,68 +1878,93 @@ static void task_cache_work(struct callback_head *work)
 
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
-			struct sched_domain *sd = rcu_dereference_all(per_cpu(sd_llc, cpu));
-			unsigned long occ, m_occ = 0, a_occ = 0;
-			int m_cpu = -1, i;
+			struct sched_domain *nsd = per_cpu(sd_node, cpu);
+			unsigned long occ, m_occ, a_occ, a_n_occ = 0;
+			unsigned long m_llc_occ = 0;
+			int m_llc_cpu = -1, m_cpu, i, k;
 
-			if (!sd)
+			if (!nsd)
 				continue;
 
-			for_each_cpu(i, sched_domain_span(sd)) {
-				occ = fraction_mm_sched(cpu_rq(i),
+			for_each_cpu_and(k, sched_domain_span(nsd), cpus) {
+				a_occ = m_occ = 0;
+				m_cpu = -1;
+				/* XXX sched_cluster_active */
+				struct sched_domain *sd =
+					rcu_dereference_all(per_cpu(sd_llc, k));
+
+				if (!sd)
+					continue;
+
+				for_each_cpu(i, sched_domain_span(sd)) {
+					occ = fraction_mm_sched(cpu_rq(i),
 							per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
-				a_occ += occ;
-				if (occ > m_occ) {
-					m_occ = occ;
-					m_cpu = i;
+					a_occ += occ;
+					if (occ > m_occ) {
+						m_occ = occ;
+						m_cpu = i;
+					}
+
+					cur = rcu_dereference_all(cpu_rq(i)->curr);
+					if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
+					    cur->mm == mm)
+						nr_running++;
 				}
 
-				cur = rcu_dereference_all(cpu_rq(i)->curr);
-				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
-				    cur->mm == mm)
-					nr_running++;
+				cpumask_andnot(cpus, cpus, sched_domain_span(sd));
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
+			 * Remember the busiest LLC of the node the preference
+			 * currently points at, so that the LLC level decision can
+			 * be taken once, after the whole scan.
 			 */
-			if (a_occ > m_a_occ) {
-				m_a_occ = a_occ;
-				m_a_cpu = m_cpu;
+			if (pref_cpu >= 0 && m_llc_cpu >= 0 &&
+			    cpu_to_node(pref_cpu) == cpu_to_node(m_llc_cpu)) {
+				pref_llc_occ = m_llc_occ;
+				pref_llc_cpu = m_llc_cpu;
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
+	 * Moving to another node takes precedence over moving inside the
+	 * current one, as it did when the two updates were applied in that
+	 * order.
+	 */
+	if (m_a_n_occ > 2 * curr_m_a_n_occ)
+		new_cpu = m_a_n_cpu;
+	else if (pref_llc_cpu >= 0 && pref_llc_occ > 2 * curr_m_a_occ)
+		new_cpu = pref_llc_cpu;
+
+	if (new_cpu >= 0)
+		WRITE_ONCE(mm->sc_stat.cpu, new_cpu);
 
 	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
 	free_cpumask_var(cpus);
-- 
2.34.1


