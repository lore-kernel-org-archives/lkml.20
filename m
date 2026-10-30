Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351699;
	b=N3BjNhkqDtZOS+gFrCzkJijip2lRptR3GKFkmQWlKn5mKWHfyagdNjkW4mdaeqLMysIN
	 v3NbDq6qhC+SwIazwS+MJrnnExxeIIQqysydwl/eXRfRmIOF+HIY9RdqS9qDaEd7oIGVI
	 XaxtOJso2Un0ilLeH5U4mEyQslRi9mzOzDBD7WL8IDKjy5u3PgmWNOq9GkkQzRCBsUvWw
	 8f2eLfFradIYR/IsitXiZJ+d/KwDWNV8a2DKQlOPyHwvg2n8cSbj0y3ZCMxmBJVYN90yu
	 sVu7vPXWfN1EfB0h+rIjzVMOOTLGzGz648AJyfgIq5CBJJY9sjRLkbpQdi1X/Di6fUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
	b=iUqibTjQAbnmKSr78gGvj9veIB+STkZCMBOEFcl+ToMMWPZ4S5Mj4COsTYrrmsosqxnu
	 RM7+ml2mZTwwfEf5gq7kGegtuXK5vu8O7Mz8uW1icnE8JWNCNogywSEolGNRP9c8FSCbi
	 9x6OqzHWXc59G/GeaHRLetf9aqxoD15qA6k1jp1//zuAgZbib6c9FY4ETyWLUJKKqBJc7
	 6YzguPj1ADf40VnmXyWgDwo9dguJcGVS3yQV47YAHmQgN5aiSKUfcuLZDRWoVK2F9Rt3l
	 J9p800K4t6zH16KrJF8Vs2gOPX9mAPlnQaRh3ovqVQKckoXSK+L2pHXege62O6bYtBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzM6CGYq;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A10C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzM6CGYq
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8fe8e343fso3166425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351699; x=1793956499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=tzM6CGYq9mVXRZmXhwuJ5L+a5pDUyc35Hh/jAFHfWF808s0iH5b6jAuq0qg/FrzCS8
         Ct4/qYfGDL1mcLMWWlC3pPwRPIk3lkDyrfLMVzk0qHFv9qT0tiR439sYH9OZF9MA4b1D
         Gld9EpcE/XeBec0ihs1R0utDBJHN0BrhxdA/U6pev4hk7tUH3HFMkyhYdN5CtQeFEnoa
         gtZJsEWjPX4FyqZhJyz8iMX+C4PFJyfTLCQ//HH/mBfBeRv5F7OKVGm/KSZujcxyxRKD
         yHRjmZRo4VZ+TVFcyOhXF4EkvSuT0ppJ4n5rx6+hufDYYQyCpC2qCaNXzrpST0C9S0HY
         /0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351699; x=1793956499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=pz21zCQDPULIjR05oORz+CBTsqv0dNg3kb9LQ4DSJTgrcYsBYLtBvC5LF6vvBZ5dkF
         DrdPirv9ujeFYtCG98CLDK1qrW7NMbxTzX3HAzRRZdQRXEdV/EVwluAO+IlfpNM+7be+
         +24WdVHxerWDcIT7EoPcec6WUi+guCwL30yDQh3i4+iaKPFHNLMcHO1xEtGDYEM33Jyd
         QpSKD224I2qXoc/nm9cnJ+T8WiLuKpt/PuQtV2ezYUQA+4l7Q3GQxhEJx/AjCbpCZHSg
         QQcaf48qKvaBZyhknsJF3fSb+CIWPlEMBJoZdVKRiSHbVBPEFYSrmmi5clU7lauOS5mr
         BNSA==
X-Forwarded-Encrypted: i=1; AKwUvByvI7lSINREqaI+T4/S/ytpkW4EKAzag3crfnC0Dr0JsZuSaODofQzetMZeCuPMI5t6BxaYwKubO9miDBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZYnDaZfaDehVzAWt5jEL6ThOIviQEr9qsVFGbfj/A56lAXkBe
	gJyRn/4Bs/EiZ/Di++3Su0rpZ9HPllCUsVdkZgNzvEqOxFndOljuji6g
X-Gm-Gg: AYBFou0BwJeGc5eRx+GuF8nH1iQnszNHtYk3KNH8F0VVo+OpkJkvh6hUYOQFM3tpZHx
	eWWKGnjziH1gqvn5cWJybjEqcHXH9K1dqpXT/rsE2Uy8+ZNdlpKFzXS5Y77EO2wmCWIC8J4Vn5r
	zzyyQOLkjEZXgM/+x1NoS13Ai/dYOt3njUsN4AZ9OpVHZRFZ6ZaR4q35XeOxHYMcNZyLdXzHT9v
	RJk9/ViUunyNNnRJc4/AvPHBFLIx9CrEdmTkJTXavt6iv6IRYD0M415MTqevYEF7ddFi3jxlhHM
	XjIfJKBslAKAeKHjwk1+dSSx08TbbbYNC3QjqRSbYeiyWFSIj4yyFLajzgkKHEMye5zvxn8gfCb
	AIzyE55qXpNZsO1M6XuNKjhq5qq1+0j3IPBGIfyXomWDmRTnmUMj1Glf8g0Bij95oVNysgmilDO
	+eZ5A6fSKv/7u2+R7nH1owLcAX6OktByk7EGZvWNVFx7OqOBOpnJQ5Yhf/wQe/LaUXVEh2XvC8l
	rZDXOhGV5wSkGLh1w51Kbl2sjOkpqT5jat6b4XJVlJoEUNnKHeiN2xU8wMbVvJBJg6Ja/weIYTK
	9G7J8nSNHvjNsl3T7Wtj8GbkZ6iVSE9PngobUNSxlyQgn1e3803tjknda/tqd8A2RXeaSEiCao4
	iDq1jtRHHfCtyrVlCbXQMmH82RcJMgKx/QLwo1YiKYIA5
X-Received: by 2002:a17:902:f545:b0:2e9:58c5:8c68 with SMTP id d9443c01a7336-2eb3647be16mr17041095ad.54.1793351698836;
        Fri, 30 Oct 2026 02:14:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:58 -0700 (PDT)
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
Subject: [PATCH 3/5] ASoC: fsl_sai: Remove redundant error messages
Date: Fri, 30 Oct 2026 16:14:02 +0700
Message-ID: <20261030091404.18757-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

The errors are either reported directly by these functions
or already reported deeper in the call chain, so additional
dev_err() and dev_warn() calls are unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 44a34f48a0cf..5532fab80be0 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1615,10 +1615,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0) {
-		dev_err(dev, "failed to read dlcfg %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -1698,9 +1696,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
-	ret = fsl_sai_reset_hw(dev);
-	if (ret < 0)
-		dev_warn(dev, "Failed to reset hardware: %d\n", ret);
+	fsl_sai_reset_hw(dev);
 
 	/* Select MCLK direction */
 	if (sai->mclk_direction_output &&
@@ -1715,10 +1711,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
-	if (ret) {
-		dev_err(dev, "failed to claim irq %u\n", irq);
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	if (of_device_is_compatible(np, "fsl,imx952-sai") &&
 	    !of_property_read_string(np, "fsl,sai-amix-mode", &str)) {
-- 
2.43.0

