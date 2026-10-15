Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C60325F988
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028930; cv=none; b=SwhorIwnLSu52ypseyQ3o4ep56NfbdqGEmgSCEk68SBslDbP63Nu2ztufpvfvyZ9JM2Jo8RPAtpozH4ZvBde7/8CH2IT6AUGkCtB+4PUaPDK1jHilkXdZNVQ9O8dXFMzrpayTv5+3xwEnorDLZWqYiQnngV+yu/Uo12uWMtJDIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028930; c=relaxed/simple;
	bh=6J9ua4kM2AQ1AbmDRprUIZcBpH1X+E/0V7ZxxtKcoOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYBuZT2IPwlE+XWuHgbNqr/ho6ZRhAXLJQlJx8jTL/Q2CVzHqwFD/rtnRH+8admZ4yQ/O0h6aG0P1DBEx5zawYXmLAHx2eZIjn2wafQ/OCCdDGkYFr4bBWmgpg1ZquRIGx3X2YuKUQjEQCvA4hLJy0o7hm5CyRSk4ca52i8Kayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz/KO4az; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz/KO4az"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e831e86ebfso8954035ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028929; x=1792633729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=Oz/KO4azwkMDM2jNYGf/puHJRKNxYgmsxYxU1QO2pOpz9q0GLi2IcyOPnl3DJxp2Ri
         GIx4jHXhU/1Yw5DOZr79Uw23kttKizck9ak8zzsCDNMHHmXHiVqezgn/1dT33z3oSFL6
         kJxzBBYwkTfAerbHXqETA1+FU+nm3CV7IxJREqrtKUtp9IK01C7GYq+iYRDZ8t6INNEf
         eXnWjT3elmXZmgTU/bxfN3zsyMPppnAlKwYN6MHOi60/UI0565QEyLYCsNA7GcO+eWHT
         j2qsWWGXWqe3ILOcGhTzrtEe2Divq4LvyvKuUHkE6pJHs1iQGOOcgoKTg0KNsuuq/T/h
         aivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028929; x=1792633729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=hZyK32+pw8SdR0ftCyDMRMmlGuxN42/obZqa2oa4I/728jCqojWin3DwjHvUA74Kss
         vzXLZ0jdmwX3eLYCgbL/dNYT6swWRBpP+92ZIAF3BNVQWE3o0G0IccDwnocD5qyfNXEa
         kkxeCO2iduOc7I0xllpwl1IIeWaBwpXcI0H10vbLmShPSRD6eo2/yltuFx2+PXP8iFpJ
         oXDN6llN6W7JF7CQHz3qHv1eUy3TlEFS5YcPUuwa3bZIQu0Na4hEk4Rgnw39jYB15qCa
         qdV9pRoXTOag5PedfWMtkbZF84dq5KcK5gSPBrt2H0Lwwrc4v3mrywSYbQfs8KRDNCnk
         xbeg==
X-Forwarded-Encrypted: i=1; AKwUvByR2RUSsP/DqTdo4ncnbeJfkSv+wBAHN0DQkjYs3bsXdNYdFCXQYmokeWkrCl8kswDyCUquF9EA+m0PrKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDlyrbkBK6G2NUoCicsWYAcwFiptnUosdDacaAKawoA7b+Rcax
	yBWav9of3w2p33S9Ag99k2ofHqUV3wK2viInUFqM5hI3jhcis8CFZIqc
X-Gm-Gg: AYBFou0IeCSU46uGHYU3kPR/JvLjaDxfgxhKGKqDLcGH7Z+rMWVSkxLdjwSAxa7mVYR
	22WV+2KnJbXm8Ie3Gcuky9KLh0vq+BM6PfVdu6ljlkoJ0TiFb1kARDWdGZfpEtChW9XyDsWhvdr
	9emtfzhwo8VluOR9bFVP3Zr9WonRIhG6X1kGVUCITP6u4Ft6j4f255fkGVs92WgrOeIcnNLxZ7B
	T0ViC3T+5r3VO44p6TWaqPtE2wA0bOGe43DzeL0DX3iodLFkjGAUj8LHf9vZTTQNqLl5KCwtk92
	kwxQX8rhDfnUgH9au5oxWbA3K2AJKHPvW1cy8s5nH6dGOG/gFzl4ZIIWeRS8iCWmdnxCRapsOyA
	fNA2aCTlQodljynH1mQSji3akd2yyXPstCjSlC1ETBq+7wESV1oyUWyMkj6aoqi7iiDb8Z1Xgcw
	Qbof9gY0+Kyb0krJH57CsUqu88pG+/ihYhev5oFxfV8bF5i+EB84/+Rsvgfq0D0j97VipoHcp86
	1pDlvC6l7SLqNuAG+sX/z9L0iYn7XhvpU/ECuDsI39n1ezEAwImrryPPj+okDR0/cfOTLnTxg74
	v74AprxF6pZlVg==
X-Received: by 2002:a17:902:f786:b0:2e9:3215:c458 with SMTP id d9443c01a7336-2e93215c642mr37739115ad.25.1792028928882;
        Wed, 14 Oct 2026 18:48:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:47 -0700 (PDT)
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
Subject: [PATCH v2 17/25] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:16 +0700
Message-ID: <20261015014324.5569-18-phucduc.bui@gmail.com>
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
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..cbf0c823c022 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,19 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
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
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

