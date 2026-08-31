Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDDE45A2AE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188222; cv=fail; b=Sc4G2Th/GcJtUH3XRw0YxL0f5zaN9OwJewwBAvNmKDRKz6kb2J073VQkGA9LN7cByMh1djDkr/5ZXBK93GhHWiyqcyU6JJUbGkiibTVFxXCcd2JITMaktap2AT80dc1u/O6KpRczJm6asQ0febycYooFbxmvL8g9b+zO1Fq9lok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188222; c=relaxed/simple;
	bh=3DQAu0/9BxEWC3mdpteHZZsLIav9FsziJmLLvbkPnRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uH6nMYyHTkgVZAoBYK3959OHkFivZ8ZqZnYGwoZFUQQJYAELkj8r22SheXCMMBRKS5yRJc9JrGJKyHX5J2/sRUeR8QBqWRPQAtIqNOGY1bQMI0Ar74b+Ab7+zJF2Desv8T7gXuIsuhvfywiAEAX6j+peDizMdJ7RmcmrourcrWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mQQ7Wvqp; arc=fail smtp.client-ip=52.101.57.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mQQ7Wvqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpVUXxxxV5I0MaPenIdU1s77lnJnBVrpYCpyhJjFceLtT35MbIojqN5UFSdorOQX5L9Oc6iKfuVJRGuG0ysdMXeFbBwJNOLXameKlDWAowLeoqBTmen0nAlNHckQbQjdO0Df8mLgDrVeFcoVIAoN3uyFSFQqXWepAF2x4R4EZ8YivJ2ACsgIZDmBEYo/SlTPnfryLA6ufPF7W6RX4U3fhPNXG7JRmWQZYIznNSJRKwQ14dJUmEkgoV62GwKPdQfRTbqA5outwgOxv9F2grLwkyaytPpl7mmbtAoHaZ6M502C1OUcMdCSUPx49dSnmLOr/20SVGJ/ubLNU35GfeJ6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNSZBkM3A9F7VgbN+rs75nUIY0/zpew9AHRvVvhLb/g=;
 b=N0kXvXRYkPFwLO7dciR4eaVfbKXdcRKOxJZZPSCYiiCyT3fRYqLZBkgFabJ61wVXw3DBSkpc/t32IiPnJ41syfUb0ZZsQnqQxeLK6Dyl+9m6kijcOU5ptVLhOLV+zL4hfmV+xusplYG3fxbu3ketdXxUqTBWSFs96cNm3c+3zfNBPDGtlbvQwtssUPM0HfShN/m+87CFgmjc+Q4qLkw7h5RchipBPPk/ZVRGIM2XhjhHDXp1wswHUlhAnXJ5ZhXcY1gEPkl0MmdcbED76IWtfuNQWTfGl+Yjnf0BwKFJU2TBnSNFrtNNcoih+Q9MSgwxbn6MOmqyBOnMqY9G1d+g6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNSZBkM3A9F7VgbN+rs75nUIY0/zpew9AHRvVvhLb/g=;
 b=mQQ7WvqphcjcJg8JGeOKWhWmcpGITeqgWyEvTBSYMRvtA9mu8Db97NhmAoHGMAbzykS3743FhQ8E1kZvK5k//SdL5yPwJ9w6fY2wj36PnvJsgndIL06e4BVTT1EfdQpXD8r6sdO+3tqMdhhvNLRju+vkQAYQFHl6eivwxhHE6Ec=
Received: from MN0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:208:530::17)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:56:54 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:208:530:cafe::36) by MN0PR02CA0025.outlook.office365.com
 (2603:10b6:208:530::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 14:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 14:56:53 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:56:52 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm: Add drm_user_fence helper
Date: Mon, 31 Aug 2026 20:26:35 +0530
Message-ID: <20260831145637.126892-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831145637.126892-1-srinivasan.shanmugam@amd.com>
References: <20260831145637.126892-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5a7dfc-2613-4eb5-0c2c-08df07701890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jCmprcAbXKY507/2RgyyslN6QloebDzQttBCvgq7MUaTBkyKDIblueAERs/ktCNy5DrMZYo3AjdT/S2ZzzFBG8TYrDX11t6wmLhZuKyGtqZO+njkVpMMJczvlz08uU0U0++MyY6dixj4F8V8KTq1G8mYIT3g+i9xABW3HwNBTrGRwXUDtvUeH6RWZCPOMQUrep72Or3FDT+ORQK2HI0xOedPov9Aei8twcoNFIOyJhckt6E4DQyhb81d3iwt6iRLAH1HasPVuHYD+hUbEzMnGFZip7NXMavBlvVQZhCYsj0SraJWpl0+HwkgAP8wKb3DQhPeK50TDwxLJ6xi36yLV8kMlG2XjgjQC82QrLXzk4gnjvg5z8/3MLGwoqwd6aKKfymgVvqresT9xHXnEAcygdk5ZW8Jxj8SgTLmijuGrOje5r88wreiPtBjlxVePzV8h6NlJBHNyUaQ2VPo6FUU0UtfxK8DAvHkqTcEhoC0+0LGis3RnNBCSXt7sq3TGaA3qvu+nLQ+9cLSqMHXreJaSBz0a6kR2dVIb5YHF4/yUExeRlJ3M/6HyNwqENbs7Amf4uba0K8cPTgh985utZZW09eZu3eLcLDs5F+FEa2scukmZvMB/YEg+fReJWOnt178saJmF7LYwmCPhlzVhcLn3BvoVUBhYO/lyuk8PgkOH0qwqHysa30/Tn4RDkSfIuO/Lrd7A1LZ+v3xTASWBuA0sg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4w7iio4EhwsKjEOyk6LjwI+MXZx/MhRdAhemxXNakUwjFqkCls8WdZdRiip87Yu7UGhDkRmv/yRVz2ss8H2s4k2LZkFKR7Af1DZ72lajuU7IzExjxxAqDTUxlEwr4GmaS34dQsTfITPNW7k1f2ULtRKR/UDvBVuDHQRO+gDNGDdpkJDzFyi4v27sBCGyCUCApSKAIpb3KwxGsoOj4A5iMFIQffAtlAuWq5mghQG0wbRprAD9GbLIz4n0s3PL5Z8BcA1Q+ABWZ5NWfBOBbidHT3NLCyFvAMh03OTVH6dkTY8vKckmsr+UF4swToMWkGhCpKNfQYng72GQ13a5tzEUyO7NpFsEHU2JMhERCQY2157cIoryYs5Avsx+lz5OBKFvYUFO94MAzoJZh//SBm7srAdS8wpGpuj5zHofPbCbEZCZHZo8tI9c3oBDYGBHKlD0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:56:53.9287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5a7dfc-2613-4eb5-0c2c-08df07701890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268

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
index 000000000000..664178e2d74c
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
+		mmput_async(ufence->mm);
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

