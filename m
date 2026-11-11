Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437218;
	b=5i9ql7Fqae1jdG1EtW6I4/4eKOmsmc6/SFxwjznJjDwmU1B0Ir90K6TnuiEALJsj3onS
	 UsfvAcuiE19Q8b8tyWAqqXWOvmw4m2If3Yz+dzzYmfAy4m693hGrTwN2OX7VdIJCEldqy
	 UmORY8H8MpwDRYXQlUf3027/wGrJLu0k3Pvtid/t+3xn1hfEqF1j7gBdT8z2FRlM+s9Qc
	 OcfbC92pu5Ci9K4xNwITXYfeYYudrqg0fGqx269SqlwQ5ftXyE9wlByN4TkqEi/oZ+/D1
	 ouWBfenLpPg8hvQjwhOD1B+u0cuNxsPThN4FPQ1S+KURInxD2WYD2yNC9tp1wnrWw2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437218;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7ea5DFxMuwnTRKWKJFOMwlhqWHHQ59kvgQdbx6DVTVc=;
	b=y6GfXKwtMpWSTN48w5cpRvoV7Q34lvsCc1DAqLvik8/EFppXEpYociK1st4jW+cM5j/O
	 SSIsygmftHdHZiWEyrhiq2cgYHzTEHnyzL67y6hc3wYtGZswestJ7zjl3i8f2ux+P9yn7
	 T82BU9rgTbeb4IE9XuGvk7UvczHdVAscumHIlaqvla9eLtH9kKgspA0trPql/pvoH2ptC
	 zK3ESeIQfpTe0Dp+cp0oGVk563dv2W1Ulrde4YUT6wgrMPdaxqyNVVrUWiUzj4IRWgFsi
	 pvv+xlIrYCzhXeFWh834DfJwpczP7rT8DYdLfsMnJofn6fofV4TxeBAjuunhFL8zURQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xRQrZwTg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.50
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF28606A894;
	Wed, 11 Nov 2026 22:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF28606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xRQrZwTg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzsKjBcikS9ZNjI+5D+IDdJmQnPe20dV41WKQ0Eh2zyi5c0VonG4heQKD/fVsmg3il1AzGc+fcy+Nyaj7uFnRGHdRPoLesnVF1JRfRMgr1PIcwSWhTjxdjF5WcSRKke50YmwGYa6BKENScCsk7JYYXoP/oR07rioPf6n8C3Kka38uAYkdaELVx5Bj84X83qTw9HDNkNCNS3jxYKnx1JFYjvJHl0UkEwUvohEyD8N7KQ+eec94+0vaE55CYL89kV1mVa6ZGD3T2lYVV7cs6BG5slPJOtemJJoEoBIVVsZKIaeOxhs2K98NycYc2N2sTp1t1QmFXyhuL/rBCAOo7q/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ea5DFxMuwnTRKWKJFOMwlhqWHHQ59kvgQdbx6DVTVc=;
 b=aC55tKRAQEAmtprstz9yW0dcGf816t/RurAcaXthsvPx/o+RXLLEcqy/rNgCMTrngRyebY6PVb7t9XQLZV4L4+XpX8hLQbKatjgXvHbVXrwnThgWw1cYwsb91afVfvYO2lX/sEbQi1JKhoJYLaETZ7DxS5g4WK5YZyGx9twdHFNwkcJp/j31r/4kXOhlbrLxQYOi9xf4xV68tzyOWhKvb/ue1mwqcKoIBJfsKyK8TsX2Z+fe1fl0TSBA2dR9QS5z1roQx1X7BvBBbq4a4XEZ6WklGq3VBWlkjoegQ5SvNWvQgG1STJuQ2M3ICQ4fIlIG450XD4tUBL4HbxkNI3BY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ea5DFxMuwnTRKWKJFOMwlhqWHHQ59kvgQdbx6DVTVc=;
 b=xRQrZwTgY84Nc3D6fyKSJrqSNSr8n2AzueMxOEJAqMYw+AFyWsHLh+bSVBV35V61N8lpRMsku2wLtT2GqJvwukwC+y8jConhqWg530DexKSMZ2B/hV7dc5DpNK54zhFTDYHA5WRCdQi0TYkusE/8ameuHkLJsFf58k0lAqAbPys=
Received: from MW4PR04CA0236.namprd04.prod.outlook.com (2603:10b6:303:87::31)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:46:47 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::9d) by MW4PR04CA0236.outlook.office365.com
 (2603:10b6:303:87::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:46:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:45 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 14/19] fs/resctrl: Deactivate kernel mode when the group is removed
Date: Wed, 11 Nov 2026 16:44:07 -0600
Message-ID: <6fd68005ba028de370e1bb68058823dab1a42867.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d78d181-633d-4a01-b1f5-08df4045aac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|23010399003|376014|22082099003|18002099003|6133799003|261009223027099003|3023799007|13003099007|260925022911599003|11063799006|56012099006|260925021911599003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|260925021311599003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dQmMiW5OhyQNMPpfoEsLWCm6fF2LMd5hbifGz3v9+B+WcNZvZKfjOgFRVnoZwJsIZ9Q3L+MPkpungRGxCt/btfByChquCtdaaXXte4VxScOc7uacbTtw6yEtP3/0a/5Ah3WiIKG5G9mRLhf9bQQauBVsRlzzphFyV9ygiZXmXrIoZIuPZSFVLDzlMCSzvoSyq2RWfy+T/xymfMv73dqKvo8pxH2VyHliXe9nAM61ySVfSg1SNXF1vNsni4SUp4/MV50Uw4k3C+hz8xTysXa3Nw54fU/cjlvr8GLcN9Pf+m/k2CfDQRZsHIUYsCUnDR1+8geU5LMNLsgQuaj2yGnQpn90TescvFKvNIEyJXsUnq1hct11mf14EjHIGICSV51Gfy/4y4ENfihg0YCCr2bHcE9eF2ztvg6qZOTZTB8AmeuYclgrO9AGiRULrthKCPnHERzXUH1OQ5n0CHPu8m90y7hsqzQ51H/BN3f/8MIZXOnOfwznBftoVSiHZ0YtfkuwgB6vFlY6kMKSYZMKu7wZdrrSQQW9VGlsRmWRcIF732N7+gXf0e46G0NjCTLhBFoIoOKX2Eh0EE2ijjR27sUmjQQ4IKOBd3mwkTWMqostfzIuNgi9bQ/Lapn2vXmfOs1hHy3TH1I3krXpNaV6z3Q6Xg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(260925022911599003)(11063799006)(56012099006)(260925021911599003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(260925021311599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2FCko4OWsqNGGimylLAAH3G9z0fspbDmfdFt1hD4HdOLXa1iyllq8mbHGbx93+fxjR7I6r6f7O58qo6tCTcKV8FQzTjZ0lUsnS4gvoC7HWBaBc2wqkd0n5KE0ZIAkjqikhDqnFUpCzq/VVtuDNiRkS0j7BDp6ywmwK842xArCFP82Y3p0hQOz8mnuNxf3p3ePrK63iBHrOrfE9i/e1HsiMrIvGnYSOBU1J8VPDep52QhwiFONXk/oSqwz5Ak2ZnsTinvzxYmsesXOlfCEvHw3lHy3C9ZR6v0zFXk4kK4VWboyhP5zZmMuh/iNV1qjqyo1ePjx0gmDh0ccgZ75eCgG9h0pLwIwEoimwxgKbaH5aYQ9o4A71sFaoj3tqfZR2TT/qatdqlDeB0hGH6huIZMfJ1UR0vWUNWepaqvKiWpDA/5clEN+syJP2Ew6hbQ1lCq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:47.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d78d181-633d-4a01-b1f5-08df4045aac6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

The RESCTRL_GLOBAL_ENABLE_PER_CPU allows CPUs to use different CLOSID
and/or RMID association when transitioning from user mode to kernel mode.
When active, the mode is enabled or disabled on a per-CPU basis as part a
backing resource group.

When the backing group is removed, the configured kernel mode settings are
no longer valid. Deactivate the kernel mode and restore it to
RESCTRL_INHERIT_USER, the default mode in which kernel work inherits the
user task's CLOSID and/or RMID.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Removed rdtgroup_kmode_global_detach() and merged everything to
    rdtgroup_kmode_global_deactivate().
    Removed detach from rdtgroup_rmdir_ctrl().
    Updated the changelog and code comments.

v6: Rewrite changelog (not a bugfix).
    Shorten the code comments.

v5: Took care of couple of Sashiko comments on previous patch.
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger@amd.com?part=10
    Re-wrote the changelog.
    Renamed rdtgroup_config_kmode_reset() to rdtgroup_kmode_deactivate().

v4: Re-wrote the changelog.
    Added the call free_all_child_rdtgrp() and rmdir_all_sub()
    Simplified the code comments.

v3: New patch to handle the kernel_mode clean up.
---
 Documentation/filesystems/resctrl.rst |  3 +++
 fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 033d405338c0..e57361dd342e 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -594,6 +594,9 @@ The top level of the "info" directory contains the following file(s):
 			When "mon=inherit", or monitoring is unsupported, a CTRL_MON group
 			is shown as "<CTRL_MON>/".
 
+			Removing the backing group deactivates the current kernel mode and
+			restores to "inherit_user".
+
 		When the mode is not active, the output lists the supported parameters
 		and their default values, which are used if the mode is activated
 		without new values.
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index af4c929d7ed4..97d99406de00 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1178,6 +1178,29 @@ static void resctrl_kmode_global_offline_cpu(unsigned int cpu)
 	resctrl_configure_kmode_global(cpumask_of(cpu), rdtgrp, false);
 }
 
+/*
+ * rdtgroup_kmode_global_deactivate() - Deactivate global kernel mode
+ * @rdtgrp: Resctrl group backing the active kernel mode.
+ *
+ * If @rdtgrp backs the active RESCTRL_GLOBAL_ENABLE_PER_CPU mode, disable
+ * the mode, clear kernel mode state, and restore the default
+ * RESCTRL_INHERIT_USER configuration.
+ */
+static void rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
+{
+	if (resctrl_kmode.active != RESCTRL_GLOBAL_ENABLE_PER_CPU ||
+	    resctrl_kmode.rdtgrp != rdtgrp)
+		return;
+
+	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, false);
+	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+
+	resctrl_kmode.rdtgrp = NULL;
+	resctrl_kmode.active = RESCTRL_INHERIT_USER;
+	resctrl_kmode.ctrl = KMODE_ASSIGN;
+	resctrl_kmode.mon = KMODE_ASSIGN;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -3214,6 +3237,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_kmode_global_deactivate(sentry);
 		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
@@ -3251,6 +3275,7 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_kmode_global_deactivate(rdtgrp);
 		rdtgroup_unassign_cntrs(rdtgrp);
 
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
@@ -3346,6 +3371,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	rdtgroup_kmode_global_deactivate(&rdtgroup_default);
 	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
@@ -4381,6 +4407,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_global_deactivate(rdtgrp);
+
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
@@ -4431,6 +4459,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_global_deactivate(rdtgrp);
+
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
 
-- 
2.43.0

