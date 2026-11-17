Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913747;
	b=G4Le2JHmEDGPzNIDJqSzpSqraXGHjSlMS4lL3weFmpBMc0vBAHMRVnJAD6PTTL2o+UEU
	 5J3KYd+DDT56Cm8bFmaunDNdmGwGphwLmy80uypQhtFp8PonTYlUEyMerhGsJSYquqPBD
	 5C9yEBpzH4v44mBIRXX+HL9os5Pj3LSOitCJWNcAwji3YD0higETU5Ed3p8d8w07E3gli
	 5Rb8QRzxHxyheQ4DED3HMeJGAEumQOqYXN7nHAtKsuXpH0Lc62tkMKS1dTaG5HV+wOIhW
	 mb1UK1L+oK/dpxQLUgZkjc2SIzu2at1BMSON9p9Bn0Ia4h35rrV7Sa6tGcSi9NRaH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mp7QfcDF4eYK2qgorUpWu9tmVBH1gAJUqwT9MG/SYsc=;
	b=qT/MvozQCDMOoSUPWJ8kdzHvSIzv2zShX7ddKEQ90PUg2KqNttLmTqrglmTcf6NwQUrY
	 XPVKlnThFeQw59gGdHNgua3UzFURexuQMr9D+vKMpcyONEnQju6jZQhP3Q6fuZ1pBqerW
	 u05rvGkK13lnLnc0+xVvmPKA8PGnJnW2B33VekAFL1Fwx9fg3H/OnTX93gmxfnKzVuY61
	 e0uUSGjKHZB9wd8c5C6GfT/ONiBs8Qc/+4ivhdYIUT1Pgt/fIt2lOJkfj++kreIfON9GZ
	 IfMOioRHdUtiEC03OTYb1yY/qfm/2NkdZ/I/K901i5SXnxIdkRZ99lTNC8kv9fYwNmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etyFSegG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8D606A323;
	Tue, 17 Nov 2026 11:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etyFSegG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8Wtbh3624157;
	Tue, 17 Nov 2026 11:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mp7QfcDF4eY
	K2qgorUpWu9tmVBH1gAJUqwT9MG/SYsc=; b=etyFSegGtu0QIVggSj1EHWN2PJJ
	vDGSrgnOfgA7T3X1VvuqtGS0vQNBtYLx7mihQLU4uQGUM8N7lzJv3BPAPtXpFxS9
	tt6PAm6QAzleTI/+fvMifmnnhHUDw6Ux10xSAiZlaHYWvQXcNl6nds07QygbX63/
	QOo0dQO5rW3UL8BYpn0AbOCsXpx9hAXRu/49Mgm6BgPHcpKucJ4IwAFFqSovZsQG
	zRGUtdTc9ZYEvShtk2ZlscAqsAPpeUfuJcKvRmGtDMcXUBCCWOd1MOAULIDpD2ux
	/ygqDz6tbZd28tAyunqu1JKno4u4YlUPTltzbuFRR6Kio9qLMbm/qnO4yOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek93d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:56 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHB8rbg2620872;
	Tue, 17 Nov 2026 11:08:53 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHB8qKf2620860
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:53 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 18FC667A; Tue, 17 Nov 2026 16:38:52 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/3] ASoC: qcom: sc8280xp: enable support for talos-lyra
Date: Tue, 17 Nov 2026 16:38:47 +0530
Message-Id: <20261117110848.465407-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
References: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfXy+gJmvc9ztpB
 aoqfq1GBu5otnNUDyz6rBX2/C+SSExng1R0Ep/KWKzslZoLdgwZVVWbNaw7MAkOUZEjFxPcTFpw
 q7n9Rt5okszSkTOCc9xh3iM/P+8OoHs=
X-Proofpoint-ORIG-GUID: WPen3OcejZ2ZU5GBJPw8KuwF2Kkf3JGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX6foummd0XJ28
 o7yyhsPinSqMNUwFyH/Ho3VBicKmK1RPYZYtMwL6uvb6d0NO2X+HSRsOeSa5ys7ZSuDAMcimhbX
 CY8NKgxVaTMt60pUEDn5oHLPvj7UAV5544Gy+px9az2i7atxuk/a/krt+BcA+ZOtguasbbkER90
 kESa7Kl3XZPiy9Mkmh9oc+Za0v4xL4U4QERtcJnw+r4rrxI7z9LsT/rimijtwGv8JK7v3923Ym1
 jvEESLJnr5uNQyXIV1OHNDp0XGZ5aMSH78kp4t6rtcAPxNbd2SxcQ4S1g8/R3LPNQhwlXOm/9Ig
 KfmX6pqdP+PhHCU5apoE6Hrqd84cwhKqnu6Jop/4pGe0Jy/mxLFt2yGf7qJO8SKmDvsZtcGJ5i5
 nNYpPVsrnzG8roMwgkb0MDW01q/qerB7gJCGncwrKVKLObIzHQFFZTLgjuZ4wR4MVUfiC0zW2vc
 68ffRjakihKdYURSDwA==
X-Proofpoint-GUID: WPen3OcejZ2ZU5GBJPw8KuwF2Kkf3JGp
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc35c8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=5wlQ8WN9U6JOc18lOXEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170044

Add the necessary board widgets, kcontrols and DAPM routes
for max98091 codec support. Enable required DAI format, sysclk
and other required configs.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e136407c56bf..dd503dddc230 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -44,8 +44,9 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
-	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
@@ -56,12 +57,28 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_soc_dapm_route talos_lyra_dapm_routes[] = {
+	{"IN12", NULL, "Headset Mic12"},
+	{"Headset Mic12", NULL, "MICBIAS"},
+	{"IN34", NULL, "Headset Mic34"},
+	{"Headset Mic34", NULL, "MICBIAS"},
+	{"IN56", NULL, "Headset Mic56"},
+	{"Headset Mic56", NULL, "MICBIAS"},
+	{"Headphone", NULL, "HPL"},
+	{"Headphone", NULL, "HPR"},
+	{"Receiver", NULL, "RCVL"},
+	{"Receiver", NULL, "RCVR"},
+	{"Speaker", NULL, "SPKL"},
+	{"Speaker", NULL, "SPKR"},
+};
+
 enum sc8280xp_jack_setup {
 	SC8280XP_JACK_SETUP_NONE,
 	SC8280XP_JACK_SETUP_CODEC,
@@ -624,6 +641,18 @@ static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common talos_lyra_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.dapm_routes = talos_lyra_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(talos_lyra_dapm_routes),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common qcm6490_priv_data = {
 	.driver_name = "qcm6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -750,6 +779,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
 	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
 	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
+	{ .compatible = "qcom,talos-lyra-sndcard", .data = &talos_lyra_priv_data },
 	{}
 };
 
-- 
2.34.1

