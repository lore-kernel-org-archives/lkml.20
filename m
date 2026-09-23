Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D231E39CD11
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134126; cv=none; b=rVVs1U+mRQ7QNyUcOqw1HwJ37Q5Zp5OlgWdKKKgdXilmJ3ZfK6jyyE6j2xlBKOrgquYZXNvehtaHYiY0hDQF20yIrO7Kbvoaibvm8axtahG6I5Vg4CVgw1jEc1A7jUs8AOgt5yKc9/E7ZrVELp8wulOJdJ/VNoa/8cqsY71eTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134126; c=relaxed/simple;
	bh=zQmRpCs+HKKtuuYeiRQtjz6325OgF/Ird/I0LNF1aZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJMl97z+AOctdgdutnVAfMTVnuoMP1c6WDu7r9KR0ik5EzdUt1BLddD9ZDevzXvx1z45ZA6dg1CuGe4hdT80px/vnPaO7G01F7faOpiOHADT4/a3F7fthC95eqmEH5N+fbzR4V3Wt61ZVMbMJ0AGMBw0mf2Act9kDLHPHxLRKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Crm3KKW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQbmYcRg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Crm3KKW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQbmYcRg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N37cF8368055
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yq0sbOBQ1QRBu0fcaBAnrJTjNUgeA5e7YfagjxNrjFE=; b=Crm3KKW/FcoEHn3j
	jftCVnjbP0sUw5/PKDsw9ubdCfDlRD7ok/OVpbNKBsS9mENnD/gS2y/jQS36mhx9
	ZViatMxsOOo1yzCzfEKEIpLn0s/pezAUj+BdKF0SdOqxouHeigYP570qz+dERfJM
	Gr8YwtGwgGnel3x38ent7uT7AkXNI5HuISErVTXRSOqP5WdxnuRAbfWs2n3zmWav
	MPDyVXfpnBCpilO9I/DUUns5VezSVSHMIWyf9xzGFvpp96unxRZ2BC0krg/nUE7C
	Sr2Q/lm/9j6rp9+SEPhdkV1o+2swqdbDms1cen/N3QnMVraU6tHg2k2Hf45ZX3Uj
	610tTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntc6eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso3655175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134123; x=1790738923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yq0sbOBQ1QRBu0fcaBAnrJTjNUgeA5e7YfagjxNrjFE=;
        b=IQbmYcRgJxYHIucruApG7mX4pZxOvg5ibSWe1RrC9XaL8chQVPHoIHGVqUHTikceh8
         WNrXdZcPleinRlriCyhh+Y5ddG+d3pulF+gjI2jO8sDPSkVSGD6LwCzCZzS8GdOZfoR/
         I62og9ZH4BO11MRloM4CeKRuKlYapWIQPwK5F1AAkHMdcPQ5lRe7T46+aWGzP9bR0R7R
         r6dPnP9m3nM4Ir1e/nUgSFNcQiELkNL99g+SAf09nyITnnzeH/vxQFsVu0mOlZ0oL7tx
         DXIAoypNpO05AD5tSy2jxHVEXWYjunUhAr1BaCaf7qzRTTNe+1IlIPVt7ojos7AGZvex
         fPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134123; x=1790738923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yq0sbOBQ1QRBu0fcaBAnrJTjNUgeA5e7YfagjxNrjFE=;
        b=eeELxYDsVmEQlDJqCPnoME8fjfEAb4PfmMpTXeFEHe9HgmqWc7GiL+OTGVclqoWI7N
         GPeIHs+7vOkmy/f5ZBLGU3JuqLc8KPM2+FD1qX99o4eiwxgN3Vu89uqes5/Rcq3kCzRt
         pNn9VLHcN/c6Xu+NjHcGsMFyp5JGYKFv6Es30aoUNYF8HG+AIRn0KRdnZfBOpEUgC60T
         fCCVqIKresH8+NszTL0cxrv9hZS+x181yT8CLROpi1mItCXhehwOQaNzXQyRqFyOx71n
         4L0+Ws83+Il+Mb9qDV+aMhoWvnE/fUGJ5OOhKVoJ6hHmfrqCY/XKm0Rpms1SCkcXfSiX
         Bv6w==
X-Forwarded-Encrypted: i=1; AKwUvBwnnCKqnL0L6KE6Dh4kX3nb+g8o8olDhiY/+wo3JJ05/6FBJhUpcklZES3APqGmAUJss0tDTAsBllk8cfM=@vger.kernel.org
X-Gm-Message-State: AFuF++n6h2AkU7DCmCYfOK0POeIFO6YeLEsPs7fnohWOZ8StwF9Ush+t
	c2YOv/rOZXqa1m61lWSQyt9owuRK0QZ41R5fwBsDQwrswYL06A+hbK+m3rEFa9IEiu1CXK10Mto
	3E+EPhfT9w2PUNXWLVHQWbM7L5cLpn0ooy82VEV/YCu7UAguENYsfeqEgqo700V5kH/Y=
X-Gm-Gg: AYBFou2J2X+adc/L5CEKKilncVHDnAjKLlprYzwdIFo2K5BH3Gaum8sAknbyl5b6Hb5
	FphRW8EJq+Knc/x+Zl7I81xSdUGSldd6PgdzBcg4ipIziVMI10rMBFyEzdxyC9FdHWzHH475tj+
	8C1uLJG7vRtgDi55NPNVZRQba89FabfTicYGoA7s+OdmJqq6lVZOSyGN05hjO5fSBiujJglVcKd
	o+qu0sFlRb4vB/0NrR8fXZevLOsDcuLDITLrQ/8f6ucqr9D+hgLYG2bmHiMwKS/0IagLTtn+MSN
	iEtjHwctHBJl7R8vVcR03k41cJj899s0n5gWlKxSTDvQkGKkfn9eDn0JxYCiv7SbQ/DU8MMVKIS
	jwEP+nYJRaggLGhJ0uruvJdi3Ld7BJ4RdTw8r88Fyx3WsuiXO+DQLJRIAXQYpzxDFRDyUPWe1HA
	==
X-Received: by 2002:a17:902:f60c:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2df69d3a9a8mr13716075ad.16.1790134123256;
        Tue, 22 Sep 2026 20:28:43 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2df69d3a9a8mr13715895ad.16.1790134122782;
        Tue, 22 Sep 2026 20:28:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:42 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:55 +0800
Subject: [PATCH v2 5/7] media: iris: add hawi platform data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-5-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=7422;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=zQmRpCs+HKKtuuYeiRQtjz6325OgF/Ird/I0LNF1aZk=;
 b=cYQV3GpzWK2DHwb06E+AK4+PvPEHH31myr4EBX7EY1mNB56gRDme/4hVTiDZHV5ZgUCUsZhDY
 1TCwjuXprLVAPM0AOre/hbNv1Y0V4AN556dYqBXGD0i9HGvSnqCPHZE
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 4gpg27LWdxzAqlUX3SpTfFJlRD67QjIp
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab3476b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=brcmiJa2iFiq2w5QV1IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX54U9nFAkggPk
 PXY7ZECmwyvyVzQRGsPvXKTwCQJaTNcoRlPDywKKTottalRwSvwhdUzl9gFtsHGcAkJNhs2PqJW
 QvJdxthTmw98tnchR7TswswI/c2mOwmIbEo1v2ke8hTy6B/i+tgRNPwyLfoOUZobQ7TuMrnlLXR
 pz5flvDBuxB04pohHcQP/Dpe+HVBlxDkZSJw1k0j1Be/3chgACLMYFuvClcEZDhg+Wm++yaIqDN
 hpYwaPUuv+u7Vqi10+RitLwfc6olKwvd4cPUwoF4JuEOG89AAehVHdBsPupQ9alTlcoDJFgg71t
 VDj3dhD7mLmpg10X0phsUe30dEPlgCYEIerPGwR6Hw12303i7xGfHnwhZ+cTERn6ATCp+qSGbNn
 MQ00KhPjqLQ05/3Wb65lASA0bhj441SwOYUC+pXdIszvvdCqOsbJKdP0yJJEfAWDQqvpQ4wGgrD
 snuYFc+K1Y+dh+M1YNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX6y0JpD27ZvMJ
 TOow8aW50EVydadyQjf3S89wxpvRCJbMFNj37LyY2Hj+elNF8YofJ3pforQ9CEj7flUd+OGl5xc
 +Wz+GykJCFI3XDfKwiv2lt3T4hGa1d8=
X-Proofpoint-GUID: 4gpg27LWdxzAqlUX3SpTfFJlRD67QjIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

The Iris block in the Hawi SoC is a VPU5 capable of decoding H.264,
H.265, VP9 and AV1, and encoding H.264 and H.265. Add the platform
data entry describing the Hawi-specific clock tree, power domains,
firmware image, bandwidth table, DMA address range, and secure memory
regions so the Iris driver can match the qcom,hawi-iris compatible and
initialize the hardware.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  | 48 ++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 5 files changed, 140 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index adaf2f4ab08984bcf10b8ca7ed424a21635eafbe..b3b5c41c0aaf759d6bf82bef4ec78ae63769b561 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -15,6 +15,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_platform_vpu4x.o \
+             iris_platform_vpu5.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4529f52a30d7f2ef82ec846bced6f9b5aef16558..ce01f7bf4ea9a4ba667d5dd4d04ac013a427c6c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -57,6 +57,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data hawi_data;
 extern const struct iris_platform_data maili_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_hawi.h b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
new file mode 100644
index 0000000000000000000000000000000000000000..90d9282ce59821489c941d7282b3f23e8c06622e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_hawi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MEDIA_IRIS_PLATFORM_HAWI_H__
+#define __MEDIA_IRIS_PLATFORM_HAWI_H__
+
+static const char * const hawi_clk_reset_table[] = {
+	"bus0",
+	"core",
+};
+
+static const struct platform_clk_data hawi_clk_table[] = {
+	{IRIS_AXI_CLK, "iface" },
+	{IRIS_AXIC_CLK, "ifacec" },
+	{IRIS_CTRL_CLK, "core" },
+	{IRIS_HW_FREERUN_CLK, "core_freerun" },
+	{IRIS_CTRL_FREERUN_CLK, "core_ctl_freerun" },
+	{IRIS_CTRL_DEBUG_CLK, "core_debug" },
+	{IRIS_CX_AXI_CLK, "cx_iface" },
+	{IRIS_HW_CLK, "vcodec0_core" },
+	{IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{IRIS_VPP_GATING_CLK, "vcodec_vpp0_vpp1_gating" },
+	{IRIS_APV_HW_CLK, "vcodec_apv" },
+	{IRIS_BSE_HW_CLK, "vcodec_bse" },
+};
+
+static const char *const hawi_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static const char * const hawi_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+	"mm-int",
+	"cx-int",
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu5.c b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
new file mode 100644
index 0000000000000000000000000000000000000000..0240b4dad6ad483feaad480a35c365c7a211ac42
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu5.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_hawi.h"
+
+static const struct iris_firmware_desc iris_vpu50_p2_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu5x_buf_size,
+	.fwname = "qcom/vpu/vpu50_p2_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu5_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu5[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu5[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu5[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu5[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x0d000000,
+		.cp_nonpixel_size = 0x25000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x32000000,
+		.cp_nonpixel_size = 0xcdc00000,
+	},
+};
+
+const struct iris_platform_data hawi_data = {
+	.firmware_desc_gen2 = &iris_vpu50_p2_s8_gen2_desc,
+	.vpu_ops = &iris_vpu5x_ops,
+	.icc_tbl = iris_icc_info_vpu5,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu5),
+	.clk_rst_tbl = hawi_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(hawi_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu5,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu5),
+	.pmdomain_tbl = hawi_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(hawi_pmdomain_table),
+	.opp_pd_tbl = iris_opp_pd_table_vpu5,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu5),
+	.clk_tbl = hawi_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(hawi_clk_table),
+	.opp_clk_tbl = hawi_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu5_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu5_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu5,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu5),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = NUM_MBS_8K * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index be8a102e239c34620d540c54f1f034a9236da7a7..8bfef0df073765d603ada4b06b07162b76067ed7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,hawi-iris",
+		.data = &hawi_data,
+	},
 	{
 		.compatible = "qcom,maili-iris",
 		.data = &maili_data,

-- 
2.43.0

