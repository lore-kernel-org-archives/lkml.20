Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1954F3C8C46;
	Mon, 12 Oct 2026 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846360; cv=none; b=byE1dvne3j4PswhWN2Khdkhr+sCyWsNPYhkLTW1lcpSniC7NR1XhvwlfamMx0FnqZSUqpRL2oqelhcXukJ8x7JMnvA6pJ8gJ3O7dy91ZXU+wFUTL46SFROcoz/Q76VbqdQJ3SHJDxZEjqvQn5VGMzKB7vrdW1/n7kUy5elzeGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846360; c=relaxed/simple;
	bh=nKQruO+4DL/IKT3AsAa0ldq83s/8wax02CbWtciTMUY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVfhC4CMulflvSHDAEAwsaoZFrGbbqugweodo2Cmx3k75xMBeD4W7vn9zEURDAwq6QJGpiqVdDOVBCXqgIlClus1ssf+oDPEpcBREjUtrLHGyfnACMVQFj056rHH1md+HXowZNz5fpydpwZCnJna5/sjTnP/6lLRCwy8jus+w0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=mJM3Jqav; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="mJM3Jqav"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69CJOMlj1056575;
	Mon, 12 Oct 2026 16:05:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=4OU3NWkW+84BPgsE8t2EbFL2Z0ECcz2fQcpFx
	ML1nAw=; b=mJM3Jqav+MtkdXpM9T3ZajQbkpW8xm4xY5qvkQeJuZF803aXixxQP
	Fe62aTYV1eaHV+YmNXjfsahxpXEZy2QeVfJQZV3eF63OYi0fKfK4yp7CcnYhqED1
	cFzxxsJqyigJ6i5OgGYgHBbAlURtHiNPHm7utqryMuYWmWt0EmEYvlIePkJJ+MGv
	BryJiCVcwNVvuiurwICEYCrqOPQDbPLyD6MgI3kyrPvVM2HDvesgaqw+MtCRrPRN
	i6Qt41VmdUO8RV2DVPSSC6d4ocB7SllXnNtBJomEA02wC9nGi3o9XXlOOEtso9JC
	t8F+bEAmQrL3avztRkmVpGVzgI7J8rr2g==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4h7gunjt67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2026 16:05:37 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 23:05:36 +0000
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
Subject: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the PMU counts
Date: Mon, 12 Oct 2026 16:05:22 -0700
Message-ID: <20261012230527.750567-4-aaupov@fb.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX6s61NtXbmxtK
 Zsayfw7mw8zXs4s8L8/igtQesYHiYgoaTohlw3LRR5C1UtPBHcrwEP90KPxwPGOSYrRAzeozH+V
 Q6Y0+ac4sB7b0OGjUZJI9keApWep5bg=
X-Authority-Analysis: v=2.4 cv=AOHP7KQI c=1 sm=1 tr=0 ts=6acd67c1 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=FOH2dFAWAAAA:8 a=onDW9bKpY48stKtY25UA:9
X-Proofpoint-GUID: _ibFwHCK79lF7Uo489zN4gieme23kMQa
X-Proofpoint-ORIG-GUID: _ibFwHCK79lF7Uo489zN4gieme23kMQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfXzHUtn3t7w/XH
 NfCW28HVLO5xk0JFXDB3qR6skEH1jSX3gv7SgviU6P1iwgvmVUC8kSlYl93arxd4SI1TLUnHcbQ
 XdOW4wVCk6K14DR2JINd8kZUt6mcy9QFPQB5KlmLmLxCa78ZrnUZIbvjRCaJwz73VDm3RaRBQK+
 iRbxgAM1sIOoufq4i9f8I7Gy3qW/PbRUGpCDv/rWY+i+lJOKCrsZlHKsTFihzLS8NeQMuj8I6Dj
 UASdl8pPCL/SlB68/VygttXkk66v79/yFHmdegBD6I51ljPJy5uq2NQy1/+Kjprcad/vChlQHa1
 eHLbtKIvHHqFdb6PhUQbpeptuLk3f6uv5gqBs+TqbxIGz4t7gpvjKokPEc1sQ9uQ66bWXkeBTBi
 E0zPH/1R2BqDmP+MouuYT2F/KEgk6DYsm4s6SBflsv51A7bu0tRYE8pgnJ5zBGtY/3aCGPlRRhc
 6wND7gkZZ+WaKVXOsmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01

Some CPUs count the trace unit's external outputs as the PMU common
events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
have no such events, and a feature relying on them would silently do
nothing there.

Detect at probe, on the trace unit's CPU, which outputs the PMU counts:
the trace unit has an external output for each of its events
(TRCIDR0.NUMEVENT), and from PMUv3p1, PMCEID0_EL0[63:32] reports which of
the common events 0x4000-0x401f are implemented. Per the ETE
specification, an implemented TRCEXTOUTn event counts external output n;
only whether that output is also an external input is IMPLEMENTATION
DEFINED.

Add a capability match flag for each output,
CS_CFG_MATCH_CAP_PMU_EXTOUT(n), set it on ETMs whose PMU counts that
output, and show it in the feature's configfs 'matches' attribute. With
capabilities matched separately from the device class, a feature that
requires one only loads on those ETMs.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  4 +++
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  5 ++-
 .../coresight/coresight-etm4x-core.c          | 32 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm4x.h |  3 ++
 .../coresight/coresight-syscfg-configfs.c     |  7 ++++
 5 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index af6ef96b9ae01..10e95f5ecc8d9 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -35,6 +35,10 @@
  * a device that matches one of its classes and has all of its capabilities.
  */
 #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
+/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
+#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
+#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
+#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
 
 /* flags defining device instance matching - used in config match desc data. */
 #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index e1a59b4345052..09a7a6b86968c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -174,9 +174,12 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 
 int etm4_cscfg_register(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct cscfg_csdev_feat_ops ops;
+	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
 
 	ops.load_feat = &etm4_cfg_load_feature;
+	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
 
-	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
+	return cscfg_register_csdev(csdev, match_flags, &ops);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d4442..1e78774025d13 100644
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
@@ -1368,6 +1369,35 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
 	}
 }
 
+/*
+ * Find the external outputs of this trace unit that the PMU counts as the
+ * common events TRCEXTOUT0-3. The trace unit has an external output for each
+ * of its events, and PMCEID0_EL0[63:32] reports the common events
+ * 0x4000-0x401f from PMUv3p1.
+ *
+ * Must run on the CPU that owns the trace unit.
+ */
+static u8 etm4_pmu_extout(struct etmv4_drvdata *drvdata)
+{
+	int pmuver = read_pmuver();
+	u64 pmceid;
+	u8 extout = 0;
+	int n;
+
+	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
+		return 0;
+
+	pmceid = read_pmceid0() >> 32;
+	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
+	for (n = 0; n <= drvdata->nr_event; n++) {
+		if (pmceid & BIT_ULL(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n -
+				     ARMV8_PMUV3_EXT_COMMON_EVENT_BASE))
+			extout |= BIT(n);
+	}
+
+	return extout;
+}
+
 static void etm4_init_arch_data(void *info)
 {
 	u32 etmidr0;
@@ -1522,6 +1552,8 @@ static void etm4_init_arch_data(void *info)
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
+	drvdata->pmu_extout = etm4_pmu_extout(drvdata);
+
 	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index df9e0748d71ec..11d95a4518b88 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -979,6 +979,8 @@ struct etmv4_save_state {
  * @nrseqstate: The number of sequencer states that are implemented.
  * @nr_seq_ctrls: The number of sequence state transition control registers.
  * @nr_event:	Indicates how many events the trace unit support.
+ * @pmu_extout:	Bitmap of the external outputs n that the PMU counts as
+ *		TRCEXTOUTn.
  * @nr_resource:The number of resource selection pairs available for tracing.
  * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
  * @trcid:	value of the current ID for this component.
@@ -1045,6 +1047,7 @@ struct etmv4_drvdata {
 	u8				nrseqstate;
 	u8				nr_seq_ctrls;
 	u8				nr_event;
+	u8				pmu_extout;
 	u8				nr_resource;
 	u8				nr_ss_cmp;
 	u8				trcid;
diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 2b40e556be872..7893d40f2e9ea 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -243,6 +243,7 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
 							struct cscfg_fs_feature, group);
 	u32 match_flags = fs_feat->feat_desc->match_flags;
 	int used = 0;
+	int n;
 
 	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ALL)
 		used = scnprintf(page, PAGE_SIZE, "SRC_ALL ");
@@ -250,6 +251,12 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
 	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
 		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
 
+	for (n = 0; n < CS_CFG_MATCH_CAP_PMU_EXTOUT_NR; n++) {
+		if (match_flags & CS_CFG_MATCH_CAP_PMU_EXTOUT(n))
+			used += scnprintf(page + used, PAGE_SIZE - used,
+					  "PMU_EXTOUT%d ", n);
+	}
+
 	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
 	return used;
 }
-- 
2.52.0
