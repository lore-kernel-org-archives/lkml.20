Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64D3D3D09;
	Tue, 13 Oct 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887297; cv=none; b=q5UGgtBekUtGbhCn6pJ6gY08QK4W+Naphqjq/MLFkGXZIcMcJGPKanHySziSQqs52PvSG32zALSJJQYBge3WlxnheDqGJdmNXEAFtqlH182VHV53HVBD5E0q8hP3/Se64TzPTkqIRTnNJlmla4pnj7hAcQhDSWG1AB6zt4w9pBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887297; c=relaxed/simple;
	bh=LQtwCzTZv9IKa34gpDGs1aWAkftPLXw1yX9wQJmTWAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQ6VATiLWXHq5C3OBcYN6sd03MJM/hq1etgcOePLi8vQzjaaelUVrYS3AaCjZDdBC6Nl76Ubp47ZKGpTDCJOUSGqbWgFLpJrF1d1YxJaaBydDSFZmSBdFsJ+Gin/V8/GjnnzU9SacX4tdHHQamXr4tHxKcYKfuV0TUkP3ZzeiR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjW5Z16f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjW5Z16f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D94B5R483184;
	Tue, 13 Oct 2026 10:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kE2c2hIxQ1NWJAc7fqlCtVBzyeIOLR5HHjUX1s3gPw=; b=gjW5Z16fJmaPxGGL
	Q+M+RLEZy3lDAyU/P3sm79RcOMERHrAkUFEg4b+864t9uFDbxSFyVC8HIy5JvF1L
	KQBenvRusazHqPL8p0zDtbYaSneqHGoRfVfqqPyUA6Bv3Q0swdRow+5iYt5ds4V0
	EF6jJ64whzRwxEE/u1prcbIdGw48jPhxkFXGEEmfce0L+34bLo+/i7Jh0TmpGuM7
	OojnLu6JjomMpDysegDEfnc5CyJMbi4W0tYUubf10Tn6PnZ+kHX2o59aj4sHNkdt
	B2urHAZXgwY0AYf8FllYkinhYaJEsW8+Hz06t9gjbuoeyRHyJu+zp5yVUoGOcjt7
	Tb9/Dw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8c4x-17
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 10:28:03 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5pne2651545;
	Tue, 13 Oct 2026 05:51:49 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 69D5plAV651483;
	Tue, 13 Oct 2026 05:51:49 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:21:28 +0530
Subject: [PATCH v9 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
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
X-Proofpoint-GUID: B2pP-vezObqntQcjdjB3UlPn3kj8wLuM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX0dx0Nbwge3of
 +TcQ2XhkLLohLcscsZ7pFuDj5wlt60EtkeTyHapN6TdyBNW/WQJ0ba4A3f10G1frFV6cmEuf+KE
 OVeIgRIh9MjfCqjn29Mr75613VLHbvU=
X-Proofpoint-ORIG-GUID: B2pP-vezObqntQcjdjB3UlPn3kj8wLuM
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace07b4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=bovOucATokvHoRHO1osA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX39n7PXjshg4u
 pb7GPHJE+TDIzMC9wACNQrfiwFsVsSJeBnq8F1es9DNU7CiyyuGVH7nKnF35Fqgmv2DTCRMfmH+
 2VzaLN8/ZKTawUD80A0EY5r7AZG/Qxw23XOu4Gk2sHIQ3FvoPhBcYS2NUeET9B1cFl1bwEPlGdM
 DR0PrYE5LJOMrQAr08iUKeuyK8PxbFLful/c0/Lu4Q94MVrcNJPAVziwv6BD08SO/2TPY4sO5sw
 7n2O4A3c5a7ENxdZoV2uwfqLgqO20YmVpK8dw5iF2VSWfBpo3zz9YObsRYW9Tw4SpzrTwr8be95
 k/Inq03vfhzAahumnkqhxo5eez+G/Wb2MceVsp10R7z476tY53hSLJMRj8YKRPNm8QibHltaNt+
 7QPbzrSZGqF8/Gziv48DKBAH6Ke8UQUFPV+dkr2nKXozpWloG4BdMwws3Dwhy0+pX9dUF4zNf4k
 pCPOWZMGWz4OZu0mVUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041

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
index 553bb7e2be98..6f15086f7313 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1329,6 +1329,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
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
index 06167a198591..609706733bf1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2906,6 +2906,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
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
+			*dai_name = snd_soc_dai_name(dai);
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

