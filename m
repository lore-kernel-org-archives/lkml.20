Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100938CFFA;
	Thu,  3 Sep 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420580; cv=none; b=tm1CExrNgBtmxhpVukUeXQ9c2B5txT8AUTzcqCMV2vtUltXmFK/ZidQWi8wjcljcnK8kL3GC7SG5WMNfITtccGaKSi2TmtWEpTbjS/cNwqwG1sXsuiaY2i8y6s+/ShWV8lhRzt/oYUR6/9wPE9QvC1hb70DiOGl5gPk33zaKg0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420580; c=relaxed/simple;
	bh=yFVStbEdKzH9zscfG5CsWtml0uGbmp/9J4zn6wp0suc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=phOLTl5kpPdN4sHNEQkpKVumfq79UwoLovGbOoo8se4PI49YL8DF6/xdOdO/CBjDe5oqBFBOLgROpLAXZsVe+Or5/NVjzWAsmh7cOcYNNLumG/8Ye9MGIlQP0jh+ezYY8tim2EqiBjYV6Pal1xMBWklmH82XMx6uaYMVGp6gsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5bhfvh0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5bhfvh0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldEe2596853;
	Thu, 3 Sep 2026 07:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZBhZMsWJR6c
	Ewd14kJ/wKqrfE9//W24j1XSK9fEyJs0=; b=Y5bhfvh0ZHbRiJIzxHSfMOSvi6E
	clBsysDs6l699mbFCcJimvQLVLGl57mXjafItlrV7YWI1C5MsicpMTBDTmgFAy/A
	dNOdVRSEFtDw77wuk/Pt1Mo+OtQSKljzj1dcmmihd6fVTzv1hMIz6sX/jidacl4z
	A1Y5C8jtTQF9O8VAzyz+AxhCim288CxfrAO+cGstP2J4XsAIO4WBwF7/UEPjXZGz
	PQ2Mmq0MfPvlb/N8fXZLs6b1ny/lOd4aVKgdsyFAwUJXC4kRGtsLAJQxnNlkdQKI
	P7W9ySrvG+4k8aWep31h+YBEfrDtqOJwmfrMEhmntcU9IwasC3fpGPtYOHA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja44w6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 07:29:14 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6837T65s4174406;
	Thu, 3 Sep 2026 07:29:12 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6837T4OS4174384;
	Thu, 03 Sep 2026 07:29:11 +0000 (GMT)
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
Subject: [PATCH v4 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
Date: Thu,  3 Sep 2026 12:58:56 +0530
Message-Id: <20260903072902.3870009-6-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-GUID: A7jTodSD90QmpEmSrJiw9NIcDcy83G_o
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9921cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=bovOucATokvHoRHO1osA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX9a5wIV2IN8Oe
 yuIiZYS+OexUAnR+uTUTaPRqvfmBNqvHefntOe3FMQ3I6iANWotCJnHZ/YEbnzVFIMg9E9YEsei
 Dv4PwGcYay7GWJjKzMUIZqHmCHy+o8U=
X-Proofpoint-ORIG-GUID: A7jTodSD90QmpEmSrJiw9NIcDcy83G_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX5iX6LhiBJhcp
 fE32Lm/ziE3rIZkEODu7REL4uO2t3Z4QVa1p60OGmb0PcLdY4pebakZsYZgYa20EsiAnHwtiXkF
 b5O3571DghayqCfFjXM4+Sz2Lc8amS3OeE6VDEgH9nhnfJD4dweHEAStqG1E/9g4KyilTBrzZWu
 o2TAxoYx5ozJsMYxf0l2CVGa+WjjjIraFa4Nl46Lw6BOoAu1MxdEt/rTPBfcYe2SuFgRLxKKsc/
 1yF+lLmWUojEa9Hp/o448nTO1ydGJ8i5dtakt3MRwpjg+3o3ZLkbLoTsr2pfBH+Aq+RkCSOiYAF
 Z9kmAq6E8AcWrNp/TSX9HmAW8fTvbVb28hToA2CXYHxYzgbypbjx6eW5vcoeF1trZU87yXwIjTM
 RHv7qiHCSNwikhlEyfJupZrQmvVEVEqcbaYIqhjEwdO2RCo3+d+qSwFDw+FfbtulTV/5QW6Nfof
 IrMau1sY1M7RGjRSHkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065


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

