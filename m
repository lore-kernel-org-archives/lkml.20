Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998B396D09
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134118; cv=none; b=MRFx51tgL2QJ9hj2rNNAlkr2PDe/oVjkzGPtuSKu0Pt1/gYAEJ7+BTy6DxNHXD5CPujRQFwDoPLIROrQFPrar74SgC3ahjZrRphv3mseUsqwEHUXRUvPM03ydTkf/tooz2tLoCZllkV6xXszm8t5wLD6o0nnSqZNx61F+pQFM70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134118; c=relaxed/simple;
	bh=Ptc3EuPrDTASPXr8oNRgvpAkz6mIXFcuDPjCgIfXwsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlLR/znm8F2+cAw2mEMR/k5qYCBcqk0ngdoa3UtMnzww2do4CCnpjVkDuzuQq4N1+vGGecOh5twPshWTbcw5oslJHwE1ErdUL8nvRFtb5/ha559BcOLWRvgl5xmnPh0akaId2wWjWzRIzJxm7xYqutAQeOUC1HAqUdrMdpjUPhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7F2Hv2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3d6Sne3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7F2Hv2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3d6Sne3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N170OU1649095
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=; b=D7F2Hv2WnFfO7IyZ
	NiwAZ8AeGMdVDjH4/3+o/91yS/+HALTrBCUpZoLC0Uk8Kj+pAIagy0ZKlkkMHOXV
	ne1UCCOcm6UMudEZEWDENLaSYQ7JRrbC+9FFkaxrlSQOQ1EnO+3uYxqc9WQqqsR6
	GvEgiC0zGphnrMIvmpHP/maUNIAZat3wZ+ACBY18h+Armw80V2hjq0UVnstKRM05
	erjjrgxmHzB07IFUI+jatEBwBgtkAqV2C4f9Ie245ltGWHaJAMKo0L+rblSQJpd5
	Pn7O/8WGNx2P+UoKlhnmbjs/lhAnnl9gT2ZPFAqqDI2ePr6u22Yr2R1cfoxIQ2nZ
	Qz0GXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318rvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so5232025ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134114; x=1790738914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=;
        b=P3d6Sne3UdyH/apDAkbvIhFlVjQfRVfSexGgX3vN21QHvUYTRwq5NXfzvUKjgkH5Ih
         NoQd3yZ4j+zI1dAJOVnCSNm21yiUEaIUaglj6fPndQKTFiEhPDyKIJuxj3fz46JLZ/CX
         ARKMd0PmfKSN5WCVT7EJbYAXHUiefuGYmZrMArM4YB8NTg2X60UAMRH5OHUgXwmgzVPu
         aIgjorEW9ccwpwOXiOPGKTnJUOp5i3qcToDt032lEENlCOJHKisfsmg2ln/FS8pCWegS
         tqwisLvhoY3phMsniAX5tsvQcHam4MZADntbVensnZTJTYmQ/7J/ANgZtvOKVzLvjRXl
         6plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134114; x=1790738914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozeTsszPxdoMfL7hIKed899S49zq7nlTcGptv2hcNGc=;
        b=JqkVVllLx/HdrL64/atmvmdtW16j4ArQTMBrRcSQ0YLO1W77XZA+R/b2LXQJFVSZmH
         Pn6eQiOf4O26y30QvuFbj44zgeE+h9FfjDDoijCp2p08RtWp9P7qY1WXb/xPWMW+vUM8
         n6WK5gakC0BGXGrU9cCBE8lBE/3teMA5hSiauwPx01tcp1Qhad7G3kY896eVevLdVDl0
         VqsckL98D71I2TGxymmWdoFuRSe7tU1lWIbCi/iVTe9CFrfZWHO9a7PNLHaEojMLEPT8
         5BGCCZJrfn6RIRPXL8AfAJcMO4OL/guhDu6oAsszyEEuUkSrWs1rzUCVyUOHNKDqeIwf
         09DA==
X-Forwarded-Encrypted: i=1; AKwUvBwCGnfCyUr3tYmZHn9nDa6LniuQXQgpKqVzfCoF2sYUt2AHDOW6ngKX7DxPKu7GFxEfuQXykwYJRbS5Q2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++liL3KXOyCcTRm+PKeRsYi1/gsDbO8WaU9LtD7GJ3u0OQb6S9eJ
	V5C3VxISUUb/LA0H2HnhwThJ4GsYJJMDRM8YBDnveN8S5q+tXJL4ei1IJEy4f/iUEaafANDVoha
	bEM1VUvs8MqcdyTlOW6CT0+ti+BHZsNrPH9NmYedPbU7ItZSAfuBArrjET9pPtFc8D40=
X-Gm-Gg: AYBFou0SHWOPNVSEh+g14wEGuCWSMOEDyQd5bOYGa7dOGbElsPqtWFnpH8/mDbPwYsu
	vrBCp5gHHATHf5iWhPQgLxF9b/txRGwiHZ+kZrZ8FSTmo6txxmbI0CCAUo9f8TiUwnvgdvJOBX/
	59cqUHq4/NJKhbB/S4vCk50uwpyFAfdruGkVulRthscUXFMQVBFz1ooDgGHlOUL43qEKLmVFuBK
	XofQ6Z/OlPWuCEYMGtcvSmVtwQDV2OOBNjXJG7ojeKpz5K3UmJFG61fHQbkmkIFfp+C2Or63y8+
	2Rl6tN+fEnf8wiXtePCIdn3eMTJzhw79q/kORnmyomSq+xIYqOgVFsH0vjJm8oZcyNeo80UACsY
	dIqkNRu3/VG63kQEaaFeduD7b+A+SEsIGc8WV4ndeS7olW9hBvm6uM12xm++JZFDzcklLH0s8JT
	qvlfqhl3mO
X-Received: by 2002:a17:903:3c43:b0:2dd:c100:b2c1 with SMTP id d9443c01a7336-2df69e01671mr12352445ad.44.1790134113602;
        Tue, 22 Sep 2026 20:28:33 -0700 (PDT)
X-Received: by 2002:a17:903:3c43:b0:2dd:c100:b2c1 with SMTP id d9443c01a7336-2df69e01671mr12352055ad.44.1790134112922;
        Tue, 22 Sep 2026 20:28:32 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:32 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:53 +0800
Subject: [PATCH v2 3/7] media: iris: add VPU5x hardware ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-add_iris_for_hawi-v2-3-016ec3d24b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=24148;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Ptc3EuPrDTASPXr8oNRgvpAkz6mIXFcuDPjCgIfXwsY=;
 b=tGaI2PnQ6ZSy4pGVgp+KuU4jroqpUacoabb7pv3wPfKSK33W6aZZzpJbE7BdiKsM29U+6GoPe
 MAP/a+8TUr9DU9vNFG2ZCokJxGrPxWsX2CHMBSO2LsW7wbW4Ola3uhI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: s7PfIBgq1A878rV0Z0mmyWKM4Sq-NSIz
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab34762 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4L-smajPeleGBe0zsKoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s7PfIBgq1A878rV0Z0mmyWKM4Sq-NSIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX+Lc85Yla+cQU
 Jt07rFcf3Gu9JONKec+bRlhoytox+2Qw7A6Uxl8Nb+8x/AE6Q8CI7e/TkCVS9pk3Q0Ewssd7vbf
 ZGHKjpKKlcvEQuF0KA6DGvX1n43PytxrLVfU/OpeJGySZ+/ta8j481dYw2I6kTva9v35mMsWu/A
 chZlU3hACZegvRhxMPGInMNs0T5eNC8qPo3RXAX7DErDlzpzdt2Qaj1VFxvXRsq92I2HMvHIEiJ
 c/VBgDgAeCzuE/E27VBBwoaD7OafX2gVgTm7XHRDW5ehDtMWzl8G7TbzbLSTG2OZf37HX7iLYrU
 Rq8ASu0gmp/CIbG9tS82bX2VxVRtLRat6cK4kFgNRzre+nXHMo4AJPdaZznFo3bk6NiugIhBvFE
 3XJsJOocU2+8w+8HW0JVzBsbAgdBxhvyNo+IJFY8ZhwX8CK0u1hytMVI3163qtvtkdE9Ti5ydHq
 F4KbNflLQM2dosIaruA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX88dvHA6IW40K
 3wcKmXx0RNCzXOd4K9gIDnlKgTeSEmGzlr4U0Xo6udZg53QETu/jzNOh0jgHvrZG6MVlizfqmQm
 3Oj/swD5OcGerU9keOhidX7k+6xo3Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

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
index f8a017d878d620fe1d82708624595583aa2ffd99..adaf2f4ab08984bcf10b8ca7ed424a21635eafbe 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -27,6 +27,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu5x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 61639d72bdcc9917983096e5b8f5905936784623..4529f52a30d7f2ef82ec846bced6f9b5aef16558 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -80,6 +80,10 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXIC_CLK,
+	IRIS_CTRL_DEBUG_CLK,
+	IRIS_VPP_GATING_CLK,
+	IRIS_CX_AXI_CLK,
 };
 
 struct platform_clk_data {
@@ -241,6 +245,8 @@ enum platform_pm_domain_type {
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

