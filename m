Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA44446FC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181274; cv=none; b=bDuPaOFSYoMep69LxPDA2xTk0KqC84RB82IYDxXfYiw8UuG3JwAJxc1WnsFv0CDhRkPPcKYlPHuDD87cVm4AhF96Uj6eaEQuwHvGDi4v3vcnY8sx0tnR3/HYcb/GwtiTNkXITgVNakHAC3jXVecr78sgJiVDOi4NpLeknBB7ae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181274; c=relaxed/simple;
	bh=uDdbjW1wgPXLst03nu/80GZBOsK0nNDqK4JPVRaArJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVDeWVd4nVl02W/CNi9H68fAw7r9CMqjHv5D+93jXSLu80lF92OTuIitS1Fz9i30SAyteEj0OX7EpTF6xN6iDd69IfFs2GqJAJKCfRs7V5RZTVt6Ap04gnAWo038twbW/XNs3+Or/9j4f/hYfTbh9Wu06UI+K9z69ugD4ENOFW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3MGHxkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUPmeTxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3MGHxkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUPmeTxC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU6Nd741679
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYgq8ukVkamqpLx6ueAcBUNKVzC7nymdRLqglEcoI60=; b=f3MGHxkkOZiSxEE0
	qW4tPOMzJpfuDv+NvVTeQiDxGYSiBZKEmINRNOnh3BqeOqwMcxTeiiweXT6qlvlA
	dSGIilQ4WGuS7GJrr2ZKvtZjN7aqIfRqeGlNbZKD/5wPRJKL+JwzJYMSdgWlOPFh
	bvA/RYjFmShaY/3PKJlLX/mLqkQZqWSeQAJMym3BYVhglzc6xJbLBsumdu0fohPD
	6bWVbLxvQnqEOMEhuEkBLXcAm6I4Vn0HnzOPt7/5jJRgjaOy1Pt008/r9Zfncqm/
	3y4xJaL3hZnVt/7d6Bc5Me+gLcQwzQcZBtEeJ0faMSbLnGWUy/kXbRK6uJyDe1m8
	OP6d4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgwxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so10366065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181257; x=1790786057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYgq8ukVkamqpLx6ueAcBUNKVzC7nymdRLqglEcoI60=;
        b=bUPmeTxCbKOKNsSoNZF+XRTjD8jK79crsfkHxG7AKM1goOSlGj6921vlFJEN4Q0Evp
         pODA3DdFvPPDGt9whNZWrdBGn+UBHbNcsG7FAOjoS+V16a/q4+4+2UIqG9kR4HymKY+j
         gQ8Ky0hUIzMsGIKSTpZymLdvpmZMsif3NIJLkBlcNAZHHsBOd4/DL+s5F3Log9vDt2FS
         tNpbN272rRSRN7B+g7Je9resNM1I/F8HHpyc5syz3h0wztgD5YoBR7ExytYKeaDpV+jA
         ccFrWUEihrtYu3EKvnajRyE62qmTeC+WsRjl0DAhxhfqmpzuC2bTdaNAkZnn6em+q/jL
         W/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181257; x=1790786057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYgq8ukVkamqpLx6ueAcBUNKVzC7nymdRLqglEcoI60=;
        b=0GoBjeu4nyLZtYy3Q9x4KWLBBu97AaCb1Y52Xxnw7OLHMY4yL+cJU7sriKJtk0gKxW
         HA3B3h866nyL1u00SLy5h/vfKN78k4TnQO702LuZmj0cW2y8ygimo9RLGwRE1VjxH6a0
         3arQWcb1pcXCdX8NnU8vqdhCQe/AjGAUv0KRm6PgD1kru5OPV1oSKdZt2fb21Kld4Pca
         yTD5plZTiheLZiWXZcJtZkD6VPDhC1JRd2UrOOAKwA4n5ov7qEYI+KeQDtR2HXqNTMr7
         0F3RJXh6ZQJgkrlIzC6XL5GhvxskgSKgVVSZ5eqXTyCCx9aXb3n9QIAaobR2J/7+n9v6
         78jg==
X-Forwarded-Encrypted: i=1; AKwUvByUy+WtfyjrU6JzPaaWaAv9YMPIM8NGXRrctzlLzxFpSbVuZjIU3rsZntKQaqHjipTHBYCK2/cJixjhL5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kkvTlxr+S/GCpDzE+bQxb74KZEof1izCDR1UTGU3iu94GPRGrG
	sJHo6wsa9YQhfi2ZuQnO1lgr7KL6+Wtd2m4QQH3p8EuV45KPNuq34vrzFa7XuF3+QUI64bBvpBJ
	vEksg2aBNe0We9Xdq6S3VwbV8FsWimT5fOo5sXCrrSnd+z2uh8JiBtd/QFDRlRwa5MF0=
X-Gm-Gg: AYBFou19xVOmDY+9VqPUnN7IcasgosQn/Q+VHawFVhTnvvjLGzrIb0o5Ncj7t/4+1ag
	uTuYnDYlRxHi65KHVbFfGz02p39secOwD9n05xoAiGHwbgkDDNYsJhUDXDhSwNvOAEOTQuJH3rX
	QQIQM/OuTaHqHuX41AYZn1YWz7I42uviud2fw5PDj7YXaVvjjGTgkO09ZlW+vemZJZlTiptWUHt
	hyhglSnULr1NhBnepyx3MkmVnoCKxrZerp/zzj+X8+8IvaAA0OISSdbfRDONZyZnp+VYicyJbnQ
	1W1MschB4lTWXSePVZhvcDCF6AlqvK3mUjzEBaHRmXTKodyuWs85zY7u2wxFAkkwGkqT6ebwB8s
	srhsfwUIEkqboQTlTNJTZ6vtZrk8=
X-Received: by 2002:a17:902:e886:b0:2de:834b:b59e with SMTP id d9443c01a7336-2df69e097e6mr27291485ad.71.1790181256429;
        Wed, 23 Sep 2026 09:34:16 -0700 (PDT)
X-Received: by 2002:a17:902:e886:b0:2de:834b:b59e with SMTP id d9443c01a7336-2df69e097e6mr27291085ad.71.1790181255789;
        Wed, 23 Sep 2026 09:34:15 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:15 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:41 +0530
Subject: [PATCH v6 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-4-3d61a0319b1c@oss.qualcomm.com>
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
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfXzjucx9wzGGPD
 pNE4iq52+fTYWjDEjYvARZmzse6Cx+8Q2QrslYKdlUbB/EtX4jHbLHBfwTCXi5NG91Ut4ttRkA/
 RuLWHJ7Qdjb01b3fbKv+iY37JdJlkiDhzSGfmYhhpr4aOb1a7TdiS5o2Brqe/vJWiuEnN6MVAJF
 naYgLxgIp6Xh3SN4cn3RtrKXB5OvNg0aT1YDuGeWvrl39SecvZAfMc+2FUP5/ix9X3BwmRhiyBc
 nBZIIAJ4tZmfj/JyU+pTz62tMJ+DXIU7ywCucaDl3cP1v7UGt6vRyXZhOgbCmi0HSXP6v/LdaLX
 Z1oFHNQsPoswp7ri1T761Ldot2ZRsnT7UAlnASPjldMpZZ+874MT5X/s1oEIJ3bvnHC2UWAprsK
 0XsohqZM3uiLRxk3+aDzVSU/UuY4BZOTso2fZIlegBtUZfxVi7xprGFc1/Tnx5O8cfss+s4hOMB
 o4QazeSFNIH39wJkdRQ==
X-Proofpoint-GUID: WvIhaKKXmyPgW3UXarW9jG7hNuadB9nF
X-Proofpoint-ORIG-GUID: WvIhaKKXmyPgW3UXarW9jG7hNuadB9nF
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ff89 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KIwk5gsWPQ7PVTwXBQkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX2zdSHdj3I3qX
 qXfR2kRl89d9XNQz4gtyJ6tctxj4rGEzUb/9t/A0674LrX/gY7RxKbiuuKivWXiixYyI5gVtMIB
 onM1xZQ0PritwCd8SO7tzfVjj3w0h2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230065

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
directly from the carveout instead of system RAM.

The data-path pool (memory-region[1]) is SCM-assigned to the consumer
VMIDs as a single whole-pool operation at probe time, rather than
per-stream in pcm_new()/compr_open(). qcom_scm_assign_mem() consumes an
entry in a small fixed-size TZ memory-protection table that is shared
platform-wide; assigning individual per-stream slices (up to
Q6APM_POOL_MAX_STREAMS times) exhausts that table and hangs the SMC
call, which was observed as a crash while bringing up the sound card on
Shikra. Since the whole pool is already accessible to the mDSP once
assigned, pcm_new()/pcm_free()/compr_open()/compr_free() skip the
per-buffer SCM assign/unassign entirely when the data-path pool is in
use (has_reserved_mem), and only fall back to per-buffer assignment when
use_scm_assign is set without a data-path pool present.

Compressed audio streams follow the same pattern: the DMA buffer
allocated in compr_open() is SCM-assigned immediately after allocation
and unassigned in compr_free() before the buffer is freed, unless it was
carved from the pre-assigned data-path pool.

The VMIDs are static per SoC and hardcoded in the driver (HLOS, MSS_MSA,
LPASS) rather than read from DT, following the upstream pattern used by
rmtfs_mem and qcom_q6v5_pas. Buffer constraints are capped at
reserved_buf_size when the data-path pool is present, and
snd_pcm_set_fixed_buffer_all() is used for both paths so the carveout is
not subject to the preallocate_dma module parameter.

All new code paths are gated on use_scm_assign (false when domain_id is
not GPR_DOMAIN_ID_MODEM), ensuring existing ADSP/iommus targets are
completely unaffected.

Co-developed-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig           |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c | 317 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 297 insertions(+), 21 deletions(-)

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
index 033197bdd870..b0b10ba51c99 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1,20 +1,25 @@
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
+#include <linux/mutex.h>
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
@@ -36,6 +41,16 @@
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
@@ -84,9 +99,103 @@ struct q6apm_dai_rtd {
 };
 
 struct q6apm_dai_data {
+	struct device *dev;
 	long long sid;
+	bool use_scm_assign;
+	bool has_reserved_mem;
+	size_t reserved_buf_size;
+	struct mutex scm_lock; /* protects scm_regions and num_scm_regions */
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
+	mutex_lock(&pdata->scm_lock);
+
+	if (pdata->num_scm_regions >= Q6APM_MAX_SCM_REGIONS) {
+		mutex_unlock(&pdata->scm_lock);
+		return -ENOSPC;
+	}
+
+	ret = qcom_scm_assign_mem(addr, size, &src, dst, ARRAY_SIZE(dst));
+	if (ret) {
+		mutex_unlock(&pdata->scm_lock);
+		return ret;
+	}
+
+	r = &pdata->scm_regions[pdata->num_scm_regions++];
+	r->addr = addr;
+	r->size = size;
+	r->src_perms = src;
+	r->assigned = true;
+
+	mutex_unlock(&pdata->scm_lock);
+
+	return 0;
+}
+
+static void q6apm_dai_scm_unassign(struct q6apm_dai_data *pdata,
+				   phys_addr_t addr)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int i;
+
+	mutex_lock(&pdata->scm_lock);
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
+			mutex_unlock(&pdata->scm_lock);
+			return;
+		}
+
+		pdata->scm_regions[i].assigned = false;
+		pdata->num_scm_regions--;
+		pdata->scm_regions[i] = pdata->scm_regions[pdata->num_scm_regions];
+		mutex_unlock(&pdata->scm_lock);
+		return;
+	}
+
+	mutex_unlock(&pdata->scm_lock);
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
@@ -409,8 +518,11 @@ static int q6apm_dai_open(struct snd_soc_component *component,
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
@@ -431,17 +543,20 @@ static int q6apm_dai_open(struct snd_soc_component *component,
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
 
@@ -535,6 +650,7 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 {
 	struct q6apm_dai_data *pdata;
 	struct device *dev = component->dev;
+	size_t buf_max;
 	phys_addr_t phys;
 	int ret;
 
@@ -544,20 +660,23 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
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
@@ -572,20 +691,22 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
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
@@ -603,9 +724,24 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		if (ret)
 			return ret;
 
+		if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
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
-		if (ret)
+		if (ret) {
+			if (pdata->use_scm_assign && !pdata->has_reserved_mem)
+				q6apm_dai_scm_unassign(pdata,
+						       substream->dma_buffer.addr);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -635,15 +771,26 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
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
+		if (pdata && pdata->use_scm_assign && !pdata->has_reserved_mem)
+			q6apm_dai_scm_unassign(pdata,
+					       substream->dma_buffer.addr);
+	}
 
 	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream)
+	if (substream) {
 		q6apm_dai_memory_unmap(component, substream);
+		if (pdata && pdata->use_scm_assign && !pdata->has_reserved_mem)
+			q6apm_dai_scm_unassign(pdata,
+					       substream->dma_buffer.addr);
+	}
 }
 
 static int q6apm_dai_compr_open(struct snd_soc_component *component,
@@ -683,6 +830,17 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
+	if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
+		ret = q6apm_dai_scm_assign(pdata, prtd->dma_buffer.addr,
+					   ALIGN(size, PAGE_SIZE));
+		if (ret) {
+			dev_err(dev, "SCM assign compr buffer failed: %d\n",
+				ret);
+			snd_dma_free_pages(&prtd->dma_buffer);
+			return ret;
+		}
+	}
+
 	if (pdata->sid < 0)
 		prtd->phys = prtd->dma_buffer.addr;
 	else
@@ -700,11 +858,16 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct q6apm_dai_data *pdata;
+
+	pdata = snd_soc_component_get_drvdata(component);
 
 	q6apm_graph_stop(prtd->graph);
 	q6apm_free_fragments(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
 	q6apm_unmap_memory_fixed_region(component->dev, prtd->graph->id);
 	q6apm_graph_close(prtd->graph);
+	if (pdata && pdata->use_scm_assign && !pdata->has_reserved_mem)
+		q6apm_dai_scm_unassign(pdata, prtd->dma_buffer.addr);
 	snd_dma_free_pages(&prtd->dma_buffer);
 	prtd->graph = NULL;
 	kfree(prtd);
@@ -1021,6 +1184,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct q6apm_dai_data *pdata;
 	struct of_phandle_args args;
 	int rc;
@@ -1029,12 +1193,123 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
+	pdata->dev = dev;
+	mutex_init(&pdata->scm_lock);
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
+			if (per_stream <= POS_BUFFER_BYTES + PAGE_SIZE) {
+				dev_err(dev,
+					"reserved-memory pool too small: %pa bytes\n",
+					&rmem->size);
+				return -EINVAL;
+			}
+
+			/*
+			 * Assign the whole pool to the consumer VMIDs once here,
+			 * instead of per-stream in pcm_new()/compr_open(). Each
+			 * qcom_scm_assign_mem() call consumes an entry in a small
+			 * fixed-size TZ memory-protection table shared platform-wide;
+			 * assigning per-stream-slice (up to Q6APM_POOL_MAX_STREAMS
+			 * times) exhausts that table and hangs the SMC call.
+			 */
+			rc = q6apm_dai_scm_assign(pdata, rmem->base,
+						  ALIGN(rmem->size, PAGE_SIZE));
+			if (rc) {
+				dev_err(dev,
+					"SCM assign memory-region[1] failed: %d\n",
+					rc);
+				return rc;
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
+				min_t(size_t,
+				      per_stream - POS_BUFFER_BYTES - PAGE_SIZE,
+				      BUFFER_BYTES_MAX);
+			pdata->has_reserved_mem = true;
+		}
+	}
+
 	dev_set_drvdata(dev, pdata);
 
 	return devm_snd_soc_register_component(dev, &q6apm_fe_dai_component, NULL, 0);

-- 
2.34.1

