Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7333D6CC1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318738; cv=none; b=u3QdrhAd9E727P1mSKwRxJq6uxQOUYAnrmzwGQOxDy1/cYK2K/h1GrldyK8JWuChL+bOgqqDbyiEQV6PLxCNptsFWln1Hq34zSHLGw66MtZpL7JVUmeG0pGaBJXro7oTO3dUeBh+slr+1L8jqqZm4Pa8nQytGhnPn1pPjnWv3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318738; c=relaxed/simple;
	bh=O69LbaRDhE5Mnt4Cws91GlWiqFPHvQzlvOmeDgLwXLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csriOZBCON9HzgasTpHqESvtMvKXe3OOPcJYFVUdiFGZ9/JtscPANWE8g0bPkM6Isk60GZTKItwfh+K0admRyWc9+qjIkWMOdMAU37bygRKj4BU2Ayw67DLr4qletnJYZ7lIRmtB/i4om797/tQlQ4Dos4Et1LqxxNz6eJOAdyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hTQujixW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hTQujixW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so10568685e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318726; x=1792923526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=hTQujixW4ZmIu/gFRAXM5eyJXPTumgBaJtkAlJWR7Thy/RNZNx144g1gPOowToUxRa
         y0PxA2/o6+pEB5dGlK/Owp59GOL7D6q/B8P04t899opXuxn1Qt84PfYVMGIpdGUkl6bB
         mV6b8FdOjFA99WL2x0vfvuDjA0nfU19Xg00JU2MHEfuowdY/X/VQG7MRgfIzGc34Y7tU
         M0+rASuT5vtRdiJF06/X4C6eT8wXbPvsbki2f9OAwPmnxkPOFAdtVqfJg31r+1GHBNFj
         7OD9N+doh+80YD3Y/nPoi+AwzAt1cJqsjVfnT5ecTeV4d0q5Lwh/E/yTg337hzqhIrBl
         97+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318726; x=1792923526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=tmboMK12hWYGtCN+ivKXagBjUOigXAx/f5EYsx0CA7cYxBC0jOT58JnKd7pGwEAvk2
         TAo9R6M5AEXT2Tym/4ip8ABzzlWmihlqD/FPKsov71yGMA+QnRafKJyIQ4NhyRNF3a18
         Cz+rKGjxybPWQbwojblE9K6yb58tNtQcMhZ3Ox0nSFxgHm0FWOJvQ50cuCUJwX2jabY5
         ktz8iTDv2xYRs/sdH3TIxJhJICPmpB9/au7BnA1C2zJYUgYXvqp8Xg14HMcxkDKmwqiz
         9QVYbHIXuQ0A/9mOkemuqoO6F+GntzgBQto471P9MG5Yf6/jWharOd7Al7OB2V7EvIW6
         BIGg==
X-Forwarded-Encrypted: i=1; AKwUvBzGZ+cIBE/RPTYP6sPf5DVTz0wcaweh4QqHP8loPIa+j4CkaX3su02IurK4uhUwG82oleH8PIgz85VluSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHg5Dn8hZ9VMijBsUQV7xXQ0QFtyX7d3cUkmCngrZUrnIs0ENo
	cjrIqdt5EXwb9Z82dc91oKBT7+EsOuh10xUfxWNJqaI8J7HA8MK2K9KABVyFh+CtolU=
X-Gm-Gg: AYBFou224i3qnSw8MeXgqFCCOd+dDr+IrD1CqDtMaRpo2ucx72ER3uPg9DjjrlS3fSf
	lv0cHFbp/wT+bdRbkHVIMoVMvNg0ui4lBy47GkpaSG4dwfa0I7QWRZGWXreE9HN1U/QLvftoCpS
	wgGDp5VMqx+OouQTY9F1ktpsEHcnJw6Z7PgLusgUpKZo8N+qhUsV/H2U3o7sh4DtuOnFO/9qxay
	EdEUGQBCIQiDxUmmX7DVovCMZHrF2VucXIBiO/4At8mHRl7HZfu+O8t89T3O+ffZb/VibH7G6+l
	HM13UwiMpanDBGuhmiIpsxfwPB9TC93DbV+KwTYV5PhYlj5ycESSukKEfdcBMNkcNkw9Nuyk7MX
	3p9d1+QhqYW85BTBZzf2sLMvnocy8CF9zcH9lx45SfXZaAzbAYyVLOuKSupq+mYB0ZnOEfrNrqY
	Fg0mTZJBEV3li1337JQhZ/rIUPV1HRFL8MJu+nX+gxviOwXBTPynbwYJtVW/Sk3BcLRXeK
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr89775225e9.15.1792318726464;
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:03 +0200
Subject: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O69LbaRDhE5Mnt4Cws91GlWiqFPHvQzlvOmeDgLwXLk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vwOZ/e5mJF+j32W++2crf9qcl+mHuSxvaakfEAzK
 0M+UOZ/RykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy7gYjwzTz01GubckscY/7
 Ai32BAq2lh4U8riczaAteG9pxwPLs4wMDdPk5zhPzzjZ2+WTwF+9c93ha2UOs1Su2Gw5uUahlSm
 cFQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..7e9b34e02275 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

