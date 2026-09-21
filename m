Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8825013CE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016863; cv=none; b=okZZKUeXiOlvKMol6m9o68vW5jA/nMj17wZIeatEEL9jTsY4mCzaSUc5n7IQhk6DklEZX++MAiCDH7rnAYimL/JKvWRl/V2VhCw2GQchAaQb+8NPOW4qlTVHAYiGUkq6ITMwmg0S4V7KSixWuq50/3J8YHyTFoMtX8cxPRqpugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016863; c=relaxed/simple;
	bh=R6WhnRn3OYIVaQbRG/LcPLmBEV8zvrqFCWDo5EgDbKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hT4352QINR2BSAAk080UW2koySpv3VeH9pq+lJj4tmlzZ1XYTMFiftlEHHJBjei7vgHV0r7M96Nq/et2NBni9WLkiD5Z1nbkLy/CUmcAQP5CTAXqEZKSI1cLTHLOfnu3ZOfipXelxTJXWk6fIQ3o1PYNxd3/+N4eTP5QVeVsgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4l2b81W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dObcp5E8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4l2b81W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dObcp5E8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAsSt885071
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=; b=g4l2b81WjQkHMfFb
	e3aDxWBE3ff5UWAQeaW6A1e8vS3/ftI2HmqIejTFkmkwRtYg6j7PYIT/0oECa08v
	lSQHwPOqhc2qFy/kCsFEByWDmfHMp+adYKCh8lA/6jwJ229ULyLYzFCGwW5vW1lP
	rHROEUzhYX6oqj8klZ4/l07z9HAIkJaKhkvY5zXib3O/TtFqfNfSfyeB50QsLErJ
	LoO913/QgzMEyWljBXyq/zmNFFV6yY09PhlV4EiWH9qk6O+o1vg+vKKFBVK4iEmc
	3bi9DQRqAvGtq2nkyENCBTFCtf0ABymvQ+wwloAPP1tX7Iji/nPTQuSJQdLK8W2l
	A0o06A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj2pte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so2845522a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790016859; x=1790621659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=dObcp5E8j38jivbIBlIfb9HrrkO8AAx/RXOQDOBjFso3TSvcbAmI9KUa6ihCGLaqGw
         JRbY43bEtfX2vvd7VmtT/x1ZbOSXtyxJjkwiMzgtrTk59OfdQoNKaR4+rhKV/NiEGkux
         d1axnsi2jnU1dDZo83rIhUbGL1XUmbtcruBuf5hx6ULIRXW+FuoD38/ykzYBlk3mIsNi
         NffYAQD7B/qD3J7gCCbsvj2+nWjuo4I9bKc94tmtffzzaz24IOPS1kATXYEbjFMqAmu/
         8bMj4Bf4nyrcXDNXRXs9SD8zivxWsPRKAByfUAXxwcVlEyO7h4mU4eAZ26P7i7UIXFMP
         9huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016859; x=1790621659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=362TzmWCoKZ0VSlCRZr3hytW7UtSJaVQd8dVIrPrWIk=;
        b=01F1io+ekjO62XsXJuU3Kr03OOBWrwQu0Q6UAaLuDdoFEvvFW8l3VbWH7hkOHqyMym
         EuoBGXx4plPhpO/X8ru65vzWael/Uew507YcFKUsfQbbrN7YOZw/Vdw0itH0E3EtTkCf
         vPsftimLmZP+LtNyhlwb4NDid8ZNIK3f81mH3/CFPakqjtVgy+tZryobdRhim8Q4AFki
         PCKoJlyOwbx5tgnlle5jBXGBQhzCDpPmC5g/BD6FDA612W4nAeOxwI6YZUk6brHlx0Vq
         dXkdjOHT8QNXePYmNE8zrqdc8t85048uuUCHZst1eEWCOg4VhyPwzAeHHVcViRleX1uj
         ToAA==
X-Forwarded-Encrypted: i=1; AKwUvBxGl2Gb8Kto4TNGGF6OY+BL0/WGi9Bx4QLKhRTygP+w0jT+a5Q8FqC7cVqBDJHrWMXOxlKmzhk/U1o46kg=@vger.kernel.org
X-Gm-Message-State: AFuF++nhkxWdQKaAe/sUmrL7mpVILRyb5XIOhztMw+H32c2lEGp4/zD3
	HP+VPdhVoRe/SZgkHkYgH9grMjAx4Rfplo7WOVNwtZ2qow4cZe5frHwISf2mYuBOQ9Sw12lb3FT
	Wov4Nx4Avd1dg6xC4udM0HfoyPfRAXwa+I08JY6YURfahPL+xya3MbnRtQBVGZqllGew=
X-Gm-Gg: AYBFou3cSm0tqoali0r4BvKqMj8H2JvI9WQzsxZVnr+9DJ/XvACimkDeiX7jKZmIGym
	FWwwhCDUWBrzQiBEPK3n9cm5lubXc9dOAQNoBotyzS/8Z+mgd4ZfYQeBallbqCm4aIj6KN7aptc
	K2PgWGrKcmt5+WuYnsj/dS6CZloK4I27ZXOFg1MSbI7cnNrTDtLkzE1vvyBhgyA704uoRp4m/6g
	XcQ9HpkKoIDLj1inKugHLYGPpAZGwqtFmCNraI3fSZQ+6hB5J7p8PtQqJCmPWlrClggO7Rm0rKj
	8Mpxdm0tRGaApi7JgbbUYx+Ry5Hc2NsNdm4xgnAal3cwLSEZRWt4mbmgmY2BeV4fvXLkVklNGxz
	hQxrxp+L0VpX7pvdiuwGhQNgNWTM=
X-Received: by 2002:a05:6a21:3510:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3dd8c3fbf58mr18720379637.2.1790016859043;
        Mon, 21 Sep 2026 11:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:3510:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3dd8c3fbf58mr18720352637.2.1790016858416;
        Mon, 21 Sep 2026 11:54:18 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm33696755eec.16.2026.09.21.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:54:18 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:23:46 +0530
Subject: [PATCH v4 2/4] ASoC: qcom: qdsp6: generalize GPR service domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v4-2-5fe21b1365a1@oss.qualcomm.com>
References: <20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX+BBr4RFB2gm6
 UZWS22hVCtj1ZjDh5j2R+Xl3P/yTALONFfA1TbZZwrwD/TmQ2TwBjy5kv4I4NJzVfCa5cp/jPDo
 OW7sDDK9d/Obu1MD5CtWbxhfnk+tLjs=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab17d5c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=06UwNDcAWG1pVACfRQkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dbih8dlACWFTq5eqY58tM9GTYucBitn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX5DorgTVYePkL
 KPbF1BwzPvZ6YIb/97D1jjS5bC3fme9qw1veTZxtf7IbaMuu85vNJXwxOS9uULhw5y9Cx4OywEM
 asmd8XRz/RaoTY69HK4V35aeN2ejP32AtEn3hpJx8jv+6XGm4diDWbCqSVobdsVmtnkPE2eywhS
 bl5YFrYEYEGm+mCJuGKGArinEpp7/alc/RUQS3DdeR6v8mse2Isjtv5ChE5a1QJMonSUSsuOe/n
 tfvtFO3J9VYY8eF5IUqJzc0RPAtQhrU7kKPESAoxfPRGqCSyZ6PQ7jnJcfybK7Fb+DqBHhIdADO
 mubQdaqOaVhjpa3CCsK14eVs0tXfJHfLK8qDRnnjThOdxszfrOqHsz6RXoC1+fG2Dt6SubDLxAR
 DIYMN9jdJg3oE+toGMsydk9Xka4qBA3uBug3AGZkjT3E/UX2st401EQfe6ysVFxdieSyBcPMpV5
 IqoJV0RVmoUIAYS5uTg==
X-Proofpoint-ORIG-GUID: dbih8dlACWFTq5eqY58tM9GTYucBitn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210276

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

