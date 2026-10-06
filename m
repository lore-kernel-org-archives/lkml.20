Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AA3A4F4A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326444; cv=none; b=AfLf4aP/P9a/SHAFhDtzbiHca/ddBWxv2Eqsn13NcpaTaSxk/o7hfxqyYAn8AQG7Oi/Lxn5wfKyMDQmJ0/1Zy9fGK3KO6IXV8EY1G5ikkeJY2KXzbtkJo5BnTOd3ffwKQcIWfVOeBrteUPU5M3LURNw8l4mbYcAp2uFQeIZzqrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326444; c=relaxed/simple;
	bh=jCHLyjvh3+T9dpBgJBN/rrtKwH/018pWKvdxYxje5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PkkCWAnwvBPMIbO0ZI/D99WGVVb+1lU6s09gBMxQ/jrcruaeSLBhKU3zElNHn+/p/1w7RiWxGubVG7APtixX9vf/+D6hfmT2VwibVAiNhTgB/y4nISRgKQ6Krl5tttnvG0j9KEEWTw6V/x6scrLC40NLWmunGsb3/4rTJKE+dpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkdrMI4f reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkdrMI4f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNvJ1899642
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8sfe/XIDFZl
	aQRDiVJ5wqvQe6ukasnDP7luJc5DwaJ8=; b=hkdrMI4fIse/pLu8hkEU/e+2GeI
	GXUcjlf6YftvPGRQYo3ONQsGTUa6gVSKoQx9HrFz8vBYwIiC99uAJX8L1Nh30LeM
	+sZEamthu5+9dZrMPMy1j2J3g7VMI2W+SQXeG26w4lA3cb8l58gn2ELBP05COSJJ
	1b+k0ukt9adP7orf+kLKCpE3gG4nZQnjePZ0Ff2T0QrJ/y8gZkAywL1MzaJLhdQO
	GXPanylJVmfZH59ee8pBfQyh7OLEAlgvdyQP9jBCwuP5hSNcfxZjrRhhXh4gWcGq
	LujAIBG4Htxe8BXud0EZWukaQNiYYhtj7FH5asvE5h85mUSyF/Jvw74UxXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhmyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dea1b6c89so555068685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326430; x=1791931230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sfe/XIDFZlaQRDiVJ5wqvQe6ukasnDP7luJc5DwaJ8=;
        b=rUPjqK54aLI44MufoVUAJrpOPJl5fKr1PkHh+9W0ccRgROMkmVSxPhceTr5cVv+ZP1
         1MpPyBumSzXKSL87EFZeLHQJKZNluHrSMapO4jS8ym317vmaeGdXTBmv8C5+62df1L3B
         PTitz49UKsvU9TZ0QYUNs6j4xhqSIQMGp8t317p8ZAlfMvoMlLwubCnFPZaUrlkj4KXX
         bjNgj0kHnfWG7/OxztanU9VTtAmSG2YDhALJKAVRwaZiUqBQNEq15bBfqIw2zuSGc3gy
         8PbRPb0kt4b+HzwGY8oTKpE/+jz09synJN9N510Kki4wVaJg1+SiPCRE+RhLxHAnn3vq
         gkwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM0gjVNhrwgsjMlC2fNDyX98jxJIyZEIeKianIaotRtqxbcy1k9NRjNt7iQBLYHCq3QXul1GM9/6g4BbI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ+l61hJIf98oxwKox3hbGnl9+nUUWwgn0AQNg2vRygueLGqtB
	8VlkrWeLjTu5ISAr+KKbeVFdUYn1Gqk+aittHP2vPt/x1tFL9DyqD505sIU8AGTZIHzrMskB/tr
	P7Sy2HF4x2NWO0zATUw4eNlCnqiegPBX43Q2IZQUj9A74eYSgBASRmDZ98uUCoeQxsDo=
X-Gm-Gg: AYBFou11gRxdm/ILKC/EQs3xL6Ds7uL8HBfB5nMaaaRNHIVHpF/qqcgAw2mrV6a2izD
	9TnTFMKiTVGG1/s6kMBu1VQSeWGTR6EJ7fcUetofzz7yTytPPP+Ot9JZf5DeXIYaiJ6N3QONkL8
	J4854G5PsyAJXH62Mupd+eLP+MGredTEuzTySQYOuV0hgpkjLI2riRlVtegQTLGxGAwr95tQkqS
	NZu1VVwOex3ZU+0Io7STi5Hy9QOFU0D8r0ut3zAsmbHyf/5ZwTQ/dM2tRpnmMHfMZ4bL3BT5KZ4
	xIN7y/h6wVleoEshD8aEtoWlmgtP1M9PsQebhg83sy9WiNQCUh35MeJ6BdE=
X-Received: by 2002:a05:620a:4110:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-93e9b2e965bmr88084785a.4.1791326429696;
        Tue, 06 Oct 2026 15:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-93e9b2e965bmr88079985a.4.1791326429128;
        Tue, 06 Oct 2026 15:40:29 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:28 -0700 (PDT)
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
Subject: [PATCH 07/45] media: qcom: camss: sm8250: add IFE BUS v20x
Date: Wed,  7 Oct 2026 01:39:15 +0300
Message-Id: <20261006223953.3382273-8-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: qqwa6Hw9GPJbEmSfFzISp5GFJ38pzH-b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX62uHIlrgqmXx
 tw2Z7LMtjdpWQkLIFuC1Xn3tcpX/HaD+Rt+vIH+1ViyuA7JxgbYrEdrge9IOrkz3/h4/M/bJX1H
 gJ4N5h7ZAaEFqi0qaQRYe6B50+ZIo7M=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac578de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=f5t0ODRzorHQIUvYkhMA:9
 a=8DUjIpf0rZZqWCZ8:21 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7GhQm5F2Ococ
 i4dLFugqWIoqsdOf60g8cJtxUScXGkF3/7YJLRIAcaHyt75ZCIUKI/wWmdNsYLWhpkHjVDLM6ru
 5qFbOrEQ6MCQ1teB4/8GY3LaBUE8nC/eLclDhWg2N/8KbvQCzl/ngpPBnXsP52b7IHd590abqvt
 UNjrFpM8Woa2cAU3nnYvcIWoBplme8m7y19YFPIotvzev/PAqDZv4bI+0z1gkDlgsscQm3RK2oL
 QgCrzhlNcdHBytBC7S16xeIvylciF2egCIlvS1Rp/Mg4wkPanJq3EG8jRRH1Gxw2yQ8Us34qRDf
 dX7khsqMlJqU6IfcWz1Vk0Ph5bXnmw5vfxBS3pwICdN5e590TfIWlkIQfoR7Wtbd9/RsPMtFMkU
 JChN2ezK0ke5iBt0Xo1ekGqyBwMTMjoU0jBjRT4DQPWf21FCgn/tStwpQ9R4ZpS65duJ+5jW77U
 L/xQVJQ9h+ClKOvlMAw==
X-Proofpoint-ORIG-GUID: qqwa6Hw9GPJbEmSfFzISp5GFJ38pzH-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE BUS write engine used by the SM8250 full and lite pixel
paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-bus-v20x.c  | 287 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 3 files changed, 290 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index b79c40626c40..e30fe07b16f4 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,6 +14,7 @@ qcom-camss-objs += \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
+		camss-ife-bus-v20x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c
new file mode 100644
index 000000000000..3e27494d91da
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v20x.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+
+#include "camss.h"
+#include "camss-ife.h"
+
+/* Block base offsets */
+#define BUSWR_V20X_OFFS		0xaa00
+#define BUSWR_V20X_LITE_OFFS	0x1a00
+
+/* Per-client register offset */
+#define BUSWR_V20X_CLIENT_OFFS(n)	((n) * 0x100)
+
+/* Interface interrupt and violation status bits */
+#define BUSWR_V20X_IIF_IRQ_CMD_CLEAR			BIT(0)
+#define BUSWR_V20X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V20X_OVERFLOW_ERR(s)	\
+	((s) & BUSWR_V20X_OVERFLOW_ERR_MASK)
+#define BUSWR_V20X_VIOLATION_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V20X_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V20X_VIOLATION_ERR_MASK)
+#define BUSWR_V20X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
+#define IS_BUSWR_V20X_IMG_SIZE_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V20X_IMG_SIZE_VIOLATION_ERR_MASK)
+#define BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
+#define IS_BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
+	((s) & BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
+#define BUSWR_V20X_IIF_IRQ_S0_VIOLATION			BIT(30)
+#define IS_BUSWR_V20X_IIF_IRQ_S0_VIOLATION(s)	\
+	((s) & BUSWR_V20X_IIF_IRQ_S0_VIOLATION)
+
+/* Client configuration field values */
+#define BUSWR_V20X_IIF_CGC_OVERRIDE			GENMASK(25, 0)
+#define BUSWR_V20X_CLIENT_CFG_MODE			GENMASK(17, 16)
+#define BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
+#define BUSWR_V20X_CLIENT_CFG_EN			BIT(0)
+#define BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT		GENMASK_U32(31, 16)
+#define BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH		GENMASK_U32(15, 0)
+#define BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE		GENMASK_U32(15, 0)
+#define BUSWR_V20X_CLIENT_PACKER_CFG_ALIGN		GENMASK(4, 4)
+#define BUSWR_V20X_CLIENT_PACKER_CFG_FORMAT		GENMASK(3, 0)
+#define BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
+#define BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
+
+/* Burst and FIFO limits */
+#define BUSWR_V20X_BURST_BEATS8_256			3
+#define BUSWR_V20X_CLIENT_BURST_LIMIT_CFG_MAX_LENGTH	GENMASK(1, 0)
+#define BUSWR_V20X_IMG_ADDR_FIFO_MAX_DEPTH		4
+
+/* Common BUSWR registers */
+#define BUSWR_V20X_IIF_CGC_OVERRIDE_REG		0x00000008
+#define BUSWR_V20X_IIF_IRQ_MASK_S0		0x00000018
+#define BUSWR_V20X_IIF_IRQ_MASK_S1		0x0000001c
+#define BUSWR_V20X_IIF_IRQ_CLEAR_S0		0x00000020
+#define BUSWR_V20X_IIF_IRQ_CLEAR_S1		0x00000024
+#define BUSWR_V20X_IIF_IRQ_STATUS_S0		0x00000028
+#define BUSWR_V20X_IIF_IRQ_STATUS_S1		0x0000002c
+#define BUSWR_V20X_IIF_IRQ_CMD_REG		0x00000030
+#define BUSWR_V20X_OVERFLOW_CLEAR_REG		0x00000060
+#define BUSWR_V20X_VIOLATION_STATUS_REG		0x00000064
+#define BUSWR_V20X_OVERFLOW_STATUS_REG		0x00000068
+#define BUSWR_V20X_IMG_SIZE_VIOLATION_REG	0x00000070
+
+/* Per-client BUSWR registers */
+#define BUSWR_V20X_CLIENT_CFG_REG		0x00000200
+#define BUSWR_V20X_CLIENT_ADDR_IMAGE_REG	0x00000204
+#define BUSWR_V20X_CLIENT_IMG_CFG0_REG		0x0000020c
+#define BUSWR_V20X_CLIENT_IMG_CFG2_REG		0x00000214
+#define BUSWR_V20X_CLIENT_PACKER_CFG_REG	0x00000218
+#define BUSWR_V20X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
+#define BUSWR_V20X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
+#define BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
+#define BUSWR_V20X_CLIENT_BURST_LIMIT_REG	0x00000264
+#define BUSWR_V20X_CLIENT_ADDR_STATUS_0_REG	0x00000268
+#define BUSWR_V20X_CLIENT_ADDR_STATUS_2_REG	0x00000270
+
+static void ife_buswr_20x_acquire(struct ife_device *ife, void __iomem *base)
+{
+	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
+
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
+		ctx->base = base + BUSWR_V20X_LITE_OFFS;
+	else
+		ctx->base = base + BUSWR_V20X_OFFS;
+
+	ctx->dev = ife->camss->dev;
+}
+
+static void ife_buswr_20x_release(struct ife_buswr_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void ife_buswr_20x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
+				    const struct camss_ife_wm_config *cfg)
+{
+	void __iomem *base = ctx->base;
+	u32 rval, period = 0, pattern = 1;
+
+	writel_relaxed(BUSWR_V20X_IIF_CGC_OVERRIDE,
+		       base + BUSWR_V20X_IIF_CGC_OVERRIDE_REG);
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_CFG_MODE, cfg->mode_config);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
+	       FIELD_PREP(BUSWR_V20X_CLIENT_PACKER_CFG_ALIGN, 1);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_PACKER_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH, cfg->bytes) |
+	       FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT, cfg->lines);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IMG_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE, cfg->stride);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IMG_CFG2_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IRQ_SS_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_IRQ_SS_CFG1_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_FRAMEDROP_CFG0_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_FRAMEDROP_CFG1_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V20X_CLIENT_BURST_LIMIT_CFG_MAX_LENGTH,
+			  BUSWR_V20X_BURST_BEATS8_256);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_BURST_LIMIT_REG +
+		       BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+	rval |= BUSWR_V20X_CLIENT_CFG_EN | BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN;
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+	rval &= ~(BUSWR_V20X_CLIENT_CFG_EN | BUSWR_V20X_CLIENT_CFG_AUTO_RECOVERY_EN);
+	writel_relaxed(rval, base + BUSWR_V20X_CLIENT_CFG_REG + BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static bool ife_buswr_20x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	u32 rval = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_OFFS(wm) +
+				 BUSWR_V20X_CLIENT_ADDR_STATUS_2_REG);
+
+	return rval >= BUSWR_V20X_IMG_ADDR_FIFO_MAX_DEPTH;
+}
+
+static void ife_buswr_20x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
+				    dma_addr_t *addr)
+{
+	int i;
+
+	for (i = 0; i < num_wms; i++) {
+		if (addr[i])
+			writel_relaxed(addr[i], ctx->base + BUSWR_V20X_CLIENT_ADDR_IMAGE_REG +
+				       BUSWR_V20X_CLIENT_OFFS(wm[i]));
+	}
+}
+
+static u32 ife_buswr_20x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	return readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_ADDR_STATUS_0_REG +
+			     BUSWR_V20X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_20x_log_image_size(struct ife_buswr_ctx *ctx, u32 clients)
+{
+	unsigned int wm;
+	u32 cfg0, cfg2;
+
+	dev_dbg(ctx->dev, "BUSWR image size violation clients: %#010x\n", clients);
+
+	for (wm = 0; wm < 26; wm++) {
+		if (!(clients & BIT(wm)))
+			continue;
+
+		cfg0 = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_IMG_CFG0_REG +
+				     BUSWR_V20X_CLIENT_OFFS(wm));
+		cfg2 = readl_relaxed(ctx->base + BUSWR_V20X_CLIENT_IMG_CFG2_REG +
+				     BUSWR_V20X_CLIENT_OFFS(wm));
+
+		dev_dbg(ctx->dev, "BUSWR client %u config: width=%u height=%u stride=%u\n",
+			wm, FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG0_WIDTH, cfg0),
+			FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG0_HEIGHT, cfg0),
+			FIELD_GET(BUSWR_V20X_CLIENT_IMG_CFG2_STRIDE, cfg2));
+	}
+}
+
+static u32 ife_buswr_20x_irq_status(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 bus_stat, iif_stat = 0;
+
+	bus_stat = readl_relaxed(base + BUSWR_V20X_OVERFLOW_STATUS_REG);
+	writel_relaxed(BIT(0), base + BUSWR_V20X_OVERFLOW_CLEAR_REG);
+	if (IS_BUSWR_V20X_OVERFLOW_ERR(bus_stat)) {
+		writel_relaxed(bus_stat, base + BUSWR_V20X_OVERFLOW_CLEAR_REG);
+		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
+	}
+
+	iif_stat = readl_relaxed(base + BUSWR_V20X_IIF_IRQ_STATUS_S1);
+	writel_relaxed(iif_stat, base + BUSWR_V20X_IIF_IRQ_CLEAR_S1);
+
+	iif_stat = readl_relaxed(base + BUSWR_V20X_IIF_IRQ_STATUS_S0);
+	writel_relaxed(iif_stat, base + BUSWR_V20X_IIF_IRQ_CLEAR_S0);
+	if (iif_stat) {
+		if (IS_BUSWR_V20X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat)) {
+			bus_stat = readl_relaxed(base + BUSWR_V20X_IMG_SIZE_VIOLATION_REG);
+			if (IS_BUSWR_V20X_IMG_SIZE_VIOLATION_ERR(bus_stat))
+				pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
+			ife_buswr_20x_log_image_size(ctx, bus_stat);
+			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
+		}
+		if (IS_BUSWR_V20X_IIF_IRQ_S0_VIOLATION(iif_stat)) {
+			bus_stat = readl_relaxed(base + BUSWR_V20X_VIOLATION_STATUS_REG);
+			if (IS_BUSWR_V20X_VIOLATION_ERR(bus_stat))
+				pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
+			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
+		}
+	}
+
+	writel_relaxed(BUSWR_V20X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V20X_IIF_IRQ_CMD_REG);
+
+	return iif_stat;
+}
+
+static void ife_buswr_20x_irq_enable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_MASK_S1);
+}
+
+static void ife_buswr_20x_irq_disable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(0, base + BUSWR_V20X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_CLEAR_S0);
+	writel_relaxed(0, base + BUSWR_V20X_IIF_IRQ_MASK_S1);
+	writel_relaxed(~0, base + BUSWR_V20X_IIF_IRQ_CLEAR_S1);
+
+	writel_relaxed(BUSWR_V20X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V20X_IIF_IRQ_CMD_REG);
+}
+
+const struct ife_hw_buswr_ops ife_buswr_20x_ops = {
+	.acquire	= ife_buswr_20x_acquire,
+	.release	= ife_buswr_20x_release,
+	.irq_enable	= ife_buswr_20x_irq_enable,
+	.irq_disable	= ife_buswr_20x_irq_disable,
+	.wm_config	= ife_buswr_20x_wm_config,
+	.wm_enable	= ife_buswr_20x_wm_enable,
+	.wm_disable	= ife_buswr_20x_wm_disable,
+	.queue_buf	= ife_buswr_20x_queue_buf,
+	.consumed_addr	= ife_buswr_20x_consumed_addr,
+	.irq_status	= ife_buswr_20x_irq_status,
+	.is_fifo_full	= ife_buswr_20x_is_fifo_full,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 39e8cfa74909..48701cb67e1e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -389,4 +389,6 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     const struct camss_ife_stream *streams,
 			     u32 id);
 
+extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

