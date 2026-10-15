Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2B2F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028842; cv=none; b=Nr++aiexBTBGZlM/GkSLnMgD1IiaNjdX9VT+ANB+qGNY7YMfBPXGUfm35Lv9nHkWavjN8+w56tgh3OVBZyLGwtCWF+dJpB8cB27mlfqLEBy9JbUJaaKjHjk7P9QK+sC5o+IG1NkwxGC8Y4+6lQVaIyE1Lr3pC/5fzz+EXV/2xNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028842; c=relaxed/simple;
	bh=HfPat1LNwNEOWJNqkwPd57O97NdzuN6vi5OJFTBpI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RleURfE5GfwaYq1uaHzcKfaNfwU/PM24UbdKddXQkDDoTpMplHjYsNSJXWN/V16Q5GbVZHMys9btpBwt1usbkDg3ATkq3UOR8WqW+aSL4mRHY2lyyT1HyP7XXYZBwqOfSxm3ZxIU4NPm0T8/0UIsajs3ceTgnAyX+T9NCS99wCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4stlHh7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4stlHh7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e6038cebefso35440665ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028841; x=1792633641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=P4stlHh76iKlAkTlSTaEMwhMiKlxVlx4jugbh5SKDJG+/k0iytxzwTsiGk0nzeRhd7
         BxBSN+pWIn0shua4wjWu/KvzW0V5SpAEZBJ37KN7bhr/GGb2D6fNv1PIrptPLyQCXEr2
         eeZg90zIRfyOCXGc2CniY2nOl+bDwha7nGNj+jBMytciEyT//B5u88E0t1YoxfW9OFEG
         oVqzlbOuysSEouiW6ZHv0ptF8Hu5LRVwj4+Gx+Oc1bdG4LlUER9QLCfZkQHPk5sE4Jby
         1wlAyomaauidajsbnfaDhrjVQeDfjsxMQaECtfORGZMlJOKMLQBolerYWxMb2zyJQrsy
         VQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028841; x=1792633641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=D64Rqwpg5tSoIhmEbMnFbeTa0bKCJQGoP/ROTqWktEhgZ405v96hU5+8fvOc5AeoPV
         J12kem2Lh6ZzaQNAKHGw6WBde0xXJqFr0I6W6rFrM5qGK3hqe1X+qWQowQc6uptn8jeL
         EQP1vPNY/dIUA5vGJiaomHg/EBx1Vrihv83wYRTs4rT2qGwruag4KM8VUEFJcBFxHPQr
         +gNcP2XoJSnnp49UUPrYeWODY3c2jwyBPx4RzimZ9dqotzseXgO9Mg1vc9nAYZ0sCDOm
         eyTZVm0g/fXWAN8biYb2tipti4X5WP1xwVwgM3ckWe6C6ftAs+v/5gcvr+pG97C7xNX2
         /UQw==
X-Forwarded-Encrypted: i=1; AKwUvBwYnjfH4CfZV1NJv247Ckr4iCU14wzDmayDE1J/gMmjrIVYGAD/3ttes/Zya0pA3J5o+ICVskrl6i6rGCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXqjZl3rAINbVvVLPR3OmenRZG8CPFyBqj+NvIzA39Z4T6ckzh
	NzLAqcOF/kFWq+tnlvWq/AE5KN4n6UmbsKTn6J79SsSJiMVOe4ZEwC4g
X-Gm-Gg: AYBFou3GsgUuE8zteWQtmUK/c0MdSjXqh4Yy9Ww6IWSY5XiEbuc4H6LRDdancYhmyfV
	WwvBSGq6ZxLHEOZ2kpBlv2qpLeO29eLQqFUFGDaDwKvIt98EQ5T95aZy5qrPCsDHbC5/GSVVGZ2
	Kz3CpDk13WoWDxtz1uqgwm72ah/n3p36nQ+9OHmaMBdXMzeXngNFU3YmY8kXRFh6JGUV8XYMZBN
	ptCHcfsYnZRgVgTg5HzzlnE2QopHyv0fXTmxYsawtvTwHEUg5/pwE6VfniBrHPSf4n7FJ4+v1f1
	tt0gUV7WQyeGEWaDH4UwYRUjy0iKruQ5HBRa2S8sjYaFTCSnYzYGkR7Mn+ZkRfSwCMYRcyEpvNI
	66JOqO8h5+q/gCaXsoVyoSEw7LdHVBA/nNNT1mW5Gh1XK9kaZrQjjFH/bLr7DM3l+/yCdqZaCS5
	eug1IOmi/4l5FMzfkjdv93RrM100OVfxwbkNtpMFRXHaBqRcONRbdfIOvg1z0QNnDj/WvC2MmoM
	4a4xBOquqGVMpt1gaJ7Gvz5Egoff667EKbAAxxFEuH5XauV8ps4YH9aIa28Efxjuek97p4NNcbv
	ikI8PnTSAjj8Bw==
X-Received: by 2002:a17:902:f54a:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2e9628df363mr1150385ad.26.1792028840848;
        Wed, 14 Oct 2026 18:47:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:19 -0700 (PDT)
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
Subject: [PATCH v2 12/25] ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:11 +0700
Message-ID: <20261015014324.5569-13-phucduc.bui@gmail.com>
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
from nau8540_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8540_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8540.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index d4211a76b096..09e7f31a904d 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -419,14 +419,24 @@ static int nau8540_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
 	const struct nau8540_osr_attr *osr;
+	int ret;
 
 	osr = nau8540_get_osr(nau8540);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_ADC_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_ADC_MAX / osr->osr);
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
 
 static int nau8540_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

