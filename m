Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF745C719
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188225; cv=fail; b=GmTgQoT3HaI9s8OnveqmjjogoJtiKSfzDgs0qx67oSCpC/PBt4o2qMpUCGRkF+FPoHPnp1ChYKRSUHZYJDg9yk8cBSob7S6zSxKKB6QbkZQSecM/yOZErdosRD9L82TQqrvzML9v0BktxuWtifMvnMUC7U4s2sXiqGzoHLFhTAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188225; c=relaxed/simple;
	bh=X581YPKSaas+ne3PcJgB6fZeK+GNs+taYZHzToheHy8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIhdPeWAPpCFTcNYfH1bKLDEAZ9F1JR2Aql8pght5Fgy/mA/lIcMqiA+TiK3P1qU3wVaOIcJ70OkZQ2v/zUwaLsgsGqQ6QJdFziHnTokvgJ26I2R1/yifTIVq6svJNOBTgTzGd/OtK4J3qT7G8tiEcsSCyzMbogTEK6tQxf5QMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HYVUa2fV; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HYVUa2fV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJqSmRYwwz8+bD2INm7q7ASCFhVFHmH9NQPWvoGoJ92BPcIHqeS23pT22zqH8VmnhC8kqUGvlJZZYn/Xl6QkbVeQccawRUxkBFtcaBJ5uwZ59cnm5yAWNVVkuPcKd8vy9KDykzXF582yOWdvY5tgkt4hPLuXJTvRCnygAVuQqNlhJZhPUGlEFgtF3bxEY8etijHPiDH/a4WYyZCC0JV7OnZ1rDNhdo72B/k0ueqs9HQm7v2KgfcffXgAvHwTATVnKqEXjeXQMChxrm3mVRdXOa72hJXWqiRsTyRGcidHyMN+QLt4cUKRmwN94nDdCMD2YZeo1s9J5arSNU1VoouM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r8ooroqJoA2dO5TWTPUHHAKVgikUG+JDn0+dL2CfVU=;
 b=XkGqQwcg4ZaoP78qc0gscR/Fk9H3oVCMLdB2vnLMiJP7D6yqXYRnZgpG76ZzQJxuFvrD9UnUuf2+CwxUpIOTYhGE+q/Ag5lVsh3+cI5m62NVO7C7dUOAnkgeaMPjIdIRNMLykaS3vjfXL0G47ZuKXbsK9FOhQgSfWtx7R+dSFSd5rLRmJBE5C52XvaYazvdj6hpY2LTuWFG7V8JM/3q/XQTjKh/Obc26dbluXVEzDOdSua4qjLX65LCAFwL3XY0sms2V6N/q3Nesty+8kXzU0mh9/a3rZbUUKo+fXvzeXdDxXXpABhOob/0AvERX3HCK1150x75j35iClw9ET2OKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r8ooroqJoA2dO5TWTPUHHAKVgikUG+JDn0+dL2CfVU=;
 b=HYVUa2fVViKHr2kY9kceqAffo159Qr3cJWFgBHEszeGhcuwzdWt2IzRJLXHAfShOCEN0r65GIjG36Am0SzLZy05b4SKh+ehvsfPWbsvIB1DEA7HveupfPF6zhDc8PGHLx1mes1xj5Lc2YcLvFLN/UivUadTuTysJvQrKG+Wteuc=
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by DM4PR12MB5843.namprd12.prod.outlook.com (2603:10b6:8:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:56:56 +0000
Received: from BN3PEPF00022BC5.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::10) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 14:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC5.mail.protection.outlook.com (10.167.248.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 14:56:55 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 09:56:54 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm: Add per-signal compare functionality to drm_user_fence
Date: Mon, 31 Aug 2026 20:26:37 +0530
Message-ID: <20260831145637.126892-4-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC5:EE_|DM4PR12MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9cf3e1-8d53-42c3-7668-08df077019aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	guO2IOJE+lm4Msztz885pxuM939KwhYfPsc227zqX9qJFCYjaoPdTE6kpxs/f7N/XOtKG+6HI6Yl00n8iFKPIeOjj/gCi5fpHQ/VRATheJfNPiWfY8mAKMinAVK6ZYWcVNFqtHH5gGFTUbrCMiGAPnSvhgK/PAE5UTLIgpclpxPIOVSIuRRzdSjgS44gUfYN5kmTF4MLUP3ykS26tjnl62a+a3bWWREgwwUR4B2yVuAzwQWsPQte2IZDYXN8a+tOjzIbwk+HeseUubqJakGa2QyoZobF6AJHeo1WcA+Iwu1Of9xxsFnZrAbCyzTBTXLuyKPW6qliyhaRiyEE3iztekawFyV89ssrKZo+Rs+vEmXcCeJ57pGW5vdnGnPuSBGRl65tPKLo9JrmN4rXNDwRFiub41/kHKAInNnPWOuvR1kkE/SpmlFcGmjgd098Ms26m+FdafAgxhjP+pNsB3l8Ml3+petjTbTEE4dPo8+J4+5pKMR5lIMh8Oen741E8/NhdTdpMuN8MP9RPAoAYY1Evuf//6hOqS5fYHivYuyVX8EBCMy22n2YJBZnLtJm608aToPDhulyjc0ytS11d7Pp6ssZ2cWvDAdHgedkDlfGACmIW6vUY0GBXrE9xix+yhH9mQTWjgMVLD7T/CprPx43UAOfj1GVcsUn/V4j62WwVZB1vo9f+IoFWx92pzGhlzHBu/npjWS9FgeRxRNUkp/H0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AGweO1nLXzLsr4sIb51QXSsOGJBguRdfAv+4bf5UIOFHlbIHtvgLfgkx5ndfO4V05y+WvfsODLaJvWEjceSrnaD8iB99gbBS+fRd9Gd5BdgO5ZuwbtOyuzS4XENyUuHon6idmMinXEzcXhKCuJkQNKNOBVJYdQnD2FZloiL8gPGfeLImn4dept6p0XrD/Gk//lolnJSVjepAmDsrN/JubFcqPRP1p2ukW1S/ZE1RHMoDu+PisCU4oN95wiPT+xlRw31ylCfTs+DFKqDSBMFrG5jgo5Hb6NPrP5BPpsICkVpDiV7TcSJA6sdWNCNiBp5/9jOkyHW0fV7Xv24rJuG1We6067uIbPBESEBjdIyy3evEjvrMerLU20Qy0F/q1jw5byIWpSsMZMZGRGdoTcE3CMulqswikNOjVJrFwq/Wb2jpl0hrCFZ0xaY+L5hGRBYQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:56:55.7796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9cf3e1-8d53-42c3-7668-08df077019aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5843

GPU drivers sometimes need to read a value from a userspace VA when a
dma-fence signals, compare it with an expected value, and only perform
the deferred work (e.g. eventfd_signal) if the comparison passes. This
is the per-signal filtering pattern used in AMDGPU's EOP eventfd path.

Add optional compare fields to drm_user_fence and a new helper
drm_user_fence_set_compare() to configure them. Supported operators
are ==, !=, >, >=, <, <=.

When cmp_addr is set, drm_user_fence reads the value from userspace
via get_user() and calls ops->worker() only if the comparison passes.
If the process MM is gone and cmp_addr is set, the worker is skipped
since the comparison cannot be performed.

Drivers that do not need filtering (e.g. XE) leave cmp_addr NULL and
the worker is called unconditionally — no behavioral change.

Suggested-by: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: I03a726d5368674d06bd40fe7d11effd88c492741
---
 drivers/gpu/drm/drm_user_fence.c | 91 +++++++++++++++++++++++++++++++-
 include/drm/drm_user_fence.h     | 29 ++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_user_fence.c b/drivers/gpu/drm/drm_user_fence.c
index 664178e2d74c..e543b9349067 100644
--- a/drivers/gpu/drm/drm_user_fence.c
+++ b/drivers/gpu/drm/drm_user_fence.c
@@ -12,21 +12,74 @@
 
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
+#include <linux/uaccess.h>
 
 #include <drm/drm_user_fence.h>
 
+static bool drm_user_fence_cmp_match(u64 cur_val, u64 expected,
+				     enum drm_user_fence_cmp op)
+{
+	switch (op) {
+	case DRM_USER_FENCE_CMP_EQ:
+		return cur_val == expected;
+	case DRM_USER_FENCE_CMP_NE:
+		return cur_val != expected;
+	case DRM_USER_FENCE_CMP_GT:
+		return cur_val > expected;
+	case DRM_USER_FENCE_CMP_GE:
+		return cur_val >= expected;
+	case DRM_USER_FENCE_CMP_LT:
+		return cur_val < expected;
+	case DRM_USER_FENCE_CMP_LE:
+		return cur_val <= expected;
+	default:
+		return true;
+	}
+}
+
 static void drm_user_fence_do_work(struct drm_work_fence *wfence)
 {
 	struct drm_user_fence *ufence =
 		container_of(wfence, struct drm_user_fence, base);
 	bool mm_ok = false;
+	bool call_worker = true;
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		mm_ok = true;
 	}
 
-	ufence->ops->worker(ufence, mm_ok);
+	/*
+	 * Per-signal comparison: read a value from userspace and compare
+	 * with the expected value. Skip ops->worker if the condition is
+	 * not met. Drivers that do not need filtering leave cmp_op as
+	 * DRM_USER_FENCE_CMP_NONE.
+	 *
+	 * If the fence signaled with an error (e.g. GPU hang), bypass the
+	 * comparison entirely and always call the worker so userspace is
+	 * notified rather than hanging indefinitely on a stale value.
+	 *
+	 * If the MM is gone and cmp_op is set we cannot perform the
+	 * comparison, so skip the worker rather than calling it without
+	 * having verified the condition.
+	 */
+	if (ufence->cmp_op != DRM_USER_FENCE_CMP_NONE &&
+	    !(wfence->fence && wfence->fence->error)) {
+		if (!mm_ok) {
+			call_worker = false;
+		} else {
+			u64 cur_val;
+
+			if (get_user(cur_val, ufence->cmp_addr) ||
+			    !drm_user_fence_cmp_match(cur_val,
+						      ufence->cmp_value,
+						      ufence->cmp_op))
+				call_worker = false;
+		}
+	}
+
+	if (call_worker)
+		ufence->ops->worker(ufence, mm_ok);
 
 	if (mm_ok) {
 		kthread_unuse_mm(ufence->mm);
@@ -65,5 +118,41 @@ void drm_user_fence_init(struct drm_user_fence *ufence,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 	ufence->ops = ops;
+	ufence->cmp_addr = NULL;
+	ufence->cmp_value = 0;
+	ufence->cmp_op = DRM_USER_FENCE_CMP_NONE;
 }
 EXPORT_SYMBOL_GPL(drm_user_fence_init);
+
+/**
+ * drm_user_fence_set_compare - Configure per-signal value comparison
+ * @ufence: user fence
+ * @addr: userspace VA to read when the fence signals
+ * @value: expected value to compare against
+ * @op: comparison operator (see &enum drm_user_fence_cmp)
+ *
+ * When set, drm_user_fence reads @addr via get_user() each time the
+ * fence signals and calls ops->worker() only if the comparison passes.
+ * If the fence signals with an error (e.g. GPU hang), the comparison
+ * is bypassed and ops->worker() is always called.
+ *
+ * Must be called after drm_user_fence_init() and before
+ * drm_user_fence_add_callback().
+ *
+ * Note: get_user() of a 64-bit value is not atomic on 32-bit systems.
+ * This function is only safe on 64-bit architectures.
+ */
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op)
+{
+	WARN_ON_ONCE(!IS_ENABLED(CONFIG_64BIT));
+
+	if (op != DRM_USER_FENCE_CMP_NONE && !addr)
+		return;
+
+	ufence->cmp_addr = addr;
+	ufence->cmp_value = value;
+	ufence->cmp_op = op;
+}
+EXPORT_SYMBOL_GPL(drm_user_fence_set_compare);
diff --git a/include/drm/drm_user_fence.h b/include/drm/drm_user_fence.h
index 2b2b640f510f..764dd55ed3a2 100644
--- a/include/drm/drm_user_fence.h
+++ b/include/drm/drm_user_fence.h
@@ -33,6 +33,22 @@ struct drm_user_fence_ops {
 	void (*destroy)(struct drm_user_fence *ufence);
 };
 
+/**
+ * enum drm_user_fence_cmp - comparison operators for per-signal filtering
+ *
+ * Used with drm_user_fence_set_compare() to control when ops->worker is
+ * called based on a value read from userspace.
+ */
+enum drm_user_fence_cmp {
+	DRM_USER_FENCE_CMP_NONE = 0, /* always call worker — default */
+	DRM_USER_FENCE_CMP_EQ, /* call worker if *addr == value */
+	DRM_USER_FENCE_CMP_NE, /* call worker if *addr != value */
+	DRM_USER_FENCE_CMP_GT, /* call worker if *addr > value */
+	DRM_USER_FENCE_CMP_GE, /* call worker if *addr >= value */
+	DRM_USER_FENCE_CMP_LT, /* call worker if *addr < value */
+	DRM_USER_FENCE_CMP_LE, /* call worker if *addr <= value */
+};
+
 /**
  * struct drm_user_fence - DRM user fence with MM borrowing
  *
@@ -51,11 +67,24 @@ struct drm_user_fence {
 	struct mm_struct *mm;
 	/** @ops: Driver operations. */
 	const struct drm_user_fence_ops *ops;
+	/**
+	 * @cmp_addr: Userspace VA to read for per-signal comparison.
+	 * NULL means always call ops->worker (default XE behavior).
+	 * Set via drm_user_fence_set_compare().
+	 */
+	u64 __user *cmp_addr;
+	/** @cmp_value: Expected value for comparison. */
+	u64 cmp_value;
+	/** @cmp_op: Comparison operator. */
+	enum drm_user_fence_cmp cmp_op;
 };
 
 void drm_user_fence_init(struct drm_user_fence *ufence,
 			 struct workqueue_struct *wq,
 			 const struct drm_user_fence_ops *ops);
+void drm_user_fence_set_compare(struct drm_user_fence *ufence,
+				u64 __user *addr, u64 value,
+				enum drm_user_fence_cmp op);
 
 static inline void drm_user_fence_get(struct drm_user_fence *ufence)
 {
-- 
2.34.1

