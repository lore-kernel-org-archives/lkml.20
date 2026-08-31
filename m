Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15164ACC8A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197008; cv=fail; b=fbUfE5h1V1WSajSRmmksYBCx6RnlXuB6hqccTDwH7eN89FvLh0Dk9X55nSRqq/JNRd4O1+NS2HN2+YZ4InLA3kwcUe3+DtRh5qJAG2mtpRoByi5pLLww3qjKYfNksrZ9T+Xdtlz4FFObT+3cHP1uvpfAuAcW3Y2x2DFQkQxzD/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197008; c=relaxed/simple;
	bh=eUZIFDQ20jzyLasnorvtEtryXcGrx4aPOQrUdqDmgNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJ6QObdERWWRjNAgzrotguaSaILjrkhmXrwd7xA1YO5/HzQKvXPJAPRu/70taCc1+fRxw1M9Yr7/pwFUgcRE8KkQmUq6nDtS4ihKPzPVLlNiX1tr0WSqgwTxq9E5J1FsSydVleBX3TbLP68r1pv9WIUlXw7YNt9ESzpRCGWLeuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ejId5aib; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ejId5aib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpX7IVwEdaMIy/8MhJ6uzB7Wo8sHFx6e4PaeDWmfiB/10Iw4BBebDRq6jOJhx1lF+v+M/RcUaB6i1JYwGFxd7Q7L+ZF14DWW4UGkJ9HOQ2yexH7YwGkCgiZk36aTy/SRuKtACyO/2BJT9kkr4B+rJLSF6+Ll/kCiZdnlydoOml9rSEZzinpF5FrQhqpXmThR04v578a7qX9PwdoIaMCpLZ2yFgEhhtgzzwOMHTsbwRpSbkQ+WEoE6W72XPOgfFR4YMEwzLDw0AEKQPntGYqROCAApv9QrTPS9VLDDm2Kp8eE6bZbXlC9fV5KYAhlvnFLaSyyL82MGhGi0RgnB8rrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RNFhbjOiewc2L1jafJuiknurXajjDJ+WcX2lCWmsvU=;
 b=So6CmVbO8ntXZm9f2RxyQGiH3NvhrOK7kEXL5uLxwul6sQZOgwOqznqZ4d9NhGuP20eU4kTjO55Hs+hj6Xbv4MrUNvsv0O25SSsPJqJdMF3YSk7gOXpdrFaGoaKCRsZcEUEQ8aFi/HlmXlxO2tPd73i5+oWDJpXNKTL2is9HEv64Br2cXrnsdzb6MSnyKfxF4awuItkM1iQRF7ixquDm5+VaJiRv5DbJZYGXKP8RnPInzmcy2gz0iCqJVvbFCauyHhOkftnpNOdHLix4clkcq/4pZKzVblW9LfyTnjHNTqcJiKAcldedIgUAaXogUkkJp1WMVKoxNBau3PdPIp1Tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RNFhbjOiewc2L1jafJuiknurXajjDJ+WcX2lCWmsvU=;
 b=ejId5aibPHjB35vLANZur9ZEiIBOVTRwKhg4kN97vTtwE/rN5deq0DNhFh44mpwoYYvxpBpcV8e+xqjIk8eioxu2Wtr/AeSKpVMw9ujymk3QBeBh0KsZ4PzWCmjHBdy/0xXFlkEVislPKeDYn8k5KapsxXHN7sU10cgykeo3kkJ/TZU5DVFtkVKj6Ks/Z+GjK0DUmUqJ1mC8Y+bAX26cJSPtxcKcLZYq+1uJLjo8fc1ub69zkYB0DrQkb4qmRjBWWFUILy4pPOA0g58JsnXdIxUY5vBAWwfiR0wPxWFeMDfDEyFubEqWQOZr5nYu+ySCoYgx0in7iQUWcNvHRcC0tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:11 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:11 +0000
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
Subject: [PATCH RFC v2 13/19] resctrl: Add mbm_assign_scope_mode for native assignment file names
Date: Mon, 31 Aug 2026 10:22:39 -0700
Message-ID: <20260831172245.42253-14-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 16486e49-654c-4584-746e-08df078485b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	OkK0NZxGLHPl9xB6c4dJdva9/IA0awO0wLiQ/u6ZrMBeFLFypmESORypzGD4o1BM+wTEj28rneNuFD0IfknvW/GG4xg2kQVgFZ1tLVeAdFzLdHjZbvfCmyYi0W5q1VFh577eOeOdAmpXxRQyHhzz2D6CCey+q2WBjDfOF8ZtGRj6Hw9KsdntJj7cMa10Zaed7P+i0YwRZx+Q+0BXhI4KYkYg6Oi53rK7pyit5ra0GzDFPZ4JAIxL/XF+F/lNm3Rz6ITUm6IdzK4ZpnIoE7I3EgHn7nJy5DxdFf9dhgyYz8bhnnYy5UsMjCyMb3apX6qniQY39r4326/FlayZu7jS75HeW//ld9wbfGZvR2y1RcVcgrmR1h928HEz5gGoAJmfsTXakrGdg1t7HuNKlkyyTRc08CAqzdf9LTyc0PRI5p0FV+uyz3INa51jjWRYpFb00eLAGcbmf06bkzvV/DWr6BcBfcFl47FBdvMeVK0GcnYBgcxGU49BzfG6eMkMGnt7FNOI0VN8sz5GSRTqzUBFjnKQfZln1YGzunJDwKIbOCZsorsrDMzxcm4MEllasKRKbzHLbCeg0oskyUWQ5KJfzd4i0ClCnI7jQbdW/zTHlzfqRrpuvXK9p7Y5CeDPO1zEJOon8Z80xU2ZC97Qjn0KOHvomoMRPWT45SKr4I37ybY35JXJigEv4BTNQ0i0adKRcFIO10J60b0RaBi7qSEiLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U4Ep+lHM1YlaSDEoUI2dtE5GX/aBkVqkf5G2Qi8Vz4Gm91uYLPtIxP31LCCz?=
 =?us-ascii?Q?snxLIT/z8pxOvKzzRxNqUvMGiRhOrCPIKEb7OtLGD7BXzigMouRZOKbVZQt8?=
 =?us-ascii?Q?ADnNowWZD1pkODpxGjY6H4KNY2Jb+TMV4DQu3NqJQAmznwJNbH/g7IGveiy0?=
 =?us-ascii?Q?eaBPisIodxCQDHHaxJUYxxd9DJLgvbaPTs/JzLf6IkyFC6Zc8P94R34+I+53?=
 =?us-ascii?Q?YQx8fHNk8M2PcFx8j6Gsc5ltV38e97i9cSv+XNKPRQ/6nyNiw0ORi27HQ2bg?=
 =?us-ascii?Q?XRAPfSKERLJ8rvkmjjsLyW5vGLLWDoKxp8ywf06RWYgviEu32AJcH5jqmCL3?=
 =?us-ascii?Q?tvv3pKsR4S8FmtT0pHWtgUWzy6o5cNTg/YBE96lizw/mQ3cZpqWRwatyhWT5?=
 =?us-ascii?Q?CtBB01LHR/a2aveBjQ84gHVrQwVT2nXcyNASj6ShWVvgUvx8rpFG9wpNPYyg?=
 =?us-ascii?Q?sV2hP51uods+SV+FTJjHNfwv1NgZ1ilX4zQ67D5b2fnw0e/9frRCE3LRO7fy?=
 =?us-ascii?Q?77bMUZvxyoLwyYugSDM7B3ZDECvkRUu2yERVL25Y3RmvF0vvB1fUn1CiOlvM?=
 =?us-ascii?Q?izwLd+4VQQkmvjTjiCTtOpRQmOLTcKVtYOLF6Y1u+vwUAbJj6A3Ij3NAp01U?=
 =?us-ascii?Q?ugdtsKc5C486xGIKqXnxxUnvUf2RPy4AZyV0KEuGis/P4lONUxZWS9CzNFnU?=
 =?us-ascii?Q?YBImJ8+Gv7RWLd35lDj3+u/cDHZN5kbd4B0N3iBsuOgZhZiZ++G5AHy65Z0u?=
 =?us-ascii?Q?DAc+67vUHJEnEXDVM+TU8fkoAog5w6XWFeHyVQs3kN0NFU7uXrHkmBihHZ2m?=
 =?us-ascii?Q?2FqkpKtdS66T/Ho9dMFbpQ0jXWdkndlBTnLMgSJV+7w4SW1sSbTdIYF0PoEH?=
 =?us-ascii?Q?8nV1XVfiJj2zEgQTrOOnxlcN6NASQQztt7MiPeF7aXn4PAn/RD9VIVDJtV29?=
 =?us-ascii?Q?8Jn4ejCy8WRHV/7ulnrQrTPSFm8kMUhz1PXJJ015TpPJTmieaOFqULq9tHZi?=
 =?us-ascii?Q?NirrLDgn7NojXLRjwteQAZHAKYyya4vGogMM25RfegNDTyfWfGDlAHtFajA0?=
 =?us-ascii?Q?3O37rlB27HfFqnlE0ceNu+4MD85aTIAPW9+xG1hD3Y1J1yIz0qTfLkgsM++Y?=
 =?us-ascii?Q?5G2IoLoQ0dHGebOYp2VVJFWRsdk6bft1xFi4StLcuvbk0qbqqVLw5+vv5OLY?=
 =?us-ascii?Q?dwTmyUEcJdQegpa8PrX1O7eKbimiP6Vf9Ds4SfN30pIK5Bcnh1mgpq/VDDNn?=
 =?us-ascii?Q?8mPRHf3xopeFfJre19zfL7xuoqrq2qfQnaR47i++spSVjIR4JwHrvByiY9C5?=
 =?us-ascii?Q?hnf1e9LIZxkCEfboPs18Nn7qNQ/fGkUmAyXG2O4nuTa48n5rf1fqC4LdgwtZ?=
 =?us-ascii?Q?aDIb1YlWEebrLlC/cQAZVNu4JjiLm5FkUMJxZWmq8qSFmBi9RcowZ98mj77C?=
 =?us-ascii?Q?Ch7P9Hn8DHUfIQJQdG5UbiWkMAR0YyaIxTBblEDQczD4kc4aoGggKl0gXxuC?=
 =?us-ascii?Q?BZJptAYyldrm08lKixtYIEanYS5f+wwoc+p7cDAIEGoDXG6poaOFfsmhf1eF?=
 =?us-ascii?Q?GCwKY+u2iGz+r0moldoM2aIi+Ju1BdEzvJ5LfUGV5K7Dh5oDbQrjanU6txsJ?=
 =?us-ascii?Q?N+bSZYnZbm8CnuN8n13yDFQxicmnVgRELkUedPY4qkoRsqvdO16YbkwIlCOd?=
 =?us-ascii?Q?vLhymjT6M+3aOGLSnb6Ks0uw9T9qPC4/aSwASDeIyTgLL9VxbB7Xn8sAagyQ?=
 =?us-ascii?Q?mxP9ITuyCg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16486e49-654c-4584-746e-08df078485b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:07.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jysm+DBB5mr+RKViWiPFT+U4g2E2jvl+HyxgKmkIqJHCh92tUeKu94bEdlDSO9JaX/KXQqbGFUNizr5ln4wg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

On platforms whose MBM counters are backed by NUMA node MSCs,
mbm_NODE_assignments is the native assignment file. User space that
already programs mbm_L3_assignments needs a compatible default.

Add info/MB_MON/mbm_assign_scope_mode. Legacy (default) always exposes
mbm_L3_assignments; that file still programs node-scoped counters when
node MSCs provide MBM. Native mode replaces it with
mbm_NODE_assignments on those platforms.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h   |   9 +++
 fs/resctrl/monitor.c    | 147 +++++++++++++++++++++++++++++++++++++---
 fs/resctrl/rdtgroup.c   |   9 +++
 include/linux/resctrl.h |   6 ++
 4 files changed, 162 insertions(+), 9 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 32c7d53790ec..f46d4fb7c624 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -457,6 +457,15 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 
 ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf, size_t nbytes,
 				 loff_t off);
+
+int resctrl_mbm_assign_scope_mode_show(struct kernfs_open_file *of, struct seq_file *s,
+				       void *v);
+
+ssize_t resctrl_mbm_assign_scope_mode_write(struct kernfs_open_file *of, char *buf,
+					    size_t nbytes, loff_t off);
+
+void resctrl_mbm_assign_files_apply(struct kernfs_node *kn);
+
 int resctrl_io_alloc_show(struct kernfs_open_file *of, struct seq_file *seq, void *v);
 
 int rdtgroup_init_cat(struct rdt_resource_final *f, struct resctrl_ctrl *ctrl,
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index d555f2d19164..074dc2a040dc 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -18,6 +18,7 @@
 #define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
+#include <linux/kernfs.h>
 #include <linux/resctrl.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -1704,6 +1705,130 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static bool resctrl_mbm_has_node_mscs(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+
+	return r->mon_capable && r->mon_scope == RESCTRL_NODE;
+}
+
+static bool resctrl_mbm_show_l3_assignments(void)
+{
+	return !resctrl_arch_get_resource(RDT_RESOURCE_MBA)->mon.mbm_assign_scope_native ||
+	       !resctrl_mbm_has_node_mscs();
+}
+
+static bool resctrl_mbm_show_node_assignments(void)
+{
+	return resctrl_arch_get_resource(RDT_RESOURCE_MBA)->mon.mbm_assign_scope_native &&
+	       resctrl_mbm_has_node_mscs();
+}
+
+static struct rdt_resource *mbm_l3_assignments_resource(void)
+{
+	if (resctrl_mbm_has_node_mscs())
+		return resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+
+	return resctrl_arch_get_resource(RDT_RESOURCE_L3);
+}
+
+static void resctrl_mbm_assign_file_show(struct kernfs_node *parent, const char *name,
+					 bool show)
+{
+	struct kernfs_node *kn;
+
+	kn = kernfs_find_and_get(parent, name);
+	if (!kn)
+		return;
+
+	kernfs_show(kn, show);
+	kernfs_put(kn);
+}
+
+void resctrl_mbm_assign_files_apply(struct kernfs_node *kn)
+{
+	if (!kn)
+		return;
+
+	resctrl_mbm_assign_file_show(kn, "mbm_L3_assignments",
+				     resctrl_mbm_show_l3_assignments());
+	resctrl_mbm_assign_file_show(kn, "mbm_NODE_assignments",
+				     resctrl_mbm_show_node_assignments());
+}
+
+static void resctrl_mbm_assign_files_apply_all(void)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		resctrl_mbm_assign_files_apply(prgrp->kn);
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
+			resctrl_mbm_assign_files_apply(crgrp->kn);
+	}
+}
+
+int resctrl_mbm_assign_scope_mode_show(struct kernfs_open_file *of,
+				       struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	if (r->mon.mbm_assign_scope_native)
+		seq_puts(s, "legacy [native]\n");
+	else
+		seq_puts(s, "[legacy] native\n");
+
+	info_kn_unlock(of->kn);
+
+	return 0;
+}
+
+ssize_t resctrl_mbm_assign_scope_mode_write(struct kernfs_open_file *of, char *buf,
+					    size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	bool native;
+	int ret = 0;
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	rdt_last_cmd_clear();
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
+		rdt_last_cmd_puts("mbm_assign_scope_mode: Invalid input\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	buf[nbytes - 1] = '\0';
+
+	if (!strcmp(buf, "legacy")) {
+		native = false;
+	} else if (!strcmp(buf, "native")) {
+		native = true;
+	} else {
+		rdt_last_cmd_puts("Unsupported assign scope mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (r->mon.mbm_assign_scope_native != native) {
+		r->mon.mbm_assign_scope_native = native;
+		resctrl_mbm_assign_files_apply_all();
+	}
+
+out_unlock:
+	info_kn_unlock(of->kn);
+
+	return ret ?: nbytes;
+}
+
 static int mbm_assignments_show(struct kernfs_open_file *of, struct seq_file *s,
 				void *v, struct rdt_resource *r)
 {
@@ -1753,8 +1878,7 @@ static int mbm_assignments_show(struct kernfs_open_file *of, struct seq_file *s,
 
 int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
 {
-	return mbm_assignments_show(of, s, v,
-				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
+	return mbm_assignments_show(of, s, v, mbm_l3_assignments_resource());
 }
 
 int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
@@ -1873,7 +1997,7 @@ static ssize_t mbm_assignments_write(struct kernfs_open_file *of, char *buf,
 
 	/* Valid input requires a trailing newline */
 	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
-		rdt_last_cmd_puts("mbm_L3_assignments: Invalid input\n");
+		rdt_last_cmd_puts("mbm assignments: Invalid input\n");
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -1909,14 +2033,14 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 				 size_t nbytes, loff_t off)
 {
 	return mbm_assignments_write(of, buf, nbytes, off,
-			resctrl_arch_get_resource(RDT_RESOURCE_L3));
+				     mbm_l3_assignments_resource());
 }
 
 ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
 				   size_t nbytes, loff_t off)
 {
 	return mbm_assignments_write(of, buf, nbytes, off,
-			resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+				     resctrl_arch_get_resource(RDT_RESOURCE_MBA));
 }
 
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
@@ -2012,10 +2136,15 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 fflags);
-		if (r->rid == RDT_RESOURCE_MBA)
-			resctrl_file_fflags_init("mbm_NODE_assignments", RFTYPE_MON_BASE);
-		else
-			resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		if (r->rid == RDT_RESOURCE_MBA) {
+			r->mon.mbm_assign_scope_native = false;
+			resctrl_file_fflags_init("mbm_assign_scope_mode",
+						 RFTYPE_MON_INFO | RFTYPE_RES_MB);
+			if (r->mon_scope == RESCTRL_NODE)
+				resctrl_file_fflags_init("mbm_NODE_assignments",
+							 RFTYPE_MON_BASE);
+		}
 		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
 					 fflags);
 	}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a16e35b587c4..1547306dc8d6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2316,6 +2316,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_NODE_assignments_show,
 		.write		= mbm_NODE_assignments_write,
 	},
+	{
+		.name		= "mbm_assign_scope_mode",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_scope_mode_show,
+		.write		= resctrl_mbm_assign_scope_mode_write,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
@@ -2653,6 +2660,8 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
 		}
 	}
 
+	resctrl_mbm_assign_files_apply(kn);
+
 	return 0;
 error:
 	pr_warn("Failed to add %s, err=%d\n", rft->name, ret);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b8df7489539f..141e2ff594f9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -380,6 +380,11 @@ enum resctrl_ctrl_type {
  *				events of monitor groups created via mkdir.
  * @mbm_cntr_configurable:	True if assignable counters are configurable.
  * @mbm_cntr_assign_fixed:	True if the counter assignment mode is fixed.
+ * @mbm_assign_scope_native:	True if assignment files use native names.
+ *				Legacy mode always exposes "mbm_L3_assignments".
+ *				Native mode exposes "mbm_NODE_assignments" when
+ *				NUMA node MSCs are present, otherwise
+ *				"mbm_L3_assignments".
  */
 struct resctrl_mon {
 	u32			num_rmid;
@@ -389,6 +394,7 @@ struct resctrl_mon {
 	bool			mbm_assign_on_mkdir;
 	bool			mbm_cntr_configurable;
 	bool			mbm_cntr_assign_fixed;
+	bool			mbm_assign_scope_native;
 };
 
 /**
-- 
2.53.0

