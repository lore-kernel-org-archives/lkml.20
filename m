Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596926;
	b=lkKnBwzdzOy36Gvg87HG3TUa/sJQktZWj62yOc2NhSDzimkpjo5WPnnVfKkQJ7nlf933
	 4It11csSHS5o4t2NxZupKVU4VLo/3MmaeB373r5jGLYe57DK8oFzgpfIl8eOrRUuAMJUr
	 tLyrW9Tj8/2t67ZCTySea3ritrWCRW1WTgtaAaWI1Yn2uaNni7iI9ysWqdsxvrkhJ4NZn
	 6zL3HB0g/gDQ0/TMvz9HUl/sqdfCxgTP8tWauurKf9waVIIqwJqRmb4cmI5oan9WIDrjy
	 odEv97K4mm/lhL4LAS6h2YujTahniBsVWowxEULiCGniR/9KB7vbW3sw/AhOcFMV/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
	b=UC694tBHh3pzAqPyqTcRIeyhkQ+q2U4R4zH2EiSZD2azrdZ2nlMFPVJ8ae+nL6OYW9Yl
	 P4waa0sqvljvDrl14ckgJNvfT5/r6/sBy7XoWSASUJzYi+ACYlR9sB8j9f+Q1g7ckvy8I
	 QVy54DuDysmELnB9DWYQyxW8dvAUwyG+O4ih1UW5Qi8gmc7r1RKIk25y6LlOMUt1WdNIu
	 bcg6hM8ZlxuTzhVM5V3L2g/W9pbuF33rAkjDV1h0F3UJCYjFdx2WYmgzcHFqjfD3SBbo0
	 8U3x4/Dub+7oK5OiX7jWEhX451+DVa1BrACrL3SnxcgEPsKnwxeGyblBOUpqgDfPV2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C860A2639
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953C860A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so1819094c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596924; x=1795201724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=c1GT6lkIeEaVDry1XrkHExW4OiOorkGfGdECtwwnP7GxAVa8Ph1vHb7cWWaLhQPU8c
         egMQeISJRKAyadcCfJauQdAp9wkMmQeCiqSJInggJtHaHWr/wDQVPTdXeFKGSD9Sw3wV
         jxD6ArkkqZySAAzIbTZG4QlYB4NKpU8Z2mHTK/Fwif/BFHhG584U+c/uiVBHeGUq0Aqo
         I7Wv9z0Ukt1CprAgHnl4vA3rSqBa7A6tGcaCyMdp/y75Q326QY3K08IzwKlWYWpVA95N
         SZNP3b+vAHt0dNTKNA2uhR41sKhZOfUR8zULbtsEZGaNGCZwjVeuL6haPH7hBHAWTDJ1
         JuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596924; x=1795201724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=i9owduEnDHd3XUz8jsPsDUUUH3gZOJIReugrORRTou2/S8O338UHoCoyNCgamiq6JM
         DcJQ385BZmPdS3OC9R4f+fb7qhwc1X815SiY851shypc4DOhRNj32AYqd5ukXhYiVyCN
         82DhPaUM9S/xBcnj9hDkNhURf+7aHuikVWySrd506UuD6Gngla2Fvsk8vnQUZBC5rLVP
         HPlNUTD79nLHLqvHvxDNq5dXdifA80+RyuMIVfzYGMqsrlyNCsrZfqCbzLlyoRGyFUlI
         bIb/xM1s5Dj+urXwbTNiyQAcbPh3eFdZI9McNpJstE/XZNc3M6ul258/m0v/WNfxaubB
         LI7g==
X-Forwarded-Encrypted: i=1; AL+hErHWYsLWTTKKaHsVUKsz3gpeMnJI5eHjP0rcY48aYjDOm4m8aVQH4lxih8+uY6P9Rfb34tqTBHuM1C/8us8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wr0f/7m0FqEr8Q8YjqAniMX8v7WTUIq/bYblmvK9QeyJkhOGS
	y/5pNbozPdBCH6UpY7wXq0kiNq17PUw4s2B61hLxaDaXRI7yck5lOtHx
X-Gm-Gg: AYBFou2RNYvYNkLt+wOHqKcQaBRFQgfAcEdYb6iXOn+6AoMYqb2IDNuR3IfXa/d0wDy
	ItacdoO4yWVjmiEcQnb1+Zw+Yfj6IqCPWnrEQaidzQnttZpsUkjBXohGE6bToPGvDyXV6lftvc0
	SjUBa7gnbKX9/kKOUDXkJR9yYiq8Zc/aKpKBUXdro+zsDsuzYXYTC4elVsL5nlmgXaMCd5ymhQ0
	Ul7lPHIBsQAZTPIOx1BqXA1nwpUhxm7HuUkESyfze7ySFdFIb+gbc4zfhIMAyKEclmFK2pkd+Ts
	rYHZd41jGDEsK3tjKLSsT9FOxaf5/Kw7QXnp/0EO7eBTCLuXZ+jBRxs8CXx3pbclztndNpm3vlL
	+OmvT377Eti5iPClWvOZEhu2AfAzMS2SLZPrO2eFgnmraecrD2xIj93a9CS79RcpXKVDtjob4wN
	8zE3DgJ7IktWtfQL4xwdMX23JEGDT8guKHOUJckoVVOpAW4l7qr9eZTi9LY5kBjjkjdRJzbVupl
	4ihKuJcQLCZ0tsQMgHkateb9A6eE4ODzv88Fab5fjw7bxu3W0MPiMXNhCo+BIdjiVxo3W+AjdgX
	LHPUha32
X-Received: by 2002:a05:7301:a22:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-3797bb69cf2mr2548474eec.39.1794596923743;
        Fri, 13 Nov 2026 11:08:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 11:08:34 -0800
Message-ID: <20261113190836.470937-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v6:

- addded missing Signed-off-by tag

Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
