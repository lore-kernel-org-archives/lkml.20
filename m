Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662257;
	b=WmTi54If0FgJ9DfhQK1lZCft5TxEW/nH0W2qCfJy7QWLZYaiiTOZpfq1csOowLt0iwLy
	 /GnqhlDCLBABWw2DWml2uTX5Sw9x0G0zivo/SOa0yfap7MKM4wdDoYR+gPgqDqxzAm3wQ
	 LwsYSmRQNNKWD4AbVOBVrm1J+sDSFJFSrUxtB+WlTqKB4CD7DnuBs8/ZBJRpCKt/lmO97
	 9puDgqcA5g9ZuT6PS/jLd59mGE5BkX+0Au/4xnBexYWca37faXnfvs7v3QjDPDiJGO8/I
	 IGjv5bHDTxdvFYGrxyY+z0O/NMALBuqGb+wSn50UuO7CPpo3TJ/9YeuWPSWf2iMvBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMYP8ijA1WpgdLtyfabSG4b/YDwMHHYnoLHhmHn5e5c=;
	b=E1YztvlshRRJLdIkq/gEKUCIyYRseFJGZKv12F/bg6qUk3wwYv+nBbsGqf3nxg2aFhF/
	 5rc04RS5DuElNWuL+ufumxRKQiqcZKzDvd4OSVnasIyPqRMGWS1vzVs89d+/mbd1EQ6/7
	 yD3/fR78SYI4oaz/TRcoeiuw0PfAMa00cYQy3jEkIEP1CWzBMxHtIeZHfK+1QFjHGtW6j
	 T7GVgopeCfnS66ypUQiEqcID34zPvb5RoygWOL5jSlFaKjVaHNa0M7c8zWJBj68OH2mix
	 KZySjc0SHERkq1+ZugtpTVuGwqaGJwZHO3a8cbsPay7522axHCni7xCSat7zt1HMrlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq5gZEIk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63F606A319;
	Thu, 22 Oct 2026 09:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C63F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cq5gZEIk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LoR43194761;
	Thu, 22 Oct 2026 09:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QMYP8ijA1WpgdLtyfabSG4b/YDwMHHYnoLH
	hmHn5e5c=; b=cq5gZEIkEE9Q4T92glONakzhZVapGP9iUBGHH+JP8HVKzQHWcjn
	5t8e8SVCHaAlhwWy40IBHe9h75bhN1WhUFKnVay7WJzKx5up7efVpvcB2C+90FSs
	H6TOObPbhCqn6PZcER3laDf7hEb4jFLgbiFcGFWHQ+gXLYaP9ZB2GmH/t+zcriL9
	/3nOM+jKhQWSNKnMqcqQ3+uy1GRKPZkk60a0LAEC8JmzTN/G8ZbzS2J0oRUanQWi
	EZkSemlRXjor+BP2uedHWf9IMcGb/Q8REQOHjY3PoTADBb06oAIET2fGWAgZlwJN
	ktwuOVPUsxl84JJ4AWlQtnkho9qPvY6xXjQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0c4u-60
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:44:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9GchS2029604;
	Thu, 22 Oct 2026 09:16:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9GbvY2029594
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:16:38 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 0777B655; Thu, 22 Oct 2026 14:46:37 +0530 (+0530)
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
Date: Thu, 22 Oct 2026 14:46:21 +0530
Message-Id: <20261022091621.1063237-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: DU5BWrGgEJ3v2fD5tEd7CyJfCfuaGJ-C
X-Proofpoint-ORIG-GUID: DU5BWrGgEJ3v2fD5tEd7CyJfCfuaGJ-C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfXysH7OnluXZKj
 3CGN9Z/xUdAzm4KBdu5zGU3yMN6hFWGco8g+FoYo/VMdPPgECIZyIi21myWPjVCuo1WFsUTpsJ2
 Q7LDpASD2TsoHhQfWGQ4n8x7wnxOWsI=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dae8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=0GeEMZVGUYcv1euD6hYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX0g1QDGAe6Q/T
 OBlf5tLzTvbroXL3vE8HW2Q7n57A8D2zJULB13oGRtbkkNXXMQqSJ/sx9iABPdtf207P8+7kVpj
 yz10F1sB6xp7Rzm9bEsy9KJwcVmmbGVpJ6+9TnMLWQwkkdv0Ijrjv31KVdoV2YWLIFZIcENRsL1
 xIymY/eELDdPrjfFVwdTlt8OJVd/hUKvf6UVWxY27XpnOALB3PE8tZiZQ8JEFpLryLO5j55ZR2u
 4/PTR4L3UYthzI/5sJzPwuPDs4GEI1Ni5mnyzcH52T7L0V7XpiU2erkCiRKtZoASWXmowapWKUr
 j2aE5a/RyvammxvA34sE0RDuw/AKiL4eeIXz4EbOV4r6uWERWkmyCAG4Bamzc8Xdl60JM6s/pBn
 Otp1HO6TLo7Uth7BUwPG5JgzzTomZeoGbUSfzESNePWGNal43brRpHXGd+ZuWI/WVuFobUg+tll
 I4QTJXf+sn87s//ftTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038

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

