Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7C47125C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363698; cv=none; b=hONsbT2IO1AzQtPuc0XSAs99wYQdAxxvyc8VC4f9of8J8Gg4kYPvyryGuQP+jzP6G4kxp2iK+tzrl38eFYtEJ0UWMzn+RnhB7qrcZWeAbFkUl+AXA9ybs0NGZ2xZD4hXhwB77O/OTCrhW28BhTZ716gHZlFfFv6DfeeHvVD8sdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363698; c=relaxed/simple;
	bh=PJBWmcMoA8861kMaIN4WaebDmBh1g533lYltteNcayo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fSDxYieYPdrtzF06SPVwklLRv7GyQc35PqPNiYJlCcnGjsJ9DbfpTVEL537fuucsj5XIGPEm/32ftBSCDQmdgsI82zoflynlPwI/Vu587IIP7e+HmsM6xImQ7RZ2RwDeYZ1bdqpM78yWqz//hLEU8eHJTiEPffIMG1PHj4YSVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6g7DHSl reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6g7DHSl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWHh2481348
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vA78yqQ3u4V
	4c4sgRQes8G5kVMSSSTGDG9zLlif1q14=; b=J6g7DHSlY/T3z5nbuZDKMXIqcPa
	/MZv20BnB8mOtXZId4M4W1VHrLEDSh1cW4h/oOcvqhnvcPyjK8tWqlSn5HElk2L1
	JH9YMkdHQFw3dwdztYvKjK6rCGDWKCGclhu8YNuZ/zEC7PHi733isWwOEQk7xlWt
	/tnSj4NU38wdpVOYdz5NTXh7F6rKfFdxmE6/SimcV1isVtPvU2N/HI5Cc27q9/G7
	9tPHdfoHyrhy0oQkyfS/HUdfeDH3ARwtro1Cd9lsxAMaUwg4G/Go+yKmmPqc9404
	scSz7UlJZrWxnFGR+C54EfXb2sGxNsXYbhYJYT5AVAcSYff325dUb/EFOeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1c9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so645839485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363676; x=1791968476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA78yqQ3u4V4c4sgRQes8G5kVMSSSTGDG9zLlif1q14=;
        b=THlCa86CoCCiQsLoOTLcLpRvDv4oEtlrmySaVKcDYwjEf7dipr8l/AhCtfp1Za9R67
         6/SbMbx9zAsko40Ev6VV8JO6zXMDQ6/lUYPsuc9KIJGKyTLPtQpSTPp5AnpS/wW5iyGR
         Li4yxnqvJxf2A8gkeDZgboZGL5HM1Yx80O3uJ1mPUj5YVDFyXn3VFwsnLn7liL0Rdi/V
         +LJUKmtFEGkRaoW7PWXaLoc5gwXEFZVzoeWm7M9qPHgHVeroB5iCuqNuT6B63B55Nm5h
         kAYLA8wX4Arq6c4cIQ6aOzP6UfLjPWEfXyqaiiO+yfBcTRorvBWFnM5XcAa5J+pYvPay
         a+FA==
X-Forwarded-Encrypted: i=1; AKwUvByKZ7gMHv4AO+6ma+G4m7wZz93vk4VhkBG6v/h1XszX1nH9TZzer9YpHZnujL4cmYHisYJbV8FRtBhDZ2k=@vger.kernel.org
X-Gm-Message-State: AFuF++ndBcMi58OuQfNpKOIp4qEDrHg1pDrQWPqSIzFlc9QU20eEvWaq
	Q2vt+v/zjU8cRzws5H7CnW0T5B/ZZl5QaaNRTlDTn/sxWlAKEcFyoqUIhBIA328cfav3aHqxgXG
	um7fuqwU5qdAbxyE5eQqVgmMYExPp9aga3VM7o4lAGl2gCJ3oywir+NlcbLCcomHVANk=
X-Gm-Gg: AYBFou04gNSt/6TI8OVt6ZJ7aDzmtq2qxb6yIT2EMxQB1rNLkDFHIihVX8MrEhPSLoh
	z0tKk1FsEqA0wjXJKsJcpxJfZPI18qdnn/MnW10CheQZYPVQ80M09VGalcvoj6xE3oAwYTP6Yj2
	cOafyigZ/udgh6pnkQ+EmmAQX4HdcEP5a2CyhZ2pQGqwiL5Lmso9oBwBUGIbuDuU8K/KMEQpbiw
	Mc1C8IwyXUgyTZIjaAqYvru+bJwfXhnnba3Ef7KjVL9VfieDeVWfnpAIK4p+kJ0S9UwMnqX6lU0
	J7gVPcra3tNo4KW6pHXm6WlDV2FLzw3ffJqpbNkoJz/asBBCyuSgX/Kw3wY=
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr315825885a.8.1791363675583;
        Wed, 07 Oct 2026 02:01:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr315815785a.8.1791363674878;
        Wed, 07 Oct 2026 02:01:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:14 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 08/45] media: qcom: camss: sm8250: add IFE module engine v10x
Date: Wed,  7 Oct 2026 12:00:04 +0300
Message-Id: <20261007090041.3732717-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX71ZV/7e0ye1w
 cpbvXnq9oZ7aBFcfB+C6vwdznmRw6phRo4pSz6Da68wB3Nw5cm2hG4IeK+FAp4QYoeWaB5u5Ffm
 aNbaHKbRJTwIejwSpaWpa21iu8X2hfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9xo8F4FNZzHn
 RVEK8c/ZXzWzEHb0nWQIsoNbwHIgR25mQi/EjCB1HstqGkwxpaV7N0bc2Db4qA+puR1fjIp2f7g
 4/2PkLaBDPV3W9f6JHu84LnUNAynFVoiG7upPFYOqjMsuZH7ICFKJzvCrr6rQub7Ilr9s74Iq2g
 79DFcXTMd6WvSez+3YzEjSIBA7tnLqkOzTkYD48OPCt5q3e+5WePCK5peAntN5EaIoh5K514GbG
 nKLwBfu545+KWmGJmmuoU6GdZw4IigHbUcgIZNgOzpgw5tW6MvRzbzg5aFuwVz4yupHbFLHc3aT
 MulIHD5fkFCG+j9S3ttKVY1WBuDPyPUrmmNGjDUqFUW4Ys1vMzbssvhNaFEqB8Ou309x08kfzBw
 UDvkyY4YDSDoaMu9lG9rQId9MoUpRxQue+RJIKJOMXun8c8WJXfJG61lCGkUEzZSCYnn4bVs/JG
 y/09fRPBrMftdAfKPYg==
X-Proofpoint-ORIG-GUID: lLaK9V8ZjqhJQIN58IyH57r601616n03
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac60a5c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=_e6tmLMpji0MzSkM2K0A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lLaK9V8ZjqhJQIN58IyH57r601616n03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

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

