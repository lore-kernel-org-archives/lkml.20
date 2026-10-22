Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665482;
	b=Vq61KUD2MIMn+P+MJvWNuRWLSRpFDwskwitbBxcYZcmIKdDvUrixqHxisa3OBCaNI1Bo
	 vvMNcw74zqMRvCOEqhCdZVKfZlLjqIDqI68fh70MGWZyVkw9yySt2yuVvmBFN5dZQzVXx
	 7uK7F2Y41MVvWW4jG/MAentaaaEzC6spFtFBh8ZEv+nELtZvr8XXb1yNAbJJVps4Fyu3D
	 e7gdvDjC3JajxNzyGRm0fhL8/yHYxRZp/1EIX7jexHMbgc8m1tOq6oXnbjAIWMlU+nbRo
	 qkn1l5/U6JTVEnI1U3zA6ZhZKACQE3TAhZwCuIzYaBa5OgMHV1CJSl5STRy3sz64DrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMYP8ijA1WpgdLtyfabSG4b/YDwMHHYnoLHhmHn5e5c=;
	b=IwrShHCwjdBptShNs6N+Q5HcbnrBngLzs7juhmaBdqKBDtbBvxUFOXzpFXmFhhl56Cpb
	 mYQ4/KVDPzXLa2OB0uppFnqcw8EL9G9+JNrp3Ldu6DmQIOeW58Anm5cp5L44MdI+1phtF
	 oZNkmTSD5/lXcl6I2GmthVbfANUrrP2imTFIzdK7wf0odEP0XgV3MmcYmULG15J3fkUbC
	 hT0ZBoi8p/u2yBo4TnNOKNcC+V+JqvM95a1ePEZRcn9/MqU1VaZcdj0a6AfUMzNcBCdtG
	 epm/E9n218ECvP9EWG+qAh/O1YhRbFONEgS4sY/KUi0thWuiKiUSjF5K+t3Ikj2PD3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVsmUhpH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E9606A319;
	Thu, 22 Oct 2026 10:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512E9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVsmUhpH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA052w3427058;
	Thu, 22 Oct 2026 10:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QMYP8ijA1Wp
	gdLtyfabSG4b/YDwMHHYnoLHhmHn5e5c=; b=gVsmUhpH7B2B/l4uXwDLZSWnA3n
	Yr1lzR9Myitx5ULPo0nL6DmtFieEMO8Ka+p8HLE040lytlvO9nbNtCRN6Hx41ULn
	SQgSKta1EhcGtyGGaSqJrSzdy68HOHGOmBnW4aTrnqeyr9GXcrc0+JYCtFRli7gZ
	eTUxvRtO9nrsgQx0U0WapjqNCWLdjPIu7Vc2XlSLwOqUOH3Mx1H8lyM8rSPxaQDs
	Y98soacGpD/UFj7Sz7W89zZa2DRS0FiMRKoXvTr9Qh29gt9AY3syY6dWpgfFgA3y
	VTY9oJcUXXRA0wva1xHM2hgjH7w3FuiCAomAdPODGIqab1iZFzaYEg0dpZw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0shy-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 10:37:52 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7gOqq1894732;
	Thu, 22 Oct 2026 07:42:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M7gQLv1894759
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:42:26 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 9F5CF67F; Thu, 22 Oct 2026 13:12:25 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format support
Date: Thu, 22 Oct 2026 13:12:18 +0530
Message-Id: <20261022074220.989787-4-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
References: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: KDRxDxeBacy-lNKRwNC2xqI6r534CZF8
X-Proofpoint-ORIG-GUID: KDRxDxeBacy-lNKRwNC2xqI6r534CZF8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX4DeKHgvdqOaw
 RXBoCaDw10BEWWbCFQoUU4fBlkB7YRtkFOyM6AGHQm5VOWi0CEnQICrTV2i7vdwpRsrRPrFF+We
 hs/26xByzio95GcahkRXmfe3jQQCRqo=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e780 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=0GeEMZVGUYcv1euD6hYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX4vwPR9PzFB/4
 8HF40z05b+NPd7X+Z1iRYj2XJL9mDVdB8owBTdHgcOxQeEdn3lWbvh9gHCTgUWWWJCWZz/lo6g4
 EG9YZXrSMtDEKdnl12PzIuB3M30+73pPR4Mqfcjtx4Z/KPpsN0d2fIiCPVp9VRdKyKgWIs+WI3j
 mRLbzE8G67LTgRlnuTFeAWClZkWY+EGVciiyvWrHuUjyc2wdWnAjcUMXHQBYeIkLI+vurjaGLUT
 My9IB46JDfKM0zUc0LWFBCBV2jF3sWEgAzsdc3dCyKA3Jm5H0wqpCMCO25d/GA5AiLuHK+JPW4B
 PrXFGX+5GH04dacxqn5QNy3UMY7KpDzNdVSDa+OqxPIM0skrT5RimZc8xqpnGa2e0uGuZKhyJ7b
 l+0FlqtYLQUGv8HljOyWDQbx85uB1347yxgt6+y/eAEO12Uqx/fcJrBljKIClErRhMYTxIacaiy
 E5+EG4OK3u/vCtZXI9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

Add SNDRV_PCM_FMTBIT_S32_LE to the supported formats for both capture
and playback hardware descriptors, and handle SNDRV_PCM_FORMAT_S32_LE
in q6apm_dai_hw_params() to set bits_per_sample to 32.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 033197bdd870..ec9ae2276361 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -93,7 +93,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -113,7 +114,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -522,6 +524,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

