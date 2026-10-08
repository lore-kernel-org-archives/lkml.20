Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168047ACEB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457662; cv=none; b=u1SSGTWOre3Ml9Z9rkVbebcmzl7m+z+bwtCg1hb9FGhaIIGmhZFtutsVpsKEkioiK8u7C8aPbTdLu3wIfHHvKg7gvfyXA/bsQc9lnSLuLGFmJwQDjFnytOsaOqAtqssi2lDrN7oBDcnDoLJo6CP01JWPXGi5p8ePVSMG7RZKB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457662; c=relaxed/simple;
	bh=j1VXmQNiRWauxnpIyPN1/TUSctGaoJcGcJxlEEYna3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWbVXf4gsiYDYCwMdf6PN8umffdHsd88e3dJzWtG3uJa92jA7IrR5FncuIvUz58s+bh9GdUmQX5RjVQyv2yGS49QrtubvnezAj5UQQSFuZxAv+7r9Spoj+8f7yKd3zTPplUqxA7BDh+H85oYVav+8Fgi+//r5AOjMJqh0dfDdjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGnfs0fR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Si6R9L8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGnfs0fR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Si6R9L8m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbWPN2633569
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=; b=VGnfs0fR32tYpLND
	zktVTfbkQ/gDTFjHJPpMRzsQXTVOzq3X6wAhesF6bVNH/Mp9dZOTQGg78/HXkB9w
	uQRrBayuRcef8iOE/JUmxbq+D1gTpbjc4SLGjp5B8LrXClBMwtxclDc9Z63al4+k
	gWaFdal4XporHv7vWIE2+kgCMdIRHV/ouwtH9Y4g4coKs3AUPAAV5bv5rw6zCPOv
	7zqxo5abZooXHXrWb0qFYpaBnOhwDdRoG0HYQ1D38SgBpb+mgVcrSgY7ejRSyXxc
	gf9JvEVCP08CNZ2Puy4PksOzvCw5WB32QUphIDA8Ohiy+ajGcaC23PDbxtkkdca3
	4qmgfg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ajc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887e45c81bdso2419068b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457654; x=1792062454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=;
        b=Si6R9L8mFDYYfjlr+NJjoLaQlIkKoQM5k8SEfiqqakY/aDHpcyo63gb90kLXl32HvV
         8MDCrN40Gazr9VYxPwdTJsYhXTJV6/8Je9zoA51l+rTYXEsU0p7H4K181L58QAmCTvq7
         L9+2jZHNAU2lAPYclQ4Oi2gH3qDjSd3mdeuu0KOT3oVki9qP5wMt3QeUaADwFWefnNiH
         42fXo2ApxRa0ZKQGqZ7O3V0oFvLNNxV4BfrXC4U+ACRPxq2fCpqDOVAMnJte50rUYcs8
         2S8smkMwWy12L8UZcntqATLejP3gFrVlQFh6E0byAaV/h5kFKq3Ctoggc9s4O0GpqMGz
         JVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457654; x=1792062454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=;
        b=squ04ygSb0tb4EqRVCGaiz+UGuuRasC/rlHkkRHCzf5VksTQCqOETzFsX8L9XYpoal
         KFAKIM2xkrrnEtHI8/5rLPgvKGDFZMFydCpdfZ6Ru5PNiMopJSmsvADcDJgVjBRxGeRK
         pECK6ksWgNqQoQy/vx7FZyRN0sBVfbV/1rS8oSjOnvpH5g03nTkZ+UZrYatPYOFOOpuF
         lXhPGH3bqdm/A/Sk2B48eEe0f7R4Y9Uv/xCrD2Lsu0ISDNZwBt4SIeFDJvIakH977Dze
         AOF2FyTGWp+FCBA4WhzZPRVdM26oxy5EzQ2dANVDbG2h1IGXsvXhnpgbaWkvtuYdfzY/
         ASDQ==
X-Forwarded-Encrypted: i=1; AKwUvByW7PCgG24uSyhhcfUh+EqjJNbsVj+Dk5WARvzBmDtz6qejU7X7Jo7am5jujHRZ6dYa2LxgIFy93c5JcUk=@vger.kernel.org
X-Gm-Message-State: AFuF++kMnPnVN2z8+PC7ETyq3Sd49H+h2LHtRWFcgX2MXMBJM7CIWjwH
	uJLlrcZywA+QBt7rxMtERIPrrZpAUQrJacMGOhsKv8sVR3WUd+IR73ofF0d018klKFC408mWjQm
	3KH1QKTQbSzzF8QHnT87LeHhd9MeupXqXgmQ/c1bFTQum6y07RASX1dwTVDn3gtEKJAU=
X-Gm-Gg: AYBFou1u9GN92U/+2Ude6EQtLpM6NjgJBMQylMtSxNFhArwojY8AqAstJaC2N/lJXQ1
	oYAXyUjZ1YFKCuoUkWMjDZainnyokTERbZsTrPTrAS/wzsWM8imdrS24gtf7yPo1Ka7uYH2hqi8
	0ntVAv0d8XtzxB0vRIw3ByymPRl69SNIEoZbscxcZYt6orOu6bujcxaudvWrMA1P/P11knGVX7J
	nJT0bTFpBmtMBD4dvUmHw1LAaAiZe3zOY78qV63lWpfTm8+1mMTgeI0aamTc7tjnkL0/S8tyYgt
	/xYaE8ju2DkljclgyDIpwZUMo3qOF7zXEX01cUPsOSDVzZX2vB0g7qaaHedF6uR54LvaZ0NQviU
	yV2AUDrqLp6M0G8+bx2dQeAt74VJEi+vdh7Bo
X-Received: by 2002:a05:6a00:71c5:b0:892:66a1:a175 with SMTP id d2e1a72fcca58-89266a1a706mr2671093b3a.52.1791457653635;
        Thu, 08 Oct 2026 04:07:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:71c5:b0:892:66a1:a175 with SMTP id d2e1a72fcca58-89266a1a706mr2671075b3a.52.1791457653191;
        Thu, 08 Oct 2026 04:07:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:45 +0530
Subject: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add Nord sound card support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-5-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=4331;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=j1VXmQNiRWauxnpIyPN1/TUSctGaoJcGcJxlEEYna3c=;
 b=O05f/xCaJS1V17EG2EvLIwtm/tH03oFKGBOc1ZE7FALHkA0Xv32H2L54Ow0JfQolkpOwGDs85
 xq00j+alFz8BvQ1bnZ0kTckL/OsfjGdjwT+qCAP+XfTd5p91FFMtSrw
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac77976 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EcOXNZcWnQqa4qozP7MA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXwZRU3IG0EHbZ
 O93LOYCAb2609BxqHSfCQluqptJiFX8NILqX6Ivnff6whjesyLInW/fC6xZemvAIac9xnvtzIyT
 jp8S2byNnVpWTBDwUnfOzkVVoIpGuAg=
X-Proofpoint-GUID: UGnQTOwz4_I6deshy-jq7eeDLwWO-jHu
X-Proofpoint-ORIG-GUID: UGnQTOwz4_I6deshy-jq7eeDLwWO-jHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX3Nud40j/V+DN
 ALWVvOEVYRvNJB6Rhd9ev0FA5QNd/ri6DJo7tOiYuVHMZQqWc+byWr40QUCenUhb307Wol1hOxQ
 lXM4OBrQDHRlWgJScvJ/3aDXD0f9CG1R7f5oE24DHM5uduNq2DBa6biCWf7glHbYyX7y8UrWuwA
 5QWx1tZmHtQ+0jpTx2hNO5rbtuQ3ABXdsGFybadyFbGY04ViX1oSmqYpuBJTH7DzEPtn9y1jz/Q
 OewapiMpD2tKk6pgqtJmGRg/MSzvmXc3cGbmcWfTZMQLIW5o+X+6p+ZFhfBmSB+adETIKn0neSw
 PyTT9ce1lrF1Tm4IpC5sijS2RuTy5bfy9WBRhA4eLJl+/i7CaGCr+ycB7rd7VTVOAq0k4UXtNMU
 cq+bxem3E2eNXvjbif7JhR0xkm4oB8L8Sc7eNhpvMY3XiUlOUhdOj883ywqq9jRYWIWNmnXW2wA
 HfJLwvPSh26iOYNLnbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Add support for the Nord Ride and RRD sound cards by introducing the
qcom,nord-sndcard compatible and associated platform-specific data.
 
Nord uses external codecs for its playback and capture paths and requires
board-specific DAI and clock configuration. Configure the codec DAI format
for DSP_A operation and enable MI2S bit clock handling for the platform.
 
Add a platform-specific sound card initialization callback to configure
the ADAU1979 capture codec to use LRCLK as its system clock source. This
configuration is done during DAI link initialization so that the codec
clock source and associated rate constraints are established before the
capture stream is opened.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index b5d367486..a759ae951 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -25,6 +25,10 @@
 #define I2S_BIT_RATE(rate, channels, format) \
 	((rate) * (channels) * (format))
 
+#define ADAU1977_SYSCLK 0
+#define ADAU1977_SYSCLK_SRC_MCLK 0
+#define ADAU1977_SYSCLK_SRC_LRCLK 1
+
 static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
@@ -92,6 +96,7 @@ struct qcom_snd_soc_common {
 	bool wcd_jack;
 	const struct sc8280xp_dai_data *dai_data;
 	size_t num_dai_data;
+	int (*snd_init)(struct snd_soc_pcm_runtime *rtd);
 	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
@@ -224,9 +229,16 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
+	int ret;
 
 	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
 
+	if (data->priv->snd_init) {
+		ret = data->priv->snd_init(rtd);
+		if (ret)
+			return ret;
+	}
+
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
@@ -305,6 +317,35 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case AIF_TDM_TX_8:
+		/*
+		 * adau1979 PLL clocked from LRCLK, no external MCLK. Selecting
+		 * the source also installs the PLL rate constraint, which the
+		 * codec applies from its startup() callback, so it has to be
+		 * in place before the first stream is opened. The frequency is
+		 * unused for an LRCLK-sourced PLL.
+		 */
+		ret = snd_soc_component_set_sysclk(codec_dai->component,
+						   ADAU1977_SYSCLK,
+						   ADAU1977_SYSCLK_SRC_LRCLK,
+						   48000, SND_SOC_CLOCK_IN);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -552,6 +593,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common nord_priv_data = {
+	.driver_name = "nord",
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_DSP_A,
+	.snd_init = nord_snd_init,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -677,6 +727,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
 	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,nord-sndcard", .data = &nord_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },

-- 
2.34.1

