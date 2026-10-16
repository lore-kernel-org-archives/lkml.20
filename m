Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2538D01E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123912; cv=none; b=GmpLCcC/gVX3DdUZuVbctls64aD94QwhMsnvPGkrQzOGaJgZ+zgVRGrv19ZVB+bFsndw2sLvoCx94tTpidMNR9Cm3dJ2ervltripmbY+rfEvgIFHLCTXklgEJ1stxu4iQP1QD7Tf4fNdklkvFaqBYf44A/vnwLfFafTw+M8x6vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123912; c=relaxed/simple;
	bh=4ChQc4DpaiRpFVYZQOX6JdbhBOh/CN3kyOWjnYuDL7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ8bXvPw7vDexLKzg57EfD60yGyBDrTFdNSaMXfCH0nMOeilGmMeddop8r+x8OAe499p8Hd7bysuIKjwD/085DoFK+fuTLEPlkAaHhk4A1c+nc+RZNa8UiB43UQpd8qGdywGUXKMonIpaX1BOP+2HLITYWxIbG4nYeBAUPoYFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkSLpo0d; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkSLpo0d"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e977109392so5456125ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123910; x=1792728710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=IkSLpo0dg8gDTpc7uXJgGQtTQah0S3KSH+fTDrP0VvdSOPv0+YZwwd4RTMSreURrhC
         n8cO88xjNHxVLGmzkgxPLWX+k802f9Ayodj0odcf6WlosvVdPCEH6OADiE641kq1jEqA
         ulaSBc6iKoTgqUmkU69ADiAxmjCwjV6TUsFy/v3fRKm2p6XA3dsqQVnZWYHvs9Gv+C0t
         QuGujpf4WlyxeMJQAg8E1oruJZFKUEamICz9VMn1RSoKXTNfpmCaWAHxPZs2PHAW3uBb
         zAW4ABENh5X3SgF6CmKjPaFpQ9HV7OHZwwJicWacrqyxjDOErCjBEHUj7k9KXRR02FrW
         kmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123910; x=1792728710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnS3efznOy4aR/sEoOKiH1O7kNcA8JAEG4dTp1VvwAA=;
        b=jElTd3iLkAJAcCzjmilVTFlzQB6rAlb/UXzbysSK6jeuXjY04dqWG3QjuoD6SymNdj
         4wuvJSvKg8OdNlND9auAkZUmq32RxX08v5a7EVnIjp81UhoP++OJmCXBnHvF4oYK3/IG
         rbilVkTL+8Jx56sPWhraK76V/y2I1u0CYzxKg+sR/7AQbpp8LyIuFF1VoEaHtZGu7rxP
         mZEoUthHBeJgfCzOeLM/z+j21/fdOhO9sjL7HHQSRaXz2zl8zaah1aUC45oCYODqxMSa
         ZhQUNX0bSp7xPTNJ1WU/EzEDgnoZWAqxTvp5Qx2ZWEfbxNSyQUmGlnXCMjPJ3hpiqqqt
         TsVA==
X-Forwarded-Encrypted: i=1; AKwUvBxnc2B54g0TtuItfLdqiBl2D7VBr+6KIysX6ch8D1HzAh1Te40lLTOc2rSuKjj3w3pSVQ4DOFxcTo9Trnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8RFw7elJ3oAd6OYmVXWqRm2M12tzw2lzCs8PjukhvjKjoRZ37
	nlmgLJhw8Wb6CN1yJ17lrxK2tNjAe+bE4cb++1FycEww9WtW7WoUYfzw
X-Gm-Gg: AYBFou1Gzc8JooNiso4soSP6rRnocm0B7vZTEsE9svHbU2ch7nDVC7Og/hNLGGwMYEw
	jJtNWU7xQY16TkM2zTByyDpWMdCqvNFL4HMfLgThroZk7Z5ujRNDM8Fe2u4OksNbLCnF2W5ZEyw
	Rg3Gmcp5BbrOT0zujGH2TmGHJSp0mIEns0hEH6Akr1AaLNI3UFZ5YPdnkhRGxux28XRbuXhyupK
	ysf7Ms5w3RhP2OYY+N19uFD0uupsxOdfUuOtRjRZdbJfbb1R2SEuWgxmIUEElykDs6pr2ZcYzcu
	uM+1sN4G5dLkjsFumlOCrhaGBAsfvz7wkwPtn3bsQ622MyKM33mDjLOIhAv8bMut928q6ELLBxy
	K/p6W2CDxbRoIFzi331c5k0Wqe6WGvG20xDy61Bpcn55Vu95Az4pMbzxrD6GVWknG+Dm5CBCk66
	X5fteodPnt83qL+GSWyPZKgPX44psuqLuHS+qSqzEnHrypTkUxKr2/n7kAY07LjrizbnJrw02CU
	Ob6lejtmDk4TiLsDno1/Ynf8T8FImiWGQy8QuQ/9wZSQVFK0/4RBOV36dNsr+4XLDVDfyPTLppX
	HER5TnecYDKgTQ==
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr181177615ad.59.1792123910214;
        Thu, 15 Oct 2026 21:11:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:49 -0700 (PDT)
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
Subject: [PATCH 08/11] ASoC: renesas: msiof: Remove redundant period constraint
Date: Fri, 16 Oct 2026 11:09:43 +0700
Message-ID: <20261016040946.521195-9-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 9fead9a22cdc..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,19 +419,13 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
 	if (ret < 0) {
 		dma_release_channel(chan);
 		return ret;
 	}
 
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
 	return 0;
 }
 
-- 
2.43.0

