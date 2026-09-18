Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283373D5663
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705765; cv=none; b=swsKydV5FfjrxyLx6XAx6i81kt5/6hWlKHn5GagXQgCASPEdThItS4Gv3rdAn30m+bKz4Jr8Ti6QRpa0qC38q1MhzD6jlv/hiOZ0JU0xUEJrTd4WiRYSyow4Lu3gf0bUvUSzofF77sY+kBo/EkJf8jQhdAzq9AjcEH+e7oaoM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705765; c=relaxed/simple;
	bh=K+YPxUBqxffdlzoZVOwR84o7xjT9qJ/uotZNQAAU9gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2E42ZjyLboc/whA5AV66v+76zIGCTtaEZK9U2nCWb8rSeH6FYJRpwWP4R9hRhtTomS+R50v306AlN2n3htDI1sTFZUNdHNnfK7dOg1CT8wYDP4rr31mkfIH9sZY6KbAbtJQk0olhD+98ooSpzKql5dyMjenvf0AAtvLoOO6Hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzVQ4ZZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kbbbh3UM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzVQ4ZZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kbbbh3UM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I43soC3833437
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRBOaiA6EUI8kVzk5SZxKGQ9npxRNCfy/U7puyUcR3c=; b=jzVQ4ZZjvE5XbxKR
	0n0moxiG1Aq+p7DfSc2odPrJSrmSo3/E7fptzhU5QByRA/+gfWS1W2x2iqWoqpoB
	b8IG2zSDJ4zQqXAMhf9WZ1IHk8/eV5XKc3m39TuGHsZsyPNV3rPO//HW+HLFknX0
	U918c5QiQq9LGVzzGabqq+m7HmRayfkI6CKHMaW1iHjRdOdSascF5p3NjVPABIri
	VRBnD8ZPl9duhMyW+s45j2dMp2P9elA5fNBPlNNlW+xVXKSncleRcUt2GIJR1iQK
	Ahp9nlac939C45NcTfCQ0cg1X6BE/dIBEPabF+m11zWV5v0DfZGh/BCSCXvqP5Xc
	fSR9Ig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrr2j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc2229450b4so283829a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705762; x=1790310562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRBOaiA6EUI8kVzk5SZxKGQ9npxRNCfy/U7puyUcR3c=;
        b=Kbbbh3UMhvB/758aEHAuqr5xx8VBOhdTnYLPq5ZIyCdDRzgIWKp49yV4S/GUKwMr2z
         Ey1cc75HSsiixeIkhOmdf8q+cMADIMz+TFVZQJPSvl1YK5/6J2trTzJugGMXvu1F/0ZP
         Uly76PHvJ0eZ8Q9u0URzG+nyRnUFLZ5nKBxnHJDnI3+ViWZbUgI70/+S/ARwUG3I5kWR
         GLQKd+z3UgKkkiByvcwx6mimQ0qjV+zu4RL/lGkdG+UxYuTuFT0C8ptNjsPgkFL8B2h3
         F1lNhOPXwazWWprd0fY/gsWTqFshdN/o/2OP1xh9XEiD1OgtufAOVx+GGnazX/4k0f5/
         4Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705762; x=1790310562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRBOaiA6EUI8kVzk5SZxKGQ9npxRNCfy/U7puyUcR3c=;
        b=MOgJ7V1X5YHi/IWV68PrXMDiFFu2NJdfmcRGb4X6W7smZQHKnLju1Ckma/cgfUexxE
         qas1WLX4jTGBrqEd8BLQJ5ODpUmu7pVFSXKpn2tKdJtLnnD/MhBLx0SGI4yD7JnXE5CX
         mmrlqB3hffGR+4YDyI7B+a/VsSXLYEM8J343cFpEikKlDTtwJOP1hqEb+kVkqCn69J0F
         Un4MGe8RLoPgUigZbh8Suk0zAZ1XsMAZk8kJFC3KHf+SXcQv9KyuS5hy0ubk+LGGh6FV
         DO1a2eycFYr/s4KP4Bx6edBtjyB7Clb9hjRUziz6DzBfXYI6De4IU5Is+V91Vf2kY7ho
         L6mg==
X-Forwarded-Encrypted: i=1; AKwUvByEVVIks0jR/QTk5YzBzUthRxW/jyVsC7aC7d9qbznBFEDoOMIVDl5EDYFLR1Rh8RsXqqhXj+NGrRO0Nug=@vger.kernel.org
X-Gm-Message-State: AFuF++lk+S9lUUEPymIwkOgcmCwOZdmF0CsiqmsyJjYtLqIqF9gzCQMv
	OGRmo6YpzLHAZDfl4iPTV9L0g2RE5epfBMQVTKbTptGRNbkXA/UXjlLHxBAJ28WjvH6q9d9sDD0
	n0JJa0oL8Qwia/XBr/BjfmU7AtTn/ofkRMNi/rVhKh24tZ5XkByXdV+nypAqetFhfwGU=
X-Gm-Gg: AYBFou0xLoBVoQqyo5LVLdfhbVAQXy1M83qRSXRKUNjYMPytZsDKf4jDD2yHXQcrdQy
	U5+papuv080lgqUoYw+Frum9jvoOxHc7x+4HXi4pd6j4Fh1KMMgd6qy2f90P9vm1qg578zlns3K
	VxHm7egoe7bi65HMjQkqZ3DIvmfky2wUo9hmd6VksfB0DlKv0xOQ+8rle04aBGo2vAdRtLs3IwC
	0nDnNnJjBr7Q+Viw/M+WmLXdIokth6gcE3kmbhJ21hNZTWchxCuOODDPcwXD/IDHReLdNbkrlz6
	EWBbCTD/nQ2+7VILVmWUpeapgk9/MWUsEazRsihaRJaMwJQ05c5Kml53qm9oLixP/ZVlJ/u1u+3
	sztg/5qSCueBcUPNkIz5Wsx3SmJo7gng=
X-Received: by 2002:a05:6a21:e081:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd8c37cc76mr2875310637.9.1789705761368;
        Thu, 17 Sep 2026 21:29:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd8c37cc76mr2875246637.9.1789705760832;
        Thu, 17 Sep 2026 21:29:20 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:20 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:43 +0800
Subject: [PATCH 4/6] media: iris: add VPU5x hardware ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260918-add_iris_for_hawi-v1-4-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=24148;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=K+YPxUBqxffdlzoZVOwR84o7xjT9qJ/uotZNQAAU9gI=;
 b=FIPgm8tL7QLLIrN4TrlAbrmLsP0xHzhdozennPkfVpjzqGkUa2bHuW7z5xZ+SWL5ETxuJbmZd
 VdL2lGRAsYrDC5okatShtfkJgXdalqgEROmEgQw2C6b5+mei8bEpYUP
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aacbe22 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4L-smajPeleGBe0zsKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX4PH02hC1yCVU
 ZAO+aB1OVjSK5pN64ASsi9cBQcYcI2jqpafco7DYOBpyiZKgPBxcpJV5m50/UkMvZqtuqYv7q+X
 ZPzD5hkzklTEDWSV++ZNtBG7+6zI9ieAxBWpQueNeTAMFnU514ZEd4ok4OO4j+uUEAarvsL0ZV8
 t3oRYcYxUdYzjrz1yh4+Si1aw74WQ4B4O6jUbj53K/ISGF0kpQOPfq1LF5CGVmi0E9gU9bXrR1L
 4/aTC81wZg2l+AIxKZ2u+MZ2SaCHXo0DBqxpp6qCAq84wEWxfW5mOuPdTvvrfktP4x3e5XSoZOA
 2C7+TNKSMe2ybbdJj8JO0IV8S+PyhT1SaCuk5Ew0foNYWydYMZz32SBQQwKzxpYzjZqUTPuI/q0
 laqBsX6SGs9jFVAz8TkcC+K4HnPbS99J/9tb04z81b8WPg2XWk3TlfmTz0Tc8pC9N3BDfchtfqE
 4BLZFXPc6ykDdMDs7vg==
X-Proofpoint-GUID: Z28we3eo4fC6hm5qwNnqwG2i59P-wZYD
X-Proofpoint-ORIG-GUID: Z28we3eo4fC6hm5qwNnqwG2i59P-wZYD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX2bDCJovAVe3I
 rWvXFy4V3ySLuych9t0L8X/Mf5qeK+8ebhs2CWEQoYpd7UJDrf2LDn02tnbfynlrlTb1plZP3Mt
 iqYX2/bwTRnt3ygTEh+M8YHQmsFqUJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

The Hawi SoC uses the VPU5x generation of the Iris video hardware, which
requires handling for two new power domains — mm-int for the internal
memory interconnect and cx-int for the CX domain AXI interface — as well
as additional generation-specific clocks. Without a VPU5x vpu_ops
implementation the Iris driver cannot power on or off the hardware on
Hawi.

Move the shared idle and core power status definitions to the common
register header so they can be used by both VPU4x and VPU5x code.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   4 +
 6 files changed, 600 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..3ca4db45cb07323bdc18e5aba99ec7195087fe73 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu5x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..193e6f293cda5462ecca9acc0ebc79c936b68bb4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,6 +76,10 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXIC_CLK,
+	IRIS_CTRL_DEBUG_CLK,
+	IRIS_VPP_GATING_CLK,
+	IRIS_CX_AXI_CLK,
 };
 
 struct platform_clk_data {
@@ -237,6 +241,8 @@ enum platform_pm_domain_type {
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
+	IRIS_MM_INT_POWER_DOMAIN,
+	IRIS_CX_INT_POWER_DOMAIN,
 };
 
 struct iris_firmware_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 93acbfa0f471fdec1cb75db732f37ef6c6ef5cbf..267139a732d923b8e4939bc7d2932d06fac7a006 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -11,10 +11,6 @@
 #include "iris_vpu_register_defines.h"
 
 #define MVP_NOC_RESET_REQ_MASK			0x70103
-#define VPU_IDLE_BITS				0x7103
-
-#define CORE_CLK_HALT		BIT(0)
-#define CORE_PWR_ON		BIT(1)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu5x.c b/drivers/media/platform/qcom/iris/iris_vpu5x.c
new file mode 100644
index 0000000000000000000000000000000000000000..726c3f35ece4dd1abe4fd3916a5db699029d154e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu5x.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/pm_opp.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+/*
+ * iris5 specific register defines.
+ * Many base offsets are shared with prior generations:
+ *   WRAPPER_BASE_OFFS = 0x000B0000
+ *   AON_BASE_OFFS     = 0x000E0000
+ *   AON_MVP_NOC_RESET = 0x0001F000
+ *   CPU_BASE_OFFS     = 0x000A0000
+ */
+
+#define WRAPPER_MVP_NOC_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x110)
+#define WRAPPER_MVP_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x114)
+#define WRAPPER_MVP_NOC_CX_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x118)
+#define WRAPPER_MVP_NOC_CX_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x11C)
+
+#define AON_WRAPPER_MVP_NOC_ARCG_CONTROL	(AON_BASE_OFFS + 0x10)
+
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
+
+#define CPU_NOC_BASE_OFFS			0x000D0000
+#define CPU_NOC_ERRORLOGGER_MAINCTL_LOW		(CPU_NOC_BASE_OFFS + 0x08)
+#define CPU_NOC_SBM_FAULTINEN0_LOW		(CPU_NOC_BASE_OFFS + 0x240)
+
+#define NOC_BASE_OFFS				0x00010000
+#define NOC_ERL_ERRORLOGGER_MAINCTL_LOW		(NOC_BASE_OFFS + 0xA008)
+#define NOC_ERL_ERRORLOGGER_ERRCLR_LOW		(NOC_BASE_OFFS + 0xA018)
+#define NOC_SBM_FAULTINEN0_LOW			(NOC_BASE_OFFS + 0x7040)
+
+#define NOC5_RESET_VPP0_ONLY_DISABLED		0x36010E
+#define NOC5_RESET_VPP1_DISABLED		0x35000F
+#define NOC5_RESET_ALL_VPP_ENABLED		0x37010F
+
+#define NOC_LPI_PD_QREQ				BIT(0)
+#define NOC_SBM_FAULTINEN0_PORT0		BIT(0)
+#define NOC_ERRORLOGGER_MAINCTL_FAULTEN		BIT(0)
+#define NOC_ERL_ERRORLOGGER_ERRCLR		BIT(0)
+#define AON_MVP_NOC_ARCG_OVERRIDE		BIT(0)
+
+#define WRAPPER_INTR_MASK_SS_CPU_NOC		BIT(6)
+#define WRAPPER_INTR_MASK_SS_NOC		BIT(5)
+
+static bool iris_vpu5x_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+
+	return !(value & CORE_PWR_ON);
+}
+
+static int iris_vpu5x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
+{
+	int ret;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	if (ret)
+		return ret;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_hw_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp0_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp1_domain_mode;
+	}
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN],
+				      hw_mode);
+	if (ret)
+		goto restore_apv_domain_mode;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN],
+				      hw_mode);
+	if (ret)
+		goto restore_mm_int_domain_mode;
+
+	return 0;
+
+restore_mm_int_domain_mode:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN], !hw_mode);
+
+restore_apv_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_vpp1_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_vpp0_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_hw_domain_mode:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+
+	return ret;
+}
+
+static int iris_vpu5x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_vpu5x_ahb_sync_reset_apv(core);
+
+	iris_vpu4x_vpu5x_ahb_sync_reset_hardware(core);
+
+	return iris_vpu5x_genpd_set_hwmode(core, true, efuse_value);
+}
+
+/*
+ * Perform an LPI power-down handshake on a single NOC interface.
+ *
+ * Sets QREQ and polls for the status DONE bit. On a busy response the request
+ * is toggled and, when @errclr_offs is non-zero, the NOC error-log clear
+ * register at that offset is written between retries to unblock the fabric.
+ * Pass @errclr_offs = 0 for interfaces that do not require error clearing.
+ */
+static void iris_vpu5x_noc_lpi_handshake(struct iris_core *core,
+					 u32 ctrl_offs, u32 status_offs,
+					 u32 busy_mask, u32 errclr_offs,
+					 const char *name)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	do {
+		if (errclr_offs) {
+			value = readl(core->reg_base + errclr_offs);
+			value |= NOC_ERL_ERRORLOGGER_ERRCLR;
+			writel(value, core->reg_base + errclr_offs);
+		}
+
+		value = readl(core->reg_base + ctrl_offs);
+		value |= NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+		value = readl(core->reg_base + status_offs);
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & busy_mask;
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		value = readl(core->reg_base + ctrl_offs);
+		value &= ~NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "%s NOC LPI handshake timeout\n", name);
+
+	ret = readl_poll_timeout(core->reg_base + status_offs,
+				 value, value & NOC_LPI_STATUS_DONE, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "%s NOC LPI status timeout\n", name);
+
+	value = readl(core->reg_base + ctrl_offs);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + ctrl_offs);
+}
+
+static int iris_vpu5x_power_on_cx_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CX_AXI_CLK);
+	if (ret)
+		goto err_disable_cx_int_power;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+
+err_disable_cx_int_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_cx_int(struct iris_core *core)
+{
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_CX_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_CX_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "CX");
+
+	iris_disable_unprepare_clock(core, IRIS_CX_AXI_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CX_INT_POWER_DOMAIN]);
+}
+
+static int iris_vpu5x_power_on_mm_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	if (ret)
+		goto err_disable_mm_int_power;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+
+err_disable_mm_int_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_mm_int(struct iris_core *core)
+{
+	u32 value;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "MM");
+
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_MM_INT_POWER_DOMAIN]);
+}
+
+static int iris_vpu5x_enable_hw_clocks(struct iris_core *core, u32 efuse_value)
+{
+	int ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_axi_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto err_disable_hw_clk;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP0_HW_CLK);
+		if (ret)
+			goto err_disable_bse_clk;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP1_HW_CLK);
+		if (ret)
+			goto err_disable_vpp0_clk;
+	}
+
+	ret = iris_prepare_enable_clock(core, IRIS_VPP_GATING_CLK);
+	if (ret)
+		goto err_disable_vpp1_clk;
+
+	return 0;
+
+err_disable_vpp1_clk:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
+err_disable_vpp0_clk:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+err_disable_bse_clk:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_axi_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return ret;
+}
+
+static void iris_vpu5x_disable_hw_clocks(struct iris_core *core, u32 efuse_value)
+{
+	iris_disable_unprepare_clock(core, IRIS_VPP_GATING_CLK);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+}
+
+static int iris_vpu5x_power_on_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	int ret;
+
+	ret = iris_vpu5x_power_on_cx_int(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu5x_power_on_mm_int(core);
+	if (ret)
+		goto err_disable_cx_int;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		goto err_disable_mm_int;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		if (ret)
+			goto err_disable_hw_power;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		if (ret)
+			goto err_disable_vpp0_power;
+	}
+
+	ret = iris_vpu5x_enable_hw_clocks(core, efuse_value);
+	if (ret)
+		goto err_disable_vpp1_power;
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = iris_vpu4x_vpu5x_power_on_apv(core);
+		if (ret)
+			goto err_disable_hw_clocks;
+	}
+
+	return 0;
+
+err_disable_hw_clocks:
+	iris_vpu5x_disable_hw_clocks(core, efuse_value);
+err_disable_vpp1_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+err_disable_vpp0_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+err_disable_hw_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+err_disable_mm_int:
+	iris_vpu5x_power_off_mm_int(core);
+err_disable_cx_int:
+	iris_vpu5x_power_off_cx_int(core);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	u32 noc_reset_mask;
+	u32 value;
+	int ret;
+
+	iris_vpu5x_genpd_set_hwmode(core, false, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_vpu5x_power_off_apv(core);
+
+	if (iris_vpu5x_hw_power_collapsed(core))
+		goto disable_clocks_and_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value & CORE_CLK_HALT)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN,
+			   value, (value & VPU_IDLE_BITS) == VPU_IDLE_BITS, 2000, 20000);
+
+	if (efuse_value & DISABLE_VIDEO_VPP0_BIT)
+		noc_reset_mask = NOC5_RESET_VPP0_ONLY_DISABLED;
+	else if (efuse_value & DISABLE_VIDEO_VPP1_BIT)
+		noc_reset_mask = NOC5_RESET_VPP1_DISABLED;
+	else
+		noc_reset_mask = NOC5_RESET_ALL_VPP_ENABLED;
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, (value & noc_reset_mask) == noc_reset_mask, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset ack timeout\n");
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset deassert timeout\n");
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_vpu5x_disable_hw_clocks(core, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_vpu5x_power_off_mm_int(core);
+	iris_vpu5x_power_off_cx_int(core);
+}
+
+static int iris_vpu5x_power_on_controller(struct iris_core *core)
+{
+	u32 mask_val;
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXIC_CLK);
+	if (ret)
+		goto err_disable_ctrl_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axic_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_DEBUG_CLK);
+	if (ret)
+		goto err_disable_ctrl_freerun_clk;
+
+	mask_val = readl(core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_CPU_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	mask_val = readl(core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	return 0;
+
+err_disable_ctrl_freerun_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axic_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXIC_CLK);
+err_disable_ctrl_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_ctrl_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu5x_power_off_controller(struct iris_core *core)
+{
+	u32 ctrl_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
+	u32 value;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON,
+	       core->reg_base + CPU_CS_X2RPMH);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_IRIS_CPU_NOC_LPI_CONTROL,
+				     WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY, 0, "CPU");
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE, 0, "Video CTL");
+
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+			   value, value == 0x0, 200, 2000);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+	value |= AON_MVP_NOC_ARCG_OVERRIDE;
+	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+
+	iris_disable_unprepare_clock(core, IRIS_CTRL_DEBUG_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXIC_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+
+	reset_control_bulk_assert(ctrl_rst_tbl_size, core->controller_resets);
+	usleep_range(400, 500);
+	reset_control_bulk_deassert(ctrl_rst_tbl_size, core->controller_resets);
+
+	return 0;
+}
+
+const struct vpu_ops iris_vpu5x_ops = {
+	.power_off_hw		  = iris_vpu5x_power_off_hardware,
+	.power_on_hw		  = iris_vpu5x_power_on_hardware,
+	.power_off_controller	  = iris_vpu5x_power_off_controller,
+	.power_on_controller	  = iris_vpu5x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq		  = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode		  = iris_vpu5x_set_hwmode,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index cc22c7459c4b77fdcb95b546fb8a55eea522bfb8..888b4b9407d0e0c7222448fe61bf8a41b669d2d6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu5x_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 33f3d01cf79d763a62a2be9eac910a462bcd479b..3d08ea15eacb7ababaefd6e233b6232ce39f2cb5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -85,4 +85,8 @@
 #define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
 #define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
+#define VPU_IDLE_BITS				0x7103
+#define CORE_CLK_HALT				BIT(0)
+#define CORE_PWR_ON				BIT(1)
+
 #endif

-- 
2.43.0

