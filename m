Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065854;
	b=RYahrz5hoFW3u7AL++lQDnszO+joZPrmoVG7NumnhSAirqmmZZGU7r9OBgqaOw91F+gh
	 +JBXyu+dwDj1Nqj5sNWmhT14D+ex0Wj3sF/vVkrWT+88gU0B9Sz9vH16FF7uTxPNmDB1N
	 9wvam6joorb4kCtluRb3ueUUHZMles4xY6BLOCXZWZkFb9DI2GuDEE2ibJ7YJvSR+hWIZ
	 jOtowJ0xmhTkVDOV8GVmGcLEHR33GsbWKdws7F0AkPHxSjfl9gX1gpCd0clFMyyDoy2jg
	 aZLRwXRRhiW8pN8LG7+aShk8vzv+Pv2HbbMzxjcAOnZbd/cVYeRqbxffmfBEmByZAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=;
	b=nFC8UUk/ekZbsrHEzy/WGO9dCIyOo1N6/h3Z94guGsHyyH/4wX19ZdtajBnQKPr0DIWY
	 G4U/GPUHCdQvLdV8CEsL/s84EADYcKMihTiLHny5ki4LsN62Sgehn1/e4epBO3GTftOz0
	 SrKjhaAaAsHSB+m3inPg9s3EL5NKYa1D0gT8/Ns5m19NzV4nd9qTZkR+1h+LWitn88WW7
	 LU7gkn4VBbaaLUBWcP7RIsz60O43eoK5cGS+RoarsS0ho1nLRWSxn2lgEh3T8RUUu7pvN
	 pgFsIuJg3d9LFkfAHz6futt5FVUJAqQrwgXYxGieobgcOUvfGyfdt6HrZt+G7DFdHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R50vhJHB;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654C6083638
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8654C6083638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R50vhJHB
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c44903d6927so175083666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065853; x=1794670653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=;
        b=R50vhJHBS0yKgJt0oUzFenio7g9OzvoU1X8Nr7ZsW9wIlblC0HVQqIrPgutTHcNSd5
         TaSXrw10lBavGfCNUsTAQmQacioBqEzyF/e0e6Kvhx92zw7e2fwpZCo8EO3Qa0s3BGxd
         dmgme3xX8qRvO3Zk46PVdVMfhiGUioBXyVVBORthS8OwoTGkOMJcwnQUStlwFkW8COQj
         ewJmxBX3Mjm9UfBvra/cQdjZ080+cPwBPLAgFrWuGaUKbNeaDafRkf2LkLBLIZDdEHej
         TgcAvZVj6HeG2aPWb8nx72mZWVuQrQJNGcjF5dZ1dc2MJ49Ixw+46n90I/1al6lIVcaQ
         3FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065853; x=1794670653;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=;
        b=VnBi1lb/+Xo9AR872CBfAkNWih2zg57bCUFeyfRBMty+WLWKB+dzog5AGCRVTwIBiR
         v+4SRTJ2TAL21J3IF/VtvLiSqtwoVt0Y/b7czu1/pkhSLezKoUQ/6X35z9grwJSdVxed
         k8v58zMZL68D7Qe1m/gQMgmYqWHq3bA93qK8iSeAExBTU6IXTgRhhk5OODoINanDGgdT
         T9eufoBEtBI+lhO1A3FQjLBGGuevyCee5f9FiVf20a2S9wFpdRYO/JNc4jKYMx7l3nuE
         q+cDMaBFgkQ1lOtoqyW2UICudnBxYbzI68JWFdw8BVu0DV0ufJcclGecPqh/1pCebbAn
         q/WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaT2AlTk9KHo+9+z94B8B2szzWqN3RquT2iQXbDNs9OJj2LagkSiV8aehL6obgKOXf37VDdGeeUOYvYLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c0oNfsJaIe3e689UK0ifs1wPNfixYNrAYUFRQMbOITyTPR4Qz
	+YpVgCpsb/W05VBuV5bg86JZaM4w2qhBMNB/Fhs+MFPUR168Sj84TH6lsqowZpnDiQSqt6QWsCG
	CHg==
X-Received: from ejfg8.prod.google.com ([2002:a17:906:3b08:b0:c2e:1bc5:6c6c])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d94:b0:c40:bbd2:62f6
 with SMTP id a640c23a62f3a-c4d35268ecemr454740566b.19.1794065852609; Sat, 07
 Nov 2026 07:37:32 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:24 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-18-d84ea5f30f94@google.com>
Subject: [PATCH 18/24] arm64: Inline and remove mte_check_tfsr_*()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Inline mte_check_tfsr_{entry,exit}() into the kernel entry/exit helpers,
which should ever be their only callers and therefore were an unneeded
extra layer of indirection. This allows deduplicating checks that were
performed within the functions and outside.

Inline mte_check_tfsr_el1() as the now-trivial check-and-report,
improving readability of the code and clearly showing the dependency on
KASAN, while abstracting away synchronization for mte_suspend_enter().
Use an early kasan_hw_tags_enabled() guard to let the compiler optimize
it all out when !KASAN_HW_TAGS.

As a result, <mte.h> finally drops its dependency on KASAN.

Note that mte_enter_from_kernel_mode() now clears TCO before checking
TFSR, which should be functionally equivalent and even provide a
negligibly higher coverage.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h     | 45 ------------------------------------=
----
 arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++----
 arch/arm64/kernel/mte.c          | 28 ++++++++-----------------
 arch/arm64/mm/copypage.c         |  1 +
 4 files changed, 28 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1308e37c43c6..1e20a43c0a67 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -12,7 +12,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <linux/bitfield.h>
-#include <linux/kasan-enabled.h>
 #include <linux/page-flags.h>
 #include <linux/sched.h>
 #include <linux/types.h>
@@ -264,49 +263,5 @@ static inline bool folio_try_hugetlb_mte_tagging(struc=
t folio *folio)
 }
 #endif
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-void mte_check_tfsr_el1(void);
-
-static inline void mte_check_tfsr_entry(void)
-{
-	if (!kasan_hw_tags_enabled())
-		return;
-
-	if (!system_uses_mte_async_or_asymm_mode())
-		return;
-
-	mte_check_tfsr_el1();
-}
-
-static inline void mte_check_tfsr_exit(void)
-{
-	if (!kasan_hw_tags_enabled())
-		return;
-
-	if (!system_uses_mte_async_or_asymm_mode())
-		return;
-
-	/*
-	 * The asynchronous faults are sync'ed automatically with
-	 * TFSR_EL1 on kernel entry but for exit an explicit dsb()
-	 * is required.
-	 */
-	dsb(nsh);
-	isb();
-
-	mte_check_tfsr_el1();
-}
-#else
-static inline void mte_check_tfsr_el1(void)
-{
-}
-static inline void mte_check_tfsr_entry(void)
-{
-}
-static inline void mte_check_tfsr_exit(void)
-{
-}
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #endif /* __ASSEMBLER__ */
 #endif /* __ASM_MTE_H  */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index ea385f579269..db4ff003a5b6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -73,19 +73,29 @@ static __always_inline void irqentry_exit_pcpu_adjust(s=
truct pt_regs *regs)
=20
 static __always_inline void mte_enter_from_kernel_mode(void)
 {
-	mte_check_tfsr_entry();
-
 	/*
 	 * Taking an exception sets TCO but clearing it can be expensive on
 	 * some architectures so first check that MTE is actually required.
 	 */
 	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
+
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	/* Asynchronous faults are sync'ed automatically on kernel entry. */
+	if (system_uses_mte_async_or_asymm_mode() && __mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 static __always_inline void mte_exit_to_kernel_mode(void)
 {
-	mte_check_tfsr_exit();
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	/* Asynchronous faults require explicit sync'ing on kernel exit. */
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 static __always_inline void mte_enter_from_user_mode(void)
@@ -96,7 +106,11 @@ static __always_inline void mte_enter_from_user_mode(vo=
id)
=20
 static __always_inline void mte_exit_to_user_mode(void)
 {
-	mte_check_tfsr_exit();
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 /*
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 725f48faec3e..b65e3aa3bd07 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -5,6 +5,7 @@
=20
 #include <linux/bitops.h>
 #include <linux/cpu.h>
+#include <linux/kasan.h>
 #include <linux/kasan-enabled.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -180,14 +181,6 @@ int mte_enable_kernel_store_only(void)
 }
 #endif
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-void mte_check_tfsr_el1(void)
-{
-	if (__mte_get_reset_tfsr())
-		kasan_report_async();
-}
-#endif
-
 /*
  * This is where we actually resolve the system and process MTE mode
  * configuration into an actual value in SCTLR_EL1 that affects
@@ -285,6 +278,9 @@ void mte_thread_switch(struct task_struct *next)
 	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
 		set_pstate_tco(0);
=20
+	if (!kasan_hw_tags_enabled())
+		return;
+
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
=20
@@ -296,7 +292,8 @@ void mte_thread_switch(struct task_struct *next)
 	 * are synchronized before this point.
 	 */
 	isb();
-	mte_check_tfsr_el1();
+	if (__mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 void mte_cpu_setup(void)
@@ -348,18 +345,11 @@ void mte_suspend_enter(void)
 	if (!system_supports_mte())
 		return;
=20
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!kasan_hw_tags_enabled())
 		return;
=20
-	/*
-	 * The barriers are required to guarantee that the indirect writes
-	 * to TFSR_EL1 are synchronized before we report the state.
-	 */
-	dsb(nsh);
-	isb();
-
-	/* Report SYS_TFSR_EL1 before suspend entry */
-	mte_check_tfsr_el1();
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 void mte_suspend_exit(void)
diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index cd5912ba617b..e6796bf1fad1 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -7,6 +7,7 @@
  */
=20
 #include <linux/bitops.h>
+#include <linux/kasan-enabled.h>
 #include <linux/mm.h>
=20
 #include <asm/page.h>

--=20
2.56.0.455.g6c5a503b38-goog

