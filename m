Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735438;
	b=I6LErAAoMmdcus49owVAths2f16Q47Hlezt6EeazdH66aS9nN8QRADqPBaBqjJgJsQ8Q
	 vCWg1eNioUxjlL88v1X69ftaCVodolRk2+qAWdpniMIEiAoL/rU6EVoa8houZudR4QqII
	 7B1JAxcEQDME4qajeOLM/D4eWlUdp9zVMHWj/IND17qV9a8TpdauzIDo4FSCgEUVBsMzY
	 3FvSuB9/yFbm7TbnFxg7fN/dh5MraHikoLLJ3aOX/qwn8p2fe+fo/KFKbIcAoTSO6gXlj
	 YNHpmZh1dGbcCoY7ckbtUrNrDcQHr2WHJKX96StuNUjKDtZawAQqhpkpmskzctVgT4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
	b=2MMIlTshyhbc+y7Tfa9MSfV8kvfbRsgsOdCqbWK8VfiUQHLAaz/B6Kf6IdYZssP7UOmw
	 1t65oeRa7kHuZBAlwYqaTkMjtehnKW5pRoxRm17g4XDHaAAkeWBgcpzlTkY8DoPy/6gv6
	 gDPLq5G9Yd8AzV/b/LOydY5qX2ABQvNezTro5VLo/vOblM4WxfYv9Hmhs5h/TCJgGtLK1
	 KOMS+4zkv2madYBkFoTa6ZvSrB/X28dsuqzAN65UpZeES6DQsDh/LrYYcxB8Qg8xHHzeR
	 ZRQovu9wMeSG3SXnwk82A0VaWffZZbtQHot6+d/IwG56FthKm/nk8TjDzaZVAbQe9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUBVJEct;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF9606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUBVJEct
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso33242465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735436; x=1794340236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
        b=TUBVJEct10giEVxI+REQOsUVl/VR6wr9G9IeimsArAq8Hlfl30ZW2d9L86yDo5VVEU
         igUTTxWl92VEbrqA20uQuD8EyNNoOuURUoXa24DqUzTmCg5e7KcjIZlaChuT6YQF8sXf
         qwnN/caRfuuuLUvvKkRFHy707BUhIxhhD9xRFnLF8F2ukocdCIORR8O5YeGjVdrfYtQP
         mKOfl22vNyxjVSsUntiwNSVUOjYGJyL1qNtSvHKZgZuAal/9ZKrFefvvpyuUyCk4K09e
         y6sTmjaHuWb3Ib/xH8OZSt/mUWmVwj3pdad+jFQGmjSFR1VUxL3GMH3SNUQhM7V/lrjC
         1CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735436; x=1794340236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
        b=N+AsmdF53cqYPz9OoGa88FJDb+3VXNdjz/qd9dcBITSEGgBiuK0pBcCuTsbT9zOdgu
         +fJVUCNQfohy/AD1C3QESCpYIcPLUzYxNFQX92GziwhXeO/MTkuYR48Hs6J0CHLuL0Lk
         pZp4HNsKnXFzqxlViy3RMB4CUPprNdaDHYIlyy6meD0aQnwIAMUoV40BwM/X6kIqxywQ
         djm0J22NCopWbeKvKkNpURodC0DxDNogaHm0jjq1/setIxve53aNcSKqjoJ6QTm3cgQc
         rodN/jAzZiHE6mPG0JKrme3Jfy5wzTJGX3IxNeCmz+6Eu9llHpNfeptBCKjMRXsXLZXD
         m1aA==
X-Forwarded-Encrypted: i=1; AKwUvBy9XKpv2COQguZzqfP3eQWoShlZdhzlNc8eCRT3HNJzIveE4y5tVJuZuqFLugWnhsdY+vNhs/fwqw2UaD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B5QwuVsZaXlv+7iyzFZpbE7QCU1aeRuvYKuW8WidlYU4QWFmc
	rgxBNEUPELzsbuVVdsx7rs2iHJcjCsj0utlbokeTkSnSJ23iA9ThTwsV
X-Gm-Gg: AYBFou3myAFp2/zK7ZAOW0Pycw+BZr9aRWFxdicU3bzPEa6PqbckUk6QHhl2ox00g+S
	BXAEXSjN2rJexG3UCShnWOQ1D1hy80f0K0iLk7U1LfTEGjF3i62qXcmh7bsimJgJKzC86VJ0dId
	PCIklZUbUvKjJb4BVUpLni7scYKvefD0dQImaNwB1CucMr0kZeE9k9bLPNPbISRJleFnxPXNPfG
	NWvouZRxhqYxviHzC/Qr0B/LFAHfOLLLP1/Sh5/Ym+cRxT672gvHKJzYuFwpIhCni2HHZBIZ3c+
	c1ANyxJgc7KjgR43rMsqCdTKjUJoLzx5VtYje+gnyq1OuOI6HyOpB4K455D+Cp0ZfAKryDnj/uM
	UORfgq8NIY5anSZT6qpoga7QtwNopDZotoQrlvMUeue2oGxi7AwfPJAEHCiWm4Z04PPaMzG96i1
	22sicEpO/m08qCWe/acrVXx5cp9cBha1dBHO0W0v8JMjAGrAH95lLrN7GsYgx1N0EKh0zMbSaEc
	qNGM35k0L4UiVOTJbKjQh6n3k14HWcT0MgOTR74dcys26u7yyxILNj/5tDWGo/4HnLDNYdGuHms
	eYtqVD+xkJ24SKKAxCfj5f0+Q31VYgvZNpvWlV0axsxWnwRvXZK89Y4FMsF9lVJ8GPEQuN0QbZk
	s/y8fuI1e/rPZ/eSv1XlIuFu1n5EkbMLH73qhUwRLMQ==
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr320942815e9.5.1793735436259;
        Tue, 03 Nov 2026 11:50:36 -0800 (PST)
Received: from ubuntu-gnu-linux-24-04-3 (host86-148-231-190.range86-148.btcentralplus.com. [86.148.231.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d028sm309364f8f.47.2026.11.03.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:35 -0800 (PST)
From: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Subject: [PATCH] pinctrl: keembay: make keembay_gpio_irqchip const
Date: Mon,  2 Nov 2026 21:25:00 +0000
Message-ID: <20261102212500.195783-1-auhmirza02@gmail.com>
X-Mailer: git-send-email 2.53.0
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

gpiolib warns about mutable irq_chips at probe time:
"not an immutable chip, please consider fixing it!"

Make keembay_gpio_irqchip const, flag it as IRQCHIP_IMMUTABLE, add the
GPIOCHIP_IRQ_RESOURCE_HELPERS and register it with
gpio_irq_chip_set_chip().

The chip only implements .irq_enable() and .irq_disable(), so call
gpiochip_enable_irq() and gpiochip_disable_irq() from those callbacks,
following commit 35d008679a5a ("pinctrl: plgpio: Convert to immutable
irq_chip") [1] and commit 2993d2dd8ff4 ("gpio: timberdale: Make irq_chip
immutable") [2]. gpiochip_enable_irq() is called once a free interrupt
source and slot have been found, so a line is only marked enabled when
it is actually routed. gpiochip_disable_irq() is called after the line
has been cleared from the interrupt configuration register.

Link: https://lore.kernel.org/r/20230414-immutable-irqchips-2-v1-3-6b59a5186b00@linaro.org [1]
Link: https://lore.kernel.org/r/20250509-gpio-v1-8-639377c98288@nxp.com [2]
Signed-off-by: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
---
Compile-tested only (arm64, W=1, sparse).

 drivers/pinctrl/pinctrl-keembay.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 3241d3ae6219..486577458883 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1380,6 +1380,8 @@ static void keembay_gpio_irq_enable(struct irq_data *data)
 	if (src < 0 || slot < 0)
 		return;
 
+	gpiochip_enable_irq(gc, pin);
+
 	if (trig & KEEMBAY_GPIO_SENSE_LOW)
 		keembay_gpio_invert(kpc, pin);
 
@@ -1412,6 +1414,7 @@ static void keembay_gpio_irq_disable(struct irq_data *data)
 		for_each_set_clump8(pos, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
 			if ((clump & ~KEEMBAY_GPIO_IRQ_ENABLE) == pin) {
 				keembay_gpio_clear_irq(data, pos, src, pin);
+				gpiochip_disable_irq(gc, pin);
 				return;
 			}
 		}
@@ -1451,12 +1454,14 @@ static int keembay_gpio_add_pin_ranges(struct gpio_chip *chip)
 	return ret;
 }
 
-static struct irq_chip keembay_gpio_irqchip = {
+static const struct irq_chip keembay_gpio_irqchip = {
 	.name = "keembay-gpio",
 	.irq_enable = keembay_gpio_irq_enable,
 	.irq_disable = keembay_gpio_irq_disable,
 	.irq_set_type = keembay_gpio_irq_set_type,
 	.irq_ack = keembay_gpio_irq_ack,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
@@ -1468,7 +1473,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 
 	/* Setup GPIO IRQ chip */
 	girq			= &kpc->chip.irq;
-	girq->chip		= &keembay_gpio_irqchip;
+	gpio_irq_chip_set_chip(girq, &keembay_gpio_irqchip);
 	girq->parent_handler	= keembay_gpio_irq_handler;
 	girq->num_parents	= KEEMBAY_GPIO_NUM_IRQ;
 	girq->parents		= devm_kcalloc(kpc->dev, girq->num_parents,

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.53.0

