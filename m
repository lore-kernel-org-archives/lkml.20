Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036839;
	b=udTzNskbttcqLmjEFMeTkVQbzFSiNfcvWjeAhcEE/iHu0Wesycd2NnLlGSh3Ww+wnJtx
	 NnmAN8F54adIwkrXc+o5ZRfnZXVUm6xFDMHf4cNVI6OSPftzorvpaA8wlek8rTrjJ9hvk
	 ekNMpmFj04NWGFW/TgAbnohJC24POw5wmjaXw600Zhi1yHSJfKkWRpI30kI9Eu2ca+qBs
	 fnPowF5zzyP9wciI3uvv48fB3PYJyYkg/L3NOL+PeQcWtZjJwRo+Xl4kiUU/zw7QCMohy
	 2g1tn0TNJP3cvdAMhnhAqlOFc/b84rg/xAw10XjAFizxIajCVAQn5gzhdWemeMDCzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036839;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FbGBm47tNYc92nP6La+c3CzQA70ZHrCkA+HjF/TETiY=;
	b=hav/xVWwHanU5EkeZ2ws/aBBtBaE+M+VSQ8C2EEpD9SOZ/C1Q5LsS3M+nBVD/jDV3u0P
	 kqhwnk5bCfnexeA7o7in/fX7cH0rbWkULaU73PCLbDov9paSaNgp7Ly5eFLl77L6UFCob
	 lFU3jpkdGEptMOVgZ1KJ8UUZEaA7jvwYhWsRp6D0DiiBEpMmyxkEKlU+HDK9y9UW4nIfS
	 87a9KoZvWq1Ei3DnBpXqaTmFuMIfR11y1kEAbOlgJBQfX76NW8pq6ftIdmFqjJdFNzTJy
	 yfehOWGbVVRsWxPi8yZr1X7TcWoJhn9CgNQhDi8VObgS7zKAMCbmhBi2zkhYG2vTWwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOnwfVzT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE9606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOnwfVzT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC3D1F008A2;
	Sat,  7 Nov 2026 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036837;
	bh=FbGBm47tNYc92nP6La+c3CzQA70ZHrCkA+HjF/TETiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lOnwfVzTCtL7gDM+PcYpKoyrqSGazZYg27t906AkpBaSua7ooa60wGklHbYfhqBkx
	 7Xzf6MQzApazvD16Apns/+ug3yMR/DwyLOdVSW4KEKCht5DhHQfkc2fzmGCk9Ov1EQ
	 OWgR5yC4pCufnYQNWsBwq9K6shFHcE5dpgO6V2T9KX9TYcPKN34QBnp1T5ZDGUtpRm
	 XKO8CUC5tOPEdXFHhrYL0TIPSDQR5PCRXjqA5X4rYKNtcGx/FefwhleDbuIpbtcpvO
	 ctcbl3/9Kqdh7yxsgBcNIHFyuRxTWhtaYtOmAg7XLSaKCLQsEnEUrimaZz5blVRZlF
	 wbTghD6QyeLwQ==
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
Subject: [PATCH 2/4] arm64: entry: Always inline helpers used by non-instrumentable paths
Date: Sat,  7 Nov 2026 15:13:37 +0800
Message-ID: <20261107071339.17467-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071339.17467-1-jszhang@kernel.org>
References: <20261107071339.17467-1-jszhang@kernel.org>
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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/cpufeature.h   | 8 ++++----
 arch/arm64/include/asm/entry-common.h | 2 +-
 arch/arm64/include/asm/fpsimd.h       | 4 ++--
 arch/arm64/include/asm/mte-kasan.h    | 4 ++--
 arch/arm64/include/asm/mte.h          | 6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

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
index a67d5774e672..157d0551f627 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -749,14 +749,14 @@ void sme_enable_dvmsync(void);
 void sme_set_active(void);
 void sme_clear_active(void);
 
-static inline void sme_enter_from_user_mode(void)
+static __always_inline void sme_enter_from_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
 	    test_thread_flag(TIF_SME))
 		sme_clear_active();
 }
 
-static inline void sme_exit_to_user_mode(void)
+static __always_inline void sme_exit_to_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
 	    test_thread_flag(TIF_SME))
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
index 83f3b05fc784..b2bf2e70c9ae 100644
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
-- 
2.55.0

