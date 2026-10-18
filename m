Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B93B0ADE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320194; cv=none; b=Ej9BLMZ6I7kEOsHyJZ7VgsGKMsPgE5eyn/GCG0FX5adk0gdJ4y/eWoFTc/W65IlbwSta6DsuFzeU9IukfxUfI8n0eI/zHBchrsCXWtS9G2d351zQLMMuu1UitPcxALqkNxbaOuTNOLwwLp4UwhJn80JqPeIBFlXJAR5Zcko82MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320194; c=relaxed/simple;
	bh=jsHKP7y0jYd0lnvn/m65jzNXMtKPbmnsnGmzr+FcrFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LIAUxiLihKoN4bRyB3dkCTP1/gQHfet9vJbMMqjdkdkZOxTScAb7sH1jcfQ01A6msv9FTtmZyZYVT9YHfHg+uVAnvm25LivjSUFkh7MyXWUbIEqvXxJNDmp2RGu6q1n9voTtcMoFM22ZE/ZSmLrjNW0GGX4VVni388exAPRM24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M67kFu6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M67kFu6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5F41F000C4;
	Sun, 18 Oct 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320191;
	bh=Dbr0S12EshEsBMcEg9hNTS2Erf5h8zE4B1k8O/KfvxI=;
	h=Date:From:To:Cc:Subject;
	b=M67kFu6cW6GgZPLBF/ceL47Q4dHMH+JZl0as6bXh3ImVLJllnBa2naDzXnpOT9phj
	 MPMq8Q1KuOwhiFOISzx5iO73ES2LUPloilVEZyqO/4qUSQc7rWk0cWJEI6c7OWm1qq
	 UvN7yvb4PeL9oD7ndAoc9R/ybXr3eScp7RM7dZ1O2Rcq4kZrRx/2dhdB3Bf4eP8aNe
	 Rva4WrydjbR2RBPwRMO4ODgiDuQCiaVXKB6oWvnkyiHDm5fu2Xh+JLFMdWIvA07d33
	 Yw6G1pjbk/RPTsFLB0HRkD4pp/ZEMrtiwZzVFipIbmjT4gWbtg9x5z+HBblmwlGoVI
	 3uKO8YShj5MNw==
Date: Sun, 18 Oct 2026 12:43:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Andrea Righi <arighi@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Stultz <jstultz@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [GIT PULL] Scheduler updates for v7.4
Message-ID: <atSiuBt4n03_iQNW@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest sched/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18

for you to fetch changes up to b99b7f60c5b473d374c68b53753153b4aa9e0702:

Scheduler updates:

Kconfig updates:

 - Simplify PREEMPT_DYNAMIC (Mark Rutland)

Fair scheduler updates:

 - Remove redundant RUN_TO_PARITY check (Elif Topuz)

 - Declare augmented callbacks per field, fix rb_add_augmented_cached()
   descent (Yiwei Lin, Peter Zijlstra)

 - Restart fair hrtick after same-task repicks (Shubhang Kaushik)

 - Improve the scheduling latency of short slice tasks (Vincent Guittot)

Deadline/RT scheduler updates:

 - Check start_dl_timer expiry with ktime_before()
   (Liang Hao)

 - irq_work: CPU-hotplug improvements on PREEMPT_RT (Sebastian Andrzej
   Siewior)

Energy-aware scheduling updates:

 - Implement the steal_governor, introduce preferred CPUs and
   steal-driven vCPU backoff (Shrikanth Hegde)

Multi-processor load-balancing updates:

 - Enable preferred SMT siblings on NVIDIA Olympus (Andrea Righi)

 - Randomize equally shallow idle CPU picks (Christian Loehle)

 - Remove redundant core_sched_seq (Hui Su)

Cache-aware scheduling updates:

 - Avoid publishing partial LLC utilization (Jemmy Wong)

NUMA-balancing updates:

 - Reset NUMA fault locality after scan period update (Eric Kim)

Proxy execution updates:

 - Ongoing work to implement sleeping owner handling for proxy
   execution (John Stultz, Vasily Gorbik)

 - Preparatory steps to make sched_ext compatible with proxy
   execution (Andrea Righi)

Scheduler infrastructure updates & fixes:

 - Remove the RCU wait from PSI trigger destruction (Shakeel Butt)

 - Avoid modifying wait-entry on failed priority registration
   (Hui Su)

 - Use the new static key API for sched_feat (Hongyan Xia)

 - Convert paravirt_steal to new static key APIs (Hongyan Xia)

 - cputime: Don't account idle time twice after dyntick-idle
   (Stian Halseth)

Scheduler debugging updates:

 - Set TIF_NEED_RESCHED before calling __trace_set_need_resched()
   (Sechang Lim)

 - Fix context analysis errors in non-preferred CPU push (Shrikanth
   Hegde)

Misc cleanups and fixes by Christian Loehle, Shubhang Kaushik,
Thomas Huth and Vladimir Zapolskiy.

 Thanks,

	Ingo

------------------>
Andrea Righi (7):
      sched/core: Drop mutex locks before proxy rescheduling
      sched/core: Dequeue waking proxy donors before reset
      sched/core: Mark wakeups completed through ttwu_runnable()
      sched: Add helper to block retained proxy donors
      sched: Add sched_ext hooks for proxy execution
      sched/fair: Honor asymmetric SMT priority in idle selection
      sched/topology: Add asymmetric SMT packing override

Christian Loehle (3):
      sched/fair: Drop idle recency from slow-path CPU selection
      sched/fair: Randomize equally shallow slow-path candidates
      sched: Replace nr_iowait_cpu() with a bool accessor

Elif Topuz (1):
      sched/eevdf: Remove redundant RUN_TO_PARITY check

Eric Kim (1):
      sched/fair: Reset NUMA fault locality after scan period update

Hongyan Xia (2):
      sched: Convert paravirt_steal to new static key APIs
      sched/feat: Use the new static key API for sched_feat

Hui Su (2):
      sched/core: Remove redundant core_sched_seq
      sched/wait: Avoid modifying entry on failed priority registration

Jemmy Wong (1):
      sched/cache: Avoid publishing partial LLC utilization

John Stultz (4):
      sched/core: Avoid migrating blocked_on tasks
      sched: Switch rq->next_class in proxy_reset_donor()
      sched: Break out core of attach_tasks() helper into sched.h
      sched: Migrate whole chain in proxy_migrate_task()

Kayra Cizmeci (2):
      sched/fair: Remove dead code on enqueue_task_fair()
      Revert "sched/fair: Remove dead code on enqueue_task_fair()"

Liang Hao (1):
      sched/deadline: check start_dl_timer expiry with ktime_before()

Mark Rutland (7):
      sched: dynamic: Make PREEMPT_DYNAMIC depend on ARCH_HAS_PREEMPT_LAZY
      sched: dynamic: Simplify {cond,might}_resched()
      sched: dynamic: Simplify preempt_schedule{,_notrace}()
      sched: dynamic: Simplify irqentry_exit_cond_resched()
      sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
      sched: dynamic: Simplify preempt model accessors
      sched: dynamic: Fix preemption model strings

Peter Zijlstra (Intel) (1):
      rbtree: Declare augmented callbacks per field with RB_AUG()

Sebastian Andrzej Siewior (3):
      irq_work: Update a comment regarding CPU hotplug invocation
      irq_work: Flush lazy work CPU down on PREEMPT_RT
      smpboot: Don't park the thread if work is pending

Sechang Lim (1):
      sched: Set TIF_NEED_RESCHED before calling __trace_set_need_resched()

Shakeel Butt (1):
      sched/psi: Remove the RCU wait from trigger destruction

Shrikanth Hegde (14):
      sched/cputime: Add kcpustat_field_total helper
      cpumask: Introduce cpumask_intersects_and
      sched/docs: Document cpu_preferred_mask and Preferred CPU concept
      cpumask: Introduce cpu_preferred_mask
      sysfs: Add preferred CPU file
      sched/core: Try to use a preferred CPU in is_cpu_allowed
      sched/fair: Load balance only among preferred CPUs
      sched/core: Push current task from non preferred CPU
      sched/debug: Add migration stats due to non preferred CPUs
      virt: Introduce steal governor driver
      virt/steal_governor: Add control knobs for handling steal values
      virt/steal_governor: Implement steal_governor policy loop
      virt/steal_governor: Enable the driver
      sched/core: Fix context analysis errors in non-preferred CPU push

Shubhang Kaushik (Ampere) (2):
      sched: Restart fair hrtick after same-task repicks
      sched/wait: Clarify WF_SYNC wakeup semantics

Stian Halseth (1):
      sched/cputime: Don't account idle time twice after dyntick-idle

Thomas Huth (1):
      sched/headers: Replace __ASSEMBLY__ with __ASSEMBLER__ in the <uapi/linux/sched.h> header

Vasily Gorbik (2):
      sched/core: Don't steal a proxy-exec donor
      sched/core: Don't proxy-exec unmatched cookie lock owners

Vincent Guittot (3):
      sched/eevdf: Ensure that vprot will never go above a min slice
      sched/eevdf: Align update_protect_slice to set_protect_slice
      sched/eevdf: Handle more short slice waking cases

Vladimir Zapolskiy (1):
      sched: Remove unneeded function type cast in do_balance_callbacks()

Yiwei Lin (3):
      rbtree_test: Use rb_add() and rb_add_cached() for the basic tests
      rbtree: Update augmented data on the way down in rb_add_augmented_cached()
      rbtree_test: Use rb_add_augmented_cached() for the cached augmented test


 Documentation/ABI/testing/sysfs-devices-system-cpu |  14 +
 Documentation/admin-guide/kernel-parameters.txt    |  12 +
 Documentation/core-api/rbtree.rst                  |  27 +-
 Documentation/driver-api/index.rst                 |   1 +
 Documentation/driver-api/steal-governor.rst        | 151 +++++++
 Documentation/scheduler/index.rst                  |   1 +
 Documentation/scheduler/sched-paravirt.rst         |  67 +++
 MAINTAINERS                                        |   9 +
 arch/Kconfig                                       |  38 --
 arch/arm64/Kconfig                                 |   1 -
 arch/arm64/include/asm/preempt.h                   |  10 -
 arch/arm64/kernel/paravirt.c                       |   4 +-
 arch/loongarch/Kconfig                             |   1 -
 arch/loongarch/kernel/paravirt.c                   |   4 +-
 arch/powerpc/Kconfig                               |   1 -
 arch/powerpc/platforms/pseries/setup.c             |   4 +-
 arch/riscv/Kconfig                                 |   1 -
 arch/riscv/kernel/paravirt.c                       |   4 +-
 arch/s390/Kconfig                                  |   1 -
 arch/s390/include/asm/preempt.h                    |  11 -
 arch/s390/kernel/hiperdispatch.c                   |  10 +-
 arch/s390/kernel/idle.c                            |   4 +-
 arch/x86/Kconfig                                   |   1 -
 arch/x86/include/asm/preempt.h                     |  28 --
 arch/x86/kernel/cpu/vmware.c                       |   4 +-
 arch/x86/kernel/kvm.c                              |   4 +-
 drivers/base/cpu.c                                 |  12 +
 drivers/virt/Kconfig                               |  17 +
 drivers/virt/Makefile                              |   1 +
 drivers/virt/steal_governor.c                      | 296 +++++++++++++
 drivers/xen/time.c                                 |   4 +-
 fs/proc/uptime.c                                   |   6 +-
 include/asm-generic/preempt.h                      |  10 -
 include/linux/bitmap.h                             |  14 +
 include/linux/cpumask.h                            |  42 ++
 include/linux/irq-entry-common.h                   |  17 +-
 include/linux/irq_work.h                           |   2 +
 include/linux/kernel.h                             |  20 -
 include/linux/kernel_stat.h                        |  18 +-
 include/linux/preempt.h                            |  20 +-
 include/linux/rbtree_augmented.h                   | 201 ++++++---
 include/linux/sched.h                              |  37 +-
 include/linux/sched/cputime.h                      |   6 +-
 include/linux/sched/stat.h                         |   2 +-
 include/uapi/linux/sched.h                         |   2 +-
 kernel/Kconfig.preempt                             |  13 +-
 kernel/cpu.c                                       |   6 +
 kernel/entry/common.c                              |  17 +-
 kernel/irq_work.c                                  |  16 +-
 kernel/sched/core.c                                | 464 +++++++++++----------
 kernel/sched/cputime.c                             |  63 ++-
 kernel/sched/deadline.c                            |   9 +-
 kernel/sched/debug.c                               |  21 +-
 kernel/sched/ext/ext.c                             |  18 +-
 kernel/sched/ext/ext.h                             |   7 +
 kernel/sched/fair.c                                | 279 +++++++------
 kernel/sched/idle.c                                |   5 +-
 kernel/sched/psi.c                                 |  25 +-
 kernel/sched/rt.c                                  |   7 +-
 kernel/sched/sched.h                               |  80 +++-
 kernel/sched/stop_task.c                           |   5 +-
 kernel/sched/topology.c                            |  18 +
 kernel/sched/wait.c                                |  25 +-
 kernel/smp.c                                       |   1 +
 kernel/smpboot.c                                   |   6 +-
 kernel/time/tick-sched.c                           |  22 +-
 lib/bitmap.c                                       |  17 +
 lib/rbtree_test.c                                  |  62 +--
 tools/perf/trace/beauty/include/uapi/linux/sched.h |   2 +-
 69 files changed, 1513 insertions(+), 815 deletions(-)
 create mode 100644 Documentation/driver-api/steal-governor.rst
 create mode 100644 Documentation/scheduler/sched-paravirt.rst
 create mode 100644 drivers/virt/steal_governor.c
