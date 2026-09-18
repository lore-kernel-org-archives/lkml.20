Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141B4F5DF3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743177; cv=none; b=FoFngCScY4brnFhTUYxfVuH8X1aWsqC4ZJNqt0TqaWIjHyEm0iDajqll98emBq1tRDSvuL9fpmV9ld4qdpcw6XPt6fVwgeYYt0NiGlKlqPVqb4Uub1SixzcS5Tmg0tGk1BYZGJBG2O9fKF5TkLmJdiTo29Jvz/tSzv6CzK2spuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743177; c=relaxed/simple;
	bh=kUjVykxBgZ48iAkG83MXlDe95tjr3avIowvv+ejq+m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJPSKeRTGVuuzOOC/AxSwc52j8ipJDyR060gqRp+tV/FPwcqzTcT0yFl8F9AAQXysAejoRI37Uado9Qi0I+1tc3EPy0epz7Wog3e1cab9AhVxmxwB/s8UMr6OAZ7ig2Q4mMx+ecj4xhmsCr0nmNZBXjBLuU0oEAT+iWEnimNi2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwsWtx3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwsWtx3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35E21F00898;
	Fri, 18 Sep 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743172;
	bh=qQd7ODwO4bXjEtPFM6OmreeZx9u+APc+qcSW720QQrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dwsWtx3WoEW2g0xhJti0Uw1qcJ4Sow2HARqwo7x2KxI8Xz6q2jGtrjPP8HJ7icLE1
	 UG5B6hZqHMM7unamwjnYv/9yZcotVtvWq8NKeaYxH7CdkoOdWiDvp9SVhI8t6xAnxY
	 7Hi9yvZKlfgb4+BsphiEOVRYSS5EobUdzzaQQ22NElW4EzknFJpy1elX/cD8PA4KCx
	 mE0dEz8G1vEfLMSMXPD/EqD7M5ZxZ88tNm9d0cL4q3sQ8A10X/U6hMIcu3c+rwIyPj
	 6LZAtkzQ2Txnod6ILhmcFGRYItJ2SqrcBnQkBuPVw9lWhHBaE07ZdTk5OwzLcJc2WQ
	 OIoWSBf3iPrhQ==
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
Subject: [PATCH v3 09/13] arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
Date: Fri, 18 Sep 2026 15:52:11 +0100
Message-ID: <20260918145217.1669-10-will@kernel.org>
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
CONFIG_CPU_BIG_ENDIAN from the arm64 kernel port.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/processor.h   |  2 --
 arch/arm64/include/asm/ptrace.h      |  6 ----
 arch/arm64/include/asm/sysreg.h      | 50 ++++++++--------------------
 arch/arm64/include/asm/thread_info.h |  5 ---
 arch/arm64/kernel/fpsimd.c           | 21 ++----------
 arch/arm64/kernel/image.h            | 18 ++--------
 arch/arm64/kernel/kexec_image.c      |  5 ++-
 arch/arm64/kernel/kgdb.c             |  6 +---
 arch/arm64/kernel/ptrace.c           |  8 ++---
 arch/arm64/kernel/signal32.c         |  3 --
 arch/arm64/kernel/sys32.c            |  5 ---
 11 files changed, 23 insertions(+), 106 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6dfbcacd9ba0..481f1999f7c1 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -351,8 +351,6 @@ static inline void compat_start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long pstate = PSR_AA32_MODE_USR;
 	if (pc & 1)
 		pstate |= PSR_AA32_T_BIT;
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-		pstate |= PSR_AA32_E_BIT;
 
 	start_thread_common(regs, pc, pstate);
 	spectre_v4_enable_task_mitigation(current);
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d..57c98c775aca 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -66,12 +66,6 @@
 #define PSR_AA32_IT_MASK	0x0600fc00	/* If-Then execution state mask */
 #define PSR_AA32_GE_MASK	0x000f0000
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define PSR_AA32_ENDSTATE	PSR_AA32_E_BIT
-#else
-#define PSR_AA32_ENDSTATE	0
-#endif
-
 /* AArch32 CPSR bits, as seen in AArch32 */
 #define COMPAT_PSR_DIT_BIT	0x00200000
 
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..f97c60b5dfca 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -62,19 +62,10 @@
 
 #else  /* CONFIG_BROKEN_GAS_INST */
 
-#ifndef CONFIG_CPU_BIG_ENDIAN
-#define __INSTR_BSWAP(x)		(x)
-#else  /* CONFIG_CPU_BIG_ENDIAN */
-#define __INSTR_BSWAP(x)		((((x) << 24) & 0xff000000)	| \
-					 (((x) <<  8) & 0x00ff0000)	| \
-					 (((x) >>  8) & 0x0000ff00)	| \
-					 (((x) >> 24) & 0x000000ff))
-#endif	/* CONFIG_CPU_BIG_ENDIAN */
-
 #ifdef __ASSEMBLER__
-#define __emit_inst(x)			.long __INSTR_BSWAP(x)
+#define __emit_inst(x)			.long (x)
 #else  /* __ASSEMBLER__ */
-#define __emit_inst(x)			".long " __stringify(__INSTR_BSWAP(x)) "\n\t"
+#define __emit_inst(x)			".long " __stringify(x) "\n\t"
 #endif	/* __ASSEMBLER__ */
 
 #endif	/* CONFIG_BROKEN_GAS_INST */
@@ -835,39 +826,26 @@
 #define SCTLR_ELx_A	 (BIT(1))
 #define SCTLR_ELx_M	 (BIT(0))
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define ENDIAN_SET_EL2		SCTLR_ELx_EE
-#else
-#define ENDIAN_SET_EL2		0
-#endif
-
 #define INIT_SCTLR_EL2_MMU_ON						\
 	(SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |	\
-	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |		\
-	 SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
+	 SCTLR_ELx_IESB | SCTLR_ELx_WXN | SCTLR_ELx_ITFSB |		\
+	 SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
 
-#define INIT_SCTLR_EL2_MMU_OFF \
-	(SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
+#define INIT_SCTLR_EL2_MMU_OFF	(SCTLR_EL2_RES1)
 
 /* SCTLR_EL1 specific flags. */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define ENDIAN_SET_EL1		(SCTLR_EL1_E0E | SCTLR_ELx_EE)
-#else
-#define ENDIAN_SET_EL1		0
-#endif
-
 #define INIT_SCTLR_EL1_MMU_OFF \
-	(ENDIAN_SET_EL1 | SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | \
-	 SCTLR_EL1_EIS  | SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
+	(SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS  |		\
+	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 
 #define INIT_SCTLR_EL1_MMU_ON \
-	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA    | \
-	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I     | \
-	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE  | \
-	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB | \
-	 ENDIAN_SET_EL1   | SCTLR_EL1_UCI    | SCTLR_EL1_EPAN  | \
-	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
-	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
+	(SCTLR_ELx_M      | SCTLR_ELx_C      | SCTLR_ELx_SA     | \
+	 SCTLR_EL1_SA0    | SCTLR_EL1_SED    | SCTLR_ELx_I      | \
+	 SCTLR_EL1_DZE    | SCTLR_EL1_UCT    | SCTLR_EL1_nTWE   | \
+	 SCTLR_ELx_IESB   | SCTLR_EL1_SPAN   | SCTLR_ELx_ITFSB  | \
+	 SCTLR_EL1_UCI    | SCTLR_EL1_EPAN   | SCTLR_EL1_LSMAOE | \
+	 SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS    | SCTLR_EL1_TSCXT  | \
+	 SCTLR_EL1_EOS)
 
 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c8..161b91762e93 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -29,13 +29,8 @@ struct thread_info {
 	union {
 		u64		preempt_count;	/* 0 => preemptible, <0 => bug */
 		struct {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-			u32	need_resched;
-			u32	count;
-#else
 			u32	count;
 			u32	need_resched;
-#endif
 		} preempt;
 	};
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..65e7147067aa 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -621,23 +621,6 @@ static int __init sme_sysctl_init(void) { return 0; }
 #define ZREG(sve_state, vq, n) ((char *)(sve_state) +		\
 	(SVE_SIG_ZREG_OFFSET(vq, n) - SVE_SIG_REGS_OFFSET))
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	u64 a = swab64(x);
-	u64 b = swab64(x >> 64);
-
-	return ((__uint128_t)a << 64) | b;
-}
-#else
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	return x;
-}
-#endif
-
-#define arm64_le128_to_cpu(x) arm64_cpu_to_le128(x)
-
 static void __fpsimd_to_sve(struct arm64_sve_state *sst,
 			    struct user_fpsimd_state const *fst,
 			    unsigned int vq)
@@ -647,7 +630,7 @@ static void __fpsimd_to_sve(struct arm64_sve_state *sst,
 
 	for (i = 0; i < SVE_NUM_ZREGS; ++i) {
 		p = (__uint128_t *)ZREG(sst, vq, i);
-		*p = arm64_cpu_to_le128(fst->vregs[i]);
+		*p = fst->vregs[i];
 	}
 }
 
@@ -702,7 +685,7 @@ static inline void sve_to_fpsimd(struct task_struct *task)
 	vq = sve_vq_from_vl(vl);
 	for (i = 0; i < SVE_NUM_ZREGS; ++i) {
 		p = (__uint128_t const *)ZREG(sst, vq, i);
-		fst->vregs[i] = arm64_le128_to_cpu(*p);
+		fst->vregs[i] = *p;
 	}
 }
 
diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
index 7bc3ba897901..5c10ca773363 100644
--- a/arch/arm64/kernel/image.h
+++ b/arch/arm64/kernel/image.h
@@ -24,28 +24,14 @@
  * when PIE is in effect. So we need to split them up in 32-bit high and low
  * words.
  */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define DATA_LE32(data)				\
-	((((data) & 0x000000ff) << 24) |	\
-	 (((data) & 0x0000ff00) << 8)  |	\
-	 (((data) & 0x00ff0000) >> 8)  |	\
-	 (((data) & 0xff000000) >> 24))
-#else
-#define DATA_LE32(data) ((data) & 0xffffffff)
-#endif
-
 #define DEFINE_IMAGE_LE64(sym, data)				\
-	sym##_lo32 = DATA_LE32((data) & 0xffffffff);		\
-	sym##_hi32 = DATA_LE32((data) >> 32)
+	sym##_lo32 = (data) & 0xffffffff;			\
+	sym##_hi32 = (data) >> 32
 
 #define __HEAD_FLAG(field)	(__HEAD_FLAG_##field << \
 					ARM64_IMAGE_FLAG_##field##_SHIFT)
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define __HEAD_FLAG_BE		ARM64_IMAGE_FLAG_BE
-#else
 #define __HEAD_FLAG_BE		ARM64_IMAGE_FLAG_LE
-#endif
 
 #define __HEAD_FLAG_PAGE_SIZE	((PAGE_SHIFT - 10) / 2)
 
diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..b8d0fb0a9daf 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -40,7 +40,7 @@ static void *image_load(struct kimage *image,
 {
 	struct arm64_image_header *h;
 	u64 flags, value;
-	bool be_image, be_kernel;
+	bool be_image;
 	struct kexec_buf kbuf = {};
 	unsigned long text_offset, kernel_segment_number;
 	struct kexec_segment *kernel_segment;
@@ -58,8 +58,7 @@ static void *image_load(struct kimage *image,
 	/* Check cpu features */
 	flags = le64_to_cpu(h->flags);
 	be_image = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_BE);
-	be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
-	if ((be_image != be_kernel) && !system_supports_mixed_endian())
+	if (be_image && !system_supports_mixed_endian())
 		return ERR_PTR(-EINVAL);
 
 	value = arm64_image_flag_field(flags, ARM64_IMAGE_FLAG_PAGE_SIZE);
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 968324a79a89..3426d0908973 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -60,11 +60,7 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	 * 32-bits. Look for the big comment in asm/kgdb.h for more
 	 * detail.
 	 */
-	{ "pstate", 4, offsetof(struct pt_regs, pstate)
-#ifdef CONFIG_CPU_BIG_ENDIAN
-							+ 4
-#endif
-	},
+	{ "pstate", 4, offsetof(struct pt_regs, pstate)},
 	{ "v0", 16, -1 },
 	{ "v1", 16, -1 },
 	{ "v2", 16, -1 },
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..7405c76724bf 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2517,12 +2517,8 @@ static int valid_compat_regs(struct user_pt_regs *regs)
 {
 	regs->pstate &= ~SPSR_EL1_AARCH32_RES0_BITS;
 
-	if (!system_supports_mixed_endian_el0()) {
-		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-			regs->pstate |= PSR_AA32_E_BIT;
-		else
-			regs->pstate &= ~PSR_AA32_E_BIT;
-	}
+	if (!system_supports_mixed_endian_el0())
+		regs->pstate &= ~PSR_AA32_E_BIT;
 
 	if (user_mode(regs) && (regs->pstate & PSR_MODE32_BIT) &&
 	    (regs->pstate & PSR_AA32_A_BIT) == 0 &&
diff --git a/arch/arm64/kernel/signal32.c b/arch/arm64/kernel/signal32.c
index bb3b526ff43f..5edcab50f753 100644
--- a/arch/arm64/kernel/signal32.c
+++ b/arch/arm64/kernel/signal32.c
@@ -334,9 +334,6 @@ static void compat_setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 	/* The IT state must be cleared for both ARM and Thumb-2 */
 	spsr &= ~PSR_AA32_IT_MASK;
 
-	/* Restore the original endianness */
-	spsr |= PSR_AA32_ENDSTATE;
-
 	if (ka->sa.sa_flags & SA_RESTORER) {
 		retcode = ptr_to_compat(ka->sa.sa_restorer);
 	} else {
diff --git a/arch/arm64/kernel/sys32.c b/arch/arm64/kernel/sys32.c
index 12a948f3a504..8ac07aeb018d 100644
--- a/arch/arm64/kernel/sys32.c
+++ b/arch/arm64/kernel/sys32.c
@@ -59,12 +59,7 @@ COMPAT_SYSCALL_DEFINE6(aarch32_mmap2, unsigned long, addr, unsigned long, len,
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off_4k);
 }
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define arg_u32p(name)	u32, name##_hi, u32, name##_lo
-#else
 #define arg_u32p(name)	u32, name##_lo, u32, name##_hi
-#endif
-
 #define arg_u64(name)	(((u64)name##_hi << 32) | name##_lo)
 
 COMPAT_SYSCALL_DEFINE6(aarch32_pread64, unsigned int, fd, char __user *, buf,
-- 
2.55.0.1082.g2b9226bbc0-goog

