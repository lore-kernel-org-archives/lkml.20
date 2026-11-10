Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315745;
	b=ez/RwwHXuz1yQrcXOt+gGN+/USiZ7cwMuPXq6m4qNsJKJQ41nGPOzHaXeOA0Lp9phwJw
	 wSKzu7TkBlA+VovivxFHFZhnN4CFfY3QhGp49ipWp4yINaB7y6ezyuQ5d3rDcECNKIwjS
	 qE2Ho5xC/Bt8Ngv0r0IhZjhXkLR6POxRoFj4LOhob9zXiGXDN7MBtZgzhm3gGz4eDz2sG
	 6SveN5kpq1BvvgBpGD2CBBDFsOadaaZ4IUwOEv1rkNBNHm2j1G8UPzWNWo5zv5TzpTGU3
	 RrFoIMo/snSM+C5pDlRfEOJ8paVidlUcNaRWqvFtNNLVzvyfu4zcK+3uNkmADFhXSww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
	b=0OKtWSAOZRjpyg2WNa9g/vtOz1F37d7B4OseApfR3RRAGA46gz+rVKsvlBSB1UUA1uZr
	 wQFNC8ne3uU3x46c55RXim6R0KhxUjgy5K2t6BjYFlenNxr/oXHBCzBTxFPvMGe1OhL0m
	 RHwiN0E8EZUMBY/itzX2WHS57LWMoBK9eaBZ032jq1B4pWFYO8rt6/Lup3Uo6+qANcSRZ
	 wAKyVDvl/FfTDtziVQC7qD7aOeH7IDdC26AzjT5LEo5gnGElVCZIY+QJCBBAJKgd9FDrW
	 lDTYMyvTeNgzwHU2HElU6NeVzXN6Lh4NAM7l8glgNbrHpZLnM7ED3qpH+R/ahr6cxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT6uxmeV;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF12606BFC8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF12606BFC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT6uxmeV
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e948e56af3so738309e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315744; x=1794920544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=PT6uxmeVeP7Y8K6sMNunJNdKlUzDMU1Gd/89tgmqn4GRh1XL+8kzfBL7Nt4EFylQtj
         RyQIfBxTkvlYeC4gCBbbK2P9nzZMBFyAQfxn55P+NISv4fCK2kAkbDACJarOZN7Vnb+B
         6ggs6UzceUP5tzrt/A2r/dqcj4hod44cVSa1/aVqWVumHgdSdUKDJ5iREaeQVC1EMaNW
         fqnWZ+gnH9fwkOVZ7T6Zoe3D0ebrvGx1v/e5xwQTApSZVS5iOmlirhBqTl1bklBLzdeD
         x99fQMIqGp931QGCAAXl0vHIXkowv50lI6obi8m1VsW/FsEuguuRoJ0JMWBAQg+kFPtn
         knXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315744; x=1794920544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=SymuAa9E+VykVOsjXnjqU8+CwjO3I0de+TOkhIRa7i76GlY+gcroqB4VR5Xmg+udPA
         xC66yyXXMcSt6OHVk6R3QVsVWAQdm/4GbLPqtoh32Pg43OKhsU70MfE+Y79S8MQesPGI
         co7YE7ozaEwCcCUrtmE2A9DO5NbuI7aitHNzvkw/wFwKB1z3V8yuiCnF51dKFDOqUfAc
         xz4jzNfSpY87oDivYlajI/cjhh1YljZ7oJgoeS/dDEuucZr/BIfv4QGAQRKT/V82Y4Mg
         BIYiW6o99jxTwHBcYmEkgFDcfR/Bjqp8FkstTwzuGzCV6jnSJqnJyotPB635vd3O14H0
         LpFA==
X-Forwarded-Encrypted: i=1; AL+hErHuqTmKwvmleGes1JYlyh4VMr2NxFXwmrDNY/mjveJZ0e1A6mIR3C5j/nvmLQOJmU7mKkBBLjy1xZk+/bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+37XmaYTPaT09q3m3bq2UTB4iaQ4w7H27HsxqHJ4BjDDGUpSd8
	xMRRtd4p3fA7dkvGtnd3HyMCu/VkSpid5bLMpjmYucocDTF9kiHjWCxE
X-Gm-Gg: AYBFou2TeZJEgO2wKYU8NJADgewSZvYp9xkrA4I2/eT6NlPhtDWLthExdLQpMk056ub
	yUb7EeyT4nKjcxFxdGuRFzeoIDiYLW6agiVkquNMIlwoGqHh3nQ44vxcVWQMiBrNJGPS2VaHl4x
	uCbxRI4ki02+tB+pPP8mB9TZD3NRdxT8ukpS7wUQGSUQEFbHs1KrOB4zfxsTA199MV/IQH7WEvE
	8e+qliMfIjPSlZa4IGwYAXXodgOLOmuudaSYlqHT0z84E8DmDNQyx2dBJ/sjQ4BOmzvIC63UEPO
	NJ9dN752/n5WmFNjKEdiivVojIDl2ugcs7/k4m3+fft9eIJBaoMT78N1JOocw3mfLUeMedeRbWd
	gaE/wnlD+ncLk6Y367KY1wqLdHf0D45gqqjsUbzEGNC9jMk2ImR8HWxYu6y9m08lKarBf9v0+er
	phHMdVlbqAT+hKysVitMx1kj5RSQU9sbjLqVYor2gDHNYdT0CPlb5xYMGrTd9J85p7j5QwVMveX
	bTeYgzIATQibNvT2Jvcs4/A5XLRoAeVPGUFstokIfv6Y+oWsriRgWWHsR0hKnGuJe9YIGrmQS+E
	/gud0BOqfKKEViM8/oVPTgeCKMv72eQuPUBc4qZnbQ/KcUcr1ZdL/22wzazxwBFQa6NRCJzuYSv
	dnhuY612xKN5nhI8eAkj6DolYPbidzcJeYAQ/Qo0quTohkiGeVT4yR0MwrjJ4R5Y6oEIHnwxI1i
	A=
X-Received: by 2002:a05:6122:1d01:b0:5ec:c3ed:7d99 with SMTP id 71dfb90a1353d-5ee0d0a5264mr742890e0c.6.1794315734491;
        Tue, 10 Nov 2026 05:02:14 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5fd00esm1573509e0c.16.2026.11.10.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:02:12 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
Date: Tue, 10 Nov 2026 10:01:57 -0300
Message-ID: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The A733 description sets irq_read_needs_mux. When a GPIO used as an
interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
interrupt function is 14, so after the first read the pin is left on
function 6 and its interrupt no longer fires.

On my board this breaks microSD card detection: the PF6
card-detect line is read at probe, and after that neither removal nor
insertion of the card is noticed.

The A733 data register reports the pin level while the pin is muxed
to the interrupt function, so the switch is not needed. The A523 and
D1 descriptions do not set this flag either. Drop it.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
applied: before this change PF6 read back function 6 and card removal
and insertion were not seen; with it PF6 stays on function 14 and one
removal/insertion cycle was detected.

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..456d9170c2a2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0

