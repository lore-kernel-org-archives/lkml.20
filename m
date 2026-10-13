Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B032D0C75;
	Tue, 13 Oct 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884876; cv=none; b=Bn7inGWbJDTXJNIv3BYW0Frigu8Lacnul9UUROlqyXuGAKbzKZsfsuWHtt99hyYVbt/ic5H3UwquG7+0kpLdudKvXsQgWEEkh2iUOo0T4u96TDPzsBLxPKxR0BS4QkLtWpptoLuZQAFZGZM5bwaj3RClgUP+q1ODdRerrCJ5xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884876; c=relaxed/simple;
	bh=oWpbabqz3Kz92fPz78+Wjy+m7c61Kbyg4TlUhB8WFiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwacF8+u2DSWJpo1JYC0vPzfDXTKt9W4CjpzSLnrwmNG32AKhcCj4lIdu0+6M6zgIWSPX5a2soFWC5QlmwX6LEjnzaCTnvkMTCcKSXjIn2IJ20jtI9xdjEiFlW9JWB/vf5iYEPkBlGOQnOrOzubhk/tHcq39tXakSYrYiBOUFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4SM+2KV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4SM+2KV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvv8790830;
	Tue, 13 Oct 2026 09:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ohxh31+m3xa8LRXHvS8OJasJvbFkS9gXHkjtvk/qdsQ=; b=i4SM+2KVxvEkxe/j
	2CSJJo7lRTItCuNLWz+/Op8wIe0THx72Me6JfC0GhsjMruMMxti6oVhjxN7EKk1c
	RDn+zlslfmOhZJ2MAjk4v2/plMrsIL4XTp7z/PfW5qypE63amq9KvHVM+syl+64M
	zhCMVc4oLgz4ynQK6QuTQbzKG6IZnZPkdy8vrfQ4w2FxdRpTDEK4BVMlAQdDGBZB
	409KvOZozpm7eYIGwoovqm5hQV8MamenJlCnNY8y0w2eH61ZZD2M0DB1M0xSMVNz
	l/FlQoOYdaUxAYuxqPnFrIMGoGXMcHFURaipyLIm3NwEIKYbR7vRrDpbV2u0iyrS
	0GNOJQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr6t4-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 09:47:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5mMBs647227;
	Tue, 13 Oct 2026 05:51:49 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 69D5plAW651483;
	Tue, 13 Oct 2026 05:51:49 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:21:29 +0530
Subject: [PATCH v9 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-qaif-shikra-audio-v9-6-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX5LLgwXnoKRzE
 r81C9GRpI7sxUpBtzNuulSpe38bdIqQ/F1rcBDS+53rFGb8htDHNywmAirQOb6gE7or0qma1xPe
 4GfOwaORa1/NVAmM9vK+yr+YgSOsYD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX/swtOM+mAVeK
 KGFEEaJzySB+avPLQQznR+suVVU8qqz1VB10UuC1TvEPZXRdNYzye4w75apkIMjRUKU/5nNymrt
 qVu+duSgSFJrffax+MVcI3DdzxLlZtdcb9oqSOy1+sYvrZ5LiFaYiN7W+uJ4foJJLpyPYzVyX1g
 3bwsVrXvzZII/XFEQW63V6ca3ej5WhWqG+7aeEXx0+UX/DeH31Qa9rM+Czg8/jkxSOxvVPd4Tb5
 WFUSEGnwSZf58QHTnCM73Yv2IGfVQ9p7H+mtdZ9ePwn7aXTypXk78jINnhYjm8/V+4G2+Ev1uNS
 ugO48wL2zgehDb8lOyyblOfe4/PTAkBu+FYM3jBAhqUkuLPqAz/mMROg3TXxpLB9+k9E4yp2HhK
 VhCjMPT1UBqjlTkTMxdGLB9Ig8A7QJ7V4xocleWqrmYl8wl9Io0/h+i8s49ubfyXjd0x2N9ka3k
 AoW3e9qasz8pkcy/Hfg==
X-Proofpoint-ORIG-GUID: pzqTRHQkB5SsY8AfBQRidOaR8j3LMx7m
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdfe3f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Hfps_RfwFyUEpd0PCboA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pzqTRHQkB5SsY8AfBQRidOaR8j3LMx7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

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

