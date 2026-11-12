Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464281;
	b=YO1UF4rmdJa8S+Zb5Q9aw+vJZ1BFnyXvm6oG2sZ/wNMVXm1vGoMSHrlyCbNIcHEo2Q6y
	 mF7G/rhWcvA6dddzL0/su2I8x17ToMLsunBQuIZ5G2BuolnZ+usDI2LytvidVK3cIRq4q
	 rLt4Ij2SS4VGjvIKF1O3Uz1Ev36cwMcg8NUmawU/WDiCA5XZWgM0zcJZf6k8MScLLc4GV
	 RfzrE/agQo2Eu+EPg2RHDjfEOQVGLJadhnU2LwlMCD8dqNJto5ErYJTFA6zh5ZoDcwlPb
	 a86polFpcvh+WuYrSEK9oNYtGl7QocI6C3Eiws/+ynOqv/v0Y0gGXxc7vnsEcSWBvIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
	b=ULp0dVRYYEHL74onnmxYYOI65Y4aJ31IyIbK6qIFBaCMQMLgN1BjmwA/R4Tje8Stmlbb
	 xaplTNyuJbV8bQL9V0p/qeg6zvdzyQja/pDVyMLwhC3Tx3PtYEYAsILncEmXLvqAVPlkl
	 0smvbDl2fZ3Iw5rbGOdRoLjm4zMPNTJ49nitJVKt6Oc+0kaj4Yz5wIy7ZSRXjvihSUaoj
	 WitqWrXtaia95+kZl0cVL2c/xx9h7zTaEL9SJKC9qUkrPITPFJ+A3MdxjwlTT+uOsJug6
	 d41DfoLbZKjTBpfF6AhSB7+j4cu6qOeUDUtBykvVEPJeWs9G8zC+eoyT4Qe3ZAjYRBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7OOxY+s;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12692606A893
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12692606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7OOxY+s
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f079a63b8so392025585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464280; x=1795069080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=L7OOxY+sFOjf7cymUt0HdN878ELXC9JzosSppolIDnn6nFPalngyWd8PZjEzc2HY1Y
         0EVwN1EJYREGXCnjqsiONDJoiv3pr+4YQjHMJZJS4BWDasEorAaSeJp/I51NKriVt5HH
         jBq8Gyj2SF6uKH9Kpdprz8nx1mUFHuAkXl1kRXUp9GnryUV+mQ+zA1bnZP+Pl2hCNW7z
         5fX0CczGSQE1xFgc6VF2J3L+bzZz735/i6ktbZw2WzyZOCD+zTJtNbAYUvDB8VlAdaav
         wGAVy0e+qSnf2UENd64fZYL87Hu7CQ6YCxlJfhkxpb8Ju80n2vWsckwGTgHpFd103QLP
         LlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464280; x=1795069080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=26fxXzjc5/lfvnsaeE5wrgZKumb/x7T5aGNWqe573HpxpmKdZdK5SYWuXsZ0yTL4s+
         um2QdDS4d5BZHiooS4fomzPhnjHF4o37NfLdJjW6DkJGwdJd7eGJuNS+VQAbAIqgRHfg
         IVoCZvIcbO7CB+/KXcQriZXWl7LM6JVS5I0h1rH3Bhzn461JxsqUInzf5DNWBtQHMUhq
         atDp3IDL4vQ81Q4UvbTibd4549gfR3u+8tgT0KMmxNVIS5sFdkAnhT3emEZexipYYHJm
         TjuaeZzISknodBbatYrOUW+jW1fMtD/cpNBL+m3ESPxAAHqw8GRwv4IVHo7W33E6B4Co
         xOpg==
X-Forwarded-Encrypted: i=1; AL+hErH1PmsRo6Za+HAHrAqeGirSjgNGxxMeP6UiyNO8zQpZxUtpsEi0o8hGwU9Y68fPke8ikeHJtwCVE/dQKlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lxDoGs2a4ih8A1lzJy0+HR/VXMQQTgc6ATizgpFcIHGpaZ13K
	zeoVAYiOgwctq9+DR1unLmzfm9RwMUvFqwkX+fE+kTUnv5hxqsYXZCI=
X-Gm-Gg: AYBFou3u0sR7XEvVGlMe5RlZEatVetSK3mYD7PaadLTs2RBxIHIjUqrdkg+Y8ENXZTm
	TXdM3t5mvvcQ6/VGC6QZaTM7eKPrdCy6tdTy34EouOjANLnZBuLMoFZHOWEjzOOiAxOxFcOQyWX
	s22eJ/OQ2UvGLPR2nh41Ljh57TvMSA0XLxMnv75IHLBIgWj1U6GZeNKfQmaizvgmqzey29nFeAQ
	Ht+HtZnijxAB+p1EMdai9WuzfnvIbfg4C2zY7xPEpGMYfiM6UA8yalKQ7WNl/cIUImNv5io29qb
	GP7CFk2fGEhytH6fXRlDC15inBUQxLUs82Eh6lYf6Nf0KyvXU39XEa5V5n2wkYspXUy5lvVtddM
	5XBW5OgUHm85L1bR9b7NKONbnHXOM8kiuBDABBWimIuNGjsgYibPp4W3t+c+WnAovLJTmb1UDR8
	hYU20FmhEZ1PQTSMC3HR6GW7sLjYtaM+DLS6GRjpVYkEaCRss3qj7pZ11LlJblZaxZ4hTrTJ/Sk
	AG+7HTTNa2UdSmrfor7+9OKzEDsOK5toRbXsOGaJiZ+DoD+cRaNBSyxn2NMi0eRPoVpbpyl3S8J
	X7XLg6QxfVQmfyWqakdkrlz49wd3o7guh1WbYWbu/Klxrs7UxoeY6+NZHQTmg+71jEbHlhIQf7n
	1CwkJuvD/aBbxmyn2QgdegzVazjF3k6GmJptfD8lE1Iu846IE49mjhszUe77BzTmhrGASUvdV7P
	wqTRM31wrNjQIdmSGP9i2WZcNZF+/5fgBx
X-Received: by 2002:a05:620a:4726:b0:93f:365b:42bc with SMTP id af79cd13be357-947affc152fmr801189585a.52.1794464280101;
        Wed, 11 Nov 2026 22:18:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:59 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:47 -0500
Message-ID: <20261112011708-afe-v2-3-mhun512@gmail.com>
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before freeing the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

Found by a static analysis tool under development.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

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
index f69ea22cfabb..dc462dd4235c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2403,12 +2403,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2463,6 +2458,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2490,8 +2491,11 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 
-- 
2.43.0

