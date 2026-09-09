Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BC395AC5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938586; cv=none; b=W8iUjZOUZLplKoXlO4WflLDf74lHlSP5uCkGopBXhvRmYNkIzPdtFEg1U+i/FsVTmKUX5xa6AV7/KiyNnzV6tVGXLyz5yek9SMBEviaTU8YK96XDawSCXGapnKrOhQ4kPGdWqSC4EuIXpKJ/XWfeZ0Cman/rCAgzgdUSu491uNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938586; c=relaxed/simple;
	bh=0VcYBPXxQV6RtRrACTK8F/4BNFnDJR+ms5/SgX1n4VY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHSRn+eLoRv/nfyg8XI6vi54Kuz6Z0FXblm4tobDFodJHzFEv0Vv7+NfQt37we3X/EOAhSQ6dHogtOsNa/xSvpxXP2wLqXb+c3qwzy+zoc25BZpDdSEpXxYlYKOkeJxQpei1BALbHB2JaJ8nkJJ06byZt69xHxsRarCny2xHrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=D2MryZzI; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=D2MryZzI; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="D2MryZzI";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="D2MryZzI"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X3XS6557iUVxAH+TSGS8ZcMo2fQUNDkYGZxf+WlbOjo=;
	b=D2MryZzIiHoAcEKb6h5By7r/KXVUi2lLThQCP7hJTO5hipbYA4J4zY/JaQu/lc3LBA21QIMCX
	KFEefpXcOdw+WSO2cBHRFQWMEjhxnosQRgqnnRrVKmHHiLtj4cP7Ywo30wcJAhvAzSWX0yaYZDF
	YoUyMFjIzL7yMU7XvpVgg8s=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4hfsgv4jDlz1BFqW
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:22:03 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X3XS6557iUVxAH+TSGS8ZcMo2fQUNDkYGZxf+WlbOjo=;
	b=D2MryZzIiHoAcEKb6h5By7r/KXVUi2lLThQCP7hJTO5hipbYA4J4zY/JaQu/lc3LBA21QIMCX
	KFEefpXcOdw+WSO2cBHRFQWMEjhxnosQRgqnnRrVKmHHiLtj4cP7Ywo30wcJAhvAzSWX0yaYZDF
	YoUyMFjIzL7yMU7XvpVgg8s=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hfsS36KQbz1prm3;
	Wed,  9 Sep 2026 15:11:47 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id A993D40575;
	Wed,  9 Sep 2026 15:22:43 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 15:22:42 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v5 1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp states
Date: Wed, 9 Sep 2026 15:22:38 +0800
Message-ID: <20260909072240.2308808-2-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260909072240.2308808-1-wangyushan12@huawei.com>
References: <20260909072240.2308808-1-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo500002.china.huawei.com (7.152.185.250)

Every HiSilicon uncore PMU driver allocates its own static cpuhp state
even though they all register identical online/offline callbacks. This
wastes slots in the cpuhp state enum and needlessly fragments the
hotplug state space.

Move the cpuhp state setup into the shared hisi_uncore_pmu framework:
register a single dynamic state (CPUHP_AP_ONLINE_DYN) at framework
module init and export it for all HiSilicon uncore PMU drivers to use.
Drop the now-unused static CPUHP_AP_PERF_ARM_HISI_* entries from
include/linux/cpuhotplug.h.

The L3C PMU driver keeps a private dynamic state because it has its own
hotplug callbacks for migrating multiple per-CPU interrupt affinities,
but switches from its former static slot to CPUHP_AP_ONLINE_DYN for
consistency.

No intended functional changes.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 34 +++---------------
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 34 +++---------------
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 34 +++---------------
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 21 +++++------
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 35 ++----------------
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 35 ++----------------
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 34 +++---------------
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 25 +++++++++++++
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |  2 ++
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 34 +++---------------
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   | 36 ++-----------------
 include/linux/cpuhotplug.h                    |  6 ----
 12 files changed, 67 insertions(+), 263 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
index b879b81adfdd..83967725c51c 100644
--- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
@@ -295,7 +295,7 @@ static int hisi_cpa_pmu_probe(struct platform_device *pdev)
 
 	/* Power Management should be disabled before using CPA PMU. */
 	hisi_cpa_pmu_disable_pm(cpa_pmu);
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
 				       &cpa_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
@@ -307,7 +307,7 @@ static int hisi_cpa_pmu_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(cpa_pmu->dev, "PMU register failed\n");
 		cpuhp_state_remove_instance_nocalls(
-			CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE, &cpa_pmu->node);
+			hisi_uncore_pmu_cpuhp_state, &cpa_pmu->node);
 		hisi_cpa_pmu_enable_pm(cpa_pmu);
 		return ret;
 	}
@@ -321,7 +321,7 @@ static void hisi_cpa_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *cpa_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&cpa_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 					    &cpa_pmu->node);
 	hisi_cpa_pmu_enable_pm(cpa_pmu);
 }
@@ -336,33 +336,7 @@ static struct platform_driver hisi_cpa_pmu_driver = {
 	.remove = hisi_cpa_pmu_remove,
 };
 
-static int __init hisi_cpa_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
-				      "AP_PERF_ARM_HISI_CPA_ONLINE",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret) {
-		pr_err("setup hotplug failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&hisi_cpa_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE);
-
-	return ret;
-}
-module_init(hisi_cpa_pmu_module_init);
-
-static void __exit hisi_cpa_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_cpa_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE);
-}
-module_exit(hisi_cpa_pmu_module_exit);
+module_platform_driver(hisi_cpa_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC CPA PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 21c494881ca0..e905160523ee 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -401,7 +401,7 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
 				       &ddrc_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug;\n", ret);
@@ -414,7 +414,7 @@ static int hisi_ddrc_pmu_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(ddrc_pmu->dev, "DDRC PMU register failed!\n");
 		cpuhp_state_remove_instance_nocalls(
-			CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE, &ddrc_pmu->node);
+			hisi_uncore_pmu_cpuhp_state, &ddrc_pmu->node);
 	}
 
 	return ret;
@@ -425,7 +425,7 @@ static void hisi_ddrc_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *ddrc_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&ddrc_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 					    &ddrc_pmu->node);
 }
 
@@ -501,33 +501,7 @@ static struct platform_driver hisi_ddrc_pmu_driver = {
 	.remove = hisi_ddrc_pmu_remove,
 };
 
-static int __init hisi_ddrc_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
-				      "AP_PERF_ARM_HISI_DDRC_ONLINE",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret) {
-		pr_err("DDRC PMU: setup hotplug, ret = %d\n", ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&hisi_ddrc_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE);
-
-	return ret;
-}
-module_init(hisi_ddrc_pmu_module_init);
-
-static void __exit hisi_ddrc_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_ddrc_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE);
-}
-module_exit(hisi_ddrc_pmu_module_exit);
+module_platform_driver(hisi_ddrc_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC DDRC uncore PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 97cfaa586a87..93a250b7abb8 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -490,7 +490,7 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
 				       &hha_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
@@ -503,7 +503,7 @@ static int hisi_hha_pmu_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(hha_pmu->dev, "HHA PMU register failed!\n");
 		cpuhp_state_remove_instance_nocalls(
-			CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE, &hha_pmu->node);
+			hisi_uncore_pmu_cpuhp_state, &hha_pmu->node);
 	}
 
 	return ret;
@@ -514,7 +514,7 @@ static void hisi_hha_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *hha_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&hha_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 					    &hha_pmu->node);
 }
 
@@ -528,33 +528,7 @@ static struct platform_driver hisi_hha_pmu_driver = {
 	.remove = hisi_hha_pmu_remove,
 };
 
-static int __init hisi_hha_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
-				      "AP_PERF_ARM_HISI_HHA_ONLINE",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret) {
-		pr_err("HHA PMU: Error setup hotplug, ret = %d;\n", ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&hisi_hha_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE);
-
-	return ret;
-}
-module_init(hisi_hha_pmu_module_init);
-
-static void __exit hisi_hha_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_hha_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE);
-}
-module_exit(hisi_hha_pmu_module_exit);
+module_platform_driver(hisi_hha_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC HHA uncore PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 56a88fb0d3c2..e40506e09702 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -93,6 +93,8 @@ struct hisi_l3c_pmu_ext {
 	bool support_ext;
 };
 
+static enum cpuhp_state hisi_l3c_pmu_cpuhp_state;
+
 static bool support_ext(struct hisi_l3c_pmu *pmu)
 {
 	struct hisi_l3c_pmu_ext *l3c_pmu_ext = pmu->l3c_pmu.dev_info->private;
@@ -844,8 +846,7 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
-				       &l3c_pmu->node);
+	ret = cpuhp_state_add_instance(hisi_l3c_pmu_cpuhp_state, &l3c_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
 		return ret;
@@ -857,7 +858,7 @@ static int hisi_l3c_pmu_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(l3c_pmu->dev, "L3C PMU register failed!\n");
 		cpuhp_state_remove_instance_nocalls(
-			CPUHP_AP_PERF_ARM_HISI_L3_ONLINE, &l3c_pmu->node);
+			hisi_l3c_pmu_cpuhp_state, &l3c_pmu->node);
 	}
 
 	return ret;
@@ -868,7 +869,7 @@ static void hisi_l3c_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *l3c_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&l3c_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_l3c_pmu_cpuhp_state,
 					    &l3c_pmu->node);
 }
 
@@ -938,20 +939,20 @@ static int hisi_l3c_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 
 static int __init hisi_l3c_pmu_module_init(void)
 {
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
+	int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
 				      "AP_PERF_ARM_HISI_L3_ONLINE",
 				      hisi_l3c_pmu_online_cpu,
 				      hisi_l3c_pmu_offline_cpu);
-	if (ret) {
+	if (ret < 0) {
 		pr_err("L3C PMU: Error setup hotplug, ret = %d\n", ret);
 		return ret;
 	}
 
+	hisi_l3c_pmu_cpuhp_state = ret;
+
 	ret = platform_driver_register(&hisi_l3c_pmu_driver);
 	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE);
+		cpuhp_remove_multi_state(hisi_l3c_pmu_cpuhp_state);
 
 	return ret;
 }
@@ -960,7 +961,7 @@ module_init(hisi_l3c_pmu_module_init);
 static void __exit hisi_l3c_pmu_module_exit(void)
 {
 	platform_driver_unregister(&hisi_l3c_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_L3_ONLINE);
+	cpuhp_remove_multi_state(hisi_l3c_pmu_cpuhp_state);
 }
 module_exit(hisi_l3c_pmu_module_exit);
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
index 246cc0333099..ad898153ff49 100644
--- a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
@@ -13,9 +13,6 @@
 
 #include "hisi_uncore_pmu.h"
 
-/* Dynamic CPU hotplug state used by MN PMU */
-static enum cpuhp_state hisi_mn_pmu_online;
-
 /* MN register definition */
 #define HISI_MN_DYNAMIC_CTRL_REG	0x400
 #define   HISI_MN_DYNAMIC_CTRL_EN	BIT(0)
@@ -291,7 +288,7 @@ static int hisi_mn_pmu_dev_init(struct platform_device *pdev,
 
 static void hisi_mn_pmu_remove_cpuhp(void *hotplug_node)
 {
-	cpuhp_state_remove_instance_nocalls(hisi_mn_pmu_online, hotplug_node);
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
 }
 
 static void hisi_mn_pmu_unregister(void *pmu)
@@ -320,7 +317,7 @@ static int hisi_mn_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(hisi_mn_pmu_online, &mn_pmu->node);
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &mn_pmu->node);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register cpu hotplug\n");
 
@@ -376,33 +373,7 @@ static struct platform_driver hisi_mn_pmu_driver = {
 	.probe = hisi_mn_pmu_probe,
 };
 
-static int __init hisi_mn_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/mn:online",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret < 0) {
-		pr_err("hisi_mn_pmu: Failed to setup MN PMU hotplug: %d\n", ret);
-		return ret;
-	}
-	hisi_mn_pmu_online = ret;
-
-	ret = platform_driver_register(&hisi_mn_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(hisi_mn_pmu_online);
-
-	return ret;
-}
-module_init(hisi_mn_pmu_module_init);
-
-static void __exit hisi_mn_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_mn_pmu_driver);
-	cpuhp_remove_multi_state(hisi_mn_pmu_online);
-}
-module_exit(hisi_mn_pmu_module_exit);
+module_platform_driver(hisi_mn_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC MN uncore PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
index 616f4af57db7..abf44fa46d17 100644
--- a/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
@@ -41,9 +41,6 @@
 HISI_PMU_EVENT_ATTR_EXTRACTOR(ch, config1, 2, 0);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_en, config1, 3, 3);
 
-/* Dynamic CPU hotplug state used by this PMU driver */
-static enum cpuhp_state hisi_noc_pmu_cpuhp_state;
-
 struct hisi_noc_pmu_regs {
 	u32 version;
 	u32 pmu_ctrl;
@@ -324,7 +321,7 @@ static int hisi_noc_pmu_dev_init(struct platform_device *pdev, struct hisi_pmu *
 
 static void hisi_noc_pmu_remove_cpuhp_instance(void *hotplug_node)
 {
-	cpuhp_state_remove_instance_nocalls(hisi_noc_pmu_cpuhp_state, hotplug_node);
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
 }
 
 static void hisi_noc_pmu_unregister_pmu(void *pmu)
@@ -353,7 +350,7 @@ static int hisi_noc_pmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = cpuhp_state_add_instance(hisi_noc_pmu_cpuhp_state, &noc_pmu->node);
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &noc_pmu->node);
 	if (ret)
 		return dev_err_probe(dev, ret, "Fail to register cpuhp instance\n");
 
@@ -408,33 +405,7 @@ static struct platform_driver hisi_noc_pmu_driver = {
 	.probe = hisi_noc_pmu_probe,
 };
 
-static int __init hisi_noc_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/noc:online",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret < 0) {
-		pr_err("hisi_noc_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
-		return ret;
-	}
-	hisi_noc_pmu_cpuhp_state = ret;
-
-	ret = platform_driver_register(&hisi_noc_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(hisi_noc_pmu_cpuhp_state);
-
-	return ret;
-}
-module_init(hisi_noc_pmu_module_init);
-
-static void __exit hisi_noc_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_noc_pmu_driver);
-	cpuhp_remove_multi_state(hisi_noc_pmu_cpuhp_state);
-}
-module_exit(hisi_noc_pmu_module_exit);
+module_platform_driver(hisi_noc_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC Uncore NoC PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index 80108c63cb60..3d1e0af64260 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -468,7 +468,7 @@ static int hisi_pa_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
 				       &pa_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
@@ -479,7 +479,7 @@ static int hisi_pa_pmu_probe(struct platform_device *pdev)
 	ret = perf_pmu_register(&pa_pmu->pmu, name, -1);
 	if (ret) {
 		dev_err(pa_pmu->dev, "PMU register failed, ret = %d\n", ret);
-		cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
+		cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 						    &pa_pmu->node);
 		return ret;
 	}
@@ -493,7 +493,7 @@ static void hisi_pa_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *pa_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&pa_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 					    &pa_pmu->node);
 }
 
@@ -515,33 +515,7 @@ static struct platform_driver hisi_pa_pmu_driver = {
 	.remove = hisi_pa_pmu_remove,
 };
 
-static int __init hisi_pa_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
-				      "AP_PERF_ARM_HISI_PA_ONLINE",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret) {
-		pr_err("PA PMU: cpuhp state setup failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&hisi_pa_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE);
-
-	return ret;
-}
-module_init(hisi_pa_pmu_module_init);
-
-static void __exit hisi_pa_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_pa_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_PA_ONLINE);
-}
-module_exit(hisi_pa_pmu_module_exit);
+module_platform_driver(hisi_pa_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon Protocol Adapter uncore PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 77390d033d08..346c87594614 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -23,6 +23,9 @@
 
 #define HISI_MAX_PERIOD(nr) (GENMASK_ULL((nr) - 1, 0))
 
+enum cpuhp_state hisi_uncore_pmu_cpuhp_state;
+EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_cpuhp_state, "HISI_PMU");
+
 /*
  * PMU event attributes
  */
@@ -618,5 +621,27 @@ void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module)
 }
 EXPORT_SYMBOL_NS_GPL(hisi_pmu_init, "HISI_PMU");
 
+static int __init hisi_uncore_pmu_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "perf/hisi/uncore:online",
+				      hisi_uncore_pmu_online_cpu,
+				      hisi_uncore_pmu_offline_cpu);
+	if (ret < 0)
+		return ret;
+
+	hisi_uncore_pmu_cpuhp_state = ret;
+
+	return 0;
+}
+module_init(hisi_uncore_pmu_init);
+
+static void __exit hisi_uncore_pmu_exit(void)
+{
+	cpuhp_remove_multi_state(hisi_uncore_pmu_cpuhp_state);
+}
+module_exit(hisi_uncore_pmu_exit);
+
 MODULE_DESCRIPTION("HiSilicon SoC uncore Performance Monitor driver framework");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 3ffe6acda653..e5a4b3898865 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -171,4 +171,6 @@ int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
 void hisi_uncore_pmu_init_topology(struct hisi_pmu *hisi_pmu, struct device *dev);
 
 void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module);
+
+extern enum cpuhp_state hisi_uncore_pmu_cpuhp_state;
 #endif /* __HISI_UNCORE_PMU_H__ */
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index cd32d606df05..d01340ff2e5c 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -503,7 +503,7 @@ static int hisi_sllc_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state,
 				       &sllc_pmu->node);
 	if (ret) {
 		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
@@ -515,7 +515,7 @@ static int hisi_sllc_pmu_probe(struct platform_device *pdev)
 	ret = perf_pmu_register(&sllc_pmu->pmu, name, -1);
 	if (ret) {
 		dev_err(sllc_pmu->dev, "PMU register failed, ret = %d\n", ret);
-		cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
+		cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 						    &sllc_pmu->node);
 		return ret;
 	}
@@ -530,7 +530,7 @@ static void hisi_sllc_pmu_remove(struct platform_device *pdev)
 	struct hisi_pmu *sllc_pmu = platform_get_drvdata(pdev);
 
 	perf_pmu_unregister(&sllc_pmu->pmu);
-	cpuhp_state_remove_instance_nocalls(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
 					    &sllc_pmu->node);
 }
 
@@ -551,33 +551,7 @@ static struct platform_driver hisi_sllc_pmu_driver = {
 	.remove = hisi_sllc_pmu_remove,
 };
 
-static int __init hisi_sllc_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
-				      "AP_PERF_ARM_HISI_SLLC_ONLINE",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret) {
-		pr_err("SLLC PMU: cpuhp state setup failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	ret = platform_driver_register(&hisi_sllc_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE);
-
-	return ret;
-}
-module_init(hisi_sllc_pmu_module_init);
-
-static void __exit hisi_sllc_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_sllc_pmu_driver);
-	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE);
-}
-module_exit(hisi_sllc_pmu_module_exit);
+module_platform_driver(hisi_sllc_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SLLC uncore PMU driver");
diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
index e8186b6e1687..b4d017a5d688 100644
--- a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
@@ -13,9 +13,6 @@
 
 #include "hisi_uncore_pmu.h"
 
-/* Dynamic CPU hotplug state used by UC PMU */
-static enum cpuhp_state hisi_uc_pmu_online;
-
 /* UC register definition */
 #define HISI_UC_INT_MASK_REG		0x0800
 #define HISI_UC_INT_STS_REG		0x0808
@@ -488,7 +485,7 @@ static int hisi_uc_pmu_dev_probe(struct platform_device *pdev,
 
 static void hisi_uc_pmu_remove_cpuhp_instance(void *hotplug_node)
 {
-	cpuhp_state_remove_instance_nocalls(hisi_uc_pmu_online, hotplug_node);
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state, hotplug_node);
 }
 
 static void hisi_uc_pmu_unregister_pmu(void *pmu)
@@ -518,7 +515,7 @@ static int hisi_uc_pmu_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ret = cpuhp_state_add_instance(hisi_uc_pmu_online, &uc_pmu->node);
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &uc_pmu->node);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Error registering hotplug\n");
 
@@ -559,34 +556,7 @@ static struct platform_driver hisi_uc_pmu_driver = {
 	.probe = hisi_uc_pmu_probe,
 };
 
-static int __init hisi_uc_pmu_module_init(void)
-{
-	int ret;
-
-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
-				      "perf/hisi/uc:online",
-				      hisi_uncore_pmu_online_cpu,
-				      hisi_uncore_pmu_offline_cpu);
-	if (ret < 0) {
-		pr_err("UC PMU: Error setup hotplug, ret = %d\n", ret);
-		return ret;
-	}
-	hisi_uc_pmu_online = ret;
-
-	ret = platform_driver_register(&hisi_uc_pmu_driver);
-	if (ret)
-		cpuhp_remove_multi_state(hisi_uc_pmu_online);
-
-	return ret;
-}
-module_init(hisi_uc_pmu_module_init);
-
-static void __exit hisi_uc_pmu_module_exit(void)
-{
-	platform_driver_unregister(&hisi_uc_pmu_driver);
-	cpuhp_remove_multi_state(hisi_uc_pmu_online);
-}
-module_exit(hisi_uc_pmu_module_exit);
+module_platform_driver(hisi_uc_pmu_driver);
 
 MODULE_IMPORT_NS("HISI_PMU");
 MODULE_DESCRIPTION("HiSilicon SoC UC uncore PMU driver");
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index feb32949aeea..1b6dba159bb2 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -209,12 +209,6 @@ enum cpuhp_state {
 	CPUHP_AP_PERF_S390_SF_ONLINE,
 	CPUHP_AP_PERF_ARM_CCI_ONLINE,
 	CPUHP_AP_PERF_ARM_CCN_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_CPA_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_HHA_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_L3_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_PA_ONLINE,
-	CPUHP_AP_PERF_ARM_HISI_SLLC_ONLINE,
 	CPUHP_AP_PERF_ARM_HISI_PCIE_PMU_ONLINE,
 	CPUHP_AP_PERF_ARM_HNS3_PMU_ONLINE,
 	CPUHP_AP_PERF_ARM_L2X0_ONLINE,
-- 
2.33.0

