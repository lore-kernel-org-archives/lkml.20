Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668478;
	b=I18LqPlt/I3dGB5lKfnOtxMd98yDuEkQ9YwSbcHHG6+XDrSIx44QHH7lwj4waxlthjJ6
	 /ujnVLt6+E0oh53+YuKQnVykysr83BGLyH10KdqCjtkK93pUpJnDjLU1nXaT6szG1bXij
	 SNYMcNYJdtYm/YnwI4i0vy00v4tcpGZK6ZalL6BXFVQAiwf3QG/mIL8IZiXJKBZA+2l02
	 gjpT8QusyO3TFqytUE2R1phLlfNHui1NYjRvelsq39gqbY6vU9ZZX0TBEze5uGE6jssZN
	 UBkOf8Umz2fixaDM9717v9oFgmUSSWBtQR8+rgppvWj1ouUK/2Kz9UEHM/IXVPsC1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMYP8ijA1WpgdLtyfabSG4b/YDwMHHYnoLHhmHn5e5c=;
	b=fxC+EfzRamnH586vaO0Z/mLOipuuBCVQlzqszuZxQG+KdcZom33e382g//B6Pd5eMjmh
	 PaCACGNjfF9FgjqwHJwYd9IcLKh9rB7Wo/jyeo61bUPPg4EU+R7YcFG6jEQqCTcdpjTkZ
	 YLwmlo/sgjYVO6eiT1Nr7gI4Z9wxndpTAz8V7giwy0TQmAuMCbo2Y6ybLhP9835u9vkxp
	 jcbmITs7NsXJeMVwnrHjW1CRQkQDoN0QbaJz/tLMzQtQ60pjiTKo16kB4DENRMcFpB0Ft
	 OFrKKXZkBwaByhQ+6+1sAp5US7ICyRrfTBvS6V3W6LH9MAo/ftKRorZ5bgmcmWND/fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PB0p4wec;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416B606A319;
	Thu, 22 Oct 2026 11:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5416B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PB0p4wec
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA07If3427109;
	Thu, 22 Oct 2026 11:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QMYP8ijA1Wp
	gdLtyfabSG4b/YDwMHHYnoLHhmHn5e5c=; b=PB0p4wec7sLzxQMVZKfCXz/YLRJ
	4dc0KviMAqEmzcfDcGjjaSrtxAzwMQEW8YJkJYhfTiCSF4vnK/sQ87bnM26/toBm
	2Btrk1rynFQh0xDyim/MAWMe+X27bFUcIeLAK0+1k4Dkkpssery8Ql0RBvR9WBt7
	2rb0QsxWLuxt7QK1L+1nABVwzJhr3hz+J9NTWk92UkMV9FecehsPal8GACsMMsmx
	Q/zYNRND1WH1KbYtcDRPYah1VF6mIJ2mmK0A/Ev7N1FOajcHSgWA7S9peKbF3dll
	uHl3PbVFHk3DM/5cWqWbMlUObcdGrUaQdI2UtyGjeCjbHdJojyhxWiVcmGw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq1a4q-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 11:27:49 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hdKl2064296;
	Thu, 22 Oct 2026 09:43:39 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hdAO2064286
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:39 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 5C22E655; Thu, 22 Oct 2026 15:13:38 +0530 (+0530)
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
Subject: [PATCH v1 3/5] ASoC: qcom: q6apm-dai: Add 32-bit sample format support
Date: Thu, 22 Oct 2026 15:13:11 +0530
Message-Id: <20261022094313.1074873-4-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: XspQ2f66aXUmJ56UIIzG4lRogEd0702N
X-Proofpoint-ORIG-GUID: XspQ2f66aXUmJ56UIIzG4lRogEd0702N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX4tGcQQ2JwHTA
 kwJOoGjHgjRF8M30d5H3bByMybMxUJhadf+I7uAzohRCYm/+Qe9CF73PGU2LwTiIBJ54r7D1tGj
 06tzGJX+8bpZlhTV4MtdbIhLuX1f1ww=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9f335 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=0GeEMZVGUYcv1euD6hYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NSBTYWx0ZWRfX9zp6NQvQmptL
 LFcCe9L9iOpxJkQhneKftQbxHm0szISJOKH61JNxVAnoUOdHJjjfWEv7vK9YWFfTQZWXUnQIrxx
 Gm/64+WIAjlO2wXDcw6VYY6B+sqtOlT8Y87eJitdc5czar5VmJnatwTtbQ38yuMjqrWDc2dwUIF
 4QIRv/pNvt+ZyoeobeuQl36QQM/cWpJaLS+2wprbjRWFGeraS35H+PAoC7nYakjpw9iPXOVtAz7
 lIPfxrNOpFfE96DoL20X3rFY5ax1CQkikvJ8MNJ5at1q8exvfm01Ycew47zdmplyiTmkq37IANV
 dAxcVscCGxOuON6T+fwpKaUE3zgjpfg0aGU0KP9/KCnWOBJ9aijvelrakzhB8IUZ+J7h0LsuaAR
 0aC3ZfR4vP7esh9s3sVuiQQiz9iwdb2v8rDapbtF4nXtCpmHDxaQ+W6lUJRRTYkp7niDZtSVf+1
 UXo+dja4b80OdmmNmWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220045

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

