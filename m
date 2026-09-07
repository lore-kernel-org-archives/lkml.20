Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAA51D506
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799065; cv=none; b=VWhdexLtE0AzlNHHOhBJTwsLzWWuGLxmI8ELP5/kPNlUYR13XN1Onhf0mYppMb7y6tK6berl0Wi1nsWAN2Dfvr4p5MA6AXi/M+K7CsFqvrzXOuYXtHzO3ZPEHMJ6u/UbfKwfQ/BBG8q/V+UfxHFq7yRhxKd1jgaBY+PKQey8xF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799065; c=relaxed/simple;
	bh=gPiv7RPM0e1Eo5qFjNKzvQUoiwreIXBRYQ4PSKoznI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSCrTX+WthqBeg0oxtFWfijbCBJ9bP6V158P6azIAAJw0U706a9ghXQHdHdiEMr8CVTbn3P4Qpv1ienKUjxj8GYLpH+AAJOxVQiqN8KBZofO53O0daaaIAcYiKMGmlVQqUZ7Daz/Kp6uyzsY2oFKmHx0sXDxZMpAX5B45TBA+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Si9nMXGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Si9nMXGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7241F00A3A;
	Mon,  7 Sep 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799060;
	bh=z3G8DZUhh/ihdkO7EHYMwCoMzRxS9EZESPgno/LP40M=;
	h=From:To:Cc:Subject:Date;
	b=Si9nMXGgasJcw0XRAngC8KBTUAiAvJ7wvoKyckWWdSf58dUxQUjjIGFQ2b6E99/Lx
	 zbEn+2I3RGRTFTej48yRoqajP1Xmx4FNUmgiwsqvA7vdk5BoLvtRtllesnTzfN8zii
	 Iot0tehLLCHU4i6EW8CgOc9WRTVv9BdxyBUnnn84pCkUhcc5yruyTuNCEz4AOW8qAz
	 qL9NFCg5nG7V8nhtdrLAH5CeRPXeo0wLo9l2FoKfhMotBa8Z6Oulre/4OjQ3WjA61h
	 G3cM9qyCoEVhmgm790FTIsK8AUDtQmYpFfmdjjFK0IkP0CLCD8xdFLn++y/ADPu0sE
	 fDlUHqkS6pHUA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 00/14] arm64: Remove unused big-endian support
Date: Mon,  7 Sep 2026 17:37:11 +0100
Message-ID: <20260907163726.17104-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is version two of the arm64 big-endian removal series previously
posted here:

  https://lore.kernel.org/linux-arm-kernel/20260811140132.22778-1-will@kernel.org/

Changes since v1 include:
  * Rebased onto v7.3-rc1
  * Removed some now-redundant driver Kconfig entries
  * Force little-endian during boot
  * Minor stylistic cleanups

Arnd, I wasn't quite as aggressive with the drivers Kconfigs as your
suggestion at [1], since I didn't want to prevent COMPILE_TEST from a
big-endian architecture in cases where it is currently supported.

Cheers,

Will

[1] https://lore.kernel.org/linux-arm-kernel/6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com/

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au> 
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (14):
  selftests/arm64: Remove big-endian support
  arm64: bpf: Remove big-endian support from the JIT compiler
  arm64: crypto: Assume a little-endian kernel
  arm64: lib: Assume a little-endian kernel in custom library routines
  arm64: lib: Assume a little-endian kernel in optimised string routines
  arm64: assembler: Remove endianness helper macros
  arm64: head: Force little-endian early during boot
  arm64: vdso32: Always build compat vDSO object as little-endian
  KVM: arm64: Remove support for a big-endian hypervisor object
  arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
  arm64: Remove all usage of __AARCH64EB__
  arm64: image: Remove endianness handling for generating image header
  arm64: Kbuild: Remove vestigial big-endian support
  drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN

 arch/arm64/Kconfig                           | 35 +-------
 arch/arm64/Makefile                          | 12 +--
 arch/arm64/crypto/aes-ce-ccm-core.S          |  4 +-
 arch/arm64/crypto/aes-neonbs-core.S          |  4 +-
 arch/arm64/crypto/ghash-ce-core.S            |  6 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S       |  4 +-
 arch/arm64/include/asm/assembler.h           | 42 ---------
 arch/arm64/include/asm/compat.h              | 14 ---
 arch/arm64/include/asm/elf.h                 | 12 ---
 arch/arm64/include/asm/processor.h           |  2 -
 arch/arm64/include/asm/ptrace.h              |  6 --
 arch/arm64/include/asm/sysreg.h              | 50 +++--------
 arch/arm64/include/asm/thread_info.h         |  5 --
 arch/arm64/include/asm/word-at-a-time.h      |  6 --
 arch/arm64/include/uapi/asm/byteorder.h      |  4 -
 arch/arm64/kernel/fpsimd.c                   | 21 +----
 arch/arm64/kernel/head.S                     | 25 +-----
 arch/arm64/kernel/image.h                    | 38 +-------
 arch/arm64/kernel/kexec_image.c              |  5 +-
 arch/arm64/kernel/kgdb.c                     |  6 +-
 arch/arm64/kernel/ptrace.c                   |  8 +-
 arch/arm64/kernel/signal32.c                 | 13 ---
 arch/arm64/kernel/sys32.c                    |  5 --
 arch/arm64/kernel/vdso32/Makefile            |  4 -
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h   |  4 -
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c         | 16 ----
 arch/arm64/lib/csum.c                        | 17 ----
 arch/arm64/lib/memchr.S                      |  2 +-
 arch/arm64/lib/memcmp.S                      |  2 -
 arch/arm64/lib/strcmp.S                      | 34 +------
 arch/arm64/lib/strlen.S                      | 26 ------
 arch/arm64/lib/strncmp.S                     | 93 ++------------------
 arch/arm64/lib/strnlen.S                     | 16 +---
 arch/arm64/mm/extable.c                      |  5 --
 arch/arm64/net/bpf_jit_comp.c                | 11 ---
 drivers/hv/Kconfig                           |  3 +-
 drivers/misc/vmw_vmci/Kconfig                |  2 +-
 drivers/net/ethernet/microsoft/Kconfig       |  2 +-
 drivers/soc/tegra/Kconfig                    |  5 --
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +---
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 --
 41 files changed, 54 insertions(+), 539 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

