Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6E38A718
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018163; cv=none; b=gHPz0myPU/umY0ronpcr1uBcpAb9Z1SHVIZBPPTnA//HIdtj5/S+UtdOdwPqaIkbWWuqQgq9EPZO078g+jG2yEyuHXUoTQRRPAdVcjaQubASmX0fFCrC5WtqxbHQ3cZ/I/tEQvPtDmSirKyKylUfGe3mz20h2rdTAspfZZzFQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018163; c=relaxed/simple;
	bh=fq6FNncnJ9XCNLcvXcGDlkvtc23qLhPaPccLBH3BKKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9WqwAt6x2hlpjtZHUNUZnpuxFSejj7A9HbZCdCAvnMDKGRuXHNeQQFEpwuIipYehXwEDAPngLuDcjkzNN6F5i04JkFxANsLxOS2L2korxBeHOaIoDWXnrQE8NZwrshhrejWq8MFTVJaDNJ2cjZ8sGExz6XxNp/1bFcAHifYqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq1C3WhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZspyvos; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eq1C3WhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZspyvos"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933jVlo2450914
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+YR1yKqj2XNvjoX0xlo2VGAKz6PDOk6ZCvZEYhzj9s=; b=eq1C3WhKyBhPIPXa
	/80HQa/ogOMc8Zlrc1e0E7dd3HcWmICt9qc42hwYNeRi4PAJCJ1Y0GUR1HVSB/c9
	MdjJzqv8PuYHQ1cevPG4+OQXRLmVrpi9qvM0I+umwXDDKoC+S6558vxcchRDXGNt
	UEvCMCk9QI+MGBz1NO/ywstiBFIE5M+zF61BTZtxzsP91U2tuxKmWEC6di1ySVB7
	gCh9gNyerwzO80cpGbPqW/nvX5Mrnc4CR3pl53a96tvHL1zP/nxxjg5526NVOzOr
	qqMYjckUooPfS7m1SdxY5bjdof20iFTHmx8rBQV9gTbmMlifK/Pf5zpZKZrS0H3U
	Qrw23w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36gg7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso182763eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018157; x=1791622957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+YR1yKqj2XNvjoX0xlo2VGAKz6PDOk6ZCvZEYhzj9s=;
        b=cZspyvoszGlQNT7Bh4m3/zAIpl3a6zl9eY6ncFcvUbii2tHt0juqTA5rm+BjAt8nvO
         f4G0T21j9tplDQolXxNwCEd4RmHeg4/E9gypI5nunEBBsBX1gOmgdykoTVyEMwVyzNmT
         kZbL9Ng61rdXEpg6ARMxHTivVLOPA/HVA7d+oM054PT7L28XjgOKfOxWyzvZtmqVlqxO
         qjqZQXTlOnNoapmekN+5HuswP97FGom43V1Oa/TcsFEZc9AxD0bE5sdARHxplKfF7o8t
         UIaMskRmOnqmyceyWbojloLUsboHZ/k8r0ioSzn9xol/jrepgVFpz2zs0klSd7YMFkOn
         6MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018157; x=1791622957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+YR1yKqj2XNvjoX0xlo2VGAKz6PDOk6ZCvZEYhzj9s=;
        b=PfqJ13c9cT8jhM/3mdMuwmMXSHyC6k145ySVVQQrY1s+wY1PrRAZ3J2DOMRHDQ19PA
         CNRcTmtPncK+HN5x95bzgoAlqcQyxjJRsn5sVPRC2l4D2zyP1CBW0CIznaFr/z/bXldb
         +0DJttrZjZM+pmrnXfhQwq6icNIw+lsT/0r387wyncxwu8Z4zI/rnK8kU9rwZ5oLFhsr
         3zIze3J/nLp/RhJYQiSCmHnXpk35Qx6JKPZBirwyaAYkkbP77DcZlQV47ZpkPXODZERr
         KvFo7br7YDZht7w65/PgTQesJK/dVX9/jdeLTIN4v5KNcgCgNUP/+htrvI3FjFaSuO/k
         07Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxhHoMB2giENJhFpmt0RIlPK7/g58+n2RXSu29IEIzQB15Q9kcoUuMr4UJN+K7XSrcJlk+tMobOZCHF1jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnTncfhoxyoJBeTIld67X/X1I/DQcIYSk2kYtAQYAPZUuMzXI7
	2dd8f/9/JUskVwPcquMvdrHrDOAixh7O8EyU6pa1fzkD3fdwG8KvsgJwEn6ThDVqq2jVFxPoQmu
	NQJWGn/RD4/SsOpJRJorJy2bYQse1+G+Na99KLlJIKMX8Bm/ZALAv8Frs75KIPc8fDOI=
X-Gm-Gg: AYBFou2uoQQ9+c0a16BCNEEN/ktKz6I9/p+hZJ/ymhQPBYW3Ay1KrvjdmdzFwPgd79i
	nduNpNFst6RiYCie1cfSu2ZIvZVf65MZtaKK7FwZ5ygEnVcrAt6E1rtv7KyGBNo9UhaermTNemh
	IAoAu0mFDpbI5rkyaUOgW8Q93f6yuZ6xzZZVvCj/7Dh5uZ1mNvdXYmpjWVZTuvXaIr/LNWdkBrc
	RI9kc9bjEcINUIgoiDwbjTepeq+OfgFyMphGmep2QqKannaxQJTOqGV1t9GFKfMZVLBP/JMU5Df
	7o6YE4ILIC/ZxLTv3FF9nMC7EXwi0lTINsK0qX45Ee1iOyqjAcA9wTLmNHkeRiwqf+to1rSIokL
	nrirbVYgXf389qHeHe+tw8qIUeglIP/lI0HdaNnCgGNb/wuWZApHTpeMuLrvvD0GvxAl/gyI3hY
	JYSw6x++eXMw==
X-Received: by 2002:a05:7301:d788:b0:351:d0f:c808 with SMTP id 5a478bee46e88-3510d0fcb46mr3763506eec.6.1791018156680;
        Sat, 03 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a05:7301:d788:b0:351:d0f:c808 with SMTP id 5a478bee46e88-3510d0fcb46mr3763456eec.6.1791018155878;
        Sat, 03 Oct 2026 02:02:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:18 -0700
Subject: [PATCH v18 07/11] media: qcom: camss: vfe: Add support for VFE
 1080
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-7-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX2M7oktYSmOC3
 LFN0rlEgipOhlg3N/EbXOJuesDrm9QvV7RIP0Od0WkB+Rr1YrYsMY9Ky+4/2mslev0PRrQsjFOV
 BCZCjojG34qwfNboxwrIBSUpU6ihuTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX2NUUEoW3mNdT
 dpYHbm17qrNLtpnrzQUTioVNnHu1ZkIjjqyeENSjw8dcvyPyn2EO65ro24OzJZMv3vWlrjq41u0
 8VTD/JBYGep8e67LqP5EKGu2vyoW7jK91572ezc4Je5vBBoVFYmTa6NlHZAmK/O5K3JR9g7w/n8
 OSRSNqM1mCGAkb2iTyUfj3NfTj1bEv01eivC6lg2t0e4Q7r3MYw4nkGexq40aNofP2biYQtc0Y1
 FI8OQ5FhqoSReTpy8xUv42HmqVLBg+SJxzUnypooT1BUNX/QKNfETjejmYA9alJYFkGWg3Y3spY
 NlRUHlyp2cYfR+gFgqd/CMPcO42zMDcSScd9pgGzqhOwv65XQ1fiJpgvOjzvra3obhC8jSEDGxR
 JZyBNseyjpelnfZaRPmKwYjDebz3NvQbBf6HkAOTWzpzv4VSjWjfg3dAIuR3IENrOteqaBptwrE
 iZTOaj9k1DGNvHavh6A==
X-Proofpoint-ORIG-GUID: GaeUbYcvsGu-C59wl8slHk9LH8nGC0vO
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac0c4ae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1ZGTSUkntXfq-hYXLBIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: GaeUbYcvsGu-C59wl8slHk9LH8nGC0vO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.

In the Kaanapali camera subsystem, the front-end blocks are referred to
as TFEs (Thin Front Ends). This driver continues to use the VFE naming
in some places to preserve consistency with the existing code and avoid
unnecessary renaming. Support is currently limited to three output lines,
matching the constraints of the CAMSS framework.

Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
CSID configuration has completed. In addition, the number of AUP_UPDATE
requests must match the number of buffers queued to the write master
while it is being enabled.

Although real-time TFE traffic is routed through RT_CAMNOC, both
camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
reset in a fully idle state.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 153 ++++++++++++++++
 5 files changed, 360 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 218ba3a95939..42a14e8fe1b7 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -26,6 +26,7 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-1080.o \
 		camss-vfe-gen1.o \
 		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
new file mode 100644
index 000000000000..016857cd1025
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
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
+/* VFE-1080 Bus Register Base Addresses */
+#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+
+#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
+#define		WM_CFG_EN				BIT(0)
+#define		WM_VIR_FRM_EN				BIT(1)
+#define		WM_CFG_MODE				BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
+
+/* VFE lite has no such registers */
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
+
+/*
+ * IFE write master client IDs
+ *
+ * VIDEO_FULL			0
+ * VIDEO_DC4_Y			1
+ * VIDEO_DC4_C			2
+ * VIDEO_DC16_Y			3
+ * VIDEO_DC16_C			4
+ * DISPLAY_DS2_Y		5
+ * DISPLAY_DS2_C		6
+ * FD_Y				7
+ * FD_C				8
+ * PIXEL_RAW			9
+ * STATS_AEC_BG			10
+ * STATS_AEC_BHIST		11
+ * STATS_TINTLESS_BG		12
+ * STATS_AWB_BG			13
+ * STATS_AWB_BFW		14
+ * STATS_AF_BHIST		15
+ * STATS_ALSC_BG		16
+ * STATS_FLICKER_BAYERRS	17
+ * STATS_TMC_BHIST		18
+ * PDAF_0			19
+ * PDAF_1			20
+ * PDAF_2			21
+ * PDAF_3			22
+ * RDI0				23
+ * RDI1				24
+ * RDI2				25
+ * RDI3				26
+ * RDI4				27
+ *
+ * IFE Lite write master client IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * STATES_BE		5
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
+static const struct camss_video_ops vfe_video_ops_1080 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_1080;
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
+const struct vfe_hw_ops vfe_ops_1080 = {
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
index 2680a9914765..3acef6ba97dc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -525,7 +526,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	ops->reg_update_clear(vfe, line->id);
+	if (ops->reg_update_clear)
+		ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev,
@@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+
+		if (!vfe->res->reg_update_after_csid_config)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -2013,6 +2017,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..118cac5daf37 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -133,6 +133,7 @@ struct vfe_isr_ops {
 
 struct vfe_subdev_resources {
 	bool is_lite;
+	bool reg_update_after_csid_config;
 	u8 line_num;
 	bool has_pd;
 	char *pd_name;
@@ -248,6 +249,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
+extern const struct vfe_hw_ops vfe_ops_1080;
 extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c79305693d9c..ddd7d94989ed 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -162,6 +162,157 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 	}
 };
 
+/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
+ * to operate on any TFE Full.
+ */
+static const struct camss_subdev_resources vfe_res_kaanapali[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe0_fast_ahb", "vfe0",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe1_fast_ahb", "vfe1",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe2_fast_ahb", "vfe2",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5719,10 +5870,12 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
 	.csid_res = csid_res_kaanapali,
+	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
+	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

