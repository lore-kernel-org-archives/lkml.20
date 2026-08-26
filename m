Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E647ACF8;
	Wed, 26 Aug 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772933; cv=fail; b=XNuLHRT1x6fihWqqDL17xTa5byrIWEw1kZrYJyPfEi9jA4LcMSAhffmp1VZ1CvzjkSgIm7E/yK4SVshethQYBM6m9vwlGzGL/37O3nELVZ2UnfYhAX/gQmyGq8n6jc+FHE6fuY8uZcws4GB8TPAt4ZTfvUSdh3SJH02ZZGGj0dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772933; c=relaxed/simple;
	bh=/nuJITvRbOT0xK+R0Y0y2+WafE0hY8HspD9cUW703Nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMIY4URpBLJzMlgCeAlVNTi3z9T0ViNH+53jS55v+Lf+ljxkkOfB6qQsBTf9aI8Ve16evlTQJxDDbBZQCSf9v2rocjmcggjqOPSmooSrPidGa/2wXdHpFhtch0fP4pkWlDiRwW7763mdxHC+L5tt6SuaL+h8QSA2KkMd+RgeKes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ATyQMZIg; arc=fail smtp.client-ip=52.101.43.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ATyQMZIg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9uwM5gD+d5OPVCEl95wxGxgSI2g3UPXuJ7VqSXrYWyTzjF1yZM3+G5Zz6WIYNBCmb4tGyBfB6pN3VD5YFMzz/xZrn93SrutFDsgVU1siYt+GeQzK4faAU117yfel33t5Suwv/G01urKbQVjSY3gGB4COOJXUF70fu+MWHyvCcQrE4E2r5qZu9E1dfT/YovyWfLWOiPFXmAiYCkModuAaaETor7JzK4JDTUVCjn651zIcqXTh2Nhcfa3WgRFo/0b73XywwdWQpVeZqTww8IvV31mjWt58fnRw9KRdtgVl9JxPATrEyOcGidXqnl2ayR1LJrE08+JDZ9SB7EvuHtV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6r6D1vMHM6pNMliXES6E79ih+n2A4XdfBlVXKORC/6A=;
 b=KGg7F2fKwRw1lnRCF2Y1kVLX+86EAzPdYW/d757IY+K333EEo59sf9i7YwT8nIqm5oQ5pXnjo7F1Iwl8e1ZGLQLPhVLX2YwOVRKaH/9LbsYNHLHMpkdvsppGlnJJoHNEbMgZUpuIWLjRnwziiFQ9cb02Lc6OQzgmUojzJL1ySvLQIFHR3K5uU/b+DkSnPbZt9TVPeulKn6a4RllkdAZ3N9ALmlrpiTvN+BwBy4ZMguAwcg39K8V5X/3YCBouzD4mKK+bNEvisCJW8csufzWVLNT/rU/UyaCYzz5thTSmRZbdX7USLDp88yLUmq0E0p5PDEilLBpeAlzIdiFnBEkSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6r6D1vMHM6pNMliXES6E79ih+n2A4XdfBlVXKORC/6A=;
 b=ATyQMZIglnKXFCO4JbaDuM0MmGe3v3VT7bG/Z59jOPlc/OvprG0utUx/sMxU0HZnwDdPGYwM9ZdWzro62nHeR4sWJNbz/SjLODYmdrvL8bdr3rbAv3ARar4CgC2JUjz25CcIbKumVkc6cjevpqoirqRuFJy/TsIicWwTlRUGKOs=
Received: from CH0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:610:b2::31)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 19:35:17 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::46) by CH0PR13CA0056.outlook.office365.com
 (2603:10b6:610:b2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 19:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:35:17 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:35:15 -0500
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
Subject: [PATCH v5 14/16] fs/resctrl: Add interface to modify kernel mode via info/kernel_mode
Date: Wed, 26 Aug 2026 14:32:28 -0500
Message-ID: <d50aaf18d60787e960b600494d7f33926fb0b51a.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d491a1-a9f6-4cf1-c46f-08df03a9288b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|7416014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	ts27h0ElKlB6MWHo6RUL55iezJxVlxJGrUNIzK9lnFGu5JI49RUFwHVa6mcD/o6vK0g+bLbQ2O9jzqTiDfToT9ZtNPeY4xlq4zgebMrI/EfH8CTr3BdE1Bijpzh4juQuw43DAZbBomdLd/Gb6prbJY+6Q67fMotyYC5pzQp7xVXGIYy+HMFwvkf6pjuJFAJyCObg9p5U597r6qYBoGGFmHMA1es4hSQskeHgWPkOej1iDjNY27jUy1oqBokNVbyxWDypxl8QDmkHw5piNCUv27k2zihLkVwIxU6QhXbkfBaTpG6wnyn62Qspj+9/jX/stmRF4hrm1pCb0mH820fphU1zNjojkjLdGB+YNrK/rMNW8mZdWpbM+zsaOEw4EIT4TKS+kUmIn5hYB06JnHXLQWpt3y6oeDp9g+xLRn9A05DBP0VBCvywvxhPrfF1KgryMqACukZE2f9iO92OKxoCOTiRkajru5qqACpNA2wnyIuhCJ5opwjDeUvHkosIw+vZ6E8A/DeirN1JmArTpDRxH6JA4voAj4P51vOx8bj2Aqh+xriHqhf4WtaopcW7T185vIbdV/yp+Aiod5ydeF0MIamGfSitKptXAWFCOf46jaD8ZlITlto/cDkVT4ToV/iget7EWs8MudK8PmSA7tVB9bg+kEV4302Bw3LW5z40eWBaBj2mStvWKsNcbZPRMqpmnaA4lbIWCtRqTZwzBib8Jg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(7416014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vyUivBSu40hJzTub7H0SG9vwBGl/4xUc05Fyq5pbVHgzFD1ccdL9Nnr4r0aJzhFPnG9oOXtJaII291I0Ru2XR7oN+SUwEL6zlsi1w4/byTeOCiaQWPvTYfmbisrmgs45uOE6fFUNZuDa5rbS1Tulr7YUhrZm1N1Ky3kGTM0Mdop5liGHdR0uOgXHg4RAjTRKiH0fGKbrAlMgTZPRFztKHyF5dSlyEYq1v1cPu8uJALHgaNDGPDdexQL/mvOoTAEU8AcqF1sbb2ljL79uw9KwDov7ZtEcTXBFO0Hak5H5c7/TgUf96wRnBgOfBA26T69zPM2T+7QaKTzaQBtqbFQ48K/+oZ7vn0Nf8eFXeJw4W3Ls4L7qL2cA8ZeC0tD9Xq5dGVI3aY2zXvsK0zRRpcX+841qhtDFgBUc4sutOBmGyh5PKwgyYFRZDOVXXTiqE0QP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:35:17.3650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d491a1-a9f6-4cf1-c46f-08df03a9288b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744

info/kernel_mode reports supported and active kernel modes, but it is
read-only. User space cannot select a policy, associate a resource group,
or configure independent control and monitoring assignment for
assign_global_enable_per_cpu.

Add resctrl_kernel_mode_write() to accept the same line format as
resctrl_kernel_mode_show(). Parse optional ctrl=, mon=, and group= options,
validate the request before changing state, and program the association
through rdtgroup_kmode_activate() and rdtgroup_kmode_deactivate().

Document the write interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Adapt to the resctrl_kcfg caps and active split. Accept
    assign_global_enable_per_cpu:ctrl=;mon=;group=<ctrl>/<mon>/ writes.
    Treat both ctrl=inherit and mon=inherit as a no-op. Use group=// for
    the default control group. Show associated kmode files through
    resctrl_hidden_files_set_visible().
    Added kmode check in rdtgroup_locksetup_enter(), rdtgroup_mode_write()
    and rdtgroup_rename().
    Simplify kernel-doc for write and activate helpers.

v4: Validate input before tearing down the active association so failures
    retain the previous association. Allow assign_mon on CTRL_MON and MON
    groups; require a control group when control assignment is inherit.

v3: New patch to make info/kernel_mode writable.
---
 Documentation/filesystems/resctrl.rst |  33 +++
 fs/resctrl/pseudo_lock.c              |   5 +
 fs/resctrl/rdtgroup.c                 | 319 +++++++++++++++++++++++++-
 3 files changed, 356 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c6e8cf828e18..490e8f534d37 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -557,6 +557,39 @@ conveyed in the error returns from file operations. E.g.
 	  [inherit_user]
 	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
 
+	Writes use the same line format as read, without square brackets and
+	with a trailing newline. To select inherit_user, write that mode name
+	alone.
+
+	For assign_global_enable_per_cpu:
+
+	- Writing the mode name alone selects ctrl=assign, mon=assign, and the
+	  default CTRL_MON group.
+	- ctrl=, mon=, and group= are optional, use the same syntax as on read,
+	  and may appear in any order. ctrl= and mon= default to assign;
+	  group= defaults to the default CTRL_MON group.
+	- Empty ctrl=, mon=, or group= values are rejected.
+	- A write with both ctrl=inherit and mon=inherit is a no-op.
+
+	Selecting a new mode, assignment state, or group tears down any active
+	assign_global_enable_per_cpu association before programming the new
+	one. Writing inherit_user clears the active kernel mode association.
+	The mode name must match a supported value exactly. Errors are
+	reported in "info/last_cmd_status". Example::
+
+	  # mkdir ctrl1
+	  # echo "assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//" \
+	         > info/kernel_mode
+
+	  # cat info/kernel_mode
+	  inherit_user
+	  [assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//]
+
+	  # echo "inherit_user" > info/kernel_mode
+	  # cat info/kernel_mode
+	  [inherit_user]
+	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index dea2b4bf966f..a0b22b95fc08 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -536,6 +536,11 @@ int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp)
 		return -EINVAL;
 	}
 
+	if (rdtgrp->kmode) {
+		rdt_last_cmd_puts("Group has an active kernel-mode association\n");
+		return -EINVAL;
+	}
+
 	if (rdtgroup_locksetup_user_restrict(rdtgrp)) {
 		rdt_last_cmd_puts("Unable to modify resctrl permissions\n");
 		return -EIO;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index ed4fedbf2193..10d936710899 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1198,6 +1198,309 @@ static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
 	resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
 }
 
+/**
+ * rdtgroup_kmode_activate() - Program kernel mode for @rdtgrp
+ * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
+ *
+ * @rdtgrp carries the CLOSID/RMID to program. For monitor groups, the CLOSID
+ * matches the parent control group while the RMID belongs to the monitor group.
+ *
+ * Use resctrl_kcfg.active ctrl_mode and mon_mode, initialize
+ * @rdtgrp->kmode_cpu_mask from online CPUs, program the association, and
+ * show hidden kmode_cpus files.
+ */
+static void rdtgroup_kmode_activate(struct rdtgroup *rdtgrp)
+{
+	bool assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
+	bool assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
+
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
+
+	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
+				     assign_ctrl, rdtgrp->mon.rmid, assign_mon,
+				     true);
+
+	rdtgrp->kmode = true;
+	resctrl_hidden_files_set_visible(rdtgrp->kn, true);
+}
+
+/**
+ * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
+ * @ctrl_name:	Control-group name, or "" for the default control group.
+ * @mon_name:	Monitor-group name, or "" to select the control group itself.
+ *
+ * Matches the path syntax emitted by resctrl_kernel_mode_show():
+ *   "//"            - the default control group
+ *   "<ctrl>//"      - control group @ctrl_name
+ *   "/<mon>/"       - monitor group @mon_name under the default control group
+ *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
+ *
+ * Return: Pointer to the matching rdtgroup, or NULL if no such group exists.
+ */
+static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
+					       const char *mon_name)
+{
+	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
+
+	if (*ctrl_name) {
+		parent = NULL;
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (rdtg->type != RDTCTRL_GROUP)
+				continue;
+			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
+				parent = rdtg;
+				break;
+			}
+		}
+	}
+	if (!parent)
+		return NULL;
+
+	if (!*mon_name)
+		return parent;
+
+	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
+		if (!strcmp(rdt_kn_name(rdtg->kn), mon_name))
+			return rdtg;
+	return NULL;
+}
+
+static int resctrl_kmode_parse_option(char *val, enum kmode_state *state)
+{
+	val = strim(val);
+
+	if (!*val)
+		return -EINVAL;
+	if (!strcmp(val, "assign")) {
+		*state = KMODE_ASSIGN;
+		return 0;
+	}
+	if (!strcmp(val, "inherit")) {
+		*state = KMODE_INHERIT;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static int resctrl_kmode_parse_ctrl_mon(char *options, const char *field,
+				    enum kmode_state *state)
+{
+	char *opt, *val, *end;
+	int ret = 0;
+
+	opt = strstr(options, field);
+	if (!opt)
+		return 0;
+
+	val = opt + strlen(field);
+	end = strchr(val, ';');
+	if (end)
+		*end = '\0';
+	if (resctrl_kmode_parse_option(val, state))
+		ret = -EINVAL;
+
+	if (end)
+		*end = ';';
+	return ret;
+}
+
+static int resctrl_kmode_parse_group(char *options, struct rdtgroup **rdtgrp)
+{
+	const char *ctrl_name, *mon_name;
+	char *group_str, *end, *slash;
+	struct rdtgroup *grp;
+	int ret = 0;
+
+	/* Skip parsing when group= is not present. */
+	group_str = strstr(options, "group=");
+	if (!group_str)
+		return 0;
+
+	/* Isolate the group= value from any following options. */
+	group_str += strlen("group=");
+	end = strchr(group_str, ';');
+	if (end)
+		*end = '\0';
+	group_str = strim(group_str);
+	if (!*group_str) {
+		rdt_last_cmd_puts("group= requires <CTRL_MON>/<MON>/\n");
+		ret = -EINVAL;
+		goto out_parse;
+	}
+	/* Split <CTRL_MON>/<MON>/ at the first slash. */
+	slash = strchr(group_str, '/');
+	if (!slash) {
+		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
+		ret = -EINVAL;
+		goto out_parse;
+	}
+	*slash = '\0';
+	ctrl_name = group_str;
+	mon_name = slash + 1;
+	/* Require a trailing slash after the monitor group name. */
+	slash = strchr(mon_name, '/');
+	if (!slash || slash[1] != '\0') {
+		rdt_last_cmd_puts("Group must be <CTRL_MON>/<MON>/\n");
+		ret = -EINVAL;
+		goto out_parse;
+	}
+	*slash = '\0';
+	/* Resolve the path to an existing rdtgroup. */
+	grp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
+	if (!grp) {
+		rdt_last_cmd_puts("Group not found\n");
+		ret = -EINVAL;
+		goto out_parse;
+	}
+	*rdtgrp = grp;
+
+out_parse:
+	/* Restore the option string after temporary null termination. */
+	if (end)
+		*end = ';';
+	return ret;
+}
+
+/**
+ * resctrl_kernel_mode_write() - Set the active kernel mode policy
+ * @of: kernfs open file
+ * @buf: Write buffer; use the resctrl_kernel_mode_show() line format without
+ *	 brackets and with a trailing newline
+ * @nbytes: length of @buf
+ * @off: unused
+ *
+ * Parse and validate the request, then update the active kernel mode
+ * association.
+ *
+ * Return: @nbytes on success, negative errno on error.
+ */
+static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	enum kmode_state ctrl_mode = KMODE_ASSIGN, mon_mode = KMODE_ASSIGN;
+	char *mode_str, *options;
+	enum resctrl_kernel_mode mode;
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	rdt_last_cmd_clear();
+
+	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
+		rdt_last_cmd_puts("kernel_mode_write: Invalid input\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	buf[nbytes - 1] = '\0';
+
+	buf = strim(buf);
+	options = strchr(buf, ':');
+	if (options) {
+		*options = '\0';
+		options++;
+	}
+	mode_str = strim(buf);
+
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
+		if (!strcmp(mode_str, resctrl_mode_str[mode]))
+			break;
+
+	if (mode == RESCTRL_NUM_KERNEL_MODES) {
+		rdt_last_cmd_puts("Unknown kernel mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup)) {
+		rdt_last_cmd_puts("Kernel mode not available\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (mode == RESCTRL_INHERIT_USER) {
+		rdtgrp = NULL;
+		goto update_mode;
+	}
+
+	rdtgrp = &rdtgroup_default;
+
+	if (!options)
+		goto validate_kmode;
+
+	ret = resctrl_kmode_parse_ctrl_mon(options, "ctrl=", &ctrl_mode);
+	if (ret) {
+		rdt_last_cmd_puts("Invalid ctrl= option\n");
+		goto out_unlock;
+	}
+	ret = resctrl_kmode_parse_ctrl_mon(options, "mon=", &mon_mode);
+	if (ret) {
+		rdt_last_cmd_puts("Invalid mon= option\n");
+		goto out_unlock;
+	}
+
+	ret = resctrl_kmode_parse_group(options, &rdtgrp);
+	if (ret)
+		goto out_unlock;
+
+	if (ctrl_mode == KMODE_INHERIT && mon_mode == KMODE_INHERIT)
+		goto out_unlock;
+
+validate_kmode:
+	if (ctrl_mode == KMODE_ASSIGN && !resctrl_kcfg.caps.ctrl_en) {
+		rdt_last_cmd_puts("Control assignment not supported\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (mon_mode == KMODE_ASSIGN && !resctrl_kcfg.caps.mon_en) {
+		rdt_last_cmd_puts("Monitoring assignment not supported\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Applying mon=inherit on monitor group is no-op. Reject it */
+	if (mon_mode == KMODE_INHERIT && rdtgrp->type == RDTMON_GROUP) {
+		rdt_last_cmd_puts("Monitoring inherit on mon group is no-op\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (rdtgrp->mode != RDT_MODE_SHAREABLE) {
+		rdt_last_cmd_puts("The group is not in shareable mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+update_mode:
+	if (resctrl_kcfg.active.kmode_cur == mode &&
+	    resctrl_kcfg.active.k_rdtgrp == rdtgrp &&
+	    resctrl_kcfg.active.ctrl_mode == ctrl_mode &&
+	    resctrl_kcfg.active.mon_mode == mon_mode)
+		goto out_unlock;
+
+	if (resctrl_kcfg.active.kmode_cur != RESCTRL_INHERIT_USER &&
+	    resctrl_kcfg.active.k_rdtgrp)
+		rdtgroup_kmode_deactivate(resctrl_kcfg.active.k_rdtgrp);
+
+	if (mode == RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU) {
+		resctrl_kcfg.active.ctrl_mode = ctrl_mode;
+		resctrl_kcfg.active.mon_mode = mon_mode;
+		rdtgroup_kmode_activate(rdtgrp);
+		resctrl_kcfg.active.k_rdtgrp = rdtgrp;
+	} else {
+		resctrl_kcfg.active.k_rdtgrp = NULL;
+		resctrl_kcfg.active.ctrl_mode = KMODE_INHERIT;
+		resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
+	}
+	resctrl_kcfg.active.kmode_cur = mode;
+
+out_unlock:
+	info_kn_unlock(of->kn);
+	return ret ?: nbytes;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1745,6 +2048,12 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
+	if (rdtgrp->kmode) {
+		rdt_last_cmd_puts("Cannot change mode of a kernel-mode associated group\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
 	mode = rdtgrp->mode;
 
 	if ((!strcmp(buf, "shareable") && mode == RDT_MODE_SHAREABLE) ||
@@ -2185,9 +2494,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "kernel_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_kernel_mode_show,
+		.write		= resctrl_kernel_mode_write,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
 	{
@@ -4699,6 +5009,13 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/* Check for kernel mode association */
+	if (rdtgrp->kmode) {
+		rdt_last_cmd_puts("Cannot move a kernel-mode associated group\n");
+		ret = -EPERM;
+		goto out;
+	}
+
 	/*
 	 * Allocate the cpumask for use in mongrp_reparent() to avoid the
 	 * possibility of failing to allocate it after kernfs_rename() has
-- 
2.43.0

