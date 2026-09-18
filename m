Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CD4FE2CE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739421; cv=none; b=p3D4SO0S/bRPz/Kmt3HJ1vOGJK5RNwElFtZjoKMrc7UpGRq9uM7DGKPZpt18ej5NIs8up9HUMPF9KT4FDG2aYQx7b4GT0PEwVSxWYRDdSgqkDZaXWzHVMqBwae2MQl2BOf1Iy/qrPJ0jsm9EuiF8euY9XAVwRBZJYzkEQdb1F24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739421; c=relaxed/simple;
	bh=p6sGUJQDw/v2WEkFBKyNsaSEI1rEoinvPgLiO4jk3cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgS2TwkJ0WDUzIT1q8AEOiqBgzNy10bQrZEeNkI6j8cVHvNx1a+/XH3umtD/SWI804Y99fzZtvQ+MbhY8dz7hIQeDhrwtp+iT7X53ADrZET2mXb0otSIle1QFEwtLCJ3na2MrEItlvjqJmz8U3ibXh6bGLjzOWsysMKFTTVph/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REaraZBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNiOa2Sy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REaraZBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNiOa2Sy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOY1U882168
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf6tR09RZeKBwJ8QYQsyPe97UrBuN0pxSc2WuBhgy6g=; b=REaraZBtIQOvBurH
	Bx3yKujkcJhNVSBspJzafyj9qye8oPrWH7gIWDlG59pCVNmoDkDWtctVOFKVv+c4
	iK4ucVU15mGPt+hDASvsqdU8rmh7SVF1FPYnRKE56lntcnZYCl2CcLmzIkEEYrH7
	RXS0QbGYlgYPuVqXFhTea53YOmgZ7fTw+196Hagj6As8PKN7+e9igi01gkBgXYn8
	IS927vYYJhDebqMS6TKG4MLYiIXS3ZEQy1t8cq2uFJgAKP5iGId5UE+gjvyLmxtz
	dRxr3nLBMObIB6me4Za9YeWhvO56g8z2xR2OzzEvHpdAq6gj763HFu47eGNStcHs
	U2Jbzw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt6va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so819511a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739418; x=1790344218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf6tR09RZeKBwJ8QYQsyPe97UrBuN0pxSc2WuBhgy6g=;
        b=XNiOa2SypACgH4T7bszmVf4A8lmx68+HhgY3Nn3JhJ94TSw02+64WBHVQfGdXbdPMD
         uvmVbRyOaBGXLVGDdEqqC1mDP4pikKDk+N86Jx4QRNtaijqoCcWD566goR73DBDtEbVE
         SxnmyCy5vbe6wU7wg3BicmYWC6M1rVRze7LuiPWR260F5l1EV6uiaSzHG/P4nDUzlx3B
         WS2V3k0UJoJOu+xKMrkktebrQus+X4HV0fo+LBD8kk2hPv7z9rY/OUCzLiX16N9Fz+QZ
         xbtmQZPyu4dr9XfbUdjdyPVnW5IIzdlt0ijceeUQl1Lx6+mFI+nJuyxdX3u2cvGKyg2H
         Si0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739418; x=1790344218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf6tR09RZeKBwJ8QYQsyPe97UrBuN0pxSc2WuBhgy6g=;
        b=njOnum4fHBdqFMwdufp8pTyoWX6Dxho/x6sLspQ/oIqoRPCH47S1IH73/JM919b4LK
         RkzCAsYAmghkgI2mxS0zXgGpdOwbHQcxha6rWuaZuPdkRDiznkS6ZxLHLSfonS5MOrkl
         lfwyDL5XmP2Qc8cmW/nSMgpGsjVEbQxFvLq2min7KgOxoZlPGiyMIGrowWkjKX405eEX
         O6h7EFiBmAtIA3IdXPMFdQnoPWj5VxPv35uDEG4eQwyxgABpU0QKhbzuC1K1uaaqRBxv
         Q/KKLa1rAaPkZEiv+M75MVm3aQbaGIqJC2l6R4bMxqtuRYM5aS5PnZjCrQFkV7mNeh40
         3cfw==
X-Forwarded-Encrypted: i=1; AKwUvByswL+14eJ2HI96m+4aO3SgNDtPlPB/83oaeiawOpHsjMWoh7lpW6orO+4QSp8tlRWXyJYUyOvgabAM7LQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nog7Qj6p00YrIUTBc4A3SMT47q2igGa7WsuUGFqv2iIJ/jWebo
	19WeH9+3wCskPL+fWlG/RA/dsFca2OW6ljQAdWej7gWCDRrJFeplqrvwMvcHuua9MoUmM8vtDEh
	lKK4d88QLSfH5lFXsdrDVJ4TlaZmn32WDzWTfU+kpAXwvSQHzxLtr/owjaa3/HkXxPYA=
X-Gm-Gg: AYBFou3WLE5YNcwRX/jZqiDsJAR0JhNnBUaeF7OP1oCi43mHlV6c2ewTJDU70NWEtM7
	ZvvXIEqueCDG3ymc1xNglOSTZq9nibahKw7DEbJjP0AKGwz5uMPDOwl3T6o1TZBJ3pNFBGdKTQn
	SgQB4znrMD6Vq1GDqKwuQDbpoK6eVqw5nGkwzBuk4Q30cAUWtaUzGL+3y/leUrpu/GcZABHj7KJ
	3p2B0yhvXVhB9Dt0gISKKxI0rMwML4rD7Ycb1ZEDx/3IpPaqlTkC8lkMZaOWsB9N8kY3eywnWzA
	yda7q6ChkxVFyZ/TbFL6s8vKL4l4pbFNKmldr+CAv4QZKjwxfWCO0iSnoG4k1PLb5YYdtx+MtId
	PQQCzG21c4VquSCWv6Urv+HmjsEc=
X-Received: by 2002:a05:6a21:2989:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3dd8c41a7f9mr4999195637.24.1789739417395;
        Fri, 18 Sep 2026 06:50:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:2989:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3dd8c41a7f9mr4999110637.24.1789739416766;
        Fri, 18 Sep 2026 06:50:16 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:16 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:19:37 +0530
Subject: [PATCH v3 3/3] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-vmid-v3-v3-3-f1cbf47bf173@oss.qualcomm.com>
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
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad419a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P3I-59MgXInoGZ6QZ0AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX7Fx1Bpw9Z6Zl
 LjbmyNcDcBfiCi4Alnp+/o5zttyqU8nkNKVo+Pm9kUrjU5Pic+QQJ2wXS78DKSyKuYRtrxufEcv
 ZOZqg1dNgHLlyFeTeBjqpvoSKzHMAW5+tsJPxIRxG+JOUQ0WzPI8d6AlnOGSV4G2iebcPDESuUG
 JqlE/9F3WO4vOg7eB5OcsDBc2o5we1FXbtsbv63zc7GCixVCCyzmwvptX7JmXAHfyYKn/UUNUKr
 p2C3mkvxZpg1ccAhlifinfMgReWwQ6Yq1F+QGbGdReFinVEwl3pVtXjAO8O40V4onstFcAzEmTO
 hgPcF7cR07huiiMo3c4aYm7NYXqblPeOZocMQYXvlM87qQmbhOtj39Z5XPkStgDgOTwdyXlJhdK
 yMRb7HSW4es2QSOZL11RcndxKm6j0NKzrecZ5zU5cdm7OCibqqFjd1gesHrBovaJ4YT/a+3Ni1r
 DcyYgIzaO6f9JkxukXQ==
X-Proofpoint-GUID: E4F9EmACyCvPis7JrlIcxsDVdvFbFvyD
X-Proofpoint-ORIG-GUID: E4F9EmACyCvPis7JrlIcxsDVdvFbFvyD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX6YFzFwoBQWcF
 /3Bgg1FoyTJK4mJaqy/ndoZ5JOo5wCkf4KF8RUV8B15BZo+u8DRZ/89DgTejNiQiGcXDJI3onl8
 bQ/9vSnpv98tRlx4hF7OkZpkSV6doMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180196

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
where SMMU-mapped system RAM is directly accessible, the mDSP cannot
reach the PCM buffers unless they are explicitly SCM-assigned to the
appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
does not function on these platforms.

At probe time, the driver reads the GPR domain_id from the parent APM
device to determine which DSP serves audio. When domain_id matches
GPR_DOMAIN_ID_ADSP the existing SMMU/iommus path is taken and no new
code is exercised. When domain_id matches GPR_DOMAIN_ID_MODEM, the
driver verifies that qcom_scm is available (deferring otherwise) and
that iommus is absent (the two mechanisms are mutually exclusive), then
enables the SCM assignment path.

In the SCM path the driver parses the optional memory-region entries in
DT. The first entry (memory-region[0] / audio_heap_mem) is the
control-path carveout used by the DSP firmware for command traffic; since
the mDSP operates on stage-2 protected memory, this carveout must be
SCM-assigned at probe time itself for the firmware to function. It is
SCM-assigned to HLOS (retained as source owner, RW) plus MSS_MSA and
LPASS (consumer VMIDs, both RW) and restored to HLOS-only ownership via
devm_add_action_or_reset() at device removal. The second entry
(memory-region[1]) is the data-path buffer pool from which per-stream
DMA buffers are carved out. This pool is attached via
of_reserved_mem_device_init_by_idx() so that PCM buffers allocate
directly from the carveout instead of system RAM. Individual buffer
slices are SCM-assigned in pcm_new() after allocation and unassigned in
pcm_free(), so only the actively used slices are shared with the modem
and unused carveout memory remains HLOS-owned.

The VMIDs are static per SoC and hardcoded in the driver (HLOS, MSS_MSA,
LPASS) rather than read from DT, following the upstream pattern used by
rmtfs_mem and qcom_q6v5_pas. Buffer constraints are capped at
reserved_buf_size when the data-path pool is present, and
snd_pcm_set_fixed_buffer_all() is used for both paths so the carveout is
not subject to the preallocate_dma module parameter.

The DT binding is updated to add an optional memory-region property (1-2
entries) and to make iommus optional (removed from the required list),
since mDSP platforms have neither IOMMU nor VMID DT properties.

All new code paths are gated on use_scm_assign (false when domain_id is
not GPR_DOMAIN_ID_MODEM), ensuring existing ADSP/iommus targets are
completely unaffected.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  12 +-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 260 +++++++++++++++++++--
 3 files changed, 252 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..7d0415f2463a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,19 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
 
 additionalProperties: false
 
diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e6e24f3b9922..991feb317940 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -102,6 +102,7 @@ config SND_SOC_QDSP6_ASM_DAI
 config SND_SOC_QDSP6_APM_DAI
 	tristate
 	select SND_SOC_COMPRESS
+	select QCOM_SCM
 
 config SND_SOC_QDSP6_APM_LPASS_DAI
 	tristate
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index bf1f872a09f4..24f920a7c60d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1,20 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2021, Linaro Limited
 
-#include <linux/init.h>
+#include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <sound/soc.h>
-#include <sound/soc-dapm.h>
 #include <linux/spinlock.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
 #include <asm/div64.h>
 #include <asm/dma.h>
-#include <linux/dma-mapping.h>
-#include <sound/pcm_params.h>
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
@@ -36,6 +40,16 @@
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
 #define SID_MASK_DEFAULT	0xF
 
+#define Q6APM_MAX_SCM_REGIONS	16
+#define Q6APM_POOL_MAX_STREAMS	8
+
+struct q6apm_scm_region {
+	phys_addr_t addr;
+	size_t size;
+	u64 src_perms;
+	bool assigned;
+};
+
 static const struct snd_compr_codec_caps q6apm_compr_caps = {
 	.num_descriptors = 1,
 	.descriptor[0].max_ch = 2,
@@ -84,9 +98,88 @@ struct q6apm_dai_rtd {
 };
 
 struct q6apm_dai_data {
+	struct device *dev;
 	long long sid;
+	bool use_scm_assign;
+	bool has_reserved_mem;
+	size_t reserved_buf_size;
+	struct q6apm_scm_region scm_regions[Q6APM_MAX_SCM_REGIONS];
+	int num_scm_regions;
 };
 
+static int q6apm_dai_scm_assign(struct q6apm_dai_data *pdata,
+				phys_addr_t addr, size_t size)
+{
+	struct qcom_scm_vmperm dst[] = {
+		{ .vmid = QCOM_SCM_VMID_HLOS, .perm = QCOM_SCM_PERM_RW },
+		{ .vmid = QCOM_SCM_VMID_MSS_MSA, .perm = QCOM_SCM_PERM_RW },
+		{ .vmid = QCOM_SCM_VMID_LPASS, .perm = QCOM_SCM_PERM_RW },
+	};
+	struct q6apm_scm_region *r;
+	u64 src = BIT(QCOM_SCM_VMID_HLOS);
+	int ret;
+
+	if (pdata->num_scm_regions >= Q6APM_MAX_SCM_REGIONS)
+		return -ENOSPC;
+
+	ret = qcom_scm_assign_mem(addr, size, &src, dst, ARRAY_SIZE(dst));
+	if (ret)
+		return ret;
+
+	r = &pdata->scm_regions[pdata->num_scm_regions++];
+	r->addr = addr;
+	r->size = size;
+	r->src_perms = src;
+	r->assigned = true;
+
+	return 0;
+}
+
+static void q6apm_dai_scm_unassign(struct q6apm_dai_data *pdata,
+				    phys_addr_t addr)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int i;
+
+	for (i = 0; i < pdata->num_scm_regions; i++) {
+		if (pdata->scm_regions[i].addr != addr ||
+		    !pdata->scm_regions[i].assigned)
+			continue;
+
+		if (qcom_scm_assign_mem(addr, pdata->scm_regions[i].size,
+					&pdata->scm_regions[i].src_perms,
+					&hlos, 1)) {
+			dev_err(pdata->dev, "SCM unassign %pa failed\n", &addr);
+			return;
+		}
+
+		pdata->scm_regions[i].assigned = false;
+		pdata->num_scm_regions--;
+		pdata->scm_regions[i] = pdata->scm_regions[pdata->num_scm_regions];
+		return;
+	}
+}
+
+static void q6apm_dai_scm_cleanup(void *data)
+{
+	struct q6apm_dai_data *pdata = data;
+	int i;
+
+	for (i = pdata->num_scm_regions - 1; i >= 0; i--) {
+		if (pdata->scm_regions[i].assigned)
+			q6apm_dai_scm_unassign(pdata,
+					       pdata->scm_regions[i].addr);
+	}
+}
+
+static void q6apm_dai_reserved_mem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -409,8 +502,11 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		size_t buf_max = pdata->has_reserved_mem ? pdata->reserved_buf_size :
+							   BUFFER_BYTES_MAX;
+
 		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
+						   BUFFER_BYTES_MIN, buf_max);
 		if (ret < 0) {
 			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
 			goto err;
@@ -431,17 +527,20 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	}
 
 	runtime->private_data = prtd;
-	runtime->dma_bytes = BUFFER_BYTES_MAX;
+	runtime->dma_bytes = pdata->has_reserved_mem ? pdata->reserved_buf_size :
+						       BUFFER_BYTES_MAX;
 	if (pdata->sid < 0)
 		prtd->phys = substream->dma_buffer.addr;
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		size_t buf_max = pdata->has_reserved_mem ? pdata->reserved_buf_size :
+							   BUFFER_BYTES_MAX;
 		void *pos_buffer;
 
-		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
-		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_phys = prtd->phys + buf_max;
+		pos_buffer = (void *)(substream->dma_buffer.area + buf_max);
 		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
 	}
 
@@ -535,6 +634,7 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 {
 	struct q6apm_dai_data *pdata;
 	struct device *dev = component->dev;
+	size_t buf_max;
 	phys_addr_t phys;
 	int ret;
 
@@ -544,20 +644,23 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	buf_max = pdata->has_reserved_mem ? pdata->reserved_buf_size :
+					    BUFFER_BYTES_MAX;
+
 	if (pdata->sid < 0)
 		phys = substream->dma_buffer.addr;
 	else
 		phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
-	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, BUFFER_BYTES_MAX);
+	ret = q6apm_map_memory_fixed_region(dev, graph_id, phys, buf_max);
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
 	if (is_push_pull) {
 		if (pdata->sid < 0)
-			phys = substream->dma_buffer.addr + BUFFER_BYTES_MAX;
+			phys = substream->dma_buffer.addr + buf_max;
 		else
-			phys = (substream->dma_buffer.addr + BUFFER_BYTES_MAX) | (pdata->sid << 32);
+			phys = (substream->dma_buffer.addr + buf_max) | (pdata->sid << 32);
 
 		ret = q6apm_map_pos_buffer(dev, graph_id, phys, POS_BUFFER_BYTES);
 		if (ret < 0)
@@ -572,20 +675,22 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct q6apm_dai_data *pdata;
 	struct snd_pcm *pcm = rtd->pcm;
-	/*
-	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
-	 * address arithmetic can overflow when the buffer is placed near the
-	 * end of the addressable range.
-	 */
 	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
 	bool is_push_pull;
 	struct snd_pcm_substream *substream = NULL;
 
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata)
+		return -EINVAL;
+
+	if (pdata->has_reserved_mem)
+		size = pdata->reserved_buf_size + PAGE_SIZE;
+
 	graph_id = cpu_dai->driver->id;
 
-	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
@@ -603,6 +708,17 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		if (ret)
 			return ret;
 
+		if (pdata->use_scm_assign) {
+			ret = q6apm_dai_scm_assign(pdata,
+						   substream->dma_buffer.addr,
+						   ALIGN(size, PAGE_SIZE));
+			if (ret) {
+				dev_err(component->dev,
+					"SCM assign buffer failed: %d\n", ret);
+				return ret;
+			}
+		}
+
 		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
@@ -635,15 +751,26 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
 {
+	struct q6apm_dai_data *pdata;
 	struct snd_pcm_substream *substream;
 
+	pdata = snd_soc_component_get_drvdata(component);
+
 	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream)
+	if (substream) {
 		q6apm_dai_memory_unmap(component, substream);
+		if (pdata && pdata->use_scm_assign)
+			q6apm_dai_scm_unassign(pdata,
+					       substream->dma_buffer.addr);
+	}
 
 	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream)
+	if (substream) {
 		q6apm_dai_memory_unmap(component, substream);
+		if (pdata && pdata->use_scm_assign)
+			q6apm_dai_scm_unassign(pdata,
+					       substream->dma_buffer.addr);
+	}
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -1021,6 +1148,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct q6apm_dai_data *pdata;
 	struct of_phandle_args args;
 	int rc;
@@ -1029,12 +1157,104 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
+	pdata->dev = dev;
+
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
 	if (rc < 0)
 		pdata->sid = -1;
 	else
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
 
+	if (apm && apm->gdev &&
+	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
+		if (!qcom_scm_is_available())
+			return -EPROBE_DEFER;
+
+		if (pdata->sid >= 0) {
+			dev_err(dev,
+				"iommus and mDSP SCM path are mutually exclusive\n");
+			return -EINVAL;
+		}
+
+		pdata->use_scm_assign = true;
+
+		rc = devm_add_action_or_reset(dev, q6apm_dai_scm_cleanup,
+					      pdata);
+		if (rc)
+			return rc;
+	}
+
+	if (pdata->use_scm_assign) {
+		int mem_count;
+
+		mem_count = of_count_phandle_with_args(node, "memory-region",
+						       NULL);
+		if (mem_count >= 1) {
+			struct device_node *mem_node;
+			struct reserved_mem *rmem;
+
+			mem_node = of_parse_phandle(node, "memory-region", 0);
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (!rmem) {
+				dev_err(dev,
+					"memory-region[0]: lookup failed\n");
+				return -ENODEV;
+			}
+
+			rc = q6apm_dai_scm_assign(pdata, rmem->base,
+						  ALIGN(rmem->size, PAGE_SIZE));
+			if (rc) {
+				dev_err(dev,
+					"SCM assign memory-region[0] failed: %d\n",
+					rc);
+				return rc;
+			}
+		}
+
+		if (mem_count >= 2) {
+			struct device_node *mem_node;
+			struct reserved_mem *rmem;
+			size_t per_stream;
+
+			mem_node = of_parse_phandle(node, "memory-region", 1);
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (!rmem) {
+				dev_err(dev,
+					"memory-region[1]: lookup failed\n");
+				return -ENODEV;
+			}
+
+			per_stream = rmem->size / Q6APM_POOL_MAX_STREAMS;
+			if (per_stream <= POS_BUFFER_BYTES) {
+				dev_err(dev,
+					"reserved-memory pool too small: %llu bytes\n",
+					(u64)rmem->size);
+				return -EINVAL;
+			}
+
+			rc = of_reserved_mem_device_init_by_idx(dev, node, 1);
+			if (rc) {
+				dev_err(dev,
+					"reserved-memory pool init failed: %d\n",
+					rc);
+				return rc;
+			}
+
+			rc = devm_add_action_or_reset(dev,
+						      q6apm_dai_reserved_mem_release,
+						      dev);
+			if (rc)
+				return rc;
+
+			pdata->reserved_buf_size =
+				min_t(size_t, per_stream - POS_BUFFER_BYTES,
+				      BUFFER_BYTES_MAX);
+			pdata->has_reserved_mem = true;
+		}
+	}
+
 	dev_set_drvdata(dev, pdata);
 
 	return devm_snd_soc_register_component(dev, &q6apm_fe_dai_component, NULL, 0);

-- 
2.34.1

