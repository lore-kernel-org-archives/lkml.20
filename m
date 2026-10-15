Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA3356773
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028857; cv=none; b=lg1tx9+C/hbP1DNom6V8wfKjNSVUg/le3nrP78iF5wrL3JAQgQOxpszJbYNTLBzemKNXeCwqBxUf7tyAS4UFbqMv+lItxlxk3JceHGjf1TAH63orHHsq+VV/d46j6QGvbZkMGAYtt5dyHteYWA4HxeAmKSztwAnnnvonYyZbsPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028857; c=relaxed/simple;
	bh=gbKxRXgxq8DVqFsIIwbQbc//22j1RiqNWHX1MLDGpQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIGkqH5C6bnqoXYs6cFcJxW/b8VzoOaw6vJd4PdIV8Zt5DwUrFHb0YBqRxF+cYFHVIyXW7vPu1PH7HGqeYSLw05LkpCRUypQxDydigc3RAdDk1JWFs91Ct6aHU9wmIQQ3A6ovAQNIFtRqVCtesscwlyf9yisPqwHd5d9reFrGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqemQCCT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqemQCCT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e86dce4510so24249405ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028855; x=1792633655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=JqemQCCTBrUD1u0eGdaKYB33QiRHVE9Xocx/Pl++ZPPjDWCFyLRdbU/Zrd390R3Tax
         3yngDvkyw1zqoERuNHGwFWwSGvI0IPJanw5rjFQL/rtgcJ/Q+mM1lhGvARh6NpDMNyZZ
         ztvQEkiOGZeQam8/i00bsCThd7bs6c8YjftnwuH7XS4qYLU40wWauc8r5daMHAfTZ6Zi
         l4wPiP40Xek3cJYXkWEEl4gG5yVlZAIP7vNAgEeKaMi3qk/ACsWKZe6uwfkOcmlqOjIh
         ZpOUKiUTzT6T5Pau6rSLR8hv2+xbFVDgJmHy8aQ6BYobRgKF1Ei5M90MHF+AJ6p+88nX
         FT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028855; x=1792633655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvYpMSlsoaD702JqdWz6T2bQ1dialbnMpsVm+cSYlj4=;
        b=AOaUXG7zSZzbKc1YVO68lA4CE3/cu8cyQYzvjLt6Qf8nSTiXU8uJcLPx2Vsgr6uAQp
         rUO6NKabRovZcNbSbtqgBtC1nGFeO6Oy/B1Qfjho2fw5PLrXmQRlTfwe48f3+Tmbf5Gc
         /hIhBobm+40ryaqINRCApFj/5SVpXxhh6ZejnkB5X9aD/wO+UWO+dQHSjgSQruPamROR
         +JDe09dT/VXZazwyv45eCoMftoGsGGswjdnNADE2obXaTh3orbXEntgWl1X/gml8WFS6
         R07N3WCUJio70jVjfSOauUWHbfCbwGnQPc46dI/dvIj5DMYogf0X0oXhRzcwZR4gOJFR
         pYYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx0ONXLprBkzALqMP/N2NrwUlaioYVTA9YF+F76n9T+t8c/ftLKfyzUXc1j1W9jX/sMbhfosTXR5bFqog=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkBVp+ak2CgyUO1bfuSWmDu2PkcTHzJi7Jn0zgK/zZcnOoA2NR
	y+szeWO0i9WjOLVMOtYCsc0v94qBtG5IpayR0aUXe3W4yyZM983UXviX
X-Gm-Gg: AYBFou2CIj/FUGrywa+kJcmMOGbaJ18LZCeRxEUJHHfZ/3zhwTB6QACZeuuDiy8sJQp
	e/qOWNsikOrw0TrkqBJb631dCA39Ff/2laxSQ76MAuhJlYG2zCTbGAH34uBfqo1s1C+I6JjIEjW
	3UmR+H0abBkJ1BnPRtdoyJKUgmAxVdZ4jISxB7r87kVDDyrNPZZlKFQeH0DBzJtx4nGtGCUiabX
	8Imii6DI7mzYvZJJG6/zmJXO4eZ7sgug9MUSjnQydnm5JDx9mxbbGl9CE7gArUIW0uXDUQMNo4x
	6fcEJSv1DZrVbC87+tIwtl5IAzMvpYi1l8r73HN1QrM/8fd2qhKvBAWlozLa0eiAH+qd8y8nQbw
	SjBFlgmgMvULRTdm6CnRCMGIrVmZ5UKwZQ3gTgj6KyDkrBy8ORiYbCv/IvpLcL+tfLJdmokvrlN
	iNOyTZc2PLnxyUzznIpHJouuz1+9kadiNB/EKj5FG1CTO2l9sVc80lHUdI6qragCjjpDjfgRmvk
	PiunBp1JUxqNT5yBnjaWzfrm113m1XgosCbHzDkmH69fqZD+u17Bf9Ksp1dARlGEkvb4+7RbX4t
	+0SEC2iCjMAq2A==
X-Received: by 2002:a17:903:2442:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2e842dfd28emr133980465ad.55.1792028855139;
        Wed, 14 Oct 2026 18:47:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/25] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:12 +0700
Message-ID: <20261015014324.5569-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..7b88ee3159d1 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,24 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 	const struct nau8821_osr_attr *osr;
+	int ret;
 
 	osr = nau8821_get_osr(nau8821, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

