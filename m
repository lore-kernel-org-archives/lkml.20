Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437221;
	b=CsUm4bhz2d5QH8GoP6Ma6UHnzO0COYRiJaREOAnTMy/hr6kAjCMd7Zo0AgfqGfSDrQgo
	 3PupM/qTcY8NbSD+79LjOp1IoPBRgvh7diFnduclkwFV3Qo+xGuA+6tLl9KmrftRMawUs
	 Vi30pwKuMxB8XdYsN2Rmk+W7p4RpA6xdg8gDX9HG9SxnIQPhqajzL8rCOw6AehOnROTNw
	 BFfEk0DvcLPqs6HYkOmZ8Bpm+5mopnFB7cM1WmqAUeJNB1eIPeUnyIStcz/Akq3LGtRtX
	 SzmrvbDnxnIRy0mhj05lRkm+KFMQjIdDdY3YBfBpbsmbx+EnkAdhcb0Z2+U0JIxzYgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437221;
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
	bh=bvVlipsuecsRwyeE2fzQauYlkdC5INYvnnWW02y3pCQ=;
	b=a1Ag0JZIXzOC2QpdPdscUkSzLKCTxaxxSx4YYH2MF0EveRsUoydjzVFHaawO8pQLmN4I
	 Dr2a7J2oJJ0lvMvzFKfNH3BYjeg1mW9K7Q27LIrwU466HpaLa3AuZOzo1aAuZd+lw9XOx
	 +g8PtSKcgBy1++hAcUMyqTl2cYm0146rmEJmGs7S22/vo3vbg4i3xcmx8bY21amUvksMI
	 zG+JLd6BNchK2rcmK3MGAfxqTs7YjykpC9h+ZF7grGY4K5DFCu2JBKjPkLuW0EgzB2Gc1
	 502PTTajbH3tlPm9X8PFt+tnG7TqO58knv+0cbCy/LuHS+kuVFJ4QUx1urpWd8BCT3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vOtv+sKV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.34
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C3606E29C;
	Wed, 11 Nov 2026 22:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2C3606E29C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vOtv+sKV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui0e+7sC59z9RDAgPDwxd7F2c//lysx2DjdFOsaCLFOd6/GoAR3XZpEzv9XG+LZMv1zfjqtdJiPSGqH0DSzMGHFgo5G+jDk3k746EAqmcXItVW2oiQJDAk0iis7kuow9Ewu/neigD4SBYDm095r/Whc4gTymb33WHTSME4gZFLJ8mehq2Yo/ryMCYe8Nntsn7kQcvwYRyNMLy/xPG6CjLQ1s3DUK8V3wWUbvVmK1AsCmJ8QY9N/TbhRr2K13QhAShAbRZT555e/dENZ+VYzdGpb0+HbnDkH3Dy9g0FbDNCQRzw8iq7z0P9sQrSB/59te2lIm6ZKwj6S+38XN3PT3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvVlipsuecsRwyeE2fzQauYlkdC5INYvnnWW02y3pCQ=;
 b=enMCSka/nXxSoc88jcD0RfeEkGo5wbtrZ+VZTXa5uJfYjua8kp+O+7x/uNRL9xXcoxEWpvMHwJM66Ww7rLyGPMY7a9FdSj7NQUPzvuZD4jQhfPJmMYC3E+EXhCj64HVwX3TBT70Osg0lREMJeWl/0gQGH+f81RKdaPqKG7/LmCGZUnjtnq0Gg1Ug6qfkepLhLwkb2WknGQN7Qrdm8BtEiMvBlpcCwz31Inpe63RDWu39aJccZgugtZW5qPw7v1CSP97BZqqp8PctPGHjB7ZVtnaeJgKhugMvP+oeR9qvh3eCxtS6ls7L2kglMRj+d+J0CPHtQU4zA0JhxawhtH6IZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvVlipsuecsRwyeE2fzQauYlkdC5INYvnnWW02y3pCQ=;
 b=vOtv+sKVW86XDFSCc6UaTZUsK8aMr3MbMTrUVMLLyO0qMl3fQ7BDlYDziy4UnoyIpYeCgNQutPFpNRf6GW7HgDGh2jdl26I4o/KreanaQwpKfR/dpg6Ux/Zz26aeoJ6locWm6sF3Xbm2+aog6RHiTetJan/NyjzscbccXX0lmlo=
Received: from SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:46:55 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::68) by SJ0PR13CA0021.outlook.office365.com
 (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:46:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:53 -0600
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
Subject: [PATCH v7 15/19] fs/resctrl: Extend info/kernel_mode to configure the kernel mode
Date: Wed, 11 Nov 2026 16:44:08 -0600
Message-ID: <f2ad1989facce953f3ffe1b8687ae4fcf8629a26.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 4028fbcd-f4b7-41be-50b6-08df4045af85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|23010399003|260925022911599003|261026140227099003|260925021311599003|260925021911599003|11063799006|5023799004|10067099003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	HyqfK+8d8y6pIiOoI62IigFDD8IQLlLyj2k/7x82PF6mjdYrKWkrHvtxus6PkKOZLl7c9J1h4zUW4DyEmcEYt0a4BM4m3AZiNeVdlfMQFtGYaXkPYsl5J3PQSHbKXt8hu/APs66S+JOD/bCZk7zPlMGt2dIFtzSB26yYLAcWQVb1sOowH1jdmVKXv03DNQpNHogWaIjshWTAmhinLmTvSkN5xNutEa49pVqwNNn9Z39U7Mm+lqWExGUbaKesIP7LSENX3N7dIwLyW2ADHOw+8Z//Hp4A1BHj+hdHwSoYnqJK694aMAgpVl85XLXwrS/S1Evt1ihggkCu+CyVYjWENK4oQsRTDfm3kIGm2zC5F8dL5DsWdTKYa1PRSzbfQjswlak7/vfWEmfdfsIplI4CKtcUAeNMKOQlL9/3NHb1At0GlvW5Io+0OZ4LYk28DVafroy9uu6tQuqaVQog6v2GZMAs7/wKFFxz1ecgxABDzqfNTkLTiNhmNGXBOHeAAgajtjoLzkIl1jdwRfSlde8+86IMgYB2yNeWrmIFWaHrsf5KAJc8YaBBnFfKYxP2P/8+fscwsOTOOASEkZDoiud4DY1FNkookAmXNtMoVZityxah1iNmeI66f+ZxtjBDOVU4Va1aTdx/RNikIhnk/CoihLvQkSN7F1P6tYkQBNhmfq0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(23010399003)(260925022911599003)(261026140227099003)(260925021311599003)(260925021911599003)(11063799006)(5023799004)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qlcR2DrE8iO1OA6YsPNbi0TJjJLRhag+nYvOj28XgzNV3UR7PUsESi8lhRa5i+andy09MatO6Uhv0ri+P+FALDS3At0y2PYdqVxnmRJBHnZhIAjsJm8tROfuWB7UV5L5hdw6G0c3zcnMK+I6yvpcH6jVimGaAMQ8QZBc659Dng2wBFASZVnDZD79cYyssHfgvLPymUSnpXtzkX0axr3F9iML9CQylvNCyTtwisb+HgTFO6yJ3UnZo7qvH4KWqAunuo6eAAl0jUimf26JeyW+maHRrwlNoeM051saQ1kMK0KbaA5CIo16YG2omLZmPTneo+bTfjCVv++pDOoagp65DvTX4QuFEoIEaTFqZpjbX1uyhuOlNVxcuQhUJg2xQ9e0xPUpowfpDjjCJMcH1E1WxLw2zAPTXNpB+3eRyS/UVhGtp0UG6FHo+EAvuCpuWmeE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:55.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4028fbcd-f4b7-41be-50b6-08df4045af85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268

Kernel mode support allows the CPU's CLOSID and/or RMID associations to
change during the transition from user mode to kernel mode. The resctrl
file info/kernel_mode lists the current kernel mode configuration.

Extend info/kernel_mode with write support so user space can configure the
active kernel mode. Validate kernel mode configuration before activation.
Restrict backing groups to shareable mode so the kernel can use the group's
CLOSID and/or RMID, which are shared with the group's tasks.

Document the interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Refactored rdtgroup_kmode_global_activate and rdtgroup_kmode_global_deactivate().
    Removed resctrl_kmode_switch().
    Refactored resctrl_kmode_parse_group().
    Handled the "group=" as the last parameter.

v6: Use flattened resctrl_kmode and global_enable_per_cpu. Omitted
    parameters keep the values shown by reading the file. Drop the
    ctrl=inherit;mon=inherit no-op. Parse options with strsep(), as the
    other resctrl writers do, and split validation out of the write path.
    https://lore.kernel.org/lkml/3bc39dd7-b7b0-4203-a493-0bd872fdc644@intel.com/

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
 Documentation/filesystems/resctrl.rst |  40 ++++
 fs/resctrl/rdtgroup.c                 | 274 +++++++++++++++++++++++++-
 2 files changed, 313 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e57361dd342e..1a1877222624 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -608,6 +608,46 @@ The top level of the "info" directory contains the following file(s):
 		[inherit_user]
 		global_enable_per_cpu:ctrl=assign;mon=assign;group=//
 
+	Writes use the same line format as reads, without square brackets and
+	with a trailing newline. Errors are reported in "info/last_cmd_status".
+
+	"inherit_user":
+		Written without parameters.
+
+	"global_enable_per_cpu":
+		"ctrl=", "mon=", and "group=" are optional.
+
+		An omitted "ctrl=", "mon=" and "group=" keeps the default values.
+
+		If "mon=inherit", or monitoring is unsupported, "group=" must
+		reference a CTRL_MON group.
+
+		The "ctrl=inherit" together with "mon=inherit" is rejected.
+
+		A MON group requires "mon=assign".
+
+		"group=" must be the last parameter. The group must be in shareable mode.
+
+		Selecting a new kernel mode, parameter, or group replaces the active
+		mode and updates "kmode_cpus" to include all online CPUs.
+
+		Empty values are rejected.
+
+		Example::
+
+			# mkdir ctrl1
+			# echo "global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//" \
+				> info/kernel_mode
+
+			# cat info/kernel_mode
+			inherit_user
+			[global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//]
+
+			# echo "inherit_user" > info/kernel_mode
+			# cat info/kernel_mode
+			[inherit_user]
+			global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 97d99406de00..872755532fb4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1201,6 +1201,277 @@ static void rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
 	resctrl_kmode.mon = KMODE_ASSIGN;
 }
 
+/* Program @rdtgrp on every online CPU and show its kmode_cpus files. */
+static void rdtgroup_kmode_global_activate(struct rdtgroup *rdtgrp,
+					   enum resctrl_kernel_mode mode,
+					   enum kmode_state ctrl,
+					   enum kmode_state mon)
+{
+	resctrl_kmode.active = mode;
+	resctrl_kmode.ctrl = ctrl;
+	resctrl_kmode.mon = mon;
+	resctrl_kmode.rdtgrp = rdtgrp;
+
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
+	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, true);
+}
+
+static int resctrl_kmode_parse_state(char *val, enum kmode_state *state)
+{
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
+/*
+ * group is "<CTRL_MON>/" or "<CTRL_MON>/<MON>/". The MON component is
+ * optional: mon=inherit and systems without monitoring do not require it.
+ * An empty name selects the default CTRL_MON group. Names are not trimmed;
+ * "/" cannot appear in a resource group name.
+ */
+static int resctrl_kmode_parse_group(char *group, struct rdtgroup **rdtgrp)
+{
+	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
+	char *mon = NULL, *slash;
+	size_t len;
+
+	len = strlen(group);
+	if (!len || group[len - 1] != '/') {
+		rdt_last_cmd_puts("Group must be <CTRL_MON>/ or <CTRL_MON>/<MON>/\n");
+		return -EINVAL;
+	}
+	group[len - 1] = '\0';
+
+	slash = strchr(group, '/');
+	if (slash) {
+		*slash = '\0';
+		mon = slash + 1;
+		if (strchr(mon, '/')) {
+			rdt_last_cmd_puts("Group must be <CTRL_MON>/ or <CTRL_MON>/<MON>/\n");
+			return -EINVAL;
+		}
+	}
+
+	if (group[0] != '\0') {
+		parent = NULL;
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (!strcmp(rdt_kn_name(rdtg->kn), group)) {
+				parent = rdtg;
+				break;
+			}
+		}
+	}
+	if (!parent)
+		goto not_found;
+
+	if (!mon || mon[0] == '\0') {
+		*rdtgrp = parent;
+		return 0;
+	}
+
+	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list) {
+		if (!strcmp(rdt_kn_name(rdtg->kn), mon)) {
+			*rdtgrp = rdtg;
+			return 0;
+		}
+	}
+
+not_found:
+	rdt_last_cmd_puts("Group not found\n");
+	return -EINVAL;
+}
+
+static int resctrl_kmode_parse_parameters(char *params, enum kmode_state *ctrl,
+					  enum kmode_state *mon,
+					  struct rdtgroup **rdtgrp)
+{
+	char *key, *tok;
+
+	while ((tok = strsep(&params, ";"))) {
+		key = strsep(&tok, "=");
+		if (!tok) {
+			if (strim(key)[0] == '\0')
+				continue;
+			rdt_last_cmd_puts("Missing '=' in kernel mode parameter\n");
+			return -EINVAL;
+		}
+		key = strim(key);
+		if (key[0] == '\0') {
+			rdt_last_cmd_puts("Empty kernel mode parameters\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * group= is the last parameter and may contain ';'.
+		 * Restore it if stripped.
+		 */
+		if (!strcmp(key, "group") && params)
+			params[-1] = ';';
+
+		tok = strim(tok);
+		if (tok[0] == '\0') {
+			rdt_last_cmd_puts("Empty kernel mode parameters\n");
+			return -EINVAL;
+		}
+
+		if (!strcmp(key, "group"))
+			return resctrl_kmode_parse_group(tok, rdtgrp);
+
+		if (!strcmp(key, "ctrl")) {
+			if (!resctrl_arch_alloc_capable()) {
+				rdt_last_cmd_puts("ctrl= is not supported\n");
+				return -EINVAL;
+			}
+			if (resctrl_kmode_parse_state(tok, ctrl)) {
+				rdt_last_cmd_puts("Invalid ctrl= parameter\n");
+				return -EINVAL;
+			}
+		} else if (!strcmp(key, "mon")) {
+			if (!resctrl_arch_mon_capable()) {
+				rdt_last_cmd_puts("mon= is not supported\n");
+				return -EINVAL;
+			}
+			if (resctrl_kmode_parse_state(tok, mon)) {
+				rdt_last_cmd_puts("Invalid mon= parameter\n");
+				return -EINVAL;
+			}
+		} else {
+			rdt_last_cmd_puts("Unsupported kernel mode parameter\n");
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static int resctrl_kmode_global_validate(struct rdtgroup *rdtgrp,
+					 enum kmode_state ctrl,
+					 enum kmode_state mon)
+{
+	if (ctrl == KMODE_ASSIGN && !resctrl_arch_alloc_capable()) {
+		rdt_last_cmd_puts("ctrl=assign is not supported\n");
+		return -EINVAL;
+	}
+	if (mon == KMODE_ASSIGN && !resctrl_arch_mon_capable()) {
+		rdt_last_cmd_puts("mon=assign is not supported\n");
+		return -EINVAL;
+	}
+	if (mon == KMODE_INHERIT && rdtgrp->type == RDTMON_GROUP) {
+		rdt_last_cmd_puts("A monitor group requires mon=assign parameter\n");
+		return -EINVAL;
+	}
+	if (rdtgrp->mode != RDT_MODE_SHAREABLE) {
+		rdt_last_cmd_puts("The group is not in shareable mode\n");
+		return -EINVAL;
+	}
+	if (rdtgrp->type == RDTMON_GROUP &&
+	    rdtgrp->mon.parent->mode != RDT_MODE_SHAREABLE) {
+		rdt_last_cmd_puts("The parent group is not in shareable mode\n");
+		return -EINVAL;
+	}
+	if (ctrl == KMODE_INHERIT && mon == KMODE_INHERIT) {
+		rdt_last_cmd_puts("ctrl=inherit and mon=inherit is not supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * resctrl_kernel_mode_write() - Set the active kernel mode
+ * @of:		kernfs open file
+ * @buf:	Kernel mode line written by user space
+ * @nbytes:	length of @buf
+ * @off:	unused
+ *
+ * Return: @nbytes on success, negative errno on error.
+ */
+static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	enum resctrl_kernel_mode mode;
+	enum kmode_state ctrl, mon;
+	char *mode_str, *params;
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	rdt_last_cmd_clear();
+
+	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
+		rdt_last_cmd_puts("kernel_mode: Invalid input\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	buf[nbytes - 1] = '\0';
+
+	mode_str = strsep(&buf, ":");
+	mode_str = strim(mode_str);
+	params = buf;
+
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
+		if (!strcmp(mode_str, resctrl_kmode_str[mode]))
+			break;
+	}
+	if (mode == RESCTRL_NUM_KERNEL_MODES) {
+		rdt_last_cmd_puts("Unknown kernel mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (!test_bit(mode, resctrl_kmode.supported)) {
+		rdt_last_cmd_puts("Kernel mode not available\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (mode == RESCTRL_INHERIT_USER) {
+		/* "inherit_user" does not support parameters */
+		if (params && strim(params)[0] != '\0') {
+			rdt_last_cmd_puts("Unsupported parameter\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		if (resctrl_kmode.active == RESCTRL_GLOBAL_ENABLE_PER_CPU)
+			rdtgroup_kmode_global_deactivate(resctrl_kmode.rdtgrp);
+		goto out_unlock;
+	}
+
+	/* Initialize the default values */
+	ctrl = resctrl_arch_alloc_capable() ? KMODE_ASSIGN : KMODE_INHERIT;
+	mon = resctrl_arch_mon_capable() ? KMODE_ASSIGN : KMODE_INHERIT;
+	rdtgrp = &rdtgroup_default;
+
+	if (params) {
+		ret = resctrl_kmode_parse_parameters(params, &ctrl, &mon, &rdtgrp);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ret = resctrl_kmode_global_validate(rdtgrp, ctrl, mon);
+	if (ret)
+		goto out_unlock;
+
+	if (resctrl_kmode.active == mode && resctrl_kmode.rdtgrp == rdtgrp &&
+	    resctrl_kmode.ctrl == ctrl && resctrl_kmode.mon == mon)
+		goto out_unlock;
+
+	if (resctrl_kmode.active == RESCTRL_GLOBAL_ENABLE_PER_CPU)
+		rdtgroup_kmode_global_deactivate(resctrl_kmode.rdtgrp);
+
+	rdtgroup_kmode_global_activate(rdtgrp, mode, ctrl, mon);
+
+out_unlock:
+	info_kn_unlock(of->kn);
+	return ret ?: nbytes;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -2188,9 +2459,10 @@ static struct rftype res_common_files[] = {
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
-- 
2.43.0

