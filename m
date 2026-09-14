Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C94825BF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390871; cv=none; b=XKqxjX1muAFZvmeUq3eDGlNQRkHwCTZ4eQKVHr8A0ScbIyvKUPcqw/yiFbJ2hrwFwKjTRdGCu6ggx/VvEECJKBU+1SEZwJQjznuGbyZQgdDamM+jdZBLYy4OZmrswitG6UpVSayu6G/r8oIMX4ZE82Sw7p/0b9uIscijaeBAM5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390871; c=relaxed/simple;
	bh=5PFYcu25RQz4/EW1gy2Tmr4y3h00ueDIuMT6vpXdStE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2gMDBHaLlaO1ZqORqu4YY46H/jeNQ6VlwUvGqTP7EKwH/MZElBy51FsWLuq464H+ANr+ZrSkl9NUEwltqT7yVWEgry9qXkJjmUrVD/70xJWZ3KS3I+fSP+dibhSiiYmMv3KvC7qYYhMz3pXNOG1ezfnQiOWQM0c2ZgMYISa2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZJkLFea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXHjUJRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZJkLFea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXHjUJRy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0RK2510925
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=; b=oZJkLFeaglpcubVP
	l3/9m0tFWl+UyUCTraq5/amL6BMHFUfC56sbz8Jeo9HnTa4yhbhU1R9l3jHJYDk0
	k1UQB79Y6Wl4gp10Qzqu5jtqG6NDl5PhBNGWdoJq22xo1RCVZH7swJppZ04EcivT
	YJoL2O89aaB7Jsf6HKixM0laZGZg1QS0LJn04Ht5YPFHZOk45TzzAvdDF9RNlOy2
	1rdQkjfQ3bRB1NKd4L/tQGtUgXeoPmAUwMZUUnIg3Q9S6WIE3Z2v0gc9ph2sb7XL
	poevckAsZ625Nlo2h5N+duelK/h7BBLbffYm5ChdgCvH8HNtIBVIqCO/0+pb1vrC
	OvmF/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg3yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso334745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390866; x=1789995666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=;
        b=SXHjUJRy8jIZbpr2DNjQ1jn5mcSFGGKYoUMrVy8c18z4xXb4ga//IE4gi+rpyOBX0I
         16JrOqmXqUhTLcMi1f8G/w0pYUIPo+JhmsZhXmWFq+K81H6lMoElLKZktJlK9WnEQ1pS
         ADK3EcCKM7Lxi/IW4BohJLwKCFmYYtW0MwUSC8IyyumEtzxxOQ0zj/PORdoV8OvggFmY
         eRot4P7Rbm41ENCGuzCDh75QtnI1Q2H0PlfmA3kiUfNNAVVwhjdk/VCML8433bigChaU
         3yNYdawZAoj2dtJ0pU8JKAQ0KMRpzIvOrSnfFxwzJgvRpM+hhLuPXmB2ngvOHLaH8Xwf
         WTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390866; x=1789995666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipxeFN0sDzo/NEgW7Zc0uleLpPxM1YBIDfHRef2MTRk=;
        b=ZJ9x9BcEAUA36GaJVTGvUCTnaJ+AHaYxSGzOLK0ZmDdArwxGbwDlliUgdy7JI4/tlE
         7Hwe9cVRXaK9hiuMoSZJHXnZgWOmTpyCA487Tmhw6GhpaHrATfWoEdqKSh1W3fG/hbJf
         diXjSokDuACVKCynTu6IBz7YpfPhHb0RVGYWmWWyk2KmWDyD+0M20fsdZZwqEyEDyzlw
         EcjZ/+RZoZhwubGHEYxfIX6NRZXTcj+itDYolFUoFbsNdAkBS9exuZD8+JlwBFfk2cAK
         A3fZaJFUz+vh/049nugrKiTAVGudn0SiQno7rLofInZW68OpnGVvqzhyjDaL6eaAh4iI
         a7HQ==
X-Forwarded-Encrypted: i=1; AKwUvByO/JqDgfZP7jOSzuqHP8sD6ASjtV5afXsoLTC/GsuiaZ7YqYnAKN4deGlNEpOxF/e992un6/M5WNbFabo=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Dq831ui8hK0ObUnlwdfIH7dkj4nokkNxeks31GvPfpiomK8q
	SZWOfH+ND1ZTSWMGeTbPVVMG/OPc9enoMvb8wiD4SuKp6AKUVt0VpkbuUBQV/1GkEv89Td61HUo
	O/VaM4ag9eHDS9gGwryBBGBEmBwTtOW45PSFZmZbUfZQQYiWuJV++IjHzCVAVoPanB3o=
X-Gm-Gg: AYBFou0POYd4FOZekE8dW+NRRPsThFsQ94EHSG7fvpOSV1QbUwWflxe61qwPEPazGxN
	S6qfFsyO6+Us98/JANTK3pz9J5zBXr3lANdYlZucT7ecIpdECC7hj5dxYu5rdlQenLYcH/IeIMU
	exeHrmiEJqxMqfci4gw8RgKi1lgbVSF92koLfhScavfSAmFKQvs5kInqmO1HlmhC6RfcdSKJzAX
	/gNhBV7tTfrUlgv4dZ2d60L2R/jOOdqgXdNIXtw+rh2VH/SyMy1gci40yusNoCu8YPx1vdxg8dz
	zUd6phVRZO1oxhExeE4VA2dvs3GQSZ06Hi+o8eAi0J5T8DLUnOrYFr6MH/nr8Gtznenk0Av04Z7
	5nD+ZFu3V2QtX3i76VAs4SkUinufZIgGkvvJ+IEfpTVHXcxZKb6dlFsOo4gJd2BpriLxbmPZdh0
	0=
X-Received: by 2002:a17:903:8d0:b0:2d7:107c:917b with SMTP id d9443c01a7336-2dd6c46714bmr54416655ad.0.1789390865825;
        Mon, 14 Sep 2026 06:01:05 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2d7:107c:917b with SMTP id d9443c01a7336-2dd6c46714bmr54415775ad.0.1789390865394;
        Mon, 14 Sep 2026 06:01:05 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:01:04 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:28 +0800
Subject: [PATCH 5/5] media: iris: add maili platform data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-5-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=7523;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=5PFYcu25RQz4/EW1gy2Tmr4y3h00ueDIuMT6vpXdStE=;
 b=SyqP0famypWcx4AsRCYGSgdXQN3cZOXv+JJ73k8BkJfNuTddIhYCGwuCE3ORyb0NiCDAmyuZF
 sh8GKxkr7FdCaJ/SQ355xZLCYdZy+7QxYAo52tDz61GCwjueNWl7X+X
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7f013 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a5f8z1FUmG1kQWyW0AkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX/UF60X3bPQle
 7+MgZzkk35wQHvJvm71yRWmmA/w1mv5yElEWOqofJGxQMuASh+i9+zeM30yt5MzSEYC4YueryCp
 eTLkiADb02yBWGn1p7STrvklzenKvmG/IGjLg4WTEBr6E95bejh1RF+etPplEBcCvxrZRAPVMDj
 1o/qCu1rqGFhyx9fQSjd31WGqrBHcWC555DVJwAp8M6uP9R7LBdWRuVfdTRbEclRYKTGX/Wv5Vi
 M+o3S5dosu8s23WrpGc7FJPrFW8uOAthKHRJN+NscDWRpdmxAibLD6fmAyGgyduac/cdDUXKbGZ
 nSaesk2DXwZYd42/wm2aILRNjEvbaXXEX/N1igYAR4uECfnskXHnpZoXUTRqaAEB7ORsS6I/2hO
 3nUQMBHiH4wkRmUI73ogOYafauxYoDUltAeRtgogeN2Y2ChA5SRq8yBfiKhzuYkRtQZXbBNdxd3
 QvBBwcYLpdlvUJ/80Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX/rmtLw47dCcT
 ImqSUExyQJsbKulKqq7K567gN0wM7ZZL5x21nXTHod4pdSNDvR9wap+gy6WK5cOk8E4J1yJrdlw
 8W8ES/b7wGgqdsdCTmWeeJ9Lm3qKX6I=
X-Proofpoint-ORIG-GUID: 35m4SZ1bch7a6EQLv-rZNdTBAyv78Pmh
X-Proofpoint-GUID: 35m4SZ1bch7a6EQLv-rZNdTBAyv78Pmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

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

