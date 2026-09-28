Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14934B1A5;
	Mon, 28 Sep 2026 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599997; cv=none; b=ZSceb9qw8bt2B/38u6MIJIT2U6srkPuBofmGSd0RB39sycGbu/UOwKXg/kS43zMvMMjxadlG4R+v/xj3nEVMYdEqgnmWSdJ11jvsd0ySSLIMNbl4aTbPh8Kgs1pIyPTxi+8HwGxJ+7bZ9znWu/Ia0AuRyomOg/PDenng1+fhUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599997; c=relaxed/simple;
	bh=oWpbabqz3Kz92fPz78+Wjy+m7c61Kbyg4TlUhB8WFiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FF4/p8R7XkGk1PwzFLverri1hOF002tfiZqcxsr4F/4uYK6I2C8c2o6S7eitR/vNd7RfU46bNiPryMXx/ZCJwaMITo1f1s5EIh7Nvf6/51TAlFNp38mR4Sywpty7rFh6P1FiS9KagwZXBI2C4bbIPZ6lJpsi1WjBVnw2WUpsl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXZFSGVx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXZFSGVx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9qa1433709;
	Mon, 28 Sep 2026 12:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ohxh31+m3xa8LRXHvS8OJasJvbFkS9gXHkjtvk/qdsQ=; b=hXZFSGVxAhyc0e7w
	DLDOVinrH/oOOIHd0Ob2PFao1b/jOIM+Vu3SHhQTlDA2R7iqBZA7+Yz1PTBrfb7J
	AtdJsUu9vwWQ978NeICgXaq3Wch+YFgwdquuX/1P1oEhOmG9uKlU18T7z6zVcW0U
	QSnNdjNska+zqlLAS9AB2IQtLtZNrIqmG0wFF1aLkA037kqJmWo0zjKyzPZEidYP
	NGpQDtMHTV69QSdCiM8raD9y7gbO9xxLEFC+Ch2glEPwurPVS/5UTQDkGe2ro+LL
	Qv278d/tAzihrYekAvvNv2Z77NhElPuyqNW6+VlkzJuEYnPxO7FT713ls9wsN3nH
	HrDWlg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s1jrr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:02 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCqwSb2080638;
	Mon, 28 Sep 2026 12:53:00 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvL32080411;
	Mon, 28 Sep 2026 12:53:00 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:22:56 +0530
Subject: [PATCH v8 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-qaif-shikra-audio-v8-6-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX8RRJdfcQeXMN
 XxDqJDpWsjeOiXwQlES03LKnwBVgSeHOrAXqEFsuUd8+zgpvRkuuE+jnPXAyEy/EdgkkNl2sBAJ
 feQ3/183zJmhn2Wdxcc75tcvXuYzIKWqp1idOe5Qbj8JISh1b18FUn9H72uKYBbNw0ayPLPGqTw
 4R6xScsrRAvtNdCYOSiEICx0+Vk4zqKqBpubvzn2pM4FoKaT9sGSxZOYu/EFiVpH602q02ZzvGz
 iNfoBAY/CHAKY2p+nvnCvSwW/s3swnlz/YtfdRLg9YSWx6bDs38fjwogDTehpGScVk3apq4vaMs
 3R3dHViA8NMXSxzkHjrb5XHXp+MNYOPtQYPoUpBC0JemzFQk2Nwlhn3oDoZHERH2w0z8PGf5fIW
 daOrjl3uPLvLpca9esGej6EQXFNhn7ydWKj00xM0GidrWXoe9Q9FdsVrPmGU1V+BoD1brLwU3D8
 AS3LwsU/WwCeeiS7PAA==
X-Proofpoint-ORIG-GUID: yZti2Urksc1f1ZJ7XdceCsa06NxbxVD8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXxSIFZsmFbdNi
 47egCxZ2Q2aZpoRkLlWcOsxsj3c5ma8K/0KpMDKwZtoWr5te4I/R0F2dsJtm/QAjzWoQFPTViB5
 vtHkdu7JZ9TeLIX/FzNjgA4Fg5MTzXE=
X-Proofpoint-GUID: yZti2Urksc1f1ZJ7XdceCsa06NxbxVD8
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba632f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Hfps_RfwFyUEpd0PCboA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280051

Use the new generic snd_soc_of_xlate_dai_name() helper in lpass-cpu.c
and qaif-cpu.c, and remove the local lpass implementation.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/lpass-cpu.c | 23 +----------------------
 sound/soc/qcom/qaif-cpu.c  |  1 +
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..61efa45376cd 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -458,30 +458,9 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
-static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
-				   const struct of_phandle_args *args,
-				   const char **dai_name)
-{
-	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	const struct lpass_variant *variant = drvdata->variant;
-	int id = args->args[0];
-	int ret = -EINVAL;
-	int i;
-
-	for (i = 0; i  < variant->num_dai; i++) {
-		if (variant->dai_driver[i].id == id) {
-			*dai_name = variant->dai_driver[i].name;
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
-}
-
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
-	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
 	.legacy_dai_naming = 1,
 };
 
diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
index ad7268e2ace0..d34b8df83f94 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -603,6 +603,7 @@ EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
 
 static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
 	.name = "qaif-cpu",
+	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
 };
 
 static const struct regmap_config audio_qaif_regmap_config = {

-- 
2.34.1

