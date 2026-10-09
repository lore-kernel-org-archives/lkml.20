Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518F3CB55E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577852; cv=none; b=MvfzvM7u92hCbLXQ3yoZCkAPdvKyYW/MAHZd4YT/I1Y618pl6VFksw48fV7OiDDbQD2U5jVcqRALVJVZxqRuU6dgxtTFsVotoud1OGiwDUwGd8LCaZPhwkfwi5HSGEQiPl3GRxQULonMzmBXbR0ZDxDVL0hMR9X4l+sYIsAEm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577852; c=relaxed/simple;
	bh=Oqdr2YNi3h9r+nP/wCSVGZDw1Dh/vJJuFT5lGCbowfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ3jYSVE/B7FxHtmD0y0/qekOXE3Qsesdfb09IXgtFoe8VcD86rI8pq9xh+A8+Etji7YgFq7abkpjWmHoEJEiqTVaouiZreaXtAE1ybnrBXUrKSCzN1GL0nB4iWu8kA7SHnK5Z6dbVkzPfJ8Ro9ijfdOo7V5GLFLiq+EbJJAerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5/pgoID; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5/pgoID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577850; x=1823113850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oqdr2YNi3h9r+nP/wCSVGZDw1Dh/vJJuFT5lGCbowfM=;
  b=h5/pgoIDrUiD17/U+BSjTsoVkjEO8fqZBcLH+2yDcjLLmvEm5P41HYL6
   DMZoDwEbHo5IIrjIgWlLXZWBxgzZT0Ei31qCofLR6Ls46UcQPBIcvlJpC
   /JV7raQKVmxdP4cFWAh3rgJlqk0SrikgvJkRF4DQzMLO75Ip9K3vOMAh5
   T2Vwhmd3WeUrdI88ThyExuGBxU3JxiWgIN3VvC3hDe+IZEhsdwjIpLVU7
   x0GbIlBWK0HskI5iPhy6Gg1wnp/ltl8X09RgqbXpRrIRGWLZvZ7pZJLbw
   bVCh230TKsEk42orUDx7ueJ+TrTiW54iT0KEnOxuKMT1hGFe5RUReJbS2
   w==;
X-CSE-ConnectionGUID: GmPpn8xETD63Bg1XeT1UdQ==
X-CSE-MsgGUID: fadd6SHMRDi6LHLPrIcKuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284567"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284567"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:30:49 -0700
X-CSE-ConnectionGUID: v8YgFCRcQeKckb6P9Msb+g==
X-CSE-MsgGUID: RYt/YHdYRCWYrOO0ly8FFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2193199"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 13:30:49 -0700
From: Ehab Ababneh <ehab.ababneh@intel.com>
To: ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: buddy.lumpkin@oracle.com,
	akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	Ehab Ababneh <ehab.ababneh@intel.com>
Subject: [RFC PATCH v2 3/5] mm/vmscan: make kswapd wakeups NUMA load-aware
Date: Fri,  9 Oct 2026 13:33:02 -0700
Message-ID: <2f355440add02a2a89bfab84db9306bc2fe91096.1791577417.git.ehab.ababneh@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791577417.git.ehab.ababneh@intel.com>
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com> <cover.1791577417.git.ehab.ababneh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track a per-node 10-second rolling average of idle CPU cores and use
it in wakeup_kswapd() to decide how many kswapd threads to wake.

A background worker samples the number of idle cores on each NUMA node
once per second (node_cores - nr_running, clamped to zero) and maintains
a rolling average over a 10-second window. When memory pressure triggers
a wakeup, the number of kswapd threads woken is capped to that average
so reclaim scales with available CPU capacity.

On a lightly loaded node most cores are idle, so more threads wake and
reclaim can proceed quickly. On a saturated node few cores are idle, so
fewer threads wake, avoiding unnecessary scheduling contention that
would compete with the workload already running there.

Signed-off-by: Ehab Ababneh <ehab.ababneh@intel.com>
(cherry picked from commit a4a9892bc8b95ff0d527a1ba47d2b40c222e9b00)
---
 include/trace/events/vmscan.h |  32 ++++
 mm/internal.h                 |   4 +-
 mm/page_alloc.c               |  16 +-
 mm/vmscan.c                   | 349 +++++++++++++++++++++++++++++++---
 4 files changed, 369 insertions(+), 32 deletions(-)

diff --git a/include/trace/events/vmscan.h b/include/trace/events/vmscan.h
index b4bf7b8def1f..6fd87d811e98 100644
--- a/include/trace/events/vmscan.h
+++ b/include/trace/events/vmscan.h
@@ -174,6 +174,38 @@ TRACE_EVENT(mm_vmscan_wakeup_kswapd,
 		show_gfp_flags(__entry->gfp_flags))
 );
 
+TRACE_EVENT(mm_vmscan_kswapd_threads_to_wake,
+
+	TP_PROTO(int nid, int threads_to_wake, int threads_woken,
+		 int node_cpus, int avg_idle_cores),
+
+	TP_ARGS(nid, threads_to_wake, threads_woken, node_cpus,
+		avg_idle_cores),
+
+	TP_STRUCT__entry(
+		__field(int,	 nid)
+		__field(int,	 threads_to_wake)
+		__field(int,	 threads_woken)
+		__field(int,	 node_cpus)
+		__field(int,	 avg_idle_cores)
+	),
+
+	TP_fast_assign(
+		__entry->nid			= nid;
+		__entry->threads_to_wake	= threads_to_wake;
+		__entry->threads_woken		= threads_woken;
+		__entry->node_cpus		= node_cpus;
+		__entry->avg_idle_cores		= avg_idle_cores;
+	),
+
+	TP_printk("nid=%d threads_to_wake=%d threads_woken=%d node_cpus=%d avg_idle_cores=%d",
+		  __entry->nid,
+		  __entry->threads_to_wake,
+		  __entry->threads_woken,
+		  __entry->node_cpus,
+		  __entry->avg_idle_cores)
+);
+
 DECLARE_EVENT_CLASS(mm_vmscan_direct_reclaim_begin_template,
 
 	TP_PROTO(gfp_t gfp_flags, int order, struct mem_cgroup *memcg),
diff --git a/mm/internal.h b/mm/internal.h
index 37f8ccfd661a..1417c5b718ff 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -717,13 +717,13 @@ void set_recommended_min_free_kbytes(void);
 
 extern char * const zone_names[MAX_NR_ZONES];
 
-extern int kswapd_threads;
+extern int max_kswapds_per_node;
 extern int max_kswapd_threads;
 extern int min_free_kbytes;
 extern int defrag_mode;
 
 void setup_per_zone_wmarks(void);
-void update_kswapd_threads(void);
+void update_max_kswapds_per_node(void);
 void calculate_min_free_kbytes(void);
 int __meminit init_per_zone_wmark_min(void);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8c8da506ac50..d56273f8c7de 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6778,9 +6778,9 @@ static int min_free_kbytes_sysctl_handler(const struct ctl_table *table, int wri
 	return 0;
 }
 
-static int kswapd_threads_sysctl_handler(const struct ctl_table *table,
-					 int write, void __user *buffer,
-					 size_t *length, loff_t *ppos)
+static int max_kswapds_per_node_sysctl_handler(const struct ctl_table *table,
+					       int write, void __user *buffer,
+					       size_t *length, loff_t *ppos)
 {
 	int rc;
 
@@ -6789,7 +6789,7 @@ static int kswapd_threads_sysctl_handler(const struct ctl_table *table,
 		return rc;
 
 	if (write)
-		update_kswapd_threads();
+		update_max_kswapds_per_node();
 
 	return 0;
 }
@@ -6968,11 +6968,11 @@ static const struct ctl_table page_alloc_sysctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 	},
 	{
-		.procname       = "kswapd_threads",
-		.data           = &kswapd_threads,
-		.maxlen         = sizeof(kswapd_threads),
+		.procname       = "max_kswapds_per_node",
+		.data           = &max_kswapds_per_node,
+		.maxlen         = sizeof(max_kswapds_per_node),
 		.mode           = 0644,
-		.proc_handler   = kswapd_threads_sysctl_handler,
+		.proc_handler   = max_kswapds_per_node_sysctl_handler,
 		.extra1         = SYSCTL_ONE,
 		.extra2         = &max_kswapd_threads,
 	},
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 107011f51fef..95cf20183efc 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -32,6 +32,7 @@
 #include <linux/rmap.h>
 #include <linux/topology.h>
 #include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
 #include <linux/cpuset.h>
 #include <linux/compaction.h>
 #include <linux/notifier.h>
@@ -59,12 +60,14 @@
 #include <linux/mmu_notifier.h>
 #include <linux/parser.h>
 #include <linux/swap_ops.h>
+#include <linux/smp.h>
 
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
 #include <linux/sched/sysctl.h>
+#include <linux/slab.h>
 
 #include "internal.h"
 #include "page_alloc.h"
@@ -182,11 +185,283 @@ struct scan_control {
 };
 
 /*
- * Number of active kswapd threads
+ * Max and current number of kswapd threads per node.
  */
-#define DEF_KSWAPD_THREADS_PER_NODE 1
-int kswapd_threads = DEF_KSWAPD_THREADS_PER_NODE;
-int kswapd_threads_current = DEF_KSWAPD_THREADS_PER_NODE;
+#define DEF_MAX_KSWAPDS_PER_NODE 1
+int max_kswapds_per_node = DEF_MAX_KSWAPDS_PER_NODE;
+int current_kswapds_per_node = DEF_MAX_KSWAPDS_PER_NODE;
+
+#ifdef CONFIG_NUMA
+/*
+ * Per-node 10-second rolling average of idle CPU cores.
+ * Sampled once per second; used by wakeup_kswapd() to decide how many
+ * kswapd threads to wake without adding contention on a loaded node.
+ */
+#define KSWAPD_NUMA_AVG_WINDOW	10
+
+struct kswapd_node_idle_avg {
+	u32	samples[KSWAPD_NUMA_AVG_WINDOW];
+	u32	sum;
+	u8	idx;
+	u8	count;
+	u32	avg_idle_cores;	/* rolling average, written only by the work item */
+	int	nid;
+	int	node_cpus;	/* updated by cpuhp callbacks */
+	bool	started;
+	u64	last_sample_ns;
+	struct delayed_work work;
+};
+
+static struct kswapd_node_idle_avg *kswapd_idle_avg;
+static u64 *kswapd_prev_idle;
+static bool *kswapd_prev_idle_valid;
+
+static int kswapd_node_first_online_cpu(int nid)
+{
+	return cpumask_first_and(cpumask_of_node(nid), cpu_online_mask);
+}
+
+static u64 kswapd_read_idle_cpu(int cpu)
+{
+	if (!cpu_online(cpu))
+		return 0;
+
+	return kcpustat_field(CPUTIME_IDLE, cpu);
+}
+
+static void kswapd_idle_avg_queue_work(struct kswapd_node_idle_avg *avg)
+{
+	int cpu;
+
+	cpu = kswapd_node_first_online_cpu(avg->nid);
+	if (cpu < nr_cpu_ids)
+		queue_delayed_work_on(cpu, system_wq, &avg->work, HZ);
+}
+
+static void kswapd_idle_avg_sample_workfn(struct work_struct *work)
+{
+	struct kswapd_node_idle_avg *avg;
+	u64 now_ns, elapsed_ns;
+	u64 idle_cores_milli = 0;
+	u32 idle_cores;
+	int cpu, node_cpus;
+
+	if (!kswapd_idle_avg || !kswapd_prev_idle || !kswapd_prev_idle_valid)
+		return;
+
+	avg = container_of(to_delayed_work(work), struct kswapd_node_idle_avg,
+			   work);
+	node_cpus = 0;
+	now_ns = ktime_get_ns();
+
+	if (!avg->last_sample_ns) {
+		avg->last_sample_ns = now_ns;
+		for_each_cpu(cpu, cpumask_of_node(avg->nid)) {
+			if (!cpu_online(cpu))
+				continue;
+			kswapd_prev_idle[cpu] = kswapd_read_idle_cpu(cpu);
+			kswapd_prev_idle_valid[cpu] = true;
+		}
+		kswapd_idle_avg_queue_work(avg);
+		return;
+	}
+
+	elapsed_ns = now_ns - avg->last_sample_ns;
+	avg->last_sample_ns = now_ns;
+
+	if (!elapsed_ns) {
+		kswapd_idle_avg_queue_work(avg);
+		return;
+	}
+
+	for_each_cpu(cpu, cpumask_of_node(avg->nid)) {
+		u64 idle_now, idle_delta;
+
+		if (!cpu_online(cpu))
+			continue;
+
+		node_cpus++;
+		idle_now = kswapd_read_idle_cpu(cpu);
+
+		if (!kswapd_prev_idle_valid[cpu]) {
+			kswapd_prev_idle_valid[cpu] = true;
+			kswapd_prev_idle[cpu] = idle_now;
+			continue;
+		}
+
+		idle_delta = idle_now - kswapd_prev_idle[cpu];
+		kswapd_prev_idle[cpu] = idle_now;
+
+		idle_cores_milli += div_u64(min(idle_delta, elapsed_ns) * 1000,
+						   elapsed_ns);
+	}
+
+	idle_cores = min_t(u32, DIV_ROUND_CLOSEST_ULL(idle_cores_milli, 1000),
+			   node_cpus);
+
+	if (avg->count == KSWAPD_NUMA_AVG_WINDOW)
+		avg->sum -= avg->samples[avg->idx];
+	else
+		avg->count++;
+
+	avg->samples[avg->idx] = idle_cores;
+	avg->sum += idle_cores;
+	avg->idx = (avg->idx + 1) % KSWAPD_NUMA_AVG_WINDOW;
+	WRITE_ONCE(avg->avg_idle_cores, DIV_ROUND_CLOSEST(avg->sum, avg->count));
+
+	if (READ_ONCE(avg->started))
+		kswapd_idle_avg_queue_work(avg);
+}
+
+static void kswapd_idle_avg_start_node(int nid)
+{
+	struct kswapd_node_idle_avg *avg;
+
+	if (!kswapd_idle_avg || nid < 0 || nid >= nr_node_ids)
+		return;
+
+	avg = &kswapd_idle_avg[nid];
+	if (READ_ONCE(avg->started))
+		return;
+
+	WRITE_ONCE(avg->started, true);
+	avg->last_sample_ns = 0;
+	kswapd_idle_avg_queue_work(avg);
+}
+
+static void kswapd_idle_avg_stop_node(int nid)
+{
+	struct kswapd_node_idle_avg *avg;
+	int cpu;
+
+	if (!kswapd_idle_avg || nid < 0 || nid >= nr_node_ids)
+		return;
+
+	avg = &kswapd_idle_avg[nid];
+	if (!READ_ONCE(avg->started))
+		return;
+
+	WRITE_ONCE(avg->started, false);
+	cancel_delayed_work_sync(&avg->work);
+
+	for_each_cpu(cpu, cpumask_of_node(nid))
+		kswapd_prev_idle_valid[cpu] = false;
+}
+
+static int kswapd_idle_avg_cpu_online(unsigned int cpu)
+{
+	if (kswapd_prev_idle_valid)
+		kswapd_prev_idle_valid[cpu] = false;
+
+	if (kswapd_idle_avg) {
+		int nid = cpu_to_node(cpu);
+
+		WRITE_ONCE(kswapd_idle_avg[nid].node_cpus,
+			   cpumask_weight_and(cpumask_of_node(nid), cpu_online_mask));
+	}
+
+	return 0;
+}
+
+static int kswapd_idle_avg_cpu_offline(unsigned int cpu)
+{
+	if (kswapd_prev_idle_valid)
+		kswapd_prev_idle_valid[cpu] = false;
+
+	if (kswapd_idle_avg) {
+		int nid = cpu_to_node(cpu);
+
+		WRITE_ONCE(kswapd_idle_avg[nid].node_cpus,
+			   cpumask_weight_and(cpumask_of_node(nid), cpu_online_mask));
+	}
+
+	return 0;
+}
+
+static u32 kswapd_node_avg_idle_cores(int nid)
+{
+	if (!kswapd_idle_avg || nid < 0 || nid >= nr_node_ids)
+		return 0;
+
+	return READ_ONCE(kswapd_idle_avg[nid].avg_idle_cores);
+}
+
+static int kswapd_node_cpu_count(int nid)
+{
+	if (!kswapd_idle_avg || nid < 0 || nid >= nr_node_ids)
+		return cpumask_weight_and(cpumask_of_node(nid), cpu_online_mask);
+
+	return READ_ONCE(kswapd_idle_avg[nid].node_cpus);
+}
+
+static void kswapd_idle_avg_init(void)
+{
+	int cpu;
+	int nid;
+	int ret;
+
+	kswapd_idle_avg = kcalloc(nr_node_ids, sizeof(*kswapd_idle_avg),
+				  GFP_KERNEL);
+	if (!kswapd_idle_avg)
+		return;
+
+	kswapd_prev_idle = kcalloc(nr_cpu_ids, sizeof(*kswapd_prev_idle),
+				   GFP_KERNEL);
+	if (!kswapd_prev_idle)
+		goto free_idle_avg;
+
+	kswapd_prev_idle_valid = kcalloc(nr_cpu_ids,
+					 sizeof(*kswapd_prev_idle_valid),
+					 GFP_KERNEL);
+	if (!kswapd_prev_idle_valid)
+		goto free_prev_idle;
+
+	for (nid = 0; nid < nr_node_ids; nid++) {
+		struct kswapd_node_idle_avg *avg = &kswapd_idle_avg[nid];
+
+		avg->nid = nid;
+		INIT_DELAYED_WORK(&avg->work, kswapd_idle_avg_sample_workfn);
+	}
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"mm/vmscan:online",
+					kswapd_idle_avg_cpu_online,
+					kswapd_idle_avg_cpu_offline);
+	if (ret < 0)
+		goto free_prev_idle_valid;
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu)
+		kswapd_idle_avg_cpu_online(cpu);
+	cpus_read_unlock();
+
+	return;
+
+free_prev_idle_valid:
+	kfree(kswapd_prev_idle_valid);
+	kswapd_prev_idle_valid = NULL;
+free_prev_idle:
+	kfree(kswapd_prev_idle);
+	kswapd_prev_idle = NULL;
+free_idle_avg:
+	kfree(kswapd_idle_avg);
+	kswapd_idle_avg = NULL;
+}
+#else
+static inline u32 kswapd_node_avg_idle_cores(int nid)
+{
+	return 0;
+}
+
+static inline int kswapd_node_cpu_count(int nid)
+{
+	return cpumask_weight_and(cpumask_of_node(nid), cpu_online_mask);
+}
+
+static inline void kswapd_idle_avg_init(void) {}
+static inline void kswapd_idle_avg_start_node(int nid) {}
+static inline void kswapd_idle_avg_stop_node(int nid) {}
+#endif /* CONFIG_NUMA */
 
 #ifdef ARCH_HAS_PREFETCHW
 #define prefetchw_prev_lru_folio(_folio, _base, _field)			\
@@ -6672,7 +6947,7 @@ static bool allow_direct_reclaim(pg_data_t *pgdat)
 		if (READ_ONCE(pgdat->kswapd_highest_zoneidx) > ZONE_NORMAL)
 			WRITE_ONCE(pgdat->kswapd_highest_zoneidx, ZONE_NORMAL);
 
-		wake_up_interruptible(&pgdat->kswapd_wait);
+		wake_up_interruptible_all(&pgdat->kswapd_wait);
 	}
 
 	return wmark_ok;
@@ -7402,7 +7677,8 @@ static void kswapd_try_to_sleep(pg_data_t *pgdat, int alloc_order, int reclaim_o
 	if (freezing(current) || kthread_should_stop())
 		return;
 
-	prepare_to_wait(&pgdat->kswapd_wait, &wait, TASK_INTERRUPTIBLE);
+	prepare_to_wait_exclusive(&pgdat->kswapd_wait, &wait,
+				  TASK_INTERRUPTIBLE);
 
 	/*
 	 * Try to sleep for a short interval. Note that kcompactd will only be
@@ -7443,7 +7719,8 @@ static void kswapd_try_to_sleep(pg_data_t *pgdat, int alloc_order, int reclaim_o
 		}
 
 		finish_wait(&pgdat->kswapd_wait, &wait);
-		prepare_to_wait(&pgdat->kswapd_wait, &wait, TASK_INTERRUPTIBLE);
+		prepare_to_wait_exclusive(&pgdat->kswapd_wait, &wait,
+					  TASK_INTERRUPTIBLE);
 	}
 
 	/*
@@ -7576,6 +7853,8 @@ void wakeup_kswapd(struct zone *zone, gfp_t gfp_flags, int order,
 {
 	pg_data_t *pgdat;
 	enum zone_type curr_idx;
+	int nid, threads_to_wake, threads_woken;
+	int node_cpus, avg_idle_cores;
 
 	if (!managed_zone(zone))
 		return;
@@ -7613,7 +7892,29 @@ void wakeup_kswapd(struct zone *zone, gfp_t gfp_flags, int order,
 
 	trace_mm_vmscan_wakeup_kswapd(pgdat->node_id, highest_zoneidx, order,
 				      gfp_flags);
-	wake_up_interruptible(&pgdat->kswapd_wait);
+
+	/* Determine how many kswapd threads to wake based on the 10-second
+	 * rolling average of idle cores on this NUMA node. More idle cores
+	 * means more threads can run without adding contention; fewer idle
+	 * cores means we keep the wakeup conservative.
+	 */
+	nid = pgdat->node_id;
+	avg_idle_cores = kswapd_node_avg_idle_cores(nid);
+	node_cpus = kswapd_node_cpu_count(nid);
+
+	/*
+	 * If no average is available yet (early boot), fall back to waking
+	 * a single thread to avoid stalling reclaim.
+	 */
+	threads_to_wake = max(1,
+			      min3(avg_idle_cores, node_cpus,
+				   READ_ONCE(current_kswapds_per_node)));
+
+	threads_woken = wake_up_nr(&pgdat->kswapd_wait, threads_to_wake);
+
+	trace_mm_vmscan_kswapd_threads_to_wake(nid, threads_to_wake,
+					       threads_woken, node_cpus,
+					       avg_idle_cores);
 }
 
 void kswapd_clear_hopeless(pg_data_t *pgdat, enum kswapd_clear_hopeless_reason reason)
@@ -7681,18 +7982,18 @@ unsigned long shrink_all_memory(unsigned long nr_to_reclaim)
 }
 #endif /* CONFIG_HIBERNATION */
 
-static void update_kswapd_threads_node(int nid)
+static void update_kswapds_per_node_node(int nid)
 {
 	pg_data_t *pgdat;
 	int drop, increase;
 	int last_idx, start_idx, hid;
-	int nr_threads = kswapd_threads_current;
+	int nr_threads = current_kswapds_per_node;
 
 	pgdat = NODE_DATA(nid);
 	pgdat_kswapd_lock(pgdat);
 	last_idx = nr_threads - 1;
-	if (kswapd_threads < nr_threads) {
-		drop = nr_threads - kswapd_threads;
+	if (max_kswapds_per_node < nr_threads) {
+		drop = nr_threads - max_kswapds_per_node;
 		for (hid = last_idx; hid > (last_idx - drop); hid--) {
 			if (pgdat->kswapd[hid]) {
 				kthread_stop(pgdat->kswapd[hid]);
@@ -7700,7 +8001,7 @@ static void update_kswapd_threads_node(int nid)
 			}
 		}
 	} else {
-		increase = kswapd_threads - nr_threads;
+		increase = max_kswapds_per_node - nr_threads;
 		start_idx = last_idx + 1;
 		for (hid = start_idx; hid < (start_idx + increase); hid++) {
 			pgdat->kswapd[hid] = kthread_run(kswapd, pgdat, "kswapd%d:%d",
@@ -7719,11 +8020,11 @@ static void update_kswapd_threads_node(int nid)
 	pgdat_kswapd_unlock(pgdat);
 }
 
-void update_kswapd_threads(void)
+void update_max_kswapds_per_node(void)
 {
 	int nid;
 
-	if (kswapd_threads_current == kswapd_threads)
+	if (current_kswapds_per_node == max_kswapds_per_node)
 		return;
 
 	/*
@@ -7732,11 +8033,11 @@ void update_kswapd_threads(void)
 	 */
 	mem_hotplug_begin();
 	for_each_node_state(nid, N_MEMORY)
-		update_kswapd_threads_node(nid);
+		update_kswapds_per_node_node(nid);
 
-	pr_info("kswapd_thread count changed, old:%d new:%d\n",
-		kswapd_threads_current, kswapd_threads);
-	kswapd_threads_current = kswapd_threads;
+	pr_info("max_kswapds_per_node changed, old:%d new:%d\n",
+		current_kswapds_per_node, max_kswapds_per_node);
+	current_kswapds_per_node = max_kswapds_per_node;
 	mem_hotplug_done();
 }
 
@@ -7749,7 +8050,7 @@ void __meminit kswapd_run(int nid)
 	int hid, nr_threads;
 
 	pgdat_kswapd_lock(pgdat);
-	nr_threads = kswapd_threads;
+	nr_threads = max_kswapds_per_node;
 	for (hid = 0; hid < nr_threads; hid++) {
 		if (!pgdat->kswapd[hid]) {
 			pgdat->kswapd[hid] =
@@ -7765,8 +8066,9 @@ void __meminit kswapd_run(int nid)
 			}
 		}
 	}
-	kswapd_threads_current = nr_threads;
+	current_kswapds_per_node = nr_threads;
 	pgdat_kswapd_unlock(pgdat);
+	kswapd_idle_avg_start_node(nid);
 }
 
 /*
@@ -7777,7 +8079,9 @@ void __meminit kswapd_stop(int nid)
 {
 	pg_data_t *pgdat = NODE_DATA(nid);
 	int hid;
-	int nr_threads = kswapd_threads_current;
+	int nr_threads = current_kswapds_per_node;
+
+	kswapd_idle_avg_stop_node(nid);
 
 	pgdat_kswapd_lock(pgdat);
 	for (hid = 0; hid < nr_threads; hid++) {
@@ -7815,6 +8119,7 @@ static int __init kswapd_init(void)
 {
 	int nid;
 
+	kswapd_idle_avg_init();
 	for_each_node_state(nid, N_MEMORY)
  		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);
-- 
2.43.0

