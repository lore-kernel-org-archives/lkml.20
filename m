Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225920;
	b=wcLRWhha75whcB0yRWm+wB0ZgUQQpVaC2l0wMTtrIAS6cbAVNRhhOQAcKtB7hf0XP965
	 bhNRfr3eBwMQ7Psy0CDuFWlq9kJhPE2EyGlP461jOAD8LLxB3Hu5pivqU+IMv8YcMNPoO
	 rf7Nrk2NNPnB85kwTLQRORIzQQOluev954VG3NjnSBouc4szih27f11uFKu3BOM/t0+GO
	 2Qn9C9iJWa7ru3DcmHk0rtvxcUSL0Cha17VHJRPleLSXYYnvshm5loSWIMpDXuwZ4firV
	 LMm9XE0YilCYVH7hSQTr0KGWcqMiS+UJNpYGl49v/0pOJxyyiEY1tdO/0NehYTigkeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225920;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KskkUGty1iNE6UcXC+HDPavjLCWymN3yFFfBa9g833A=;
	b=aRLXcrUUyAzraWTiBLDQrzRuc9GTXanHy+9triolzRploULUIGjkORTp+AqwnuoI3H8m
	 YrtayQv8zGKTh0uk9BhJuXtui8qEQe4mthybwdwD76ZXS+YMFBPlDJMFh+rnpeCUSjnaM
	 K03HtFigscJUMlfAmEW6phxfwjzQ9Tu+f2z4/GlT4ugl+ih6GxcDxrrq8Xyuwi1jwp6JY
	 4cMfC/0OFwcZ6tLJ4xBm1dNeF5LnZrYxlZjPcBDMP8Cb3XgDxz8G5He9fpQVfwaRIK3+Z
	 AzbibXFxO9duu9NsR2nEWKyJjSad29fySOGnygnkYKK9tnI+mik7dPkoDiLK5zSAqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N35wPGsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B4606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N35wPGsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C9E1F008A3;
	Mon,  9 Nov 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225920;
	bh=KskkUGty1iNE6UcXC+HDPavjLCWymN3yFFfBa9g833A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N35wPGsJeoWxIpoO2dJegT1A+/siw7F+lbw9O6kSfXRd8gTt3+YU2u7TBAAugmZZ4
	 EpzNTiU1BYgnv1CkT4VxnMEuENCH/Xqm1/ZffZGSzbHea/e3a2QxXTt7/L7o88CHR8
	 F7eH0ry+5GU2+UESUSIAmxBfG7gGLwwfd7eFKSmTbKZuZSNRCwLZTJ7GCW4Sj2zsv4
	 b4sTpXn1ihwfIArihA+4swEoa1Kabiirwa/SRtMXCHZwuJX46cL1d3a9lTgpHuZxPg
	 P8fNaPHNMnaZPhLsQEwJPkbRZFsjM7RD4CQ/QsStaCRpJmKK2aHLJWSHULGvVdzRUJ
	 G5dPd1AnGBTXg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 2/6] arm64: entry: Always inline helpers used by non-instrumentable paths
Date: Mon,  9 Nov 2026 19:44:55 +0800
Message-ID: <20261109114500.20298-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The noinstr entry and exit paths call MTE and SME helpers, CPU feature
checks, and the architecture-specific rescheduling check. Several of
these helpers use plain inline, which permits the compiler to emit
instrumentable out-of-line copies.

A GCC build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y emitted
mte_disable_tco_entry(), sme_enter_from_user_mode() and
sme_exit_to_user_mode() in .text.

Use __always_inline for these helpers and their nested feature checks
so they inherit the instrumentation restrictions of their callers

Also update sme_enter_from_user_mode() and sme_exit_to_user_mode() to
use tif_test_bit(TIF_SME) instead of test_thread_flag(TIF_SME)

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/cpufeature.h   |  8 ++++----
 arch/arm64/include/asm/entry-common.h |  2 +-
 arch/arm64/include/asm/fpsimd.h       |  8 ++++----
 arch/arm64/include/asm/mte-kasan.h    |  4 ++--
 arch/arm64/include/asm/mte.h          | 10 +++++-----
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e3c8a1493dc8..c62949693b92 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -774,7 +774,7 @@ static __always_inline bool system_supports_fpsimd(void)
 	return alternative_has_cap_likely(ARM64_HAS_FPSIMD);
 }
 
-static inline bool system_uses_hw_pan(void)
+static __always_inline bool system_uses_hw_pan(void)
 {
 	return alternative_has_cap_unlikely(ARM64_HAS_PAN);
 }
@@ -840,12 +840,12 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
 }
 
-static inline bool system_supports_mte(void)
+static __always_inline bool system_supports_mte(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
+static __always_inline bool system_has_prio_mask_debugging(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
 	       system_uses_irq_prio_masking();
@@ -950,7 +950,7 @@ static inline bool cpu_has_hw_af(void)
 						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
 }
 
-static inline bool cpu_has_pan(void)
+static __always_inline bool cpu_has_pan(void)
 {
 	u64 mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
 	return cpuid_feature_extract_unsigned_field(mmfr1,
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 1905765159aa..4856bc453c01 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -27,7 +27,7 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 
 #define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
 
-static inline bool arch_irqentry_exit_need_resched(void)
+static __always_inline bool arch_irqentry_exit_need_resched(void)
 {
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..e7c881c1c1f7 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -749,17 +749,17 @@ void sme_enable_dvmsync(void);
 void sme_set_active(void);
 void sme_clear_active(void);
 
-static inline void sme_enter_from_user_mode(void)
+static __always_inline void sme_enter_from_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
-	    test_thread_flag(TIF_SME))
+	    tif_test_bit(TIF_SME))
 		sme_clear_active();
 }
 
-static inline void sme_exit_to_user_mode(void)
+static __always_inline void sme_exit_to_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
-	    test_thread_flag(TIF_SME))
+	    tif_test_bit(TIF_SME))
 		sme_set_active();
 }
 
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
index de910f1c19e1..cc2151325eb0 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -18,14 +18,14 @@
 /* Whether the MTE asynchronous mode is enabled. */
 DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
 
-static inline bool system_uses_mte_async_or_asymm_mode(void)
+static __always_inline bool system_uses_mte_async_or_asymm_mode(void)
 {
 	return static_branch_unlikely(&mte_async_or_asymm_mode);
 }
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
-static inline bool system_uses_mte_async_or_asymm_mode(void)
+static __always_inline bool system_uses_mte_async_or_asymm_mode(void)
 {
 	return false;
 }
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 83f3b05fc784..de71d3449064 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -222,7 +222,7 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
 }
 #endif
 
-static inline void mte_disable_tco_entry(struct task_struct *task)
+static __always_inline void mte_disable_tco_entry(struct task_struct *task)
 {
 	if (!system_supports_mte())
 		return;
@@ -245,7 +245,7 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void);
 
-static inline void mte_check_tfsr_entry(void)
+static __always_inline void mte_check_tfsr_entry(void)
 {
 	if (!kasan_hw_tags_enabled())
 		return;
@@ -256,7 +256,7 @@ static inline void mte_check_tfsr_entry(void)
 	mte_check_tfsr_el1();
 }
 
-static inline void mte_check_tfsr_exit(void)
+static __always_inline void mte_check_tfsr_exit(void)
 {
 	if (!kasan_hw_tags_enabled())
 		return;
@@ -278,10 +278,10 @@ static inline void mte_check_tfsr_exit(void)
 static inline void mte_check_tfsr_el1(void)
 {
 }
-static inline void mte_check_tfsr_entry(void)
+static __always_inline void mte_check_tfsr_entry(void)
 {
 }
-static inline void mte_check_tfsr_exit(void)
+static __always_inline void mte_check_tfsr_exit(void)
 {
 }
 #endif /* CONFIG_KASAN_HW_TAGS */
-- 
2.55.0

