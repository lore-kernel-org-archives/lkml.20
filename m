Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BE356773
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028806; cv=none; b=vBNNMtXi+b68gJJXbIkEyr6nhACqDb+MEChAg5u5hNjxPBasnJpIkciSSTrZ1zL8lQSXP94zlAfdjdLXF48XvnvI9KtxSfR2obgUmYAGr5s31lBH28DOtcS2DdWu4r5wJVVYLFm+g4pHs8TcYhUr3gm028rpqRjd/sjdrvBcVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028806; c=relaxed/simple;
	bh=HEnoir5YUU9pRtHiCZMnqTe7yfBh5BOFRRnUCPqrwfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuQ2iYkMo8atYCeOv8wGVLU49EHNpOUUTX7xtmgsdGvpZbOP59p/KDOCFhmQbCCPn2tK4RuT4VcxnrhikKdbA53MdIV3thnpMy9dN0uRkXjAPtmtwdghSaigdg/GgUm/jiDGH3Pi0qAlQ4VlD8DBBDpKextDrVM4xdbb47/zfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLOUHqYM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLOUHqYM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db710396ffso36899915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028803; x=1792633603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=iLOUHqYMa76XKfsdwncdnvFA6++Fw7bgclRFGIIVUXcqtGOSB6JW7uRG0uy8mlqiTY
         Y75O0M9L0cpMOnN47n277djnZbVu13dWNF5ISb2jx3Roc6052ewiIXtDUrgDTKnrYOIQ
         NVtwWEB/scZ2WVDi9MgTqIVzgQJcciam2X4hXHWAvNOZe81XGcazO0ecenaH+nyR6S5a
         xUL76qqIXBr4xAWGH6rC7i5PUwjPLuuJdcTJaiz0iwgRG1NFb+22yjyziT+IMzyUFg5/
         ddmdJgpquBgdZ5KL0ZCxjj0djF3j4mo0kM9TDvP9Z8eOygE3YikA8pl7KEo4zo9CkQWt
         ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028803; x=1792633603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNKaoas0suhXoNZM631qYPKJn33cxyMQnmMBR8n2e68=;
        b=mYXNc+NgJ+0MArif1YUnfkTABxcosy7WDef+vvLoZ9MgL67jmvvvFdnYyrJrY2ahfp
         Fr8C+Sfl8UB0qOofNGTauazpd6o/9y/vQcUeODThrkR4pvOS1kpQmu4EqAbEUiIyTCo6
         LWL2sYFirR8Cb+9hsI5DVDzklVbCIWWXgAZGJDbJIeFl5gK9m6BGK319HsnJuQwCYJN7
         /ypr2HKKjb5PCC21IwwyvgCaf/J5WVRmOHM/l7Bb45fZys2Zq4dyHJ6TrrwdXXDMgTEW
         7+H0e026AUHJMs9JSYBv9527Y38MqDoPzZn3gSB98sE7vnUWx1Xe92jeiJebcni5U4uP
         ULwg==
X-Forwarded-Encrypted: i=1; AKwUvBxrSzENNU7tn+LejqNgT7aI5H2p2GNe/HXhLdztDIPwgUaaaCKRzgHRb7I/r6o5gC4QhUVGP1/LsEia7vI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Guwel5NrAh5A4gMQdqV2wDYxpTjfN7rgKYwVQ3Wj9CDkbgMY
	eSk5RO3MKDot79MWzbe/tzJiF6OUsLayy/Ws9MfipOL31DL0WmMTKrPz
X-Gm-Gg: AYBFou2wBJwRZuCKvOlea86xDoyIWOcktk2hcy4ZsMV2+VqramYROHkzrnkZRiWBaRG
	6IFsWm3f34a0xtCT8nvgR5JlibpaxgqADOC9VHZ6sCPMJ25I6R2ueDQkB/nt84PQ9Oy2i0leZiC
	hIKXU1Y2uEMcZI4CDBARTnmeYhHbFt+8ybP3lU5VnEMoijsf4Z34DdBMUeqQ4GjUsm2Nvd1yIdk
	AXPnIC6zhsPlle8EFErsVIYP+h4B1E9K8cqoPDicJnPO4clHtJmcmqT3+ASCjJ5REer7AQcALPA
	UiyDd/UTmrYAsJAuT1Ujadhi158iIxXv3Rx+h1+JDSmOqfY0kNgXY3EIwAkHiOgKVgkTXr06T2y
	KTTTq1qt3oxnhVlr8gm60LNXxv/D+c2d71xH8Vs2PJu/wbWj5h8a7IskzQwD1Xxw9SPHRCfLaUp
	0xPAmKzhd/Xv9Iv4zmqbCcMVmlKEA2CNLHIRlA98m6uRRordI2zZ6kQ7AAHNkgp/RZt6DSQwYuH
	u4xLuTUQB0tJ+3cM1xcx0UWjiKsJYOrOM0Cve++wJaDCDsAQcnvFW3VTJghXKgCGMqtUexscOID
	x/AUlIyousc82g==
X-Received: by 2002:a17:903:37cd:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2e85857ba34mr106063185ad.10.1792028802766;
        Wed, 14 Oct 2026 18:46:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:41 -0700 (PDT)
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
Subject: [PATCH v2 10/25] ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:09 +0700
Message-ID: <20261015014324.5569-11-phucduc.bui@gmail.com>
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
from cs42l42_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as cs42l42_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..18d6cb9bfa2c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -890,6 +890,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/*
 	 * Sample rates < 44.1 kHz would produce an out-of-range SCLK with
@@ -900,9 +901,18 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

