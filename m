Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884038;
	b=qink+sDqTaIekRyUb8U8/14dzUNFVPymdRBCYGw4Q+RCWdVyXZwsWBvzfxmeU8Ont4FB
	 +Ex0qQ2A+GmaFW5A3ZLnMcn2JkwyUwv7I7Sei+Wc5EHbUoBzjPQoo25pHYdWqr46+hY9n
	 sl9oK9xj70AZpHNZdIRZ7+OBhZiFch7sbQE4mdl5eguaHYlzW1uwv9f5svu+ha4Ar/3eq
	 kq8D9EYAefdZlj+E9/yMv69tyUqxUxzITKHdCArkVWU1mN3zuVpryDyQALTG7DAvovKqw
	 /5fc4c5VMEmNxpmMTHIg4rELpFIpPLNP7yYhwBireY7zNuMJ1H1YxFZXgSqt+qPMcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
	b=VVir260OP1GsH+t+E+1k9loMz8AV6ZG0iYOGDL4kXrV3F20eQhLs5e24TYwsSb0Kq1ua
	 EQIIK2yImtQ5zzGsECS5cisjGd+lxt1LAsvlztCsmozTCoSFWlOK0+ZDrBWLBMNe1FYEp
	 VTWWBvosIiaCyEcNDFvC55BcHOqcNqQcvwtFgP6vqk7d8F+ij/7iaWpA3Uz2IQYOXCg22
	 KxGcUJqTw6avx1dhEDtNs7vrLHqASeEpY64GungTt1uMvcKTfWYDPkuG61ux5merndsNM
	 34hhHeTxE515Hyhm64tSKGKxi4Bo1QQgwYE2gdJaHBHUwRXmVWDdfw/FYZtUK6VGtPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXhnx6PK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80199606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80199606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXhnx6PK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38133db970bso743908eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884038; x=1795488838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
        b=FXhnx6PKZido9GbsyRF5sc508uIYTPPtevEuYVxNTnCjvGl0/ORmRGiknL9j55fiFv
         yc7Pmdj81ViA2Bijt8Onc19iZeDPScQEqxBSp8x0IV+CQdYwnH+BQTz5k9woOih6KCru
         I0iz530Z7rVsEGUx8JZ89Aukq/232rAK9nmWauqOWjKZYWkXoFyTtHte4wYWhsgawkI0
         9v5qOKvZQT9qF49c36a6MBz2zxiFlICux7zkjUEASIYlsrM10M++RdnTqtW/9kpYMG62
         1ie9uxg90HS307BAD6EQb/8XwI62MTxeuYPVCbQ+yE4+Bg3USVKLTaISIjkfTQ4ztZi+
         L3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884038; x=1795488838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jGsnbvqpg8VUf1JW+l1p8xWO2BdDeqdoP4RVIqoBKc=;
        b=B+FRxDuVEK5t+xTOitkQjOTP4nlkFSeTL7tkPJnLO1cubtpDs0PBmUiT5H78aYC+Nn
         Eke7URZdd1/YyF3pzzlE1njf1l6qbtTBk591TpwCV2rbffUmqobwAiAGj8YNgIKdLAUE
         oKcK0aAVgNSxcWrl4yPuezFdVK1GWsStH/DXZpojAlzel0STpfuqW5vBZpzQ3DzGYgVG
         gWB0JQG2tSJPF8JprCNqsOmoel2BL60OKMCfYxbwdDOCY8reQPAzNAoHtDTnH02lmqvj
         Lz3aXY02dBbwDtbSoTvtJLsKVl61zrfUCmxJj6pNm0GQay+VnRs9Qgp5vERvuKA+pQCq
         L05Q==
X-Forwarded-Encrypted: i=1; AL+hErGVSH/iiC5wMiipn1idKDd9NhJt5yuNf82e7jQhLqVxE8mEHw41ZO5/uDkkXeDj6Xkjo3tmCFAffZmjryQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0USf6DJOz9JsA5T3SnBpVq+r73HXrFGjcEo3zDOHKT7WyXVlW
	ep6SLqqRCSSABaCBvUoXjFsv2Det0hOXG1iM9kEEWARvlMpb3FAglOLJ
X-Gm-Gg: AZFdTZfjES9RtZURDz+kXs9Naa1n7WDgZQX/LCaYCtY14oyglrSBzTd7PE+ZTURuV1+
	EOBlSaCSSqIfEpAmumo1FafSrAJByKYsf+dB9pdOjHFyXH/1P5ngt2lFwOduAT6Tv8pMgnT5V4Q
	0isj3dW/yVvMjZNU5/2i81y1QSoqicjMIL8pHXvrNsUq8anxxiUOngKFrukMAJaR0GiyRKCHkMj
	fMda/3LAFAWQ9jTGCrfLT5ne2DudUT//OwPlU73CcOzHwG6sKDNW6qFBhC+1bYCsh7gF7K6V5t4
	WPt7oP+TKG4f8N1+FrBjHXtD6IYB3T0ZGlSTGCnD7cBNyurYAQZCinHNhJw0kdKXbc4VMviEg7c
	HM0/yRAbP60igYLsaCQOvc1quuS+CCTZwmQXEwi3Hcc3s2pTg1MxFZ1RIV66vmBUlGRaYlI7qFz
	PNq2AMGCM/DR8VyVmOvNDurDSc4+Q+tnyLJu/NHOkraCYnNb3fvhjvGCGEMcHyrkueGekMlSPTU
	0HofgdUB9cze82FJYDsel7LW4IlKUGaTBpD8f83CgLv3i/cO4RAV8U8M3pi2eAQACrdBvIPsVqH
	OLXa1L3BK0GxAaHBE0rxcIzsFGgEq8X4G3CAloBHjsuHViIfzGVcQ7rYvhA4pAxHbdbnWPMl3Q4
	TEAqDGfRqHd7szugtXb8mEV2UKKWf2WEx35fjykcNSbj1vSRmb45WOZvhByqEoVCjKw==
X-Received: by 2002:a05:7301:1e42:b0:380:f8fd:d19b with SMTP id 5a478bee46e88-380f8fddfacmr1913628eec.38.1794884037636;
        Mon, 16 Nov 2026 18:53:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:57 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: adi: axi-spdif: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:35 +0700
Message-ID: <20261117025335.7455-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117025335.7455-1-phucduc.bui@gmail.com>
References: <20261117025335.7455-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The AXI clock is enabled once in probe() and only disabled in
remove(). Use devm_clk_get_enabled() to let devres handle this
automatically, and drop the now unnecessary remove() callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/adi/axi-spdif.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index faa1fc7cb973..07363ddebb77 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -199,7 +199,7 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->regmap))
 		return PTR_ERR(spdif->regmap);
 
-	spdif->clk = devm_clk_get(&pdev->dev, "axi");
+	spdif->clk = devm_clk_get_enabled(&pdev->dev, "axi");
 	if (IS_ERR(spdif->clk))
 		return PTR_ERR(spdif->clk);
 
@@ -207,10 +207,6 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	if (IS_ERR(spdif->clk_ref))
 		return PTR_ERR(spdif->clk_ref);
 
-	ret = clk_prepare_enable(spdif->clk);
-	if (ret)
-		return ret;
-
 	spdif->dma_data.addr = res->start + AXI_SPDIF_REG_TX_FIFO;
 	spdif->dma_data.addr_width = 4;
 	spdif->dma_data.maxburst = 1;
@@ -226,24 +222,13 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &axi_spdif_component,
 					 &axi_spdif_dai, 1);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(spdif->clk);
-	return ret;
-}
-
-static void axi_spdif_dev_remove(struct platform_device *pdev)
-{
-	struct axi_spdif *spdif = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(spdif->clk);
 }
 
 static const struct of_device_id axi_spdif_of_match[] = {
@@ -258,7 +243,6 @@ static struct platform_driver axi_spdif_driver = {
 		.of_match_table = axi_spdif_of_match,
 	},
 	.probe = axi_spdif_probe,
-	.remove = axi_spdif_dev_remove,
 };
 module_platform_driver(axi_spdif_driver);
 
-- 
2.43.0

