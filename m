Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160929;
	b=DPodUI3KFyCMCXYj47SyhCtjyIgu3Y8Tr2vAba+3jvClqqVlN8sM1dHJgxv24r9/ynSn
	 Y6yXkz/nJ2REcmo51pk9sykRQ7Ce1rImW26qRVo9hsoSng326ulhMZFWTWuIsZuH5dBzv
	 61iP8DXBFa97YEFXWuxsg6Yw6mS1WE9XH3pDeGpMiEfeLy2ZIqjGMGFTYLhH7U8Lxhq9T
	 Wiqk1uHJVFmjcR9VxRwEoFdhqv+8GwrWaX/lZKxXm69Iy+5dza3jtbI90RXWoBG/CH3hD
	 q2qLX1Iu37lLf1L40Vuns3mVmQ4GoNwzUZxtnfxcj3ZOPEeHz/XHL3/K2mrk+iph4aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160929;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:X-Mailer:Cc:From:Date:
	 Message-Id:X-Lms-Return-Path:Subject:Mime-Version:In-Reply-To:
	 Content-Transfer-Encoding:References:Content-Type:To;
	bh=EfDs06NpzHyL1TD0z072gNMA7YWDkCnN/RbTxmf/C60=;
	b=bplqLa8lD57dZDvePgQWruiA2eb40s8sfwHgciFvrFFCvyoaQzop5ZMxlPgCk4sCak0j
	 WEro9oTwSnFj4aPTYh6GlMyAKoes3rEWPW6NoiGS/vPYcqCUmldXPmgmqfq7b2GCX8+7Z
	 vlK1NDJQ8t7Q/5L5FBgU0SXwWrsKol6mGC3Z7Y94/kFwgQs0rpOx8ZTFwKDdj+u2Ov4q4
	 6MQbrswcyN5zqjHSCA7dR/V4y8TXzjBfOmH00hMGh3oHzpe/phC9OULxJdF1hEEgHtEYZ
	 jZmp35FE7NYns8B27VcCcew4jDRDMRK/cyBnvwkALgnyyLkCnxWIjdu73hKLNprqd7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mP0ywnjY;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F8606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mP0ywnjY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793160919; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EfDs06NpzHyL1TD0z072gNMA7YWDkCnN/RbTxmf/C60=;
 b=mP0ywnjY0MiBeKD+TLL/PcteYTbXxRJD97x5jkUgYiS7WyPZdzeL+zXUDCW3mkNUBE2COq
 CbbtT0Nd24bmvvYYepNaRU6venqLfBQRsSUnt/6czk3jR9TKQF1Gb0epEhi6Fea/+CT/QZ
 qXui/qTNMNCB62rIGalLEjXSB2vraaBgDPnw2O5GcvyFyGkqpPBgSuAkhZoSneuQV989wA
 GZC7vvEOGN21NbgsD7H5cZYq3nAOqJE+4J64BgRuVr0Ec0GVZ+thjxsFLK4jtLMZQbBWbS
 TXrlBtdByJYN4z5O99qkJjr/cv/KTcnXm3F2FScaceZXtHqmx7SR7ydSpzIUeA==
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 28 Oct 2026 12:12:53 +0800
Message-Id: <20261028041253.74839-4-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26ae176d5+049aba+vger.kernel.org+lizhe.67@bytedance.com>
Subject: [PATCH v2 3/3] sched/numa: fix scan-period adjustment for tiering-only mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261028041253.74839-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>

When automatic NUMA balancing runs in memory-tiering-only mode, NUMA hint
faults identify slow-memory pages that are worth promoting. They are not
normal task-placement feedback.

Without separate tiering feedback, successful tiering promotions are fed
to update_task_scan_period() as private remote faults. That leaves
local == 0 and shared == 0, so the function hits its early slow-down path
and doubles p->numa_scan_period. Repeated promotion feedback can therefore
drive the scan period towards the maximum.

Track memory-tiering feedback separately from normal task-placement stats.
Successful free-space bypass promotions are not counted as tiering scan
feedback because they did not pass the hotness and rate-limit checks. Cold,
hot, and throttled feedback is generated only by the hotness/rate-limit
path, while migration failures slow scanning like the normal placement
heuristic does.

Use the same 70% threshold style as the normal scan-period heuristic. A
hot-dominated window speeds scanning up, a cold-dominated window slows it
down, and a throttled ratio of at least 30% also slows it down. If a
window has no tiering feedback, for example because promotions used the
free-space bypass, double the scan period, following the same
no-useful-signal slow-down direction as normal scan-period adjustment.

Evaluate the tiering window when a scan sequence completes as well as when
tiering faults are reported. This lets an empty window back off the scan
period after qualifying tiering feedback stops.

On a CXL system with node0 as DRAM and node3 as slow-tier memory, a
STREAM Triad-derived OpenMP workload was used to model a
bandwidth-sensitive working-set shift. It first accessed one 100G range,
then switched to another 100G range. The workload was first-touch placed
on node3 and then run from node0 with memory-tiering-only mode enabled.

With the free-space bypass disabled, so that promotions have to pass the
hotness and rate-limit checks, a kernel with only the bypass control was
used as the no-feedback baseline. Tiering scan-period feedback improved
the transition window after the active range switch:

                              no feedback       tiering feedback
  first 80s after switch       122.4 GB/s             129.3 GB/s  (+5.7%)
  200-240s after switch        139.9 GB/s             140.6 GB/s  (+0.5%)

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/sched.h                |  17 ++++
 include/linux/sched/numa_balancing.h |   9 +++
 kernel/sched/fair.c                  | 113 ++++++++++++++++++++++++++-
 3 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e..c4959747374b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -833,6 +833,16 @@ struct task_ipi_mask {
 struct task_ipi_mask { };
 #endif
 
+#ifdef CONFIG_NUMA_BALANCING
+enum numa_tiering_fault_stats {
+	NUMA_TIERING_FAULT_COLD,
+	NUMA_TIERING_FAULT_HOT,
+	NUMA_TIERING_FAULT_THROTTLED,
+	NUMA_TIERING_FAULT_MIGRATE_FAIL,
+	NR_NUMA_TIERING_FAULT_STATS
+};
+#endif
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
@@ -1433,6 +1443,13 @@ struct task_struct {
 	 */
 	unsigned long			numa_faults_locality[3];
 
+	/*
+	 * Memory tiering faults are tracked separately from normal NUMA
+	 * placement statistics. In tiering-only mode, slow-memory hint faults
+	 * are used to decide promotion, not task placement.
+	 */
+	unsigned long			numa_tiering_faults[NR_NUMA_TIERING_FAULT_STATS];
+
 	unsigned long			numa_pages_migrated;
 #endif /* CONFIG_NUMA_BALANCING */
 
diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched/numa_balancing.h
index 200f50075d5c..12f31ed56d66 100644
--- a/include/linux/sched/numa_balancing.h
+++ b/include/linux/sched/numa_balancing.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/sched.h>
+#include <linux/sched/sysctl.h>
 
 #define TNF_MIGRATED	0x01
 #define TNF_NO_GROUP	0x02
@@ -16,6 +17,14 @@
 #define TNF_MIGRATE_FAIL 0x10
 #define TNF_ACCESS_TIME	0x20
 
+static inline bool numa_balancing_tiering_only(void)
+{
+	int mode = sysctl_numa_balancing_mode;
+
+	return (mode & NUMA_BALANCING_MEMORY_TIERING) &&
+	       !(mode & NUMA_BALANCING_NORMAL);
+}
+
 enum numa_vmaskip_reason {
 	NUMAB_SKIP_UNSUITABLE,
 	NUMAB_SKIP_SHARED_RO,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 136207b62d87..1d9efc2b7427 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2760,6 +2760,32 @@ static inline bool cpupid_valid(int cpupid)
 	return cpupid_to_cpu(cpupid) < nr_cpu_ids;
 }
 
+static void task_numa_tiering_placement(struct task_struct *p);
+
+static bool task_numa_tiering_update(struct task_struct *p)
+{
+	if (!numa_balancing_tiering_only() || !p->mm)
+		return false;
+
+	task_numa_tiering_placement(p);
+	return true;
+}
+
+static void task_numa_tiering_no_feedback(struct task_struct *p)
+{
+	task_numa_tiering_update(p);
+}
+
+static void task_numa_tiering_fault(struct task_struct *p,
+				    enum numa_tiering_fault_stats stat,
+				    unsigned long pages)
+{
+	if (!task_numa_tiering_update(p))
+		return;
+
+	p->numa_tiering_faults[stat] += pages;
+}
+
 /*
  * For memory tiering mode, if the target fast memory node has enough free
  * pages, recently accessed slow memory pages can bypass the normal hotness
@@ -2887,6 +2913,7 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		pgdat = NODE_DATA(dst_nid);
 		if (numa_balancing_promote_free_space_bypass &&
 		    pgdat_free_space_enough(pgdat)) {
+			task_numa_tiering_no_feedback(p);
 			/* workload changed, reset hot threshold */
 			pgdat->nbp_threshold = 0;
 			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE_NRL, nr);
@@ -2899,10 +2926,18 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 
 		th = pgdat->nbp_threshold ? : def_th;
 		latency = numa_hint_fault_latency(folio);
-		if (latency >= th)
+		if (latency >= th) {
+			task_numa_tiering_fault(p, NUMA_TIERING_FAULT_COLD, nr);
+			return false;
+		}
+
+		if (numa_promotion_rate_limit(pgdat, rate_limit, nr)) {
+			task_numa_tiering_fault(p, NUMA_TIERING_FAULT_THROTTLED, nr);
 			return false;
+		}
 
-		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
+		task_numa_tiering_fault(p, NUMA_TIERING_FAULT_HOT, nr);
+		return true;
 	}
 
 	this_cpupid = cpu_pid_to_cpupid(dst_cpu, current->pid);
@@ -3708,6 +3743,48 @@ static void update_task_scan_period(struct task_struct *p,
 	       sizeof(p->numa_faults_locality));
 }
 
+/*
+ * Memory tiering uses NUMA hint faults to identify recently accessed slow
+ * memory that should be promoted. In tiering-only mode, those faults are not
+ * normal task-placement feedback, so use tiering-specific outcomes to adjust
+ * the scan period.
+ */
+static void update_task_tiering_scan_period(struct task_struct *p)
+{
+	unsigned long cold, hot, throttled, failed;
+	unsigned long total;
+	s64 period, period_slot;
+	s64 diff = 0;
+
+	cold = p->numa_tiering_faults[NUMA_TIERING_FAULT_COLD];
+	hot = p->numa_tiering_faults[NUMA_TIERING_FAULT_HOT];
+	throttled = p->numa_tiering_faults[NUMA_TIERING_FAULT_THROTTLED];
+	failed = p->numa_tiering_faults[NUMA_TIERING_FAULT_MIGRATE_FAIL];
+	total = cold + hot + throttled + failed;
+
+	period = p->numa_scan_period;
+	period_slot = DIV_ROUND_UP_ULL(period, NUMA_PERIOD_SLOTS);
+
+	if (!total) {
+		diff = period;
+	} else if (failed) {
+		diff = period_slot;
+	} else if (throttled * NUMA_PERIOD_SLOTS >=
+		   total * (NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD)) {
+		diff = period_slot;
+	} else if (cold * NUMA_PERIOD_SLOTS >=
+		   total * NUMA_PERIOD_THRESHOLD) {
+		diff = period_slot;
+	} else if (hot * NUMA_PERIOD_SLOTS >=
+		   total * NUMA_PERIOD_THRESHOLD) {
+		diff = -period_slot;
+	}
+
+	p->numa_scan_period = clamp_t(s64, period + diff,
+				      task_scan_min(p), task_scan_max(p));
+	memset(p->numa_tiering_faults, 0, sizeof(p->numa_tiering_faults));
+}
+
 /*
  * Get the fraction of time the task has been running since the last
  * NUMA placement cycle. The scheduler keeps similar statistics, but
@@ -3974,6 +4051,22 @@ static void task_numa_placement(struct task_struct *p)
 	update_task_scan_period(p, fault_types[0], fault_types[1]);
 }
 
+static void task_numa_tiering_placement(struct task_struct *p)
+{
+	int seq;
+
+	if (!p->mm)
+		return;
+
+	seq = READ_ONCE(p->mm->numa_scan_seq);
+	if (p->numa_scan_seq == seq)
+		return;
+	p->numa_scan_seq = seq;
+	p->numa_scan_period_max = task_scan_max(p);
+
+	update_task_tiering_scan_period(p);
+}
+
 static inline int get_numa_group(struct numa_group *grp)
 {
 	return refcount_inc_not_zero(&grp->refcount);
@@ -4105,6 +4198,8 @@ void task_numa_free(struct task_struct *p, bool final)
 	unsigned long flags;
 	int i;
 
+	memset(p->numa_tiering_faults, 0, sizeof(p->numa_tiering_faults));
+
 	if (!numa_faults)
 		return;
 
@@ -4158,6 +4253,11 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL)) {
 			if (migrated)
 				p->numa_pages_migrated += pages;
+			if (numa_balancing_tiering_only() &&
+			    (flags & TNF_MIGRATE_FAIL))
+				task_numa_tiering_fault(p,
+						NUMA_TIERING_FAULT_MIGRATE_FAIL,
+						pages);
 			return;
 		}
 	}
@@ -4529,6 +4629,14 @@ static void task_numa_work(struct callback_head *work)
 		reset_ptenuma_scan(p);
 	mmap_read_unlock(mm);
 
+	/*
+	 * Tiering-only placement feedback is still scan-window based. Consume
+	 * the window when a scan sequence completes, so an empty tiering
+	 * window can back off after qualifying tiering faults stop.
+	 */
+	if (numa_balancing_tiering_only())
+		task_numa_tiering_placement(p);
+
 	/*
 	 * Make sure tasks use at least 32x as much time to run other code
 	 * than they used here, to limit NUMA PTE scanning overhead to 3% max.
@@ -4562,6 +4670,7 @@ void init_numa_balancing(u64 clone_flags, struct task_struct *p)
 	p->numa_faults			= NULL;
 	p->numa_pages_migrated		= 0;
 	p->total_numa_faults		= 0;
+	memset(p->numa_tiering_faults, 0, sizeof(p->numa_tiering_faults));
 	RCU_INIT_POINTER(p->numa_group, NULL);
 	p->last_task_numa_placement	= 0;
 	p->last_sum_exec_runtime	= 0;
-- 
2.20.1
