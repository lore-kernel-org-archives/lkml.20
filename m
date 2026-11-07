Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065847;
	b=3fG2SC0AgECfmD5NkFvEOJa5M3uisxtFjQczaUZVUDedUv2l7teDYIccgIWm07S8nnU0
	 AKGISCWe0Dyh3zu1W3DAcFcTIO2GXZqLvrbmDd4aB/KFSJ/THOT3O2DB83RO6HSzW4TRo
	 mqCS8UumsoEjnzGlklqqYGMezbIiuuIU8wCm+qYyZJ3CejWcSkO390M6MAurjaHLfWTHU
	 lDpDTDYE87C9C9miA/sE2h2UROcXAZ4RerW/A1rI8wodcJ98pVwpgFynvkoGGhX6nNUXy
	 2VvCQJ7OkE5EKRi5vdQog0Kf2BR5PSIGEZQdjn+D8zhuPh2y+wWwmOoD/FBK8PWpABg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=;
	b=m5nptJ1NQ446gR+vHMSIcz3sLdDv1imMGGOmfYa2PkWdIrXf5jo/9m8rU3omgZhnDd12
	 gvqMTnGjeMhNK8nP93PKWbA1i0Xms/wfkQx1fdfdCcasBbHnXXySn270n+z5tZ8ecuBCK
	 4jsg1qZVorwA20DWWjSMKDxMYil8+1zxvxtsgkPAdpSVYLLZuqE6c2F8lD9rsx2dDgMOH
	 ZBP+pDsZ6ss+7JTES21Mjmhzm107LQCjsEtDV4fD334FkjGWFvNMNaboJQ10BSkrTXWXB
	 Rq/Zm4yHA3GjXmmGUnxIkV8IcYBCIPwHYM12cB7oD3jyJfN7CvFRarv45/ftRmRf6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iVoCT6GS;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD486082BF0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD486082BF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iVoCT6GS
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c42394d1e41so147948866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065845; x=1794670645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=;
        b=iVoCT6GStdF9ycjJKCZpFopizY22Ra2CohacnV30JUmWe2lQW5JFiSax7lkA/afFj/
         EswaCeMyO8lgWm6/69ArSL8h6iQYb88RNfZTFCYHCRpw2ISFJsCtMhHcg7WOa2V6yoBG
         gmH92tV++b2Nu7Lq8gzY8+A6UEBXjG3gEMtlI8jl0w3iFcYRlCajZwG7/0eegh0E+iHh
         inZa1Rm8LT2gr+QJkfdEcCmP5UG2y0ydcMydhaNplJasHwqvisud94sPkYWtzbZhmi/K
         I0Hf4ogCEFw2kRi4VeF6qrdMHFVWIDJPpPEa/BbmOfP4KV9CZf47x5gpiD4PSL0UDZc7
         PADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065845; x=1794670645;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=;
        b=SNRgouZ+bQhxBCRPuetKapPPwXCHdIczgEFGlTRFVAEsIrLpYPY5z9txiOd2f+kehF
         yPjgjORmmT5XZBEu4n4Uj1l1hqluy77ySqikFDMZrHLEt6U+A+17CNBWlw8bXbTpEcap
         Htd1nCIfRbY/2OsKtTqUoRzGjfUYTRjdH6RBDxvH9J8icXGOgxrpjzJpV6n96CLoVj1l
         Fll3pk0TrG7dgdNyCiCGKGDa8WnlUEN2zkoCMIRWBpT0IQV2xjd9B2yiGzXG1VpsxXvR
         do98Bv6jxhPyMy/cUM6KXzA9YbJyj9hJG0eQ0W0Sw9D6b7kESv5g6+/Z3XAUu3HSz+1C
         Q0sg==
X-Forwarded-Encrypted: i=1; AKwUvBwrrhCiRtX6xOVHyaFmzP/UVG+r+8WO+JHnyS4bEzEfwqNfSWjTdsbRV0TByK3il7zY46YXa59PTaRvet4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/2WcEImfNeld3FQI/NGqR40td8N8U7szPtqJkraLISnw6dJpw
	Z/Avp2C1O5u0qHGipfbhTwMr5BdaTIBBXLnMpsIxHvHP8TNcKfzI3thg32Xu4qqNqMo94cRut3/
	sHw==
X-Received: from ejcyb22-n1.prod.google.com ([2002:a17:907:e0d6:10b0:c4d:32b9:af48])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9c05:b0:c41:cf68:bbcf
 with SMTP id a640c23a62f3a-c4d34c42700mr430478966b.32.1794065844907; Sat, 07
 Nov 2026 07:37:24 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:18 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-12-d84ea5f30f94@google.com>
Subject: [PATCH 12/24] kasan: drop mte-kasan.h from arch-agnostic header
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The inclusion of <asm/mte-kasan.h> (only defined by arm64) is based on
the brittle assumption that KASAN_HW_TAGS is equivalent to MTE, which
will break as soon as another architecture supports it. Furthermore,
exposing the header's contents to common KASAN_HW_TAGS code risks
spreading this wrong assumption further.

Allow KASAN_GRANULE_SIZE to be arch-defined, with a fallback.

Define KASAN_GRANULE_SIZE in arm64's KASAN header when KASAN_HW_TAGS.

Remove the #include, which is now unused as a result.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/kasan.h | 5 +++++
 mm/kasan/kasan.h               | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.=
h
index b167e9d3da91..3106a2271781 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,6 +6,7 @@
=20
 #include <linux/linkage.h>
 #include <asm/memory.h>
+#include <asm/mte-def.h>
 #include <asm/mte-kasan.h>
 #include <asm/pgtable-types.h>
=20
@@ -22,5 +23,9 @@ void kasan_init(void);
 static inline void kasan_init(void) { }
 #endif
=20
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
+#endif /* CONFIG_KASAN_HW_TAGS */
+
 #endif
 #endif
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 0df7daee1864..52c2e7dca739 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -128,11 +128,8 @@ static inline bool kasan_requires_meta(void)
=20
 #endif /* CONFIG_KASAN_GENERIC */
=20
-#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
+#ifndef KASAN_GRANULE_SIZE
 #define KASAN_GRANULE_SIZE	(1UL << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#include <asm/mte-kasan.h>
-#define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
 #endif
=20
 #define KASAN_GRANULE_MASK	(KASAN_GRANULE_SIZE - 1)

--=20
2.56.0.455.g6c5a503b38-goog

