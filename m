Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CA3C9891
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326530; cv=none; b=aZcATbv1qJyxVr0cyE5poIovD/XhWLmRqoI2YqdXF6+sBibEUxYGYzRArEWjZUnp9gOPFSr1oGqVqOX2hm5kjjb+qX3jsEXHfJ6YIh1NLSTaPbH8NKsP0r+rzNZn1iQGGK1vuX2UCMk+BqeFs3D7lGrjDt8kJgOl71U1yyamqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326530; c=relaxed/simple;
	bh=GSs4w9SfJ/JI++8HTGkgYAAcZcpF6gzWCcvfxGIi2kg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MaODAMipHd1MuCnb1ha+6FM9dj6YrI4T1Ifi2iMKyJUF/9Z3qjyTscWJOqlm0xXt+d4Un7v9fh9wirNpgRRrzLuVBsC31P4sjEcWlPRNnDY3b7tA1/ca94Sse3ObcBMiNcvhEu2HMWdanTI+jlLOBHX2kd2VbZl5I8mnEL5j9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAWL9rhr reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAWL9rhr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeUO21899817
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z4AtQrBRvog
	siFtTQv75LYmwdoNvoyTk+gNK1o7g6Xw=; b=WAWL9rhr1cU8KJ3BcTYVLHXzl3u
	2MxNjgeBRjh16iVhc/XDMrKRomIhPYkhiNiS88sh4TrcAD1a1ho1mFWFV5TITPJZ
	zzM61qcM/LEowQSAixUVnfZiV5QoaFRFl6JHnp7fduY3s3Fg3KRqomTFtQnfnEQh
	zlsvxz4Il897/efFrFXok/bL15msEUUaoIXyC5L7rL07pg7c3pUOZN9N148kkd4n
	KnW4P5GZuSHgVUohQVJCkBKzm25XVsG9Mrw/cjNwBlQaqxTVFmyV0ZQwGKFPOZTh
	WZlNhiPQiGesFRMpTXccRQoWsIAL24Oc8X7BnIapSQ5JJFEFpP8aLIDJnqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhn2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so793296585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326479; x=1791931279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4AtQrBRvogsiFtTQv75LYmwdoNvoyTk+gNK1o7g6Xw=;
        b=w0hw0UD1AIM6+i6jIevSBH7yGkXfDwz43xjLyGOEsPahmcvoK4X3/9tKw/6qy0FMI9
         Ff24OxBn6UNfW3zaJMmtUFYRIVEIj4pZYT9dfS+1l5xVePuoWQ+cRDzBcRM+OOoErR5b
         GA78j/jQrR299mjLyOrz5lrs5PLz2LVxsCkPPG6mhoeHtaqTrVXTpt8nwr8dlNRuTHBE
         VKc1y+B/nSbCLmlK64TdoDo3a9vVLQBHfgK3dlCfjWYvtlRdfwmZ2ntpuByt7iEYZjj8
         s9nhKgeTvjmbKIGfKSvtRCVLf9x6KVs3q76ilSdgzpnWjOHtHutssSyNWaQPxRm159aI
         MqIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn6wOpHyg8jcQf1zlvm4zRk/WJQHH/sMRCZUTd3TMPH0vV1BqNYkxgPvuKQTPO9GC0gh04DCCW2EA7n1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++leKz0AuD0g4KOGW/80V4mRPCaUc8LjTOnOQYmRH6YGQpp8jEMq
	26+YK5i2QWXRlzagC658QnirvxXb0tHkYEvkk4APvjuAOk4FsrjKfuAj4O8laUjh8j/qiyBm0Hv
	CRc2D4PFJ2GC2rvKsupZdHDwgKYwzWqLdpvy7p5iJ6+esMaloyF4wG6r4u5vfJXdKtCw=
X-Gm-Gg: AYBFou12OwnzxUAJRAIPeQIV+oM5ysvxDw1p1IAAkWD+SJ/+DE47fgNzdq6qs9F5Zx2
	7YWIo4aS6HeGGx+2y0GFjRZ0zpe/O5pmIO/O9OiukpoypRWP56KBNibmzGj3eSPtqpUh4VFnquy
	33Bo/oluYmk1YWiAiRw5iQHqnPDzGfidl9cA3psEGRZNZuWO+7MD7pqrpI+yAphHWWtWX2zucRz
	601v3fy/RyfIQ1YaQaizYrAPB4VW7o2mQHQuRf7jEOpAPWEQkB5MPydPoWriBZ1spFKe0yn3AP+
	13sUKY2jay+TlcRyuvIFQke9ZI+m6Tgcg+EqyuCGD4a3RbByA8gIoIi6MjE=
X-Received: by 2002:a05:620a:2988:b0:93e:9807:9787 with SMTP id af79cd13be357-93e9b83041bmr73170085a.72.1791326478804;
        Tue, 06 Oct 2026 15:41:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93e:9807:9787 with SMTP id af79cd13be357-93e9b83041bmr73165085a.72.1791326478324;
        Tue, 06 Oct 2026 15:41:18 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:17 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 27/45] media: qcom: camss: sa8775p: add IFE BUS v3.1x
Date: Wed,  7 Oct 2026 01:39:35 +0300
Message-Id: <20261006223953.3382273-28-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aVRcU36z-KGSPVI-Kv8kAHeQTSIiwzuH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2XYV0WAluuSI
 Cv3UCtoz5EOQOHyeZA3ktZmverirKN0+NFLOk4ZJUYGXVd/GzKlVdDjur+pgQtQUNnDUtlJj1sT
 Vx/A8WDUwv/sQSKn90HQVK742j50+9I=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac5790f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=f5t0ODRzorHQIUvYkhMA:9
 a=UPhfUc_oUKe9iv7q:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2xAY1T4YprCk
 1RmQbqJfj2ZdLqjdwaWLrl4P9Q2UPrOFDPkVXmVlIm562peN01cxH2bD19S5XR+5s+32uOtAztk
 mQ+UfR/5A2Dj/jgVl+1/017clT7C//ckmRThLuFIJrAx3/qOk/saz2NBIUc1cvMCb90UNepPglU
 BmJtaCShMGXG1qFo9E1YzmIbGxkWRd6aDCRMm2WZS6LYGbXsUljdx8AHvt2sG9bRaQxPn/Ch7Zh
 CqL4k7WvAr2ByjVQGRxIS4fZLwWeOksLsspD4tDSrp1F/v66mO5qaNhKuhs0AG8GwrJpZ8fr8lx
 xwHOL2xgux4vSFwaV4cQC4Z0R+nXne4Hx0SnhfIW8vY7tDgaziTfA0HnKXzKJwpXaa+y7uvLtsz
 XCXsjbTSJgYgNqMp3aWrblfjodT/AZFQTHP/caCFeuy0dkzCGJ97JQTD8nJeInEyhUdPYdoFVpV
 dSLgWDKCUHvsL3whmFw==
X-Proofpoint-ORIG-GUID: aVRcU36z-KGSPVI-Kv8kAHeQTSIiwzuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE BUS v3.1x write engine used by the SA8775P full and lite
pixel paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-bus-v31x.c  | 267 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 500b056a906c..2251b57ba38b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-bus-v31x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
new file mode 100644
index 000000000000..c3a99bd0f75e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+
+#include "camss.h"
+#include "camss-ife.h"
+
+/* Block base offsets */
+#define BUSWR_V31X_OFFS		0x400
+#define BUSWR_V31X_LITE_OFFS	0x480
+
+/* Per-client register offset */
+#define BUSWR_V31X_CLIENT_OFFS(n)	((n) * 0x100)
+
+/* Interface interrupt and violation status bits */
+#define BUSWR_V31X_IIF_IRQ_CMD_CLEAR			BIT(0)
+#define BUSWR_V31X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_OVERFLOW_ERR(s)	\
+	((s) & BUSWR_V31X_OVERFLOW_ERR_MASK)
+#define BUSWR_V31X_VIOLATION_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
+#define IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
+#define BUSWR_V31X_IIF_IRQ_S0_VIOLATION			BIT(30)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_VIOLATION)
+
+/* Client configuration field values */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE			GENMASK(26, 0)
+#define BUSWR_V31X_CLIENT_CFG_MODE			GENMASK(17, 16)
+#define BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
+#define BUSWR_V31X_CLIENT_CFG_EN			BIT(0)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT		GENMASK(31, 16)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH		GENMASK(15, 0)
+#define BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE		GENMASK(23, 0)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN		BIT(5)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT		GENMASK(4, 0)
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP		0x5
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP		0x8
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
+
+/* FIFO limit and frame-based RDI defaults */
+#define BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH		2
+#define BUSWR_V31X_RDI_DEFAULT_WIDTH			0xffff
+#define BUSWR_V31X_RDI_DEFAULT_STRIDE			0xffff
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT	GENMASK(2, 0)
+
+/* Common registers */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE_REG		0x00000008
+#define BUSWR_V31X_WM_TEST_BUS_CTRL_REG		0x000000fc
+#define BUSWR_V31X_IIF_IRQ_MASK_S0		0x00000018
+#define BUSWR_V31X_IIF_IRQ_CLEAR_S0		0x00000020
+#define BUSWR_V31X_IIF_IRQ_STATUS_S0		0x00000028
+#define BUSWR_V31X_IIF_IRQ_CMD_REG		0x00000030
+#define BUSWR_V31X_STATUS_CLEAR_REG		0x00000060
+#define BUSWR_V31X_VIOLATION_STATUS_REG		0x00000064
+#define BUSWR_V31X_OVERFLOW_STATUS_REG		0x00000068
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_REG	0x00000070
+
+/* Per-client registers (relative to client base = module_base + CLIENT_OFFS(n)) */
+#define BUSWR_V31X_CLIENT_CFG_REG		0x00000200
+#define BUSWR_V31X_CLIENT_ADDR_IMAGE_REG	0x00000204
+#define BUSWR_V31X_CLIENT_IMG_CFG0_REG		0x0000020c
+#define BUSWR_V31X_CLIENT_IMG_CFG2_REG		0x00000214
+#define BUSWR_V31X_CLIENT_PACKER_CFG_REG	0x00000218
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG	0x00000270
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG	0x00000278
+
+static void ife_buswr_31x_acquire(struct ife_device *ife, void __iomem *base)
+{
+	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
+
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
+		ctx->base = base + BUSWR_V31X_LITE_OFFS;
+	else
+		ctx->base = base + BUSWR_V31X_OFFS;
+
+	ctx->dev = ife->camss->dev;
+}
+
+static void ife_buswr_31x_release(struct ife_buswr_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void ife_buswr_31x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
+				    const struct camss_ife_wm_config *cfg)
+{
+	void __iomem *base = ctx->base;
+	bool align = cfg->packing_fmt >= BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP &&
+		     cfg->packing_fmt <= BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP;
+	u32 pattern = 1;
+	u32 period = 0;
+	u32 bytes = cfg->bytes;
+	u32 stride = cfg->stride;
+	u32 lines = cfg->lines;
+	u32 rval;
+
+	if (cfg->mode_config == BUSWR_CLIENT_CFG_MODE_FRAME_BASED) {
+		bytes = BUSWR_V31X_RDI_DEFAULT_WIDTH;
+		lines = 0;
+		stride = BUSWR_V31X_RDI_DEFAULT_STRIDE;
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_CGC_OVERRIDE,
+		       base + BUSWR_V31X_IIF_CGC_OVERRIDE_REG);
+	writel_relaxed(0, base + BUSWR_V31X_WM_TEST_BUS_CTRL_REG);
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_CFG_MODE, cfg->mode_config);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN, align);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_PACKER_CFG_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH, bytes) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT, lines);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE, stride);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG2_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval |= BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN;
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval &= ~(BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static bool ife_buswr_31x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	u32 rval = readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_OFFS(wm) +
+				 BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG);
+
+	rval = FIELD_GET(BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT, rval);
+
+	return rval >= BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH;
+}
+
+static void ife_buswr_31x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
+				    dma_addr_t *addr)
+{
+	int i;
+
+	for (i = 0; i < num_wms; i++) {
+		if (addr[i])
+			writel_relaxed(addr[i], ctx->base + BUSWR_V31X_CLIENT_ADDR_IMAGE_REG +
+				       BUSWR_V31X_CLIENT_OFFS(wm[i]));
+	}
+}
+
+static u32 ife_buswr_31x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	return readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG +
+			     BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static u32 ife_buswr_31x_irq_status(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 bus_stat;
+	u32 iif_stat;
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_OVERFLOW_STATUS_REG);
+	writel_relaxed(BIT(0), base + BUSWR_V31X_STATUS_CLEAR_REG);
+	if (IS_BUSWR_V31X_OVERFLOW_ERR(bus_stat)) {
+		writel_relaxed(bus_stat, base + BUSWR_V31X_STATUS_CLEAR_REG);
+		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
+	}
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_VIOLATION_STATUS_REG);
+	if (IS_BUSWR_V31X_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_IMG_SIZE_VIOLATION_REG);
+	if (IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
+
+	iif_stat = readl_relaxed(base + BUSWR_V31X_IIF_IRQ_STATUS_S0);
+	writel_relaxed(iif_stat, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	if (iif_stat) {
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat))
+			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(iif_stat))
+			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+
+	return iif_stat;
+}
+
+static void ife_buswr_31x_irq_enable(struct ife_buswr_ctx *ctx)
+{
+	writel_relaxed(~0, ctx->base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+}
+
+static void ife_buswr_31x_irq_disable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(0, base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+}
+
+const struct ife_hw_buswr_ops ife_buswr_31x_ops = {
+	.acquire	= ife_buswr_31x_acquire,
+	.release	= ife_buswr_31x_release,
+	.irq_enable	= ife_buswr_31x_irq_enable,
+	.irq_disable	= ife_buswr_31x_irq_disable,
+	.wm_config	= ife_buswr_31x_wm_config,
+	.wm_enable	= ife_buswr_31x_wm_enable,
+	.wm_disable	= ife_buswr_31x_wm_disable,
+	.queue_buf	= ife_buswr_31x_queue_buf,
+	.consumed_addr	= ife_buswr_31x_consumed_addr,
+	.irq_status	= ife_buswr_31x_irq_status,
+	.is_fifo_full	= ife_buswr_31x_is_fifo_full,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c163c336fcc3..efbb1e75d550 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -397,6 +397,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
-- 
2.34.1

