Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AD1B808
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413582; cv=fail; b=dkPOH7KlD4J90rnu5pl9h15NItHKFN3osB4ca03MXlBBXuOUrgvBykVqJvu0aNdZbOYMRk9TKMs0PEGQShjKhYg18k9pb1d8p5TYH4RsC+lYhhaILTB/lXscFZ4DIAx4Vl7H449D3JF97XdkQiVjQ12cPSHyFrtRSkusRncFwqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413582; c=relaxed/simple;
	bh=uXNmO6SZ4Uzix//WkpS6etf+QfGDqEZD2vTpUpA0Qt0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzSwbzcol1ldgLiCTJJ5kBo5rD1M3OElgImyqlsdveMTRuojlu0G7f8jYZYB1PQxUXgAkerIxUwfW8TyWgHWEpAGry6lGggo5/LEVYZsAEx8ITqW0wFN+9zcfbteiNwJmSBUJb8ar38yrkPjcemcphOdzAj9LzJwxytm9eys2d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yjAkvI83; arc=fail smtp.client-ip=52.101.48.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yjAkvI83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZokJlvhzuoXkQwSWmc9W+/HnaFEteadGtTlCMXa4mVoWiqN/P9Wy3CEqt7LNQymxT4K7vFoHSE6/71pbXMEh3TbnEZoJA4pnA3/f5uCT/DUT9OxNh0NYCa83fXw1cVHQKK1HHUJPFUGddvPusiIdWLKvI46m55YBLKX4Ass7CUNIGQ9eP8o5iQ2Lg9OWkk93lqhp4TNzTG2uVwcsjRqpuynYvmgXFAnaE6yoQs08QxpYb9SRv4WOIOjnpPgKSLSIpl+SJGS4YS2283bbRNoSq6GnMhRIbmzhU2srbqq+QUlC980gvrg/u0Talf9b9KmcvQhF27NzKZhchygi4sNhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS7O4Ouw0US0RPcstSMBP5x/6hEJFag8ZZ3cIUJuXd4=;
 b=YfQBMOICA0DFsljFqvqM/r6TZcgY4MN8dPb0zElk0FJXjpW71NdxdgcbgyTqaGJHcCrv7LaTpPAv4Ct7jGq6t5noYEYNQFt7PlDPaLC4jljy/nGb6SUnFytQHydLfNYYHNMU4SWQm5RxBUe0wPB5VDtJIbbIWeR8yPSyULN6jJwUujdhb0WcbI/M/P6GvWSL8KCsnQoeIiUN8Pyjb1zrzPr4BAKXtkuyilt9u7aK2/hZpvv+H7FDmNiLmZmxItsvkdjbZDTZFMyWTLjVZ0LYCQc+6HTMId5OdRPCvJ16K9Yoa4nv9FIe57RzMlPabaNW97Ezxu8tYba5pDHXJXSICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS7O4Ouw0US0RPcstSMBP5x/6hEJFag8ZZ3cIUJuXd4=;
 b=yjAkvI83kxN36jt86uHqKDjQFoWgchrJZ7/EtrXFNA8TuJvTX8SK/5P+q2A6TE52xMB5dsbg5OdkpJj82SG7ViSuRlSq24vMgcWXpgbkYlB7iEVIPhsPWsKleV9NLhnRucBYRw41+MtVCMvqHLDryiGY2cEaGSfUd84yaHQnEnU=
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:32:56 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fd:cafe::54) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Thu, 3
 Sep 2026 05:32:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Thu, 3 Sep 2026 05:32:56 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:32:55 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: Add drm_user_fence helper
Date: Thu, 3 Sep 2026 11:02:44 +0530
Message-ID: <20260903053246.190483-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903053246.190483-1-srinivasan.shanmugam@amd.com>
References: <20260903053246.190483-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b76992-62dd-4e78-e0fc-08df097ccf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vWBMSr2ZXaZ2IBWpKdLYP+5SMovWx9Oi2d3dyoi2XNO1czMghuXTLDQE+31aqoXVcommBY85JpBucePR8+adKXdovUBdbJWPQLvk+KpeEd3nSCi6HYLaEd8qSCVVeC6c3E7r0ZE47TFSQgIsFJTpqj1s+huyYJxcrQ886lRncoc0osnDlgJUeK325xVnXNgGmMHzZCJci+oe2dQ71LDAGQXBMLPgYTl5u8Hmk1OircnxP1EM2NCGGHGAvTbqJlX7SeqOmElXDiAH1t5j4oaNUzYXKMIJ0iRMCecVtrtmHUt95DkB1m+x7fxfVVAfHvbdi34rxWDUTeMNQoluUMvj6ExbHQpA1oi8JxaN7y4c54hXKw34o2tKbw1Ov18OVWUbr3o6jAwlAIanZOYPjGqFetMUnu/sSR9wg09OzbpiOP/Q+Z391va2Ik8OmyLcor4NhiWKqpF+OxItrE62TXzFuxMberVUgNOyM3cfrTYmic2oS+fgTncguH8PgdvgUpQ2MJi/Z57wcSfYMcMfIwHwwU7JEPbVPlLm7W12jR6WkPzfzO2XsrrGgkt47SxUHWtI3uNnPqiPlfjB06t8P95hLSt/CFT3J3VDjnjsMvX+VEyy5G5auyWWwlgyK8WQFUH0z/hlQFZHz0Q9z+jg0WPl8IbKOE1PDTr5uJkY3/O78S7gt6yf/5Whv3TrjFHOCLAsYzu06F6hg4j8iEjLPE4KFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tC1j5eveUasAHepEpanT9KA+t1M509jrQiHS4QjQv68AtJPCmB3OULgw+nejvfhm3vbiVGTFT9ZmUfi1BpVEIrANQtJyCTkMPwzXdTdhJqWs23QgLzwidbUfFNMF7nMevE08tQeZSNF7A0PQwGLvEgOnfkJoNl57ta7vMrXtZuZaQzn/XNAIbhDr+zOMlVUwTNKui03rGdFG2WASHDWiy0cF/Mx5W7RLtXcBtGrehpfz1jmGtCqJv0Ot5Hu8CEhrK2zeo3YQOT4XJO0SnLipKPIRoaimOUIOQ4ZxE8je411t2KyDhjandtE1jEsYpDY/ijUxBvle1DVIkmRIRfouUUpfe4F+re4Ka2KZgu3eKLjceOClBSMiurex74uJuRvvf8CsMTJndI2BeElaI13pTxjjzHPb5vFkVV7Bnbu39SIvIT4q1ZavaJCfe1Bi65Cs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:32:56.5161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b76992-62dd-4e78-e0fc-08df097ccf21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388

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
Change-Id: I09da42c688392326ed78235b302fba893e570eff
---
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_user_fence.c |  70 ++++++++++++++++++
 include/drm/drm_user_fence.h     | 122 +++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
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
index 000000000000..d35438eaa9e2
--- /dev/null
+++ b/include/drm/drm_user_fence.h
@@ -0,0 +1,122 @@
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
+	 * (copy_to_user, etc.) may be accessed safely.
+	 * If @mm_ok is false, the process MM was already gone; skip the
+	 * userspace write.
+	 *
+	 * wake_up() or other post-signal housekeeping should also happen here.
+	 *
+	 * WARNING: Fault-able operations such as copy_to_user() may block
+	 * indefinitely if userspace registers the target address with
+	 * userfaultfd or backs it with a FUSE mount. Drivers that cannot
+	 * tolerate blocking should use copy_to_user_nofault() instead.
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
+ * @ufence: user fence; caller retains their reference and must release
+ *          it via drm_user_fence_put() when no longer needed
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

