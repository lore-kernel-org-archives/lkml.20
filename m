Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904959;
	b=p8sTN1eJHHryrRMKc/E0UoGkHyNB18pi3WGpuUsOnw3fv2ofvLF8BXRBfmmH2/sPelE8
	 F+n1FfWn+CCFSDiWQ8YfVtr4XMm+5eT2ZUlZnMncRAmCbM+dL55QcEnzvaW+eP2nkxWWU
	 bN+nQf1wtPMI8AVfq7/UdpIH7Pei/BsK2ExQX9TP+9zmUO7q9zNL11v+3YJTt/B7YNPTt
	 gl9WilWCl7/TVJlp4XheuQMo0mJyFxIItdcRGaOwUEGFv+X20bIzmv1IvVaJgR/aO8YBX
	 SWLLb1+N+e9Ik5il+6O1ap/bSIZeUgUxKbUHwdo6p3jG71p91GkSuotHfi7vB8gsx8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
	b=0G3foRmssIAo+iMqTVEG2KEelcE2PjPORwU/hr5LOX5iDfaGvEZSTYffShnFQWxh3h15
	 6SbKktlmoFYWzf8W1nG7hrmPtd4cakMOh+xRwov/gBr8lxXU9Y8MpC2teAZ0elm1Q1G1s
	 PaVbvszO6R2V8E8EFOKufq9bQC9bXi3lFxZg6CIInch7XB5WuppFD9I9AxHXZYK6dGzSi
	 PeBF1u/CunH3qRarjdeb2EaRzeqnbpGBZQmcdRHwbY+jXY14wN44vOtdZIy8jHUpI7Y8R
	 BbMqv534iClQWeFqZWphFZoSP1DOkTRNJKCjwM9+KQLW+5an2yI4Kw0B5GdiAmRVVqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYyjVWuo;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754B46082BE3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754B46082BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYyjVWuo
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dde81a6820so1436674eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904957; x=1794509757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=lYyjVWuoOKNJPABMuP/3QLExRn6GuPJpWyxNvWSUgg0jfO91mx48Yyahq0yc9mDOO9
         UjvC3khKQdZ0PIeiIJfG9cCrh2ahYorSE9snNqm8Gdoc3wwoKO9BkJiOM9C0JqRepj0Q
         tkWzbpVrwXTfOQSFHz6t3n2FDCsi8Hv3BtL88eTFv4ztj+k4lROaxBvvOuan7DacVcK3
         fnJaHNJ0Xtn7YcpeEHbFfmSe9pKEA4pjyj2QDM7OI73fNWAqRy2+d+2UcA7lf3NVr6j/
         MHkegb0THWy+k6V9/fqJ63lWi2R+QRKJJAg1lLDdBn/3lbY8fGQo3AK6SWOlGecUrSwi
         SmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904957; x=1794509757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=taj3/D/xNo4ZVXtRhp+dkReEUg9Im6zD5oYe+HDey/UCrOwhQAx/iBWAGCDgxthn8O
         GAqGVSSOSxn65R50UnOAJ/bHo0xmGtme4Gv4S0gZ8KTThRByA6nf+uu8gODNGHql2UP+
         TpA5IwIs0KM84TXikzzr7+FV7F1zxAh3cfqoBGQn3TtROb4npK6g3BJ2mmO+8B9eGRK8
         H5GatEajGwB/5Zq2oTfnoZTx4G5yihbmaHwpOg5pspDglnfJuS6fr6V4dBouPe8BbOXj
         7wNoj4FivktED+xfaU1S37jhfSCtp3oRmFKph3yA88nNOKV1/nOSB1eH1KB7wMlw8Kqu
         ryng==
X-Forwarded-Encrypted: i=1; AKwUvBzjpZZ+D3EzQnDfJLMxL9rmbpbmrGK6rObM4GraQ5fDwdEbuXjYIAIOjeuPWqABrRiZ1MTL61pI56yT53g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BI3vlvq96MycToPy4cRoR3KQZbWnS67Oz2MUlcbPGUV1RZF4L
	PolnXJ3Vd1uJ1edRmiH4C/yeqEf4DkwpdaJ0KUOa4UAgb1c5lM/75nFr
X-Gm-Gg: AYBFou2HVKHQq6rQ+iP64ykhVzgoSRfJPm3upIZQ5WfpNM+2a53nxJ4MnaNxqkvnaFB
	7aw+SbNdsgWYnb0V4ODP8QQjid/DOXaW1469kV7z9Uu3eWM5Y/4lu2qaDAROguzCiCmfNVeQS2N
	dnGvA0Dvb2VwSo/A6zuBSLwWHGKPsl5PNelRH9brPmW5iGVgOlL33x/tu0dc6dzyWxfwIdxRmp1
	sXrz6HrAqMi1jT7jwhMHQyRe92+LlsYO4sexVjP5PABGgx3UGmMG6en+wI/iAyD80iMaJ3/mRoK
	4CqI+VjY1VmZo93NeuDc7xcezz6DZRpTFIg9VYSSQodBnn90j7Rz+HrAwromDDIg0x9c2HIFbp4
	7Oot+RlC2QfmKdeBybxQNClESsao1vInVqSpWIXu0TGUyk2Heka+NR2lCtSA6W80AVbdOdUTB+/
	OK1Q8nJv3aRkvlo6sMWAa3+e2PdvZVHiva7KQ4mzL+IrWm6OCNJomlMgibJESqydQKIOnacSp0v
	5SKDIZx2w8TOFzFEZeklBywr+hILSTuMaQRZMEGhrtvnN3IAKhxbl6U13fu7QospDH+Xg6PJJLt
	Eib7EsPehm/SZoCcjrO0REcZRhnJxH2saL5Fpf0woEojS1IpNCUqaL7AjtuyIkHMXRx7WeZP1Hv
	Ff0nE6xO+IlJOKYIYvAEBZuvvREXU+2YfynZob8i1270BEblVeFbQ4ed60SCliuPU8NR68DCo4U
	zHbk+PvjooLS2NnYe21ZDQ9TEgaRCqb7hFKlr4PAVCj1MF2xEH0dPW
X-Received: by 2002:a05:6820:a513:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-716e78ed246mr305545eaf.38.1793904957427;
        Thu, 05 Nov 2026 10:55:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:32 -0700
Subject: [PATCH v10 16/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-16-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Chip selection ignores clk_set_rate() failures and caches the requested
rate anyway. It then installs timing registers calculated for that rate
and proceeds with the NAND operation. Subsequent selections do not retry
the rate change because the cache already matches the requested rate.

Return the clock error before changing the controller configuration and
update the cached rate only after a successful clock change. Propagate
the error through exec_op() and the DMA page-write path so neither issues
a command with timings for a clock rate that was not installed.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b92bbe19c0a..7c80f52c517d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -651,16 +651,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -672,14 +681,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1824,7 +1830,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2627,9 +2635,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0

