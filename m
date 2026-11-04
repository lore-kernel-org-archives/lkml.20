Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829608;
	b=0Ev8kPI3GndNiNpiAk2SS014RUTHxnzSIshn0/zY8Dzb5dtademe/0MqGnV8AH+ZgXgn
	 /OaUXB56lVlTU04WQSe9No72TMnexDJ/jBzFSNWqy+j6dOsRHDViZxKP29/OAUNGY6lFq
	 +02kD+x/0OXhNG/Px6rhGh08k9YpM9t/HOmjCiUY6FWI9ILxQvd5V17GUpYGJ3pBgWlXC
	 r0yr6HQHqimcyNkUcMsR9uV8rQg1LJzxKwEbT3cQmyrY9tajmJg+qFZJvvj7rpHQFE0n7
	 vzRgvA/bUuSKY0siVkZei/jeHHEEjxhR6scud3N26wuquI0e3Hi495W6O1T2FHis4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
	b=j3PPx+a4z5KUy4DCB7o4V5Yq50/5lSlKyT4I1YxUrb7K6gSCl9j8cmw0ak++Ku9nH6nb
	 ePISjiyBkhgKoGJhtbVykjCzsqg6+toGQBY//Gx0Le3FZECJSvFBby3m+r7T4g5+NNij/
	 3DMhiDzrGf478iVvf4A7kwowrcjTUvjL5/HWJwGl8XPijXc9MSHK3tyDXeCuYbpinUOC4
	 wauXvpdekOZx4cfPS2mD18eQulKyPga+ll56JeDzSpnCKAQd10EQfCM0XXfOC4ejmKdTL
	 QOooJORYYNPqG0wx0SBlyNQAJ4uwKtV+fvnJg4Qc/eO6gEED8F0CUy6wY0rbxRK0iOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMVAvhSm;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2847C60877FB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2847C60877FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMVAvhSm
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed1f1a7695so2811515ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829607; x=1794434407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
        b=VMVAvhSmuoSNgg2N+X2SNsiVMqgp/vsB3tiywuyaV608ObFEYF/Sl5TxNCD0HbHC89
         ABVWL69R5CVrrkU6IwCp/zTN0qjnpiH8lCc+NZM2UdF/+MIy1qYJ1Lk704pFRTJqaHvD
         mRLUt4eGWRW+HKXmRcyEoB1P7n4b3IxGiXGBZxZ180lMD3TP2zVwL0WY1TSKJfPO3jnc
         cTLtfcGbsIUSQw2o6Ojpoahph8FKbPewFF3W9dSS23dBA06MOlVpnAOS3O5fAIiQVk9x
         8KMHFG169oTTYsas7RkNl2lJHH8LOKtaHiilHaL8l7gpvXF6IQw2RxQHbbeQrElvR9n5
         6Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829607; x=1794434407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
        b=qwh2AgDOKPlWMrv2vByCqPaxkqyjh42bQe07ibi3na5KThgbRo8f2kIAQy2fvvwv5F
         3Y8Qrnzak3BMXsgaXEeO1XVSYCvmo5QU9Bpj3vPWu+ODkopv7zZ99HAm6NWpomI60lBj
         qmQUfDnOzgkieJ7YlikfUSlWB2RsRdDyAyxI8CD+pBcYZ1/O4kM+97ZbzJ9YEo+Tw1tj
         I9jV3Ze8+8f6sj9NRNiZtneqQzYs+2FKNx2WHviJTYPCiRSw4yMjR9zzqichGV9CJV5W
         wcSvmQhk3HdKQ2rSMrix774U+18fDL8ODUfPMsZJ54LGxg2w/CP3YjUEKt/nulHWewHC
         IIpA==
X-Forwarded-Encrypted: i=1; AKwUvBxFzyzkM0T3btV4et3FzhROerlVzPVaTzvp2e9tcVA6WJkbhHbrhfW4I27bRuBz1JGjJtNHqQ2kNAAXw3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+1MzzaxbZW39nqmjn2m+BOu4XM2AsaaeSG1yBKrLGBljlGmo
	dAbLihDzAVqy9/uebspZLH3hDl4qoOxgXtTUM6EvuS0k8EU9AR74iv3bADJuuw==
X-Gm-Gg: AYBFou15kBL9MaMtoUotP0SSmklYfq1RvDRZpMQPQ+2WRXWy45khN45rvZ7gYhEAleS
	9TfMvJLozXY04jkK0A0CrYxw7T4yD1B6vhnMWqsXeFUM9WDQeXR/MY87B57m/x3lQe8sYuxVoSC
	XgCJbC963xAmpJI2r84zQIWHoS/tQvCp72yJ9VMbDqe2iHKMjggdhMJs2ydUQ4nn0FMuc55xi49
	GdQSKbw9p0GNXWSAIwXDWu0ocAb++BnagYzRUX4dDLnVPay2RFlR15wo5C+8Q/KEtvwTdOkyk7T
	SP+jHIfeGa35dwJfcww6myZPT9NacEIud577V3x2nbk9OTaoi+jEUMgsFe+Q+KDkQszDssQITu4
	qsit+vZM4aemIm5dN/rGRXVNrUE+pP0HR2DLiibwXPAfPmZ4lmRNFFrKyqQYwhUaBlTm5uUPMlu
	62ke9FjPyJByxfJTkwpFwk+dGRFqmEbCrT3R/Vrge9xPdH+M03keyS788FqxyEh1bme/PKozr2u
	u0ZwwMNFVG5oBvF7H3ROBHAB0INe892Q7WF20oWzaoefTc7W5Fn15vuILNEuFUHjQz9i3BEK7GW
	8ZQmovLaxCiQlSMHdM4SL8rG5VvWUyvLN+LJieiBUrjqfd2RE3bl9Ra3eDlZhb1MU4Ok8zlOFXF
	rGAI2HjJTaYjQGOHZp2DSTR1Ct93BU88XHBunSkGEncLl3RrB0iPS6vz9ywbXlyzHUWK7KEvbfJ
	Nj5A==
X-Received: by 2002:a17:903:3c6b:b0:2e9:7dda:7194 with SMTP id d9443c01a7336-2eb3642fea1mr148462125ad.11.1793829607379;
        Wed, 04 Nov 2026 14:00:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:06 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] gpio: ppc44x: fold __ppc44x_gpio_set() into ppc44x_gpio_dir_out()
Date: Wed,  4 Nov 2026 13:59:57 -0800
Message-ID: <20261104215959.24035-4-rosenp@gmail.com>
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

__ppc44x_gpio_set() has a single caller, and it looks up the driver
data that the caller already has. Open-code it in the direction_output
callback, with a comment explaining why gpio_generic_chip_set() can't
be used there: the generic setter takes the chip lock, which is already
held at that point.

While at it, drop the pr_debug(); gpiolib's tracepoints already report
direction and value changes.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index b3cbc832cf24..20b3e9ce48e8 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -85,20 +85,6 @@ static void ppc44x_gpio_select_gpio(struct ppc44x_gpio __iomem *regs,
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static inline void
-__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
-	struct gpio_generic_chip *gen_gc = &chip->chip;
-
-	if (val)
-		gen_gc->sdata |= GPIO_MASK(gpio);
-	else
-		gen_gc->sdata &= ~GPIO_MASK(gpio);
-
-	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
-}
-
 static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
@@ -128,8 +114,16 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
-	/* First set initial value */
-	__ppc44x_gpio_set(gc, gpio, val);
+	/*
+	 * First set the initial value. This can't use gpio_generic_chip_set()
+	 * as the generic setter takes the chip lock, which is already held.
+	 */
+	if (val)
+		gen_gc->sdata |= GPIO_MASK(gpio);
+	else
+		gen_gc->sdata &= ~GPIO_MASK(gpio);
+
+	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 
 	/* Disable open-drain function */
 	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
@@ -140,8 +134,6 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	ppc44x_gpio_select_gpio(regs, gpio);
 
-	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
-
 	return 0;
 }
 
-- 
2.56.0

