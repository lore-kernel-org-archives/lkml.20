Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0F2472A2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028776; cv=none; b=lqF7Paxj6Y+s1jIeCP8Np6beQn9+Y7UGJPfoiEUqx7Mw5xcRiLwMgA3JOq/MpdnQStllstsBjP0uY3kG49pU/69xmJgoTGuNcdeOllJcSbU7OD3XXFYh6A/SghRk45MmhJ8//iE5fWrBSbzZEtcSbJvPwbSkdH8i0WCnUaOjKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028776; c=relaxed/simple;
	bh=yyOhgd07c+cxIzNpWT9aCbeZ38F5m8HPqyV963AJgU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJkaEdxuOmVr7tjrZz++Ul00kcLtCya0mvUN8mQ0qkwcHbDhlzH83nhzXlHpFuB1Gp5Jf23In6lbFepr2oe/KrkPe2702+VdvDnrscPAv3bV+doaIYKtOUChQhWL5nVga2GcxEdT+RasjjopfDH0w93tIds/0lJd/JK+G2Tx9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXGzP7BS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXGzP7BS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e86dce4510so24244425ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028774; x=1792633574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=iXGzP7BSbNs94RxPtyeSJ5Gau8VP7nk1AW5pbIRSAasb5Zj7SClkKqkHjGcI2/STmC
         EURBcvHD+b0geswJwaWD2XHthls6gn8g3/2on1/deJTQypOdD9TnULzHXkTTeXpaCTzw
         rZa51H8C7pMxc5QCe+41Rkvw5X7WlRYRWcJAsPmELQa1r5MUvUdBcSjO7iLtE8ODAMyW
         aKN00z62grjsheCKCsP2xWu6OKosVaogqkQ++35rtb7Gs8pjXh0STpJ6x9j+unbGKmkT
         Tc68jtPOc0yg64Lp07L89zrZQBhg+YVvh2Rs0o499Ke5RjTGQFjWy3RrMZAaftT4Splv
         70gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028774; x=1792633574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=HEmIAP/1agXNWccWxxUA6O68xtzUL0s45gTwH1oURfGzkRdhx9oiEF3wwiiQR+vLlb
         O5BqcwA3QU9qWLZuX4J5BIVbqeTTEXmhF3uPSUjwobEP2uWpRolgv4Bk1rDdrDvPMkSB
         sLVM5naFkE0O4/JKmaTk9dkEcnokzOT/K3dRUT0agQit8Lfh2xZhDR+NMEDyaTqWKxnH
         NoJNLEyh3mrwCz8AGUMJqL6p2z7P+bj7UcuyBzcl0y9RykzZd5Wqu381lTM6msgMAkLN
         X1qLLvG0pfnVEAHXKa0eH+r+oEdgt+0BqNTDbniiK2Gha3i1IOPA4MWJkNzbQsDuwSnb
         geKg==
X-Forwarded-Encrypted: i=1; AKwUvBzw9Z7yHv0AG62KjXgWaCIFfa2G+hksBWEiw9i8H6QGPew41qhq5zf28K/01MvOr0e81z1iFTaFw4VAclk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMel26Bk1XgGiMuLUjIelvIR9tOOJquXSAMTiHv/p+jOSZc3AU
	C5oiXAlPZO6hcVA/pvF2Ub9yN1FafRstjymSTH/LMFLP6LwTnOD2VhIR
X-Gm-Gg: AYBFou1HZdIl/LbLHiDjABoN+hd/EIJQ3osgkbDy5yiTDNcrB4v69CqFz6VbdETwK2t
	eajW5+Y+yUMWhEPpNQyKTU3mqjstGdMrciG80rXHnqV0+9BUKPCLd1FMRFT5kFHNrxgT4shhlr0
	+ilaoB+GLMx5dpQMAnYzHAiwKwWS0AroimalAO8x3ldEEnPa7hhmBkhj9R0c1RQJ8PFxbAmXvdo
	Vj7DAOGnda8o6GBUaRu4IxCEZHZSGddN0m/tgX9ph9iLR24ebBKjn7oKkxhK2rFRNGtenVx5KbD
	vzvJ2Bk9g7CS/eTEkoFZqVF7v590osjp3BM3k59bObXkOS9iC9ZAmRvKskHtmJ7Q+1atEFxHnv+
	jfcrgRzLxYlSScKbR4CzoT++6zZl9ieJrRU7TGc6/cqozTzL79OvlqVhUs+/wgJxgT8f9JtQQKV
	Z9etz8BS7hpHFl8x7gVJ80bUQlL6njNdzEReMDHsxbbIbv1cHuIvUax+w2jPWiGaanUE08+ITp+
	61Rp++nzqwtNKJ4XIVM2pDHRWqeH8bBltq6DHr2oJquKCFW1MwWh0FfRZ2s9DJd23ua8DxddnCd
	uUnceeCZLg4Xpw==
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr138459075ad.61.1792028774224;
        Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:13 -0700 (PDT)
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
Subject: [PATCH v2 08/25] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:07 +0700
Message-ID: <20261015014324.5569-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,18 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
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
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

