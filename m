Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065861;
	b=B1pXvzFNDxFgR2LXu3qydcKhjpnZ1bbQz1aQn0AaaXa341aWQFDAIqi9gQknPyQcF8L9
	 T92bTJWia96NdplN4HtZUgz/Zrzbcyk4I3kJocGtL9IAid0pj17OkyrCKefmzETUeTaI3
	 tdXzrgNGukytsvmM9NVzOaBgLvdE+RTHnPTDWxM7blv8HRlIT1QLJ98s5MZQUMd5GrXOE
	 HJCDOE8/+z7MKLZDmVyPRLde998DfAMdu2RzD6USbZ04mzjEHmEE2s9wuZVi5AJ/mzD0I
	 bGMUe2I/R5mKk5IWafBhenNbD9Uw0Uw5/GYe/iCXNpr6qImXVKzCQBxDQo0249l4Sag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=;
	b=KFdgapYb13fcqok3/Pwp+PvB0pGNOT6jNwUJoq4eOoCCaRzlNRFrapr+FmRyj9CJnJwr
	 xtvGsR1AZcDSaTNmm85khONTZyf1wsYwewVijrFlo6JbphPyG0YvB3LVCnjwQV3YyKL2m
	 a7FwxbFry/JiZGMVxfui6mcAnThx21aQ/TbjyhBBkjhpRBw2UGJVfetNiF25YdId+rCcJ
	 X8ZRnVfMV9TP6ZQfOGjJx7jKg7E1uOIjRIbCtuTimUs+TMo5clzpbNK0wdt1mzbhpJyXI
	 ulmzk/f6uad+FSt23qfoyQAsY6DYMYfw5ipuH5ZWbd089iJICARJvQGeRSS8A7GZmLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bBvI0RkU;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8C60A3824
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A8C60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bBvI0RkU
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b582b355eeso1771921a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065860; x=1794670660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=;
        b=bBvI0RkUqrUptC7+AhT4Js+xS1JP4f0tE3+SGRx81N7LmL8McfE/lKtLPHJjHfcW2Y
         o8WNlEnMYYEr/7qS586VecIBLQUPFIqvjpXSOKzhwUGZK2eQSQbICxifsN09/1s+LE/n
         tfr9Ag26lWL8CtL+qXXzw2U8ZymMJyHP6A0JcKvrxNAHqxmXq8igkaKnDSRBeOr+B/E5
         DqF37uPrX0TyrHmwbWzyWjktk7LaDNuR3ImF8Rt3yCfgc4zfTZYfiWun1qWQ4S2djxLW
         KkZWBl41zPdtokzFKltYIHIjAeiK9pwfY9NnSX8l/Eqnf5YirgyLkGom+5kzadlg+Tnn
         ekxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065860; x=1794670660;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=;
        b=QjdaeVvHkegembyxpCpCqdtUChPQxkqAsNLg61JqgrRz4BUfdREueYL1Zq6Mb1lGEw
         WjJUNuNC8969n4cpgm0XJtNshjpwcvuTybUH/CcZrJRIbnaVWGwKeZid+hY1tuKlazZL
         0nayrLWk1DQvMiaGGP1pJA0eq9shDKTmhAmnnhGxowViGYRlMfa+4ciExzVcWK+iPtyX
         vFHr1r+9Ueg3FP2qq4C9xextjqQ0oC4uT0NtMMkig7U01EIQYvGIYaLuWpEJ+afM47A6
         eDbZlu5vTutvfR9V/rRTbj41eRk/B0vUpg5smWdAD/jpGxx66RBZnrORFSOH7QR/Ar2r
         8aHw==
X-Forwarded-Encrypted: i=1; AL+hErFuxfKuVpKVBSWUKWjdkQf6OaXqf9gI7wH+UUDWXAiQXpJsR3PMBJZlerZTVGMoU4NCpp8Ls9V53VKMl/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZzkPnn2BEw9hXzbtHHS5op9nQdFg+hhUAhWUvKNpxrY3S0ma
	1q0LspPc2SPjAD6dixkgnUrNhhBjLf3Y5HE7SCUoZBfGcVTEd0Y2n4bm35JtgKqkNWYc6SLuHW+
	r+w==
X-Received: from edew26-n2.prod.google.com ([2002:a05:6402:a21a:20b0:6b4:895:eec9])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5486:b0:6b5:97a5:c9ea
 with SMTP id 4fb4d7f45d1cf-6b597a5caa9mr3771497a12.7.1794065859600; Sat, 07
 Nov 2026 07:37:39 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:29 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-23-d84ea5f30f94@google.com>
Subject: [PATCH 23/24] arm64: Fold <asm/mte-kasan.h> into <asm/kasan.h>
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Now that all MTE-specific implementation details have been extracted to
<asm/mte-def.h> and <asm/mte.h>, <asm/mte-kasan.h> only contains a thin
KASAN-to-MTE wrapping layer so fold it directly into <asm/kasan.h> to
prevent confusion or misuse and simplify header dependencies.

Update MAINTAINERS to remove the pattern that was specifically added to
track this header. This silences a checkpatch warning. If future arm64
KASAN headers are added, they should probably favor the arch-agnostic
header naming convention <asm/kasan*.h> instead, anyway.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 MAINTAINERS                        |   2 +-
 arch/arm64/include/asm/kasan.h     | 100 ++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/mte-kasan.h | 120 ---------------------------------=
----
 arch/arm64/kernel/entry.S          |   2 +-
 arch/arm64/kernel/mte.c            |   2 +-
 5 files changed, 101 insertions(+), 125 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..990237c9ac32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14358,7 +14358,7 @@ L:	kasan-dev@googlegroups.com
 S:	Maintained
 B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 F:	Documentation/dev-tools/kasan.rst
-F:	arch/*/include/asm/*kasan.h
+F:	arch/*/include/asm/kasan.h
 F:	arch/*/mm/kasan_init*
 F:	include/linux/kasan*.h
 F:	lib/Kconfig.kasan
diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.=
h
index 3106a2271781..45af725d6fd3 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -2,18 +2,54 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
=20
+#include <linux/bits.h>
+#include <linux/const.h>
+#include <linux/kasan-tags.h>
+
+#include <asm/mte-def.h>
+
+#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
+/*
+ * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
+ * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
+ */
+#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
+#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_GCR_INCL \
+	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
+#else
+#define KASAN_GCR_INCL		UL(0)
+#endif
+
 #ifndef __ASSEMBLER__
=20
+#include <linux/bitfield.h>
 #include <linux/linkage.h>
+#include <linux/types.h>
+
 #include <asm/memory.h>
-#include <asm/mte-def.h>
-#include <asm/mte-kasan.h>
+#include <asm/mte.h>
 #include <asm/pgtable-types.h>
+#include <asm/sysreg.h>
=20
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
 #define arch_kasan_get_tag(addr)	__tag_get(addr)
=20
+#define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
+
+static __always_inline u8 kasan_tag_to_mte(u8 tag)
+{
+	return u8_get_bits(tag, KASAN_TAG_MTE_MASK);
+}
+
+static __always_inline u8 kasan_tag_from_mte(u8 tag)
+{
+	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
+}
+
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
=20
 asmlinkage void kasan_early_init(void);
@@ -24,7 +60,67 @@ static inline void kasan_init(void) { }
 #endif
=20
 #ifdef CONFIG_KASAN_HW_TAGS
+
 #define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
+
+static __always_inline void arch_enable_tag_checks_sync(void)
+{
+	mte_enable_kernel_sync();
+}
+
+static __always_inline void arch_enable_tag_checks_async(void)
+{
+	mte_enable_kernel_async();
+}
+
+static __always_inline void arch_enable_tag_checks_asymm(void)
+{
+	mte_enable_kernel_asymm();
+}
+
+static __always_inline int arch_enable_tag_checks_write_only(void)
+{
+	return mte_enable_kernel_store_only();
+}
+
+static __always_inline void arch_suppress_tag_checks_stop(void)
+{
+	set_pstate_tco(0);
+}
+
+static __always_inline void arch_suppress_tag_checks_start(void)
+{
+	set_pstate_tco(1);
+}
+
+static __always_inline bool arch_flush_async_tag_fault(void)
+{
+	return mte_get_reset_tfsr();
+}
+
+static __always_inline u8 arch_get_mem_tag(void *addr)
+{
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
+}
+
+static __always_inline void *arch_set_random_tag(const void *addr)
+{
+	/* Writes the random MTE tag in bits [59:56]. */
+	addr =3D (const void *)__irg((u64)addr);
+
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
+}
+
+static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
+						   u8 tag, bool zero)
+{
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
+	else
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
+}
+
 #endif /* CONFIG_KASAN_HW_TAGS */
=20
 #endif
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
deleted file mode 100644
index c0224a2bb515..000000000000
--- a/arch/arm64/include/asm/mte-kasan.h
+++ /dev/null
@@ -1,120 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020 ARM Ltd.
- */
-#ifndef __ASM_MTE_KASAN_H
-#define __ASM_MTE_KASAN_H
-
-#include <linux/bits.h>
-#include <linux/const.h>
-#include <linux/kasan-tags.h>
-
-#include <asm/mte-def.h>
-
-#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
-/*
- * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
- * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
- */
-#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
-#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
-
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_GCR_INCL \
-	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
-#else
-#define KASAN_GCR_INCL		UL(0)
-#endif
-
-#ifndef __ASSEMBLER__
-
-#include <linux/bitfield.h>
-#include <linux/types.h>
-
-#include <asm/mte.h>
-#include <asm/sysreg.h>
-
-#define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
-
-static __always_inline u8 kasan_tag_to_mte(u8 tag)
-{
-	return u8_get_bits(tag, KASAN_TAG_MTE_MASK);
-}
-
-static __always_inline u8 kasan_tag_from_mte(u8 tag)
-{
-	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
-}
-
-#ifdef CONFIG_KASAN_HW_TAGS
-
-/*
- * These functions don't include system_supports_mte() checks,
- * as KASAN only calls them when MTE is supported and enabled.
- */
-
-static __always_inline void arch_enable_tag_checks_sync(void)
-{
-	mte_enable_kernel_sync();
-}
-
-static __always_inline void arch_enable_tag_checks_async(void)
-{
-	mte_enable_kernel_async();
-}
-
-static __always_inline void arch_enable_tag_checks_asymm(void)
-{
-	mte_enable_kernel_asymm();
-}
-
-static __always_inline int arch_enable_tag_checks_write_only(void)
-{
-	return mte_enable_kernel_store_only();
-}
-
-static __always_inline void arch_suppress_tag_checks_stop(void)
-{
-	set_pstate_tco(0);
-}
-
-static __always_inline void arch_suppress_tag_checks_start(void)
-{
-	set_pstate_tco(1);
-}
-
-static __always_inline bool arch_flush_async_tag_fault(void)
-{
-	return mte_get_reset_tfsr();
-}
-
-/* Get allocation tag for the address. */
-static __always_inline u8 arch_get_mem_tag(void *addr)
-{
-	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
-}
-
-/* Generate a random tag. */
-static __always_inline void *arch_set_random_tag(const void *addr)
-{
-	/* Writes the random MTE tag in bits [59:56]. */
-	addr =3D (const void *)__irg((u64)addr);
-
-	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
-}
-
-static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
-						   u8 tag, bool zero)
-{
-	if (zero)
-		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
-	else
-		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
-}
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
-#endif /* __ASSEMBLER__ */
-
-#endif /* __ASM_MTE_KASAN_H  */
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index d1d9a7a049a7..2da704f53b5a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -20,8 +20,8 @@
 #include <asm/errno.h>
 #include <asm/esr.h>
 #include <asm/irq.h>
+#include <asm/kasan.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 675ba6a803cf..d072cb76ad05 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -24,8 +24,8 @@
=20
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <asm/kasan.h>
 #include <asm/mte.h>
-#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
=20

--=20
2.56.0.455.g6c5a503b38-goog

