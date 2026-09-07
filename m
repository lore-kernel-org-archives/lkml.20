Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD39489893;
	Mon,  7 Sep 2026 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782995; cv=none; b=Q/N4y3WkdrlC6stDfSPkDAw4NUEbSfpJNMDhWgD7RixkmxY6yppsuasLmi3wORZHRuTG2c5Kbnonc3kP3S3BRq4VpTw4DrwF4I3cTrmngPG12kagF13fzaaROqibKixYCHhh7ZhXW7QY89taFArvRXmX0oWXzY08Ae67tlfZ6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782995; c=relaxed/simple;
	bh=mlMTLQ7tIxz62IXqVC1ezTP7gqDCbVHHehLD9vHfAoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILQUVWs8lVZ30D6frY8aOl2y+z0jO9oY1Stau2oqyK3dBVwIXorJpbYXpvlMWhU2eq+eymH44Cjuy/tOgK/8FezDKIByrYJPWO2CMJq4Er5VhJ3rhOJGHIDYM43592xDx09zbrOvH++EhSNY7S7uq0lIbr1wKzaNRPldKDWr7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRamr2I+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRamr2I+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Ammch2651969;
	Mon, 7 Sep 2026 12:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RL1Vgd3KT46F8p0X1dUXEvKStXwgH6I1W2BexVhSZVg=; b=bRamr2I+lyRq2o1S
	FSb+54nrOaTm+iWsurZeCaWTyyWFhuPM2d2KG3DyhAteSp5KAkGZDz21cj+cXVbH
	2lAHlpI4YopzXNArOP+pBljYEuGPLZUJOEpzalo1ZhkHSV2Yxr0Zj64tdDYJvlzi
	4KYWvkxNR0j0ZwYbHOMicSo2HlmROMFwkfi0c/OUei4ZoyP/+2LqJtRaYr/Qmt/A
	Hny1eduuvtsqc8DSHJu8EXLYV/ZPPMkahq1NAaCajZFSJ1wBzEDeYpzaVWGgyOk/
	q1YwMzSSli/HVPWapfnOwWHu6I2LECUVQuFg6yTPJo6IaiubREO9MQR0O/C7qUhJ
	4yUhpw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0j2q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 12:09:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 687C9aC63932923;
	Mon, 7 Sep 2026 12:09:36 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 687C9XQW3932854;
	Mon, 07 Sep 2026 12:09:36 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:39:30 +0530
Subject: [PATCH v5 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-qaif-shikra-audio-v5-5-6d8ad9ba5c9f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea983 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=bovOucATokvHoRHO1osA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: L250qMUu0ShB2LysyTb1w3VHb8uVHYZO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX7mbmgLHglyWX
 anY7FdoRKaMZvDRss6FGDYiLZAaxC9rHmsv2UaElhY+eOrcM7mOziG6V7TzoRgk/i/rkCfxb3Ir
 o5j/ayzxFlOvpQq8EDJ1DfFu9d5uDP4=
X-Proofpoint-GUID: L250qMUu0ShB2LysyTb1w3VHb8uVHYZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXwmT2xZZfNRkD
 rhYPzSOWgXEWsjnWDupqtKXs/EtMENwGBUm5ktpzZ3U9BxzNjataJIwBd2hhzwUwM47nq7cZJV3
 SsJ4Xioqx7pZygToI5vRC5gQyUqd46obfA+4KUh9fErLGqrF5tL2kYQbRompxpZPpojETnECLRX
 KA9ICeNVAptKKbunefiF/jIQBTyeHFX7crgndmL3dSdwbqIQ7kAi9Nemk94ZPxl3wdZex8kmeXP
 bHjKN4w1/r6CcPV5VCeBc3+Q9BHAKtzjyq4MbdwyB+586BuefPYfKAMGWXVzDcujszTbIakp+gt
 wRseL4FbRTLMPcYLtVSTCECivPVw7mbuWjOdI8i36TIRKfbHKDaV/SIBmCjtMs56VTzRoLFZUKi
 q8VR+CiJGvyxjRnKaMHCA3MFi/40vK7O1XsnmLpM+vGfLadxtGv1RR2ZHKJKeV/Z3oZqTkzaaNn
 qRxizFriT930T9iVS0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134

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

