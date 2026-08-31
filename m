Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9046F4B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196982; cv=fail; b=QhjgeW3EEEElNHm5k3EABJ21vAWgY/I97pXUH33mH/QbQef743eX2nbAYU/zWNtNiaFAX5GBSQzfzOJWIMnhOThZxg6WD/RQwdHRxr72ZgZ/aAa1sEJ1mPaQwgsBOaw6lnbTGcbAtwXSVvziN8KVQWp+eQ2LV8fs9v+1+YD4wkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196982; c=relaxed/simple;
	bh=6xDTCUsOaKXIcnibAu2pdjtddYi5/1KnZk4NeOwSf9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOtCuk7Lk1ia08BIycxAu6vcMGNGs+jBGNoeZr20zp/QNhNYqfmVF5JQP8aHys4ymPwAbNV+0hZbC7u7r32qY/Y+vVOOhQwH+aduDtjueg0T4mgFu90RT/sovhPDm5ccasr+qYPC3XNuWA3X9O6gAxyufxGReWsSybs0uUEM474=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fINCsKlR; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fINCsKlR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hstap7ldKwLPAyjsSM6lLo3pc396Mr007MaeR4VUy9u+noTBq7+zlpkA9kaFSq7MNMx2shlzFBoR7w0U1wBcYL1w5c4Z23mOVhWZ6mf08UHaBOqQKw++0XBMgK7ECNkB9ex3F4quAsBRh3R2k4jS1Iqte97DiyOIaJdyvauhZoT1RW9DWlY6cMK4zcwohOFAvv/BzXVLhoP3b5zUTxIRUTA1AiU/HmnR2E+ZvSIyHaKFgkLeE/iYhMCOQUHNDlfQgDksnjFrfAknZSDHe8BcrXUa9e/RgtQmJ9obbeA2kMItptB5Kgnrjo6ZbQHz9ZzGvsK6yDEsEDZAuT1gC/NTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=pYUki/rNA5SF3vtZOri02dqNrJ0qmkH2LwNQgLYH8BDctmZ0DSKOFU0jwfqLOJJG9p7YULlZrkrHxMjiNoT5qOQxtJeUptTRggyMCBsNs4DgnbWUU3lv2KkQb//kmJYQmN2VTfm+Pksh6oxcPR8CkHhy2QmLue/6jj0y+0aAoyo0WMj5iT0WZfkiWeB8jvMgwOKQdrnllnJ+6xdNd9FNw+Q+gGMN16/JfQpIMa1/kDjcHrvurHFII0Cx3dwhemV9taXueUJBajw8ro0FmWcl84/bCoM6dNTiYObTU1X2Eb+As6aj9SusLjl00s8GxBr1qySIDBahxG0Vy1oNnVDOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KgaJKaL0fS1dIVFu0rr1uU7UK5Z7gfzjoKXoKR5+o4=;
 b=fINCsKlRUn4CGcJ+S0wjhvHxDrksjIkfhqhwB6J21O+wQmdYGPJfLT4gtyEU0CYffg2wLMDhzB4zKpxcMUj8bkhCVWLo3+/n+Ib9Q2pmGy84rrSo2wBlmtH4DtxgzcT9MfCM8uQr+OY9HHrjo/D6pELHdYwaBd1Kb6DQOrd/eyfrOAZR7v7bNW/gL/zFDUPzcPrlOJEdioQ4+E+7k9G1O/4a5NUtvAeGxuJ7mzXNDWQaT3e6sz0F7FOuJd47JQQVhHhNGWaWHm/xAMM6LJ/OWEbejFN0SoJNFa5dGXhU1ghllrrM0QuLoKLCjt5qpvLFndlXhyv2iW+usPrwhsO+Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:22:54 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:22:54 +0000
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
Subject: [PATCH RFC v2 02/19] resctrl: Expose MBA MBM counter assignment sysfs
Date: Mon, 31 Aug 2026 10:22:28 -0700
Message-ID: <20260831172245.42253-3-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e99d03-3c34-44c7-ec40-08df07847e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	TQxAKJxJ5lbVfdST9Lm2ZnJ5j8BSIetUnzrTwHI4RWVjMyFH9Wf3aF5tu0eNSxqlfXi0cKhCZpxunMAp+7ezPsbE8HoCVmdlVUnPVz7YbEdRsAcKvGuGUOnFVW0486o0hZgAAT+LocpY6VqFsmXGiVNCcy3Ey0aaYhzFVxVBCTwT7tNO2qHFU8vIUkbuzE3TU8aZeKnjuJ7QgMe9sotsuL87PO3aQvU+vFmnFkylgO5DIDb52jDQGGdL28lefZWThjNdhgkBh8klHwl4duGdtMSIJSswJ9looXB1s1Yfp6JKtBUMhYD78ZsY4HoHjvYW154WPzWiBclsNETohZkAkE3alXFzblRaNAS8mEBDYXzWOdWYG5iKScrBw12hb/4UgqFd3epZvko2xXpcQ24dbHoik4gHHzag4EprpaUcPePUkHXiWKLsr3PYNnQlvgddH7HD5sJhj7+oXHJ9Q7jLMt4vJN7YtnArM3HI/yHQbJkc9OijZ6x8oobZ5SNX2nDmpb1udftENUwIbfYv3lni5uNW6HX4fm6XHtuv/7/tY1UdUZvv0O3EN7bFQb7piQY6Js4LFxR29ic0/NkG0plVnlKZJj1eDNyM5h38jvs83eGU3LOAoY5gLN6UwN+JtCtN289Ek2kUc+yTKA3cktXXjU0jkaHed/OkqapFTVJ/JfH9+DQYT6Vgvf7M3yRlE67+jHZoVNCyKMlMNDjH9CBRmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOvaBaPaI7k02hjigwHlK4xErUrlwX9noatGMCuuoNt+YVm3k77Szd6jAjAo?=
 =?us-ascii?Q?b0Pg59zqPZpME5LG/7C8CMHE0W80NAoxh+9ep5NYAlTSKFH39EcUP/34Ic3G?=
 =?us-ascii?Q?4wcilceRHW8TehOsj2gOkV5aexnfnHPTTswmRv+OZF0ghJrslynC6FE9iEXB?=
 =?us-ascii?Q?6c+IN1WxJgfk/o42s6n7EGGN+j3b4h9Lmd3oPtHOuMX36dRpna6AibWXCxJ+?=
 =?us-ascii?Q?xsY/PVuJcNTVDyR4CXxj496tLZoOS9dK+YdQDZkhSL2czdmFojNs8O7W3pJ1?=
 =?us-ascii?Q?rOzN4ftBBLLy6rCDwVZCFsa7hhVq0fjczjKjWsW5vQTuQMdGLvh6mNyWGWTj?=
 =?us-ascii?Q?nA1BKxLUwi/sYFX93Dpio++gcRIZrlVqszMrgLxwAcSJbvw/zkwpnbVnmkfo?=
 =?us-ascii?Q?FlmWoDK0SNf+Y02q1RH8TNu8w8bw9kof8Mrs9GKbsCz4eEr6vQk+dSCnK4PG?=
 =?us-ascii?Q?segVwiISAhqPVtbSEjLnNV+9NyVgMZtzXPK0BpwClGxGZzpmEFLs72rSe2Dk?=
 =?us-ascii?Q?D12lJPPQnSoPrmKBBFEL/SpNCbdUkYwYTcS/79ZKCqVkTrNfQTG+nGA1AY76?=
 =?us-ascii?Q?TdNAtWn/sSqkmZL+KNhioNMJO5G1Z72O5o33gcH1Yzn969bNL6KGWa4KM09U?=
 =?us-ascii?Q?lPhwJlrGuzpGVD2NoAIAaZvO5emndi5yYwxorqPjdi+gWV4ZUbLDlpUyPpiA?=
 =?us-ascii?Q?P22SGbZ8Ai8Kgn3abTQDRK8HjSXYKUfWClrK0+JiW9MQUc/pjOx4/Qt1QHlG?=
 =?us-ascii?Q?tmEfuL1LHgnu2dV4OVEFTXTBnYkRynKYvEy68I+e8+Dx61h+iQutgvZiZ8Hs?=
 =?us-ascii?Q?Or9cg60qsq00a/cboijpxg1SZmlPtG8/6e61V7TLk658yFVCOl981xN93Hab?=
 =?us-ascii?Q?Aw6L5tz0Qch0Js+KV/gx3RYo1FYzrSp369uzFtqmeabc2XmyK5qGYBhBg6QB?=
 =?us-ascii?Q?WzCckWZHo9SC+rU4bJtLa5PCVxWAeI/86IwojdVsSbi8+CHQ6zad7fQuRWd+?=
 =?us-ascii?Q?BjfTLFwnlDPyfoX+mnEqR1IH0Tf+is7Umvd1KKd8ZoLBT6ifmHtxgWlbUv+s?=
 =?us-ascii?Q?HmR2PAXQxFFp0RT43K2e9KG0r9wo8+8zDu2mQbNsMu5qw9Vueo2XH7LkP9FR?=
 =?us-ascii?Q?Ac8d9POeK2UQ2VJcflNNgiFAfAPQjCyBtTxUL/YvtHVPD5TBbFkmNBKZt3cc?=
 =?us-ascii?Q?8rsil0sYA0sNxfdx3ywUnNy6mxSoZtm01KmYe1O4F5RevPrTYUCu2S4ZjQnZ?=
 =?us-ascii?Q?ho93exh9XjhStcQ+L7/fnnPz+/lwK5k20R2G/RL9WsAbuJAxIv+PRmrIxK1l?=
 =?us-ascii?Q?n4zFWqmndDu2Bq1kTvbWu8miEfC8kdTPrNEKw+8XsK5OMAS+jI2SlF4GZcIM?=
 =?us-ascii?Q?jPc6faNjzQlC2TZAjLTKNCpDsQFGq3DRJsrdUjRq1qBjHmyB7F4YnjJklwC3?=
 =?us-ascii?Q?RKyYw3RvO06Il+apM0Is1GI6XGJq2v8ffJAgoOWxdjIalTGeaqoyAKH6tbJw?=
 =?us-ascii?Q?gM+yOC60lKjgQv31bl/oiVDP0CrwqjVmL6mTa6T6dqrfBOTqqeE/HSh7Win1?=
 =?us-ascii?Q?bfN9PLFxr5ZXdhu4/m+Vm5Mam36taFdTMaannLsuBiiMdmB30xqFGzX0HgQb?=
 =?us-ascii?Q?gKuDLFuZSX3MbPH09YkxsvlMChWBe5OYPVC+QIMmO5eC8djBQyufmIkXu0II?=
 =?us-ascii?Q?uHdzgq7dJiGRGclGKgl1Crzgt8qBlCliIydxBqaqgHc7c66E5++7V2D0VlEP?=
 =?us-ascii?Q?NQOr4Bpa5w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e99d03-3c34-44c7-ec40-08df07847e37
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:22:54.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh/yYpO4/pEjtLa821zIcpukOPeLdduoxMKlcV+PXic0osxkFOhDSRVBlxeOSeMM/SSET3UlKXFq5U9VUbL5Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

When MBWU monitoring is backed by an MBA resource, userspace still
needs the same counter-assignment interface as on L3, but keyed to MBA
domains and exposed as mbm_NODE_assignments rather than
mbm_L3_assignments.

Add the MBA-side sysfs hooks and initialise MBA monitor metadata during
resctrl_mon_init() so mbm_* file visibility follows the resource being
configured.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  5 +++++
 fs/resctrl/monitor.c  | 27 +++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c | 11 ++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index af2e6e0b2af8..32c7d53790ec 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -480,6 +480,11 @@ struct resctrl_ctrl *resctrl_resource_ctrl_get_default(struct rdt_resource *r);
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name);
 bool resctrl_ctrl_is_default(struct resctrl_ctrl *ctrl);
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v);
+
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2b5654f05480..5865a509174c 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -538,6 +538,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
+	case RDT_RESOURCE_MBA:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
@@ -1741,6 +1742,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+int mbm_NODE_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1890,6 +1897,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 			resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+ssize_t mbm_NODE_assignments_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1933,7 +1947,7 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
 	unsigned long fflags;
 
-	fflags = RFTYPE_RES_CACHE;
+	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
@@ -1969,7 +1983,10 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 fflags);
-		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		if (r->rid == RDT_RESOURCE_MBA)
+			resctrl_file_fflags_init("mbm_NODE_assignments", RFTYPE_MON_BASE);
+		else
+			resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
 					 fflags);
 	}
@@ -2002,6 +2019,12 @@ int resctrl_mon_init(void)
 
 	resctrl_mon_resource_init(r);
 
+	r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	if (!r->mon_capable)
+		return 0;
+
+	resctrl_mon_resource_init(r);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a658e4958562..a0635888a0a0 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2307,6 +2307,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_L3_assignments_show,
 		.write		= mbm_L3_assignments_write,
 	},
+	{
+		.name		= "mbm_NODE_assignments",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_NODE_assignments_show,
+		.write		= mbm_NODE_assignments_write,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
@@ -5199,10 +5206,8 @@ int resctrl_online_ctrl_domain(struct rdt_resource *r, struct resctrl_ctrl *ctrl
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA) {
-		/* RDT_RESOURCE_MBA is never mon_capable */
+	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA)
 		err = mba_sc_domain_allocate(r, d);
-	}
 
 	mutex_unlock(&rdtgroup_mutex);
 
-- 
2.53.0

