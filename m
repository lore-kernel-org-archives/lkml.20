Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065852;
	b=HD72mQ6OjBKXA3FPJ96jR3JbhtrrDOYsB+tENNjJqs/Rd+F4RkNnf91modcslUfWT/4o
	 WaMj9LwCgMYaQ2uUXxzN7E/0HurJxXWb3Q0fcdAPHRH+VNNYuxnoFEcCEXeJW2huBg4o7
	 EwJAIvKnBvFz5OrPNjiwdPKPjyq3CvEf5eKPqONV9n29CMxAOHk6aQt85APrRB9SAkjpE
	 w8R/Yktm6Ty0yjirjJHp0jV2cqOnGOgBUG52IJNhnGmvwXuFLupgeibJcGNvGUyEROOnL
	 nyPJcfIjWYLOHLM/2DzdeBd5xJiM+bs/iADAMKnPs+DBNeljvcjEGD0+TKEawnQYiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=;
	b=cR1hbPE/Gm2PBQ1nrvxLk1U4a9sv06sypqVAvfNMEaj/t9dGpKHsY+iYGw++Fc3/COks
	 k4pofcggAnRrYnIitoQewN4RmiOQvcV+TiW7wRQs+TKuhbwDvy7PNxSktpB8BTfJu6pcl
	 7Q/0NtMOldvhTEw/B5wHXsyMXnQl3azg1ZmnrB0UQgOD7WXayF44zwp0ftT0pMnKMgMSd
	 3G4dPYlmZsAGUjzx7BUH+6O2qjWid636aqDUXFLF900wLkjNYvVy8M8iskX0rpIFIyDND
	 HDR067p4LBJKVXUaHTyhtItf29sYvitpt3FFHI48AzLnUxm7fb2gL0qOCN/0kuXopuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P9LpPhRj;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B36083611
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9B36083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P9LpPhRj
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so137688166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065850; x=1794670650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=;
        b=P9LpPhRjlNSO84wNO13UqG71MfquvVQjLy4YMsky6eCZOkz2L66ipdB9LvjPeoeezF
         bn0NBnx9f9WH8GmccVj3cjBvLaE6rQzkMam5AOiLXNJM//bwvTq11BZ65QzBD0FawgBU
         Yw3LHHCIYaUlMc2Zmj8J0hlMvmvHg2894yYm/ecERn5/9pCdW1MsT/WSKsyxdoSgU/9h
         Ld/nU+mgtgUqqZ1/k/DK5IPz1KOcIKBRo/SoHAmozY1ObSBRH4n6wA27ZrdqXg+UUGfI
         xn+d8ARKs7ZCDzApktI/Jl/AJ4uvsSLo2sAi8Ft/GpMBJpJB1g6TwBERYT5Rr7YIDzHI
         V+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065850; x=1794670650;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=;
        b=CvF593T+1EDyiti0Unx3xNdux9ZNqXeeDPZ6PqPz+mE/ksC/74RrEpGT86hyKxsWBP
         ZtZqCGvdrKWZbGDpvbwF4cXixmyNmk6U7yoLSj6mFE3CEB7CWPc0stvNfmVvOL/AhK23
         shKr+Ki6zCyTCPZaxNdZ1ocS4yS8yxqza8SwWMDKMWKNsX8M/rLEuHbttSPtFcviVsF+
         JcGNFaby385NfDQNI0pdCsI6xTYC99MiOvlOo6drNz6xOgorc9P2dP+0R4b6z9cn7n4a
         UgD5kGlGAcojgYmfR4dLewcQ4NRv91c4XuXPsePbo377WsiOTZ67/r9T8oGMa5pNydzm
         pUmg==
X-Forwarded-Encrypted: i=1; AKwUvBxT4h2P6/eeeQdrcc3DAD4JjKAzQydOEVpIpYxax4DLhCWbiCV1AuLE4nrIqm+3iq/4pmOOjigY3U2bYU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Esg3ECIUaMDyYxqB+lZKr0vgPoBKSvxx/Q9VW0ZZTG2aEw2z7
	XgyRggDyu2jvq1QRcltCdlNDsETjrK0BsCBGeUOFK2JSes/uSx1S0DUMSPlvSwe/Dutrboth3fx
	39w==
X-Received: from ejz21.prod.google.com ([2002:a17:907:e415:b0:c31:5e56:5742])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0b:b0:c41:731c:534
 with SMTP id a640c23a62f3a-c4d352c83c7mr470461666b.24.1794065850014; Sat, 07
 Nov 2026 07:37:30 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:22 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-16-d84ea5f30f94@google.com>
Subject: [PATCH 16/24] arm64: Refactor KERNEL_GCR_EL1 out of <sysreg.h>
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Rework the constant to make the resulting sysreg value (and computation)
obvious at the usage site and clearly indicate that the GCR_EL1.Exclude
is specifically set by a KASAN policy.

As a result, <sysreg.h> is now KASAN-agnostic and writers of GCR_EL1
explicitly depend on KASAN headers, as they should.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 16 ++++++++++++++++
 arch/arm64/include/asm/sysreg.h    | 16 ----------------
 arch/arm64/kernel/entry.S          |  3 ++-
 arch/arm64/kernel/mte.c            |  4 +++-
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 9d00e9460b0f..6f63c788470a 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -5,10 +5,26 @@
 #ifndef __ASM_MTE_KASAN_H
 #define __ASM_MTE_KASAN_H
=20
+#include <linux/bits.h>
+#include <linux/const.h>
+#include <linux/kasan-tags.h>
+
 #include <asm/compiler.h>
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
+/*
+ * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
+ * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
+ */
+#ifdef CONFIG_KASAN_HW_TAGS
+#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
+#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
+#define KASAN_GCR_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
+#else
+#define KASAN_GCR_INCL		UL(0)
+#endif
+
 #ifndef __ASSEMBLER__
=20
 #include <linux/types.h>
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index 51c6a54d7146..7d82c769ae69 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -11,7 +11,6 @@
=20
 #include <linux/bits.h>
 #include <linux/stringify.h>
-#include <linux/kasan-tags.h>
 #include <linux/kconfig.h>
=20
 #include <asm/gpr-num.h>
@@ -921,21 +920,6 @@
 #define SYS_GCR_EL1_RRND	(BIT(16))
 #define SYS_GCR_EL1_EXCL_MASK	0xffffUL
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-/*
- * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
- * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
- */
-#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
-#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
-#define __MTE_TAG_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
-#define KERNEL_GCR_EL1_EXCL	(SYS_GCR_EL1_EXCL_MASK & ~__MTE_TAG_INCL)
-#else
-#define KERNEL_GCR_EL1_EXCL	SYS_GCR_EL1_EXCL_MASK
-#endif
-
-#define KERNEL_GCR_EL1		(SYS_GCR_EL1_RRND | KERNEL_GCR_EL1_EXCL)
-
 /* RGSR_EL1 Definitions */
 #define SYS_RGSR_EL1_TAG_MASK	0xfUL
 #define SYS_RGSR_EL1_SEED_SHIFT	8
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b..d1d9a7a049a7 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -21,6 +21,7 @@
 #include <asm/esr.h>
 #include <asm/irq.h>
 #include <asm/memory.h>
+#include <asm/mte-kasan.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -176,7 +177,7 @@ alternative_else_nop_endif
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
 alternative_cb_end
-	mov	\tmp, KERNEL_GCR_EL1
+	mov	\tmp, #(SYS_GCR_EL1_RRND | (SYS_GCR_EL1_EXCL_MASK & ~KASAN_GCR_INCL))
 	msr_s	SYS_GCR_EL1, \tmp
 1:
 #endif
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 0d998289edcb..725f48faec3e 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -23,6 +23,7 @@
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
=20
@@ -320,7 +321,8 @@ void mte_cpu_setup(void)
 			 MAIR_ATTRIDX(MAIR_ATTR_NORMAL_TAGGED,
 				      MT_NORMAL_TAGGED));
=20
-	write_sysreg_s(KERNEL_GCR_EL1, SYS_GCR_EL1);
+	write_sysreg_s(SYS_GCR_EL1_RRND | (SYS_GCR_EL1_EXCL_MASK & ~KASAN_GCR_INC=
L),
+		       SYS_GCR_EL1);
=20
 	/*
 	 * If GCR_EL1.RRND=3D1 is implemented the same way as RRND=3D0, then

--=20
2.56.0.455.g6c5a503b38-goog

