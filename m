Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3949F10D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356983; cv=fail; b=FZjjcg/8p+KyIIRuePBSNgeMIXYv9U1tNT7wmEa+1z8xstMAt53xc+5AD8tjizh09Qb9JukK9eHLSY9C1uj0K31uyGtHwlGrjTJoqlY5GZO9xO/3/pNHAQfAk+IdIMt6XIUU4tWwUmj7aMTJDf1qtk7OWCSMb28TyaBdgw+nFB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356983; c=relaxed/simple;
	bh=afDzH6zBkCpXAy4Pzc6RuXiirX+zqNdvRiM+lKKpLLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTCoDYrl1Ly48TV1BLAaqr5vDM/2qQ0L3pVMlEMfU9BcqJ9aV+RuNCdxbM87j80591Jq6Fn68E0/0zdSnuEBeKcT0rEHUuY3ORoNm90Q4k5h9A/jnCvk2fTxCL1ic+34HI8cWUY6MKVSOVZJ6Jil6K837VvzxeD62UtOSIPy0WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0SCk8Dq+; arc=fail smtp.client-ip=52.101.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0SCk8Dq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmZ2qr34hUCuaex61/Qq8HWftL+61g6Gc5nyfgmupFgm7voBi5c9XwHDxL3z0LmMDT438lDOk2JfHotm7HPsMog3VX360LJCUqtUyQlrm+bzuN3CEHRwSzDepQnL0LT0kKHsQobBD92PfTgh442CpcDS9cnJaY0OLedNY4ptPPDfaAM43GETr+lKazqdnjA5BU+zFOJ9FywoNhIE8OzmqRSZVNYIsiD0IEoz+gTLiR6rHYyHbVQgJ/kTmnoWFfn4IYN8WiopCvkaqF/iI8fFXT0MsDxgYi9wvx2mh0C8Wj3Q6KW6G5zax8sUdtJkF2fOh0Qn9iBsaJqZuyVBk/eWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6alkwTKNu6O0yUldzKREIvLw/WMhlRh4510c8oTfqtw=;
 b=lzh+1chUW6QOlcLHmhLvucgB9Y9Vo3nZwegs6wtriyyONWrug+uiSHJiniz2QfTPbNUXobNQrPjG5jyXrlTeIlc5NOwHICbjQKSuNQo/67ad41eeRhx9aiv/2HUfYuXHF/wBinLcN4PRWKGELMqx1Gvp+q7rheMc+U9wxLvjsFCbuMXSb1PDOjN+J74rbrL9OC9eLQyeN+w/Hb3OyT6B14bH2KQn/07OmrnirYI0Emtlf9CPwQAg+BafrcWPLGceATc+MauBejS/ubAAwD1mYOZIVl9kpXPHwdisM6eq3M7xZh6+dkOHp6iwwcz2BvMqlLvkEYGp01/SdotrqaBHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6alkwTKNu6O0yUldzKREIvLw/WMhlRh4510c8oTfqtw=;
 b=0SCk8Dq+8br9F/u+yzXtYIRJ3G3VKPSJWva3oElEjmExaVjnBT24RBB3O8GTFDKGzYj+CRQj7qT7kWeoAecVUHahKXHldn6B2grbI4C24+UUtyPVlRAhGssd1rHSCXiK50ngKHrsq5PsBExVhHSL+NVG5xfx2umXSMD42kqHPyE=
Received: from BN9PR03CA0622.namprd03.prod.outlook.com (2603:10b6:408:106::27)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:49:32 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::75) by BN9PR03CA0622.outlook.office365.com
 (2603:10b6:408:106::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:49:31 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 08:49:24 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: Add drm_user_fence helper
Date: Wed, 2 Sep 2026 19:19:08 +0530
Message-ID: <20260902134910.156230-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902134910.156230-1-srinivasan.shanmugam@amd.com>
References: <20260902134910.156230-1-srinivasan.shanmugam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a09875d-079c-4358-0132-08df08f90408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ld7eXyL2PXomejhZMZh/yKC5TJIzEPrbee1LFeBKtcKTp7kLp3kbEE/6Ys13islksIYMtvBSUIM9MUtrJCZtV/SOPT8ACzbkYv2qvZUOBaCSZep0IgU84fgXh2EnyluRKp1UeUDH+s0M9HduFCxI8Rp3XV/PnyrsyC3T0ZzpO7x/2V/xfLg3ChkFJbsiyH5I2THJITEe2+6J1QKzZTP0spQpueJ+hjOIXrRZQOlnM8Im70NF9r7gXd5k7hQU4SJHtt7wFUAKdnvc0Yz3Dbkv0mAtwr4G+tDM6bxfRLMtXV0Yo5exQ48DupdWSF6ezvsE2d9E7iusqTko/MKTzC7BceLSi2AlOAn0/1qbyZmU6tGmwNeOrUXQ70EYAcrz8PPpccB2ftNf+kfW2kmXWQ7/GVznwlL4KjEIztZ3sH9tfOuyrQJ8O0C6GhxS9mWtQY+mCo0ckb9rWTwGr9MHUiCOA/KeI93Neqpee432v0bacdx1h4n4R19FoSQxjUSKhho4DSXE/GWtCNrEAIuNhzdEvesCHi+Lqv0txw3qlQZ/9qjnA9uprsLHtG04qgtAme5Uz1s9cFCXFBu3gpRh2a1IEf62FBmyDV7DBz1JdkougxADZ6Y+fZ3l/WbGlcK0qrKyups7Ah4YIY++AHNAIl2kgrYZNY24qSvnEBrl7O0CAZD7ULRcFaBxfSdjnnlimhF1JDAqNR6FclbJBS6jMVqs+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9S31FvoS5RJORSixrzSe5pOH1nOHPhjYTOkyu0+4T0TTcwjy1sJ/keaP15Ti/SrZ9k3XQOK0syH5LEVaThNXp+RaOhtwrgunUrEkMRu3Pc3aIc8LKG1oagIgNv+hOIJEmNiv23woy+JkPU0ZIkz77Bn7/412myUac7AR2Qka4rsKXXj1iWqcHnr1zBwbWXiOlxK5GHIi7eSYsC5YKVy6P/I0LcryqbDoQQXX0jrjBnXYAe8GF+22AVH7RWvRqgicrPAdAJ9mfH4fRPbkL6mZiZGgaFI0P1CiPPbZa9OeI/FK3pK/OIb62xqlw99d6hCRHT0jyrXUONAQnww39XCGYSFktnGz8WhQENWsAfHOldID89mXP/2rcc1TrU5Wpp0cbEF3lT2badnJJHuPUYoN0RBBzevOLz0s6MNTCGXXq4Uv4PPW5rT2SJk6oBunrfmk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:49:31.6982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a09875d-079c-4358-0132-08df08f90408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430

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
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_user_fence.c |  70 +++++++++++++++++++
 include/drm/drm_user_fence.h     | 115 +++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
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
index 000000000000..0f229b7210a9
--- /dev/null
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -0,0 +1,70 @@
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
+static void drm_user_fence_do_destroy(struct drm_work_fence *wfence)
+{
+	struct drm_user_fence *ufence =
+		container_of(wfence, struct drm_user_fence, base);
+	struct mm_struct *mm = ufence->mm;
+
+	ufence->ops->destroy(ufence);
+	mmdrop(mm);
+}
+
+static void drm_user_fence_do_work(struct drm_work_fence *wfence)
+{
+	struct drm_user_fence *ufence =
+		container_of(wfence, struct drm_user_fence, base);
+	struct mm_struct *mm = NULL;
+
+	if (mmget_not_zero(ufence->mm)) {
+		mm = ufence->mm;
+		kthread_use_mm(mm);
+	}
+
+	ufence->ops->worker(ufence, !!mm);
+
+	if (mm) {
+		kthread_unuse_mm(mm);
+		mmput_async(mm);
+	}
+}
+
+static const struct drm_work_fence_ops drm_user_fence_wfence_ops = {
+	.writeback = drm_user_fence_do_work,
+	.destroy   = drm_user_fence_do_destroy,
+};
+
+/**
+ * drm_user_fence_init - Initialize a user fence
+ * @ufence: user fence to initialize
+ * @wq: workqueue on which to run the worker
+ * @ops: driver operations
+ *
+ * Must be called from process context with a valid current->mm.
+ * Grabs a reference to current->mm via mmgrab().
+ */
+void drm_user_fence_init(struct drm_user_fence *ufence,
+			 struct workqueue_struct *wq,
+			 const struct drm_user_fence_ops *ops)
+{
+	drm_work_fence_init(&ufence->base, wq, &drm_user_fence_wfence_ops);
+	ufence->mm = current->mm;
+	mmgrab(ufence->mm);
+	ufence->ops = ops;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_init);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
new file mode 100644
index 000000000000..9b92498e6009
--- /dev/null
+++ b/include/drm/drm_user_fence.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 The Linux Foundation
+ */
+
+#ifndef __DRM_USER_FENCE_H__
+#define __DRM_USER_FENCE_H__
+
+#include <linux/dma-fence.h>
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
+	 * may be accessed safely. If @mm_ok is false, the process MM was
+	 * already gone; skip the userspace write.
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
+/**
+ * drm_user_fence_get - Acquire a reference to a user fence
+ * @ufence: user fence
+ */
+static inline void drm_user_fence_get(struct drm_user_fence *ufence)
+{
+	drm_work_fence_get(&ufence->base);
+}
+
+/**
+ * drm_user_fence_put - Release a reference to a user fence
+ * @ufence: user fence
+ */
+static inline void drm_user_fence_put(struct drm_user_fence *ufence)
+{
+	drm_work_fence_put(&ufence->base);
+}
+
+/**
+ * drm_user_fence_add_callback - Attach a user fence to a dma-fence
+ * @ufence: user fence; one reference is consumed on any return value
+ * @fence: dma-fence to watch; one reference is consumed on any return value
+ *
+ * When @fence signals, ops->worker() is called from workqueue context.
+ * If @fence has already signaled, the worker is queued immediately.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+static inline int drm_user_fence_add_callback(struct drm_user_fence *ufence,
+					      struct dma_fence *fence)
+{
+	return drm_work_fence_add_callback(&ufence->base, fence);
+}
+
+/**
+ * drm_user_fence_cancel - Cancel a pending user fence callback
+ * @ufence: user fence
+ *
+ * Return: true if callback was removed, false if it had already fired.
+ */
+static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
+{
+	return drm_work_fence_cancel(&ufence->base);
+}
+
+/**
+ * drm_user_fence_cancel_sync - Cancel callback and wait for worker to finish
+ * @ufence: user fence
+ *
+ * Must be called during teardown before freeing resources. May sleep.
+ */
+static inline void drm_user_fence_cancel_sync(struct drm_user_fence *ufence)
+{
+	drm_work_fence_cancel_sync(&ufence->base);
+}
+
+#endif /* __DRM_USER_FENCE_H__ */
-- 
2.34.1

