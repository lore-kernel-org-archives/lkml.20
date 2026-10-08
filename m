Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD8A4973B6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456221; cv=none; b=iGTjuQ+5aBsoTFr4UvrcPfHK6tOJFk7Amg0nq2/ZOVXoW4T75yNM1jWO0Jf8unU/+IXQDgSzB4Tq6L0WsOasUv2WFlMbz8EI3N70TqpXXPNcFjx8Sckkh7UvaeSvlv7nTDr9sY6w2QxDNvBXQwc05T3N+LEe+Riy1BKrI/wiS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456221; c=relaxed/simple;
	bh=M6D9aaF9YzenOEQjSguQl07lda02HnO0SBENTFTDcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQQ6UveAKkJ+cqpTLG82qFhRrBeNkGy4+MrthBCkN8lDuYyd7jIJiMzBaXt6f/U1P2RFCaHdQDQX8uVKPKrBVJCNzWqRKaiMy3q9d2IAwZUv15xTrjzBAhRihxpnPNGogQ3Hzifj981886mcCAvpjjIzHg82OyRizJOs0DkxwQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ru8D1jET; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru8D1jET"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so798665eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456216; x=1792061016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=ru8D1jET2dSztv6RGwn5H5YEhLcmlHauVuoLQhYOaqDuIupEpJwnEb+ujOWmo+WP/o
         WO8sFtDl5Hydvw4nJuegrBcYZ2DM4KESF+x+TT93EWUNNtjNREJLgv1QX95wCxOcgi6Q
         2IHyTxuWsZ6LGWuFyf6l/vp6CNBKBqXGDwjrAN2LT4OqGNEl762N985QMyTN3h0KAA/w
         FNXo+s4HH+6zNHucyE69peI/2UC4+G0YCiLMFo6JDNFyP3AnDODDQMQkNSFXyUjMCVyk
         nX3+ux8YhV2AAEAm0+TpvSO7RCC9PdGgXYjRRdMjYuMzAy87q8iotbqkzPxxmcGVRESF
         apKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456216; x=1792061016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=orfosgy3YoHsF8nt3pZ5m+Jk4w1e+KDh2Be1Xm7T6qQRuMiYuH5VL+xC0eYmRWGHmm
         jgf7ef/3xmHAdn8J2Qg70YZCkT+YofkIg7AYb4lzi+kX/BaXMLioTPSpOPwK3kysIwWq
         ve3eLZDQoA7yMiDyD7SlJJTdLJ8h3B0hgnKbnD/+3+QuXbg39SP16zp2vxu/rB99wHrh
         tchKzT3TmGc8ES8X3qQ86JZ3i1NykAsw05pch/xZB71ZhF6b9iUgCHp+iayvoXiT+ufZ
         kfQ75FyBrHJORcN7+HuGFkJSA8DQZ5iZYtCJ19jYMPc4wioNo7FTOtZbm9ngIMyokotw
         bYhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuQnqpOZROq3Guaz/qPHlKhTWf8uqmnDrjE8EDwl0ga0K1xCTdTORr5n4HfjQSLuNnU5NHhpvufS/divA=@vger.kernel.org
X-Gm-Message-State: AFuF++ngXEIAF2VCCR7CsrqLJ7/Rc2ljcAaF4yKt84MQuQLEAH7w/nEW
	9DcbFyKgsVo4/ATUaFXQp6PVeJh1HJ90TdS81h3d5LLNIu2MfAggtWcS
X-Gm-Gg: AYBFou3H/iOwO5y2uK6UUTZ2a/WmPgMvcg78vKUguzJ7/VNYl+ODoe54MTNhP2tT0sj
	bOpTCb6vcLKl/FQRYhmWnstgEJtkIDSCkmTRAWe29fVN3Ya8qeBI/h9AAARVmPvQJxQZr+VKtac
	Niz3WYx+piP1AYa+jaGg02qjW8p1rkv83d2VbcrTbKQFiFxPI3AlfXWgj1RIegNxLu6Kg5Mpfnj
	MxXqdK1fFtiWiEjJd+oU2cHnxhnc+Og27Z/jKJUWterKCc9PrQjg58/2Z3UPR3p4gnY9dvWaPMa
	tBJGHHvAIBey+W2bQfkc9EgUp90q5elytQPW/e2MhpP0MXpeoEu2iKJNgfh5K07oSw4FgMwHN77
	a/6mrlGbfoCS337Ypwn7rSqAVyU3kCuy17mRmJVl5Z6NA+Laowe7VHwaogfXWuprj6zlAhcurH7
	TBUZ+ktVguIIf66fukbcioEQTnz2350AcUKBfE613rpjhLTly1TSBdlvOGMEWCWSg8iVLNfIQK4
	rTqvAXKB4tg6a6YWveMrWeyqwOrXz6IUl0pYvDLf4NTpZSA8mALHPBiITH3ijRb9ghGa56cwQIL
	UQ+CSjC3uc3ZAog5VwOaZTuk
X-Received: by 2002:a05:693c:2402:b0:34c:e77c:f92d with SMTP id 5a478bee46e88-3515de8cbfemr6349033eec.33.1791456216244;
        Thu, 08 Oct 2026 03:43:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:25 +0700
Message-ID: <20261008103831.542533-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..30e75fee5175 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

