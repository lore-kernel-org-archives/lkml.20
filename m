Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657842;
	b=blNHrbtvl79n1RM78Jsye40U9cU2Bk8CpJ0a6HeDuFkFAY/pqVk0+yEQUUkOZ5AkC97o
	 0OTG3XBZKAXWMpygN3rbgkSqokLbXayNhzlNG/hSd98uaAFqjFjZg0CIZLJ0JTd7M7N59
	 X09Yb5YZS+yhJDanpCTAfCr0+tOhZQ+N1xnqfqPhvyNk/p5B8GSL3KyveLVWCEDzRyEXP
	 1DhruSP4unMaeX7d+zbcq5008ozQ+v5hotGAzmJ3iJs8ufGjBG+XwAPvbBT2EkdXE4ZWz
	 YUikiSdqkrutZ2yUo/LX0100Gb+xiCwuwq8fiN0HHTtL07LO9kXd4eFxKPGxJZED2zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqp7gESYa1ShyhgTpKBjc6njpBfzpUi5eGSLc6xa53A=;
	b=EMUkOlqXlycArmJhhocSO2lo8cbLAhzO8iLuUe5//dgaQWJiHfnqPCLZiCk8lJgfmZxj
	 Ojpw7lrsKSvvIGX5IYSx5J1q0sd1dWHnfPgqssxG7tDmVPbbCKjvff2B6oOMM9nQznzu5
	 1EVZGjprOIybIQZxdM4t1FA+2iUOeN/tNRg24WSkL/CeXps4uyBxRFKtLQBbvkVPBCsxj
	 08TsoYHCSNazswdF6jQO2Urw90WEySXcXq487S1Tag9Vs7f1O4saTotI9wlf0voyMQJ36
	 LZFnIfUFlw9JZ8Vt+Ty/UsGWMBAKPz7JcwVraCSg0N7rzCDiUCdN3oQI5MR44QcvtUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ef6OMphk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A93606A319;
	Thu, 22 Oct 2026 08:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A93606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ef6OMphk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lnsi3194744;
	Thu, 22 Oct 2026 08:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqp7gESYa1S
	hyhgTpKBjc6njpBfzpUi5eGSLc6xa53A=; b=Ef6OMphkctboh4FvQCToeDRJQhu
	wz5W8cr9Mmqx/jr8TpFM5NgC4SxNeYsZCdJuyBYHuYj27EtWwmuy9k7V2NSkk/HP
	3L2e9+d1t+BBu6nVs+FvBl8LfxA9i6uMSZY532QXhFathGVjGW6emZD8t/3x8fHb
	P+RlO430Xonsiql5RGFK6QFzvpFtvpsp8sP8ndK5YPIibZkD0FJtOCpnTNsYekG+
	cXvOdHck8AGJFcxVTK+QV7lUgbmiTRBRJjLfmIqjqziPYTlSD09yAErEmzbLnW4n
	qjZR+HF6TCZhBBw6nVqNX62skRiof3qofIxeaJZ9tpvj5LfoqDxw0GWzdLg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq01pa-119
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 08:30:34 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7gRhY1894796;
	Thu, 22 Oct 2026 07:42:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M7gQNm1894781
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:42:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id E81B466C; Thu, 22 Oct 2026 13:12:25 +0530 (+0530)
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
Subject: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE format in hw_params fixup
Date: Thu, 22 Oct 2026 13:12:19 +0530
Message-Id: <20261022074220.989787-5-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: DcxiQkEpaXhoyEXV13DellJX-AwFQzYV
X-Proofpoint-ORIG-GUID: DcxiQkEpaXhoyEXV13DellJX-AwFQzYV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX2OVspjdLHuLQ
 0C5Ape2pvcU6rDXypLBSvxXapH8vuwEafEp6nsZE7sJzSf3CQg/jxStowz/zZuCSBjHaWwKxhwv
 gIWIu2u7E+ahQmMS1oU1yPj3bHA86c8=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9c9aa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=zyXLMBzzrrctIIaRqgEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfXzim9te7SllcS
 q0jlYEnFLmpMKbJV9heo0C7Yl0cVYbHHG4EeCZtipj1kZykejkbvzCuLigvU+9r5gpeG/+Ww999
 jdMrPQUhGDEFc+lvc20L7O/Jbq8iipMk/DwOoBus0C9kVEp6Wgdh5EDDXi2LRLIcnzK4LJ0UyMm
 Qutlp5kuJqoWF2+GCpN3piX43jj/FOo3G+etZ+BPZ71gHSe9sZxJfkb/51V1wwH9P7PUs3u4L/k
 xhu3rZoTJ4Dxu+wrRbrUgH1Nqhu8DLzf44ibK+EaFAW0VlJjxTJkzZ06kT9NBq402pVD972dTfb
 B1VwTF6LTR9YVT1+wrwznTZSdlW4VSiFRzzAERvyu+eUByqCO/IUYkTA7lKz64yQq+DkKAEkPst
 x7AOQC1IPfDDp8R9GZrtU+swNSsJzjo55SLXzxnOe3gD+eOl9mRYw93Fp2d56kmlQBTyQnVBoBz
 MtaAVo7hoOR90uJRRpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

The be_hw_params_fixup callback unconditionally forced S16_LE format for
all backend DAIs. MI2S and DisplayPort DAIs need to negotiate format
freely to support higher bit depths, so skip the format mask for those
DAI IDs and only apply the S16_LE default for the remaining backends.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 6910b992d81c..9860a68e2add 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -240,7 +240,16 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case DISPLAY_PORT_RX_0:
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		break;
+	default:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	}
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
-- 
2.34.1

