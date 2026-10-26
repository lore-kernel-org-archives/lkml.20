Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003157;
	b=Ap9FLN+xUdN0Qzf0GLL3tvAHM6Zjg9xXlHViKGw77AuH/dLUotNrErkwsCh+bNmDtZKT
	 BmXhR+5lMfNRTnRRfZxuQy3q8OcnXZaq5kJvsQxJ3T6k0X9H2sBaDyD1u3iCb2do0NZMm
	 yCjeYRZxmUiTmP/Myns+LNt5PI53EkKnRTzr4F1XfpOJ5eglanbC8vU39m6jDI7+IR/ek
	 5jaYKLrXTUpXcU2SDtDOo8X4dWmMqFrjbgUebwtaazqXAURbYm1H/k9m+QX/NxJWmWn/V
	 6xlbzzVfgiClvN7bfywqh6aYp2JlVYrtfNYzzfaubg+cH4VRRxWh31cku2j3hKsMlDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tx/1/Gc1PNkcv01cZyOTMrjji8wCD48BM6hOVDomBoQ=;
	b=ABai+i1H0U32KtxHa+hSoNd/XtROM6OCMwVfAIn3V/ZLImttY74I7KK92bhuoFPdn1gF
	 PEf3ECHNq23H+8iVXmVYJIvsu74JqZOFIwSKMvoS3ftGZUGbqxkhCEL6T+bqz//nlI7SA
	 W8+LoMqpwdmPlmkIPrBEBOVfnreU6bdHSYVZ9A/3hEPt1dWgpLMbb5s3R/TqEOr4ETvcz
	 8QhFumr25Rv4syn+1zH5VRNo8rX1pFQv798u2do35656AZ92DBRJj6aVlfS7NOx85nRH1
	 P9xk+JhFtburzfLcbeHo9Km8RTrSJYhcP2tDLVjq5g/a8Knx2umfLKrq/FDkmQ0db3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljXVV0G+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C21606A335;
	Mon, 26 Oct 2026 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C21606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljXVV0G+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bbft718659;
	Mon, 26 Oct 2026 08:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tx/1/Gc1PNkcv01cZyOTMrjji8wCD48BM6h
	OVDomBoQ=; b=ljXVV0G+JV3fViNpbpMJBR1mkJfa7zvRDfVEF0T7QSy8lnfxFlA
	D73y5CjTGCcsaqmMON8ATYm6oiUK/U86KRgqe4J1xH8qgM20BA7Pp0nvRzjMEOeG
	6ZmIfk9knJnQKsG/Bgwtt1rdJ2fVFyKy/L61TNib0XJVGZRzBC9m5xnyuToJ5pdn
	bJSF0FhiWCa+VhmbYbyemWsf3HJHDJ5GG35iVfeCyWZCmoJD8rpzmfeuIQUr3ntX
	aXOvZB1mHgTTve7fdBtyMGAy2AKkJTqjHIlAGJ3hzNJwEB+Lrnlm5cNjtmL+3BWX
	dbTFxKgeAzF+BeULmV+UOrfeLjnPJ8/zFEA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssj57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 08:25:47 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8Pjr03719244;
	Mon, 26 Oct 2026 08:25:45 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69Q8PjEm3719236
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 08:25:45 +0000 (GMT)
Received: from ap-kernel-sh03-lnx.qualcomm.com (localhost [127.0.0.1])
	by ap-kernel-sh03-lnx.qualcomm.com (Postfix) with ESMTP id 4EF9E404DB;
	Mon, 26 Oct 2026 16:25:44 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Mon, 26 Oct 2026 16:25:34 +0800
Message-ID: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzMyBTYWx0ZWRfXxAnfDaUZiZ/9
 kwbnLmCLIUNFKiPSKshnMX2YcFppl7KUGSMUAqkOh/WO8eSDmaBM8sWNEn1IDrLWewcHY13l5pu
 I2E53tqlsG9/EdoyYStA4vM349vk+7s=
X-Proofpoint-GUID: -TJ6EI8tT0WxZjr2vibbzSftP71WbzqE
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf0e8c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=grsjAK0AtoeNDU9FNh8A:9
X-Proofpoint-ORIG-GUID: -TJ6EI8tT0WxZjr2vibbzSftP71WbzqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzMyBTYWx0ZWRfX3lY32ZFQyMlu
 XxJyTXj1rRi8Rp/0LLkymDQgvQV9UIM7NDArJQkfAITF1QyamEprO1QSsfMcgkbCZyijuGGgnlP
 McHVyMcULWVS1tiRc06x+OYVFL44NeibnBw0FroUuMWuaSae87ZOMZd7fFcN+V8iue6KO8gpguH
 r0KB8p6qmq7r3pR7QZ59EBjzJuXrk/Wzc7LUXQSHtb/KYLKeNg4Ae3r9rpoMljfwnI4UaVN/iVL
 iwIIY7fTi+rP5eZ3CLEpRDzA37VHTCTwqBYBjJhIrQXst4J22fTxuZ/GaVSVsA6aUg7mkx9TzPE
 MxaFBicEVi6DBmyIpgJEsqQF1Xp3oq/qsLW9Fi+WNAbVzyiKfL0s8eDgyGwv4MNu5Apk6S8bI9k
 Bs6s7baRspF+0kHszCMc/rZVM+bVaziJNskDOmVrJO2qPVTliYYVDaSNJ2wAwHxARTGtfTB8aph
 XiHEAcY1tI/PNbcFh6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260033

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

Reuse q6dsp_map_channels() to support multichannel PCM formats.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---

v2: reuse q6dsp_map_channels

 sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  1 -
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
 4 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..33161523c7da 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
-{
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
-	}
-}
-EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
-
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  const struct audioreach_container *cont)
 {
@@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int payload_size;
 	int i, j;
 
-	if (num_channels > 4) {
-		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
-		return -EINVAL;
-	}
-
 	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
 
 	struct gpr_pkt *pkt __free(kfree) =
@@ -1275,11 +1254,6 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	int i, j;
 	void *p;
 
-	if (num_channels > 4) {
-		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
-		return -EINVAL;
-	}
-
 	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
 
 	struct gpr_pkt *pkt __free(kfree) =
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d2..495072da070b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
 
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
 				   uint32_t token);
-void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..83594b693569 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -21,6 +21,7 @@
 #include <asm/div64.h>
 #include <asm/dma.h>
 #include "q6apm.h"
+#include "q6dsp-common.h"
 
 #define DRV_NAME "q6apm-dai"
 #define POS_BUFFER_BYTES	4096
@@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
-	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
+	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
+	if (ret)
+		return ret;
+
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
@@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		cfg.num_channels = 2;
 		cfg.bit_width = prtd->bits_per_sample;
 		cfg.fmt = codec->id;
-		audioreach_set_default_channel_mapping(cfg.channel_map,
-						       cfg.num_channels);
+		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
+		if (ret)
+			return ret;
+
 		memcpy(&cfg.codec, codec, sizeof(*codec));
 
 		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 83f2711bceea..fcc0267d3657 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
-	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
+	ret = q6dsp_map_channels(cfg->channel_map, channels);
+	if (ret)
+		return ret;
 
 	switch (dai->id) {
 	case DISPLAY_PORT_RX_0:
@@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
 	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
+	int ret;
 
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
-	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
+	ret = q6dsp_map_channels(cfg->channel_map, channels);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

