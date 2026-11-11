Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393119;
	b=qFgz+I9x/15yFrQ87Rn0pLzgFuvmixXNWzu1pMks76peu1v65iOdSaHVb4hC1GRBk/Iz
	 5G9uVS0JhwQIigUrEbMk8y+TyG7afQcuKEC8Mst79OB7rLr2j4n6mKdgGL4Nj9i2Qt9UH
	 22afL5/9m1LUKk3YM14ca6IfJbfUEiOO5kMYM8BaDgYUlAQXBq3+mJ7AvX4yak3k9qJTs
	 h6tvOdZlkGjWlch/yxa/rHYmrorszKMqDQ2nxp7TpOVlnzwI+ZBgN0SOLqShU3UV57TKn
	 X8PunLUNbCny4Hgke7j8KOrYuDLhVWG/G+9p541jaAxrPVvEMQjynCkbStZL7GtlVVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393119;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=N/rourQc30y+mCqyU7lF2Mx2KNcYiQI6WfYGMF55V+s=;
	b=WtgiZLoqso/a8tigIKVM0rfEfzBeEDtqBoKK+BikgG8gEybF3Z+D/zjyJYZl1tM6M5VZ
	 +rdtVrXNNWEpuiV1QAUa1he7zcH5fpbEYY8eaZV7AVD0mNwFZ7sqUh34tkrGiZkYwkTj2
	 6s5bEasPHp+hOx/UCBXUd+6wWhMzx0QaPV+jnr+bWQlHAET0yxRlTZuevb97x0ZfNyok2
	 55O39zYP3Iy/fyF9Ouod5boV3zfG/A7h+naSXxmbDO/saC3Euk5ywpRZ/JE7MvU9dVYem
	 3w15lrQqjAISvVh7S3kCe7pfl0y3IsW/82QDN9jAeoDfYzx0Pyp2mdxV2/9iW1U8JJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B29606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B29606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jPfv04Wpnz1rrrw
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3AE1D40576
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:48 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgCHwvEGRPRqbs+8Dw--.50026S3;
	Wed, 11 Nov 2026 18:31:47 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kprateek.nayak@amd.com
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/2] sched/cache: Reduce the overhead of task_cache_work by only scan the visisted cpus
Date: Wed, 11 Nov 2026 11:04:08 +0000
Message-Id: <20261111110409.1498035-2-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
References: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgCHwvEGRPRqbs+8Dw--.50026S3
X-Coremail-Antispam: 1UD129KBjvAXoWfGw1xur13Xr1UXw45CF13CFg_yoW8Jw13Co
	Z0v3yrCw1xGr15Jr1DJFn3Xr1UWw42kwnrAry5Ww15GF17JF4kGr1UJrnruF15JF45tF4D
	Aa48tws8ArW7Gw18n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOb7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr
	4l82xGYIkIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2HGQ
	DUUUU
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

Below are the Redis test results conducted on AMD server.

When NUMA balancing is disabled:

  valkey-benchmark rps  |      baseline       |         schedcache              |     schedcache_visit
                        |  (no cache aware)   |    (without this series)        |     (with this series)
  ----------------------+---------------------+---------------------+-----------+-------------------+--------
                        |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(%) |   p99 latency(ms) |  DIFF(%)
  400000                |      0.436          |        0.554        |   -25.68% |         0.441     |   -1.14%

  Additionally, the output of perf top -e cycles:k highlights the overhead
  incurred by task_cache_work():

  valkey-benchmark rps  |         schedcache                        |     schedcache_visit
                        |    (without this series)                  |     (with this series)
  ----------------------+-------------------------------------------+---------------------------------------
  400000                |  0.81%  [kernel]  [k] task_cache_work     |  0.02%  [kernel]  [k] task_cache_work

The trace data is shown below:

echo NO_SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-24660   [195] .....  2916.005989: sched_cache_scan: comm=redis-server pid=24660 scan=384
 valkey-benchmar-48836   [317] .....  2916.005993: sched_cache_scan: comm=valkey-benchmar pid=48836 scan=384
 valkey-benchmar-48487   [310] .....  2916.006002: sched_cache_scan: comm=valkey-benchmar pid=48487 scan=384

echo SC_VISIT > /sys/kernel/debug/sched/features
    redis-server-29080   [225] .....  2876.257909: sched_cache_scan: comm=redis-server pid=29080 scan=14
    redis-server-26694   [018] .....  2876.257909: sched_cache_scan: comm=redis-server pid=26694 scan=13
 valkey-benchmar-48198   [103] .....  2876.257909: sched_cache_scan: comm=valkey-benchmar pid=48198 scan=16

The above results show that this series significantly reduces the overhead
of task_cache_work() by decreasing the number of CPUs that need to be
scanned, from 384 to 16, when NUMA balancing is disabled.

Even with NUMA balancing enabled, this patch provides better performance
benefits. The following tests were conducted with NUMA balancing enabled:

  valkey-benchmark rps  |      baseline       |         schedcache              |     schedcache_visit
                        |  (no cache aware)   |    (without this series)        |     (with this series)
  ----------------------+---------------------+---------------------+-----------+-------------------+--------
                        |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(%) |   p99 latency(ms) |  DIFF(%)
  400000                |      0.437          |        0.454        |   -3.89%  |         0.442     |   -1.14%

  The overhead of task_cache_work() is as follows:

  valkey-benchmark rps  |         schedcache                        |     schedcache_visit
                        |    (without this series)                  |     (with this series)
  ----------------------+-------------------------------------------+---------------------------------------
  400000                |  0.13%  [kernel]  [k] task_cache_work     |  0.03%  [kernel]  [k] task_cache_work

Hackbench testing was also conducted. The results below show that this
series does not affect the accuracy of cache-aware scheduling.

  =========================================
  Hackbench Comparison: baseline vs schedcache
  =========================================
  MODE       GROUPS  FDS |     baseline(std)  |  schedcache(std)   |    DIFF(%) | VERDICT
  ---------- ------ -----+--------------------+--------------------+------------+-----------
  threads         1   10 |    113.200 (4.22%) |     67.300 (1.32%) |     40.55% | IMPROVED
  threads         1    2 |     16.555 (4.11%) |     11.020 (1.66%) |     33.43% | IMPROVED
  threads         1   20 |    250.774 (1.26%) |    265.026 (5.44%) |     -5.68% | REGRESSED
  threads         1    4 |     42.117 (1.44%) |     27.758 (1.64%) |     34.09% | IMPROVED
  threads         1    6 |     65.140 (4.31%) |     39.182 (1.38%) |     39.85% | IMPROVED
  threads         1    8 |     84.286 (1.29%) |     53.721 (1.58%) |     36.26% | IMPROVED
  threads         2   10 |    122.592 (0.44%) |    113.365 (4.93%) |      7.53% | IMPROVED
  threads         2    2 |     17.702 (4.09%) |     10.473 (0.42%) |     40.84% | IMPROVED
  threads         2   20 |    336.457 (1.77%) |    314.108 (1.51%) |      6.64% | IMPROVED
  threads         2    4 |     43.989 (0.88%) |     27.067 (3.38%) |     38.47% | IMPROVED
  threads         2    6 |     69.322 (0.85%) |     41.707 (4.19%) |     39.84% | IMPROVED
  threads         2    8 |    103.767 (1.81%) |     58.518 (3.00%) |     43.61% | IMPROVED
  threads         4   10 |    148.882 (3.56%) |    149.449 (1.06%) |     -0.38% | REGRESSED
  threads         4    2 |     18.909 (2.96%) |     11.063 (2.08%) |     41.49% | IMPROVED
  threads         4   20 |    724.943 (2.14%) |    631.222 (3.92%) |     12.93% | IMPROVED
  threads         4    4 |     48.191 (1.91%) |     27.352 (5.35%) |     43.24% | IMPROVED
  threads         4    6 |     79.725 (3.84%) |     78.732 (4.10%) |      1.25% | IMPROVED
  threads         4    8 |    108.768 (1.36%) |    105.928 (1.65%) |      2.61% | IMPROVED

  Hackbench Comparison: schedcache vs schedcache_visit
  =========================================
  MODE       GROUPS  FDS |    schedcache(std) |schedcache_visit(std) | DIFF(%) | VERDICT
  ---------- ------ -----+--------------------+----------------------+---------+-----------
  threads         1   10 |     67.300 (1.32%) |     67.014 (0.96%)   |   0.42% | IMPROVED
  threads         1    2 |     11.020 (1.66%) |     10.557 (1.46%)   |   4.20% | IMPROVED
  threads         1   20 |    265.026 (5.44%) |   212.366 (16.32%)   |  19.87% | IMPROVED
  threads         1    4 |     27.758 (1.64%) |     25.711 (1.32%)   |   7.37% | IMPROVED
  threads         1    6 |     39.182 (1.38%) |     38.914 (0.34%)   |   0.68% | IMPROVED
  threads         1    8 |     53.721 (1.58%) |     52.889 (0.27%)   |   1.55% | IMPROVED
  threads         2   10 |    121.203 (6.99%) |    124.254 (1.38%)   |  -2.52% | REGRESSED
  threads         2    2 |     10.473 (0.42%) |     11.206 (5.91%)   |  -7.00% | REGRESSED
  threads         2   20 |    314.108 (1.51%) |    301.754 (1.95%)   |   3.93% | IMPROVED
  threads         2    4 |     27.067 (3.38%) |     28.028 (2.01%)   |  -3.55% | REGRESSED
  threads         2    6 |     41.707 (4.19%) |     42.149 (3.35%)   |  -1.06% | REGRESSED
  threads         2    8 |     58.518 (3.00%) |     57.133 (4.39%)   |   2.37% | IMPROVED
  threads         4   10 |    149.449 (1.06%) |    141.407 (0.08%)   |   5.38% | IMPROVED
  threads         4    2 |     11.063 (2.08%) |     11.360 (5.85%)   |  -2.68% | REGRESSED
  threads         4   20 |    631.222 (3.92%) |    622.780 (2.49%)   |   1.34% | IMPROVED
  threads         4    4 |     27.352 (5.35%) |     27.947 (5.37%)   |  -2.18% | REGRESSED
  threads         4    6 |     78.732 (4.10%) |     73.911 (0.70%)   |   6.12% | IMPROVED
  threads         4    8 |    105.928 (1.65%) |    107.535 (3.29%)   |  -1.52% | REGRESSED

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/sched.h |  2 +
 kernel/sched/fair.c   | 99 ++++++++++++++++++-------------------------
 2 files changed, 43 insertions(+), 58 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..1b08925c6358 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2385,6 +2385,7 @@ static __always_inline int task_mm_cid(struct task_struct *t)
 struct sched_cache_time {
 	u64 runtime;
 	unsigned long epoch;
+	unsigned long epoch_last_visit;
 };
 
 struct sched_cache_group {
@@ -2397,6 +2398,7 @@ struct sched_cache_group {
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
+	cpumask_var_t visited_cpus;
 } ____cacheline_aligned_in_smp;
 
 struct sched_cache_group *sched_cache_group_get(struct sched_cache_group *grp);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a4fd7f..c97f08eaa9e5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1599,11 +1599,11 @@ int mm_init_sched(struct mm_struct *mm,
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
@@ -1612,6 +1612,7 @@ int mm_init_sched(struct mm_struct *mm,
 		pcpu_sched->runtime = 0;
 		/* a slightly stale cpu epoch is acceptible */
 		pcpu_sched->epoch = rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit = rq->cpu_epoch;
 		epoch = rq->cpu_epoch;
 	}
 
@@ -1637,6 +1638,14 @@ int mm_init_sched(struct mm_struct *mm,
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
@@ -1645,6 +1654,7 @@ static void sched_cache_group_free_rcu(struct rcu_head *rcu)
 		container_of(rcu, struct sched_cache_group, rcu);
 
 	free_percpu(grp->pcpu_sched);
+	free_cpumask_var(grp->visited_cpus);
 	kfree(grp);
 }
 
@@ -1785,13 +1795,24 @@ static inline void __update_mm_sched(struct rq *rq,
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
 
+	/* Evict the CPU if this sched group has not run on it for a while */
+	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
+	    llc_epoch_affinity_timeout) {
+		cpumask_clear_cpu(cpu, grp->visited_cpus);
+		return 0;
+	}
+
 	/*
 	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
 	 * the accumulation period, this means the multiplcation here should
@@ -1867,6 +1888,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		pcpu_sched->runtime += delta_exec;
 		rq->cpu_runtime += delta_exec;
 		epoch = rq->cpu_epoch;
+		pcpu_sched->epoch_last_visit = epoch;
+		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
+			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
 	}
 
 	/*
@@ -1917,52 +1941,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
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
@@ -2011,7 +1989,7 @@ static void task_cache_work(struct callback_head *work)
 	if (time_before(now, next_scan))
 		return;
 
-	/* only 1 thread is allowed to scan */
+	/* elect a single scanner per epoch */
 	if (!try_cmpxchg(&grp->next_scan, &next_scan,
 			 now + max_t(unsigned long,
 				     READ_ONCE(llc_epoch_period), 1)))
@@ -2032,7 +2010,13 @@ static void task_cache_work(struct callback_head *work)
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
-		get_scan_cpumasks(cpus, p, grp);
+		/*
+		 * account_mm_sched() can set a bit in visited_cpus while
+		 * it is read here locklessly for efficiency. A CPU missed
+		 * this way has only just been used by this sched group,
+		 * so its share small, and the next scan will include it.
+		 */
+		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
 
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -2043,9 +2027,8 @@ static void task_cache_work(struct callback_head *work)
 			if (!sd)
 				continue;
 
-			for_each_cpu(i, sched_domain_span(sd)) {
-				occ = fraction_mm_sched(cpu_rq(i),
-							per_cpu_ptr(grp->pcpu_sched, i));
+			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
+				occ = fraction_mm_sched(i, grp);
 				a_occ += occ;
 				if (occ > m_occ) {
 					m_occ = occ;
-- 
2.34.1

