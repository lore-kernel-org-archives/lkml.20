Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3C4EE86E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743151; cv=none; b=BDRm0QQ6pCTwEynlWtXvaIgEyb9e63IBGfWGQjx8QtY2zgghI0dLTWipdOa45rVdw67ZzAWQfGwJ8P4Yz+aPxSa2qtUrMym23s7b3rR0y+WusuWhy8NUFoCveIlpmhiLs/xoJwqTCG9b3gAGun+3epTqf16nxH/0OoYu/kAD8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743151; c=relaxed/simple;
	bh=QVZqK0LyjQbI9nf3cQlJr3KfwfofaJopiaaM7bjz1Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9TiVXMK940NVO3PHzk2sGdmW6UCenaD9XgxL1256GzLl5DxoqRu0GVU1ce/spkUTYJs6iJ/AJuAbBamHEIoNl1e/Fi5pQrRoGNhWtKbeYLXpThCvlwCEAAoAk2BDf29rU2XXym/UbsoLF4tjzvOP/q0gmh6DECuwMXVYDEp0cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcpqClnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcpqClnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D1B1F000FF;
	Fri, 18 Sep 2026 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743144;
	bh=fIfvSB4SHJUU9pPP6ajk6opZ3RDD4b74TCPFjvSu2PA=;
	h=From:To:Cc:Subject:Date;
	b=EcpqClnQbA39ejWd2EO7hal+fUJIofW9eDtRvSptN/LDQozVeb9NK/iJj2CIHKH0q
	 vHQhC7lBrBiRX62CIiu5xNGJMvJHHHymuV8AuOtVAkVMDcX4Ess8kx3PbqpAzUdvss
	 vJ3u3rwQElbr6CIeYMdRY0lOzVo7IAaR9Vaw5qfqLqD/usDlp1oLJp9YfQEj3s2opS
	 r7XULR8wmgekgYojYNZnzrNEZnYnrPMq6/BY1mo8mCYs3MnlldrrQn2ulsEiLMsMYT
	 ei0EMsz1QMd2ZgR2/TEpGeohL2TTMiAhrjEM66RgeOH+cWYMcDnx51OHgwlGIN5TvX
	 1bmUCgc55CH/w==
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
Subject: [PATCH v3 00/14] arm64: Remove unused big-endian support
Date: Fri, 18 Sep 2026 15:52:02 +0100
Message-ID: <20260918145217.1669-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is version three of the big-endian removal series previously posted
here:

v1: https://lore.kernel.org/r/20260811140132.22778-1-will@kernel.org/
v2: https://lore.kernel.org/r/20260907163726.17104-1-will@kernel.org

Changes since v2 include:
  * Retain support for emitting absolute symbol references with PIE
  * Retain endianness handling on EFI MMU-enabled boot path
  * Invert compile-time endianness check in Hisilicon sec2 driver
  * Added some tags

Cheers,

Will

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

Will Deacon (13):
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

 arch/arm64/Kconfig                           | 35 +-------
 arch/arm64/Makefile                          | 12 +--
 arch/arm64/crypto/aes-ce-ccm-core.S          |  4 +-
 arch/arm64/crypto/aes-neonbs-core.S          |  4 +-
 arch/arm64/crypto/ghash-ce-core.S            |  6 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S       |  4 +-
 arch/arm64/include/asm/assembler.h           | 31 -------
 arch/arm64/include/asm/compat.h              | 14 ---
 arch/arm64/include/asm/elf.h                 | 12 ---
 arch/arm64/include/asm/processor.h           |  2 -
 arch/arm64/include/asm/ptrace.h              |  6 --
 arch/arm64/include/asm/sysreg.h              | 50 +++--------
 arch/arm64/include/asm/thread_info.h         |  5 --
 arch/arm64/include/asm/word-at-a-time.h      |  6 --
 arch/arm64/include/uapi/asm/byteorder.h      |  4 -
 arch/arm64/kernel/fpsimd.c                   | 21 +----
 arch/arm64/kernel/head.S                     |  3 +-
 arch/arm64/kernel/image.h                    | 18 +---
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
 drivers/crypto/hisilicon/sec2/sec_main.c     |  2 +-
 drivers/hv/Kconfig                           |  3 +-
 drivers/misc/vmw_vmci/Kconfig                |  2 +-
 drivers/net/ethernet/microsoft/Kconfig       |  2 +-
 drivers/soc/tegra/Kconfig                    |  5 --
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +---
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 --
 42 files changed, 53 insertions(+), 489 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

