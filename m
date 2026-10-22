Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663103;
	b=Ks5Y6rAgk57wGMe26xyrtAIwCPHmrcPnp0sgBRg0LMLuLAJ5AUcmE+ES+LmY34ngk/Sr
	 5nRzwiiU9EJ3thJxLplaynKQNnASEBADi8VSFJWNemkk11gEVALVR0vJcMwC6LQgA5rTq
	 hy3vxCOBWxQjtGQi5lYudRmJAZr+BJ+80TmMxSShLoGvDFmvCmRjilJR8CgCBesANi5Y6
	 KCC33lWn/ge1AW9yVwzbJ7Mbn8Z0JLjMG3rt2WevO/WMnqy0J4DepE52n4mj2IotnM2Ci
	 176j4N1pfU37H+m386CNiuyPa3+QNO5MhC3+bgBUVid0t+Z5evmuPMVVUdJXyKcyi8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SkZddS+miUPG28nvMCm9Vl6i3WtxcHtjfJbOTS7q09g=;
	b=KX8FMJZry6FSF2tVnwbZOzJGU+qIEkntr9j0ljqjhOpeayA42oDKJcySDiGU9hGGa9MI
	 kf7JAloGE/mF07W/ldI1JDShr0hR/8p6UAtQjQqTvG88FTP9UUpG+3o46OuTn5hOAEJRf
	 t1+AEyY6E5Ixb/IZxtSL09qZzMjIKoVymkcXpiKg2HbH9y7CQ/OOPTjw7jQTUKF5BASiJ
	 T2o/NfxTZ2DVrWnOg47ouKkuUMIXgFmHmse9N34wmunnK1m9bCjaicPrhH33E1oEbE0GE
	 I74TnbVnpMiHbG/3xZwlKNuhKNc/Vy/w50UnCilDxhQi4HE6fb7ZDfPOEv9EsTKfj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqVlzXEO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37990606A337;
	Thu, 22 Oct 2026 09:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37990606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqVlzXEO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LntB3194741;
	Thu, 22 Oct 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkZddS+miUP
	G28nvMCm9Vl6i3WtxcHtjfJbOTS7q09g=; b=ZqVlzXEOCHBOGo+vfU7JJGmJWTP
	pJ1lqNSdKyjicx5XpzLN01+Cn7UYvC9wrOihu7MLiuYsKRdsbtCc07VIcJ+H1MCn
	H7525dTwZTffS5ZY1Bk7cDkM+JiLIEz2AhY/+Wu2hbOfGbihCr+HCTAy8LbSditb
	YNVrfpBi02RRRCh5MGyC+Z1jW3KF0y2475XnU6XKkFqmiaLdpgj32ulcx6rMvLPo
	y5vjYaY16IGL10qS62lkL9EdME7HMIEub1bx6I0DByiIr4n2gA/kUEqQ0Ew0nLOF
	uzEmbwnnGr6zXjIpkNEkcRdq8ar1kLh9jsPM6sGGkqxh7RnV9CmGKZyK64A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0edk-23
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:58:13 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hnlv2064408;
	Thu, 22 Oct 2026 09:43:49 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hmNu2064400
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:49 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id E65F2655; Thu, 22 Oct 2026 15:13:47 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk compatible support
Date: Thu, 22 Oct 2026 15:13:13 +0530
Message-Id: <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: L60Yji6sNZ8ODfi8ZMv0FRiKDOx5n9_z
X-Proofpoint-ORIG-GUID: L60Yji6sNZ8ODfi8ZMv0FRiKDOx5n9_z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX1CLXZhiVKI7N
 7JP/G/Aluon3Spl5AmQLbtXzIhjM73Qtufdt7PceilgyBiYojNTyC+jXuTePpAwLY9BCTUrWRL2
 SvZpXL7WdhtpoOq6G04PNYYcS0gF7AI=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9de35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=J8V9vG3e9rXIWQFow8gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX7EIho9izNVnt
 lbPL6WyBuo1d3QOW9Ye+aRHKOeS9uaUUOJV4UzimIahrlJOqxWBA+8ZzKQdDt2jH5AQevAcBd/i
 Z8JmAZmSD6afwLaX4zcHCsrjxYDDrWIkYDNqEt7qxu3II0K0f/NbrD8wD3A76Lt0vWsUiuW+fUT
 kxSZ6kTSDL+HUHHmWuFO5exCf5vJ+YVDWL1iMGPC7G40dRLw+KkAVg64vSSZwjs1Qz10bXRv0M6
 xFlXbGWkaUJytSy5lxsj0UUGvdsaLjkBjstovYowKdXHoNe0FigJpzkk4YNInTehHyx4vnb/ASR
 yPBdsoJBvuRWzj+9AHsIbMXVrUaRf8syGFrZXTtw192rIb3xIcBHFnMrwcolslBDNHBPstSxY2z
 6bxJfldHmVoGBu0osgQrKFF3fOQt6lkl8LoSxJvq5p7ofIL1RXSpbJS10cMT70nEebRSeXToig7
 tpFXuWk3tNR8Z1Z2TqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Add machine driver support for the Shikra IQS EVK variant that uses the
LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
The new compatible reuses the generic sc8280xp DAPM widgets and configures
the codec DAI format for I2S with bit/frame clock driven by the codec.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9860a68e2add..66064c31136b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -541,6 +541,15 @@ static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
 	.mi2s_bclk_enable = true,
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_lt9611uxd_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -608,6 +617,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
+	  .data = &shikra_iqs_lt9611uxd_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
-- 
2.34.1

