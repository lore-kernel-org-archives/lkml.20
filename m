Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691680;
	b=YqWmQIFww4rn73GBAaMBmv/TiJY0mCEFXPBtpnqV9lI26XgNHYDKPfyZA0zid4xow6s+
	 yeQTvu+QMhnYG0L81ae8p8MhkuCarNo6coR4GfjQHE356RlDvjtIjqRD3nlfGxC+GpF48
	 FO0ncVp94faqovwgeoNAKh+2SMqO4RjJIpcLjg2+bS6g2FB052ZQ40RfcwTHftaVWiYnQ
	 L9ZUSReXW322xXCwXZBBf3LfqS+CgKFe1XJUK3cpp7rjpI0MaZ2+4vsJb056ZZllei5xa
	 gpRySK2xMZHNEh5YVN/dtL3OJus50DWuCDVkUG/vtVrgT8emlmb199IhmwQv+yaTNEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
	b=Q2PcxTF9r2WzNjWq/qkzdYatQPkXcQjjSN/4wkErc+0NBJspYSl1BfrfGKBkRiXj1NW6
	 ZWGmbXtA+x0mkT1ZCdswelrlLE8bBNZSaxMTVvH7m1UWtrmhdUKATBb/q8asj8eyZCFGz
	 GMMQT27xtMhvKHYo6stlkjOhcFwk2wJQ7FWzWgUmcJ3HhxwPEtyi28avyweD2vmM51dy4
	 48B9XHYA6/3WRG8EEPl2EkQCuh34I7ESrQFrTMZJZdQ2O61XemeYM02jZBoePEi/Vu6xT
	 cYgT6oQN4OP8fUYyiiBVa0R8thSaWbM5xWGcP4OslGgEhDH7eI08EEv+IWqoHJMGHcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92C606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A92C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1866948a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=bliOVFYwq+YgawJHDEA/XjkMNFWU8so5SsslWlXx1+oU/NNmf+023ioIxb7NS9eCcn
         XZe3GGzLESi/TXSDcEUmvCECqWyDeZYzJKvC2tDcqs8rb7ZBx5/4kmtD/tyv5l6Tme7N
         mMq+vjxLLP8iRWGpBDpyGvIkD3wxFGsT3jXo7jV8a09brSudb6vzy1Uj44oqAmSzWR/1
         o1dwAjLkNeYsOvHD7fYqc12lnjcceDCwOjgCpVX8IU6NB/5ucfKSkIraSk7pXZVXJJM3
         trJwvyr5hgPR6FH3O3glK8xidNtKEmBScpGsp48Fg/BcZRQOQlXtYeg+CaXtzr7k3UpZ
         TEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=0MmemB4NJShwElCoicm0Gy3sd0TUAw9AqUIVY8cdF3IKBmaYWjX6iRPPRjXZZZwTir
         0RPcRWmbt5bLxC7yDXSOvTL3BbmxeZHih/D/bZzNWNuI6IlD5ZWYIE+YYzF0Ehk1r3K5
         NV5Qo1S29u/tffpohixpeOdMHkgea5+X1ld3uG50TSPVt1I6fvip5UlsqPUKU3hWGE1r
         K5ocybewawawV7oHpXV44ZqK8r4HMkAKwzFB1aJZk5uA5Y0SA+wsUSrSYwTbEfhBNeW+
         HC9ueLKfQ5Zo0PROH9cgX1d5NfOYBegkQAruQ0mk8VC0vWnsNbRDcAH/q622u79sP0QM
         VN+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+b6ZCaNjlUSO7YcHUtnyM3dkvQQDTNitjys8TMVZWgOVpa/DEqZ2KCO3ArRBYJuPASSS6VFH7qPyDDgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R/sJM0YQYRLekTvqGn4aRb1RZuXii4FKxnLrTmBu+FZT6VwPQ
	pO3hmc5adYMWw1xLNTY1wLB3Chw311kM0vKMUoXKVfcsNxaZ8wGvzvHp
X-Gm-Gg: AYBFou37V4rD+eGN3ODJbSX1M7FmIOHM80Dp+9nd+zZ3w+5ohNDkxKTBe8k59or1x3E
	vRJL/3TsjvpSDh2Q92iIDDCEPMy/hDxAvIq0alfLFLN0oOmGde1eWK4AoazCVR5hlwl7OS30IQB
	f0yU2iZ5kuqizkrYGMUH0u2aSICyAojHemHwxlwi3L+4HjVtrezIgCSDUPOBaNxF+b6YOccFRj4
	TFI1IZBpG8XYqVLebfkmxbAEg/6JcR6lScbxXrxQdOn0EQNgjotmf+g7eZ0kMLIOYOVcHpPWB2B
	/FTikaRZsCrfH9HpE5Qn6jycEyp8MV9d1G1bp2olnBNhMoFtr5eAifnmPlprTGfBgfRcEez3ox3
	RLaR89YYyZ7GG5L8KKrFTKjrT1k3EIATvDMYWiGdVZAy8pikAiHuRGuIzlzuWLPtcqGtDtSbT06
	7l+2g4093xBMR8RV0IfGm4f9bFhMwpP+oHH78PCy3B+ImwaJqCol3ebRQ66nIcSItswzmb9JBFZ
	LjwV02Qce1dMm0m0b+JnMcdT1U1bbDVJNT2IUxLg5vdUB4Jx064NyvvmMTZmgx+8fZXDyYjB8D7
	yQBnkwIRC+j+inSTv5TDA9PPqpw+O7YGkNhkRK4lpZkYzpcYLU9ulfM6YPL+5Tgl1sRfbmBlAIm
	fLKUpA1yt4P1wIoyFn3RFDwIsOKBp+nZnVoCZNEBU/B7Pns2YrRgojEL9bYIa/8ISQHDQyDMIT/
	INzoA=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
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
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

