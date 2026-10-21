Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578362;
	b=a5daT7ux8WFi5SnsB8/jKtxvxa52VbIQi5As5R3ogult+m/jMIXWyEDMhIFq4D5Yn1YH
	 BdDqzag5SDIFy5DjiyIVzTP6oWFWTC2mjHff/F3jdUDHCHEFzIG0POmKPTIzeX8P40uhI
	 Pt4uP7h36Cz9GlWIgaa58dZFFwImnVd1+UodimYgxSpbrQftzxt5cuc41H+auNR87xvgB
	 rJ4gFRLpauRKFGa66nEe+ALv/Samafg1Roc9s1pXqkZrGHM4WMDdqIOPNzn+U3EgYlLK8
	 znuHDl28V/Dq9JJz9HUxTOXJTCkhSr1j62l4aeqdydJUbKAYcbFxp91PIKkexyiuDEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
	b=JK4eTFcwoWphUQAXfI8WUJUX6RUrFHQyCOKFwx4QZuPgg2xnGaoCkpS7n7jpjMNyaPW+
	 F/ohSTHMAmZs7hknBaxF0xsaezCpmM+XTmmngKApz0tBWNZj5+VGqBGzzFyN93VAl4JW9
	 GNC2tSTw6wX4tvjuvxPlNSOn6Lp/v1AcJed46Xl/87BYaJ5m/aJFqBKSDfdPDq5CflZCy
	 rgpmTwxHFmB+sfG86D33wvvVyJJQcgdWPk2lf3sWz+RRRyVzEULC0Nw9jKf7n9xyBKN/w
	 nHCkxLlrzdFkd3MaPflgA+aRHb3656e+kyKLIgEuOLSxkzxhG+fXwJZn4DhKIY/WyLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F59606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F59606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bik8YoFl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ggFU42aL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5XS2335069
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/
	QzH1dAKk=; b=bik8YoFlOy/6XUIu3N7Ncy1snVNmCBlxPWuZg+YgaMIrbxnIRCJ
	Px3O4k7KKJBF0/HrSJlvvdGLtwUK4zyIvxKZqhMVotoDsAB+bVIwc+OYyS/eZik9
	y//8ljVNRmMogcsLYw6ShiKAxd4/sBdKigp57ZZWTrvLwRas+on3xcPzw7yMquxQ
	IJoIAQiy1i5jYeMFBIznEyMksNLP1Flt4kN5Cb6T8K0acEhShdJwhoZ9F26gSPlK
	UIVD2/WurYV4+6rQbEaDPKdbnDwSHVvv4Pb+MOz4hxuhwRxy00fCR1OB6NSEpoMR
	GV948w/UknOBAjAhSbmuv40B+RiAsvk+ZEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj488ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:26:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so5205075ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578360; x=1793183160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=ggFU42aLM7U6CZwGVFyMGogFmGxCzqaQrTUtYUQnfCLgdFe5bTQxp5atbZj33GNkGt
         AgfLxkH5H/FhMLqjfmr8QOhVXnT3FBg9TX69WU7GEGG6++gduAwmFhj6LQZJyGkvn7y2
         HgMi9i5WWFr1Zppd48lV0k60j6QHP8kz28Ox3QLbpagQ93k436qU1awr+ikFWEg9epB0
         N4Xe7SGuRwXYPpz9mU60nwgcNkZrDlCKexZnbQDRMl3cXpoHcpb4V3SxtZCSXankwm1h
         T8x/PzOZl3tYpfkQIvzPT1Muc28XWkIEAdSflwSAQklo7cNZi9tkMkm5YahYj5iME9U0
         5Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578360; x=1793183160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOWhiVv4/ocmTJM5+sdl3qxjdlmJ9j7CD+/QzH1dAKk=;
        b=dBSgcem4h9prfCxHF1K1W4rILXPUrXYCztZKSvxsyphN9gFwG0rtgDXDbSsdpwUMGo
         Z01Z4j/n36Qvrwgsgc0m1AHJukrVDyhHX+vI9/aA8osy8AD73Vf8l9CmipP+/lTMsfrr
         gFlzWtum6SMeNLV+LjLYCwFepNrYeqdBfPuGscRNems4b6RhdOHJJmtzxs027xcReOqT
         6EGvzbJmjJ2DD15xzC0JXhrs9tsp8OWdmsJ5z1B58ghn5ctkNV7Xa4GTfqKJTlagyBig
         IMAEeBStb4qatynPxOw6magvVilen97oVharN8uCyJ5B3Wy9So1FuLYHcoz7h7BeT4sv
         9evg==
X-Forwarded-Encrypted: i=1; AKwUvBzgFtz/Hy+kDgGt/t4kBkaESZkHrnOTbMEpHsxW3tTFZSlJb3+e098NeMYsoPoEa0vOLmPXIyfaVKo5Zf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPIYqEaMnV2d1cwp2trEbOxq0JLMRb4J2Emcq1F8bCfF+6HyoP
	Obo6NIC0kVYtWMgOaQm9XRE9EIsR+glmpoIDLzmf+HPMgea87Eiwq8zx1LrH1mbixrli2Fb0H4b
	Fa9FDVPZzZXhDbe32YnzQmM8hkCbOv9ynboQDaXOux4s4aQJUP3bDY7N28RJCW3k9eHo=
X-Gm-Gg: AYBFou2T1x1Y4tmZsQ9Qh+0hqFTSgPZILcFNWh2lH5ITMdNolz6d8cEfxJXVONzQmFJ
	z2Y2cuk7vWVJPoFKkcbSIesSZrFdneuvwH8IMhV64qS71DDP6j/t9/n++6u6ZIkHSiKvXtrkwyH
	mkLptNGd8jw4I/0lQ8v466feJM/klF15sVYHsAHSEIEdk/WwbQbpwPoWNOyxW+wvZVcPjiJpwCy
	OERX+S7PHKBbUpiff349CL6vJMWOmuLPSwxmLOYyAgSgtdEGIzRYTMH7i64/ln5KkuBfa5tfdgW
	KT0S++JdanrRcy9MeaS8WC+89Z7k0boTc7bQ9smaevHx5Sa24CZ9yjpCsm4M2ynjaHeglBi2aVw
	J1SJfG81Pns6tFT6hNZrLKn4u+wHj/0M1QninJg==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804425ad.23.1792578360187;
        Wed, 21 Oct 2026 03:26:00 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea43e4ecd0mr10804285ad.23.1792578359720;
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
Received: from QCOM-yK68p0sug9.qualcomm.com ([114.103.220.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm9605915ad.39.2026.10.21.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:25:59 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Wed, 21 Oct 2026 18:25:49 +0800
Message-ID: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: pqurbhp9rScHkXfm5TpHt4OTtVadwKW8
X-Proofpoint-GUID: pqurbhp9rScHkXfm5TpHt4OTtVadwKW8
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad89338 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6v2YnCli3sSGVZrDHOWw5A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=R2DrIqMIi5XekuKKXfIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX3Sw3puqLASNn
 yD8/KyJkE/kMMkjvXimPxK2Y1oq487jjj1o9cfQpk5mDlzwayrECjToCkQNYU+B82rTKtDEuybJ
 F4042yDw5i7vBE98G+smKxVXTBuQwqtId6OJCFyt5RCgDkzNXMj20daUDw6L9hb3DvRppqaGbXf
 575FZAnJSapu0ElkDQ+CftC1rJF4IYOJWsmNxMwDHcI6m0Xp1ZlnLSbrkX+//QFrCamtdWSqGRp
 dyEauoPJUUmowvQMiheZ/ajlvT7nVEhPdexdgVxmM346ayv7MQPmM8a/uouC5g4ItxwvyRWMun3
 bjpUJjJgjZQKToOfp2tJGAGADIcyIdPQL9Rc/2fZfAP+GUkoSqyZx6clNRxwjtE989jr1ATww2o
 A4gRb1Z0PLDE4XrdVWBaptKk3DCoj9Q7+7YOzjpFpHKGQYcqsVD3diG8C5m6adUiEeRNqKjjX2Y
 gUzp+/SKmZUUMu6TAFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX9sPXBpkW5hAv
 IZNhnA9aa4Ks0DRYDVQnGa94kXBk+HJCv9cnwr9YHiGK2KbFyxjnAXK1j1LlMY975V/YWo+ZtRx
 ysmMEXJINAeF+nQdu2L81j7tr+91aWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

Extend the default channel map to support PCM streams with up to eight
channels and relax the PCM and shared-memory media format validation
accordingly.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 74 ++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..626cfbca79c8 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,20 +308,70 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
-	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
+	switch (num_channels) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FL;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LS;
+		ch_map[3] = PCM_CHANNEL_RS;
+		break;
+	case 5:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		ch_map[3] = PCM_CHANNEL_LS;
+		ch_map[4] = PCM_CHANNEL_RS;
+		break;
+	case 6:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		break;
+	case 7:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_CS;
+		break;
+	case 8:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_LFE;
+		ch_map[3] = PCM_CHANNEL_FC;
+		ch_map[4] = PCM_CHANNEL_LS;
+		ch_map[5] = PCM_CHANNEL_RS;
+		ch_map[6] = PCM_CHANNEL_LB;
+		ch_map[7] = PCM_CHANNEL_RB;
+		break;
 	}
 }
 EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
+static bool audioreach_channels_supported(u32 num_channels)
+{
+	return num_channels >= 1 && num_channels <= AR_PCM_MAX_NUM_CHANNEL;
+}
+
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  const struct audioreach_container *cont)
 {
@@ -1185,7 +1235,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int payload_size;
 	int i, j;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1275,7 +1325,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	int i, j;
 	void *p;
 
-	if (num_channels > 4) {
+	if (!audioreach_channels_supported(num_channels)) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
-- 
2.43.0

