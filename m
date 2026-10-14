Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767614E36E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969261; cv=none; b=VDY4D1PDib9uOB9nBPm/wbUOkyCpNOwj/beyfmcrW490n0RmJjasU//hRbRhHTlUcf9ojcX/2NkPdO/kxmyIrNILfVF71CeUm1+CbbSZuygoo0e4ZHQCf4k/ig5zZtFa+lWpu9uQEFHjHAIYTlyU6Sz9txfa0QUQ4njXsN2mSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969261; c=relaxed/simple;
	bh=VB3Cu6NV9yujt5yjM3EqmLXQajeEsqJPBxY0+qYYScU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n53dhNca4BPsgRq151F2TI7hOx4lAklk+x1q4nXOINKjOKMNmXxFJVRr3v6hGmF0U48fFb/6LPlxZJmqnlnfh4lf/MTRW+D6x7dc/LBTz5pSj4jYt7G7nzDK5fv4ruHJpQ0WosYZjzflCRc/kcy5cTZvKb5flJrGjoCJ/Gk05v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XItbaPmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxCHDc7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XItbaPmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxCHDc7u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3u5L52222165
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz51rnkSreoedDhc9aniU3gEDQ8VbiNX+1DNCRbuyAE=; b=XItbaPmv+RVoEGTe
	lwhQ9dlN9kweU8B4eqXZDwLfMUQw6XFfHOP0XJ38AAuNzLZValxXjdjZiGMsvqP4
	/+IcJ7sn3xg5TZ1h7Ty2yzavRAK7QrUppmLD//vGOPCuIZ+nUZu6LLZMsn9QPl4K
	kU7bV4BFej9vWcnzt7hl56umYDlkXxQIe5DwYqfNrYv1V4OvmE4V9mqMGGbnZG70
	bhHIbEgOz9vxDtdBMsjFm9qH4Rn68uzppL6tMfvv2IVVu8jcqMQ4uLIPRpT87Nwi
	iGYa3ub3QNtCh2Pz5MNCjcXbVyHXN7tqWs8cKxSUJCdvXU6xM66NZ5iJDRlU+f/3
	oCHk6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsatrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60bb65626so42015055ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969255; x=1792574055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wz51rnkSreoedDhc9aniU3gEDQ8VbiNX+1DNCRbuyAE=;
        b=AxCHDc7u0B8+0zfzCHnnOmS2RUvO35JyD2+OZOlmArhDo4gX4OhdfV4/YWlWSeX+1N
         hsqMYgYHeZ3qJwu8wPNHTliDACLKvpcLlU2mNm7nqppQCrrUyrunbWvLSpby/W5ztupX
         h2ieiVYHsOTPGaYVLy0MKU6wHYiMTNXJZ1FHgVGBifL7HitKBRuGuxhQGFZwFk4gkTWr
         pl6HJWQHFDn6j7G7RsZScwo4TOfBGV1jrWPAVO9XolhDLKz7qAhh3XVaAJvyfb5lqo26
         JVWVQtgBpCbnf6bf0QOFNiAwve1/xE4V1Nt77PbBWyuQ5Ffr4rpKakYkPzP1bI2a4jKC
         fTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969255; x=1792574055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wz51rnkSreoedDhc9aniU3gEDQ8VbiNX+1DNCRbuyAE=;
        b=VAAQJYI1AX2EflRRoLmTCnJ2FK0oij18olNuu1VftDKJaM4xMm+F8LsZo/9n6ng+1N
         1131xlSh3xp/pLcQsYHoZlOshL/Q0zH4otOibz3ngciu9aUO927eDx/gb1KxNHZc7PbI
         j/RGU5WoIIs+JJ0WBl3CXIsRQ4tUbmkoDU7FobssDvMZvupuO5IyuWrNdenTvVmnyiET
         zwWzzAI5//jM7pJ5owGjuhw9wOsrUfNLZaY3Vx0ogFEdWV14CP7W6KJGLHcYAMNeFGya
         j1d0qgSKqPndrwaoe5vxFosiOcqTiVOK9Upq2EtBS0Wyl2oAdNZyXgGp7DP4ubLN9vQV
         LioA==
X-Forwarded-Encrypted: i=1; AKwUvBwSsBD2hoG2q4ayCpS4JE8IODVG2jfi+/4/TLN7EEzwv5zdL18MKoz1ZLUe+ngkFSIqd9eNIodu10BuELE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoq60ZlPMM3zi3myWd8dqCdq4P4BTMQRRdA7qkh+ATcKY6SZ6A
	YwI3Nv9G+6U7XTDfxcwcQPxNYoT38kJoWOgtcRWX5lRNhCALPDHwk2T7ANv6McI4LKi4HAKHB+U
	t5IbWQONlsd60vkBQRWU41zVCpj6S1eiO1sG0jUnaV78mf0K4UPD7YtOE6Y24e0V9OfMPIqyX6/
	I=
X-Gm-Gg: AYBFou3LQL3pTD5B45PlQ2hi89xa6t/xECqFEXwbl5EOLuf4Vb+F9rlOkKBHowJDeGJ
	fOhFgLQ77Bcjhb+7jJbM8ezXwZxCP2P23PSsFTfHLlnVaCOXzsF7KdN8+iBjrMpJcrM1xKqD5Dk
	1cxHhTHSKeSVWouSMK53Q/fbl4O6MoYTFTN/MdkHXI0a/NCxg/fceOwkL2DH5muK8lSah7iHrn1
	/Fn0u2PVQC0sK+2hysucG+3QRmO3F9hDTMS4DVLxojYcehkkXM+KSRN5f1ykSUfrNxo8Pe8RG/M
	64fAlSHFGvuc8rY8qcBjTfbBW2iNTjXRQ++eDHkVHip5XnufMK3cSD1LFCjxcg4omcfbMKAu4KU
	lO3GfmJ2lt7WTlbokLyl2TU11AHvoaeHuRZI=
X-Received: by 2002:a17:903:3d0f:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2e8428359bfmr98912125ad.3.1791969254550;
        Wed, 14 Oct 2026 02:14:14 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2e8428359bfmr98911855ad.3.1791969253921;
        Wed, 14 Oct 2026 02:14:13 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:51 +0530
Subject: [PATCH v5 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-5-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=10685;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=VB3Cu6NV9yujt5yjM3EqmLXQajeEsqJPBxY0+qYYScU=;
 b=iUeT0B4WuelkDjjvJ9sX5k6KN+kH9VpAV5tC4hZwEma7MweaVyYARZpQyKYj84LivM8x9mR8W
 Abxx8l5Z5nOCGlMIO5Ld8PPDBWQ1GfgYCYboOlP7UHRu+SpKzMyksQj
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0fEofdxH4lAs
 bNySPMmKhCWmYSpRI8jET6xdE7JkjiGHqKgczCx4brTAGObLQW0reeZxiEwqxgL5NhuTuNuL/om
 WZ4xvyqCJ69Hn/3b9fw9NK8ozRD9X0NojXZniQ/e/1/cB1wDDXnZiQy2FA3m57xZdxGhpE2TH1k
 8YdolnHnkN/w/rq7aQy8syIn51cDm4t1dzKFBhJCVhnsx8rWNOXHsk+yeTyCpioJnPns3vyySlV
 UfJWlfgGa8apVjsglEt7EQDeZgYR9rxGYSKuGhky5Ft/WqKt65o5B1HT9l2+OTM6PO5FPQILC3W
 kSF9w+cWEoFGSeB0yXZ9U/Hj+o4PXuLHgAFaLIrC0YH7rTdVEPdrgTy/+wpC9yHf7u4OvJIlhUn
 GuHMEBNh3vrwRPswZdwaGJo1S+Qg5oAnEt2HoNUNfO4/seCZNafk7yQ/HwJuEvMtoFfpS9m5Gut
 fe2XqpvbL3lIEpYFgtQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf47e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sTQlpVHRSz6GYiE9LrEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX6d2O/VegR48C
 5sRsdbZUTWm7OvPFrluzvdbX6J7Md78qIwmisTP+FyYIEp5ZlEf9atfRTkLWbcjJ4ZBOy/QKXy+
 CdSsJGAhirmRfOLNDh45i1EnINXLOcE=
X-Proofpoint-ORIG-GUID: xbXOdColpykHLlPgmvfwGOyjpDIGVO_q
X-Proofpoint-GUID: xbXOdColpykHLlPgmvfwGOyjpDIGVO_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

The VA decimators can currently capture audio only from DMIC inputs.
Add support for routing audio from SoundWire microphone (SMIC) inputs
as well.

Update the decimator source selection logic to switch between DMIC and
SMIC sources based on the active input path.

The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
the SoundWire mic mux, so a mixer write to the mux that is not part of the
active path can leave it stale. Program it from the resolved mux state
when the decimator is enabled, so capture does not depend on the order in
which userspace restores the two controls.

Add a helper to detect whether a decimator is using a SoundWire microphone
input. Use this information to skip DMIC-specific HPF programming sequences
when the decimator is configured for an SMIC source.

This enables VA decimators to capture audio from either DMIC or SoundWire
microphone inputs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 154 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 53828dd80..cdef2b187 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -762,6 +762,16 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
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
 static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -771,20 +781,26 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val;
 	u16 mic_sel_reg;
+	int decimator;
+	bool smic_mux;
 
 	val = ucontrol->value.enumerated.item[0];
 
 	switch (e->reg) {
 	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
+		decimator = 0;
 		mic_sel_reg = CDC_VA_TX0_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
+		decimator = 1;
 		mic_sel_reg = CDC_VA_TX1_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
+		decimator = 2;
 		mic_sel_reg = CDC_VA_TX2_TX_PATH_CFG0;
 		break;
 	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
+		decimator = 3;
 		mic_sel_reg = CDC_VA_TX3_TX_PATH_CFG0;
 		break;
 	default:
@@ -793,10 +809,24 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (val != 0)
+	/*
+	 * SMIC enums use shift 0 (lower nibble of CFG0), DMIC enums use
+	 * shift 4 (upper nibble of CFG0). Use e->shift_l to distinguish them
+	 * without relying on widget name comparisons.
+	 */
+	smic_mux = (e->shift_l == 0);
+
+	/*
+	 * Both muxes feed the same decimator and share ADC_DMIC_SEL, so only
+	 * the one the decimator is routed through may program it. A write to
+	 * the mux that is not part of the active path would otherwise switch
+	 * the input domain of a running capture.
+	 */
+	if (val != 0 && smic_mux == is_amic_enabled(component, decimator))
 		snd_soc_component_update_bits(component, mic_sel_reg,
 					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
-					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+					      smic_mux ? CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
+							 CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
@@ -986,7 +1016,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -1003,6 +1032,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
+		 * mux, so its value depends on the order in which userspace
+		 * restores the two controls. Program it from the resolved
+		 * mux state of this decimator, which is what selects the
+		 * input domain.
+		 */
+		snd_soc_component_update_bits(comp, dec_cfg_reg,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+					      is_amic_enabled(comp, decimator) ?
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
 		snd_soc_component_update_bits(comp,
 			dec_cfg_reg, CDC_VA_ADC_MODE_MASK,
 			va->dec_mode[decimator] << CDC_VA_ADC_MODE_SHIFT);
@@ -1017,9 +1058,15 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
 					      CDC_VA_TX_PATH_CLK_EN);
-		snd_soc_component_update_bits(comp, hpf_gate_reg,
-					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
-					      CDC_VA_TX_HPF_ZERO_GATE);
+		/*
+		 * Only the HPF zero gate assertion is specific to the DMIC
+		 * path; the cutoff programming and the gate release below
+		 * apply to both input domains.
+		 */
+		if (!is_amic_enabled(comp, decimator))
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+						      CDC_VA_TX_HPF_ZERO_GATE);
 
 		usleep_range(1000, 1010);
 		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
@@ -1045,7 +1092,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1245,6 +1291,39 @@ static const char * const adc_mux_text[] = {
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
@@ -1380,6 +1459,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
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
@@ -1524,6 +1608,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
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

