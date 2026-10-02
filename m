Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93633DA7DD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934596; cv=none; b=dGNpPRPiQL8So5lT2V5c9cWsUcQi9jGTw52QIn3qkz8OfX4NJzvhkH7lywAagdm2/ejE5KlYBg6JZA9LVbSoJxU6Fz5s96dLsYIyz/v6yBm3FOl0lLcTEhDa499Z8sWm1I34y5f9/zfoMQoFJJwFFE38eDxztzxf5CZ/wCvYD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934596; c=relaxed/simple;
	bh=Nv8VQkbUiPG1aZzPVXB79Tte0iN24CS3tAzHXZLKcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onZtmU5V0mJdW6ChsqwniM/o5Veme3gxI0Apm5WXN4e8gmoye2OSs0Q0ftJcecAVapmSf4LcWv1u921uoHsVomRFq0XBi3HRS0kfFjLmdTgpaLLXQUCtP8TgTwKLQn84GU2cQ3raf5+K9hc/BIERIODRHw22SpXiEEXWQWYB/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rgvTibfr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rgvTibfr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so45257765e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934587; x=1791539387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=rgvTibfrt5n34qHdZWsWd4UAw7AJ80LPg/AA2Zwuce3p7b4525Z3vB3o4oQAM1aXuT
         y1ScqnORIXcjjAiLl7gceJ62OaGNTGiIYJyGZ8OA6eSEjEHJBGXxDNteae6dP88oNgLz
         uKSBzRSemLzcnVyDhW1zjgoPIV76Jpxl11KDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934587; x=1791539387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=BGqajBv9NWqj67jfdFmP1MzQpvMCrQirAz06IjkUt8R2sqmfDcB5gRr3jCJE/Mdg6C
         65mOS6ZOhACrVpoUjSIGD64kAHFwn4Bt2jYiNs3N5wWDfay4Z8gyCVfSWj8fr+QS7l0E
         bDVBp5CJIc0jBrnaRc1UDU9/V3dZOf65e4lLTOne+Ynnu7h1KY3ky3HvqpzWjE1ArXth
         Bfem5ZvYIxGc5SGY3dV0+k8SNgC4L9P/ni5pTmF0LXmsCfpkDAODyT0xB91T548Hjoen
         utMJ3f2dzWdmgZ8soHnGMnrKjfZDI3wNnxgim9PtkQjswlTfiT5u4mUNTA9ejVpW6NW5
         gUfg==
X-Forwarded-Encrypted: i=1; AKwUvBzq4opnS+2tkYb+YZxEsNopi0ktxaUgvei2jvBJBufHJJzYfqtl0zGfNOCCtBg4WsjzBRyWCs3/2urKUYM=@vger.kernel.org
X-Gm-Message-State: AFuF++k4L3sdcOy2iM585kZt6F0wqdoEYQsydR2tHHF9lpwFP6l6psYh
	3RPDT0ENgiI+JMvf9g4l2NYyM2o6ztZiWm9maFvCA0dhuUAsmRtS3R4t7rgdLTloULw=
X-Gm-Gg: AYBFou0fBeZia+KTNY7YiA+xH31eiJ2da304Vb69A13TWTwPGnWNaeQbviBHFEAfdnP
	sb1jn9dMvMI0otGKOBcPzTXB4N/3DcCAwq6jnnwIJ8PLvJUGvEHwE8jgqGVc92UY8FkrPX58qpp
	ByRu6XYI90j4QIa4VDSda9bGwCewJzBIPxz3T3OHKe8KgREnK+Itu4IAnloJqBTkIKoHzX/xvQK
	lpY80CBccWJhPr+j3mIaAZGeV9wCgoMD7VzWKo+dYGyAFgnBhMA8kgH2125C9kBiBpwyY4li2Sk
	V4vFXWc6LoJHPeKZhE5BLuOe3i+ZXS5PJY8DOLpRVX4C/nzCyCFyxmxPFGcFqDlsuxp9oQtFV+7
	7bRO76sg28Qf7F9oP31QjjcOreZeB3C9snRhv4Ecg5OPiaUynnQnk64CDAUNm0s1kkum7ijwhf+
	48u268Z0RBnB3/wNPTi81im03W/PVDB6NEVDDOWd5+OL8fDyBajD7GY4O4bK/7L6Q2V4UOLpm3t
	tI=
X-Received: by 2002:a05:600c:1d09:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0276ed19amr37928025e9.29.1790934587622;
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm52146605e9.3.2026.10.02.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:31 +0200
Subject: [PATCH 2/5] ASoC: pcm179x: Refactor regmap value lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-2-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

Use a table lookup to find values for fmt register instead of switch
statements to prepare for additional codec variants of the same family.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 60 +++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index cb70927872aa..61b87dab3266 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -65,6 +65,31 @@ struct pcm179x_private {
 	unsigned int rate;
 };
 
+struct pcm179x_fmt_table {
+	unsigned int fmt;	/* SND_SOC_DAIFMT_* */
+	unsigned int width;	/* sample width in bits */
+	unsigned int value;	/* FMT[2:0] */
+};
+
+static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_I2S,     16, 4 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 5 },
+};
+
+static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
+			     unsigned int width)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
+		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
+			return pcm1792a_fmt[i].value;
+
+	return -EINVAL;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -96,40 +121,15 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
-	int val = 0, ret;
+	int val, ret;
 
 	priv->rate = params_rate(params);
 
-	switch (priv->format & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 2;
-			break;
-		case 16:
-			val = 0;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case SND_SOC_DAIFMT_I2S:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 5;
-			break;
-		case 16:
-			val = 4;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	default:
+	val = pcm179x_fmt_value(priv, priv->format & SND_SOC_DAIFMT_FORMAT_MASK,
+				params_width(params));
+	if (val < 0) {
 		dev_err(component->dev, "Invalid DAI format\n");
-		return -EINVAL;
+		return val;
 	}
 
 	val = val << PCM179X_FMT_SHIFT | PCM179X_ATLD_ENABLE;

-- 
2.55.0

