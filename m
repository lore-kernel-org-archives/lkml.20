Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.54.77.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793537531;
	b=FDDiujrgTRLfRZWX073PSz/c62/UGkhjQFJFy5YI/V/4IWY85MbM+3xMsfk12qbQszo3
	 OdEkjf6bx9Cv6lMPv+wWaZdRx1/GxXGWS/o1T5nxSsQv1pRj4i22cpJbFqqzSB/DfE7hc
	 p3lv2PRv2o1pxY0qtgu7tXq3AA5O9+OXrFfZLwwqrydIXprRa22ds+VVDuQf4CBbKLU7U
	 dJUSY0nHY6C/2V1UIGbOY4tcQKDMik1jgBn0icBmOwa5WmbtccZXKrzR31+o7BiIJW9PN
	 LOxd919kckMsKB/WhmYnfJxtfD0mwmhwzAogthG0eYhdUbqazgqndEbNuXBy2pPcxnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793537531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=bp0cubDp0AzJmOMTzfljaFTJRflOp4n8oYa4GNCXWnI=;
	b=ZJs6fKYu7+RWyEH7IrxWAXsrSbWrNbFrMWCnbvCubrYseTmPzNgnszO1cD07bXOrVSs5
	 J9J95cbhvsAz2Iz/muYZZ279+6uIytC9yihSyYEIH8CRVSP+rU0i0LSFamu9bl9+oJ9vU
	 U9Uvx7u3j9Wv1zYbDN43LmLqqsiDHcATjCETLo8X242taKv7wbNkNJX4lmnT58G4mdNra
	 tdkEszOVxJWC6ZzDTd2eof6K1/HrGWa/EQHEJitgjGMGK7dJZKqycdoX6xNavOiym43kL
	 vM8+ppDKVaYVtYKo19m2l/aIkYKzW11lh4+orVkjEj1LFWd0tyR6AQYt7thHeu6Ocdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=207.54.77.171
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921B7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793537527; x=1825073527;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZIMGYT7hGSr5mfAEYh4LRkGjb+9m1QepFJZjEz39g4o=;
  b=VrFnet07jNsywe31u6WxS3aFZPMjjM4KLWO5ZV50koXaT/1UTWPssaPc
   tKMlssMU1oo5icnTG6Z+cEb/JNhGf1Cva6yxEHKPw3sr8RIqaVuNFa6BF
   xCuuGG4LTDod2y+R11RtdGL31KdkURv82bap3pJ3bm3UinPKXSzHwnuwF
   /FwCED5vYdi9Ti3QhWMs+BDcALKt2k1Iwwr89xNku0TltMcMrKHzRbfxM
   9Q4vijNYmL28MrIzt5hLTMiUMwN+iazMt78Fi0yaPMXpbPUUDxGfOZGQ5
   07SDapT7OmMQ5TkLpIvo9KG2VZZJcKiLavxjoiNxkT3yjjWDLyNGYjtKS
   Q==;
X-CSE-ConnectionGUID: u/TrOAksRbOvglrKS44Jxg==
X-CSE-MsgGUID: DJNQ62TATUaZTqofFZ7T+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 14:51:59 +0200
X-CSE-ConnectionGUID: zZ7iJl6VQJeYWbZ5mXnN5w==
X-CSE-MsgGUID: sDpb/WWTTuSFyk/5ZlvSzw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 01 Nov 2026 14:59:50 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 01 Nov 2026 14:51:58 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 01 Nov 2026 14:51:39 +0200
Subject: [PATCH v4 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-lrsc-only-v4-1-4e1d010463b3@mobileye.com>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
In-Reply-To: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
so keep the existing AMO sequences when the toolchain defines
__riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.

Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
selection still passes "a" in -march. Zalrsc remains required because
cmpxchg and the conditional atomics are LR/SC sequences. Zaamo can be
turned off only with CONFIG_NONPORTABLE, and only when the compiler
accepts _zalrsc in -march. GCC 15.1 introduces that support. Older compilers keep Zaamo
enabled and -march keeps "a". An LR/SC-only build passes _zalrsc
instead of "a".

Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/Kconfig               | 32 +++++++++++++++++++++++
 arch/riscv/Makefile              | 15 ++++++++---
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 14 ++++++++++
 8 files changed, 243 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..925963a61f62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -730,6 +730,38 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZALRSC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64im_zalrsc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32im_zalrsc)
+
+config RISCV_ISA_ZAAMO
+	bool "Zaamo extension support for AMO atomics" if NONPORTABLE && TOOLCHAIN_HAS_ZALRSC
+	default y
+	help
+	  Use AMO instructions for kernel atomic memory operations. When
+	  disabled, those operations are built from LR/SC and the kernel
+	  is compiled with zalrsc instead of the A extension.
+
+	  Disable this only for a hart that implements Zalrsc but not
+	  Zaamo, such as the MIPS P8700, and only when the compiler accepts
+	  _zalrsc in -march. GCC 15.1 introduces that support. Without it this
+	  option stays enabled and -march keeps the A extension.
+
+	  The resulting kernel cannot run on a hart without LR/SC.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZALRSC
+	def_bool y
+	help
+	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics
+	  require it, so it is always enabled.
+
+config RISCV_ISA_A
+	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 44f5a439741a..1b0a459a0f74 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,8 +58,9 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
+riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
@@ -75,9 +76,15 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
 export KBUILD_BASE_ISA
 
+# Zaamo is off only when the compiler accepts _zalrsc in -march.
+ifneq ($(CONFIG_RISCV_ISA_A),y)
+riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) := $(riscv-march-y)_zaamo
+riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) := $(riscv-march-y)_zalrsc
+endif
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
@@ -85,7 +92,7 @@ KBUILD_CFLAGS += $(KBUILD_BASE_ISA)
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 # For C code built with floating-point support, exclude V but keep F and D.
-CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima?|rv64ima?)([^v_]*)v?/\1\2/')
 
 KBUILD_CFLAGS += -mno-save-restore
 
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac5..dc6a8c95c975 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
 static __always_inline							\
 void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
@@ -59,7 +60,25 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
 		: "+A" (v->counter)					\
 		: "r" (I)						\
 		: "memory");						\
-}									\
+}
+#elif defined(__riscv_zalrsc)
+#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
+static __always_inline							\
+void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+}
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #define ATOMIC_OPS(op, asm_op, I)					\
@@ -84,6 +103,7 @@ ATOMIC_OPS(xor, xor,  i)
  * There's two flavors of these: the arithmetic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
@@ -108,6 +128,40 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 		: "memory");						\
 	return ret;							\
 }
+#elif defined(__riscv_zalrsc)
+#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type " %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type " %2, %2, %0\n"			\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret, temp;					\
+	__asm__ __volatile__ (						\
+		"1:	lr." #asm_type ".aqrl %1, %0\n"			\
+		"	" #asm_op " %2, %1, %3\n"			\
+		"	sc." #asm_type ".aqrl %2, %2, %0\n"		\
+		"	bnez %2, 1b\n"					\
+		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
 static __always_inline							\
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 3c1a15be54d8..311547558ff5 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -170,12 +170,17 @@ static __always_inline int variable_fls(unsigned int x)
 
 #if (BITS_PER_LONG == 64)
 #define __AMO(op)	"amo" #op ".d"
+#define __LR	"lr.d"
+#define __SC	"sc.d"
 #elif (BITS_PER_LONG == 32)
 #define __AMO(op)	"amo" #op ".w"
+#define __LR	"lr.w"
+#define __SC	"sc.w"
 #else
 #error "Unexpected BITS_PER_LONG"
 #endif
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
 ({								\
 	unsigned long __res, __mask;				\
@@ -194,6 +199,37 @@ static __always_inline int variable_fls(unsigned int x)
 		: "+A" (addr[BIT_WORD(nr)])			\
 		: "r" (mod(BIT_MASK(nr)))			\
 		: "memory");
+#elif defined(__riscv_zalrsc)
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+	unsigned long __res, __mask, __temp;			\
+	__mask = BIT_MASK(nr);					\
+	__asm__ __volatile__ (					\
+		"1: " __LR #ord " %0, %1\n"			\
+		#op " %2, %0, %3\n"				\
+		__SC #ord " %2, %2, %1\n"			\
+		"bnez %2, 1b\n"					\
+		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+		: "r" (mod(__mask))				\
+		: "memory");					\
+	((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+do {								\
+	unsigned long __res, __temp;				\
+	__asm__ __volatile__ (					\
+		"1: " __LR #ord " %0, %1\n"			\
+		#op " %2, %0, %3\n"				\
+		__SC #ord " %2, %2, %1\n"			\
+		"bnez %2, 1b\n"					\
+		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
+		: "r" (mod(BIT_MASK(nr)))			\
+		: "memory");					\
+} while (0)
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define __test_and_op_bit(op, mod, nr, addr) 			\
 	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
@@ -337,12 +373,27 @@ static __always_inline void arch___clear_bit_unlock(
 static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	unsigned long res;
 	__asm__ __volatile__ (
 		__AMO(xor) ".rl %0, %2, %1"
 		: "=r" (res), "+A" (*addr)
 		: "r" (__NOP(mask))
 		: "memory");
+#elif defined(__riscv_zalrsc)
+	unsigned long res, temp;
+
+	__asm__ __volatile__ (
+		"1: " __LR ".rl %0, %1\n"
+		"xor %2, %0, %3\n"
+		__SC ".rl %2, %2, %1\n"
+		"bnez %2, 1b\n"
+		: "=&r" (res), "+A" (*addr), "=&r" (temp)
+		: "r" (__NOP(mask))
+		: "memory");
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	return (res & BIT(7)) != 0;
 }
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 662e160b0522..0399c5b4ef35 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -57,6 +57,7 @@
 	}									\
 })
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -67,6 +68,23 @@
 		: "r" (n)						\
 		: "memory");						\
 })
+#elif defined(__riscv_zalrsc)
+#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+({									\
+	__typeof__(*(__ptr)) temp;					\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"1:	lr" sfx " %0, %1\n"				\
+		"	sc" sfx " %2, %3, %1\n"				\
+		"	bnez %2, 1b\n"					\
+		append							\
+		: "=&r" (r), "+A" (*(p)), "=&r" (temp)			\
+		: "r" (n)						\
+		: "memory");						\
+})
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
 		   sc_append, swap_append)				\
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 6f3bc9bdb85e..06fe227197d9 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -19,6 +19,7 @@
 #define __disable_user_access()		do { } while (0)
 #endif
 
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
 {								\
 	__enable_user_access();					\
@@ -32,17 +33,45 @@
 	: "memory");						\
 	__disable_user_access();				\
 }
+#elif defined(__riscv_zalrsc)
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	__enable_user_access();					\
+	__asm__ __volatile__ (					\
+	"1:	lr.w.aqrl %[ov], %[u]			\n"	\
+	"	" insn "				\n"	\
+	"2:	sc.w.aqrl %[t], %[t], %[u]		\n"	\
+	"	bnez %[t], 1b				\n"	\
+	"3:						\n"	\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])			\
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])			\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [t] "=&r" (temp), [u] "+m" (*(uaddr))			\
+	: [op] "Jr" (oparg)					\
+	: "memory");						\
+	__disable_user_access();				\
+}
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	int oldval = 0, ret = 0;
+#elif defined(__riscv_zalrsc)
+	int oldval = 0, ret = 0, temp = 0;
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 	uaddr = untagged_addr(uaddr);
 
 	switch (op) {
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	case FUTEX_OP_SET:
 		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
@@ -63,6 +92,30 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
 				  ret, oldval, uaddr, oparg);
 		break;
+#elif defined(__riscv_zalrsc)
+	case FUTEX_OP_SET:
+		__futex_atomic_op("mv %[t], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("add %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("or %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("and %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("xor %[t], %[ov], %z[op]",
+				  ret, oldval, uaddr, oparg);
+		break;
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	default:
 		ret = -ENOSYS;
 	}
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..1c7bbd7fbff8 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -73,7 +73,16 @@
 	beq	a2, zero, .Lnew_valid_map_cpus_restore_context
 
 	/* Atomically reset the current cpu bit in new_valid_map_cpus */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoxor.d	a0, a1, (a0)
+#elif defined(__riscv_zalrsc)
+1:	lr.d	a2, (a0)
+	xor	a2, a1, a2
+	sc.d	a2, a2, (a0)
+	bnez	a2, 1b
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 
 	/*
 	 * A sfence.vma is required here. Even if we had Svvptc, there's no
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f6a8ca49e627..515669bbbc96 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -265,7 +265,21 @@ SYM_CODE_START(_start_kernel)
 	/* Pick one hart to run the main boot sequence */
 	la a3, hart_lottery
 	li a2, 1
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
 	amoadd.w a3, a2, (a3)
+#elif defined(__riscv_zalrsc)
+	/*
+	 * hart_lottery is a small 32-bit counter. add is valid on RV32
+	 * and RV64; sc.w stores the low 32 bits.
+	 */
+1:	lr.w t0, (a3)
+	add t1, t0, a2
+	sc.w t1, t1, (a3)
+	bnez t1, 1b
+	mv a3, t0
+#else
+#error "Need AMO or LR/SC atomics"
+#endif
 	bnez a3, .Lsecondary_start
 #endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 

-- 
2.43.0

