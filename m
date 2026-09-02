Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27664A6CE1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361047; cv=fail; b=YNBD69+UW9In0UDyZWyDS1DPs+UNfTSxv8Mq/q095fu9CZEFEe0t8Ii57ZUmGXYdotCRkNPAn19sReayB+uuDcjB7j43DJtLpmsZmzZzZon1/ASbO3IGLM7lbwAYlzJWb3SFfpXw1rk6Fo2gRObKa7FHQkwOHb7kOX723s+vh7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361047; c=relaxed/simple;
	bh=8lPE3x346Ix1oyY29PwH2+JaINySDXHmaaWpIrFDcrI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j1Dj160v1Vmg4p8TCD52zITvOpmDomxBwj1IiiuOlUbK5sFh5q96m+s89qkgJRZBu1V7OztA1yNTMFxmZYxTmqOMYHu+mT1t7rxlcmxtJA+4ytEhaHzG6r8dNY7Dxnt/QrEVuZ1znACvVF1djIeglrrKn/ip3NPWSidXh8MbmWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0/0AmWy5; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0/0AmWy5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mslHl7SxNdPMnHA2l78WSE6H7eohOJHfBL1MF9dh6k239WgzfD6fYWBfIJYj9Njux1ywiPKisHMmrH8O54BWK4Iq4a74D8xaqu0iXEB7hQvVAafe59DSgHpnyD0WAHpH/tzDEI4XrFsDgwuA33caGJpvYVFq5nYoxz299HERecM1oH3jTRwYxp7iZW0tsbA7u3THIyGwRSF1hAIhoRMxdHvkKrVYGILbW0Ges9M/T0viFPlo+7YV+gpJlR0nXRint6e0A+WsixNCsSRyyVZwsbCT+6gnru17HubbCPwzKNCrpQLU6mndE/wsabIIuYDqSoiH4x+LPre2JDNUCM/cRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=xzTszt3sX/UU/nZi9frWJhTOyA39iEfquUxZFWIbkXND5w0Afx6DS4HmBlnDisgPe1Z+ZJUKjMaS+IXRSnH7LTuC7xsRjhmHTuifQORFD2W83bEMRARenx7WT3nHwj5s9IsTkc9zMcVT10L2AP8rMw18uPjvjvIqhu0+vTq3kMPsqZdyqWfXMS465IQpyb9SSXLvKnfd3slb59n3aJBL+RCx1nIBzQyJo5bxdidyTTBC/L3fitTrTOwjebX6d8GpxeLdg2MKQoxzhNVSe9SA2B/UuFlHwMO5zpDW6ytfKT+88zzClh9Q/wIbDf8MUcU54K8KupCYBPpDFq2L5aDABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ8xdHqLAmHz0xeMMBVvJRLwrpBXTcQCfgKdJYi/7pc=;
 b=0/0AmWy5cGXTC4xc5q0xQ4Rm4uo+WN0ZbVfYQ8Gkxssbz4IgHcDUZnGg1kWUIpb5gwKufUZcS+WhtXTpoG2hQhgTvm6I4AtJwrw+Q5/DoakJjuCSXtOnHpx/JXIcqAaS0D5r9FdZyjNmbPKOgByG8sGb2Doaf//8X3JJaieQIug=
Received: from SJ0PR13CA0154.namprd13.prod.outlook.com (2603:10b6:a03:2c7::9)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:57:13 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::68) by SJ0PR13CA0154.outlook.office365.com
 (2603:10b6:a03:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 14:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 14:57:13 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:57:11 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: Add drm_work_fence helper
Date: Wed, 2 Sep 2026 20:26:55 +0530
Message-ID: <20260902145658.183267-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: aa934aac-ef28-4a12-712e-08df090278df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	LyL4T5F7w/IUpyj6VwpXShClWzdWH9iELd3TTmuf7dUF8g0RhO4qcw9UIhY8ttK8rYA/2sbWK/8TsCV1QhEdJPOouwa1Wijq6iwgo3al5m2pmCjHf7gXzE7MgW77c+kAbfKB72UR0e9oHDHNtfZlN3q3T+V6RKJN8A4eh1jJPDRXUIppJX9/MSlLLShVyc3Gx9Ln0wmwuASUAfODBQX3FUKIdCrd0k/QLztlAHBeMkO2nK3+Bwn8AoVW4Gv6Ow439vnR7K8GHEfxFCMCWlhwev20qJM7hhlgTcmLPYu3fDE2MH5U1Qjm5iKjseJGff4dlGYSNl0T43xVFtGL8VA6yxXK2uKkTYfvHj+5hs4gGdSMe/cyIl4RH2++MgLWRmsl1lKLfON0CD+m8GcJUM7SGaeZHQ0xF4ZozgyIz+wqFbktWUSE09kFGiCcAuu2K2o5hleb/DSWnf9wg8fefEmjcCBAQ8OEkvMRsLxnQv1hA8nDHXFj51SbOO/fYh+q0SUKvUu6hnHVGIU3bRTggtyxuELtIDI5TPIT8mO49dBg54TfwwpdolNC8DcxfsnEQ/0gVuE3WIs8x5yS80CKCriqhejN+WxfsXjuTi0niMF+F8fzxhaZqphVR3UqFk0vZvKT48TBBovCQaeLiAX9eXTPSQOyMTG/bjPqL1CVr6RPBSuyB8GZpqEKtH0vlJeRIEhC5fnz5dJ3zS7pyXSShZvzjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eGxoQloniJUtn8Fgvst14zm0gnIz6wZSbt0qbvieMusg52FD6oGqDcPk+NIxx1pjHiFh0ic7Vco1+tTAI4LU6OCMIrQ3NcbkEnqpPD4FpRz3Hbraxo6VGQZukXGjGRpHfBqqgCcYnQNRKP96pm//Gx2d2O4ikIfTVPtMWF1hr0Upv64O1AOZGFBr6086cZgHJh1IYfV7XrLq2QP1eWZMpDY67eAwELEq1pGKdhkBx6tv+Ui66TRpfswNLxUNpmMkrq1Q+0AOaJYEtHcmViijl6rQb+brUMzaWcEQSOXMncT0YVW76H9+a6kAjOJNUiJKWdfioVb1IIZhHDvwVwaUysIjvWOIeLHrhY6WMdQf7SGO3GnO+E+c2yd3A4JEdDVWUa6aoB2tNapEeuV67lpxLG0O8WxjyBGZgzVdRXsNXRTQL7wQagb5XaTnLNM4zD69
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:57:13.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa934aac-ef28-4a12-712e-08df090278df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173

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

