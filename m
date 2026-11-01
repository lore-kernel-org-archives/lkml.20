Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793505725;
	b=MYHy3DX9C9gfvmLbDM6NJo032f0nTWnLaXd/V8ih0TQw0baNNSZaRUU07XCrF5XnT41Y
	 DKQZvjtrRh0S8S71OaigjAmuk6yFTLT5bW34nt4+JgHkujKjMsVXkhiIH0RR+mGM8wwcM
	 Y5odqIdCRyySepEDnSuxjkbxucFALwwlgaeIrx6TGg9BLs/94j1J8KQ9rJscT65PeRx57
	 vjoR4KG6sLE41DlyM8NhjJ7FmBTHPn0wEbTp/6iDS9DEJUCsxE4sjxi2WMer4lcz+DMn8
	 qWzTeiGRIFz7hRWs52g0gwST4NF0JIuKMBR8LikbbYWQp2Lj031xfjRKbykYnD3bUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793505725;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=GGPiwocUUGruVk53aOCSJl4Ce/u14Zhe1s+QmynwCt0=;
	b=W1Piq4fq0zK/nqRHwZ7KJvf8G/39Fa5MaZ7alrtVottf2dBbcURjkwkQNvJE19hdDdV3
	 OtP2zBYFRleBzXqhmbcveHVl4gJ/bG4qd2zfhjynV76B7c0fNxQoZJBOsMzn2riTAA8Nx
	 0KGWf2+SJf7BAZe3/hbASLOoaBA0UQbM6+Tk4MGJU5wdn+kdAEipzkoUWt1iVMevkGM9f
	 bXpF3+KpxyMzG7EEIdR5JCfPlEjKz9ZTF9OdIQaDI5z0bdpGuj4dF2GS6TKMlnTfqYyGg
	 hbLmQH9FJlGinK90mu2x4uzwKYbumLgVTquS1eK8tDVDw15O95VuH441727/aW4+NuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k1ybb7Vc;
	arc=none smtp.remote-ip=47.251.158.237
Received: from mail-m158237.netease.com (mail-m158237.netease.com [47.251.158.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FF606A326;
	Sun,  1 Nov 2026 04:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k1ybb7Vc
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d8413f;
	Sun, 1 Nov 2026 12:01:51 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/6] ASoC: codecs: rk3308: expose per-channel microphone boost
Date: Sun,  1 Nov 2026 12:01:21 +0800
Message-Id: <20261101040125.1864141-3-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa1954556e403a8kunm8fccdc7416d2a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGR8YVkgZGktNGh4aS0oaQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=k1ybb7VcrrC/CYard0Hg4cC9JHYsBt7YF0YSeFW75B0WQIlN4Jkmv/5w1VDk/gGVwcO0jzivA0A9oVgs0pzXA9JoV6hjEPtSNvw3UxLBKkGvG9KP5Np9LUyGX5rFxbqSrYXMhVVE8yZQSDxrRpNN6St8i2dlfB2Xh9nvMI/r9WY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GGPiwocUUGruVk53aOCSJl4Ce/u14Zhe1s+QmynwCt0=;
	h=date:mime-version:subject:message-id:from;

The existing MIC Capture Volume controls adjust the ALC gain stage,
leaving the preceding microphone boost stage inaccessible. Add
independent boost controls for all eight inputs without changing the
existing controls or reset gains.

Use the revision-specific dB scales. Revision A permits only the 0 dB
and 20 dB encodings; reject its reserved intermediate settings while
allowing all four settings on revisions B and C.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 80 ++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 7a18ff45e391..fc7e20e82700 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -66,6 +66,84 @@ static const DECLARE_TLV_DB_RANGE(rk3308_codec_dac_lineout_gain_tlv,
 	3, 3, TLV_DB_SCALE_ITEM(0,    0, 0),
 );
 
+static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_a,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_b,
+	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
+	1, 1, TLV_DB_SCALE_ITEM(660, 0, 0),
+	2, 2, TLV_DB_SCALE_ITEM(1300, 0, 0),
+	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
+);
+
+static int rk3308_codec_mic_boost_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	long gain = ucontrol->value.integer.value[0];
+
+	if (rk3308->codec_ver == ACODEC_VERSION_A && gain != 0 && gain != 3)
+		return -EINVAL;
+
+	return snd_soc_put_volsw(kcontrol, ucontrol);
+}
+
+static const struct snd_kcontrol_new rk3308_codec_mic_boost_controls[] = {
+	SOC_SINGLE_EXT_TLV("MIC1 Boost Volume", RK3308_ADC_ANA_CON01(0),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC2 Boost Volume", RK3308_ADC_ANA_CON01(0),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC3 Boost Volume", RK3308_ADC_ANA_CON01(1),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC4 Boost Volume", RK3308_ADC_ANA_CON01(1),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC5 Boost Volume", RK3308_ADC_ANA_CON01(2),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC6 Boost Volume", RK3308_ADC_ANA_CON01(2),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC7 Boost Volume", RK3308_ADC_ANA_CON01(3),
+			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+	SOC_SINGLE_EXT_TLV("MIC8 Boost Volume", RK3308_ADC_ANA_CON01(3),
+			   RK3308_ADC_CH2_MIC_GAIN_SFT, RK3308_ADC_CH2_MIC_GAIN_MAX, 0,
+			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
+			   rk3308_codec_adc_mic_gain_tlv_b),
+};
+
+static int rk3308_codec_add_mic_boost_controls(struct snd_soc_component *component)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(rk3308_codec_mic_boost_controls); i++) {
+		struct snd_kcontrol_new control = rk3308_codec_mic_boost_controls[i];
+
+		if (rk3308->codec_ver == ACODEC_VERSION_A)
+			control.tlv.p = rk3308_codec_adc_mic_gain_tlv_a;
+		ret = snd_soc_add_component_controls(component, &control, 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const char * const rk3308_codec_hpf_cutoff_text[] = {
 	"20 Hz", "245 Hz", "612 Hz"
 };
@@ -891,7 +969,7 @@ static int rk3308_codec_probe(struct snd_soc_component *component)
 	rk3308_codec_reset(component);
 	rk3308_codec_initialize(rk3308);
 
-	return 0;
+	return rk3308_codec_add_mic_boost_controls(component);
 }
 
 static int rk3308_codec_set_bias_level(struct snd_soc_component *component,
