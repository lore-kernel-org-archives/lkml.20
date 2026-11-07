Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065845;
	b=Y353c89iftX+yTSzWKEgtyX3kPKzRA/yQ9VWCeM3fvV8j4QTt1I887F3lkkl5Xxrnaeq
	 HEKgGaack5reef0ENtDMkpm0jzJ2P4eAcl+Ru6DVHBJo/zI4Orok/YLMNhtO+ZE3YmaIo
	 KgRY/Z0rdDOlZs8jE7XlBCHuXCzVDtxNUBPSqyaEvo28yOTnX8DG9MuGBsOICHT2fddWW
	 XxLSs20auAmy5mDlh0iT8xXmDYkEDKXbXstFT1ckXLHGjs8FgUTza4VntqokYNFV0L+5i
	 S8f76OeVu52r6vaZt7Oz6JQOXm9jWAGn2iQhswXDYxutTIsefioP6fB9FrEEn9ygR5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=;
	b=UO9zoblMu6gSPosYAptHQNUpn7/lZk1cPSz1AnJCZFcu9DueUjnfHAiOd1RPbV1Ipj9V
	 K4PWwQtJg5B3QJtDekJT/21SDGNtsYVbwO3l4JE/b5EJ7zrGRwXcXnk/5CnEb9rptwb7S
	 cFOWPqVYYkBiRMS4KM+noL1jmj2VHo0QTryolgE7U7/s6SuTUd3fSg2g/d0ascGlYKagF
	 Qib0gle/gU1rbqpD6T7H2oGTbz1fG8YSWbRS/AvYFxlLIq78AY6ToBbKfG9PV5TIOltOv
	 YTivbQJIfJOSTc74ec7kL9BVJ6qUEiSJmyESgI4uK3czgU5Kxqiw/uCKkV9RWkvFb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fTvCTlx3;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755C6082BD5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4755C6082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fTvCTlx3
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c25edb54d22so223170066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065844; x=1794670644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=;
        b=fTvCTlx3HiiY91QhtoNNzzynN668reVufN/yRq7wgFWgy6d89kAdDHTg7ikxNkrDAP
         jrx3S9lqd5fMKxiqo0t2cEJKJhO08pQ/xRlyfC/rj1jlmUVdamKjKMneIf9G823SiAcq
         Vun/MTIUc515/yIOvi0r816b3OfJhy2l4fvVCDcSY5f7+nmsqVZLjaqxJuEIXHIsp2Ld
         UXFAQwuxq+8yRLb3GClxvEULiUTLBsikzTNUzLIgnFus+qABTCk28Zcin/KWofEQqOTC
         jiguvrmSdJ0WdbxfNNFgzWRoiJ+4pROmouwA/SZ6PtziLwA+0ICs4tEYdLXfg8bL3Huy
         FzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065844; x=1794670644;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=;
        b=huAhJInapX03LPCDIz1070AYhCtfWQDhOOFKzZ9iSGfgA3RjxJ4ceh5Z1HDEvQpj25
         ca2vbO2amtMTTaEOBglASh7z7v3RHl6okwhGHa/pW/nssXkUWkRh6qCCat8Hc0PnlWQW
         Tb6I8Jxj6bK1eNUggaDfiUQGXdQyUMK4fMv7bfynH361Xz/duSg1RBBwS9M7Je7WWDtg
         /+9w2GffiSw90j8lAtbDegO0n4c3xIvLplwGtQbmGo+52Zyp1/QoVKj6pe4W1nA4x+QB
         Od3d/OR/akpUVxiHKEHIhyW0CDuC56umLx8QRosaNRnaw6UtVFn5oAb01o16r7NZ0NAQ
         sJ8w==
X-Forwarded-Encrypted: i=1; AL+hErGAKH1QkMAexrN+pfHwf4G+V71yZcxG1cqPdtpFxkuNee/ZsRsY8Z7NOVuq2iCboIBBndSXjpQ33IJ2IYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JWIRLTQ81AspjEqzWpTuylh84m4VKXYNX0xkbgZiFkYltYNqu
	w9GeZFQsnweM5/Z5hlXJ8Qyb1/VrWIH9l8gh4N6euOl0QwvKoJmGhHIwraD6cT84DaeQTT/nkbU
	vzg==
X-Received: from ejcr19.prod.google.com ([2002:a17:906:2813:b0:c31:9562:e7c8])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3c8f:b0:c3f:d8f2:f08e
 with SMTP id a640c23a62f3a-c4d3542619emr438107666b.44.1794065843438; Sat, 07
 Nov 2026 07:37:23 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:17 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-11-d84ea5f30f94@google.com>
Subject: [PATCH 11/24] kasan: provide empty stub for kasan_report_async()
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

Allow callers to compile without #ifdef guards.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 include/linux/kasan.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index bf233bde68c7..e429fb483176 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -541,12 +541,6 @@ static inline void *kasan_reset_tag(const void *addr)
=20
 #endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS*/
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-
-void kasan_report_async(void);
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #ifdef CONFIG_KASAN_GENERIC
 void __init kasan_init_generic(void);
 #else
@@ -562,9 +556,11 @@ static inline void kasan_init_sw_tags(void) { }
 #ifdef CONFIG_KASAN_HW_TAGS
 void kasan_init_hw_tags_cpu(void);
 void __init kasan_init_hw_tags(void);
+void kasan_report_async(void);
 #else
 static inline void kasan_init_hw_tags_cpu(void) { }
 static inline void kasan_init_hw_tags(void) { }
+static inline void kasan_report_async(void) { }
 #endif
=20
 #ifdef CONFIG_KASAN_VMALLOC

--=20
2.56.0.455.g6c5a503b38-goog

