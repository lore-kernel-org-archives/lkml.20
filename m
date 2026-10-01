Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0A42E3FE;
	Thu,  1 Oct 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836700; cv=none; b=HbdKNNzlX74ppg1y7lZVJwRMFFkwlM495IiU77SgaJBaNhxRS13hwNix/Gs35qR1kYLpOckxBknofS+1R+9MImGvpjXhEKTR8bD7iA9eu7tgBIuu2X6tEUlPSyC0S3uycZK7IyLsONf+CGhWpcKhFcGmq3dvW6qD7uSGajLpCc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836700; c=relaxed/simple;
	bh=WoIhPOHpC8s8yT5ohlgD0HkfxRAxCp2qHwo6DL87/G4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Icq+ui57joYJak2cqWKz3GHzOR1TMge4/1ssPqGOJfA2i5dkvPCBKV14jdHvBhxOqZrJ9FEmNk+7h8tBWPSrMYHQjpwXJF6HOvwqnB2NUWUVHmRig3+uaJjACTuBFQarcwiSjneZjeDGEeH9w2t8ELgLgQnGRpN+i0EZfHeuFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=Gz6RI0Zd; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="Gz6RI0Zd"
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913jtCu2551671;
	Wed, 30 Sep 2026 23:37:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=ePsYbUtFX
	pbuwE4etdiYgx9d7jErTUbIxX6XDvoT8w8=; b=Gz6RI0Zd2DhkxexJkrirJckQ+
	VC8M84OthKx2hQaCGzc872CGs/KWXB1oKFQuep6HdMFtR0aON+xJA3/61pbsF20k
	P1OgpHKIcm36yRev+HcOa/1nH0OjkLQY5oCdbclpDTL1ujixDku0CUOLpZ79qDlL
	hna6nr+bnZCj9KDbLEzdB3c3OrAyyjQbp9nLov0g0JGMiJrmnNFZpfgduhKKUDKU
	y5GAL0nlN+xsg8+LmBuRhh5VZjKSmRclAnt3KzWfks6PMVY9Lda1EKPvtxB0lYx6
	AMDqy15bEpsUDt2P8vlsBqGyzPWa9XMXQuFT711X5VUptaXPm+Nh8vIoYf5ow==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h1djvhtbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2026 23:37:47 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Thu, 1 Oct
 2026 06:37:45 +0000
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
Subject: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts external output 1
Date: Wed, 30 Sep 2026 23:37:43 -0700
Message-ID: <20261001063744.2143819-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfX+Fb++yfeE6ns
 AKbfrxgmj1XD3635TkQOgmGrinPzmMNmDyBuDgtiYxIr8mhmLH1MCqnhceO88DuP/Ywal3lgTf2
 shQi5poO13e5gNzE/ajlshhf49K8UP5nTXhpaqK76u9aBjldBSnUFeC+mxqUNSllS53m78HrDqB
 iDcnLObWLKa1jUc3SJwPd/+3Lpq0FFMixwOo/C/1QQmsSyBcMQkcAfceTTN0Ls7SbevCWhHMd3u
 NgnuvMxj45Vp+nFFOSkPjHXrYXlsWSb4Ws/jAL2hjoFKtIkW+NfPcW3iyvUUlspspLELcXKd6FT
 JnP8RAQnJCCZ5E5N/nA5PSQhxO+eX7hzggEQ6E6QsxzvLLMykBoMm8/a6ynMZuZ8e29HGN44iSN
 seq72J893LN6QtKaIxD2mqvqAY9SDTnxwXc1yPMPlDSwYHRQDBahvOUPJ8Ex8shrcnu6H7kwyXI
 pD+flNfkrmQ4GqE1NuQ==
X-Authority-Analysis: v=2.4 cv=L4qI0OT8 c=1 sm=1 tr=0 ts=6abdffbb cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=FOH2dFAWAAAA:8 a=XRV931vYzU7mMciAVosA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfX7mSqof4glzoN
 wKFWewORdaBlXrC+ZTy/o9DMy3QXwupJr/yGLsKzenp1N7i8/gFGNklBbuM+IIEIQq6NOqx9sUi
 Fd50Ro5YG2PP6+KYYLdauUZ3GdGP/VA=
X-Proofpoint-ORIG-GUID: QRC7aA9uAu11n69M-yMrzKDxglvwIiOT
X-Proofpoint-GUID: QRC7aA9uAu11n69M-yMrzKDxglvwIiOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01

cscfg features match on device class only, so a feature that drives ETM
external output 1 for the PMU to count as TRCEXTOUT1 (0x4011) would load
on every ETMv4 device, including CPUs whose PMU has no such event
(Neoverse N1) or whose PMU connection is undocumented. There the pulse is
never counted, and whatever depends on it silently does not happen.

Add a capability match flag, CS_CFG_MATCH_CAP_PMU_EXTOUT1, that features
can require. The ETM sets it at probe, on its own CPU, when:

- the CPU is one whose TRM documents ETE external outputs 0-3 as PMU
  events TRCEXTOUT0-3: Cortex-A520, Cortex-X925 and Neoverse N2, N3, V2
  and V3;
- PMUv3p1 or later is implemented and PMCEID0_EL0 reports TRCEXTOUT1,
  which also covers a hypervisor hiding the event;
- the trace unit has event 1, since event 0 is the trace unit trigger,
  which the TRBE driver treats as fatal.

The PMU only reports whether the event is implemented, not what drives
it, so the CPU list keeps the check conservative. Other cores can be
added once their manuals or hardware confirm the connection.

Matching on a flag skips the feature on other ETMs rather than failing
the load, which would unregister the device from cscfg and lose its
other configurations.

cscfg_csdev_enable_active_config() also returns success when the active
configuration is not loaded on the device, so a session selecting such
a configuration would run unconfigured. Return -EINVAL instead, so the
session fails to start on that CPU. This applies to all configurations.

Show the flag in the feature's configfs 'matches' attribute.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  2 +
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  7 ++-
 .../coresight/coresight-etm4x-core.c          | 44 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm4x.h |  3 ++
 .../coresight/coresight-syscfg-configfs.c     |  3 ++
 .../hwtracing/coresight/coresight-syscfg.c    |  7 +++
 6 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index 90fd937d3bd83..2efe73a0d0a0d 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -29,6 +29,8 @@
  */
 #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
 #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
+/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
+#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004
 
 /* flags defining device instance matching - used in config match desc data. */
 #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index e1a59b4345052..2847d2d7f7bed 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 
 int etm4_cscfg_register(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct cscfg_csdev_feat_ops ops;
+	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
 
 	ops.load_feat = &etm4_cfg_load_feature;
 
-	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
+	if (drvdata->pmu_extout1)
+		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
+
+	return cscfg_register_csdev(csdev, match_flags, &ops);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d4442..7dc29727f07db 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -30,6 +30,7 @@
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -1368,6 +1369,47 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
 	}
 }
 
+/*
+ * CPUs whose Technical Reference Manuals document ETE external outputs 0-3 as
+ * the PMU common events TRCEXTOUT0-3.
+ */
+static const struct midr_range etm4_pmu_extout1_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+	{},
+};
+
+/*
+ * Check whether a PMU event can count external output 1 of this trace unit,
+ * and whether the trace unit has event 1 to drive it, since event 0 is the
+ * trace unit trigger. The PMU only reports whether an event is implemented,
+ * not that the trace unit drives it, so also require a CPU whose manual
+ * documents the connection.
+ *
+ * Must run on the CPU that owns the trace unit.
+ */
+static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
+{
+	int pmuver = read_pmuver();
+
+	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
+		return false;
+
+	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
+	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
+		return false;
+	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
+				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
+		return false;
+
+	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
+	return drvdata->nr_event >= 1;
+}
+
 static void etm4_init_arch_data(void *info)
 {
 	u32 etmidr0;
@@ -1522,6 +1564,8 @@ static void etm4_init_arch_data(void *info)
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
+	drvdata->pmu_extout1 = etm4_pmu_has_extout1(drvdata);
+
 	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index df9e0748d71ec..dbdfe48e8b6c3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1024,6 +1024,8 @@ struct etmv4_save_state {
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
  * @paused:	Indicates if the trace unit is paused.
+ * @pmu_extout1: The PMU counts external output 1 of this trace unit as
+ *		TRCEXTOUT1, and the trace unit has event 1 to drive it.
  * @arch_features: Bitmap of arch features of etmv4 devices.
  */
 struct etmv4_drvdata {
@@ -1076,6 +1078,7 @@ struct etmv4_drvdata {
 	bool				lpoverride : 1;
 	bool				skip_power_up : 1;
 	bool				paused : 1;
+	bool				pmu_extout1 : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 2b40e556be872..cd446d7ca43da 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -250,6 +250,9 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
 	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
 		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
 
+	if (match_flags & CS_CFG_MATCH_CAP_PMU_EXTOUT1)
+		used += scnprintf(page + used, PAGE_SIZE - used, "PMU_EXTOUT1 ");
+
 	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
 	return used;
 }
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49c..953c060c88549 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 
 		if (err)
 			cscfg_config_desc_put(config_desc);
+	} else {
+		/*
+		 * The configuration is active but was not loaded on this
+		 * device, for example because the device lacks a capability
+		 * its features require. Fail rather than trace without it.
+		 */
+		err = -EINVAL;
 	}
 
 	return err;
-- 
2.52.0

