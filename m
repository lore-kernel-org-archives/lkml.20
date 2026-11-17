Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912198;
	b=mC3xaHzbtURwIfgEsa2heD8ITdWpCOsiJNqykvbFkiI2D7s5+La9oZ77Sxp4BGche0Fd
	 lxa7vDUf+tnU+ORjEdDKi/I40Luujlk59Kpt+CCoplNndl5VMjNu0BcWtOgAr+SPlOqn1
	 77aWulrhAlhj5DR/nBUwOtJpKNM9YrCSxYJZcptRwJ/xoOeq4T5VB6lo0UKa+5W5XYVLh
	 0s7pHxgPyykYDNVlDTfKab17tVX4VODkoqjTF0I6KRGO9sb6hM+sNkX9yb2rcAZEPDRHT
	 S8RH8sEiwwD5YFDSgZW+6UKnjqrgeSFqZ9+7NAkrItJWmft4fxcGfTb9lryLnw+uNCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mp7QfcDF4eYK2qgorUpWu9tmVBH1gAJUqwT9MG/SYsc=;
	b=DQ3dqlJcGk7DhhKPtmmhZ9X9FdiwlJou4Ioh7Cly62wUa1sHfR1jOJx5WRb4jpTzDHPz
	 hHRrmaVh5IU5Ds4xuxJMVL9qxsHbGQE6T6wlOEPasNWlsYKu8RYj6Kg+upzBrIN2XyviJ
	 GZD6tZCDgD7mRDr5amqv+cuEB/8sTY1dhpZIdZE+z6OWSPopkSQ8AIpc649+GI3yKxBNh
	 DSG9zaxrPo4ep7SkvJztA1p2izJtXFq5qzTL0wQRJSZmLq4jXdRZ5KKlNa0WZTzqhnIJK
	 BnAIP6im34qrZN4yOyZe/llCBcG+MRK7E/rnJNGm7WFTkY2diq6RyksziLfmzc8juIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="F/p9tmFA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD89606A332;
	Tue, 17 Nov 2026 10:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD89606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/p9tmFA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAeiSC3458123;
	Tue, 17 Nov 2026 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mp7QfcDF4eY
	K2qgorUpWu9tmVBH1gAJUqwT9MG/SYsc=; b=F/p9tmFABOJJUURWP6otZhPxLVz
	1fSdkxuZf9WjTdyUjIasnRJDt718JYkEqXIGXKMUlnPMJypJ8wXiM9O/BHZHCDrK
	0ZjYdS4BuHu9zOaadKFzwwZp3un6ffDVGXSA3qVhXYUTIzKxRP1aeLcj5BusoZZf
	A4orY0b86DbHGPJTJ9ddOqlhPZYjFsAfHUHTkjSGwSZ1GA3zN9Dr5VMowLyaVB7P
	h62azjTrN5nKmcmnynUIcZjQFZQN96CDGNUO1TutK3Q7CTn2C5JKQK5E77rpxtOJ
	zCpm0jO/StAFEbdiUtbK1+K/eLfmqtvARMrANVAaoD+sZnLOqXLcLdL73vQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh99us-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:09 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAh7Df384790;
	Tue, 17 Nov 2026 10:43:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AHAh6pv384780
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 09480686; Tue, 17 Nov 2026 16:13:06 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/3] ASoC: qcom: sc8280xp: enable support for talos-lyra
Date: Tue, 17 Nov 2026 16:13:02 +0530
Message-Id: <20261117104303.435294-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sSriFk-WHqgPwVGg5frL7a7Dp7xzTv04
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc2fbd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=5wlQ8WN9U6JOc18lOXEA:9
X-Proofpoint-GUID: sSriFk-WHqgPwVGg5frL7a7Dp7xzTv04
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX6ls47I7p22w5
 q4VPpmloUEKwd2I7l7YW+1Ou9nTn+nvM3XR9k2cX+CsMOp55TkFazW1PvoB9dTDVBPdFEiU1N0c
 fYDXxy36j8TRR2Q0MgRixejnM57uJyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX2pj+6YppOk36
 q7yX10qgaa8wCiQINSLwYZbvlH9i/A7zoLQfxqMIybFofXAgxsgGgJsXr6Y3NtIy+IAEa2VEg3V
 +QxIlFacZa4kbBTmUfH/7Bxbrx5ou56MYiPcrqZQcRzR4ntDKiomAlaYktTkR8KENXUZ1my2yHL
 5ZoQ14iiMZbD7+qEa3vZ7/l0mpQppgJJSRHx1TlhOWuXltUP0aBotlwE8RQybiLM6rsYVqA+zg1
 k7aStCT5LJusvdx3pLt3DKQ1scmCZ7w99ipYF5C2hrLtiknSigHToEx9Pag/Oltcs4BFn6Y2J1R
 q6u/TBkebIBFfNaJ5l+YS+zaiumDjFKehdDK9fZViK8xzXxUQt+I02LnV6URTEsmOyaWFmcaLYH
 34tt4d4QQpv93Gdf2vkL8Rg0fYGeINH8mNB4PVaTJgtYC1GIVJRLBQXBOVaOihDFDXFR4F7ybgF
 vAL7yr04yBJNNEE+GfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170042

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

