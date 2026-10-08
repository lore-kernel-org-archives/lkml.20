Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71549364C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456067; cv=none; b=MzGvoZ/TFWcbSlGcrdJWn6NtK7ZNhbStNEOKWz/x3LOk91jaUTX+FdaNVmiBS5W/Q5XMrit+FIE8sqrkVnWsvj1FiGyn4w87iPlKn8h/Y9PvB3UtDhMTCBMQgUfbacGHfqEDQBcs1JOTKgFCTwWzZtTxzFQkuHmcTfnSxogW1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456067; c=relaxed/simple;
	bh=Z888BsRACHc4khVghw71yqQDS3j8iLQcHLU2iv4UfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRwWO5yoD7NyoKaM4PL6txR+mXyTaTenmF54wEOOu+KQ0EkEO0apEy0s73wp2W9olCnRt/E57grmXglshb812iQ7wKermttfZzHb2SXyb6vTaWjJ4PeFZMdm67Rtok+vjWYM18N0+SkHJzJf/ubOD9rcW7KU+wppiQfkKw3+Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbNm8Vvh; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbNm8Vvh"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34ceab2900eso4963740eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456065; x=1792060865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=KbNm8VvhkpiCrKqc89Fq4x9OFB+UNKL+d34wYccd6XOILhvesojNO6ZGOWE3YlFruQ
         IQwVZtXJ7YIv1iDtJ3vSYtCiYoPp6Uk487ypZOJi68zwYu3XLls+Mt2b68GVnGT2LJGs
         dhgCVOGZjqTWEYGrfUgqGt1TCONEB/Zhy33T71LL79sUi+VBgwXyXMAmfQO1z33xvGvV
         H5UqAaZkFDn6UZ36FYSFGTmd1d5CaKrlEn2x6YmqDkstSiG/3epK2Unmgf5JwwGnbB+u
         Bozz0Sy9sjW5Z0ef6UIGnqIHrFg8PDJA6i26vuP5S6+EmXy9ZMyTR3PO2ZYHUfddxLPV
         Wptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456065; x=1792060865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=UF+Ka+YKYDQsnY4ghaVBikhWx24Mt3D1pzczrroWV3icZNbmvkDqIjKH/R6Exn+nuc
         UH0+HpKdFYb1XW1nS8/oV56tJznZ7K5/pO7tz8tpNFRDvq0juNak5/YWx56MGlK16NZY
         GafDKu4vHiHAlfOSY+8LU1OPngO41NaMU70q2jM8Ys6QtGVP34D4ZHnP/VrWb/pu/SA/
         UKDvED7VytSZADWkMw4CSFpW/7tu6VsqdVpxK5uSwrP8Q2Ir2Y4fOmbaY+oXD4XLjqHX
         Q/pDIwVsCXB06TgjT8E3dKT2tE9aQJEOFsrlj8oTYB89dxF9/VHWBITSvUAKiQFnHh8k
         yzDw==
X-Forwarded-Encrypted: i=1; AKwUvByecoiLsiv8uoMWvTpB8+Lx8KfkHwn8IeRiVMOMMYqhXsbT5bXWsc209hBuWOLtveYnYHKN5+Hc1G6fzGo=@vger.kernel.org
X-Gm-Message-State: AFuF++m2sZlCXzTsacdzj4pdt9NqVjOE1tP2CJKG9SoRbXDcX8IJQEIX
	pzhT0FcnsYGw+Lq1bvaSUmCm2CP6vjARS8648+hmc6R2dmHK/J8EDVnT
X-Gm-Gg: AYBFou1bPHSx6N+ci476afY5/Wrrqy+Si0ovscQw6ge11+hDfb4ZhpPPjJzb/VcCgpe
	KD5H95KVNu2IgupGWSnTIWIMAnY4JGcCG4S4cUIn6VIXJJulyxfWmCwL+trgACXru9ZvpLBvic7
	Rzy3bvDIvFFfdEqQ1DvZDyoqQKlMwx8t4ZaGcYQzXT48uVBQTA+AAgtbhcvCRg2aFI7HBaePWaH
	Qe4VKwcWTGz2U4GCuzhBWDya7y9uFHcakovXGzIp1eqAEjdfQBqtDxV5iW57X5sC9dzDyCjTyFI
	6nYUVAGONIhLFt05ZnE/oPgKHgysNaAFlGKppyIHkh+tZ6mLCDEzfdU2cT0qp7gFRsifnQq7zS2
	+1oOC4R2RbpDcYkDEMTki1ZaLKJtFY5x2tJoK4btBJeyondpTiY0GYTxtSUK6nUeNPUPWHIY6uW
	IXIqus/ZUoguSZlVfwSoWiyi8uZprrWYCIoSJhBKmzrvIuuBOCePN6xceBro9yJp3fDkQjA1g0+
	xIDcuDKJdjhjEJtu8In6GeLZB1SIp/5Y2patLA//cWV2efkP/YtlwfQWCfA/K9YRzcf9EUIAxMT
	8yY1CYzbpNViQA==
X-Received: by 2002:a05:693c:880d:20b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3515db9190dmr5490986eec.5.1791456064946;
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 08/24] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:15 +0700
Message-ID: <20261008103831.542533-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..3585432ad49b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,13 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

