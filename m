Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177367;
	b=19shWeMG8GjKZo09WAbUiV1OnDM5XWKZ2HNvZmvd606vF+PxJ96LFfSloHVspchRoOfG
	 9ShF9WUXhu3oO8v8rH7rm9RUEq59n5U+HDblNe9UyA/UHsxaWUxsR834qWtkfv5klNpVs
	 gAlAqRUq+2rj4+GNRMwJDSWKtlomwyFnJwrBIiWv+5yerRgiOh+vkKedGh1fzp8Y6DULy
	 +6uA3fHMNjTUAqce7SiA8GzLMlTUXqqMRabnUJfFKIbDGs+MsKK5ltVbWL26/e26weAiZ
	 23CidmNQi43TaX35+gMnornRLl/YOL2uzXf2syh+Qxek/79fYz3u7eL4V3Rj5c3Kreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+TWo//CssvQ+bc/dXyRT+U4/ngBsjpxGiMk/GjYd1ZY=;
	b=BTpApin6M1y4CFoTudPSPt6YBr9kydl140IN69kTWSlfXfHp2P97QFaFW/uM5RO6rVsp
	 a1AAyb99G9gPfaub/wYVs3zweaQME6FnlpoQBfweUi8G7jL2GxOPRaTTLv70cIln8N8ic
	 0Vz3Z9Cwx3rLWd/ChEekRr0+hbwhqQjz8qi3EuJXIb2qUfSdMvna+Br0q9qxW+hIYTFAZ
	 41dO1sXi/O1WssdXtTc/8GJD6BViV1YJi5/M1mWChUNXZIGLD9hRfi00hkzAPkVOUfvYc
	 A3v4KCXRHgO1pn0IQ4BmL0eqKdTvMcIQeJ3WHfG2m02ZKlQ/xUvHEO2AHYmYDeDUpuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iBo/fKGM";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984FA606EE81
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984FA606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBo/fKGM
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso315661a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177365; x=1794782165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TWo//CssvQ+bc/dXyRT+U4/ngBsjpxGiMk/GjYd1ZY=;
        b=iBo/fKGMS3ppUZ99HujRWX8cvvgsVD6yvyy+8UhlVRxMNGH/33aJGFgFPr4WXAaY4S
         Y6o2NVXXa8dRqpi9RiI8t/sj/0x5uXb3V7crE27GYU4LW3HxsZepXB3Lm9ou4hkiHAwR
         /xI8Sq1yalmKn/Qfg2HOLVdakOzKRUXnbtoiN2ILAFE7Sed5CtUYUEgmkvhc2ewo7Mgq
         MxwdNv2vw87q1hzcz1JIk67Xo/B3O2m/988420fBhhuotmz4nlYuY8VdQ96raI9f3fMq
         se6ITY0Li8M/Ek/WnYiA8dasnz8z5S8jsCjF19RZIyEuZHdhxk0VZgV88IITevl4rSpV
         whAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177365; x=1794782165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TWo//CssvQ+bc/dXyRT+U4/ngBsjpxGiMk/GjYd1ZY=;
        b=2B0m5I1HIPU+r/Fe7JizxlftMp/Edbm+LFeEDR+srHfTjNUYtFEsM2mwJmh4T3VXD/
         +fhwj7SdaPzUDhlzYbGBPblzemukDQvcnXEvpOzQTWxxbM5A9WzrhStBITt4yfp343X9
         JNWzwv/QnZFpf7RhW9h7i5Dz+Oc8EOqXMv16MDCMzcK18utyLIh1WQ7iaIphflRtJAwU
         dPfw9x8jlO9ObOKmEnl1pdNmJLEPnUXyACa2w7ACIKkCtDG0Vr6/4NLp6tsUqLoEw4dT
         7irohST5MVCXuaCZaPvzrsfbvEK21t/6JtGvgbn90LRNRlu6QpLQ8ul2Oznh4Jh0LAFn
         T8Ug==
X-Forwarded-Encrypted: i=1; AL+hErHuai+lDdsSove2lNCoNImtX/k/81gojuiV1GxQ2y3UIl4nFe3Uceqv7rQmALvGSZt1ocknDjERcpi7kzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n93eNFJks0HMDWYTlYKNSSoAKaHswmd4a9HNv1cH7cZ3RQgT7
	c4cv8JTh2sIFYJKKM5hRbly3zAx5IJJaeM0sAn2cnkFRbPXTIyHZzS+/
X-Gm-Gg: AYBFou3XCfR8qHOCbfG+d436Om/u3JCBVKoysdnUpF53emJXoRTWb2y00lZg3oL8kCB
	DmSGQLvuJkjU47HlX6IBG317G2EIwftz72nCQc41spq0KUZQ9BLrIvRHl4VtODYzymiGGVXJhqv
	t04nesk3tNofwffOANozaPoNYZWurzOWm9JN5rc4+SJqnnZT70TqqfeK8qP1qSOsK5eEp6vbT8H
	cWTYNaYmirlPM0RfxdLx7yDnolUsIZVxRdZOwId9Vmc7sUUfYtuul2O8JVfjOk2X0oZvBm3KH3g
	wEbh1m42hMBFghGJPt57sYbzk9BTsZx5NeONbvdW959FM4hEKaY4SgfTk2bdAaNAwVW1eDSurjC
	3+Jx2S4b8OiyVpDjJZm9+J7TqVv2TU6tSOP9aQbkxF8vkylN79WqvDeuCd73QWs9eeUYHxX73xA
	7wMKXdpmZyXdrkU2BBPBHRoheis9DLVDPTOyvmLf5Nbwdyy8P9xi1ah8wm5UX2p7iiGfBOFvsBX
	qewsj8h6qTA49rPpipI3a0hWZ2Me96OMHgPJqk9A3lQzQ49BUVKXa59cyQoVlbjIlciu+MbD3bp
	P0aZl/5b1Oxiz0nxhCXJomeOO6zm7F+O0PZfxM6PlcAkyVYrlRUhdRHItVyEGyR3/pjaRPg=
X-Received: by 2002:a05:6402:c894:10b0:6b6:f5b0:889a with SMTP id 4fb4d7f45d1cf-6b7224abff5mr1066267a12.35.1794177365106;
        Sun, 08 Nov 2026 14:36:05 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:36:04 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 7/9] sparc32: implement flush_anon_page
Date: Sun,  8 Nov 2026 23:34:17 +0100
Message-ID: <20261108223516.1125534-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
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

Generic GUP calls flush_anon_page() after pinning a page it is about to
reach through a kernel mapping. sparc32 never implemented it, so the user
alias can still hold dirty lines the kernel mapping cannot see.

The SMP wrapper checks whether the mm mask contains another CPU and then
uses the existing cross-call mechanism; it does not target exactly that
mask. HyperSPARC's unconditional all-CPU coverage is a separate fix.

The anonymous-page hook was introduced with a generic no-op fallback, and
SPARC32 has used that fallback since then. Supply the missing architecture
operation for the GUP coherency contract.

Fixes: 03beb07664d7 ("[PATCH] Add API for flushing Anon pages")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/cacheflush_32.h |  6 ++++++
 arch/sparc/mm/init_32.c                | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/sparc/include/asm/cacheflush_32.h b/arch/sparc/include/asm/cacheflush_32.h
index 9fee0ccfccb8..a65ee310e860 100644
--- a/arch/sparc/include/asm/cacheflush_32.h
+++ b/arch/sparc/include/asm/cacheflush_32.h
@@ -35,6 +35,12 @@
 #define flush_page_for_dma(addr) \
 	sparc32_cachetlb_ops->page_for_dma(addr)
 
+struct vm_area_struct;
+
+#define ARCH_HAS_FLUSH_ANON_PAGE
+void flush_anon_page(struct vm_area_struct *vma, struct page *page,
+		     unsigned long vaddr);
+
 void sparc_flush_page_to_ram(struct page *page);
 void sparc_flush_folio_to_ram(struct folio *folio);
 
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 9cf0065fc2d4..d0ce9d23561e 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -95,6 +95,17 @@ void __init arch_mm_preinit(void)
 	}
 }
 
+/*
+ * Called after generic code pins an anon page it will reach through a kernel
+ * mapping; the user alias may hold dirty lines that mapping cannot see.
+ */
+void flush_anon_page(struct vm_area_struct *vma, struct page *page,
+		     unsigned long vaddr)
+{
+	if (PageAnon(page))
+		flush_cache_page(vma, vaddr, page_to_pfn(page));
+}
+
 void sparc_flush_page_to_ram(struct page *page)
 {
 	unsigned long vaddr = (unsigned long)page_address(page);
-- 
2.43.0

