Received: from mail-m32106.qiye.163.com (mail-m32106.qiye.163.com [220.197.32.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05583D88F7;
	Fri,  4 Sep 2026 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517118; cv=none; b=aLiujxLu0E4G3A8LAboO9BsojULVoDgy2k4/ISLBliPSnHTt3IGGy7bvXdFv9zj43XZiS0A+4OTXb33RSgZwObIHmPVjTCd6lQGBWLINvz7rEDTY1tSNyVQqH0Qzh/u2Hr4Q7Z8CTCTixQ/DcrN2VUXPcqe0qzr6feknrUFGuZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517118; c=relaxed/simple;
	bh=k+MlA6X3Punm2gYWRdKkhl6OvEkpZR1/eHhSIaY2LAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYxfgOUC0J4eV4+s4bp7ftGAiV6WseyDTN5JVsLjp7WGi3xFgrOpp5WO/RBbVxYZmO/xvaKwqpKt3rhU6p/nsNs7b2i+/dWCYfxibgz5qpfdHKgk3+bHTOI0IM5HSrx9Ek4NDUt8nRuBx1smwniUdZkSaLW6zAn2gJ4OYxIJv7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=RueZZFbN; arc=none smtp.client-ip=220.197.32.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="RueZZFbN"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646d9;
	Fri, 4 Sep 2026 18:02:58 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:28 +0800
Subject: [PATCH v3 4/6] ASoC: qcom: sc8280xp: Add per-DAI board
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-4-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=8539;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=k+MlA6X3Punm2gYWRdKkhl6OvEkpZR1/eHhSIaY2LAU=;
 b=MM6qCFgV5QGU/30NkC6WwK9hVka7kICPTki4j9AsXqCiU8RpkxTvmP1XC009CZrUt/SJYROio
 tikQue8wAc6D0oCeO3QpDfRrEKRcETkRuKLx5Yaijqe3x1GnKnQB3XS
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf1afd09d5kunm6f63729aafb80
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR9CVhhCTE8eSklJH0IYHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=RueZZFbNt7uyv295plX+KGuEMlgfa64QL/BpZNXay0ZWMi8PRgdyl4xPkkAXzmGhXEwWRHUjlV05DhTo16cfojDmJLZJNW5C2QzjfqIOnjeCJi9RH5htZ6FBcQUZFOHolX3LEsF1UBNg1ySxu8u4yC0b6OnbAEXmAcqjiDz5HN4=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=mfgZSbr/syZYI9aMdBK862dul9i0Zwry4EFMXAiJ6E0=;
	h=date:mime-version:subject:message-id:from;

The board data currently applies codec sysclk, MI2S clock and jack setup
policy to every backend DAI on a sound card. This cannot describe a card
whose codecs have different clock requirements on different MI2S
interfaces.

Add an optional per-DAI configuration table indexed by CPU DAI ID. Each
entry can override the MCLK rate, CPU MCLK and BCLK programming, codec
sysclk setup and jack setup path. Keep the codec DAI format card-wide.

Cards without a matching per-DAI entry continue to use the existing
card-wide settings, keeping all current board data unchanged.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/sc8280xp.c | 107 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..368a54c2cdf8 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -58,6 +58,25 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+enum sc8280xp_jack_setup {
+	SC8280XP_JACK_SETUP_NONE,
+	SC8280XP_JACK_SETUP_CODEC,
+	SC8280XP_JACK_SETUP_WCD,
+};
+
+struct sc8280xp_dai_data {
+	unsigned int id;
+	unsigned int mclk_rate;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	enum sc8280xp_jack_setup jack_setup;
+};
+
+#define SC8280XP_DAI_DATA(...) \
+	.dai_data = (const struct sc8280xp_dai_data[]) { __VA_ARGS__ }, \
+	.num_dai_data = ARRAY_SIZE(((const struct sc8280xp_dai_data[]) { __VA_ARGS__ }))
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -71,6 +90,8 @@ struct qcom_snd_soc_common {
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
 	bool wcd_jack;
+	const struct sc8280xp_dai_data *dai_data;
+	size_t num_dai_data;
 	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
@@ -83,6 +104,20 @@ struct sc8280xp_snd_data {
 	bool jack_setup;
 };
 
+static const struct sc8280xp_dai_data *
+sc8280xp_get_dai_data(const struct qcom_snd_soc_common *common,
+		      unsigned int id)
+{
+	size_t i;
+
+	for (i = 0; i < common->num_dai_data; i++) {
+		if (common->dai_data[i].id == id)
+			return &common->dai_data[i];
+	}
+
+	return NULL;
+}
+
 static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
 {
 	int rate = params_rate(params);
@@ -112,13 +147,22 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	const struct sc8280xp_dai_data *dai_data;
 	struct snd_soc_dai *codec_dai;
 	struct qcom_snd_tdm_slot_cfg cpu_cfg;
 	struct qcom_snd_tdm_slot_cfg codec_cfg;
+	bool codec_sysclk_set = data->priv->codec_sysclk_set;
+	bool mi2s_bclk_enable = data->priv->mi2s_bclk_enable;
 	int bclk_freq;
 	int ret;
 	int i;
 
+	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
+	if (dai_data) {
+		codec_sysclk_set = dai_data->codec_sysclk_set;
+		mi2s_bclk_enable = dai_data->mi2s_bclk_enable;
+	}
+
 	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
 	if (ret)
 		return ret == -ENOENT ? 0 : ret;
@@ -147,7 +191,7 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (bclk_freq <= 0)
 		return -EINVAL;
 
-	if (data->priv->mi2s_bclk_enable) {
+	if (mi2s_bclk_enable) {
 		ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_MI2S_BCLK, bclk_freq,
 					     SND_SOC_CLOCK_IN);
 		if (ret && ret != -ENOTSUPP) {
@@ -157,7 +201,7 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (data->priv->codec_sysclk_set) {
+	if (codec_sysclk_set) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			ret = snd_soc_dai_set_sysclk(codec_dai, 0, bclk_freq,
 						     SND_SOC_CLOCK_IN);
@@ -176,10 +220,13 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	const struct sc8280xp_dai_data *dai_data;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
 
+	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
+
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
@@ -209,10 +256,24 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	if (data->priv->wcd_jack)
-		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (!dai_data) {
+		if (data->priv->wcd_jack)
+			return qcom_snd_wcd_jack_setup(rtd, &data->jack,
+						       &data->jack_setup);
 
-	return 0;
+		return 0;
+	}
+
+	switch (dai_data->jack_setup) {
+	case SC8280XP_JACK_SETUP_CODEC:
+		return qcom_snd_headset_jack_setup(rtd, &data->jack,
+					   &data->jack_setup);
+	case SC8280XP_JACK_SETUP_WCD:
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack,
+					       &data->jack_setup);
+	default:
+		return 0;
+	}
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -251,10 +312,24 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	const struct sc8280xp_dai_data *dai_data;
+	bool codec_sysclk_set = data->priv->codec_sysclk_set;
+	bool mi2s_mclk_enable = data->priv->mi2s_mclk_enable;
+	bool mi2s_bclk_enable = data->priv->mi2s_bclk_enable;
+	int mclk_freq;
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 	int ret;
 
+	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
+	mclk_freq = sc8280xp_get_mclk_freq(params);
+	if (dai_data) {
+		codec_sysclk_set = dai_data->codec_sysclk_set;
+		mi2s_mclk_enable = dai_data->mi2s_mclk_enable;
+		mi2s_bclk_enable = dai_data->mi2s_bclk_enable;
+		if (dai_data->mclk_rate)
+			mclk_freq = dai_data->mclk_rate;
+	}
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -271,7 +346,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->priv->mi2s_mclk_enable) {
+		if (mi2s_mclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_MCLK, mclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -279,7 +354,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->priv->mi2s_bclk_enable) {
+		if (mi2s_bclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_BCLK, bclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -287,7 +362,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->priv->codec_sysclk_set) {
+		if (codec_sysclk_set) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
@@ -368,6 +443,19 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
+static void sc8280xp_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	const struct sc8280xp_dai_data *dai_data;
+
+	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
+	if (dai_data && dai_data->jack_setup == SC8280XP_JACK_SETUP_CODEC) {
+		qcom_snd_headset_jack_cleanup(rtd);
+		data->jack_setup = false;
+	}
+}
+
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
@@ -384,6 +472,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sc8280xp_snd_init;
+			link->exit = sc8280xp_snd_exit;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
 		}

-- 
2.43.0

