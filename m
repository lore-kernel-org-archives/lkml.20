Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774029;
	b=dar42w5k/AaGsKlqY8ZhlTNiSLdK/Tx4EBufb0Z0wDs634WMGr2/iVGceyfaySHGaCZO
	 FN6A4vR8bdKFbw8wWG2ePeKjs+dOxlA6lgKlQb0zsii3E7SsvxeFu7V99GFgrb8giALWG
	 EaTrqabe8XCPMLV+utEY87qqXRA2s8HwTJV9ooNPZMfv2p62rmpqQoERudRBv9bls8mVj
	 OvOp9fTXn8Cx2VQ0LWtikWRNT5ZYwR+o9JBTtBYwxB7cDua4VlFrmn7iqCfYX7o6+mc+F
	 6YdSiQfqJY0UccJW8GvuoY0pPXgmVs+hOiOmygYp2Vfv15sldxvOGVnDjcoDgfwhs4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774029;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L3z/pFNbh832V17qJoTRR3RNhn/e8DxsaMLeBHcQDhE=;
	b=Y5pQrqfIc426cW8ewFsSmNYJrnPYk1ebfS1qItyXuruptOGPHzKyTfTYVHOsfRfru5xB
	 0q/LjTbt2fybB/zA2ZCPCvPOvUCHd+6sE//nTTPIpVP7O3nu9/EUMuH95HxpwgNdev24B
	 +AqW69EvFf8SCRMztI5idU7Id569eSZ05MSpysNpzvACL5Of8OXUhUeJa8QYgw19yO2sV
	 QA1UEZftqfAzyGolZIMddUdzo1GCVTINKZsgDgQZ0RQYARmCwsCoHOLIU8omRJqVH5SZ9
	 mmhds5Xud5TX8evVte4wGTtMub3Lvdl2x4WOnwXwkL4NOsfk5OAZLlnc5g3wiuuWs1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSzfaKpP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4660A261E;
	Sun, 15 Nov 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSzfaKpP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774029;
	b=T7JPbcFOn1hki2uITgyZVrbi7im651LQG2pEaYALyO7McWfkLhSVBCpsqA60Ipvx4R0N
	 pT1kQjqRbhdO1lPreVimeFMS/bJzDQwDPAJcSBhyBtYhZLBUPHeXQo0Yl03zoGbQ+nEPt
	 Q9Pf7+VMZmWsJ8+E/iqPpvBeO9y1sRKDWpvogCy1U0lCkW1dhMQvqqYUHDputCHlxSdGB
	 HUByTFqcwnDSf4UifTAkaCBgH8jbF7/5DDnQiJ1fgtQc8Ajwt9ADvlzEPh+B3EtcKD0Tg
	 MNbr+7SPBmV4/xR9wXVoD85RAh5pezGSJuRNh8Kt2i6d0d4tuULh7TwxjiXhsvUn/yg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774029;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=L3z/pFNbh832V17qJoTRR3RNhn/e8DxsaMLeBHcQDhE=;
	b=SN4Rmv/lrHRymq7MnK74PZnp3K6epjJgdbyDFNNI9030xwwHFMb+zuSRJrtM+vr+TgBH
	 rBlfiLp2TF8yvx43pDe24MX95Vt8btsr5wQ+0Rg8h60aH3rTUfYYlB526Nv8czC0NF4P0
	 G7EzYdeifTkR5KS7EaU+wJMm20gN+BRnoQp7SFF1Ahs+sfnlCTq3q1XuV8ICaXOrh/8LG
	 zZ9IudZIgCoc9wXUDqGTYGXIDbFlQtEjCoutrP6fI4KPpTwTDbRbrO6qa7pkWXwxiN4z/
	 vk+VckpkPRhqfyKrtG6JTN3OzcEsKc7wQv8gZZWFl6W9NT8bLdH0dgXi2ZkK/38WMcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB0D81F02811;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774029;
	bh=L3z/pFNbh832V17qJoTRR3RNhn/e8DxsaMLeBHcQDhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KSzfaKpPhGiJWUJnvH19S2y1y59VowvYoEunRC81FU1KgvUHSRdYC1VdjJ4/oE5+1
	 /RzEp/nMIJDF73Bfe9f9PVF6sG+wdHBW9Bz8pdUsxUCf91vn+o85s90aSwj8ZXbHJR
	 VoFv5kaYvkci+OUSUMBgV9cNZlnsjPeGYTUwZekMkEx216AB6aJEE15BfmeL+Xj+Wb
	 QoOcCtGJmeXA1a8b4XYna5WweVgOxiKrGWjyFA8D1FRx7/M7F4CdCO2Ijsm2ePVMbE
	 pziOgAPr02OBtBFbVclSrN9NOUl/tvk1b34Eyv542pLT81nUp8l0KRLJZXHPu20UVE
	 28SDxdIJD5hWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 462544A1DC;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:29 +0530
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Add Motorola Signature sound
 card
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-vantage-sndcard-v1-2-df69a8759833@yahoo.com>
References: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
In-Reply-To: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774027; l=2831;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=4FOxSNJEx2JFAz0a5OgUofLrt5b17E6UxlzHA/kMQp4=;
 b=73+28dEXvSGlfy/dWegzNcPu0jfY1zX4cWN7VBCHfqORYJCihq0AE7TYQ2h8V8efKNZLmSSMH
 nlUVnN+c533DsMuqPopvvWzQYHjxHy2hd510AVkTdLIA836KkzIxWQw
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The Motorola Signature (vantage) has two TFA9865 amplifiers on the
senary MI2S interface, which expect 32-bit I2S slots. Add an option for
32-bit MI2S backends, enable the MI2S bit clock and add the card.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 sound/soc/qcom/sc8280xp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e136407c56bf..320d4b80b07b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -93,6 +93,7 @@ struct qcom_snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	bool mi2s_32bit;
 	bool wcd_jack;
 	const struct sc8280xp_dai_data *dai_data;
 	size_t num_dai_data;
@@ -292,6 +293,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_interval *rate = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
@@ -309,6 +311,15 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_3:
 		channels->min = 1;
 		break;
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		if (data->priv->mi2s_32bit) {
+			snd_mask_none(fmt);
+			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		}
+		break;
 	default:
 		break;
 	}
@@ -562,6 +573,14 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct qcom_snd_soc_common motorola_vantage_priv_data = {
+	.driver_name = "molokai",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.mi2s_32bit = true,
+};
+
 static struct qcom_snd_soc_common ayaneo_ps2_priv_data = {
 	.driver_name = "ayaneo-ps2",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -732,6 +751,7 @@ static const struct qcom_snd_soc_common sm8750_priv_data = {
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data },
+	{ .compatible = "motorola,vantage-sndcard", .data = &motorola_vantage_priv_data },
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },

-- 
2.56.0


