Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF51DE4EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413507; cv=fail; b=TfknF+1Lx81ya27n5V/d4ljzbGA5oeXtNsLMflcADLcivjMGhJjolYX0VkpNRri7TnYOvnfDmYC57oUcR2SV6vikoAO5ofkdmtUkLwE59jjbgLNJyOrLuFJK16qED9nuxfhrNHLWvBKtVO93hMdJ6p6uJ7yN953Nw81mFukIudg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413507; c=relaxed/simple;
	bh=OsYQHhGkfYE+mM237vGhq8y0IZyfijJMYRrUpFchSr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X960rw5yKOJbxlFUKkyWaDW/anj/pj4XKNaomyM2/OaJdTefeOSbrnQ4oyU+bPtRZHzaiiHpWPzqzSc0FsCyhCCrsRUaBm7N7SVIaDz9+R3LPPf/oVa5ncX+SbOfUcuVRxrUiZsG+J9BDhmX3Aa7L/l5/CNddqS1tLg6iEWIzHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bfJ5FEsh; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bfJ5FEsh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVKt/3AnKlAUor9PfE9h+D1djBSmL4DJ5dcZT0kXiuL5rtMyNBQe7fR6beR8SKJsUALWsy6omq/2MmBp9RMgLrCy0r1W1VcixLdxhIVWRuCcP8jTndiZiIlf1TQ7jDfwGA/CiTE4zRIo+I7anlR3h/X4FV3HCK68EnClVpawdG2+GmskvSio6V+CqCxiVjKpZaIw/gCYgv5R1AEU1+k9CWhW+fGmexTbRssL8ATdnwHtkKoeyECSHUr1zWCxYKR5tHh7qSqJY8ADX98J+Bab5ORuAxfEa0PXF+hTAfajfJubv7ZVbvi+nrZa9Tf0bNXN656cXEos3pBgwgOESwWMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p02DRyRHzdQrkMGdssZqf3qoZ6DZIP0aA0DNI1jTZU=;
 b=S+ppA0nBbdSHUhdgdAC1uxsylOXn+bRny0TF1K9zev/V66Nk8egSAlxh4Yuc+xgh46GjIq1AaSiH5OYd4yHV/UJMPx+gjIXUYjU+uRpb4kaF12oEsveyHNkfX2woVRSmDn/BZBRcRMue/Ao8tKLRCbR/OVfaP2gVWsltwJPrOfNTBout3HJCMna5OKWtawI1YmDSGCXGAAXdLStE7sm+MDy/O0OY3v+WAygrNqUR1n8qmSQLo0x+yth8gLchwzAgiUmKu68+N8QmwZz6JBtLibPxLJFQwHIBCtUTVJTW4x7e70QXUTDjP3mOoQXaQv8NA58hYRJ2t0L7+y3/Ve1SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p02DRyRHzdQrkMGdssZqf3qoZ6DZIP0aA0DNI1jTZU=;
 b=bfJ5FEshdAcAY9XHNqfxCIPoZMwxyd9eJwFjtzCt+tuov/gIqzkVpessboHEf8gUpcwGaiybogfOq81k4m6DKJOjFjgnvH6n5HhDLy3jLeLDqWFjLHPElSimr2QJzlNRy4BHda9TjjBJWbWm4elHEnRXkI1MdCGT8jfTz+L6ZcI=
Received: from BN0PR04CA0104.namprd04.prod.outlook.com (2603:10b6:408:ec::19)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 05:31:38 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ec:cafe::71) by BN0PR04CA0104.outlook.office365.com
 (2603:10b6:408:ec::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 05:31:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Thu, 3 Sep 2026 05:31:38 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:31:34 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Thu, 3 Sep 2026 10:59:45 +0530
Message-ID: <20260903052945.190435-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903052945.190435-1-srinivasan.shanmugam@amd.com>
References: <20260903052945.190435-1-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f47119a-cf54-421f-5731-08df097ca068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|10067099003|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v0q0uhO+VP8W8/S0CjeQMv5iWzHWHzvh/nnj8Iff2JWRUvXAEnShnVVXuRgGWHUrz+zP5pLQsWR+MutoIvh4T932EDcC8A0LRihPfT86HmfJkHau4RrU8NaQOxOmy5p291tDpccMTo9nCnsJ1ec0TdJT/6tZkiZ7MNrXXzeT/SIXNFOhrJtSpunTOdiMqiygZUwfyL1PCaJtcI3fmh/FQuo0ZtDtuYRODhdLRiexWwmeHwdH3NkVdp8yMLqD5dvhjiLhSVUPphbYX3zmu5id/ZwLo6pelblrATXkJSkTXcCkcAkrSnoTpv0uOX10qrqYbujwNOOn8vBftEkdBJ6VDjny8lJmQYQX0OHDyL49ZiehduDOXDoqRwbSkrZ6yi7EjMs3zvk6D9ElK3DN5Pe8++ItHD20Q1hW74pXUqQAfoHDXFuNB580vnFlkiltYDs3sx516lvFGOTSe0YATVhrkbVukWo1YuuAoWxcMRRof3+oPForK1k05LtAyI+NoFK56E0fnJONIGpl2nxs2OyJAfXX1GMfh/4uyCI/ijlQM7dW56htECsQ7d5uzF3YpeULgdBWGEER+ZYHX1MnsUueBgJ2Z6MOcl81/TnBM1ttyucf0VOglHHGnnoSaQdIVUGM/4kaGTql/ZG03OOhOOfXk90BWD5hjOoOTqwMWLqwhPx+8wzwxk46TIxyXqKOJ36YaNuZuIMHTaPooJ4MwpbHHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(10067099003)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mduV+ynbEZ/CVKjUgMycE5Oih6z3mrQRA8IdMLIcMo7dJvRyYMktkL107SsoNb6q7usRzDwpJk/UkzTs6qQTXaeyWSwAMusZaB6T/xzzrLLBuI8wkW0XGh5Z+JByXYl0g86i1Lch+OGT/wkmrtmKXV+2ePidbjt/XlprY95Aif4VcsiHgEOhteJstVh4qIEQeFLx22ZvmxeMJHTloLEPnz0s+QTbzqTzxuLQE9URYsV1iVs2E+cj8Ca33Njmbab5og/A/Mtj4QSO8nj7bi2oPMnHbOzGVEGSgsAljj885eu+JRUwSPjU6KSHQacJ8n6pTLPCbqHBY13Cna8ipW/y4eoqu+0u5sc7BwSNwssEBJW/paqcjzFfO+Yf/UxJ53WC4X3VtcM54crax34iAJQfe8qCQlDGL5Dx+LILy4vjIX+/X2o9LypRikAh2rd7wpPm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:31:38.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f47119a-cf54-421f-5731-08df097ca068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949

GPU drivers sometimes need to read a value from a userspace VA when a
dma-fence signals, compare it with an expected value, and only perform
the deferred work (e.g. eventfd_signal) if the comparison passes. This
is the per-signal filtering pattern used in AMDGPU's EOP eventfd path.

Add optional compare fields to drm_user_fence and a new helper
drm_user_fence_set_compare() to configure them. Supported operators are
==, !=, >=.

When cmp_op is set, drm_user_fence reads the value from userspace via
copy_from_user_nofault() and calls ops->worker() with mm_ok=true only if
the comparison passes. If the process MM is gone or the read fails, the
worker is called with mm_ok=false to allow mandatory housekeeping (e.g.
wake_up()).

Drivers that do not need filtering (e.g. XE) leave cmp_op unset and the
worker is called unconditionally — no behavioral change.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: I200dd4bf32286ba9bdd2ecb68fffb3c205f9fd52
---
 drivers/gpu/drm/drm_user_fence.c | 104 ++++++++++++++++++++++++++++---
 include/drm/drm_user_fence.h     |  47 +++++++++++++-
 2 files changed, 142 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 0f229b7210a9..6dc57f556aba 100644
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
 
@@ -30,13 +39,50 @@ static void drm_user_fence_do_work(struct drm_work_fence *wfence)
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
+			 *
+			 * If the page is not resident, skip the worker to
+			 * preserve compare filter semantics — the caller must
+			 * ensure the compare address remains resident.
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
+	/*
+	 * Always invoke the worker so drivers can perform mandatory
+	 * housekeeping (e.g. wake_up()). Pass false if the compare
+	 * filter suppressed the write.
+	 */
+	ufence->ops->worker(ufence, call_worker ? !!mm : false);
 
 	if (mm) {
 		kthread_unuse_mm(mm);
@@ -63,8 +109,50 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
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
+ * with mm_ok=true if the value at @addr matches @value according to @op.
+ * The worker is always called for mandatory housekeeping.
+ * If the MM is gone or the read fails, mm_ok is passed as false.
+ *
+ * Must only be called before drm_work_fence_add_callback().
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int drm_user_fence_set_compare(struct drm_user_fence *ufence,
+			       u64 __user *addr, u64 value,
+			       enum drm_user_fence_cmp op)
+{
+	/*
+	 * get_user() of u64 is not atomic on 32-bit — caller should not
+	 * reach here on non-64-bit kernels.
+	 */
+	if (!IS_ENABLED(CONFIG_64BIT))
+		return -EOPNOTSUPP;
+
+	if (op != DRM_USER_FENCE_CMP_NONE) {
+		if (!addr || !IS_ALIGNED((unsigned long)addr, sizeof(u64)))
+			return -EINVAL;
+	}
+
+	ufence->cmp_addr  = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op    = op;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index d35438eaa9e2..94bc2fd59d73 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -40,11 +40,23 @@ struct drm_user_fence_ops {
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
@@ -56,11 +68,20 @@ struct drm_user_fence {
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
+int drm_user_fence_set_compare(struct drm_user_fence *ufence,
+			       u64 __user *addr, u64 value,
+			       enum drm_user_fence_cmp op);
 
 /**
  * drm_user_fence_get - Acquire a reference to a user fence
@@ -112,11 +133,35 @@ static inline bool drm_user_fence_cancel(struct drm_user_fence *ufence)
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

