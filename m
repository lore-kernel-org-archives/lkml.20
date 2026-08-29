Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953563BADA7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018079; cv=fail; b=aRAQr92/mWjawzslTx+G8UkA/we/xod5pmlhuZJwvWn/8K5yauHj05kxzjH908pY83agN8UGyQraiY4c7iTwWcykchOV7cTEkGkvo0YO23+h/eWigg33EI2CmsClb8nFWu9gCF4bfdZt51vR5PNWKiwxv6gJUAHnZe4upkXQZkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018079; c=relaxed/simple;
	bh=amPPdxewCgPi7ZSIzBiBUrYzPM4uJZdY5ICSt8hpWTQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mzm1DWiwzF2jlyD1iNZUrDJbjm2SfRlcCMEE7aFNOu+gEbJP39CnP/rC+ZX7nQZa1vHSs6BYBHuXZ8FWSRKm3xuTasccw3i5SvcbQvB4IZXFgDNlS0NF9fN4zGu0YSc19YCVFW/SvOeNQaHydu+yoA4/jcaUfUfuazr9eYmzUMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o0ibLZOR; arc=fail smtp.client-ip=40.93.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o0ibLZOR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME3oPAvWXJhYpPuh5SDjmB6cAuF8QKZTujtRUVBzOInoKVy9pdcscSXeBYcaQ0Uu04K4Rk8lya7fEbBRmO2Wxm8ol4lzjjOh/QDk/pvuIv6orvnlzYHN5oTayo08narOCOP2QgM7t6uZMhuIidYNnOj75RRdVBBZgozAIPQwpsH/Y6Cah3EQ+ikFNrKp97REvN60hateq6flJ85xAcrUdsuRAALCDgd4jKnjs0ypog1DEpqN1O0IBfhjWMJDtX84LZo77/j47VYDW5Qygntx/CnxGpE/UvBacQ5thonzViuxeZXROMKnj9nd6Yx1G6mc97OUA6Sx48qm7MlCavfehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpkQkSCfSc4Q+XWl3AYzdzOuk1soglvQe8abyb4bS9g=;
 b=cnl5V6gzadAjO1VtFevJV7BB8ffEMJM/Y92ss6GtSRLeYssJDluyBmKzhdR3Dj40I2qMEPCtFXhSYY6NgFG43Eh/br/HntZXHtQBnoOUhTgaZfXzWDua8z3uMld0nxZgcNRG6SUXLAAir/AI87FXSfPYcottp2oPfqESMsQHkB3omemCJ+l8HvDn7D9slkcgkcggv3rMA/3G0Bc2wHMvYvbN/RpCf1EzQjSTldIGprP/lUdS2GpjKDG1xIpY/LFIjpWDmb1ikU/2XH504QXJl8KvVD+M0CQQ4EdhAmoRpO/5PgjjCcZCmz1hg/rTKCzwNghK7YzmV+BFq36uW9I3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpkQkSCfSc4Q+XWl3AYzdzOuk1soglvQe8abyb4bS9g=;
 b=o0ibLZORdg9IZOJ5GWviW7kHoJ3oNEOHgp50NjGvryE2nBIVRmAhJpkCjoktnaRoFLPQGFDHPNRnVIS3FnkZ+TqyVWPOQs4CjAvtrPly2AvQIPeIloLK/kwXUv0wbE4ZZrYbkFMBLKmP317cDAjNnTx7t82Gf7NaV3XO+Zk2Vfs=
Received: from SJ0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:a03:3a0::17)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 15:41:11 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::61) by SJ0PR03CA0252.outlook.office365.com
 (2603:10b6:a03:3a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 15:41:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 15:41:11 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 29 Aug 2026 10:41:09 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm: Add drm_work_fence helper
Date: Sat, 29 Aug 2026 21:10:29 +0530
Message-ID: <20260829154031.42551-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bb2dcb-90e0-4d00-227f-08df05e3f3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	noPQZpx9U2WavS6C2gOIxAKm02coJWaG/30k6DBYYm5iriJGuEwtJVrkPKCHxeNC2ZSJo2rfEmPmYQCqFG5tw3eII/NAWM2M6I+oYKtC0awujqOPgkuEvkEVDM1791GccdkbX17qGnwOf4BJ5qnvk/6vhxVElwzziJiA5Jn3nlk0+/42J32AJMkIbNk5x5R1gJlLGkDI4rw6a42vTChVDgXv5DBm51SNgwOzgomTfWy6KnWG8tJFLQtTYZ4fidStcJlzZ+b6XnT5arIyF+gFbW8trz9/LFXnSRzs6xUbKOPpRTnPaMERaL5Si/b1+GvMf5dEXtoDuBsHNfLjh+Mj1Tmbvc8O510OjSSpjNLBoZnAjM792eGmkzX6JBDowFJOc0XjhCwLkHNFPUKcsjnyX0LfPyc8QHJ5jPXGUY2R0WOPC77QJLEDAuEVhl54uGYzqk0seUkr/JHaGntmKvto9QUklgAbnXAgMrsyBAt9p5NxNz2PRxraamT7E4WOPdWe+nNY+HxqPWzNZql8cocZrSh/jzf8G/O+zh6lgXb4zIi5dM1gt3Zgda7oezJr81l1aJqD0vu3G1edzGJK2JHqfqC+yiJL1QiqEGrEahPv0OsBMtopLYTaF4Mj+Pk6Yn6kpa3m4uGrLggJboSA034RtyW3xKaSCLjUC+ilvJDeJ62HdV22zdU9mWbWLwGqmr1Iy75X5WL1BR+M7aAVVU1gWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gFslbtXW2N9HZdu1Ce7IjfdWVbFvOusrsqSCk7S7fjvbCJiWEeRU8cpNOlOedI+TCHPsPBpEJe7hUbvy/l6kIWV+hbC+es0uHC+NEXSGbajGkmCy4A0bgWpUkZozCD3iTtmyztkYaOE2BhXJe06HtR7OQ8QjW7b6qDfqPKIdgEn/tqQ2zeelU9VRXD3OgBmqZ52iTBCMcVasQVADb68Sj+HvKQUPYMakZa3m5SJLcJejQCQa/3o8TY/uPXdRrdD8nV7iS76inRfwiq/noT/fij67jMKzJlI8QFFVTwPc3+pf7GhJntaWANJ4k4lIIgk1lo49ES9xNqNtwY7JMuJPHYFAvGu8yxxnZx5Iru6xfeICqDcyJih2x8SZGD84JX2Q6FyYTT5x5ZSkR4F8xIo/vdAfDm4D49PemuxCzCzW5xkqQgEahr3ZMwMmTO+sd0Fr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 15:41:11.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bb2dcb-90e0-4d00-227f-08df05e3f3b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617

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

