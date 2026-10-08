Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285E414421
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456315; cv=none; b=d3IC5wljAIE5qYTHgtrCm3mpHn02lbydn54xyaIuA/FWlZy6S7PCdhYrKaE2E10DjGRRNjXEFy/C32Lt53gt5keKuZpkUGPIQLYDojV9tT+HM4bCf6NkUlLACrVD1ywanBI14qeHn5ZOfgyhuaqQUZSAJrcmnf6YrvNXS9hgVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456315; c=relaxed/simple;
	bh=M7h07h5+dP8rjX/g2P5EgQzQZW5pCcmiayOZWTe/ZUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrA+f/qzmAnlORDvD7H43lWLFcJPeNBng9IGCQv2bMeBTqiGh6TCHCmlxE/2WqqBjkMjpPZdkBy/KPeUSP/0bSfely0rS266/uSREPwuy/rjqa4flTvbm/zkIFOGmt7wpLegBAIxI9eFfNJZkJmwfroZgT4vDH7Xza07U2ZuY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flYXuZ0Q; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flYXuZ0Q"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3115c4451c8so4256411eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456313; x=1792061113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ew3yWeVvT9O5tBkIFDkvF2j0W+vU1/CnrAg2Miccmy4=;
        b=flYXuZ0Q7XYsLk0ZtoN90wWqdsmSZGQpCH4VKZwmZVq4unO2eFPDOOEiZ7YZ56GS/X
         T8gkUexz5MyIxGagtLysNnGdm4CnGKOL0L+I98NUVwa4pHv1lEfBhD9byc9Pcn5XZ2Ul
         QjeGkxq4/pM8zeI054VaGF9BU8PjheybtVrvfTGFiTo+KasNd8TH9dLhOzcHMYxSuJvE
         8Gd+IGiNh1KZmkYDzppRX2vqqeOmoMZryP+SrEaU27Tm05H2T6uqsDrH+HSGfkYNCTBc
         f5Lg2TsLgCIC/ZC9etV4ycSuHCgi6OAxisbl2lWL6/ZyBCK7IXvxriwbyK59KzkavQlu
         EWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456313; x=1792061113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ew3yWeVvT9O5tBkIFDkvF2j0W+vU1/CnrAg2Miccmy4=;
        b=QvHZuYnp+xX5QJEAnTy/o9bxO8gukkWm3RKlXVjK9Uev/qKbppkHdbyD/vv1/Cgqq3
         L3f0AReAYCjQxnmCOh+XF9ADUC2qLEoRcF8aPthgq10AnAT4zKrF0ZzpqP2vZoPFIc41
         CaP+HBQhPqzNWUG457AgkvPXCVAf3QQbJjvpkhaOh/q7SCAkypLWB+oLmRpGdRk0iQqZ
         tZkjnKJSqNPlmtL1iObJwmlsaB7wuc2dcZF1u5sR43t1pMvU350OEiOCs/WLMJME9PfJ
         Vr3RvCaPRuEGAJZJSJdnaEl+P+B5lzA5Mv24e0nnv+t10IXvewR/DnH7kIkSd7eqyxH4
         ElYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4SmXm5+ZkPZcmWL9D8xeN1sEh6Qr8Fst+S/CMQh7ftyAgZ+FNc9oFcoFkEsMSEhAptRr1u+S6SGp7dVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mLqQyzjDG7crR6Jj/7zhygE2KPrNlkm2dd1//AymkvnfPX5rmA
	jtpNd4FfsiafrehAIVfX/OYXP4ph7BqfHsx8SddGaaGCOWbhAuOXZgsE
X-Gm-Gg: AYBFou18Fxw+vm5OJPTjTRzk2UOR+yOyIodGk0G9kEfzRotg8W4UQZb82tWTuHt5T2C
	qD9pU3Ax9NeB4p75m3sQpZhh4BtCDYXPi/PaKJAriNI1vxLWAVzBqwCj0LiLh1roA7Yw8CMed0l
	ESMNb+9zHmVtJS6wMXVzvCUL1XizjgezQZ7EKj0QWJiVqfWyjszuAyTbyvyf5sb9ixkIVPuaUBF
	ZD3jxvKo6VVZZNdDfOqGnjfOsyYuGRIKdOCtOPd7qw1v++sH5G53DOReZYJaZWGHqSbAYn2uwq6
	tLL6GsvqiYl5aNSy8bu7oSe+QCH5T/SNyQ+eS2TZ2DfpcJVp+YrUOE/5q229Cb0o5RV5Z1bd+Mj
	Hfstnqto2x0GzzXCLKswJ/E5Cvf3jSe1Xcgt7jIabfR2e28X/fD2PdoZDoDRrdcY+3ErAuIV6S+
	XJVC30yDOhuP60yuOj4OnmD4xANSauMmcWDGdyobThFMEym7JR9EoC+A76vgmJ20RpWPPrV7vqy
	A1eRPRozKmy0YiEaQkaTgJ7C7OE5KuepMoWwH0xJhUq1281IRN8eNqfJ0wDY/e2IahkApb02YXS
	l6mP0pf2ZThaXg==
X-Received: by 2002:a05:7300:e9cf:20b0:339:851c:4c1 with SMTP id 5a478bee46e88-3517788c303mr2800571eec.18.1791456312416;
        Thu, 08 Oct 2026 03:45:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:45:11 -0700 (PDT)
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
Subject: [PATCH 24/24] ASoC: rockchip: rockchip_max98090: Mark the link as started on success
Date: Thu,  8 Oct 2026 17:38:31 +0700
Message-ID: <20261008103831.542533-25-phucduc.bui@gmail.com>
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
from rk_aif1_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 426506a8e18e..d54c36682415 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -191,12 +191,18 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
 static int rk_aif1_startup(struct snd_pcm_substream *substream)
 {
+	int ret;
 	/*
 	 * Set period size to 240 because pl330 has issue
 	 * dealing with larger period in stress testing.
 	 */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   240, 240);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
-- 
2.43.0

