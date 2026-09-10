Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F974A1DE4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052602; cv=none; b=UGMWtqceXyLT1RwMPOOts0LfXdeSovZtM/b7bGqcw/ufXou97WKFGJ4IUFAJGzTvll9K5grQogkFiYASXCerotFmKeNOSz/y9sDtWF7VFO7GoiZ02LxaAA1duT7PgrgHruGnKMIv+dgq+nvPm7QM1ya8Dc9oR0ROrAw1P07/0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052602; c=relaxed/simple;
	bh=gavmw53/qKFkQUKWZaxHaEfUpbny4/RhZrJskrOqgK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLqefjb6H1/HSjcDnJBf7p84Zs9pyA1JUtp21Y0ycS23Fq2bM7/ltr5y7KtulwWgTSSdr1qjuW6Pu2U9O4XaV1QDx5Lj3CbR5qgNbyySQtmOBT4SvH63LmqIzxobD4WM6fMjGUhYMP6QEMpC+AQbKcOF5pwmx/PAON/Gp9FdvMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egHYRjQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/+c9sva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egHYRjQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/+c9sva"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AE0Hwl1334344
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=; b=egHYRjQ5c9dk857m
	1GVsrFIPz3quNeTzgIqXmil0cUdFvf7h7n9PmetE3uefTLfiZPRN3UwklzVkwzFL
	MJyVdxyR9ofchopekrSUBEqHUnwpawuVdx/t+MpdGZQGUqndTKTF5+Iw0BjW0Vj6
	gH3/fNsBmWLWdVWYDFjmSntqLFtrbrtVih45lrTNNRcKJFNFyy+kngVPRSQhWCwP
	gayKOtNztwUhJ92JinuAAqQC9cNO698N925d6z+DvgZXU8T6HIVXYrmh/1wzciZK
	Tq6ZB+WZ9ajDzN/NZzmINDsJivCFEBzn0Va1/ntIfb/xEEAkJajHdZby0XSGz9ya
	DWZA8A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9rg88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso164904a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052598; x=1789657398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=S/+c9svaWmqDuL2zsRlHmSo/lQxmcKKygEA4iqQ1VpukJdxmqoxKMtjdDGYW3gkp3v
         m+Z9vpQ9118uI2tFdWp+7xvvv9iYM5505+VZE/LgosJ9gAQWamkoNMhR3iOmEKD1p5dm
         CEwRQ5JL3ZhND2VPrNXwGNxSmWtjb4GoQvD1Altpk+90dHjl9kbJr0MpRFb2V5l8VUKF
         q0Eykh7G+1OTjBLC6TLdck6hJZrUR8jHwjZ4WBweudGY5JwV0Q0NQkhjeGPXmfzJqjG8
         877LbtnXS8M7olAq/g9e/LlVmIQEcY7bUtiXni8MnYi/FAhp1v7J1ap6OLBIcASgPf49
         PCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052598; x=1789657398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6xrNe9JgZyE26qdJmwJGG05kfeXOqfEOsguIRE0wa0=;
        b=GQP2+1tZWoN7XnQaOoCO061kla9u8sX+wkAesuxSmcRZAxAafS4tw2IjdTnJbCb5Wh
         KO17dR/OJdAsnvhj6oC1nwLoAqeNfnEavqRp03ceZ69pmDSWdzKfUiKsXfd54H9zRZIS
         ihc9IMhyktB5LvZxScQtHTJDoKsacV8B1yZZ3BvU57ZsZkF7afJRzeynN/yYeTkArXUb
         /exbbsnN8sFXunEPpVFgEuiuvfNCKc0s+zhMj3Sf/fNBLWiqDrTs/btCVBlYZKfYS9cG
         MtbPesu/LxthmLWK/3ubV7xtk+5Xf+IZ/3++1GIAlOCHPfc2a+8sZzbqH0rpcwxWNGVM
         c87w==
X-Forwarded-Encrypted: i=1; AKwUvBz6kSZ3hl4kf/YEnyJEplKgGRa+fvD06DWznJ3f/tyAYSHrmDxk5NjEzOL/d1uaDMFFX0QQgdfsd8BrCGM=@vger.kernel.org
X-Gm-Message-State: AFuF++k2JB5A1EIxZPrS/SehTRMsXAxbQltX+/wO793A1h7LPo354Zn1
	BTBgtxh39jXGv7xLr3VseRvfJnB0JiNwjgw3MMxt2VbRF9Sd5pTmbXpsPRMC+wKJ4KHabLZPZDP
	Z+6vD9QqPCJO9SKsSovw4+mj5Cgo+kn2mDpcrfrbS46Ry5HVpewKXG0VBB2CqZUpTklc=
X-Gm-Gg: AYBFou1nxGEYmJDBwtVJuI7wbGsttRgLnHtaEQqZ/HMzthIQvqhDWkaIWYMvptoc2Vs
	rU5+QDvp6/kL3lIDSYjbtAi0O/Ja1tQ9xshx1qPSx8++n2DywcxuuJfK8gcgATXXbWJDk9OhYLV
	ypHlGjo/taai3FZfLKJpKXtdTv9lWbyrMAQ4TP6YsJxUBIuIa7t2L0vur0/rxgyY4xHvlxpvF9e
	2zstM7UBVJZkZuHQjfDvc6rccU509MvC2MixIIzNNnLkjH4D8trc1pAUG+Np/rG+NRvvBkUBSMP
	tiLsyJlXGQ7Mjn7VFs4J/GgtFGe5czSyOMq45ENOpJJtuR8RbhxLWGwQWXgihkUrvb/O0UkUgeQ
	uAgGDsI87qZ/AirUE+AUzMcpPncpj
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70721095637.8.1789052597868;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr70720959637.8.1789052597255;
        Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:16 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:40 +0530
Subject: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX/x3dRvMtd3oT
 oq7PvgASTSc9tqvKy1i8CxlgHxOBGenrDzTqIsOFlv2eypBGBGWXHdhtDtomd+/aH6mXQbmAcfP
 Z4Dp7j+8PTPZnjAeFBslNQH4uo9m8Mha0zAAekZLhOjKUsQryZTveCAyo3hJW1eVvCjU69ok8/z
 G6CZvRqCQ67L0jsYUKAg2WdfMlr2AbyLbWgvuGV5hc4OSPpVUe36xPIeLqE/rntmOUhFPlZqwUy
 p6Xr59bQA4LwxMP4mbKlG0EeXLLQsUtccCGcDqFAO+S6Wl8E18lic8Dd1Gbbk3TJs6YbzAM6G5E
 IH5cI9i1CHr+1tqvOSOanW0M10Kz1vT6Pa6rOtIcPIDoUV3neh9mu6s4mqfXXpPp0XUWElQpI9h
 01Up27qZ3eZre+b5/5x6+cc9v29AYN7Gi4y9kVwc2Yxwt//QN5fxGViBlKv21Vtrqltfq1y1w+g
 HQENkREBaUPGamjFpNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX4WlvR3e8+L/s
 TUDQoI8eB3E5hhyEI1qvNd1qALS5pQtRgvaJh6bjw6j4UnkjKBeNXAHPimZF6GkUgtzI1M3j2kt
 G0XBVhwPbhg3NyMizrQF6Vwr0hczDMM=
X-Proofpoint-GUID: rmg0963BhgvTypaScYwXMpQT-xfkB9iq
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2c6b7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6P8UuP444nAwg2htitIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: rmg0963BhgvTypaScYwXMpQT-xfkB9iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra CQM EVK board.
The Shikra CQM platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components.

The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
via the cpu_dai_fmt field introduced in the preceding patch.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 452296a9e67d..f9fed5c37c7f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -58,6 +58,11 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -521,6 +526,15 @@ static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.cpu_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP,
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -587,6 +601,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

