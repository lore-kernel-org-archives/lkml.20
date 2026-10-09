Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9A20ED
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514613; cv=none; b=OD1EsqiC2L/lUQHmRSLsMqFFjYzz559v+nxiV67KU0UjPzcP5uDWxC1hIPBRQweNuBa0mSyOHozowRLiBtcZcUgvS8h0cKUdOQ4kACwGycg67TmqamjEuWliAza5FBUDmUFVoPUJELVonx1QRVlaycK3Wd/bu3WMt+Y+AzHyqcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514613; c=relaxed/simple;
	bh=lIgAjbWYorWc8RNOmWCpIbjzBbvkktDoycMYElCLAl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CvOHrIS2INz5Dkjmo1tJbXRVseila9Ci355OeWP/WgZu2cyK1B6nCHhYtJHOcjVdPrsJhYIahnsYmA11Hg/kYkt428tBBPr3FpUSzQCwPv6VOfokdB7jNSMJS/zYkbhffJ/nf4PxrlppVAhIFnrU+0/q+tuAJHL1H+P9WoMH2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j1BLv1yfCzKHMSZ
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:55:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id AD53B409D0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:56:42 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnaG3gV8hqWun2DA--.47568S4;
	Fri, 09 Oct 2026 10:56:42 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/2] -- DO NOT APPLY!!! -- sched/cache/debug: Add trace event and sched feature to track scan cost
Date: Fri,  9 Oct 2026 03:29:43 +0000
Message-Id: <20261009032943.95091-3-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009032943.95091-1-luogengkun@huaweicloud.com>
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCnaG3gV8hqWun2DA--.47568S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar13ZFyDGrW8Jry7try3twb_yoWxWFW8pa
	4q9rW5tFWDJF10g3yfZws5Jr15K3s3ta9rKa43G3WrAF1ftr1FgFWqq3ZIvrWYk3sY9a4a
	vr4DKFW2gF1UXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UC
	ZXrUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

This commit re-adds get_scan_cpumasks() and introduces two sched features
as well as trace events to track the scanning cost for testing purposes.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/trace/events/sched.h | 21 +++++++++++
 kernel/sched/fair.c          | 70 +++++++++++++++++++++++++++++++++---
 kernel/sched/features.h      |  2 ++
 3 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 535860581f15..aced624f198d 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -10,6 +10,27 @@
 #include <linux/tracepoint.h>
 #include <linux/binfmts.h>
 
+TRACE_EVENT(sched_cache_scan,
+
+	TP_PROTO(struct task_struct *t, int scan),
+
+	TP_ARGS(t, scan),
+
+	TP_STRUCT__entry(
+		__string(	comm,	t->comm		)
+		__field(	pid_t,	pid		)
+		__field(	int,	scan		)
+	),
+
+	TP_fast_assign(
+		__assign_str(comm);
+		__entry->pid	= t->pid;
+		__entry->scan	= scan;
+	),
+
+	TP_printk("comm=%s pid=%d scan=%d", __get_str(comm), __entry->pid,
+					__entry->scan)
+);
 /*
  * Tracepoint for calling kthread_stop, performed to end a kthread:
  */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 691b4ecdb2e7..bc407de04524 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1864,7 +1864,8 @@ static unsigned long fraction_mm_sched(int cpu,
 	__update_mm_sched(rq, pcpu_sched);
 
 	/* Skip the rq that has not been hit for a long time */
-	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity_timeout) {
+	if (sched_feat(SC_VISIT) &&
+	    (rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity_timeout) {
 		cpumask_clear_cpu(cpu, grp->visited_cpus);
 		return 0;
 	}
@@ -1945,7 +1946,8 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		rq->cpu_runtime += delta_exec;
 		epoch = rq->cpu_epoch;
 		pcpu_sched->epoch_last_visit = epoch;
-		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
+		if (sched_feat(SC_VISIT) &&
+		    !cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
 			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
 	}
 
@@ -1997,6 +1999,52 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 	}
 }
 
+static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
+			      struct sched_cache_group *grp)
+{
+#ifdef CONFIG_NUMA_BALANCING
+	int cpu, curr_cpu, nid, pref_nid;
+
+	if (!static_branch_likely(&sched_numa_balancing))
+		goto out;
+
+	cpu = READ_ONCE(grp->cpu);
+	if (cpu != -1)
+		nid = cpu_to_node(cpu);
+	curr_cpu = task_cpu(p);
+
+	/*
+	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
+	 * preferred node is per-task rather than per-process. It is possible
+	 * for different threads of the process to have distinct preferred
+	 * nodes; consequently, the process-wide preferred LLC may bounce
+	 * between different nodes. As a workaround, maintain the scan
+	 * CPU mask to also cover the process's current preferred LLC and the
+	 * current running node to mitigate the bouncing risk.
+	 * TBD: numa_group should be considered during task aggregation.
+	 */
+	pref_nid = p->numa_preferred_nid;
+	/* honor the task's preferred node */
+	if (pref_nid == NUMA_NO_NODE)
+		goto out;
+
+	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
+
+	/* honor the task's preferred LLC CPU */
+	if (cpu != -1 && !cpumask_test_cpu(cpu, cpus) && nid != NUMA_NO_NODE)
+		cpumask_or(cpus, cpus, cpumask_of_node(nid));
+
+	/* make sure the task's current running node is included */
+	if (!cpumask_test_cpu(curr_cpu, cpus))
+		cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
+
+	return;
+
+out:
+#endif
+	cpumask_copy(cpus, cpu_online_mask);
+}
+
 static inline void update_avg_scale(u64 *avg, u64 sample)
 {
 	int factor = per_cpu(sd_llc_size, raw_smp_processor_id());
@@ -2019,11 +2067,13 @@ static void task_cache_work(struct callback_head *work)
 {
 	struct sched_cache_group *grp __free(sched_cache_group_put) = NULL;
 	cpumask_var_t cpus __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+	cpumask_var_t scan_cpus __free(free_cpumask_var) = CPUMASK_VAR_NULL;
 	int cpu, m_a_cpu = -1, nr_running = 0, curr_cpu;
 	unsigned long next_scan, now = jiffies;
 	struct task_struct *p = current, *cur;
 	unsigned long curr_m_a_occ = 0;
 	unsigned long m_a_occ = 0;
+	int scanned = 0;
 
 	WARN_ON_ONCE(work != &p->cache_work);
 
@@ -2063,6 +2113,9 @@ static void task_cache_work(struct callback_head *work)
 	if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
 		return;
 
+	if (!zalloc_cpumask_var(&scan_cpus, GFP_KERNEL))
+		return;
+
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
@@ -2077,7 +2130,10 @@ static void task_cache_work(struct callback_head *work)
 		 * implies this process hasn't run on that CPU for a long
 		 * time, and will be captured in the next cycle.
 		 */
-		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
+		if (sched_feat(SC_NODE))
+			get_scan_cpumasks(cpus, p, grp);
+		else if (sched_feat(SC_VISIT))
+			cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
 
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -2088,7 +2144,11 @@ static void task_cache_work(struct callback_head *work)
 			if (!sd)
 				continue;
 
-			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
+			cpumask_copy(scan_cpus, sched_domain_span(sd));
+			if (sched_feat(SC_VISIT))
+				cpumask_and(scan_cpus, scan_cpus, cpus);
+
+			for_each_cpu(i, scan_cpus) {
 				/*
 				 * rcu_access_pointer() is used because the
 				 * pointer is only compared, never dereferenced.
@@ -2098,6 +2158,7 @@ static void task_cache_work(struct callback_head *work)
 				    rcu_access_pointer(cur->sched_cache_grp) == grp)
 					nr_running++;
 
+				scanned++;
 				occ = fraction_mm_sched(i, grp);
 				if (occ == 0)
 					continue;
@@ -2150,6 +2211,7 @@ static void task_cache_work(struct callback_head *work)
 	}
 
 	update_avg_scale(&grp->nr_running_avg, nr_running);
+	trace_sched_cache_scan(p, scanned);
 }
 
 void init_sched_mm(struct task_struct *p)
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 8f0dee8fc475..98701c52b919 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
  */
 SCHED_FEAT(NI_RANDOM, true)
 SCHED_FEAT(NI_RATE, true)
+SCHED_FEAT(SC_VISIT, false)
+SCHED_FEAT(SC_NODE, false)
-- 
2.34.1

