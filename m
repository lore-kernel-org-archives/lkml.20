Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2836BCED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029024; cv=none; b=PA/7FYJckE6Y6iOm5+Teh9h7Fbfe6n5vzqs2DUxxQvgYWScPJjT68QwQKGiTf+f27IKajtEev9ClKHgAKlqnxs06Og+GDq9aqLXv2MAdLWH5SseGGrpVQDHY+3tJfC6H0yysvKsPbvZ0KJqYnUYpw8sUK8h75m0wpXlpf9rSM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029024; c=relaxed/simple;
	bh=FZEwana/OW3ODi6xFN55pPX+MLagNsoGOIMAf6UwyHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkuNfeXzXtdSAbqwxiEXdNMpNEixj7S2hezCUMwe7M5dZQ/JAyk8DW+EZXn1lzpK4mndP2jKaDZKPz4dtSUPqt5SKnfzhZs9nlngZGjWDkBf6FTG0fsg7da3Loh+ir4PeQ62oDXPbfP6i9Ap7zhPsTcG8dRAnZnNTm2ebRF4wUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgBgoVUJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgBgoVUJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e49fbf92aaso28046075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029022; x=1792633822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=EgBgoVUJTnuF4KREKAxIN2diuHFmGGPnfnIbWlAnrKO0ME0gk/EhQ5kOo4ByxjTtZp
         nA7hCkRqoPe4S1WU0X390GhZUUp9RfBHEpdaQlQMy8XzSKVO0ss7mxYhP+wQWXve4c1U
         zXzSGtJ4E6OtbsMVtz6ddZMOFApE4vlPpr4383gRkeo0NK34yJqX+w12eN0c25jsCW4M
         UPidPJPMzCRvawE+QRgDgphEGTvcBiyjwXJnEaIFL0UrI+dRPiVrIrw9mdX8EK+uLP6h
         EwM7jwC7Sr2ApMnHA03oGsGJdOsnvih6rNuBCuws238gsSO5ultLRh0j6KNTb9KTTgOL
         j2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029022; x=1792633822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=vedd0KN8rfcIt3SljveVp0P9RMFP5MznEO38aLczmJPlaYBuddzAZXP9uCrIi3TQyj
         KZGwCuo2kmQEda15z2SZciOrJeARs5E31vR0CpCzqOjMYvvtIzWJtwZGMqobA1kEW0mL
         4nkX8DmYl9tsVb8ZRfH+U0uKTo9hm/HgcVOHQ+j9sCnFiGGlCfmbg4cjtgcYlQjI4+s3
         rtIdrqnxv9KBRoWyVUxibtlzw5PuOvtLPamLOauxg79YkWLIvEptA0W10eBHzoQ6siSO
         lb1MVabQgWQ+sNwEXzgixxisiHhWWe8sa+MzTbapXS/UKwes83AjXBXTHQLPYR1AZnPR
         ENzA==
X-Forwarded-Encrypted: i=1; AKwUvBxp7OmDsvl8dfdKElQD/eye4W09VbyKhyO7RKCFJEs/vXJNNzFyFvz+DYVXBpQvlEwUo869eLmpjdEPB+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuJJPIyLx0Y/+Uw78oPa/r5KlpfWp5RQI1Hygd1cxOINtx8FYx
	kVVJy367u67LMCPAJwRfXeLgMRgI82rad2dXiqxpGLhJjfNW124fY2uT
X-Gm-Gg: AYBFou1TDWcUKpHbqbsVQSvaI9m4Si9a0Csr0StBxuDpC2BFmMkB5/W77xKFkI6uyL8
	lquRgWQRNERB60WWBjytUjWefLCXqjL1Lr6bjxYQr5AajQBJKQlLz29SL3SJAqqwBbm3GzzSjqj
	Uo6BSDBTpdVEriZbTDN+Jtb+swAF871X2oSAeH3LwLCrfB3z4fKp0ihBDbkrtSpWRSiHVufYxzH
	3rbD8OnvBHLCKiPjPUDxuFvZY78Mvdmuv0l2bJWLApOskmOX9P5sOwgxmELcKE6WT7Fs/EbFbtX
	EholjsImthFAsJsC+eaEX6Q41JCgiPSqWXsFiDoPy4tBgJraq//8mL2O/e3SHBwqeTKZUYQGyYt
	IHhWhVdshnGJpZMHJenOof3ySb4Jf69P+KYQDFyrhPWvom79RdEoZKn/wqVwFz7h4FVveJ7NK8f
	r0wXO9QG3uf2/SkJyjUsA2zUghRG/Jx+eyj/e2O6ouufOCnqFurZSL8pW7bWua1WHy8CSVCXAzE
	umolkNjfqXYy/3hXVOiROgAJex5y69fv2mJH28sCEZOv99QIcnYX2u7f+05IedLUEOQpAYb/nJL
	ANDF07mb8BlunQ==
X-Received: by 2002:a17:902:ef44:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2e842bc6930mr140413355ad.55.1792029022012;
        Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:20 -0700 (PDT)
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
Subject: [PATCH v2 23/25] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Thu, 15 Oct 2026 08:43:22 +0700
Message-ID: <20261015014324.5569-24-phucduc.bui@gmail.com>
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

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5f4a53886541..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,13 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1011,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

