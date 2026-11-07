Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065857;
	b=PyeIJSuzyyN1me7hGuCG5YeWyD6C5UEU1/kpyfpjRvXeaGjK1rA/wWwZDwTsoXcXWnqW
	 UI3vdlz39hyRVQqtemIskdVDTpGlLksSX5+Qut5Z04+zKATbSkIqqWE0qACtDxMPBRxI5
	 XZFuSprppev3WrnX7Y5q7WF6gPuvx5/P3tWOisD30lA6IcKFB6AwcQEn0+IXAo7GGblNk
	 Dj61i0MoGnY9m6E0Ip/PzGIxSnA+4OMV41evW+pt1hwF5y6CBn5UyW+E6lHMRIcn9qyYl
	 HWqndRN3hztXRyxrj9J4p61uGFx56+iNqrUWjNDrR2URjqM9WuLuwJR8BYWrXG50qMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=;
	b=bT/pHLAVGGOaDczpI0O8U9gyN6bUMn61NmYff8XrDBMZrcZYUSJnlzBbmcolAOZYnPNr
	 Q9dGHPwf7UbNEgIYp29T+I05hSxaT78vDfjzF74KRJD0rcii4d6Jaan7p4NfzBRc94jZm
	 /AJSHhEIyWtkVUxO6PEcakm7NImcYwedVPM2SutywOVllth9A61vUW7colB1ulKBZqm69
	 BCrh0dOlTi+YarFOhV3pGPiR5061oJzWkYyhJwIpJtYSD0znn5gA80WhdZ6PiLADJCKbi
	 wNtsroUjMXlYStZTNxUp7P93ia4c2wfijipip7BCZHajWnOKi0eHJjx1hs+5x2LhoJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVr9HiCI;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632460A260E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3632460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVr9HiCI
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42394d1e41so147955166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065855; x=1794670655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=;
        b=dVr9HiCIaWiD9KV/kvU04s33Figsi9REfutIw/WR/EF2vcy6YAH65mFLlc4ri4K7HZ
         e+ur5iRk1hPvagEj5qzwwVDFHhBg+8wydvPgEmPcJBR5psOjpps0fbjTZ7jj7F6ZlCvV
         jsQc5mWnpRF8OpfZ3xsM6VvUwJzFSioubXfhSmRCM1z96cQYR387ADQ0Yyle2yTB0f9v
         X48/1zfxDbdw43Dx4w43hDmYOeWKbo+wgvIy9LVVEf4JosQ02KR/8ljGK7fA0zi0veKR
         ZfRh74ynlrxn8jheDqh5y4kNMoB6pCPYnGoqNd9J1BGofcOVx5BvvBv89rn2ETAD4DIQ
         tr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065855; x=1794670655;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=;
        b=TSQA3uaDWz81kbjHB+w/ASH8l2QQwyORlO4gvNFQVtFOMjkOHM1WjNTNCwYWTs3QMl
         R4rGTWLyKjzv5XWmIP9zTtHvKzBCyBDoXp6pq8Xtoh6l/wq43qlXNiYO1IIeWzLNGFQI
         xh9xbruhhMw0xnql8ExnZDwXwGaWyVmWLCCKrMxQuq/VCsKUZLGb+sxhx+CHdiiM6Av8
         sDQnWRV6dFJI8jH3jIfFks9DXr5+M6LcTbo7/jW3lwbuqEb7XLh20cHF+jC7Gm3gf8Vx
         Du+zmpqa4F61pTx3Jwdq0dmvVgcYPq3XiLH8X0IvFEcCBN/+C+D+JGAopGDtImvJ4jVz
         emzQ==
X-Forwarded-Encrypted: i=1; AL+hErFXX3l/eYGi1Pbys985FJ50b/CKWxWBmpeVDIIXmUf/SFHwx8RUjmRf0xqw4UFwkIzfxf3BbiypmNK5uyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aM6RwwSF2W6C9PMGPKP9TxbBYRmNayiRQNojt86cCpTh4o4Tl
	XqBKXMJH05bVVlYLeiKSo3bVUfuViKOVz6Ass7Fuz1xdijpKVRcRlIzfqg4KVUmV42ehqpHAihI
	3VA==
X-Received: from ejco12.prod.google.com ([2002:a17:906:37cc:b0:c31:97d6:2c5])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:7952:b0:c3f:7270:10ab
 with SMTP id a640c23a62f3a-c4d34a71de4mr496841466b.14.1794065855169; Sat, 07
 Nov 2026 07:37:35 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:26 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-20-d84ea5f30f94@google.com>
Subject: [PATCH 20/24] arm64: Move MTE insn wrappers to <asm/mte-def.h>
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Relocate all assembly from <asm/mte-kasan.h> to a KASAN-agnostic header.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-def.h   | 45 ++++++++++++++++++++++++++++++++++
 arch/arm64/include/asm/mte-kasan.h | 49 +++-------------------------------=
----
 2 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-=
def.h
index 660948a3fa9c..b86d0e7e45ed 100644
--- a/arch/arm64/include/asm/mte-def.h
+++ b/arch/arm64/include/asm/mte-def.h
@@ -19,6 +19,7 @@
=20
 #include <linux/bitfield.h>
 #include <linux/types.h>
+#include <asm/compiler.h>
=20
 #define __mte_tag_of(addr)	FIELD_GET(MTE_TAG_MASK, addr)
 #define __mte_tagged(addr, tag)	u64_replace_bits(addr, tag, MTE_TAG_MASK)
@@ -33,6 +34,50 @@ static __always_inline void *mte_tagged(const void *ptr,=
 u8 tag)
 	return (void *)__mte_tagged((u64)ptr, tag);
 }
=20
+static __always_inline u64 __irg(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "irg %0, %0"
+		     : "+r" (addr));
+
+	return addr;
+}
+
+static __always_inline u64 __ldg(u64 addr)
+{
+	asm(__MTE_PREAMBLE "ldg %0, [%0]"
+	    : "+r" (addr));
+
+	return addr;
+}
+
+static __always_inline u64 __stg_post(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "stg %0, [%0], #16"
+		     : "+r" (addr)
+		     :
+		     : "memory");
+	return addr;
+}
+
+static __always_inline u64 __stzg_post(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "stzg %0, [%0], #16"
+		     : "+r" (addr)
+		     :
+		     : "memory");
+	return addr;
+}
+
+static __always_inline void __dc_gva(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "dc gva, %0" : : "r" (addr) : "memory");
+}
+
+static __always_inline void __dc_gzva(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "dc gzva, %0" : : "r" (addr) : "memory");
+}
+
 #endif /* __ASSEMBLER__ */
=20
 #endif /* __ASM_MTE_DEF_H  */
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 9d018d3a0b3b..66d72d0d3c43 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -9,7 +9,6 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
=20
-#include <asm/compiler.h>
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
@@ -66,57 +65,20 @@ static inline void mte_enable_tco(void)
 	set_pstate_tco(1);
 }
=20
-static inline u8 mte_get_ptr_tag(void *ptr)
-{
-	return kasan_tag_from_mte(mte_tag_of(ptr));
-}
-
 /* Get allocation tag for the address. */
 static inline u8 mte_get_mem_tag(void *addr)
 {
-	asm(__MTE_PREAMBLE "ldg %0, [%0]"
-		: "+r" (addr));
-
-	return mte_get_ptr_tag(addr);
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
 }
=20
 /* Generate a random tag. */
 static inline void *mte_set_random_tag(const void *addr)
 {
 	/* Writes the random MTE tag in bits [59:56]. */
-	asm volatile(__MTE_PREAMBLE "irg %0, %0"
-		: "+r" (addr));
+	addr =3D (const void *)__irg((u64)addr);
=20
 	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, mte_get_ptr_tag((void *)addr));
-}
-
-static inline u64 __stg_post(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "stg %0, [%0], #16"
-		     : "+r"(p)
-		     :
-		     : "memory");
-	return p;
-}
-
-static inline u64 __stzg_post(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "stzg %0, [%0], #16"
-		     : "+r"(p)
-		     :
-		     : "memory");
-	return p;
-}
-
-static inline void __dc_gva(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "dc gva, %0" : : "r"(p) : "memory");
-}
-
-static inline void __dc_gzva(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "dc gzva, %0" : : "r"(p) : "memory");
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
 /*
@@ -188,11 +150,6 @@ static inline void mte_enable_tco(void)
 {
 }
=20
-static inline u8 mte_get_ptr_tag(void *ptr)
-{
-	return 0xFF;
-}
-
 static inline u8 mte_get_mem_tag(void *addr)
 {
 	return 0xFF;

--=20
2.56.0.455.g6c5a503b38-goog

