Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A62882DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832256; cv=none; b=fxwyUsnmrvPr/9UReqmpm43PCYlxWdNP7rHCgOjmGvkqHshegtH6OQXzFnT3sMj0C3PgiFMh10U3A6Qf4vyvBknv3LhUe/6eAGYfYenDbtd0R2vQP5CcMQ2G4KfTuZazw8fsh8hnT7TEFz/TxvGq6W3pTcRUKBF+palUHWbLN1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832256; c=relaxed/simple;
	bh=Q+q5qYIGBH9LNrhxtkpmmt+fKkkvbj3C/340Im6n2Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZE6ncHdGSWyU9h0noKkiSfVQKFQo4sA2jolKoF0ZBzSpohkEIuz/pXf0ArbbXBJ/7zm8kyZNeSDED3OIGXIoBX1QUP+4i6qZGmVmiZtnN2GeJJTi+jjaEimyACUNrIHmP3SJLPi4f761GHVwyjxtYqnkcMaAz3qWMRSteFpX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNJ+Ml7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP2vCkMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNJ+Ml7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP2vCkMp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6915GM0Q1953521
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UJsoYpln4rp
	3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=; b=nNJ+Ml7CqLpej59JnzWd5Elg6eM
	gpBn8iHxVxvlG43XYjLFbkvyi6dtdiBVoNzxa/NZ7DHDysShpw9gYciCSdAY7ZPk
	oj0Ilzk/fzrDgdikD7NgUjzXprWcQs+5frB28zI79YxVPVxjN4k1lM6HpdGIbczC
	YxBo/kwsU1X8hj443uYaB4Z/Oo/td5R0GlRYH6nBfHh5bcfEaTtNn3gS2lMbBvPJ
	NL2+w3jh7keXutvJpxlBAXSKx1gZwiSO63rS7olOVSsDLqzaNv/39Me2f0oUg1bb
	pfhDCvrQJJ/GKoyNmmix+qhSS27nknrbiDSqQTr8wq6im0lLbJ060nMfi9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nr1bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:24:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2ebeaa0a4so10013915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832252; x=1791437052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJsoYpln4rp3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=;
        b=BP2vCkMp5JAkBOCQQKEqCo+cjfFhzUVXGsdDPsgI2Qupdo06/KGK722Q611ayjlowU
         OIYUgmAxSi9xpbKFWfEMM50Z47nfDICXJFEIZoZGa05NRKeF3w1+EanTKHYEP7FBrDeB
         DAcMY684XgndL/mSpHf55jO9+u1TTH09j88wtaZJxJYJJaGZ7FTAp9SuKzLk5ULXruTz
         TkxNw9Hfwulx9/kL7AAq0+/dfN9YVjFngSt7Q2QV7mMbRyscPka0SiJ188lBfBl/3You
         ihDgOcbf6etVMbdUaiQHfpzhAbeE737alGUJrbQvfQmP0Ej9HFUTxT4Tk57yKIosMADV
         2tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832252; x=1791437052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJsoYpln4rp3bxbmaJGZ/nVdjN6gyf3d7uD8cu5HYN8=;
        b=I6+4jYRGFcGFyaKbb+UGladmHWAOBfY02G1S5iN32VxwnzDVQSrO9+QwhxUsDrPLFw
         5Uqb5dq18uvH/N2S/4ETkDjWjTEInrtIE9lZMOPLhybNVn/aRg7ofXnK6546IUr2BEXP
         TB43kmdFcREbzn6JFjeERgOGJu0uMJxPhgsP7mERYgyo2twskr3Xqgl1/ciq/NUtgEnn
         D5f6gDxOvdYfAYlg5PBKxRH2uS1oiE12Q3cSGioUVi5S/xRNvp2ZK//nZsEWlU24vdsh
         hAmiUBa8Mh9+8561L37rBqhfNjtSskXp0xgPMvyB8WnRAshot8mMg0OZo/td+8mdP3e4
         YpMg==
X-Forwarded-Encrypted: i=1; AKwUvBxBg7GvcxQBitY7DgqsGtGeBb7u41Obgu9vniyD/LgxXC8+1O++l+mUcoj8ntHCWgyQ5pRVIAsMGyj6/HM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2nMoywhEDehbu++XI0hOEzh/1u+HTScZ1cdggTQE5knZW2tJB
	GMlOPqAfk2WfikasocRgXnmMzIKhEdRWUuDS7Mi76rJdTcpOtudQMNSK0Bph4z/oGB/zpNIWb93
	Kx0I+F38EWWRzzbxWRE5Voz2CwLDu2CI6+gE0I5ak7ALCF1DTWdpgAj5K2tRHs127juc=
X-Gm-Gg: AYBFou3R4BKpDPW/9vgcuwQAQnM1ej9sgDFUMA0x0jt0H9Cfp+bC3PQ8Wx8tZ3zWF7v
	Y+PgSlS++T7yoXyhnrj/I5KOMFfLUXPmvb8S7l5beUe551s3IzjSDgxwNlDCY94ax+vS479xjkx
	Fu/rlLUGlqogqB/OG9AdwmMpsMOcFoHr6uq9A9uSItgBrB3KGM7yhemNFozx8YXArIyC3VDtKaT
	jknxykbWwgasxzTPWeiiSybYq5vk+eb4dSg8w7ckitDjHyTTziAXOKNXUVyTvKCu6W1ClTMCbQ1
	CSLKJl26mDcS0ci9BJN6O6Wefl1MyqDpHwOAezWJjjl4o//DUlwc04Ru57uP7yf4tbBVCb0+JD8
	GmenkSn7UBe//vSDboX0T8P2uzuWuS/c3endZkrc/ZnlGzdTxsLcYVHGir5UhscghnB+rcebeCW
	y40Gtos0YrMj/VvPL6OuS2GylW
X-Received: by 2002:a17:903:388e:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e2e4a1cfc1mr31696865ad.26.1790832252373;
        Wed, 30 Sep 2026 22:24:12 -0700 (PDT)
X-Received: by 2002:a17:903:388e:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e2e4a1cfc1mr31696475ad.26.1790832251863;
        Wed, 30 Sep 2026 22:24:11 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:11 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Thu,  1 Oct 2026 10:52:17 +0530
Message-ID: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abdee7d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aa8L5a3Xh2TisPCN470A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX+y0VVbgtKsev
 cZBxvZN9uHXxBi4/JD8+GRlVg26OefxxVaTlY2svVdRTUkP+zfdYMzyH71bXxNSVCAJgvU+NsxG
 8qnkUrhhExwSCYqhJ4KnJpEDajTC96s=
X-Proofpoint-ORIG-GUID: yTpLdH1053lUgj5WfdUl9AG-04Dm6Hqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXykgF59yLXpSQ
 A/9pfReKMVLiVmmz0A5+UhOl4+1iyyzlXfOkLKDeFeW5oC05W1cPMglrKxtvmJPN/PGTTJhf477
 4wnrkT9K4EGgs61813c6LP8ui3IKxjc2nHl2SGiUMecU09UPngAIzBVy8fiWzd/Ay2ZNnKc8rAf
 e86VYvu1C8EpiRs0pjqfpMZknB4SLhhG8/QXT5uoyiP3DRRfE0buaUEcIkdjbiLBPSsEFknGKWj
 HMPJtdwHs3knR36P5LdPU877wQpTrVuQfedFfUSwSy/qSXFJ0rtKUHNvk1mONv2GwvhfruRgjTh
 FmvutypegO/JQ/Ujt5/jixb3cDEGkWy9QerVnghElC7Q7bq3kAmAvDWNO4TkmQJ7pBV9K7gpkJ8
 segKv6l5LalMY1QGwZEbXBugN2G9UzrSMXQrfsEwFy8+Ksj9+Nz3ui7l/7O5uQDhZfvSwX3LEGa
 hm2gzcBEuMeoOAltuPQ==
X-Proofpoint-GUID: yTpLdH1053lUgj5WfdUl9AG-04Dm6Hqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  13 ++
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 236 +++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 04986f216549..e3a621b59913 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -28,3 +28,16 @@ config RVTRACE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace.
+
+config RVTRACE_ENCODER
+	tristate "RISC-V Trace Encoder driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace encoder component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The encoder is bound to a CPU and generates the trace data for that
+	  CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-encoder.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 20f67a78b8ab..2660fcaa332b 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
new file mode 100644
index 000000000000..1f06b1a2b412
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/log2.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
+#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	0x7
+#define RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT	24
+#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
+#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
+
+#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	0xfff
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT	16
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	0xf
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT	28
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
+
+struct rvtrace_encoder_priv {
+	u32 srcbits;
+};
+
+/*
+ * Set the srcid and clear trTeInhibitSrc bit so that the emitted trace messages carry
+ * the source id
+ */
+static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 srcbits)
+{
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT);
+	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
+	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
+	val |= srcbits << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
+/* Set requested trace format and return 0 if hardware supports that format */
+static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
+{
+	u32 val, fmt;
+
+	switch (pdata->format) {
+	case GTRACE_FORMAT_ETRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
+		break;
+	case GTRACE_FORMAT_NTRACE:
+		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
+	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
+	return val == fmt ? 0 : -EOPNOTSUPP;
+}
+
+static int rvtrace_encoder_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_encoder_priv *priv;
+	u32 val, hw_srcbits, srcbits;
+	int ret;
+
+	if (pdata->bound_cpu < 0) {
+		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	/* Check if trTeInhibitSrc is hardwired to 1 */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
+		/* Probe how many bits can trTeSrcID span in the emitted Trace messages */
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		val |= (RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK <<
+			RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+		hw_srcbits = (val >> RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT) &
+			     RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+		/* Determine if there are sufficient bits to hold max cpus */
+		hw_srcbits = min_t(u32, hw_srcbits, RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX);
+		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
+		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
+			rvtrace_encoder_set_srcid(pdata, srcbits);
+			priv->srcbits = srcbits;
+		}
+	}
+	if (!priv->srcbits) {
+		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
+			 pdata->bound_cpu);
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+	dev_set_drvdata(&comp->dev, priv);
+	return 0;
+}
+
+static int rvtrace_encoder_start(struct gtrace_component *comp)
+{
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret;
+	u32 val;
+
+	if (priv->srcbits)
+		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+
+	ret = rvtrace_encoder_set_format(pdata);
+	if (ret) {
+		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+		return ret;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable encoder.\n");
+		return ret;
+	}
+
+	/* set mode */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
+			      pdata->control_poll_timeout_usecs);
+	if (ret) {
+		dev_err(&comp->dev, "failed to enable tracing.\n");
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		gtrace_disable_component(comp);
+	}
+
+	return ret;
+}
+
+static int rvtrace_encoder_stop(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int ret, err;
+	u32 val;
+
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
+			      pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop tracing.\n");
+
+	err = gtrace_disable_component(comp);
+	if (err)
+		dev_err(&comp->dev, "failed to disable encoder.\n");
+
+	return ret ?: err;
+}
+
+static const struct gtrace_component_id rvtrace_encoder_ids[] = {
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_encoder_driver = {
+	.id_table = rvtrace_encoder_ids,
+	.probe = rvtrace_encoder_probe,
+	.start = rvtrace_encoder_start,
+	.stop = rvtrace_encoder_stop,
+	.driver = {
+		.name = "rvtrace-encoder",
+	},
+};
+
+static int __init rvtrace_encoder_init(void)
+{
+	return gtrace_register_driver(&rvtrace_encoder_driver);
+}
+
+static void __exit rvtrace_encoder_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_encoder_driver);
+}
+
+module_init(rvtrace_encoder_init);
+module_exit(rvtrace_encoder_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

