Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946446;
	b=jaB1YbxNk9w7CUmjfWwTmBzZ4mu5VAJdqei/aBWMn8Rh6tAMtr1GQdlfggkiEtsen9Ck
	 kGtBlDK3iCjmoL2qBkAGwQHcjRvTBIkM26IiNdPCj0yw+ghvIEFEPEGWGcsGF7o65Ze0w
	 Aq5xjaCYxXSbK9gDmFH0kXIG7i+T0xhxWVkgndt1Np1YTfuihL3Dwuxo3rfz6zkOCXHrH
	 UkjEmLy5RSYSohWvmDpYQbgGN74K0r8lngnNaFrFko6zhs6hyEwKg/Wmu2vehSl9pcmuk
	 RvfGwrpSsJ+V+a6hCMuhrQivRVtywLFmHkYS/5h3QRHSKTPLMgduS4rK+JKnorPD5LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946446;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/M96uxG+LPNfcKQbB2Yr56H+sNCiILb6tDvkzC3V2uc=;
	b=XcvPJFxybheU9niWZq6+G5JNDsEYsMRjMo2T0DEdFijmeV3yl4u6ElezqJ1i10f7HGV4
	 zN+rF5DAB2lJws/UskPIhAoHikft4fd7pX/J40HV4qTeiy+/pLM09QBAehozHVyKeu4S7
	 +2ui2GqScCv8//SWidYl/5m3gwXMMInjM5CMT9jeE4jVRvOHzgf4NcFNhqZYGEDwUxkPp
	 eYd6zmBOR0vwIj1v/fd7PU7YBtLOR1/AXyIcMevzjWh8gxB1EqLtuge6YVMr50xNBy9qn
	 +HHvNnaHVzsxVTfobDBKjKcOgc4gyPuujZ5Fg29N2U6/RjmDiH5kbYMslBbHArQ9ZZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.77
Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com [115.124.28.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97713606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97713606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00604497-0.00136662-0.992588;FP=1429831647656267003|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045038069;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jy3YyPA_1793946437;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jy3YyPA_1793946437 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 14:27:19 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>
Subject: [PATCH v2] sched/fair: Distribute burst-woken tasks when rq depth reaches 3x average
Date: Fri,  6 Nov 2026 14:26:23 +0800
Message-ID: <20261106062623.278004-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
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

When a task burst-wakes a large number of tasks in a short period, tasks
can pile up on a single CPU regardless of whether the system has idle
CPUs or NO_HZ enabled.

During the periodic load-balance pass at the top-level domain, compute
and cache the 3x average runqueue depth threshold (floored at 3 tasks)
in root_domain, updating it only when the value changes.

In select_task_rq_fair(), before scanning domains or siblings, check if
the waking CPU's runqueue depth has reached this threshold. If so, fall
back to cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask) to
rotate waking tasks across allowed CPUs (provided the target has a
smaller queue depth) and pull back rq->next_balance to expedite the next
periodic load-balance pass.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/all/20261021125419.GK2823843@noisy.programming.kicks-ass.net/
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
Changes in v2:
- Rebase onto latest mainline (Kayra Cizmeci).
- Cache pre-calculated 3x threshold in root_domain and only WRITE_ONCE()
  when the threshold changes to avoid hotpath math and cacheline dirtying
  (K Prateek Nayak).
- Check rq_burst_overloaded() before domain walk / select_idle_sibling()
  (K Prateek Nayak).
- Expedite periodic balance via rq->next_balance gated by time_after()
  instead of walking domains on every wakeup (K Prateek Nayak, Kayra Cizmeci).
---
 kernel/sched/fair.c     | 59 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h    |  3 +++
 kernel/sched/topology.c |  2 ++
 3 files changed, 64 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..59e7511d9730 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9900,6 +9900,33 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	return target;
 }
 
+/*
+ * Check if a CPU's rq depth reaches the 3x system-wide average threshold
+ * cached in root_domain (floored at 3 tasks).
+ */
+static inline bool rq_burst_overloaded(struct rq *rq)
+{
+	if (unlikely(!rq->rd))
+		return false;
+
+	return READ_ONCE(rq->nr_running) >= READ_ONCE(rq->rd->overload_nr_threshold);
+}
+
+static inline void reset_periodic_lb_interval(int cpu)
+{
+	struct sched_domain *sd;
+	unsigned long next = jiffies + 1;
+	struct rq *rq = cpu_rq(cpu);
+
+	if (time_after(READ_ONCE(rq->next_balance), next))
+		WRITE_ONCE(rq->next_balance, next);
+
+	for_each_domain(cpu, sd) {
+		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
+			WRITE_ONCE(sd->balance_interval, sd->min_interval);
+	}
+}
+
 /*
  * select_task_rq_fair: Select target runqueue for the waking task in domains
  * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
@@ -9920,6 +9947,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
+	struct rq *target_rq;
 
 	/*
 	 * required for stable ->cpus_allowed
@@ -9942,6 +9970,17 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
 	}
 
+	target_rq = want_affine ? this_rq() : cpu_rq(prev_cpu);
+	if (unlikely(rq_burst_overloaded(target_rq))) {
+		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
+
+		if (likely(dist_cpu < nr_cpumask_bits && cpu_rq(dist_cpu)->nr_running <
+			   target_rq->nr_running)) {
+			reset_periodic_lb_interval(dist_cpu);
+			return dist_cpu;
+		}
+	}
+
 	for_each_domain(cpu, tmp) {
 		/*
 		 * If both 'cpu' and 'prev_cpu' are part of this domain,
@@ -11682,6 +11721,7 @@ struct sg_lb_stats {
 struct sd_lb_stats {
 	struct sched_group *busiest;		/* Busiest group in this sd */
 	struct sched_group *local;		/* Local group in this sd */
+	unsigned long total_nr_running;		/* Sum of nr_running in this sd */
 	unsigned long total_load;		/* Total load of all groups in sd */
 	unsigned long total_capacity;		/* Total capacity of all groups in sd */
 	unsigned long avg_load;			/* Average load across all groups in sd */
@@ -12977,6 +13017,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		/* Now, start updating sd_lb_stats */
 		sds->total_load += sgs->group_load;
 		sds->total_capacity += sgs->group_capacity;
+		sds->total_nr_running += sgs->sum_nr_running;
 
 		sum_util += sgs->group_util;
 		sg = sg->next;
@@ -12995,11 +13036,29 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
 
 	if (!env->sd->parent) {
+		unsigned int weight = cpumask_weight(env->cpus);
+
 		/* update overload indicator if we are at root domain */
 		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
 
 		/* Update over-utilization (tipping point, U >= 0) indicator */
 		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+
+		/*
+		 * We update the average task count at the top-level (root)
+		 * domain, as this incurs the least overhead and comes
+		 * closest to the ideal scenario. The trade-off is that we
+		 * must accept some temporary data inaccuracy.
+		 */
+		if (weight) {
+			unsigned long thresh;
+
+			thresh = max_t(unsigned long,
+				       (sds->total_nr_running * 3) / weight, 3);
+
+			if (READ_ONCE(env->dst_rq->rd->overload_nr_threshold) != thresh)
+				WRITE_ONCE(env->dst_rq->rd->overload_nr_threshold, thresh);
+		}
 	} else if (sg_overutilized) {
 		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
 	}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c5633524a..71d946da9600 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1096,6 +1096,9 @@ struct root_domain {
 	cpumask_var_t		rto_mask;
 	struct cpupri		cpupri;
 
+	/* 3x average per-CPU rq depth threshold for burst wakeup distribution */
+	unsigned long		overload_nr_threshold;
+
 	/*
 	 * NULL-terminated list of performance domains intersecting with the
 	 * CPUs of the rd. Protected by RCU.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..fe154dfdf23e 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -572,6 +572,8 @@ static int init_rootdomain(struct root_domain *rd)
 
 	if (cpupri_init(&rd->cpupri) != 0)
 		goto free_cpudl;
+
+	rd->overload_nr_threshold = 3;
 	return 0;
 
 free_cpudl:
-- 
2.47.3

