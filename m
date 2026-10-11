Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54F468C05
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757369; cv=none; b=OL6Cukzy2789tmVlJmjQB9Ixo/9f027GYxGtridKmI+9cn0F2+vZ14Edtxk5RxNNRJz3BADTo0fmnQBfGPVkqg+RN3GpSrjxOEmAr3WpOH5I3sPCltQpbNfgrs/Jk41O09J1Zl8lo5X5am/G66fEQ0gublunhikKjBRIDbD/AWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757369; c=relaxed/simple;
	bh=RG0ruB2Fr2QCjhkNtAakmW1uuzOyNENgm2wDhj0WsH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ke1UHogW/LCwloLGZXwVrzSz2J3cm8aabZ5Cd3yql4NCLLfzH4oNWtuybTwaW9V/yGXbyApz+JjptZAHqvcj8MW5YjCdYjwqOOUeI/YbmGuAZx+3DhkTUfHQXOZjfIBmVGqWmefdCVJCBhv3ElHlm8VWEw5YuamQIFMUoGGSEJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/sQKPmd; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/sQKPmd"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53396adbc53so18081011cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757367; x=1792362167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXZ1UsR/jsdDknoGUcyYR4VW8gmQlVsH7nZcsEdE/Yo=;
        b=f/sQKPmdSPq47rK15as08IK/bzLvPWBcyLnGOmEjpwWSLtLBis0T6/rMD3OU6VagV0
         mKiLGYZsZ/7VC0kF71fhsyoo5a+ituy1AfZASqz6gnjR26rYIsK3uZU1rSPmRVRa0dfM
         2lHj20UN3+Gq8GaQYjKzWdeV/PKiPCmR466307tWmzbNPrkOpJHk+tlLoXDnAXi9fHon
         xvZvwhLu3YqyCkOqebbX9Q3GfGha08Orc1MDlK/m4w6fZvPKX2AQpAT2+DwtCJI86thd
         FLsLj3Fk1osM+7xg3PnNZe17eSXkm0dpxclF4OVfJWDhwoZL+19e3No4bVUxaV4CT99r
         4MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757367; x=1792362167;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXZ1UsR/jsdDknoGUcyYR4VW8gmQlVsH7nZcsEdE/Yo=;
        b=GTJ0Ta7yHJPzfhQGJ5Nl6xV585CRbV+XhHC0uF1DI5oIFdS7JZl1nup/9O7SK4iH9g
         2AC6232xEDpwVRe2v+TqiCS53dvHGnLdsbtO6kKvkb8RRjRxHywDWT6X9tHkjk7JS5Ko
         LNe+vRjpyW1ckrxKOiqpcl/hd1FmAJ8NBIV3OtBpjTfkHvRNoqcvE8HVwEMUQlnKMWW4
         eVeUVS7L00ARu/ivXYM8EnCrekAxQK4HdWFfhwfaFb3cU6hXHb4Ucc4xBMRC54p2gYc9
         YHuDj/HR2zytvT+KkEodRVBwuT28Nat/8c0OJaREmuogR5SDMZAMPUv09VlEIALKsSI3
         YuvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnD+LRa2YQ+V7hQ2vUW4Z5gqgojmcbqR+nfTcSZLCI43JssKTCbgG9w8Tl1O19IQIahOOWu63xCznJG80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmuLpXjpNwReO6Tjpo7oNdieD+CmojuOD02VH1sNVrYXj/CDYk
	Qk87LDa5K5fva7gxkI74WIaLGym9IoNJReLWzalsNXExxc4TCvrF3DY=
X-Gm-Gg: AYBFou2nbl2XXRP2FBF8nnlhNLC+j5nX/5N5NnMBSNDxZuvkBCKkxncZN6fW/gpiHod
	DPlHNXgUB3xoHK9PU5cGhIdY4HMKYZPCdNs7vMSLOnSKOyLWXrhUizJC3dkyCobk5KihMKQ/jwq
	PwvYu8yzAeWydNJwT6OAD9OUQLQVnKS4+DngKidf2lu3IHcyyJVXg0+I0c7k95LxXISwfcf+mvA
	XH8a1paLKoPxHX/LRGKLOqH9POT4u8pmDCm4C4K8fNfbfrOcPmM0RisAcEL10xOKvs1kf6GfWXM
	tPbZN/aIrIfnr7NNGPPnFzTKv6ZMMXHuzXm54uQy6uWvJf97QZ85WR1z4G0I0zMhbPbmVRttt9j
	zAmaFsUOCiMPGIf63ByXki9PMPFoVjjkWXb8LTMIDtqgCKZaL0hNi9O07ZuTNxf2F9gkc6NJHNr
	OkttsY4hcD4ZhotUl3hIVxuSobcaFE6HDeBv4+Jy9cJ2n4Jk5KoFA1VAZkos2o7sTxnqMuWeuif
	aNY74yWp8HX2lgZyGfJH/neTGfDcHMOQs3Ppr4hKXJRTeMVLHvqKgo8JI+m0kRuUNlDf6LE36+K
	VXGNkjHENOkrI3Eil4SlaVAe/o8EROE87T/P324=
X-Received: by 2002:a05:622a:260b:b0:533:32f3:1db9 with SMTP id d75a77b69052e-5359f46f5ccmr130647001cf.11.1791757367164;
        Sun, 11 Oct 2026 15:22:47 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:34 -0400
Message-ID: <20261011222234.2098904-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before joining the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

This issue was found by static analysis.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..ce5d586721db 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -186,6 +186,7 @@ struct clk;
 struct mtk_base_afe;
 
 struct mt8196_afe_private {
+	int irq_id;
 	struct clk **clk;
 	/* dai */
 	void *dai_priv[MT8196_DAI_NUM];
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..39d9103bd5e7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2393,12 +2393,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return dev_err_probe(dev, irq_id, "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2453,6 +2448,14 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_put;
+	}
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2482,8 +2485,11 @@ err_pm_put:
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 
