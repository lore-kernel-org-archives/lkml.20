Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122237F01B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123936; cv=none; b=AiBw588u9QVt9m9fFdYxS20djbBvWx1GeIQQg9f5dkuGH6FFAmXjV0vQD6qFFrJN5UthTRkWRXXNStTMUx0AeoL7QYAb8n8Y0b4KU2I0px23SMtuSS6Ag5WIjZt2gNdFgbHLOFAczHJiw0nJI4sUV3EXqoeXVAyRFMu5MIgfd4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123936; c=relaxed/simple;
	bh=Gs9t3eNuKnVFUO3uoF5nDdlII68A+pSb8mn+aZ2CHts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iM13heZDKIomB3nZPhDrQpHsqNebOWyo78Vyty8ErlRYvtAo9uXp28F2Rhnk/27/XKBAXLHMO1nAnmC8xWcdfpMd/lnHaR3ZJB5HJK/InBPSdECTtpk0pyEVZmMqjp96SYP6pf+sbtyTK42fXKi5dhA7YCKV/YPwjyCWEwkPZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pX0/aTtn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pX0/aTtn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e60f9af6e6so22926565ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123935; x=1792728735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=pX0/aTtn4DBDrFRjDEA3UjCh9eXQFQWKhkYhW/duwBQTPqyBMzhmj73YRS84pZVl1I
         SjvhsyaOkjxLQeIChVBCXaLKBZTqjPaDIBR5eDHfNkGQZNYZnu6/2cOsZ4hxN9Ho7jrm
         WQzdode+MnjXzlbX+ORBx+NQPSB1fdXVNNI8n/kwXDom6FE7Jb1yCzDDJJx0U4wMPm+X
         MBTChollxR8rGj/99ucZfQgmMiQalK9yemx7ipLafkjd1mJoORpdrKQ+9UTD01xTZPa1
         e4nm4Uua2+DpTYliLLG2WzhiqmwJ/rJgubtFsSAivQ5f4x6tL6IAUEzdYQpxNdULwpWi
         QdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123935; x=1792728735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=eBC13OUN47cRTXIivxnkNmoBMaLqgmlD9cVGyPMN857t1R6azsbXpVMk61Q0GjG9Zj
         yviNoQ+jWtW3speMcjiqgdMBU6i+zedyWeAkJ5LSHCrRlhpEQOjna/3QRbzpTMJ3p8pC
         RRcmqH/WHVcldnt1piS6t73BI53PNy0+J70+C50IAv8/bfkUYTzyb9hikvwhBHP0rYd1
         FEY8/z3d4wS5YWxTa9dCyS6gABRYkhtYQihBP+iYnF5SOhJ2vA9rIMMTKOyFypC6FlVJ
         G8J/lLgx1srXJ3WBxcFrcerABMkUMw2OSG0CEEaOZ1+DPNyeqZ4i4eBXZwYps4BRFssI
         DlIA==
X-Forwarded-Encrypted: i=1; AKwUvBwaX8GuLJ86AkzzgiVOrxscgojdSpGh34BK529nbekGlQbhXgkQAV/tPeOdkrUuP2ABsgv+IjsAjpPh7Go=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMldM11tUp7HoiiU3zEL2lZtgs3VcnrfiCZo4e8ZNmF3aKnr2u
	p9Ptm+sX1dYWpbFIf5VbprKyXNrwcvA/oYSfn/IsgrbR2WYT8680B/qV
X-Gm-Gg: AYBFou11Zj9Th2SK/bBDoBDHOJiskOrVzyBoE6ZGn/mkKZWWMOn6JopDpdb6uq0Cafq
	DH4L1JQZxv7n+ik3o4/2hNAA3PB8YBS0ebym1/e788cZxyL2DVmTotGegCRhp/RQry4IPGprAFQ
	9in/WzPDKULGj4phGZ8VRu8nsSFKBf7pc773p+4R8r/DpvYaEGzN9+dp6Iio1e3qq+UMQ/G9QJx
	0s3oeVRtih9OllyVo9QBkkrf6RaQnOTkp4wBGMHbmACqlvx8aJk+XVJnJd1+hU7n6aHMGgI6vNA
	u2EKqmZtf2DvuJe3lFX+OoX0wajBnuJuhX0dR5awgVu7/QykcQ2cQM+N/uLu+BzcblFzKq/LmLL
	rDmNRgxZlu8uAs3y9lVKO7SVEZo01TaL8YU1rPif1wUVo4l3bEvwBiWRYxP4sZA3RylCJjyUxUQ
	H9dsrCWt7Bc3HNE6xEmaCtrs8dDQTNpOibATqhbS54JItvwvJfJ7AE/VhVQiirpbOH8l6hqnYtf
	U7DqsC87APMm66mDBtG5IcrOovuO6/OIQ6RRofHqOYMva4cww7NXT0ZT8Yf4HC14mAJ6ty+TR5u
	gqqT2G7SrWRIDw==
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr31481475ad.58.1792123934758;
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
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
Subject: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Fri, 16 Oct 2026 11:09:45 +0700
Message-ID: <20261016040946.521195-11-phucduc.bui@gmail.com>
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

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 9f36fe2c16d2..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,19 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	int ret;
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1017,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

