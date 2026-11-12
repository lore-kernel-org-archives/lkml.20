Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507406;
	b=SOi73718BO74prTOJuDb+2Eym2QmpvylgxUqjuu2yevh9bO42wdxZb3MEPFMVSPHAt4x
	 tCHhAx0pdHJWejNL/DYShJq5E+x1c9nQaOjsertKOY6YIUbPkqNmlWjwMDidjWof0hmUD
	 7QyT3gCX6r4LytUIRjM/HaScAAVo2NJD3F3mXH6HPTO/HMvdbmFeV3gAbMeOvqrOg2ea0
	 EOOfeEqH6b8tGcY/PnK8e2Ix6z96f2l8ymy/dEtL2Q7sV1pPMC0cgehdAoBK8MShWdqwk
	 3Uwdc1ZpPt+zO6sHf8i+vuJqVnePf7AHrvGLXVa4e77Sj9TSbM5tkT3x2WNWNc1242g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507406;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c4J362F3gxVicVAaWIFE9kbrfH07hMP2XjcQ9Vjc65c=;
	b=ZYjgvKutTrViS5Q2yXdkRtuzAxFEInjCMhb9B2LGW3SCuRChkarB2JUTd+NYpSyQHCO3
	 Lx0XoZVnE9W6uuV13BqiAOAg+SzbETi9FtZXNlOw01NZFFUYKaAyVkLwjY5IfV07YhNk+
	 H5IX4mxziUiRRz2VuM3QgSvTgVP1JtVXebm2G9T3UtjKs7SVasuryUWEcDsJYSfU/I4uS
	 EeebEhJo1iGPMTKGsTCPkZ5O0ZtgUOvSDTjZsMXjskoc65jkvsGQyQ02eyY5m7sG7m+9q
	 V62yHS7Bz/NiRDbauVCrZAUrKR0hzckrpM8W484HWxUSjF/J7Cztpey1WlVQG9GyviA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZNNB+bJr;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37672606A321;
	Thu, 12 Nov 2026 18:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37672606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZNNB+bJr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794507405; x=1826043405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XqOqBP3Qdrho+HEpp+sl0OvF8+0Oc3meOSy3JP6oSfA=;
  b=ZNNB+bJrY2fkZN8IqOa9w8awyeifLGI8EXOG3Xfc1O66sKOm4LGJ0TCY
   NCH4/TDuhq6Gf8+3O+RG6bADQ2suBeE4nNvB5zT6dMCE57+vCFGWhYlaF
   ZLs7A1oi5aCMuJANOAiXYE15n+3Q0Y5goonijwb3LLGshnNoyxpT2EgNr
   MqRbyPMExE63xAgQa7Gpy0LMEpb87Ce7idHgs2kvg5imzlZBR++bChIoa
   XK/9kfbVZ/6kVUdMuweImByIA9lyw0Sa+J0xCIib6tavjHU/Fml+/kr3Q
   eHLsC4VeeuREREeJWQlaRriBE2lNVCexmhW1A/DZo/fa3+pMXu29LFzwh
   w==;
X-CSE-ConnectionGUID: 4AKVHs+vRviU3o57o3czeQ==
X-CSE-MsgGUID: lvw6O6eERIuBYWDRDLxp0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3203219"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3203219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:16:42 -0800
X-CSE-ConnectionGUID: E8iCgnlDQaeEciXj2KjITg==
X-CSE-MsgGUID: JanOB9dySu2n+nIeoC4LyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8898611"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2026 10:16:42 -0800
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Documentation/scheduler: Add cache aware scheduling documentation
Date: Thu, 12 Nov 2026 10:21:46 -0800
Message-Id: <50a8055e38958cdc39e07435aaad56e4719b2bd3.1794507151.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1794507151.git.tim.c.chen@linux.intel.com>
References: <cover.1794507151.git.tim.c.chen@linux.intel.com>
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

Add Documentation/scheduler/sched-cache.rst to describe cache aware
scheduling (CONFIG_SCHED_CACHE).

The document explains how the scheduler tracks LLC occupancy per cache
group, how the preferred LLC is chosen and withdrawn, how the load
balancer is biased toward the preferred LLC, and which safety valves let
generic load balancing take over. It also describes the debugfs
tunables under /sys/kernel/debug/sched/llc_balancing/ and gives tuning
guidance.

The migration decision tables in the document are derived from the
logic of can_migrate_llc(), fits_llc_capacity() and util_greater().

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 Documentation/scheduler/index.rst       |   1 +
 Documentation/scheduler/sched-cache.rst | 554 ++++++++++++++++++++++++
 2 files changed, 555 insertions(+)
 create mode 100644 Documentation/scheduler/sched-cache.rst

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 791178ac8bec..67cf466a169b 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -16,6 +16,7 @@ Scheduler
     sched-domains
     sched-capacity
     sched-energy
+    sched-cache
     schedutil
     sched-util-clamp
     sched-nice-design
diff --git a/Documentation/scheduler/sched-cache.rst b/Documentation/scheduler/sched-cache.rst
new file mode 100644
index 000000000000..e817c52f7387
--- /dev/null
+++ b/Documentation/scheduler/sched-cache.rst
@@ -0,0 +1,554 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Cache Aware Scheduling
+======================
+
+1. Introduction
+---------------
+
+Cache Aware Scheduling gives the fair scheduler's load balancer the ability
+to keep the threads of a process together in one Last Level Cache (LLC)
+domain. Modern processors often split their LLC into several independent
+slices: one per chiplet, per core complex, or per socket. Threads that share
+data but are spread over different LLCs pay for each cache line they
+exchange with a cross-die or cross-socket transfer.
+
+Cache aware scheduling watches where the threads of each process actually
+run, picks a 'preferred LLC' for the process, and biases load balancing to
+move the threads toward that LLC when this can be done without overloading
+it. When the system is busy, or when the process is too large to fit in one
+LLC, it steps aside and the generic load balancer decides alone.
+
+This document gives an introduction to how cache aware scheduling works,
+what the main design decisions behind it are, and how it can be tuned.
+
+Before going any further, please note:
+
+   Cache aware scheduling is active only if at least one sched domain
+   partition spans more than one LLC.
+
+On platforms with a single LLC (for example a monolithic die where all cores
+share one L3), there is nothing to aggregate. The feature then stays
+disabled at run time, and its hooks are patched out by static keys.
+
+
+2. Background and Terminology
+-----------------------------
+
+The generic load balancer spreads runnable load evenly and uses idle CPUs.
+It knows the cache topology (sched domains carry the SD_SHARE_LLC flag), but
+it does not know which tasks share data. Thus, a process with eight threads
+on a machine with eight LLCs can easily end up with one thread in each LLC.
+Each lock handoff, producer/consumer exchange or shared data update then
+becomes a cross-LLC coherence transaction.
+
+Cache aware scheduling supplies the missing information: these tasks belong
+together, and this is the LLC where they already do most of their work.
+
+The following terms are used in the rest of this document:
+
+ - cache group: the unit of aggregation (struct sched_cache_group). Each
+   address space (mm) has one cache group, created with the mm. All tasks
+   that share the mm, that is all threads of a process, belong to it. A
+   task is attached to the group of its mm on fork() and on exec().
+   Single-threaded processes are ignored, because there is nothing to
+   co-locate.
+
+ - occupancy: the share of a CPU's recent fair-class run time that was
+   consumed by the tasks of one cache group.
+
+ - epoch: the period at which the run time counters decay (by default
+   HZ/100 jiffies, about 10 ms). Also the minimum interval between two
+   scans of the same cache group.
+
+ - preferred LLC: the LLC that the cache group currently wants its tasks to
+   run on. It is identified by one CPU of that LLC (grp->cpu), and is -1 if
+   there is no preference. Each task caches the id of its preferred LLC in
+   p->preferred_llc.
+
+Cache aware scheduling does not change the wake-up path. The wake-up path
+already tends to place a task back on the LLC it last ran on, where its data
+is cache hot. The load balancer is where threads get spread apart, so this
+is where the bias is applied.
+
+
+3. Topology information
+-----------------------
+
+When the sched domains are built or rebuilt, the scheduler checks whether
+any partition has an LLC domain with a parent domain that spans more CPUs
+(see sd_in_multi_llcs()). If so, the static key sched_cache_present is
+enabled. An LLC domain that contains a single CPU is skipped by this
+check, because there is nothing to aggregate to. A second static key,
+sched_cache_active, is enabled when sched_cache_present is set and the
+user has not disabled the feature (see Section 7.1). All hooks of cache
+aware scheduling are gated by sched_cache_active.
+
+An exclusive cpuset that is confined to a single LLC does not, by itself,
+enable the feature. Because the static keys are global, the feature is on
+for the whole system as soon as one partition spans several LLCs.
+
+For each CPU, the bottom sched domain carries three additional fields:
+
+ - llc_counts[]: a histogram indexed by LLC id. llc_counts[n] is the number
+   of tasks queued on this CPU that prefer LLC n.
+ - llc_max: the size of the llc_counts[] array.
+ - llc_bytes: the size of the LLC in bytes, as seen by this CPU.
+
+The LLC size comes from the generic cacheinfo framework. If the physical
+LLC is shared by more CPUs than the sched domain spans (for example, when a
+cpuset partition splits an LLC), the size is prorated by the ratio of the
+domain's CPU count to the number of CPUs sharing the physical cache.
+cacheinfo can be populated after the sched domains are first built. In this
+case, sched_update_llc_bytes() fills in llc_bytes later, when CPUs come
+online.
+
+Each runqueue also counts the tasks that prefer some LLC (nr_llc_running),
+and the runnable tasks that are queued on their preferred LLC
+(nr_pref_llc_running).
+
+Example 1.
+    Let us consider a platform with 16 CPUs in one NUMA node, split in 2
+    LLCs of 8 CPUs each::
+
+	          CPUs:   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
+	          LLCs:  |-----llc0------|---------llc1--------|
+	          MC:    |-----sd mc-----|--------sd mc--------|
+	          PKG:   |---------------sd pkg----------------|
+
+    The MC domain has SD_SHARE_LLC set, and its parent (PKG) spans more
+    CPUs, so sched_cache_present is enabled. Cache aware balancing is done
+    at the PKG level, between the two LLC groups.
+
+    If userspace instead creates two exclusive cpusets, one per LLC, each
+    root domain spans a single LLC. sched_cache_present is then disabled
+    and cache aware scheduling costs essentially nothing.
+
+
+4. Choosing the preferred LLC
+-----------------------------
+
+4.1 - Measuring LLC occupancy
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Each time a fair-class task accrues run time, account_mm_sched() adds the
+run time to two counters:
+
+ - the cache group's per-CPU counter (pcpu_sched->runtime), and
+ - the CPU's total counter (rq->cpu_runtime).
+
+Both counters are halved at each epoch boundary. The occupancy of a CPU by
+a cache group is then::
+
+	                            group runtime on CPU
+	occupancy = NICE_0_LOAD * -----------------------
+	                           total runtime on CPU
+
+Recent behavior dominates, and old history fades out within a few epochs.
+
+4.2 - Scanning
+^^^^^^^^^^^^^^
+
+From the scheduler tick, task_tick_cache() queues task_cache_work() as task
+work on the current task, at most once per epoch per cache group. When the
+work runs, only one thread of the group does the scan. A cmpxchg() on
+grp->next_scan makes sure of this. The scan:
+
+ 1. Selects the candidate CPUs. With NUMA balancing active, the scan is
+    limited to the task's preferred NUMA node, plus the node of the current
+    preferred LLC and the node the task is running on. Without NUMA
+    balancing, or if the task has no preferred node, all online CPUs are
+    scanned.
+
+ 2. Adds up the occupancy of the group over all CPUs of each LLC. The sum,
+    and not the average per CPU, is compared. Thus, a larger LLC that holds
+    more of the group's threads wins over a smaller LLC that holds fewer
+    threads, even if the smaller one is more dense.
+
+ 3. Selects the LLC with the highest total occupancy. grp->cpu is switched
+    to it only if its occupancy is more than twice the occupancy of the
+    current preferred LLC. This hysteresis keeps the preference stable and
+    prevents ping-pong migrations. If there is no current preference, any
+    LLC with non-zero occupancy is taken.
+
+ 4. Updates nr_running_avg, a moving average of the number of the group's
+    threads that were running on the scanned CPUs at the time of the scan.
+
+Example 2.
+    Using the platform of Example 1, consider a process whose preferred
+    LLC is currently llc1. The scan finds these per-CPU occupancies, given
+    as a percentage of NICE_0_LOAD::
+
+	          CPU:     0    1    2    3   4-7  |  8    9   10-15
+	          occ:   100% 100% 100%  0%   0%   | 100% 50%   0%
+
+	          llc0 total = 300%
+	          llc1 total = 150%
+
+    llc0 has the highest total, but 300% is not more than 2 * 150%, so the
+    preferred LLC stays llc1. If the thread on CPU 9 later sleeps and the
+    total for llc1 drops to 100%, the next scan moves the preference to
+    llc0 (300% > 200%).
+
+4.3 - NUMA balancing takes precedence
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Each task derives its preferred LLC from grp->cpu. If NUMA balancing is
+active and the preferred LLC is on a different node than the task's
+preferred NUMA node, the task gets no preferred LLC. NUMA placement always
+takes precedence over LLC placement.
+
+
+5. When the preference is withdrawn
+-----------------------------------
+
+The preferred LLC of a cache group is cleared (grp->cpu = -1) if any of the
+following conditions holds. The tasks of the group are then balanced like
+any other task.
+
+  (a) The group has not been scanned for more than epoch_affinity_timeout
+      epochs (by default 5 epochs, about 50 ms). The data is stale, because
+      the group became idle or its behavior changed.
+
+  (b) Too many threads run at the same time. The check is::
+
+	fits_capacity(nr_running_avg * SMT_threads, scale * llc_cpus)
+
+      where llc_cpus is the number of CPUs in the LLC, SMT_threads is the
+      number of hardware threads per core, and scale is derived from
+      aggr_tolerance (see Section 7.2). fits_capacity() keeps a ~20% margin.
+      For an LLC of 16 CPUs with SMT-2 and the default aggr_tolerance, at
+      most 6 threads can run at the same time.
+
+  (c) The working set would not fit in one LLC. The check is::
+
+	footprint * PAGE_SIZE > llc_bytes * (1 + (aggr_tolerance - 1) * 256)
+
+      The footprint of a group is the sum of the NUMA balancing memory
+      fault statistics of its tasks. The contribution of a task is
+      subtracted again when it exits. This estimate is only available
+      when NUMA balancing is enabled. Without NUMA balancing, this check
+      never triggers.
+
+The thread and footprint checks are done during accounting, during the
+scan, and again when the load balancer considers a cache aware migration.
+A single-threaded process always fails the thread check.
+
+
+6. Cache aware load balancing
+-----------------------------
+
+6.1 - LLC utilization
+^^^^^^^^^^^^^^^^^^^^^
+
+When the load balancer runs on a domain whose child is the LLC domain,
+it records the utilization (the sum of cpu_util_cfs()) and the capacity of
+each LLC group in the shared LLC data (struct sched_domain_shared). These
+values are only updated during periodic balancing, not during newly
+idle balancing. They are used by the migration policy below.
+
+6.2 - Migration policy
+^^^^^^^^^^^^^^^^^^^^^^
+
+Whether a task can move between two LLCs depends on the utilization of both
+LLCs after the move. Two rules are used, both expressed as a percentage of
+the LLC's capacity:
+
+ - An LLC is 'busy' when its utilization is not below overaggr_pct (by
+   default 50%). The 50% threshold prevents SMT-2 cores from saturating.
+   On systems without SMT, the threshold is raised by 1.5x (75% by
+   default).
+
+ - An LLC is 'noticeably busier' than another one when its utilization is
+   more than imb_pct (by default 20%) higher. 20% is slightly above the
+   imbalance_pct of the LLC domain (17%), so that the two balancers do not
+   fight each other.
+
+Then, can_migrate_llc() returns one of three decisions:
+
+ - G (mig_unrestricted): both LLCs are busy. Cache aware balancing does
+   not interfere and the generic load balancer decides.
+
+ - N (mig_forbid): the move is refused, because:
+
+   * when moving toward the preferred LLC: the preferred LLC would become
+     busy and noticeably busier than the source LLC, or
+   * when moving out of the preferred LLC: the preferred LLC is not busy,
+     or it is not noticeably busier than the destination LLC.
+
+ - Y (mig_llc): the move is allowed for LLC locality.
+
+The effect of imb_pct is that the preferred LLC can be up to imb_pct busier
+than the other LLC before a task is moved out. Moving a task out of its
+preferred LLC thus has a higher bar than moving it in.
+
+The policy only applies to moves into or out of the preferred LLC. If the
+cache group has no preferred LLC, or if neither the source nor the
+destination is the preferred LLC, the decision is G and the generic load
+balancer decides.
+
+Example 3.
+    The tables below show the decisions with the default values
+    (overaggr_pct = 50, imb_pct = 20, SMT system). The values are the LLC
+    utilizations after the move, as a percentage of LLC capacity.
+
+    Moving toward the preferred LLC (dst is the preferred LLC)::
+
+	  src \ dst      30%  45%  50%  60%
+	  30%            Y    Y    N    N
+	  45%            Y    Y    Y    N
+	  50%            Y    Y    G    G
+	  60%            Y    Y    G    G
+
+    Moving out of the preferred LLC (src is the preferred LLC)::
+
+	  src \ dst      30%  45%  50%  60%
+	  30%            N    N    N    N
+	  45%            N    N    N    N
+	  50%            Y    N    G    G
+	  60%            Y    Y    G    G
+
+    A task can move from a 45% LLC into its preferred LLC that becomes 50%
+    busy, because 50% is within 20% of 45%. But a task in a 50% busy
+    preferred LLC is not moved out to a 45% busy LLC, for the same reason.
+    If it was, the next balance would move it back and cause ping-pong
+    migrations. A task cannot move from a 30% LLC into its preferred LLC
+    that becomes 50% busy, because 50% is more than 20% above 30%.
+
+    The code compares absolute utilizations, not percentages. The tables
+    assume that both LLCs have the same capacity.
+
+6.3 - Pulling tasks to their preferred LLC
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+When a CPU balances a domain that spans several LLCs, update_sg_lb_stats()
+counts, for each remote group, how many of its tasks prefer the LLC of the
+destination CPU (using llc_counts[]). If there are such tasks, and the
+policy above returns Y for a move from that group to the destination, the
+group is classified as group_llc_balance.
+
+group_llc_balance ranks above all other group types except
+group_overloaded, so a truly overloaded group is always handled first. For
+a group_llc_balance busiest group, the balancer:
+
+ - uses the migration type migrate_llc_task with an imbalance of one task,
+ - picks the runqueue with the most tasks that prefer the destination LLC,
+ - detaches only a task whose preferred LLC is the destination LLC,
+ - if needed, kicks active balancing with the same restriction.
+
+6.4 - Vetoing harmful migrations
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+During ordinary load balancing, migrate_degrades_llc() refuses to move a
+task out of its preferred LLC when cache migration policy encapsulated
+in can_migrate_llc() returns N. Such refusals are expected behavior,
+so they set LBF_LLC_PINNED and do not increase nr_balance_failed.
+
+Active balancing does not evict a task from a CPU in its preferred LLC
+(alb_break_llc()) when all runnable tasks on the source CPU are on their
+preferred LLC, and either:
+
+ - the source CPU runs only one task, or
+ - moving the current task out would be refused by the policy above.
+
+6.5 - Safety valves
+^^^^^^^^^^^^^^^^^^^
+
+The LLC bias gives way to other scheduler goals in these cases:
+
+ - Repeated failures: when nr_balance_failed of a domain reaches
+   cache_nice_tries + 1, all LLC constraints are dropped for that domain
+   until balancing succeeds. Refusals by migrate_degrades_llc() during
+   ordinary balancing do not count (Section 6.4), but a group_llc_balance
+   attempt that fails to move a task does, so that a group which cannot
+   be aggregated does not block the generic balancer for long.
+
+ - Asymmetric CPU capacity: misfit migration takes precedence. A group
+   with a misfit task is not classified group_llc_balance. Cache aware
+   balancing never pulls a task onto a CPU it does not fit, unless the task
+   does not fit its source CPU either. Active balancing of misfit tasks is
+   not blocked.
+
+ - Asymmetric packing: moving tasks to idle, higher priority CPUs
+   (SD_ASYM_PACKING) takes precedence.
+
+ - Core scheduling: tasks with a core scheduling cookie are exempt from
+   the migrate_degrades_llc() veto.
+
+ - Moves inside one LLC are never restricted.
+
+
+7. Tunables
+-----------
+
+The tunables are in debugfs, in /sys/kernel/debug/sched/llc_balancing/.
+Like other files in /sys/kernel/debug/sched/, they are meant for
+experimentation and are not a stable ABI.
+
+7.1 - enabled
+^^^^^^^^^^^^^
+
+Default: 1.
+
+Writing 0 disables cache aware scheduling, and writing 1 enables it again.
+The usual boolean strings (y/n, on/off) are also accepted. The feature is
+actually active only if the platform also supports it (Section 3). When
+sched_verbose is set (with the boot parameter, or with
+/sys/kernel/debug/sched/verbose), the kernel logs the resulting state each
+time it is evaluated, that is on writes to this file and on sched domain
+rebuilds::
+
+	# echo 0 > /sys/kernel/debug/sched/llc_balancing/enabled
+	# dmesg | grep 'cache aware scheduling'
+
+7.2 - aggr_tolerance
+^^^^^^^^^^^^^^^^^^^^
+
+Default: 1.
+
+Sets how large a cache group can be and still be aggregated. It scales the
+limits of Section 5 (b) and (c):
+
+  ===============  ============================  ===========================
+  aggr_tolerance   thread limit                  footprint limit
+  ===============  ============================  ===========================
+  0                zero: never aggregate         zero: never aggregate
+  1                ~80% of the LLC's CPUs        LLC size
+  N (2 to 99)      N times the value for 1       (1 + (N - 1) * 256) times
+                                                 the LLC size
+  100 or more      no limit                      no limit
+  ===============  ============================  ===========================
+
+For example, with a 32 MB LLC, aggr_tolerance = 2 allows a footprint of
+up to 257 * 32 MB (about 8 GB). Values from 2 upward thus make the
+footprint check mostly irrelevant, and the thread limit becomes the main
+constraint.
+
+Raise aggr_tolerance when a group has a few more active threads than one
+LLC can hold, or a large memory footprint but a small shared hot data set.
+This matters most on platforms with small LLCs. Before you use large values
+in production, measure memory bandwidth bound phases of the workload,
+because one LLC gives less memory bandwidth than the whole node.
+
+7.3 - overaggr_pct
+^^^^^^^^^^^^^^^^^^
+
+Default: 50 (percent of LLC capacity).
+
+The utilization at which an LLC is 'busy' (Section 6.2). A busy LLC stops
+attracting tasks. Higher values pack tasks more aggressively. Lower values
+(for example 30 to 40) reduce packing if run queue latency or throughput
+gets worse. On systems without SMT, the value is multiplied by 1.5.
+
+7.4 - imb_pct
+^^^^^^^^^^^^^
+
+Default: 20 (percent).
+
+The hysteresis margin between the preferred and the non-preferred LLC
+(Section 6.2). Higher values make tasks stay longer in their preferred LLC
+and reduce bouncing between LLCs. Lower values react faster to load
+changes.
+
+7.5 - epoch_period
+^^^^^^^^^^^^^^^^^^
+
+Default: HZ/100 (in jiffies).
+
+The decay period of the occupancy counters, and the minimum interval
+between two scans of a cache group. Note that the unit is jiffies, so the
+default is 10 ms with HZ=1000 and HZ=100, but 8 ms with HZ=250. A value of
+0 is treated as 1. Longer values give smoother occupancy and less scan
+overhead, but a slower reaction when the preferred LLC should change:
+because the counters decay more slowly, the past run time keeps more weight
+and the occupancy catches up with the new task placement gradually.
+Because epoch_affinity_timeout is counted in epochs, a longer period also
+makes a stale preference last longer.
+
+7.6 - epoch_affinity_timeout
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Default: 5 (epochs).
+
+How many epochs a preferred LLC survives without a new scan (Section 5
+(a)). Raise it for bursty workloads that become idle for short periods and
+lose their preference too often.
+
+7.7 - Tuning guidance
+^^^^^^^^^^^^^^^^^^^^^
+
+ 1. Start with the default values, and compare against enabled = 0. Keep
+    everything else (cpusets, NUMA balancing, cpufreq governor) the same.
+ 2. If the threads of a process are not aggregated because the process is
+    slightly too large, try aggr_tolerance = 2.
+ 3. If packing causes queueing or lower throughput, lower overaggr_pct.
+ 4. If tasks bounce between LLCs, raise imb_pct and/or epoch_period.
+ 5. If the preference is lost for bursty workloads, raise
+    epoch_affinity_timeout.
+ 6. Where the application lets you set the size of its thread pool,
+    matching it to the number of cores per LLC often gives more than any
+    kernel tunable.
+
+To see what the kernel uses as LLCs, look at the shared_cpu_list of the
+highest cache index of each CPU::
+
+	# grep . /sys/devices/system/cpu/cpu*/cache/index3/shared_cpu_list
+
+
+8. Dependencies and requirements
+--------------------------------
+
+8.1 - Kernel configuration
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Cache aware scheduling is built with CONFIG_SCHED_CACHE=y (default y,
+depends on SMP). The tunables need CONFIG_DEBUG_FS. CONFIG_NUMA_BALANCING
+is recommended (see Section 8.4).
+
+8.2 - Multiple LLCs
+^^^^^^^^^^^^^^^^^^^
+
+As mentioned in the introduction, at least one sched domain partition must
+span more than one LLC. Platforms that benefit include:
+
+ - chiplet processors with an LLC per die or per core complex,
+ - processors that expose several LLC domains per socket,
+ - multi-socket systems with memory interleaved over the sockets. Such a
+   system is seen as one NUMA node with several LLCs, so NUMA balancing
+   cannot help there,
+ - platforms whose cacheinfo reports cluster-level LLCs.
+
+On ordinary multi-socket systems with one LLC per NUMA node, cache aware
+scheduling is active and can migrate tasks between nodes. However, NUMA
+balancing already handles the placement between nodes, and it takes
+precedence: a task whose preferred NUMA node does not contain the preferred
+LLC gets no LLC preference, and a migration that would hurt NUMA locality is
+not done for LLC locality.
+
+8.3 - Cache size information
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The LLC size is read from the generic cacheinfo framework. Architectures
+that do not populate it (currently PowerPC, which has its own cacheinfo
+implementation) report an LLC size of 0. When NUMA balancing is active,
+any non-zero footprint then fails the check of Section 5 (c), so cache
+aware scheduling is effectively disabled on these platforms.
+
+8.4 - NUMA balancing
+^^^^^^^^^^^^^^^^^^^^
+
+The footprint estimate of Section 5 (c) comes from NUMA balancing fault
+statistics. Without NUMA balancing, the footprint check is skipped, and
+groups with a working set much larger than one LLC can still be aggregated.
+With NUMA balancing, the scan is also limited to the relevant nodes, which
+reduces its cost on large systems.
+
+8.5 - Multithreading (SMT)
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The thread limit of Section 5 (b) multiplies the number of running threads
+by the number of hardware threads per core. Thus, it effectively counts
+cores. On systems with many threads per core and small LLCs (for example
+SMT-4 with 4 CPUs per LLC), almost every multi-threaded process fails this
+check unless aggr_tolerance is raised.
-- 
2.32.0

