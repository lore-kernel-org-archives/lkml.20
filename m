Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF95414A17;
	Thu,  3 Sep 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420583; cv=none; b=MqNHfHeQROUx9pCzqacvPrNGFpGemevHO4JKmKZduo4wD4JXuA00ZcM17Hb+ge3RG8vkA22KqJueZmWdyOz7nVbrPP8b9TMqcB2nMmuwrKys28lHFKTRFRXau60KiB0Pzhp38wK6mGWZ3fJJQCblu9ZtxUwYadSvn6xUce9mC6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420583; c=relaxed/simple;
	bh=FYCiymE9T1Q6aZXnvEfetHjlB8GZW461uWzYRMIJLkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAHlE3GNxmk6eAGB7Tx8s+FjfV6VJDwWVYG6S+6aCNwadP4Mpfj9AxM+jfr/9O1bKhdqnD8Y0U9er6Efrez9UoKpRv3knc3hQjVisYTd+RbDxKSt12v9xIYDawoqu/cs/zZ4G0j5JNVh1E5gZFMFepxSDzkVWDcs7yoFetSsXgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8rpqFLL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8rpqFLL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835le393176911;
	Thu, 3 Sep 2026 07:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VZ4fPxfW/pR
	03eBTSGAJe6pBOJ3xmdtEm6JiXThAixE=; b=e8rpqFLL7PZody/RJtBdwjD4u/a
	JxcVjXmOFHgeNvNnzwyNKwjsDYadvNrmrjt6mXxfblVyDjMkYlZ6pxpc2nX6LfW3
	WQ2lk60V9RZifsQbuZkFCYE1dTnXZvmVBMrMs60ivyqPLXLA6HsCp6TS3WxThjeH
	3RSCxTYPvlhL3BINU1LRLm6lVN8BUeRaGeVpzlDdQqehEYSOv0sEZ2byJRbpulxE
	bqoNLSqBRHZmU5yM3Ph/iXvUDlZ6MVhbAl5OL+UdgqK6L3ZjgShkFP3OdqJIVAxf
	YiKGBCV4JtEu8YmoM2a4N6gbmvBkLl1cSCSZEbn2BuEN86z/AcTlONEtGoA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4v256-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 07:29:15 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6837TDl94174524;
	Thu, 3 Sep 2026 07:29:13 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6837T4OT4174384;
	Thu, 03 Sep 2026 07:29:13 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to snd_soc_of_xlate_dai_name()
Date: Thu,  3 Sep 2026 12:58:57 +0530
Message-Id: <20260903072902.3870009-7-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX4bI9dZOn3CwR
 rG6rCzY03exGGNIysuZ2Om+jIpUgu7iG7lcWxJ4lSFFVtrqOdEYA6so5Uf6zQIpQDMBbw8XtZZ7
 rDEsBy9tStvMi2hTykYsjtHCJae+whJfzikWmB1d1LDGOSL/GBIXvdQyXGEiNAVi3LiPjlj2Q1C
 ZBm8izNS74lBHHo1Z6mD9sS5qIARG1QOhqjcP9TZBodvSNWzXdTBWFc5rpJPVgVwsxXnhAltY4r
 dMVwVCBQDH4jTDoyb2iRdbPANq9sjoCrLsdCKMZCI9bviYe6KZHMqa53olJPQ/gmbTi3kzQBwVD
 rKZzKr3wLWYdb8ABtY6j71KSzr879kOClZQ5gE/ObBw3f2FXZUxVTKTKIHgyGpjtsMGocVZT6h/
 RYGI/tE5L1M7pNAHCixUevRvUBbb0EMpdUSoJi72f9KpZADJM+zat+u7rTfGB7qRizsUG16jvoD
 lZ9Ca+Wx+QT16+l2h0A==
X-Proofpoint-ORIG-GUID: vd2egW6b1ioNHYGcl3QJTCyKsLvf5jEO
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9921cc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Hfps_RfwFyUEpd0PCboA:9
X-Proofpoint-GUID: vd2egW6b1ioNHYGcl3QJTCyKsLvf5jEO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfXwkRlq2xAUMLU
 nM+sIfdOLD9uUFqT3YMOoY1L/sPVymc9bhEGD8VuznfErklLxzScKnrsjHOyDbM+hHBvvoR0zk/
 +bKlN6Myky8qPfaqeQQESWUEC0PbhPE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065


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
index c75b139ecb2a..d751abb7a888 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -594,6 +594,7 @@ EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
 
 static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
 	.name = "qaif-cpu",
+	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
 };
 
 static const struct regmap_config audio_qaif_regmap_config = {
-- 
2.34.1

