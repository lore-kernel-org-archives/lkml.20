Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464283;
	b=zi99gZXOIWwfbOJ5nJI0FKpVkFzmyccuIHmFnHb4nwZ010nA7XtbtLPhYkCofKtGzGRa
	 x+jz47tMCEBYbw5K9hN6pdg4HIv7gSjtQInemkEndkQ7jAwTTGgqEu/6UGzi70vkUJlYu
	 RFZvJXB574bH30xMBeK+F0zhwVsS//YIXew7prP8zBMaOzUweOEHqlMA2FDEi2IXyGRLR
	 DBU1K8KSLx7YktXZpoI4uBSGLGc7fAM5uWSrSjZ3206x1g2Gvrb/suaCig20yL/Vv4AKI
	 pN5rXt2MCAgROkx0Yw42G93W45tNYJ7mucRvY/PzQUJMuR51l+/1WSAfphbivoQ5e2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
	b=VmvexXsA7RiciG1wfhiVghdFRDKl6pN/Qx2Irx8y4bR6Ceysz1u7qA0IzWF1gFuJNczM
	 TulUJLNyrkH31OhsErM+sGPkEHSPV++8DRG+Acj62G6IojysBGmas9iO7aEqeTfifGHYw
	 rBXn4MN9xu/1c+ODoDod+qQPixGcmMJKIEyeLcrF9IzceG630l1kQ2Zt4u4THLK4AM/e7
	 DB6LvFDdLpBJGyJc6asxjE+yGpZrBvHRYGwKAm8ML5Pu1lvHxBVyVMafPj0Xx3Ayuz2uv
	 msbMiYtDGm8zMIqInl49loFv6Cz65RW8WqT5dhv5it+BG7LEAEDaEDxGMa/A04u5gRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgxBSEn+;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED493606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED493606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgxBSEn+
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93efc0452b5so258012485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464282; x=1795069082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=GgxBSEn+ymk8FG3t1UIOsEzlPQe2arILnD6M6OneIhXSGijWFLs1utXziSnRJo9jAK
         nbZpMZZPJN5g/VMqAmXS3+DpZW1wKoFDXwWTy3Vhw/YCpd9HIW+vJdkQBSJ2/nXFXHcU
         z7qxdVw/zDsEvPiEPJTw2FC8hOw57hHcwngNWw5iNX+ABxEoPCZHIOTNvPeq4cekCxyK
         3Co2geCLM9MRkeX1aw4XD3DrSpY5hsrVUdslqQSdeimEN425Dczp0vcD7q+OjJGZbu3+
         4ZO55ehFI53PiEg+GSOIQ49CBGI7hDhsV7SISzzhSK7coLURGqAfVsRGitvhEYtvUJUK
         TIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464282; x=1795069082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=cw/XDP4IuXgYllbYvwad7lSqoxJBUrWphRAiqY0CygYmFgIBXUFrKKjEWn61+z7b4S
         gDo3hWvKWMkpv8l5lkzvKlFbBpkRQUGdX0fhqAzd/8t4fvU1+YC/zvYG+Q5JIV5FI0Y8
         2uEWtjtpLnbJh/TXd6rRMO1zNDr4KM/anUzLgfF/hCUBkNZFkZZ76/DAXRXYxW4ZsrM6
         xcuP7Ii6R3t0JwJRDoX4Jr501scOaWNTfRCzHphMcdGiW41RAP64bN9ZK0VoL4j7NW2v
         s51C9VBiaeixZe/61EJVPnJwBe5IjqLDwNq/Hz+VfoZgLLeFjvNbgce22ndnnTcGmW99
         AxFg==
X-Forwarded-Encrypted: i=1; AL+hErHgSsdeVAdZNlelxtFyCuJe5tL8Gp4f0iAGDlA3PnnSSvhKLuJcsDI2atIOXrTUaYnMHHkRInKZRfpQGZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BRaI/D+NEN7jFS5OVX10bxDMRPoWoBWLuJr+IOhNGKrS+sDLA
	p12k2OmfHV+pOnhsZ8OpkxSD4a16CesbdIv0hed+Ou3P0aXUIlDmwkU=
X-Gm-Gg: AYBFou3jZj9kDaSp2lAU8yqGSxGFaid8z95jolAdSuGYYCdgGKqkBEalUjX2Q7yo0I7
	w8LBUloE4ABa5h5v+FtplVYoh0utqZ4yhaJzQOHiMMzEIz2EnwuZbV2Cc0zO446mAChty67gK8S
	Qg/DK66byizSVrutA3Jc/+7fVSUlXCBQD3jhLcyYLZ28N0Kxz9ZgZ6GqJW3QjJgurulvpGWF+ak
	8KtY2Yensk+FI0vPhGxspq1spZdT3nT2B1j8Hn9xPDQyt6Gi9ouDc4YLaSIxdz6T4Or5t0BQYlB
	UPDDHDsPR0s60I4Ho2d3ikrLbpHgSl4iRlTcBKVUs14nf+EnqO4WRm1kUQJzazwqpD78fWZmA4O
	PTTQKAdrTynER9wqCvzQCK50mOqUZ60vU1WCwQ4E2mKgGO4wQWAunPHIWJLUDqc4DkctbNHRK7F
	W6uioThKVVOt7D0XuGPOCCNwgEhbjoVuC2OHKeD2Q9POLZ0dUPFDZPeeaSwv1EcdiEOJN4yj8pP
	51tS5SpWxkoJALoO9W4LTYUnd28SCN/h9cltaltEBve6dVD4ZJ66tMubmHYxnXXrEL50DSX6tJz
	rokWumBPnvDnj/DhHTD+ec9CMj2dcbvSBFZqx50951vdiKAkhDCBULAS4fGO1foqbQbwcLPEPQ5
	Wvv2IKaeFbFnrIhXavQU5GXeRVzJ/o/jj/XEcrylXpUMTm3IIIIeyinbV9kWa19Qb7grLDd5WGP
	tfki7BCy83r1/iUwngokaAfj0Tgn3NHZyeLjuye1EEl5YZHDhQcQe2UA==
X-Received: by 2002:a05:620a:2628:b0:93f:565f:e46 with SMTP id af79cd13be357-947afff4ee6mr743160185a.52.1794464281908;
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
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
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:48 -0500
Message-ID: <20261112011708-afe-v2-4-mhun512@gmail.com>
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
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal. The
remove callback also suspends the AFE, which disables its clocks, while
the IRQ is still requested.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and the regmap's managed lifetime encloses the IRQ. Release the
IRQ at the start of removal, before the AFE is suspended, using the IRQ
number saved at probe.

Found by a static analysis tool under development.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-common.h b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
index f93f439e2bd9..905f29673d3e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-common.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
@@ -123,6 +123,7 @@ struct mtkaif_param {
 struct clk;
 
 struct mt8195_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 13e5bc02fac5..0cf39f66992e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3133,11 +3133,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3192,6 +3188,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
@@ -3223,6 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	devm_free_irq(&pdev->dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
 }
-- 
2.43.0

