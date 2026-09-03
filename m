Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811D1DE4EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413467; cv=fail; b=XS+77uWQt+z0/gDYHoPzukPxc+cI8v8GyuC5S4meZaNM4pJ6EdXqcwQwmAC2SNnps4/o5aXkVS28s7+wYbzWT1qhXdfrXXpoPYj259QwTTwiPIVsMPMwYs3i/oHf6RWGVQpburizB0RB5iCVvnajADMRPly8INQ65gzq+QU17pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413467; c=relaxed/simple;
	bh=8lPE3x346Ix1oyY29PwH2+JaINySDXHmaaWpIrFDcrI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TKXhwmWL8jnQf5HEQc/rMZBTNJdhBmyWr2o5K318GP9tSR9gUew4nQvNc1XK1p9E2Z8kz8ub23q4+oLq1u95Yw+LJMFBGg4sMmtLXVFQql6GlQn7tyT3i8O2h0H6llRYWMU1q2GNBbdY3ZQmBNH6NzBPol8SgPwF4G67kg31RKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c9atgVCr; arc=fail smtp.client-ip=40.93.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c9atgVCr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkNLxpeJHTUFroKRuZSVWA9mTlWyp09MdiN+lmRQtQ76vZu3PI+R5ZhYk0MjoadUpnudjBGr2WUn1nLSEQXdP5KgM0vwlVKT85DP0oJMFuJdHI03bOtH1Dq3NLKv61RoPXOBbkyPt+E3891yX4OXwkykHbuE809UYhZZK7VqsXc8U1KwsjJFZuU7qEXXd2sUySlHIMvySNVeOZ3rhq9w59gLQq56y7/V4qp1S+I6B+F51sHMyvPeGpDD5w5AH/ijbEnf7s62pMQiejwTwZt7AxD55lipS1LFBAKuy0Yf0kcndvuqfIHtQYOejfZRKCQYoqH1bg2qBNjIc9L0WD88rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=CCBtHxzdvmqKNWhpacQm1ONBWyXcgjcJdcJ5bTMRVlEBU91Jk+hbApoymHFBCwuqcUqPy3Hvr2WY2+6RHdu2VYGJzS9oYwORllvfqK50dRXs9HXPlHMyQnt2YdHIc0N/csb4tPOzuD3bQne3vfCbyeEwfVfrC2brJay9VLKHfGM3gXKovzbE6/lDkXQsRZusBXh+0U1JoUqXmvmhmLIxsl4ZmtWcXben7/zrkJqZGRVFTMJXFXe54HhpARJS6VulQDaU4m9EO+QJ4+GQOLHcjeirHyxlxKEAyuqQ84+2hh78w4ljHtTvAebQvzJ5WVvyAxV36VeXNOgJaLDhzPKVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=c9atgVCrJ/lMVTZuoGZIDpYApou/FudhDbNe7wZyJWv/nsDVKsgIYNjku1UilsXvdFCD6LvzftItbtoFX+2Bfipzxr0kDTY7+y+o//+87v/OEQe1xq3EzJg94sixc7XSi52jBMVfXhEdexkcvkfIxtLv4HgwiDkRkSejb8W6oL8=
Received: from CH0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:610:75::8)
 by SAWPR12MB999317.namprd12.prod.outlook.com (2603:10b6:806:562::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:31:01 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::43) by CH0PR04CA0093.outlook.office365.com
 (2603:10b6:610:75::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 05:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 05:31:01 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:30:59 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: Add drm_work_fence helper
Date: Thu, 3 Sep 2026 10:59:42 +0530
Message-ID: <20260903052945.190435-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SAWPR12MB999317:EE_
X-MS-Office365-Filtering-Correlation-Id: fe943912-5b8b-47ff-4e06-08df097c8a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	C418pVGTGb/Q7ZraNWHbLdzq8c1FAHuwNVaNjJOGSETuYudW2LFgHd4ZXp3FKixk9zsOwtr94ESKv9mpAdkxyq7MOpvp1JzKGnyZsdkDYhAdjR52pvBRLpWM/kwBA586UfskRXOnkYfsRQfhWa4BOM9ifIfu+b+3xmhsXy8QbOf/TU7sTVWwbOa/95xTBxiQYDhG9P+M+nXNxxGedJ10b5SUABQHJrhDORe756d6lPfrB0FxxOfFj6//bkFdAYhDb4I+xOCpkD2sJgDzJ4SatFU5vsEr0DRt5VhzgLIjwl4W6Do1wsNRdksecQuStXQHl8ebYUj4YKYGubpizgjFOt1JUHb4YB+jK2v9bn0GfPhivEWni8urjXpOYjg2AGm5f/j7YLOpUUCmOSbxh9nIa6UZzuKBgZ0W+0Zki6DPLmtjOqrGEADcREQt4dogU3NoJG4KlitbW3EnN9YWbW8jrWz0f38/ggffvdC2Uslr4xOG7WbqyYU2xT4bqfWxproFN/FgZSgYX5z0ZA6FqHoxK7hYEdp7TEB3gGvISQJ2CzJlFNPUHzheStATdNCypdcOxPs8Ezg0CUmUdEXjDMR1BcNwrVD6UdQN6sdqyLUbV373LQ3XMHC6rMI9B/gtlTA18Vn2tW6Ikq6i7O0cOoEUEC5LlayHAk+OcIoumBeouLxV/owdh8HrHzadzJ7zDpue6FnEufOfjoNPgko8PoL3rA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PHn1xDjOeiuYS/e90QZjscaEvlrRb+59WDcD0Y2/VcnubUFp6DUBV+j01wRj7I5c5X2akUeUfa0+dpSf9SgKA8JUpWJK4sjnXTGsC+8lCHyW8/5sPoghrb8TFpyyCt6XbMshEBU+8ta8DtO5fcFWjPLmynGdUzhJu2hd84eDiiT2WWq6ryXJp9Q3kYwDGGI8rDWnnCkEohqMXk3lW61pMMo5NdT3/vYGr5KusiGUqEWeJIjPXL3l+OiDl+SUUmZxU7BJlRnROZnLBAmO6R7Y3Y/5YtGgHRY1fPhptk2ZusmCmKZUbMUZqfDqCGDqNCSBvlB7kFgDEBWRWRq+NjFqiCZhzSH2YX5MWLB6YsxclfKOC0HnzftBkV7rAMX86q+hp4oR/R0IiMb2BS6QMoLAZtI3KBG5BG5MeJWMdyxur+wYZgtC5WoW1DOZb6PAz5L3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:31:01.2732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe943912-5b8b-47ff-4e06-08df097c8a73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999317

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

