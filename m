Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464277;
	b=s7JrSHKVKCjIOLSsNLV/XkIX49Y/seQFkw/LgGb3NVjJguryxrg0zACP77euKGkcluBW
	 ejWOp1xGV4HnZqm4V1JdmLxnYZ5yvAgrpvr/uN47EwjQHXyGgwFfQr9A/5sNZEGJ5RQB0
	 K7u90GTW9Nl+jvicrkTuYGfw8WQkcSNQXrKey+69QWoSKsAMmTxFO2ggTGBU/fnmEmb/A
	 4ZPRlyMF4eBu/P08Pj9ySbOAiP11s4DbpRwUSGk/+LZX8IjKIdFpO+OTIWMlASpRXt+Nz
	 VmEa7uOIIx3QPzLUg8xi4Zz87dfDZit1/ACm4Vn95szJJkJS7m0LLhsRHUSmWpwMvQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
	b=o+KEI+0rLx6zhIvTWYN9L8Mfeo8RJazVvHTu2CBzJOvz/kJVE3OCC6w79e9vH+sKsN5a
	 JxGyZFzL2nPWZxeEdQQtY0y+xK0Z2dsfQ5KcWIum0/rxuayzmdEDKeBrVn69WtxoZmrkW
	 rSNKNBIjJR85WISxQguA+5HmTudXNeSPQ+p6imZxOQ6m42wNmc1snzX13ehirNHMWwvH8
	 HvjGoRXXwsdjVHQnN6BzAAeFO2PK5lf7jPB5xxRZ7yyETAJ/o2T7U681EC/ShL+zP3YVd
	 kJLO9aPqyZxK9EgzHXOILwkIF28kniYIOArjv62KDLAN2C6iu3AkKXfDVF0/SKTr2UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cO0veR64;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF742606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF742606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cO0veR64
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54f873cbe2aso39209071cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464276; x=1795069076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=cO0veR64wh3RXauNWjwKa7fzTr9/qqpVG/8VpH79HJ4cyBdP6wasdoLllhUjX36pvj
         d9PFF9/2usELAomvBGKLGvsYo0a0MYtm6PyIdvvTFllhPlbSGcb1eP12w4h6doX2KInc
         UTBMxBi18LjyWxtziPVlOdpRUmA60WzFkiUGIaOiMGd/iLm5NuxF9bGKoE5+Oos65SHI
         GmnJLhKauMhkI8KLusXNySgY/GFoKmGwbsyYoN8yO3Bjhc36zbXlaK0MXHlcxk1+p29n
         Dg5kBrn8g2Wt88+QWpmxrnKompWXFBwcEtdjovJq9IoI3tlwAsVRPUaOjw1jniPEjB7o
         czJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464276; x=1795069076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=Vtjn8ZGaGwrWPLi2Pu4vno2ZynSJUd2Z0Zw/ZGrD8puMjnmFtzInTc5mkaUeI+yW2y
         AqXnh6/vayxuk+7qMEUQs6ke2fZOCU+MuwOaqzAhXdCBOwSny+MhOMu3dUW4C8uM2zoy
         wkBgPrQSqJ/yjFDWkMjijFYoYbJjmKQGtuwb8eSMaMuKhh8EE/2OXImLGKd4zuz1eSAr
         e1OvqFH/6bhdkYlq6epualAHw2Ru1R4DhENAB8wjtMFF+32HusKPUyBXFGbn1MOPZXAJ
         Nba+dcNJRrz4MuzSZfqo8p0uwuiQJwqbxKdxmlWgXXbeNvmG4fo1LQWVYy6n/tXt7VBj
         CL+w==
X-Forwarded-Encrypted: i=1; AL+hErEDAvH5JJQZF1/89jD9gpOpOWhGecmOYXxqaW/8lqHromKLQEyLCFallHZXSLbgka+wsxi4C3kPV4A5A+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BQW7zcwz6pOs6x/dC72xgWXhB4677lnmZQJi++cDt+xvE0L8G
	F2n5GkWdINWk96ulflRZCIP9g1xDcGKtUeLIIGF5JikmAs7wyeMkhs4=
X-Gm-Gg: AYBFou3j5lkQZrBbSXaIQEY5a1rTGch3OfQMYPusVDKCpPrLfXRRuEf9/OgHXMihZ+2
	CtMI1FOuddvrx3+i18JldLm27zh2+D8vWaB+1d99UetiV2D21krFMRLuzk4CipEtYuxnhB13Ia6
	dGDvMAFiGNCBmI4gQwaSsmNPrO+dgY4c+fyss/wYxLGqUTsQvx0IyIa9JGfWRhRgPrqsZGJFoKc
	9Yc1DsgEI2JNfrw5gHsz4fUrhYJff/M/9EE4P7gKywwfJ6MFBKOSbSk4GBHPzu9JrBxudtujS6k
	T7aI4xmCocb+qwwgW/ljM+LRMfUgbBQNxHA4wD3JUHCRLEl6HVhBAe1IuSX0cxwCP+uzUenOAyt
	UiPY2d8uWpad7Jg2c/G48UxV3kkuodkjUotKPV3n12v3ofdzeJMYU/Sl2FThWSMycDbJUtm6vb5
	MU/HgLOqi8AfCJ6eYU1galQidr7+HkxgUrMJg790hcd2UQ4boHDstBf6ozR1l1yNPMgc+t/+8FX
	eBFo1UBYf9Om+33nB4nMkzSe8MW8/Wt1mnInF51cRqzKfe+8GPenkk+5Ep4gJ49R9396fdqJWcN
	B8drUOwgaasZlJNfNghvSiUmM9gx1jVy6+QUyAo/gUt5BhA/T0AUMtTAa3HD6nnLcmsRv6y2AnN
	qbsa7ZQSdKNIUXaTzbhlsjamYrsHzkkAgA4jM5pmtYNjrDOjnfMn2VkckCnVaFkcd2a2tbLRPLs
	CvG2iQAQ7HELfoKEsRMuDr4S857IJClhDI
X-Received: by 2002:a05:620a:440d:b0:93f:5f83:2ca7 with SMTP id af79cd13be357-947affbcac7mr807733085a.52.1794464275757;
        Wed, 11 Nov 2026 22:17:55 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:54 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2 1/5] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:45 -0500
Message-ID: <20261112011708-afe-v2-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the audiosys reset and before the regmap is initialized. Apart
from allowing an interrupt left pending by the firmware or a previous
kernel to dereference a NULL regmap, the reverse devres order releases
the regmap before the IRQ on probe failure and removal. The IRQ wake
setting enabled at probe is also never undone.

Request the IRQ after the reset, the regmap and the handler's other
inputs have been initialized, and keep the existing runtime PM error
cleanup for a failed request. Balance the IRQ wake setting on the
remaining probe error paths and in a new remove callback, which also
releases the IRQ before devres tears down the component and the regmap.
Save the IRQ number in the private state for that.

Found by a static analysis tool under development.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index d59258520995..d03e59ca7d65 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -139,6 +139,7 @@ struct mtk_base_irq_data;
 struct clk;
 
 struct mt8186_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 2f50f78a6f8c..134ff3947bff 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2885,16 +2885,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return ret;
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2947,6 +2938,18 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_disable;
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,13 +2958,13 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret)
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2970,6 +2973,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2977,6 +2984,16 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int irq_id = afe_priv->irq_id;
+
+	disable_irq_wake(irq_id);
+	devm_free_irq(&pdev->dev, irq_id, afe);
+}
+
 static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8186-sound", },
 	{},
@@ -2995,6 +3012,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);
-- 
2.43.0

