Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1E27E1DC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788069445; cv=fail; b=ASZxUEITScV6rTLqJnQ+DRtWCQRHKjdiVA02ST3ZDM/7N7jSxnOGXwxIlaVh5mjjQLVD0lFf/35wlW7jTWxZJeGHI+Nj3utPXL1ghxEkT5MybOtE0wB85p8oM5WdFqqorDaB6hi2nraDPktZiCSH8DwKY3JOz8w0t11iVyw1GtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788069445; c=relaxed/simple;
	bh=Ju7IHZQcbziH9a0NMRzTNYl69hmhD2dHP1kc4efoJLw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yt4+Z7aY28nGfwLzgYo9/wf+GfafTfz7Ta1JNGURG3UGRBkOa2GjFqbnpYM6AjCtE8BJJKjml7oN9ukm5BbVan5w2IbO5BQn+FUURcEsSeoL3FOa54tTn9Bz/PrAnnuZqcZBh0YASKHa0X5XmXRZgVGT3VzVZRDV7UTtJ0lmgW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DZWbbML4; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DZWbbML4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy/pcQQWMCJxdv6ADWDkSIA92UEF6ncxbaOH64NwefoK8TyviZmbdkAQFb6NkTlF8Jvs+nRHruMzoUUQCzzzjrwety7jTmJbztDX+A5VR5mukrszd5iYhuaNKPgZaeo8o+tM5S7hM2yhI3XT7W87vbm8EGkfrsnYOeznelDe524zCAWY+PCXq26BmCvXE8sRgAlxRz0pdYFgVCWDc7bWP7fP15b0h8wMRYng8KvmGR+GebcIdEUe+uF8eoxORrnV/RHtyXG6ysVsE81Tam+/CB2FnozwFQTGDIDS4aTf5nC/I7A2gbA2RWKvZOZcJgBhlmbtqJoGc2KKC/Q9Q//Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d05Us7Jo0mzLRJYfrJ6izhKzldsnuKMA0Ifyl7DQTWU=;
 b=gMkv1+/1M90jWdbwPE9JQObSRtGw5EWfqiRSIafXTxdA0RvEOP5yrtrTQy1CjMMP1UzI8hAMU46trZjZsBM8GlI7UWL3KCP6zZJoSpXxtsLFr8UDwpoL3S/MNyLHD5dF5AL8aKs82uO6N2MzoIls8D1OTvzFP4++JQkI4tlkOHUob0pmxQGPQXdTXtuRx62OyjCheuhlgbIW7+aqEiQuVkB4Ab8RhAXeyYRmYqt+oCRuY44xqJJc2ohX1e4JkaCl9nkxU2KIOjEFmtu7vqb+R7i5N+mnZDWPvLef8rb0DHIDCsQH9wjNc9P3VvoYzqvyUd5sQ81ygcjmwMcaAFaPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d05Us7Jo0mzLRJYfrJ6izhKzldsnuKMA0Ifyl7DQTWU=;
 b=DZWbbML4PZng8vTsCMaFTfAZSP4FPspd2J+pOrxVDpzrxgzpTizsRoC5q5esiGmWorQcn7r0LexcNo2G4YJU9Z/7jWpL7BGk2h6x1IlH4shFeGgJoU/f+FXOKMH9Y4zZhxk6gtAbsYHdNJUlcqlPRNf9hgfJJiBqk52SljmCy6M=
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by SA5PPF916D632A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 05:57:18 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::66) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.9 via Frontend Transport; Sun, 30
 Aug 2026 05:57:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 05:57:18 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 00:57:16 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: Add drm_work_fence helper
Date: Sun, 30 Aug 2026 11:26:43 +0530
Message-ID: <20260830055646.102644-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 6809ff3e-5987-4456-2f7c-08df065b8ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	bXyV6Y0kRhWfRLdv+s0iT+hoDb8KKiTTG+A4mR6Ltv3ZzHUWxmBJxgXcVrrdt3PeCLpeAm6eZkiXI+d9o0wkH+QasRDvXFWzN364kpqALFQ57QO0Wt3G+aYj5lEJZiEQCbIxrPzv+G1JAMXIhDbsuv575K+nCCSUJ9SvcgbUmPy7HZ8GSB2y4mUySJaaCQNBokw6JxdcD/I20u1XW1KYJLxnecUJJ9Sx0U2706XkTOrMHTtzTD5DE2MxzcwnEf2MuYoxStPLzhpGF62QFR1VBJVxjEHkD1rpWm1ZqpofL+LxK0aNf25tBnygkaIDglqCtvlHkAmY2VDoJSWaoWH3K3U/y0nt8TEjAAqMMMqLI3v0UrQe4YNswyDRXTI7PaCa77R6naiaFRmRPMXvP9LfTNCAiah1ctWq7AYQ4GIVqTC596/iX2F0ehIPZKP+0HYklPtlvRIleHWifLxnnz1kRzbqs0qJnKNl4+JVIkoFmsk8BXAm6Zy5pJvFl/WdPT+g6RiDO4t+xbqDzCp/L4DvkGxD5DQUI4oKH7N/a58qJe0FhSTK1/QOyUbuZVmFAxBzU75hNBX62g5SNyEZUOdaslUYstPHcoYyrvQTPPBuGGE62WOhe8hBskmRj3+QCEN5ABkxMWHvuPHViKQObGCTsz4T2/OrUzRqRfsM9jI9EC/U4kkQg/VE3ho5YYUfVciR/WFxQ+3DEMyKaMM9TXuWDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k/Vq46LdvN7dH59p0hKs2dtiNSsmrMM3Vi6r2REUCjo6GRN+Ryd2jIdkpHb85alL1B/G1VwAbx2LsxWg02QfQFq/AZFOwaNTmgAkLu64rJtHzlRQ6M14inSKyB34KlbGCLv73s5XdO3BEUBumu6t9jMYZL5odaBeOje1v/IF7pFyiXjiQm1cobubo8bnaZR+Mqumy1SeROE4ksiPr+IQnFZ+RIIb7XCoqW4sUVkfMH+qD6CDL4SPv8XcUzRBh1FByZl29BGAre3irmfcuyaZJeu8mxqAL0opIf3vOoQAH0qn/nE5l+3eG0Wvzz/4O57GhKMTZIwDAqauYUgvvYdiBjnDNBHFWXZ2CdVoIaOBhN5MZD7qzMhhRpgKMKjSyBReY9nmDmlRg1CW+jiPWQobyj/pxlnsQ7jcqvUmRoCjbMGowb04Z0fnxQKcG6BRlRD1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 05:57:18.0891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6809ff3e-5987-4456-2f7c-08df065b8ca5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9

GPU drivers often need to queue work when a dma-fence signals
because certain operations (copy_to_user, eventfd_signal, memory
allocation) cannot run in IRQ context. This pattern is currently
open-coded in multiple drivers.

Introduce drm_work_fence — an embeddable base structure that handles
the dma-fence-callback-to-workqueue pattern in one place. Drivers
embed this in their own structure and implement ops->work() for the
deferred work and ops->destroy() for cleanup.

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
 drivers/gpu/drm/drm_work_fence.c | 195 +++++++++++++++++++++++++++++++
 include/drm/drm_work_fence.h     |  76 ++++++++++++
 3 files changed, 272 insertions(+)
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
index 000000000000..9f6b779d0fe9
--- /dev/null
+++ b/drivers/gpu/drm/drm_work_fence.c
@@ -0,0 +1,195 @@
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
+
+	if (wfence->fence)
+		dma_fence_put(wfence->fence);
+
+	wfence->ops->destroy(wfence);
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
+	wfence->ops->work(wfence);
+	drm_work_fence_put(wfence);
+}
+
+static void drm_work_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	struct drm_work_fence *wfence =
+		container_of(cb, struct drm_work_fence, cb);
+
+	queue_work(wfence->wq, &wfence->work);
+	/*
+	 * Put the transferred reference from add_callback. The stored
+	 * reference in wfence->fence is released in drm_work_fence_destroy().
+	 */
+	dma_fence_put(fence);
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
+ * @wfence: work fence
+ * @fence: dma-fence to watch; ownership of this reference is transferred
+ *         to the callback — caller must NOT put it afterward.
+ *
+ * When @fence signals, a work item is queued that calls ops->work().
+ * If @fence has already signaled, the work item is queued immediately.
+ *
+ * An additional reference to @fence is stored internally in @wfence to
+ * allow drm_work_fence_cancel() to be called safely without the caller
+ * needing to hold a separate fence reference.
+ *
+ * On any return value the caller's fence reference is consumed.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int drm_work_fence_add_callback(struct drm_work_fence *wfence,
+				struct dma_fence *fence)
+{
+	int err;
+
+	drm_work_fence_get(wfence);
+	wfence->fence = dma_fence_get(fence);
+
+	err = dma_fence_add_callback(fence, &wfence->cb, drm_work_fence_cb);
+	if (err == -ENOENT) {
+		queue_work(wfence->wq, &wfence->work);
+		dma_fence_put(fence);
+		err = 0;
+	} else if (err) {
+		dma_fence_put(wfence->fence);
+		wfence->fence = NULL;
+		drm_work_fence_put(wfence);
+		dma_fence_put(fence);
+	}
+	/* on success: transferred ref goes to drm_work_fence_cb */
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
+		wfence->fence = NULL;
+		dma_fence_put(fence);  /* callback ref */
+		dma_fence_put(fence);  /* stored ref */
+		drm_work_fence_put(wfence);
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
+ * accessed by ops->work().
+ */
+void drm_work_fence_cancel_sync(struct drm_work_fence *wfence)
+{
+	drm_work_fence_cancel(wfence);
+	if (cancel_work_sync(&wfence->work))
+		drm_work_fence_put(wfence);
+}
+EXPORT_SYMBOL_GPL(drm_work_fence_cancel_sync);
diff --git a/include/drm/drm_work_fence.h b/include/drm/drm_work_fence.h
new file mode 100644
index 000000000000..4fa369f937d7
--- /dev/null
+++ b/include/drm/drm_work_fence.h
@@ -0,0 +1,76 @@
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
+	 * @work: Called from workqueue context when the dma-fence signals.
+	 * Perform any work that cannot run in IRQ context here.
+	 */
+	void (*work)(struct drm_work_fence *wfence);
+
+	/**
+	 * @destroy: Called when the last reference is dropped.
+	 * Free the containing structure here.
+	 */
+	void (*destroy)(struct drm_work_fence *wfence);
+};
+
+/**
+ * struct drm_work_fence - embeddable DRM work fence
+ *
+ * Provides a dma-fence callback that queues a work item when the fence
+ * signals, allowing work that cannot run in IRQ context to be deferred
+ * to a workqueue. Drivers embed this in their own structure.
+ *
+ * NOTE: This helper is a *consumer* of dma_fences only. It CANNOT be
+ * used to implement dma_fence_ops. dma_fence callbacks are invoked
+ * while holding the fence spinlock; work queued here may sleep
+ * (copy_to_user, kthread_use_mm, eventfd_signal) and must not be
+ * called under that spinlock.
+ *
+ * Call drm_work_fence_init() at creation and drm_work_fence_add_callback()
+ * to arm. Call drm_work_fence_cancel_sync() before driver teardown.
+ */
+struct drm_work_fence {
+	/** @refcount: Reference count. */
+	struct kref refcount;
+	/** @work: Work item queued when the dma-fence signals. */
+	struct work_struct work;
+	/** @cb: dma-fence callback. */
+	struct dma_fence_cb cb;
+	/**
+	 * @fence: Extra reference held for safe cancel(). Set during
+	 * add_callback, released in destroy().
+	 */
+	struct dma_fence *fence;
+	/** @wq: Workqueue to run @work on. */
+	struct workqueue_struct *wq;
+	/** @ops: Driver operations. */
+	const struct drm_work_fence_ops *ops;
+};
+
+void drm_work_fence_init(struct drm_work_fence *wfence,
+			 struct workqueue_struct *wq,
+			 const struct drm_work_fence_ops *ops);
+void drm_work_fence_get(struct drm_work_fence *wfence);
+void drm_work_fence_put(struct drm_work_fence *wfence);
+int drm_work_fence_add_callback(struct drm_work_fence *wfence,
+				struct dma_fence *fence);
+bool drm_work_fence_cancel(struct drm_work_fence *wfence);
+void drm_work_fence_cancel_sync(struct drm_work_fence *wfence);
+
+#endif /* __DRM_WORK_FENCE_H__ */
-- 
2.34.1

