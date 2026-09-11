Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76381471CF9;
	Fri, 11 Sep 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118408; cv=none; b=gxx9/Bjdxnp6hwm7beCaXzlNc0avqei0nroC3K3Kn0ZUV0Jcn5hJfDKT/XZG5qqnNQE4b8Dzdmpf2oAw0C9fnTpMbZF6cvfSprExaE9UTKOj5evohXa7vsNmbXAy1mmYbMe8UsMqjAZ5i6bbhWGU1Zj1QUtfspPVVZ/cCg79MzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118408; c=relaxed/simple;
	bh=mlMTLQ7tIxz62IXqVC1ezTP7gqDCbVHHehLD9vHfAoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pL68t4ALB52TlXYAY44UVMRP2Oc3LyEY4HAGxaw3oyr5tNCZhL2KGkLrhkh72jXUzngKETGJ7lmc4v/BNfgjpGrzn9GY/6DW5rvTqo7mQCitu5CPv4iQwEYYO8Ftk/QhPFLiZjG0Ez39tL/8+1QRd8//N8M+uy+aPCjaAe+UWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HA0yJHD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HA0yJHD/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbn02831841;
	Fri, 11 Sep 2026 09:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RL1Vgd3KT46F8p0X1dUXEvKStXwgH6I1W2BexVhSZVg=; b=HA0yJHD/0NCKAAZo
	8vQtH2Y6V0u2/iu7XWPBMrVhzYK6OjXlz6cHV9oCqpm9Rb4cSS9GyPO7I3IMJlHu
	qslieQLjJ3H3XU8KVae7roNHpHweBuqsNbUdZuQoddlmiqYA05FLtUoY87wEnwhx
	fhuoT4y93r6c6SugSTtT8aaxdH+9RWgUKmFW6INtHxa5UzrfwBLVlqfTc5JBE3sU
	JVGbmnbjuiDEF4C/ZU7riSEDE57hXu+RSroibOLmG4V3ZjTFvIGiMK+wZPUeQmZP
	1BaZA5t4Mu34V0rZsrmvoBMdkDFLxvC7v1mm8EXJ0LYKEKSWtlhLQzokr1w75HAW
	RPWwEA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgmph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:19:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9JMw52870843;
	Fri, 11 Sep 2026 09:19:24 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 68B9JL2b2870824;
	Fri, 11 Sep 2026 09:19:24 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:47:29 +0530
Subject: [PATCH v6 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-qaif-shikra-audio-v6-5-e9addb358201@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX6ok7E7U83InW
 SCp6n07eiQz+aUMn30+iU5jgd2mZECRlqtHxn+j3L2Ec2Ajxax6X9iy6MplSLmq0NppEskYXOxO
 cYbM/+kD1Bhccg0xsf7sSGiIR/hUpwExlUDM4Xdj48uDMtzUdV3WC4obt1gUXSFOFL7IY2fyMxK
 Mf7vpcZjpTfGDbL34yTRmuRyZsxKouKiuSdwizQOzWenOPQ2q41lkGZwsXpWN6AqXliX7760Cv/
 Vig3rIJGsHLyhUc293LI7d728fdfcZAqoeRrG+rLR3yrudW0fL9uMe/XUv2rfBpm19E4XFaIJBU
 NbigE4SfHf+BE5X7he9JI7l52xellMxJ7D6e6/FamoRuUARr7PIYk81xUQIK4Tx1oqAKmPgzUzF
 zODKBPCBDTjkkti3D93DM3Im7Rk8w/Sp9LC8DQUKjjkaII2wfuo9tNUFZDlnh9GwlHnXcYJGAlU
 95G1tx7pIhuZv8K5tCQ==
X-Proofpoint-GUID: 0OoxTXucw-sQzaXPjotA_hIPjI9SgQQG
X-Proofpoint-ORIG-GUID: 0OoxTXucw-sQzaXPjotA_hIPjI9SgQQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX8sW4UIQ3iMH9
 k+uk9f7lZiaRJ1IbxcPTvGII6pJtEJxMc52KdVLr7a14eu74+zzi2eQwbxFxXe0Y65wv1/y4H5T
 W+TucDK3ekRuooVjlkkPmoku9oWib6o=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3c79f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bovOucATokvHoRHO1osA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129

Some ASoC CPU DAI drivers need to resolve a sound-dai phandle argument
to a DAI name by matching the argument against the component's DAI IDs.
lpass-cpu carries a local implementation of this lookup.

Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
that can be assigned directly to the .of_xlate_dai_name component
driver callback. It iterates the component's DAI list using
for_each_component_dais() and matches by DAI ID.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 include/sound/soc.h  |  3 +++
 sound/soc/soc-core.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f46b2bc2a022..b772273b7183 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1330,6 +1330,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			      unsigned int *rx_mask,
 			      unsigned int *slots,
 			      unsigned int *slot_width);
+int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
+			      const struct of_phandle_args *args,
+			      const char **dai_name);
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b9c70268d49f..42c57c24ab70 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3053,6 +3053,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
 
+/**
+ * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
+ *                             DAI name by searching the component DAI list.
+ * @component: ASoC component to search.
+ * @args:      Phandle arguments from the sound-dai property; args[0] is the
+ *             DAI ID.
+ * @dai_name:  Output pointer set to the matched DAI name on success.
+ *
+ * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
+ */
+int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
+			      const struct of_phandle_args *args,
+			      const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	id = args->args[0];
+
+	for_each_component_dais(component, dai) {
+		if (dai->driver->id == id) {
+			*dai_name = snd_soc_dai_name_get(dai);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
+
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
 				     struct snd_soc_dai_link_component *cpus)
 {

-- 
2.34.1

