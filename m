Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E23385D97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611399; cv=none; b=cOZpkIu6UdNmAPyU4Iy6AewBx36ZKuzrB5hlLOy3S4yu0oFx0f/UiTBmzVXyzbp+amxcHblDJtLzohkp5PR4CPQOF51314C+XZPSErDVIW9s+9XZmxtqHY4rPnAnn4clu47DxffqKB1taCd5U3VNeciAThtqNzJ7mVaY/mS0JjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611399; c=relaxed/simple;
	bh=0tc4pJYDNJZpwQ+BTiOo25tuHYzosxRAGmHIbeFsyQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCOzNJNnaH6y07GKVAstfg/a7ToVExD1bgJk0sq2srgKhZAVJ3lTLWFWjAulj9wna58guAPV/1EZX5thbAHz0nrycYk3YYUjH+b68wJUAu8s4Od3F6rA6HOAMgENN7SEvA+0Kp356bB6TXLC9wyZBgb5rIiVf2BgbrnqIx17O1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vwrah4Uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUEqFI00; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vwrah4Uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUEqFI00"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1hlRd3559773
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUcTC9r3J9GPoSACBkrMA0cBnB3tCe0jaTderQke2D4=; b=Vwrah4Uw/6+9Et0h
	6riAfncgDAzMOmmbXVe+8UhYH2iOawfDjPLY89QlKkxe6/pRvQtyhAJz4UfJb61I
	z3TxuRDIl3Go0k4TSTy85s0HbioBD5Lj+6klEZeOVtC/X+uZ51LfOS2l5i+QTiHg
	mcRiJlm5VOkLKf2+QzuGbFvrOXPxs6ie7VyglTXYSfBV0Hqqt2ZrSQPIQ3R4N0fK
	swamq2LUr+9he4JEgJu1P5Wl75tqDUUCFdaPUmBhPuNfjC0WQd2sA2ID53waod8g
	L8q2tGF+yxPUySjD4f1svhfgIv4pTt5BjU7T+C44pBSjolFMPuYzVJnV0+94adVb
	JMdh6A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7h9w62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:35 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8052a85c6a0so551710a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611394; x=1790216194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUcTC9r3J9GPoSACBkrMA0cBnB3tCe0jaTderQke2D4=;
        b=fUEqFI00R/McTtSe2tw5uNukKPl6O//VRNndwED2PwhALllgpNe88eVSQ4k4/OT21y
         8LY+ezszl5Qz3lKcS7XTI40NkYqy088ch5irD1zkzyEdPSobf35J0luun67eJE82SlPi
         as3v7a5o0YxbkWwtjfLEttWUS7g9ebEZf38137ld7FxZ4hKLgGisj55icesJm11omats
         qx2xW1flVDEIiLqTCDO06I/JLfnx+FrSAAA0f6vrB6rkk5nok/QZGivQbNFsHru+8um6
         bklVj3uBLfo5MEZByB2iuL6Elw8fuFGcObSeH8A8tYWKCe07SEEvL7T7ljrX77XyIWxN
         CaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611394; x=1790216194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUcTC9r3J9GPoSACBkrMA0cBnB3tCe0jaTderQke2D4=;
        b=jdzUhUU5ywsMcznQgDdldbCAi6sp8JLHd4wL5x2RsmrDe2Hu/DJyBOEAYx6sLXlLDz
         7mWXPM4/caPYNSvzVOKoSB3rXQM4bXS0pJsOtVZ5bR0CkgTeLArLSYmXLkPMaVmUkdFu
         sZlv8+3FVa/+Z1nO3stYwT0/8HCvAoAa95fGtt6VZWW0qYOeP2QOLj4+Q7jL3r9sqPZN
         B593Glski7BAqkGk0no4hfE0PaZuzvwVF9OUKiL+Qsw+qotxLso4AieX0t+OGy15BXrT
         ttuRhjU8CwvGJ9yf/5EsHHu7TA3UZxPLaS1g2yWlNX0mzfYgpw3BBdxAFBFzSwfslf5M
         LZeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy56ndODwqNnXqjuIxi7FRSuXDeNXM9I/lrLHWcP9Wv9IHgISSF69dO4IJCfXKClTXXpLdcAdgTBpoRLCY=@vger.kernel.org
X-Gm-Message-State: AFuF++mC6hDSQ1GX8RywLqpG26c7ozbT33SKLkA1Yu99m643udFrVMei
	UIp1vbYcvwKI1lX34lZMJ5M2Vpta0WqIhf3xLrXiWDokLpQeRqBf72TKVVHe38f8fbDeYOlVmX0
	bqnAsNKNMMdy1GWRT4fp25LG+/D2OIwJvKVpuIdkfyHHsFTlxsYT0RUWPBjBvs1JkYE8=
X-Gm-Gg: AYBFou1JrKPcLp5zI2YDie1NxH0bvCUawjjkSeEoIhxie63jCzRLUooWyCfrrauEFqV
	NRxoPc2weEWpCvKq02N+YW1qs4MNhs7pPadBI6zI5/tCuj6ZqfN8xa2mFg4hAiIPXSdMl2SBKKu
	GOZgKK7cBXWHJz0b+Z3SRtFqZcrmMPFKS3Ihre+hSCk8a9rLAbP55uq7B+PGKpE7eAtVg1PV7if
	XbiiFogodqrDqSWyo2Ni1ac7qEA+aBmMX1V2FbEITsq21fR+hbqE9ZyjDG7/iFY9ms0rI7uQTLc
	njPK/Gz5kQkbSTj5cnV1wS8j9Vw/lmcIxferJwnTIEvfee5TvLqCqGjAQhZsPYxecGzd103QwM7
	3oIZmTnamg8XaDU3fSoIzV4I7/21iMvOLhmwg
X-Received: by 2002:a05:6820:607:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6c7d36f99afmr4614984eaf.35.1789611394384;
        Wed, 16 Sep 2026 19:16:34 -0700 (PDT)
X-Received: by 2002:a05:6820:607:b0:6b7:46fc:1c4 with SMTP id 006d021491bc7-6c7d36f99afmr4614969eaf.35.1789611393918;
        Wed, 16 Sep 2026 19:16:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:36 +0530
Subject: [PATCH v3 v3 5/5] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone mux support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-5-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611366; l=8497;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=0tc4pJYDNJZpwQ+BTiOo25tuHYzosxRAGmHIbeFsyQ8=;
 b=7nWN/cFLw0UsPkGkIq9wgcNOt73Ev0r0scAjKcfNXR/dKffGb6wknmq0GAg6ljV0QyX4+t2TY
 hen+L7pMBBuDEFXxqE85vpVPm3LqpyzF7mJ3a4gNUYTZiq7CoV7eMIr
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX2LwdToACl8se
 qb1VK2RePEOIU+k+s94RaaPM2e3fynbMzU4WQAgvJDXSCs3/wUu7ulMIexdbIb+gQBxm5WAs8QC
 88rx8q2o2jmFpI+um1Qw/5+TxhaGHzs4DFGtoZwRppCRwk4i9zFtMZH36DD6rLY7pS4rpaq36+E
 Hv25YugNCU6lSYr+pqEE6dmM7SDleJXX+E52Qeiu8ELAF0Jm+OqOE403ITt+rPj3d9HT3ov0M8n
 w4cZZv9QeU03wWBKaPhrDqFZJQBjZARdEidQQFzzziMbolmwX6hRKH2+W+j4/ddPqDHI5x6o2ES
 wEK+TAv/mJwAz8LiBb1o/VXebHfQ4QBYDEcryRAtHCuXZnZwr3zRigDT3g9rYAMFqCQsjuIEioG
 b8hhdAiakGPl8Ki7v7VDOo/oOIpmJFvtnrAr/B46qUHgUYsZrmkxFP3/auB8eg6CtCbK7jFRWH/
 i96pziXN3fOlBW9zeUQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab4d83 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=76V9-zZnIusTmnIAdMMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: 2Og8_0PMwQDjWyDbJX3TXCSb8fGb9v9t
X-Proofpoint-ORIG-GUID: 2Og8_0PMwQDjWyDbJX3TXCSb8fGb9v9t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX+d8QlOgNXwhQ
 qWFXhSQDthtRZcCdKbP4rHDy4H3EoOreonxE18TMIjFcYADAHBVoCUxIjl8OnmJP3JlAe5oQJkf
 Z6cONxGyupzOH2BA+dHcnRVHgw2oupY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

Update the decimator source selection logic to switch between DMIC and
SMIC sources based on the active input path.

Add a helper to detect whether a decimator is using a SoundWire microphone
input. Use this information to skip DMIC-specific HPF programming sequences
when the decimator is configured for an SMIC source.

This enables VA decimators to capture audio from either DMIC or SoundWire
microphone inputs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 133 +++++++++++++++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 31d399dfa..50673b012 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -758,10 +758,22 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (val != 0)
-		snd_soc_component_update_bits(component, mic_sel_reg,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+	if (val != 0) {
+		/*
+		 * SMIC enums use shift 0 (lower nibble of CFG0),
+		 * DMIC enums use shift 4 (upper nibble of CFG0).
+		 * Use e->shift_l to distinguish them without relying
+		 * on widget name comparisons.
+		 */
+		if (e->shift_l == 0)
+			snd_soc_component_update_bits(component, mic_sel_reg,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
+		else
+			snd_soc_component_update_bits(component, mic_sel_reg,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+						      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+	}
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
@@ -942,6 +954,16 @@ static int va_macro_enable_dmic(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static bool is_amic_enabled(struct snd_soc_component *comp, int decimator)
+{
+	u16 adc_mux_reg;
+
+	adc_mux_reg = CDC_VA_INP_MUX_ADC_MUX0_CFG1 +
+		      VA_MACRO_ADC_MUX_CFG_OFFSET * decimator;
+
+	return snd_soc_component_read(comp, adc_mux_reg) & BIT(0);
+}
+
 static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *kcontrol, int event)
 {
@@ -951,7 +973,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -982,9 +1003,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
 					      CDC_VA_TX_PATH_CLK_EN);
-		snd_soc_component_update_bits(comp, hpf_gate_reg,
-					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
-					      CDC_VA_TX_HPF_ZERO_GATE);
+		if (!is_amic_enabled(comp, decimator))
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+						      CDC_VA_TX_HPF_ZERO_GATE);
 
 		usleep_range(1000, 1010);
 		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
@@ -1010,7 +1032,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1210,6 +1231,39 @@ static const char * const adc_mux_text[] = {
 	"VA_DMIC", "SWR_MIC"
 };
 
+static const char * const smic_mux_text[] = {
+	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_MIC0", "SWR_MIC1",
+	"SWR_MIC2", "SWR_MIC3", "SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(va_smic0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_smic3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text);
+
+static const struct snd_kcontrol_new va_smic0_mux = SOC_DAPM_ENUM_EXT("va_smic0",
+			 va_smic0_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic1_mux = SOC_DAPM_ENUM_EXT("va_smic1",
+			 va_smic1_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic2_mux = SOC_DAPM_ENUM_EXT("va_smic2",
+			 va_smic2_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_smic3_mux = SOC_DAPM_ENUM_EXT("va_smic3",
+			 va_smic3_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
 static SOC_ENUM_SINGLE_DECL(va_dec0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG1,
 		   0, adc_mux_text);
 static SOC_ENUM_SINGLE_DECL(va_dec1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG1,
@@ -1345,6 +1399,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("VA DMIC MUX2", SND_SOC_NOPM, 0, 0, &va_dmic2_mux),
 	SND_SOC_DAPM_MUX("VA DMIC MUX3", SND_SOC_NOPM, 0, 0, &va_dmic3_mux),
 
+	SND_SOC_DAPM_MUX("VA SMIC MUX0", SND_SOC_NOPM, 0, 0, &va_smic0_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX1", SND_SOC_NOPM, 0, 0, &va_smic1_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX2", SND_SOC_NOPM, 0, 0, &va_smic2_mux),
+	SND_SOC_DAPM_MUX("VA SMIC MUX3", SND_SOC_NOPM, 0, 0, &va_smic3_mux),
+
 	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd-micb", 0, 0),
 	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
 	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
@@ -1489,6 +1548,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
 	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
 	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
 
+	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
+	{"VA SMIC MUX0", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX0", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX0", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX0", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
+	{"VA SMIC MUX1", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX1", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX1", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX1", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
+	{"VA SMIC MUX2", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX2", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX2", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX2", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_MIC7"},
+
+	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
+	{"VA SMIC MUX3", "ADC0", "VA SWR_ADC0"},
+	{"VA SMIC MUX3", "ADC1", "VA SWR_ADC1"},
+	{"VA SMIC MUX3", "ADC2", "VA SWR_ADC2"},
+	{"VA SMIC MUX3", "ADC3", "VA SWR_ADC3"},
+	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_MIC0"},
+	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_MIC1"},
+	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_MIC2"},
+	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_MIC3"},
+	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_MIC4"},
+	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_MIC5"},
+	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_MIC6"},
+	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_MIC7"},
+
 	{ "VA DMIC0", NULL, "DMIC0 Pin" },
 	{ "VA DMIC1", NULL, "DMIC1 Pin" },
 	{ "VA DMIC2", NULL, "DMIC2 Pin" },

-- 
2.34.1

