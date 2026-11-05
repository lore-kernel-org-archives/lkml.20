Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896254;
	b=GLbmQYlzyv/lEpAevzXZohKvFiOXSMRC+dzATjHpxGKTVrMR4AN1xm1d7tlgMHJq0vq9
	 KoEI47ls+y0mvQqZVIQ04ijUT2bdp0WzJYo6Vb5/kg0HuYL2X8vcbX5BuJsCzGAV7rLW3
	 gjSCPNT/+fdnS/kGzRRFBouCzI/gcRx3C8isBFz6uE24G+ElqIuql11SJw5V7JMEdHxA5
	 +tEbaMUYWQhWPnR4gni6tSuHYPbqYXltkMADVBVCftPt+GARNg0TO7T6wW8QUoxawZjl7
	 ubHLXQM/b8YsUNvCRjIeTUlBHvvSm68onlrMJt5UbE5TNRADEYcj2CIpLmYIhuFwHFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896254;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4CVsdYIniE0on55XqKXOAgOnbpE4vVSoU2vmeXz/FtY=;
	b=rRr6ZG926a+fq+qUU0XSwB0ZMjYNCEWvDLYRzXXL0uz2wM7okGhauCPwc+P/hxQBDlZL
	 xZTw3doM3AY5T8+e2BkQtz2z5aQSN7WjAhGNTDTFSq2WV7EUz9LMiqQkbWTC5AkJ/uhky
	 LSIC5FTtQvqg40IYs+w+1o9lz8C8fNBEP4qOB0am2Wvofh2KJpQJn/r+xLxpB9jIdLzE8
	 N6tzioiBHmcQ8oPeBku8U+DrSGrGvoAnaA5F7Gji2WRy1NdgLdVxWYU0/PDz1GRrCPgUl
	 qXOr/g8YUI9pD0JE3WM9481oZ1Euz62H5VD8II75n7ktbH+iMoL+uCl9IAtfTFmXvqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jmzrbtvj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E25D606D80E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jmzrbtvj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0341F00A20;
	Thu,  5 Nov 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896254;
	bh=4CVsdYIniE0on55XqKXOAgOnbpE4vVSoU2vmeXz/FtY=;
	h=From:To:Cc:Subject:Date;
	b=JmzrbtvjMEAuDGFkOD5Yy6BQ2fEUWb/SCfoGXXCbfvBi2IzYKPRi16cUEezsSehgP
	 CULxZqUU+huDyLFpzNJHy8tJRZqUN9Z2B0pPGQ7nmYUls8DMILFn645s2gL11wtuhi
	 Wqp+iBtBXNMwtLqVslSVSOhLNbfCkn6znRzCsHSDOU/TgYdFQux0UJXh3mvuB2ONfN
	 brLFSwiunYkzGuJqsQ13UhsoG9XU23bko1QiP5Dt4gwE3+yNgAC6dlIc/YRc7PrYth
	 Ee/jZLYkoLNp+tZe3EhxaXn5Hmx0JXTn4v7H8WqVZPe8rUQNUyU1pUjIgV2xT9SmR1
	 4Zakt2eJx5XRA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Phil Auld <pauld@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 00/47 v2] cpu/hotplug: Remove cpu_down() global stop_machine() except for CPUHP_TEARDOWN_CPU itself
Date: Thu,  5 Nov 2026 17:29:58 +0100
Message-ID: <20261105163045.38862-1-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Please double check CPUHP_AP_CPU_PM_STARTING with which I'm not too
confident.

In the end only CPUHP_TEARDOWN_CPU (which is __cpu_disable()) remains in
the global stop machine, this will be the next step. The plan will be to
(all with IRQs disabled)

* Clear the CPU from cpu_online_mask

* Start an RCU grace period and poll on it (while doing momentary eqs in
  the loop), this *should work* with IRQs disabled. So all CPUs observe
  the CPU as offline.

* Check if the rest of x86 __cpu_disable() can be accomodated to run
  without making other CPUs spin.

Changes since v2:

* Remove the irq work kick because nohz full kick now has content in its
  irq_work callback.

* Fix a build issues

* Kick the new timekeeper with the more appropriate wake_up_nohz_cpu()
  function.

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	core/hotplug-v2

HEAD: 12f90ee6b38dbe86a3c8b9eccd8a0b509bfc005b
Thanks,
	Frederic
---

Frederic Weisbecker (47):
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
 include/linux/stop_machine.h             | 12 ++++++++----
 kernel/cpu.c                             | 21 +++++++++++++++++++--
 kernel/sched/core.c                      |  1 -
 kernel/stop_machine.c                    | 14 +++++++++++---
 kernel/time/tick-common.c                | 15 +++++++++------
 21 files changed, 74 insertions(+), 37 deletions(-)
