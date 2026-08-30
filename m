Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7DB2BE655
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059568; cv=fail; b=LrJLRUAwIbdYbAGwOE34xhBxNTIkR6SznPE7dEK/hx9FBVO7C8rzmKr/2021vVcQ8CxjBjZY3Bttvh8ViiYcFxMnJGB3TnW3I0ZVoeH+iGPt6Yv/ABbfUh+oCFcqtGGAaVdCHHSAID69Oiyji1ZH7lsvWNlVERQ9vCWi7Nmb/MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059568; c=relaxed/simple;
	bh=Ju7IHZQcbziH9a0NMRzTNYl69hmhD2dHP1kc4efoJLw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X2noCMzFroWL7XEEZGEBGSLlW3SpL7UD56Msp7IASlsWJMmntEcM6vylPohz26eJLU4+ZwLOvEQwPwiJegmywgk6pf7BhUHtQROLAEI58phy3FQLbhZbG9hohL0ACzRNsM6jGbFSVqUFYsd1lV9fgjR34GYE4FkPFmF2RBpvxHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3pYmjg7U; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3pYmjg7U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7wwlnXPEvyVc5fWKtif46ONp1Hjgkksu96Z2zj6WFNijdI55Kny7KUi1GOJhAAKmulT/Ob7WyyLmBWvSJGL5YtXk0zMCdFyKVQv9lZd08KJ7hB18rXQuenUR/BGJEaY5xmAgYZpVKcIYolWsGqVPEdtsjXz8eOLhDK7ZlOXHzJaCwIYqGuESGJ2JadP2t9TaC9xOc1ncRvcIHcVy/SgaLIqS2LEFsyArb8o+1xsSwlPXOd4OOx0AAOEPN+N9JevgyOKZzozs6ogUIqDlFNqjPmXEPFt9GLA3+HRQmL1SLMm6Mxn5MJBDMw90DDKEL4QyJVNpTHZWXMlH7BUJwBQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d05Us7Jo0mzLRJYfrJ6izhKzldsnuKMA0Ifyl7DQTWU=;
 b=F30Jt7kHETH+N7pcMAVG4pkJMY2W98+cBxvkz1Ae+rOvqSQYuzlvAUpUNFUsK4vNwAm1fxJI8htLdQTV8dwM7GbDPYxTrD2IPSkl+ESwOsF/rSe/OgXmcKTv/jG2f/yagD9DswyFAW3nuGI5DA4qkg3eUtOG7O4oNBv5ygk3dsnyrmRxapFKlpRFWM4d5edajuNzsCPyDFmvg48IAgX4s9O4d5kkvbdLYK6fZTAEZfp7ZQj6hJCpUxKR8QPFupBz/seSB9uIEwyBD5/pt5Daa2tOIkNl5z/+LwbQMsBRxJkkeKqCiWECkPCbyPnel3OM9q0js4ZwKOiGQ77KNypWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d05Us7Jo0mzLRJYfrJ6izhKzldsnuKMA0Ifyl7DQTWU=;
 b=3pYmjg7UKO9kMqFoEKnjpxC6OoGMr4U34y6DkuClzisfmTKcZ26MFwuqrZqlP8I9GftD3EKYftPrSEdWM3PkbKxoCRYDD3d5ALeqSe8NOg2lyckG8y7bm2fvqje3OKQAhGsMWRArXJ8HSSdU9w3Uu41SrecAIH7noY6UomYSEYk=
Received: from MW4PR04CA0275.namprd04.prod.outlook.com (2603:10b6:303:89::10)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 03:12:41 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::52) by MW4PR04CA0275.outlook.office365.com
 (2603:10b6:303:89::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 03:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Sun, 30 Aug 2026 03:12:40 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 22:12:38 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm: Add drm_work_fence helper
Date: Sun, 30 Aug 2026 08:42:22 +0530
Message-ID: <20260830031225.69819-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da6aa70-3d1f-4eeb-7f67-08df06448d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/F8N6+5btYOiX2rzTJoW3jb42Tga8Jt4paa0qlE5aYGB5idsxKVfSPUbuh0RP3JJUPt/PQtE/SciCOn1O2m1hSolyNAasZT+EIVkDjgtxt8GsgeW4gx0iwmLdaOcYavIgcD9cPiBi+8soq2CBu0yUtJuWmJymeno7+VOZFkYZ+ODrUhYRlfYkfpenHCJOG8Vx4XwTleyZ9rWwcz66qd1BvYAJdwtLQrNSqzvgvMhh2QKZ+UoW2LtzWeTVT8Bbm0HrcoRPZ4f+qltW4OcMiv7xkuYcZFRmlIgQN5ln6xeV1xRizn29HMGMfpzcnnETltTyR5cxIc/JV1rweBajIsiqOrlFi1JrgNh+aF0+llMoxxj5sok6ZgVpOMTN5WUqyrivhIrFVqlJx0Xvgb/6QpxakYcvNIPkxCeehWFt4F3vjxJ0szVCouirNeQlKLk5wfMWUujjeTbCOeRQUEmxua/yx0wwuProthyZDC+1yeCdrroDumhxW4H4Bay2JeUuLSX8par15MAQJ6EutnNsZTEe9mPV5R0SZMcIBQ9WVpd5oPWxc7X5EqIhGxJB5yxynn7OE0mlsqgqGAMcOb3ZMeOIeR+HgUMnQUnSOmi311RKjWQ3gUmAS64q2bMQlmDfi+1pHHJqItVvfQRl0lz3fcSEZYNpy03YDFQVQW0uE20ZQNV3DP28zckESv7evCIsxrOlqC1GkHcOeWO9X/7dVaMxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QDGJ23J9q32nJZsEWgFw0NlHkuseJgt6OJ6zK4w1FNQNSqkjHWbyGZsbFZda5sNjVFCrRE1TEj/ErbHq4WkeFIhsTMuG/RU9miN71UDW4vIsJXdOVrpwCLcTMI7V3qkODXnJkT6h/akb1fpUax1m15/DSNsa04U9F0WyvUjJgbsbpBCSZytyKTKOuWObNxsYUgTdGRn0clP93tkv9/WWWShDtitbJG8bBbYY4QTuRRfuSa0eZItZJ6fDWz8KHZdYF9ChEABWgLNto/B2QdmqUQJ8D6iSG4tYE/igkl8UMYEL12CWVzv/rTj6FbjTUP7kFnUzesiCqBBMr/TKQjBt00jCb1PZLyMSn9tVD1PilrRyDaG4dtLwQ6jOXB6bPTKK6Iv7IcVfmHvJ6ZYIxI1cKDZeq5LaJ7PxgSJv7ERtsLtLkCPy+RItXowU84xoQvzt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:12:40.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6aa70-3d1f-4eeb-7f67-08df06448d31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811

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

