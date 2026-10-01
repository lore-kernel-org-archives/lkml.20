Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634142DA33
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832280; cv=none; b=Mec/KU2z6jwjVMVgP6RBWAwnoe0Sog4Na46MJ59tFwmMfO+EDaLMzHKtZpZBPkZyoQpW4U86zUVBfoFDdDKCSLARyEG2jdFo2NIHYJI+pizEOS1A4I0VUkm68uS4zh4bXEx1PZc7SBSDZ04RT5VCjV/sZvUqG/Vhq+niPddVcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832280; c=relaxed/simple;
	bh=hVPKhnk9bYQUpK8IUIHIpUcRGTMxJg7jd8f4Z8smiPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lvp1wcEp6ouCfRBOXBw67yTFmJfEsQuSj5ZBwaZtDXcr32MeLIcdHDZNKELhuBADaywe0S5FCxkwK7vZFQVJI2VoFAKj6W8mAVkzY7Wbd7d31Or28b0QyUYDxwhfZ6LyfUB3pknRgXxalnSGq9noc+zwhGfNz/DbsFofd3O8Onk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwgAQ9/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzaYtrkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwgAQ9/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzaYtrkP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913g2Wk1509997
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6/r2QKyxxEp
	qb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=; b=EwgAQ9/IfL+zbptFqk9pwGHeNhK
	9gihOYYSb6BJ5A+9H3VmipkDdG+XD0WrRyucffntX4APmwXd+Ywnp7VxrBOvb0nz
	5WdrfWEQjUzyA67y1K+OcS+0B8axPavwzG8Es6QZY9vsTiE71N31JOiVIKucnTlU
	x3s0dOyAGPa8GNdxCaFpGDmaNN/Rpms/IcCPYFQts46EsQkZL9lguCazk9GJpQUy
	cN2PkG4+veI/un8JkgYoG2Vwwdbvm6Wrhm/IObqRjIwzLB7shgORqO4rrGrrcYRg
	TsmwgM4t2SvRyiWdPOv9V0B9hjmm4x7DLhLGcqlNk0DIFoKhaP7bi1QdwPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkca4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:24:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso102875585ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832276; x=1791437076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/r2QKyxxEpqb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=;
        b=AzaYtrkP2Y8M8SfEuV4fLNIEhYtwni0Ewj5qcVqqgbf7QwHPU68JpTzaH7sVhIFlVo
         Pjf2UnUbCRtVndZKjf923vIoaLBww2gJyv6ua9XbeB+KPrk/LyXI/oGyi2mqdaDkDaAF
         rVZwZpjvuWpdltyKeqYi1hRvvExm7z8v/5hAE5mEDw3Pbh0y5+y2iO9e4upYyB8VDwaq
         wDAMBmR2PgLuAaOsGAlNDSVEqQeDkz42u3xlxRDtufyms97wIbUCp9bCJCS7RMEo+M/f
         ES+Eb/kIJ0IEuj5KWaOCPZgBQSTDGaynbxI4niVhkU9RvYnDsg1cyuPsHheETOCTQnCw
         r17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832276; x=1791437076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/r2QKyxxEpqb6dbsqqKh+TPY0S+dQ+HfQ9Tt/z9oww=;
        b=I1XcBZD1ni/rc2ei+9jM3JXPGVYo3O93LkPfUcJAo56rQ/s5df8t3wP7TiHk65nPaW
         +kjDnhwPsPOy/RjljVyFEcISu1fbY9/f9c+TqgxgxDLfkn7TsIMupfSJOzbMrFmJ9VDb
         KIICmbphX0xGhEmvbAgdmZ80qgSZERrN/rUNrTttvt0u8ZSC6TIZQjU4SUMnKTetwFhj
         OzMRzl7iWhZHOttiu4IM10VWVvKUTzNd9O8JLr2Wzg2zWrDF7H3QrAIldKmHNSc+Kzjs
         EQhTKDLcnxbkf0OOzNowxm4Nq4RyIrpKL1xujjMMEja3R07AVPyNm6d8RkoynwNlvk0k
         Mszg==
X-Forwarded-Encrypted: i=1; AKwUvByHE62sc6w3okd/znBmKHbk0lGvkPc08xZGedTS7Pm5T06ERuqiYct5NIj8y+RrD17s7d2HBebV/z7mir0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdTuWchEKqPyyvrkEw5KnfoVJs06T0VXgCr906ccyadHM8pH56
	j2ASFSAfpqAJTO0RMqgLCWXE3HqdHoAOD+FcP7vYWl5lmU4Fvrs+krE/IuWo5WtQKPGnDYmWNv2
	AVaX2Igx05oS50QMcpHK53T+ZOVcn0HDrHsNhpU/ibF65Q2ubZ6W3vHOverTeC7XUxy4=
X-Gm-Gg: AYBFou3GZkLra2bm/A2LPC/yvyQrnLV3Tnu1lcRaDflUl7M4/B+CTvAafcd7D+qtw0e
	4/Hrleh7XzBg6hH6/4h4j83uGY1CmhwTjWSuZhnfrJWBdLmoIf+PRbFBFmLriDDyQVpAk96CQ56
	PgSjLsL57VQwuzBIdGI0Vw1L2PVe+bpu+FekVXCyXLYRdRmDESA9fnB113YvzJh5rnmkSEHKP2X
	rJUGJTsH/RhKB036pfKKgWe92i4Cp5xix/YxhMv9CX7wnJu4TmcHQ/KTzZinMEo7VrvG5Z/D3K1
	7SplFhZEPCD+43YHT2m3jJen03vA9r1x9mXlwgYInY2h8Fw84gtSkndM/y8gUb3c6gTufZ/x9+O
	lRaInQREX0D2t/d2edV5womTyxI/6wkF1eIfCuasWoV7OadgYtZBikIhBaNOSf3Oxk0ZMksoTm7
	oV+Y0kvATpYTnTaisLbb+KaftQ
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr27798115ad.35.1790832276122;
        Wed, 30 Sep 2026 22:24:36 -0700 (PDT)
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr27797955ad.35.1790832275632;
        Wed, 30 Sep 2026 22:24:35 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:35 -0700 (PDT)
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
Subject: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Thu,  1 Oct 2026 10:52:20 +0530
Message-ID: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-GUID: lK4QIg0NrIC3ODTQK-BlSUExo3fmplXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX12lDc4WYMOU7
 cKm7A6ZOvMO9ddUl5713HiI2wrDoIVZk7X/ntWF2HcnzU5cqtZe/V+dzVWoEztYCkpciRPIFJT+
 zZrwqhU7VL2ar1dvXH9vU1WLUsa2auPwhqQKl1TeRXiGyoWfeQR8ZQZfJQTQA/u0OJla7EdcrQ8
 zu+ne6pdvc03A6vrHLoJHp5fl5jsIJzSDJSiEhDoY500Fbvhwgaxas0pDjEJsguW7J0EvgXtHeI
 nBH3nDSEZdOWYAos5kSHMmwYs+xH/zpRmLF+h+0P9G5mvJ/X3qQ/5rXEQS24d6UvHH4Pwot0cgG
 Rnc6ZWXQuZxj1IN4hpzL4eEQgvex/MxE/2FD1P0ZANlCK9tIY/7OALfb8vDawrWX5ZPe66hzfGl
 073kLE1UsPH29XJaNs5uPaDKymn2KLZ2NPmEvkud9oEX1lyzXrIg2H2XeINRu4rJg4zwD8coiJ8
 KsAOWphfIV3TanjZ0dg==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdee95 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XnCO0IvpVGiLHJXh1eIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX03x2xzkpohni
 ew5c305d3Qxj0t4mRvwhiTuKRnpH00Ko7bKugIf8d1+T2WYj5d58EJEm6sQO/0gcYZssY0b67nh
 6J6k7klF6zh0WymCEPbJzpZKTw7oCjI=
X-Proofpoint-ORIG-GUID: lK4QIg0NrIC3ODTQK-BlSUExo3fmplXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
is defined in the RISC-V Trace Control Interface specification.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig           |  15 +
 drivers/hwtracing/gtrace/Makefile          |   1 +
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 357 +++++++++++++++++++++
 3 files changed, 373 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e3a621b59913..de4a3b533591 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -41,3 +41,18 @@ config RVTRACE_ENCODER
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-encoder.
+
+config RVTRACE_RAMSINK
+	tristate "RISC-V Trace Ramsink driver"
+	depends on RVTRACE
+	select DMA_SHARED_BUFFER
+	default y
+	help
+	  This driver provides support for the RISC-V trace ramsink component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The ramsink is a trace sink which stores the trace data generated by
+	  the upstream components into a system memory buffer. The buffer is
+	  then copied to the perf AUX buffer when tracing using the perf tool.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-ramsink.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 2660fcaa332b..31262cf5993d 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -6,3 +6,4 @@ gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
new file mode 100644
index 000000000000..67b6779aacee
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/dma-mapping.h>
+#include <linux/gtrace.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+#include <linux/sizes.h>
+#include <uapi/linux/perf_event.h>
+#include "rvtrace.h"
+
+#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
+#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
+#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
+#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_MASK		0x1
+#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
+#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_MASK	0x3
+#define RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT	0x9
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK	0x7
+#define RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT	0xc
+#define RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN	4
+#define RVTRACE_RAMSINK_SIZE_MIN		PAGE_SIZE
+
+enum rvtrace_ramsink_mode {
+	MODE_SRAM,
+	MODE_SMEM
+};
+
+struct rvtrace_ramsink_priv {
+	size_t size;
+	void *va;
+	dma_addr_t start;
+	dma_addr_t end;
+	/* alloc_* store the DMA allocation returned by the kernel and are used later for free */
+	size_t alloc_size;
+	void *alloc_va;
+	dma_addr_t alloc_start;
+	enum rvtrace_ramsink_mode mode;
+	bool stop_on_wrap;
+	u32 async_freq;
+	int mem_acc_width;
+	u64 prev_wp;
+};
+
+struct trace_buf {
+	void *base;
+	size_t cur;
+	size_t len;
+};
+
+/* Helper to access start, limit, wp pair registers */
+static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
+{
+	u32 low, high;
+
+	low = gtrace_read32(pdata, low_off);
+	high = gtrace_read32(pdata, low_off + 4);
+
+	return (u64)high << 32 | low;
+}
+
+static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
+{
+	gtrace_write32(pdata, lower_32_bits(val), low_off);
+	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
+}
+
+static int rvtrace_ramsink_start(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 trram_ctrl;
+	int ret;
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT);
+	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_MEMFMT_MASK << RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT);
+	trram_ctrl &= ~(RVTRACE_RAMSINK_CTRL_ASYNCFREQ_MASK <<
+			RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT);
+	trram_ctrl |= priv->async_freq << RVTRACE_RAMSINK_CTRL_ASYNCFREQ_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if ((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MEMFMT_SHIFT) & RVTRACE_RAMSINK_CTRL_MEMFMT_MASK) {
+		dev_err(&comp->dev, "only plain memory format is supported\n");
+		return -EINVAL;
+	}
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start ramsink.\n");
+
+	return ret;
+}
+
+static int rvtrace_ramsink_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop ramsink.\n");
+		return ret;
+	}
+
+	return rvtrace_comp_poll_empty(comp);
+}
+
+static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
+{
+	size_t bytes_dst, bytes_src, bytes;
+	void *dst_addr, *src_addr;
+
+	/* If destination cannot hold entire source buffer then write only the latest data. */
+	if (dst->len < size) {
+		src->cur = (src->cur + size - dst->len) % src->len;
+		size = dst->len;
+	}
+
+	while (size) {
+		src_addr = src->base + src->cur;
+		dst_addr = dst->base + dst->cur;
+
+		/* Ensure that there are no OOB memory accesses */
+		if (dst->len - dst->cur < size)
+			bytes_dst = dst->len - dst->cur;
+		else
+			bytes_dst = size;
+
+		if (src->len - src->cur < size)
+			bytes_src = src->len - src->cur;
+		else
+			bytes_src = size;
+		bytes = min(bytes_dst, bytes_src);
+		memcpy(dst_addr, src_addr, bytes);
+		dst->cur = (dst->cur + bytes) % dst->len;
+		src->cur = (src->cur + bytes) % src->len;
+		size -= bytes;
+	}
+}
+
+static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
+					    struct gtrace_perf_auxbuf *buf,
+					    u64 *format)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+	struct trace_buf src, dst;
+	size_t bytes = 0;
+	bool wrap;
+	u64 wp;
+
+	dst.base = buf->base;
+	dst.len = buf->length;
+	dst.cur = buf->pos;
+	src.base = priv->va;
+	src.len = priv->size;
+	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
+	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
+	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
+	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
+
+	if (wrap) {
+		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+		src.cur = wp - priv->start;
+		priv->prev_wp = priv->start;
+		/*
+		 * There is no way to tell if trRamWp wrapped around more than once. As a
+		 * result priv->prev_wp can't be used and the entire buffer must be copied
+		 * even though some data might be duplicated.
+		 */
+		bytes = priv->size;
+	} else {
+		src.cur =  priv->prev_wp - priv->start;
+		bytes = wp - priv->prev_wp;
+		priv->prev_wp = wp;
+	}
+
+	tbuf_to_pbuf_copy(&src, &dst, bytes);
+	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
+	return bytes;
+}
+
+static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
+				     struct rvtrace_ramsink_priv *priv)
+{
+	struct device *pdev = comp->pdata->dev;
+	u64 limit_max, end;
+	int ret;
+
+	/* Probe max value for limit register */
+	rvtrace_ramsink_write_pair(comp->pdata, U64_MAX, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	limit_max = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
+	if (!limit_max) {
+		dev_err(&comp->dev, "trRamLimit register not implemented\n");
+		return -EINVAL;
+	}
+
+	/* Set DMA mask based on the maximum allowed limit address */
+	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
+	if (ret)
+		return ret;
+
+	priv->alloc_size = priv->size;
+	priv->alloc_va = dma_alloc_coherent(pdev, priv->alloc_size, &priv->alloc_start,
+					    GFP_KERNEL);
+	if (!priv->alloc_va)
+		return -ENOMEM;
+
+	/*
+	 * Check if DMA start and end addresses allocated by the kernel can be set in the ramsink
+	 * start, limit registers respectively.
+	 */
+	rvtrace_ramsink_write_pair(comp->pdata, priv->alloc_start, RVTRACE_RAMSINK_STARTLOW_OFF);
+	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
+	end = priv->alloc_start + priv->alloc_size - priv->mem_acc_width;
+	rvtrace_ramsink_write_pair(comp->pdata, end, RVTRACE_RAMSINK_LIMITLOW_OFF);
+
+	priv->start = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
+	priv->end = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF) +
+		    priv->mem_acc_width;
+
+	/* Sanity check start, end addresses */
+	if (priv->start < priv->alloc_start ||
+	    priv->end > priv->alloc_start + priv->alloc_size ||
+	    priv->end <= priv->start ||
+	    priv->end - priv->start < RVTRACE_RAMSINK_SIZE_MIN) {
+		dev_err(&comp->dev, "invalid ramsink configuration detected.\n");
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	if (priv->start != priv->alloc_start ||
+	    priv->end != priv->alloc_start + priv->alloc_size)
+		dev_warn(&comp->dev, "ramsink start, end updated to %pad and %pad\n",
+			 &priv->start, &priv->end);
+
+	priv->va = priv->alloc_va + (priv->start - priv->alloc_start);
+	priv->size = priv->end - priv->start;
+	priv->prev_wp = priv->start;
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+
+	return 0;
+
+err_free:
+	dma_free_coherent(pdev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+	return ret;
+}
+
+static int rvtrace_ramsink_setup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv;
+	u32 trram_ctrl;
+	int ret;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Derive RAM sink memory size based on component implementation ID */
+	switch (comp->pdata->impid) {
+	default:
+		priv->size = SZ_1M;
+		priv->mode = MODE_SMEM;
+		priv->stop_on_wrap = false;
+		priv->async_freq = 2;
+		priv->mem_acc_width = RVTRACE_RAMSINK_MEM_ACC_WIDTH_MIN;
+		break;
+	}
+
+	if (priv->mode != MODE_SMEM) {
+		dev_err(&comp->dev, "only smem mode is supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl &= ~BIT(RVTRACE_RAMSINK_CTRL_MODE_SHIFT);
+	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
+	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (((trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) &
+	     RVTRACE_RAMSINK_CTRL_MODE_MASK) != priv->mode) {
+		dev_err(&comp->dev, "smem mode is not supported\n");
+		return -EINVAL;
+	}
+
+	ret = rvtrace_ramsink_setup_buf(comp, priv);
+	if (!ret)
+		dev_set_drvdata(&comp->dev, priv);
+
+	return ret;
+}
+
+static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
+
+	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, priv->alloc_start);
+}
+
+static int rvtrace_ramsink_probe(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = rvtrace_ramsink_setup(comp);
+	if (ret)
+		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
+
+	return ret;
+}
+
+static void rvtrace_ramsink_remove(struct gtrace_component *comp)
+{
+	rvtrace_ramsink_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
+	{ .type = GTRACE_RVTRACE_RAMSINK,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_ramsink_driver = {
+	.id_table = rvtrace_ramsink_ids,
+	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
+	.stop = rvtrace_ramsink_stop,
+	.start = rvtrace_ramsink_start,
+	.probe = rvtrace_ramsink_probe,
+	.remove = rvtrace_ramsink_remove,
+	.driver = {
+		.name = "rvtrace-ramsink",
+	},
+};
+
+static int __init rvtrace_ramsink_init(void)
+{
+	return gtrace_register_driver(&rvtrace_ramsink_driver);
+}
+
+static void __exit rvtrace_ramsink_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_ramsink_driver);
+}
+
+module_init(rvtrace_ramsink_init);
+module_exit(rvtrace_ramsink_exit);
+
+/* Module information */
+MODULE_AUTHOR("Mayuresh Chitale");
+MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

