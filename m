Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4E489888;
	Mon,  7 Sep 2026 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782996; cv=none; b=AXCDYm/q4PT45R20CZCIaxfruQldbyNqVXbuTegAUz7AzFYIZqKBXDRsohaP89v/QrtTiaLtSE2gZts+v3fCWYsnTiENri9OVh5zmO+94hDPCuYdd/dpGSuaatLUC4qVlRJ++6DwLnBHQ4So8ybFZ1zx5aXb3BcnJXsqJc0GsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782996; c=relaxed/simple;
	bh=+IaTieccCYW/h7jgMdMeI1d6rUo3YSgBjJW2UiIVLQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bl8TrhVG58vfOuVMQbruc9wBJ/VGhFpdoTJj4bC5rjIyErKGL1ON9cKdC3fjPU93sLFCRB3boun3PwPeGG4p2S7fQEMXrAUUOjkJi4d1ZJqa+VlNoVUF3nw3zYPXtbKIRFqXwBBgKQeefOWsHVYuYOGYOvgjY4+Way2dkpDhHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6gKe6u+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gKe6u+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvKRE496168;
	Mon, 7 Sep 2026 12:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guwAOpPNprObYC17vX8pkUMmnaAJqhey4PjQzDFhMvk=; b=G6gKe6u+6bs0zPy/
	H4/bhI6DJmK0aGCTOqXQsOa56/hpssl8Yo0iOm7SY3WScyjkQ43173H9IYO3Ovp7
	BRQwYJdqchah3ECRToVC4TPdyqOi2+Eaw8bKxoefbHV0QtU3vK/KpIe/jdr3uAuA
	dp890EJo6XjfQvUwyEzIooH/NWFUvb2NMsvyIcGYFvSwuUEyrPhTwAcKLlbwjisb
	4kPDXUwLGrZKu/hUUdyIcbSqbtWxhZ/RW0+unkRY+GcfOz8hj2/74QhJ46AYY9tK
	U3i9VmpGn3SrFBGwtMtqWRnNIh2IFNmcDNj1mWjJOocB7B9gvwFx8XV6YNxY6Ruw
	h54/ig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk87qh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 12:09:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 687C9bEb3932932;
	Mon, 7 Sep 2026 12:09:37 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 687C9XQX3932854;
	Mon, 07 Sep 2026 12:09:37 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:39:31 +0530
Subject: [PATCH v5 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-qaif-shikra-audio-v5-6-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXwDeqnZFixeeY
 ft9A+HwoFwV/h6sUgX7qH8YOOHXiDjIATPCBY0W6jqLerHy1pOxLnk9KQfPsaWvAHEz0ahTRjPB
 JrFUgoj/Nu2DZiItYC8XNQovPEwhR5A=
X-Proofpoint-GUID: Doi8y6VD5TJiETjzzqWR3n-zTcHhmq3c
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9ea984 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Hfps_RfwFyUEpd0PCboA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Doi8y6VD5TJiETjzzqWR3n-zTcHhmq3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXz3mfC7hcW+8I
 0IlWGV8gXfXuk71OTIfQiPTULhQvmaoBKOhlUkVuwUuhLK9ynDJlCbGWOkBjKtT6eFMg/P7B7pb
 DtnNmUqQTEWiuNKEkxr+J3LWaHLmhdxFG6bTYx16UeZHQ2UJC5xMP+U5dkCuL/hgcE11Pp1L88P
 9BCF4xtkDWO6Dx1OLZXTkejQovkX/U+0gnnUY0oiKZFCNtU2BOYueGtGCnh7MkBA5OlWaCvAzVG
 b9Uo3C3yQM/SnJxMh/gNHs3GPYTUli2Jv6E9+Z/7/f6x4OalFEBWViAIaPieGbF9OmAEz/hE3RJ
 YrAC7+Zp0Tfj8a9Tq+Mv/XU/U1xHCUniEBs/sObP0jXvpsnVVyzLFIVaysvAYgzR+HMUKalkuty
 t/uig+T4M0QAM+TzZec/Pbm7+9BtV9LJmGMTn5fJjl0e4mAt6iD5zV4OU/C7wLEH+eCkz2o8syH
 tu84C6sVqcHf4zU1wKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134

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

