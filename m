Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15A46EC69
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799236; cv=none; b=MYXvrJTtW3ZcUpBLSyp4TA6BwpQVnxNZm2nFfQFajXX0z6aGLQo7PRrI92ivet0M/hqQ6KPP9UBZDTIDrU2JTAKbCRqLVEG6Jc/jobRKMin5sHEHOqxFnnmyDG6lR/l1V7DLeDvV6p008oOhcPaEcrEkE9RVuoveYDQOro2JgWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799236; c=relaxed/simple;
	bh=1F/avLJ4y0pWbxAkXGAs4g1OnQWJK4mHnH4w8qn9TUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKCh8UwRSvlZWcKqEsPmeg+h9XArYcQrhqMZK6Dv+PUDfhMmtBlP6ClAIenzTTxUQ8R0mTenoz12CBwSB0pTM8ptma675LFG4yUMiSdPhtfwCimGOa7eNCSBs4S7xoRIEVLA5ocbpGLGKEcxXRFUabYvkh1YErBwJUHTB6yjmdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDV4y1v8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDV4y1v8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AF91F00A3A;
	Mon,  7 Sep 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799235;
	bh=gBGuo6KnqXqsFfn3QCTJl5hI5ySulmyEQsyzQJEAmYs=;
	h=From:To:Cc:Subject:Date;
	b=KDV4y1v8guFhAijX8XKlKOXbsu1jybXCUHGgjBgiNH8zzx4oNNxD/reUghf/Rh7Ql
	 Qwvl/TYEg+xQSemO0RNjr4VvwuXfQmTjW2fwMVVZc30ngiA2qi1/jyBX9hrNLzFnDf
	 NDWSsHmJ+WrdgGyxeM0qjJsQIMIMP9KYZdyaY/3HhTnLYLuMFkCkhGIHDeZEIO+Jrl
	 ozHo8YbAM6/qacHrG5BZgJBPe2dXvMRXHu/22cacd/NgMf2OUrBzoRj6Wvj/peVhVH
	 h80Rv4zn1dilRK7+8EXrE1A16ktp0WHILM+ne4+Fez6n5alu5Z3Gie1Nz10IIr4+g4
	 n6vyabo0CDGeA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Mon,  7 Sep 2026 17:40:03 +0100
Message-ID: <20260907164024.17164-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
previous series from Jinjie [1], and I'm grateful to him for his support
getting this alternative version in shape for posting.

I previously spoke at KVM forum about this work last year:

  https://www.youtube.com/watch?v=Q6kOshnnQuE

There are three major benefits realised by these changes:

1. We ditch our home-brew secondary CPU synchronisation in favour of
   constructs in the core code.

2. They offer a performance advantage on some platforms, where getting a
   CPU into the kernel can take time. I'm hoping Jinjie can provide
   numbers in this case.

3. When used inside a confidential guest, they provide protection
   against a malicious VMM that puts secondary CPUs into the guest
   kernel after the onlining operation has timed out.

The first four patches are small changes to the generic code to make it
a little more "Arm-shaped" but the rest of the series is largely
confined to the arm64 architecture and PSCI driver code.

The series is based on -rc2, as it otherwise conflicts with Fuad's GMID
fix that was recently merged upstream.

All feedback welcome,

Will

[1] https://lore.kernel.org/all/20260624092537.2916971-1-ruanjinjie@huawei.com/

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

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
 arch/arm64/include/asm/smp.h              |  40 +--
 arch/arm64/include/asm/topology.h         |   2 +
 arch/arm64/kernel/acpi_parking_protocol.c |   3 +-
 arch/arm64/kernel/asm-offsets.c           |   1 +
 arch/arm64/kernel/cpu_ops.c               |  34 ++-
 arch/arm64/kernel/cpufeature.c            | 322 ++++++++++++----------
 arch/arm64/kernel/cpuinfo.c               |  27 --
 arch/arm64/kernel/head.S                  |  64 ++++-
 arch/arm64/kernel/psci.c                  |  13 +-
 arch/arm64/kernel/smp.c                   | 179 ++++++------
 arch/arm64/kernel/smp_spin_table.c        |   2 +-
 arch/arm64/mm/mmu.c                       |   2 +-
 arch/x86/kernel/smpboot.c                 |   6 +-
 drivers/firmware/psci/psci.c              |  27 +-
 include/linux/cpuhotplug.h                |   4 +-
 include/linux/psci.h                      |   3 +-
 include/linux/rcutree.h                   |   2 +-
 kernel/cpu.c                              |  28 +-
 22 files changed, 429 insertions(+), 350 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

