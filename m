Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D79C45199C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924097; cv=fail; b=DOZ1wJuSKorCYCD0K/B2ZY7lH3HEk74b/DhmdVbMEAbjM99gZa68DlwZElN0af+eSdpHXL4l/bhIJflIDMlax+OBUOYLD370K6JHmzc+KYDQB9toIhP996w5+qfvIy3mZPA54vbx1qvBM1rsFXtZylk4N881TGqoSavWrhnTGaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924097; c=relaxed/simple;
	bh=OwvymV29tk8BrVTpyiRUJjOhyWSNu7I35/yEzQ8SKVk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S7Aic3WXdm3Mo9KPDSfqaxmVWnxzq6lf3XhYzU4gI6k9sy+AsSuyMic/xujcAaj17epj4nwuvvf6+C2owuio857x46lHNR2x4XZLCkImfq/jUAga8q/GyIqZ/v2rAZZGOJnbliyTfcyMBkppP3T7E8FrqhoDI5L3Rx8bmLX/C2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=09QbjoAS; arc=fail smtp.client-ip=40.93.195.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="09QbjoAS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA8dcJpujS1Ljrk9sCTen1KIVUtrgGplPbhjV8EX/+4zRBY8JePWo+mjYK+kVntZVhdGb+89RSYZ+EnJVTXxwOWQWAOCry8b9p0u8u/wOyqt1B2HKD7Ut4nMrj3epKtE9Ss9gXDMLc+KCpiojQdR9IdENFxyUvUucnGKYgvtfOTYD3lDOCaIze2wfi4ZRm1JY5x3PCY8pCfnaF+CjtD9e5vw4pc9XURGRBXcvYEoCLxJjwWoEI6zCe86iUv6N0JyF/w9ad+xVKjGeuGOp2/5Uc8dFk4EjnZKS2AJIi1ck3Kx9Y0PDKogYGyy7TWhAhiX2H/vtS6hqSKPsOYT7DN4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyq7OGwBEDuXFHBN7wpqyD/HPrhSfIOKZCOcPrvCC0k=;
 b=Z6VEnj1D2OcvsSAYdNFbH/rSXZ9TourteOyYys0But4/AaPjQsgoG6v6WPED3K/ny1xosd0e/5tuyuCWJDilsuady0Dv8pOvoF4o6k6pNJyUUgkaum1LYH9Vi1XGbv9s/hZ7mSgT04i+ZCAP0Yr4za3hvVZEBwbYfaHn5iUi4sH+LGIlg2mJzpfzkXgYl9BSVHw+rJ1xRVhFKJ1KOuFaxBT8LNymfRhD+QguW2DbCS5xrCxEnjcuR3iHtC5EkoKeq4dGxokny8ipZdxGvjWATlOXzsHRd3ZQ51VuGvvo5Ygcp7tNgQ5IoXvxrWlQuo/Jv9VKqW9xa3pRn+bepsN4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyq7OGwBEDuXFHBN7wpqyD/HPrhSfIOKZCOcPrvCC0k=;
 b=09QbjoASpJVDh5ewhVcAOygoZyI/F60Z8Bq0Iu5/9FmEAeGJKxHjXW3scu4bnVFbWOW4/x00BcsulEIYOwQLs9zvvmuLqlBl7273+ctUps/gj8DCMiBiA0/z2VdF47FpfCIhufcj6X9U6NRv1RXnFewRAcSqoCofhQGBphpd+J4=
Received: from PH7P220CA0100.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::14)
 by LVUPR12MB999138.namprd12.prod.outlook.com (2603:10b6:408:39e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:34:42 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::1e) by PH7P220CA0100.outlook.office365.com
 (2603:10b6:510:32d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 13:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 13:34:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 08:34:41 -0500
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 08:34:40 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm: Add drm_work_fence helper
Date: Fri, 28 Aug 2026 19:04:25 +0530
Message-ID: <20260828133427.6235-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|LVUPR12MB999138:EE_
X-MS-Office365-Filtering-Correlation-Id: 70523809-d077-4441-cde1-08df05091da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|6133799003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	L+AhDk5LQSVWEb9Ilkjfxpfbu7FGJ7xqVuWuxWIVpPJg4nkbBh3EJ4Cz9PL3MkskV6bVNgza+ZfjMoJV89We8FqQ0xCHkV2hFbGsftjatQetLH4kJuot5NXdMGvQlooD59O5BTxDFewIcmGf2i9LZ/E7gPsSlnLs3xdN4eMikvxdfD+LlR9Z0qIdXk+P+e6EanIcq7n4nsVUBVG3f/bnneQq/BtrAgljQubPhE+JXK1XYhk1d30MB+6mW/7MPLFPyevKN5STFeCnVUmX38ruU55ZPgD5qlYYUsEx7iXwoxHtNiUlm3Xn8py80aZmthR/5sdfsXv7ncLfH2qi3UyfG1Fqqphm+rWUvD/lF+/5ZUEZ1pAg02FwmdVNfz4rZYD7kfOcBefmpGZ0T+TlTVKXVPYMIwG26h8fHTh3Dr1LJWeVRIsM1iQk7lKEnDy2XRGXnTuKcfcXiMsePKFD8HEvmQYCeLQqLPjWr+OHxnUop/ATW2H0hEdeySSlWB8h4wSe9VpgWKo2EDZIT2Cno/hdfU5OGIJjWonzaK45CNbwRRCwb5Mz7pUu4r/VsGyroKVmT7xP5KLomW7ADk3L+3p3h8McE4BXLadT+1olHwLAUu/dywDuAbcCnevvvfqhJ0DpUtVes91PYA1Jhk1GWOUJQseEFSsYKlwVQT0rCcEo2iuq7M9bg89lW9iotttqnmA0zxHwiMbDwULiIYi9qvxyyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	47ifqYCtDwDs2qc43zOyRV2EAF3L8543Qe4nDG9219dmurAlM5YtxFghluVcFb2IbuK/uo34cm/gRtLfahRaa5B/8MHJweLKVubM9UFF0N25Imkc9wP/045jxd4Ox8jhOjj3D5p/BDVxAvLYMUCmF8DlxV0LsGEgM3S1V5txWdl7LIui9z9kb0BylFfOzgIPt6Ml99omxSbPO82WjzpCuqigFUkztpanmFp4TDeKd7fwHYRABiU5bBdnFwuYgC13VbTLltRkw4N6LbSFVNAUyLQ/fGRzIujGbGcU3bZy6qntezCH1bOgWqtXbJnG/gwTPIKARKSTg6FaSH29rvsm5Sw0BY6w8qHnyvR6/xrSq9xgOh++V3kKsk9Wibzb4eAe3Lvq667gCVHNMaguIfZRipsjQV/rI2ZOVY8XckD4Ixg2U7SftXKzaHCbdtaKJwnT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:34:41.9641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70523809-d077-4441-cde1-08df05091da7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999138

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
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: Ibf342a021a130c01c8d837b16bdab6ac19d62098
---
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_work_fence.c | 193 +++++++++++++++++++++++++++++++
 include/drm/drm_work_fence.h     |  76 ++++++++++++
 3 files changed, 270 insertions(+)
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
index 000000000000..f391a70c5277
--- /dev/null
+++ b/drivers/gpu/drm/drm_work_fence.c
@@ -0,0 +1,193 @@
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
+		dma_fence_put(fence);
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

