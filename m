Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4003353A6F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028873; cv=none; b=oCA0nAs0Bz4TOyVtX5caJKNci3Mv6BSwcfVFbjzpWI15YfMJb0wwHXTntHJgjUD+W2Tk+JyjhHccqehOBw1TtXD+6+nrufgvP+3cqQr5XZ0CN5kk9pBIY7KoqECoJIE9geBgZ8nB4/LECcaLns2uGt3ijvP9nzqeiRpgjxmcfxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028873; c=relaxed/simple;
	bh=lTLKa+91g0xBOu/fagB1HB+X80BcBi+hkbX2nHYkS5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/3htilYmaTNXypI1gHP9Q7bfKA+E4I6WKAcxidKvb5Uj9b4j8lZcLXxwIvMKEQcF297srJTOLSkmzD0OxFkMZLsRwNmFRzFXtUelmKpUz5q0YwlPVFwC83qTY0yfDIR+PXygDYVAIcLHEsXBhjoJdQqSCrKKb1O5W2ZKAA3Oqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyJQ50XL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyJQ50XL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6e954afbdso7416215ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028871; x=1792633671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=fyJQ50XLD0VGhFdTUS8F5Q02f8eZQ1wnfChyTmn/KstNhFh5QKhpibH9Q3TMB4pdCS
         RGZTitI0b5WwIBzVMIo3UbXwxF9JbxRpi3drFRO5GEAbRmtV2OBibX177V5JICYNZ8ie
         l+n6IlxUj5WUKNKm0LzdCZnT8antgVmQem4/e22H6pMfwHmFFUV4UX1FS8uY6wraz5iE
         qLTCi5YMkLdP9ab8HyM15Gjznt0J0ljH5cp9+qjFXIplpWZaJBfdHJ2AiDWxUArmwOZY
         Q++5igF6c/dus8/aUKLwWao/m73POPFl4L5DJtwSaZsCZ9wLmhEl5eXCDmVnFlEeTXSV
         injw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028871; x=1792633671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=Xw+yNwV/HcG6f0NCUdpP+/MvVsgcCsa4yBA+S8WXNXb0ucoQEAxhS8xWM+I5SqQ9m5
         76+RKLA12ZjN7/sL6RQATbFrKuUgIBEUPrD24SbzzQtCCoBvCTMRzgbF+R2wli8jEIke
         0jL8eLCjJlKtmaKvX7VBPdRY5oQNpfGGdRZ95hwN18JGsdwBJvV5KgdBtTMT5wV4+RE3
         enG1+YyjBCl5o43acCFOd+D4JW5ikXy3CykKEe+tyH5xz6Y4sRr/Yw63HYqr15TOFDcd
         YARiusUvU4YkmH03cgjvIDgL2M/c2/dJDhoDBRonNyvOHva8K+UXGUOKUktk4hhA+AbQ
         f9IA==
X-Forwarded-Encrypted: i=1; AKwUvBw/gyxm8PntpcfBAcW7t7xq9LDh9Vwa4zEleX/gcf4AyFXkcXwdALDQS64FXmrSbDTgmFNS9R8qcXZ5Tpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk1qZa8bPYjjEJe9wFmPgIiqQXeAbkKaYuTv6Vx8K2zI3fEve5
	ndK8Ly4KK79BoPnBMBFd6Lgv6lKA/3pD8iMCkBgf0NbsDFAikvoWOR5s
X-Gm-Gg: AYBFou3B49hZOxlVTOZbV/3t8e/3x36iZKi4JsWWKXE19OyKg52fzZxjz8byuBXUlg5
	wbvG/Jf7t2tfjtF0EgIROcwk9uUgZRU8J5lzrMWocEHRCWgLTHl9ZIcOSHKgWVqr+HProYgwUyL
	kSXPWE11fGqubRqhl/RrrcU5WN7qdpDSD3XLhKBA2IhBHKVZWx/GxX2ITK8l45C7eEqgourrTRk
	C0u+ROUbwVdjT+/Gg5tY5Yu7g2jafeHSI3Ax51bAh86ILCcynWY7hUnq8hV1nDlZdVwGteoQxE4
	YtALZ41aq7FbcwdaJJXciB1siQg6rFni7c5RYe14340vBXIMk4qOiYo4FyDnPdMs6b6hdp2G8ar
	x24jjm42OCtzRa7IL7IcVqZJtgKEAezJh00MAkuLxHYrjHd3tt1uNKvSd0scUvKX5pBATw265Cb
	90L1CwvzuaDQgZ8YEgMfHXnphzp8WRGMh1AvTzsdjFyMilwqk0qo3MWHQEaNtSWuVMe8r5o7zIk
	lQssiAxb1olhB35RkKoYMc4X/dgJNL4WB0XGTL6Resz93JmUYeZjEOmmlbkuCEFd8soT0WWsiuA
	fwV4Sm7UAdpVvN4=
X-Received: by 2002:a17:902:d4c9:b0:2e2:dbf6:3744 with SMTP id d9443c01a7336-2e842ce7d6fmr143717775ad.42.1792028871192;
        Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:50 -0700 (PDT)
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
Subject: [PATCH v2 14/25] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:13 +0700
Message-ID: <20261015014324.5569-15-phucduc.bui@gmail.com>
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
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..046cce9192b7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,24 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	const struct nau8824_osr_attr *osr;
+	int ret;
 
 	osr = nau8824_get_osr(nau8824, substream->stream);
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
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

