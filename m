Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390915;
	b=jv76KVDCcWoHj2XsOgczXXr74dZVaMBzFQTfVkweODFKZmHcOMgvE2iGjfukqHw3veyd
	 xb4GpSu5DhTwztrr63hobI0Qupk1JSgzWEUR7Zg8xSxhsFyYqKVWB98lXjl2ZKACcSlTU
	 ce5hYmC4ZBU21jxiKgNWfj1sM1HK76/UKih7KLf92PWB2LO9L4adNrpexm/dBNhlsmnr5
	 +s7Vfco9XRzXrqepWxzouxSBVmMpAQeXJVE7PiA3CSC1zHsnKGkwJjAOHIVDmtz7lfw9p
	 hWVmGUPMkXE2rn9lmva5dNkLrlwGKIyTQ8RKOblzZbCCJOG7GkXuLjVFhBWi4ZzyYwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
	b=gGbSRRM9GIHIlyCVEZdTK6GWDIrr19cEa0yKxqxioTpL+HEMhrKBlI7dx5gZJIF+odTM
	 4LcN1XyKJJk89VNQDJGwPr+1D/gtHvgKr9Cf4nNGlApFunaaO54gO7E7RIQ8+mFrnXvBE
	 MyMCBviAYN/KO+k2tydwI0tgsr0vLFDqRO05JLnz1PcRBcPEoSDJuODPh9FxA2MpiQal9
	 K8BSRO5bPLdtnT5WVmcscHQazlmqcV/bp5z9+J6VMN1+xqspvPfKE+32pw1K135ZtemXD
	 9G/H4psHIZ0rtsz6M0UeaUfgvAAkihoOFwRQr0BYEeak5s62HE67E86OxhREizF0nXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7SAVhHO;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DB606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7SAVhHO
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso652849137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390913; x=1793995713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
        b=D7SAVhHOi28Ioy3WF/EWn85cFtZrYbbr5DiJaoFuqe4GREHCscRY03cfrX1LIW/UER
         hR/6ySqB4OHXZV+Y1ORmuJHCmryZT4vL/3sRP91M4L9dxIfLShSH3pza0AamkpLW6+3f
         s6aQx9VSGBxsnWSpzLC/8cz9gBHZ/udO70BPefyeUy45U7m47rmAKP0IomK5pw/gH5H/
         8Jz2dDCER58szfVsyX+76O6b1yPbA5LBMVHltqeV24/U/zmtSS74xbdDFgvk02Rd5oS2
         bMmSTQTSvkBjMDeYUst94gM94vCLJ2NsOWUZ5dYR4P/0FadZPhdkgKrRcwNVtPhhDCgV
         T9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390913; x=1793995713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
        b=RGhLddq/u42Ng5bFKTaKpPq1NFnNVrxic0nw8DxnAAd5JXYJvwyhmJk263dI2sj9h2
         41qEqzqAd6A0D51cRZEMFbLFlnOISJCJjCa4pkY6CGR86kSBe/qwrpl8XX50TkQE7S5R
         BYUWR/KM96g+OLWc78qL7VOnkYh3An8gTIrShyjA9EvEl6FMMds4qk44ZaVU1m2Ys+DN
         UozGEc8FWuyR/edcX3IAzr+NGMnL4dqkyKL3maIiPAjoyO3/yXRCxQ6dQ2dSYOjTENUH
         NeRo+Nw7hJRqs4zBEiqHGpw+K5TGoRqCVV4va2A+/YXFIQQLrg2+Tf/KYmjjP47mxu1n
         aB+A==
X-Forwarded-Encrypted: i=1; AKwUvBzmlQioX9otIczc+5xV4/tpzA7t0kJTOvIMvrIjzJUOvZXWBllHO2c7iucn6BeNiL/gMdcYwQi6ogDNhnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5bkUlEJ0QVp718RQSS2OO9jBRMAkxFqLMWs0anD923WM9W+I4
	AQkq4+tzYhswXGAmR28/b7/h+//+vCLKarskudyJXwJolOy6mzBB0udz
X-Gm-Gg: AYBFou3eRtMF74VvfNavLRHRvQIsp0KdjuLoNqz/kPjobuzd2ua3U8MS/+FBcmukiiL
	KxoaOMExYdQy8NbOVerJgBcVIHc/eUjUhC+ra4NlMc/6Dj/dx4X0Kaw0x5eJjoxb1V3e6nVW2GG
	UyayyHuylHpz1JydrjHS22M2/xVTINHA3OqPF1kHURy3pWNg5BXyOn0pwbfgdreo2cJzAKJeLBi
	nwzwLJ2giFFCVJR56TGIVb5e9YTxnOGTP2TguHt42VTxhcxhG8Kh/xC6lsxSoTMpENSADoBM4lr
	2w9HvogMzPrZdhCTqW1ALCWziGt9z4+QVbfAfdHqYWG+mZKAf3Zv/uGhDig9xULwvwicXDzuQ9y
	sgsW3lCyKgP+88xKYmETxoTOL//kN5ZVOvtFteATzGrZuwj8Aq5r65q+IHR+CRM5Fv11KnaO5lG
	z2l3ftlYcbK1x9s2lIh8Ma5unLHWdMRVKp692aOwufYSdtdoTXGMtHsWJmmXiXsJF2OSfnpwpVn
	WEfvskeoGFsw/6pAGe6Ksi+zmb4UC8MwynDvdq8e3qBZ4Y0czGft1kBd5tPgxJyjxPrjKxRmkjo
	1z3Nt1Odkb7EYtv20gvokan++rUxqEESKHLrtVU=
X-Received: by 2002:a05:6102:8086:b0:7cc:32ce:4c5e with SMTP id ada2fe7eead31-7d0726b4e19mr2004616137.16.1793390913530;
        Fri, 30 Oct 2026 13:08:33 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07768d366sm3315699137.10.2026.10.30.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:08:33 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious GPIO IRQ
Date: Fri, 30 Oct 2026 17:08:27 -0300
Message-ID: <20261030200827.24648-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
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

When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
keep asserting in WAKE_INT_STATUS_REG0/1.

Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
a spurious GPIO IRQ on both the main and RGPIO banks.

Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
Changes in v2:
- Drop the early return on !ret before writing EOI_MASK to
  WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
  !gpiochip_line_is_irq() path still receive an EOI signal on the
  controller.

 drivers/pinctrl/pinctrl-amd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9fa752f55..92a08f240 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -671,7 +671,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					irqnr + i);
@@ -722,7 +723,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, pin));
 			if (!gpiochip_line_is_irq(gc, pin)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					pin);
-- 
2.56.0

