Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435304F4CF4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748057; cv=none; b=tuZtTyeOndv0/qfDx7Mx9sTX4PTarj4zQlRhFuVRINhgQ2onhiEShMqAwgzMjwSUI4GpSlNd/sIdw2qHvliYu7etctbNhMuKK13vyTYoJi10zwR+Q16zuhtL0pPCIFhinJC3tnDA6N9Jd4/9kRMBcH7LirbHq/us6ntob8nQwww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748057; c=relaxed/simple;
	bh=45Os9dok78RfEbHW3Rd8R/S6LjvlK7ufMwgd9l9xIKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXwPlTVefKFuOFt5YfUnfrcjq2UE3Z//VtynEafQrw2uWgXjP/M2hZcrYhVKsk43k+W1fj7pYHBQc0201bxsig+o1MeaDu/0cBUIvaHlkeaWBazNkbMFIdGG9oWEKN3jhKzEDBiflyjqHZDhIELGOs9UuNkk5eayAqSL8wDRn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfNDDED3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfNDDED3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6B21F000FF;
	Fri, 18 Sep 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748055;
	bh=VB5k3Wml/fFNZyCpymkNQJ+FvcHgU5DxlT/k8e3AOT0=;
	h=From:To:Cc:Subject:Date;
	b=JfNDDED3TFrWpiX+nNirvrgEs/m6uPBbLSElfwyQm9AUKS6xZYMBmM/fdYK0m/TLh
	 1grbiZWVzUeNDpFxlHzxAdPpl77Yt86F/wVWEptggr1NhIbYLooOjTDP1B7p74cHiK
	 lcDRarH0F2Jb0AudIg/216NPdLRgKnNPZLVLghsCJSYv35mfkuD5yYuUO2+li8zwGW
	 6mbMDhlzLnCXbaq+TaXu0ULaQKb7Dv+J8bR3Fe35PDDlGHLDVyMZbLPHISM/PSCGBa
	 uY/KSwxNcbLZbCPw2/U5VH2RisPJmGoW97jWu1FCcj7LAyfT19jvpvdf3+WfS2pMWt
	 Xo7R+xspjSuWQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp into SP_EL0
Date: Fri, 18 Sep 2026 17:13:44 +0100
Message-ID: <20260918161407.2300-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is version two of the kernel stack juggling patches I previously
posted here:

  https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org

Changes since v1 include:
  * Fixed suspend/resume paths to handle the stack pointers properly
  * Fixed restoration of ptrauth keys on resume
  * Added tags

Cheers,

Will

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Mostafa Saleh (1):
  KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit

Will Deacon (20):
  arm64: entry: Defer setting of TPIDRRO_EL0 until exit to userspace
  arm64: entry: Only check for stack overflow on exceptions from EL1
  arm64: stackprotector: Temporarily disable per-task stackprotector
  arm64: bpf: Add support for generating reads of TPIDRRO_EL0
  arm64: Store 'current' in TPIDRRO_EL0 instead of SP_EL0
  selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
  scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
  arm64: stackprotector: Re-enable per-task stackprotector
  arm64: percpu: Specialise set_my_cpu_offset() for the primary CPU
  arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
  KVM: arm64: Preserve handler/thread bit of EL1 mode in
    __finalise_el2()
  arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
  arm64: sdei: Support SDEI events from kernel handler and thread modes
  arm64: entry: Point SP_EL0 at the overflow stack
  arm64: entry: Implement EL1t exception handlers for overflow stack
  arm64: entry: Use SPSel to switch to overflow stack
  arm64: entry: Split up kernel_ventry macro into separate helper macros
  arm64: entry: The great stack switcheroo
  arm64: tracing: Advertise a mode of EL1t in synthetic kernel regs
  arm64: Rename 'overflow_stack' and OVERFLOW_STACK_SIZE

 arch/arm64/Kconfig                            |   2 +-
 arch/arm64/Makefile                           |   2 +-
 arch/arm64/include/asm/assembler.h            |   2 +-
 arch/arm64/include/asm/current.h              |   6 +-
 arch/arm64/include/asm/ftrace.h               |   4 +-
 arch/arm64/include/asm/insn.h                 |   1 +
 arch/arm64/include/asm/kvm_asm.h              |  26 +++++
 arch/arm64/include/asm/memory.h               |  10 +-
 arch/arm64/include/asm/percpu.h               |  10 +-
 arch/arm64/include/asm/perf_event.h           |   2 +-
 arch/arm64/include/asm/sdei.h                 |   2 +
 arch/arm64/include/asm/stacktrace.h           |   9 +-
 arch/arm64/include/asm/stacktrace/nvhe.h      |   3 +-
 arch/arm64/include/uapi/asm/ptrace.h          |   1 +
 arch/arm64/kernel/asm-offsets.c               |   2 +
 arch/arm64/kernel/entry-common.c              |  51 +++++++--
 arch/arm64/kernel/entry.S                     | 108 +++++++++---------
 arch/arm64/kernel/head.S                      |   8 +-
 arch/arm64/kernel/hyp-stub.S                  |   7 +-
 arch/arm64/kernel/process.c                   |  21 +---
 arch/arm64/kernel/sdei.c                      |   6 +-
 arch/arm64/kernel/sleep.S                     |   3 +-
 arch/arm64/kernel/smp.c                       |  19 ++-
 arch/arm64/kernel/stacktrace.c                |   2 +-
 arch/arm64/kernel/sys_compat.c                |   7 --
 arch/arm64/kernel/traps.c                     |  14 +--
 arch/arm64/kvm/hyp/entry.S                    |  15 ++-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |   2 -
 arch/arm64/kvm/hyp/nvhe/host.S                |   2 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c          |   4 +-
 arch/arm64/kvm/stacktrace.c                   |   4 +-
 arch/arm64/mm/proc.S                          |  16 ++-
 arch/arm64/net/bpf_jit.h                      |   2 +
 arch/arm64/net/bpf_jit_comp.c                 |   4 +-
 scripts/gdb/linux/cpus.py                     |   2 +-
 .../selftests/bpf/progs/verifier_jit_inline.c |   2 +-
 36 files changed, 230 insertions(+), 151 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

