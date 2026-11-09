Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253714;
	b=RupgCLb++BF/CQPYAXoSxUcG3H+2O+TGAi9qZ/dNB681NPy9JzsZyH0jGhW/gZK//jEd
	 AcO4eVzX3OR02z51X2M/5f3saNq6tk+/OLYuS6/cN1mcCHtLrTwZcjW+UoTtC+Kh9vfco
	 nnVMTgsMKtxl83KqPQpeCOS4FGBv1z0WDKc3/tk7ZM4dKCSIbENOigDyP8lXcCdvIc6yE
	 tZHOxxaI1X269GwVCWBvWC8ynE1p9UeRcEE+oFSRFhoQwn4WYvPyCsP6yDvSdroB4tJuH
	 2XU1DRcCBHIjfk5Ar5FXH/AqjX0o9KSXTcOwWeIkB5b2WqHi4xVAk7r6GAWdrm8kY3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
	b=ybbVQjcXx8U16qpTJXSgl4xAdK0rfB1bcJgOPoaHWJtgENWUdoJ9HSqpih4Yp91Bcufw
	 eVvd5JsPYLDGAJ0ubclN2xu9mNvJGDWIfzGM2oFvD6RN/Mux3LQYhm2CINB82muTPR8MM
	 o/Uy75ZZ7VUeXubXGpWPgPa7X246tFCeoumRBJ8fYde9hImDePP36ug0HeFauZzwTUtJS
	 V/LganLDwMkKWNKppZytRBByu66zm8UXR3sPakv8pkd0/25UPJoODweHfuQrdkD+wLviz
	 aCn6EN+vzvT03oiT5KxOvgKiWrlQA1XA4GHt3Hpn2IzQv/dIU8LxQ5H+Wyhimd+fBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkBlloGT;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA9606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAA9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkBlloGT
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f6295304dso1622064eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253713; x=1794858513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
        b=vkBlloGTCA95RBaB+i3kq0dG40kqd5rAdmF6OoULbKrTf37YiyQGLWhqKZ0HSJDQky
         ih+b4XAudsOjRWQut8MJbdnUFV1wQSpucIWE3X3ZnDaVLu+TeyJL5RGn3BFYLeulfCfy
         UCiDOBioy8Z8d2bN22PG9H72T+Y+ERtaAJSqQ6vJq5ru3eCo8sOpeiXViiamsGqgZryX
         Tm7JcfKrS2ZHbPnHQ9Jh+Jd5k3jvekL5TIEFVMJmyLJmGjJANCanI3lHajsxuh1rtvg9
         BVT8WRis1iIL1N88H4b5hD7oRyg8vqF073gqSJc8UkM17P0FjnN9ZW60k4IeQvhfksMP
         hCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253713; x=1794858513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
        b=eoSA3QopYD1T7YC1m1RnHguHG1TnIhQqMq4ly+dgnitg1lWaCPd4DjKuY1RAwPWKL6
         /fTBzE/tUwJPD0gYy+27m48DL/n48kkwrPp3oN52Vcmv9kq9WIN/H4hwVjrkIlMVIUmP
         XXUUoC9GnM32HHSpAS9QrjsrEfg9/Mw9o7rTrByXhVBnQiqB+KcGEGr2YoET3jBw79KG
         qloZzt4lyriCTEvWOCwWpd3dT6Q5B9XUbEC6OTQ5pKNsw9jI7rXaE+irS0l6Xzp8cY7T
         A7rdl1ddWVCbwTYD//P/TNTetNTmzpZfQCqUYTW+2W1QtIVMeefpo4QmvwAteq/jCGua
         fBNQ==
X-Forwarded-Encrypted: i=1; AL+hErGpWjftMEmXxUSvoSvoNNt2E3DXiW7a1IfQGE6cSoFE+7mO1PVNI5nyq7yExePXvIavvPGKhf4kb0gKPbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+laD4yTs7ozfOC0qYcIZNlIWtn9zA8FwBqtrkCYH8BVtcryKO5
	/ui7RFNSqugIOwxvlHqKXsd9P6NWAB0boKQwhN+eRCTX09CDkLOVEtcy
X-Gm-Gg: AYBFou001h/Ex73rB9ITHZkOjgPhMpXmXwgzalAcLGOuOVYcmsNvkBCdH/sLocYWt8P
	hz0KFTZDRBVW7zB9j9zXSv3NBiXdHJaH0WpZZQ70feL56Y9E6fKKKnadWiNKR7VxZxdHY//DGxn
	crxXzTSBep9f8u6NgVL6VoINpTMKocm8P5dKkbpRcY2nIiIMuAW1GpoN+Aonpj28deULQCEWuFO
	Aj4v2eMI9Si0Y/LnzpCMglYJIKC3ufQ/FIADJb2KubhZzoSis64lLW+vUhZ5h48/LdTjKCmoVE4
	28gO/pFnWNkmEiDqh2rXheYJMcBAyerUMgcDcHNVW5eYUQq2oHVSpSDQdfabkKLfGOVW6N829mz
	BL+FKyCFSuiIyg0STYlBQmsU2LSPnQWuHsrEgcFOvuEM0Ja578Ik1yZlSzWnSg9cu4B1J7qxagK
	CQmUQdcXOKRVk1P0zP2MafwntEkaIzKjzTSyV+u+Lqnmd8K4CAb6/U67+VAI1HcJFLdyg3dIGhP
	O1CLNj3y397fEO54IItUX2BrOztMRdna3c3RHEx5IEU/usooPmutU8jZrGcuvmV8FdPw7zrRq6w
	aZtXFxrnFTual2M1kaivOVbPaooEMt834dciJbKh2ZZsnLKOmJb6TQLmEwBzowAF
X-Received: by 2002:a05:7301:7d01:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-3751e994360mr365715eec.11.1794253713247;
        Mon, 09 Nov 2026 11:48:33 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:32 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: davinci: allocate bank IRQ data before installing handlers
Date: Tue, 10 Nov 2026 01:19:10 +0530
Message-ID: <20261109194910.2282454-3-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

If allocation fails partway through bank setup, previously installed
chained handlers still point at devm-managed data that is released when
probe fails. Allocate the complete bank-data array before installing the
first chained handler so an allocation failure leaves no handlers behind.

This fixes the probe-failure path; it does not change ordinary device
removal.

Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 drivers/gpio/gpio-davinci.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index caeecfc3df20..751c0e3a9676 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -550,6 +550,13 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
 	 * then chain through our own handler.
 	 */
+	irqdata = devm_kcalloc(dev, DIV_ROUND_UP(ngpio, 16),
+			       sizeof(*irqdata), GFP_KERNEL);
+	if (!irqdata) {
+		irq_domain_remove(chips->irq_domain);
+		return -ENOMEM;
+	}
+
 	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 16) {
 		/* disabled by default, enabled only as needed
 		 * There are register sets for 32 GPIOs. 2 banks of 16
@@ -564,21 +571,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		 * gpio irqs. Pass the irq bank's corresponding controller to
 		 * the chained irq handler.
 		 */
-		irqdata = devm_kzalloc(&pdev->dev,
-				       sizeof(struct
-					      davinci_gpio_irq_data),
-					      GFP_KERNEL);
-		if (!irqdata) {
-			irq_domain_remove(chips->irq_domain);
-			return -ENOMEM;
-		}
-
-		irqdata->regs = g;
-		irqdata->bank_num = bank;
-		irqdata->chip = chips;
+		irqdata[bank].regs = g;
+		irqdata[bank].bank_num = bank;
+		irqdata[bank].chip = chips;
 
 		irq_set_chained_handler_and_data(chips->irqs[bank],
-						 gpio_irq_handler, irqdata);
+						 gpio_irq_handler, &irqdata[bank]);
 
 		binten |= BIT(bank);
 	}
-- 
2.43.0

