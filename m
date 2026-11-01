Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505724;
	b=0EDLaxOyPTQkWZsf+sgsr5Xv8Yzx225zkd0r6WiD5zb971VVE7I6nydOoQty87LN3xaN
	 fQIKyMKYl08rQgsfTdNnXo4VAv+7Tk1ODT6BscAfVyw53Chj0GFCScO/fH+PwnnQXwycP
	 1vW1FRzt8W6EAgDEfzjBUQCH5/oplB9mEl5zSPbgrNtEw7lHUZ8FBdT8qj7nsvR9qytC7
	 pgon96hQZ4gmuLn6Cx9XTt39rC7HZcXjJl/xdjpec4NWP9Vm2hYbXLWVkzCVt3tOqA07/
	 uzTniygBKxLFX5V0FQqLg+wfLPCH94QDy8fOMmhlMMYZgrOtLLX1nzmT5e4+Ou1QW+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505724;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=pThS4s7jZsUvLNnzBEk4Mx5yZuyvy+qhE7GbJU+ofLU=;
	b=HiTPgeVjglp1ZwjgV8FzCdSKCRda5DmbIFthulbbYJaMvruS64FkmAVcfyPopk7q5hwo
	 WUp3ERFnGasa5moL8VDk5uJDjD3Kad2v41NKh8jtsSRhD56nxPh3drp2KoPGaKm7m3hSE
	 9bDjlceO+bZyvE1X1vf5w7AOQPDR/7wV3kVwDeQ+3qOQUhFX8ME86MyFnef5DS5SBYPds
	 Z/lRx65WpL8J31vNCJsPSGLe18/GqtpU5b9sD1PcUP6cZvnlq5aFoqpTfBQSGvwKF84OZ
	 E0YBnxGtXkQL8slLX52IrNQKAOuP7UnG9DYT+tOUope99TwQHXgXEdMytsds2tNLeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="iV0/Z47z";
	arc=none smtp.remote-ip=154.81.10.34
Received: from mail-m1034.netease.com (mail-m1034.netease.com [154.81.10.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD6606A327;
	Sun,  1 Nov 2026 04:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DD6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=iV0/Z47z
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84148;
	Sun, 1 Nov 2026 12:01:53 +0800 (GMT+08:00)
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
Subject: [PATCH v1 4/6] ASoC: codecs: rk3308: support ADC stereo-group routing
Date: Sun,  1 Nov 2026 12:01:23 +0800
Message-Id: <20261101040125.1864141-5-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa195455e0a03a8kunm8fccdc7416d2b3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUsZVh4YTh5PQklCGEofQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=iV0/Z47zujkmVsKhOgV0P3dE+FK8XS/uzV/7EMjTv4eDJvTqOqLL9pG6B/2JpkxxhCV3z+QCntzn5fCWoDr8gpPSESiSjthfGCbrqsK140Fkm/eIPDI3F2YwByUgORp38wR+5EOCxWGvWZuxtsrS9GpRJxOF4e6ykH+eREqHLSU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=pThS4s7jZsUvLNnzBEk4Mx5yZuyvy+qhE7GbJU+ofLU=;
	h=date:mime-version:subject:message-id:from;

Allow boards to describe the internal ADC-group mux with rockchip,adc-
grps-route. Validate all four group IDs before updating the GRF and
configure the physical ADC groups selected for the requested PCM channel
count.

Reject duplicate and out-of-range IDs and incomplete mappings. Preserve
the existing identity mapping and leave the GRF unchanged when the
property is absent.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 44 +++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index fc7e20e82700..319b2391dd9b 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -28,6 +28,7 @@
 
 #define ADC_LR_GROUP_MAX		4
 
+#define GRF_SOC_CON1			0x304
 #define GRF_CHIP_ID			0x800
 
 enum {
@@ -47,6 +48,7 @@ struct rk3308_codec_priv {
 	struct snd_soc_component *component;
 	unsigned char codec_ver;
 	u32 micbias_level;
+	u32 adc_grps[ADC_LR_GROUP_MAX];
 };
 
 static struct clk_bulk_data rk3308_codec_clocks[] = {
@@ -794,7 +796,7 @@ static int rk3308_codec_adc_dig_config(struct rk3308_codec_priv *rk3308,
 	 * grp 3 = ADC7 and ADC8
 	 */
 	u32 used_adc_grps;
-	int grp;
+	int grp, idx;
 
 	switch (params_channels(params)) {
 	case 1:
@@ -829,7 +831,8 @@ static int rk3308_codec_adc_dig_config(struct rk3308_codec_priv *rk3308,
 		return -EINVAL;
 	}
 
-	for (grp = 0; grp < used_adc_grps; grp++) {
+	for (idx = 0; idx < used_adc_grps; idx++) {
+		grp = rk3308->adc_grps[idx];
 		regmap_update_bits(rk3308->regmap,
 				   RK3308_ADC_DIG_CON03(grp),
 				   RK3308_ADC_L_CH_BIST_MSK | RK3308_ADC_R_CH_BIST_MSK,
@@ -1086,6 +1089,39 @@ static int rk3308_codec_set_micbias_level(struct rk3308_codec_priv *rk3308)
 	return 0;
 }
 
+static int rk3308_codec_adc_grps_route(struct rk3308_codec_priv *rk3308)
+{
+	struct device_node *np = rk3308->dev->of_node;
+	unsigned int seen = 0, val = 0;
+	int grp, ret;
+
+	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++)
+		rk3308->adc_grps[grp] = grp;
+
+	if (!of_find_property(np, "rockchip,adc-grps-route", NULL))
+		return 0;
+
+	if (of_property_count_u32_elems(np, "rockchip,adc-grps-route") !=
+	    ADC_LR_GROUP_MAX)
+		return -EINVAL;
+
+	ret = of_property_read_u32_array(np, "rockchip,adc-grps-route",
+					 rk3308->adc_grps, ADC_LR_GROUP_MAX);
+	if (ret)
+		return ret;
+
+	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++) {
+		u32 input = rk3308->adc_grps[grp];
+
+		if (input >= ADC_LR_GROUP_MAX || (seen & BIT(input)))
+			return -EINVAL;
+		seen |= BIT(input);
+		val |= input << (grp * 2);
+	}
+
+	return regmap_write(rk3308->grf, GRF_SOC_CON1, (0xff << 16) | val);
+}
+
 static int rk3308_codec_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1131,6 +1167,10 @@ static int rk3308_codec_platform_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rk3308);
 
+	err = rk3308_codec_adc_grps_route(rk3308);
+	if (err)
+		return dev_err_probe(dev, err, "Invalid ADC group routing\n");
+
 	err = rk3308_codec_set_micbias_level(rk3308);
 	if (err)
 		return err;
