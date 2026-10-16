Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9238D01E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123949; cv=none; b=fmL/4SiYwtqJm49EjVcZH2fUJDuvoQLuzQsr6/mFoecqHDcJgTbGVNZwDkWAAm6pFJXYdfaKtoUWHCyKmWbygi4l274TfKeL3VZLEBF1EOgLvAv91Tww+Oi/1F/VD1Rqi/y28LAsYySWb0JfNRvQNCN8bK2CGgUG6O7sk4LmnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123949; c=relaxed/simple;
	bh=r7OlKukmBvsw9WjHDtwSqYZmBLqvfhuoOIuidK+OgfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXzwds+9z272gfw/kxEuIAvoXHIX+QMNhnjoQot9tApP2jla/H9TqMfrBziu+N4xSVgY191O3zNh8v0cs6D4fHE+NVj2Eto//F2Ni7F87h5MHGtrIOQAnnzZebziciJ6scKauPb1AnvM5dgs2hOGgXAsogDcl/U6J1gQECHSWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irjlygj6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irjlygj6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e95b3b52f2so8352525ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123948; x=1792728748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCZ6GoTFAN+ex1Ct3jpbL93IWIQW5JGKx6t1S7CNuas=;
        b=Irjlygj6WCN+Xi5/U2TOBm2Ssxl+ZfqrvcvPvQA1QCSEocCLCo9JBXw8u8jyXkK/9q
         PoqqpG/9q+G1oIDcyN6horpMsEtM2CjqupMpjg4Am2Td8yjMoRFHarz8uDSOXmkHvp0Q
         wW2Xi3E3SD4dy3GjSZbufTP8qlN96B6AmTmOUurPtPhw4jkluVB8LrTadsdZEkCbWIiE
         66wS+nGE6Qz3POZdJ7hPBYkF2xXA6Pelf63GbqJk0qIytw0FLhJHILBTOO+YomFUz0h6
         YrKg3LDHhCUAgQdt3DI+1fAs+JRGNHf9qr2stgrhph/H0BKYJcKkPsfsRj0jjM2g3c7D
         P6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123948; x=1792728748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCZ6GoTFAN+ex1Ct3jpbL93IWIQW5JGKx6t1S7CNuas=;
        b=X2daCE1rhcYUs3p/lqwAulzx5SQIqYZwIGOwc4QO7pI6g/0a/hGaHQHvvZIHj6GWX0
         1iX7vq0xY4WvAmewfcFA0qIawqpcShpCF2SMpdFXvm/NfnUXpY0+rCiFFDPyEB2bao+A
         sxQOCTf6q95M2zrTqBsybjJevEeihgTC5UO4AJn65vQkz63VxG6zaV9K6IJsB+dtFLSQ
         EL6+Ul6USHfGE2cIjOnq6St9hnvU7WRXnLz/RKidbUWZC19RxrimX7rIkE/tcxCavgCk
         tu+D1spNYYZTvC9POx0REBHvVRNdrv0zxg7s+IjedWugb47OfY3wZh9J/3jhAd0dIJW3
         Fu1w==
X-Forwarded-Encrypted: i=1; AKwUvBxNagoJDP10KKMpqaDVxJpVhUaXCvfUUgoERjw+7MxWalTLxZsQIZfV6W2Um4k1mSlqTA+F3FCh+pK1pJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDFvhv7uRlBdDnv6CS+Cq6h7Bksi7PGGfLdxfnHW1DVYzunIEc
	VOibYsW/dyhvFhA4j2HyZ3DTcwQ5DUjvJ+BmlmLwWyijSh8HuPoUEbJ3
X-Gm-Gg: AYBFou2dgQ07HnRj1wpQRNz/GpXk/Mfr/YG1cyRnh4jxfQSqbtmCWDwbn3j8h+49ACm
	izxmHBMDliErlI4rQ9ucaklZxKV805YjnBLiiMR6WxpVH3cnZuXtOMJbSA5dNeNkxVSeNAXXF+S
	arFUXbC/nTEeAyP4MM3AZgIxBFJggv5oTLFAf/nqTkgWceempDuiRBM1lW4vv+2a3WvRX2enXPW
	5IxnRIMz5iTtFW2KF5tEMELcDnA6Zzr2pdtZrS2MqkQn2LZSE8jT81DQkt6Dz4z7mxRz4lkNIlA
	fgJhj7clGa83wLKgIo1Enqy95pMoIHOIkL+m276W2m/X7ya4atERn67147bY3twbQt+PIOdbRba
	4NqHr+4SLfqM4FGcTAHRdnBmFIYUSpTwhYUP+NKQaYC8GLfEA2cUOKZCQkhLJmTSMg143pa4EZy
	QnI7jXA2rhZw9xhzoCbD+tgbS2rmoOIeKjDahrfKbB/gBruMAsUt1Yk19k+udXE5PEOZ2i6qKZW
	HQIPWiglpwgYYTjfcMRbPU7zGDsWM9AQ92I626Qzcvde8OiPqohbWJ2VlsjwEPFRGUkd3ZbFRLv
	TnXBHOHV55oXWg==
X-Received: by 2002:a17:903:94e:b0:2e9:4243:431d with SMTP id d9443c01a7336-2e942434bd5mr63920435ad.30.1792123947778;
        Thu, 15 Oct 2026 21:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:27 -0700 (PDT)
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
Subject: [PATCH 11/11] ASoC: rockchip: Explain DAI link startup return value handling
Date: Fri, 16 Oct 2026 11:09:46 +0700
Message-ID: <20261016040946.521195-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add comments explaining why the .startup() callbacks must return
0 on success to ensure the DAI link is correctly marked as started
and prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c  | 5 +++++
 sound/soc/rockchip/rockchip_max98090.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 0ec80a4b8c59..d4a0daabfb42 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -266,6 +266,11 @@ static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index d54c36682415..de392b420ebd 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -202,6 +202,11 @@ static int rk_aif1_startup(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

