Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753C3AA1B2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326468; cv=none; b=dhSzdI8Ieo3hCda4WxeRPcAPyrZFmFIepmoSvWo1MkF1qSHljWn1Ky65H912OYSH0McY5LDnmrDsLWjJ42rbxf9NQnSKBmuSr6kr/pQoPz4SWZHAjS/ghgHgljwuDFVU8FSBpxQMutGszurgKLcqUM3ZWS3CtOSgGXfJ/bHszP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326468; c=relaxed/simple;
	bh=PJBWmcMoA8861kMaIN4WaebDmBh1g533lYltteNcayo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YqF04s5CXopraob5iPnoJ0KPR2uTtcNxzwWriAmumrmD25gctmLckxIpt7dMkNLt9WWv1lD/zNvkLH5v0PuLsamRhlLqwEer2ogheeKbN4X2eo505Gxg3U62DESelV8ZAMejaHUI62CK5UN7vcrGDZAddTRBJOVt7XFv3LSiSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iV8ZXyYi reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iV8ZXyYi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeWJU1676116
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vA78yqQ3u4V
	4c4sgRQes8G5kVMSSSTGDG9zLlif1q14=; b=iV8ZXyYiLrfxrbgNiBX3OfdzN7i
	zfkpf3yrfs1eWlorRoufakRKKJuiW1yIvL9hM9kYDslRha1fNV9d1Zn9+LkfXDcp
	5VdUFRoe7B5TAe/vo5E6U3o90657SK0FaWbVNxLKxX9YsJmIDjbJizyfUd+C/QLC
	XYbAE/MblJF5hWjUxnurjvvU1DkJuOGgzW2PqRx3visujRj4FhNAOkVor6LAvwXB
	Qoa9G3itZUm/wqSiHp4gVWi4ttBOH44uIhGkbCM6CJkDHPFOA9YVkh/o0bAN4SQH
	La5nzDAwEohw6TEb2cIpm+zkEeDQwwZ+N59akx/puD/J00l8cmjDtgMzcOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub0yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so605279185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326439; x=1791931239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA78yqQ3u4V4c4sgRQes8G5kVMSSSTGDG9zLlif1q14=;
        b=n2lT980h4rQ/xykW+TABdK5EABn27VXTNjRJtKGFHykbYfx7UHfm1It5RKB6jwfV13
         LKBv8yV03EGXh2FhkKCk7Dmtt+xForzDKZGy2pF/b8yXXXp0mYTX8rj+qTPWvyR3C5Uk
         ZXsiw95FMjEiYdAGzMbh5onNPBqFq6bjtLbw7tZuUcpmWhfq/iyZ0ymNoFucA4EaVXMc
         jKUKdHk9JkY0W21ytk8FhXFWqIdYGCvRmPB/R/AWo6U8l09NWgJVC5ZZR8hlTuHq41wn
         n01YoWcoS+IeR/QNnxZxH/NKIjAHg/ni86Zc2r0bRfiCt3XLmCmIxitJ/J2VVpP5r0zD
         3bWw==
X-Forwarded-Encrypted: i=1; AKwUvBzuYR7FMYZiqkjZSC8YqWTg7yN6yXAPEl9aIMTQKpdqk5BKNIZzZfvXfHESrotsIH51507+C3TDduhmMjg=@vger.kernel.org
X-Gm-Message-State: AFuF++ke8wwBIoNoCeeeDgtUwowpjuD5Hawn6pXDRoKzUSyMB1LoPMGp
	F1jG5o3VgAOzpwZE5R2Yo5irPv9iI6FxzrdwMpAD4kRHbNkEs39hkBEAfwF0OTxc30jkyMRbjY4
	lCl9gRtBZ9X6ib9ixpRFTWgwZhg5FYkwCNb4jC720YHmAqOpcM5kOcDaNGoj+lR6VlZM=
X-Gm-Gg: AYBFou0HeXsTpQAhh9+Lpi3RwhvXLeVUNE8Wa7XXyfj/lPe9ngK1RoStv/AOzfnHG/8
	jxsGM7AMmPqIcWe9sz2oBwv1KrVEqs6a8KRUQKNLxFx1rD+cYURcDrqUgLMMWt9f8RIBgCtOXsI
	cwfOV3cZxCJqg+jC7Fg98dJa0UbdOq/CUmkI4ZMjX6tr4brPC9PM3Rd6rvi4RsinhAeuuShoOVA
	f07UzvIh41kYUx3jDfiunAT0Yj6S4d/EhW4T1iflxtr0lzrf3Yo4v+5gbMgzUN3y23eJciQJOuT
	HiicDNasDiTpM+TOQB9PPlcodF0/XLZOeg1JE8EyJi9srw7W6FPa70BuDTY=
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr77831885a.31.1791326438842;
        Tue, 06 Oct 2026 15:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr77827085a.31.1791326438354;
        Tue, 06 Oct 2026 15:40:38 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:37 -0700 (PDT)
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
Subject: [PATCH 10/45] media: qcom: camss: sm8250: add IFE module engine v10x
Date: Wed,  7 Oct 2026 01:39:18 +0300
Message-Id: <20261006223953.3382273-11-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4iii0GsiZEFm
 aOt5VDmxbaOHTTlXAWXc2HkV+Uw8A2QdONqhWYuEkAGq9iTQFS/qULkGvr4EWhsFdvh4OcdRu13
 DdCGOArjD7YSlCrUTK5LGAQwDyh2/o4=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac578e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=_e6tmLMpji0MzSkM2K0A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: m68jYkoaliyz-MrU9Qapf0bBhAzs9xgw
X-Proofpoint-ORIG-GUID: m68jYkoaliyz-MrU9Qapf0bBhAzs9xgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9ge+etkPoQXE
 uZGTWWootPk8JCKKmYecOIy4YN37WUJtkjN1I3XJwgBZR9xoAuGudqrHclLVxRz+iWnaBBXydIw
 yUlbF+bLftDs2DiEHT+Dp6MEotprHhgBq9Q8zO9NNjIe4E+wOxG3dwzWJyqXwVdB3tegLMYfFEi
 9SS0aF0C7xKCKlRGm+mlamlTOuWucyejxRDvcJPOUFdActMCyg5QYcefypUQ1CV1OY3Igxvh1fD
 ZtEj0CBAEwdHAmvEgHDrrOF83JQWBRp9kK+TUdd3zRzadRv4bS0Et++H9yJTsfpJ6l2aVPwnFVB
 9pKkF8nYZ3DBh0TRR79v5gi+8r6Enc1nmhmjaVnzW9SJ7thj2LZFsPP8ariVRFD2K91QEJH1z8V
 AGVnLxcNs/R5wg1gxbY/JpYBxNx+7xp9SV2xJw3Cj28y+G/WgSG55TLw6Zpph5b0wkDvDMGfq7x
 DU2uZfCpvy7d4fB1CYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the demosaic, color transform and AWB statistics modules used by
the SM8250 IFE pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-mod-v10x.c  | 263 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index dc0f307894d8..92f1938a693d 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-camif-v10x.o \
+		camss-ife-mod-v10x.o \
 		camss-ife-scale-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
new file mode 100644
index 000000000000..ebc97203595f
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v10x.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+
+#include "camss-ife.h"
+
+/* Module base offsets and register offsets */
+#define IFE_MOD_V10X_DEMOSAIC_OFFSET	(0x0ACB7800 - 0x0ACB4000)
+#define IFE_MOD_V10X_XFORM_OFFSET	(0x0ACB8000 - 0x0ACB4000)
+#define IFE_MOD_V10X_AWB_BG_OFFSET	0x8400
+
+/* Demosaic registers */
+#define IFE_MOD_V10X_DEM_MODULE_CFG	0x00000060
+#define IFE_MOD_V10X_DEM_WB_GAIN_CFG_0	0x00000068
+#define IFE_MOD_V10X_DEM_WB_GAIN_CFG_1	0x0000006c
+
+/* Color transform register */
+#define IFE_MOD_V10X_XFORM_MODULE_CFG	0x00000060
+
+/* AWB-BG registers */
+#define IFE_MOD_V10X_AWB_BG_MODULE_CFG		0x00000060
+#define IFE_MOD_V10X_AWB_BG_HORZ_RGN_CFG_0	0x0000006c
+#define IFE_MOD_V10X_AWB_BG_HORZ_RGN_CFG_1	0x00000070
+#define IFE_MOD_V10X_AWB_BG_VERT_RGN_CFG_0	0x00000074
+#define IFE_MOD_V10X_AWB_BG_VERT_RGN_CFG_1	0x00000078
+#define IFE_MOD_V10X_AWB_BG_HI_THRESH_CFG_0	0x00000080
+#define IFE_MOD_V10X_AWB_BG_HI_THRESH_CFG_1	0x00000084
+#define IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_0	0x00000088
+#define IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_1	0x0000008c
+
+/* Demosaic bitfields */
+#define IFE_MOD_V10X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN	BIT(15)
+#define IFE_MOD_V10X_DEMOSAIC_CFG_DYN_G_CLAMP_EN	BIT(14)
+#define IFE_MOD_V10X_DEMOSAIC_CFG_EN			BIT(0)
+#define IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_B_GAIN	GENMASK(30, 16)
+#define IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_G_GAIN	GENMASK(14, 0)
+#define IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG1_R_GAIN	GENMASK(14, 0)
+
+/* Color transform bitfield */
+#define IFE_MOD_V10X_COLOR_XFORM_CFG_EN		BIT(0)
+
+/* AWB-BG bitfields */
+#define IFE_MOD_V10X_AWB_BG_MODULE_EN		BIT(0)
+#define IFE_MOD_V10X_AWB_BG_SAT_STATS_EN	BIT(8)
+#define IFE_MOD_V10X_AWB_BG_HORZ_CFG0_H_NUM	GENMASK(23, 16)
+#define IFE_MOD_V10X_AWB_BG_HORZ_CFG1_WIDTH	GENMASK(8, 0)
+#define IFE_MOD_V10X_AWB_BG_VERT_CFG0_V_NUM	GENMASK(22, 16)
+#define IFE_MOD_V10X_AWB_BG_VERT_CFG1_HEIGHT	GENMASK(9, 0)
+#define IFE_MOD_V10X_AWB_BG_THRESH_CFG0_GR	GENMASK(29, 16)
+#define IFE_MOD_V10X_AWB_BG_THRESH_CFG0_R	GENMASK(13, 0)
+#define IFE_MOD_V10X_AWB_BG_THRESH_CFG1_GB	GENMASK(29, 16)
+#define IFE_MOD_V10X_AWB_BG_THRESH_CFG1_B	GENMASK(13, 0)
+
+/* AWB-BG default grid: 64 horizontal x 48 vertical regions */
+#define IFE_MOD_V10X_AWB_BG_MAX_H_NUM		64
+#define IFE_MOD_V10X_AWB_BG_MAX_V_NUM		48
+
+/* Default saturation threshold applied to all channels */
+#define IFE_MOD_V10X_AWB_BG_THRESHOLD		0x3C3F
+
+/* Default WB gains applied at config time (U15Q10 format) */
+#define IFE_MOD_V10X_DEMOSAIC_G_GAIN_DEF		1024	/* 1.0 U15Q10 */
+#define IFE_MOD_V10X_DEMOSAIC_B_GAIN_DEF		1664	/* 1.625 U15Q10 */
+#define IFE_MOD_V10X_DEMOSAIC_R_GAIN_DEF		2176	/* 2.125 U15Q10 */
+
+/*
+ * Default RGB-to-YUV color transform coefficients.
+ * Each entry is a { value, register-offset } pair relative to xform base.
+ */
+static const struct { u32 val; u32 offs; } mod_v10x_xform_defaults[] = {
+	{ 0x00750259, 0x00000068 },
+	{ 0x00000132, 0x0000006c },
+	{ 0x03ff0000, 0x00000074 },
+	{ 0x01fe1eae, 0x00000078 },
+	{ 0x00001f54, 0x0000007c },
+	{ 0x02000000, 0x00000080 },
+	{ 0x03ff0000, 0x00000084 },
+	{ 0x1fad1e55, 0x00000088 },
+	{ 0x000001fe, 0x0000008c },
+	{ 0x02000000, 0x00000090 },
+	{ 0x03ff0000, 0x00000094 },
+};
+
+static void mod_v10x_demosaic_config(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_DEMOSAIC_OFFSET;
+	u32 rval;
+
+	rval = FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_B_GAIN,
+			  IFE_MOD_V10X_DEMOSAIC_B_GAIN_DEF) |
+	       FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG0_G_GAIN,
+			  IFE_MOD_V10X_DEMOSAIC_G_GAIN_DEF);
+	writel_relaxed(rval, base + IFE_MOD_V10X_DEM_WB_GAIN_CFG_0);
+
+	rval = FIELD_PREP(IFE_MOD_V10X_DEMOSAIC_WB_GAIN_CFG1_R_GAIN,
+			  IFE_MOD_V10X_DEMOSAIC_R_GAIN_DEF);
+	writel_relaxed(rval, base + IFE_MOD_V10X_DEM_WB_GAIN_CFG_1);
+}
+
+static void mod_v10x_demosaic_enable(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_DEMOSAIC_OFFSET;
+	u32 rval;
+
+	rval = readl_relaxed(base + IFE_MOD_V10X_DEM_MODULE_CFG);
+	rval |= IFE_MOD_V10X_DEMOSAIC_CFG_DYN_G_CLAMP_EN |
+		IFE_MOD_V10X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		IFE_MOD_V10X_DEMOSAIC_CFG_EN;
+	writel_relaxed(rval, base + IFE_MOD_V10X_DEM_MODULE_CFG);
+}
+
+static void mod_v10x_demosaic_disable(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_DEMOSAIC_OFFSET;
+	u32 rval;
+
+	rval = readl_relaxed(base + IFE_MOD_V10X_DEM_MODULE_CFG);
+	rval &= ~(IFE_MOD_V10X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		  IFE_MOD_V10X_DEMOSAIC_CFG_DYN_G_CLAMP_EN  |
+		  IFE_MOD_V10X_DEMOSAIC_CFG_EN);
+	writel_relaxed(rval, base + IFE_MOD_V10X_DEM_MODULE_CFG);
+}
+
+static void mod_v10x_xform_config(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_XFORM_OFFSET;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mod_v10x_xform_defaults); i++)
+		writel_relaxed(mod_v10x_xform_defaults[i].val,
+			       base + mod_v10x_xform_defaults[i].offs);
+}
+
+static void mod_v10x_xform_enable(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_XFORM_OFFSET;
+	u32 rval;
+
+	rval = readl_relaxed(base + IFE_MOD_V10X_XFORM_MODULE_CFG);
+	rval |= IFE_MOD_V10X_COLOR_XFORM_CFG_EN;
+	writel_relaxed(rval, base + IFE_MOD_V10X_XFORM_MODULE_CFG);
+}
+
+static void mod_v10x_xform_disable(void __iomem *top)
+{
+	void __iomem *base = top + IFE_MOD_V10X_XFORM_OFFSET;
+	u32 rval;
+
+	rval = readl_relaxed(base + IFE_MOD_V10X_XFORM_MODULE_CFG);
+	rval &= ~IFE_MOD_V10X_COLOR_XFORM_CFG_EN;
+	writel_relaxed(rval, base + IFE_MOD_V10X_XFORM_MODULE_CFG);
+}
+
+static void mod_v10x_awb_bg_config(void __iomem *base,
+				   const struct camss_pp_cfg *cfg)
+{
+	void __iomem *mod_base = base + IFE_MOD_V10X_AWB_BG_OFFSET;
+	u32 width = (cfg->width / IFE_MOD_V10X_AWB_BG_MAX_H_NUM) & ~3u;
+	u32 height = (cfg->height / IFE_MOD_V10X_AWB_BG_MAX_V_NUM) & ~3u;
+	u32 val;
+
+	/* Horizontal: 64 regions, offset 0 */
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_HORZ_CFG0_H_NUM, IFE_MOD_V10X_AWB_BG_MAX_H_NUM - 1);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_HORZ_RGN_CFG_0);
+
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_HORZ_CFG1_WIDTH, width - 1);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_HORZ_RGN_CFG_1);
+
+	/* Vertical: 48 regions, offset 0 */
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_VERT_CFG0_V_NUM, IFE_MOD_V10X_AWB_BG_MAX_V_NUM - 1);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_VERT_RGN_CFG_0);
+
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_VERT_CFG1_HEIGHT, height - 1);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_VERT_RGN_CFG_1);
+
+	/* High thresholds: default saturation level for all channels */
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_THRESH_CFG0_GR, IFE_MOD_V10X_AWB_BG_THRESHOLD) |
+	      FIELD_PREP(IFE_MOD_V10X_AWB_BG_THRESH_CFG0_R, IFE_MOD_V10X_AWB_BG_THRESHOLD);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_HI_THRESH_CFG_0);
+
+	val = FIELD_PREP(IFE_MOD_V10X_AWB_BG_THRESH_CFG1_GB, IFE_MOD_V10X_AWB_BG_THRESHOLD) |
+	      FIELD_PREP(IFE_MOD_V10X_AWB_BG_THRESH_CFG1_B, IFE_MOD_V10X_AWB_BG_THRESHOLD);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_HI_THRESH_CFG_1);
+
+	/* Low thresholds: 0 (accept all pixels) */
+	writel_relaxed(0, mod_base + IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_0);
+	writel_relaxed(0, mod_base + IFE_MOD_V10X_AWB_BG_LO_THRESH_CFG_1);
+}
+
+static void mod_v10x_awb_bg_enable(void __iomem *base)
+{
+	void __iomem *mod_base = base + IFE_MOD_V10X_AWB_BG_OFFSET;
+	u32 val;
+
+	val = readl_relaxed(mod_base + IFE_MOD_V10X_AWB_BG_MODULE_CFG);
+	val |= IFE_MOD_V10X_AWB_BG_MODULE_EN | IFE_MOD_V10X_AWB_BG_SAT_STATS_EN;
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v10x_awb_bg_disable(void __iomem *base)
+{
+	void __iomem *mod_base = base + IFE_MOD_V10X_AWB_BG_OFFSET;
+	u32 val;
+
+	val = readl_relaxed(mod_base + IFE_MOD_V10X_AWB_BG_MODULE_CFG);
+	val &= ~(IFE_MOD_V10X_AWB_BG_MODULE_EN | IFE_MOD_V10X_AWB_BG_SAT_STATS_EN);
+	writel_relaxed(val, mod_base + IFE_MOD_V10X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v10x_modules_acquire(struct ife_device *ife,
+				     struct ife_pp_ctx *ctx,
+				     void __iomem *base)
+{
+	ctx->base = base;
+}
+
+static void mod_v10x_modules_release(struct ife_pp_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void mod_v10x_modules_config(struct ife_pp_ctx *ctx,
+				    const struct camss_pp_cfg *cfg)
+{
+	void __iomem *base = ctx->base;
+
+	ctx->in_width = cfg->width;
+	ctx->in_height = cfg->height;
+
+	mod_v10x_demosaic_config(base);
+	mod_v10x_xform_config(base);
+	mod_v10x_awb_bg_config(base, cfg);
+}
+
+static void mod_v10x_modules_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	mod_v10x_demosaic_enable(base);
+	mod_v10x_xform_enable(base);
+	mod_v10x_awb_bg_enable(base);
+}
+
+static void mod_v10x_modules_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	mod_v10x_awb_bg_disable(base);
+	mod_v10x_xform_disable(base);
+	mod_v10x_demosaic_disable(base);
+}
+
+const struct camss_mod_ops ife_mod_v10x_ops = {
+	.acquire	= mod_v10x_modules_acquire,
+	.release	= mod_v10x_modules_release,
+	.config		= mod_v10x_modules_config,
+	.enable		= mod_v10x_modules_enable,
+	.disable	= mod_v10x_modules_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 48701cb67e1e..233b0292c107 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -390,5 +390,6 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     u32 id);
 
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

