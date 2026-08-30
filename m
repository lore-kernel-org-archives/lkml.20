Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C59223323
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059571; cv=fail; b=BYSLPmFmBj/7l9HbEwMdfCRbJr3kxjTnucV9Wk1QKUkYnDE5hS15y77bJHtj2jc2L3r8nSbO5kZZTrm2nLDwTIdf6PUa569l89dtgIxQOGOHdyIJGOmGn+A6JegCR/NmGWQo3jZ0jilZrGiTk+oqiibXZn1RD3DIiz44rDeS7fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059571; c=relaxed/simple;
	bh=bUB1JYelTJAJXBiy6SBVci1RIrLVtU84phF/I1RZN7Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIyiQekjfEiczeQMUzyhIIcVh0Aqh7UrjSQh2t5xKNgUhYGUWXeXr6wCkLB52TuSLHTxahhpMJMos+RRIfw1f+3sTaU/81+IWUM5eVbtVuGuc5HH6IjyqrZIYcOAys2gGmLFld5DF6wRpweazYnGB4h+9iNQnKGkJ2iVfjRKcDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4xsET+3U; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4xsET+3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sojw/0PfKybNpZ9wYpRSE3iLIiqQk4hNeq3ycuhRDI6b9lwWMmw8BXdezZuhg2OUUWmhowSHxpjIKemJgwDRDWF3Ht9KJgMlDuBFpzNOAeJSMAM8JGH3of/jZNe1GO06Hm2yHdJqS+czcDyPjapuoVuS2LBML1BgN/HtxYnqcdxo1oe0WKJopPzQGRfUCyDtQC30eXmf0On/N7TGHP0hepvJxdKe400vXiWkKgNhKfFx2cChN0je7w6T4P/weIaB/fwZVsCGK63wq1ATTU/SUZXMxWRTODekoFOqBmHSkEe9eptxhTR9dDYIFO3bZ34GE19ULwK53E3U8BG6Tv6O2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRfaVmBoOKBq1IO/bthKOYct79drrsBgq6fg0yqcLP4=;
 b=Uzw9y56UCwl0gPzuNp7P65MwzZeWOlL66/F87rztYVVv0d6VvdldAdUDwdAHl3rT7E49fA03A0CcDPByW+1wQCb9ofVmPb4WtQ9ZDC6msbpKRyyTaUXfX0e1awA9hn+3V2sTH/tEenugeTdewKhLN4MMy8Mmez94xRXXfCboxHlpz2bjJOMwnX9CgoaK/x1VEAktJx7IZ6y3HuWpAOuE9mu/0460f9Q2sjlB9Pjei8lm8T8oNMexaE88sy5GypFC2JOePHysAmeSc5hiHAw177e3rfVHVJPxHui8I3t6o5UdFwkoB9rjketBIg6Rgut0t0/V9t1dLPwBhXRMFtskfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRfaVmBoOKBq1IO/bthKOYct79drrsBgq6fg0yqcLP4=;
 b=4xsET+3U8u+dyj3X5af1uzA8mi/oYCM587fzFHK39m/fy0z0NCfqmQAI6GIdnw+60409ufhU66bLXsz99qLS7V4YIr0kqzuMYtYfC7haRVGEd7tAGOeNQZ5lQY2UDqKsZb6IKmzIU31PReO1rsJrkPu6xLimwbI5SM/MZ6m/Pq0=
Received: from MW4PR04CA0296.namprd04.prod.outlook.com (2603:10b6:303:89::31)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Sun, 30 Aug
 2026 03:12:43 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::47) by MW4PR04CA0296.outlook.office365.com
 (2603:10b6:303:89::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 03:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Sun, 30 Aug 2026 03:12:43 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 22:12:40 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: Add drm_user_fence helper
Date: Sun, 30 Aug 2026 08:42:23 +0530
Message-ID: <20260830031225.69819-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830031225.69819-1-srinivasan.shanmugam@amd.com>
References: <20260830031225.69819-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7ad41c-c34a-4528-c697-08df06448ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nr2JnVOWgw4aBWRwc/9esdv5qedBtB6GZsZxGBCakbc6OJ4/hmQdmi3suNNelQB2P8A6KJ/HATi1YtTgPN37ypB8Gib9jVw3vQJf2/4/8Pv9hyFB8lXeZ713hGjGUswDcqUnX+Jf0Q1PGkoE04V1ewWNg2Fk7ccB1DXC43rdwD4XnP4HgvIcRtlYUib60QcE2NZ8o61W4reJqk4Z3L/xb55ezYUn5bxwlF/sYEncUW/ShXPcjYAKTGVUzrGVgcj9cVCA1I4aqlGqMRVvp47wYwSfF/6FFjmclSfQONtDWOl8YVNUPlHUxxJkBZ4qHuTK8gGRJ5uMkTamlCqqwFGYNqOiaxjpwec3EC2Dk9vytkNoNOkNSU6gVeKRuF3q57K95TQcEwDELiCdkqJ9mHu0rUNh8bF3PiaJOsFiljxEeFYglZEfIotwzOwWPoT29YoCmKfNrCebazwjucZmE+qUZQrasFjqqwMGiyw4JB7B+9IkswMn6Q88dCgCz6rQgjfQog/e9YHZpDPWSu8auTJJJ0Ui/uq2pHR/+kcZFtOzc9FH3N0BmXtQCx3K4xUkvls/agS5AiWmccrNMbN2Jx0wtaZ2XhbQ76cqHRcosGrp9rHPTrZB/qNDdf5Zh4Qq/h8t2RgXxFpipash5DENJxSjtj8TBuWPz71Wi9pa9/g+2JzjcCHwrgo6A1Dohh2OLOTP2TOJDtFYSNd5g/5llwPrAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tI4jH7xEYmJcbfu9k6XlAFxgqMBxAaEFgCqWcszB5NAnzcKJl+F0vszSICGBsL7tynDCJikZJ+pwBH2Q1gMCp0Q6tI4S/eRxnbn5bhikAxj1z9PyEUMKol2HNGU3y+EFy+QtZSyJXtgNqKZaDxRhIBy5fC0aGNZ7L32C+I4JKkcugK5SytbfUl5fErPg9Qj3F4ZKdYjMCoPfA/VRz2PhJH8SRpP1UKimoXLtUFaeKZnAfyuaFxoQ8bsqOKaLeTp867lwrDWpaMMmxxKP4C6TyCZDBu2WVqNILRzXzMYIgO44QjEdRRoU3Hp0nj0z3uYFFlxT8yQTz5RFLL4B9OlE4f92J08z4jqeTqM18x9vL1/juzO0OmmuQaHhmyZwuFwM4uvlaTkYZyKC2mBRtgkb3Zq+EyD6QBnasrnsryOcJMe/PMLe6BhbJYnKrU9cdx/h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:12:43.1685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7ad41c-c34a-4528-c697-08df06448ec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480

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
index 000000000000..9f6327406d3e
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
+		mmput(ufence->mm);
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

