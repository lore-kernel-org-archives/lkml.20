Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699050B8C3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017737; cv=none; b=CveDHpieCyM3XffC12se/Imbs7vBKLbKlNt8Jl5CiyAdIdIYUw1a6I0iDN9++Wy6F+MBmIkOuh85WMxXK1cKtBWw/QHjfxAUMekIfg1Wq7Fjq13jxV0UWKwlZBqRiP0h2TiSXgnsE/wXa0KFwwsn27XUX2JM1s9XkpocKtrfr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017737; c=relaxed/simple;
	bh=bCyxMrtXEmyjmNZrDqIrBuxDNziccBYFzQqAdOqOfsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZiaQg+pF6jXvzYlqIXSy48TCIpbIJecUHhhn4fi4SUvyVudxcQzsGzVGhBVgYpOGh4CVmQfbUNeQABUuvmz+vUXpwjH8C/FYiLhkmNB55nYj9YQklWP8Nt1+fg6CXCGw1UisteL97FhUxjA+vEU3a9YnB2apDNhD5tuyPWpEcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmDOUPje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0ecW+GA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmDOUPje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0ecW+GA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAIpL2011980
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOvH+k5AGwqT6fPt4nwdgOAAtcuG2W/Fpn6K2wHSVGA=; b=MmDOUPjeBNx466mK
	K1qKq408EvglCFOdOpbkcErzBlMqHaILVBMgwAtf0Lxeu2jx4wfuInGcYJFZIc4s
	1vPR3EhfIVpacNzUDJBiNqEatGlFnKU3Pt2a5hsinHaERYekBJf+w3VNKdbTkI/I
	nqj3ZZ9KSIwwHU0UFwQ4sstlthZGQOablst+oMn5jkpDmM6yZl3oK0I1y3SD1aHY
	rKTLZy5qOcCrve6+L08qDH3n6IrG4cYwpUB6fkcscJYoeA+0/2Vlo5xE8nRbDQ0s
	LMnUW7XVPuFaHu+UchsxW/G6sTM4R9o0GAENsKXqr+CU4bhGm54zZPLqL41Fzo6i
	dP1Q1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d2w0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so47000665ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017732; x=1790622532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOvH+k5AGwqT6fPt4nwdgOAAtcuG2W/Fpn6K2wHSVGA=;
        b=I0ecW+GAxSZoycNrJUSkbx4LsGuGTK/1BajFGFH7/ygk7ejPc623vA1G2jwbtMjMlj
         lXWIjcteW1J/n4DwsJemoTFpYWMkNahScOUMaE2zk+ptQdKuEboGGz4BHzfzFvplRkVa
         4R4l9WNtzEkloQBwfLYLjxtxWqYecS6OtkzBl9y0pFqaQE/3KdcSyqhZeS/4Z4vyyxc1
         mY6apUWaGnseBakbBq+pWpdfyIuyw7xycneIRJ8b6CGzpzNlN/3kpSb4bGd7eqST6UVE
         kQjNI2jWhptlI9QvypfuqOl1i1p0Tt8hNQdkzaZlS2yp6ghFgSmCGXX+OL5Mm/s9Gekv
         xTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017732; x=1790622532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOvH+k5AGwqT6fPt4nwdgOAAtcuG2W/Fpn6K2wHSVGA=;
        b=fkhoEOPm7UfRK5Qn2iRkYhWWfHFMiEjcrCYxjpKNNbk/rh/nqjwQkSQ5hUqPPuHBNJ
         /kze+wH9WYF+x9sq9Iun5TzkTp0UnNyvF7xsrmzJnWTdiTpw3udPsYfnPgEzFYEfe+zq
         ZJSZC6KF7elx3ZqBcPcP5yAeaNGdDlkPEt+tLaGfFkkW1RG7cmDNBqWIZzmD0Gf3v7KH
         YLrmj1wsUgjPvHCg8JqwmWTMtkHmHOvaE8y7JB37+oF6s7n4oI3atTHiYt3kb3nKi84Q
         wp+JZTyheqkUGy9/Qf/QqdyBb/0Icaba/PI899emeIOranwCTC5rAZunJ7i3qKEukPu3
         lUBg==
X-Forwarded-Encrypted: i=1; AKwUvBwNpCeNSunMh8WEHV88hixe2njWyWuEW9BzNkYCLxLjmUeZL2Bf3uzcihywwURq/XIkRcwFzL7utDZDt94=@vger.kernel.org
X-Gm-Message-State: AFuF++mtyPJ+kXHwtLxGtkPgTH4qt74EzYeaEaSkSeTkkc8KbJw0QepH
	gAYbLmk6bUtTVr/vGVqp07FJhVcrkeQ/kZsIB04zR2PYfENRfoltfiemRwHRYyYqJJhAeSsTx99
	aTHknnbL99AHWx9IANVcSrfThj/RRTEps1h2zRxn1npfZN8i1Tj36VotBaZORjt1Z9dI=
X-Gm-Gg: AYBFou0SjjIaS72nv1NCyc/WL0UG80RedjJKNcuLYOUuTcssBXpbCsxZXLeXVC45TbO
	ZoDjRn/BcgrlmYTavSniuIe+nlTwdlT+zNNEGRPQTDuoBWUw2s2V7RFyDsTc4Hsw/EdtuWc3zru
	ZF3bjjxoM3T07IqU0QAw82O2HDCzztYlGS/E7honsM+2rJN2F+wHyM6K2snGG564+IN8x27FOZj
	D01nGMBOmuZkEhsUJON/nLxaQKKA2GC+eeNBdbSgWucdqffLxhPcqPtXZBxYTCOAFZ2PLuM6UwH
	2i9Testi0m+/GW5gDX1Lgbo1xcmYIQPxMAKP9OiNRjFTLQ4DrWfip9zwa++YD5ocXc6du1BxD1D
	LncGkasWgyi8WDKXyJpSRhfBP5ho5
X-Received: by 2002:a17:903:4b0d:b0:2dd:c100:424c with SMTP id d9443c01a7336-2ddc100456amr110512615ad.48.1790017731806;
        Mon, 21 Sep 2026 12:08:51 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2dd:c100:424c with SMTP id d9443c01a7336-2ddc100456amr110512225ad.48.1790017731210;
        Mon, 21 Sep 2026 12:08:51 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:12 +0530
Subject: [PATCH v5 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
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
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: bNT8fxhJhyeqNs9OJNIGmn19vtt5PpUz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX4UWYbAYE3Yxq
 5g9C256cyUCDNsuv8R1eeI9W+55WZbt3nX5wgiWDmTLRCxhZRIjvcqiRmYHpGkyX/yVeBDLLjaE
 oFc8x0jL2X0FfZfpzMNAiQsUw+YTbYU=
X-Proofpoint-GUID: bNT8fxhJhyeqNs9OJNIGmn19vtt5PpUz
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab180c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dZMXeEXeUVJkk_AjZxcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX/dhzpP2atKhY
 AI3C3VH36pOAgmslVQc2Wc5FyDNTe2vT/sdqPecP7cnS/DeTHCVrzsQndMtUdryGcXx27JDhdET
 spMm4dG6zUzeXRlMcfoU0gW+F0+5hRCwE2oZq0+Tsz1ZRg5PLXpS6cKLbr8yqnSqYdYTCCNinpq
 obZ98Yi0HA8teUFjVpAVQXynklWJ4f9ymPVDYUJmqZ8sP+Vefix5S5+Wa68PmqoVtD0erWcmfe6
 gxUDw68jkgcAnZcKkPUuCsMVlhjdeT0muH5oy0r6neY3kyJ5zWSH19FlkFDj3ndweOscS90DUwA
 hY7eEv+Oxe/ytnJoDcev48BWHvTbCWJ6T2goVKAxImSPqQEUFItW/ndWL+G19lArh14PcBNU1Jm
 7xjshApCz3B8+5RTzbB9ZxM2nKvTdDyvEA53OVfG7Pzeyat/SJl88Rvmn1Q1lB5ZQ8hLun+YN5E
 +lQ/yIZHc+UnQ7BHCtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

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
 sound/soc/qcom/qdsp6/q6apm-dai.c | 300 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 280 insertions(+), 21 deletions(-)

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
index bf1f872a09f4..06438fedad0f 100644
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
@@ -603,9 +708,24 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
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
@@ -635,15 +755,26 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
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
@@ -683,6 +814,17 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
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
@@ -700,11 +842,16 @@ static int q6apm_dai_compr_free(struct snd_soc_component *component,
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
@@ -1021,6 +1168,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct q6apm_dai_data *pdata;
 	struct of_phandle_args args;
 	int rc;
@@ -1029,12 +1177,122 @@ static int q6apm_dai_probe(struct platform_device *pdev)
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
+			if (per_stream <= POS_BUFFER_BYTES + PAGE_SIZE) {
+				dev_err(dev,
+					"reserved-memory pool too small: %llu bytes\n",
+					(u64)rmem->size);
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

