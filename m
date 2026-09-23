Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886A38A728
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131321; cv=none; b=sl546n19UQontUvfgmXqthrKDJB0iYZIKLxEOJgfFolQ1H9cc6RYYJjV6G5665ttWLfBxJdTdoRYRgN0EooFClp3xhnQiHkjpAmapyCa+FNWR/17znU2FhTC7tQwIb1XaNRQkuZ9b3BkXndXHZnq327ZDVNE7Nc5WbLB9f0haEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131321; c=relaxed/simple;
	bh=5PFYcu25RQz4/EW1gy2Tmr4y3h00ueDIuMT6vpXdStE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2WowA9EDd6V3+VX9RV3BPLtEgqiEUCQjBq57c6S5zgqoT3z5ts0i/QuO2MBtrcVJZoIiuc4CfunPNztjsBMFkTIAtEJrLdu6W/Tgc+Z7ljsyIpQl0B6eGVONDQfoCrZXpNEpm5TN+1gLFweTMoqipQB5SCpRABbGh67KZA/bGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As4kOQHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPNjXA7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As4kOQHR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPNjXA7W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCxB11166713
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=; b=As4kOQHRSRAOz0/6
	9cZNd6MKtFpD0wtNaaO6Z2OKEWSrI53nSPXOK81vQ/UCH4GAa/zeZxSA68gck6zo
	NptC6UhJ+0DDFPdc01l5K/Lom5pyhfc91PJX3cUOcoYv/ijAl2jaB8whGJMTV/6L
	yY+2lNLb37JphnaVfLeGkWbUfE1e0llAaoaB4kOOuJ2Xvm5HiKcteLgyLp2hH9hS
	bjpRAuIUm82M3AtZMqRtTQREYiKHCrK9h0+WWCedsxubdq+l1s0U1nQTzLh3OpEN
	JVjbt3izmthwZUIUbYWWmyYf6aUz5ljplt627WcEFWB+QXQD6IP+fxnh2UcJ6Rlt
	M84PrQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw1n5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1147024a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131319; x=1790736119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=;
        b=HPNjXA7WR5z4itntFbGiyVlOFmj4CQOEsPbH0WJ3q3Hk3mGEkyrgVRjQkuPJgLBMZI
         goh2rj+q9FDosFB9KT0/YJpHnhfxg+2K9bfcQ2C3A6fnLC73wUCrEGg9VjLyPJ4gszq6
         a+cm6mNQW5HOfxbweXEhM3tHVVjK/RwWJxGN6BMS9vSdHMox2XWlX49z4Fr5rJL+7ZES
         +6QJKDEdIVDdasyrpARhO1XrybMAX/rsUaJmgo7hbdjkih/IJcwA8Q8IcheyamsMFUY0
         URpeMPLDhuJWivckAuGiaDSpJGwJmm+kcAi2Vct0bTk1mF0ypnwyiQEe+rCxYF2QIiPL
         1YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131319; x=1790736119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=;
        b=zr8La9VNlF6UUrae3yGCFppw8vyWDjg1uVCC98VuS7RDDgdo34l38aJWk5JG9Fvhpv
         MQ/4bpuoEWxayivv8XJb8osDCHJkiwW6VrY7A/+B29MKTDYvmiyxbZBGYNiGExCI1kxd
         fogJb7IykvsiOdUSdN7AmXf0GwJaLfwK2+S1zm6FsBd6tKQO/F2WV+uMhtj5y8YFXyMu
         cP3ph+KI9dU7qeHa3cgQBywlZjPwiZrm8+xRRqXuTsUxyYZDyul35cLq19ymy9mQEPtx
         ah0vUC79/0INjiBCZcZ2noG1jCS6G9jXOLhome9v1QzzZ9vRwTzDZvVTn4GtlM24g6eY
         Nxsw==
X-Forwarded-Encrypted: i=1; AKwUvBy4stwLoftoPJYHNiIEaIkFhNV1clAKVPwAX5qX7FMHPOEelX7YdmF31V8qqBYBI3uK42LV3rcMKW61qP4=@vger.kernel.org
X-Gm-Message-State: AFuF++nghQhur/wjiwhSQXmbv73rkEOGkc5WO/Luh/nYMXD2Wj30vgGz
	MUB5J8N/C9xP3GlR3NST0tTNTbcpLjNypi1FW3ozdPEAE8mS3I/wf2l9NWvcaNwctw1Es2usGx8
	9sKvOrZxR9FVRCttSg3pMNP7EtRUR0sBVeg28W0MWFea5u7tjeW3yJc4dkcZwPyFTW0c=
X-Gm-Gg: AYBFou0VP3Y+GSvF0VdM2zTn3PhNV4csb3vbfW2DbKwbZLbHn2HdfQVETJT/RpTBdmb
	6OH4Z+bGoPetYQKGL3lB37FE+XE75rFrdlOlR1LvFgwTaPXqkGDhgMj0H+6a3sZ1/xgJvCWNwI6
	E4AXg+jdUy7S1+hrwLHsTn0UtqFGkeKFb92ymjHDO/WjmbDcLAKZVZAplF4BdWSvuz28Fyw6n1X
	ugQbpk4n+Ar2n7+iMGZcOZLkNuzRFc34RaVeq/cbd7d68mGXyItKI4I33v8bTS+/2FQYcw1jkpP
	j6Tt9zpF0gmD6dlYbyv2uOX/UqWrZVioXi1VfwgQpoRZSe2h6x9j8QYc5bIfYjvbK669QGsprOo
	r1NApQedQhTqbO6CTWLvfcfYJD3ccbEEg8Rl1UOBYOPfdqohXw2oUxESvxJ5z27St1jv0nhU/DA
	==
X-Received: by 2002:a17:90a:d003:b0:3a0:519e:dac4 with SMTP id 98e67ed59e1d1-3a07e67cc9cmr1102867a91.45.1790131318749;
        Tue, 22 Sep 2026 19:41:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:3a0:519e:dac4 with SMTP id 98e67ed59e1d1-3a07e67cc9cmr1102857a91.45.1790131318312;
        Tue, 22 Sep 2026 19:41:58 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:57 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:14 +0800
Subject: [PATCH v2 4/6] media: iris: add maili platform data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-4-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=7523;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=5PFYcu25RQz4/EW1gy2Tmr4y3h00ueDIuMT6vpXdStE=;
 b=W1DRu4AO552gGtCSPjGIzCSGOFGSpRpikDQAul9hjfSX2KU6tE0dpYTNu827xID0kqveo6h1v
 NYXQ1U6HxQFDtEACNca2XlnM7Tx21ReBLkOkH1tMnca6qrCrOz+Wh8v
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfXzSlEknVSpTtl
 aRkdDqOLhXXa2im/D2hYLEgdkrC02bGtRbhek8hVFzZaMvBlkLawH3OBx117IHU9ljeon8CBFur
 4fGIcRbutn+IlPy/r4U0/4C/yuzW5UBADNSV87rikPn6sS/ub1z6RBljYEpae7BCw7rhfY8J6yU
 j3jSPthT7k7dAN4K1xIMIAqIa71PHaSS6xkFUn5Ap5EQWjbQgRJkWIoM+b/VBmLRbPOqQ+pSuIJ
 qtCQTgcUXo1MwqaVdJHjG26wbdChPHtDcinKGCyQvAwjJoyZgItt0yj0E/E/UyD2u87w/aSm+TR
 hmBrWxXeD802MEPGe9Q3zD4QuTQZUXZd3pZVIdYgv2FX5XZK1Zaed3pSEXhuLW6mkKIhdQ3OUV9
 XEEY8yJZcrTuGdQZDwV/VlaQNRdEodz9HpEm5fkcALWdDPdFzc8nHmPFen8STYWQQQjpop7G61l
 AeeEXz+qkETueq19tow==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab33c77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a5f8z1FUmG1kQWyW0AkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 94yAYBjHwKD-m7IWjL4toZg7Ynz5rUQP
X-Proofpoint-ORIG-GUID: 94yAYBjHwKD-m7IWjL4toZg7Ynz5rUQP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX5+onLUI6gBDz
 PSsk+3bXYFxEYiHwgdJJBMQzU8FTiY1fPFkx47DyV81XDl6qF72cRn/B1WTDvo0Uxv39xAJ3fKc
 bndZ+aJ4HUoogPSSF/ydqEwhAk8WPDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Add platform data for the Maili Iris VPU4 block so the driver can
match the qcom,maili-iris compatible and initialize the hardware.
Describe the Maili-specific clocks, power domains, firmware, resets,
bandwidth data, DMA range, secure memory configuration, and decode
capabilities.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 +
 .../media/platform/qcom/iris/iris_platform_maili.h | 40 ++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 5 files changed, 135 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..f8a017d878d620fe1d82708624595583aa2ffd99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu4x.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..61639d72bdcc9917983096e5b8f5905936784623 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,9 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -54,6 +57,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data maili_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_maili.h b/drivers/media/platform/qcom/iris/iris_platform_maili.h
new file mode 100644
index 0000000000000000000000000000000000000000..b0c48743485a176fb9855a841955413d7093c7d4
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_maili.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_MAILI_H__
+#define __IRIS_PLATFORM_MAILI_H__
+
+static const char *const maili_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+};
+
+static const struct platform_clk_data maili_clk_table[] = {
+	{ IRIS_AXI_CLK,          "iface"                },
+	{ IRIS_AXI1_CLK,         "iface1"               },
+	{ IRIS_CTRL_CLK,         "core"                 },
+	{ IRIS_CTRL_FREERUN_CLK, "core_freerun"         },
+	{ IRIS_HW_CLK,           "vcodec0_core"         },
+	{ IRIS_HW_FREERUN_CLK,   "vcodec0_core_freerun" },
+	{ IRIS_BSE_HW_CLK,       "vcodec_bse"           },
+	{ IRIS_VPP0_HW_CLK,      "vcodec_vpp0"          },
+};
+
+static const char *const maili_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static const char *const vpu4x_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..d39acb1552dca4ae61dbc7875040be25c196aba6
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_maili.h"
+
+static const struct iris_firmware_desc iris_vpu40_p1_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.fwname = "qcom/vpu/vpu40_p1_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu4x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu4x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu4x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu4x[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu4x[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+const struct iris_platform_data maili_data = {
+	.firmware_desc_gen2 = &iris_vpu40_p1_s8_gen2_desc,
+	.vpu_ops = &iris_vpu4x_ops,
+	.icc_tbl = iris_icc_info_vpu4x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu4x),
+	.clk_rst_tbl = vpu4x_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(vpu4x_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu4x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu4x),
+	.pmdomain_tbl = maili_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(maili_pmdomain_table),
+	.opp_pd_tbl = iris_opp_pd_table_vpu4x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu4x),
+	.clk_tbl = maili_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(maili_clk_table),
+	.opp_clk_tbl = maili_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu4x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu4x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu4x,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu4x),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = NUM_MBS_8K * 30,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..be8a102e239c34620d540c54f1f034a9236da7a7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,maili-iris",
+		.data = &maili_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

