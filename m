Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DC2153BE9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883375; cv=none; b=eBkk1Uj/OFFDAci+imzTFzc7pwdLE5mc24NqZxrdJMJ5dVP/SjaykNNigBLHwdgCC3SfdEPXGGS73eXNBazkBq0pivRWMmBL2xUkzNtYe5X+JaSmCa9pSYeGFH9TTLb4Cwalq45k5YAeq3BJM1r53Fw0Q9AAW8bwfBfVkWpMlpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883375; c=relaxed/simple;
	bh=JNwV3yYicugDcSmp+dPjby7I6C9mjJ8cQCGCn8D7CRo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PfYIVlWv7lI2TszpGv0DjcaZObGAGgGow1nsfo3Ia3m6y53WRRRxEODGOTCC6W33grRXNzc3BijESBXIqDvpoXbXQGZML8RSmIfWAGObDwMmY/a+k54B4KCBl37DH77c5DIkxDz/Q+u4ulydvJ1Y0be1GydnBez0jcDhkycH/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMSD0kHrzTdtV;
	Fri, 28 Aug 2026 10:15:56 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMSB071vzTdtV;
	Fri, 28 Aug 2026 10:15:54 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id C07D578AD;
	Fri, 28 Aug 2026 10:15:45 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:15:52 +0800
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
Subject: [RFC PATCH v2 20/23] sched/cache: Estimate utilization of the whole thread group
Date: Fri, 28 Aug 2026 10:11:56 +0800
Message-ID: <20260828021156.785662-1-wujianyong@hygon.cn>
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

Since we want to spread threads across multiple LLCs, it is helpful
to know the overall utilization of the thread-group when deciding
whether a task may be migrated to a destination LLC.

We track this estimate using an asymmetric EWMA: rising load is
weighted by 1/2, while falling load uses a weight of 1/8.
This allows fast expansion of placement, while preventing premature
range contraction caused by short-term idle periods.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 44 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 7fd4ea8c9037..96263bcb9e84 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2397,6 +2397,7 @@ struct sched_cache_stat {
 	raw_spinlock_t lock;
 	unsigned long epoch;
 	u64 nr_running_avg;
+	u64 util_avg;
 	unsigned long next_scan;
 	unsigned long footprint;
 	int cpu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 45dd3e5e0a86..848abcf93c47 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1604,6 +1604,7 @@ void mm_init_sched(struct mm_struct *mm,
 	mm->sc_stat.cpu = -1;
 	mm->sc_stat.next_scan = jiffies;
 	mm->sc_stat.nr_running_avg = 0;
+	mm->sc_stat.util_avg = 0;
 	mm->sc_stat.footprint = 0;
 	mm->sc_stat.node_epoch = kcalloc(num_possible_nodes(),
 					 sizeof(*mm->sc_stat.node_epoch),
@@ -1860,11 +1861,35 @@ static inline void update_avg_scale(u64 *avg, u64 sample)
 	*avg += div64_s64(diff, divisor);
 }
 
+/*
+ * Keep a conservative estimate of the total CFS utilization generated by an
+ * mm.  Rise quickly so that spreading is not delayed when demand grows, but
+ * decay slowly so that a short idle interval does not immediately pull the
+ * workload back into fewer LLCs.
+ *
+ * The value is expressed in scheduler capacity units: SCHED_CAPACITY_SCALE is
+ * one fully utilized CPU.
+ */
+static inline void update_mm_util_avg(u64 *avg, u64 sample)
+{
+	s64 diff;
+	u32 divisor;
+
+	if (sample >= *avg)
+		diff = sample - *avg;
+	else
+		diff = -(*avg - sample);
+
+	divisor = diff > 0 ? 2 : 8;
+	*avg += div64_s64(diff, divisor);
+}
+
 static void task_cache_work(struct callback_head *work)
 {
 	unsigned long next_scan, now = jiffies;
 	struct task_struct *p = current, *cur;
 	struct mm_struct *mm = p->mm;
+	u64 group_util = 0;
 	unsigned long m_a_n_occ = 0, curr_m_a_n_occ = 0, curr_m_a_occ = 0;
 	unsigned long pref_llc_occ = 0;
 	int cpu, m_a_n_cpu = -1, nr_running = 0, curr_cpu;
@@ -1933,9 +1958,23 @@ static void task_cache_work(struct callback_head *work)
 					continue;
 
 				for_each_cpu(i, sched_domain_span(sd)) {
+					unsigned long cpu_util, mm_util;
+
 					occ = fraction_mm_sched(cpu_rq(i),
 							per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
 					a_occ += occ;
+
+					/*
+					 * fraction_mm_sched() is a share of executed CFS
+					 * time, not an absolute utilization.  Scale the
+					 * CPU's PELT utilization by that share to estimate
+					 * this mm's utilization on the CPU.
+					 */
+					cpu_util = cpu_util_cfs(i);
+					mm_util = mul_u64_u32_div(cpu_util,
+							min_t(unsigned long, occ, NICE_0_LOAD),
+							NICE_0_LOAD);
+					group_util += mm_util;
 					if (occ > m_occ) {
 						m_occ = occ;
 						m_cpu = i;
@@ -2003,6 +2042,7 @@ static void task_cache_work(struct callback_head *work)
 		WRITE_ONCE(mm->sc_stat.cpu, new_cpu);
 
 	update_avg_scale(&mm->sc_stat.nr_running_avg, nr_running);
+	update_mm_util_avg(&mm->sc_stat.util_avg, group_util);
 	free_cpumask_var(cpus);
 }
 
@@ -10639,7 +10679,7 @@ static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 	struct mm_struct *mm;
 	unsigned long dst_util, dst_cap, tsk_util = 0;
 	unsigned long src_util = 0, src_cap = 0;
-	unsigned long acc_util = 0, acc_cap = 0;
+	unsigned long acc_util = 0, acc_cap = 0, dst_pre;
 	int node, target_cpu = src_cpu;
 	int get_src = 0;
 
@@ -10659,9 +10699,9 @@ static enum llc_mig can_migrate_node(int src_cpu, int dst_cpu,
 	}
 
 	dst_util = dst_util + tsk_util;
+	dst_pre = dst_util - tsk_util;
 
 	if (to_pref) {
-		unsigned long dst_pre = dst_util - tsk_util;
 
 		if (fits_llc_capacity(dst_util, dst_cap))
 			return mig_llc;
-- 
2.34.1


