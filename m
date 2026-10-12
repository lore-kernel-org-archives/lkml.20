Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41AE3CB90A;
	Mon, 12 Oct 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846354; cv=none; b=knytD1l0+ibHuiQTVZXIa9zB+/JyKFmyNhBryfMoR3eiWEpvSgf3AZcS3aTylMIpnbHH1ItPtuNd0znUJdKoGyQ6g1VJev6nIaAozeBptbOCMrrWruHLoBFCnejrUTZGVcmJqyiWEXVEPk6nMxt5fGvV8WD+ECIgxNOiycTOHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846354; c=relaxed/simple;
	bh=5zVQUms56/FCGyyDEWUySBlmpL87X/vq9n8JCGaxnD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqQjQ/Mbj9EOsxzRwv1s8i1hIrWoHgxYYgyrMwxdI3Iw3Kt1x4sH4+Awx2iIH+1XgGk4wABldi3WUAPajRdMRu+PHYPfc+1XdNC4uW1+Toe2iVS8O1beQT8/XR1Iagya6u4nvwa2I+3MspkHhErlfDuIv9ri+Crexs8Yjtf3tYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=Jg0OL6Ot; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="Jg0OL6Ot"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJOIUM2753888;
	Mon, 12 Oct 2026 16:05:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=WQFGTEo8RvDMw5ZReq96dXoupfBfmY+7XJtjS
	OS4we4=; b=Jg0OL6Ot5zt5qDSxS8BjDb/rMbP5EHeQr5zSgQobyQ+qTAN7pem2E
	9vdIceaZxZ7GYS9bM7iNz44Tj2GAm9X8gZgz8o3joiqFTcwJmVLhd3phC0mAoFLM
	U+EnVnRt3fkHy0u1vuh8SSij00A8/8Z/we2T6uMgOCMYDVesyxcHDcmDYjVin4O8
	zE1zRKpQD4hrd8zohRvtTnlszJuoOB77pVrFOMHZmWwPpMx5B6mrhRgnzS8tW9Pf
	q8us2HBXyH6Nwgvsw6KT5+ZuRXl8BrMkH+v/gOMc45b8XTDHHmuRkq7Q0wcUkXLA
	Dybfwl423QsrUMbe0b9GdOgaM076ED14Q==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h7jf78jxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2026 16:05:38 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 23:05:37 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
Date: Mon, 12 Oct 2026 16:05:23 -0700
Message-ID: <20261012230527.750567-5-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012230527.750567-1-aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfXzgrJpOxb7FK6
 p3+dLBJHJaxD/yISLGLpK7anUMsgiaCSwynkn4s9HrLjqXbE1ujLgAZuLsOCWQo6ecnlFHo9xeK
 UVcb/KvlatMgPxFJYsDv4dr2LMb+yUs=
X-Proofpoint-GUID: kngZb9EkR1bzP6taD4drvuKR10GlwCJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX0UXSh7JaeH5r
 nnstRXcbRcND8GuiUqZ3YG3Noc9e3bkQN4KaN78eo20NgE8Ufjn5LTZ86Np4SG8F+/mq8/yaZdW
 kb4PowQSuVztb/4VkZcFyq/QfzD3s0FkDlejiIf0wxMUUtZYxYdCNgm077cLub+YS145QW5dOxe
 MONwoJrc3i9QpfsrVUSIYnez4J+no/YnwptEzSpSPinSOmx+NRrrgCfiq92hYiLlh+EUqqIlw4m
 Y9lL3A8aI41LPIx5UaNOODWBzmpNJZN3tNJiYGzrTLC1w1XLVxLNKoZvRgClyISiD5G4/GJFG+2
 8bE/GuPPomSBhBgzTXMG6q73d/LXH0/hJl1AgE2RZ2FHefL7ZY1Xw7PU/Ecy7Rq11OrNgIQwoAL
 8tmH9EHGBSfKz6XIKtjpt4ID4MzyJPXp13PY0ai1MQHgrt/PwMIdF38oxXVhmyPCO8/u1p7pRLb
 jSgqCyZp2tAuamekong==
X-Proofpoint-ORIG-GUID: kngZb9EkR1bzP6taD4drvuKR10GlwCJa
X-Authority-Analysis: v=2.4 cv=f7rdl+yM c=1 sm=1 tr=0 ts=6acd67c2 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=FOH2dFAWAAAA:8 a=7zQ8FAL6pVqGlCbRy-AA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01

Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
requires an ETM whose PMU counts external output 1
(CS_CFG_MATCH_CAP_PMU_EXTOUT(1)): event 1 selects the always-true
resource and drives TRCEXTOUT1 PMU event which pulses on every cycle
while the trace unit is enabled.

The intended use is for CSSPGO profiling: a fixed-length ETM strobing
window that ends at a PMU event. The window is decoded into branch
stack, PMU event is carrying callchains. pmu_pulse allows specifying the
window in ETM cycles.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 19 +++++++
 drivers/hwtracing/coresight/Makefile          |  1 +
 .../coresight/coresight-cfg-pmu-pulse.c       | 55 +++++++++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 6 files changed, 84 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
index 6d5ffa6f73471..3eed728bf0de1 100644
--- a/Documentation/trace/coresight/coresight-config.rst
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -129,6 +129,11 @@ The following steps take place in the operation of a configuration.
 
 5) At the end of the perf session, the configuration will be disabled.
 
+The built-in 'pmu_pulse' configuration pulses ETM external output 1 for a PMU
+event to count. It only pulses while the ETM is enabled, so combined with AUX
+pause and resume the PMU event can time each trace window (see
+coresight-perf.rst).
+
 
 Viewing Configurations and Features
 ===================================
diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index 0a77741a431ef..7163d206f9b36 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -109,6 +109,25 @@ Example for triggering AUX pause and resume with PMU event::
         -e cycles/aux-action=pause,period=10000000/ \
         -e cycles/aux-action=resume,period=1050000/ -- sleep 1
 
+ETM-timed pause events
+~~~~~~~~~~~~~~~~~~~~~~
+
+The built-in ``pmu_pulse`` configuration pulses ETM external output 1 on every
+cycle of allowed trace, and a PMU event counting that output pauses trace after
+``N`` pulses, here 1000 cycles::
+
+  perf record -T \
+    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
+    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
+    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
+    -- ./workload
+
+Each window is about ``N`` traced cycles plus the pause interrupt latency, so
+windows are never empty and a callchain on the pause event is taken where
+trace ends. The configuration only loads where the PMU counts ETM external
+output 1, which the feature's configfs 'matches' attribute shows as
+PMU_EXTOUT1; elsewhere a session selecting it fails to start.
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a57..568e797ac5a17 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
 		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
+		coresight-cfg-pmu-pulse.o \
 		coresight-syscfg-configfs.o coresight-trace-id.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
 coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
new file mode 100644
index 0000000000000..3772e5bd6cccf
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pulse ETM external output 1 on every traced cycle for a PMU event to count.
+ * Based on coresight-cfg-afdo.c
+ */
+
+#include "coresight-config.h"
+
+/* ETMv4 includes and features */
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include "coresight-etm4x-cfg.h"
+
+/*
+ * extout_pulse feature: event 1 selects the always-true resource, so ETM
+ * external output 1 pulses on every cycle while the trace unit is enabled. A
+ * PMU event counting that output (TRCEXTOUT1), for example with
+ * aux-action=pause, then fires after as many traced cycles as its sample
+ * period. Event 0 is avoided because it is the trace unit trigger, and the
+ * TRBE driver treats a detected trigger as fatal.
+ */
+static struct cscfg_regval_desc extout_pulse_regs[] = {
+	/* event 1: resource selector 1 (always true), drives external output 1 */
+	{
+		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
+		.offset = TRCEVENTCTL0R,
+		.val32 = 0x0100,
+		.mask32 = 0xff00,
+	},
+	/* end of regs */
+};
+
+struct cscfg_feature_desc extout_pulse_etm4x = {
+	.name = "extout_pulse",
+	.description = "Pulse external output 1 on every traced cycle.\n",
+	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4 | CS_CFG_MATCH_CAP_PMU_EXTOUT(1),
+	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
+	.regs_desc = extout_pulse_regs,
+};
+
+/* create a pmu_pulse configuration */
+
+static const char *pmu_pulse_ref_names[] = {
+	"extout_pulse",
+};
+
+struct cscfg_config_desc pmu_pulse_etm4x = {
+	.name = "pmu_pulse",
+	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
+	"to count as TRCEXTOUT1\n",
+	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
+	.feat_ref_names = pmu_pulse_ref_names,
+};
+
+/* end of ETM4x configurations */
+#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
index 4980e68483c5b..a9a60a1c40845 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
@@ -14,6 +14,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&strobe_etm4x,
 	&gen_etrig_etm4x,
+	&extout_pulse_etm4x,
 #endif
 	NULL
 };
@@ -22,6 +23,7 @@ static struct cscfg_config_desc *preload_cfgs[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&afdo_etm4x,
 	&pstop_etm4x,
+	&pmu_pulse_etm4x,
 #endif
 	NULL
 };
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
index 291ba530a6a52..0058627f65ae5 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
@@ -12,4 +12,6 @@ extern struct cscfg_feature_desc strobe_etm4x;
 extern struct cscfg_config_desc afdo_etm4x;
 extern struct cscfg_feature_desc gen_etrig_etm4x;
 extern struct cscfg_config_desc pstop_etm4x;
+extern struct cscfg_feature_desc extout_pulse_etm4x;
+extern struct cscfg_config_desc pmu_pulse_etm4x;
 #endif
-- 
2.52.0
