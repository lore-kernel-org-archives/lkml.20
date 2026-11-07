Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065856;
	b=SO6hvpkhAYE5HtAFRMwkZcIbFqAlCxGEfd+1lW+UaXfpdgfNiNusyLUTh2Vi+Dy3iAAq
	 JUr34n/kHxSeLqRNImlnKHxGHo38BFCCfUI4O90URcxyfFBTvuuI17m4CQd44YIpd48cm
	 XPqunXffo0TYj8L63Paf1cKiyNW4WaPHTqt0mI8FBn0OcQM+5LDzN3dBam40btenBlwB2
	 Ew+5v7qyHWl71pklSb6FYl8pKZWQz4GOm1LgA4dhcITxa7E2JctZg+rb6CU9bIBJrT287
	 G0cK/TnqS2JYTq+xI4ezE3B7jrBruTZ4rkVePGRkBUPy95tKQcVLMFHi4raNQQz2sZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=;
	b=tOr9HpHEYgDG92RKWbagbBAJLXzT3PAvnEQ7eOXish0gaPAbHkGdzgeCvPkmh+cmBDkQ
	 KBbvRD6ayomme/IvF7oTCJq6EGXZ42MNIP1mpT20JX915BJ7WMHv4sDJoQc39xXKh0tDe
	 GucLJhF6eAk0R5XkHYiCAANCOXsdAU/xgU3JUApGMNuZLXcmNbZ/wrg7MF40DiTK8Ag+F
	 gWgynlfOvG67rVl6YYHmaGOsXNmjVNCEekJw9xvWY+8G9tFku8OFsjWN6mW0y0Bh8czp6
	 5iExbFYUatN7jeoqX2PzKzVZAt0nYU8whIyiLPYL1F01Wk+bneaWGt6EeZfKNugg/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jIF27ljC;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F160A260A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4F160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jIF27ljC
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c41b03cd1dcso155951366b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065854; x=1794670654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=;
        b=jIF27ljCv7NPpHKSFsfEOZnUSFR5GckNRcxT2mcjTT1AJWMke13UWrwhUwFvmPZu4v
         QYirUULTKn9GRAymmIBxuEyZCbCLHn/asfTUIXMyD7pDTwGvw+pm1sV/7XFvlRPrydu8
         dFUCQl3fA49KijLTKdftJ8PuwLwy9eN8ataamHUv9fuzf4kYd4HAvajejqmy8FqKe3su
         wmq6ZFMC0KSub/fjMXBC31UuWTmqiisABL1TANpdC+ZsuOgql2FrR/xo7o1KpE6SDWk2
         QRXOMa+zattuClPMpeV/peWyZdxh3Oa7YAl+o1+uWabC1mXHIxz2TfiQ5imaQWctnhEK
         +Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065854; x=1794670654;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=;
        b=VZAJoiBnL8rruiAglcUqkN6A0Qe614bXH3QCsmCbDi61H+3EYkg0xEdNM6s8RqBmix
         zB07QImaXXPyyCgWx5SSJd6a9lc5olJA5DPs/NIx2Nb9SpOHeeRTqQ8EOwKbBFCQNe19
         P/2roUeIpcF+0Zk18yabDDng/XM5We64jeJrt3rvBvtklC4kH1xve3YrugnykTKeoK3f
         +vG5pnJmLUkTjIAsDpmavPYI+ACfjb4CD/F3ZVj+ahR2TEWSrEfcHOAdys8YWx/1giAz
         QOK3yNndP0nTk+dqs/rZ18bypsTR5JbFIMnzZeL1UYlyqm0FEq2qOn4wzM1bgxPyUiFK
         c/Vw==
X-Forwarded-Encrypted: i=1; AL+hErE+c0Dgy9kaf4zz0jnuBddjAbibTZP7SXiPnuGLoT1AotIW1Dsmva7krXRemVJ9wyKmAZ9c45qwxk31KM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sx+emNOBxsK2awHLUxq/XwR3lzcZDd9DRNR8Hweq12lwM7iKh
	pLvYSCindjJdSbBSp0ZiBVfB0yLIx+KkjzQZ1fCybIeCknY2n6f4JzRg0UiK3vte/vKr7XRTwAj
	mIQ==
X-Received: from ejblg2.prod.google.com ([2002:a17:906:f882:b0:c31:97e0:f2cc])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97c7:b0:c4c:ddd1:d006
 with SMTP id a640c23a62f3a-c4d34c3e908mr432353866b.38.1794065853944; Sat, 07
 Nov 2026 07:37:33 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:25 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-19-d84ea5f30f94@google.com>
Subject: [PATCH 19/24] arm64: Rework static branches for kernel MTE
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Rename system_uses_mte_async_or_asymm_mode() to the more concise
system_uses_async_mte_faults(), which better reflects the intention, and
relocate it from <asm/mte-kasan.h> to <asm/mte.h> as it reflects the
state of MTE, not KASAN. This removes <asm/mte-kasan.h> from <asm/mte.h>
and further progresses our untangling of the features.

Introduce the all-encompassing system_uses_mte(), tracking when any mode
of MTE is used by the kernel (mimicking <asm/cpufeature.h>) and use it
in place of KASAN functions, when the intention was to check MTE state.

For now, leave the mte_enable_kernel_*() unchanged even though they
clearly don't support arbitrary successive transitions, as commented in
mte_enable_kernel_{async,asymm}(). Once we want to clean that up, note
that the TCF bits map cleanly to the static branches:

        TCF[0]  <-->  mte_sync_or_asymm_mode
        TCF[1]  <-->  mte_async_or_asymm_mode

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 19 -------------------
 arch/arm64/include/asm/mte.h            | 32 +++++++++++++++++++++++++++++=
++-
 arch/arm64/include/asm/uaccess.h        |  9 ++++-----
 arch/arm64/include/asm/word-at-a-time.h |  4 ++--
 arch/arm64/kernel/entry-common.c        | 10 +++++-----
 arch/arm64/kernel/mte.c                 | 26 +++++++++++++++++---------
 6 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 24d5d9d6d04b..9d018d3a0b3b 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -47,25 +47,6 @@ static __always_inline u8 kasan_tag_from_mte(u8 tag)
 	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-
-/* Whether the MTE asynchronous mode is enabled. */
-DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
-
-static inline bool system_uses_mte_async_or_asymm_mode(void)
-{
-	return static_branch_unlikely(&mte_async_or_asymm_mode);
-}
-
-#else /* CONFIG_KASAN_HW_TAGS */
-
-static inline bool system_uses_mte_async_or_asymm_mode(void)
-{
-	return false;
-}
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #ifdef CONFIG_ARM64_MTE
=20
 /*
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1e20a43c0a67..8826d64c8e33 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -7,13 +7,13 @@
=20
 #include <asm/compiler.h>
 #include <asm/mte-def.h>
-#include <asm/mte-kasan.h>
=20
 #ifndef __ASSEMBLER__
=20
 #include <linux/bitfield.h>
 #include <linux/page-flags.h>
 #include <linux/sched.h>
+#include <linux/static_key.h>
 #include <linux/types.h>
=20
 #include <asm/barrier.h>
@@ -33,6 +33,36 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
+#ifdef CONFIG_KASAN_HW_TAGS
+DECLARE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
+DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
+
+static inline bool system_uses_sync_mte_faults(void)
+{
+	return static_branch_unlikely(&mte_sync_or_asymm_mode);
+}
+
+static inline bool system_uses_async_mte_faults(void)
+{
+	return static_branch_unlikely(&mte_async_or_asymm_mode);
+}
+#else
+static inline bool system_uses_sync_mte_faults(void)
+{
+	return false;
+}
+
+static inline bool system_uses_async_mte_faults(void)
+{
+	return false;
+}
+#endif
+
+static inline bool system_uses_mte(void)
+{
+	return system_uses_sync_mte_faults() || system_uses_async_mte_faults();
+}
+
 static __always_inline bool __mte_get_reset_tfsr(void)
 {
 	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index e99faabd5dfc..22a176ac8341 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -16,7 +16,6 @@
  */
 #include <linux/bitops.h>
 #include <linux/kasan-checks.h>
-#include <linux/kasan-enabled.h>
 #include <linux/string.h>
=20
 #include <asm/asm-extable.h>
@@ -145,13 +144,13 @@ static inline void __uaccess_disable_mte(void)
 	 * Unlike get_user(), privileged uaccess (TTBR0) uses TCF (not TCF0)
 	 * such that a bad user address tag could trigger a kernel MTE fault.
 	 */
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		set_pstate_tco(1);
 }
=20
 static inline void __uaccess_enable_mte(void)
 {
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		set_pstate_tco(0);
 }
=20
@@ -316,7 +315,7 @@ do {									\
 	__typeof__(dst) __gkn_dst =3D (dst);				\
 	__typeof__(src) __gkn_src =3D (src);				\
 									\
-	if (system_uses_mte_async_or_asymm_mode())			\
+	if (system_uses_async_mte_faults())				\
 		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
 		      (__force type *)(__gkn_src), err_label, K);	\
 	else								\
@@ -422,7 +421,7 @@ do {									\
 	__typeof__(dst) __pkn_dst =3D (dst);				\
 	__typeof__(src) __pkn_src =3D (src);				\
 									\
-	if (system_uses_mte_async_or_asymm_mode())			\
+	if (system_uses_async_mte_faults())				\
 		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
 			      (__force type *)(__pkn_dst), err_label, K); \
 	else								\
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index 430d5ab8f042..53fd58460235 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -10,7 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
=20
-#include <asm/mte-kasan.h>
+#include <asm/mte.h>
 #include <asm/sysreg.h>
=20
 struct word_at_a_time {
@@ -64,7 +64,7 @@ static inline unsigned long load_unaligned_zeropad(const =
void *addr)
 	unsigned long ret;
=20
 	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		return __load_unaligned_zeropad(addr);
=20
 	set_pstate_tco(1);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index db4ff003a5b6..c6a9cc4e99a2 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -77,14 +77,14 @@ static __always_inline void mte_enter_from_kernel_mode(=
void)
 	 * Taking an exception sets TCO but clearing it can be expensive on
 	 * some architectures so first check that MTE is actually required.
 	 */
-	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+	if (system_uses_mte() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
=20
 	if (!kasan_hw_tags_enabled())
 		return;
=20
 	/* Asynchronous faults are sync'ed automatically on kernel entry. */
-	if (system_uses_mte_async_or_asymm_mode() && __mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && __mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
@@ -94,13 +94,13 @@ static __always_inline void mte_exit_to_kernel_mode(voi=
d)
 		return;
=20
 	/* Asynchronous faults require explicit sync'ing on kernel exit. */
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
 static __always_inline void mte_enter_from_user_mode(void)
 {
-	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+	if (system_uses_mte() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
 }
=20
@@ -109,7 +109,7 @@ static __always_inline void mte_exit_to_user_mode(void)
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index b65e3aa3bd07..675ba6a803cf 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -13,6 +13,7 @@
 #include <linux/ptrace.h>
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
+#include <linux/static_key.h>
 #include <linux/string.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
@@ -37,6 +38,8 @@ static DEFINE_PER_CPU_READ_MOSTLY(u64, mte_tcf_preferred)=
;
  */
 DEFINE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
 EXPORT_SYMBOL_GPL(mte_async_or_asymm_mode);
+DEFINE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
+EXPORT_SYMBOL_GPL(mte_sync_or_asymm_mode);
 #endif
=20
 void mte_sync_tags(pte_t pte, unsigned int nr_pages)
@@ -114,10 +117,13 @@ void mte_enable_kernel_sync(void)
 	 * Make sure we enter this function when no PE has set
 	 * async mode previously.
 	 */
-	WARN_ONCE(system_uses_mte_async_or_asymm_mode(),
+	WARN_ONCE(system_uses_async_mte_faults(),
 			"MTE async mode enabled system wide!");
=20
 	__mte_enable_kernel("synchronous", SCTLR_EL1_TCF_SYNC);
+
+	if (!system_uses_sync_mte_faults())
+		static_branch_enable(&mte_sync_or_asymm_mode);
 }
=20
 void mte_enable_kernel_async(void)
@@ -132,7 +138,7 @@ void mte_enable_kernel_async(void)
 	 * mode in between sync and async, this strategy needs
 	 * to be reviewed.
 	 */
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		static_branch_enable(&mte_async_or_asymm_mode);
 }
=20
@@ -150,7 +156,9 @@ void mte_enable_kernel_asymm(void)
 		 * mode in between sync and async, this strategy needs
 		 * to be reviewed.
 		 */
-		if (!system_uses_mte_async_or_asymm_mode())
+		if (!system_uses_sync_mte_faults())
+			static_branch_enable(&mte_sync_or_asymm_mode);
+		if (!system_uses_async_mte_faults())
 			static_branch_enable(&mte_async_or_asymm_mode);
 	} else {
 		/*
@@ -227,9 +235,9 @@ static void mte_update_gcr_excl(struct task_struct *tas=
k)
 {
 	/*
 	 * SYS_GCR_EL1 will be set to current->thread.mte_ctrl value by
-	 * mte_set_user_gcr() in kernel_exit, but only if KASAN is enabled.
+	 * mte_set_user_gcr() in kernel_exit, when the kernel uses MTE.
 	 */
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		return;
=20
 	write_sysreg_s(
@@ -275,13 +283,13 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
+	if (!system_uses_mte() && uaccess_requires_mte(next))
 		set_pstate_tco(0);
=20
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		return;
=20
 	/*
@@ -348,7 +356,7 @@ void mte_suspend_enter(void)
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
@@ -393,7 +401,7 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		if (!kasan_hw_tags_enabled() && uaccess_requires_mte(task))
+		if (!system_uses_mte() && uaccess_requires_mte(task))
 			set_pstate_tco(0);
 		preempt_enable();
 	}

--=20
2.56.0.455.g6c5a503b38-goog

