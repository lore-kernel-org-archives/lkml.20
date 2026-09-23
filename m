Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81F3DA5BA;
	Wed, 23 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153218; cv=none; b=DNZk/UAo7DZN0JqlMSKilm+k52XI/1+XGq5urVAuM1O3pRqJFM4NX/2i5FgmGd8HRjT46oQoCNkgRFt91SrNvlcEbCkbJxBAoJujOGBgfpSgCY7rh0ANicl6mhNHzKcQe10znhty1kkNs37SVZ730YjQZjZ2+wCYHPjQMQsKtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153218; c=relaxed/simple;
	bh=3bF8EHWG5wk/X3jO8tp/zn+tBfsW5bRrxbaaVuCUb4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8OBTMTPetxN/wAEVagNjO8iIydRwOBVEW3jCu6axiuV8FY8hmVMZt9UFiQV9zHAh1OQmS1cO4gx97z89wipzPN2fMbCRo+KmXwRvOxqqrAv734CDojCEfb5tkYmlS/vbfLGT19XmuaMtEMAHHsTfu5ji3kTeGJWJPpA6ezVXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrMp9Vxa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrMp9Vxa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JebU3178081;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ur2WFBlizYA
	82dDgzRCqOFkAABAwqWhfZp5S3voZG8g=; b=RrMp9Vxa/6kbWGlZc9DEpozL7Vc
	/STGI/AxgI8Axn2T9WcytBlB2/JaLBUHj4Ikto2SgOY3FfP3Z7eOzmAqKk+VkHdk
	fDiO+YXl6X7EVpFFuMkWVeCUM9GK9gtgKqt4L5J4wog5j7JrDA735ZQ42UtdFr3A
	yn58qk6MlGH41vq6HyDRykmNjIA+bZ6JRkRAhhus02ycdf/4BsG1MPA29Mn28W3i
	v6sxVj0tJ39uv0rdu6nIHTAWBL7aYC43VAEPeuJlAcs8MNTXVikJPVWA5rNhsPqD
	BoC/I4tfa37EbV9jkKzX2bPbq+laCzqk5yPWKA6PBmdiiTJRYr7uHZ1/7IA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863euf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8iYgj1726206;
	Wed, 23 Sep 2026 08:46:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kZNZ1728417
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 26DCF642; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 2/8] ASoC: qcom: sc8280xp: add Maili sound card configuration
Date: Wed, 23 Sep 2026 14:16:21 +0530
Message-Id: <20260923084627.748920-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: nmI1u-mIPndYbQcYfioSdpPGK9KFr_qv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXxpWMWM32DpMW
 NRrRoqltB1FgPU1JSHIxXqDbfMvN4tZJ5fadtN1RXhb5hSJ6FsYeztrzyCN7wFbR+fsJzInR+Fj
 dajgRTEYG7Ul2FRmnheLol7Pj+gkLqI=
X-Proofpoint-ORIG-GUID: nmI1u-mIPndYbQcYfioSdpPGK9KFr_qv
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=2q0SpPMmqTH-E8r16rgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX+h3I3tIMjDgQ
 iv3Lx1fUrP0vVlc1opilGnupsw/Sa6v7ioOxxdLGDZJ5p6WUyOR8zw9Mnk3oK0snXZUPhU3ajNR
 z6tRAuPx/5PbAatBezNJ7kiF3NcVW0gyWK63mHQxjtpzMytAq2XDQA5b0BMXIjU9FOQI64aOWic
 c0OTMVJidAORChNZn5OCBw+wntct6dpfe/bzpFljSdQr3BX26pRM80WilnXWvoTJkv0aOaytWbq
 isuySswOYpS6Xoy3u4gnaxFCuWSOJR2IEXmIsg/ltyfjSjxPF5wHoK6eid0tQ/xsXLbJHfAH3XB
 tgSDtl4obFpa3Wkmo/3n3l56Frzeu5yQioADKs72D01zyxhQSGZwWoULsKFX9GD0SepjWoqi5WA
 GQVTN0DOZ2vf6Z7+TBFeHGpXnIeYOumhbtvdKHMa4UUiVrB3KZlyHGaLISAlifR094VfCkbhWyt
 OY+adBGcOYHrZ42qYWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Maili ships its own firmware, so its topology file has to live in a
separate maili/ firmware directory. The topology load path is derived
from the sound card driver_name, so reusing the Hawi data would look
up the topology under hawi/ instead.

Add a dedicated maili_priv_data with driver_name "maili" for the
qcom,maili-sndcard compatible so the topology is loaded from the maili/
directory. It keeps the same DAPM widgets and enables codec sysclk,
MI2S BCLK and WCD jack detection for the Maili audio pipeline.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 0876b9be136d..fed4d36e5437 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -463,6 +463,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common maili_priv_data = {
+	.driver_name = "maili",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+	.wcd_jack = true,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -565,7 +574,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
-	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,maili-sndcard", .data = &maili_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
-- 
2.34.1

