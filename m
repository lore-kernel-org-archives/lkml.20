Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829606;
	b=OwKpeOohM+xNe9itwOH/FbQGo/5uzn9qSU4FVUEezY4oqb+0Rp2WZh0fCTbfUGmDuCf7
	 LMBjMuYYcD0CNT1asdE7lgU6dhrC/8O1Ewatr32XATMix4QB3FgYlN2+eqeMH+FUCrOu+
	 /hpTMUWMGfZjUpw308XqRhuGfxuyROQ15Z6NpHS/9vfhr1vzmdP6ZIEm5EBpYziOAmoOw
	 Fp7hwc3dN1id/bydLjvch7Fy9jYElnx6p6foNckPSGa0cV52fw0Qer2poR1slnmzcpHho
	 IOagFnbRu4dGYbLxtlayoc4IQgvOzKjLgnm0o5zSCWW9cCvxyKIL11lZ5nXcaCYneWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
	b=jdmwR+JJ6xpet9E5DASGxDg5VuXu6v5qa3VcyCUTRUPWsC/iP2RgX5g/mGy5mMoEkNEx
	 ybwv7sGf5POFuDWpWlSHFlbI4y/rSFmIGtT0qRUmo645wsKDJZQaeaTO/vViyDebnL9Vp
	 2PcE9sKbHF2Dp4DvC8+SQOlV2n6xbIXjI0nT/VDM9syzB9Lxgyy0FPUJhbUr+cH3YXkiZ
	 rz8rXqsH0Ngq5tR+6dMwyvbNADoRVjjyKeVBC2GRVi1OyGWzYKPlR3FkxyrWumvnQFohf
	 YyTs3m6DBDrq4dQ83g90Zzyj25wcNOzc8OQ8TepAqgEprzUn8Z2QdTS8gh+61fIEv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hI/jm29P";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12A608361D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A12A608361D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI/jm29P
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e98798cbddso6195165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829606; x=1794434406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
        b=hI/jm29Pj73dP2mz5KWwQn235C6siES9SaTvH3RCF8P3aV0smcWFS8EsyPBhuRKx5Y
         BctVBcBSxc6d22l3ZKGrQg9iLk5euXqDSX+GUuIbVLYgnGdV8Qb/wp0U2Iih3ZDzdHVg
         a7nHXuUEVmGlLdoSEXiylsyt8I9wAKS6cuhTOnPMCRcY4kc1uJE0AACCWkl9ZQChBzXf
         qzMWpDcbz/9BxNX/eMY9oYkkbaGdbpXUxiQkzk0tBxn6U6Pmd3IQc/6VKQnxSvPEoEmz
         keGphixBrQCVOg7/Vx08C/XC+H9K4KCCmgyXAZUSudX9YlGLMZ17+f9InS7j1/XyWjHN
         WGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829606; x=1794434406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
        b=mQOT1EljQroXkbWvh8XjxQ3VbEPAFzY2W1n/5w9wK/WIV4jnlvtmr2zmNBFFKLaaT3
         LYlxdNeXB/YDIF4mbl2P6W9dIYWOjwI9oRro54YJDWv+R3lxqWspVaIXBZuKP5i6sTH5
         VE96e/n5kVCENNpSGqhwchmR6jzBhf5K0p1w/WvhKI68gg65qkaOxmbYvAVNe2FwZ+x/
         kSGpw/1hkmQJeh4Zg16PB6MpSHSjkI6JSj/cLG3jR3/lit87GLFgn4dis3jW3wRz5waI
         d7JqUuaN9KSSY5sBOumLeJ7FRk2N2yyUF4MvQ2gd0t8r5ifIAG6P4obQpfaVe9V1bE3C
         VdVw==
X-Forwarded-Encrypted: i=1; AKwUvBzfIEIFcBQ6OyIVUsGHYUPY9QiwbC5CcA1hKKX3Y3UXZFkYaMrReC506vRRkhCjgkevnAhPpnCfEKggJy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qRw1VD4TrXH01UzTl4N5cjlNNJlhIrBTAmgdi7T/3ec1C+d7H
	JncUmsfPWwHDQBPMHb2Nh9GeaKAOMIqY8Me2mjV5HvIxvxv+J97XOOmkkp6m0A==
X-Gm-Gg: AYBFou0KCB36ssbnlo40ayrgTl3Sy6C+TUF8CKGlh5JY6G3n0FbWqc1CdfiJJLYe3AM
	w5+p9G07mBIpqgszyNNm/uHS4dGB6CMGW7CSmkCZK4737xpeq7DMTwIWbgn7cvM3p5juP0DXbVk
	twN0nstuR4r0CsxR0fAwVsBo6IjFhv98MysbZbYBgvHSK6EDoM8XEIKTZF1WuqPqen2WtffG2Gs
	+i6OfHag1xXDmhv5oVBEQ5M9T6I/N3AfTQS1fk2vcoZETUU2aJStGTLWwqk10ayIVCzOB7RMp9C
	f/O8AfwExqZW8+7Tyro7cpLkckZ9fx0XzVLxNCaDvXSyb+PypY7Q/5mLCnTY0dg5g6f5nBJ9nv+
	Kk8xa7dbGXlTxigxj5hJhGVlcsi41zshPtlj6oojbfUnaCghd/zysJQCnree+UEu239pAqtdQdR
	X3BKZeroClJVE+5T/OGhTMXhobipWTlROgo7p1x+mALdACgTBegzCpPX+gnicnYxQlpdHABoCr+
	xZ/MBJyWGS2pWe3XhqIYImZ3wKb5YVPbLFYUrDTf8LN92lUG9NOGwGhZf4Tm2tbjCj6ZUjn2IKL
	7CIGWDT2ieSVgGT1YeXJ37E6t4Cp5Rckr+t6kElar4pBjDbxlkQehv/xxjg4jzRh3qoM1oIl+vd
	Tw2XvOJk4VD3Vehmrl3sQz1ct8cuFzHzSxvz7sCgQnfgrARkpch2Ke/WQ7goA5OT2LB4uHEmVxw
	GXgR3T2CypksO9J2CYzua9HqQ=
X-Received: by 2002:a17:903:32c7:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2eb364898b9mr163809995ad.11.1793829605575;
        Wed, 04 Nov 2026 14:00:05 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] gpio: ppc44x: factor out the OSR/TSR source selection
Date: Wed,  4 Nov 2026 13:59:56 -0800
Message-ID: <20261104215959.24035-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
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

Both direction callbacks clear the pin's 2-bit field in the output
source and three-state source registers, picking the low or high
register by bank. Move that into a helper instead of duplicating the
if/else in each callback.

No functional change; the registers are written in the same order.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 01dd5e7cc311..b3cbc832cf24 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -64,6 +64,21 @@ static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
 	iowrite32be(val, addr);
 }
 
+/*
+ * Route the pin's output and three-state control to the GPIO controller
+ * rather than an alternate function. Bits 0-15 use OSRL/TSRL, bits 16-31
+ * use OSRH/TSRH.
+ */
+static void ppc44x_gpio_select_gpio(struct ppc44x_gpio __iomem *regs,
+				    unsigned int gpio)
+{
+	__be32 __iomem *osr = gpio < 16 ? &regs->osrl : &regs->osrh;
+	__be32 __iomem *tsr = gpio < 16 ? &regs->tsrl : &regs->tsrh;
+
+	ppc44x_clrbits32(osr, GPIO_MASK2(gpio));
+	ppc44x_clrbits32(tsr, GPIO_MASK2(gpio));
+}
+
 /*
  * GPIO LIB API implementation for GPIOs
  *
@@ -99,14 +114,7 @@ static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
-	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
-	if (gpio < 16) {
-		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
-	} else {
-		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
-	}
+	ppc44x_gpio_select_gpio(regs, gpio);
 
 	return 0;
 }
@@ -130,14 +138,7 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir |= GPIO_MASK(gpio);
 
-	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
-	if (gpio < 16) {
-		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
-	} else {
-		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
-	}
+	ppc44x_gpio_select_gpio(regs, gpio);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
 
-- 
2.56.0

