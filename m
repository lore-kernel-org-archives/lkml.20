Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623299;
	b=v29B2IRoJsqJF9T557w9dHiAlqr0ajo2X5KrMoyYY74ASo5hIr7HWBu8RNdYwFlY9wkK
	 RYLWyXiqjPXkGbB2+e+/t9onpL48PUVOMnnZVnvyEHx8RyzVFM1jl0DRFXzfaJYoaIGH0
	 uldnZHSpkGtVBLPzHI0dTlx7Jkvncx06vEmgsXq3+vvqvU517H+U4wqRYuNecJ6LERtq3
	 Gur86E2bykXImGkmPuhzcYWpEATH2plXNyShnFBXatacrrfdpkAmn3uwfD+kAVnDrw5n7
	 Ky82O8j51p9cP87Mc90VSX1lABdPLGy9hkUcwwOIUStgpRC+AyW9e+ZN5bUigcE+Usw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
	b=Beu2JVFBvLvt9zgoYNbUhwM2aIN0z4GMzNZ5DPHY6TDCJVSqEpO5WxrmTU+aEyb0jaf+
	 /r+igUOLMCKyLtHu1GJ++UWZSzTndE7ADuaowhQTZ1FRXDTqRdZq+Okukc72ttSGCWq6m
	 eOHcet3pClpnE9htD5Ws8RB8MbD1j/TXWWzBmPb59c0VWYGvQ3XeESfKI5zqvcMAB4V6R
	 /YjaGgC6JKdbrLI5qxfI4cIyeWADyY7l+0Y+dVe7pmhd6HiuIC/yXHLvrpR/r3VAyo1rd
	 2jckmP3+ZPPWFLEhuydpRsjuxRhpfcPerHk4X4sNC57wOnS1GoLyAkCVENjCiloxhIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H2ZBSHh8;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DB4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H2ZBSHh8
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so1658886eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623298; x=1793228098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=H2ZBSHh8iY/+LjSGN+rdQMrGwoNlDu+2nFTIql9k4764AsLHb4OCf8SHQpylre73JU
         RxcvUcTl6GgOxnf49NqxFOdy6u20iRNb1CltTaJqcW67Wc7Qiqt4EfjjNMKDiXuFOP3R
         gfBmVkSfDz2ElmVPAOoGxC4ThKw1gFUleQocWLjHkFH1pXFxBKp8nGKtw57hVPRKTQma
         ROWH/uTRMF2cQPuRRWB4DadC62Hn/wVk72qOw5E2BSORvZkrqW5lO17PmGpY7gGuE1I7
         p+d5xEXFBOECbKXO2DdJGj/DOUzusrSRX06FPIeni9ZGut8SbFrHnoC2aBFSs3en4vbZ
         kA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623298; x=1793228098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tda7KCgHiHf7p60vP6BBaPr59gypHnjN4ebH49SPko=;
        b=JghVb1Rz2nY4Llu9TsVUrziKdRuhlMMFsD6dlRgvHGny0ujKHQ37+y4DT7L7u1QmOC
         jIwl89FhiUJLKkAUQkRT0ZBEm6fyki8D4lsBIYUHnk2gxQVAZBtLRTWKg1+2XsOU3VAh
         HtRaVkKGO2ZXggHug7EyipaXmPT42HPeDRNBmviQ0X1DdGErvL9Ej59OoWNhYmOwNpSX
         uPD0TzkF8sXO32iobiGJOceY4NwHcervpEwGtnqs8n6yrWD4wAs+tQR9pwmvbsKIcIW/
         BIiqoo+ogQUJtykHw2nsrpmh7mSJSBeo705diipGaFxaZE/01i3nXJaemEkVcw0CCN7T
         +C5A==
X-Forwarded-Encrypted: i=1; AKwUvBx0bfuERP0shkzysWWSn4YxSLT6Oo72EnFimWQpjjByUqWNLS9AXf2NeVDpgyfXGXTUzzU9dhBaaiVi4yI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZHF+DWNaCCBkWcY/mQxx7F2F+cnLfBun7S95Y2fIhxRH5OOSr
	2JIW7iOYYcClcZVeUZoB0DrYvoE9O4xzmLRaDAjVXtwe8qOkzZCbt8QC
X-Gm-Gg: AYBFou3H09U562l81RFhWYTZJnvsv7UufJVYJneEsqglW4Py+LFGYi8wT5Pi7cu0/59
	6gcUhGlBsmdyOl87fdZfE4w2b99BCV3rsvVL/iHH7ZrrmUsGV1KnEQSvj8ObeToHWAvFCoJ2FW9
	20/wUM9tXIBxlcwZNgeksh0rJya3qyhUo+1CGIub4wc9FII5RfWDPWWJ9bU5VeF1Jpf8Ojsp+vh
	8L2DdYtISEU78+Ao+k795B4wYXGzreySbF+vUe5ZVCj9ijKfkB1IUQTnlKUNWTwit0KlduY867t
	sqCJhR2FOxVyJ/GLZcYfVrHMWqdup+OeOhlm648/84awqXu7UOsIM1LSsIwTL09X5PuTIC0wus6
	mypQ/gPn4BcINsWdDwov1OvgI0qv1gmyCNkqjHrGkfVJHlxKC0VceS/XAB/e6ooZObJ6jGAyF/9
	1JV/vsp0xohBpFslWXgB7+DY5R1lgtzMLY342mal9yKMyeI4YE/5bITvMy39nhff1r8KOQmFbbv
	BN/3e4CCl0A5S0wOCoN1i+oGs+ykqLBFT51u4uCrvLRVpL7Ub0IzAoz07Nj86UeyaqYhXpU2zSA
	sWVFy5Nbq92HOSbkacSl1+FPqQRsz0Vjxc1FT9KKXaxNEmFHqSVWeckzhY87AECrmaWwHBx0OrN
	5X+Fs6FQDzR0=
X-Received: by 2002:a05:7300:d212:b0:328:7033:9b8c with SMTP id 5a478bee46e88-3674c43c208mr4277149eec.6.1792623297862;
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ee692656sm442943eec.28.2026.10.21.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:57 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 04:24:45 +0530
Message-ID: <20261021225450.628499-1-kapoorarnav43@gmail.com>
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

The driver ignores the return value of all the regmap accesses. If one
of them fails, e.g. because the memory mapped registers can't be
accessed, the driver just continues with an undefined state.

The most severe case is the read of the FIFO in
mx25_gcq_get_raw_value(): the destination variable is not initialized,
so a failed read leaks uninitialized stack memory to userspace.

Check the return value of all the register accesses and propagate the
errors to the caller. In the interrupt handler, where there is not much
that can be done about a failed access, just don't use the content of
the status register if it can't be read.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/adc/fsl-imx25-gcq.c | 82 ++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/fsl-imx25-gcq.c b/drivers/iio/adc/fsl-imx25-gcq.c
index dc310ed616a1..b6c1ed867177 100644
--- a/drivers/iio/adc/fsl-imx25-gcq.c
+++ b/drivers/iio/adc/fsl-imx25-gcq.c
@@ -83,7 +83,13 @@ static irqreturn_t mx25_gcq_irq(int irq, void *data)
 	struct mx25_gcq_priv *priv = data;
 	u32 stats;
 
-	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
+	/*
+	 * If the status can't be read we don't know whether the conversion
+	 * has finished. The interrupt is still acknowledged below, so just
+	 * skip the completion and let the reader time out.
+	 */
+	if (regmap_read(priv->regs, MX25_ADCQ_SR, &stats))
+		stats = 0;
 
 	if (stats & MX25_ADCQ_SR_EOQ) {
 		regmap_set_bits(priv->regs, MX25_ADCQ_MR,
@@ -109,15 +115,29 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 {
 	long time_left;
 	u32 data;
+	int ret;
 
 	/* Setup the configuration we want to use */
-	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
-		     MX25_ADCQ_ITEM(0, chan->channel));
+	ret = regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
+			   MX25_ADCQ_ITEM(0, chan->channel));
+	if (ret) {
+		dev_err(dev, "Failed to setup the queue item: %d\n", ret);
+		return ret;
+	}
 
-	regmap_clear_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ);
+	ret = regmap_clear_bits(priv->regs, MX25_ADCQ_MR,
+				MX25_ADCQ_MR_EOQ_IRQ);
+	if (ret) {
+		dev_err(dev, "Failed to clear the EoQ interrupt: %d\n", ret);
+		return ret;
+	}
 
 	/* Trigger queue for one run */
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
+	if (ret) {
+		dev_err(dev, "Failed to trigger the queue: %d\n", ret);
+		return ret;
+	}
 
 	time_left = wait_for_completion_interruptible_timeout(
 		&priv->completed, MX25_GCQ_TIMEOUT);
@@ -129,7 +149,11 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 		return -ETIMEDOUT;
 	}
 
-	regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	ret = regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
+	if (ret) {
+		dev_err(dev, "Failed to read the FIFO: %d\n", ret);
+		return ret;
+	}
 
 	*val = MX25_ADCQ_FIFO_DATA(data);
 
@@ -204,14 +228,18 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 	 * Setup all configurations registers with a default conversion
 	 * configuration for each input
 	 */
-	for (i = 0; i < MX25_NUM_CFGS; ++i)
-		regmap_write(priv->regs, MX25_ADCQ_CFG(i),
-			     MX25_ADCQ_CFG_YPLL_OFF |
-			     MX25_ADCQ_CFG_XNUR_OFF |
-			     MX25_ADCQ_CFG_XPUL_OFF |
-			     MX25_ADCQ_CFG_REFP_INT |
-			     MX25_ADCQ_CFG_IN(i) |
-			     MX25_ADCQ_CFG_REFN_NGND2);
+	for (i = 0; i < MX25_NUM_CFGS; ++i) {
+		ret = regmap_write(priv->regs, MX25_ADCQ_CFG(i),
+				   MX25_ADCQ_CFG_YPLL_OFF |
+				   MX25_ADCQ_CFG_XNUR_OFF |
+				   MX25_ADCQ_CFG_XPUL_OFF |
+				   MX25_ADCQ_CFG_REFP_INT |
+				   MX25_ADCQ_CFG_IN(i) |
+				   MX25_ADCQ_CFG_REFN_NGND2);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to write the configuration register\n");
+	}
 
 	device_for_each_child_node_scoped(dev, child) {
 		u32 reg;
@@ -265,16 +293,26 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 			return dev_err_probe(dev, -EINVAL,
 					     "Invalid fsl,adc-refn property value\n");
 
-		regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
-				   MX25_ADCQ_CFG_REFP_MASK |
-				   MX25_ADCQ_CFG_REFN_MASK,
-				   refp | refn);
+		ret = regmap_update_bits(priv->regs, MX25_ADCQ_CFG(reg),
+					 MX25_ADCQ_CFG_REFP_MASK |
+					 MX25_ADCQ_CFG_REFN_MASK,
+					 refp | refn);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to update the configuration register\n");
 	}
-	regmap_set_bits(priv->regs, MX25_ADCQ_CR,
-			MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
 
-	regmap_write(priv->regs, MX25_ADCQ_CR,
-		     MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	ret = regmap_set_bits(priv->regs, MX25_ADCQ_CR,
+			      MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to reset the conversion queue\n");
+
+	ret = regmap_write(priv->regs, MX25_ADCQ_CR,
+			    MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to configure the conversion queue\n");
 
 	return 0;
 }
