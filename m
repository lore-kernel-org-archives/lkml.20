Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703154;
	b=x385oFXeVFhMaCQaj9/r3vMtpYRLTsiOYcp2a6YuZKQVehY1m6hUMQR6CzYU+958zwOy
	 chSFhujR0EBem7d3wSkA6+AvwyDBhPPQd1CLJc/g1VuDKUN5MUK/Cets+qhbloJCZX/oQ
	 vjtL4mz5z4pejR2wJcyEEsUbZIDEmdS9/7gH4phGBF1Z+g+rcMjWXPCMB8yguNE3qa8mc
	 L34G2b0BE0E6A5HErUjP/Qvm/PBTSIhQDOGnjm5SlKMcj4mEnBAPR3oYQ1+DOCnkd0cGr
	 VnrGBHQdn+jLlGulRk7b4S/dEZ+pziowcWBwGk5X4yJlnHOc4kp1qzYN006nBzj/epg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qEy5ltw6jOyv468LbQnSyZW5ZFllBAyvgrz77H+x4a8=;
	b=Zi7Fpp4w0OzhzAn4i0t+V8FJCwlVCnbYFluWFdxauI07Wt5Q5j9CrbiUtAqPKbUifa4D
	 DoPvhNIYdtRcfwhFwRluoFfSmyIX2g6VMeKHrnvfaMtSAm9TI8teQRhlVscY/xY6Gxd4x
	 Wn1TQRtaTwobzV72KnrPLsxjaXVrbOMGmT9udBm+PdilzHjLp4CKUplCGi7IohRMkCVB1
	 yJVl8s+P5Sb9X6+7PunFGXXKiUyYCd3oQqaC3lnC25+L4cQ/iPfW6e4Cj+o4borYhMTsb
	 /omWiugdI2CCalNCbW6S7IaDAKVBDV5r/cUFlh2FoOMxkjZMSOD5GI/XObFsnMqnSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P9BN/vkM";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0212606A81A;
	Tue,  3 Nov 2026 10:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0212606A81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9BN/vkM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAoSH928175;
	Tue, 3 Nov 2026 10:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qEy5ltw6jOyv468LbQnSyZ
	W5ZFllBAyvgrz77H+x4a8=; b=P9BN/vkM2R16Gv5sVLEcNlmMM6/Y5esO2IKvxl
	E6jxkFvKAVziSk87wGooyQLEzV6mgRtE8Bmf4ceC8Odc5BVQUDIkqSg/GABIUN7U
	JimFFIKPxEonSH4uY0VeLFUnkdcdQzZqPyerZD8v3hFl/78WCZcdEJga/bIzgif8
	8iRZKcnAOHUd53MG2zU447JhEWOlsL86LAbJ6ODsjoQV78T9kJbWy1tjmgNxXOqG
	lR4MbzcMnww+T5HxXwYw0KzrkzBght6j9kZ4+I8oBxhLKxIWLDNGW8PclPMG4ISO
	FRU+SUsilz29CsMDjJFsL1hgPmZTg9MuszV+psuryR3PfVlA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekbvb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 10:52:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AqPTG571772;
	Tue, 3 Nov 2026 10:52:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-visr-hyd.qualcomm.com [10.147.247.190])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A3AqPx6571764
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 10:52:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4111776)
	id 5B44864C; Tue,  3 Nov 2026 16:22:24 +0530 (+0530)
From: Ravulapati Vishnuvardhan Rao <visr@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 16:22:20 +0530
Subject: [PATCH] ASoC: soc-core: Increase the channel map size
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-for-next-v1-1-ecb1348f5941@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOO86WoC/yXMyw5AMBSE4VeRs9ZEqzTxKmLhMjgWJS0ikb67Y
 vkl/8xNHo7hqUpucjjZ82ojZJpQP7d2guAhmlSmSimzXIyrExbXLlQhdQ4MRhtDMd8cRr6+q7r
 57Y9uQb+/ewrhAZsd5nVsAAAA
X-Change-ID: 20261103-for-next-25143eed7477
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravulapati Vishnuvardhan Rao <visr@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793703144; l=2839;
 i=visr@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=u//ojz9Yufyu/uL+n9G+DkvUhOXUOkfa2iKt+yWtb3A=;
 b=FLcTe9FmHsJ5nsffA93vQABgwmWa6RGXEst55btV4thHml9z7oHipT0BFlsu5nlVp3SPpB3/d
 k0DEed4dgElAe8n0VZ/3BzOnzQNaNV1pNLZCpCB6V9RjdiqpQHQ4GjH
X-Developer-Key: i=visr@oss.qualcomm.com; a=ed25519;
 pk=GoDnV13dWTslbCatMEeEY9AEcT1eIoUN1ommOImG20s=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX/MoBw2f7L8q7
 U9deTHs7mUqm6QUML1y0zwMF7t70OBZRopoOgteDZj/YJQ0H0pZZovDuMzRyFaBV/3YM9RP2CbJ
 qeeu5yFxsk4VfOT1h4lNFW2CjFdWXClyYc/NN4avSvV6fwhgA2XFLBycWEFaYHckJbNUVG5OoPB
 sztY5odWOQ+vKZv34od0IHlHJSqYl65Y/v617lPynwGhGxf7kkuBJJWO0K07Umm0/0VzC4B7xBy
 GvcoDj2G8Q8kGF3cN6jdQdkQtz+/1VHiHfePazEP56nvw2ge6BjGJ2nW3JYyurt/RMbcaCvYIjL
 W8qM7Gt0fo959XJhtotJ64oEj9EtssHyQNhQ1sBMuC0p/D7RlgZSNiabnZxUk2LOORgaYfAhzye
 J6IvHAKnsPs2jcu8ZM9G78bjAp/xhJrYkooavmnHg99l+PfW9N5zpyqWsqUsXUQPotcOdSaDlAF
 3nLi0JBbKqt7z9UMwUg==
X-Proofpoint-ORIG-GUID: HGZb5sTiM_RZqUxUMoUw3_IJzuiU7_On
X-Proofpoint-GUID: HGZb5sTiM_RZqUxUMoUw3_IJzuiU7_On
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9bcee cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ay8ZzO_LnnA4frhq9ssA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX+zugDiz5XVYx
 LIVhWBzZnC2E9bcoFz1JAiarlC+r0aljQ/VrPab2CoCZ8EvTi+yY6WbsIpcT7BEGtcV1PJTw2le
 UtLxZ6l5aCPUzEOiFPHWgiJutHX4xM0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030043

As per the need for new OEMs it is needed to increase the
number of channels size as some of the OEM have ten mics
and one speaker.
So for this it is important to make sure that channel map
needs to be increased.

Signed-off-by: Ravulapati Vishnuvardhan Rao <visr@oss.qualcomm.com>
---
The ASoC core currently provides default channel connection maps for up to
8 channels. Newer OEM designs can exceed this (for example, topologies with
10 microphones plus speaker paths), which makes the default maps too small.

Increase MAX_DEFAULT_CH_MAP_SIZE from 8 to 12 and extend the default
sync/1cpu/1codec mapping tables accordingly.

This keeps existing behaviour unchanged for <=8 channels while allowing
larger channel maps to be represented by default.
---
 sound/soc/soc-core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee..f5660245f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -859,7 +859,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
-#define MAX_DEFAULT_CH_MAP_SIZE 8
+#define MAX_DEFAULT_CH_MAP_SIZE 12
 static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
 	{ .cpu = 0, .codec = 0 },
 	{ .cpu = 1, .codec = 1 },
@@ -869,6 +869,10 @@ static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZ
 	{ .cpu = 5, .codec = 5 },
 	{ .cpu = 6, .codec = 6 },
 	{ .cpu = 7, .codec = 7 },
+	{ .cpu = 8, .codec = 8 },
+	{ .cpu = 9, .codec = 9 },
+	{ .cpu = 10, .codec = 10 },
+	{ .cpu = 11, .codec = 11 },
 };
 static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
 	{ .cpu = 0, .codec = 0 },
@@ -879,6 +883,10 @@ static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZ
 	{ .cpu = 0, .codec = 5 },
 	{ .cpu = 0, .codec = 6 },
 	{ .cpu = 0, .codec = 7 },
+	{ .cpu = 0, .codec = 8 },
+	{ .cpu = 0, .codec = 9 },
+	{ .cpu = 0, .codec = 10 },
+	{ .cpu = 0, .codec = 11 },
 };
 static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
 	{ .cpu = 0, .codec = 0 },
@@ -889,6 +897,10 @@ static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_S
 	{ .cpu = 5, .codec = 0 },
 	{ .cpu = 6, .codec = 0 },
 	{ .cpu = 7, .codec = 0 },
+	{ .cpu = 8, .codec = 0 },
+	{ .cpu = 9, .codec = 0 },
+	{ .cpu = 10, .codec = 0 },
+	{ .cpu = 11, .codec = 0 },
 };
 static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 						     struct snd_soc_dai_link *dai_link)

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
change-id: 20261103-for-next-25143eed7477

Best regards,
--  
Ravulapati Vishnuvardhan Rao <visr@oss.qualcomm.com>

