Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6C37F732
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123862; cv=none; b=u/E7YX9iohKJmd0QfwIYzq9LY9pljH7n9bRKlsqiREYXRS6ZHNMRKQHn9hthATxVD/nOl8V6NZYFj1zdkAJ4sgyCOcuQx0MkoemYmJsd8YnlCJ1JUFhJ9elQWpAr6L3/Me+qPVC5jOztoOm7unAHX/I+3haDxzt37/Ss+0Nb6Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123862; c=relaxed/simple;
	bh=8/Qw16cRyomYBknzWMDrzeV1i/FgY3GRJD6KWvhZd+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0VEExEAPMmtU9Y1WhTdt++wEz2PGLlBAqoEz1yqljRl10WWDR/THmOG7w8nxpR1UpPl6znNptxchzc1Lfa1ojpOnje/M84pf8bmIhoKJ7b0r/K12PWu/wXKu6LRYEUy3on7D7Be7uD5b4JFf9FTPFQzJknjTuB5nKhGlF2rxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdquPotD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdquPotD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e831e86ebfso16177765ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123861; x=1792728661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cGMzRNU9hZgiCZEwiJrPZgZXHYdPhSTuWZRtxpdn1k=;
        b=ZdquPotDlH/uWLdTAudKbVKLCOhq22smeQVAAMICRwr4TKBscwlHw9ufOEybbYCIjz
         1y8IsbZnOa0SDXohWRXZX+osaj3VNybya2xGSD9TLz1afnIwSQeCl2DDB4/mmaugWcCu
         yBbgsF0MD79Eg6d7zcVHoPMVmogaB/pVlK4kr7w5uyD3r7I8yMv4jikGWwpuhWvmqoix
         LPb0HBfi2ImV6wtUmzKUFr5d1FvZEYllL6W6oFD0tc93+jy4+dKbE0TsvLgCGi8UDbXx
         QcUn8uWzajkU2gnpuBTvZmtZwOd8FArV0giORvpjPZfX0+4Tu33jv53VkXiFmWgCeGC7
         FoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123861; x=1792728661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cGMzRNU9hZgiCZEwiJrPZgZXHYdPhSTuWZRtxpdn1k=;
        b=sqAUYgS/rCNizhdpTvw/n68+U0dR5uQfK+h5x2f4FIiZBI41R+xC1PESdv+ccPC91j
         RdnOJ4vQ4/z9pVL9l5VJSTkh/VZEAJOOh3x1nXz2jYISYRwl3Iw3Cme+3bHAZ50E14Jl
         jPsMO5GJ8xSVG+tJqQEzWnEz9pPn2UQoDQnViZX5RuhAewai0b9tihfzbW05yggGyZJt
         p6cMfU87UTYKYDtDAriPoNRSG2c5lULi37xnA1UvbQ0laMyOMVzISoi/aDa7IcOvQq+z
         Qz13fUnnhSORtJHLqt/fgVwCgEo6EreZazp5lQ3aHVl2ma6/y1oRhKer+QJ1x+9n3TAm
         d5Cw==
X-Forwarded-Encrypted: i=1; AKwUvByNIuW2O+kx7MwPHyvC9uhjt/xoBAW9YPAaMR0hH/taWgdoBgMPBjW01QwzkrUwpsLsDSeUD6CI0HgmHBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYImuVf2+MDsBr5AT5/6YKf0MVo3sfvyFTWRrRkfj25pbG5E3lz/
	NxgEgiMTlbmLgQ2ExN3wcb4LX+LUdGn/me8lT8JBydH+SBx5mNqUPrlF
X-Gm-Gg: AYBFou2oc/XQYUX981yq46ZdELDwki7o3mvsxNg8ZzQ/ZY+ECWfGCSENJ2NxgH8ZIoU
	e99AZDkw1pGIBdFEeTmnXwdujPY0C4gFTEPowJMDqFq2ZIeemLTb9Xy6w6ommE5OFMW5gec0SRx
	qTJNL3PLgmLROzRbpgiWySdxBbNqGaY8jSzA+LVYLVC0H3IArihfF5xQG6t8iwDt07pHfP8U7dP
	cDSGzIiOHVJfwgq6brs8XquM1FjqDVs1AiuAKQncOpb4jZaZdAQbM7UoxkKXuO+RZbP1O/j5sKp
	4YWJyJeqicle4Tw2J9ePbJNzb3AFOu6F9U30If3J3MHcvKtyOBS1SKVPCdhzYzVtm3A7SR4dWPW
	VT3DhSH15V3SoqNm88LNtHSF0SKiYT9U+OGH7fEraQ8YDsmGr3JRxLsfru+lmGXhdMpw7V80aN4
	whnQ8tSZxik3DKh3aucJ/6ra2lbM4aATYXq4DDhukwGZV5fnYwELwF4TG66TN0rheFIKMLltTqL
	sw7Isis8PY4IiT70+IyvVsgRxcEVSK+ucp981/UZPPepl1G1tbRH/jOH8lFyriHqFAdKnDoyc0U
	UwfNucoN7ibL7SepAdVRNo8O1g==
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr187140595ad.59.1792123860729;
        Thu, 15 Oct 2026 21:11:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:00 -0700 (PDT)
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
Subject: [PATCH 04/11] ASoC: codecs: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:39 +0700
Message-ID: <20261016040946.521195-5-phucduc.bui@gmail.com>
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
0 on success to ensure the DAI is correctly marked as started
and prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 5 +++++
 sound/soc/codecs/nau8325.c | 5 +++++
 sound/soc/codecs/nau8540.c | 5 +++++
 sound/soc/codecs/nau8821.c | 5 +++++
 sound/soc/codecs/nau8824.c | 5 +++++
 sound/soc/codecs/nau8825.c | 5 +++++
 sound/soc/codecs/wm8580.c  | 5 +++++
 sound/soc/codecs/wm8782.c  | 5 +++++
 8 files changed, 40 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index f6e4bf6206b7..18d6cb9bfa2c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -907,6 +907,11 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 0902a7d7730d..5ccf4c110567 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -501,6 +501,11 @@ static int nau8325_dai_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 9484388ab262..09e7f31a904d 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -431,6 +431,11 @@ static int nau8540_dai_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 935df063822c..7b88ee3159d1 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -841,6 +841,11 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index c89889aa420e..046cce9192b7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1073,6 +1073,11 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 10bbfbb460b1..af2a49c893d3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1273,6 +1273,11 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 5343d445c322..cee80da8f753 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -860,6 +860,11 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 767251ac4f89..cbf0c823c022 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -46,6 +46,11 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

