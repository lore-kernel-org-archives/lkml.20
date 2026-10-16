Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077072FD1DA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161620; cv=none; b=I74HoDnI/Z68wl6krZ7lV3d44k79s7GM6kfos2LCS0CfqqFL3M/nlDTy94Ff5Db8qRGnlM9hEKjZqVaZXCMcSPfO7wpPxshZwzzoyFxFzMlZ8RAfMtFbYBw0HjKsJVcmSbTKrtLElptLdMnCqzLSVcwU7gwsK19n3UtPI28Mj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161620; c=relaxed/simple;
	bh=dafMiBXq+7T+W5XfsZvU/yxMPoC+Ai45Epxruj/L2E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iNRXmo7Hw5MbGe9fwc/ro2rs9HoFpGjyzlCvHkjt5vI4xEyYGoTTFfdrwdyYuL1UkBgaeHrrAm3h/WfwK+hnKVCXMROvEUC8yAbRujomsgM3rLntncQDobq1PsHmOJBlbe7ZEFojza3hySzInP4Qy4IyzunD3prrwKevuvfE/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DReCa6Pf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DReCa6Pf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBF841476;
	Fri, 16 Oct 2026 07:40:12 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E31443F871;
	Fri, 16 Oct 2026 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792161616; bh=dafMiBXq+7T+W5XfsZvU/yxMPoC+Ai45Epxruj/L2E0=;
	h=From:To:Cc:Subject:Date:From;
	b=DReCa6PfL6i76Ehi99PRS42BYo9hh7xbwFjNaPCqXBBUD+j51hf5h6HZ0Uuo18qhr
	 Qys9QIAxnstMOP+HMf8zx4BapD0F51189TmNt7XTFLiukOS3lKpD8w7rXBenOZpf2A
	 NK3TdXVmnEx4GzhDkiAh2gee7ei0fdFyWhOPPMPs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 updates for 7.4
Date: Fri, 16 Oct 2026 15:40:05 +0100
Message-ID: <20261016144012.547221-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here are the arm64 updates for 7.4. The more interesting bits are the
removal of big-endian kernel support (already marked BROKEN for some
time), preemptible this_cpu_*() operations and MPAM support for the
firmware-backed (Fb) interface. CCA (Arm's confidential compute) is
slowly trickling in with host RMI (Realm Management Interface) support
and some refactoring, including a dedicated SMCCC bus to advertise
firmware services. There are also the usual PMU updates for new hardware
and a few fixes/cleanups. More details in the tag.

I think there are some simple merge conflicts, depending on the order
you pull trees (KVM, mm), but the -next resolution is correct.

Thanks.

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

for you to fetch changes up to d0de3a73194a250a2e5ffbf1dc604c0bcbb16e8a:

  Merge branch 'for-next/fw-rmi' into for-next/core (2026-10-15 19:09:31 +0100)

----------------------------------------------------------------
Core features:

 - Remove big-endian kernel support: CONFIG_CPU_BIG_ENDIAN has depended
   on BROKEN for a while, so drop the remaining code (BE hypervisor
   object, BPF JIT, assembly/crypto/library routines, endianness helper
   macros, selftests) and force a little-endian build

 - Add preemptible this_cpu_*() operations (read/write, RMW, xchg,
   cmpxchg and cmpxchg128) that no longer need to disable preemption
   around the per-CPU address generation and access

 - Preparation patches for implementing CONFIG_HOTPLUG_PARALLEL on
   arm64

Memory management:

 - Treat faults taken by EFI runtime firmware as kernel faults

 - Clear PTE_WRITE for EFI_MEMORY_RO mappings (with hardware dirty state
   management enabled, this is not truly read-only)

 - Raise the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA
   configurations (28/26/24 bits for 4K/16K/64K pages)

 - Implement clear_page[s]() using memset()

 - Enable BBML2 no-abort (a.k.a. BBML3) for the NVIDIA Rigel CPU

Perf and PMU:

 - Support for HiSilicon's ITS PMU

 - Add support for some new events: INST_SIMD_ALU_VEC for Apple PMUs and
   a cycle counter for the latest version of HiSilicon's MN PMU hardware

 - A bunch of fixes to the CXL PMU driver to address pre-existing issues
   from Sashiko

 - Fix generation of PERF_RECORD_ITRACE_START records for SPE and ETM
   drivers

 - Reduce excessive stack consumption in the Marvell DDR PMU driver

 - Minor driver updates and cleanups all over

Arm Confidential Compute Architecture (CCA):

 - Add an Arm SMCCC bus for firmware services discovered through SMCCC
   and move the TRNG and CCA guest (TSM provider) drivers onto it,
   removing the dummy CCA platform device and adding a sysfs ABI for
   Realm guests

 - Move the Realm Service Interface (RSI) code out of arch/arm64/ into
   drivers/firmware/arm_rmm/

 - Add the host side of the Realm Management Interface (RMI): detect,
   configure and activate the RMM, add SRO support and wrappers for the
   Realm RMI commands

 - Block hibernation (new arch hook in the PM core) and kexec while the
   RMM is active. To be revisited in the future with proper support for
   deactivation

 - Handle Granule Protection Faults (GPFs) taken by the host, caused by
   accesses to memory delegated to the RMM. In a future patch, the
   exception table lookup will be limited to is_kdump_kernel() cases

MPAM (Memory Partitioning And Monitoring):

 - Add support for the MPAM firmware-backed (Fb) interface, allowing
   MSC accesses to be mediated by firmware

 - Fix a list of theoretical issues with the driver (MSC access error
   propagation, MBWU monitor save/restore and locking, resctrl class
   handling, error interrupt restore, maximum number of PARTIDs)

 - Add the mailing list and a missing file to the MAINTAINERS entry

 - Document when to set arm64.nompam

Errata and CPU features:

 - Add the NXP i.MX8QM/8QP workaround for the Cortex-A53 cache coherency
   issue (ERR050104), using a new ARM64_CPUCAP_SOC_ERRATUM capability
   type for SoC-level errata

Miscellaneous:

 - Mask debug exceptions (DAIF) around the hardware breakpoint register
   manipulations when called from generic kernel code

 - Don't zero the SVE state buffer when the SVE state is live

 - Return -EPERM instead of -EBUSY from the GCS prctl() locking
   failures (matching x86), with the selftest updated. Slight ABI change
   but no software deployment yet

 - kselftest: fix unsound MTE fault skipping by introducing MTE-safe
   memory accessors, avoid copying each signal test binary more than
   once

 - Update sysreg definitions (fix three enum values and two field names,
   mark architecturally dropped fields as RES0) and remove the TME
   transaction state check from the BRBE driver

 - Fix the description of ARM64_HAS_LPA2 and remove a redundant
   ID_AA64MMFR0 define

----------------------------------------------------------------
Ada Couprie Diaz (1):
      arm64/debug: mask debug exceptions when called from common code

Andre Przywara (13):
      arm_mpam: let low level MSC accessors return an error
      arm_mpam: propagate MSC access errors for hw_probe functions
      arm_mpam: propagate MSC access errors for MBWU counters
      arm_mpam: propagate MSC access errors for msmon helpers
      arm_mpam: propagate MSC access errors for __ris_msmon_read()
      arm_mpam: propagate MSC access errors for state saving function
      arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
      arm_mpam: propagate MSC access errors for interrupt control
      arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
      arm_mpam: prepare mon_sel locking for MPAM-Fb
      arm_mpam: add MPAM-Fb MSC firmware access support
      arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
      arm_mpam: detect and enable MPAM-Fb PCC support

Aneesh Kumar K.V (Arm) (9):
      firmware: smccc: Add an Arm SMCCC bus
      firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
      firmware: arm_rmm: Move RSI support out of arch/arm64
      arm64: realm: Move Realm memory encryption ops to RSI code
      virt: coco: arm-cca-guest: Rename TSM report source file
      firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
      coco: guest: arm64: Add sysfs ABI for CCA Realm guests
      coco: guest: arm64: Remove dummy CCA platform device
      firmware: smccc: Pass only the required device probe arguments

Anshuman Khandual (2):
      arm64/cpufeature: Change description for ARM64_HAS_LPA2
      arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)

Ard Biesheuvel (2):
      arm64/efi: Clear PTE_WRITE when applying EFI_MEMORY_RO
      arm64/mm: Treat faults taken by EFI runtime firmware as kernel faults

Arnd Bergmann (1):
      perf: marvell: avoid large stack variables

Ben Horgan (14):
      arm_mpam: Move MPAMF_ECR write helpers to allow reuse
      arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
      arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth counters
      arm_mpam: Add missing mon_sel locking in MBWU save and restore
      arm_mpam: Ensure MBWU counters are reset on restore
      arm_mpam: Use __ris_msmon_read() for saving MBWU state
      arm_mpam: Initialize all of struct mon_read in mpam_restore_mbwu_state()
      arm_mpam: resctrl: Correct check that existing class is L3
      arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
      arm_mpam: Don't loop forever if there is the maximum possible amount of PARTIDs
      arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
      arm_mpam: resctrl: Don't stop early when tearing down a class
      MAINTAINERS: Use linux-arm-kernel list for the MPAM driver
      arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL

Breno Leitao (1):
      arm64/sve: Don't zero the SVE state buffer when the SVE state is live

Catalin Marinas (6):
      gve: Add explicit ARM64 dependency to Kconfig
      Merge tag 'mpam/for-next/v7.4_v2' of https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux into for-next/mpam
      firmware: arm_rmm: Add SPDX and sort the Kconfig and Makefile entries
      arm64: cpufeature: Add ARM64_CPUCAP_SOC_ERRATUM for SoC-level errata
      Merge branches 'for-next/misc', 'for-next/be-gone', 'for-next/smccc-bus', 'for-next/preemptible-this-cpu', 'for-next/cpu-errata', 'for-next/mpam', 'for-next/kselftest', 'for-next/efi', 'for-next/secondary-boot-prep', 'for-next/sysreg' and 'for-next/gcs', remote-tracking branch 'arm64/for-next/perf' into for-next/core
      Merge branch 'for-next/fw-rmi' into for-next/core

Dave Jiang (11):
      perf/cxl: Program the requested event group on configurable counters
      perf/cxl: Clear stale event fields before reprogramming a counter
      perf/cxl: Fix the counter overflow delta fixup
      perf/cxl: Accept an overflow interrupt on MSI message number 0
      perf/cxl: Split the MSI vector out of info->irq
      cxl/pci: Add the PMUs after configuring events
      perf/cxl: Don't share the overflow interrupt, and keep it pinned
      perf/cxl: Unfreeze counters after handling an overflow interrupt
      perf/cxl: Validate the hardware-reported counter width
      perf/cxl: Don't log through pmu.dev in the overflow interrupt handler
      perf/cxl: Clear stale overflow status before using a counter

Fuad Tabba (10):
      arm64: mpam: Document when to set arm64.nompam
      MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
      arm64: cpufeature: Check arm64_ftr_regs[] before the first store
      arm64: cpufeature: Add read_cpuid_with_overrides()
      arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
      arm64: cpufeature: Store every ID register with its overrides applied
      arm64: sysreg: Fix three incorrect enum values
      arm64: sysreg: Fix the names of two misspelt fields
      arm64: sysreg: Mark fields the architecture dropped as RES0
      perf: arm_brbe: Remove the check for TME transaction states

Hemanth Selam (4):
      docs: arm64: Fix typo "initalised" in booting.rst
      arm64: fix typos in comments
      selftests: arm64: fix typo "hander" in comment
      arm64: include: fix repeated word 'to' in comment

Iurii Trukhin (1):
      arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA

Kohei Enju (1):
      arm64: rsi: Correct type of realm_config::hash_algo

Leo Yan (3):
      perf/core: Export perf_event_itrace_started()
      perf: arm_spe: Suppress redundant ITRACE start records
      coresight: perf: Suppress ITRACE start records

Linus Walleij (1):
      arm64: clear_page[s] using memset

Mark Brown (3):
      kselftest/arm64: Extend gcs-locking to cover cases where enable is unlocked
      arm64: gcs: Return -EPERM not -EBUSY for prctl() locking failures
      kselftest/arm64: Check for -EPERM not -EBUSY in the locking test

Mark Rutland (20):
      arm64: mte-kasan: Use IS_ENABLED() rather than ALTERNATIVE() 'cfg' parameter
      arm64: alternative: Remove 'cfg' parameter
      arm64: cmpxchg: LL/SC: Avoid redundant extension
      arm64: cmpxchg128: LSE: Remove redundant operands
      arm64: preempt: Simplify and optimize __preempt_count_dec_and_test()
      arm64: preempt: Treat should_resched() as unlikely
      arm64: ptrace: Always inline pt_regs_{read,write}_reg()
      arm64: percpu: Factor out percpu offset asm
      arm64: gpr-num: Add wxN aliases for wN registers
      arm64: gpr-num: add __GPR_NUM() helper
      arm64: entry: sdei: Restore all clobberable GPRs
      arm64: entry: sdei: Make 'tsk' available
      arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
      arm64: percpu: Implement preemptible read/write ops
      arm64: percpu: Implement preemptible void RMW ops
      arm64: percpu: Implement preemptible return RMW ops
      arm64: percpu: Implement preemptible XCHG ops
      arm64: percpu: Implement preemptible CMPXCHG ops
      arm64: percpu: Implement preemptible CMPXCHG128 ops
      arm64: percpu: Remove _pcp_protect*() wrappers

Myria Sarvay (1):
      drivers/perf: apple_m1: Add macOS 27 M2 Event

Peng Fan (1):
      arm64: errata: Add NXP i.MX8QM/8QP workaround for A53 cache coherency issue

Runyu Xiao (1):
      perf: xgene: initialize lock before requesting IRQ

Ruoyu Wang (1):
      perf/dwc_pcie: Fix PCI device reference leak in probe

Sasha Levin (2):
      arm_mpam: make the mon_sel guard conditional only
      kselftest/arm64: signal: copy each test binary only once

Shanker Donthineni (2):
      arm64: cputype: Add NVIDIA Rigel definitions
      arm64: cpufeature: Enable BBML2 for NVIDIA Rigel

Steffen Eiden (1):
      arm64: Use proper include variant

Steven Price (8):
      arm64: mm: Handle Granule Protection Faults (GPFs)
      firmware: arm_rmm: Add SMC definitions for calling the RMM
      firmware: arm_rmm: Check for RMI support at init
      firmware: arm_rmm: Configure the RMM with the host's page size
      firmware: arm_rmm: Add support for SRO
      firmware: arm_rmm: Activate the RMM
      firmware: arm_rmm: Ensure the RMM has GPT entries for memory
      firmware: arm_rmm: Add wrappers for Realm related RMI commands

Suzuki K Poulose (3):
      PM: hibernate: Add an arch hook for preventing hibernation
      arm64: Block hibernate and kexec while RMM is active
      firmware: arm_rmm: hotplug: Skip memory added to ZONE_MOVABLE

Vladimir Murzin (2):
      kselftest/arm64/mte: Introduce MTE safe memory accessors
      kselftest/arm64/mte: Use MTE safe memory accessors

Will Deacon (18):
      selftests/arm64: Remove big-endian support
      arm64: bpf: Remove big-endian support from the JIT compiler
      arm64: crypto: Assume a little-endian kernel
      arm64: lib: Assume a little-endian kernel in custom library routines
      arm64: lib: Assume a little-endian kernel in optimised string routines
      arm64: assembler: Remove endianness helper macros
      arm64: vdso32: Always build compat vDSO object as little-endian
      KVM: arm64: Remove support for a big-endian hypervisor object
      arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
      arm64: Remove all usage of __AARCH64EB__
      crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
      arm64: Kbuild: Remove vestigial big-endian support
      drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
      arm64: smp: Tidy up smp_prepare_cpus()
      arm64: smp: Tidy up cpuinfo init and cpufeature updates
      arm64: smp: Defer update of secondary CPU capabilities
      arm64: smp: Don't bother printing the I-cache policy for each CPU
      arm64: smp: Defer RCU registration during secondary CPU bringup

Yifan Wu (1):
      drivers/perf: hisi: Add cycle event for new MN PMU

Yushan Wang (2):
      drivers/perf: hisi: Consolidate uncore PMU cpuhp states
      drivers/perf: hisi: Add support for uncore ITS PMU

hpp.iscas (1):
      perf/marvell: cn10k_tad: Publish the OF module alias

 Documentation/ABI/testing/sysfs-firmware-cca       |    7 +
 Documentation/admin-guide/kernel-parameters.txt    |    3 +-
 Documentation/admin-guide/perf/hisi-pmu.rst        |   16 +
 Documentation/arch/arm64/booting.rst               |    2 +-
 Documentation/arch/arm64/mpam.rst                  |   26 +
 Documentation/arch/arm64/silicon-errata.rst        |    2 +
 MAINTAINERS                                        |   10 +
 arch/arm/include/asm/archrandom.h                  |    2 +-
 arch/arm64/Kconfig                                 |   66 +-
 arch/arm64/Makefile                                |   12 +-
 arch/arm64/crypto/aes-ce-ccm-core.S                |    4 +-
 arch/arm64/crypto/aes-neonbs-core.S                |    4 +-
 arch/arm64/crypto/ghash-ce-core.S                  |    6 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S             |    4 +-
 arch/arm64/include/asm/alternative-macros.h        |   30 +-
 arch/arm64/include/asm/archrandom.h                |    2 +-
 arch/arm64/include/asm/assembler.h                 |   36 +-
 arch/arm64/include/asm/atomic_ll_sc.h              |   27 +-
 arch/arm64/include/asm/atomic_lse.h                |    4 +-
 arch/arm64/include/asm/compat.h                    |   14 -
 arch/arm64/include/asm/cpu.h                       |    7 +-
 arch/arm64/include/asm/cpucaps.h                   |    2 +
 arch/arm64/include/asm/cpufeature.h                |   35 +
 arch/arm64/include/asm/cputype.h                   |    2 +
 arch/arm64/include/asm/elf.h                       |   12 -
 arch/arm64/include/asm/gcs.h                       |    2 +-
 arch/arm64/include/asm/gpr-num.h                   |    9 +
 arch/arm64/include/asm/io.h                        |    2 +-
 arch/arm64/include/asm/kvm_host.h                  |    2 +
 arch/arm64/include/asm/mem_encrypt.h               |    5 +-
 arch/arm64/include/asm/mte-kasan.h                 |   10 +-
 arch/arm64/include/asm/page.h                      |   13 +-
 arch/arm64/include/asm/percpu.h                    |  462 ++++++--
 arch/arm64/include/asm/pgtable-prot.h              |    4 +-
 arch/arm64/include/asm/preempt.h                   |   31 +-
 arch/arm64/include/asm/processor.h                 |    2 -
 arch/arm64/include/asm/ptrace.h                    |   18 +-
 arch/arm64/include/asm/rsi.h                       |   70 --
 arch/arm64/include/asm/stage2_pgtable.h            |    2 +-
 arch/arm64/include/asm/sysreg.h                    |   52 +-
 arch/arm64/include/asm/thread_info.h               |    6 +-
 arch/arm64/include/asm/tlbflush.h                  |   62 +-
 arch/arm64/include/asm/word-at-a-time.h            |    6 -
 arch/arm64/include/asm/xwreg.h                     |   16 +
 arch/arm64/include/uapi/asm/byteorder.h            |    4 -
 arch/arm64/include/uapi/asm/ptrace.h               |    4 +-
 arch/arm64/kernel/Makefile                         |    2 +-
 arch/arm64/kernel/asm-offsets.c                    |    2 +
 arch/arm64/kernel/cpu_errata.c                     |   40 +-
 arch/arm64/kernel/cpufeature.c                     |  412 +++----
 arch/arm64/kernel/cpuinfo.c                        |  122 +--
 arch/arm64/kernel/efi.c                            |    8 +-
 arch/arm64/kernel/entry-common.c                   |   38 +
 arch/arm64/kernel/entry.S                          |   41 +-
 arch/arm64/kernel/fpsimd.c                         |   24 +-
 arch/arm64/kernel/head.S                           |    3 +-
 arch/arm64/kernel/hibernate.c                      |   14 +
 arch/arm64/kernel/hw_breakpoint.c                  |   32 +-
 arch/arm64/kernel/image-vars.h                     |    1 -
 arch/arm64/kernel/image.h                          |   18 +-
 arch/arm64/kernel/kexec_image.c                    |    5 +-
 arch/arm64/kernel/kgdb.c                           |    6 +-
 arch/arm64/kernel/machine_kexec.c                  |   11 +
 arch/arm64/kernel/ptrace.c                         |    8 +-
 arch/arm64/kernel/setup.c                          |    2 +-
 arch/arm64/kernel/signal32.c                       |   13 -
 arch/arm64/kernel/smp.c                            |   24 +-
 arch/arm64/kernel/sys32.c                          |    5 -
 arch/arm64/kernel/traps.c                          |    2 +
 arch/arm64/kernel/vdso32/Makefile                  |    4 -
 arch/arm64/kvm/arm.c                               |    5 +
 arch/arm64/kvm/config.c                            |    4 +-
 arch/arm64/kvm/emulate-nested.c                    |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h         |    4 -
 arch/arm64/kvm/hyp/nvhe/Makefile                   |    2 +-
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c               |   16 -
 arch/arm64/kvm/sys_regs.c                          |    2 +
 arch/arm64/lib/Makefile                            |    2 +-
 arch/arm64/lib/clear_page.S                        |   53 -
 arch/arm64/lib/csum.c                              |   17 -
 arch/arm64/lib/memchr.S                            |    2 +-
 arch/arm64/lib/memcmp.S                            |    2 -
 arch/arm64/lib/strcmp.S                            |   34 +-
 arch/arm64/lib/strlen.S                            |   26 -
 arch/arm64/lib/strncmp.S                           |   93 +-
 arch/arm64/lib/strnlen.S                           |   16 +-
 arch/arm64/mm/extable.c                            |    5 -
 arch/arm64/mm/fault.c                              |   40 +-
 arch/arm64/mm/init.c                               |    3 +-
 arch/arm64/mm/pageattr.c                           |   38 +-
 arch/arm64/net/bpf_jit_comp.c                      |   11 -
 arch/arm64/tools/cpucaps                           |    1 +
 arch/arm64/tools/sysreg                            |   28 +-
 drivers/acpi/arm64/mpam.c                          |    6 +-
 drivers/char/hw_random/arm_smccc_trng.c            |   32 +-
 drivers/crypto/hisilicon/sec2/sec_main.c           |    2 +-
 drivers/cxl/pci.c                                  |   11 +-
 drivers/firmware/Kconfig                           |    1 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/arm_rmm/Kconfig                   |   39 +
 drivers/firmware/arm_rmm/Makefile                  |    3 +
 drivers/firmware/arm_rmm/rmi.c                     | 1135 ++++++++++++++++++++
 .../kernel => drivers/firmware/arm_rmm}/rsi.c      |   79 +-
 drivers/firmware/smccc/Makefile                    |    2 +-
 drivers/firmware/smccc/bus.c                       |  158 +++
 drivers/firmware/smccc/smccc.c                     |   65 +-
 drivers/hv/Kconfig                                 |    3 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |    2 +
 drivers/misc/vmw_vmci/Kconfig                      |    2 +-
 drivers/net/ethernet/google/Kconfig                |    2 +-
 drivers/net/ethernet/microsoft/Kconfig             |    2 +-
 drivers/perf/apple_m1_cpu_pmu.c                    |    4 +-
 drivers/perf/arm_brbe.c                            |   18 -
 drivers/perf/arm_spe_pmu.c                         |    2 +
 drivers/perf/cxl_pmu.c                             |  107 +-
 drivers/perf/dwc_pcie_pmu.c                        |   11 +-
 drivers/perf/hisilicon/Makefile                    |    2 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c       |   34 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c      |   34 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c       |   34 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c       |  385 +++++++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c       |   21 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c        |   98 +-
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c       |   35 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c        |   34 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c           |   25 +
 drivers/perf/hisilicon/hisi_uncore_pmu.h           |    2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c      |   34 +-
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c        |   36 +-
 drivers/perf/marvell_cn10k_ddr_pmu.c               |   85 +-
 drivers/perf/marvell_cn10k_tad_pmu.c               |    1 +
 drivers/perf/xgene_pmu.c                           |    4 +-
 drivers/resctrl/Kconfig                            |    2 +
 drivers/resctrl/Makefile                           |    2 +-
 drivers/resctrl/mpam_devices.c                     | 1052 +++++++++++++-----
 drivers/resctrl/mpam_fb.c                          |  258 +++++
 drivers/resctrl/mpam_internal.h                    |   71 +-
 drivers/resctrl/mpam_resctrl.c                     |   13 +-
 drivers/soc/tegra/Kconfig                          |    5 -
 drivers/virt/coco/arm-cca-guest/Kconfig            |    3 +-
 drivers/virt/coco/arm-cca-guest/Makefile           |    2 +
 .../coco/arm-cca-guest/{arm-cca-guest.c => main.c} |   52 +-
 include/linux/arm-rmi-cmds.h                       |  581 ++++++++++
 .../asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h |   76 +-
 include/linux/arm-smccc-bus.h                      |   48 +
 include/linux/arm-smccc-rmi.h                      |  516 +++++++++
 .../asm/rsi_smc.h => include/linux/arm-smccc-rsi.h |    8 +-
 include/linux/arm_mpam.h                           |    2 +-
 include/linux/cpuhotplug.h                         |    6 -
 include/linux/device-id/arm_smccc.h                |   19 +
 include/linux/mod_devicetable.h                    |    1 +
 include/linux/rcutree.h                            |    2 +-
 include/linux/suspend.h                            |    1 +
 kernel/events/core.c                               |    1 +
 kernel/power/hibernate.c                           |    8 +-
 scripts/mod/devicetable-offsets.c                  |    3 +
 scripts/mod/file2alias.c                           |    8 +
 tools/testing/selftests/arm64/fp/fp-ptrace.c       |   19 +-
 tools/testing/selftests/arm64/gcs/gcs-locking.c    |   19 +-
 .../selftests/arm64/mte/check_buffer_fill.c        |   10 +-
 .../selftests/arm64/mte/check_child_memory.c       |    6 +-
 .../selftests/arm64/mte/check_hugetlb_options.c    |    4 +-
 .../selftests/arm64/mte/check_mmap_options.c       |   10 +-
 .../selftests/arm64/mte/check_tags_inclusion.c     |    4 +-
 .../testing/selftests/arm64/mte/mte_common_util.h  |    4 +
 tools/testing/selftests/arm64/mte/mte_helper.S     |   44 +
 tools/testing/selftests/arm64/signal/Makefile      |    4 +-
 .../testcases/fake_sigreturn_sve_change_vl.c       |    2 +-
 tools/testing/selftests/rseq/rseq-arm64.h          |    5 -
 169 files changed, 5821 insertions(+), 1961 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
 delete mode 100644 arch/arm64/include/asm/rsi.h
 create mode 100644 arch/arm64/include/asm/xwreg.h
 delete mode 100644 arch/arm64/lib/clear_page.S
 create mode 100644 drivers/firmware/arm_rmm/Kconfig
 create mode 100644 drivers/firmware/arm_rmm/Makefile
 create mode 100644 drivers/firmware/arm_rmm/rmi.c
 rename {arch/arm64/kernel => drivers/firmware/arm_rmm}/rsi.c (71%)
 create mode 100644 drivers/firmware/smccc/bus.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
 create mode 100644 drivers/resctrl/mpam_fb.c
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (82%)
 create mode 100644 include/linux/arm-rmi-cmds.h
 rename arch/arm64/include/asm/rsi_cmds.h => include/linux/arm-rsi-cmds.h (69%)
 create mode 100644 include/linux/arm-smccc-bus.h
 create mode 100644 include/linux/arm-smccc-rmi.h
 rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (97%)
 create mode 100644 include/linux/device-id/arm_smccc.h
