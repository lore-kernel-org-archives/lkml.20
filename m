Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662214;
	b=fB5ZsWNwpRisdeanwjT7HeLbmm0sqiF5YuLXzO7ITR9Zix432UTrTBoWs7We4p7uZGRU
	 8NfUthagrUtIj00XKWudjKFmcd/mEEgoI9u6Vyq14vURUnIsmqELkUID/5j94i0DYeSg3
	 rlIJ/YSAdz9WOf1Xsu/aRtDcEnENZ3R5QWRCZtmnL1bOkj/k3Kuj2pJT2TUJHsFcj1Mpc
	 grtAxJ+Tne5kIthVmPO31yPC5Ef0EUf/ChBY0qH4gS9bETB/LnWSKZpqM2xEgpfLVC0cW
	 jVXH+LvDQnyxapLwfGphsnpMLVZH7Qqa0OwYZmnRN3Sk5HW0U+oVgaw2QOc8/VZEvXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SkZddS+miUPG28nvMCm9Vl6i3WtxcHtjfJbOTS7q09g=;
	b=zuovEXOqT7JEAISzL/1xBGieDFDOb4mPR8dMYC7YJD2S2/6A4d2zW5VrBGMXMxkJUV85
	 Y5/u9ysY4brjsGAxgUv9h7N5hA2j9dCoseuz3uMK/tkQzlB5BVHp4yyoC8CfTvZXQ3E0f
	 knasQoCY/tbrQ81SFO2GhxS+8Li9o5vd15NDS10dvHkSpb/6ncnDgnNJ87s/EnPchBcdI
	 4Yl4eZap0S2RNDNe9D9AgiCmIf5WROfFQSBpLAhJGhbRBjCqKclyvwHZgd8J0Jszp43E2
	 kR+vR4UyVeHgrZHLW3RmhGFNBjOKI1jc38gB9GihTWKIuVOr4uvObmmJJjXzzOMfoEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4oen91r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E47606A31B;
	Thu, 22 Oct 2026 09:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E47606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4oen91r
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnRo3194722;
	Thu, 22 Oct 2026 09:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkZddS+miUP
	G28nvMCm9Vl6i3WtxcHtjfJbOTS7q09g=; b=Z4oen91rbh7w3Ww2jRNaDLOiG6w
	JnYK2+wGk3UTeSaeVCBnB7JPrELdUnrAj1r3CHUz01vxMQZf4CutJD8ySSQ+ZqRV
	k2S0Gr56O3JkTOIAmn/EtcC+2eUyk/RYNpVLmN3a1b4CkTA0YAFOfwQiD6Tc0eb3
	7XVIIBpp36WkZIS0j88mRcbc8xMsuzxLbODQGWgZe0MIWXOAGn14eftcBv/6YAFU
	buDQGcZP6YiO2cEl1k6F/ZIN2JCnX0kqLKx9LZYmdz4dx+rv0WP1FaH8UOff0qGK
	qXzpjBPBVQHgMMhLYyGDWlbBZffuTSQfaCk3uOnSdjxkFBMIfzAS2mAZECw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0c55-27
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:21 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7gO901894729;
	Thu, 22 Oct 2026 07:42:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M7gRkM1894784
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:42:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 39CD9BD2; Thu, 22 Oct 2026 13:12:26 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk compatible support
Date: Thu, 22 Oct 2026 13:12:20 +0530
Message-Id: <20261022074220.989787-6-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
References: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: 14hTdaOd40IGJIcoPBqRYAg3LCX8AQhV
X-Proofpoint-ORIG-GUID: 14hTdaOd40IGJIcoPBqRYAg3LCX8AQhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX/ADqncoeKGIG
 LxXf0e8qkgA5VhDtinotiT2Kgyk3jgsGSd9WAzU43ClwUG3o0a0tzJt3UlYjpkeXC/cKqtm/c+S
 iX2FBkB3nJVRO4mQCGaL1H6JL4Qio6k=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dab9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=J8V9vG3e9rXIWQFow8gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX6W3TCi8UbmAp
 mkLia2+d/dfxAxoPjk5FIwnICN2OoPQGnELCn/vBCi237uJic+9JD7nRZmcblOJ3gmOSWSxYcma
 Oraencj5hMG8/7SSrN3d6IObOlOQmilpl6eRbiUC+IBM8DQ6enwWhU89Rs6dAZHI576CY7iJwMp
 2pg2vSz1mh7rvd7v3ibAYmTmTMussGzcAxS2WtXnqDQlWanSFkySkytJzgwd3F583KO9Af81PgH
 FxBu9m8PJU5OCF/qiJLD0wtlZhgnrutZoBRrz7Pi/j0SqPDp8IgPIU80BpimScdwzRX/FpzJUcL
 so3dkNEzLGJf7T95Qg//uQvVr9xCjPw1AG0MGvU9NuqAPb/RKbXRGGrPUFXPcC3la07CYOVkYMy
 36LzzfX0Pk/Jjc3nhZYj0yAagSP3O5TgIQI94dalM0TrX5dzYrB+iR7t344IFUV+iGzGGeFramA
 LHDYB6HGT1cy8dv/D6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038

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

