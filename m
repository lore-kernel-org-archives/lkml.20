Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889291;
	b=3w37a4udKQW83vufJ6nbEMAtshjTGPZQ45dCQ9/praGcieLxFvpk0vjcGIK77igcA3gA
	 po38AadZ5jsl2/Z2xGmSLSouzI1CEcFn3n0KzVGV0944QDp53Je7xb38i1NOr++utBGls
	 sutxfHlsLmP9wnpTkCqOiD/Mv1dlSOCvxvsqxoQENPJt2P/W3ZE5mRKPsNdJPLOA1y8hx
	 /QD5qo4h3STbI0NEEN2KWhQ+HJxd7nMMPh6NXAXdbBwwoW0gA4LoWWF7VmG7mXWd3x6cy
	 OYLL/mO2rELJZLZNqlLV99wJdgKEXFv4vQAMyoag/zQFNAh884lAVJ+aNYvYH0WAJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
	b=h/fZGw8A+zPVFoZMhl95uzTP9/MXowauu80o8qXhubjNg8aOnbi0uq8MB0Sxb/JvTOTm
	 LTKdfIH5601bqhmjbsqlEEEBpFld4lo6HobMNC+feVJ4Z3CKxdci4S41+TI2kCQuvZOU9
	 U8J9q6rhGw8kZyh4ol2rq4b8Mqfd5zw5O5xsYyH3rRZEkigSIMc4zBZyK/WJtYzfgoqPx
	 Dm3sNVebDY71l9rx7OKJXLWeoFBrmBQk663MNWkcBpJCqNj6QaVWEZcAPJvNKUMZUOwhG
	 JhaPauWNkCXD3kYqh9qN8rmA01B1SO9e0rIKfG8m6MLJIIbY1HMk85ci3wLi8lba8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyrEDHfB;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645F3606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645F3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyrEDHfB
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd993e9d6so2577495ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889291; x=1795494091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
        b=EyrEDHfBd4YXBzIi4U3mV6VVjiFuf5p57wUhGUjLYjqXtPe7saanA9UCu0dAUXTCjx
         t//VGPpePsMN1M67t7JDCaQUIKevIadMpCtoOQcvgkGQ2tnqmWkt0BpNKhBJncq5Vz4H
         LZIp5FVP8CPjcDQ6vsIRDAoCF4pPT9DPwiVuZZnZzRG/OPXAjaoU62kxfcsP3P0IHJAD
         12VYxcHCAApmRv9u9sEiszfW4ycflDlkycI/uyD1RwDXvMS5rCAWdUIZuzffo2JAYt+Z
         lB30DmJShkkkiHGKxqbPeDC5g6yiUN2NWKxLwxWF8qOH2zF0EL6HFdCRQBf8L4daYAOh
         c5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889291; x=1795494091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1355GaRprf5af481svTnlH2umLDzsTzd+KGfE9XZpIs=;
        b=0yKIx9WDZov83I+Mz2zGfR/xA5pQZfk2i4/RMNJPr3NiPvYDO1Bj+r4bnft8j4wQAT
         tabdN92cxeSX0WTlKLQUvyOM4WzlINBDhExrnjDJ/1v8OWpbEUvEP9JobeESbt8iyQ4S
         fnljgQmEp8H+Cx1KJd5wCKLY6VMbmtilS3M40Mvrih5rf0JIJ6HlmBPTZC8Q+unD/Oid
         e19ebN1v6BymV09ehULoGvZU9qxry46u19sRx7E6HD0EKfYcYhveSpOre0VozBo5pnKt
         UnYQvkC13Kt437nWLytGjEJ8373eU9msVxPbmZT8KOOrtVfBp1EHcN5yhwgltCwSU4k3
         X9VQ==
X-Forwarded-Encrypted: i=1; AL+hErFkiSvagxi/CRoI9i7kSNf9mSwKVZGEvHZwPYW7nMRnXfGEHWA3SQhvfmeiQTOkZv5JFAqpeRVadSJ/M2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/noG/NfwSU6Gk0swWJvJQeXS8tyFpnnFaeEw4DmVtjb4jJuZsi
	RPEUhm1b0OFR4NDuU91am6knScuOkGBM5l9lVq/0E7QniniVZYWhO9qO
X-Gm-Gg: AZFdTZdH6VTrqszC+++l/tRDt1xnE1mbdCkTtv5bLnDyVGQISRJq9Mv1uQRJVTMuNzk
	b1I7eCJktBeqWjT9ybc8HtCsnxPcLH29zrz+H9GZfy04cdf4srKfDHuskKpOd+waYCiZV0hnf54
	6nwM+T3FriLeFaUZkFv8fXO+wf+yJNUgaZ6G3mS+in/dZ83f0AKW0E1yTpG3+xhki3YFv3DHaSX
	+2B4xg+94p+exymRzMvTpVKYsP+Nh+4MJ7BF48cCPWd2zF5PcxIV7f4TDMIFWdYyD6S3C0neiVG
	5fJy9T91gfJN9svq/ekGdPAb2htxTzuzs+aMhch2EJO+CVOmTSuYP+5GcdX5JPndj+H3o85wSf+
	AzwAds1CwPhytL8reeSA/VW/vDkET9B6pb6nhrI3FI+Ahyia3B68+cnULKupsZzKCYMtx+id5oa
	CmyOPodkT98ICAh5T3d0utDvGc8SrhxXStKQQiJwJQ7T0GL1cYLuVFwvG0dDKUzYEDIsQU+7u6G
	awhWHUgaNDUO+phm/MidBrP0iWdWevXTZuykAf9EdXAmCo4i5qM6uJKhRJvxghdVbFZcQx0YaCz
	Kxqbl0xiP3VlquJW+d7RLFuLgkgWj5cYvgQkYpMR3SSiwP2HUhFo3ASXm9ZwybbcZ/IB+Yj19Qe
	ZGnr5HiIxwjwEkMh7dIAv04B2XONuILArNSypSdXSaqib
X-Received: by 2002:a17:903:4584:b0:2ed:1cb7:79a2 with SMTP id d9443c01a7336-2efd9a87525mr10469925ad.25.1794889290610;
        Mon, 16 Nov 2026 20:21:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: cirrus: ep93xx-i2s: Use devm_clk_get()
Date: Tue, 17 Nov 2026 11:21:02 +0700
Message-ID: <20261117042102.12442-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117042102.12442-1-phucduc.bui@gmail.com>
References: <20261117042102.12442-1-phucduc.bui@gmail.com>
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

Use devm_clk_get() to manage clock references automatically,
simplifying the error path in probe() and allowing the remove()
callback to be dropped.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 47 ++++++++---------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 8dcfc6717e19..f2d55763a02d 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -471,54 +471,30 @@ static int ep93xx_i2s_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	info->mclk = clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(info->mclk)) {
-		err = PTR_ERR(info->mclk);
-		goto fail;
-	}
+	info->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(info->mclk))
+		return PTR_ERR(info->mclk);
 
-	info->sclk = clk_get(&pdev->dev, "sclk");
-	if (IS_ERR(info->sclk)) {
-		err = PTR_ERR(info->sclk);
-		goto fail_put_mclk;
-	}
+	info->sclk = devm_clk_get(&pdev->dev, "sclk");
+	if (IS_ERR(info->sclk))
+		return PTR_ERR(info->sclk);
 
-	info->lrclk = clk_get(&pdev->dev, "lrclk");
-	if (IS_ERR(info->lrclk)) {
-		err = PTR_ERR(info->lrclk);
-		goto fail_put_sclk;
-	}
+	info->lrclk = devm_clk_get(&pdev->dev, "lrclk");
+	if (IS_ERR(info->lrclk))
+		return PTR_ERR(info->lrclk);
 
 	dev_set_drvdata(&pdev->dev, info);
 
 	err = devm_snd_soc_register_component(&pdev->dev, &ep93xx_i2s_component,
 					 &ep93xx_i2s_dai, 1);
 	if (err)
-		goto fail_put_lrclk;
+		return err;
 
 	err = devm_ep93xx_pcm_platform_register(&pdev->dev);
 	if (err)
-		goto fail_put_lrclk;
+		return err;
 
 	return 0;
-
-fail_put_lrclk:
-	clk_put(info->lrclk);
-fail_put_sclk:
-	clk_put(info->sclk);
-fail_put_mclk:
-	clk_put(info->mclk);
-fail:
-	return err;
-}
-
-static void ep93xx_i2s_remove(struct platform_device *pdev)
-{
-	struct ep93xx_i2s_info *info = dev_get_drvdata(&pdev->dev);
-
-	clk_put(info->lrclk);
-	clk_put(info->sclk);
-	clk_put(info->mclk);
 }
 
 static const struct of_device_id ep93xx_i2s_of_ids[] = {
@@ -529,7 +505,6 @@ MODULE_DEVICE_TABLE(of, ep93xx_i2s_of_ids);
 
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
-	.remove = ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
 		.of_match_table = ep93xx_i2s_of_ids,
-- 
2.43.0

