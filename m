Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBC497B6C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456142; cv=none; b=VDTdbveNAjK4y5hEJKiQp8lfkb4oKagwDlOcWOLUx+2/w/M/XTndPu6VCTmN2xKnXzNwlzCjynLN3/nqbdr+XgPitojlSkbdlXjKNL+7EccZ7cA4KdR6p5hE85VybDotwyBrNLtaT5bFRe6re/OHZetrvrXpvmIaNX1YAqDenNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456142; c=relaxed/simple;
	bh=6dFh3KYbxtITJpRD4kNPYQg713kSVg+CYVFiW9/LyIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCGC8R92LjAozbE6U0qFMyVQSG8j2xVh7T8HP7wHye9IA+C9OSLgJf3LrSeMLV2Xgqb2be1kpy4iYpfLHkWlxl93ZLJRIIA/2ixHqA/UCbn3fv2a6XXO8lJ17skZTorltUDA8aTd91xGzXYtU7vsM1Wd6WtqC+hSK11EtC1GorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlMjk0/t; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlMjk0/t"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15943c9c005so1850521c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456139; x=1792060939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=YlMjk0/tPe5syvZERUokFN4x0f9x1azhRPRznbhR4w+oVtneJuFsWlXKKnoAS5OQzS
         0cId1lznhca7JFP/FXdzJA5L+TW9sZpWSKzez9OMHDodODINcVOMGiL+7XTGAQMdVqhD
         ybD40uu8LN0VZfUCahLXx3rfPFFNfpJlmXUR4t+mI1+yYwtmrGHI02ZlGAoTN57ROlgH
         6PQ+XLiyQLrF1y6eB43smRyV2bzv3jiZF7PIqOi0nlSfd0RZ8C7xAA20VbxNq9tg6E0S
         +JyFyc2Gzw29tOwxrmqkMdihIL3PWWdAzEABJllMcRrJ8kHmIRqXBIqTJndOJbltM4t9
         EDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456139; x=1792060939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=r2JB+UmHEd/8/UjvugoZ0qB2XITdHvirdHtJ1BKMEud8qEyvT0h1Rr0NPy9JVgcyxQ
         Nfo/1r0Q0KGlkxTj5+bBBdL2G4W2CkVEBoU9h0lVpc4fTnXiAdXMI90dN0nVxhOpAipZ
         tLGsETjp8AuL3JCiJQVLuRrtKyMdKdWzzu99BtACKlz/3z4OdAXWD+r9tCVSDHXnH55K
         0ccnm3AxN8DRx5nVXykpHgix52A68JBjp7Y7F6gKNVRze44GURRChcfBq38i/SU8REZa
         ExP/ViMeATqCxDg9OGcr19/sXNnNLEusvO1e4RBr17R6c/9r48GXrzO9Ke/ZZBAT8Uy0
         D4sA==
X-Forwarded-Encrypted: i=1; AKwUvByR/BFCrPvNajmy/QeJBrz3awIhrn4lBT6ylGyTWX9D/WVl2I/3OGvNDlivMC04kerPn/biDzteB8YDFiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nLx3bb9NYjfPQuPJ2TvFjAfW/nCcgYhdCSFOk4GH0FK1EhFns7
	GwnsOFlHaeBf7yHVWeoKz6nd6u5GiPwN7JdR03Tyi+G/SdboDHwK5n2C
X-Gm-Gg: AYBFou3jrEy31xARv+bP6w8UqWbE7PX9t4QPCdRFfWtnCOKWQRy++KmB9w9rSG1Dm8y
	CLsB8S/naXBU5F1cMyssA9F8a6aKSBflUGa69huVNJNIeW2oLMn8nB7rt3GUtavS4sJB9xuhNYQ
	VITr4HT0pqzNIJbuBtP7OGDDxDp+JFcBrZFb+dh09WMfiNSstgElp541fsW9VkOqbzFhQhTVu4C
	4M8IzEV+WHCnIL4dlxq9uE3hwELxWk8whCYtu+btM8Tk12U+hQ/jxwPwvDFO63My0O7ZKZWptsH
	Y1p5HKyFouYnX3OyGa9ibhyf+WJ9apOlTI7wNXlGNzLSi/ZIIyUTijLISmwP08ag3S990BRSMjJ
	y69/uYIYot0JU36w8mVTgxrQpuJPsHjA8p+xiHlTwxlCFiz2O4MgcIWSV9dg9HXpSE9qf0dUgTG
	vun7O91HdJlllGFSqbRZkHelwNEMi86cP/yfdoKTT/mRJEjj4iWqImADVMIm4PsTSG2Wd0CCe8/
	5cxpQwyDiYZqWCE9GBPMwmQN01OqhaCM5C2O8Tdxa+ScRnEW79VXulrC8ljPPDH3MNNHAO3c44c
	zt7Y+SMRs/2fUtM=
X-Received: by 2002:a05:701b:4501:10b0:15f:6789:2c2a with SMTP id a92af1059eb24-16207d7c2a4mr5290246c88.36.1791456139402;
        Thu, 08 Oct 2026 03:42:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:18 -0700 (PDT)
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
Subject: [PATCH 13/24] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:20 +0700
Message-ID: <20261008103831.542533-14-phucduc.bui@gmail.com>
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
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..935df063822c 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,19 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
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
+	return 0;
 }
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

