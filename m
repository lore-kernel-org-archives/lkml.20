Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B599305688
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924101; cv=fail; b=lxJ0xuAKTSoRQfozPudr8aM5yeIbvBeDe3Gfdqa7Z/KYgywDARTgjnnC8DkH4MVpUUFxDS0oezKdpzfWQ0KAJDixm5bmnQKOCcH05P9Imjry8zjSkSMjXuT9LhlbN6i2/sceBS5LAAcr0QobCch8rGzQ0PfFXmCl2G1UW9qYJ/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924101; c=relaxed/simple;
	bh=ktlxMGqB9W4p1KhjNawAM8ENLLcrYFnFlX/y58waYpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QucL5/cfSSMcyILdoIE+BjKEieTjOPFx3hEXl0Y11ZrM4LrRVVcB+uu1oENEYIlRF4tqYMmD679DSm+W3vmrOIZTAm1CYz2/8Od/3qIZvcZ7G10fLshCkEc5re6isei8Iv7583oQdHRT/PAwjW7/aiKwwbeMwo1IRCpK6bljO5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bBUk78KX; arc=fail smtp.client-ip=52.101.48.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bBUk78KX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INF80770oWkhNCRacCsc2CSCB3L3JOE3m2x3nJPpKFs9WWiEfkkGP1Nf6mpX6v6sQjqMBLSPJ2MlvoT3YSRit244yeWOO3aJvw2i97LUgWmspmvkbDaJCUgs0TOK3ehCocPNzPCV9IkNcii+qfhXiMrSAxZsSbO2vjA2eFe+nL2leAuJQysSIga071cIHPejqgN6kRFgQ78+oCfiNPb0JZZPrjcEVN71bt7dBrpqW/MhLt8C8Mi5WnfpFXiTjUPnO2bra/g0927gOgUqofLX4oWz4Hy4xrD8NsSMTK/+XFyeGN2mcYHmCLyqdSL3QEs2w7hTZY0CnKtYNlZbWAfuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag4Y3CPV5MezQeFlqI1vIExGQDV14LsA22y5xhFORUc=;
 b=H54Od1AcjPxuxEwG5Ni+Kcoy8nRuX7sGpBK7TjpLI+zXPpW+6/9QCsNtHMxtVjXjjyKQ2vZhH2jJeTKGFR7ZLhy/mRCc/IW33PqZ+VH/OmXWhMeFhFe0qHmWT0ub2bKh9Re2m0t1lW2GG9Nw/2PZQ6JP4UtqP7R2GP3Vhbp9jItg9ojUgi47FQv1RiRFhaLFM4O36vaeSjVPNd+td9nNx2akqaCpckZyaDu0612CvcidX+2uWSnreMIadndmT1Af+A+qL5wT8wwAZA9np+kCWM790gPrYfBc3sItY0Ks7kZcZR+vCJ1gqnn57BgyQ5tDEwfczirgYqlGdv4BiWC+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag4Y3CPV5MezQeFlqI1vIExGQDV14LsA22y5xhFORUc=;
 b=bBUk78KXB3laTAalrVtvHNZGutS7Y5QYi/ThgZkiQg23Luv60PQVpXmdKKbHVe81XR8W+HsGZTK37sickdBtcJnheJSLMyoUScXBd8zbRK4miYr5kdHBv+vB0GiZjRVcDt4XDE38Sad8ikfNpLbk+NOd4Wz+KvUrml+MLWJ92T0=
Received: from PH7PR02CA0011.namprd02.prod.outlook.com (2603:10b6:510:33d::8)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 13:34:43 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::23) by PH7PR02CA0011.outlook.office365.com
 (2603:10b6:510:33d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 13:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 13:34:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 08:34:42 -0500
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 08:34:41 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm: Add drm_user_fence helper
Date: Fri, 28 Aug 2026 19:04:26 +0530
Message-ID: <20260828133427.6235-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828133427.6235-1-srinivasan.shanmugam@amd.com>
References: <20260828133427.6235-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1495f2-33f6-4467-4b6c-08df05091e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HUydpblms3KKRdOURBf/u4vyJYnmCWh3nR7NGjo1+SRjBY4yHXu2eWMMDKPh51an5vddPhZunDnoStuqoJuaarum4Lg02prfnb3ho17Ig/3uvOUklxj6R3yO6AiUt5kZG/KdbvCfLna6By5DZ30QeY+YZUt5ZRPPddAr2WcanPm4A48awUHs1uI5dRCk6912WytHfPmx0a6UsIWBhmGdHb5uOzeasdIVAJXkst3Xamatgff4ha7Hm8h1RLZ9y3T+T9ayGv7D6vLXnwpvZsNcqPM+oVc18iP6EqytKh2BO31mCnrs6U6FIx/jc0Oqu9M84hsIU0Z2X//1F+T8Qu4S+fegi0//o96ys/DsWRW3tmkTThQapTPcfa88atdUuA1pmomi8x8ZtDeaVtCrNmdHzH5enQ5tH54wj+LWm8bFDNpJSVHqj690B3IdkKQ+ziIhQylkef1P2y9SQoYlRC8RD/o5IQkrStb7ac9prVjhFJLIS+yQqYBOB99VmmKDnSDhPdLTEOQKlREpPycLxJNQTD9hvM/JuqIPVe+GH9AC5/YPqb64av5cEIEQP9WVishkJJV9K1GA16O/GCnIUaeFCK2LIngYdBYJw4z12fdtO9ucUZaiPqyp7onWpLT4OB+kOkwEWSwGdu1yv8QUq97OW0fYFduhgaehdtp1BerIvxNenwX4gWhoI1cxZ1RtZDz/YQXP+qfy4G3+pfNypQ6shA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VDrGeSnFTtxuzKo9DavruKIkZ4ZDVlZMoL0OwBUXtb1tVlG2OyW7nQQK24epk+69ZdZVScF6yBQAQ7wMJrl0MKPtYSbcBTXcP3QByOpkSZEBiaaksbHJ6V1g0uC3EUMUfwy2BL5VEyfQQNB7zuhl/1bjkzdg2AfpJ6aP0Z1Zpt9KJj4qq7UKvjDlkoYx2Ei8qIiCCPCVHofo2hxdAfGKTVRrOA1dmH2MhQDNw/sB1fNNVceMFfNtH50Z99mXUaBN6GOYwAsZL7XzwG0GxrwttjLdiV2KkloumBYhd2PDMIuWzUWAVFUmQddN12cukq19DV/bWN6xlyRlDovfWNFCoYGOjM3NQmRAv7gDTREBbMClRj99OksIO7y29/OXU+aVHUW/9qn73wdcS6f37GJW3WYB8Azt1T/V+1yx8ma1YjT0P3nCgEYx0ViDmpP8pFA3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:34:42.7895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1495f2-33f6-4467-4b6c-08df05091e29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067

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
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: Ieb91eb2e8d18f7634b02c9df67eba37a99fd0442
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

