Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7D4FB9DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799383; cv=none; b=YnRAO48ZNEgKVuFAoaoRXieRSYd31GbfuMJhaKYuq9MQ6gYBxQ/3DJJBgLdAYcz1MSjUjwhdx8dFG6Xlte0+7Gz/+Dwok87n7eNVjNq0AkPxwcnatgfTFU4t1VGF+V8XWjDR9O/n3vAUGbqeRMdqnX2soXNAoALN3dSze1O7Xbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799383; c=relaxed/simple;
	bh=uigLUSbzWg+P7+ZAt0QNI8u/srsfKETEy/aFFduvO4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcrkdX/YS5z3D7jg5MDSDlJ+vCbP0oMijV0PNAI42p730IbdtQbvrCNEGE+85NoHawfNn2vvwumcUC0SyQ7JG/IRkQitb/7ynSQ/qj4xVeh+nmm+9rBFnidC2YuaJ5ohcuLzHgbZDvAxAcqu+Logdg1y3V0KhLihIBBl9MFAGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDYwbdY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDYwbdY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686421F00A3A;
	Mon,  7 Sep 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799380;
	bh=P4jKMpcIdJzbnnvDkp8cLn4ahVhEZzZgk7bGD2aqm5A=;
	h=From:To:Cc:Subject:Date;
	b=NDYwbdY70ZMhV1Cnj8QlWHbxOrnTxI7OsOF2nnj8ENA8prloAy/lf5PAyGVLvXejh
	 eyl2ltEq9aR9TSIKFnJGbvbv0HwWANR+u8Eonujzu5RwOpqtPeotyIAT+zsJPmn8xX
	 ZKPTGVVFMqxJ4lWZa5JjjipATMNd+7CerclNa3A3t8Qlt2+jmD8HvJ+f6ezMy3yZ48
	 zOHnQ1umFpFeWDOkgEOH4KCn5jNgxCT7YMdetVGpjXz1n79D1iFDG25HPxRRlOea2X
	 36/ToA3TsXZiTPp+ouXZljJgXKWO/YtB0H2T1ck0lq7XbqGedb5p8ElXwXXzS3Mstc
	 HzDCj68HS82OA==
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
Subject: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp into SP_EL0
Date: Mon,  7 Sep 2026 17:42:25 +0100
Message-ID: <20260907164247.17223-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series is a bit of a complicated juggling act that, on its own,
doesn't achieve an awful lot. However, it lays the ground work for
sizing the kernel stack at runtime, e.g. via a cmdline option or even
potentially on a per-task basis and so I would like to work towards
getting it merged independently.

The series is based on v7.3-rc1 and structured as follows:

  * The first 9 patches move the 'current' task pointer from SP_EL0
    to TPIDRRO_EL0.

  * The following 8 patches point the newly-freed SP_EL0 at the overflow
    stack and switch to it explicitly when we detect a kernel stack
    overflow.

  * The final 4 patches turn everything on its head, so that the
    overflow stack and kernel stack are swapped, with the former now
    residing in SP_EL1 and the latter in SP_EL0.

At the end of all that, when we take an exception from EL1, we are
immediately transitioned to the overflow stack (now renamed "exception
stack") and can push registers right away. This also means that using
SPINTMASK to control NMI masking becomes a possibility, although
speaking to Mark, Vladimir and Ada, they all seem to prefer ALLINT.

Mostafa will soon post a follow-up series that allows the kernel stack
size to be specified on the kernel cmdline, which we are hoping to use
to configure an 8k stack size in Android. I will be talking more about
all of this at LPC in the Memory Management MC:

  https://lpc.events/event/20/contributions/2419/

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
 arch/arm64/kernel/smp.c                       |  19 ++-
 arch/arm64/kernel/stacktrace.c                |   2 +-
 arch/arm64/kernel/sys_compat.c                |   7 --
 arch/arm64/kernel/traps.c                     |  14 +--
 arch/arm64/kvm/hyp/entry.S                    |  15 ++-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |   2 -
 arch/arm64/kvm/hyp/nvhe/host.S                |   2 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c          |   4 +-
 arch/arm64/kvm/stacktrace.c                   |   4 +-
 arch/arm64/mm/proc.S                          |   3 +
 arch/arm64/net/bpf_jit.h                      |   2 +
 arch/arm64/net/bpf_jit_comp.c                 |   4 +-
 scripts/gdb/linux/cpus.py                     |   2 +-
 .../selftests/bpf/progs/verifier_jit_inline.c |   2 +-
 35 files changed, 218 insertions(+), 147 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

