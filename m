Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065860;
	b=RedNCSywSHt1Kv209pZd+kKU+573zNzgsWGz5GLU2lf0A2EvPvxnzGNej3MeTTtGrXwX
	 7iuoifxJZoCe+F9fZK48+lv+Gf4sjP3dIEtNHzKuQjvrTiFpEQHzldAIuXZfaiV3XqWo1
	 JbXbeOvNmAI1HY770bqFQgcM1fc4Y/VGLscLFNcQ5Hl9tUkgNZkW/4AxsKEbg9kTXEdgh
	 lJ5G8374gnUydmBjwX1mNbC1zYDXjcheVKWNUfNPsfV2ILB30AOnO38zU0dfFBTJ90yGs
	 TSUJaPOB235/Gye2Unqpl9nW6Rrlw3g+3Y4x5nc0cpxNMiU+LmecjqsfkOgLJ52ptoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=;
	b=m4ZvGEHRIDjEXSwnS/JOa7hPiv5GXVAspyIVgGM/wi2LSnrNK2CMljMKEpcFfQeRPw+N
	 xN2i/gkVvXajAXgKSFhIo+co5dwkSMaKN73/n34dCD45oQdSGHUV7k7Fq+Dv2XpU8p95/
	 So/hJc0/xl1AirHUykxo0yzerDYhnwOgdJlL1yPbFUkT2i5AQY+OCWjVMOM0EaWClztnA
	 6Ba26312t+HYDVBIVNYSVNwFqdIphKagNtwuugzUnOSwMNLrb7GTY8cOA4N7g7aqqu7ol
	 LqREOlkbQEXuD0YnjIPCu7hPVwW6RqUhobEzar6zOR9X+BVvhhcOmKqB3pYmpJVoVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="j/oz8U68";
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A9060A3816
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A9060A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j/oz8U68
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b4f1fcf171so1879102a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065859; x=1794670659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=;
        b=j/oz8U68ro3eib2QOtP1zfbLknsNkhBiHv4CAk3sTSmoQ4WaJvT+9E28Jq/rVnQjG5
         woh2RBcOKYlkpOrLK7uL+/G7sY/jfwrSITxYkKW4Qrx1WuJK/5upa6ihmqhNC5MBmNBT
         CY5vYX6TRHwnCuQvNEt22EzTubs5y3DtqgzUS6p/B30zUdz47cE7g/cNfPLvdCpXvTgz
         11Z3jm1zkY/88qo6WiFKZFR4RKjpdErHApIrJA1nO9mXr3E+eCKu77mdP6JQ6OVhW+Fv
         eGTM4Etziule/zXJoswfytKfe1Ry0gh2Gq4AhhHMPjP5ZwMAozEsZ+ls7bhTdiIFgmNu
         lISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065859; x=1794670659;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=;
        b=h1PVlcYfe9pEODiIOrVVhJGO+D2K0JtFeOHxQwMb273/SDXuXkr/Xyl7YitsQi7BeT
         Wlr6hntlpl26/OFVk8m/PrOzlB80f6f1Xzr/mACYVTEdIGJWIO7FrSo5Ovm71O3Z1PtS
         t9er7yFHWaSPOxKimZONYdPQ3bNipLaXiBNN4XTMJJNsofG7WAf/CxLBD9hiICco8jwH
         6yHa3edhxurfCRf477xn/MRR0ubfcsHIkzKYPMHEwG3C2T86uy7DZ1Y6f0k558scTJi7
         XyjzLP2wyVjVZJDihjyAW9UI0YOot0Hgfph3a6sSVIYMG8+okh8NGPQ93Rz8S78nEuwq
         1hUA==
X-Forwarded-Encrypted: i=1; AL+hErEk8BeZG3URUiFa/YFFJlLOm0bdhKQxeyTblKJCY6GWCIjkK/Ev7ua+6B2F2kKT8l2urmQoooHKu07mWd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kj0iO6PRgwlIRcaEpc3y8n2iIS/Bwq1uY0FYD7sUaxFKHSzW1
	XjVwSX1QJp3xYNtxE3L44q+VHlE7CfzD11GpD4OVhXe3/XC4mEMuqcWzQfwuIt4icpyt/n8KoDn
	sdA==
X-Received: from eddq13.prod.google.com ([2002:a05:6402:518d:b0:6b6:fcaf:dc3a])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27cf:b0:6b1:da03:d010
 with SMTP id 4fb4d7f45d1cf-6b5977f54c0mr4472802a12.23.1794065858398; Sat, 07
 Nov 2026 07:37:38 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:28 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-22-d84ea5f30f94@google.com>
Subject: [PATCH 22/24] arm64: Consolidate MTE-based KASAN in mte-kasan.h
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As the KASAN-agnostic logic has been carved out of these functions into
standalone MTE functions and since all their non-KASAN callers have been
migrated to those KASAN-agnostic functions and/or arch-agnostic KASAN
functions, the only remaining callers are in KASAN core code and access
them through their arch_*() aliases, which are now an unnecessary level
of indirection.

Therefore, fold the aliases into __always_inline functions.

First, note that this now exposes arch_*() as proper C symbols. Although
the aliasing macros were necessary when first introduced by commit
ccbe2aaba1ed ("arm64: kasan: add arch layer for memory tagging helpers")
because of mm/kasan/kasan.h's reliance on #ifndef to provide fallbacks,
they have since been made redundant by commit e34f1e2ee098 ("kasan: drop
empty tagging-related defines").

Second, it moves the KASAN arch definitions out of <asm/memory.h>. It
isn't clear to me why they were originally placed there but since they
are only for arch-agnostic KASAN code and are guarded by KASAN_HW_TAGS,
it seems more appropriate to have them in a KASAN arch header.

Drop the !ARM64_MTE fallbacks for mte_*() instead of renaming them since
they were deadcode, being only called through arch_*(), which were only
defined when KASAN_HW_TAGS and given that KASAN_HW_TAGS means ARM64_MTE.

Move the declarations of mte_enable_kernel_*() to <asm/mte.h> and
provide no alternatives when !ARM64_MTE since their signatures imply
that they never fail (return void) so a currently non-existent caller
could get confused. A future patch might rework that and add fallbacks.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h    | 14 -------
 arch/arm64/include/asm/mte-kasan.h | 86 ++++++++++++++--------------------=
----
 arch/arm64/include/asm/mte.h       |  5 +++
 3 files changed, 36 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 29e7537f5e58..2aa14788c050 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -309,20 +309,6 @@ static inline const void *__tag_set(const void *addr, =
u8 tag)
 	return (const void *)(__addr | __tag_shifted(tag));
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-#define arch_enable_tag_checks_sync()		mte_enable_kernel_sync()
-#define arch_enable_tag_checks_async()		mte_enable_kernel_async()
-#define arch_enable_tag_checks_asymm()		mte_enable_kernel_asymm()
-#define arch_enable_tag_checks_write_only()	mte_enable_kernel_store_only()
-#define arch_suppress_tag_checks_start()	mte_enable_tco()
-#define arch_suppress_tag_checks_stop()		mte_disable_tco()
-#define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
-#define arch_set_random_tag(addr)		mte_set_random_tag(addr)
-#define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
-#define arch_set_mem_tag_range(addr, size, tag, init)	\
-			mte_set_mem_tag_range((addr), (size), (tag), (init))
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 /*
  * Physical vs virtual RAM address space conversion.  These are
  * private definitions which should NOT be used outside memory.h
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 81a8cf3b9a95..c0224a2bb515 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -46,98 +46,74 @@ static __always_inline u8 kasan_tag_from_mte(u8 tag)
 	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
 }
=20
-#ifdef CONFIG_ARM64_MTE
+#ifdef CONFIG_KASAN_HW_TAGS
=20
 /*
- * These functions are meant to be only used from KASAN runtime through
- * the arch_*() interface defined in asm/memory.h.
  * These functions don't include system_supports_mte() checks,
  * as KASAN only calls them when MTE is supported and enabled.
  */
=20
-static inline void mte_disable_tco(void)
+static __always_inline void arch_enable_tag_checks_sync(void)
 {
-	set_pstate_tco(0);
+	mte_enable_kernel_sync();
 }
=20
-static inline void mte_enable_tco(void)
+static __always_inline void arch_enable_tag_checks_async(void)
 {
-	set_pstate_tco(1);
+	mte_enable_kernel_async();
 }
=20
-/* Get allocation tag for the address. */
-static inline u8 mte_get_mem_tag(void *addr)
+static __always_inline void arch_enable_tag_checks_asymm(void)
 {
-	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
+	mte_enable_kernel_asymm();
 }
=20
-/* Generate a random tag. */
-static inline void *mte_set_random_tag(const void *addr)
+static __always_inline int arch_enable_tag_checks_write_only(void)
 {
-	/* Writes the random MTE tag in bits [59:56]. */
-	addr =3D (const void *)__irg((u64)addr);
-
-	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
+	return mte_enable_kernel_store_only();
 }
=20
-static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
-					 bool zero)
+static __always_inline void arch_suppress_tag_checks_stop(void)
 {
-	if (zero)
-		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
-	else
-		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
-}
-
-void mte_enable_kernel_sync(void);
-void mte_enable_kernel_async(void);
-void mte_enable_kernel_asymm(void);
-int mte_enable_kernel_store_only(void);
-
-#else /* CONFIG_ARM64_MTE */
-
-static inline void mte_disable_tco(void)
-{
-}
-
-static inline void mte_enable_tco(void)
-{
-}
-
-static inline u8 mte_get_mem_tag(void *addr)
-{
-	return 0xFF;
+	set_pstate_tco(0);
 }
=20
-static inline void *mte_set_random_tag(const void *addr)
+static __always_inline void arch_suppress_tag_checks_start(void)
 {
-	return (void *)__tag_set(addr, 0xFF);
+	set_pstate_tco(1);
 }
=20
-static inline void mte_set_mem_tag_range(void *addr, size_t size,
-						u8 tag, bool init)
+static __always_inline bool arch_flush_async_tag_fault(void)
 {
+	return mte_get_reset_tfsr();
 }
=20
-static inline void mte_enable_kernel_sync(void)
+/* Get allocation tag for the address. */
+static __always_inline u8 arch_get_mem_tag(void *addr)
 {
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
 }
=20
-static inline void mte_enable_kernel_async(void)
+/* Generate a random tag. */
+static __always_inline void *arch_set_random_tag(const void *addr)
 {
-}
+	/* Writes the random MTE tag in bits [59:56]. */
+	addr =3D (const void *)__irg((u64)addr);
=20
-static inline void mte_enable_kernel_asymm(void)
-{
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
-static inline int mte_enable_kernel_store_only(void)
+static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
+						   u8 tag, bool zero)
 {
-	return -EINVAL;
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
+	else
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
 }
=20
-#endif /* CONFIG_ARM64_MTE */
+#endif /* CONFIG_KASAN_HW_TAGS */
=20
 #endif /* __ASSEMBLER__ */
=20
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 9ba215b2b0fd..34d1438019ed 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -47,6 +47,11 @@ static inline bool system_uses_async_mte_faults(void)
 {
 	return static_branch_unlikely(&mte_async_or_asymm_mode);
 }
+
+void mte_enable_kernel_sync(void);
+void mte_enable_kernel_async(void);
+void mte_enable_kernel_asymm(void);
+int mte_enable_kernel_store_only(void);
 #else
 static inline bool system_uses_sync_mte_faults(void)
 {

--=20
2.56.0.455.g6c5a503b38-goog

