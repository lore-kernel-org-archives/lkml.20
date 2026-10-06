Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0763A4523
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326537; cv=none; b=KAGOw9KPu+gNjtreGaCHuguzwRgVDe1z+JBikfGqeD22JmHFOroTofCULnNhAp0EDbwdSpb0ak6coqEYWTRu6KAT5nZqTIybnJJlc1xl/sOJLshbVF2z+JXGACDQXXIUNaqS9xbX3NZeaHdlm/SJeF/9925LUdaO3AfnawgWsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326537; c=relaxed/simple;
	bh=lH4Dk2jUsrmvthhfZiZ0Ao970UqLUmubW6NDdn2S5Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MIqAxWLwVEy91vgHFRrLTa2gSNEV+foCw2v+PbjRLefQfC4wv0+mBR4kVc3TZlGh/q+jdCHoVQOX3bmaXMlSyQKQzZDYAhFb/d+9stUwaJ2+PV/3hasJUzJhBt1Gq7P7swq63yrXVzWZODJoktN3TFNNFtMXlsS1S8MwuFgGg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVdkdy63 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVdkdy63"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LekwK2011581
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4odIBw3SYrq
	cKKY8cmEiG/WthNCuYS8FURjXQy5DTCs=; b=gVdkdy63Zk3hC7EYAR4WwluoHgm
	XRO6UBUQ/PDs8KthTK0LAxfGX9wC3HW3S/ZNyQqGV4uiRin/UiHikvgttdcwtB7H
	+NJun8hNJ1GhpwJ8rdUTxWr6RY7wUlW+MLirj+GS6URb/vbLOv94x50yp5H5UUSF
	RIfgo5t2WvazLwwA8DJrDuATfOst1mrgC15qEaAPtrAqEK9vTJeI1A7FWblQnUaZ
	REUphr+G0LVXXnt8X2uzez+VkuXcJR6PDatMi10QkpSCwZwl/r9rHRO3DVOq1yg8
	pHsxh0UhCDd4YbqKGessg1jjm4nGXJNf5RmR/mS5M2budMgBMSQkT8JjXbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so602746185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326485; x=1791931285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4odIBw3SYrqcKKY8cmEiG/WthNCuYS8FURjXQy5DTCs=;
        b=BiF1TeRyrFwSCLrpJSUieG/aVx8qPlS4/PiTHSZrIsyCoqsO+45fMPKu6bsaByH4V2
         q8+OR/CKN8cJXjiyox/DuutvENZgW/nYEOnCgk4lbrdAloMzGFbyVO9rTcwDV2tF5sUl
         vaqT80W8nxctPlW7B4W8aOPkJCb5a3mbnlEz5NC98vR3BlwsDkqqkDEr5H1UjIBujuJb
         jYUyzMLb7KOG4vD0gckCj14T+xGP9x77KLL3csm9zJv3lzZ+HL/NzL48llDc6TOlydCE
         fUFxVBX0w+2cLYppf2O64deTHp4nr/0U7QTJXI64/5q5llpjENajx6JHXjMst14gNd8r
         XXcA==
X-Forwarded-Encrypted: i=1; AKwUvByuOFvxHBon1l+kmriecYKC0w9tqglOx5mND/NYnmzQfhpd2CQRVuZ4l1N7HRzrd2oj6S/ENDmRFxPqZaA=@vger.kernel.org
X-Gm-Message-State: AFuF++mtLAa6OHd+ZXjrVNN+xxHQDWs+lX+YVHcuhrpiMVmlwSpZlRiF
	XjuljZoxBu6rdXYjbwpDyYpFxW5TXVNFIAfW7XlUEdM1hFM6DQb3HfH0ljZsdm2z6RIU4lqdTsy
	YZDKn6/Q4bo/mAiYuyVT3MzR7L52ec/+JL+G8YvdM+HfKxx4WXHPoeV+spFCo3/5uczM=
X-Gm-Gg: AYBFou35UIiJM+4mgHbjCi18ObtG3nRUFqe834EpSGaUY1oU+kzQ4u7iHztLAIVusuK
	74+jryTJITSuW7+0PcoAg2CWyQAOADKYKDLRYw0f7GABXjTNRTfYp4yweD6PA3S9raEJ4/tQAsa
	JBOcJNBR3wiHFcLH+fXljXLTV/+Xx7tpaMhXcMkgbcej7MU4dTO2iy2AM8Rm3EjVv5Nhv0GMQ/w
	AWZpWi/HeHWek0pUDLPbe5n//r2idOt9ddMLrKFu9JZhILNWknG+S5DS/EorGRzk2MYZARO66eJ
	sFHEm8GlxedMQyQPagqQj6kgQxiwjgnRVUBLZUnRT//Vj1NPNeuCI2pUiG8=
X-Received: by 2002:a05:620a:25c8:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93e9b77d0bamr78645385a.40.1791326484689;
        Tue, 06 Oct 2026 15:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93e9b77d0bamr78640985a.40.1791326484171;
        Tue, 06 Oct 2026 15:41:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:23 -0700 (PDT)
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
Subject: [PATCH 30/45] media: qcom: camss: sa8775p: add IFE lite top v3.0x
Date: Wed,  7 Oct 2026 01:39:38 +0300
Message-Id: <20261006223953.3382273-31-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac57915 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=jn2dZJ0VxpFUWOv3xz4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzGNaGnha5IL9
 7vuyluIe9vvjnH0/xRNsOtX+T1xP/cBloroIJW8XaCz0kiiEs/s7aurtqEXulrwUUVdJiP3Vq8y
 mrErs13vqmOZRmi3kbbPBXmrf5Xkxng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4k8VIPBPiF8O
 55t98LeglTV/IWv9+kJ40MDKSdzuFGZpGL2533DpibuFaGVJ7u6Wzu7uX7BAjGV3jxJvMyW8oFY
 Bnl2msZGd01oV0///BC8X7kKoBMHmuZwYywnN7cE+Hy3QMZCKcSeo3g+lzEoxLa/NyqefzuHbmW
 fLXZDsKMFMnj/QgcKEyjwh1TJ6DhB7m9eRQhl6vWs9ECM2gAjlzaZitln9rlGgnNDv7LyM/32bR
 Foj5DXe6LZUXoSjRhBeev9KhkfPQf931hMQiKLWI7mum1P5q/Eu6x46A+MGyxO31qfFS01MdYhW
 PasdD3wdNv5eFtnY4lm0shiIDqrzc2EWtvVkXU/Ga+5EFGnZnehSj7E2Z2E7GWvlvjOGZt45M0W
 G7nSxk4AIFpH3fDcemNFGRL7zRYOEhJN7Z5wkaWR7yh2H1si92ZzV3dKpDGugN2kvx+VjE+9UIE
 4DxZ70ARhnxn8BGIVzA==
X-Proofpoint-ORIG-GUID: Zkp-v68eJX05wdAyyB4NSZ98byx1i4ns
X-Proofpoint-GUID: Zkp-v68eJX05wdAyyB4NSZ98byx1i4ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE lite top v3.0x engine used by the SA8775P RDI paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-lite-top-v30x.c      | 265 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 267 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 479ab17f3bdb..695924e0c03b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -17,6 +17,7 @@ qcom-camss-objs += \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-bus-v31x.o \
+		camss-ife-lite-top-v30x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
new file mode 100644
index 000000000000..c3c182e4c895
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-lite-top-v30x.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife.h"
+#include "camss.h"
+
+#define IFE_LT_V30X_TOP_OFFS		0x0000
+
+/* CSID register update command */
+#define IFE_LT_V30X_CSID_RUP_AUP_CMD	0x00000018
+#define IFE_LT_V30X_CSID_RUP_RDI0	BIT(4)
+#define IFE_LT_V30X_CSID_RUP_RDI1	BIT(5)
+#define IFE_LT_V30X_CSID_RUP_RDI2	BIT(6)
+#define IFE_LT_V30X_CSID_RUP_RDI3	BIT(7)
+#define IFE_LT_V30X_CSID_AUP_RDI0	BIT(20)
+#define IFE_LT_V30X_CSID_AUP_RDI1	BIT(21)
+#define IFE_LT_V30X_CSID_AUP_RDI2	BIT(22)
+#define IFE_LT_V30X_CSID_AUP_RDI3	BIT(23)
+
+#define IFE_LT_V30X_MOD_VER_GEN		GENMASK(31, 28)
+#define IFE_LT_V30X_MOD_VER_REV		GENMASK(27, 16)
+#define IFE_LT_V30X_MOD_VER_STEP	GENMASK(15, 0)
+#define IFE_LT_V30X_MOD_GEN(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_GEN, val)
+#define IFE_LT_V30X_MOD_REV(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_REV, val)
+#define IFE_LT_V30X_MOD_STEP(val)	FIELD_GET(IFE_LT_V30X_MOD_VER_STEP, val)
+
+/* TOP functional IRQ registers */
+#define IFE_LT_V30X_FUNC_IRQ_CMD	0x00000064
+#define IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR	BIT(0)
+#define IFE_LT_V30X_FUNC_IRQ_MASK_0	0x00000068
+#define IFE_LT_V30X_FUNC_IRQ_MASK_1	0x0000006c
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_0	0x00000070
+#define IFE_LT_V30X_FUNC_IRQ_CLEAR_1	0x00000074
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_0	0x00000078
+#define IFE_LT_V30X_FUNC_IRQ_STATUS_1	0x0000007c
+
+/* IRQ_STATUS_0 bits */
+#define IFE_LT_V30X_IRQ0_DIAG_VIOLATION	BIT(1)
+#define IFE_LT_V30X_IRQ0_BUSWR		BIT(0)
+#define IFE_LT_V30X_IRQ0_ERRORS_MASK \
+	(IFE_LT_V30X_IRQ0_DIAG_VIOLATION)
+
+/* IRQ_STATUS_1 bits - per-RDI SOF/EOF */
+#define IFE_LT_V30X_IRQ1_RDI3_EOF	BIT(7)
+#define IFE_LT_V30X_IRQ1_RDI3_SOF	BIT(6)
+#define IFE_LT_V30X_IRQ1_RDI2_EOF	BIT(5)
+#define IFE_LT_V30X_IRQ1_RDI2_SOF	BIT(4)
+#define IFE_LT_V30X_IRQ1_RDI1_EOF	BIT(3)
+#define IFE_LT_V30X_IRQ1_RDI1_SOF	BIT(2)
+#define IFE_LT_V30X_IRQ1_RDI0_EOF	BIT(1)
+#define IFE_LT_V30X_IRQ1_RDI0_SOF	BIT(0)
+
+#define IFE_LT_V30X_IRQ1_RDI0 \
+	(IFE_LT_V30X_IRQ1_RDI0_SOF | IFE_LT_V30X_IRQ1_RDI0_EOF)
+#define IFE_LT_V30X_IRQ1_RDI1 \
+	(IFE_LT_V30X_IRQ1_RDI1_SOF | IFE_LT_V30X_IRQ1_RDI1_EOF)
+#define IFE_LT_V30X_IRQ1_RDI2 \
+	(IFE_LT_V30X_IRQ1_RDI2_SOF | IFE_LT_V30X_IRQ1_RDI2_EOF)
+#define IFE_LT_V30X_IRQ1_RDI3 \
+	(IFE_LT_V30X_IRQ1_RDI3_SOF | IFE_LT_V30X_IRQ1_RDI3_EOF)
+
+#define IFE_LT_V30X_HW_VERSION		0x00000000
+
+static int ife_lite_top_30x_acquire(struct ife_device *ife, void __iomem *base,
+				    void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	if (!csid_base)
+		return -EINVAL;
+
+	ctx->base	= base + IFE_LT_V30X_TOP_OFFS;
+	ctx->dev	= ife->camss->dev;
+	ctx->csid_base	= csid_base;
+
+	return 0;
+}
+
+static void ife_lite_top_30x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->csid_base = NULL;
+}
+
+static u32 ife_lite_top_30x_version(struct ife_top_ctx *ctx)
+{
+	struct camss_hw_version hw_ver;
+	u32 reg = readl_relaxed(ctx->base + IFE_LT_V30X_HW_VERSION);
+
+	hw_ver.ids.major = IFE_LT_V30X_MOD_GEN(reg);
+	hw_ver.ids.minor = IFE_LT_V30X_MOD_REV(reg);
+	hw_ver.ids.steps = IFE_LT_V30X_MOD_STEP(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_lite_top_30x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *top = ctx->base;
+
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, top + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, top + IFE_LT_V30X_FUNC_IRQ_CMD);
+}
+
+static void ife_lite_top_30x_reg_update(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *dsc)
+{
+	void __iomem *csid = ctx->csid_base;
+	u32 rval;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval = IFE_LT_V30X_CSID_RUP_RDI0 | IFE_LT_V30X_CSID_AUP_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval = IFE_LT_V30X_CSID_RUP_RDI1 | IFE_LT_V30X_CSID_AUP_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval = IFE_LT_V30X_CSID_RUP_RDI2 | IFE_LT_V30X_CSID_AUP_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval = IFE_LT_V30X_CSID_RUP_RDI3 | IFE_LT_V30X_CSID_AUP_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid RUP pipe: 0x%x\n", dsc->hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, csid + IFE_LT_V30X_CSID_RUP_AUP_CMD);
+}
+
+static int ife_lite_top_30x_pipe_config(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc,
+					const struct camss_ife_pipeline_cfg *pipeline_cfg,
+					const struct camss_ife_wm_config *wm_cfg)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_enable(struct ife_top_ctx *ctx,
+					const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static int ife_lite_top_30x_pipe_disable(struct ife_top_ctx *ctx,
+					 const struct ife_pad_desc *desc)
+{
+	return 0;
+}
+
+static void ife_lite_top_30x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(~0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	rval = IFE_LT_V30X_IRQ0_BUSWR | IFE_LT_V30X_IRQ0_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_0);
+}
+
+static void ife_lite_top_30x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval |= IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval |= IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval |= IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval |= IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 rval = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI3:
+		rval &= ~IFE_LT_V30X_IRQ1_RDI3;
+		break;
+	default:
+		dev_warn(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	writel_relaxed(rval, base + IFE_LT_V30X_FUNC_IRQ_MASK_1);
+}
+
+static void ife_lite_top_30x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *base = ctx->base;
+	u32 stat0;
+	u32 stat1;
+
+	stat0 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_0);
+	stat1 = readl_relaxed(base + IFE_LT_V30X_FUNC_IRQ_STATUS_1);
+
+	writel_relaxed(stat0, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_0);
+	writel_relaxed(stat1, base + IFE_LT_V30X_FUNC_IRQ_CLEAR_1);
+	writel_relaxed(IFE_LT_V30X_FUNC_IRQ_CMD_CLEAR, base + IFE_LT_V30X_FUNC_IRQ_CMD);
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+	isr_stat[IFE_TOP_STATUS_ID2] = stat0 & IFE_LT_V30X_IRQ0_ERRORS_MASK;
+
+	if (stat0 & IFE_LT_V30X_IRQ0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI0_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI1_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI2_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (stat1 & IFE_LT_V30X_IRQ1_RDI3_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI3_SOF;
+}
+
+const struct ife_hw_top_ops ife_lite_top_30x_ops = {
+	.acquire	= ife_lite_top_30x_acquire,
+	.release	= ife_lite_top_30x_release,
+	.version	= ife_lite_top_30x_version,
+	.prepare	= ife_lite_top_30x_prepare,
+	.enable		= ife_lite_top_30x_enable,
+	.disable	= ife_lite_top_30x_disable,
+	.pipe_config	= ife_lite_top_30x_pipe_config,
+	.pipe_enable	= ife_lite_top_30x_pipe_enable,
+	.pipe_disable	= ife_lite_top_30x_pipe_disable,
+	.reg_update	= ife_lite_top_30x_reg_update,
+	.reset		= ife_lite_top_30x_reset,
+	.irq_status	= ife_lite_top_30x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 31d9c83767a5..eff4ab4bd1c9 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -403,5 +403,6 @@ extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
+extern const struct ife_hw_top_ops ife_lite_top_30x_ops;
 
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

