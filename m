Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.94.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393118;
	b=YPLcuz3AxdxSY5ph/Auh0eg+2BTGuraUmMOlGHb97WB+V+v68Vd1bXELfyTxH0dZjz9r
	 E6XvfPTsHnvLhXeSOiIraMAY504N3nGBwGnIKO6JyIPtJ1kvTsrDfH2zMLfH7HBBf1qqY
	 GpOAF1kaEcmclU6YuM8gQjZ/JbmnsG6u6zc0jaREaDFoYHLLeMjhRebSHr1NxvC2r5Y0d
	 ouWQLqxvsrkHu6kag+wrj25xYw84pErQVOpXx7PIi9+ZtiTTHmi9qjs8m65CgzQ2TnMOl
	 cPKy5l9nCbZhm5OggCNcG/SMtmTEfeNYlXBJHPKk61OqO1ZDxlDmJ5+Ky2BgpqW4yJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393118;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=0soX/OEKpwt3anPtXb5M7EIYSikTnzVUML2VflrQAtM=;
	b=Ed1NVTvYvXteTvwbYWaWPApSYO6JA6RstiK71q2s53HbEukXwy7TQIf4Ualb3vpTtsTw
	 ojnePvnl3RAKJRbb27dnyG2Pew0cpP0mA+3U1tvgvbqMQE3sq/HBQ53WU4f4qiBfNne8z
	 0apswSTUYAzCaf8PCh5I2/BCxSlNDhXpUIFJVDdflI85/rQ1FlLgKqRh/XJBOLJ8JW6oc
	 0sSqEp50L9vzbxYZ2M87Gy2v9sIOlxHbpXsfvnonqmgCUdnouFl6gLfoIBW/AG0KCoSUV
	 s/rlrUdIo9xDIthTFyQTPyWU0f3NfZoSKgv0I6RbrlcPLm4OImVU87xAxNjZrQuEE6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.94.104
Received: from dggmsgout13.his.huawei.com (dggmsgout13.his.huawei.com [124.71.94.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout13.his.huawei.com (SkyGuard) with ESMTP id 4jPfv04st0z1rr1Q
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4885040CC4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:31:48 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgCHwvEGRPRqbs+8Dw--.50026S4;
	Wed, 11 Nov 2026 18:31:48 +0800 (CST)
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
Subject: [PATCH v11 2/2] -- DO NOT APPLY!!! -- sched/cache/debug: Add trace event and sched feature to track scan cost
Date: Wed, 11 Nov 2026 11:04:09 +0000
Message-Id: <20261111110409.1498035-3-luogengkun@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgCHwvEGRPRqbs+8Dw--.50026S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar13ZFW8Xr4DKr17uw1Utrb_yoWxXw17pa
	4q9rW5tF4DJF10g3y5Z395Jr15K3s3ta9rKa43G3WrAF13Kr10grWqq3ZIvrWYkwnY9a4a
	vF4DKFW2gF1UXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFSdy
	UUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

This commit re-adds get_scan_cpumasks() and introduces two sched features
as well as trace events to track the scanning cost for testing purposes.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/trace/events/sched.h | 21 +++++++++++
 kernel/sched/fair.c          | 69 +++++++++++++++++++++++++++++++++---
 kernel/sched/features.h      |  1 +
 3 files changed, 87 insertions(+), 4 deletions(-)

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
index c97f08eaa9e5..7a363da2cf63 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1807,7 +1807,7 @@ static unsigned long fraction_mm_sched(int cpu,
 	__update_mm_sched(rq, pcpu_sched);
 
 	/* Evict the CPU if this sched group has not run on it for a while */
-	if ((rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
+	if (sched_feat(SC_VISIT) && (rq->cpu_epoch - pcpu_sched->epoch_last_visit) >
 	    llc_epoch_affinity_timeout) {
 		cpumask_clear_cpu(cpu, grp->visited_cpus);
 		return 0;
@@ -1889,7 +1889,8 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		rq->cpu_runtime += delta_exec;
 		epoch = rq->cpu_epoch;
 		pcpu_sched->epoch_last_visit = epoch;
-		if (!cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
+		if (sched_feat(SC_VISIT) &&
+		    !cpumask_test_cpu(cpu_of(rq), grp->visited_cpus))
 			cpumask_set_cpu(cpu_of(rq), grp->visited_cpus);
 	}
 
@@ -1941,6 +1942,52 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
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
@@ -1963,11 +2010,13 @@ static void task_cache_work(struct callback_head *work)
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
 
@@ -2007,6 +2056,9 @@ static void task_cache_work(struct callback_head *work)
 	if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
 		return;
 
+	if (!zalloc_cpumask_var(&scan_cpus, GFP_KERNEL))
+		return;
+
 	scoped_guard (cpus_read_lock) {
 		guard(rcu)();
 
@@ -2016,7 +2068,10 @@ static void task_cache_work(struct callback_head *work)
 		 * this way has only just been used by this sched group,
 		 * so its share small, and the next scan will include it.
 		 */
-		cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
+		if (sched_feat(SC_VISIT))
+			cpumask_and(cpus, cpu_online_mask, grp->visited_cpus);
+		else
+			get_scan_cpumasks(cpus, p, grp);
 
 		for_each_cpu(cpu, cpus) {
 			/* XXX sched_cluster_active */
@@ -2027,7 +2082,11 @@ static void task_cache_work(struct callback_head *work)
 			if (!sd)
 				continue;
 
-			for_each_cpu_and(i, sched_domain_span(sd), cpus) {
+			cpumask_copy(scan_cpus, sched_domain_span(sd));
+			if (sched_feat(SC_VISIT))
+				cpumask_and(scan_cpus, scan_cpus, cpus);
+
+			for_each_cpu(i, scan_cpus) {
 				occ = fraction_mm_sched(i, grp);
 				a_occ += occ;
 				if (occ > m_occ) {
@@ -2043,6 +2102,7 @@ static void task_cache_work(struct callback_head *work)
 				if (cur && !(cur->flags & (PF_EXITING | PF_KTHREAD)) &&
 				    rcu_access_pointer(cur->sched_cache_grp) == grp)
 					nr_running++;
+				scanned++;
 			}
 
 			/*
@@ -2087,6 +2147,7 @@ static void task_cache_work(struct callback_head *work)
 	}
 
 	update_avg_scale(&grp->nr_running_avg, nr_running);
+	trace_sched_cache_scan(p, scanned);
 }
 
 void init_sched_mm(struct task_struct *p)
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 8f0dee8fc475..990714ebabfd 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -142,3 +142,4 @@ SCHED_FEAT(LATENCY_WARN, false)
  */
 SCHED_FEAT(NI_RANDOM, true)
 SCHED_FEAT(NI_RATE, true)
+SCHED_FEAT(SC_VISIT, false)
-- 
2.34.1

