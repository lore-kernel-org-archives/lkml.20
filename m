Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943583;
	b=UGo+sYxgSJSxHkCgndZc7KVoF9fQ6SZOx2OVuJQFu8JR3F3Fea4kjZeeItKv8/WiCmqC
	 dqI1w2D6urGUsXL7VfdB7VK+JdNDzL318RVLAVI42a/ziPNNIzsjJPQLaiDNivDD7YckD
	 scqS2o1qMXth4xiu6lUAMhqMWY2Ru+x37JiiWA4E+Xf3AR10/PAVrJ7Z/B/m2VKQYqBMu
	 k8YgkPosvAgrghLeYk15L7q1znDq4BNbNMKLskltiqYfFuCv5U3wbqdC2uRP07dsyrX8n
	 4R65Dd6xC2iAk/IEJbvq/ig0s248CeJEKWHgghuQhRoQ2UuZDZxCwhdNkZoI3tBi5vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
	b=DxqJBKo5I4ticf8HUoUjBWxf/X867imZ4py+GWlEMK7adetGKalf28m9Ed8oXCv0OU07
	 UbZ0u5Owf6CNamVzEvRtRCrwty2mapQbFqrmGZzcSeINLUzMcUpxzclcsGGhvY3wudodV
	 wLXkOM48yUhwWd6+9GgkUGIAoXllWitFP7U+xb3LxLSHHelssqpcll9/FpATWwkH8cm5L
	 krtQP3oZq1UMDs4LxmKE0DgtSifYlC2I9dxUca9AyDUqFabUHxuHhJ6BGbEExySXilrUL
	 WdlJmzbX6sKemk+dxMvUkO1WWzzcPg+TrY5AyG1FvhFrwWvoP35kiy+Oi3G+PwCoTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoQTIGse;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA71606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA71606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoQTIGse
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e795af1d4so252735eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943582; x=1794548382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=ZoQTIGse91+8hmF++9MvWkZD6UPBY/5T/oFBYYh3D2ixpdZv+fOa0gvobd4BtOImcM
         5ncBEW3yU5RxxPA2xitOchMznRmLNPAHpruDuewM2EtcerUqnH2IdNkSmVVAKol8i+/R
         FNxUAWh5yruj6q+RRi4gxOYmFeqXkMvjoL+AH2gVedhJ/vB5R+O/X0kEEeDc5nm0qUR1
         PqszPJiC0VN6uc/bMLBOG72TTnrsHw1iHh51V+AdcT8GZJpPdD4W9xcCtEUOTXplCF2W
         CJyTwXx9zm27Q+0FiKqetkCO7pIHRYjBpzAUMlx+aXysZdpzUtpE44psvOX2sVFAKXs5
         xB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943582; x=1794548382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=iCgiBnYbsn5D8l2F4xeMMaJDGVbHmnxi+c1wFotPUqi/uVwlmXKZveWKmiDDidiZe9
         nmBHd7Uhmatz4csxGNzH9AmWMNE+SjFIQhXOaCJ3DH/mkZwg4Zd3tmeeJiAA9q6F7XCT
         m3BHSUu7OpOar+r+kCtNzONZdyBDHEBbFneLU9W0iEJWxJGLCdJFHfjBz/bmVFXJangk
         P3UFR4B4L1NteqTeHmvzu1BH7p1zrQSlQ3qj/JDG3MwNTNkR1vj5ra19GxUkHhcmrbGp
         SVbZIoAJlMMePHH6VMQm/btNIkpQEi4vZYvjUmw1FIJ+1POyShh4CfFZb9BlJOpHZrFY
         10eg==
X-Forwarded-Encrypted: i=1; AL+hErH1jkGDqCQcMM/KzoKkQw+8Gs2jUmOJlk34MaOiFXnwENJsR07QrGaXjqQ+fRMXJwrJG/oEz2qKcTm4VxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z93atZcL7gld0AUFKM+qnvh5bX6c0W3o9yn/pXrpm6Hp2DJ492b
	VsuKwZnuUXGyHIYYRG8+IfYD8NAWtjaZuy1yb5sJC/ulLwKNGm/x/L2g
X-Gm-Gg: AYBFou2c4X32n7bklmqRoMFLXzazBbO72zH9W95h9XKdt/blYv02fVvHplwOyqBn8Qs
	P6TzFrt+lo4z0bL+oWTPHN3AaWXmQjYeUkC/G48qM/h9a39bduXQAlxyO6dajodonosjKDV1c9n
	N0OR+XX2OTXOs45AlzCV9dTR+a+0D5vgvBCPISdGeRhEehJF7In7gcYiIebqre0O/RYHuik50kH
	b1UwcDkONqEbO3IeQwtwjeLffnl7bXxph5NzHZWgBbHmnmw6rG/o1B+rA9pmeOacp0OJ6HA61Ru
	uGycBiaTt2xaZLz4t5zrwfbeangwKfBBxvQ3l/KvqTN8DhfvNm800/rQPa8U25t06sEtOsC4c8G
	IM0VAvEtWg3P8EHMZuniV4PbFlHs56m9U0le5KDk3750O2awRSYArPyzvnSQrUXDg+D9nCpyCGw
	RZYG1KtLeQSVk18By0cu6hmEhH8aNohEQ1yH3IY+jwZqqtmT5E/dmeI2Jk/zoQ4ctfaqlGGKczF
	euOCL8rKbZ1dzn+KUPXua7wKYdyqMohigEi4gk/ZTfHe5XJWoUQogWxcsf1nqwYu/MLEkRbzyzL
	a+Zw6zRLtoaNdL2Fmur9EItuudk12GT3SpEu4H03KDfGG9uLFVyje9uEyr7VN2cNEPyaGAvqgTo
	0djZy2RIWE0+BFeLv
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id 5a478bee46e88-36f73893ca9mr2063176eec.1.1793943581818;
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:33 -0800
Subject: [PATCH 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
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
Message-Id: <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Always parse device properties in the Arizona jack detection driver and
codec drivers even when platform data is provided, allowing DT, ACPI,
or software node properties to augment platform data configurations.

In the jack detection driver, initialize the headphone detect channel
from existing platform data before querying device properties so an
absent property does not clobber it with the default channel. Preserve
existing boolean platform data flags using bitwise OR assignments.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 27 ++++++++++++++-------------
 sound/soc/codecs/cs47l24.c      |  3 +--
 sound/soc/codecs/wm5102.c       |  3 +--
 sound/soc/codecs/wm5110.c       |  3 +--
 sound/soc/codecs/wm8997.c       |  3 +--
 sound/soc/codecs/wm8998.c       |  3 +--
 6 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 6587d46a1867..d5f14fc8af7f 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
-	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
 	int ret;
 
 	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
@@ -1213,21 +1213,23 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
 				 &pdata->micd_timeout);
 
-	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
-						"wlf,micd-force-micbias");
+	pdata->micd_force_micbias |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-force-micbias");
 
-	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
-						"wlf,micd-software-compare");
+	pdata->micd_software_compare |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-software-compare");
 
-	pdata->jd_invert = device_property_read_bool(arizona->dev,
-						     "wlf,jd-invert");
+	pdata->jd_invert |= device_property_read_bool(arizona->dev,
+						      "wlf,jd-invert");
 
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
-	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
-						    "wlf,use-jd2");
-	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
-						"wlf,use-jd2-nopull");
+	pdata->jd_gpio5 |= device_property_read_bool(arizona->dev,
+						     "wlf,use-jd2");
+	pdata->jd_gpio5_nopull |=
+		device_property_read_bool(arizona->dev, "wlf,use-jd2-nopull");
 
 	ret = arizona_extcon_get_micd_configs(dev, arizona);
 	if (ret < 0)
@@ -1242,8 +1244,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, mode;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(dev, arizona);
+	arizona_extcon_device_get_pdata(dev, arizona);
 
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd))
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 09cef46f09fc..6965a2ec7642 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1222,8 +1222,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index bd747171212e..f7aaf1433ad7 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2041,8 +2041,7 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 73c4ffabf4ec..58bcd54aff11 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2403,8 +2403,7 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index c126afb65928..877305a83283 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1119,8 +1119,7 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index fdb2018e9367..28af93104201 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1346,8 +1346,7 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.0.506.g506a7eabc5-goog

