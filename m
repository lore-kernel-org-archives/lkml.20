Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661331;
	b=DbuudFXS1WEOpSO6AmyKF55bq4VKMkMCwydnMN0kHzTkfEQaNDmtgZ8Dd7IYcrAMx9mp
	 pjPLROd7xSRGqHjG08X+xAmxF/ZXwCV1XmusE9T2rNO7kqeEMUVD83Zj1kRuda82N7cP+
	 X36P93vdmZFNn7/4Z3u8cw5MiWo1N5krySClyRLsuNNtAWuVzdRO6oavXMx7SxPe3iy9Q
	 WN8Ad97Y56lpRc+TqsvG3w54e63rXVnXF13JkYC9vGWrfQ4UnNpH/0yKSFJz2Y8IjLrNS
	 xDcm5jOtvAwG6jleRcs1xmD8zSUR5PLrwyA3DFpFd94Zd9fAD56GI4vsIvPCMXemI8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SkZddS+miUPG28nvMCm9Vl6i3WtxcHtjfJbOTS7q09g=;
	b=RKJ92nYGqCgEHLuRrQ2qNZ1XHTXyHQj7FCEn4AKafuuKU/Td1z4mrO7/9MGVIxjI2kfb
	 WSDVOto+0+4AJ3XpTlY25oW48Gi2hq38qoXBWhhUWSm9f5yNxuk77LoGflgmsKcoFDPJQ
	 SG0fIS2tDpntFgI41THswp9QTo5bNGBBoAxd8HMK2ae9exms2hXrjcr8xHC5Ll1X2ahLE
	 DPkHoiWRxXRvlvMWotAHvZGL5MNKqjUkswLXRxet2yV70yeTIAVy6Pdh9U5XF1EdM/b1/
	 InbNLUltQgD/+qNAzs/b8raowNI4cQVK8i1ec2mdQ2QZXroSJosNbb6QGOOAsK1OqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UmFHeFxH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A99606A319;
	Thu, 22 Oct 2026 09:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A99606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UmFHeFxH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LoM93194761;
	Thu, 22 Oct 2026 09:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SkZddS+miUPG28nvMCm9Vl6i3WtxcHtjfJb
	OTS7q09g=; b=UmFHeFxH+2bQEKWMDaTCw9LxvUNVU0rWwTZks3X1i1TyL4YA2QH
	JNqxvdwk5lQ1tHSwv5MIn/MWTpL2KV5zMz5WDSa4vJgVcgyrxf77LYVBIHNiif4k
	NXNjvIQ2GCvh1WsMqUSgLQE6go4X6H3IIhFQSxI6QSNrVIgr7r4UzrCqh1ZaKD41
	KZPvRIFrWOnv9tcxbAbsJPZ1LRNO+a1iXO13XpdLVk85AlmWj908rB0LaI5ITLIr
	NxuWpzebSfn4OjlTQ8kuNDHlHRMdMaz8bdZ25FJIS3e3K3JxBcQLcJZQo89P0pPI
	vavFxBafGJ6x48k2P4yTwR/DrQGV/Kd4PeQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0a50-43
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:28:42 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9CU032022520;
	Thu, 22 Oct 2026 09:17:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9GxDb2029758
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:16:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id DAF1A655; Thu, 22 Oct 2026 14:46:58 +0530 (+0530)
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
Date: Thu, 22 Oct 2026 14:46:56 +0530
Message-Id: <20261022091656.1063385-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: x8ibBFG0jwFYHjtlLwGvXS7w2OCN91JJ
X-Proofpoint-ORIG-GUID: x8ibBFG0jwFYHjtlLwGvXS7w2OCN91JJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX7e8ysxi4+UCm
 j1Kl81cdOZSts1yUVhNrFUVEDC80ebqidPziEE+bHrY0SDUB4kN/67iOjPk8PjdZcCfzxhjgW1/
 fC/JGJM5Zsi6aBP7ghfPPkx/6jKqnlk=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d74a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=J8V9vG3e9rXIWQFow8gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX8QEfuSsQG16l
 T9I/zjEXxJeWEbW5c6TMGOfSDezsv6GnCNop/N2ALpaL2vQaByR6ErTtdse47r//GpjjA6jTdRa
 UdFHEvlTW8S24SLejqPEljGd6EWIi8KWsJmoHYZJ2nivpDd/YpyUJAmonLhmiOSnbDI7NzdqQXj
 TzhL/5c/qosDSa5Xs8XMYfHvFyMxY5UaoAu5a3HrR0XKGN6dVhqvHVbBiaLZfSjgKmX07aLr/HE
 wzYP8aNV2UrNKqprqogRoCI+0GUOsal+JiwIzYcTQAPei3IFgQnRrPsMW3wBn/HwvRGFsghZBBj
 0EzzWFTt5m5l1eYl62Qv2/+E97OXmncfXdM+btTUZNxSNtQrdI13Nk0dLUe3BeVwMJn6onuA+Qm
 wOXwJ9YJfWZw50MADq06+eoaMT0eQGsGZKz29i1AAMTKPxoMpIXLJKRfgLZaGiJ6kR5XdfaR3Aa
 BXEdUU6ohMUc8xJq+4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

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

