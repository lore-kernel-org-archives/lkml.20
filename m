Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696962798EA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069445; cv=fail; b=d+gVqHkmWGEH/jHwnncETNLuKQePPrWIUBV4KFu2ov3Emq6ZLqXaQGWSr7H3QSkvJE+ItwhqME/Rg1Z2tHOtmaPaAb5IjQE3e0sgBNUzNbxsunFZPFgShGZcPcpw8V9S7s6jlIqR2dFSJQ6G2fNBvx04zclClM482NtcTzFf7Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069445; c=relaxed/simple;
	bh=3DQAu0/9BxEWC3mdpteHZZsLIav9FsziJmLLvbkPnRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQlvGh6YQo+w0udjqjxNfgL7ysMbf5b4HpidfaWJDcJZl1ro+WtU6BZBBBAMNSDCmB0kaQ+40ukdF+5mEiSeCjvctjFND1jmzc84Yt16RB5wtBPHgtOJMHeGlSqP2xH7z15IRWbIhLMR3ckDNF22sLc4TeGZKSvBY76DWZay9jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gmVY98Tc; arc=fail smtp.client-ip=40.107.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gmVY98Tc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B985+NbbpxsDbuV+tDnS7+arcTxbjko8nYKU6uO81t/kVmdZGM6/Tckqhsx9+knw0KTiW6gMRLTk3qXpa4zKUq/bFtoksxX19fCdGK3IN4UEWgV/xKTZd0zXlU63Ir9iF3P/5gLHE/mNIx9TaczgDvqZ5Evfmau5MLDqQz2w/7rSgxpruL8KHYNDH+RDjh9QjxQZj4Y/n3iX2aVEJHcWeHQu9BwI81229jwMNyNkJF9HXBSGhkboxIEOyojgEcZvlrBsTa3ubKAajuwr3EER3mBbzVx5BYfEsiXqXABiiBCuo1T5g2v3O9gl7wgCNVcJapS/8Rr+H333SMwIRYhO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNSZBkM3A9F7VgbN+rs75nUIY0/zpew9AHRvVvhLb/g=;
 b=Fgf+CMP11H9MQzomW19Jx+MdEQXAsMPvlwGuuf9AJc/OgwL3/xXQrgeR9uWpYdZu/J04p9/+cSZJfQLJajwwuVmRfKsjfXtC9ICatIIJst4KhcARs5QnstqHBaPHri8Ebvz6FLaKQwnZq+1ZnFe7R/++ZCfz8WJEgqVymk7BHNzVxUwuK3AdcJhgfg6WC4zxxz+OQCyVkxE2c6O6hlMRUY5sPc2iTZU0WrufdcxyKvmng9DIvoCqAWCRrsKU7+YQ9n74SRCBo68jbca6H3u4lZik8i33mjL3CPfyFQdJWezw4Dmlz2PL8tkDqLVU2oBBAh2pPIE+qcmEteimMB3f/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNSZBkM3A9F7VgbN+rs75nUIY0/zpew9AHRvVvhLb/g=;
 b=gmVY98TcEGC/vDpymaUk+Qn29FE6cUwzgQyJFny6P9/f24i6ovb/vc8cesr9jsZG73m2ZykwRNnJHg77JKkecGROeJuu0hE8Atbk2o23WvigkJrUPcdyEKNiBqXYe4/PYuYgTE7ZldM8WUi8y12iGPAC3D9Q+b03jN6V0jmjYUs=
Received: from BN0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:408:e7::15)
 by CY1PR12MB9698.namprd12.prod.outlook.com (2603:10b6:930:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 05:57:19 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::1c) by BN0PR03CA0040.outlook.office365.com
 (2603:10b6:408:e7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 05:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 05:57:19 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 00:57:18 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: Add drm_user_fence helper
Date: Sun, 30 Aug 2026 11:26:44 +0530
Message-ID: <20260830055646.102644-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830055646.102644-1-srinivasan.shanmugam@amd.com>
References: <20260830055646.102644-1-srinivasan.shanmugam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CY1PR12MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: afa669ff-a258-4672-708a-08df065b8d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	huxYq2mTc7I/1BnXQwHXHFL8ldcYPTCMAC59kSygyxZ5Rjr8G1ecgsTZTBTDMGdNRH8HWl8Ex2QyRFB7EwXhWJrHNXZep4V00MoC3gs5jv5pfh6Mm/OoATojI+S+06sOk49PoHAnl8uNrzE2ol6ns7xr23yzpdUCfRWVV4uRG1Kk/kW0uR57QBQ5J/0DDPQMwIZMJk1QzCJhd5tpqsWJqZW0mD/VDdoHJtsfVVXwEbPOXxPclbntnlHl7Qb2CSJ5pMCI66+i7KDdsJPVF5TuSlbOQReOre38sKhitbjuSUmGXkE0d8+zVBMMEwbHKU1P93iGFMoNySKsHu4dglSALO4WAJY2pgLy/JYXQNN6ERxOZyG5MfPSM1Cjabw99wS1n7VLstLesRYr/zCUhvT7NVU5vJQIND33ZefCSUFttm9t07M7MKNKecJSVWDcu2bWbRzQoRVIcUzYbZW2kfcpiQIrqc407EKgttbpq4/VM0EyqHl+iB/vTopkKjujWVDb1qcKMxOcPkd4iePgahQmYIEaAGxG5Du3rhAqXpYIrDZ6tpYMNzJL8SgwEe3Q+wdex+Lmp/e2yUAwmug1tIeolRKlmsPUFONBQdbI5gkbEbUi1HTrLWEj06KN7VZ4/ws/xbGJa0QT4d14X8K+6o+PMmxkzumwgoKL2tX79tu70ariCi6Xd+RgA91xSVgPhwvbcEGLhZLwcnEc622k+fLHng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P8VSJvf2ObmtWX7zjIARmUn9+M5KTgUZzJwqOgwyepE8ov47WPx4L9XHDaDUP2T9Ger1KgSU/7dVC+HsCN5kkgoVEg1LP2U+4d6Ayjjc9h7hXLKfS1Lzl2hMAetEuPxktzrSucvqjvoMtUFOrHNKn+mQvpAgRL4EfEqemXyebwIgqCinUd1o1jkoe/rthfrtKCIC4/2lSmcxcYoxeOLUaFHawG0K/s73ta2LoMoYX/t5Ru+etDLm9KGopFmOsORrhe4N738e3eaDuEIeQwSBdoDxtq/sqe/ol7mpajdmgqa9LJm/W7DZYo49bDXLbrW7tMbzW7hjutQ5z9Zeohq4x+6dWbi09bHI23Plj3hf0rPpsAgfMceDAXi1ExRwQu2nfsPkXS6scdcQWW9x7Z6Fv/sW3/AnwJ3EcVPhg5m+11q8bJzRENwX1Y67sIJCZ9nW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 05:57:19.2475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa669ff-a258-4672-708a-08df065b8d56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9698

Introduce a common DRM user fence helper providing the kref-managed,
MM-borrowing dma-fence-callback-to-workqueue pattern used by drivers
that must access userspace memory from a kthread context when a GPU
fence signals.

XE uses this pattern (xe_sync.c) to write a fence completion value
to a userspace VA. AMDGPU will use the same pattern to signal a
per-queue eventfd from a user-queue EOP fence callback.

The helper provides:
 - struct drm_user_fence: embeddable base structure
 - struct drm_user_fence_ops: worker/destroy callbacks
 - drm_user_fence_init(): initialize and grab the process MM
 - drm_user_fence_get/put(): reference counting
 - drm_user_fence_add_callback(): attach to a dma-fence

The worker callback receives a bool indicating whether the process
MM was successfully obtained, allowing drivers to handle the
unavailable-MM case (log, skip the userspace write, etc.) without
duplicating the mmget/kthread_use_mm/mmput boilerplate.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/drm_user_fence.c | 69 +++++++++++++++++++++++++
 include/drm/drm_user_fence.h     | 86 ++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_user_fence.c
 create mode 100644 include/drm/drm_user_fence.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c5be8e80d0c8..ddb770738992 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -69,6 +69,7 @@ drm-y := \
 	drm_syncobj.o \
 	drm_sysfs.o \
 	drm_trace_points.o \
+	drm_user_fence.o \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
new file mode 100644
index 000000000000..664178e2d74c
--- /dev/null
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 The Linux Foundation
+ *
+ * DRM user fence — extends drm_work_fence with kthread_use_mm() support.
+ *
+ * Use this when a GPU fence signals and work needs to access userspace
+ * memory (copy_to_user, fault-able operations) from a kthread context.
+ * For work that does not require userspace memory access, use
+ * drm_work_fence directly.
+ */
+
+#include <linux/kthread.h>
+#include <linux/sched/mm.h>
+
+#include <drm/drm_user_fence.h>
+
+static void drm_user_fence_do_work(struct drm_work_fence *wfence)
+{
+	struct drm_user_fence *ufence =
+		container_of(wfence, struct drm_user_fence, base);
+	bool mm_ok = false;
+
+	if (mmget_not_zero(ufence->mm)) {
+		kthread_use_mm(ufence->mm);
+		mm_ok = true;
+	}
+
+	ufence->ops->worker(ufence, mm_ok);
+
+	if (mm_ok) {
+		kthread_unuse_mm(ufence->mm);
+		mmput_async(ufence->mm);
+	}
+}
+
+static void drm_user_fence_do_destroy(struct drm_work_fence *wfence)
+{
+	struct drm_user_fence *ufence =
+		container_of(wfence, struct drm_user_fence, base);
+
+	mmdrop(ufence->mm);
+	ufence->ops->destroy(ufence);
+}
+
+static const struct drm_work_fence_ops drm_user_fence_wf_ops = {
+	.work    = drm_user_fence_do_work,
+	.destroy = drm_user_fence_do_destroy,
+};
+
+/**
+ * drm_user_fence_init - Initialize a user fence
+ * @ufence: user fence to initialize
+ * @wq: workqueue to run the worker on (must be ordered if sequencing matters)
+ * @ops: driver operations
+ *
+ * Must be called from process context with a valid current->mm.
+ * Grabs a reference to current->mm via mmgrab().
+ */
+void drm_user_fence_init(struct drm_user_fence *ufence,
+			 struct workqueue_struct *wq,
+			 const struct drm_user_fence_ops *ops)
+{
+	drm_work_fence_init(&ufence->base, wq, &drm_user_fence_wf_ops);
+	ufence->mm = current->mm;
+	mmgrab(ufence->mm);
+	ufence->ops = ops;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_init);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
new file mode 100644
index 000000000000..2b2b640f510f
--- /dev/null
+++ b/include/drm/drm_user_fence.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 The Linux Foundation
+ */
+
+#ifndef __DRM_USER_FENCE_H__
+#define __DRM_USER_FENCE_H__
+
+#include <drm/drm_work_fence.h>
+
+struct drm_user_fence;
+
+/**
+ * struct drm_user_fence_ops - driver callbacks for a DRM user fence
+ */
+struct drm_user_fence_ops {
+	/**
+	 * @worker: Called from workqueue context with the process MM active.
+	 *
+	 * If @mm_ok is true, kthread_use_mm() is active and userspace memory
+	 * (copy_to_user, etc.) may be accessed safely.
+	 * If @mm_ok is false, the process MM was already gone; the driver
+	 * should log a warning and skip the userspace write.
+	 *
+	 * wake_up() or other post-signal housekeeping should also happen here.
+	 */
+	void (*worker)(struct drm_user_fence *ufence, bool mm_ok);
+
+	/**
+	 * @destroy: Called when the last reference is dropped.
+	 * Free the containing structure here.
+	 */
+	void (*destroy)(struct drm_user_fence *ufence);
+};
+
+/**
+ * struct drm_user_fence - DRM user fence with MM borrowing
+ *
+ * Extends drm_work_fence with kthread_use_mm() support for drivers
+ * that need to access userspace memory when a GPU fence signals.
+ * For work that does not need userspace memory access, use
+ * drm_work_fence directly.
+ *
+ * Call drm_user_fence_init() at creation and drm_user_fence_add_callback()
+ * to arm on a dma-fence. Call drm_user_fence_cancel_sync() before teardown.
+ */
+struct drm_user_fence {
+	/** @base: Base work fence. Must be first. */
+	struct drm_work_fence base;
+	/** @mm: Process MM grabbed at init time. */
+	struct mm_struct *mm;
+	/** @ops: Driver operations. */
+	const struct drm_user_fence_ops *ops;
+};
+
+void drm_user_fence_init(struct drm_user_fence *ufence,
+			 struct workqueue_struct *wq,
+			 const struct drm_user_fence_ops *ops);
+
+static inline void drm_user_fence_get(struct drm_user_fence *ufence)
+{
+	drm_work_fence_get(&ufence->base);
+}
+
+static inline void drm_user_fence_put(struct drm_user_fence *ufence)
+{
+	drm_work_fence_put(&ufence->base);
+}
+
+static inline int drm_user_fence_add_callback(struct drm_user_fence *ufence,
+					      struct dma_fence *fence)
+{
+	return drm_work_fence_add_callback(&ufence->base, fence);
+}
+
+static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
+{
+	return drm_work_fence_cancel(&ufence->base);
+}
+
+static inline void drm_user_fence_cancel_sync(struct drm_user_fence *ufence)
+{
+	drm_work_fence_cancel_sync(&ufence->base);
+}
+
+#endif /* __DRM_USER_FENCE_H__ */
-- 
2.34.1

