Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96E497B87
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456283; cv=none; b=YxNUCMuFBc4iNbDbGSOU6JYilx4utHzXLxQip8nwBBgVcD84JT1Fg67VndA0KEM2IvP2+CN6m3gk0U08sHdnywC1k7iQD7RCkmezJX5tc0aPNFjKc6qh+TSBD3RaGhI+at+ujUzIx3TFxFScEAVtF67vs0/hoWxg/9n5v3GPsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456283; c=relaxed/simple;
	bh=/jRAX7L3FDhAWoeg1edR/HgTCfkk5hY6WPOCZODpekU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlPY0gz91Wv1PbZrhKYSqOlLb8nOKhxL7FqB7nhIoZE8idIM2Qo3BlZaCGCDvBItl6617nzafNYnhdq2SN0qIKMnBSvmwrxTBkRXYkG1Yor+8asD9BkK0ZHInWdhvx57g+RKZB2wYv8HIXHXWJyvM/dwwoXUHuV3K/48tql+iTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO1v4tJa; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO1v4tJa"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so800570eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456281; x=1792061081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=AO1v4tJaxwkzdM4IZ+7TWZ+XfabdxVVMjNxPIULvWcvJeWzdu4AKdB/i4Iro11vLBH
         GqByD8c8i1ykuXKES+sTiN765mu52lHluAhUdoxA0Od8//Z1YN1hI2vx5FWlQ43HfV2U
         JMlrmUPpU5nWPKwLOywL4g+TfCyETj7PWKjJx+hY1uNZtjljRNt9obWImP0/WZfx1AmJ
         AMp6ezrX1JXvPfVPLVMlY6W1ULiEN5BzeXPfMkKZnhoAEcp1uVBSqoy9OhsrrA8h2KCI
         xjTwbxjRFt6uXNE6F1zvnie0+1z34sXkpf2DgUCW2EodPje8Odbo8vIAEg368bcPXmrf
         6H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456281; x=1792061081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vINDjRMMYaX6AakE2nE7lJ054HdL6sHwsDn4uy023fE=;
        b=e0XfGXOkOKGBWjLDIZCwNpY7O5+bB3AABVhTGphBuf7Cs4iQvBsYYU/Luo033q8SyB
         Llg7kwDAmqtETyNKzZIT1wUo1xpDaJGcz/mGy1WIsRIkV+OzaumbrvhU28byYdxOjs5M
         mO1LDOIIdSYuvUdGqhm0U7PKj20gkVVxvFAenvhGKxaJVUmdq/qYDJgV9aGuIoIvsXxv
         uhL9xCd3RquMY3rzYgKjzKHoNLQWGrhE2PWFWe1Zp9+sHFbo3V5BCPWiNBfXl21E5lGW
         NAI1WJo2rbwjYnjGE+E5Gs39YkEp779NbuYUd8a7VZNVVPubjpo5QRadhWsCOEsnF+NP
         Bl2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx98guqCrX9Hv27vL3H07vjPMHL+8/eenZa1xVw66zxnf1bbLkg8sVqu/15N5QBhZiZf0N5gFK3H4j96tE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ53lFDyfsq3G79e+Y+4FGE/SOH90vM5J5wOCx1/+K7UjwLZAUV
	Pajui646+mSelXc2TiNYZwugP1OreIQ2BCPIW47oZwNlLrR/jbIDUgln
X-Gm-Gg: AYBFou0uVnNy/Dx/qCoH5hXJyCSjYJ/J3wxo5La/kp0hTeEUGdzsB0Z104yK3Zjj2lu
	Oh1P5dPVSfAB+6G1F3Wf/JiKKs4ZNqzQKrPXFTj2HddqFJPSKER7bOpqHsOjFR9YHpn1lgtPUUX
	HVW52MQ00X4RfvUX2N+7OeAj8C/tG3S9g7y4Esp0cz/nCdXkWY17JBCFPB0aykjhmTh9hxNBQEf
	AlAhexNnuOZJ5oKlIWc9eGUcX5KRcy2JtrEoWbj2O3iwUVlDASU3hlwRdNo4QrrJPuMdbp+Jddz
	uDSuThqNfhTZFcklGUHPd1fUvGEHEhb+g7tDAAcLNWixkQZvs/MCiDE3yiRAauGsD2bSNBf1V/y
	rE9NuJJ9TrR3SHdG9yfn7RlbnZulbm16wCLNvMqGfDE5NevJdyIYN0Al4wdDIiLhMek57D3/Qqv
	8pKCYdfRzF4f4o9R8VfoTHTN9FcG1Kn+8xZbJd1yb+1GOweklJaPAQi/IYg5nyJLdo81OIjhH7p
	7TEuDd6xN5xDJKq9ngxQkWSybXmSoj8d2/pOqRNhwzYkpjotgyq44ZKWNs9twEwKmEdBjz7lMCt
	suyPaIZtKCnKIb8Ww8Z0woWq
X-Received: by 2002:a05:693c:8801:10b0:34d:861c:99b8 with SMTP id 5a478bee46e88-3515de37354mr6607922eec.21.1791456280856;
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:40 -0700 (PDT)
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
Subject: [PATCH 22/24] ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
Date: Thu,  8 Oct 2026 17:38:29 +0700
Message-ID: <20261008103831.542533-23-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from rz_ssi_pcm_open_xx(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as the component driver has no
.close() callback. Still, return 0 explicitly on success to match what
ASoC expects and ensure the component is correctly marked as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b1587f499cb8..2e297f721bb6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -937,17 +937,29 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
+	int ret;
+
 	snd_soc_set_runtime_hwparams(substream, &rz_ssi_pcm_hardware);
 
-	return snd_pcm_hw_constraint_integer(substream->runtime,
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
+	int ret;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
-- 
2.43.0

