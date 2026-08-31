Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFEC4AA1E6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196990; cv=fail; b=hx3bL1llFUOFx/A1dNehNsrneA7QLStzw+ds6wx58ESCvIu4XFdTeZsoO9Hg2vicGqYCTopTW40p/4Pivblr5dQ4Ai678ylbjuLmkS0+ryKBLKpf1HsxRse9WbHbxNWBLEepa16TonjS3tOOxlt2142ieYJZqD6UK9qkMk5+sCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196990; c=relaxed/simple;
	bh=u/D0M5gLOGYWHlO8fPf80fT3LSHnVNMFFJZt7IzGteY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yu7h2TSRPgz2/IwE1beOFowIWqsAGzDRSZ58X5LFOJuVrtQ0nhqGPbgmzKOrkH0oOPvVE6sxgOIRFEw0NYOViWskbEF9iwqOS8sDki28mdxPhi7DOQ4FIJdeiyhD+zw79hMhpH5PCG6mmZ6YCyzGqq6NwU8qQHwK4qaO+ZymkCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rzCMc6T2; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rzCMc6T2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBTqx2PartAKTxzlYZZ7Zfsb7ZSmyG0Iyfrp9A6Gfhc0VCXylWYip4E959KAjuTnA4N+rpYpizbug0KL780c3AlQfL1s7HBcG8wXx0JttE30PkcRyasC5l2lpYxBb3eka/JgWpo7SC5YsEjhGGIDim08ypYUeARYPUfhINoGPh1tgs2jOAr5B8KHsOLn0X4zjvGxV31irWsL7cf23HvDEJfGmHTIYdyOlPx9+HrSH1k9TcnXuj2bOEJXTvS7M3eFpI862PxCPQGfKlNuOLfayF57ClmI6d8ttuZGiSCfXV+9F9mQQG2032c07i/IMQV3KBcfFVcNQ7H5Stqu/jojmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efibv5WKF0zXRvUPIbqRlje9mIfkSR8F59f03DhsrzQ=;
 b=xxLv1trYKT17jErgrT6HG2CpxTqv+KfWi+mY3nDBEP8ay8n9BmtmSWAfQ0a9VXjlUfi3GSQ5Qq71vbxMdx5FkZHFv8X65riTq6UB5+ZVGI0hdFv8q5v9FOVyaI9Cyg9VP4Sv0tHGWeDKaKQSxvsbprlbLoJA/5CnnKdbL7QoXnFy4nkR5sGq2kAJN4vnuEj2FPp3ukWeatgq/R6cnobMqudA2lwYoa4Zc0Di94LtVeRn7s230evD1j6nm4t0pqnabMZufGz2+cS+cAYhsuyyuKLntDwqgM7LLsUQNMThLQAJ35fyZs5s4u9Mv+x8B4QDyA1drglIOa39YHHkgdFwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efibv5WKF0zXRvUPIbqRlje9mIfkSR8F59f03DhsrzQ=;
 b=rzCMc6T2ge2EEtliOmTFDFJlFXaUUFvqTvk2/XdCS1c9CRuR+C2ZzQXhSE23K4vp4BXtRk/f45Bny1/bIcJMMi54xaneCr1ZRKNYE0SXOmghV8FBi7rgi4rwCmOGV5ImMZbkjrGI1i2q4s+qeadqniUYqwlU0wK+2w5AL0t5sv1c4ausVfS+2f9gr58PK3i4q34Iow4mXXIqGZagQK/FbE4d+B2y+aqPVFH8y4wsIiBFd1OfMuaW9uoAfifv0ixPg61gOWk1bKjtIxefweudMYc7vt4MKShNlUtxk5nRwrzE2lqvBPCX4ngMdWqoCK+7b+xyxwidoAgBkFAPcn+XJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:58 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:58 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 06/19] arm_mpam: Support memory-level MSCs and ABMC per class
Date: Mon, 31 Aug 2026 10:22:32 -0700
Message-ID: <20260831172245.42253-7-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf353ff-4b63-4bf3-84e4-08df078480c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ure3T5daX7qfzGxV8CIOakAuGEKF2bLaiL72DL3jW2DS2/Aw5H374fZKfGm9PjSpHjg6x4v/jTjsIPZq6TyDdPDecPC6Jxo6ouz6haD27UAQZfT2t0Ak61OxrhrtTdK4mHJ5Auw0Zi+SEJ3Li0BPZvHgTqC6Zz7uNJ5eSTv32DBD0Dy6qfH+gjHyEXjpSOwL+NQNkXwLH4bDy+yQEjse5GM5L6w4gep/aj979skOf8lwzPXKtrdQWdRDqNZvWIAHwdRKcWt96KbSIFzMmvSYsXPvC7WU4rakmtwu1rX1joK+tPD/GnJxuSJibZGdVeUYmivfrLVe2FSpI2k1oyac84X651h+hOvvYXBnE4/EOK+39xiO02gxQ9+tSMJjp+Aoz2PDCfqIGHnpD3S80Dz0KMw9LCIOqdOxHgMv4CK3eV0lNRWM07PqQHBHe+NERCMmdErQQf5wKvwvJVUnToal93WCFWLZnldA3WoA1O0UCIk+yIuDq4eEnLYM/onR05o2DXYKTfh70KE8QVJKDoZ2PXQggw25gML/mi8RS4KAmk+gVks0tRvl3IB6h6oYkOWOqr2AhTBzTjdqs/YAfLx4mFEph72MbZInAl/gxR+EPsmGj92etqJIGtyqrrXyiijEH7bdFs0+rwJb5xiqnTO/6t04JGHXEhq01RNOPhC+YKdUVUesqNQaqtqL8kgm2n5aKWSS8S9N/2Y2PsjXVnamzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+uvjzNWJfjiYE1hMA+TrofBHgVMuilFmD4y9GC3cgorwTCTB+lOIbmqjSuMp?=
 =?us-ascii?Q?PXcss3RiH/w7XGBhHvY7C495Wvq/9cIZxG1jgziUeWZTKxi8F4sMm3zkkhxw?=
 =?us-ascii?Q?igUxFp5dNYwARyjvPvYclCgSBgtIscF5bWRGO6eZfhzKlg8XEVeHForL0qQF?=
 =?us-ascii?Q?f1H8RBGtMAnhQOejvOUZISbY6yoZyfTBWmA760Y/LMrzFrOP8JcfwDEDyxhl?=
 =?us-ascii?Q?sAylh/uo+WnHHRMe71YEw45xnm8rlg42ZX1i3i/HanrhwfBROH5sK5pFsXWR?=
 =?us-ascii?Q?rZVnpAAmxE13RgqgzXOQApJlQztqaj9Dp4hWYPlAG7IuEXBYR46rNkaLVdcx?=
 =?us-ascii?Q?NnWu12Eb0DAn/zpu8LLSRD5TRKP8tSEh4lBgZRdojbgAmfM3IYG6+Aq6d4sG?=
 =?us-ascii?Q?gQXQbP8KJMra5jmXprvdnBCNyFdsimGrFg6weJD2OEoAU/8f1CJtrg47X5Yk?=
 =?us-ascii?Q?3PC/pyrb2XjGy9c1cPnqS7Gl43tcACNpR3k26KGfz8VfRiTH0FKwZTdaG3hd?=
 =?us-ascii?Q?xaJxEN9EmKl9LpAruToHlMYhjyKYVYEXnFxJPsxiPV1VXFsYrvr9t4uqjZtH?=
 =?us-ascii?Q?VvD8IUwsTqrq554v0Jmbvr7LXajPm7d1BVVdJ5wG+rgMzAAfFfwsq4B5HFkb?=
 =?us-ascii?Q?jGAHu5utJtZiEI46xXhiEzaNwTIPOtJX96C0fCL/eHqPvaecxPvMMX31xbUf?=
 =?us-ascii?Q?rYQS80TJDLlKjhTeuc6xBaXg+g3pBl2UcGTWG5lyJJCQCf7RKb3v2zHHOXlv?=
 =?us-ascii?Q?EsDHYVw8WbKfkbnY0DXHueKPjBpePA8rAQ6bwNx+iXx8Ae6He54k59RIlyID?=
 =?us-ascii?Q?Eo33/K77u5g78HNcS4tT9jAT7XTseBa9v2ZK9dPkvoo1CQyUBP9rIVWCcNvK?=
 =?us-ascii?Q?HCJv7zLhN9VrSWAXS+tkORDh6nStQCBv/a8Rl7eN2xjqlDDf6gy5CUyyxyrI?=
 =?us-ascii?Q?B02QeYmt2dScCThcq/AC8hfFkMNI2xgcBZuh8jrOk2jmqubDnhv5tqxMuFA8?=
 =?us-ascii?Q?B3F+IpKV+dhqtq/Qv1FMvnZSBZItRb07NZOvs2D0c5KwWeoMcG3s38ppsoHu?=
 =?us-ascii?Q?AitSEo+DevJ8lZ3a5cqn1AUi5eHDMLYk77+qkIp7ne2h7LTPSw4lJY2LDg04?=
 =?us-ascii?Q?yp/nSi1biWIgrdWJ/2WW5T6Fty2NdCPDKKGaTeN4PCP6XcZR2vjq4cv5qOaV?=
 =?us-ascii?Q?DX1+XfqZMj3ge4AuYTDB6sE1EctaRc9yKXYSADON55q7PMP8avhBHk09azjk?=
 =?us-ascii?Q?K5r59uz47Tk96cyP5oDlH6wdMLKWQjqY8h2XKA1ooAqWy7LhP1/8KFAfF6Ay?=
 =?us-ascii?Q?2YpoooynVzN+BNBC8lnWg9YWsvt7BiJMOO9YShKsyM0DlJapeHqyDMfXGg9/?=
 =?us-ascii?Q?gi+Bjqi4i/5EwljfeGD26pVQeQClgUlT1Ms6bFpLecAbo5jNZO1U/YFzBUeq?=
 =?us-ascii?Q?W33/Nmk87Gx34ZyC2fkOrbaAzsIvYaQfhIGuVZy5MxSqiCDN4hLxrworkIcm?=
 =?us-ascii?Q?gDYgI61wZVj3T9obnnISSFon+mGl8Xm9NcyAswv9H94+XiuqeiEEMDsNVoXZ?=
 =?us-ascii?Q?ro7EGzhYdUoYfJq5MVTAL2cXcfyAbHW/ocQrEQSoFhkwwJ5LbJJMa5iMFnmK?=
 =?us-ascii?Q?MgN426EMar76OzHmlNOt126GaoHwZc/7MrJ414BAy0zvSFYPduJ/gjIRNp3x?=
 =?us-ascii?Q?IW37NZSfkYyt1BfmszOE1hQbMjnqiH05T7TFR1rnD8zQ/LgmWWV8UQxae+k3?=
 =?us-ascii?Q?hpkXd2vzEw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf353ff-4b63-4bf3-84e4-08df078480c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:58.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNP1qPJ0l9ZHGgkTgpMNyISzXVRRlIBimNyXeexkg77Lfk2qhygcW4u1tCqrirxBY7wDIgzz4+YA4A/0BG8BOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

Some platforms place MBWU counters on a memory MSC above L3 while CSU
occupancy may remain on the L3 cache MSC. The driver previously assumed
all monitors and ABMC state lived on the L3 resource, which
mis-associates MBA counters, breaks mbm_L3_assignments when multiple
events share a class, and uses the wrong domain ID space for
memory-level MSCs.

Teach MPAM resctrl to map monitor classes to L3 or MBA resources,
initialise ABMC on the resource that owns the MBWU monitor, select the
node-scope MBM total event for memory-side counters, and test
mbm_cntr_assignable instead of inferring assignment support from
whichever monitor happens to share res->class first.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ca2ae4b5cc8a..47a7b18d841d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
  * to those supported by MPAM.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_NODE_MBM_TOTAL_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -88,6 +88,11 @@ bool resctrl_arch_alloc_capable(void)
 	return false;
 }
 
+static bool mpam_class_memory(struct mpam_class *class)
+{
+	return class && class->type == MPAM_CLASS_MEMORY && class->level > 3;
+}
+
 bool resctrl_arch_mon_capable(void)
 {
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
@@ -121,7 +126,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
+	/*
+	 * mbm_cntr_assignable is set only when ABMC is initialised on this
+	 * resource. Multiple monitor events may share res->class (e.g.
+	 * occupancy and MBWU), so assignment support must not be inferred
+	 * from mon->assigned_counters via a class lookup on the wrong event.
+	 */
+	return r->mon.mbm_cntr_assignable;
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
@@ -181,24 +192,41 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
-static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+static struct
+mpam_resctrl_res *mpam_resctrl_res_from_mon(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_res *res;
+	enum resctrl_res_level rid;
 
 	if (!mon->class)
-		return;
+		return NULL;
+
+	for_each_mpam_resctrl_control(res, rid) {
+		if (res->class == mon->class)
+			return res;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_mon *mpam_resctrl_mbm_total_mon(void)
+{
+	if (mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID].class)
+		return &mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID];
+
+	return &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+}
+
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
+{
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mbm_total_mon();
 
-	if (!mon->assigned_counters)
+	if (!mon->class || !mon->assigned_counters)
 		return;
 
-	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
 	if (cdp_enabled)
-		l3->mon.num_mbm_cntrs /= 2;
-
-	/*
-	 * Continue as normal even if enabling cdp causes there to be
-	 * zero counters. This avoids giving resctrl mixed messages.
-	 */
+		r->mon.num_mbm_cntrs /= 2;
 }
 
 int resctrl_arch_set_cdp_enabled(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
@@ -404,6 +432,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 		return mpam_alloc_csu_mon(mon->class);
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_NODE_MBM_TOTAL_EVENT_ID:
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -1160,7 +1189,10 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+			if (class->type == MPAM_CLASS_MEMORY)
+				counter_update_class(QOS_NODE_MBM_TOTAL_EVENT_ID, class);
+			else
+				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1187,7 +1219,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (!resctrl_is_mbm_total_event(evtid)) {
 		pr_debug("unexpected event id\n");
 		return;
 	}
@@ -1204,7 +1236,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
 	}
 
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1303,10 +1335,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
  */
 static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
-	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
 	u16 num_mbwu_mon;
 	int *cntrs;
 
@@ -1317,6 +1349,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	}
 	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
 
+	res = mpam_resctrl_res_from_mon(mon);
+	if (!res)
+		return -EINVAL;
+
+	r = &res->resctrl_res;
+
 	num_mbwu_mon = class->props.num_mbwu_mon;
 	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
 	if (IS_ERR(cntrs))
@@ -1324,12 +1362,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	mon->assigned_counters = cntrs;
 	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
-	l3->mon.mbm_cntr_assignable = true;
-	l3->mon.mbm_assign_on_mkdir = true;
-	l3->mon.mbm_cntr_configurable = false;
-	l3->mon.mbm_cntr_assign_fixed = true;
+	r->mon.mbm_cntr_assignable = true;
+	r->mon.mbm_assign_on_mkdir = true;
+	r->mon.mbm_cntr_configurable = false;
+	r->mon.mbm_cntr_assign_fixed = true;
 
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+	mpam_resctrl_monitor_sync_abmc_vals(r);
 
 	return 0;
 }
@@ -1337,8 +1375,15 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+
+	if (mpam_class_memory(mon->class))
+		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	else
+		res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+	r = &res->resctrl_res;
 
 	lockdep_assert_cpus_held();
 
@@ -1365,8 +1410,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	if (mpam_class_memory(mon->class)) {
+		r->name = "MB";
+		r->mon_scope = RESCTRL_NODE;
+	} else {
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	}
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1376,9 +1426,9 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (type == QOS_L3_MBM_TOTAL_EVENT_ID || type == QOS_NODE_MBM_TOTAL_EVENT_ID) {
 		int err;
 
 		err = mpam_resctrl_monitor_init_abmc(mon);
@@ -1386,13 +1436,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
-- 
2.53.0

