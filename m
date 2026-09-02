Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BCF49F114
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356981; cv=fail; b=oU9F2MNzF3cj922u6MAxdhCTreoduOBDkageOnzMwMUEaSTccOQfu+WRz3HboJvrtH2MD22IgyQOlvgEfIkoflG0pGhsCtWBrcRtho+JGFX1o1obUrwRC+7FKZTyWlqTzuZSAWl1CkIcGb2l63RbA4HeQJ0PC82bHsA83aPxuQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356981; c=relaxed/simple;
	bh=Xpr5ujjXC2yA26R41kbYb8G4jfnvFzGUB+IJt54FHYY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQqLsVQcjitzI4EnRZqQJcqVS9Z+IZa4AheKmKi23bUGWTOZtS91MwFNgFGsEbvYRVX4QEFkeKXxbqbza5LB+c+DAq/xKwtoZBpnFwmSICcHOjlH2fu4jql8FIzwr7klWKMg/vFG+AY6orFOeT3CAPlseVrAAncP3ZZOZ6Ytr60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5nNMTN6f; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5nNMTN6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2wt6UKikUv3QxDQ29GWbWKRFzZcN27NuBPmdA6hzWn2kezHGsixB7ps+/SbLIE26+aq2Q21IdCQE8x6kWFDUL+cPqULT7Bay5meOf3igdpa/Svd56lMN0GCb0dxYRpzcFoptqfH+LmN71Ao4RMb/rImIA83xUApPWwZftLrIJApdYtqF1AIXpOwV7N3jNVkP/wi0qWU4hAxXdXDi4FJegWwgkgAD9MstuZt+kpQDC4AZbUu4ctGdXmIY61Y+t9FAVVFeo3cFO9Dn+eHdY6e/JVcVPBn9hbKfcAbmtGH/dlHe8okwY+WqsJvp0Fwovi0u4Ht6k91Y2gFOw6xUvAuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p0/5UzYXfxmQ/yZMVoaad666meniB/RdLaY0HIylY0=;
 b=cUnwwOh4kg68CFvXPxq2I3zbuSuGUNYN7Zl2QEDayc9dXXBR8lvNDZxGWqZfIRncrxAhojXLA3ozzDsBJCP4PJyUJlmJEc+S/bRcGXiB9Vyn1I9qJwpljzPX0htfqxFUuG0pymLcTol3Y3knQlRjSduWR2XjqXxV8sdBJCoCVHbupRuhhSZ8saA/D3mfaxhjsty01kdSN7nxNc5z0NYBXWcQjETKgsGti8dOWbmAQD5pDAzuF6fRXvApOXCYeQYusnp8ZsUkq1S1yag0NSSHNIH/0GlJJs1FXx9AzhK7io2nsNPOX2iysJ0EV4O0QoxehS/g+ViMOJQ7HhOYcorteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p0/5UzYXfxmQ/yZMVoaad666meniB/RdLaY0HIylY0=;
 b=5nNMTN6fICo9/rNPlXZVuzb7EDjYBXd7iZwCUDz+EN3SaxorWjbQVxCN9fOIB8lFBgPIyThN+knd/ZT9OgDGHmXjfdMBdNQfzbe+SPsltTJBdNiMZ34pUQHeY0ly6lt0nKWtQfYGAjUSBeOykJF+ag9hLYgDT9WnlYl9mFK37yM=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:49:33 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::5f) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:49:33 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 08:49:26 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Wed, 2 Sep 2026 19:19:10 +0530
Message-ID: <20260902134910.156230-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902134910.156230-1-srinivasan.shanmugam@amd.com>
References: <20260902134910.156230-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ea0c75-42eb-418d-ff11-08df08f9052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EOEUNzFeQ7EZ2CkX/PTEncXm6kQ6WGgDLBsyBi1ZIzRtz9ulirvUZsGsmcLfaFBss4pjis5n8O9ZPsE/r/qn7xy8LiGXnmnxej+IPLp98oe07oVSxQHMCfLK4wBnNvF8O9KoQovMPaX2sqv4DbDINs80PVf4bvzvgzGyVAddnk4DF9o31kwXEyZ/89E2iScDtOEQZEYf/ygqgNMfwOD+eERq7ZK8H5nDaJcetpdGhXx5JPOJ4khO8bTmn1WbTnM+MoPU+NZVZ+wV6YfVPuLfRypzNcvr/dlqFjBLIOgxkiJYxAcPxFVyGnxIQzfB7d6PbDAmzUbFLt8H0/elYXaBnGlHTp8uMvWRi6Qfd46cVuH+gFFsdtO44VcnpD4X04q/tOzJrUF/+NHx2w0zIQc0XT5yQB6ZfKK1rqSl2mp0gXLFL8Xpa3dMhqzjxFdYQRW46K2ItjjhzLNuFQKXa5LfHmBWdvEORf2nw/UMsfoVDrR1dugPiqavCGmX9xT3Zf5IfJQGRSE8qNfvqFGaC0+bszl0BTkVjgOW0Tm2P2abhKDalQA8dhvKnhBh/RM23spqA9iPRoTTeLMadZgStMTr2b/NXWkmUVQs7yz3oN9Y9BcY6jm4mNOd3iLWm0fPnYJMCGyQ2mZj0ESsbnMJNarczwwJ4wUkKtd6xfWEJ2Ex4bliyNxFhM7qBTeBT7YkA11DG8jJr7bPgHbS/Du1QTtamg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DMMClLgBmKp41sCxcCsJOfJlUsEcmg0iZluikXI+vcW622LfWaZ2FutmBSZ2b4b+Vk8khJ6yde7jQrpA3gnFAWt0SAoCHe4CL+ecRy1diWIBGh6XcAZX14pQYEYSr5jD4gPG29vPY0rVeM3j6f3peypOxkwNNwT6nyAG9GA6k4KeDC8dAVsVX89KL4qfOOBhpUfnbYLXTSFtR0RFuhYK1fkfmEPMvWkdRMGaQ/g4j50UAWicLm17d/AimtbWad7HDGoPsTol2t8R9lUD0NSKp4hmNxr0Cf1knZxiOZgypp0yJC7saymhcyy5F9TuehV0FOL85Jickpv6ApRgD06QBVXkD147Z4+GSzrzkq9tFLzjiM0XxvYvMfhjplvyzXQZFVwmlUDwcP7PjV1XTYlenN7zH/F58gcydHxM1Tdbz2JMV0jGzS9ixi6hIHWeROTQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:49:33.6182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ea0c75-42eb-418d-ff11-08df08f9052c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654

GPU drivers sometimes need to read a value from a userspace VA when a
dma-fence signals, compare it with an expected value, and only perform
the deferred work (e.g. eventfd_signal) if the comparison passes. This
is the per-signal filtering pattern used in AMDGPU's EOP eventfd path.

Add optional compare fields to drm_user_fence and a new helper
drm_user_fence_set_compare() to configure them. Supported operators are
==, !=, >=.

When cmp_op is set, drm_user_fence reads the value from userspace via
copy_from_user_nofault() and calls ops->worker() only if the comparison
passes. If the process MM is gone or the read fails, the worker is
skipped since the comparison cannot be performed.

Drivers that do not need filtering (e.g. XE) leave cmp_op unset and the
worker is called unconditionally — no behavioral change.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: Ie9620ccccdb894512e7a11e7fb5e4544e5951ec4
---
 drivers/gpu/drm/drm_user_fence.c | 93 +++++++++++++++++++++++++++++---
 include/drm/drm_user_fence.h     | 52 ++++++++++++++++--
 2 files changed, 134 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 0f229b7210a9..fcbdf40d1758 100644
--- a/drivers/gpu/drm/drm_user_fence.c
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -2,16 +2,25 @@
 /*
  * Copyright © 2024 The Linux Foundation
  *
- * DRM user fence — extends drm_work_fence with kthread_use_mm() support.
+ * DRM user fence helper.
  *
- * Use this when a GPU fence signals and work needs to access userspace
- * memory (copy_to_user, fault-able operations) from a kthread context.
- * For work that does not require userspace memory access, use
- * drm_work_fence directly.
+ * Extends drm_work_fence with the ability to access userspace memory
+ * from workqueue context by borrowing the process MM via kthread_use_mm().
+ *
+ * Drivers that need to write completion status to userspace (e.g., user
+ * fences, signaling eventfds) embed drm_user_fence and implement
+ * ops->worker() to do the actual write.
+ *
+ * Optionally, drivers may configure a per-signal compare via
+ * drm_user_fence_set_compare(): work is skipped unless the value at a
+ * userspace address matches the expected value at signal time.
  */
 
 #include <linux/kthread.h>
+#include <linux/mm.h>
 #include <linux/sched/mm.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_user_fence.h>
 
@@ -30,13 +39,42 @@ static void drm_user_fence_do_work(struct drm_work_fence *wfence)
 	struct drm_user_fence *ufence =
 		container_of(wfence, struct drm_user_fence, base);
 	struct mm_struct *mm = NULL;
+	bool call_worker = true;
 
 	if (mmget_not_zero(ufence->mm)) {
 		mm = ufence->mm;
 		kthread_use_mm(mm);
 	}
 
-	ufence->ops->worker(ufence, !!mm);
+	if (ufence->cmp_op != DRM_USER_FENCE_CMP_NONE &&
+	    !(wfence->fence && wfence->fence->error)) {
+		if (!mm) {
+			call_worker = false;
+		} else {
+			__le64 raw;
+
+			/*
+			 * Use copy_from_user_nofault() to prevent a
+			 * userfaultfd-registered page from blocking this
+			 * workqueue thread indefinitely (DoS).
+			 */
+			if (copy_from_user_nofault(&raw, ufence->cmp_addr,
+						   sizeof(raw))) {
+				call_worker = false;
+			} else {
+				/* GPU writes LE; convert before comparing. */
+				u64 cur_val = le64_to_cpu(raw);
+
+				if (!drm_user_fence_cmp_match(cur_val,
+							      ufence->cmp_value,
+							      ufence->cmp_op))
+					call_worker = false;
+			}
+		}
+	}
+
+	if (call_worker)
+		ufence->ops->worker(ufence, !!mm);
 
 	if (mm) {
 		kthread_unuse_mm(mm);
@@ -63,8 +101,47 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
 			 const struct drm_user_fence_ops *ops)
 {
 	drm_work_fence_init(&ufence->base, wq, &drm_user_fence_wfence_ops);
-	ufence->mm = current->mm;
+	ufence->mm        = current->mm;
 	mmgrab(ufence->mm);
-	ufence->ops = ops;
+	ufence->ops       = ops;
+	ufence->cmp_op    = DRM_USER_FENCE_CMP_NONE;
+	ufence->cmp_addr  = NULL;
+	ufence->cmp_value = 0;
 }
 EXPORT_SYMBOL_GPL(drm_user_fence_init);
+
+/**
+ * drm_user_fence_set_compare - Set per-signal compare filter
+ * @ufence: user fence
+ * @addr: 8-byte-aligned userspace address to read from at signal time
+ * @value: expected value to compare against
+ * @op: comparison operator; pass %DRM_USER_FENCE_CMP_NONE to disable
+ *
+ * When @op is not %DRM_USER_FENCE_CMP_NONE, the worker is only called
+ * if the value at @addr matches @value according to @op. If the MM is
+ * gone or the read fails, the worker is suppressed.
+ *
+ * Must only be called before drm_work_fence_add_callback().
+ */
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op)
+{
+	/*
+	 * get_user() of u64 is not atomic on 32-bit — caller should not
+	 * reach here on non-64-bit kernels.
+	 */
+	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_64BIT)))
+		return;
+
+	if (op != DRM_USER_FENCE_CMP_NONE) {
+		if (WARN_ON_ONCE(!addr ||
+				 !IS_ALIGNED((unsigned long)addr, sizeof(u64))))
+			return;
+	}
+
+	ufence->cmp_addr  = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op    = op;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index 9b92498e6009..56918928bb4f 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -20,8 +20,9 @@ struct drm_user_fence_ops {
 	 * @worker: Called from workqueue context with the process MM active.
 	 *
 	 * If @mm_ok is true, kthread_use_mm() is active and userspace memory
-	 * may be accessed safely. If @mm_ok is false, the process MM was
-	 * already gone; skip the userspace write.
+	 * (copy_to_user, etc.) may be accessed safely.
+	 * If @mm_ok is false, the process MM was already gone; skip the
+	 * userspace write.
 	 *
 	 * wake_up() or other post-signal housekeeping should also happen here.
 	 */
@@ -34,11 +35,23 @@ struct drm_user_fence_ops {
 	void (*destroy)(struct drm_user_fence *ufence);
 };
 
+/**
+ * enum drm_user_fence_cmp - compare operator for per-signal filtering
+ */
+enum drm_user_fence_cmp {
+	DRM_USER_FENCE_CMP_NONE = 0,
+	DRM_USER_FENCE_CMP_EQ,
+	DRM_USER_FENCE_CMP_NEQ,
+	DRM_USER_FENCE_CMP_GTE,
+};
+
 /**
  * struct drm_user_fence - DRM user fence with MM borrowing
  *
  * Extends drm_work_fence with kthread_use_mm() support for drivers
  * that need to access userspace memory when a GPU fence signals.
+ * For work that does not need userspace memory access, use
+ * drm_work_fence directly.
  *
  * Call drm_user_fence_init() at creation and drm_user_fence_add_callback()
  * to arm on a dma-fence. Call drm_user_fence_cancel_sync() before teardown.
@@ -50,11 +63,20 @@ struct drm_user_fence {
 	struct mm_struct *mm;
 	/** @ops: Driver operations. */
 	const struct drm_user_fence_ops *ops;
+	/** @cmp_addr: Userspace address to read for per-signal compare. */
+	u64 __user *cmp_addr;
+	/** @cmp_value: Expected value for per-signal compare. */
+	u64 cmp_value;
+	/** @cmp_op: Compare operator; DRM_USER_FENCE_CMP_NONE disables. */
+	enum drm_user_fence_cmp cmp_op;
 };
 
 void drm_user_fence_init(struct drm_user_fence *ufence,
 			 struct workqueue_struct *wq,
 			 const struct drm_user_fence_ops *ops);
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op);
 
 /**
  * drm_user_fence_get - Acquire a reference to a user fence
@@ -105,11 +127,35 @@ static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
  * drm_user_fence_cancel_sync - Cancel callback and wait for worker to finish
  * @ufence: user fence
  *
- * Must be called during teardown before freeing resources. May sleep.
+ * Must be called during teardown before freeing any resources accessed
+ * by ops->worker(). May sleep.
  */
 static inline void drm_user_fence_cancel_sync(struct drm_user_fence *ufence)
 {
 	drm_work_fence_cancel_sync(&ufence->base);
 }
 
+/**
+ * drm_user_fence_cmp_match - Test a value against the compare filter
+ * @cur_val: value read from userspace (already converted from LE)
+ * @cmp_value: expected value
+ * @op: comparison operator
+ *
+ * Return: true if the comparison passes, false otherwise.
+ */
+static inline bool drm_user_fence_cmp_match(u64 cur_val, u64 cmp_value,
+					    enum drm_user_fence_cmp op)
+{
+	switch (op) {
+	case DRM_USER_FENCE_CMP_EQ:
+		return cur_val == cmp_value;
+	case DRM_USER_FENCE_CMP_NEQ:
+		return cur_val != cmp_value;
+	case DRM_USER_FENCE_CMP_GTE:
+		return cur_val >= cmp_value;
+	default:
+		return false;
+	}
+}
+
 #endif /* __DRM_USER_FENCE_H__ */
-- 
2.34.1

