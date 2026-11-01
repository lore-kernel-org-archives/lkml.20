Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508131;
	b=KJ67YpGvntB4zHWj6lXMi3wD1jZNi8xBiN+kgGIX4VUH/b25VN9yP6t4nQnb66oa9L8w
	 hp+jblWTURF9sNAjKKBzv+jTBvM2bszE+o5uI8KiQNoeqw54GvClPh6dALwMFPf1/mv9C
	 71EPpOS5j+A9Fa/R9utxQtcd5HZy3s6wdaLVHI66yEDqBHyTBEZa8RzH5J3vHd9ZVFD98
	 426g4ytx2g8mhfoD8PDEoMMsw4livt8H4t+OXqO2AUpaVjHUlLICcgoIeJlEFtvK/3+yN
	 emTJhPGuCMeGWolC+qMCdnnMQRcq92IfI6c6CpV0xftON9Z7N/8qB9/izn6/PkJR3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508131;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=+EiYp0IGdIlLlJF5aQg7NsJ1lUV/ppsjshi9twN+0W0=;
	b=0H4lcu735r6y2W3Rdp3NqiUzkCE5LUj8rb/h8nV8phx88o2JfFGWBNon3aa7gvhSKIFW
	 OhwZWFFtZOEZhZcxxRuxupS+957rkBaQbbNP0ALJlkMZ6ejOGQezs0rVL8+04a6ll0xmw
	 2hQ9hOMEUJbGyQnGNzyrx5gr3+pPy0KrWXpw+MSpTaZpdvR0dBtkMuepBCc0eA3xjNkoT
	 EwSRoFsBR4i0bX7pnI6+UQVvUcjkuPwmJLJuHpBTH+I5mi5zr7VwbzVxQX40W8jxGQbjz
	 OwIP0Y740tBoWeqKVafcF/BCQAQo+kskZc8IK3y3djrIYy4VcA02380y90hDW2Gv7Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ApN9StI8;
	arc=none smtp.remote-ip=160.236.52.230
Received: from mail-m16023652230.xmail.ntesmail.com (mail-m16023652230.xmail.ntesmail.com [160.236.52.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFA606A327;
	Sun,  1 Nov 2026 04:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AFA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ApN9StI8
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2ce;
	Sun, 1 Nov 2026 12:41:56 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/3] ASoC: codecs: rk3308: restore audio and headphone support
Date: Sun,  1 Nov 2026 12:41:48 +0800
Message-Id: <20261101044149.2018744-3-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101044149.2018744-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa1956a072303a8kunmda3ed7c8171612
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkMZVh5LTU5LHRgfGkxKQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ApN9StI86KwDF9iHVbewIgz9pl4oE4X4rO4yMXzJxDfeWoLczMXlCalZqrmZ4OfrSe+ltPtMCaGCjr9mtl6G542/dCdfZ9GeDucQyBL/wFpdnKcE5IoTwvSJv+3yEf9AGubGKp77IgrXOWMwsryR7z6B/jN2OlJNBRCYKrr5U0c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+EiYp0IGdIlLlJF5aQg7NsJ1lUV/ppsjshi9twN+0W0=;
	h=date:mime-version:subject:message-id:from;

Restore the vendor analog enable and disable order and settling delays
through shared DAPM supply events for codec revisions A, B and C. Use
virtual intermediate widgets to prevent coalesced or repeated analog
writes without adding startup, shutdown or hw_free DAI operations.

Restore reference-current ramps, HPMIX reset, headphone gain ramps and
A/B CIC fades. Preserve stream parameters and ALSA volume and mute
settings. Re-sync active ADCs after DAC reference changes and after
ADC supply events, before external output amplifiers are enabled.

Apply the configured MICBIAS voltage after reset and wait 50 ms before
enabling ADC analog stages. Expose per-channel microphone boost and
validate the ADC stereo-group routing. Keep revision-specific MIC boost
restrictions, LINEOUT VCM/DC controls, digital gain and drive strength.

Select LINEOUT, HPOUT or both through DAPM without enabling inactive
outputs. Restore B/C headphone detection through set_jack and the
named detect-GRF interrupt, retaining legacy interrupt index lookup.
Leave external headphone amplifier GPIO ownership to the machine
DAPM widget and keep debug interfaces outside this change.

Replace the existing revision B output events with the shared analog
sequence. Retain upstream automatic DAI format selection and use the
current ASoC component, control and bias accessors.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
Changes in v2:
- Combine the codec C and header changes into one complete patch.
- Restore full ADC/DAC analog sequencing, ramps, fades and ADC resync.
- Preserve upstream automatic DAI format selection and adapt accessors.
- Replace sleepable-path busy waits without reducing minimum delays.

 sound/soc/codecs/rk3308_codec.c | 1155 ++++++++++++++++++++++++++-----
 sound/soc/codecs/rk3308_codec.h |   18 +-
 2 files changed, 1005 insertions(+), 168 deletions(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index a3d41cd8150d..1894e1a93fbf 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -2,7 +2,7 @@
 /*
  * Rockchip RK3308 internal audio codec driver
  *
- * Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
+ * Copyright (c) 2018-2026, Rockchip Electronics Co., Ltd All rights reserved.
  * Copyright (c) 2024, Vivax-Metrotech Ltd
  */
 
@@ -10,14 +10,18 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/util_macros.h>
+#include <linux/workqueue.h>
+#include <sound/jack.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -28,8 +32,16 @@
 
 #define ADC_LR_GROUP_MAX		4
 
+#define GRF_SOC_CON1			0x304
 #define GRF_CHIP_ID			0x800
 
+#define DETECT_GRF_ACODEC_HPDET_COUNTER	0x0030
+#define DETECT_GRF_ACODEC_HPDET_CON	0x0034
+#define DETECT_GRF_ACODEC_HPDET_STATUS	0x0038
+#define DETECT_GRF_ACODEC_HPDET_STATUS_CLR	0x003c
+#define DEFAULT_HPDET_COUNT		20000000 /* 200 ms at 100 MHz */
+#define HPDET_BOTH_NEG_POS		(BIT(0) | BIT(1))
+
 enum {
 	ACODEC_VERSION_A = 'A',
 	ACODEC_VERSION_B,
@@ -40,12 +52,28 @@ struct rk3308_codec_priv {
 	const struct device *dev;
 	struct regmap *regmap;
 	struct regmap *grf;
+	struct regmap *detect_grf;
 	struct reset_control *reset;
 	struct clk *hclk;
 	struct clk *mclk_rx;
 	struct clk *mclk_tx;
 	struct snd_soc_component *component;
 	unsigned char codec_ver;
+	u32 adc_grps[ADC_LR_GROUP_MAX];
+	u32 micbias_level;
+	/* Serialize output controls, detector work and jack lifetime changes. */
+	struct mutex io_lock;
+	u32 dac_output;
+	u32 output_routes_mask;
+	struct snd_soc_dapm_widget *dac_analog;
+	struct snd_soc_jack *hpdet_jack;
+	struct delayed_work hpdet_work;
+	int hpdet_irq;
+	bool hpdet_enabled;
+	bool hpdet_seen_irq;
+	bool hp_plugged;
+	bool hp_jack_reversed;
+
 };
 
 static struct clk_bulk_data rk3308_codec_clocks[] = {
@@ -65,6 +93,84 @@ static const DECLARE_TLV_DB_RANGE(rk3308_codec_dac_lineout_gain_tlv,
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
@@ -78,7 +184,288 @@ static SOC_ENUM_SINGLE_DECL(rk3308_codec_hpf_cutoff_enum56, RK3308_ADC_DIG_CON04
 static SOC_ENUM_SINGLE_DECL(rk3308_codec_hpf_cutoff_enum78, RK3308_ADC_DIG_CON04(3), 0,
 			    rk3308_codec_hpf_cutoff_text);
 
+static int rk3308_codec_output_routes(struct rk3308_codec_priv *rk3308)
+{
+	static const struct snd_soc_dapm_route routes[][2] = {
+		{
+			{ "L_LINEOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
+			{ "R_LINEOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
+		}, {
+			{ "L_HPOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
+			{ "R_HPOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
+		},
+	};
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rk3308->component);
+	u32 mask = rk3308->dac_output == 11 ? 3 :
+		rk3308->dac_output == 0 ? 1 : 2;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(routes); i++) {
+		if (!((mask ^ rk3308->output_routes_mask) & BIT(i)))
+			continue;
+		if (mask & BIT(i))
+			ret = snd_soc_dapm_add_routes(dapm, routes[i], ARRAY_SIZE(routes[i]));
+		else
+			ret = snd_soc_dapm_del_routes(dapm, routes[i], ARRAY_SIZE(routes[i]));
+		if (ret)
+			return ret;
+		rk3308->output_routes_mask ^= BIT(i);
+	}
+
+	return 0;
+}
+
+static int rk3308_codec_set_output(struct rk3308_codec_priv *rk3308, unsigned int output)
+{
+	unsigned int saved = rk3308->dac_output;
+	int ret;
+
+	rk3308->dac_output = output;
+	ret = rk3308_codec_output_routes(rk3308);
+	if (ret) {
+		rk3308->dac_output = saved;
+		rk3308_codec_output_routes(rk3308);
+	}
+	if (!ret && rk3308->hpdet_jack)
+		snd_soc_jack_report(rk3308->hpdet_jack,
+				    output ? SND_JACK_HEADPHONE : 0, SND_JACK_HEADPHONE);
+	if (!ret)
+		ret = snd_soc_dapm_sync(snd_soc_component_to_dapm(rk3308->component));
+	return ret;
+}
+
+static const char * const rk3308_codec_output_text[] = { "Line Out", "Headphone", "Both" };
+static SOC_ENUM_SINGLE_EXT_DECL(rk3308_codec_output_enum, rk3308_codec_output_text);
+
+static int rk3308_codec_output_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+
+	mutex_lock(&rk3308->io_lock);
+	ucontrol->value.enumerated.item[0] = rk3308->dac_output == 11 ? 2 : rk3308->dac_output;
+	mutex_unlock(&rk3308->io_lock);
+
+	return 0;
+}
+
+static int rk3308_codec_output_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+	int ret = 0;
+
+	if (value >= ARRAY_SIZE(rk3308_codec_output_text))
+		return -EINVAL;
+	value = value == 2 ? 11 : value;
+	mutex_lock(&rk3308->io_lock);
+	if (value != rk3308->dac_output) {
+		ret = rk3308_codec_set_output(rk3308, value);
+		if (!ret)
+			ret = 1;
+	}
+	mutex_unlock(&rk3308->io_lock);
+	return ret;
+}
+
+static bool rk3308_codec_hpdet_inserted(struct rk3308_codec_priv *rk3308,
+					unsigned int status)
+{
+	if (rk3308->hp_jack_reversed)
+		return status == 0 || status == BIT(1);
+
+	return status == BIT(0);
+}
+
+static void rk3308_codec_hpdet_work(struct work_struct *work)
+{
+	struct rk3308_codec_priv *rk3308 =
+		container_of(to_delayed_work(work), struct rk3308_codec_priv, hpdet_work);
+	unsigned int status;
+	int ret;
+
+	mutex_lock(&rk3308->io_lock);
+	if (!rk3308->component || !rk3308->hpdet_jack)
+		goto out;
+	if (!rk3308->component->card->instantiated) {
+		mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+				 msecs_to_jiffies(100));
+		goto out;
+	}
+
+	/* The threaded IRQ retains the last edge after acknowledging it. */
+	if (!rk3308->hpdet_seen_irq) {
+		ret = regmap_read(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_STATUS, &status);
+		if (ret)
+			goto out;
+		rk3308->hp_plugged = rk3308_codec_hpdet_inserted(rk3308, status);
+	}
+
+	ret = rk3308_codec_set_output(rk3308, rk3308->hp_plugged ? 1 : 0);
+	if (ret) {
+		dev_err_ratelimited(rk3308->dev, "Failed to switch headphone output: %d\n", ret);
+		goto out;
+	}
+
+out:
+	mutex_unlock(&rk3308->io_lock);
+}
+
+static irqreturn_t rk3308_codec_hpdet_irq(int irq, void *data)
+{
+	struct rk3308_codec_priv *rk3308 = data;
+	unsigned int status;
+	int ret;
+
+	mutex_lock(&rk3308->io_lock);
+	ret = regmap_read(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_STATUS, &status);
+	if (ret || !(status & HPDET_BOTH_NEG_POS))
+		goto out;
+	ret = regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_STATUS_CLR, status);
+	if (ret)
+		goto out;
+
+	if (rk3308->hpdet_jack) {
+		rk3308->hp_plugged = rk3308_codec_hpdet_inserted(rk3308, status);
+		rk3308->hpdet_seen_irq = true;
+		mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+				 msecs_to_jiffies(10));
+	}
+out:
+	mutex_unlock(&rk3308->io_lock);
+	return IRQ_HANDLED;
+}
+
+static int rk3308_codec_set_jack(struct snd_soc_component *component,
+				 struct snd_soc_jack *jack, void *data)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	bool enabled;
+	int ret = 0;
+
+	if (!rk3308->detect_grf)
+		return jack ? -EOPNOTSUPP : 0;
+
+	mutex_lock(&rk3308->io_lock);
+	enabled = rk3308->hpdet_enabled;
+	rk3308->hpdet_enabled = false;
+	rk3308->hpdet_jack = NULL;
+	mutex_unlock(&rk3308->io_lock);
+	if (enabled)
+		disable_irq(rk3308->hpdet_irq);
+	cancel_delayed_work_sync(&rk3308->hpdet_work);
+
+	mutex_lock(&rk3308->io_lock);
+	ret = regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_CON,
+			   HPDET_BOTH_NEG_POS << 16);
+	if (ret)
+		goto out;
+	ret = regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+				RK3308_DAC_HEADPHONE_DET_EN);
+	if (ret)
+		goto out;
+
+	/* C needs the internal DAC clock even when no PCM is running. */
+	if (rk3308->codec_ver == ACODEC_VERSION_C) {
+		snd_soc_dapm_mutex_lock(dapm);
+		if (jack) {
+			ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+		} else {
+			ret = snd_soc_dapm_disable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+			if (!ret)
+				ret = snd_soc_dapm_enable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+		}
+		if (!ret)
+			ret = snd_soc_dapm_sync_unlocked(dapm);
+		snd_soc_dapm_mutex_unlock(dapm);
+		if (ret)
+			goto out;
+	}
+	if (!jack)
+		goto out;
+
+	ret = regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_COUNTER,
+			   DEFAULT_HPDET_COUNT);
+	if (ret)
+		goto out;
+	ret = regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_STATUS_CLR,
+			   HPDET_BOTH_NEG_POS);
+	if (ret)
+		goto out;
+	ret = regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+			      RK3308_DAC_HEADPHONE_DET_EN);
+	if (ret)
+		goto out;
+	ret = regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_CON,
+			   (HPDET_BOTH_NEG_POS << 16) | HPDET_BOTH_NEG_POS);
+	if (ret)
+		goto out;
+
+	rk3308->hpdet_jack = jack;
+	rk3308->hpdet_seen_irq = false;
+	rk3308->hpdet_enabled = true;
+	/* Allow the 200 ms hardware filter to settle before the initial report. */
+	mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+			 msecs_to_jiffies(210));
+	enable_irq(rk3308->hpdet_irq);
+out:
+	if (ret && jack) {
+		regmap_write(rk3308->detect_grf, DETECT_GRF_ACODEC_HPDET_CON,
+			     HPDET_BOTH_NEG_POS << 16);
+		regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+				  RK3308_DAC_HEADPHONE_DET_EN);
+		if (rk3308->codec_ver == ACODEC_VERSION_C) {
+			snd_soc_dapm_mutex_lock(dapm);
+			snd_soc_dapm_disable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+			snd_soc_dapm_enable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+			snd_soc_dapm_sync_unlocked(dapm);
+			snd_soc_dapm_mutex_unlock(dapm);
+		}
+	}
+	mutex_unlock(&rk3308->io_lock);
+	return ret;
+}
+
+static int rk3308_codec_hpdet_init(struct platform_device *pdev,
+				   struct rk3308_codec_priv *rk3308)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (rk3308->codec_ver == ACODEC_VERSION_A ||
+	    of_property_read_bool(np, "rockchip,no-hp-det") ||
+	    !of_find_property(np, "rockchip,detect-grf", NULL))
+		return 0;
+
+	rk3308->detect_grf = syscon_regmap_lookup_by_phandle(np, "rockchip,detect-grf");
+	if (IS_ERR(rk3308->detect_grf))
+		return dev_err_probe(dev, PTR_ERR(rk3308->detect_grf),
+				     "Failed to get detect GRF\n");
+	if (of_find_property(np, "interrupt-names", NULL))
+		rk3308->hpdet_irq = platform_get_irq_byname(pdev, "hpdet");
+	else
+		rk3308->hpdet_irq = platform_get_irq(pdev, 1);
+	if (rk3308->hpdet_irq < 0)
+		return rk3308->hpdet_irq;
+
+	rk3308->hp_jack_reversed = of_property_read_bool(np, "rockchip,hp-jack-reversed");
+	INIT_DELAYED_WORK(&rk3308->hpdet_work, rk3308_codec_hpdet_work);
+	ret = devm_request_threaded_irq(dev, rk3308->hpdet_irq, NULL, rk3308_codec_hpdet_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, "acodec-hpdet", rk3308);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request headphone IRQ\n");
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new rk3308_codec_controls[] = {
+	SOC_ENUM_EXT("DAC Output Route", rk3308_codec_output_enum,
+		     rk3308_codec_output_get, rk3308_codec_output_put),
 	/* Despite the register names, these set the gain when AGC is OFF */
 	SOC_SINGLE_RANGE_TLV("MIC1 Capture Volume",
 			     RK3308_ADC_ANA_CON03(0),
@@ -175,107 +562,350 @@ static const struct snd_kcontrol_new rk3308_codec_controls[] = {
 			     1, 2, 0, rk3308_codec_dac_hpmix_gain_tlv),
 };
 
-static int rk3308_codec_pop_sound_set(struct snd_soc_dapm_widget *w,
-				      struct snd_kcontrol *kcontrol,
-				      int event)
+/* Keep each vendor analog step separate, including its settling time. */
+static void rk3308_codec_analog_update(struct rk3308_codec_priv *rk3308,
+				       unsigned int reg, unsigned int mask,
+				     unsigned int value)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
-	unsigned int val = (event == SND_SOC_DAPM_POST_PMU) ?
-		RK3308_DAC_HPOUT_POP_SOUND_x_WORK :
-		RK3308_DAC_HPOUT_POP_SOUND_x_INIT;
-	unsigned int mask = RK3308_DAC_HPOUT_POP_SOUND_x_MSK;
+	regmap_update_bits(rk3308->regmap, reg, mask, value);
+	usleep_range(20, 40);
+}
 
-	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON01,
-			   mask << w->shift, val << w->shift);
+/* DAC reference changes also affect ADCs that were already running. */
+static void rk3308_codec_resync_adcs(struct rk3308_codec_priv *rk3308)
+{
+	unsigned int work[ADC_LR_GROUP_MAX];
+	int grp;
 
-	return 0;
+	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++) {
+		regmap_read(rk3308->regmap, RK3308_ADC_ANA_CON05(grp), &work[grp]);
+		work[grp] &= RK3308_ADC_CH1_ADC_WORK | RK3308_ADC_CH2_ADC_WORK;
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp), work[grp]);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp), work[grp] >> 1);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp), work[grp]);
+	}
+	usleep_range(200, 250);
+	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++) {
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp), work[grp]);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp), work[grp] >> 1);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp), work[grp]);
+	}
 }
 
-static int rk3308_codec_dac_output_vcm_event(struct snd_soc_dapm_widget *w,
-					     struct snd_kcontrol *kcontrol,
-					     int event)
+/* DAPM calls this before the machine driver enables either output amplifier. */
+static int rk3308_codec_dac_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
-	unsigned int val;
+	unsigned int line, hp, aif1, aif2, digital_gain = 0, gain_l, gain_r;
+	int gain;
+	unsigned int line_unmute = BIT(RK3308_DAC_L_LINEOUT_MUTE_SFT) |
+				   BIT(RK3308_DAC_R_LINEOUT_MUTE_SFT);
+	bool lineout = rk3308->dac_output != 1;
+	bool headphone = rk3308->dac_output != 0;
+
+	rk3308->dac_analog = w;
+	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON04, &line);
+	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON03, &hp);
+	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON05, &gain_l);
+	regmap_read(rk3308->regmap, RK3308_DAC_ANA_CON06, &gain_r);
+	gain_l &= RK3308_DAC_x_HPOUT_GAIN_MSK;
+	gain_r &= RK3308_DAC_x_HPOUT_GAIN_MSK;
+	if (event == SND_SOC_DAPM_PRE_PMU) {
+		if (headphone) {
+			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
+					   RK3308_DAC_x_HPOUT_GAIN_MSK, 0);
+			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
+					   RK3308_DAC_x_HPOUT_GAIN_MSK, 0);
+		}
+		regmap_read(rk3308->regmap, RK3308_DAC_DIG_CON01, &aif1);
+		regmap_read(rk3308->regmap, RK3308_DAC_DIG_CON02, &aif2);
+		if (rk3308->codec_ver == ACODEC_VERSION_C)
+			regmap_read(rk3308->regmap, RK3308_DAC_DIG_CON04, &digital_gain);
+		regmap_clear_bits(rk3308->regmap, RK3308_GLB_CON, RK3308_DAC_DIG_WORK);
+		usleep_range(10000, 11000);
+		regmap_set_bits(rk3308->regmap, RK3308_GLB_CON, RK3308_DAC_DIG_WORK);
+		regmap_write(rk3308->regmap, RK3308_DAC_DIG_CON01, aif1);
+		regmap_write(rk3308->regmap, RK3308_DAC_DIG_CON02, aif2);
+		if (rk3308->codec_ver == ACODEC_VERSION_C)
+			regmap_write(rk3308->regmap, RK3308_DAC_DIG_CON04, digital_gain);
+		/* Vendor DAC enable steps 1-6: current, buffers, POP and HPMIX. */
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON00,
+					   RK3308_DAC_CURRENT_EN, RK3308_DAC_CURRENT_EN);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+					   (RK3308_DAC_BUF_REF_L_EN | RK3308_DAC_BUF_REF_R_EN),
+			(RK3308_DAC_BUF_REF_L_EN | RK3308_DAC_BUF_REF_R_EN));
+		usleep_range(1000, 1100);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+					   RK3308_DAC_HPOUT_POP_SOUND_L_MSK |
+					   RK3308_DAC_HPOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_HPOUT_POP_SOUND_L_WORK | RK3308_DAC_HPOUT_POP_SOUND_R_WORK);
+		if (lineout && rk3308->codec_ver >= ACODEC_VERSION_B)
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON15,
+						   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
+						   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_L_SEL_DC_FROM_INTERNAL | RK3308_DAC_R_SEL_DC_FROM_INTERNAL);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
+					   (RK3308_DAC_L_HPMIX_EN | RK3308_DAC_R_HPMIX_EN),
+			(RK3308_DAC_L_HPMIX_EN | RK3308_DAC_R_HPMIX_EN));
+		usleep_range(1000, 1100);
+		regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON13,
+				  RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK);
+		usleep_range(50, 100);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
+					   (RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK),
+			(RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK));
+		/* Steps 7-14: outputs, DC selector, reference, clock, DAC and WORK. */
+		if (lineout)
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON04,
+						   (RK3308_DAC_L_LINEOUT_EN |
+						   RK3308_DAC_R_LINEOUT_EN),
+			(RK3308_DAC_L_LINEOUT_EN | RK3308_DAC_R_LINEOUT_EN));
+		if (headphone) {
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
+						   (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN),
+			(RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN));
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
+						   (RK3308_DAC_L_HPOUT_WORK |
+						   RK3308_DAC_R_HPOUT_WORK),
+			(RK3308_DAC_L_HPOUT_WORK | RK3308_DAC_R_HPOUT_WORK));
+		}
+		if (rk3308->codec_ver >= ACODEC_VERSION_B)
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON15,
+						   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
+						   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
+			lineout ? (RK3308_DAC_L_SEL_LINEOUT_FROM_INTERNAL |
+				   RK3308_DAC_R_SEL_LINEOUT_FROM_INTERNAL) :
+				  (RK3308_DAC_L_SEL_DC_FROM_INTERNAL |
+				   RK3308_DAC_R_SEL_DC_FROM_INTERNAL));
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_REF_EN | RK3308_DAC_R_REF_EN),
+			(RK3308_DAC_L_REF_EN | RK3308_DAC_R_REF_EN));
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_CLK_EN | RK3308_DAC_R_CLK_EN),
+			(RK3308_DAC_L_CLK_EN | RK3308_DAC_R_CLK_EN));
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN),
+			(RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN));
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_DAC_WORK | RK3308_DAC_R_DAC_WORK),
+			(RK3308_DAC_L_DAC_WORK | RK3308_DAC_R_DAC_WORK));
+		/* Steps 15-21: select I2S and restore the user mute/gain settings. */
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON12,
+					   RK3308_DAC_L_HPMIX_SEL_MSK | RK3308_DAC_R_HPMIX_SEL_MSK,
+			RK3308_DAC_L_HPMIX_I2S | RK3308_DAC_R_HPMIX_I2S);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
+					   (RK3308_DAC_L_HPMIX_UNMUTE | RK3308_DAC_R_HPMIX_UNMUTE),
+			(RK3308_DAC_L_HPMIX_UNMUTE | RK3308_DAC_R_HPMIX_UNMUTE));
+		if (headphone)
+			for (gain = 0; gain <= max(gain_l, gain_r); gain++) {
+				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
+						   RK3308_DAC_x_HPOUT_GAIN_MSK,
+					min_t(unsigned int, gain, gain_l));
+				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
+						   RK3308_DAC_x_HPOUT_GAIN_MSK,
+					min_t(unsigned int, gain, gain_r));
+			}
+		rk3308_codec_resync_adcs(rk3308);
+	} else {
+		/* Vendor DAC disable steps 3-19, after the external amps are off. */
+		if (hp & (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN))
+			for (gain = max(gain_l, gain_r); gain >= 0; gain--) {
+				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
+						   RK3308_DAC_x_HPOUT_GAIN_MSK,
+					min_t(unsigned int, gain, gain_l));
+				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
+						   RK3308_DAC_x_HPOUT_GAIN_MSK,
+					min_t(unsigned int, gain, gain_r));
+				usleep_range(200, 300);
+			}
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON12,
+					   RK3308_DAC_L_HPMIX_SEL_MSK | RK3308_DAC_R_HPMIX_SEL_MSK,
+			RK3308_DAC_L_HPMIX_NONE | RK3308_DAC_R_HPMIX_NONE);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
+					   RK3308_DAC_L_HPOUT_UNMUTE |
+					   RK3308_DAC_R_HPOUT_UNMUTE, 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_DAC_WORK | RK3308_DAC_R_DAC_WORK), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
+					   (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON04, line_unmute, 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON04,
+					   (RK3308_DAC_L_LINEOUT_EN | RK3308_DAC_R_LINEOUT_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
+					   (RK3308_DAC_L_HPMIX_EN | RK3308_DAC_R_HPMIX_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_CLK_EN | RK3308_DAC_R_CLK_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON02,
+					   (RK3308_DAC_L_REF_EN | RK3308_DAC_R_REF_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+					   RK3308_DAC_HPOUT_POP_SOUND_L_MSK |
+					   RK3308_DAC_HPOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_HPOUT_POP_SOUND_L_INIT | RK3308_DAC_HPOUT_POP_SOUND_R_INIT);
+		if (rk3308->codec_ver >= ACODEC_VERSION_B)
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON15,
+						   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
+						   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_L_SEL_DC_FROM_VCM | RK3308_DAC_R_SEL_DC_FROM_VCM);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+					   (RK3308_DAC_BUF_REF_L_EN | RK3308_DAC_BUF_REF_R_EN), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON00,
+					   RK3308_DAC_CURRENT_EN, 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON03,
+					   (RK3308_DAC_L_HPOUT_WORK | RK3308_DAC_R_HPOUT_WORK), 0);
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON13,
+					   (RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK),
+			(RK3308_DAC_L_HPMIX_WORK | RK3308_DAC_R_HPMIX_WORK));
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
+				   RK3308_DAC_x_HPOUT_GAIN_MSK, gain_l);
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
+				   RK3308_DAC_x_HPOUT_GAIN_MSK, gain_r);
+		rk3308_codec_resync_adcs(rk3308);
+		/* Preserve ALSA switches while the analog output stages are off. */
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON03,
+				   RK3308_DAC_L_HPOUT_UNMUTE | RK3308_DAC_R_HPOUT_UNMUTE,
+			hp & (RK3308_DAC_L_HPOUT_UNMUTE | RK3308_DAC_R_HPOUT_UNMUTE));
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON04,
+				   line_unmute, line & line_unmute);
+	}
 
-	if (rk3308->codec_ver != ACODEC_VERSION_B)
-		return 0;
+	return 0;
+}
 
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		/* Keep the DAC outputs at VCM while their reference is charged. */
-		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,
-				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
-				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
-				   RK3308_DAC_L_SEL_DC_FROM_VCM |
-				   RK3308_DAC_R_SEL_DC_FROM_VCM);
-		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
-				   RK3308_DAC_CURRENT_CHARGE_MSK, 1);
-		regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
-				RK3308_DAC_VCM_LINEOUT_EN);
-		for (val = 1; val <= 0xf; val++) {
-			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
-					   RK3308_DAC_CURRENT_CHARGE_MSK, val);
-			usleep_range(200, 400);
-		}
-		msleep(20);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,
-				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
-				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
-				   RK3308_DAC_L_SEL_DC_FROM_INTERNAL |
-				   RK3308_DAC_R_SEL_DC_FROM_INTERNAL);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,
-				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
-				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
-				   RK3308_DAC_L_SEL_DC_FROM_VCM |
-				   RK3308_DAC_R_SEL_DC_FROM_VCM);
-		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
-				   RK3308_DAC_CURRENT_CHARGE_MSK, 1);
-		regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
-				  RK3308_DAC_VCM_LINEOUT_EN);
-		break;
-	default:
-		break;
+static int rk3308_codec_adc_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	unsigned int grp = w->shift;
+	unsigned int zerocross;
+
+	if (event == SND_SOC_DAPM_PRE_PMU) {
+		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(grp),
+				   RK3308_ADC_CH1_IN_SEL_MSK | RK3308_ADC_CH2_IN_SEL_MSK,
+				   RK3308_ADC_CH1_IN_MIC | RK3308_ADC_CH2_IN_MIC);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				RK3308_ADC_CH1_MIC_UNMUTE | RK3308_ADC_CH2_MIC_UNMUTE);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON06(grp),
+				RK3308_ADC_CURRENT_EN);
+		usleep_range(400, 500);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				RK3308_ADC_CH1_BUF_REF_EN | RK3308_ADC_CH2_BUF_REF_EN);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				RK3308_ADC_CH1_MIC_EN | RK3308_ADC_CH2_MIC_EN);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				RK3308_ADC_CH1_ALC_EN | RK3308_ADC_CH2_ALC_EN);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				RK3308_ADC_CH1_CLK_EN | RK3308_ADC_CH2_CLK_EN);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				RK3308_ADC_CH1_ADC_EN | RK3308_ADC_CH2_ADC_EN);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				RK3308_ADC_CH1_ADC_WORK | RK3308_ADC_CH2_ADC_WORK);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				RK3308_ADC_CH1_ALC_WORK | RK3308_ADC_CH2_ALC_WORK);
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				RK3308_ADC_CH1_MIC_WORK | RK3308_ADC_CH2_MIC_WORK);
+	} else {
+		regmap_read(rk3308->regmap, RK3308_ADC_ANA_CON02(grp), &zerocross);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				  RK3308_ADC_CH1_ZEROCROSS_DET_EN |
+				   RK3308_ADC_CH2_ZEROCROSS_DET_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				  RK3308_ADC_CH1_ADC_EN | RK3308_ADC_CH2_ADC_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				  RK3308_ADC_CH1_CLK_EN | RK3308_ADC_CH2_CLK_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				  RK3308_ADC_CH1_ALC_EN | RK3308_ADC_CH2_ALC_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				  RK3308_ADC_CH1_MIC_EN | RK3308_ADC_CH2_MIC_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				  RK3308_ADC_CH1_BUF_REF_EN | RK3308_ADC_CH2_BUF_REF_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON06(grp),
+				  RK3308_ADC_CURRENT_EN);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON05(grp),
+				  RK3308_ADC_CH1_ADC_WORK | RK3308_ADC_CH2_ADC_WORK);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				  RK3308_ADC_CH1_ALC_WORK | RK3308_ADC_CH2_ALC_WORK);
+		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				  RK3308_ADC_CH1_MIC_WORK | RK3308_ADC_CH2_MIC_WORK);
+		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
+				   RK3308_ADC_CH1_ZEROCROSS_DET_EN |
+				   RK3308_ADC_CH2_ZEROCROSS_DET_EN,
+				   zerocross & (RK3308_ADC_CH1_ZEROCROSS_DET_EN |
+						RK3308_ADC_CH2_ZEROCROSS_DET_EN));
 	}
 
 	return 0;
 }
 
-static int rk3308_codec_lineout_event(struct snd_soc_dapm_widget *w,
-				      struct snd_kcontrol *kcontrol,
-				      int event)
+/* Output-only route changes must not restart the shared DAC analog supply. */
+static int rk3308_codec_output_event(struct snd_soc_dapm_widget *w,
+				     bool hp, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
-	unsigned int mask = RK3308_DAC_LINEOUT_POP_SOUND_L_MSK << w->shift;
-	unsigned int val;
+	unsigned int shift = hp ? w->shift - 1 : w->shift;
+	unsigned int reg = hp ? RK3308_DAC_ANA_CON03 : RK3308_DAC_ANA_CON04;
+	unsigned int mask = (hp ? (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_L_HPOUT_WORK) :
+			     RK3308_DAC_L_LINEOUT_EN) << shift;
 
-	if (rk3308->codec_ver != ACODEC_VERSION_B)
+	if (!rk3308->dac_analog)
 		return 0;
 
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		val = RK3308_DAC_L_SEL_LINEOUT_FROM_INTERNAL << w->shift;
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		val = RK3308_DAC_L_SEL_DC_FROM_INTERNAL << w->shift;
-		break;
-	default:
+	/*
+	 * ASoC computes widget new_power before running DAPM events.
+	 * If the shared supply is also going down, its shutdown event runs
+	 * the complete vendor disable sequence. Recheck this ordering when
+	 * updating the ASoC core.
+	 */
+	if (event == SND_SOC_DAPM_PRE_PMD && !rk3308->dac_analog->new_power)
 		return 0;
+	if (event == SND_SOC_DAPM_PRE_PMU) {
+		if (hp) {
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+						   RK3308_DAC_HPOUT_POP_SOUND_x_MSK << shift,
+						   RK3308_DAC_HPOUT_POP_SOUND_x_WORK << shift);
+			rk3308_codec_analog_update(rk3308, reg,
+						   RK3308_DAC_L_HPOUT_EN << shift,
+				RK3308_DAC_L_HPOUT_EN << shift);
+		}
+		rk3308_codec_analog_update(rk3308, reg,
+					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask,
+					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask);
+	} else {
+		if (hp)
+			rk3308_codec_analog_update(rk3308, reg, RK3308_DAC_L_HPOUT_EN << shift, 0);
+		rk3308_codec_analog_update(rk3308, reg,
+					   hp ? RK3308_DAC_L_HPOUT_WORK << shift : mask, 0);
+		if (hp)
+			rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON01,
+						   RK3308_DAC_HPOUT_POP_SOUND_x_MSK << shift, 0);
 	}
-
-	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15, mask, val);
-	usleep_range(20, 40);
+	if (!hp && rk3308->codec_ver >= ACODEC_VERSION_B)
+		rk3308_codec_analog_update(rk3308, RK3308_DAC_ANA_CON15,
+					   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK << shift,
+			(event == SND_SOC_DAPM_PRE_PMU ?
+			 RK3308_DAC_L_SEL_LINEOUT_FROM_INTERNAL :
+			 RK3308_DAC_L_SEL_DC_FROM_VCM) << shift);
 
 	return 0;
 }
 
+static int rk3308_codec_lineout_event(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol, int event)
+{
+	return rk3308_codec_output_event(w, false, event);
+}
+
+static int rk3308_codec_hpout_event(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	return rk3308_codec_output_event(w, true, event);
+}
+
 static const struct snd_soc_dapm_widget rk3308_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("MIC1"),
 	SND_SOC_DAPM_INPUT("MIC2"),
@@ -309,12 +939,9 @@ static const struct snd_soc_dapm_widget rk3308_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_REG(snd_soc_dapm_mic, "MIC7_WORK", RK3308_ADC_ANA_CON00(3), 2, 1, 1, 0),
 	SND_SOC_DAPM_REG(snd_soc_dapm_mic, "MIC8_WORK", RK3308_ADC_ANA_CON00(3), 6, 1, 1, 0),
 
-	/*
-	 * In theory MIC1 and MIC2 can switch to LINE IN, but this is not
-	 * supported so all we can do is enabling the MIC input.
-	 */
-	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "CH1_IN_SEL", RK3308_ADC_ANA_CON07(0), 4, 1, 1, 0),
-	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "CH2_IN_SEL", RK3308_ADC_ANA_CON07(0), 6, 1, 1, 0),
+	/* Select the MIC input before enabling the ADC/ALC stages. */
+	SND_SOC_DAPM_PGA("CH1_IN_SEL", RK3308_ADC_ANA_CON07(0), 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("CH2_IN_SEL", RK3308_ADC_ANA_CON07(0), 6, 0, NULL, 0),
 
 	SND_SOC_DAPM_SUPPLY("ADC1_BUF_REF_EN", RK3308_ADC_ANA_CON00(0), 0, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("ADC2_BUF_REF_EN", RK3308_ADC_ANA_CON00(0), 4, 0, NULL, 0),
@@ -355,14 +982,14 @@ static const struct snd_soc_dapm_widget rk3308_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "ADC7_EN", RK3308_ADC_ANA_CON05(3), 1, 1, 1, 0),
 	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "ADC8_EN", RK3308_ADC_ANA_CON05(3), 5, 1, 1, 0),
 
-	SND_SOC_DAPM_ADC("ADC1_WORK", "Capture", RK3308_ADC_ANA_CON05(0), 2, 0),
-	SND_SOC_DAPM_ADC("ADC2_WORK", "Capture", RK3308_ADC_ANA_CON05(0), 6, 0),
-	SND_SOC_DAPM_ADC("ADC3_WORK", "Capture", RK3308_ADC_ANA_CON05(1), 2, 0),
-	SND_SOC_DAPM_ADC("ADC4_WORK", "Capture", RK3308_ADC_ANA_CON05(1), 6, 0),
-	SND_SOC_DAPM_ADC("ADC5_WORK", "Capture", RK3308_ADC_ANA_CON05(2), 2, 0),
-	SND_SOC_DAPM_ADC("ADC6_WORK", "Capture", RK3308_ADC_ANA_CON05(2), 6, 0),
-	SND_SOC_DAPM_ADC("ADC7_WORK", "Capture", RK3308_ADC_ANA_CON05(3), 2, 0),
-	SND_SOC_DAPM_ADC("ADC8_WORK", "Capture", RK3308_ADC_ANA_CON05(3), 6, 0),
+	SND_SOC_DAPM_ADC("ADC1_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(0), 2, 0),
+	SND_SOC_DAPM_ADC("ADC2_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(0), 6, 0),
+	SND_SOC_DAPM_ADC("ADC3_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(1), 2, 0),
+	SND_SOC_DAPM_ADC("ADC4_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(1), 6, 0),
+	SND_SOC_DAPM_ADC("ADC5_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(2), 2, 0),
+	SND_SOC_DAPM_ADC("ADC6_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(2), 6, 0),
+	SND_SOC_DAPM_ADC("ADC7_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(3), 2, 0),
+	SND_SOC_DAPM_ADC("ADC8_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(3), 6, 0),
 
 	/* The "ALC" name from the TRM is misleading, these are needed even without ALC/AGC */
 	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "ALC1_WORK", RK3308_ADC_ANA_CON02(0), 1, 1, 1, 0),
@@ -400,33 +1027,116 @@ static const struct snd_soc_dapm_widget rk3308_codec_dapm_widgets[] = {
 
 	SND_SOC_DAPM_SUPPLY("DAC_BUF_REF_L", RK3308_DAC_ANA_CON01, 2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DAC_BUF_REF_R", RK3308_DAC_ANA_CON01, 6, 0, NULL, 0),
-	SND_SOC_DAPM_OUT_DRV_E("HPOUT_POP_SOUND_L", SND_SOC_NOPM, 0, 0, NULL, 0,
-			       rk3308_codec_pop_sound_set,
-			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_OUT_DRV_E("HPOUT_POP_SOUND_R", SND_SOC_NOPM, 4, 0, NULL, 0,
-			       rk3308_codec_pop_sound_set,
-			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_SUPPLY("DAC_OUTPUT_VCM", SND_SOC_NOPM, 0, 0,
-			    rk3308_codec_dac_output_vcm_event,
-			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			    SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_OUT_DRV("L_HPOUT_EN", RK3308_DAC_ANA_CON03, 1, 0, NULL, 0),
-	SND_SOC_DAPM_OUT_DRV("R_HPOUT_EN", RK3308_DAC_ANA_CON03, 5, 0, NULL, 0),
-	SND_SOC_DAPM_OUT_DRV("L_HPOUT_WORK", RK3308_DAC_ANA_CON03, 2, 0, NULL, 0),
-	SND_SOC_DAPM_OUT_DRV("R_HPOUT_WORK", RK3308_DAC_ANA_CON03, 6, 0, NULL, 0),
+	{
+		.id = snd_soc_dapm_out_drv, .name = "L_HPOUT_EN",
+		SND_SOC_DAPM_INIT_REG_VAL(SND_SOC_NOPM, 1, 0),
+		.subseq = 1, /* Enable HPOUT after the HPMIX output drivers. */
+		.event = rk3308_codec_hpout_event,
+		.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD,
+	},
+	{
+		.id = snd_soc_dapm_out_drv, .name = "R_HPOUT_EN",
+		SND_SOC_DAPM_INIT_REG_VAL(SND_SOC_NOPM, 5, 0),
+		.subseq = 1, /* Enable HPOUT after the HPMIX output drivers. */
+		.event = rk3308_codec_hpout_event,
+		.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD,
+	},
 	SND_SOC_DAPM_OUTPUT("HPOUT_L"),
 	SND_SOC_DAPM_OUTPUT("HPOUT_R"),
 
-	SND_SOC_DAPM_OUT_DRV_E("L_LINEOUT_EN", RK3308_DAC_ANA_CON04, 0, 0,
-			       NULL, 0, rk3308_codec_lineout_event,
-			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_OUT_DRV_E("R_LINEOUT_EN", RK3308_DAC_ANA_CON04, 4, 0,
-			       NULL, 0, rk3308_codec_lineout_event,
-			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUT_DRV_E("L_LINEOUT_EN", RK3308_DAC_ANA_CON04, 0, 0, NULL, 0,
+			       rk3308_codec_lineout_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUT_DRV_E("R_LINEOUT_EN", RK3308_DAC_ANA_CON04, 4, 0, NULL, 0,
+			       rk3308_codec_lineout_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_OUTPUT("LINEOUT_L"),
 	SND_SOC_DAPM_OUTPUT("LINEOUT_R"),
 };
 
+/* The vendor flow settles MICBIAS before starting any MIC/ALC stages. */
+static int rk3308_codec_micbias_settle(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol, int event)
+{
+	msleep(50);
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rk3308_codec_bias_widget =
+	SND_SOC_DAPM_SUPPLY_S("MICBIAS Settled", 1, SND_SOC_NOPM, 0, 0,
+			      rk3308_codec_micbias_settle, SND_SOC_DAPM_POST_PMU);
+
+static const struct snd_soc_dapm_route rk3308_codec_bias_routes[] = {
+	{ "MICBIAS Settled", NULL, "MICBIAS1" },
+	{ "MICBIAS Settled", NULL, "MICBIAS2" },
+	{ "ADC_CURRENT_EN12", NULL, "MICBIAS Settled" },
+	{ "ADC_CURRENT_EN34", NULL, "MICBIAS Settled" },
+	{ "ADC_CURRENT_EN56", NULL, "MICBIAS Settled" },
+	{ "ADC_CURRENT_EN78", NULL, "MICBIAS Settled" },
+};
+
+static void rk3308_codec_seq_notifier(struct snd_soc_component *component,
+				      enum snd_soc_dapm_type type, int subseq)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+
+	/* Reinitialize together after the last ADC group, as in the vendor flow. */
+	if (type == snd_soc_dapm_supply && subseq == 2)
+		rk3308_codec_resync_adcs(rk3308);
+}
+
+static int rk3308_codec_add_widgets(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_widget *widgets;
+	int i, grp, ret;
+
+	widgets = devm_kmemdup(component->dev, rk3308_codec_dapm_widgets,
+			       sizeof(rk3308_codec_dapm_widgets), GFP_KERNEL);
+	if (!widgets)
+		return -ENOMEM;
+	for (i = 0; i < ARRAY_SIZE(rk3308_codec_dapm_widgets); i++) {
+		struct snd_soc_dapm_widget *w = &widgets[i];
+		unsigned int reg = w->reg;
+
+		if (reg >= RK3308_DAC_ANA_CON00 && reg <= RK3308_DAC_ANA_CON13) {
+			w->reg = SND_SOC_NOPM;
+			if (reg == RK3308_DAC_ANA_CON04)
+				w->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD;
+			if (reg == RK3308_DAC_ANA_CON00) {
+				w->subseq = 1;
+				w->event = rk3308_codec_dac_event;
+				w->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD;
+			}
+		}
+		for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++) {
+			if (reg == RK3308_ADC_ANA_CON00(grp) ||
+			    reg == RK3308_ADC_ANA_CON02(grp) ||
+			    reg == RK3308_ADC_ANA_CON05(grp))
+				w->reg = SND_SOC_NOPM;
+			if (reg == RK3308_ADC_ANA_CON06(grp)) {
+				w->reg = SND_SOC_NOPM;
+				w->shift = grp;
+				w->subseq = 2;
+				w->event = rk3308_codec_adc_event;
+				w->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD;
+			}
+		}
+	}
+	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
+					widgets, ARRAY_SIZE(rk3308_codec_dapm_widgets));
+	if (ret)
+		return ret;
+	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
+					&rk3308_codec_bias_widget, 1);
+	if (ret)
+		return ret;
+	return snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
+				      rk3308_codec_bias_routes,
+				      ARRAY_SIZE(rk3308_codec_bias_routes));
+}
+
 static const struct snd_soc_dapm_route rk3308_codec_dapm_routes[] = {
 	{ "MICBIAS1", NULL, "MICBIAS Current" },
 	{ "MICBIAS2", NULL, "MICBIAS Current" },
@@ -558,20 +1268,14 @@ static const struct snd_soc_dapm_route rk3308_codec_dapm_routes[] = {
 	{ "HPOUT_R", NULL, "DAC_BUF_REF_R" },
 	{ "L_HPOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
 	{ "R_HPOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
-	{ "L_HPOUT_EN", NULL, "DAC_OUTPUT_VCM" },
-	{ "R_HPOUT_EN", NULL, "DAC_OUTPUT_VCM" },
-	{ "L_HPOUT_WORK", NULL, "L_HPOUT_EN" },
-	{ "R_HPOUT_WORK", NULL, "R_HPOUT_EN" },
-	{ "HPOUT_POP_SOUND_L", NULL, "L_HPOUT_WORK" },
-	{ "HPOUT_POP_SOUND_R", NULL, "R_HPOUT_WORK" },
-	{ "HPOUT_L", NULL, "HPOUT_POP_SOUND_L" },
-	{ "HPOUT_R", NULL, "HPOUT_POP_SOUND_R" },
+	{ "HPOUT_L", NULL, "L_HPOUT_EN" },
+	{ "HPOUT_R", NULL, "R_HPOUT_EN" },
 
 	{ "L_LINEOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
 	{ "R_LINEOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
-	{ "L_LINEOUT_EN", NULL, "DAC_OUTPUT_VCM" },
-	{ "R_LINEOUT_EN", NULL, "DAC_OUTPUT_VCM" },
+	{ "LINEOUT_L", NULL, "DAC_BUF_REF_L" },
 	{ "LINEOUT_L", NULL, "L_LINEOUT_EN" },
+	{ "LINEOUT_R", NULL, "DAC_BUF_REF_R" },
 	{ "LINEOUT_R", NULL, "R_LINEOUT_EN" },
 };
 
@@ -715,7 +1419,7 @@ static int rk3308_codec_adc_dig_config(struct rk3308_codec_priv *rk3308,
 	 * grp 3 = ADC7 and ADC8
 	 */
 	u32 used_adc_grps;
-	int grp;
+	int grp, idx;
 
 	switch (params_channels(params)) {
 	case 1:
@@ -750,7 +1454,8 @@ static int rk3308_codec_adc_dig_config(struct rk3308_codec_priv *rk3308,
 		return -EINVAL;
 	}
 
-	for (grp = 0; grp < used_adc_grps; grp++) {
+	for (idx = 0; idx < used_adc_grps; idx++) {
+		grp = rk3308->adc_grps[idx];
 		regmap_update_bits(rk3308->regmap,
 				   RK3308_ADC_DIG_CON03(grp),
 				   RK3308_ADC_L_CH_BIST_MSK | RK3308_ADC_R_CH_BIST_MSK,
@@ -775,6 +1480,24 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
 
+static int rk3308_codec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(dai->component);
+	int gain;
+
+	if (rk3308->codec_ver > ACODEC_VERSION_B || stream != SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
+	mutex_lock(&rk3308->io_lock);
+	for (gain = mute ? 2 : 7; mute ? gain <= 7 : gain >= 2; gain += mute ? 1 : -1) {
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_DIG_CON04,
+				   RK3308_DAC_CIC_IF_GAIN_MSK, gain);
+		usleep_range(200, 300);
+	}
+	mutex_unlock(&rk3308->io_lock);
+
+	return 0;
+}
+
 static const u64 rk3308_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
@@ -785,6 +1508,7 @@ static const u64 rk3308_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops rk3308_codec_dai_ops = {
+	.mute_stream = rk3308_codec_mute_stream,
 	.hw_params = rk3308_codec_hw_params,
 	.set_fmt = rk3308_codec_set_dai_fmt,
 	.auto_selectable_formats = &rk3308_selectable_formats,
@@ -853,89 +1577,143 @@ static int rk3308_codec_initialize(struct rk3308_codec_priv *rk3308)
 		}
 	}
 
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
+			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK, rk3308->micbias_level);
+
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
+			   RK3308_ADC_CH1_IN_SEL_MSK | RK3308_ADC_CH2_IN_SEL_MSK,
+			   RK3308_ADC_CH1_IN_MIC | RK3308_ADC_CH2_IN_MIC);
+
+	/* Match the vendor analog defaults; controls remain adjustable. */
+	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++)
+		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
+				BIT(3) | BIT(7));
+
+	regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON03,
+			BIT(RK3308_DAC_L_HPOUT_MUTE_SFT) |
+			BIT(RK3308_DAC_R_HPOUT_MUTE_SFT));
+	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
+			   RK3308_DAC_x_HPOUT_GAIN_MSK, RK3308_DAC_x_HPOUT_GAIN_0DB);
+	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
+			   RK3308_DAC_x_HPOUT_GAIN_MSK, RK3308_DAC_x_HPOUT_GAIN_0DB);
+	regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON04,
+			BIT(RK3308_DAC_L_LINEOUT_MUTE_SFT) |
+			BIT(RK3308_DAC_R_LINEOUT_MUTE_SFT));
+	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON04,
+			   RK3308_DAC_L_LINEOUT_GAIN_MSK |
+			   RK3308_DAC_R_LINEOUT_GAIN_MSK,
+			   RK3308_DAC_L_LINEOUT_GAIN_MSK |
+			   RK3308_DAC_R_LINEOUT_GAIN_MSK);
+
 	/* set HPMIX default gains (reset value is 0, which is illegal) */
 	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON12,
 			   RK3308_DAC_L_HPMIX_GAIN_MSK |
 			   RK3308_DAC_R_HPMIX_GAIN_MSK,
-			   RK3308_DAC_L_HPMIX_GAIN_NDB_6 |
-			   RK3308_DAC_R_HPMIX_GAIN_NDB_6);
+			   RK3308_DAC_L_HPMIX_GAIN_0DB | RK3308_DAC_R_HPMIX_GAIN_0DB);
 
 	/* recover DAC digital gain to 0 dB (reset value is 0xff, undocumented) */
 	if (rk3308->codec_ver == ACODEC_VERSION_C)
 		regmap_write(rk3308->regmap, RK3308_DAC_DIG_CON04,
 			     RK3308BS_DAC_DIG_GAIN_0DB);
 
-	/*
-	 * Unconditionally enable zero-cross detection (needed for AGC,
-	 * harmless without AGC)
-	 */
-	for (grp = 0; grp < ADC_LR_GROUP_MAX; grp++)
-		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON02(grp),
-				RK3308_ADC_CH1_ZEROCROSS_DET_EN |
-				RK3308_ADC_CH2_ZEROCROSS_DET_EN);
-
 	return 0;
 }
 
 static int rk3308_codec_probe(struct snd_soc_component *component)
 {
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	int ret;
 
+	ret = rk3308_codec_add_widgets(component);
+	if (ret)
+		return ret;
 	rk3308->component = component;
+	rk3308->dac_output = 11;
+	rk3308->output_routes_mask = 3;
 
 	rk3308_codec_reset(component);
 	rk3308_codec_initialize(rk3308);
 
-	return 0;
+	return rk3308_codec_add_mic_boost_controls(component);
 }
 
+/* Reference-current ramps are shared by playback and capture. */
 static int rk3308_codec_set_bias_level(struct snd_soc_component *component,
-				       enum snd_soc_bias_level level)
+				 enum snd_soc_bias_level level)
 {
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	unsigned int v;
+	bool on = level == SND_SOC_BIAS_STANDBY;
 
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		break;
-	case SND_SOC_BIAS_PREPARE:
-		break;
-	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF)
-			break;
-
-		/* Sequence from TRM Section 8.6.3 "Power Up" */
-		regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON02,
-				RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN);
-		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
-				   RK3308_ADC_CURRENT_CHARGE_MSK, 1);
-		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
-				RK3308_ADC_REF_EN);
+	if (level != SND_SOC_BIAS_OFF && !on)
+		return 0;
+	if (on && snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF)
+		return 0;
+	if (on) {
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON01,
+				   RK3308_DAC_HPOUT_POP_SOUND_L_MSK |
+				   RK3308_DAC_HPOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_HPOUT_POP_SOUND_L_INIT | RK3308_DAC_HPOUT_POP_SOUND_R_INIT);
+		if (rk3308->codec_ver >= ACODEC_VERSION_B)
+			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,
+					   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |
+					   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,
+			RK3308_DAC_L_SEL_DC_FROM_VCM | RK3308_DAC_R_SEL_DC_FROM_VCM);
+	}
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
+			   RK3308_ADC_CURRENT_CHARGE_MSK, 1);
+	if (rk3308->codec_ver >= ACODEC_VERSION_B)
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
+				   RK3308_DAC_CURRENT_CHARGE_MSK, 1);
+	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
+			   RK3308_ADC_REF_EN, on ? RK3308_ADC_REF_EN : 0);
+	if (rk3308->codec_ver >= ACODEC_VERSION_B)
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
+				   RK3308_DAC_VCM_LINEOUT_EN,
+				   on ? RK3308_DAC_VCM_LINEOUT_EN : 0);
+	for (v = 1; v <= 0x7f; v++) {
 		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
-				   RK3308_ADC_CURRENT_CHARGE_MSK, 0x7f);
-		msleep(20);	/* estimated value */
-		break;
-	case SND_SOC_BIAS_OFF:
-		/* Sequence from TRM Section 8.6.4 "Power Down" */
+				   RK3308_ADC_CURRENT_CHARGE_MSK, v);
+		usleep_range(200, 250);
+	}
+	for (v = 1; rk3308->codec_ver >= ACODEC_VERSION_B && v <= 0xf; v++) {
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,
+				   RK3308_DAC_CURRENT_CHARGE_MSK, v);
+		usleep_range(200, 250);
+	}
+	msleep(20);
+	if (on) {
 		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
-				   RK3308_ADC_CURRENT_CHARGE_MSK, 1);
-		regmap_clear_bits(rk3308->regmap, RK3308_ADC_ANA_CON10(0),
-				  RK3308_ADC_REF_EN);
-		regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON02,
-				  RK3308_DAC_L_DAC_EN | RK3308_DAC_R_DAC_EN);
-		msleep(20);	/* estimated value */
-		break;
+				   RK3308_ADC_CURRENT_CHARGE_MSK, 0x7c);
+		if (rk3308->codec_ver == ACODEC_VERSION_C) {
+			/* C uses the larger HPOUT and LINEOUT drive strength. */
+			regmap_write(rk3308->regmap, RK3308_DAC_ANA_CON07, 0x11);
+			regmap_write(rk3308->regmap, RK3308_DAC_ANA_CON08, 0x11);
+		}
 	}
+
 	return 0;
 }
 
+static void rk3308_codec_remove(struct snd_soc_component *component)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+
+	rk3308_codec_set_jack(component, NULL, NULL);
+	mutex_lock(&rk3308->io_lock);
+	rk3308->component = NULL;
+	mutex_unlock(&rk3308->io_lock);
+}
+
 static const struct snd_soc_component_driver rk3308_codec_component_driver = {
+	.remove = rk3308_codec_remove,
+	.set_jack = rk3308_codec_set_jack,
 	.probe = rk3308_codec_probe,
 	.set_bias_level = rk3308_codec_set_bias_level,
+	.seq_notifier = rk3308_codec_seq_notifier,
 	.controls = rk3308_codec_controls,
 	.num_controls = ARRAY_SIZE(rk3308_codec_controls),
-	.dapm_widgets = rk3308_codec_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(rk3308_codec_dapm_widgets),
 	.dapm_routes = rk3308_codec_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rk3308_codec_dapm_routes),
 };
@@ -971,6 +1749,7 @@ static int rk3308_codec_get_version(struct rk3308_codec_priv *rk3308)
 	}
 
 	dev_info(rk3308->dev, "Found codec version %c\n", rk3308->codec_ver);
+
 	return 0;
 }
 
@@ -997,13 +1776,46 @@ static int rk3308_codec_set_micbias_level(struct rk3308_codec_priv *rk3308)
 				     "Invalid value %u for 'rockchip,micbias-avdd-percent'\n",
 				     percent);
 
-	regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(0),
-			   RK3308_ADC_LEVEL_RANGE_MICBIAS_MSK,
-			   mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT);
+	/* Applied after the component resets the codec. */
+	rk3308->micbias_level = mult << RK3308_ADC_LEVEL_RANGE_MICBIAS_SFT;
 
 	return 0;
 }
 
+/* Legacy boards describe the internal ADC-to-I2S2 SDI mux here. */
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
@@ -1017,6 +1829,7 @@ static int rk3308_codec_platform_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rk3308->dev = dev;
+	mutex_init(&rk3308->io_lock);
 
 	rk3308->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(rk3308->grf))
@@ -1049,10 +1862,18 @@ static int rk3308_codec_platform_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rk3308);
 
+	err = rk3308_codec_adc_grps_route(rk3308);
+	if (err)
+		return dev_err_probe(dev, err, "Invalid ADC group routing\n");
+
 	err = rk3308_codec_set_micbias_level(rk3308);
 	if (err)
 		return err;
 
+	err = rk3308_codec_hpdet_init(pdev, rk3308);
+	if (err)
+		return err;
+
 	err = devm_snd_soc_register_component(dev, &rk3308_codec_component_driver,
 					      &rk3308_codec_dai_driver, 1);
 	if (err)
diff --git a/sound/soc/codecs/rk3308_codec.h b/sound/soc/codecs/rk3308_codec.h
index a4226b235ab7..5d591c3d5f0d 100644
--- a/sound/soc/codecs/rk3308_codec.h
+++ b/sound/soc/codecs/rk3308_codec.h
@@ -2,7 +2,7 @@
 /*
  * Rockchip RK3308 internal audio codec driver -- register definitions
  *
- * Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
+ * Copyright (c) 2018-2026, Rockchip Electronics Co., Ltd All rights reserved.
  * Copyright (c) 2022, Vivax-Metrotech Ltd
  */
 
@@ -471,6 +471,19 @@
 #define RK3308_DAC_HPOUT_POP_SOUND_x_WORK	0x2
 #define RK3308_DAC_HPOUT_POP_SOUND_x_INIT	0x1
 
+#define RK3308_DAC_HPOUT_POP_SOUND_L_MSK	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_MSK << RK3308_DAC_HPOUT_POP_SOUND_L_SFT)
+#define RK3308_DAC_HPOUT_POP_SOUND_L_WORK	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_WORK << RK3308_DAC_HPOUT_POP_SOUND_L_SFT)
+#define RK3308_DAC_HPOUT_POP_SOUND_L_INIT	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_INIT << RK3308_DAC_HPOUT_POP_SOUND_L_SFT)
+#define RK3308_DAC_HPOUT_POP_SOUND_R_MSK	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_MSK << RK3308_DAC_HPOUT_POP_SOUND_R_SFT)
+#define RK3308_DAC_HPOUT_POP_SOUND_R_WORK	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_WORK << RK3308_DAC_HPOUT_POP_SOUND_R_SFT)
+#define RK3308_DAC_HPOUT_POP_SOUND_R_INIT	\
+	(RK3308_DAC_HPOUT_POP_SOUND_x_INIT << RK3308_DAC_HPOUT_POP_SOUND_R_SFT)
+
 /* RK3308_DAC_ANA_CON02 - REG: 0x0448 */
 #define RK3308_DAC_R_DAC_WORK			BIT(7)
 #define RK3308_DAC_R_DAC_EN			BIT(6)
@@ -488,6 +501,8 @@
 #define RK3308_DAC_L_HPOUT_WORK			BIT(2)
 #define RK3308_DAC_L_HPOUT_EN			BIT(1)
 #define RK3308_DAC_L_HPOUT_MUTE_SFT		0
+#define RK3308_DAC_R_HPOUT_UNMUTE		BIT(RK3308_DAC_R_HPOUT_MUTE_SFT)
+#define RK3308_DAC_L_HPOUT_UNMUTE		BIT(RK3308_DAC_L_HPOUT_MUTE_SFT)
 
 /* RK3308_DAC_ANA_CON04 - REG: 0x0450 */
 #define RK3308_DAC_x_LINEOUT_GAIN_MAX		0x3
@@ -511,6 +526,7 @@
 /* RK3308_DAC_ANA_CON05 - REG: 0x0454, step is 1.5db */
 /* RK3308_DAC_ANA_CON06 - REG: 0x0458, step is 1.5db */
 #define RK3308_DAC_x_HPOUT_GAIN_MAX		0x1e
+#define RK3308_DAC_x_HPOUT_GAIN_0DB		0x1a
 #define RK3308_DAC_x_HPOUT_GAIN_SFT		0
 #define RK3308_DAC_x_HPOUT_GAIN_MSK		(0x1f << RK3308_DAC_x_HPOUT_GAIN_SFT)
 #define RK3308_DAC_x_HPOUT_GAIN_MIN		(0x00 << RK3308_DAC_x_HPOUT_GAIN_SFT)
