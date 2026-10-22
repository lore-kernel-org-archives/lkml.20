Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662235;
	b=ZJbAxQD4hm27I1c2bCUyLgINMBgcjAL8tc5UvQrsxGWZ0FH+Gy7T52laN5I2I/HHC1Ws
	 9/vh/6Jha8U+z5iOWPdY242862mzsgOggr5ebt5l2zOz0rzE+wKTs4ZMLtOVKltuLBAZx
	 FzRcRaHmTqeLPYjzf7S6apUr82J2leG0h6zF0+flQPY6TPMoS59xKgo9DAH3lNmT1YmwD
	 VKqxNgMG5U5o1G6v6hIjGy4HGQLd6tLiYkVuRxT6rskJrADNPIYmZ4ZJzNv14bveg3q97
	 /be+EegSXpxfLRGdaLFuWlhCbYtrg7lsOnTw1pTPtzURsnLG7NeEwstcBUAaxk8Pz8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqp7gESYa1ShyhgTpKBjc6njpBfzpUi5eGSLc6xa53A=;
	b=o3W0IYubz9gtF8laUI+DU9tz4wadp24OBD2sFpXvJM5qDhG2NRRrJLxUg6oO7N5XyzK6
	 Ik5wRPfc3HgZpDnW9DNO2VvOhSLnoLmqMDNviGELzVQfOpqBK9FPu/fDDpLPtdvnbSLAL
	 fQ7JC3R72pDgKqwQMimue9Cnm5qVRNaQlWDsYQ+sDUfz8C3aGwvuqg4GhYO0JUxxDbs7O
	 Rhfa1YNooVKlDHHU23szr86zgTPr2CvpRw5UFuJZDTrMJhCVZHpD5JGoxrIREkG3bWwVE
	 gAHMc/nXoCgdfcETh4QE/tV51a42JrAC6tVZxn64ZT3qVmrF+0eYxf0ct1r17pXmQRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDONrWlA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234AC606A31B;
	Thu, 22 Oct 2026 09:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDONrWlA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LoQk3194761;
	Thu, 22 Oct 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqp7gESYa1S
	hyhgTpKBjc6njpBfzpUi5eGSLc6xa53A=; b=GDONrWlAvDKDjeoK7xVmXZc7Q+u
	4FGVpYQ7eOSe7wMHcj7itOpkbZseGHXYofbwC3pmIAHWhkhTQninWMmE1fgWPmfJ
	AMyI+h8l9LUfUBG4Xn5VmRXLPFWr6Tr+CCUumGuoU6sITAhJz6HZT/x38/Dhl/Ax
	bCeJT0rEyGBHxvOyJFQWxMOIN5/z3yeNsmi/A5ZJSLBvZmNZ7bzNUVPVSfWItGGl
	nD1cTRHW/72YHkMQZjgg0tXGWF0Ab5PCds9KiDneN1hemyi2y+2rWa7NWh94pL+H
	iLMySNJYEiBDdpVuxKyUi91QsLFjWo3X5rlhDhU+3PKANMPP5sQC1kPcfJw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0c85-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:47 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hdKm2064296;
	Thu, 22 Oct 2026 09:43:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hi8c2064366
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:44 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id EFF0C655; Thu, 22 Oct 2026 15:13:42 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE format in hw_params fixup
Date: Thu, 22 Oct 2026 15:13:12 +0530
Message-Id: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: qDJAZlVmdcfyYk_ZInSCnYDxEmMy6HFA
X-Proofpoint-ORIG-GUID: qDJAZlVmdcfyYk_ZInSCnYDxEmMy6HFA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX/0i0ufOz5kZQ
 SctcnrGTi5e4OtXyiTX9AkyrMVDgJMUIsl4BYpgcop/N+85U2+6+CssWANm9JpF9RNaRKoP8xNg
 7HmorbK8JSHl+lG07n2mWQMujqrzBSk=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dad3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=zyXLMBzzrrctIIaRqgEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfXygTqxwXhU2/K
 uGKjWatiliR1Fa0kibwypvHQn1+dgYuYvYQI013PrCP+9Aj7Xcm+OPRzubAuSchShyMCeKBxRVV
 dYF2uchHR2gkGf4Y96TPTe075muuAk1C7m8vblx6alyPwGQeS9CFapfNCxfVGJ3jpRvnJBrF9k/
 rmSNoZq2kFvsIn4VJrpNxrFAM23L9Ecu16J+GcHhQv5ccePGycJ15Gq+aC0Xt1OqYc6ygx/2zXY
 7smhSKE/Un5gGdT6q3QlFlS+NNvFNbg5mCB2O6V1I97q63/5H9tgORokm2Jk/RxYDNMVH/YC0E2
 g4jsP6jAx/T0zxFRqyutsx5++VTkG5fVhQ4IvOWBpAvWzKTYXkoSGl94vit2MPQT4X4gx2DZ2st
 2bO/oXmjJWkfdhNVOyCgF1/UMs3hP3u/qqxaNOoAe+7hA6sNq0VMfonwxF2QeBIXIuCwZHZ4MRD
 /trgEke38Tp5oOJZy5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038

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

