Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E34EFFAD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889460; cv=none; b=CleIiafYzWEbxrGVcwlFVdJdlNy2LY/icwUhbgjh1cRBu/K4EoI9M2tw6pKS6TCbwliSQytobbT1GjB2ViVjp5s7+RGZsB/VxN+srw/K/KDxiEi36ib5mNlV5puqh7i2YsvfogdjaT8hz2QPw07Ckn29RglR0f8aLN4Q6TchcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889460; c=relaxed/simple;
	bh=mCgv5fLI9GknLVOCcBDHDtIDUNbeq8djaiEAJjQng0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Clkkvhw7thiPUNJZloNaunglETIYzJgTchBP4hTm491iuYV+b7ggY8nqhRtSa6Z/VxvOVFqYMAR1bVjpPFB3IEfUbZCHOpXCtmFKI3kxMpXXChMF6oonPOH+iPkhtqZyjQxbGUFZ508hM2cLLeECCEdZpguEHQfv4cuE9WE381M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFs760fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtTMlvwm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFs760fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtTMlvwm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvI6790856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbLVMk+ijxlJipQa4irlAOZoUoKfi8sOorCU84dimzw=; b=LFs760fWXpq/ct2G
	qG0T2cmCJFqNSxprOA4IHwRAHEzO7quIMn165OJBHWHitqeEYzilstIXSCH5khH/
	iFYMYzJbNgOTsAS6ilrB3yilqLmn0T3/tFLq1FVOxM2mtAWagJkyHHOzCOWTtLO0
	QhOVsCDxNXUwKxR4/+GADMulvzgBZCxh62DxTcdUm4ggLyG5ZRAaAZPaeGDsxGCy
	0JtgmbzdxCTV+etzeNhidbNsJ9l8A2yOdjgOSfAF3xGyKLspN2K903Vwq8YDQZF9
	ILys8YqwHVgkZZL5NpCT6UalS4UKfHLBlC8J9MojZqQF9jhMEN48oMrOeZkjxg8r
	Ujn6rg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrhfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:04:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4634086a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889455; x=1792494255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbLVMk+ijxlJipQa4irlAOZoUoKfi8sOorCU84dimzw=;
        b=BtTMlvwm7/F5Xp2jRH524lfxegxsMS3QGWOyAyajbovfUawhf2RKVxBUvgrWLfjY9z
         SvdiOfF5UHfJ5DeNVR2Zp128rbEfCISp5vAzYv9ZIW+oe0PEa/2PdVdiTdXHywqybsA3
         g4bJDOjIzx+ABDWRQsKmiuSjA1ls4MXT8wALBd3n/i8pJwIlfrHbytGhle2PSumJD3Ms
         rGro/vwsapWrwXMo6xKbho7WJAhrgYhBiR/jq/+TslIu3OtjCmOBdMVUtgiU/hIGXT84
         L72unITLGhRuRTwX2gpc1KnTthJmGOGX3nC5W76rn/uSiGzJwMv+bfRObZQAA5FaUC+T
         6m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889455; x=1792494255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbLVMk+ijxlJipQa4irlAOZoUoKfi8sOorCU84dimzw=;
        b=sSP0xKTiGR2fUOxIw4uXpUS1pocLOwantrOtbIj9KITXYdVdXhcXdJvlporJZwttNZ
         DluKfCkKm0kvouz8EAX8UztXC1slC11x+FViT4bTEsr2gxATHzclR/uJGDiIw2SbEx/9
         JghjUgb8NJ+V7XmvNmCmvZVUcDbNI3ptY2AepM9k88gVoyloP14xR1zAEicr4bWk5ZdA
         WNKpmrDxyBW/ZyXFN0svCCT6bF299NzAW5O+b4uHXSWDR+W4Xwghu0pbrh9QjpL3utpX
         c8iSTQotMdd2bxDGxYrSFm8BXW1CwhrDYp67d631QWABTLlea+CIkgvtkTFZRpzKSYcw
         lQpg==
X-Forwarded-Encrypted: i=1; AKwUvBzUZ0Kn+IopEWCLJnkhDYsg40NjiCILV4FhSSChMI78Yzs9MyFKeUifpR1k/oOFsTV0JMQzM9eQvvFPm6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIphFdIjD/UbA+zPLaVR/81AAHd7mX0t++x15FvlPSpe5AXwW8T
	lprx2VTd2LAILQARJroO4QeeMY//xkQ2bV0dGx2xEDhH55EXQg0SAzUmPWRqeG1WB1gbx/tmBZt
	Tg5WzxoqKUIUJ00ZayxRRGrPRIhQCSXLeMJhqTSJkujTIcok7JG/uVdwiBAvQRy4KazI=
X-Gm-Gg: AYBFou1wljdcFw8ZbKtO/CPC/yDQj6GiBWrGPqISIV+RIneLiLeiktae767h1J3Yn6a
	mEXi28EwXGErmSuxcKQobsun9L1XGFje7oXnDQ0B25RSiOP2GU3VK+MZZRHqqsdVHeoH75HN72g
	gL2rsCV1jOci8QmYDaCsZQTHPy+yfNH1BtPmF2upEZcTyOaIL+Z9ilnBDtN+KpI2hDCS+Z0nDxi
	HLSv3e1x6a/dWGYmqzT8/xoc2N6KeoYgJ0Z0fKIzxRmpn7BnbbhHPnnFz5vApKGaelMCIqNlUzU
	bwUHH5rgufhGkvWLA0f8HFwfu88XaYc32xNtVxUbfEhbBebao8jUjH8/t4WEJYgA35f0/TqtFHw
	C69RiGTLQcoUwYaIqIr5d0ET/84hgJkA=
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr12384449a91.26.1791889454856;
        Tue, 13 Oct 2026 04:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr12384381a91.26.1791889454169;
        Tue, 13 Oct 2026 04:04:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:04:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:50 +0530
Subject: [PATCH v2 8/8] media: qcom: camss: vfe: Add support for VFE 1190
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-8-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=14076;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=pWsVRmS0dRR7pi0OQiI+FjOOjrDDH1CqoZVBUMTkPHI=;
 b=+muFGpT0HE9r/Ryrq4OVnUt3dzdA2tgO0fex5Kx6Uf3ijTEvhJ9y6hj7p0DCgN14LmPI8wSPD
 ozFgUL8laWtBFrY0bhP7bOVf3/4ZaUZr9UJQATMa31xCFLd3tBXfwB2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX0eqchbRFJuUy
 tuw0i90E7bBvtpCNrhyCu/NGPmmjU25A/ZkG3kphgbvTifO4zWMU7guzqiUL/7k/zNSTTSaeM3n
 uB8HIPRRCuMo0BQt/8I62bu4fLKDJqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX2GUVgiLqks4q
 s6R3E9C2Mjp9ehKhJUnWbU0NDpJsS1dYpSKjkQtSf/V77grQW9jzOn7HY92gGCaZK9aepWSZp1b
 oicTqeCObCwGaQTYpugaWBn263Is5slTyvVwKZKBsEN6ascjq0eMsx4udMZcFv7JIEo0TY8SgqR
 dnFc/sidJdJG0sTAHxUDmAZKfEx2Y0AyHqKoPNJd3rBP+cJy6YTdP9uumk5ZBWvEV5oSvdAoazf
 GsCCXxBPXvnILf/raxhmCtlPGR1Jai/JQJ5vq92eMIAAbID0oD46i7vGsP2nQ8GzCSlIa4gSQiq
 pPoLU5L+F08h6ebpZygk8lvYXUNaZ3CCuUZZ6G5oNxl9Itno4J/m1g2seFD0K1OMVjbCA7ndOZ1
 Li7jpyQebXjnX6ATvLbig+ERVhWd2eM2jalqo1IYUTRYL2eyhzPMsZBPFsf8tUKfcpH6i2SlJbz
 ylvdvUdDAaDlCTyD1Jg==
X-Proofpoint-ORIG-GUID: iOhD_TTFeSYEFoVMMk3Eg1LcxenUgtm_
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace1030 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9CBi_IXu8HXpBCLcQ48A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: iOhD_TTFeSYEFoVMMk3Eg1LcxenUgtm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Video Front End (VFE) 1190 found on Hawi SoC.

In the Hawi camera subsystem, the front-end blocks are referred to as
TFEs (Thin Front Ends). This driver continues to use the VFE naming in
some places to preserve consistency with the existing code and avoid
unnecessary renaming. Support is currently limited to three output
lines, matching the constraints of the CAMSS framework.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 200 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 151 ++++++++++++++++
 5 files changed, 355 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d62f978991aab5f5339207b709a2ab018f3759aa..e48df14933fa0e2b1910de5e68bec0b5c57dd1b2 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,6 +28,7 @@ qcom-camss-objs += \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
 		camss-vfe-1080.o \
+		camss-vfe-1190.o \
 		camss-vfe-gen1.o \
 		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1190.c b/drivers/media/platform/qcom/camss/camss-vfe-1190.c
new file mode 100644
index 0000000000000000000000000000000000000000..f331c6f2e7a5da7dfb1a6acf86f2e19f4c352513
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-1190.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-1190.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1190
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+/* VFE-1190 Bus Register Base Addresses */
+#define BUS_REG_BASE				(0x800)
+#define BUS_REG_OFFSET(n)			(0x1000 + (n) * 0x200)
+
+#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x4)
+#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x144)
+
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + BUS_REG_OFFSET(n))
+#define		WM_CFG_EN				BIT(0)
+#define		WM_VIR_FRM_EN				BIT(1)
+#define		WM_CFG_MODE				BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x4)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x8)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0xC)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x14)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x18)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x30)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x34)
+
+/* VFE lite has no such registers */
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x38)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x3C)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x64)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x68)
+
+/*
+ * VFE 1190 write master client IDs
+ *
+ * VIDEO_FULL_Y			0
+ * VIDEO_FULL_UV		1
+ * VIDEO_DC4_Y			2
+ * VIDEO_DC4_C			3
+ * VIDEO_DC16_Y			4
+ * VIDEO_DC16_C			5
+ * FD_Y				6
+ * FD_C				7
+ * RAW_OUT			8
+ * STATS_AEC_BG			9
+ * STATS_AEC_BHIST		10
+ * STATS_TINTLESS_BG		11
+ * STATS_AWB_BG			12
+ * STATS_AWB_BFW		13
+ * STATS_AF_BHIST		14
+ * STATS_ALSC_BG		15
+ * STATS_FLICKER_BAYERRS	16
+ * STATS_TMC_BHIST		17
+ * PDAF_0			18
+ * PDAF_1			19
+ * PDAF_2			20
+ * PDAF_3			21
+ * PDAF_4			22
+ * RDI0				23
+ * RDI1				24
+ * RDI2				25
+ * RDI3				26
+ * RDI4				27
+ * C2PA Y			28
+ * C2PA C			29
+ *
+ * VFE Lite 1190 write master client IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * STATES_BG		5
+ */
+#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm);
+
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	if (!vfe_is_lite(vfe)) {
+		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	}
+
+	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm);
+	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm);
+	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+static const struct camss_video_ops vfe_video_ops_1190 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_1190;
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	vfe_isr_reset_ack(vfe);
+}
+
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	/* nop */
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+const struct vfe_hw_ops vfe_ops_1190 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 58f62a2437a1663a71d34af56178af52d5d10f95..afb5d3458334b0a8ebdaaa8a69e0449e8349cf35 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -2049,6 +2050,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index f0abc10f0e703aad0be03e0218f1996ecaa99ff8..eec15bb8201079b203d29ac6460adb128aeded57 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -249,6 +249,7 @@ extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
 extern const struct vfe_hw_ops vfe_ops_1080;
+extern const struct vfe_hw_ops vfe_ops_1190;
 extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 16047c19b0942bc38da8aa2974e814c3d6a13f69..60322ce7e14af224d3014a3a052f5054a50d92c0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4381,6 +4381,155 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources vfe_res_hawi[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_1190,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe1_fast_ahb", "vfe1", "cpas_vfe1",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_1190,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe2_fast_ahb", "vfe2", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_1190,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 400000000, 480000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_1190,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 400000000, 480000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_1190,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_hawi[] = {
 	/* CSID0 */
 	{
@@ -6175,11 +6324,13 @@ static const struct camss_resources hawi_resources = {
 	.csiphy_res = csiphy_res_kaanapali,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_hawi,
+	.vfe_res = vfe_res_hawi,
 	.icc_res = icc_res_hawi,
 	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_hawi),
+	.vfe_num = ARRAY_SIZE(vfe_res_hawi),
 };
 
 static const struct camss_resources x1e80100_resources = {

-- 
2.34.1

