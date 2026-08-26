Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1147ACC4;
	Wed, 26 Aug 2026 19:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772933; cv=fail; b=cO7lvyE3gL2e4JYj3cxWOnwZvJDtrUzuEt34oSbm+9kqME42ZDh8QYIiNw/VJS12i9nzZuE5tiKiVH4i3FFty3hn6Jr5BHC4LvDn/ZvltZJ+w5vlF6D3VKz8hH0kUWV3nY4oRveeTg33j9XA3CFNW/qyM2ofdrL8wvTIDpUlNI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772933; c=relaxed/simple;
	bh=27PJOFNynHZu84NHZHhlCqxHWnHmXgHVMCBuBWzk55w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JohQsqvf/i+DIXnjEQiX62FDzASL3CsC1Xsn2Kvn8NFm+J/AveFqNVMo0VvUs+0LgyiHA3raELKSipCMF4rcp4OP3KviGFSkjbtuY2OkegWta3QdeFJg8d9VN1z2o91dea/ArC8R+739hekDnPbMD8ac4JeTYkEy4YO0X2OpMXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0JsI85Rl; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0JsI85Rl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo5/0qu0aiuFXqk1E2n3YeX57HGjL6jKWqtsPpo2JmuPvvWBVJ96u0f7h2+JqD2+N/SjHORFXdr0DtA7mD2Fjjsh56zxMuRJzhHxabKOzziU5XH4eJ+Oe0CBgo1YxQ76wHOoon/sVsfcoENezzAWA2mucTP/GOlq+dsBLm8KeE4d4Ju4Tho6CT3M6K1XvGmVOJCm8EfabCMFr/3dlEH+xyVehIQ2qOYGMRiAJIZeZraMPgEsjeMwEo3OdhW/9OX7UPFGzJIriP/bDxzSX/8E3IhPfA6q6kBz9G5nVxgZN4WTIm6W+KWHcSM/JJB8kcCK3hIE5j3fryelF2ruATsEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnL9MHZfY7YLdjBz/MevVIWGRNTF0JXFoY8Cfm09Rtw=;
 b=oRtHOuGMQ5g+wEbIFLNrXiOhhugEDPpha91Tb7IgDTiQk3ZyeFDOIPalwvJlEKuhfO6o0aaNtzfoRVn/WqWL2qiONXTd4PeJRSSNsGeAmhdEJPduS8vys/HW0vrLTNeww1utAGwR9di1m7IpKo705I6szBM5mi+Xoa+RZwhPPN/xvglFYFlxC8vhBHIM86vlkvl5bh1wgymoQ+kG5N2dYo+av/QEw42qCz4sFsZlu690W8nb6qe0rnvzHuyi7sU9qnoQ/V8RO7G0O4cLE+p/UeqdvAWCED7d1AtzV9Y1vd7SWKc9vBzIiW+RmU1d/GkWokBUBGG5MrCoarGfDZXrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnL9MHZfY7YLdjBz/MevVIWGRNTF0JXFoY8Cfm09Rtw=;
 b=0JsI85RlKdgJh14d6CjAqet1MnIZeKWZYBWhgXlsO67tsRQ43/a3HZD4w/cEUkGNLL58rzqBVhXdHqMh5Ab5RfL1xaEX5oshtYyDpD+A4AHE7fv0qUBauWBFpWzzk4TMIzUcfmRraeO/bpmV4EF6Or168DKFj837xQEWQHFNxzY=
Received: from CH2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:5a::23)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 19:35:15 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::2) by CH2PR08CA0013.outlook.office365.com
 (2603:10b6:610:5a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Wed,
 26 Aug 2026 19:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:35:14 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:35:02 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <jlayton@kernel.org>, <enelsonmoore@gmail.com>,
	<kuba@kernel.org>, <ebiggers@kernel.org>, <seanjc@google.com>,
	<peterz@infradead.org>, <chao.gao@intel.com>, <jmattson@google.com>,
	<naveen@kernel.org>, <ricardo.neri-calderon@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>,
	<elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v5 13/16] fs/resctrl: Deactivate the kernel mode association when a group is removed
Date: Wed, 26 Aug 2026 14:32:27 -0500
Message-ID: <432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
References: <cover.1787772750.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 652b0edc-4aca-419b-d290-08df03a926e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	YRfnha/nNpnD8clQ2P+sUAiYBQ5t5m2M/Rlayv9vG3beG2LK0NJ5eB+uYH1JNxbjv7Mpt/mAZCfSqHI54QIq6t9M/oYz66BSw5I0lpV4boSf6Si+ywJeEgpKrh9464wuYnnjpfeO+8J0qxCjErb+E62xCjhq8xNmwwWnKirPlcOiyFo9QPwuLKH91piN+YxLa8Vz+/6fPaDBW9MQwbe8fS3nOK2EW5w3Y4nnXZPUfWKuF1gN4ZRdwhWSl4yqnA8uZl3D2ATFDiUHcP2BjULHlc0LcYTAGxHYfrneju1blVHEaXycEDteRIRuOJ7f5sNjFfqJWah2vm071397HQoXzdq+qXI/6wG1LNkrCWi9MQBlbV5VWRXxUSQ1z5J6k4akym978LJwqVtemv43Bjjz1lY34QEXerQnKDme+SGLUVkDe/Z7WBu5Ze19a2SW3Ie3bBDDpex8mlz5SwkXf5PqCKcqM5H2KPWkcRUzNmbQ8lFUlEu4n4p1eqHfjYDVFR5pF9XfbP0gGiBMaJJEDhWTSL/loNckn0KoCKXLwLAle3NEM6y5PrAPzb2hijzvfRo1kx3G1ipYsenKfvMn/0lIjRu+DLtWZCBUfV/3S3NME3jTfJCTzcDXqdHnGkOGwT7GN/nbLTDeI0pigo6YJ3u3Gw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C3bv4OdhnBqjFrP8dtH1U8rESwQHRgTTT8WYHXlgzyapDuJaLtJ3vzWjKtPu33sUpxvJcqnf7VnLv4FypzhetvooWTo3nF47Me5yqQkehMTG/AY5c93m7J9tiYSAqw68vZWvOz7d6eeEnxFXWhd3CnSzuvAUP8sBTHBBJC8aV6USuJH8/EwP62LxRZnjZR5EC6/pk7Fjm/WpWWEVNcM0akN069l5s3KrGCT4mSXk3LYJ0rbACRRjO9k8Peo8VLk3IRsIEh6HOxO81/LxFMQA8IrgFsausQ2HC0mHJrtau7khuT08QM9xmyMXpxQhw84LZ3diIxsfDmWBZT055V3MVMkBCbTRu5fe2ycGQk+zJXEhjLEQtYJ7filMnLIL7it0SP6ApWEEVJQh67AvbjmMuSewJzJCdO6nBQxw28qvkYxpFbPIb8HCNh+G9Adpg/Z7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:35:14.5674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 652b0edc-4aca-419b-d290-08df03a926e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436

Resctrl tracks the rdtgroup associated with the active kernel mode,
including the CPU mask used to program kernel mode associations.

When the associated rdtgroup is removed or the filesystem is unmounted,
the hardware configuration programmed for its kmode_cpu_mask must be
torn down and global kernel-mode state restored to the default.

Call rdtgroup_kmode_detach() from group removal and filesystem teardown
paths to disable the active association, hide kmode_cpus files, clear
per-group state, and restore RESCTRL_INHERIT_USER.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Took care of couple of Sashiko comments on previous patch.
    https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=10
    Re-wrote the changelog.
    Renamed rdtgroup_config_kmode_reset() to rdtgroup_kmode_deactivate().

v4: Re-wrote the changelog.
    Added the call free_all_child_rdtgrp() and rmdir_all_sub()
    Simplified the code comments.

v3: New patch to handle the kernel_mode clean up.
---
 fs/resctrl/rdtgroup.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 97e4176669e5..ed4fedbf2193 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1147,6 +1147,57 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * rdtgroup_kmode_deactivate() - Tear down the active kernel mode on @rdtgrp
+ * @rdtgrp:	Resctrl group whose active kernel mode is being released.
+ *
+ * Deactivate the kernel mode association on the CPUs in @rdtgrp's
+ * @kmode_cpu_mask, hide kmode_cpus files, and clear the group's kernel-mode
+ * state.
+ */
+static void rdtgroup_kmode_deactivate(struct rdtgroup *rdtgrp)
+{
+	bool assign_ctrl, assign_mon;
+
+	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
+	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
+
+	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
+				     assign_ctrl, rdtgrp->mon.rmid, assign_mon,
+				     false);
+
+	resctrl_hidden_files_set_visible(rdtgrp->kn, false);
+	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	rdtgrp->kmode = false;
+}
+
+/**
+ * rdtgroup_kmode_detach() - Detach @rdtgrp from a kernel mode association
+ * @rdtgrp: Resctrl group being removed or torn down.
+ *
+ * If @rdtgrp backs the active kernel mode association, disable the
+ * hardware association programmed for the group's kmode_cpu_mask,
+ * clear the associated kernel mode state, and restore
+ * RESCTRL_INHERIT_USER as the active mode.
+ */
+static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
+{
+	if (!rdtgrp || !rdtgrp->kmode)
+		return;
+
+	if (resctrl_kcfg.active.k_rdtgrp != rdtgrp) {
+		pr_warn("resctrl: kernel mode group not valid\n");
+		return;
+	}
+
+	rdtgroup_kmode_deactivate(rdtgrp);
+
+	resctrl_kcfg.active.k_rdtgrp = NULL;
+	resctrl_kcfg.active.kmode_cur = RESCTRL_INHERIT_USER;
+	resctrl_kcfg.active.ctrl_mode = KMODE_INHERIT;
+	resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -3235,6 +3286,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_kmode_detach(sentry);
 		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
@@ -3272,6 +3324,7 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_kmode_detach(rdtgrp);
 		rdtgroup_unassign_cntrs(rdtgrp);
 
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
@@ -3367,6 +3420,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	rdtgroup_kmode_detach(&rdtgroup_default);
 	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
@@ -4402,6 +4456,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_detach(rdtgrp);
+
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
@@ -4452,6 +4508,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_detach(rdtgrp);
+
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
 
-- 
2.43.0

