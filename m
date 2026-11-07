Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065853;
	b=VXDV97oMPuxXW1qf4FyLVq0S1AoN5x1Ruurqbn3U1fZD8o7uOQwjY8o+Pwjn0tzdmSb4
	 T4ju0rA3qDJ8BuVHPzwkBylXxZ+3k/CE5kLxbD/G3oTujF2A5nxfkIPOwMgea85PCCF9w
	 gUSha8PkUv4y/yHuebikAjvfhhc0S4Psyg0twX41TGacrYedQfATQx1IYxC9qbuV1/aE1
	 MxGRtrtIHCC/KA1mmQDt2hH36LzgVZxvqe1sjfSzFaLVgCN4PvVYxU/oSJpWq8f0bpXsw
	 Knc1FvcZC6QmV8ZZqvjDiEymUlr8kpWk0RtIKu+KYM8CCDN7M4fn34AcH1u18DABAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=;
	b=vrSlTgCbVYobuYrA6xsRqaCOnyROEft0ql8fqxVTWJilmQTWdTFwP3OoqMjLxtbqk2TT
	 uo5L4uEfQQDH5bgijj63MVwwRnQd8sqLqkrvAtFEo7oa09t3XU7/iln6VCRc83kImla/r
	 zTJTWnE3pFHIuyFSwoRbT5DSFHTr2LfparPy93qvTf3WohTgk/KLOAZgrPePPIc9V60Fy
	 8KH9aSUfYCH4IUUYsN8EMXvLXHRb6cWGaMNksEr1RTZKPAfGZ+SqQ4gWkgA9tFJIFJK7F
	 jizV4bS2Xx+TNtOMy7JFdifggv4pIppnLkZcZ9wCyjl+ARxlZRRsSBxcAjGEk+Gu/XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nEZ0hBCH;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3B6083614
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A3B6083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nEZ0hBCH
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c29c391bd2fso166013666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065851; x=1794670651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=;
        b=nEZ0hBCHH7uTtDCoHimsmKL6pLS9s7Ux7Y707lOz+F1nwE3/0XiXa72LDe+83Nw3NH
         F1NifSmT6pGGDBqdlmV/GQ4WP40AzurR2BomteUjwH4hCEC1IMWhj9cLKZkcRZZvpqxV
         g4dJvPaa1cKDPj5cnLjmxoMp5q3+3ITMmwIS1O8YCx/xNP9Zp0glchyzDVKd8BWPHhca
         GIRug0CPMr3vnGNdpG4kQygG26shfN+U6Llg9Bq9xj53sTaPgm4ju9EtKwu9HmLAeqYQ
         9VvYy6kV6MD3IuY5B8CbbzHr8tuaHvJvSF8ulVlVCFkAptgKlYNwXRv80QXQYBMrtTad
         AuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065851; x=1794670651;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=;
        b=gj+dMdTDVFNb/gsxBsyLQaCOertITSlA1iKMGr/XgBdy8o55nTzH3KruBLLhdloi5b
         8Y1qRFo+HhuikxjB/mTSZnjqoygh85dmRvdm3B2+4omT3yI3Y0+xPE87m86Nj/7w8oOz
         RJvbRcnxpHZ5PYy96Mnp0br0Hd64MFRlRHAiuxV3wPegxBR1EgvVNLJhgEJFWslCZO6J
         SnA335R/LkeWgyT52JvY9v30jDncdhNrbZXkrYRWmdzF/txJ9YfSZgycp1rUkvHIdPoU
         ZhDw3iHyiKaR8XtWqIAth6IVIM0xMREB83LYdQXlUrIXBuw474m/eiHE/Ky7l5T8WQIa
         nB+A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3bSBfq/NXvPUiXYRs2AL8Rs1ziLu+besxGC1MQPhaThyq+ZTHkxLWVem/1mzgvBK0c2goR4EnKZuaME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ig+wsyiynnKAnZXF/3eZtmjSjzxse2IiEimEOCZ90z1QcdRhN
	yG99nfFAHWMemdxpOdQl980GWCYw+QFMgRMwAgSxLWj7qw3ZPAvDJmEXNoruyibVjRbAIekDkoB
	9Rg==
X-Received: from ejxe19.prod.google.com ([2002:a17:906:81d3:b0:c2e:9100:5dcc])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:868a:b0:c31:e9b7:f10b
 with SMTP id a640c23a62f3a-c4d34c70d99mr414676666b.42.1794065851145; Sat, 07
 Nov 2026 07:37:31 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:23 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-17-d84ea5f30f94@google.com>
Subject: [PATCH 17/24] arm64: Introduce MTE & KASAN tag handling helpers
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Introduce [__]mte_{tagged,tag_of}() helpers for MTE tags.

Use a naming convention which clearly indicates that the helpers are
dealing with the tag bits of the argument, as opposed to the tag value
actually associated in hardware with the memory the argument points to.
The get()/set() terminology may imply the latter, and actually is used
in that sense already e.g. mte_get_mem_tag() or mte_set_mem_tag_range().

Provide a const-compatible ("__"-prefixed) variant and type-checked
functions, these should provide compile-time validation (with zero
runtime overhead) of constant arguments.

Introduce [__]kasan_tag_{to,from}_mte() helpers for KASAN tags.

Here, the "__"-prefixed variants are asm-compatible.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-def.h   | 20 ++++++++++++++++++++
 arch/arm64/include/asm/mte-kasan.h | 29 +++++++++++++++++++++--------
 arch/arm64/mm/fault.c              |  2 +-
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-=
def.h
index 14ee86b019c2..660948a3fa9c 100644
--- a/arch/arm64/include/asm/mte-def.h
+++ b/arch/arm64/include/asm/mte-def.h
@@ -15,4 +15,24 @@
=20
 #define __MTE_PREAMBLE		ARM64_ASM_PREAMBLE ".arch_extension memtag\n"
=20
+#ifndef __ASSEMBLER__
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#define __mte_tag_of(addr)	FIELD_GET(MTE_TAG_MASK, addr)
+#define __mte_tagged(addr, tag)	u64_replace_bits(addr, tag, MTE_TAG_MASK)
+
+static __always_inline u8 mte_tag_of(const void *ptr)
+{
+	return __mte_tag_of((u64)ptr);
+}
+
+static __always_inline void *mte_tagged(const void *ptr, u8 tag)
+{
+	return (void *)__mte_tagged((u64)ptr, tag);
+}
+
+#endif /* __ASSEMBLER__ */
+
 #endif /* __ASM_MTE_DEF_H  */
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 6f63c788470a..24d5d9d6d04b 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -13,24 +13,40 @@
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
+#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
 /*
  * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
  * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
  */
+#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
+#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
+
 #ifdef CONFIG_KASAN_HW_TAGS
-#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
-#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
-#define KASAN_GCR_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
+#define KASAN_GCR_INCL \
+	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
 #else
 #define KASAN_GCR_INCL		UL(0)
 #endif
=20
 #ifndef __ASSEMBLER__
=20
+#include <linux/bitfield.h>
 #include <linux/types.h>
=20
 #include <asm/sysreg.h>
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
 #ifdef CONFIG_KASAN_HW_TAGS
=20
 /* Whether the MTE asynchronous mode is enabled. */
@@ -71,10 +87,7 @@ static inline void mte_enable_tco(void)
=20
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
-	/* Note: The format of KASAN tags is 0xF<x> */
-	u8 tag =3D 0xF0 | (u8)(((u64)(ptr)) >> MTE_TAG_SHIFT);
-
-	return tag;
+	return kasan_tag_from_mte(mte_tag_of(ptr));
 }
=20
 /* Get allocation tag for the address. */
@@ -140,7 +153,7 @@ static inline void mte_set_mem_tag_range(void *addr, si=
ze_t size, u8 tag,
 	dczid_bs =3D 4ul << (dczid & 0xf);
 	dczid_dzp =3D (dczid >> 4) & 1;
=20
-	curr =3D (u64)__tag_set(addr, tag);
+	curr =3D (u64)mte_tagged(addr, kasan_tag_to_mte(tag));
 	mask =3D dczid_bs - 1;
 	/* STG/STZG up to the end of the first block. */
 	end1 =3D curr | mask;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b22736853fcd..cf855aa1c30f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -915,7 +915,7 @@ static int do_tag_check_fault(unsigned long far, unsign=
ed long esr,
 	 * Otherwise, bits 63:60 of FAR_EL1 are not UNKNOWN.
 	 */
 	if (!cpus_have_cap(ARM64_MTE_FAR))
-		far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+		far =3D __mte_tagged(__untagged_addr(far), __mte_tag_of(far));
=20
 	do_bad_area(far, esr, regs);
 	return 0;

--=20
2.56.0.455.g6c5a503b38-goog

