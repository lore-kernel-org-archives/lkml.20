Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792483;
	b=CBWgY0l0CJIG78BXnXmiWT5oX7BGJlZbjsXxebAhCSWxaUtar+KVQ8ITS4JqcFlUG0Ym
	 +YjCmDv/WIO0167PsA8yLDYfQu2pjCPKodflVDtBkl4ybJcXKutu+qokhPRpZ/KfLYeIs
	 s+H2zSH9mjtnq3AYaHct/gSBLnZNlFt9WjaCiEijmuX/gVFWM5zuaSYW4pJ8u5aoEXo1a
	 /LL1/SbPXjKhoXM7c2PzQHSldOcEqOewySHL7pkwsYrhMD3ToQgfiTzZHRuDvIDmZXzup
	 mxjSXzT3iZf9kmoGSdDoqBv7sZ6K6KjOabDLx6xK7rs+mZVbB6XpVrX0tfU82x8u1NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=izYKdqoeoSdawHeFj/YzAtZebFxT9JtTIALU4NjHjR4=;
	b=h2fPhJidVYLIrEdMAFyCt7Kw0DO4uJuEZrHPlOIwBHo3T5AT8yeDtlPDDyTzZB+fGhks
	 bnnylsvU4WC5wBJG/xJVoCLoQltg096/JzVBot4GG1ppjgXBh16Y1G+f2pOl0SNxgA8DB
	 AuhcW9dJ9DMcp7hgF4H4Iv3DS+Bub1VUcF2+IfmsnZB+97hCGQKbj0TkQpPLdjFOGQm92
	 ClSGnE8YHsK5e1A5CTLpt3Lq09tyoux4pEyLIipjRw6HRJuy/8vwqIXDqykuU3DPNG8ci
	 /lWr5gAMTdAxEhSx6M/6WTm6nHBBoKIc8k46klT1p/DSHmY2tzNCaZw82JOJDu+erXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUpSFZ91;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D8606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607D8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUpSFZ91
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso380697a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792483; x=1794397283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izYKdqoeoSdawHeFj/YzAtZebFxT9JtTIALU4NjHjR4=;
        b=FUpSFZ91rkWfLqLAFhZVbsjzNMSUObbfpIwwxnxRFhycxnlfSNv3QRqzXs3Yw2Ub4D
         pF7Bm+EEkpxWFMage9B1J9QUdD7J0QxtSh2kBak7AmuqagHq4TRhsJwnQ8vKE1kc+kEY
         h/sTj/mggLP2S4OUpe+q3uNGrr5LlDagL1oqE38xM0aLfiJDEMk93Y3A8vp/fHkyLnp0
         ZydBne6Wo3QNWm7mfjIDvM0a/FdhsVHdvUSKprpW2qeHUvkAQS4aOTZtzf6AHk3zo8Uw
         EpZk3FZHUKWp/osTNB/h1NFIlgv3nYg0NMKTItEHkYsOS/+DH1YxtVOWCsJtgi+uY02Q
         5vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792483; x=1794397283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=izYKdqoeoSdawHeFj/YzAtZebFxT9JtTIALU4NjHjR4=;
        b=FKPWQCE7csQrPrYET6GZPiBKChFhE50lF0n+6DjjZykPH3j208se6s3uQnVImcViDx
         Ox1+go2h7W/ryZqykvQ+uOCz3VSMwJV2Ckrrir5SBDy7bbyOA3crVKXn0Fm7vdhjBcYV
         DgpI+qDMzPW+WKqycMokV7DkgXL+WfXFS8V37mI2QB/35N4H4Ziyml2KXEPkwlGf4woe
         uCvIuzjcr+nEIYlNNbBHSDBuVGfc0uO9+ltpHY37r+UEZGb0xf69kY0k04d+6ccjVhTV
         HO9+mLwy4uJvs2USKgGrvZGKkh4TLaqF6X+6837GB+6tZrJIOdLIeLhKdoPOf4Eh58E0
         g0qw==
X-Forwarded-Encrypted: i=1; AKwUvBw1msxNjeKn87Ca3vNOORNO7mmVqUZk+//0aTEaq1gQhW/Vb7sFiJsy93F+CkVsuFbIa0Q4t0CNGxFYDIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/d+BHhRjq8IkQJSQJDYjCFONall72OXj7Ya8urdhWkdmV/73R
	/Tz9OyVK8bpZcuIsofC/V27P/XI1gPWACWkILc/0pqV0hN+TFE+insE1
X-Gm-Gg: AYBFou1FBVZI0tsu6335nO9EDsOkTat5lVqk/jvkSQK0Venmumz5x8EoqcajyA90zeC
	7b8TFGp//0kdfzmrJOtLFStrktdkKejSM7qFDdYf7YyQ1/fllHcSp8N7+7q7OJ6MgTI/eYriCOa
	8HsaIBJE06Xrff3e/undKvnFbrMZrfGTaN97BG+OrPnDC30MC68igfYm1HEl8UZu9pHhKh9Dgzw
	kjdexg2B1/SJrZAau39Sv6EdZOh4RqMlw2TI5YuPwX1l8msgo9ZjWg3tlbbi3Hl4JHQLk9lZ0tD
	0pdzygZMHk8k2EbeGwCXCM/InYsOgKMRfyYbENka+X13ujdvOctfzk+rQ3lsIgJFM6gCEQ9unDE
	Or86Qtm0gKbiMNPQ9fPlnp+N3sQ586QXsP084RwkynJRFKj+R91sILPVa3tXiDLkCBYVuQceTBU
	ScS+u6FIvy3ksHCHiI5GmyxrCqS5E5yIn9VBx3stJktATErDTn8uQMibBq7g3FCELgv8dhQRwTT
	3s3rXz7nt7hk1QwAhjcbZBjitNqoILZVJaWMpaV+GWNrESLmfC17emCl6MIR4yLg9iSchUKJ3RD
	Vz62/MoU2bnhjFlGETlmfDnlVZMjoqXgSsXDl31bL7WWYUqDnWVo
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr14269962a91.45.1793792482472;
        Wed, 04 Nov 2026 03:41:22 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3770036a91.1.2026.11.04.03.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:41:22 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] hwrng: histb - fix read timeout
Date: Wed,  4 Nov 2026 19:41:04 +0800
Message-ID: <20261104114108.2378751-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104114108.2378751-1-mmyangfl@gmail.com>
References: <20261104114108.2378751-1-mmyangfl@gmail.com>
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

The old figures were per-word averages, but the device produces 4
words in one go, with each unit of post-process depth taking ~200us.

The old 30ms timeout was chosen on that per-word basis. At a depth
of 144, a 4-word batch may take as long as ~30ms, causing random
read timeouts.

Also, a restart after rewriting the control word may take ~300ms, so
use a 500ms timeout instead to cover all of the above.

Fixes: a2216e187471 ("crypto: hisilicon/trng - add support for HiSTB TRNG")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/char/hw_random/histb-rng.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/histb-rng.c b/drivers/char/hw_random/histb-rng.c
index 445b80beed62..d435d4ab9aa7 100644
--- a/drivers/char/hw_random/histb-rng.c
+++ b/drivers/char/hw_random/histb-rng.c
@@ -26,16 +26,21 @@ struct histb_rng_priv {
 };
 
 /*
- * Observed:
- * depth = 1 -> ~1ms
- * depth = 255 -> ~16ms
+ * Observed: the FIFO fills with 4 words at a time, roughly every 200us per
+ * unit of post-process depth, i.e. one batch per:
+ * depth = 144 -> ~30ms
+ * depth = 255 -> ~52ms
+ * Rewriting the control word delays the first batch by up to 300ms.
  */
+#define BATCH_TIMEOUT_US	(500 * USEC_PER_MSEC)
+
 static int histb_rng_wait(void __iomem *base)
 {
 	u32 val;
 
 	return readl_relaxed_poll_timeout(base + RNG_STAT, val,
-					  val & DATA_COUNT, 1000, 30 * 1000);
+					  val & DATA_COUNT, 1000,
+					  BATCH_TIMEOUT_US);
 }
 
 static void histb_rng_init(void __iomem *base, unsigned int depth)
-- 
2.53.0

