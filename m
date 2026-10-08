Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A13BB12C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456253; cv=none; b=PWSi00buJVHO8VllX/dK8xCH0Faj8o0eDS1/whHmJZh1As+IKPFLs1vBjmgyKTBzHoopwyPmdGsAgyisiTmpqG6JGGFf9/82vWsE4xEo/a5I9DV0HfnyoC2WBP0o80Iwug4aCFclwDmCTbOhOol4I2dnDzfUBrXORUEIClw0pxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456253; c=relaxed/simple;
	bh=l1HC2BErZTeFg9PacGbdvzlNTd3R8UQWG+h9EUzSDPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aasR7mgShAVJyQEYVR4MvKAjyG7/l/WkydWUdS3t32e+gPMPrhP8ZBpp6YS8rr9UHP8HPVO5m5hwrjnnjPEMnfy42e70zdbIRKDzsvGK9cgMzjpAAc/hmE8GlNpS6YAsQVYCMn2hrDkEZhSvcgG5iTL3ndId4SulfYRTVRMXnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2hVVGS1; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2hVVGS1"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-351767ef18cso1965153eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456250; x=1792061050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXKgERfdgngku3yQUE+LcMSxD8yCQ+a/l+GKCCFjt4=;
        b=c2hVVGS1qP6BYZpO0J6o+VS283uSdirhHU9h5upXlurXs6Lkvo/2FEOzuW2MNe+sQF
         uLgbdDcnUM8FULFJO74NzhWuAeM8ltC9wb6ByiGdvrzOUhsI6c2RMI4dwJ0FsSdgbyUC
         Maxui+3zhwmveOjeXU/hoouwspCsq4UgVrKdE11AT7iEMxD2m0ZkGhkWvJpQVYTpMg/E
         ZM0s9Vt7qxhzksYzPUKYRl7zIdpw/WKeWZ2DAbs7VMB98pJDK1c47ybG8Uf3RqyhIYD2
         4dqGSmvd2kUu0p0CKs0QukksUXBUYK8ona5xIemI/IlUQoQqgMAn3LFM6TXqgn0xH8Tb
         o4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456250; x=1792061050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLXKgERfdgngku3yQUE+LcMSxD8yCQ+a/l+GKCCFjt4=;
        b=ANUPXoBp2Lldzm36avqbqonTsQmgaEVHTrfX5shetkWCGEnzkuoUs2e0bhtdTJUQZ3
         AZgMAckys+yen6c6VKLG46CCQfOA8MqRNU0aBquxuIXrvgQnH8S9JGeZLo2Y4gFSxYrl
         9STCanicHh3jUtCJTeGUm9JjcCI+Hg71uaDylA0HCE8dpu+T1crzcTKWLGDSsIB1OErz
         HAMVPE3Z1IdiiOXkqeSnU+guxzUlsoYlMZrOxWmydbHT6aNP6W9+V6Zl2pcm7cNjqXxB
         nooC1V8jKPlXa863LUoB0Aag/ERpEpVxIq0DJde1QNiRLMUIZHPDpkj540lZuyTN2BzM
         cT6g==
X-Forwarded-Encrypted: i=1; AKwUvBzDREpGxZTRDQnr8t1POQI+e1Q0cvaxmiNu3MuBWVVCzZjWMnFU2Su+10/rj1EahQ1xWXeYlCxpQbQgCEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYISZO1blQu8auQxWHrU7RViE9qP8PrL7bc2rV+FO7e3bxBTsKR2
	AYyHNfPn4m+bBTgHE0lgHvfdW+5YBpmYadJw8pQ1xtgFeNnBxt3uAQjU
X-Gm-Gg: AYBFou2Njkn5hmbWj2UkzVQg/+abk7zGoMzGo10b7IEQ+XmtUYNKN8oGxPa7tas1f+s
	C8iT8QJuocMDoqxwus83xyEeA63v3k4EYa1xavccBIRUniXQzpuVQ+WG5Y8IU+bMtEmDsevgkoV
	rv6L3oX1E9yh/rsW97n7ZI1NpVKPGLyDBdXpOpQ7isDw3ymjhkjfKXJmRgiapcrWKOiXAGVRQZT
	tuzpwBTQj26Kg6Sv9hISQQ/XIuOP6vjFYgeWNLghLXMUEGcce5QL4oBwApF9pUxte7XOjLMxOCF
	xzcJeJusnNods/oTV48klMVbXDqaTuOw06D55ZhMQQdA4v/srGnq4Ef9ViSgmmFiNMJi3Lx5IIE
	aLH8ldVSzOcNhT4gCRqLFvwqO4eC5PTvtWVR5qcnOL626NoDTAzjAdgUNzOh+/2pZTL3o42m8P7
	0o6jT5W/MMMm+sIszUhTrX0Ny7G/axNULTECEKGbh3OCunwu58Jzpq6V/jrlUJdGz4w5R74Uwrw
	X4lybfDy5nXOZ2hGNT6C9ZJorVlP1MT/uxX61FAVvFalmxn5MJyccKexl2JOSYwqtJ+9gkcgNb2
	+O82Vyu6nba+hQ==
X-Received: by 2002:a05:7300:d214:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3522e10401bmr948755eec.36.1791456249630;
        Thu, 08 Oct 2026 03:44:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:09 -0700 (PDT)
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
Subject: [PATCH 20/24] ASoC: renesas: fsi: Ensure the component is marked as opened on success
Date: Thu,  8 Oct 2026 17:38:27 +0700
Message-ID: <20261008103831.542533-21-phucduc.bui@gmail.com>
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
from fsi_pcm_open(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as fsi_soc_component has no
.close() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the component is correctly marked
as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 23b7e63596d3..88618e4b052d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1811,14 +1811,16 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret = 0;
+	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, &fsi_pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
-- 
2.43.0

