Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4A5012A2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743180; cv=none; b=B1ptgA+3PcNH0PBduHur4mddeCXwknb0IOqkOhQ0dy9LeOpuQ+cyIhKVs3XaINfuiNfgZoiD2chyKBQfJewZhRJjBq7KVDR+J2LO5Lwn/mN5jdxyBNn0JttXzPjXvWfxG/ryasiu58MJLuyzxRBPZwCu+/e5bf2zW7zRt+uf1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743180; c=relaxed/simple;
	bh=1XQ6CXf+FL3no0hswPRJ8p9bw8gSpvv/sTqxmcAM2jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEl71QQgfJdYoAxZ9/xush5K0zyvon5NfEglSZ6B8w3Kk9jaEn6RnOEjIsYVU5ZSJreQR4dx2cJTk1brIXbULo1VmBIfJQGYwMPKul5AuK8bKvtUMeQaS4JpBvm53RB0eMvasoi0vnerw2yEkLuP6BR1JijKhacwesI2c/55juA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHcAmaca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHcAmaca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B21F000FF;
	Fri, 18 Sep 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743175;
	bh=JD8ZIOtKivyGk0NyqV/oIaPVWPgHUGO2nHcKVle7ZeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oHcAmaca9tIioomC1IhV1bXf3DgfPdfK2truRwuc3rrn2eSlWh11UDnWBRMLU7q0t
	 S+NM1MuufI9xwfuhmArI1McL1mzFBXXrtIP7ULaLWf+pXqdF/yphuANr7M+BvJtJOv
	 sbOF868Jqa5GrG1aZspPwjal1vquCQQ9WiodrBA9Z+LHFGAcO0hJ7YnAmgmjgAygZP
	 SNmLKIFo7esXBbfU9rajTZ6CZKahPwmlaLmrysqaL9/We4Z++JKV4Kz4/pvtzN8+ci
	 aU0xX+RGpXH5qxC1R8bNUm0W8vhRKJ8XqBJTXiOEImelj30G5NhEUmTWtpNA4+AAQ5
	 eQvkt9YklMIxA==
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
Subject: [PATCH v3 10/13] arm64: Remove all usage of __AARCH64EB__
Date: Fri, 18 Sep 2026 15:52:12 +0100
Message-ID: <20260918145217.1669-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove all usage of
__AARCH64EB__ from the arm64 kernel port.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/compat.h         | 14 --------------
 arch/arm64/include/asm/elf.h            | 12 ------------
 arch/arm64/include/asm/word-at-a-time.h |  6 ------
 arch/arm64/include/uapi/asm/byteorder.h |  4 ----
 arch/arm64/kernel/signal32.c            | 10 ----------
 arch/arm64/mm/extable.c                 |  5 -----
 6 files changed, 51 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index ae904a1ad529..5e4cc4d2f872 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -28,34 +28,20 @@ typedef u16		compat_ipc_pid_t;
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
-#ifdef __AARCH64EB__
-#define COMPAT_UTS_MACHINE	"armv8b\0\0"
-#else
 #define COMPAT_UTS_MACHINE	"armv8l\0\0"
-#endif
 
 typedef u16		__compat_uid16_t;
 typedef u16		__compat_gid16_t;
 typedef s32		compat_nlink_t;
 
 struct compat_stat {
-#ifdef __AARCH64EB__
-	short		st_dev;
-	short		__pad1;
-#else
 	compat_dev_t	st_dev;
-#endif
 	compat_ino_t	st_ino;
 	compat_mode_t	st_mode;
 	compat_ushort_t	st_nlink;
 	__compat_uid16_t	st_uid;
 	__compat_gid16_t	st_gid;
-#ifdef __AARCH64EB__
-	short		st_rdev;
-	short		__pad2;
-#else
 	compat_dev_t	st_rdev;
-#endif
 	compat_off_t	st_size;
 	compat_off_t	st_blksize;
 	compat_off_t	st_blocks;
diff --git a/arch/arm64/include/asm/elf.h b/arch/arm64/include/asm/elf.h
index d2779d604c7b..5a0bd3d38b1a 100644
--- a/arch/arm64/include/asm/elf.h
+++ b/arch/arm64/include/asm/elf.h
@@ -72,11 +72,7 @@
  * These are used to set parameters in the core dumps.
  */
 #define ELF_CLASS	ELFCLASS64
-#ifdef __AARCH64EB__
-#define ELF_DATA	ELFDATA2MSB
-#else
 #define ELF_DATA	ELFDATA2LSB
-#endif
 #define ELF_ARCH	EM_AARCH64
 
 /*
@@ -85,11 +81,7 @@
  * intent than poking at uname or /proc/cpuinfo.
  */
 #define ELF_PLATFORM_SIZE	16
-#ifdef __AARCH64EB__
-#define ELF_PLATFORM		("aarch64_be")
-#else
 #define ELF_PLATFORM		("aarch64")
-#endif
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
@@ -195,11 +187,7 @@ extern int arch_setup_additional_pages(struct linux_binprm *bprm,
 #define STACK_RND_MASK			(0x3ffff >> (PAGE_SHIFT - 12))
 #endif
 
-#ifdef __AARCH64EB__
-#define COMPAT_ELF_PLATFORM		("v8b")
-#else
 #define COMPAT_ELF_PLATFORM		("v8l")
-#endif
 
 /* AArch32 registers. */
 #define COMPAT_ELF_NGREG		18
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index 824ca6987a51..d7a3b69dc8c6 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -7,8 +7,6 @@
 
 #include <linux/uaccess.h>
 
-#ifndef __AARCH64EB__
-
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
 
@@ -36,10 +34,6 @@ static inline unsigned long zero_bytemask(unsigned long bits)
 	return bits >> 7;
 }
 
-#else	/* __AARCH64EB__ */
-#include <asm-generic/word-at-a-time.h>
-#endif
-
 /*
  * Load an unaligned word from kernel space.
  *
diff --git a/arch/arm64/include/uapi/asm/byteorder.h b/arch/arm64/include/uapi/asm/byteorder.h
index ca9cfdab33fc..b078e60f0506 100644
--- a/arch/arm64/include/uapi/asm/byteorder.h
+++ b/arch/arm64/include/uapi/asm/byteorder.h
@@ -17,10 +17,6 @@
 #ifndef __ASM_BYTEORDER_H
 #define __ASM_BYTEORDER_H
 
-#ifdef __AARCH64EB__
-#include <linux/byteorder/big_endian.h>
-#else
 #include <linux/byteorder/little_endian.h>
-#endif
 
 #endif	/* __ASM_BYTEORDER_H */
diff --git a/arch/arm64/kernel/signal32.c b/arch/arm64/kernel/signal32.c
index 5edcab50f753..3e1ce0b00a68 100644
--- a/arch/arm64/kernel/signal32.c
+++ b/arch/arm64/kernel/signal32.c
@@ -70,22 +70,12 @@ static inline int get_sigset_t(sigset_t *set,
 
 /*
  * VFP save/restore code.
- *
- * We have to be careful with endianness, since the fpsimd context-switch
- * code operates on 128-bit (Q) register values whereas the compat ABI
- * uses an array of 64-bit (D) registers. Consequently, we need to swap
- * the two halves of each Q register when running on a big-endian CPU.
  */
 union __fpsimd_vreg {
 	__uint128_t	raw;
 	struct {
-#ifdef __AARCH64EB__
-		u64	hi;
-		u64	lo;
-#else
 		u64	lo;
 		u64	hi;
-#endif
 	};
 };
 
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 6e0528831cd3..299a244f68e6 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -79,12 +79,7 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
 	addr &= ~0x7UL;
 
 	data = *(unsigned long*)addr;
-
-#ifndef __AARCH64EB__
 	data >>= 8 * offset;
-#else
-	data <<= 8 * offset;
-#endif
 
 	pt_regs_write_reg(regs, reg_data, data);
 
-- 
2.55.0.1082.g2b9226bbc0-goog

