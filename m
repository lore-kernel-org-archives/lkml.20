Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6D367F58
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028792; cv=none; b=DJ7yqIGFaeBCB+FxppeiOcUKKaLtJZNb0U747xf/UKXiQZySEQ6g1wcxA4+Mv++xSAWNbwEpin9qSC5CX9xYi5fy46n0w0SRxlVZD6Q86eAPNdyoyxuBxBjgtfBP8aYNSejzd6n/LNthq9SvlCWl0gWGcl/HdnnTOKekZPy86X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028792; c=relaxed/simple;
	bh=JyLcEpuVNYAJZZcS3MtfM//iTF4DoBGRH1sMBv09uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUiW0d65FBTwxL+ey8NELGn77lyAVrvlN5M2hotB7Xidvc78iV58QR6D/jqGM32ganWDoT2jRgLc3ZwklhONd04rlJjRuexOmmbirlRQAxrjOX/eRU+AHBZ8NiPHX6YAJMAv/3lOYgdqhq4rTLTP1oCeX6aVGUg/D3z6wg3L9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sui7pE9l; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sui7pE9l"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e934449bb0so11209495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028788; x=1792633588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=sui7pE9l0ruWCQ45xTBS+mPN14NATdBzveKMgrwr+LLMCcx4+yXA3xDHoedWk6FvDM
         tXPMGe+ukdI9CzVCyl+SZbeIffszPdbcjv6nNQp8eoM12o3BrUwNZoM0G/IGQuH9bnQK
         9YTtGtMrMRlL8XENCY5g74xHcb2tjI/UHeRVhpvbg8co4d8jFdOJuaK3ALfuvED5/fw1
         K6ZFn3POWGR/KRLscqJwgxxxBqB73mEXQW+Vkb07d9i1xJSWKwPojzYy3Zy+cN5QUyzR
         n3E6BazfYjLmLsKFPC6kh6YTuMxK1tMub15QOlmUL+DmAD1XGhJfiNqTnpRsU7d1N6IY
         gWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028788; x=1792633588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=W8Bg9elHvRjJBKSvyMm39Bk2tkF6qXPkVY40ukvdVTSraN1+Y5NxBdwyJrLmEkY7Yp
         I80n9wQmQMc4Yg2NLii1miKb8HqzF+1tVS+M7611TCP4lOWScr+RkWAiKg+sVFLC78zR
         dL8yUXH8Od7y0lC0wgpKY2GPYgV+glSQKjR78SotSTYkTbWVbbV0sPC3E9aB8NRIv2xl
         7+MxBtLyVbvJD4wFw5ULBDAw1sRJI6XGi4XIr/D3KKEfFJnF/R9c0kVixIV9r6HpAhZ4
         M9S9iQfoEC4m/Do8qQb7lHPVK+YL1hIG96b8l7Agtv+3JqS3fX9QQt4468Z4XTV2/Ak2
         5eEw==
X-Forwarded-Encrypted: i=1; AKwUvBzV9whcot8oHCtO6r2SPn/rm/Fv/CQqtzaXlzWvIwjYWSMF+sMHgwnbx9nfEQ04dPfOZEsLlIMdNe8OnmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLot70m2rpc1LdkPrbIHMYNAuiZ/Gde1SHCWvNhS+rD4eok7TqM
	ATrEO3P9MXV0e2y9ca4a63Nr1+hUFa8KETjwoTKU9CuXRpd2D7mQatw8
X-Gm-Gg: AYBFou0ybveQXCjyMLF4WeimQk3ArulHscrKal0/FruHGIQSP2waOLhLWrel1Cdrsjz
	U0Wmu+8E43NWKvUrlA7WXf0iCzDB3iriq678Qwi9O5eff2iz47sCSE2+PLXRit/6ivzE70lb0JN
	hdXyFo3A2swnXhsegg3Y+VJxvgalHTZDOtUpUSESAn8Dc9a1/RwOQWrLu8KLUj/gdwf45RNHprz
	sn3EUq+ABdsQAG23gTaV0rZpuBMnoxfdbRy7sEOP/MDLlebbng1MO1RqyuIqFOXUwCdBvCKUbRc
	zJchZLZKI71/uL+EACqgYt2VeTMRtFKfKhaHh9PAplV6+i9l1Mqw+NYObrRA/saHgqTQ6CNFeKR
	5WFy1go1wsn+LkqVCaNtJ4jOBW+KbwRMAaKVt1jqrL11LqpYjVpw/ZOai1hOKBgKY51E80JlAN3
	zSJCJh6Z5lvxl6YRucOr/tTiSxUyb4pA1m+t9Thlr4CPJiPokip8fiyCOJROhZLp76WnPie0c+h
	99FX4fvIIIor1wmyPXqOF3nBjGn9AQMVEOJCqiHsa5zHCJ9+3sdbcfNWZkm1m77yK4J7ZksGdot
	AN09TbbtSe2LKw==
X-Received: by 2002:a17:903:38c8:b0:2e5:e3da:be04 with SMTP id d9443c01a7336-2e84304792emr134212015ad.59.1792028788486;
        Wed, 14 Oct 2026 18:46:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:27 -0700 (PDT)
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
Subject: [PATCH v2 09/25] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:08 +0700
Message-ID: <20261015014324.5569-10-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,13 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

