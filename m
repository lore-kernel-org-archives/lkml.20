Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024654E532D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739416; cv=none; b=mb2yG8ZKYw5S2gEN9Vmxt2MEj07pSJYy43Kx4CQ0vghUPrpW5DLzZIk/vGLdxfIYHYDFX53tbpYDPCNoobT1jvuyTcIfRjNkoAsEETo3MM4FAT/aQn4Funl7LedisV7ygVVkslP3WXUSK58N0mirZoNoY/wQ2cVeyS+726pohVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739416; c=relaxed/simple;
	bh=R6WhnRn3OYIVaQbRG/LcPLmBEV8zvrqFCWDo5EgDbKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7vW20KWGQ1dGvyl9uVqbLP/QnU8yJxzeUhC3aloZGsjEcrZtgvjnlcOfMjojg4LkshnT6iDKoQTpIQcJ9zBV2UhqMtEOtXobba/wlb9TPOAq22g5HiX/U6xSyUCyOloL3Ia+jyWHlJ6wPdT2auLpSg5AwYxPi13Cemf1wyXuog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Se3oGCAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/D9o+2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Se3oGCAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/D9o+2I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOigl745944
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=; b=Se3oGCAzWN0dWOxC
	RjBYGLDdPHO7Fsns9w2aoKiNE3a2fcuDJ24LM+PCC36YZXz/Nmjk/zYxYYWX6QfC
	7I68iCo3/6JkGTBBBj46hAOQGYDtrrRPEA7ZS42LG4wzKkzBX3zeDxxTr9VGmw8G
	wQxT67Jrw6k5ue0gOeqMLgP4cP73/8WskoBTCmz9cTUSw14l5VFHXF/3cTE3781H
	M7lsi2w/bycKxmFbSvtjmqC0MUPF+xTZZljNvH5Pv605zsbQ35xrczNuw57TRNcX
	yZ3tw9jxbuv/3NAYK1ZeDEGfr9nbH7mWZkoBmsTwVEj8ofztc80tySu/vgyY5GKt
	MVWnWA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23915hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86b4048367cso1073057b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739412; x=1790344212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=X/D9o+2ISkCjeel5ACB/zWQv9wO8uv/NW42ApRdmq7H7PjEQkx/2CW6tTi+0nO33cz
         fyrXfcOg5NxlobSamlvLAU9zew/UUvqVJhFXukJzhI2IlOgJGY6sWyG0Pz1rFt7FOzLo
         WFAy0AGd94eE+ddOlEXr88cwwG/O1sVPo/U5pbRcq9NDKZIeOY41PqTKaqbQeWDnzu7k
         Z/TkvXIjkVwowIQRKDsMvo+ffhxEj3GQSKvfGKfiyN7lShbmAVEDtwF3uc4cybeYlBsy
         lDNqRSxHqiEEY+U0Z+/epWRsbFN+jKqq86SjneYeMYFiu5K4kkraU/BuXTI6gd3mmfcE
         aDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739412; x=1790344212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=20PrXbHwITu7xBnnV/XVZga32RjXH+EDxiwKPChQOkz8kEBR5/Mgu8FaVWQAoaQwNz
         ZFwYJQbONHoP9ri/gDge+0YxOGPSykVGmxUHJHIuYwh5Y9yGrPb5M9hlpN8GzDkDAeyx
         rk+JicjDt1cNkvQKEd7bElAUoAc0BYVYMLFd1h+y/Z4vgDbmhmKAiJxJvFKRS96iqwQf
         kpp/ih3KTAjxEZM8aOpCj7U0v/qO64hM6CSwukpB2B4q9YThXkS+vXypd9EEsAErZIn9
         8Ic2ToB0i9Wp/yfoWbHtLjFgUYHqN+wLINZzsKnNvD9VSGb4lgeEp6x1FzbTq34mwMcJ
         gP1A==
X-Forwarded-Encrypted: i=1; AKwUvBzabIwWzZIVWGa0skTgA5PuIr3ny/GhBRQYW0MosZzett2M2tLKedw7OdmtjMugkWuU5gNvC0DK8XlYQKo=@vger.kernel.org
X-Gm-Message-State: AFuF++mwp8TXLVDeAdcx4Pqom2Ay5u4dz8D+Yt6sxeLCsZZEZHrc2kD0
	LXcLc/39J8kSXKobTL8jc95Zxf/tdOwpQoIkMiJVctqVexe3opF8CfqarVQsBsW+B+pWm4r9dn1
	lRaku2a3GRql+UX9EHtACYe8kZPqhu395lgiaq1Rqbxn2lin0l1KCOVYIin3cvWymK6g=
X-Gm-Gg: AYBFou0JGIOq0dDI9BGYPGzvHbPeGhPN5+pveHq5D8JEESj/wfSogPQQOF3p6A5HWr3
	bRCAVDukSDKCukJ973Bb00EQoIYukzbK7mVc0mX8hZEza2P3oCea08tA7c0+amF6N3rG4h616si
	0UNeR0Ma6PugK9Cep/HUVZQMIbyPKcBR4hEKFRY5AoYHgG05/3/xv39a34uEX2+fCUBegz01RMm
	FL8jmhERCbLDMioEV9XvemKQO9DwawDZug1e2ChjlJexYSVCtDOQmn0/tVLJmS2aM1zcAJk7FwC
	Xz//icceuYqwDn2W8xPXZN1kaU5cfhI5jAw+7pq4ZkPNtWcSkkxTzHolG4BfzB650xHB30R/twK
	yt047JxzIxUcwxAKJo0Hwbw2mdC8=
X-Received: by 2002:a05:6a00:f87:b0:86d:7462:414a with SMTP id d2e1a72fcca58-874db8eb145mr5747822b3a.7.1789739412430;
        Fri, 18 Sep 2026 06:50:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:f87:b0:86d:7462:414a with SMTP id d2e1a72fcca58-874db8eb145mr5747731b3a.7.1789739411803;
        Fri, 18 Sep 2026 06:50:11 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:11 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:19:36 +0530
Subject: [PATCH v3 2/3] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-vmid-v3-v3-2-f1cbf47bf173@oss.qualcomm.com>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
In-Reply-To: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX5od0mvzX/fER
 aeSSmuR7fJUVYi0E0PC8CC/f4Ldpdqa5nOQ08GQ3eO2K87BQwsRo+J3QnSIfOT3rlgmJuoX8eMv
 8mmD83zgCDbKz1oyWLEReQeRvjG3BSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX4r1tFb/QOzSp
 O15BMIec2FvydBFVf8/KFFSBxoySCHzDXCU0zhFQ5D68aoMKLJ62ZWY3K0oEetQ/RNjCHA0nfph
 TUZVarwx2Od2CiPyyrSgKNyeTGk1z20yg9kfBcUMw1Av10LmpOv9PHew+6YCKfBt3T50cGayGJc
 4qc/MEmhr8pV1dlibkTo9lJdoLpHv019cmHeIKzr6MYjsO/UQOhzFMu9RR/nEI7fDSPSlItzIAC
 xEzNLr8hLyOY78feX4FF/psihC4k/FRej6CGsoMfBpN4SWxPcQSSH79ThSbpqCpelNjKq84cyVH
 wFNYJJd3Sl1jynTg4JZWax5IQa0wV5XdIewhnMBCe6WL87OT+D96OSoQHntuMrsMkADEETz5WDa
 nAUnYbOooAm0Q0cB8IIjIysEe9OKywmEvfieuZZ4FxNLtOwkYLkIo6yymr92F3GZ2eKVWFhfLOe
 bMeGcyE0sLni54lBmrw==
X-Proofpoint-ORIG-GUID: hnBmC3uSttv1WIzllQHc-OFWR30UZL25
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad4195 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: hnBmC3uSttv1WIzllQHc-OFWR30UZL25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180196

AudioReach builds APM and PRM command packets with the GPR destination
domain hardcoded to GPR_DOMAIN_ID_ADSP. This assumes audio is always
served by the ADSP, which is true for all currently supported targets.

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) instead. The GPR node in DT already describes which DSP backs
the service via its qcom,domain property (e.g. GPR_DOMAIN_ID_MODEM),
and the GPR core exposes it as gdev->domain_id. But the AudioReach
packet builders ignore this and always target the ADSP, so every
APM/PRM command is routed to the wrong DSP on mDSP targets and audio
does not function.

Fix this by reading the GPR destination domain from gdev->domain_id
and stamping it in the send helpers (q6apm_send_cmd_sync,
audioreach_graph_send_cmd_sync, q6prm_send_cmd_sync) just before
dispatch. This centralizes the domain decision at the send layer
rather than threading it through every packet-allocation call site.
For the small number of async data-path sends that bypass the sync
helpers (write, read, compr, EOS), the domain is stamped inline
before gpr_send_port_pkt(). When no domain is available the helper
falls back to GPR_DOMAIN_ID_ADSP, so all existing ADSP targets
remain unchanged.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 12 +++++++++---
 sound/soc/qcom/qdsp6/audioreach.h | 22 +++++++++++++++-------
 sound/soc/qcom/qdsp6/q6apm.c      |  8 +++++++-
 sound/soc/qcom/qdsp6/q6apm.h      |  2 +-
 sound/soc/qcom/qdsp6/q6prm.c      |  2 ++
 5 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e6e9eb2e85aa..f7ae6d0db7e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	const struct gpr_hdr *hdr = &pkt->hdr;
+	struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,10 +622,12 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return audioreach_send_cmd_sync(graph->dev, NULL,  &graph->result, &graph->lock,
 					graph->port, &graph->cmd_wait, pkt, rsp_opcode);
 }
@@ -970,6 +972,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	if (rc)
 		return rc;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
@@ -1489,6 +1493,8 @@ int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 
 	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 62a2fd79bbcb..2ae7b402a137 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -912,14 +912,19 @@ struct audioreach_module_config {
 };
 
 /* Packet Allocation routines */
-void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
-				    token);
+static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
+{
+	return gdev && gdev->domain_id ? gdev->domain_id : GPR_DOMAIN_ID_ADSP;
+}
+
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
+				   uint32_t token);
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
 void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
-				uint32_t src_port);
+			       uint32_t src_port);
 void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 			   uint32_t token, uint32_t src_port,
 			   uint32_t dest_port);
@@ -930,10 +935,13 @@ int audioreach_tplg_init(struct snd_soc_component *component);
 
 /* Module specific */
 void audioreach_graph_free_buf(struct q6apm_graph *graph);
-int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
-			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
+int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
+			     struct gpr_ibasic_rsp_result_t *result,
+			     struct mutex *cmd_lock, gpr_port_t *port,
+			     wait_queue_head_t *cmd_wait,
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+				   struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 12c6dfe4c58e..1845eb7b5739 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,11 +29,13 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(gdev);
+
 	return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
 					NULL, &apm->wait, pkt, rsp_opcode);
 }
@@ -502,6 +504,8 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	mutex_unlock(&graph->lock);
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_write_async);
@@ -536,6 +540,8 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	mutex_unlock(&graph->lock);
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cb51ca491dc..9092359ccf90 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -147,7 +147,7 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph,
 int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir);
 int q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int graph_id);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 04892fb4423f..f93383078eb1 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -51,6 +51,8 @@ struct prm_cmd_release_rsc {
 
 static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(prm->gdev);
+
 	return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
 					NULL, &prm->wait, pkt, rsp_opcode);
 }

-- 
2.34.1

