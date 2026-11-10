Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276700;
	b=Eelx8GVTaiMkFLVmlzI8Pb0hP9u6roxZJkQiujGjS7RtnT02tuonS0glGImx5X7w8bft
	 GpbEyQVF4rUb6xwq3o9pDr3hHhF8DChBD/1WNtYyEUU06hh2DvQ/ky07pIEwfhtG1Z1L3
	 pfBrp61PFuAQGcxj3wLqWehTZ4D/ngG6N5mxwqpfA8mcgDSMdEIaJmbjsbKNuC7g1gJ8c
	 uxAjogeOSj23IBWmFOlquH9hoF+q6O8z3Ig4Sehdduyhodst4V4LokRSbqFRA85IU7lIa
	 6nrBDBLNR+VfxGxV/krZdo3KKoWFzEn26L3n/Tm9yAlSWu1R5SQW1W5eWAlVPRSnvYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
	b=xnRcKAzqcEdaZlNcz06u2pvs7Av1p+a5px1w3WU1o16ZC67TwzdCy1L+mH1AyiUNOgXN
	 rLJGRqcQQ7mW2+9vW69ILKeM9h9Gj0fSuagqv9Ttv4BcLF/xaGghyOmDE4vImo/G4MgXl
	 UQBsMo5fyV2qkfIEYCvyhmF7r0Bo0Gwn466VdjFnrbTTxUQaq6acoKAQLOM4W+ox9PXcD
	 2NgCFkJG9nZlm6dO3Z0Kv9YqLLOztX5fSBJFAmYvUbVHG/ExOtmFzTyI/Ap9/l7QO8qru
	 B2NBhjRGqzsBO052k6ZagAjRW/h9sZiONX4xVwOeOL8Cw5FF2ntfegI7DDQnFFMV/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seLEIOFw;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA04606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seLEIOFw
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6fe4372c5f3so871233eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276699; x=1794881499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=seLEIOFwvC6m2cjIwoDCZho9raQDHiECw0W0IlrXddiP9fcY004mxBfZg2JYUoUxG1
         WOVhjRpPHS5E07UVk2hKXgZBuBxn7xauHA2iWW4o9atyxhmgvyCTZvMD0t1CA++eC20M
         R6aiVpKbdWIA9bezLbQvjSiSXim8ymaU82D/EJKm81RxQ9CJ5Hx4bS8/U3ScbCplcCA9
         lIrTjuTPRIgCEI8qzMkG8DuXIcfsdGc1WRnKoiUW7Uf+wSQBMliLJJ4swfnVIxpqZJEx
         /1ivy0esnLBPyuB8BNfqOLFpvWr+uPKP1WhI7BVycMuZMdWjWDkbEN2Ip70AOokiUAol
         vtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276699; x=1794881499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTu3X4QyB3nudJbrQzIVh4I/G0ZNmo+cjpo/1+ph+rk=;
        b=n7naFGcZ4wp1EaPJbA9D4XtPEvIfYX6c72lQCxQSJNQGl8Nk4Jye+ZaXBFrSLO/cBq
         GtaTGZlw5YpNDTY3hM3NgkgW8pJ7wv8sBCsQxu/2RVJcb9TTmHw0ZNDvtMmmde5byltb
         WaY85MbGJMqpY0oiEh9BQnV4wIIakCkjQVLiyOTnWgpY5XxNuc16tbhE3b/yBOqHADxn
         e0hYTyCZ1+KXUcIVEeCraxA+8vGPQK/lpYGI+WlVmGAklTJ1xbmhLa3iPrdqxlMe3uB+
         n1XjZEfqWPmknGXQMgwRgIWsV7I8AAgoUTJm6yrPs2vBzoVX+M5TdyQuHhPgcl0FpwL3
         T10A==
X-Forwarded-Encrypted: i=1; AL+hErHJ7PTIQsQTfLSNMpeKv5xF2b3Fn00Drzw3rqE5cQxlha5QGChs2CEPHVblP8skKG4zGje5FkpuaP7iMDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gPuh5e5upRnFD+didLbLUvtHMRsw/rOfnB4XiEDjYw15yPQe9
	OV3h8maJjZm3uireB4Ej6fXSGwrtxxwvTpVBfmoXMz3ykGTQyaqjQBSU
X-Gm-Gg: AYBFou1qS7T5wfWfaRvlkufrwEmdgwzbNilMBP11NMxMS7OiZUFm6s8t87vP1owZfDQ
	RqC7eXeidit94tgfqgv3g8euHfBafQ1WbJLA6/8Il2n/4RhnDdDF7w3DWTGPJm9Alkwt6bY2/8N
	y8Uf+nDTpZZboNHvAe1tmtGUGt0scAYaU0yxJWkpOdqnAJ3M3UNpcGHn5wt7i4peif7DjGYKBiO
	WgG1t0NukIK9FLYSQAef9+Bqha23UEUUx4yViQZcfz7LJAusWZwhKu74FF1/1ClFnThjKC9abQS
	RssAH2I8sQVMcLVQ11asXrBXoS++za/HylRqofjDAJk74m2RnDv+imrTiFpu3HYDHOv5A4Rl7OX
	l9o6wVklkbcdU9xzNuGnalDN+pBYLZlzhlkuh5A2r6OQAKZcSw8qJRDdEkoOKADhYOAW/DxoPk3
	G4aYig7RxY589Fvr5kaGOv+Oivu++YplExXN0jcl/1EAfaTgtA98QVdWF3nQINS7UTMzfNjwydC
	aFqQgt2JbOstfE5Fd7EmGSaq9NuXHu8KXIr8LS8/JMVLgzVo98wayTmcCj/6ik8KfRZfse5uzGS
	D5fPhZLHyx+80miC9wY4vQSgrd80N+NROr3JSO/bbeSj3D67SVk26WySvk5sEWjT4giwgBK5zgV
	9+Ixi
X-Received: by 2002:a05:6820:5055:b0:715:24e6:9529 with SMTP id 006d021491bc7-718a7bd98d0mr462083eaf.86.1794276699230;
        Mon, 09 Nov 2026 18:11:39 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a945ceebsm717268eaf.8.2026.11.09.18.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Mon,  9 Nov 2026 21:11:36 -0500
Message-ID: <20261109-a733-pinctrl-v3@gmail.com>
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

A733 uses two-bit voltage-mode fields, but the handlers selected when
v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
handler also writes an A523 control register absent on A733.

Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
for both A733 controllers: the A733 User Manual v1.00 documents 01 as
auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
descriptor so A523-R keeps its existing voltage handling.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
Suggested-by: Andre Przywara <andre.przywara@arm.com>
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v3:
- Set every two-bit field to AUTO at init on both A733 controllers.
- Shorten the description; retain A523-R's existing handling.
- Drop Vinicius' Tested-by because the voltage-mode programming changed.
  Keep his Suggested-by for the separate A733-R descriptor.

v2: https://lore.kernel.org/r/20261104-a733-pinctrl-v2@gmail.com
Replaces Andre's RFT: https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tests: arm64 defconfig sunxi W=1, boot-stack Image W=1 and DTB W=2 built.
Not tested: board boot, 1.8 V switching, A523.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 19 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  7 ++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  2 ++
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..006754c0645f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,28 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..e095abbb7232 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..444930d3c389 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -732,7 +732,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 	u32 val, reg;
 	int uV;
 
-	if (!pctl->desc->io_bias_cfg_variant)
+	if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_NONE ||
+	    pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
 		return 0;
 
 	uV = regulator_get_voltage(supply);
@@ -1659,6 +1660,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	/* Select auto (01) for every bank, including shared VCC-IO. */
+	if (desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_AUTO)
+		writel(0x55555555, pctl->membase + pctl->pow_mod_sel_offset);
+
 	/*
 	 * Seed the output latch shadow from the hardware so pins the
 	 * bootloader left in output mode keep their state; see
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..7b36c5c2263e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,8 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/* Two-bit PIO_POW_MOD_SEL fields set to automatic voltage detection. */
+	BIAS_VOLTAGE_PIO_POW_AUTO,
 };
 
 struct sunxi_desc_function {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

