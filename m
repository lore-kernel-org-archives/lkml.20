Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C836F42D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028945; cv=none; b=liDwc0nnb86BTyCN0+srIR89YUKiN/yRD5CaovxZa/SvY9+Rev0AySfm7MPCucdH/vgaGxs9qbWQVQ2ljeCcfzGgwrDUkvWiPU+IXsIMjs7UYV9fDOZT1cALTKDbrW9ZMkrErNfXV4PxDZrEJtLkVckZMHuvoJ0J6Ml8awBPH74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028945; c=relaxed/simple;
	bh=DUWEL6UBJjwb+FrcYegjJbSUhp1MVY9nmyM190lvMmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfn3fhjNw/tv1+0G52n9Zla5DAM7g3Mf2wE4t9lqwZGXIHnPXbFd3OH2Po5SfpvanFs1UIQmlHv4pBcNA8ScUVD1VTZqWwpneSzEIf8VKoUjhui2v6W/5rv5+WNv6QD6HXAdTKtk/ZA2c7BYuo/SJSb6pe0AFVfEGawb/B8g22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/He1VHM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/He1VHM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e812e2b31bso26934755ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028944; x=1792633744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1jbxv0B573E/6JvVMqt4p2dOdYoex1i5fkYQYaL9us=;
        b=l/He1VHM0Li9XQjPIRj6xd2yearw0Yqy9miFx1sPJKjk+9vYWO6dp54JvKXKEAThIi
         kkxbVGjXk3F0ERFzD/1CWzFNep7xSUXHNHAOuQ7TX0rMc/PKqwylJk3I8z+7RI6nXHLi
         mnexH7Vp8/EN8v11g3rB20AchHS1al0Cxq2ThwdoCC57S1eDapYdphWIPVoRxzX1+mXz
         gEZ9l/Ad5dSIZugLfQEyyCtOuYes++gRXfieacTIn/piwrap+DOw2isjLvqOKthKm1sB
         JKRCk/4vZSowt52CQpqI7ayAuylxzK2TB3y/YU21jRvD7dfZFp1v5MDmO//MhZvkIHsi
         t9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028944; x=1792633744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1jbxv0B573E/6JvVMqt4p2dOdYoex1i5fkYQYaL9us=;
        b=oFdvgl4OuxfXOcfsrQNuzZDtj3xflpfHgZyaErJpVIFLSbVVCRxnU33BHFRkXCkhps
         DZeHoiowOMNDGYu1pvvmAWGqr8++4QNCqf6HZnzoZgy2bl07x7cB2Z4b+9cNmnf9XSn3
         Jj7L1P9g87KN9231HQifCkn4938ZOj9czuCsK5AtE6yeKmrRUkrtgOIIxkC34aw1gFoL
         fOCXfMimxpNLR9PCWdmMUMWuXTkUZ400WDCfAaIvvcjau9rl6JrYwry4IeUp4hXFHoUh
         GXhX8S6RkF46B5TaXgGztOFrVWQT7gnEL6aQy+mcqUsn6tU7thB15RvThw0h/BRmzha0
         Hnww==
X-Forwarded-Encrypted: i=1; AKwUvBwYrYqyddM2HTF5cn5xLG7UluA7y/KyNC2tTp9BuetWei6lCCrrMZ4cJN4j6gw6CBWS6+JD/dphtEy9eI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRROw/MRQOieAqdQT4vW3DEFCnCJ71aN4HqY99KuHakNKaezBF
	qnZ+Yx69LAHxU57u4SdTTjFP5JgOxyZQ46n+yVQHnxJMV8lRTWVCPuVM
X-Gm-Gg: AYBFou0PEMqG4FK4y3JcTSO7ebKZNtB3AEo7z3Nm7aQuHB4/ru1VuF5lgzSLG5td5x/
	Z356bfS+hgA4X89TxqBELCdmOG8ugulnC9pn68vuz6gM2xEaYvVQ8I3MGLqF5a7HFiDRiFn5eu5
	HWUGqw2560nlPt2OedEtg/QJNnzjputYKeuMj3zgMuDylOh6KB8v5ti01SEfaL3XMrmtHvSe+4j
	3WaY9T5IphaTkyic9marRz0XojCfz6aQ8aRWNuRm5IacQOn0dNtDhWI8V0UBFqKhYBAczQU+FIo
	2/zfTBvlTClNIyi7dMEXvIlbXYJNgga0zNyGIRAu2olPncP3wZpvqRmcwf8MBvULLdByBjBeZwC
	y9OJ2sH3XFDX6u2JwpA95eb43UJ61X+W7Co0fvepRQfBwt33If8m4c0/PUqJrSfeEPq2S1a6nuM
	szqo9tdLK1MNZK2G+euvPNyOmA8jrRJKC6Ak54/XLBPjoFsasYXcTeVBvJ4sbfFHlue/tQbT+2G
	rGbQfHAWBTiLeZ4OKAbp+79CMtXZ8O4luotJgJEACUhpgGASBFiNXoWVSFjVVgbZSKHlzmBJCb8
	z2SplLErK0w57T8SmDC0jBm1
X-Received: by 2002:a17:903:41cf:b0:2dd:7a0d:e51d with SMTP id d9443c01a7336-2e842ab64f2mr171051285ad.16.1792028943557;
        Wed, 14 Oct 2026 18:49:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:02 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH v2 18/25] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:17 +0700
Message-ID: <20261015014324.5569-19-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,13 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

