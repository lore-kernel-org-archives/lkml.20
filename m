Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7416415F07
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287546; cv=pass; b=SUrJsHR9rG8ehTnLNhcY/ynIzRKindxIBi095GHICIykhKEDNHy1C7ey2OQ9kQNv51+s7MOsqJyKNU2BZVXVyyytiG4N2tN0WGk+KorxCkaHazeRreVA1DPnZKZBQ8fNHhxhMMRHqvGPx2flWghhH/KXqiyaUhCJxDsETyBow2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287546; c=relaxed/simple;
	bh=7PPsh/wW2qYS0wehKM/K22j5ddH8fM0u5YOYLVc/dJE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Cze+Mn4cFL938vYP/TFDy2rAF0CnbD+vORFhzCAXZeYjrkPjWrHDftSaHAVGBV3Xxtal8WMkCBhbZDBbLq0VQg1p8Bq7GXYTWuA9v7PPZ8iFFVJN4T2FXqvjbeWD4Plgd2CPc+seadfKVzs+v2BMWwOAY7xAWn0ge6iFfVoc3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpIRWLif; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpIRWLif"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so33691766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790287543; cv=none;
        d=google.com; s=arc-20260327;
        b=pQF1w+wmFl2Tpr2FdKDEmlCnNQ6wK9NrxaUAxRVo2TrBrJ4vjzxBW37+p4jGq5miPU
         6RGSe9/RtbPtmkLVRgKDh9lOEONVug7/jAo9yvxCgh77b/JtsOLyCwR2drBXBEIstTyE
         zGHmoWzfdZYKhusUZtvckt52Pg8OZniYQBy8nmOsu1I9kMH2c4LknM32Sxr6Um6Fs4tX
         Qm6ZvckTPMEP/Ka1TsOkIMKjjw8cZeDN5r6ffI9XUZKkOVNi6Al1PPLO32i9lgAhBGgf
         xNpIFYSp4b98u2l4X94GlykdvC4CJmRmqWM3sIZqTsAHu8fLqQyucUdHYjjsYvG8oNp5
         /8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        fh=P7cTKF1Q4cNvQ5fYnato6FBhrPtsasHpm95zhD3Plxs=;
        b=LxiSJRP/Us/T4qiVWf7GdZZHvAGyKT2rDoE4dCMAI0O0Dnlfj/ttCnX4nNEG9re0YG
         9g93CJP1q3Q8jLoTUb3qLPH6YWRhEKjh5Yf51bSqtB+tRlsQFmIlfqnQo0QOiYLu12bH
         jYVEzYV/ybwG8y5D0P5q42hnHBATpzAA0KFbxhvCV9i+cRHsu0BzY1jazXmlju4Q9fWl
         b8pD7dQVCyBp3bC0nIozU+cP77TxcgD+ngHtpS5oYQ0kkf1SdyugV1GwjqvyDSMoeTPh
         TZE+yDbHf1SJKli76VhWKfRlfReLYU2Z3QPp5CnSfVt2XTAWf7cMwWpW3/1DkwNBMhYZ
         1BlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790287543; x=1790892343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        b=FpIRWLifOQ3iKnOOs7b8sMZ2HgAjhA4WBWkYE81d4ilFoVu4ymzBc4AAU3OguiSgfV
         AkyOrV3YRKfl6u1pxGUC+dsCXWXP5toONBLAGsURWiITMVCjToWdduZvwq+XakURyytZ
         8SbCUok13xnHJZx1tqZVM4l03RCqK3RRmXv4J/Xc0KjxCKXyjZQSOBgfa9yXOqWC/9z8
         /kuOpYT/F1OBKcUtoxMWVcezsEqlLj3rCFRR8h7NdrO5ea3Q/HHWXg7FjFS4NUuyzG7d
         XC2J1oQ2+e/mYjHYYpL2fPmcFNnFHvIPKQ2r5Ub1d0Soh2HsnDMs84r3F0b6AlCV1p8R
         g1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287543; x=1790892343;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        b=KIii8QPhtQLdrjCXafwqTgk7PqySBmOFSy7iWRrQ86ZQzGHx1tKeoV9LjS8yz/wi5G
         sdkOf7hHXOTPRrCkO+r0yYb7+7XXL1hZarWEuh51Y0QcLuV+rQHolhFiyxFBR4hm41uC
         no3aFWSkB/plY/jOgJQ1r2nfbG6Kpj1a0oWsKBcw28395N2HZ7cqwMYQZz5pOYv+1WcU
         Uqlpwdj8xTGZCkJj+Of1b1AGyluXuVlmzFWmX8T74zpzX7KqRVK8h+DQWkAwU/q/Mb3P
         xhD5+RWcwncZdVT5027ZvvS2Ad22XjLVFWHmoXmwE3vpcNh5cM3hotZLalepYS6cb5DZ
         k0eQ==
X-Forwarded-Encrypted: i=1; AKwUvBw97yVZbAQwdiYFa+D6XpYA7vGleIfDq0VaWBsjmSLsU+yeb5FaMaYqJARqoWoJYzrHua2GyVhaxVNyb4s=@vger.kernel.org
X-Gm-Message-State: AFuF++k63ZbAvrjNEgUOtr9fd3vMXICeth8kt6OT5lYRbv6gNoU1mJJY
	2nfr3CQDcTQQYyHvNE4KDD4M0UICJy8YqZMUJ3+ojElOecP4apYPSvyCP01GrNt2Uan+64qyCgS
	RS7cgpkQkMwmxy9Ni9TuTuwN32LBeFA==
X-Gm-Gg: AYBFou3bDXzYvZJpWQGQGesEcnLHolYvaTC/XCLkl5rY8UcIVLOpoviiUfSCleAV82y
	UjecaW7CPGg1SEoqRdXyUoa2tJqGTloO8h0n11nYQYx4hb38CtQK/h0aiGNHaXIoeIzrWDdR3nl
	4WoH/B4V7OEy8Hl6Bx1HjZdqawiVqD+UIboMSKSwD7C74qetk6zpMnorUej15zDaA7oDq53mzub
	W3fLZfRA4tIHsli2oyGvz2krJecwbFdg5m1u0sybIeaGzCfaCDDD5J/JAfNrJeXGNhCHRJzaex9
	bIZsMzzHxD8Z8e+7Ja2qY9oJAD8FdwxIgbPQsrrYVxflKD25vMy0su+OrCqnT/MmtHTYzkpyiF8
	zr6KBE1IjckZy28/SbX/5sB92COKFclwxq7pdbItb7rZPPShlBSTGxyLOd7O91Tub
X-Received: by 2002:a17:907:97c3:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2ac2314317mr320652666b.8.1790287543018; Thu, 24 Sep 2026
 15:05:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 15:05:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 15:05:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 15:05:41 -0700
X-Gm-Features: AclHuK9Xiiy-R-_FFYfGSBij1yu3Nb9Lv8izicpagfcw0kj18_ng_woEl_xQff8
Message-ID: <CAGEsz8G_s8_HRnHH8s+NvXWXV8Uz2xRDY+He9M57v_fW4H42VA@mail.gmail.com>
Subject: [PATCH v3] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

The WM8962 IRQ remains registered to the I2C device when an ASoC card is
unbound. wm8962_remove() cancels mic_work, but a MICD or MICSCD interrupt
can queue it again before the component is destroyed. The work then
accesses the component and reports to the old jack.

Mask microphone interrupts in wm8962_mic_detect(), wait for a handler
that may already have read the mask, and drain mic_work before changing
the jack pointer. Install a new jack before unmasking the interrupts.
Call this path from wm8962_remove() while the component is still valid.
Leave the IRQ registered for FLL, FIFO and thermal events.

Tegra's card remove callback runs after ASoC removes the codec component
and PCM runtimes. Drop its redundant microphone cleanup.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to
direct regmap usage")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Use the existing microphone interrupt mask in wm8962_mic_detect() to
  stop new work, then synchronize the IRQ and cancel pending work before
  changing the jack pointer.
- Call wm8962_mic_detect() from the codec remove callback and drop the
  now-redundant Tegra card remove callback.
- Keep the IRQ registered for the other interrupt sources.

Changes in v2:
- Do not disable the IRQ from wm8962_i2c_remove(); card unbind does not
  unbind the I2C client.
- Keep the devm IRQ on the I2C device for FLL, FIFO and thermal events.

Found by inspection; I do not have the hardware, so this is not runtime
tested. The modified codec and Tegra objects compile, and checkpatch
reports no errors or warnings.

 sound/soc/codecs/wm8962.c      | 29 ++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c | 13 -------------
 2 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..7b09de65a009 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3230,21 +3230,22 @@ int wm8962_mic_detect(struct snd_soc_component
*component, struct snd_soc_jack *
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
-
-	wm8962->jack = jack;
-	if (jack) {
-		irq_mask = 0;
-		enable = WM8962_MICDET_ENA;
-	} else {
-		irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
-		enable = 0;
-	}
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;

+	/* Mask microphone events, then drain the IRQ and work before
changing the jack. */
 	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
-			    WM8962_MICD_EINT | WM8962_MICSCD_EINT, irq_mask);
+				    mic_irq_mask, mic_irq_mask);
 	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
-			    WM8962_MICDET_ENA, enable);
+				    WM8962_MICDET_ENA, jack ? WM8962_MICDET_ENA : 0);
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
+	cancel_delayed_work_sync(&wm8962->mic_work);
+
+	wm8962->jack = jack;
+	if (jack)
+		snd_soc_component_update_bits(component,
+					      WM8962_INTERRUPT_STATUS_2_MASK,
+					      mic_irq_mask, 0);

 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3593,7 @@ static int wm8962_probe(struct snd_soc_component
*component)

 static void wm8962_remove(struct snd_soc_component *component)
 {
-	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-
-	cancel_delayed_work_sync(&wm8962->mic_work);
+	wm8962_mic_detect(component, NULL);

 	wm8962_free_gpio(component);
 	wm8962_free_beep(component);
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
index 31f9d9181595..a79d464b6a80 100644
--- a/sound/soc/tegra/tegra_wm8962.c
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -97,18 +97,6 @@ static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }

-static int tegra_wm8962_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	wm8962_mic_detect(component, NULL);
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -129,7 +117,6 @@ static struct snd_soc_card snd_soc_tegra_wm8962 = {
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8962_dai,
 	.num_links = 1,
-	.remove = tegra_wm8962_remove,
 	.fully_routed = true,
 };


-- 
2.53.0
