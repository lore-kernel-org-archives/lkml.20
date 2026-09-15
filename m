Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E947F3BF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464888; cv=none; b=ndZvXqpU/lRgUU3KDFs69bDY/dFI4p4+64r1H5MjgESZvKgvoWZgOELV/8I36tDtPxAQbt/PuwyDE8L38pF9sJSDuypzyf+yET3LzoFhsji4UuZRvCJjxby/dHyVlamIJ+rgmqm3PPSqPE0vzJs8MbNZTx33ll7W9jwBaeWsYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464888; c=relaxed/simple;
	bh=l8l3zgI5ggIqHqzcsgs8kZHcgopwOeqbQ5FhytohvQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfswIdmp5MNMbHQycu4UjxFp4Qk0aAnbQoDamVvPhBy1qjwr6wb2nTQlgekEnz2g8GmxTaSCGHKMmd+ya3jtmE8MyCPFvS8DZK2KyQr8TOxDqLteZMmRIdZ3xI9QFGiDbaKPu2ed6r9NaEraIoaHbuJpZjuXIX0S1Gr+TkgjjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTBRxQB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsHR458U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTBRxQB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsHR458U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZA8H2983640
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOs9walHJJw69AYDM2I3Fg1rVywtqT+xIg+zcdGZUKY=; b=mTBRxQB0m0Y5aZZZ
	n8iJh3GjI6a8f3ozgaT1kiJ3EtQp0VAvay0M7k1x+mFXKlfrjFLuVJ7j4fsKv8TO
	bPC103i/Bg8CF4Y1cfyFt+kMpIy66nfyn4vLO2WB3dnpdKKa4a4VxgOEfuCSvdD4
	EU9lkPrN5WNwt6TVuFC8OALD0VTd7a3gX0QPqufX1q7jpHNZxAhaCPPndk5+3Lfj
	YGcydoq+64tV1uKYSq5/BB8ANGzLIyc0pyecMuvRKeHkC+BXc5U5ZzMvTIN3ykYR
	fJFWvdy0xVFb3crr87ZbHSdOTk3x98GUjP3De/TLszPay2iAtHkzLC9H/iTCTdRo
	exJZXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet3mh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso686109085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464881; x=1790069681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOs9walHJJw69AYDM2I3Fg1rVywtqT+xIg+zcdGZUKY=;
        b=LsHR458UbR05FUblVAz7hz6JLLQqiQtFwlm3pddHqQa8C+YcKxe69Zsez+HbgaNick
         DLNySGvLQRhJA7ucFa7SWwSyCLG96vvqFKzGN1pkFt2jqLO8cd8atmXByLZkuhRYZgeT
         1w3jb+1/cE1XKkQH1hQfVsqdn6z/B2kyQl/MpoHvKZDrgMhOyT00nJxWyB6GtwNmybVv
         t9A7SwHuIAh3eW4lmNtGTI0KHzXu4mzK0o/wNXO+tH/EQL5Qdrb7lnSogC7VqR0vuymP
         AvKpx9d04/jQP8T1XjHb3ImiqvOvQEGkWJfW/CPjmlY28zqeu46uLWubCboWArNeU5+j
         1fYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464881; x=1790069681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOs9walHJJw69AYDM2I3Fg1rVywtqT+xIg+zcdGZUKY=;
        b=amwRzzcXjaiVz0FILCTY3mHhRI6UCgYGudlPz4OHl36ATDZ4vRYyYjSq4SeA+xnYqw
         pFo94OZsy6nTWJlc01vhlr5E+3TaQ8VOuN5jNyQ0DYYkjkMqOaxu6G4Ctrnqky2vm6b0
         JOSXYA9cOY7mMFgZCzqpMaxVIFAY+1CrWBYhxy8Icxte43j3T7pW7rxkxcSH3vFFFeXf
         lSnNe68/DyzPXP5SZ2KChRhj8hmX904G7n1lb0MAPgymkyp00lQvnnbqPp4IBRP1P5Qg
         Qf+EzRSYDiHl/oCts1koh3MXu586gV2+4xO7cBtYl3k/zAB5yFAdNjgYZg2gRUK1oale
         m89g==
X-Forwarded-Encrypted: i=1; AKwUvBxRGm+yK0paKLD5pPv8IeNw8Sakjgschfu9Ipzpa5gw//imyhoPrmUu8fOlQcFnxi8qUUtOxqr0Z4hqzdY=@vger.kernel.org
X-Gm-Message-State: AFuF++ne/Qcgv4dGXRAv92q4jITK5/1CLBcMs699I/Ga3bOeNoKP/vs+
	Wmr5Xu6rQjui3br4v7gO4T2aiYdvrvluIPyW6+7u8S342hw0QdQTM9FCQuNqNwy95NP9aJ6l37A
	MsZ+SBbBI8pEZQuGxQX/jczdWwwYEQi9hblSbbMzefqK+bUGBJqeilaaDNlP/slxux3Q=
X-Gm-Gg: AYBFou13FxhCt/EYeQ6L54V2Vimq1+cUvPaLS0xAfHbKmZpTJtzzsn0BO/7flpYmnd6
	ayaSGsdcNDMk7wSv8xeKgJcrQq56WwyFTKp7v/47PMHsy3TOx6lhucA7LTAOMPnuK9LoFXLZLOZ
	cnDet065cMfL8CVvASAWFuuUjTfT6Y9nqTBRxHB3Le/a8Q1iyfW+hTlTtq73i0o0ZWGSgx04no7
	I8h8oW3zco+rgOt//9nJzXP7sOxnFCF7kfoDRhub1JdGGA43CI9NBquMN+sasxzwwXbSDEIdaL7
	8CFRy/eT9ORf0HYE2SkEFVo1ChGB49dTtfXEnYPEpdOXX48B8tRuZpZp4Uxr1gp0VEUz/3RoKDW
	1aY+V4SPhNBWJ4bin6SAHU5OuE8I+nXYIvoGl2YFW6CGmvq9GdAFa1DsVQ0JKFzi2+w1X
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr939389385a.47.1789464881281;
        Tue, 15 Sep 2026 02:34:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr939385185a.47.1789464880846;
        Tue, 15 Sep 2026 02:34:40 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:40 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:13 +0800
Subject: [PATCH 3/6] media: qcom: camss: vfe: Add support for VFE gen4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=9928;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=26zi0JchTt8PHF/SpTXs8DPDh1ZSqBeWarlYfbobtmQ=;
 b=8salKneR3fi4WUi79ac06MU8hogwYJ23UJ4fKnoFYJnmE2ZJDbL98GhfL4mY6oay76eXC5uo1
 3hH0bEASaetC/sxFY+BWhbZnmcMOn1b/xoxExi/1vg10PwWEFwkPV49
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX2n8p/GNbKPJx
 5WGT3gkNvmmy/P8vtDrhihaCFaHPAFZLakB1xSQSdM/eAhnHDB9Gp5Aj7Rc58Cef8V+AbGFdFe+
 qp1sMNRG9IpdIs154kCgYC2c9nQ1t6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX2EogbAP3Zkgw
 k8OF8k/h5tBhQAduEEPpf+CEYvkwRPBq3IglM6cM56QSmr4GIUuOqlKO1375pHCb3b06DsK8BCm
 mBCGxmdj5nXdbDm8aJeINzBY8nZPUAgKK4kMu3xUd6zXnh6hSgPjJUWHD6KxrnE+CBmd8I1F9Rl
 eo4HrwrgoyOaOkEu9WEAPgq/4M+obU93+INAF++vDvGkbuK0lwIyamRI+ILfr/HdZOfOku4koww
 Z2hAhbhpkuXIAVz94kpVPOA7lvR+YNjHFiAViXpE8lQqCl5K0WlSa2wn1DPJ5sNttp8UuU/e+Rb
 BSTUIwTOK8uQxdbJCJNcqqYLvRXOc0llUpDSYsAkLOb3OuAwYDEFgCATquseYR4g3rFyQk5+fri
 3QJPRXnXy7pPaZrosVrQF7ZAOW4Cnxmc2P3m7r9vWSXqL3FFPd3iC5OmEAGYLcr11lW14ZCVRK0
 WFERSGMGWx4jgdiF/OQ==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa91132 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PhGdKt2hvZt8ZBhIn14A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yfKDxTSMI1wOeCPp4MVJttyrkgqe58Um
X-Proofpoint-ORIG-GUID: yfKDxTSMI1wOeCPp4MVJttyrkgqe58Um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the VFE (Video Front End) Gen4 found on Kaanapali SoC.

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
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   7 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 4 files changed, 205 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index ddda81b6a3ee141e0ed5bee61d5970a0d7ee6116..76bcd43c5c8770488da13ddaa3249878edf6ffc6 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,6 +28,7 @@ qcom-camss-objs += \
 		camss-vfe-680.o \
 		camss-vfe-gen1.o \
 		camss-vfe-gen3.o \
+		camss-vfe-gen4.o \
 		camss-vfe-vbif.o \
 		camss-video.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
new file mode 100644
index 0000000000000000000000000000000000000000..d73d70898710a2127c606ac8459a1d8c747a2f7c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-gen4.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen4
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
+/* VFE-gen4 Bus Register Base Addresses */
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
+static const struct camss_video_ops vfe_video_ops_gen4 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_gen4;
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
+const struct vfe_hw_ops vfe_ops_gen4 = {
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
index 319d191589884777bced456867e5a2a4211a2770..11f616ae035c1814e21ae2a01c5e1131022da236 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -525,7 +525,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	ops->reg_update_clear(vfe, line->id);
+	if (ops->reg_update_clear)
+		ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev,
@@ -552,7 +553,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+
+		if (!vfe->res->reg_update_after_csid_config)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a3783cc0c9945e58167573b48441067..c402ef170c81bf3b9a26ff3d92db1d3a1b44329a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -133,6 +133,7 @@ struct vfe_isr_ops {
 
 struct vfe_subdev_resources {
 	bool is_lite;
+	bool reg_update_after_csid_config;
 	u8 line_num;
 	bool has_pd;
 	char *pd_name;
@@ -249,6 +250,7 @@ extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
 extern const struct vfe_hw_ops vfe_ops_gen3;
+extern const struct vfe_hw_ops vfe_ops_gen4;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);

-- 
2.34.1

