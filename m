Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647E47FAFB;
	Thu,  1 Oct 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836699; cv=none; b=frU9CJvKraL503pQ6qcpLdO9ZYvHX5f0RPRV0Or8WI+mGGYC3eSD9CJeQsNVFo3wJYgW0Q47pbCzZcBoHfR6F9tqUkFqrgy1ycSUJEDyMSzL1HR6eMFx0kyuihL2sd8HG2QJZnSNMOct8P5o1si8Qt6OkmIbIyqNUvLPynXDQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836699; c=relaxed/simple;
	bh=it1Q8+wGCNISD1AYVXRYsw/ODs6wuZ6R4xTYxMCcC2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJLm9ID/34gth5Wp6gRwWzdBCyFEfogbWY2W5d4ZHoTqVJStx+NUsmwfQ0oRSGPT/aukqPtyJ6WzCDIKncwnoAKaoje8DfeA0257pexE7J76aDLT31UOTsHUCelKcN/UaVGLJj/bGQm6si/qMjnODO19LP9esEW5BhUEC+GyGt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=ptCpGcKK; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="ptCpGcKK"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913wJsv3327496;
	Wed, 30 Sep 2026 23:37:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=CdYaVkVbziQPmxeqybnZRX+/EP726hOAAuxZX
	zaJPtg=; b=ptCpGcKKPmXYvNItJ/ikCd0eLYJfmtpW5NCUk+y4yEMvY6G/E746q
	KJEhc53nqhg7myIhh4Pn2lKCsuDRMi5f+NwSiRYaYwLq3+jlfPnl5f+lzpQ7qtvr
	KkH/t+fjtl1ZkcgFpTwfC5X48ZdR2ytpgfOfZUL1tT2UvImnF1SwDvnGrCDQmJYA
	t9nm/4lVy/7/8f1whu8J9wRGDZESUdRafj2jcQVUsD1UNDruvMH8ayaUX1vwdMnY
	YXEsOVhUk0KaKVR0A5wl9fUor2H89Cnf0vlFEHgBOqlq9JejeFbwPLRGr2p+5qfq
	dP0CzVG5m5GxOtnROBrd/gBDroSWRVS5Q==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h1dpe1r7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2026 23:37:47 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Thu, 1 Oct
 2026 06:37:46 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] coresight: Add pmu_pulse/extout_pulse
Date: Wed, 30 Sep 2026 23:37:44 -0700
Message-ID: <20261001063744.2143819-2-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001063744.2143819-1-aaupov@fb.com>
References: <20261001063744.2143819-1-aaupov@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=D47SufRj c=1 sm=1 tr=0 ts=6abdffbc cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=FOH2dFAWAAAA:8 a=7zQ8FAL6pVqGlCbRy-AA:9
X-Proofpoint-ORIG-GUID: WXjDZuJqAgYmGpzdcYpF4xPUZiitT28S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfX/cPYGBgFP45z
 ryPTrSCbakrOVSZ8fGoDQgtJx1vmNPYwXpimL+a1wXH7c3J7celGYV99yqqAvmjGAg+LC+NeGEr
 afTLZdG0lGgdVfmtcpd0Fd5PW020w+WLLPSiWs9y9SfiY6OuhDdi88LBxT0BYGCGQ05ghDnTxfa
 frvRNGoM/c2oIMdJzZoq5R96xb+HXzHPSQZBv0SQNumFUQd9gWDVTm0Y+N0yRj3UTcbJR//wujO
 IhTm8L3rKVyXO3kOfpDTVfJroatc2dNAIbfwMebdX9BSiwm6r7WJgpoKjcf+0McxVJlMZzrxiQR
 tSojcm4UjnEvUAGw+oNV9cKXf+1V6udP4wILk+jR/ByVQfhzm5KU8dJB+wrmjt7HRsrjGyiRtO3
 1x4+n4nQ+l1xD8f/8Hy5KlN6yjoo4I7gFkW+TzzSyQZoSgb/t5/z1D0VZpbCKuioLMPJfSdwRwv
 6obWczRhYOsfWQF4o2A==
X-Proofpoint-GUID: WXjDZuJqAgYmGpzdcYpF4xPUZiitT28S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfX+y11nNHnt/Gx
 w3WOZt0QtGUylfgYaQyWZiuU+w2TuxwNgWTYLVNabfg00W10uQGx4zaHDXTCVijgLb1ie+PXuHb
 dbplI6fUFTba8mnfZ614ufMXrwCt0+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01

Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
requires CS_CFG_MATCH_CAP_PMU_EXTOUT1: event 1 selects the always-true
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
index 0a77741a431ef..b5c0c0acbe1de 100644
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
+output 1 (Cortex-A520, Cortex-X925, Neoverse N2, N3, V2 and V3); elsewhere a
+session selecting it fails to start.
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
index 0000000000000..643c9a12018d8
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
+	.match_flags = CS_CFG_MATCH_CAP_PMU_EXTOUT1,
+	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
+	.regs_desc = extout_pulse_regs,
+};
+
+/* create a pmu_pulse configuration */
+
+static const char * const pmu_pulse_ref_names[] = {
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

