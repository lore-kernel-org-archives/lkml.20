Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB50434989
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832227; cv=none; b=SpzjadTVt4PBMQINsAw4OEdJjuezKQ+I+Es/KjQvlXV9m0xhdSFPJZ5eYlP+U187hekSJRLmXzy2cHaO1Q4o3hhy4j46OE4wnhy8/eN51dWdPHwh5Mgc5bEMfejf9jlgLbIA1g19jcv7A14mBHXdLdnih5Xgw5AQpisixxT1POU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832227; c=relaxed/simple;
	bh=GL2idTIghwfe8EMqHuCSfTs0xn0OpYoJD9Tkl6rqBOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9Xoxvy5UsDISfp2hznfcHcF8a5vYfuv6XbN9SurKMGESExNeLHbD55SnSvNDt96D5tanaQwYf4GYjAX5TevpekneFAbYiSwkRu+Gq7xzFK0XeUfzM2mILKjYkyBCIwOMV0y5zqiFsqBa/dpPtHtvXz6JooVuue7hjB0N+I6ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L98G2fZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQq1mlrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L98G2fZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQq1mlrK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913ghIq1915375
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bMQPI++OKfB
	3KZqp5AGOXq59IxERG8WmlvdBa4SBvzY=; b=L98G2fZEmMhUWTId2FMZqrJqjB3
	0jFOpoy/BuBTbSSI4ZTZQbOLGa0GniW9KwiVhAvJIP2mbpGGMsQAtV51Cg25uAi3
	9utNwsorqZOicJAsHJ1nIRNXWWL59mPqGLtfeWPTceXD1c58a8the6GJ3cVd7K5g
	3QX4XQ3ifwymSMYcTOnWZl5hqy8J+eOrh7+aEXve1kElhJNU24KsynH68Hf1bJso
	kIgY/r4o7MVVdw0WHXq/Sdi3uuwD+IilISG6toIjFOMRFQWdgRNEFpCAhcEOOjU5
	8AgD+UdH1oH9i+0lBh5q299794aAarPXIYRd8KllihShu2RohVwTAI1ySNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n233ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:23:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd7d0751efso4589045ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832221; x=1791437021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMQPI++OKfB3KZqp5AGOXq59IxERG8WmlvdBa4SBvzY=;
        b=BQq1mlrK+m9l5GvtVIC6+hAPdeirRMxWBH77U9alwWy5sXHGuxqHVnYiAqvN7JKa9z
         qKmCTV9YowKYpNKomXfeusDlFtjoFsFj3Caw2qls7uH8djB3x4mj440liH0s/wyYn08Q
         Bc7Ax1z+VAEYaocF619DNaTPYdz71zywESvkXAtIyivbjMvPMcqENSOXS/QKt/z3rPvi
         bJJTp4feFMA/Mpz0OoezFf27Mu+oG2UDEjc/OgkLh9WIPVXOFttJtviFcG3HdDEAeMgV
         nEvSVjmzGcf37gxJOlFX9Qc0x1zX9cWNu5axAsatPzUjM52roqnM8WFts15q9nlcCCgR
         Ru7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832221; x=1791437021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMQPI++OKfB3KZqp5AGOXq59IxERG8WmlvdBa4SBvzY=;
        b=EBBmDpJoEJupFk6G76iQUwgWuIpsLfI5l2bpyckiuP4XN/+2cUkbbaFODZKj/DNvnC
         uyusOe8YQFe01f3IKSeMIXs9O3c6IB8MPKVNzUWKx28uDlM9FWFFVJCknv3j5bw1Xj40
         MILDehRpLwSeiHQGcuSHPnV/VAPgtdDpQq6iOSQF3VEgYPmjbkSlhYf/SfPjyeDQEvC5
         2xa8xe2fEedKlpuxTNXD76LGkTt3dqtEM3DGIW+ziSf295/seQ3cdFAjxNT8yYmcpQYF
         6hCx9yU2FIBx2FJ1SWW3oQDV7J/Xjxc2SilGUyqlPek3MWewLQkiZWDkx55MF3DHPEnK
         ZGgg==
X-Forwarded-Encrypted: i=1; AKwUvBzga8a1LTz7xHyz9pCKdn3khmCqRKwu3DMsXb6Owgq5yvHdnSWp/DURUgcUWDfUjLn9VJZ3XN3E+ljI95A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdPDjdcflERAqbVGiUdlERsqqzUxmXYckFzh8vElb+37f7EaJO
	TPUzaELe7iWKYeUMmdIV6jKw9V1VlMG5qRqTKH5s6by+YcoIueF8W5KUOMj1juTi/Dv2K3pWMdJ
	K/+NxMCg7T7vUnT0mm/2sQGnFNIPbRmujls1XoWfGhxh5tls+IFkk1va8oh9J4Yi9k2A=
X-Gm-Gg: AYBFou13LivKWjal8d5GE+/JkVAzXBymB37Z9svN3VnT+m9LlEnbAB0vcEA/rWxPLUS
	xjlh6MG5llzAVjnbOtHtsMtJ0IDJEVjE2Szs3dOXfVvmGaT2hzmPvvme1b4LEBqitl3v5L1S6DP
	Cyp2sXbW2tAmuTtg7XSWERgzRd6Mclm2PH5JRFRNPuThOb6zHILAwzmsW04on5/Vzmp9Uy8ZDDl
	43jakUjNYO8C9s9DlSHKFLlrnBtEn8i6GmsRDihAK4hhMhY1eLNhZRsL0YHcsQtoRy1u9HodsxD
	IF7n+BJWATc/ePQTBZ++hd4q3ebfOcY5KL4oYTSBw3sM+Va8qtRO5/7YB/q7KoMdp5l2Ua7s/6h
	caGbeMLlkW+YLTw21d6n8ILHxkCJaMsjoWWiOnOp3CIZGY2qyejT0fpFemi2yWhbvo5jIWXJ1A1
	yFSMtQn6aJRamvQqMvdgYHThiH
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5772375ad.32.1790832220514;
        Wed, 30 Sep 2026 22:23:40 -0700 (PDT)
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5772015ad.32.1790832219831;
        Wed, 30 Sep 2026 22:23:39 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:39 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Thu,  1 Oct 2026 10:52:13 +0530
Message-ID: <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdee5d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RGLdP8Fyktiav3LA3tEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXx/ZL9lNLwNJG
 tTqNloxrlju3U3YOoyKO04FrYq4GA4vHHegZ5GQknA+pX76Ki+sb5poYmWp8SvW4K1w3zSZHZwT
 UlAcXP6Gzr8P032LTVo7kwPSsYt3WxU=
X-Proofpoint-GUID: BhOcS4_BNSi2dRWvMN2BQ7HJKIdCLGWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXyED0A0uzLu9g
 rdq88CCdHjkBweuOv6zi3IZndboPrOPRrqLBv1KkbtOqxao1cOZcHjH1ElIdVVd2rAjIEGD3Aew
 PioVMppqc3r5rbbtORXz96bD5uVjh1EptptuNxOXCKZH8K8tZQYr/jpObyUeAxL+c1Pr/JmF8m7
 IK8IlRmr7WWu5tFfpKD1w0kAUN7Mc74DKVt/JK1jhqcmRbAlHDbBFLPXjauB3FhsZMxOLdSZjhF
 mjS4zz/lgJg0Di7/ZUFjfUwngArbwaoswFN6byP/Hz60NUljkPPFxyBGh7LwgT322c7H4BmSqNb
 wMHk/2M6egvbydi2rTRHv/Ny63BV/Rk8F2z1iK2S9zWY7JS0tUDp7+UQL6jGHTxR15Cj8neFzOc
 0DzNc2J1cKQVLMJ4OMTl97MgVaPUhFf/FkozET8DACKNbvJhh2If7QXB77Li2Ikkn2+pXo8Z3KV
 dufp6S8ECI4/2xgJ0sg==
X-Proofpoint-ORIG-GUID: BhOcS4_BNSi2dRWvMN2BQ7HJKIdCLGWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

Implement a generic and architecture neutral trace framework (gtrace)
in which trace components are organized in a graph-like topology. The
framework provides a bus for the trace components along with helpers to
register components, build the topology and access the hardware registers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/Makefile                       |   1 +
 drivers/hwtracing/Kconfig              |   2 +
 drivers/hwtracing/gtrace/Kconfig       |  15 +
 drivers/hwtracing/gtrace/Makefile      |   4 +
 drivers/hwtracing/gtrace/gtrace-core.c | 459 +++++++++++++++++++++++++
 include/linux/gtrace.h                 | 271 +++++++++++++++
 6 files changed, 752 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 include/linux/gtrace.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..e018cc915f62 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
+obj-$(CONFIG_GTRACE)		+= hwtracing/gtrace/
 obj-y				+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..ef53f5c8429f 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/gtrace/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
new file mode 100644
index 000000000000..bcc3b4169a76
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig GTRACE
+	tristate "Generic Hardware Trace Support"
+	depends on OF
+	help
+	  This framework provides an architecture-neutral kernel interface
+	  for hardware trace drivers. It builds a topological view of the
+	  trace components and configures the correct series of components
+	  when trace is enabled. It is intended to be shared across RISC-V
+	  and ARM trace components so that a single trace path may span
+	  components of different architectures.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gtrace.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
new file mode 100644
index 000000000000..3f90fb99c514
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GTRACE) += gtrace.o
+gtrace-y := gtrace-core.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
new file mode 100644
index 000000000000..d374c679a649
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ */
+
+#include <linux/cpumask.h>
+#include <linux/export.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/xarray.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_POLL_TIMEOUT_US_DEFAULT	10
+
+/* Mutex to serialize component registration/unregistration */
+static DEFINE_MUTEX(gtrace_mutex);
+
+/* Per-CPU source instances */
+static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
+
+/* gtrace comp specific data, to be used by core functions only */
+struct gtrace_comp_priv {
+	struct gtrace_component comp;
+	u32 type_idx;
+	bool ready;
+};
+
+#define to_gtrace_comp_priv(__comp)	\
+	container_of_const(__comp, struct gtrace_comp_priv, comp)
+
+/* Component type based id generator */
+struct gtrace_type_idx {
+	/* Lock to protect the type ID generator */
+	struct mutex lock;
+	struct xarray xa;
+};
+
+/* Array of component type based id generator */
+static struct gtrace_type_idx gtrace_type_idx_array[GTRACE_COMPONENT_TYPE_MAX];
+
+static int gtrace_alloc_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_type_idx *gidx;
+	u32 idx;
+	int ret;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return -EINVAL;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	ret = xa_alloc(&gidx->xa, &idx, comp, xa_limit_32b, GFP_KERNEL);
+	mutex_unlock(&gidx->lock);
+	if (ret)
+		return ret;
+
+	cpriv->type_idx = idx;
+	return 0;
+}
+
+static void gtrace_free_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_type_idx *gidx;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	xa_erase(&gidx->xa, cpriv->type_idx);
+	mutex_unlock(&gidx->lock);
+}
+
+static void __init gtrace_init_type_idx(void)
+{
+	struct gtrace_type_idx *gidx;
+	int i;
+
+	for (i = 0; i < GTRACE_COMPONENT_TYPE_MAX; i++) {
+		gidx = &gtrace_type_idx_array[i];
+		mutex_init(&gidx->lock);
+		xa_init_flags(&gidx->xa, XA_FLAGS_ALLOC);
+	}
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids)
+{
+	const struct gtrace_component_id *id;
+
+	for (id = ids; id->version; id++) {
+		if (comp->id.type != id->type)
+			continue;
+
+		return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(gtrace_match_id);
+
+static int gtrace_match_device(struct device *dev, const struct device_driver *drv)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(drv);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return gtrace_match_id(comp, gtdrv->id_table) ? 1 : 0;
+}
+
+static int gtrace_probe(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	int ret = 0;
+
+	if (gtdrv->probe)
+		ret = gtdrv->probe(comp);
+
+	if (!ret)
+		cpriv->ready = true;
+
+	return ret;
+}
+
+static void gtrace_remove(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+
+	cpriv->ready = false;
+	if (gtdrv->remove)
+		gtdrv->remove(comp);
+}
+
+static const struct bus_type gtrace_bustype = {
+	.name	= "gtrace",
+	.match	= gtrace_match_device,
+	.probe	= gtrace_probe,
+	.remove	= gtrace_remove,
+};
+
+struct gtrace_fwnode_match_data {
+	struct fwnode_handle *fwnode;
+	struct gtrace_component *match;
+};
+
+static int gtrace_match_fwnode(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_fwnode_match_data *d = data;
+
+	if (device_match_fwnode(&comp->dev, d->fwnode)) {
+		d->match = comp;
+		return 1;
+	}
+
+	return 0;
+}
+
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct gtrace_fwnode_match_data d = { .fwnode = fwnode, .match = NULL };
+	int ret;
+
+	ret = bus_for_each_dev(&gtrace_bustype, NULL, &d, gtrace_match_fwnode);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return d.match;
+}
+EXPORT_SYMBOL_GPL(gtrace_find_by_fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout)
+{
+	u32 val;
+
+	if (timeout <= 0)
+		timeout = GTRACE_POLL_TIMEOUT_US_DEFAULT;
+
+	return read_poll_timeout_atomic(gtrace_read32, val,
+					((val >> bit) & 0x1) == bitval,
+					1, timeout, false, pdata, offset);
+}
+EXPORT_SYMBOL_GPL(gtrace_poll_bit);
+
+int gtrace_enable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->enable)
+		return -EOPNOTSUPP;
+
+	return ops->enable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_enable_component);
+
+int gtrace_disable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->disable)
+		return -EOPNOTSUPP;
+
+	return ops->disable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_disable_component);
+
+int gtrace_reset_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->reset)
+		return -EOPNOTSUPP;
+
+	return ops->reset(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_reset_component);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
+{
+	if (!cpu_present(cpu))
+		return NULL;
+
+	return per_cpu(gtrace_cpu_source_comp, cpu);
+}
+EXPORT_SYMBOL_GPL(gtrace_cpu_source);
+
+static int gtrace_cleanup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i] != conn)
+				continue;
+			pdata->inconns[i] = NULL;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_cleanup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_cleanup_inconn);
+	}
+}
+
+static int gtrace_setup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i])
+				continue;
+			pdata->inconns[i] = conn;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int gtrace_setup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i, ret;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_setup_inconn);
+		if (ret < 0) {
+			gtrace_cleanup_inconns_from_outconns(comp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_component_release(struct device *dev)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+
+	fwnode_handle_put(comp->dev.fwnode);
+	gtrace_free_type_idx(comp);
+	kfree(cpriv);
+}
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata)
+{
+	struct gtrace_connection *conn;
+	struct gtrace_component *comp;
+	struct gtrace_comp_priv *cpriv;
+	int i, ret = 0;
+
+	if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	if (!pdata || !pdata->dev) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	for (i = 0; i < pdata->nr_inconns; i++) {
+		if (pdata->inconns[i]) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn || conn->src_port < 0 || conn->src_comp ||
+		    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
+		    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
+	if (!cpriv) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	comp = &cpriv->comp;
+	comp->pdata = pdata;
+	comp->id = *id;
+	ret = gtrace_alloc_type_idx(comp);
+	if (ret) {
+		kfree(cpriv);
+		goto err_out;
+	}
+
+	comp->dev.parent = pdata->dev;
+	comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
+	comp->dev.release = gtrace_component_release;
+	comp->dev.bus = &gtrace_bustype;
+	comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
+	dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", cpriv->type_idx);
+
+	mutex_lock(&gtrace_mutex);
+
+	ret = device_register(&comp->dev);
+	if (ret) {
+		put_device(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		conn->src_comp = comp;
+	}
+
+	ret = gtrace_setup_inconns_from_outconns(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	if (comp->pdata->bound_cpu >= 0) {
+		gtrace_get_component(comp);
+		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
+	}
+
+	mutex_unlock(&gtrace_mutex);
+
+	return comp;
+
+err_out_unlock:
+	mutex_unlock(&gtrace_mutex);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_register_component);
+
+void gtrace_unregister_component(struct gtrace_component *comp)
+{
+	struct gtrace_component *c;
+
+	mutex_lock(&gtrace_mutex);
+
+	if (comp->pdata->bound_cpu >= 0) {
+		c = per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu);
+		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = NULL;
+		gtrace_put_component(c);
+	}
+
+	gtrace_cleanup_inconns_from_outconns(comp);
+	device_unregister(&comp->dev);
+
+	mutex_unlock(&gtrace_mutex);
+}
+EXPORT_SYMBOL_GPL(gtrace_unregister_component);
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
+{
+	gtdrv->driver.owner = owner;
+	gtdrv->driver.bus = &gtrace_bustype;
+
+	return driver_register(&gtdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__gtrace_register_driver);
+
+static int __init gtrace_init(void)
+{
+	gtrace_init_type_idx();
+
+	return bus_register(&gtrace_bustype);
+}
+
+static void __exit gtrace_exit(void)
+{
+	bus_unregister(&gtrace_bustype);
+}
+
+subsys_initcall(gtrace_init);
+module_exit(gtrace_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Generic hardware trace (gtrace) framework core");
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
new file mode 100644
index 000000000000..3ae9fcf5bcfa
--- /dev/null
+++ b/include/linux/gtrace.h
@@ -0,0 +1,271 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __LINUX_GTRACE_H__
+#define __LINUX_GTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+/*
+ * Global list of trace component types across all architectures. Each backend
+ * uses the entries relevant to it.
+ */
+enum gtrace_component_type {
+	GTRACE_RVTRACE_ENCODER,
+	GTRACE_RVTRACE_FUNNEL,
+	GTRACE_RVTRACE_RAMSINK,
+	GTRACE_RVTRACE_PIBSINK,
+	GTRACE_RVTRACE_ATBBRIDGE,
+	GTRACE_COMPONENT_TYPE_MAX
+};
+
+/* Supported usage modes for trace components */
+enum gtrace_component_mode {
+	GTRACE_COMPONENT_MODE_PERF,
+	GTRACE_COMPONENT_MODE_MAX
+};
+
+/* Supported trace protocol formats */
+enum gtrace_format {
+	GTRACE_FORMAT_ETRACE,
+	GTRACE_FORMAT_NTRACE,
+};
+
+/**
+ * struct gtrace_connection - Physical connection between two trace components.
+ * @src_port:    A connection's source port number.
+ * @src_fwnode:  Source component's fwnode handle.
+ * @src_comp:    Source component's pointer.
+ * @dest_port:   A connection's destination port number.
+ * @dest_fwnode: Destination component's fwnode handle.
+ * @dest_comp:   Destination component's pointer.
+ */
+struct gtrace_connection {
+	int src_port;
+	struct fwnode_handle *src_fwnode;
+	int dest_port;
+	struct fwnode_handle *dest_fwnode;
+	struct gtrace_component *src_comp;
+	struct gtrace_component *dest_comp;
+};
+
+struct gtrace_platform_data;
+
+/**
+ * struct gtrace_hw_ops - Architecture-specific low level control of a component.
+ * @enable:  Enable the component's hardware block.
+ * @disable: Disable the component's hardware block.
+ * @reset:   Reset the component's hardware block.
+ *
+ * These operate on the component's platform data rather than a full
+ * gtrace_component so that they can be invoked before the component is
+ * registered with the gtrace core (e.g. to reset the hardware during probe).
+ *
+ * These abstract the register-level programming that differs between
+ * architectures (RISC-V Trace Control registers vs ARM CoreSight, etc.). The
+ * core never touches component registers directly; it invokes these ops.
+ */
+struct gtrace_hw_ops {
+	int (*enable)(struct gtrace_platform_data *pdata);
+	int (*disable)(struct gtrace_platform_data *pdata);
+	int (*reset)(struct gtrace_platform_data *pdata);
+};
+
+/**
+ * struct gtrace_platform_data - Platform-level data for a trace component
+ * discovered from DT or ACPI.
+ * @dev:         Parent device.
+ * @impid:       Opaque, architecture-specific implementation ID.
+ * @hw_ops:      Architecture-specific low level control ops.
+ * @io_mem:      Flag showing whether component registers are memory mapped.
+ * @base:        If io_mem == true then base address of the mapped registers.
+ * @read:        If io_mem == false then read register from the given offset.
+ * @write:       If io_mem == false then write register to the given offset.
+ * @bound_cpu:   CPU to which the component is bound, or -1 if unbound. For a
+ *               source component bound to a CPU this must not be -1.
+ * @control_poll_timeout_usecs: Delay in usecs when polling control bits.
+ * @format:      Trace format selected by the platform driver.
+ * @nr_inconns:  Number of input connections.
+ * @inconns:     Array of pointers to input connections.
+ * @nr_outconns: Number of output connections.
+ * @outconns:    Array of pointers to output connections.
+ */
+struct gtrace_platform_data {
+	struct device *dev;
+
+	u32 impid;
+
+	const struct gtrace_hw_ops *hw_ops;
+
+	bool io_mem;
+	union {
+		void __iomem *base;
+		struct {
+			u32 (*read)(struct gtrace_platform_data *pdata,
+				    u32 offset, bool relaxed);
+			void (*write)(struct gtrace_platform_data *pdata,
+				      u32 val, u32 offset, bool relaxed);
+		};
+	};
+
+	int bound_cpu;
+
+	/* Delay in microseconds when polling control register bits */
+	int control_poll_timeout_usecs;
+
+	enum gtrace_format format;
+
+	/*
+	 * Platform driver must only populate empty pointer array without
+	 * any actual input connections.
+	 */
+	unsigned int nr_inconns;
+	struct gtrace_connection **inconns;
+
+	/*
+	 * Platform driver must fully populate pointer array with individual
+	 * array elements pointing to actual output connections. The src_comp
+	 * of each output connection is automatically updated at the time of
+	 * registering component.
+	 */
+	unsigned int nr_outconns;
+	struct gtrace_connection **outconns;
+};
+
+static inline u32 gtrace_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + offset);
+
+	return pdata->read(pdata, offset, false);
+}
+
+static inline u32 gtrace_relaxed_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + offset);
+
+	return pdata->read(pdata, offset, true);
+}
+
+static inline void gtrace_write32(struct gtrace_platform_data *pdata, u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, false);
+}
+
+static inline void gtrace_relaxed_write32(struct gtrace_platform_data *pdata,
+					  u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel_relaxed(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, true);
+}
+
+static inline bool gtrace_is_source(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_inconns ? true : false;
+}
+
+static inline bool gtrace_is_sink(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_outconns ? true : false;
+}
+
+/**
+ * struct gtrace_component_id - Details to identify or match a trace component.
+ * @type:    Component type from the global gtrace_component_type list.
+ * @version: Architecture-specific version (opaque to the core).
+ * @data:    Data pointer for driver use.
+ */
+struct gtrace_component_id {
+	enum gtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct gtrace_component - Representation of a trace component.
+ * @pdata:    Pointer to underlying platform data.
+ * @id:       Details to match the component.
+ * @dev:      Device instance.
+ */
+struct gtrace_component {
+	struct gtrace_platform_data *pdata;
+	struct gtrace_component_id id;
+	struct device dev;
+};
+
+#define to_gtrace_component(__dev)	container_of_const(__dev, struct gtrace_component, dev)
+
+static inline void gtrace_get_component(struct gtrace_component *comp)
+{
+	get_device(&comp->dev);
+}
+
+static inline void gtrace_put_component(struct gtrace_component *comp)
+{
+	put_device(&comp->dev);
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids);
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout);
+int gtrace_enable_component(struct gtrace_component *comp);
+int gtrace_disable_component(struct gtrace_component *comp);
+int gtrace_reset_component(struct gtrace_component *comp);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata);
+void gtrace_unregister_component(struct gtrace_component *comp);
+
+/**
+ * struct gtrace_driver - Representation of a trace driver.
+ * @id_table:      Table to match components handled by the driver.
+ * @probe:         Driver probe() function.
+ * @remove:        Driver remove() function.
+ * @get_trace_id:  Get/allocate a trace ID.
+ * @put_trace_id:  Put/free a trace ID.
+ * @driver:        Device driver instance.
+ */
+struct gtrace_driver {
+	const struct gtrace_component_id *id_table;
+	int			(*probe)(struct gtrace_component *comp);
+	void			(*remove)(struct gtrace_component *comp);
+	int			(*get_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode);
+	void			(*put_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode,
+						u32 trace_id);
+	struct device_driver	driver;
+};
+
+#define to_gtrace_driver(__drv)   \
+	((__drv) ? container_of_const((__drv), struct gtrace_driver, driver) : NULL)
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv);
+#define gtrace_register_driver(driver) __gtrace_register_driver(THIS_MODULE, driver)
+static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
+{
+	if (gtdrv)
+		driver_unregister(&gtdrv->driver);
+}
+
+#endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0

