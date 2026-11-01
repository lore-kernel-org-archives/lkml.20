Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505723;
	b=csZFmGJNrBZonHnsjngV93z7jRa5wwsgTMxXvKkPkrfWfPyaKyv+dviGqld1FGt5IGfW
	 AE8ZYBx1nkw4d/giNCPlUhpBGe43l2SHqPDiyMnusWGxksKGku1foWsCdDSfqND4YjZV3
	 oGrECY4ImV7Kge95fE3zl6GuN2cpPGbwSUgqsv+mM2cOD9aL4Iulwi1bVbgLuyvwNiNM0
	 G6a/EMiRXDnIrtC/8CVOvOyir1hEsvGNTJHOKm/koYHqqnFjB7sMQqS/9UryxJRYN8u1m
	 qqc5Uva+2oGogfySxpyo8QkpwNEOsd+FKBTAHE3sFhWkmiKkD1evZwysLAyXlLDwOBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505723;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=WIsAYVuA2tUNACU+9ZJPOaIId0MsnHlyEuV2LWfZyCs=;
	b=lmsFMH+0Szxn06gJlnzKjJmpfMUyW8k56fjjnHvz8HA8inCKrCXAwdagTLfChs7+oyF6
	 KdHxbPZ/p6Yrx8zuBLft6olKGXWDPLVHe0DRQfx5wfcXwk5qOs0M9tA2JYtzoNgcmRGUP
	 cu/KZn2wGfZGCpyjOtsCpepdud5Rnwy2nS9GBqwiNAEQd6+/tn7pwT8oDG+ai/iXbe8Se
	 nZEKH7sZPMreCBQk0dAL+l1L6JFreYm2nQWoJKT0Wk75EhtCPt/Vz/0BOyU9ZuyxoPOYt
	 HueTpkm6eTh/t1Yn0OfhGvI9tq49bRe6MzkslDvGh3ZF8CyM3C7WUewDiYOa+OeWwuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MJkEViPB;
	arc=none smtp.remote-ip=103.209.128.97
Received: from mail-m12897.netease.com (mail-m12897.netease.com [103.209.128.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67864606A325;
	Sun,  1 Nov 2026 04:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67864606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MJkEViPB
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d8413a;
	Sun, 1 Nov 2026 12:01:50 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 1/6] ASoC: codecs: rk3308: restore MICBIAS voltage after reset
Date: Sun,  1 Nov 2026 12:01:20 +0800
Message-Id: <20261101040125.1864141-2-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19545536003a8kunm8fccdc7416d29a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBlJVk5CGhhDShhJT0xIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=MJkEViPBLLrSVBmi0yY4NY0W388ta6Dsn8D9yLl6XkrKHhyUi6ddDSb32eZVBeQbHx5/vHz0E19Ay8fYxJd6Q7SVG/ICIcU7vuPpja7VHl+Co21D3eSmoB70q6UxBQ1X3IITrTEjxDYXAL3OCTsEAEnoHelm/ZKimyc3vY4SfZo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WIsAYVuA2tUNACU+9ZJPOaIId0MsnHlyEuV2LWfZyCs=;
	h=date:mime-version:subject:message-id:from;

The platform probe programs the requested MICBIAS voltage before
registering the component. The component probe subsequently resets the
codec, losing that setting before capture starts.

Cache the validated voltage selector and apply it during component
initialization after reset. Keep the reset selector when the property is
absent.

Fixes: 4ed0915f5bc4 ("ASoC: codecs: Add RK3308 internal audio codec driver")
Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index a3d41cd8150d..7a18ff45e391 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -46,6 +46,7 @@ struct rk3308_codec_priv {
 	struct clk *mclk_tx;
 	struct snd_soc_component *component;
 	unsigned char codec_ver;
+	u32 micbias_level;
 };
 
 static struct clk_bulk_data rk3308_codec_clocks[] = {
@@ -840,6 +841,10 @@ static int rk3308_codec_initialize(struct rk3308_codec_priv *rk3308)
 {
 	int grp;
 
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
+			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK,
+			   rk3308->micbias_level);
+
 	/*
 	 * Init ADC digital vol to 0 dB (reset value is 0xff, undocumented).
 	 * Range: -97dB ~ +32dB.
@@ -997,9 +1002,8 @@ static int rk3308_codec_set_micbias_level(struct rk3308_codec_priv *rk3308)
 				     "Invalid value %u for 'rockchip,micbias-avdd-percent'\n",
 				     percent);
 
-	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
-			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK,
-			   mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT);
+	/* The component probe resets the codec after this property is parsed. */
+	rk3308->micbias_level = mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT;
 
 	return 0;
 }
