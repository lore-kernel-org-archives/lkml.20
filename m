Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDDC50B433
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017726; cv=none; b=Wq5+/SbeBeRD70W7r519XoblZAl36NBNKi1WAFk8ExeIHUQ8/H158c0ke7UAqI27G6s/eZh0bmmVjoVo/i7wp2xDmjzSIQDUsketjrZZCbHGup6cXss3HmVqtMPsA4mTkL6epZKXuw+lH0X/Ilxl0ZorunGIv9FRa6kR3Ss1czQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017726; c=relaxed/simple;
	bh=R6WhnRn3OYIVaQbRG/LcPLmBEV8zvrqFCWDo5EgDbKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFww0jQVDDRdN9mrb4xTtHGgaPM16toNe3OMTD1eKDx6tLlsGV+p3p4hANFcen6JGVz4fczAsePxrHVNq2Wk+JTIyawwDPxB5QSpd2demxyAEbUh2Mbualvn1OxKP0leklUsGHWRv40d/h3ROvrSb2Dnfnb/iap5pPfHFkmrJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbktcvE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uuv6TALc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HbktcvE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uuv6TALc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHKVXU1821697
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=; b=HbktcvE2fHAPjFwp
	nVUbz5k8+jIXAewsojT+7BW4+AcMFvjuSWwsgyLG9+7M7zh4ScYnV3O3dtKWA8VV
	pkBo/X/pn1PJuSiqf5wQHGzndmmNPu3CqlY62eFVC1vT7EBDFpR17Zwyg6IEO9Sd
	x86VjYoJ1LvIYhCTM6H0nA4e+RLlANs0J6/TCq8jk7xgaGCXSJE/jY6iZ7+Fl2Fd
	5uxxh3DFvoII0Dk/qBTyos1tRx1tdXG4+u4Y+Jz3dxmwv1WL6ygz88U39yaVeWIA
	CMNUOMp8ARYci2/Eg8qvwsonQjdJRwDdZU3bj45v1o+CoUN9/3BrNTIlyoChbEhz
	cPo7QQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w78d9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so1849155ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017721; x=1790622521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=Uuv6TALcK5xDD35dsSyBV3j8dPvvnz8KMjg7ffPJSObdgulnBNKVOShYJRYAv9aOMx
         BF+/OPNfH9VHZouw6Dxx9JjzYW5aFOq7+tSQc4eKMTKFq4JZZHRRbSoxVT9nSaaJi3Zk
         NOkRV8f2kKOLQQrTUJzp1avMWdVn0NutNhg/oSKVchzFSfQO8eaBz2MOfLotE/H3roHh
         dT8LyJCUs5qVJRE6L+Rh/hHyraVmMbydg1VDrdT9g7U1uC28XXhZBFfJurAqA17BG2ng
         symhgaEvpMQSYVg+BS+SNZtBDFlQlGX70sxpITPari17aQCB4UWqG9VP+2uabJ/hDh9y
         VxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017721; x=1790622521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=d0ifMitj0RR921TRyZ4r2HiYAJ9LzeweQxVzxpAqZO8xVo5+OhOvBkGkR7dIMqKhnQ
         jYKxKdHgIZFY1NdILqTGd7tGnP+LU5nwMny0cuRUYh7JkjJBBPeVS3mio0htODIti8Ar
         DZ7QYOqM/ltRtmNJA91gWZOWDKK36uer7ME1iDqCC+7PHfAPdf6ob7G84C1evkM4NBwq
         6vivRpgzdpw4Gw5w/2tIUoVfKB0i89E9AQStsc1Gw7nF4pCURCtBvDG1a7UclUXkUFAx
         bcjFX39xMdQG6nW6mKe0DE8dB6knXbvCR99GlXi0wnqPfHSCf3+JvlM6WgRqIOrGoTVe
         Etsg==
X-Forwarded-Encrypted: i=1; AKwUvBxx8ZcBjlLqMkAbOhRSTN/u5W118+86bW558vW6gsbnQUukff1OLGz+Bn6JhBTETeZeBPSsvRiZDt1vGUg=@vger.kernel.org
X-Gm-Message-State: AFuF++nUEQ1vULCNr+qrxsBd6vPtJQNbl74yz5Gr13QS3CIiLvPI1wyJ
	RAHeMztH4F/S3dQmR8Tn/k6uLR5+2Oki7Ok8e1KrVGrknD6M5YhXhokNp/gcSkb7CkUx8qfgPH+
	9ZFVDjGZ2IJOVAu8Uv5e1WNVIWseCiwP0yUozqOYZyYXwIzXud0kcg5x/C7SBrM/v18w=
X-Gm-Gg: AYBFou2OtBBWY4LzfjKk0nJYvqUjQsoLLmSUY67cOI9ff+jb3K0F2aqtBk1EWw6sIWB
	pBGvxLbBOVKqU0C3ZvmzFPojpYd+0rxgYrT4gf/Uk2hsOKnq/8koSXtY0gJM+sTIfnOI/Wdtd+j
	0ih+iUTeEb+hCQlVqTtqV+4iIGsGxNngMnY66m6z+kHguIqNtLGrPxmgesUVz+jZNQIvEWt4ApB
	0X2WdCaf8F62fBNRNoB/6rbudLAqMxpBTfA645lW+ueoDria947X774cTunpyzhigyN5pg83Yzr
	8ZwQRMB+l16fd6N1FA0Sf4IvgYOzFc/DiutBPnDkdVFs+97X9hrqwamIxr9AtnaKNxC/RfyK2IX
	7uNtUllo9si1w5Jvg9S+CCEwhPlJ0
X-Received: by 2002:a17:902:f68a:b0:2dd:4438:4290 with SMTP id d9443c01a7336-2df5968c9aemr4408195ad.3.1790017721493;
        Mon, 21 Sep 2026 12:08:41 -0700 (PDT)
X-Received: by 2002:a17:902:f68a:b0:2dd:4438:4290 with SMTP id d9443c01a7336-2df5968c9aemr4407895ad.3.1790017720832;
        Mon, 21 Sep 2026 12:08:40 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:40 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:10 +0530
Subject: [PATCH v5 2/4] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-2-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
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
X-Proofpoint-GUID: VZItjyReyxIAy3AMYuoL7CFhwSrm3Qiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX6WK4FhnQuUXf
 IRdbNPNOVoWZTy+nIgGdBzWW3K5z6zXQTtGStJDTcISK+Nniz4vvxv38zvlgGChErWMDw/M2UP0
 Mq8nkSf1jXB6dw96OyO104QK/JLwZAnjqnFMg9gp0DjH40ZDjJBtjeQxMG/AkrGYSKXiJd8MD1d
 uLHZU6TrLXeHTKxkT1WKYHGYcPR+QikDxhr7ZfTCcROYBVegfumbI3XrIUu+rXn+jhGTmv9IfEz
 0k71bJW8xtGGLG5kcQ/RFYDzT9+NLGFRgCpqMdL0PlomYG38RmU3VTe30bz5wq0fCXOOhgw9WVi
 dkgdyJaHq1Dfacp56tFlC9NUMFhhWTXYmf1PZsgwP8bzvHiXscvm9Q7TCMMw7FpR26uxdJOZ22U
 6SYbXVgRUYj04Bdj5oNX9XIiv7Q/NPB2p9Tz6sAaA1hBmdRw7ug9dfPcL+g6WPzdVJfPXT+ewqs
 dYgDCNuH8V8Ua+Dj6cQ==
X-Proofpoint-ORIG-GUID: VZItjyReyxIAy3AMYuoL7CFhwSrm3Qiz
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab180ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX/t5P7x6H0+85
 tBCa+j5oN+WBTFDUfzHqq/cXEKZy7jz6kJBXjUqnTYhSsLdY7qf3q+WliF0mf7x/P+s+7ppSDYf
 gWP70xwdct9R6G/XF8EzzweZPPwIDI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

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

