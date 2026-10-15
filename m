Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2504368950
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028889; cv=none; b=R0vJP5xWab8lyQ4Czhbd1Vs5zw1/OOl6pbwE+mykSUNu757xVmjTPqcBbU4ixG2vGfxy9pq+5t1Fa2EkWh/6lylcw8gvCdNUB2xwJNzw3Jm6TgF18N4ppaYG4gbFMPODTZW6ZdE443bs0FjFt+vFlfSF6XVPgZE6Rr3eKCqlDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028889; c=relaxed/simple;
	bh=h+aUqaPj9vowNjoKv8XZBklyZfSSufgTE4gL6idJtRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7/Yf2uPNV3TS2afDTITu2wIlybqciIfPBUgJpRkyS08xQ11en6LMkoCXAerhv/gImDzgf9NjDU7LEfw011UDfxXFKM6FBFPpa3p9Uw4egwGeM20+Nb7UDC2AXt8rQkhtM+GkAzqr/AAjB0J1HL91rKdsgIv9kfmqhNk0iPXUvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCX4NWCJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCX4NWCJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e6038cebefso35443175ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028887; x=1792633687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=HCX4NWCJsGA5NHDhxigXerOZnl6MgMuGSF/IdTWFeEEbRGXFvLdYwyzlV0paJajwoo
         Q/np/hZjo7c824XVuo4Fg9MDaU6inYmcl/V6OdsYc0PYmQHRcE7A1lxQOgYRDJ3jxLPF
         lr+ek/HjOUQ+j2d8gHf5FAM6/ghyO5zI6ezQVWNhCAzyczH0rwN7XT4jnb1qD/DNA+l1
         /AzMW1GnlCQubitGguvTXehKk8DHg28Igy4XfUjuIg/0LXY7TLNGz8qc4Bhr76Dj9aTa
         1CcZ+hpu0VW34CNdisfBUVnys1xF+Ng/pB4NKq/r0BaZWbD3/e1MPiZnFk7gzlueZoyA
         9GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028887; x=1792633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=KbxO4Eoi1NIdefK5k+koWSB7iLOaaQaLSlhCyUcBSBcaxTSz1P1p8c+41NTaVrJK8n
         TVcPZmv0U4xwsMwREWh1U8jaADCLtSgsuJbe7OnB2neSxU+rc8pN+FMGELNo9MWra0Qm
         Y9ch1H/Db2frcydiWJxGu7IviSQUsk06r99MMrxCFvsWScTfYGt4lsgLE++hE5EmwfyB
         i2Cx8y3AxL/hT+H8pohSR0+eecBRLghvR6UsxoBl09k17weltFvJrQ4GEv2cqdATOzZn
         /LAlsbafnzR5AGSycCfJ/UwrlfCuuj8APfoMxQDIw2KjYdmZL95MZCassHA0bW9x/qqS
         rAjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzY71T8fr43if6jly66AiFfKoGeiBDYQtb2z6BRMcbciZKqbVH+aEsvZaEYVFgUJwmBLCuNNXplztt0YM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI89BumnpsBoV66WAwewXVe+fueQQ8f1ZidObOGOvc47PVS574q
	pdcr8RntjlCntRXbt9hSc9HrXAzK9G6qPrD1djgCvrW7Aok3TVaCWOYg
X-Gm-Gg: AYBFou15VkEimTyaBQnXllhmd5Veg6kPc+BBb4NRnvxHWO14m8ttmMoYy3MPtf7Z8j8
	ZUUN/DZkmsv/qBn9o5xTmi5aEYaPiJUXkP1wEa6P3Txo++gWmr1ctVpG7PdpJo4yIVLAA6U/S/Y
	qs91U0GnZ9RUxHUZU4KxHMBaV1oZj21Pr4CSdc3mAZrOYH9hyfsI9PxRWqSc55YLXBloOnUV4MC
	LxIrLIkCiAXKE7g9bUd0ImNAiSeO0k7i5+HgxBsmR1cDanC0mEEoTapn25KL0F2lNHl1RWe1ww1
	heqjP3a8sLZd7l+VNTEQSrFhWvc6MR/Sb7oGoZsOLt2SbV+/SaKOzNEdDg0fWzEQyZcxZ7C0Iee
	jd/sLv2VtRZ/Tnb2iwVhx7tLvnm7k3wiQe+ly3DA62H+V6GtWOSQMbtgYv+359n6pSTNlpsr86w
	BB/ZiXOh5H143JLOckb8r0tWvBELoJXUY8bGg3ZZdUFlpPQWaV91D07ZxlWZerGUK3B+rK43AcL
	0wxMtxMqTe+U+zNTpNDiOYVNVdlWSLt8eDs1f6KlN6ECt483G6KUDwtHBvzgKF5tCVNr3sG9BDk
	jIg9/XDcrVS/uQ==
X-Received: by 2002:a17:903:15c7:b0:2e6:1a6c:abd4 with SMTP id d9443c01a7336-2e84280e026mr162256675ad.2.1792028887036;
        Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:05 -0700 (PDT)
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
Subject: [PATCH v2 15/25] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:14 +0700
Message-ID: <20261015014324.5569-16-phucduc.bui@gmail.com>
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
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..af2a49c893d3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,24 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
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
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

