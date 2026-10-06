Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EA358372;
	Tue,  6 Oct 2026 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271947; cv=none; b=anUg03+OcKzTHeCt2TgjDlYPv3Sjn4EktA2XSpkJnBqS7ZsYDn9I6kwJtGbjOb+AZh38vFJJf0HtHqblFKz0M77Xbr2Ye16+Pn4kR8VKApDzV9t5r9+m/kBwefm6rIfWQuN8S9c6mHy5iAXyxwVQV2egkO1HZRIZJFpOEieJW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271947; c=relaxed/simple;
	bh=PDEN6AnaijauC0PU8mU1bbOm7FwNeqpkPzIkaL6uIRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQwFoSBh+mFRVfyp4rdveP0jN1o6aa4jXQp/UvrwlezKNj6wRxRJoUG2th/t4TA/Ha6LZW83lq2p4Wu+KPGOCwO7gKVeMsdeeBBFwpyPdOfyEORMadNL76DsXTVDu2l3Ak1cV0aUlVbNyPNhS1phjFPIFkM4ZE/pl1ooo8Rxyk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DS3mgfqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DS3mgfqr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gSIp1045043;
	Tue, 6 Oct 2026 07:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7ysb0m5rLUv
	BfBF+SJCD889X1rYJwmBZnMQY+qO6SAY=; b=DS3mgfqr4ebpsLNA7C1fvjbKqtk
	S8CR4GoUYBQn9lDjlq0k/Xnbc03egrEzWdfHV0pJ4ebRAZV3XlKBu9BP0SbBMpuu
	Mnt1rF+xFHAeiTrk0J92T8nwLOUtQiCQ9ubLqDJ8B27vcf5r0SAhA0LscdF1mZBr
	vtRGhAcbfV1qALjm+E7VJlKkO96l52nwF9GHIj7wTEB+JaZIQ4cwvcLD5288sRjm
	Y24mMV4Wv2B3mhzqz5K1gaX0ZgTutCk+N2T6ynh+Qjj1zwoi86aqpgZrztx1N4Nm
	EPlMqT2fnTFhODHu0yyVoQSPPr4Jf2pjnsDlFJPwdoyRLASqzCNyTHqVv5Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g5m8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 07:32:15 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6965bLP2411418;
	Tue, 6 Oct 2026 05:37:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6965bLUu411392
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 05:37:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 15606641; Tue,  6 Oct 2026 11:07:20 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 2/3] ASoC: qcom: sc8280xp: add Maili sound card configuration
Date: Tue,  6 Oct 2026 11:07:16 +0530
Message-Id: <20261006053717.3455143-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfX40ib0Vw1Z6Hn
 OrPeRpQSo22xKjRG191i6Nk7/y2WMMCkdbYvdzn1AaF0fjtlgSkzFaODTW4zMaA1lxJAo4ff224
 Gg/HsrQ2/DQla99pkQIF7xZ9uoODstCXgBmpfqTRts2h9vHszAQbr32QQY6RRGqaxX5j+2Dkdxp
 ScjrmnVAjUQ/mMxqWnO8zyyHyO80TX+sUdH/ktsUOwUFmYLMRLC7mr13aiQpatDmhJj/91mwqt6
 khylLkx2KdT6PFCfG+QmY/lyMjFMHozUvjrw8AhFloMXC1whx94H7Hxb5c5TnaCdkU+iZesIuiu
 Urqah6iUUlhwtAx8gNWFbYiohP2iWtOrdOYdc/keS1nS0C82Qpxlfq8fWsPRJ6W75gVPe2aqsCm
 BJcWhjr1l3oWznwtQ6+AeP9vSUadB/Y3bfzy1kwpGzUFPXD4lMsPskZdX5ADwKqk64qFFyPTA6t
 D61Glzdx9ahxQ7L7p3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfX4Hqspj4A8TTq
 EtPDPmS7RLyp0yAK24ujfpB9vozC68tBP6RBAtqN+hatTJZ8zhBd5v1WCozjNLgV90xOYAXgylQ
 WcbAyuIM/OP8ipG6NGufPX/rYO8xJx0=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4a3ff cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=2q0SpPMmqTH-E8r16rgA:9
X-Proofpoint-ORIG-GUID: _FBres6Ug_8-lvq0MYY3zQ3LdkdJ5mY0
X-Proofpoint-GUID: _FBres6Ug_8-lvq0MYY3zQ3LdkdJ5mY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060029

Maili ships its own firmware, so its topology file has to live in a
separate maili/ firmware directory. The topology load path is derived
from the sound card driver_name, so reusing the Hawi data would look
up the topology under hawi/ instead.

Add a dedicated maili_priv_data with driver_name "maili" for the
qcom,maili-sndcard compatible so the topology is loaded from the maili/
directory. It keeps the same DAPM widgets and enables codec sysclk,
MI2S BCLK and WCD jack detection for the Maili audio pipeline.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index b5d367486d56..b97cafeb8e78 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -552,6 +552,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common maili_priv_data = {
+	.driver_name = "maili",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+	.wcd_jack = true,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -676,7 +685,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
-	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,maili-sndcard", .data = &maili_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
-- 
2.34.1

