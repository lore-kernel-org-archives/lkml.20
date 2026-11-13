Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546483;
	b=KCBhwBx6whTKoxQOxLgzJc24Gc7HlFtApReGE+CJdlBL9K8xxXG4Fv+PdQsEnLaUUylZ
	 hZVWNvjV62HfNeSMsoIdw1QK1oKoSoxKJjT+1lILrPEoeIpHJPpo61gvCgiRtI4lVadBo
	 cfNBAy1AMtRPP+mbDyJnAakiPwoxi5eWGykPdA9GYwemfqKdVtnO2P4EGPgvM6W+KONvw
	 3MwNyjV219RQqWxFscGq1mHqPaB6qM7WzjAaNNa2InqIgdFBu+rdacDOOovanxwRxjW+k
	 iPe1jEnqumj3PsnZ+fhHfT9oWc5vgrvqhlMxnxnPwuztZKAheFPGk+AHekNSu2ikGUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
	b=xeGqW4YqOiMdPIvCNYZQ7HiLTOn3DkJXKqoIqlF1HRLObQIoZMMb/HwJBoEJHv6qjzJB
	 1U4a0Cut3qYjQycn1rhZwXkymdoxJyFP0d3ASH16rQAIydJe3jftcoDIuD4pV+QoiGIlc
	 1y3pJ58Zqqz9CTLpZIeOz6keUyaiitmiswTnz5Gz2Qp8NfNneUSDYwEzmPDbi0Hly5SmF
	 0aK8ebMtlQPYi/t+496ZUVUmlrWWn3+1sODIRKCamZmXY26Nsqi/eMsv5FJFj0r2NkpkF
	 G+RoPxY0F6WEqhkDoHJQ23KyOK3AQzLIaYQUrH1+JMKyMM+7m2BRL1riUdF9i/bJdOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsE+DKDJ;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24849606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24849606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsE+DKDJ
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so833847a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546482; x=1795151282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=vsE+DKDJ4uXACsfIe0fiHuspI6GznnUwDDACNkexcKA4lMdYsQWE4wKeNMU5BB8eht
         Kk3Wqh/AV3akujMshNo1lZYjjqdIAdGKsBZ2MIFLc2GU0zVMis26LeD/px8s+Dv7DLsK
         6m7h14DnGzUH8Sizij3L9tb5xmj0nY7gMCgMT4205pR9tlLUdUiJWC3ga4rLe4+THhS/
         Sn0AbxBjsFB1IQe+VWt2f48Gmps7REYyUnK9uQ1mPlQFS/4JSQ+p+89w3y8Lg9vbbb7P
         SQkPl/rhPDNj9WOwN2KtZU3KON1tIw0Zn520BrrreZaokG5Emdq7NJFr83MeyYuH9ymH
         YqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546482; x=1795151282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=oSF+fmxO3eNKX59jOmJjK9HMC1oVq3hAtI/J23ICupKRFO3ISio3JqLCmzdDHFnuAA
         YsP7jefKiHQcuYXtBNp7qPytzKD6ikgpPe3uYZZUuI2QQcgggsevHtf9y+uaZreMV9W3
         CcDlXmWL9uKyEA2FHGmSAi76H+bfIk1ycgvXAdEDgMRmqnzfWseKaTXc3kw/FL1dqO+C
         5ekll5GKLg3DPHzqsIwOqSN35D1FuKM03m3pTawFLF5z9ZbtCk+owgwqyathIMgfjQtt
         3s53JvBNwBCB7oe58YG9aJw/upFmEqP/8ShQDYlsUE8YX873+gqhDrRGTj8Ty9JZ4+Hv
         c6NQ==
X-Forwarded-Encrypted: i=1; AL+hErHIbnXarfIpfwrlTXhNYHnuO1qhGmGCXsCAhGuMnIqoJ+skMgeCC1SZNPXYxv6lSzFMVL6Mda0O7vSVshI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q8nGCNIwX+OOMO1AvTO17LYpt32kgGxUiQ3yiBIvedOQHDbhB
	dTmQNNBhJa/Cbu/hLVYXe7DkpxRD3mq0L8LCtBMaHcoO161bkEGysTNL
X-Gm-Gg: AYBFou0n1MsmAdJuinXYmmZL0dYOhw9koChUTxudX43Botl6Z8d0PQteCDAqJk1nELF
	Bo63msPbwBKffwS9qV+MN6IWSOb9s1UfPPL0pg+YGFNloyQlPqqfcShZLI4Il3fXp3/54xLHjVt
	MzWg8BDbjJoVoRTMOn7YfxXwQXwO61RXCKBgBQ/V3f5yHkJrRhdoCCtc6AxXRsMyo9nrqdEU1ai
	cq089myj5fZIRJy2+Ubnq64uXsxT3q0S5L5EtD7cgf35A3GDEh3FHaszZOaSmABXLECfxvpk224
	8PT5zQWdfn1g5ZNIQRvO7wV41lj2BO+jVGTsi1SdLvD2VixnuZJeUkhEusHt9ofVZb6L7V3MmU1
	aa8qTuqgT1faycuutL8BFfaqmOaZcvINek7w5kcRoApGE8KbCZU2ft3SGz8nMvyMeMf5DDwAWXS
	Taf5v24WXuUTpUhAvkFsJ6rZBtl0sOCTTYvuuoVlB3yc25hcv+Ada3CiRy6U4MF6aoId5nsXJdI
	3bCtTcVKj6QfuUwH7rdzVSeYkkCgBxDTh8PBwgMdWt51F6pjuJshbYwjmNjYRhpuDddCrrPIy+8
	Y3HRO0AyZjk5raeQhwhkVPCSyZM2kreydYdMVbbs3dgaq8N+tQCa0J/UtgI/l/5hNYc4Bp2/2SW
	6yoXWT527xpXJbvhUgZe9LWlkGWikVkzE44QqUmIumjjx
X-Received: by 2002:a17:90b:1cce:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b1b0a4adbfmr1144305a91.53.1794546482206;
        Thu, 12 Nov 2026 21:08:02 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:01 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: fsl_asrc: Improve probe error handling
Date: Fri, 13 Nov 2026 12:07:22 +0700
Message-ID: <20261113050727.14053-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes. Also remove redundant error messages from
the probe function when failures are already reported deeper in
the call chain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index faf348dd582d..055593d5d37b 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1301,22 +1301,18 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
 			       dev_name(&pdev->dev), asrc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
-	if (IS_ERR(asrc->mem_clk)) {
-		dev_err(&pdev->dev, "failed to get mem clock\n");
-		return PTR_ERR(asrc->mem_clk);
-	}
+	if (IS_ERR(asrc->mem_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
+				     "failed to get mem clock\n");
 
 	asrc->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(asrc->ipg_clk)) {
-		dev_err(&pdev->dev, "failed to get ipg clock\n");
-		return PTR_ERR(asrc->ipg_clk);
-	}
+	if (IS_ERR(asrc->ipg_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
 	if (IS_ERR(asrc->spba_clk))
@@ -1325,10 +1321,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
 		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
-			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
-		}
+		if (IS_ERR(asrc_priv->asrck_clk[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(asrc_priv->asrck_clk[i]),
+					     "failed to get %s clock\n", tmp);
 	}
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
@@ -1443,10 +1438,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
-- 
2.43.0

