Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74AD4F3900
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415345; cv=none; b=TN5bLFUDvyQQZd86R02mJ3LHYuo1zfJDIhktuhgDE2AYAtPJ+MldK0Ec8QO8Jx/rDH6bbUmUYa3RL3hkA1KMEWcJvvuN6rDeyIAZgRQZuV6IgcDsgYCWYi5+gXvVzDur5A1nqZuyfeFri1tIp050uWjFFBygqnLqlD+RdE5hlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415345; c=relaxed/simple;
	bh=kuqyzRGqdIPgJEMsHn7b7HHU09F9Og+XtAYaSE5sTj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtZMA3EFWmGvrYQJR5yNgpdG88u2M9x3ClPuVRe9af0DFCGSqdSjPhU0NmIl7MUc/xw/fMObypOFQtIkn94/OmUJzy+vLLzEqvgJdj/2/uNa406tL0sPdM+0MXHl1e8C0E4r4ggmB1yp1ZDAJKoz9SPHSU+9ayMuB2mXN/wW9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FypRTH/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FypRTH/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17681F000C4;
	Mon, 19 Oct 2026 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415343;
	bh=EwCAbbWXPr8KlvzMdNcocMc8nvxaFh0SNbBea1X+xQs=;
	h=From:To:Cc:Subject:Date;
	b=FypRTH/vImJuDeKmGTJ1hD2s+stFuAOZ18Kg7zoaxq/475oRvlAOB71IrY89VeCil
	 okY9UHKR8O21AFbsLT+MJvHh9O94LNQUW0SoDUhbcs0LiFXAlX19mlBPPSXRU4wYVt
	 PlpjDpox4IOXGfjCVKQy8y6KmO4D4x/0zvtwwvCP0JROpHGOq8L3P7kAIeUoYSfhVQ
	 rUD+PWTUK9N1Y3c0NpJoVAQc8ccCXpktbxaZpFIBuuiLDoXtCY993NSfDIMcj0aoSR
	 um6Jsm5IUi2WnyqEQnlU/SuU9w49WWeTE1CMQUtNhzvWV+K40sMnCeOq4rXc8jAsZN
	 lSUKXhxnofPPw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Phil Auld <pauld@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [RFC PATCH 00/49] cpu/hotplug: Remove cpu_down() global stop_machine() except for CPUHP_TEARDOWN_CPU itself
Date: Mon, 19 Oct 2026 15:08:07 +0200
Message-ID: <20261019130856.49711-1-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

As discussed in LPC, cpu_down()'s stop_machine() is a problem for
running real time and nohz_full workloads, for example if we want to
provide a cpuset interface for nohz_full and isolated partitions are
created at the same time as those critical workloads.

Here is a first step to start. stop_machine() gets a new "post" callback
that is executed after the main one such that:

* As before the main fn executes while all the other CPUs spin.
* While other CPUs can exit stop_machine(), the target keeps IRQs
  disabled and execute the post_fn.

All the states between CPUHP_AP_ONLINE and CPUHP_AP_OFFLINE are moved
to the post callback because they can eventually run concurrently with
the other CPUs. I made a dedicated commit for each of them with
individual justification analysis and tweaked a bit CPUHP_AP_TICK_DYING
to adapt it.

There are two states for which I'm not too confident, please double
check CPUHP_AP_CPU_PM_STARTING and CPUHP_AP_ARM_CACHE_B15_RAC_DYING.

In the end only CPUHP_TEARDOWN_CPU (which is __cpu_disable()) remains in
the global stop machine, this will be the next step. The plan will be to
(all with IRQs disabled)

* Clear the CPU from cpu_online_mask

* Start an RCU grace period and poll on it (while doing momentary eqs in
  the loop), this *should work* with IRQs disabled. So all CPUs observe
  the CPU as offline.

* Check if the rest of x86 __cpu_disable() can be accomodated to run
  without making other CPUs spin.

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	core/hotplug

HEAD: 8ff5f866a7c2825213c6aa525a88840cbccf1211

Thanks,
	Frederic
---

Frederic Weisbecker (49):
      stop_machine: Add post function to execute while other CPUs can exit
      x86/cpu/cacheinfo: Move CPUHP_AP_CACHECTRL_STARTING to post stop machine
      sched: Move CPUHP_AP_SCHED_STARTING to post stop_machine()
      rcu: Move CPUHP_AP_RCUTREE_DYING to post stop_machine()
      cpuidle: Move CPUHP_AP_CPU_PM_STARTING post stop_machine()
      cpu: Move CPUHP_AP_IRQ_ARMADA_XP_STARTING..CPUHP_AP_IRQ_GIC_STARTING range post stop_machine()
      irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
      cpu: Move [CPUHP_AP_IRQ_EIOINTC_STARTING..CPUHP_AP_IRQ_MIPS_GIC_STARTING] range post stop_machine()
      irqchip/loongarch-avec: Move CPUHP_AP_IRQ_AVECINTC_STARTING post stop_machine()
      irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
      irqchip/aslint-sswi: Move CPUHP_AP_IRQ_ACLINT_SSWI_STARTING post stop_machine()
      irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTING post stop_machine()
      cpu: Move [CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING..CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING] range post stop_machine()
      perf/x86: Move CPUHP_AP_PERF_X86_STARTING post stop_machine()
      perf/amd/ibs: Move CPUHP_AP_PERF_X86_AMD_IBS_STARTING post stop_machine()
      cpu: Move CPUHP_AP_PERF_XTENSA_STARTING post stop_machine()
      ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
      cpu: Move [CPUHP_AP_PERF_ARM_ACPI_STARTING..CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING] range post stop_machine()
      perf/arm_pmu: Move CPUHP_AP_PERF_ARM_STARTING post stop_machine()
      perf: RISC-V: Move CPUHP_AP_PERF_RISCV_STARTING post stop_machine()
      ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
      clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
      clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_STARTING post stop_machine()
      clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING post stop_machine()
      clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
      clocksource/drivers/jcore: Move CPUHP_AP_JCORE_TIMER_STARTING post stop_machine()
      ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
      clocksource/drivers/qcom: Move CPUHP_AP_QCOM_TIMER_STARTING post stop_machine()
      clocksource/drivers/timer-tegra: Move CPUHP_AP_TEGRA_TIMER_STARTING post stop_machine()
      clocksource/drivers/armada: Move CPUHP_AP_ARMADA_TIMER_STARTING post stop_machine()
      LoongArch: Move CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING post stop_machine()
      clocksource/drivers/mips-gic-timer: Move CPUHP_AP_MIPS_GIC_TIMER_STARTING post stop_machine()
      clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING post stop_machine()
      clocksource/drivers/rtl-otto: Move CPUHP_AP_REALTEK_TIMER_STARTING post stop_machine()
      clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING post stop_machine()
      clocksource: clint: Move CPUHP_AP_CLINT_TIMER_STARTING post stop_machine()
      clocksource/drivers/c-sky: Move CPUHP_AP_CSKY_TIMER_STARTING post stop_machine()
      clocksource/drivers/timer-ti-dm: Move CPUHP_AP_TI_GP_TIMER_STARTING post stop_machine()
      clocksource: hyper-v: Move CPUHP_AP_HYPERV_TIMER_STARTING post stop_machine()
      clocksource/dummy_timer: Move CPUHP_AP_DUMMY_TIMER_STARTING post stop_machine()
      ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
      ARM: xen: Move CPUHP_AP_ARM_XEN_RUNSTATE_STARTING and CPUHP_AP_ARM64_ISNDEP_STARTING post stop_machine()
      smp: Move CPUHP_AP_SMPCFD_DYING post stop_machine()
      hrtimer: Move CPUHP_AP_HRTIMERS_DYING post stop_machine()
      irq_work: Introduce irq_work_kick_cpu()
      tick-sched: Convert ad-hoc implementation of irq_work_kick_cpu()
      tick: Move CPUHP_AP_TICK_DYING post stop_machine()
      x86/boot/tboot: Move CPUHP_AP_X86_TBOOT_DYING post stop_machine()
      ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()

 arch/arm/kernel/patch.c                  |  2 +-
 arch/arm/probes/kprobes/core.c           |  2 +-
 arch/arm64/kernel/patching.c             |  4 ++--
 arch/csky/kernel/probes/kprobes.c        |  3 ++-
 arch/loongarch/kernel/inst.c             |  3 ++-
 arch/parisc/kernel/patch.c               |  4 ++--
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  4 ++--
 arch/powerpc/platforms/powernv/subcore.c |  2 +-
 arch/powerpc/platforms/pseries/lpar.c    |  2 +-
 arch/riscv/kernel/patch.c                |  3 ++-
 arch/s390/kernel/kprobes.c               |  4 ++--
 arch/s390/kernel/time.c                  |  3 ++-
 arch/x86/kernel/cpu/microcode/core.c     |  3 ++-
 arch/x86/kernel/cpu/mtrr/mtrr.c          |  3 ++-
 arch/x86/virt/vmx/tdx/seamldr.c          |  2 +-
 arch/xtensa/kernel/jump_label.c          |  4 ++--
 include/linux/irq_work.h                 |  1 +
 include/linux/stop_machine.h             | 10 +++++++---
 kernel/cpu.c                             | 21 +++++++++++++++++++--
 kernel/irq_work.c                        | 16 ++++++++++++++++
 kernel/sched/core.c                      |  1 -
 kernel/stop_machine.c                    | 14 +++++++++++---
 kernel/time/tick-common.c                | 14 ++++++++------
 kernel/time/tick-sched.c                 | 12 ++----------
 24 files changed, 91 insertions(+), 46 deletions(-)
