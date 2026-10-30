Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377972;
	b=kga+XIfwnbaZ93r2/j+R1IzCV7Dh3JlBz9EK+xpE9ij8BCEj7pt922YYWLSEvLFh15Vl
	 sFF85gGCT8NmyNTgSY7STH2Xc48sDb2jbFcV0MuLcSbGbxzdt2TqfQAlMkbCFYTqezDtZ
	 WDL4Ehhp63I21gSLDPmZmKT75erLElvKWiM8nQHlV8UjDCxngIbbBJThBL5EPvz3pfqav
	 nxG7wZT8AZnQrYefwrgk2s1CBX1ZDgbmfc+vQKl8VbLagKAX1EZMA01V3TS6Yw2PZIPk4
	 IAVsuz1xzZC+yhloW4osrgxyPwadYfC0MNj2eoU+zoKzz9GESP3kVq3ssLV7CpGXTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
	b=n3+PocyClK4MfiGeDU7S1zBQpJ+ZTsMto4AAX5xqYWSyChs6ABcTUvSVY7xe9/gawDHP
	 ttBey3mMkQoAGyyzqwVKRUrieJG/nPT+WA2Orl8jqq75YfXKIQwEr9HjjpyKQXT19ZXP5
	 vpddH+Tkzuo4zc7URFK42oNyIFgjWAeFqnY0Ayyna4bWxwfI1FzyVdo85oFwjSgNpLPCd
	 J76b50mwotF1pX/k2w1K2cIo5/KJNVRZn4MO+m8W9f9viM470dri39wGEVxId3MW790PC
	 Nct81hRAiWjtVWxdujhIeYjzAUK9oAsoBWmm1qyqc2ZzmRsxoXlswgAKT2qjeES7GkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pZFBV8uH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7876C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pZFBV8uH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5775865e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377970; x=1793982770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=pZFBV8uHcj4SUpQbR2LXX+avyjyp+ArIZLZHwrBJM9Uy6bJdWPRyl4SkeV+opcoX9X
         ZiSIBhXLexpkgauaY+7UsP+BjbF9L7KLmHBnvdaRvHeuUWRZcybGd/B3Xhgs8aeby23t
         T9OM6NyaFCi11lQ219DIPKwGyexFwDi8CASvtyTnK5lB9wsURi+jqgyAXkEH+3VUvuML
         2L5Llv/dMA6ze44grNCY0NLXPGHYVRmNFwANWqbZRpTMNSWPFie+A0xxkC4dUqwxNWMq
         GMlQdjhKqL5R4CWr01ibe+YBp+Zv3BJtVCGU48CAoL+C7zwiB9QER1u7r9y1BZ3+dr6Y
         sstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377970; x=1793982770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=sd2GY1Sf+CAD/c11aFrUD7iTiqquXGDt0xPQYa0Ab9KUoa1Mh7azTduAa2DosSBwYa
         NNsnBaGxlm4y5OW4mShhESadamPFUO7BB++pNGudPp+zfNNUOUYgQbBx/OTipvUBITjk
         ZFI7tzI4vBbrTOelSi/5gDp8b/Uec4UEZMd7z0i1NV96MVPvR31sx3U+mnJE+79RpAKQ
         2Uzvc5HC3mzwRWEo+W1bp9Ro6P6vEVxb/CweEwtB0+t1AHLM8plDFu5wRbjtdCrsUXVn
         2IEPIyP4rc9i5WVqyydLblFp2paDPvy2L+uIvVGeOb3porUO4zQCnylPEyw6x+X5m9B7
         zTHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Ub/pUV9RwzGV4Xggw1ZWn/m49Y4iA6p0zf+Yc3E+6CPmdZrLUfPrkra8V+/RkJXGU3ZAMcdk+A1TcCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv/9koKFyJ2pONXl71OQfC9/Ypcybr9RqC0PJv31M/qHx2U2i6
	GCh8ix7sFPnB+kFMFZbl95H74zBxg8Pim7GJJhNQt4A7r7iuSPkmU6BS/Wnh1viFURo=
X-Gm-Gg: AYBFou0ZPtmC/btVzLQpBaRSLnnpWsL9YXtiy84BANmbh26W13u9m9z44n3aIFZhxpy
	/irhSmKI6V8r+zpywrL7HbvUn0avy17m9GC6+XI6WmIXy6dfQVSSoY+RnLPXSdrgOzfbylXTV9H
	6AQgYeywtOcrctnFC0U/aauH/3bhOsryRTdZISSridUqHubXLht+aagFhF3qBF/pYHFZGJp+D6P
	L1p+fxchfkJrGyc0xzF17fZvix5OkpsUXH81EkfyfZGF7ph8QUn6Kog9iCdvtAkKHFneOLQ28x+
	GCGawkrnGiZWS2HC1n2p3+nVA1CPexlzX4GeELR6lul5HaOAZpeif2IH1gd5bHjs7KRc7HALtQB
	4eWGmdYd5Mv517AjGPwr6oN44bbv+X5QzG1HyQoK/LlMK1ZAU7NDhT9Qhz4Yl6Y9CEspA0KWyje
	Bf47gEDGJqzzAhLVpJqlIq7Id7/sCQJDHRJHUM+qoznwySoSFvCCUlkUq4No5FMgdbS179M59nU
	UZRL1gUU2JAVFtMhNa3qKg80FOKqHENES0nPO9Wjuq3IlhVw74UQFUWdnGAGBKpeRQmwJtU+GYq
	F97zN5EqzwocOu1uJhy9QIdB/hLCilq1hJyHPp7xXUn8s9gR6A==
X-Received: by 2002:a05:600c:8b55:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ac17b2b023mr70629455e9.19.1793377969852;
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm4062372f8f.45.2026.10.30.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:54 +0100
Subject: [PATCH 2/2] ASoC: meson: card: unregister the card before freeing
 its links
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-meson-card-register-fixup-v1-2-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MbVgYLo6a0sH0b1W+GvzTE98oQ0+5OC6agqIsxBjCpM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq0Lkf+sf85oVkmvYbuC66yvHz5Vc3HOvrCEzd/If
 LbFjofPO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRlb8Z/im2TJmvXdm04Wfk
 zt8qz6atM45WzcxKkM82sThy2XpD8EdGhhNTdi+SP1rUmtsY1C7j1bfppaDdlW5mD7kXm0uZKkN
 lGQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The card is registered with devm, so it is only unregistered after
meson_card_remove() has freed its links.

Register the card without devm and unregister it in remove(), before
freeing the links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 3cdc73b3fe8b..24332f29047a 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -309,7 +309,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = devm_snd_soc_register_card(dev, &priv->card);
+	ret = snd_soc_register_card(&priv->card);
 	if (ret)
 		goto out_err;
 
@@ -326,6 +326,7 @@ void meson_card_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
+	snd_soc_unregister_card(card);
 	meson_card_clean_references(priv);
 }
 EXPORT_SYMBOL_GPL(meson_card_remove);

-- 
2.53.0

