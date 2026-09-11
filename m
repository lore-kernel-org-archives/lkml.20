Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3E472F66;
	Fri, 11 Sep 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118408; cv=none; b=NzCv8yTnw6RGLZb3SuM8jodoXjkxUdE/rGjMNvI7UkMKdbVIYA4Doi1ErHCohdVoV5jqFSRDAvXjkQk9crq5AkBAILWgU3C/yHNllQ8UziU84J5lx3/kgg5FP2X6bqLqWdYWh0w57x0C+xY3g11BjH4T7scwkyKaC6fwGztmn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118408; c=relaxed/simple;
	bh=Fa2B2z1p2vnYcl9Lt5OrEI5EEaAjDuIeC/VPBFc1ls4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0ZW/dZtw9G2AgsdBpD9IQMgp1OCW01xaWoe0GtpuPNdw49A9dOAIMc4XlRqfUGkOQ9Hmw7dy/a+08JSrGAc+WZo3kpz+0W5gCiUDIm/TsDGAiSulliGCzqWb16kqSisiXqybkZzy6EeKfiw9Tx0L2kXGTK7FBxzlq4hsEh8+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/yMEmGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/yMEmGb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqVW3366446;
	Fri, 11 Sep 2026 09:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZQ3j0/GmXO1wptiFOYvqy5+qNLnbETvh0uO4ql081U=; b=Q/yMEmGbtSuitt/5
	CRttM6yzj2ti5EEijT6S1OBja7vPQMCyTvlhNM+PZSrWYnqEW1bLFO5G3cbkOSWI
	M6yyRl1qNoIbJ1EMJRDTbg6r81rbS8ElgFct5tjsQZaQW1ZII5svMLU7zSCYne1E
	Si4la85QhW5mxeAI6lrR553IKOv8nN3pFr0vpA2UFln49q2Btda6CU/VU++5ZxmM
	k5K80EnyhN/WYJWb/jEm5rYysltS4MhvYs6ZZnyHiXDmnT0ry1VYkXoxGSJift9k
	XqSwsqIeFbcekFirH7jb5l2Ygo1DLjPyxNTj8nScXjI4HlcO+2anMEQGgrMb6jf3
	g9HrtA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2b39v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:19:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9JPPw2871029;
	Fri, 11 Sep 2026 09:19:25 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 68B9JL2c2870824;
	Fri, 11 Sep 2026 09:19:24 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:47:30 +0530
Subject: [PATCH v6 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-qaif-shikra-audio-v6-6-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3c7a0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Hfps_RfwFyUEpd0PCboA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ae6F_WgE2fEuWe_6ZIu0mmMAprJc9INd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfXxcKKYwoD3/x6
 0Yk719aSuoWaxPj2uUF2BNDR8uSQhQhuTNSMlA5002VDxtCiznDxlXTWn3C+AUA1mqeeU0IIDnh
 If5v6judbF6em8uriI5zWq5H2WceEcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfXzLf4g6DSPlBs
 /oO/qheplprhWthMX1IsJm1yowMZQvRgDT5/peDtsm5xql35Sn2Tae37gACLK38AUmUdMaq4uxW
 5QmvHc3lHNMs5NicojXcjZNTAHgh6Rgrxeidc325twrF2qf3FPYCTXq2zF6FzrL1kH+Q7Dceaka
 MIZVfcaoYDAdiw29nFraprHXNK2sK3mAGz5IxsETDMI+zBN3ihf80b2XMQZ++mrzv4zxy4EwoNi
 U90C5kTldfF17uD5QMCfZKVVtqYKIeIxhCUmcVhBZeSf7INywhvKCG71ZiortK4ZCAs2HqzIiNY
 LLugi9cIEjEUzrUTzdqW3SuabctBfXzC9ihXb2+HzfUJ4U/M8d/m4qZAZZcatdD/K6H5vxVXuQE
 8ZFFDiyxCm5QFCtpOZqGV4wS7jrEi9qRarTlJx9vj1+pLWMaLH3LrK4VW3mMlZFgNrOBOe22V3h
 jIWmuapq6Dtb3r0HZBg==
X-Proofpoint-ORIG-GUID: Ae6F_WgE2fEuWe_6ZIu0mmMAprJc9INd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129

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

