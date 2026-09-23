Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B6381E8A;
	Wed, 23 Sep 2026 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146188; cv=none; b=AntNX69N1DuMede1lDlmP8KX+gBbIcIpElTltEojuqdYxMrBAAb7sAS6ebIUhZ+KCrIfdwwokQkpaLsf/UrvrIU6IbY0ppDCC6JuT0TTHqxbumsXw3Fu0mrCgBpA01pfkipCaSqX/iHrCYhC7n+GoBuCxXKo6/SsOE/pea7BMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146188; c=relaxed/simple;
	bh=LQtwCzTZv9IKa34gpDGs1aWAkftPLXw1yX9wQJmTWAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzFaPOP5w+jdIr4r5TYax0RiS+r3uepecsTNR+7n0ISFdzffUVV8dnU3bEqHnDFhryzQlqFBcfbb0l15AVxhXcXMcHFqwWMBFtMqiGwOKNbx/AM+yD/QZrYNawSF5VRSh34dQA+fd/cG7KKolGBUCCWX1ZJg/kAgkyjj+wLoIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fikaIE8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fikaIE8a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iLM63250360;
	Wed, 23 Sep 2026 06:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kE2c2hIxQ1NWJAc7fqlCtVBzyeIOLR5HHjUX1s3gPw=; b=fikaIE8a6TVxTuk8
	q973eFj+otj0vuNULKkXpIYsGT6IwIiu5r4vVmG0TRSDNN0KOKpqJpVtNC43+Qd/
	zwNyUtREx4zl6wdFOfFEIwG2BkRufh8nTUdfqxeGpH+9M0YSgsRzP6vjK5gk6GJ1
	WC+mRYGdHRqTlO4WXstcvAfe2aRjaIkSoGiRmOGxc3GMt8bR5kknhPjtnlrkQO9q
	eusRhygwM759t+aeVMpxPPsUTzrXr8cfQWS6NFb2R3Flyu6slGYhij0XtPrELjea
	+45ovsDd/dK7fi8SZr1cVhnT/cVtk3AbSgBD6Us5KPzTvieZNZMsmBNJsO445HeU
	mESdtg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c2wvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:49:28 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N6nNVp299662;
	Wed, 23 Sep 2026 06:49:26 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68N6nMCW299652;
	Wed, 23 Sep 2026 06:49:26 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:18:25 +0530
Subject: [PATCH v7 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-qaif-shikra-audio-v7-5-d5b6f056568e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX3HtgQxaXyZ4G
 E/n2N2FC4fynOjGnAy+jYbyh8SxPCDl+Oollmr+bzMz1kcV+/kmfjLBuL0/HNKeJ8rqXo1IRToT
 N/e9H9oHbEJu50ejOjgj6H8mSo0mmKroL6IXTyFjELXFdK/v2Dd/h41+MfYDNZNCjAnXK3YLnq/
 KMDJ+Q5Cff4fWvAyBNi6wckXrScpTkln4YVz3ZTslI1vsPc56POO7kf4pTsh8p4wBw55tLSBTm7
 3E32EvhJRrG9nnmLvaNlvfwWc8/hCcwPlo3wC9qr3JSZuadFJCNgkGZPF50iJQXIx54WJ9h2vpO
 IxILR3QxSVcsFEibFUIrh7gm4pHeuh7iIhZCQo+fLHGQkKpm+ycLRMSylsLbysQpSmkU6/g0Wfd
 MbDFahxCT+w7TQOQDeRM8dt4bukvgxQ1u8KALgVPpDMTzXEzrW4UVXzPeicumTGqseSxml1nCr2
 9lBiIsX70EDizMupAUA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab37678 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bovOucATokvHoRHO1osA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uTKM0TSaltIVB4Ksax32jZUH53MAYL83
X-Proofpoint-GUID: uTKM0TSaltIVB4Ksax32jZUH53MAYL83
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX16oSnsok5SpS
 QECl1BBoFysqLAh3bDZOR7wAEzVUv11QIRwTSCtm7Tsbpnozvx3ZfdgYJOvgEIthgvTLnIu2YWg
 UODhFXilOgfZNwZYgQW6dWfoxvtzqMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230027

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

