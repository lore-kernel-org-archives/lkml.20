Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DF23E342
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123276; cv=none; b=U9mwadmUx2j1ebI0J8hxDd+0py+1ymgxvnb4ekdSE+C7mft1zPpDMMEPf+4dVF+YRnsNo9yUFZ5Zujz2DfJ+/j4MKuyJoTjVk75rijInpLMTwRBO79on6hdgHqesw7Wh2VNSDKd+yWYul1thgEgm/Urv7m6fxpDl/VuF5Zy3tao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123276; c=relaxed/simple;
	bh=kz6hWgoXjwzN/plzsOuupJpm8SEQMOhxfOMvvFLoLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UH1dw2xQbny+0uCdZ0FY73oW62W0oy9pIzQqALxylKLVULHED+SHL13/S/4s0m7yakeMXQLiQ5ONYYpPIr8ye2WCNrqPjX/oZ9B9SV+XvPaWj3fO9OlVGwUqx7fOb6hgIRDBDsuIVc7zG1Qh2UqeGYe6niW9GP0vuAJe98Alulg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiU6kWI3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiU6kWI3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987b4a710so1115215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123274; x=1792728074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=YiU6kWI38o7n8Ng0a9H5qDIsVqCAnrHCHj1sdVAJsUntfAoVin71Cn3xhsDnYP/Exn
         pcZYJ/86txoykL0YK/CjwFnX6J9y+wBaG5FO1sKU/6/amBr78Qs8jXJHi1FiptgiM9+M
         ILBrXV3rcdDaEZinW8tA7y+yGf/RIEj+VDMQm89ey18mr6j+yvxpibG8qGgxaFPvQO6F
         svObyTy2lSHy+sgyySDEspbm9DJqRqkL0Ce5lJD2BcNfUQSSIiKo3ums+6bpcfBem/Tp
         IhnWn8kdo1BAmkQMg8YDJlLcmiXHpTpCqqmiZXzE2FFE2Jf4pL6WBF+BjGLoGmoQYu2k
         Spmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123274; x=1792728074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=LLkn/ujKED/Fn2RjmXQZytIU39QQmje1n2dyyFDxnaSVRnfBnPQE/f5Rrjh98X0Nxc
         QZkF4eBshwasUBeaNDGTbIpDM4Wb3BhkSIjzNavGV9uU9uNiEt401CodWYckZ7+9mY4O
         h5kKRNYaiA9ZGj8/GtZTgLRTJnANnt7YiHtYj2jnMgt32arLNddXqThcM/IGdZEXuiBv
         2gorhk76fSLBgSqDZSny22nNM0xyHUj9X+ZNCzAbCBDf9KvzQ6mU58DLhwqIE2CE2JK5
         8qyvUVLc5LZydRa5hJF/9Wtx2Y+8oL3K8DPwyiFUDDaox/R2e3UEfW8mgK8c2bfUTjhy
         P1Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzM1pWDWdqvJAWo1LIGl8WzZHFyhDesIU6jIZACULt7Ijl8dtXz9K8P3KSYYUJgEKqlc0kqSxkusCQQI+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRyhC6nDTdf88LH/Pq1j7VmkQDhGdV931+3r6umXwclPjZjlWP
	peoGR5Ay2fZtA8bhvtmlSTqyeoir6v8JMRHu0j5GMdUdbf2hiM232keD
X-Gm-Gg: AYBFou1IsOx6N9dKEqGy1YVneGtnEl6TPdbiMXsyi10upYexYa9xs0ggHvzxqNpJR2E
	qX/CMf9b2AxhFkrNDiUNQke8aA8JGxcwaQ7G7c5Kyqvw3Nz4wdH9ttt9MoRFCSsRmcBAuA8s4fa
	LJB+z/4ZU0qguBXeTqARpBJGddr7vQDU0+DwQq1/g+HsZRGOYorON9Z7gwSxjDQqocM/PMbbS3F
	6idtUqX4KBqhB57SERmE6A7JzrJXL6E8IR5b1PHgk4NZPejpa/s6zqTXuPRjpV4cOenaxuix11j
	+G8TN72pH7RysDdKkHpaZ8FgKBorHwXF+DMOLMljOakzBpmMeitZ/Bg5UvM2aqRJHH04Gcqhnp1
	JnOrOOViPQvAYCxqYgToCmAY4Ph3547rfZ2RpDT1f604wNZiocft2qaqi9dn9I8VXm4nZjhS+Jq
	U8wpVL+UBkMHDdd3uRWNqfFC80q7EKtVgDuX5AacVFXy1x89yJDzegOUgk143QwtJ4IuJyhFdCH
	I4kTrzescXigDanVEwMh+rzh1f1Cue2TZJbfu4vDAncl4gsm+FUTI4FystiShwDj4WV9iG64Xpm
	QivWrJ9gXillazE=
X-Received: by 2002:a17:90b:39a4:b0:3ac:b764:8521 with SMTP id 98e67ed59e1d1-3acbb9255ccmr1718768a91.38.1792123274359;
        Thu, 15 Oct 2026 21:01:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4872861sm2304450a91.7.2026.10.15.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:01:13 -0700 (PDT)
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
Subject: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link as started on success
Date: Fri, 16 Oct 2026 11:00:48 +0700
Message-ID: <20261016040048.506531-1-phucduc.bui@gmail.com>
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
from rk_aif1_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 426506a8e18e..de392b420ebd 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -191,12 +191,23 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
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
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
-- 
2.43.0

