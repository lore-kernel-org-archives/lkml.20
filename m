Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170583438B5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122051; cv=none; b=syN6AA5BsVFwK3edMfaWpNA2xAMWMxcefhzChTR1DnfgJJs9iJnzjyPvMbql4ArQeomiikm6UoZ4kTfMpEZKuZ6N57HfedpuvQ1brbwZS/ywrtqGrPdVyjoCoFOMqCxWXmv+uOUkqdkunakjk0cRM9m1xsApJYNmD7f8JpvnM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122051; c=relaxed/simple;
	bh=VqMWfuWL6abzNfrkThQl5y1V57dHrZF9qtIRjP/vSUw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sWFpF+gFMBVgXhKd8QqQdbdiqmkgWXcq6CDdq98fkzD27E/thEIgzqEpY7kmUM9L3eTtdksbbQ5VmbFrg1U7s8yHYGqJY+XA9+ENxhCb72LprDBmzV+8S8AJj2BDcWnTpJFquFh9iGoE8fsoLG8QhqvJ5dNa2ja/SJSukb1ABHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCF1Cvn/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCF1Cvn/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917b78dfe30so94205276d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122049; x=1792726849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=bCF1Cvn/5bNm56SDsGzH06qM3UgTgHt+mvOm2nu5pSgdUZfmE8FzAFznPyG6qzcoZz
         IH9pJul2bpsWV453n78sFZn/B5Y+Qh1WvAXgSnqXoWakV+T3aEaxRGJPIQ8QJc2X0j6b
         OTs0DXIc7a2mARgT3gGwbG6ux/Kby5Rc5QjRITBdR9wGyv9MFjBSor+72/VXVWlFaUmT
         EZiZClnTdnIVUrefS/fMoP9EFkcwXL7SFKsfMCrLf+fRWQ+qeUhVtvwECpSlExdRAMfj
         HSFvv9RdE1iXVXid67I8yBceFP4xotni8WcVkwdlZCNwUxPaji9vAlixiC176dq0TppQ
         lZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122049; x=1792726849;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=HqdaE1gQCJpdEuds6AD8IwTKQn7dk2Mw4ChNZsOx6NT23G1XDQl7OOux3Hre+kMlmY
         tYqB6aYk8I8+fboz/wFCNJE2OKkzE3Y0cO3XNbnCiQiDEwW2rHPm2/QzD78AWPEO6es5
         lx/g3TNw+YWD0ESmauw92SBh4UwFj1PXH2hDECWfuC+FD9hPpP9Ee7bykLCF+H/GUcPe
         kp6G8E/5bE0h07Xp7nbId51zSZilpG0d3ccbkeXTEphcI/CcbzjJQxTqZNR2Q+S2TRRI
         854tzMZ1oFSSIsMg3BFtJKRF6aiyGaY1/EqlqMRIc0rrL6VmYzGgK00kCorBqpVg3IjL
         ZfwA==
X-Forwarded-Encrypted: i=1; AKwUvBzx8ScwVPIpeCs5L0ADpFgjSmdk/5koNQ9P5UeNJ2S+sWRXPvqGCTDfYKAigR9vxeuOb8CsQGSppBPIboE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkFouSxBQIsFXcu3A6fK8Y9jz8R/8agpXpgpyh1BY4Tr5y8ZBa
	8+lCCpBXt8dc0huJ//7azvfTHXAcyd5P4avSCBM6CSgjTcXfkvgi6hI=
X-Gm-Gg: AYBFou2tuzfqgg9jBD9Kr1oLYPtYBkbtzLpiawKtpauLXiDQoxvCMKpPB3XmR2AVFZP
	xkujS6pqyFbEO6GS6drsvyDxe5WPzMPYcNO0+05DiM8HLdawxZ4H7EKNNXWLNZ7ExRk8bvKd7ff
	i5UDfumwmccmUULsiGIcu6QKBXHpYeybDsbWAM1lQ9E4D757OL5RHoTO2ii9tDg94K12lse3Skb
	ujEYGxMW4QTNIc430Fj2VxmP5P21gDHCYFzkien+wlqTl8/1MIJCVSfpNmq56/hZHn4bsfZBXQA
	tOPdDsE9/3DSJ6TEIYg5RNOL7Vk2Lm9Uuqy9Qebld99AYYawuXvVvf9xgBWY51d7IBOaYysrwLL
	x5+A9fZ+Yd0kkxYb0tD8ylHQG9IjyIN178LsxdQXYLFWGiHgoZREHR5XIMam5DDA9NTd9yibzsp
	WFxaMaDNQ51Sh6ZZrUxFCz6P4DHLhP/5wH7vL2KWN43w4o48CV9ZJBxiVnV8FkZ8hu8mMEcW2qP
	ZexFEndMcbRkbziEaij7r6KJ9W+jZ9sZH3K1xSf7U/cjO3UStC/DsVScn/qD645DDxmXF8yVgM6
	8EV6cFyQ2dbVacjI8qP6TfUHi+7l
X-Received: by 2002:a05:622a:558c:b0:535:232f:ca21 with SMTP id d75a77b69052e-5359f486ebemr346542441cf.11.1792122048786;
        Thu, 15 Oct 2026 20:40:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9dbdb5sm11198881cf.22.2026.10.15.20.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:40:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt2701: join the IRQ before managed cleanup
Date: Thu, 15 Oct 2026 23:40:45 -0400
Message-ID: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ is published before the handler's arrays, regmap and clock state
are ready. Remove drops the PM reference before managed IRQ release, so
a handler may also overlap clock shutdown or subsequent resource
cleanup.

Initialize the dependencies and acquire the PM reference before
requesting the IRQ. Register a PM cleanup action before the IRQ
resource, and a final IRQ-disable action after component registration.
Reverse release then joins the IRQ, removes the components, frees the
IRQ and drops PM before releasing the backing arrays.

Disable and join the IRQ explicitly when component registration fails.
Use pm_runtime_resume_and_get() so a failed resume does not retain a new
usage reference. If manual clock resume succeeded while runtime PM
stayed disabled, unwind those clocks if the later PM get fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
The final devres action disables the IRQ rather than looking up and
freeing another managed resource during devres release. Independent
PCM/card lifetime and system-suspend clock ordering are outside this
change.

Compiled with Clang 22.1.2 and W=1 in the accompanying validation
bundle. The prior G154 diff received independent source review. The
revised manual-resume failure cleanup received coordinator
counterexample review. No runtime reproducer, hardware test or
full-kernel link was performed.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  1 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 65 ++++++++++++-------
 2 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index c9477bc24ee9..c7ffae5b6fb0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -89,6 +89,7 @@ struct mt2701_soc_variants {
 };
 
 struct mt2701_afe_private {
+	int irq_id;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
 	struct clk *hadds2pll_ck;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..ef051157a0c7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1591,12 +1591,31 @@ static int mt2701_afe_runtime_resume(struct device *dev)
 	return mt2701_afe_enable_clock(afe);
 }
 
+static void mt2701_afe_pm_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
+}
+
+static void mt2701_afe_irq_disable(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+
+	disable_irq(afe_priv->irq_id);
+}
+
 static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	const struct mt2701_soc_variants *soc;
 	struct mtk_base_afe *afe;
 	struct mt2701_afe_private *afe_priv;
 	struct device *dev;
+	bool manual_resume = false;
 	int i, irq_id, ret;
 
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
@@ -1619,13 +1638,7 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq_byname(pdev, "asys");
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
-		return ret;
-	}
+	afe_priv->irq_id = irq_id;
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
@@ -1687,14 +1700,27 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
+		manual_resume = true;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_pm_disable;
+
+	/* Keep the AFE powered until the components and IRQ are released. */
+	ret = devm_add_action_or_reset(dev, mt2701_afe_pm_disable, dev);
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1703,27 +1729,23 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
-	return 0;
+	/* Drain the IRQ before releasing the managed components. */
+	return devm_add_action_or_reset(dev, mt2701_afe_irq_disable, afe);
 
-err_platform:
-	pm_runtime_put_sync(dev);
+err_irq_disable:
+	disable_irq(irq_id);
+	return ret;
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (manual_resume)
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
-static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt2701_afe_runtime_suspend(&pdev->dev);
-}
-
 static const struct mt2701_soc_variants mt2701_soc_v1 = {
 	.i2s_num = 4,
 };
@@ -1752,7 +1774,6 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt2701_afe_pm_ops),
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);
