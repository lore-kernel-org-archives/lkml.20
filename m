Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A83612EC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028721; cv=none; b=PsMHLRsjZRUS4x3MlcG9m4zM2WkpmuV0xOgTwndI87yCPfamukhrQVUL5LWUXFiU7jyUqALokYPNaGRmJZqnpTBbfpUfTqJC22ofhpIhOKTWbjKLYd4En7WcNAK2P0Lcc4+ihhwkQ0lool2vagkueTS8Nps9irkVWMWI2x+nZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028721; c=relaxed/simple;
	bh=jqJ5MSiUT4wmuGEu7gmmhxIxMq4n2gfyS3RH/x7Sng8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LApYgxvEIvkDkAY1UrY4R09YvvR9Derzb3McAsao+Bf49c3JBaGPZ7Nx3WzOAYzC8I5sSWROKPXHg7G017KNTyIWKatYr7wZiT8TNRJJtDryqW5OF//BjR8N3IqlztI73pEOD6czW+aUE2S+w12XmwT8zI8om/ObSYv2aK+/5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRLedoTy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRLedoTy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27561125ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028719; x=1792633519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=lRLedoTyMV31PW6xlzkmSc+Jl3ZYaIvC6Zk9aAVnG+NTWxr8tzEUraMx+Uqnw/+C/B
         sUS8FtoGd3kXhuflLy95LPgx7vmNcB3kXY8fH0T9ipwu/iW3rNfNCWy4BWQ/V329+A7h
         LMZDE1qEgzURTQyjmuyU8TvoG3vYx9AQp6qeQfeV4y++h5hSIttgrl1DkromJ7WDQrth
         QbXLrvx2RBIlcKxL1FVL/u7yohPhCmwpF4VkTpJexVRi8CGQPLjDoJNn0QCmqeVR85Dq
         DgfRjx0sGceIxMSJdxVa7ntLefdsXlcUSRG67qTXPl6Vm/l0VHbL59+jucbS4HwQmQT/
         XuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028719; x=1792633519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=EOexp3t/Vko01p/iuzz80694OSYuVuOhRfd6v1odQ398J5dBuAWyhhGk7Os5LzdeIH
         7sjN5BG/Of59vPBNXAqfBf0vMwWSPLuPYF09jxCZOkzO+OwOZl0UWA2SgrrT+N/7AsbS
         7Uy+3hzXodoOcbFTNmK5MhKOBJvx2MdVtwa2O9Q9UsENMZI0eqyqUoiANrfniQzitVWj
         R4cZf5TJQ+86nPoi4NTXzYMzCLh39uswjSlmblXcstJGX6w8y/PF5SK3i78WQJWr5vPW
         sldu/Ith8ETCpUSiPp04SdzqneY+EnwDUGX8KWuf7Rw3YYTN3ISwI04WUzwtq/qAfVwk
         8h+A==
X-Forwarded-Encrypted: i=1; AKwUvByI+yslCgWPIGFzNfvvM7lo4gzG/pR33yKApqmpOp0y/zplU7hcC916KazR0US/yiHZinOJ1wBIlamK04c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY7EDa7Gs0Ey7OTUevZBa/S3wnyyPK/OLiRrj0YsRaB7n/5ZjF
	yJQbtVXww+m9j/270yOdPVimfd+yUTlpzTfFiLBFxuWkvDtJcX56MEXX
X-Gm-Gg: AYBFou3laAYjbKHB8A2TsNZxi1FSLaE91bx8TY6i2MOxRT7JB0Q3jAFICz7bSaWx9wJ
	TvyXWzwizKMtVyMZfnu3qXdYOL7COqAgV0gQUYZ4PeJnSZV6nf9GGneDPRVmLhifz6OjAUADqIH
	7fWigjFMrFxi/r0QuVymIRa27Rb9aNSqBTqIy4OePKySd8mqdHZ06nDasUUjXuijjSUa2Yo8yM2
	XMtdNioOUyLc7TbZnjh46uUSdVdgYCibzjbJG42p/PWuLb6B9NpxrUf6oV5ei2pq2cMRu/eEG5G
	o5zfCepO0kwvM2CFr1NmHa/5HK146+I2QWGzwOpo7fZSKIGKB9BuK+d7UCNOBUkE+SlDOOzcT1/
	MdDPCo5G9i55ON/LuNrsQkwDj5uqh1VinHBlQqoNEsIVq6pQAJEKAxihuHpmVjFlRg0ll5jyxx3
	gx006L6KElAtywy6q8AY+7WWhoF6zVaNX7nOjwbA6VFN+TGEAdC8IF+bHGcrHwviVrCcHXqANB+
	4GWrs/crecwx+RkM3NgMNb0ThnKdW2dClOgElSELNb+EiA2BcQENRc7L+oYLSsS0I+2CF/vUC/H
	0OTdeouxECkWEA==
X-Received: by 2002:a17:902:ecc3:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e8429ab7acmr151706215ad.27.1792028718870;
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
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
Subject: [PATCH v2 04/25] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:03 +0700
Message-ID: <20261015014324.5569-5-phucduc.bui@gmail.com>
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
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,13 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 
-- 
2.43.0

