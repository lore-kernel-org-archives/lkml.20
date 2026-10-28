Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155677;
	b=B78lsA18+6T9DE0v/YoGtp3nWL/cHEYMxfdOls/3VwyTjwfbYJrn0NrhRxdXXeCaV8Xk
	 n/tnyRu7MlssMOMFkotzJHl20m4+thftLG635NQCVsTA5cK7BokKZ632zENkNa7Kf4VZF
	 Gbqb78FUb2FLtbE+og2VuoXm1Y4Y6+0Vp76vNcIcFMaI+c2dlpCn/wUwRlf6joSdf1x6T
	 TGNwpplK6kHRWjE8lqB5gmHAp7Nxr+3xcMG6Q7t2fqIspvIfbcYi6ZM9L0xvyeSUY1/ES
	 536VnirMcGYHDy0yyZ2UxsG7b8ouVTg0CfG8yX2iwaFT3Zof+o8TGsg6SFCZyfPjg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aLDoyBImqnKYh8grtafx499cDn4CNnRfNPQG4lCfyOc=;
	b=eOb3Utmrx05egJju39753kazAhDtH/rh8pO6uhOm5+lFeIUftutrRN6rasdtOiiPug9f
	 pwqmn6zGrW0HD4AIvzOZnkww69t4cgO/01gdmh8joILzNIQcACjK0xLigNcA6/MIv8xlH
	 8Fbm6b/uHqxV/XvnMC/JWjoS1M7QpT6zaqA/xYT3pjwHezCQeHaoBP5ZclL4wVM2ZeUlR
	 hizDIRwWkDV8psMKOaAmEaD9mBuBx9+UaGdR0nNq0mCcomQeCem8jTMBVxwpI53ebEsqb
	 X9Cq84HIVKPo4Qq4C7xwtQpFuC/8EIskrZ55ZStJAyyJ/M7eBhWJW7sQXwCT0Mg5I4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAefAoag;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CE6606A31A;
	Wed, 28 Oct 2026 02:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAefAoag
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0itrn3816350;
	Wed, 28 Oct 2026 02:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aLDoyBImqnK
	Yh8grtafx499cDn4CNnRfNPQG4lCfyOc=; b=FAefAoagdNUDI42shPlt8S+vFu6
	STYy9yf3dV9RdZYqe5T2hMpuMHV6G3QPwL6UwXQIUcPb5CrkIXaLC04kNCoRwGFe
	ibguR281Q4zLfCbpI7dEu3VTBnX56omsMD9E0/5P2nWEuj5h4ybKZeZ7MDIl/X1j
	ZJr3w1e+XDSkPouekpv73RZUDLS1WhMFvpayeVo3UQ/JBJ1iHX6lGtV3viCrUOFY
	PlPa6XrIBYGqGNmlS3s2/556N4SB0KkAVmj1+Qu+rmS9mR9lbCTrxfc4wunD6FVM
	6PRj+TEjYPT6/37x0DG4pIRPFJF3YpboDTh7NEm7kP5vW38OGjX29Q4Y3xw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1knq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 02:47:44 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69S2lgwQ2632315;
	Wed, 28 Oct 2026 02:47:42 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69S2lfPB2632306
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 02:47:42 +0000 (GMT)
Received: from ap-kernel-sh03-lnx.qualcomm.com (localhost [127.0.0.1])
	by ap-kernel-sh03-lnx.qualcomm.com (Postfix) with ESMTP id CC7784055E;
	Wed, 28 Oct 2026 10:47:40 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Wed, 28 Oct 2026 10:47:20 +0800
Message-ID: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae16250 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Sw036wB_Sbj6ZPNlFA4A:9
X-Proofpoint-ORIG-GUID: eoAwt-FAT8ojgDC7re-7NPcKMN5mq4Z0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX6xy1zjJzDvQp
 Z7L0XY7/4wbOmWmwi1Ir1MIopNwLHBIM0bTZ0HpBvUh46mAT6fwjLuQ3uQhnXeuHvMJ08usXjoF
 wrlZIvP9NZ8AMzQTrvRWVoJfmsIYnyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX+o2O92Js1/TV
 T01k5NScTr5t6b6pWoirjVg7jN62mtrNSEdiDIgLRC3oA1VPSReUmcQVEhrMda3FloUH4SIlsb6
 69knpg1GLxq0E7sW/ktzdGR8k2+VtcMtyFSiG+0erp1hCcYU0wxqAUI3SdtqvoM1BkUSazwHxb3
 ZFy9I40LF1hwKYYYENxEb2dciZGKqboRxDxFc3awp9pcW6Fkzkxr11x5qWvFSReEKotkhwUGlF9
 1fCGn+hWA0KNlR621FLaoOJYwSdN9vCI78QgDcyfpzeO5lknaRcIu+IZRsavwXCerDvQ7lxL+xl
 kCgH2zNmfsrdYioFA0z0i4Td+i+NTyUqGwA+a8wH78gVrMpMxjMHdY2kw1FR62UH+XT5YUDd5AM
 T+5fy16rguSOrgiRr+AZfM+/fxANleKqyq56tvGvcUNZO9nV6dMx3J4BhGwdDTu7JXh1/zdkxVJ
 jk4QnONOwGh5l4YPk2g==
X-Proofpoint-GUID: eoAwt-FAT8ojgDC7re-7NPcKMN5mq4Z0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280010

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

This prevents TDM links that expose more channels, such as the 6-channel
playback path used on SA8797P Ride, from being configured.

Reuse q6dsp_map_channels() to support multichannel PCM formats and use
the common PCM channel limit definition.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---

v3: reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL (Srinivas)
v2: reuse q6dsp_map_channels

 sound/soc/qcom/qdsp6/audioreach.c       | 36 ++++---------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  5 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 ++++++---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 11 +++++---
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..e6f077a5b750 100644
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
@@ -760,7 +744,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.intf_index = module->hw_interface_idx;
 	intf_cfg->cfg.active_channels_mask = 0;
 	/* Convert the physical channel mapping into a bit field */
-	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
+	for (i = 0; i < PCM_MAX_NUM_CHANNEL; i++)
 		if (cfg->channel_map[i])
 			intf_cfg->cfg.active_channels_mask |= BIT(i);
 
@@ -883,7 +867,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
 		if (!cfg->channel_map[i])
 			continue;
 		media_format->channel_mapping[j++] = cfg->channel_map[i];
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
@@ -1218,7 +1197,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
 		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
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
@@ -1313,7 +1287,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
 		/* Convert the physical mapping to a logical mapping of the channels */
-		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+		for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
 			if (!mcfg->channel_map[i])
 				continue;
 			cfg->channel_mapping[j++] = mcfg->channel_map[i];
@@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	cm_cfg->cfg.num_channels = num_channels * 2;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
 		/*
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d2..9f4166ebdc10 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -6,6 +6,7 @@
 #include <linux/soc/qcom/apr.h>
 #include <uapi/sound/snd_ar_tokens.h>
 #include <sound/soc.h>
+#include "q6dsp-common.h"
 struct q6apm;
 struct q6apm_graph;
 
@@ -805,7 +806,6 @@ struct param_id_hw_ep_power_mode_cfg {
 #define PARAM_ID_HW_EP_DMA_DATA_ALIGN	0x08001233
 #define AR_HW_EP_DMA_DATA_ALIGN_MSB	0
 #define AR_HW_EP_DMA_DATA_ALIGN_LSB	1
-#define AR_PCM_MAX_NUM_CHANNEL		8
 
 struct param_id_hw_ep_dma_data_align {
 	uint32_t dma_data_align;
@@ -998,7 +998,7 @@ struct audioreach_module_config {
 	u16	nslots_per_frame;
 	u16	slot_width;
 	struct snd_codec codec;
-	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
+	u8 channel_map[PCM_MAX_NUM_CHANNEL];
 };
 
 /* Packet Allocation routines */
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
index 83f2711bceea..9a3994a4f475 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -94,7 +94,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 			return -EINVAL;
 		}
 
-		if (tx_num > AR_PCM_MAX_NUM_CHANNEL) {
+		if (tx_num > PCM_MAX_NUM_CHANNEL) {
 			dev_err(dai->dev, "invalid tx num %d\n",
 				tx_num);
 			return -EINVAL;
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

