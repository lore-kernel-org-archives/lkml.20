Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493D298CA5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540468; cv=none; b=h1T9otzzN6IHsI/Wp1bm8iyGRqqVniJrq72E+f4slmwEWgfb3TmP4qixjexT7JBDgzn9H4xampAHm0E4kS/zVrpNaAH6Q0bykUdIifZi3QINXEff2b55moE+9rYZPG2ZA66UUQYtvMNRHNgI9op2Q6Rg41FbFfjcY1WRUv+nwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540468; c=relaxed/simple;
	bh=wja0wbArcOjF+BDTE6Qpu9CVaJ+dG2fTSR8+jIfuxfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tUha1eJMQU7qNPMwSx9ifzjpqy+lvPx4hDqs/vNYV2TR2uAhbzWSdN44ISQUArxDEpBJdTpDjGg5T6/SoNkOSduBxm2Ce/mxVHws0hVwek5OcEeGnIpfY02vQzNnaXXovRSOl3wFktiKQ0MVnG4EPMmR/2OVBKtnJoGQ5K6Y4fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+rd38II; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+rd38II"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB45C1F000FF;
	Fri,  9 Oct 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540467;
	bh=GEBevZt8DA6W+E15e+36sCnrm9+ONPQxDT/m/YIsKHs=;
	h=From:To:Cc:Subject:Date;
	b=O+rd38II3NHqSXLeMx05k6vOAK0swCQZvqoTneP1ZH84AJh1o/5CSfJs0VLCiduko
	 TEwYKtNmwvLkxJ94Nbsv6KjfvPgy5LMVZjLOneqy/nRwQcg3vAuyBElmeMb/eNMz8Q
	 nPyvNXyK5y9Ct2dPOwob+HPgSgVuxP2YbETveuRWSnVliw2TwPGh275L+zQvHArWdY
	 AJPRvRacAhnL0q8iuNjajeIeM0Kw54o30tpPAuGzxmsz9Rgv05scJOmBWboxpZUM/0
	 fFnwXLSlIb+VpNQdiSVozDFOv+2VvK+TkrEyNgBmvFGtsfh7POqJ2iAtNkWBpGAh/i
	 XHXX4voXCogow==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 00/23] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Fri,  9 Oct 2026 11:07:11 +0100
Message-ID: <20261009100738.31288-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

This is version two of the patches I previously posted here:

  https://lore.kernel.org/all/20260907164024.17164-1-will@kernel.org/

There have been quite a few changes since last time, thanks to all the
feedback from humans and robots alike. These include:

  * Added tags (but I didn't carry over Pankaj's T-b, since the series
    has changed a fair bit).

  * Fix secondary entry assembly code to handle timeouts correctly.

  * Fix stashing of MPIDR so that we don't clobber STACK_END_MAGIC.

  * Fix NULL dereference if PSCI fails to initialise.

  * Enable RCU as soon as a secondary CPU is alive.

  * Drop pointless (unreachable) optimisation to
    arch_cpuhp_sync_state_poll().

  * Include cpufeature patches from Fuad so that 'cpu_data' is populated
    with register values taking into account any cmdline overrides. This
    is necessary for correct handling of 'boot_cpu_data' later on, where
    the previous version of this series stashed a stale copy of mpamidr.

As before, the first four patches are small changes to the generic code
to make it a little more "Arm-shaped" but the rest of the series is
largely confined to the arm64 architecture and PSCI driver code.

The series is based on -rc2, as it otherwise conflicts with Fuad's GMID
fix that was recently merged upstream.

Cheers,

Will

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Ștefania Ion <stefion@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Tarun Sahu <tarunsahu@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Fuad Tabba (4):
  arm64: cpufeature: Check arm64_ftr_regs[] before the first store
  arm64: cpufeature: Add read_cpuid_with_overrides()
  arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
  arm64: cpufeature: Store every ID register with its overrides applied

Will Deacon (19):
  cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
  cpu/hotplug: Avoid trying to bring up CPUs that are already online
  cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
  cpu/hotplug: Propagate bring-up status to
    arch_cpuhp_cleanup_kick_cpu()
  arm64: smp: Tidy up smp_prepare_cpus()
  arm64: smp: Tidy up cpuinfo init and cpufeature updates
  arm64: smp: Defer update of secondary CPU capabilities
  arm64: smp: Don't bother printing the I-cache policy for each CPU
  arm64: smp: Defer RCU registration during secondary CPU bringup
  arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL machinery for CPU
    onlining
  arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU
    onlining
  arm64: cpu_ops: Make 'cpu_operations' pointer global instead of
    per-cpu
  arm64: cpu_ops: Introduce get_secondary_cpu_ops()
  firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
  firmware/psci: Extend ->cpu_on() callback to take an additional
    argument
  arm64: cpu_ops: Expose optional argument to target cpu in ->cpu_boot()
  arm64: smp: Pass secondary CPU boot parameters via firmware if
    possible
  arm64: smp: Use generic HOTPLUG_PARALLEL machinery for CPU onlining
  arm64: smp: Harden parallel CPU bringup against broken PSCI firmware

 arch/arm/kernel/psci_smp.c                |   4 +-
 arch/arm64/Kconfig                        |   2 +-
 arch/arm64/include/asm/cpu.h              |   7 +-
 arch/arm64/include/asm/cpu_ops.h          |   7 +-
 arch/arm64/include/asm/cpufeature.h       |  11 +
 arch/arm64/include/asm/smp.h              |  40 ++-
 arch/arm64/include/asm/topology.h         |   2 +
 arch/arm64/kernel/acpi_parking_protocol.c |   3 +-
 arch/arm64/kernel/asm-offsets.c           |   1 +
 arch/arm64/kernel/cpu_ops.c               |  34 +-
 arch/arm64/kernel/cpufeature.c            | 397 +++++++++++-----------
 arch/arm64/kernel/cpuinfo.c               | 122 +++----
 arch/arm64/kernel/head.S                  |  60 +++-
 arch/arm64/kernel/psci.c                  |  14 +-
 arch/arm64/kernel/smp.c                   | 183 +++++-----
 arch/arm64/kernel/smp_spin_table.c        |   2 +-
 arch/arm64/mm/mmu.c                       |   2 +-
 arch/x86/kernel/smpboot.c                 |   4 +-
 drivers/firmware/psci/psci.c              |  27 +-
 include/linux/cpuhotplug.h                |   2 +-
 include/linux/psci.h                      |   3 +-
 include/linux/rcutree.h                   |   2 +-
 kernel/cpu.c                              |  18 +-
 23 files changed, 508 insertions(+), 439 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

