Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4635C1AD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413589; cv=fail; b=XjmQAxn/lKfdsBPVVBU2GKraoW7gdy0HazZXUG3jTTifcIwisUINSzQ+4LvOy/IKZYZAeAYMjmpG1wK7teuta68VrdPXVIDSu3JMGOwzuKnCk4MQBUiHoDu+WFuUWDPq1DYOWYcQf6tXrOb69x0sZ9KNeZGiw6aoefhFZ2udxl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413589; c=relaxed/simple;
	bh=8lPE3x346Ix1oyY29PwH2+JaINySDXHmaaWpIrFDcrI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OAql42DsXIl8GZEODShYBSxSDY08ft7h58ra0qEM4d0PTFW7xAT1cFkTwORBnPUdIblOQSEz+A+k3duru13bknMC4urEdzT8o4wflC69HwSgXKhPZmZIcNdVEvmuWoKXWlVtsOBQbsYQoA2CoAxGOD7Xr/7WICRBVXuJhN73eZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XFwOp/y9; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XFwOp/y9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y59hSmH1d1ufumq2IsdRmt03An0pZjwWjWr6GbLkDjmJ3V/qD9rWCLXWZsiHvYKVVVmcgP6tKcGzBSHDziDMNTjE3TYUUeJxNEJQYGZQbyleDyxVDCQmFYhtYTtqkM3EDTwVWWgW0S+kMAVjEWWH21knJQhsgqRMY76lK0ArzgreQuXk8WWVN5+/uoGnsUAZaRxs97IwdsbbeTyirR8Xx9aHGb6jkqgNBC6X9G67LG6GZ+PRNflWeaq2EpgHRJHm5q9vH/RiRFcPr6C5cOwDXgsbci0Bbn8bFpJhn2K3iPnmBAigZ24D+9Xe21L9VXHrfoSBkOICPUO0GpUYLZ7+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=eWtF6ct6oJ6PPVI/crMrEtUPvNsDaWlGd4pfVb+GEWI4p+ISlImOQeeGI4EW1xNdwAiu4oJqJcCahcbnl0ZNVBjv2JQoYGlgw6ULJ5f58p2vOBs+ncpUCCkk6CMKbzhZAHiHDPo6GMfrTQPtx99wGiQp+0lLRqC66zA3sH4s/4aYQnYKLz9Jei5IiydInEqY6Yq6dM61xZjUkrIaOkMB95bvQ0BauSXOzdccyNE+ZJXprBGz72LJrzjtXFTQYHhNk4ryS4oXdsN2+4Lo3psjcKVD72r4y47q7zjD6B3L8NAa5d6DyXGPwrWMs8kT98Q5yEtG72cy0HqObiPXSTfzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=XFwOp/y9VRYO2jJ+HlqeqXJ2pUEqdAIO8ohQfLrcnxrOSjUDbt88IQYEFRX4t0j4XYiu/hOru3JO8xUGsoP2DQmz/8BXHQh6iPiHnPn+BQNzJswraxPh9gH6ecnzlvNOrcZhir4VfyucgErokP60XzWHn6sE1bP36rY3i/poKkw=
Received: from BN0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:408:ec::20)
 by PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:32:55 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::3f) by BN0PR04CA0105.outlook.office365.com
 (2603:10b6:408:ec::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 05:32:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Thu, 3 Sep 2026 05:32:55 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:32:53 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: Add drm_work_fence helper
Date: Thu, 3 Sep 2026 11:02:43 +0530
Message-ID: <20260903053246.190483-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bb7b15-e5f7-4d07-467b-08df097cce6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	BK7I78UAI5ZUZqQHSdQeG6wA+/Isgx3uwthBk3AgMtWyf7ZMCq6bI8UupTbJwpFKPRxLMvISaDpEp4L7uOrG5myNZT4luw8ngCf2dsFFwXlZaHvkrhOev1fKJE+KPRBmtmYdB44ysbgD+j4DVINTgEDuOZkfumhu+v0acvduVLt61QtPIBb/h3Q11i9wB8du9py8r5PQZ7LLtPkyrulvCjqwL0xcgEfL6KxmVdzhL++Gx5i1wg1F+ngAiABSW5UsIUS7E+Eq1AmcQh3x/GPglsPYLTEYzEYfdkeNe+8BYjNI1VUAd6V4sLhM056KkW3U6vJT4Cp2SP8y8YSCB3rTbJnSCBktZ68zgaB6YDle9y7csGRgd1Koxu4EGRgj6eUyVP1Qxcu3z/S7aTz1lSn4Wxb9QeuCYCE6siOVEcv4Vb7Br66ckksBqt1IoTmpMrf4zRlX/kRTljj7iC6uHynZO7cgZlzzfhtg1AewwK0awAXFvB3A4NmK3b7xExhI51Jctog0Xc5ez5XnZ9+CnNJ4YxTNiVKRqFyDyQ8GiYK572sE0uj741cByeDLmW6h9Y0nPHbMkjUNjjv1y7ydgOWVPoCJUKh6Fn8Jdo7Y9cn1OX+7+ZGr3wQiNLkEW5r27kodZnw6Vu8oy1BLpIk1k0N/2pLhxZ9CYn+L9cYhKidm7O8YvaiyVcHuAgNI361wmgVReErMr2J5Y1tzaexoJS2cuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UqlwBqCn6HWzdtBtuP2mDRjSw7MtGGNTFkvO1gB/71nM+c/ZEW5D3KwKMDSsBLrBuetklXno0/W2bFqCVDOEl0ud+jWgPB7af6RD8VPlZIX5axHSnF8+hCE/HNAP/kGATIWGh7Lu2YRMb5rkBlVzGPbSuH3u4abHh9N8jVtdxPFVbxK4/BjbsDBXfE8uqfld39xloxKRh5GssugfFKKZu4dI7kPPfauR6QaLyRd/nVCpndCTJ6o/uE1iry0fyK+eJs5OQ3OyuyLT76VT4kTHxDQ4CFYOWBdWtYI76Um+ORdtvd7R8PyKlRjaKoOGzxwdI8dO7F++M3kxp/1/CCCgwxosi4mujK9bUvkI9m0+jMiHURhEuvLuKfNCYxYC/hfazMWAN2H3VK99uLJgd2IcxE/AYrdVGYeqzYRmlegu4OFkXDQrZyz40zmXxtqyPQZS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:32:55.3400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bb7b15-e5f7-4d07-467b-08df097cce6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817

GPU drivers often need to queue work when a dma-fence signals
because certain operations (copy_to_user, eventfd_signal, memory
allocation) cannot run in IRQ context. This pattern is currently
open-coded in multiple drivers.

Introduce drm_work_fence — an embeddable base structure that handles the
dma-fence-callback-to-workqueue pattern in one place. Drivers embed this
in their own structure and implement ops->writeback() for the deferred
work and ops->destroy() for cleanup.

The helper manages:
 - kref lifetime
 - dma-fence callback registration
 - workqueue dispatch on fence signal
 - safe cancellation before driver teardown

For work that additionally requires borrowing the process MM via
kthread_use_mm(), see drm_user_fence which builds on top of this.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_work_fence.c | 184 +++++++++++++++++++++++++++++++
 include/drm/drm_work_fence.h     |  69 ++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_work_fence.c
 create mode 100644 include/drm/drm_work_fence.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e97faabcd783..c5be8e80d0c8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -72,6 +72,7 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
+	drm_work_fence.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
diff --git a/drivers/gpu/drm/drm_work_fence.c b/drivers/gpu/drm/drm_work_fence.c
new file mode 100644
index 000000000000..482eb3d4475f
--- /dev/null
+++ b/drivers/gpu/drm/drm_work_fence.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 The Linux Foundation
+ *
+ * Common DRM work fence helper.
+ *
+ * When a GPU dma-fence signals, drivers often need to perform work that
+ * cannot run in IRQ context (e.g., memory allocation, copy_to_user,
+ * eventfd_signal). This helper queues a work item when a dma-fence
+ * signals, allowing that work to run safely in a workqueue context.
+ *
+ * NOTE: This helper consumes dma_fences but CANNOT implement
+ * dma_fence_ops. Work items queued here may sleep; dma_fence_ops
+ * callbacks are called under the fence spinlock and must not sleep.
+ *
+ * For work that additionally requires accessing userspace memory via
+ * kthread_use_mm(), see drm_user_fence which builds on top of this.
+ */
+
+#include <linux/workqueue.h>
+
+#include <drm/drm_work_fence.h>
+
+static void drm_work_fence_destroy(struct kref *kref)
+{
+	struct drm_work_fence *wfence =
+		container_of(kref, struct drm_work_fence, refcount);
+	struct dma_fence *fence = wfence->fence;
+
+	wfence->ops->destroy(wfence);
+	dma_fence_put(fence);	/* NULL-safe */
+}
+
+/**
+ * drm_work_fence_get - Acquire a reference to a work fence
+ * @wfence: work fence
+ */
+void drm_work_fence_get(struct drm_work_fence *wfence)
+{
+	kref_get(&wfence->refcount);
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_get);
+
+/**
+ * drm_work_fence_put - Release a reference to a work fence
+ * @wfence: work fence
+ */
+void drm_work_fence_put(struct drm_work_fence *wfence)
+{
+	kref_put(&wfence->refcount, drm_work_fence_destroy);
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_put);
+
+static void drm_work_fence_work(struct work_struct *w)
+{
+	struct drm_work_fence *wfence =
+		container_of(w, struct drm_work_fence, work);
+
+	wfence->ops->writeback(wfence);
+	drm_work_fence_put(wfence);
+}
+
+static void drm_work_fence_queue(struct drm_work_fence *wfence)
+{
+	queue_work(wfence->wq, &wfence->work);
+}
+
+static void drm_work_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	struct drm_work_fence *wfence =
+		container_of(cb, struct drm_work_fence, cb);
+
+	drm_work_fence_queue(wfence);
+	/* Single ref: wfence->fence released in drm_work_fence_destroy(). */
+}
+
+/**
+ * drm_work_fence_init - Initialize a work fence
+ * @wfence: work fence to initialize
+ * @wq: workqueue to run the worker on (must be ordered if sequencing matters)
+ * @ops: driver operations
+ */
+void drm_work_fence_init(struct drm_work_fence *wfence,
+			 struct workqueue_struct *wq,
+			 const struct drm_work_fence_ops *ops)
+{
+	kref_init(&wfence->refcount);
+	wfence->wq = wq;
+	wfence->ops = ops;
+	wfence->fence = NULL;
+	INIT_WORK(&wfence->work, drm_work_fence_work);
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_init);
+
+/**
+ * drm_work_fence_add_callback - Attach a work fence to a dma-fence
+ * @wfence: work fence; caller retains their reference and must release
+ *          it via drm_work_fence_put() when no longer needed
+ * @fence: dma-fence to watch; one reference is consumed on any return value
+ *
+ * When @fence signals, a work item is queued that calls ops->writeback().
+ * If @fence has already signaled, the work item is queued immediately.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int drm_work_fence_add_callback(struct drm_work_fence *wfence,
+				struct dma_fence *fence)
+{
+	int err;
+
+	drm_work_fence_get(wfence);
+	wfence->fence = fence;	/* transfer caller's ref — single ref, no get */
+
+	err = dma_fence_add_callback(fence, &wfence->cb, drm_work_fence_cb);
+	if (err == -ENOENT) {
+		drm_work_fence_queue(wfence);
+		err = 0;
+	} else if (err) {
+		wfence->fence = NULL;
+		dma_fence_put(fence);
+		drm_work_fence_put(wfence);
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_add_callback);
+
+/**
+ * drm_work_fence_cancel - Cancel a pending work fence callback
+ * @wfence: work fence
+ *
+ * Attempts to remove the pending callback before driver context teardown.
+ * The caller must hold a reference to @wfence across this call.
+ *
+ * If the callback has already fired this returns false and all cleanup
+ * has been handled internally.
+ *
+ * If removal succeeds the callback reference is released internally.
+ * The caller must still release its own reference via drm_work_fence_put().
+ *
+ * This function is safe to call from atomic context as it only acquires
+ * the dma-fence spinlock internally. If the caller also needs to wait
+ * for the worker to finish, use drm_work_fence_cancel_sync() instead,
+ * which may sleep.
+ *
+ * Return: true if callback was removed, false if it had already fired.
+ */
+bool drm_work_fence_cancel(struct drm_work_fence *wfence)
+{
+	struct dma_fence *fence = wfence->fence;
+
+	if (!fence)
+		return false;
+
+	if (dma_fence_remove_callback(fence, &wfence->cb)) {
+		drm_work_fence_put(wfence);	/* drop ref from add_callback */
+		return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_cancel);
+
+/**
+ * drm_work_fence_cancel_sync - Cancel callback and wait for worker to finish
+ * @wfence: work fence
+ *
+ * Calls drm_work_fence_cancel() then cancel_work_sync() to guarantee
+ * the worker has fully completed before returning.
+ *
+ * This function may sleep. Must not be called from atomic or interrupt
+ * context. Use drm_work_fence_cancel() instead when sleeping is not allowed.
+ *
+ * Drivers must call this during teardown before freeing any resources
+ * accessed by ops->writeback().
+ */
+void drm_work_fence_cancel_sync(struct drm_work_fence *wfence)
+{
+	if (drm_work_fence_cancel(wfence))
+		return;
+	if (cancel_work_sync(&wfence->work))
+		drm_work_fence_put(wfence);
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_cancel_sync);
diff --git a/include/drm/drm_work_fence.h b/include/drm/drm_work_fence.h
new file mode 100644
index 000000000000..c8e3c5b9f0c4
--- /dev/null
+++ b/include/drm/drm_work_fence.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 The Linux Foundation
+ */
+
+#ifndef __DRM_WORK_FENCE_H__
+#define __DRM_WORK_FENCE_H__
+
+#include <linux/dma-fence.h>
+#include <linux/kref.h>
+#include <linux/workqueue.h>
+
+struct drm_work_fence;
+
+/**
+ * struct drm_work_fence_ops - driver callbacks for a DRM work fence
+ */
+struct drm_work_fence_ops {
+	/**
+	 * @writeback: Called from workqueue context when the dma-fence signals.
+	 *
+	 * Perform the deferred work here (copy_to_user, eventfd_signal, etc.).
+	 * May sleep. Must not requeue the fence.
+	 */
+	void (*writeback)(struct drm_work_fence *wfence);
+
+	/**
+	 * @destroy: Called when the last reference is dropped.
+	 * Free the containing structure here.
+	 */
+	void (*destroy)(struct drm_work_fence *wfence);
+};
+
+/**
+ * struct drm_work_fence - DRM dma-fence-to-workqueue helper
+ *
+ * Embeddable base structure that queues a work item when a dma-fence signals.
+ * Drivers embed this in their own structure and implement ops->writeback()
+ * for the deferred work and ops->destroy() for cleanup.
+ *
+ * Call drm_work_fence_init() at creation and drm_work_fence_add_callback()
+ * to arm on a dma-fence. Call drm_work_fence_cancel_sync() before teardown.
+ */
+struct drm_work_fence {
+	/** @refcount: Reference count. */
+	struct kref refcount;
+	/** @wq: Workqueue on which to run the worker. */
+	struct workqueue_struct *wq;
+	/** @ops: Driver operations. */
+	const struct drm_work_fence_ops *ops;
+	/** @fence: The watched dma-fence; holds a single reference. */
+	struct dma_fence *fence;
+	/** @work: Work item queued when the fence signals. */
+	struct work_struct work;
+	/** @cb: Callback registered on the dma-fence. */
+	struct dma_fence_cb cb;
+};
+
+void drm_work_fence_init(struct drm_work_fence *wfence,
+			 struct workqueue_struct *wq,
+			 const struct drm_work_fence_ops *ops);
+void drm_work_fence_get(struct drm_work_fence *wfence);
+void drm_work_fence_put(struct drm_work_fence *wfence);
+int  drm_work_fence_add_callback(struct drm_work_fence *wfence,
+				 struct dma_fence *fence);
+bool drm_work_fence_cancel(struct drm_work_fence *wfence);
+void drm_work_fence_cancel_sync(struct drm_work_fence *wfence);
+
+#endif /* __DRM_WORK_FENCE_H__ */
-- 
2.34.1

