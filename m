Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4553C38BF9C;
	Wed, 26 Aug 2026 19:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772887; cv=fail; b=cgb/xyd//pxuzbvctdmKnGSHARc+G1tE4XfP0Q7StxVWhkQ2WZdJtprffLiI8B5cgTJK5Rez7FMi+ck1OHV/znM8WkscZC/j8jj/hKQegNYv/hD8rgq8+4kJeXatftYnaLvQeIbYDv8hcFkw8jtXuwfd93MZezZMAh70lAozAl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772887; c=relaxed/simple;
	bh=+0XXURsx8h8gYsULI9KChZH5DXqbhAe1uCrIGhAp7eY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmGJBkJVf8I+eDi78He5AFq4i1lpQpfCVYUtL3Qd9fYQCmtCfGiibuDY+bdtw9gKHzM7iMqhHEFpjGLCmY7loAYH45WEAYUmLfiEObCbA5iIgMYp1dvxRaUCWqyXmhM4ndc6d5xw/bMprDhU+r+EeMU2S11X9ZmyqhdMt/Lcwak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UVM6MmGQ; arc=fail smtp.client-ip=52.101.85.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UVM6MmGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knKzKKKPM8LnaiDmn1HxmuweWdrgVGgZE4T6mHBwbtXBW6PB2PpK5r/hSZUDCBiOsGih1+fRzbgfG4T3d/Qat8rcO0nFnDtim/u6fS7pG/GlZ0A328qFD1qtyLz/ogrYP4qTVq7r3oqxSPob/mSxG5bYnp+jVJKtzBsDllVSlA9e6T2kWI/ZENPL8N6axIjNjz5J5DQffR/jYDHiz764oY3ZXzjFF3rzIrfcjBp2Ie4gGC4dhXwwXb2uc7+ZcfA+444uK1CEV66hJjs19aCwb1iki2NtEv/DVlPcJg9+VOjVHq2LxriK9SFvUpPfTIOU546o4/Ea7MTQguk0Y6duVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bl87Y/QSTF14myEKVQY64GDKrtUpLNuUUhqW0rZt4c=;
 b=PEwFldZQSGm/DHh/hlLf+BYdTV+XjZH8P9T7pI0Dap4DCDrJghkyBdTrkK70TUhsyqni7DPbpa8TRzx1MNlyhmRXav084kUQh3y82J/6OP1GxV1jy3SW4IiluSqWxwi9GyU6YKnKVNLJVgsUNKoY8uniRtaB94bWr5xTUS5rODN+tgLkKGT4TnsPTBA00LH6tqlFlQWIKIf5a2GZKcrSrJVGhSeykGo2YMfGRZ5Zj6y6O1awMyL0x0w8o6geqJPY0UEXWXWoEUBVu+VCLld1/dmpaqqSuUKjT2c/jstB0D4nDeyVFuz4/JoNqqC07OK36xlJ1DnDX85RI/iTGSTqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bl87Y/QSTF14myEKVQY64GDKrtUpLNuUUhqW0rZt4c=;
 b=UVM6MmGQXuEiLONpxWdFHoUbedQrr9zf9juvI3YrX0WJNnxJ5ZmypJvC2sbOWKdLvvNDaQK9ZZPq1meIupOnbyORIxczHaW+Ru8Gy8+C4bMzovmOzDZZBeRGDCe9n4qoTnqlvcEuUPvgbxHEBVRftusCF25GN+WDGypif+IZn0c=
Received: from SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 19:34:26 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::7b) by SJ0PR05CA0008.outlook.office365.com
 (2603:10b6:a03:33b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 19:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:23 -0500
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
Subject: [PATCH v5 09/16] fs/resctrl: Add interface to display supported and active kernel modes
Date: Wed, 26 Aug 2026 14:32:23 -0500
Message-ID: <530d77a64117347dc1a4d2666967df188a3a4757.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a74281-519f-4837-91b3-08df03a909a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|82310400026|1800799024|36860700016|8126099003|18002099003|22082099003|56012099006|5023799004|11063799006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+CVhdnX7JVwrXPeXmsgY/2CRSJgmFCnqLWRLsFeC5ysG4aeZShq1IoUALy70Z4yFMoBxLXaJ+WccxlqQZmtI+aMpxTGIEW+0XjaubJ+kYJCLvZq2I5aEpKzpKgPJ5+WPJSSvSOuUa5kZrXusObNq4sxb9IqEQgm2JE2SENj2tZi85Nn0EOuAgpY59Er2n7f9IxztxEDuZ7mowDI2KmKbHPqDhDv3KGXkQFSCgQuMkoXzoeVe2vx10l4i6tJv9leTnW90EBwzC6IDYBx5F+8D/REH+mX+CzNw84OvUHY4VLBnIeor5VmQ+lg6pPRhl6hUDAQL28CNDiy/7dSRc+ObU7b4AAT62/2f1I58aIf5qvvxQhbcM8hGeGJQNbEJ8e2GJVD6gXCawXXFBEqGufWtVgzTK+bGf2jewVJwvoCwxKFT86h8aG3lWLpRK9/FKw6Q7ordxONxJdyR7cDoVf+1H3ipJNeDIRjJ+TjE8zv6NvRW22zQDoUdRYCzGWicYkJYBYbtXZZYs+orHBoAjXdpnw5LMB82DHstNi+yZWcu6KD2wLJKptiFFJyvo5TEC2b7+8ynqUIw5O/bzhXsBpBRQx0fiH4+ExzHOdKTSGT9jCSFWpdxXY0Qw7hphv/XDRMPAtgFBP1YtquZETgcPoCw69l8XIdu9Ra1EL5lomSYL+X8VvfKj23CPzpoTHQVhPuIzSwrr5vnVxZhkB9DyvyYKg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(82310400026)(1800799024)(36860700016)(8126099003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oz+T8WiIPAAlY6YLeDXgy8t3q2NPDGYSd8dQ7IY2XOJ1F8PDplqN8ZJNGPi3tdM3YV5NjXARvyjuOPrFJ2E+Be7A/n7qCpifCONmCESYGPpJvwzK3IIBTYFGXx8AkN76FxDsM+4MXSk3MAgJn6ooxAa732YRdgaH2tVR7y3qTu1CnRhGVjjBrh40/TaGqEhf4p4ICjaCKQb6QzoVX5Dpg2u2M5YF0xuYYNp3URVeJ93Jhanoowq6q6MrYYqqyg0/twem8ACYhhdRxvQ+xC3pJ7/Np44g5559oRxaKj5yzQuMQnJiTr6PDtTdKoxhIHvvSZYYqXQ12mq54AktwmII1q/m/RPNrv1B8iWp69b//Co1m5lKjEioVU46EwPgZDFa9ZJxnyMtySYusxGIyBFGI+InQKOzbizwcvr+AdByf1n6s7z3qjgJ40X+H22jpcE6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:25.5261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a74281-519f-4837-91b3-08df03a909a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192

Resctrl kernel modes define how resource allocation and monitoring
associations are applied in kernel mode relative to user mode. Generic
resctrl maintains information about supported kernel modes, the currently
active mode, and the resource group associated with global assignment
mode, but this information is not currently visible to user space.

Add info/kernel_mode to expose kernel mode configuration through the
resctrl filesystem. The file lists all supported kernel modes, one per
line, identifies the active mode by enclosing it in square brackets, and
for assign_global_enable_per_cpu also reports ctrl=, mon=, and group=.
Document the read interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Use resctrl_kcfg.caps and resctrl_kcfg.active after the struct split
    from patch 0006. Rename resctrl_kmode_bind_str() to
    resctrl_kmode_state_str() and ctrl_bind/mon_bind to ctrl_state/mon_state.
    Used info_kn_lock()/info_kn_unlock().
    Add documentation update in resctrl.rst.

v4: Fixed the display of inherit_ctrl_and_mon policy. It is not
    associated with any group.
    Added "uninitialized" for the non-active group.
    Rewrote the changelog.

v3: New patch to handle the changed interface file info/kernel_mode.
    Changed the group name to "none" if kmode binding is not done.
    Reinette suggested "uninitialized". "none" seemed more relevent.
---
 Documentation/filesystems/resctrl.rst |  29 +++++++
 fs/resctrl/rdtgroup.c                 | 115 ++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index f3e941404967..c6e8cf828e18 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -528,6 +528,35 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+"kernel_mode":
+	In the top level of the "info" directory, "kernel_mode" reports
+	supported and active kernel modes available on the system.
+
+	Reading the file lists one mode per line. The active mode is wrapped in
+	square brackets. inherit_user is shown without options.
+	assign_global_enable_per_cpu is shown as::
+
+	  assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;group=<ctrl>/<mon>/
+
+	- inherit_user: inherit allocation and monitoring from the user task.
+	- assign_global_enable_per_cpu: kernel mode may use separate
+	  allocation and/or monitoring associations. ctrl= and mon= show
+	  whether each is assigned or inherited, and group= identifies the
+	  associated resource group using <CTRL_MON>/<MON>/ path syntax.
+
+	Only supported modes are listed. On an inactive
+	assign_global_enable_per_cpu line, ctrl= and mon= show platform
+	capability defaults rather than the last active assignment, and
+	group=// is shown. When the mode is active, ctrl= and mon= report
+	the current assignment state and group= identifies the associated
+	resource group.
+
+	Example::
+
+	  # cat info/kernel_mode
+	  [inherit_user]
+	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3bb0e3a203ac..992af586a194 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1010,6 +1010,114 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/* Sysfs lines for info/kernel_mode; indexed by enum resctrl_kernel_mode */
+static const char * const resctrl_mode_str[] = {
+	[RESCTRL_INHERIT_USER]	=			"inherit_user",
+	[RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU] =	"assign_global_enable_per_cpu"
+};
+
+static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
+
+static const char *resctrl_kmode_state_str(enum kmode_state state)
+{
+	return state == KMODE_ASSIGN ? "assign" : "inherit";
+}
+
+static void resctrl_kmode_group_path(struct rdtgroup *rdtgrp,
+				     const char **ctrl, const char **mon)
+{
+	*ctrl = "";
+	*mon = "";
+
+	if (!rdtgrp)
+		return;
+
+	if (rdtgrp->type == RDTMON_GROUP) {
+		*ctrl = rdt_kn_name(rdtgrp->mon.parent->kn);
+		*mon = rdt_kn_name(rdtgrp->kn);
+	} else {
+		*ctrl = rdt_kn_name(rdtgrp->kn);
+	}
+}
+
+/**
+ * resctrl_kernel_mode_show() - Display supported and active kernel modes
+ * @of: kernfs open file
+ * @seq: output seq_file
+ * @v: unused
+ *
+ * Lists one line per mode set in resctrl_kcfg.caps.kmode_sup. Brackets the
+ * active mode. inherit_user is shown without any options.
+ * assign_global_enable_per_cpu is shown as:
+ *
+ *   assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;\
+ *					group=<ctrl>/<mon>/
+ *
+ * When assign_global_enable_per_cpu is inactive, ctrl=assign and mon=assign
+ * reflect resctrl_kcfg.caps.ctrl_en and resctrl_kcfg.caps.mon_en, and
+ * group=//. When active, assign state comes from resctrl_kcfg.active.ctrl_mode
+ * and resctrl_kcfg.active.mon_mode.
+ *
+ * Return: 0 on success, or -ENOENT on error.
+ */
+static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
+				    struct seq_file *seq, void *v)
+{
+	const char *ctrl_state, *mon_state;
+	enum resctrl_kernel_mode mode;
+	struct rdtgroup *rdtgrp;
+	const char *ctrl, *mon;
+	bool active;
+	int ret = 0;
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
+		if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup))
+			continue;
+
+		active = (resctrl_kcfg.active.kmode_cur == mode);
+
+		if (mode == RESCTRL_INHERIT_USER) {
+			seq_printf(seq, active ? "[%s]\n" : "%s\n",
+				   resctrl_mode_str[mode]);
+			continue;
+		}
+
+		if (active) {
+			ctrl_state = resctrl_kmode_state_str(resctrl_kcfg.active.ctrl_mode);
+			mon_state = resctrl_kmode_state_str(resctrl_kcfg.active.mon_mode);
+			rdtgrp = resctrl_kcfg.active.k_rdtgrp;
+			if (WARN_ON(!rdtgrp)) {
+				rdt_last_cmd_puts("Invalid kernel mode group\n");
+				ret = -ENOENT;
+				goto out_unlock;
+			}
+			resctrl_kmode_group_path(rdtgrp, &ctrl, &mon);
+		} else {
+			ctrl_state = resctrl_kcfg.caps.ctrl_en ? "assign" : "inherit";
+			mon_state = resctrl_kcfg.caps.mon_en ? "assign" : "inherit";
+			ctrl = "";
+			mon = "";
+		}
+
+		if (active) {
+			seq_printf(seq, "[%s:ctrl=%s;mon=%s;group=%s/%s/]\n",
+				   resctrl_mode_str[mode], ctrl_state, mon_state,
+				   ctrl, mon);
+		} else {
+			seq_printf(seq, "%s:ctrl=%s;mon=%s;group=%s/%s/\n",
+				   resctrl_mode_str[mode], ctrl_state, mon_state,
+				   ctrl, mon);
+		}
+	}
+
+out_unlock:
+	info_kn_unlock(of->kn);
+	return ret;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1995,6 +2103,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "kernel_mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_kernel_mode_show,
+		.fflags		= RFTYPE_TOP_INFO,
+	},
 	{
 		.name		= "mbm_assign_on_mkdir",
 		.mode		= 0644,
-- 
2.43.0

