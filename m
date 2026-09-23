Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD4414439;
	Wed, 23 Sep 2026 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146191; cv=none; b=K6sQtZc0/Piuxg4hTZMWqOFKZsA+uOmO+yqCTIelSng8RHA6n4N9iBq4PdAu2wGkqzdn1dGy7xV66y7oPFTBYOSYzM9g0vo2f887KF16VrucIBJV5EaLEAMOwnmJEKeBeIu1isifd26Nblh1FerAbODJTuyF8r1S+2G2Dk9r9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146191; c=relaxed/simple;
	bh=Fa2B2z1p2vnYcl9Lt5OrEI5EEaAjDuIeC/VPBFc1ls4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBfDhGjkLO6WzGZVlXhJ3Hfj5mFAWhl7MUhv34rGfh9+GzBVt38DJiIHKT/LOvJa1YfEHyXZiWHKFYWzZvwknXT/APLH3JC8rYplGFkrQ2oR2hzgJb+VY+XNJo7/ZDtV68GcN0rfXU5dl1b1DN78euarLGgnVq9YwzUCg7HPu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGLdq2yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGLdq2yJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iLM73250360;
	Wed, 23 Sep 2026 06:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZQ3j0/GmXO1wptiFOYvqy5+qNLnbETvh0uO4ql081U=; b=pGLdq2yJ6OKHC2a2
	Slg0lhXVj4D1zCS0QzRSJTt/1VuxwQqLK50cCihckDgHB+zE3CuSgkG8ozY3x3vB
	ka0gbowVdO6K2dangXgOhPu3yFsP2YGdgCOzs9oqdCBaAOCIKhwRThJ/bDhVwHEz
	9JP8EtDWTQb2oXDRKQ2AkqmomguL7A0ND/t3nCIaQyIpONjukwUweTCHl9p1N2H2
	mbd6NE0rRBQTMdtLyGvKlV+dcghJCpwulDSSU3mnjpvda1vRgqv0Myk62QC9RTKK
	7stIT3zGwaxUyeVt6U4W0hHPb7YHxxgvYZpbPEsth5tlsZPWAkNVDmcRV0pXlzjV
	BwOauQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c2wvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:49:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N6nONP299669;
	Wed, 23 Sep 2026 06:49:26 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68N6nMCX299652;
	Wed, 23 Sep 2026 06:49:26 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:18:26 +0530
Subject: [PATCH v7 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-qaif-shikra-audio-v7-6-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX2yYXoc9S922Y
 6GNokAwOGqR9DLEIaHIa6sDW6tgxenXCfqKXV2K8yHn/xkomjq3ikKzQq+Fsue91c/cC8Ae13WV
 25Qj1FBX501ZsC2FE44osTD5Eub43Vaf7UD/Qp3PUg4oA76xAjfM9MpQWieOIZ+mn1BReGUAj7e
 VMO/hZk+p3eo5ptl+Zs1AH9Vd4DNnXUPpXAAA1X7Xr1mx5PDxE8jfXZ95nLxDeG9Xti6FcWVHKa
 hnjVbv/OLUFa6C13VZlajNrN/iRcIDzVh6ta90u6GKTEFqhDNXCBt/3gZBv8tX1CL68GyPPgWE7
 ZfLKxAp76VjU7e/d/121Ja/B8eQP5uEeiidkbErvHsOtV4fNzsczwSNuJuAkls9hjytthLl6L8P
 7jLRk/FE9J/CxMCjw4Q1h3rk/0rJd27X+sHbySPCfXkCJn8m5GyssydYR057XAfLSJLoVLBKTvx
 gnQQ5u1u5cljcNYP2rw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab37679 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Hfps_RfwFyUEpd0PCboA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2RxFLe2jOsQsgGIxsJBvI_NQkaNexjSS
X-Proofpoint-GUID: 2RxFLe2jOsQsgGIxsJBvI_NQkaNexjSS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfXwCcs4s4f1M/U
 NDTz+53xesiGEPe/+B4wO/HB5juNRZycKAWkOqE2CJPoE/erTmDXqN5Q8hwAMQRn9wnLhVHLYkc
 F7ZpBOGOh0J6rqf3xeIbWCS7Rjpdmss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230027

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
index e1868dc95cf4..c096ef5133bb 100644
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

