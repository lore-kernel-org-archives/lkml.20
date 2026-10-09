Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB0339847
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514613; cv=none; b=b3X1n5ojjPLnxKvns0TzKHYf/1kgnx3QIda95BF+W43OdbSwYUqnFxnJpiWEBVDoDrdOs1yUkzVgA3qh1kd4immrX/nX8I/okWrRJGm4N+z5sH65l1mIHDYdaHn32YI9qPLax81bvzPeaWCEsNd9DIj++j8EoBOv+LYSHsQi4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514613; c=relaxed/simple;
	bh=FglHHNLfPUCVe/yvE6YBCklzyMxf4f89fVLtZVHegqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKWt1FoZJjOkiKS2t7CCX13PVQSC7bZ5larB7LFpLR09VctK5BNsnAlmWlyuPnPcLKmtEYW014WxgIYdx58bUEGXVFyKZHRNg3OQAI7e1rEuf/h8MNMkiQ+Otm7IaPWMrfrYc+HI5Ui72OcpnBGlxD598ZoTRo0fCH78XxpKMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j1BLv0mWjzKHMSp
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:55:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 8138040561
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:56:42 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnaG3gV8hqWun2DA--.47568S3;
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
Subject: [PATCH v10 1/2] sched/cache: Reduce the overhead of task_cache_work by only scan the visisted cpus
Date: Fri,  9 Oct 2026 03:29:42 +0000
Message-Id: <20261009032943.95091-2-luogengkun@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgCnaG3gV8hqWun2DA--.47568S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1rXFWUZF4ruw4UGr1DGFg_yoW3Ar1Dpa
	yq9rWUtF4kJr40g3yDA3ykXr15K3s7ta47K3y3Gr1rZF13Kw18tryjy3WavrWYkrna9a4a
	vrWDKF12gF1jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
	pnQUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

The overhead of task_cache_work() is high, especially in multi-NUMA systems.
Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
in the system. However, most of these scans are meaningless, such as those
for CPUs that have never been visited or were accessed a long time ago.

To address this problem, introduce visited_cpus to track the visited CPUs
and evict them once they have not been accessed for a duration exceeding
llc_epoch_affinity_timeout.

Now that we know exactly which CPUs to scan from visited_cpus, we can remove
get_scan_cpumasks().

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/sched.h |   2 +
 kernel/sched/fair.c   | 117 +++++++++++++++++++-----------------------
 2 files changed, 55 insertions(+), 64 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..09bd18c7a667 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2404,6 +2404,7 @@ static __always_inline int task_mm_cid(struct task_struct *t)
 struct sched_cache_time {
 	u64 runtime;
 	unsigned long epoch;
+	unsigned long epoch_last_visit;
 };
 
 struct sched_cache_group {
@@ -2416,6 +2417,7 @@ struct sched_cache_group {
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
+	cpumask_var_t visited_cpus;
 } ____cacheline_aligned_in_smp;
 
 struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *grp);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..691b4ecdb2e7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1656,11 +1656,11 @@ int mm_init_sched(struct mm_struct *mm,
 	int i;
 
 	grp = kzalloc_obj(*grp);
-	if (!grp) {
-		free_percpu(_pcpu_sched);
-		mm->sched_cache_grp = NULL;
-		return -ENOMEM;
-	}
+	if (!grp)
+		goto err_free_pcpu;
+
+	if (!zalloc_cpumask_var(&grp->visited_cpus, GFP_KERNEL))
+		goto err_free_grp;
 
 	for_each_possible_cpu(i) {
 		struct sched_cache_time *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
@@ -1669,6 +1669,7 @@ int mm_init_sched(struct mm_struct *mm,
 		pcpu_sched->runtime = 0;
 		/* a slightly stale cpu epoch is acceptible */
 		pcpu_sched->epoch = rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit = rq->cpu_epoch;
 		epoch = rq->cpu_epoch;
 	}
 
@@ -1694,6 +1695,14 @@ int mm_init_sched(struct mm_struct *mm,
 	 */
 	smp_store_release(&mm->sched_cache_grp, grp);
 	return 0;
+
+err_free_grp:
+	kfree(grp);
+
+err_free_pcpu:
+	free_percpu(_pcpu_sched);
+	mm->sched_cache_grp = NULL;
+	return -ENOMEM;
 }
 
 static void sched_cache_group_free_rcu(struct rcu_head *rcu)
@@ -1702,6 +1711,7 @@ static void sched_cache_group_free_rcu(struct rcu_head *rcu)
 		container_of(rcu, struct sched_cache_group, rcu);
 
 	free_percpu(grp->pcpu_sched);
+	free_cpumask_var(grp->visited_cpus);
 	kfree(grp);
 }
 
@@ -1842,13 +1852,23 @@ static inline void __update_mm_sched(struct rq *rq,
 	}
 }
 
-static unsigned long fraction_mm_sched(struct rq *rq,
-				       struct sched_cache_time *pcpu_sched)
+static unsigned long fraction_mm_sched(int cpu,
+				       struct sched_cache_group *grp)
 {
+	struct sched_cache_time *pcpu_sched =
+		per_cpu_ptr(grp->pcpu_sched, cpu);
+	struct rq *rq = cpu_rq(cpu);
+
 	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
 
 	__update_mm_sched(rq, pcpu_sched);
 
+	/* Skip the rq that has not been hit for a long time */
+	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) > llc_epoch_affinity_timeout) {
+		cpumask_clear_cpu(cpu, grp->visited_cpus);
+		return 0;
+	}
+
 	/*
 	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
 	 * the accumulation period, this means the multiplcation here should
@@ -1924,6 +1944,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		pcpu_sched->runtime += delta_exec;
 		rq->cpu_runtime += delta_exec;
 		epoch = rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit = epoch;
+		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
+			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
 	}
 
 	/*
@@ -1974,52 +1997,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 	}
 }
 
-static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
-			      struct sched_cache_group *grp)
-{
-#ifdef CONFIG_NUMA_BALANCING
-	int cpu, curr_cpu, nid, pref_nid;
-
-	if (!static_branch_likely(&sched_numa_balancing))
-		goto out;
-
-	cpu = READ_ONCE(grp->cpu);
-	if (cpu != -1)
-		nid = cpu_to_node(cpu);
-	curr_cpu = task_cpu(p);
-
-	/*
-	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
-	 * preferred node is per-task rather than per-process. It is possible
-	 * for different threads of the process to have distinct preferred
-	 * nodes; consequently, the process-wide preferred LLC may bounce
-	 * between different nodes. As a workaround, maintain the scan
-	 * CPU mask to also cover the process's current preferred LLC and the
-	 * current running node to mitigate the bouncing risk.
-	 * TBD: numa_group should be considered during task aggregation.
-	 */
-	pref_nid = p->numa_preferred_nid;
-	/* honor the task's preferred node */
-	if (pref_nid == NUMA_NO_NODE)
-		goto out;
-
-	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
-
-	/* honor the task's preferred LLC CPU */
-	if (cpu != -1 && !cpumask_test_cpu(cpu, cpus) && nid != NUMA_NO_NODE)
-		cpumask_or(cpus, cpus, cpumask_of_node(nid));
-
-	/* make sure the task's current running node is included */
-	if (!cpumask_test_cpu(curr_cpu, cpus))
-		cpumask_or(cpus, cpus, cpumask_of_node(cpu_to_node(curr_cpu)));
-
-	return;
-
-out:
-#endif
-	cpumask_copy(cpus, cpu_online_mask);
-}
-
 static inline void update_avg_scale(u64 *avg, u64 sample)
 {
 	int factor = per_cpu(sd_llc_size, raw_smp_processor_id());
@@ -2068,7 +2045,7 @@ static void task_cache_work(struct callback_head *work)
 	if (time_before(now, next_scan))
 		return;
 
-	/* only 1 thread is allowed to scan */
+	/* elect a single scanner per epoch */
 	if (!try_cmpxchg(&grp->next_scan, &next_scan,
 			 now + max_t(unsigned long,
 				     READ_ONCE(llc_epoch_period), 1)))
@@ -2089,7 +2066,18 @@ static void task_cache_work(struct callback_head *work)
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
-		get_scan_cpumasks(cpus, p, grp);
+		/*
+		 * Data race: While evaluating the visited_cpus without
+		 * a lock, a CPU could be concurrently set by
+		 * account_mm_sched(), meaning the scan might skip the newly
+		 * visited CPU if the bit changes during the scan. This is
+		 * a deliberate trade-off between accuracy and efficiency:
+		 * locking would prevent this race but incur extra overhead.
+		 * The missed runtime contribution is negligible because it
+		 * implies this process hasn't run on that CPU for a long
+		 * time, and will be captured in the next cycle.
+		 */
+		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
 
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -2100,15 +2088,7 @@ static void task_cache_work(struct callback_head *work)
 			if (!sd)
 				continue;
 
-			for_each_cpu(i, sched_domain_span(sd)) {
-				occ = fraction_mm_sched(cpu_rq(i),
-							per_cpu_ptr(grp->pcpu_sched, i));
-				a_occ += occ;
-				if (occ > m_occ) {
-					m_occ = occ;
-					m_cpu = i;
-				}
-
+			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
 				/*
 				 * rcu_access_pointer() is used because the
 				 * pointer is only compared, never dereferenced.
@@ -2117,6 +2097,15 @@ static void task_cache_work(struct callback_head *work)
 				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
 				    rcu_access_pointer(cur->sched_cache_grp) == grp)
 					nr_running++;
+
+				occ = fraction_mm_sched(i, grp);
+				if (occ == 0)
+					continue;
+				a_occ += occ;
+				if (occ > m_occ) {
+					m_occ = occ;
+					m_cpu = i;
+				}
 			}
 
 			/*
-- 
2.34.1

