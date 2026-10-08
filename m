Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EED496D53
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456096; cv=none; b=qkBbw4z6J/9/Y/HHaMHJSrIixfnJ2/6LAvZ83aCVaDKwm+92MwwHmZExxYwhqTe4/z33HWd8/kZ2O1nK0O1aM+GDQ9Xvqyw58u0mBR/ZaVjybtyFQDpWk7FG6XFzMJj7xd1yYtiaWf1dARSYKHi8wYHsELtJoWMsw8nkejlXHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456096; c=relaxed/simple;
	bh=8WzS97708KAARSjGgVArWT8GbYPNjIQBiN6ygCWPQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xjf3hHJet/+0DipVBP+Ug1Lzdz8UkuvXCdx1LEGFy0HQgUW0juyarNxY4/0rk3IXs6WueTZL3AWrBUVB2VsihzEy/Lx0fRLvUOEXR5iGb664Wee/4U3EPfrcvmJSN7UkabaqG0IeltzFm3vWMe1xHCSsaePCHNUD8ThwbCEUcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6OXi7Tz; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6OXi7Tz"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35120d43ecaso7721190eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456095; x=1792060895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=r6OXi7TzeLPpQbqtRW2lLaar62xRarbDRoQe8nt4hWHPDqPXlKsATk8hiW1xH2+bHT
         VK1ktf3ObymrQ4He5l7Ws8UOTiKYSlXrSrZKGhjpttOBTdPxFVLL0bfY6FRm0LFErW6p
         rRip4qRd4W0ohLLtZCB5Ot+uVgHfSVhvEjbicKmqbUDLtCx7N1scgPN9Uz8qAcs9T2KP
         ZDEkXOZLxT0fJv9uIRHBOhNXDFJYtNQqGxoYS8Yqh6LgREnPLim47lieGBW9TkqClrtx
         /NPgYilwX16ROwF7aXXvCgM8XzknkApmf2JkNvTcsQvO4UJCNIWiypTC8ugUBgPg5ShW
         2/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456095; x=1792060895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/S64Lx6xVOJYbkzotXNTKtSzFgcjJur08r/Jkt4vOs=;
        b=Wmp7L5l/hop9gPV/Pb7cPjx/8LjCK+6oW9492DQvPDm6ZbD9a0yWImCsZVskvTe8mX
         NLBXi2GXa1JhxtIAvMq3INiPp9bDUOkUFu3NZhnGhYt7KnHcC1yTVd13oZNXt23mkLnN
         gFbq9s46UYn9O3ukGKqKegC6an/uiGvoJzMdAHRucNg9acn4k1Wj/pv0nYC2aVR5ipFT
         uMsiUrfvdtp9ytXnq2fQRpdio4ajMticMIOwvdkGqwew+pDBJvNKA6qEoiGz6uuRoZfr
         3c7sqHXK/HLAXGR6kGaZWBazOOUyae6f35mvjkRSSziVfSxSI4Cc1V3XPZ2jIBsePMpU
         ujqg==
X-Forwarded-Encrypted: i=1; AKwUvByyFOTix54sAxxiH6/9odpuv4qJmoJFFdZWI9lqtSq7aD0G4vBU8StKA3fCRPKf/rOz55z05L4UPJ3Vr7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kUJ2DHKMvofkIlJ7ifsTPMuuLIbck4ixSOQ7VSG69xtoiUFpjB
	Z62qyPRECwjQ9dHIw98fNiqnj6ak+PlHVjacVResc2g1SdUFxZkccOfV
X-Gm-Gg: AYBFou1oEJaQuGhJIdg11MspWCTvnt91yaEckQY2eqHXvTb+laWWJ3FpeG/NzEN2H9v
	9cASJ7u7rrZuGNHoecAhkyD8pj99SEQFW3JV9p2g/2LNV712iDXGz+tMcGW3ys3l2fzv+U5QLaa
	YK0sQ75W+Skygj8jV3UaWgCt/34SQUi8IJ4PmuU7xceY8JAidbv4yuHgrorvCx0fp8eN46+UWFF
	aXRb+H79Mj1QnV0dVaWZdQyMNHwbs6aHubZ8x2qVL3B+RwyogyPhLRUeyT45q8zBV5CRxiuA/ru
	Rfmkob1hJ08BZDgZl1lbz6/o4pD3GLfd3idVo7ey57/PiVu2HF6Nh73ArgW3n6UWqcZrFp+Gdlj
	b9dGsnDvODazlAlbok/QdfHVvFbrgZnxl0qnMuV0TO3Ml+Nxc7NrpzZhPYXIjzEztvtLG7B2Icq
	8o6TKjyPIpLay40eS7tUp3xb1U+rIdDB43W7RWD1UWXybOtt0T4Bxzsf9RPh+HbklgUnsZiNWxU
	TsLCuyoiYfP4ZdCNIok8nrok5MoZBfynofEYVkXX7DwL/I4XmWxbsJp/dOi4cNI2in1xdCECTMD
	g217t88jOZr/nQ==
X-Received: by 2002:a05:693c:895c:10b0:34c:7e54:65e6 with SMTP id 5a478bee46e88-3515db9c59bmr5695422eec.5.1791456094502;
        Thu, 08 Oct 2026 03:41:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:33 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:17 +0700
Message-ID: <20261008103831.542533-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..f6e4bf6206b7 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,13 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 		return 0;
 
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 96000);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   44100, 96000);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

