Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCC2AE76
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029011; cv=none; b=rpfpZyzukV5spzAcTG335KuehXb8ldqB1SpwwL4qcPsS6feOB4C1HS3D+oJpMRK2Srwz+UouwaDCZeyhyJqn9RnRnryu2iVwa6o4mXbq+H7H4xFal7vvWoGe7SHRiekiXHEQHA6VUj4DekxzKYWg8x5yea0IkYGNfgtydh1CvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029011; c=relaxed/simple;
	bh=Jq/bIFZc1Lkj9YX4s2p8d0qHl7/l0ulkAoIKK4tXhJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiROIwTUntKpQSKe/E2TRc15mgcA0B5BOq222GF5P8F+2mWZ+BHy0EWW9y5QiphhskNjIHI0eO8D28XC+vq5hU8KyXVe/5sUQstg+t0Y/iiGzVMWq9NJqBls2XYoY0+f7W+aQ0r0z9NTi3nbfHnHSPm39MPUa9olKdcWYDzT+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkaaTd7D; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkaaTd7D"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e942864693so5068525ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029008; x=1792633808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxE6KFVupvhvfG6m0kR0QYNTixMRnaDY+YvcWwq9JEM=;
        b=DkaaTd7DgCpgYBDTNX5cQ50UKCAFANj0KS8HNmzzTmvr6qNxG9nPkOEs5WOBtTd+/8
         Uon6qCvOwLouKI/TiXK9GGcgaYxPyQijKGKJ3RN8mH1XPB93+QeCF3/Z5+mP09Eycbzt
         mwD7C++oD+qENKNoXTnXIdxjizZwwlpd1X+67hMpakHz1hiS/f0lsYas2nuWEQy9Pegl
         zZw454CIKNYAJ/v2+4TBACF0+LRz9iiTF0iMgW74C6u9V3h8KJ2SgJPLXQ74A44dVbun
         WeQRgei9SoEcp49g2S3JPVsHZHS0NX1jwpluR9/2UCzZItKfd3U2JoWTmRxeF3u432X+
         ZMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029008; x=1792633808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxE6KFVupvhvfG6m0kR0QYNTixMRnaDY+YvcWwq9JEM=;
        b=czyHMkERIKeVqzeh8RafZ+1ULo3JjyZ4TaO7BVR4jBKz6SepHFg2ncJJOqCEmeABYP
         dzzfClzYXGoBYE9GHnMAa0HO7M52XyQMSW3WbT+N/zOKD5grSzOUpyRq3rE10G9d/CvQ
         Izdn3orClc/l10I3oIUgbKbTXtGK6ZS7Hf/cxEtVuUFkbfkQJ8owuDSjhUWn/Fq9Vv21
         6NO0m2sUpwZW7ME4/iQ5ICvTQ/LiNFhzc+NvUijACG4TyILa4FnsFQdwco9intluJz+Z
         2DAQmUQBBETA8+3SfJ6rHDNQ5wZ1nHO7nJBshhcraPzHhk9EQHDlaFzTXDPtm0FqVTrW
         G/Fw==
X-Forwarded-Encrypted: i=1; AKwUvBypd1VG0w0fXCeeFcr/WrDAgEyBJrWGSbQFPpc6qTh9K+gFF9KmFze1R5VD22PUTkDSMDM15LKwMp7TXfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjorK6QQdSVLkh4d34JChkesIn7bPUAug9PsYjjJ/oKNGDettp
	0iRrvmfR1aVpiF3vN5DlKrL+C6dTobVVIynqD8RJHX+XtLwZvEf6kAgs
X-Gm-Gg: AYBFou3pkFKGDxRCEoZmNJXov+iSH2FPFJaOOg4ccnGwtXpae/8bLvR77qJRQnjUJSW
	ruN8evQWAJBPZ3LeYRP4NCUhgD2QzkWMbJQPpYNtaKupe7S3++0N6M8whRwVMO7AiOh2eAXJCeB
	Wb3IqNiSyKDwOiFoheciQ5HFsIgd9lEizzmvESgps00eYhQwHerYuC6V9yZRbHYDS+P0+XnUlLf
	y071xdScDNQoaSufRVG6rzw2q02JImIOoLYaaKY8QIQyVWusrNCG6H7+h/yAN12YzbuBkuEMPvN
	joNa4VesW7tshZyOooAbBnO7+Zrfh75a3Z7gJX/jAm1nvXHl8W9pGtU9ukLZNkaVh4VzSastNBb
	cfdeVX10JI8otZER/YFHLWtQ/Nieew3EWDQt/j2261xkSZdKSVpdq3MHJu2LL3qq7KcO1qkTIZj
	3xFKfjimQhhT71l2KzwRrnQobObjjIxVda6vfWr+FQR0tAz2qce1jJI1J8y6axt5gYe+HdUEg8A
	fGd0GsQL/lq9eWWRRdShcg+d427dEXoS2yxZgYfZSUKr2vx6thgOc2xRSckmDs89VhVGMEX1cw6
	GBqTUxzufkxzQg==
X-Received: by 2002:a17:902:d58f:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2e842cd4632mr139407115ad.16.1792029007639;
        Wed, 14 Oct 2026 18:50:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:06 -0700 (PDT)
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
Subject: [PATCH v2 22/25] ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
Date: Thu, 15 Oct 2026 08:43:21 +0700
Message-ID: <20261015014324.5569-23-phucduc.bui@gmail.com>
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
from rz_ssi_pcm_open_pio(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as the component driver has no
.close() callback. Still, return 0 explicitly on success to match what
ASoC expects and ensure the component is correctly marked as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index b1587f499cb8..5f4a53886541 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -937,10 +937,21 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
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
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
+	return 0;
 }
 
 static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-- 
2.43.0

