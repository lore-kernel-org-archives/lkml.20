Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB13C2BA2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181261; cv=none; b=YtHdqrok8f2Vkvoa25RF+YbfYt4l1QjmgfesT6E5EGGToUv5u4Cv0GViDgN6EIP3+/qCZ20nUy2WT96PtX8hr+HaookubtA8B8Bop58j3OpnjzTvkPbOAJs2axP5CavGgit5v1Z6ZIpCd1qTinsR1XW+pqCm1Z0wtOAOlRXuAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181261; c=relaxed/simple;
	bh=47loNT4DhVEf9UzFy8r4935vDPnfMGM+QfqANZwjVU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prsAqcJUJlTVBWhzPt/i1hDSSIvnFApmg8gyZk/vhmE2dcVmPpAH2CoZ+FbtTTZW1CSmMeuCdBMZsP7J7TePIPRNDnZa2A56rwBCqxQqtd4DT9DE49X6Hq2w4GcxDs48dSXtjB4nylSMR2yN4OlJC46vhTDbvhtocEmGOYAJmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ9q1ZwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg+VB9zW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ9q1ZwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg+VB9zW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTj2B217785
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1G/LfLwb41fze/tokJxczt1bqU2MY41K03t9d4wwk=; b=CQ9q1ZwUMbMw17qG
	xv0rVQ5/eHpQnr6m+fz6qjftNssQppeiNaOV7/F+v6V/hx6sTKmYiqATN4kLS1u0
	oCHh7eZIkTKKPqRRnyHYHnVtuPC2Cvf17EzLCyrcYJvERKqpowZ6rmuBJkABLnns
	gy7iQVA8Cupwi/VsO5et3yHtFkvf93b8RBQ3H51t6n06IivVZ3UE6g3fmgR6YKHJ
	SHzGhx/EgX3LlJwLezpG9NdD7jj+E5iGS419rfrEtXOlRJHdIlQl3cjefBfjxXSZ
	1s4BQM+c/ylCBai/0c+d2B3yhIMmWD0s5YSwz3fwhH5v4JCOGXS3/ksIi6q5bVRV
	+jVl2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb61eye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so17716815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181247; x=1790786047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1G/LfLwb41fze/tokJxczt1bqU2MY41K03t9d4wwk=;
        b=Hg+VB9zWyLN6qMn2mlbGhT370Tpfj6mIU9OisIKxmKhf9MSSQox6+jJ9q5udBF0eSO
         0G/Ju6ymb53GMuKj1Er1OSXBhCQwWI8FPpUI+TrYaG2zEguEkBzZOHJ9UWT+GG8/oZUC
         SURtMKLN0VYM0UW6Fyet2i4+omDX44+HUKhnPYy5b1Xgrghz0LU2dYmKNSXeaqKfmgUP
         kBL6C6DATkfGjqJOVhe4jnZBns0UQsZl0ezWlxlcdPAi9lm1ydxCnE/D0ugWyVEM8ezT
         yCjlbUMEjV5OErldauvtWuf+k+46YL4veykQCzRa23wF05FNG9UqYL+lKPz5xrZAddzv
         m6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181247; x=1790786047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1G/LfLwb41fze/tokJxczt1bqU2MY41K03t9d4wwk=;
        b=z3hWOOnzICC6XFWa848ADj8chqcRASU34g5QF6A4AXno6/QBo+qFuSrn46HF6jxH5K
         +9kXcaJbBDZoKi6btRWQ+SLvPgAlHj4L68bZy1EQ4lOwwSgzI7ZKnHrdqPxUBJg1UN7O
         NqukGiWM3rb7J8pSeUbD0Suw4bPiqmMaLBTDtrBQVlhC+1vYtEWsTs0JitRBBUe5HRlQ
         bpZq7V+C6Pww8QmxnkxNCg3oZe5Mz54vxSFruRchuMTrncC1Y1uO8Q9FJa4opq/wGGfI
         3HltHcj53UZUDIzLYW9Q/yaZ8deEGtyvECMb0M3kxvIBVjuk2hArWXk4QzAi7oiVvDeH
         W4bA==
X-Forwarded-Encrypted: i=1; AKwUvBxYU6OnqL/5Ac4TiUtNk8f67LuDwZj4QIAH5HJqmcc4plXHYLFZm7dl20LW46Cm4ILoZExwptb7Kl0FFFk=@vger.kernel.org
X-Gm-Message-State: AFuF++nbdtzl/SnvDwvvHBpDiaUxi+WzNIBdoQJWATOZdgZT1U+gRbiL
	ZuKALmVLD1804yhKLQkW3C6wjasdIJNKZfdc8LM3loyujozWTXk6Vb823EIke51uLGYPmAhGPzU
	JcoIx4hSIdpjLmp7IJFMs10C+omymVJREL6i9GuBO53E2leEBBRJZTUoruFSxf54IlR4=
X-Gm-Gg: AYBFou3CCCXPY/PAdQT9c4MWZFm6PVG/CDvDUSOJ8z5gGygTN3glUgUiqkX/VHBGzhH
	rM3Dw0iOYcyi7kjHJcJFa8OJSiF1hgg1AkMngVsuIFsEq7Bh6ksiy/PsDL1NjVKc4CvyotUzlpJ
	3joSW83bo9gM6+zTKj0hTdPXcF+hxrXGSh77AlbGOlk05pX8RoyFgUdOsaK1j36OaoTCejSJnaz
	vtXml0uyoz6WDeM6S3SpnKUt3yFgZmng68KoYPQEUP3X+PFSFmcUd2ud+L2pebixbNwHPnemuPZ
	iemMGyNX7pyI7opOxjFZXL/hlLtzsa/ymzQDvtFaDE1I79hsHIRMlHGrXnzEvZH6ixlJLYD5cMs
	PciCfD0onj7uBRfs+hEgSmClVk0DtnyLnN8raDQ==
X-Received: by 2002:a17:903:160c:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2df69e0c503mr28604905ad.51.1790181246701;
        Wed, 23 Sep 2026 09:34:06 -0700 (PDT)
X-Received: by 2002:a17:903:160c:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2df69e0c503mr28604455ad.51.1790181246206;
        Wed, 23 Sep 2026 09:34:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:39 +0530
Subject: [PATCH v6 2/4] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-2-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: Mybrl76r4WfZMCALqd9U9t0S6iUGptH0
X-Proofpoint-ORIG-GUID: Mybrl76r4WfZMCALqd9U9t0S6iUGptH0
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3ff7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfXwfyppxfbSJa7
 vSbXJLl5j4QEbsAMWZJWm+anjCwQX2azYnUhh1d3Ap7wO1w53M3TdOW0wS0yTOII7bP6bxjO4M7
 mYBrQ1Jrsp9qzb9Ts28lFH3b3O9s0pU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX0EPS4GmyoJkr
 IpLiDJykfRK3/eiPD5WfhcoHYhylk+YExsL8IdoCiKU5wgmVoYHQK+yeYymWluIhAdkx72sJWcB
 B8NNDiktl/6ItHyDEoxxJYRGgG+/1ToRdlXGDIrDp0GzNyGkrDmvbJxXNzXHwdVNU+K6AFvgxet
 uCFNKgq8jDm5IEPOilcXmUlwIVyDnfYWGWhZfFG6AjfZlULb7tlDWQCz+J/TavOHsGfb2+vwRLV
 SZVLPaowG0OR/cumUaqV9uZ0vISV9aGQ5y0rhdxTw8bTutJ6kWT/1YsrvXZqVWPq+p3J+Pnf66R
 vibb7VmQnF5HM02hHQUZ3SYz7jdplE0zPH4HAmmgTd12mhKeKrleeQFWWYaIa00yNPuNCQdhiPw
 zGrHf+Ea3idJGiOCYO8mg5RtQ3SPH2NokPPpmw/69wqCmg+e0xpromuFg/oMjl2c4kkH32iYs5J
 by0yuspWOu6Gj6gcqkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230065

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
index cce0ad31ff0c..d2dc5d37bccf 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -593,10 +593,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
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
@@ -636,10 +636,12 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
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
@@ -994,6 +996,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	if (rc)
 		return rc;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
@@ -1609,6 +1613,8 @@ int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 
 	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
 
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(graph->apm->gdev);
+
 	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 35541b2d8c99..587f14ce71d2 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1002,14 +1002,19 @@ struct audioreach_module_config {
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
@@ -1020,10 +1025,13 @@ int audioreach_tplg_init(struct snd_soc_component *component);
 
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
index eef4b496d2aa..ea6680925f21 100644
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
index 1f3ce4cc0837..2042ff1e8ff1 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -57,6 +57,8 @@ struct prm_cmd_release_rsc {
 
 static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
+	pkt->hdr.dest_domain = audioreach_gpr_dest_domain(prm->gdev);
+
 	return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
 					NULL, &prm->wait, pkt, rsp_opcode);
 }

-- 
2.34.1

