Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968430;
	b=Us3ouj2PGmBBF4SCDcJPGm0/4JeSrnxWZdDJgD8MJUd5r28lYEtKl67JCnrQ5PnlqX35
	 muWt7eYUuPC1QPLVVB19B35cLsediYRWxfLidtV+toStxzOwIPJWmxaybywx6lUjNKpl2
	 8gO8h7Ygj3HVB48djbu/PJl6NW5KJkM1Atm5Imx7bR2AafO9765nQD9y9JG9lLbajtSot
	 XamXr/1s1/cvJvNwTodSW3SJjP9xhgXzwe0DSzW6PxiSWUqMthGEW8oowsVIeHFIb7y/v
	 IthBFiTStTZFgATDiaZIP1RALuCrB4C576Q0o3hVUw8SAfZGMHUa+nVVQ8NP0ozfYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pFV/bvOnbfN2FqPviygRne/+m/sUwzIStnJ91co3yH4=;
	b=n/cgjnisO4+vungMnlSW+m9rdnEMXN4zg08x0/QVb5TD8AfS3f5LurCyZNmoZ/aL4SZ0
	 I1I5eUusbi4u3OuvwwVedUA4sb7wLiUhK5uXPp/SodtyO8XG/9wLJQ+wuIQia2X5mDI4w
	 v49XrRU60tp7jujlRbr4xAlztcjE6BsrR1E51HrWRdtJWB0gSJxfWs+rvxlVsAqpKI7II
	 bB1t/FzU4R+WoCB+ZNmg0eRvmmc70hGam2IViTSNi2HrKdFJBN0v8YfVEcwTqgzToskd3
	 x7xy0gvlSIqdQggSTcYgicEOLnUMRuIxJczpBaE7qeAwcB+7p8ApSwFbaYZlVl1Ntnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y3Q4GZ/E";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gPn1eYPF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6A606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA6A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3Q4GZ/E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gPn1eYPF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBFi3645837
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFV/bvOnbfN2FqPviygRne/+m/sUwzIStnJ91co3yH4=; b=Y3Q4GZ/EKLZwV8vh
	THI4VjwfWXCUwUjxiAFVQf8GxTmfu80yU6SfpAUvqo2g8W2O2hgHdPmBPlXKDUUq
	WVRKTPKkOHFZjrwlWVi/5e7GlUyFk4jnQb/0z3UKrQtwJcuJAOByKzfYvYvzWImO
	FuoCNj9HHL8ooAQX0fc2mdCKVGWqBGwWbLX58ensnpLD9azVCms2nM5O1LsKsb1W
	LGHJTvn2VSDrBNn+L49rqk4bgDO/fv7gq/EFifk7QTIsaGaJj4RWocDeCoXwUVBO
	J+lSjgFJ/SnNXNonfcmObaPow1THafDAwsvn6RlMVqRjnHggqM/FnXY5ZQC0Hayd
	mj0l/Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:33:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3700be873ebso406169eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968428; x=1794573228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFV/bvOnbfN2FqPviygRne/+m/sUwzIStnJ91co3yH4=;
        b=gPn1eYPFQnI0KpPOkm7vfLatYLuoS8WzT+mwJ/VBsMq6b1iHThMbuudjBWPF9KuySA
         QoY4LnqWU7xQUtumDcNABRVNica/5kFoI+AcyqNF6pv3FOE+vmyXO1QFAQmm56rTOxI0
         NoqVIcH8AwB0jjC0r4j+xUzmLDO1LU68AH/a7T3s4Z7z21nPwToGTNRsy4DD5Xjfv4vX
         hegCxWxFKuZ2bebIIE9oqfQ0bUp5BXmvum3X0bz422ssALYgalZM0dliMGXCD/JpEo0T
         DE+Facus68kP3X6tSCqHRO3X9VDFGc3+k0RYsz8yiviA6/i85mH8W4TPBxPINt88rNvf
         deZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968428; x=1794573228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFV/bvOnbfN2FqPviygRne/+m/sUwzIStnJ91co3yH4=;
        b=NJ86kui7Va6CU2rOsbzrUFKZ/W+MdrBWnNf4T3vvc0u4hBmETRQkjmwem5f3qC6g7w
         SlgFaqRkEujnpaBEV1361BmnR7ozuBqwjPZ74Yl1Y6tkRVkeIOKy++tVDYkPodfatxLG
         5w4EE6NqxvaK86hLRHsx15fHXHIvIqVFWhB4d6L1jIWESzACfdrtESGkvZgdrEQhtJGp
         O374UwWMqgfKPVAxccRDJ2IawtRO4TVatm1oTbvupo0sn71jFMzj9M2PZ8VLgPe3P4GQ
         xUwuO0acaUSAHq2b2TfuaXE4SRGLMpYtuFAQaW6Vhv0kzA5l168ZKPFWsGwAYQYfaB4a
         Rzkw==
X-Forwarded-Encrypted: i=1; AL+hErECt+5InhbEQmcW4Gle/E0N6mZBjVyv4ItrAQNUzPzIlmzj8k9lDjkRED9yxD73LpImEHHSLtjcOFBrXJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9kGlSei63mWvQee+2KkFv/n3lgjgqd8ItuR2AiKZZBWdb+HCO
	Zok+Z2PcXrknrWRK3wOonK36PRcOyoBqGPVXelRgnaPei0V34L0BLRmdGtLNABdcSi/k9Mqq+5u
	jlsHHp7kKGO5wwa0z/FJCVCnOe33FU8AIBxCOWmzkY1Q+b+Mk8xjBZCzjNvfyI3dwmrk=
X-Gm-Gg: AYBFou3M3gpjPqCLL5c/2sghfMr7drloEGX5hBismebWPHor8iVqgWt0Ej5o+zU3IlR
	pq6mz9MjaFbspH5TLMI7r1yu7GKJY6FY6m30x/oyFTQwJEExG7vn5rBE5CxjWfZ8gx1oAm2msi9
	gJ9HmH/QwOPoeoLH1MMZUJhdHIUdFopT+MzF8vez1RMJvH+EmvNtFT7b1qZ6h7UOfqrukzwyxmg
	8pQmFRSyG4CWqAW53Wz2g/epzzkOn8aqszCDjgMX6nw+9WbbiycvS6x4M/WTrjmaAuxm2mg0YNt
	O2qk9MHOyWlKQK7x3uTmro8uurnQnFQhjmnZuSnHbCnfkUAYFPS0PV1Q8zzCTIFasBguGPpq6rY
	eHIcql0zfGzdxHirxE9lEvUWFnV1t8ngZ4VG2MabRTiSVQKPBep4kh0jK6Z9EsHcgELsa2BA7KC
	J873JqhSkT
X-Received: by 2002:a05:7300:fd04:b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-36de5f6f455mr10903042eec.8.1793968428235;
        Fri, 06 Nov 2026 04:33:48 -0800 (PST)
X-Received: by 2002:a05:7300:fd04:b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-36de5f6f455mr10903000eec.8.1793968427649;
        Fri, 06 Nov 2026 04:33:47 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:46 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:04 +0530
Subject: [PATCH v6 v6 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-5-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=10690;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Jyg2LKK9pHU7xx9nloVg15FRUiLTFBaXDO8CeyoMh4Y=;
 b=yN9iitWyqcpCq1OW/GCmJBTA5lZT+OXshgfGYDa5WwNtT3hEe/Riw09GoMv9+Z9YKkr7n8SWq
 na1C4UD+s9yALDLpfODcaCmGv+OwioHNA+GeT8VwSefXbYMkoCd4ltd
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc92d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sTQlpVHRSz6GYiE9LrEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX6fWz057TgzqS
 tndQ7Vd3OeggAKYvR3hpltbaRuoElHT7FCpHuvCFZyK2POZ0+l+Nf8haSMOXYvNaTud6Zdiq2QS
 6RpthjtQhHiF8LX61yuuI9H/l/Q1t2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0mBFZiAgj7va
 dYu5bqpXbRyhOFKSf7psKyDBRTQ0+s6TSrdOWxUMRd5dS7/aqIMiOZAUH50VRDwwlepYWwHgrLm
 J7QjurfW6YYfvLwYcTSXKt3K/BYB0r+5unH600+xhZqNNLs5kZZXEvRkVPFDgeZTutVjzA9qwcD
 mBxG3op0+RfxxQJZswz0x6P1/eDJht4yBRASjvwLsQxRVb0oGPWos7qEXtYpyDG0jEd9tfw4LZg
 h84KvrdoEuil1TLIc57lm2YrJjq2H6+U8o2iPbR+dJePKjoMCOdZtAayX1/XQa4X5VO4aT8ZZiy
 6q+BENyLK/Jp/OCS6bYT6Zp6pEkXkLwpIoUFuz1N6DwhelYa7U/Ea5hSQWdTw/zZT44OPLZJLmn
 3oKiYXQPEnKr4WjehYVr7g2OCnOqubKl8k2BMytv46Dxu83iiJUuasbnSmHEV9zvdP8AKBxmRCd
 IJ8m21wIf1AjALpE6jw==
X-Proofpoint-GUID: cQcWEJUE_si0-TC23u7U14L1UX_AQ_cK
X-Proofpoint-ORIG-GUID: cQcWEJUE_si0-TC23u7U14L1UX_AQ_cK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

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
index db395674312c..a11347404058 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -754,6 +754,16 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
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
@@ -763,20 +773,26 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
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
@@ -785,10 +801,24 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
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
@@ -978,7 +1008,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	u16 tx_gain_ctl_reg;
 	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
-
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 
 	decimator = w->shift;
@@ -995,6 +1024,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
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
@@ -1009,9 +1050,15 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
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
@@ -1037,7 +1084,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				0x0);
 		}
 
-
 		usleep_range(1000, 1010);
 		snd_soc_component_update_bits(comp, hpf_gate_reg,
 					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
@@ -1237,6 +1283,39 @@ static const char * const adc_mux_text[] = {
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
@@ -1372,6 +1451,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
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
@@ -1516,6 +1600,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
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

