Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437179;
	b=l1djfGjwoiGqptU5WeVyyLbEwYnVr4MCJpcSAtoqxzM5dzhwQ1lyGNuG6Cd3bLWqDxIl
	 Gy3rQJRMp9AMBZ0KV/mSYAmN6Lbl54H05bUSwWLjue5dZQFw7WkRpAsmFERhr8dR3AFzm
	 FU1BFc0aTdR53EZJwS4eo97MIG8dOv6qNCPcE3z31lIytP94NDXTQEiOrAGIUS6Y406Tt
	 uB18wUzRDCexcAlVqS4jzdcRv3uAd2R0reZlQjSRpni9AlNdKaKSzS3G7zogTnSDotpsO
	 m6q0oZUrDXfrZHLEA1e/w3uSsrkpj4tCmYANd6xP6XgHLempBJGCPHrp8GLnKcrkw8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437179;
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
	bh=w1Jf+esgchSh6CMK9HSxao1uOrRb0FmDd53VoOmtuGc=;
	b=HxdVDaNiJJTJYfxB2OAhSZQSCY81fRyaMXW9O/d06iLcJfid1xz2VMVnm571iZHYfuYv
	 0Z4hIUyNqWtVIMd9AEqzlfBmojVPbQzSrm6a6maPF846oPQNKnQFUPaDQGY+zLbh/7XX/
	 gvbRcQ3ty6sYSSSK3R9Gu1qWbuKvgp3BWqjhGb5wr2k12RaoKJUBGe8wFEqRbvIUXfOGJ
	 hMicV/7eKHxYlM1p9NfJoDtRKserFA/3P+fZm9ojXUdTbMf4GJ+52/Nw6F0/T1LU3hnI6
	 YPRlomMaC5ON1ZHseRjbh0qX8jT83dlU6Z3GWrLhpugNrqpw+/1f25Nf2RKOyv9WabQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z28ZPV9G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.52
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167E606A8B2;
	Wed, 11 Nov 2026 22:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2167E606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z28ZPV9G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGuBlHYxVJsdHk4nwlJyff5T79q7x+3jXTaC6i7Mk8/p9kktQ9BRmisTV2W10gzSpmiD4UajkMnd94SMQO6mMJJgsR65KiajpeALIKVbMrUwNvBCvndL1V511X7OTSiVgg6ysmwMemCbrRxsgQ/e6am6UANvBnoJ/h0L2+hBIbUCSfybrNMjf+4WbI/gTQX7PRBtBKNs2WCmMCp79xZgT1/UtQeZfLI5cbO0xBa5OFRUuzTeqsFVn7bBchMg3jsr8y0lyr5A9+00kT+ghv8VCmlaHxL0cIJAcJiNRrHGWUSZI2qiogzzMADJK191atXpExdcGc0fSw33AQX+UBwLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1Jf+esgchSh6CMK9HSxao1uOrRb0FmDd53VoOmtuGc=;
 b=F2EXDlejUWL4gvKfeNqTVuaAUsIGd8XH9wN1bgCOTKpUK6XKsJcuZ53+nVwgveK6soo7cSfPMcr2u0bK2Qvjk671+0tManKo0j/5vV4OY8UBex+9PuWzV3MwxfM244/O6ALO6EaGzZh7hmIYmH3UUxjqkwoekjnRIY5K9dekV3meZNFYT/5/rTxn3EFQ2qdTPD9J7VH4Z8zD7THm3+pRAHpPpWdeD0eU5vTBi8ub7QWFYMUXOeYHRo9YqCEv4mf+NmLYVpERd4RwmFZnAQ46MPfvLc4+D1MTwob+7fcMW4OEqT2FAwdBqnkBNby2W1/ZC49KACbTLTChsiSkYQCr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1Jf+esgchSh6CMK9HSxao1uOrRb0FmDd53VoOmtuGc=;
 b=z28ZPV9G12/AHEpXMip3uxC0nYuOBpj3aXMfTn7WsjhO1nGSFl5+xUQlXP98via5WvBVo6WjwySGp3KAmrKCaUuRA+vfTtRLS84xdoDG8KjpIZQaaP5wlL/ZZVLc0NA6L8q66X6H/jaevfg8nMlIyDjfC/40YSvLCxJJfcTRR/g=
Received: from MW4PR03CA0075.namprd03.prod.outlook.com (2603:10b6:303:b6::20)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 22:46:10 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::5c) by MW4PR03CA0075.outlook.office365.com
 (2603:10b6:303:b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:46:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:10 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:08 -0600
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
Subject: [PATCH v7 10/19] fs/resctrl: Add interface to display kernel mode status
Date: Wed, 11 Nov 2026 16:44:03 -0600
Message-ID: <a130e02b0b892370dc429e21eea9af411acbb148.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: f0754c1c-92cb-43f1-5b8f-08df404594b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|82310400026|23010399003|376014|18002099003|6133799003|22082099003|8126099003|3023799007|10067099003|5023799004|11063799006|261102123227099003|261028144727099003|56012099006|261009223027099003|261026121527099003|261022105027099003|261021121427099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Bj+CeGdA9Yu+GHoFgMNBnV7qDQS44Jg86eO95QvQu2dnKGjHjVSHiIq5XMbcNXsUEbB2SmbNk9Mgljy5UzZtzasAlZ5V4Q/XFxzf53aQQrrhvS/LkgCz8x6k07ocJI+JGXfQr8gER1Qtgkjlhb9yWJn+WDsG/ac8n+dJUh4ceAUvoYymqJT/noEqFhtC+3ybHIO6jAbiiBs1RB0ZkuzUuxT/6rjzB3hyCCblAPVZAX5pcX3CPJRivbGgu40tJmK09YInzgXDK6S1UHLadP2Ph/2fuDp8RrjCLSXKMdDFDDPRfsnhhT+pl1ZptbXmEs/VLyjSRj5+HB6JHXG4rSlzLzd12djGopBuhY6YOkaQEagJ2IT+G6wy3uwIsb9QmK5/xQsFoj+rxII2uWDfvoU4ieqFLAQXVPFm2vt10UimLH4WO5pa/yt+MAfcP36imTxzhAbI44AKH76G2c9zYzCqJTzkAfnJwj8E+/Etny8bIKnSy45FceLPMtFLB5XL81SzbvK/Lez2oYNG0koa+3/eZrMva8H5HrE1R1RarNq9wA9UTXI7WSqi8FJTGQV7DtbB/O2WMSCSKtLx/2j4WfKcnK3GCg4fY23My6kpIfxJlMDwglsHPMjhrPWUPwdxWgdbVX7bLQ5kqsBd4W+Vk7kNFPV71hdrif3JelZyCc4hW4ZMlJHpJGJJTWd1Ai2ebjLtQpZN3rZsde+vyORMp38y9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(8126099003)(3023799007)(10067099003)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(56012099006)(261009223027099003)(261026121527099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z46IBb/GVOUWikyKDl8BNNfr4L3jdidseIovFq/r5WnHZ3KRSeHLAe6iX1a1RpsUZES2Q09Tw3jSeYGJ2aDmyNq5nXI7VmfXJiB75rqgT19+TlQutwGBHoyMg+BpxafzKv2bfFEQWhUcIr1veAVpmt7CW+pdOsSTKH7XcKpOeR4V/6SlSBtu+jHMrKdJ/RP+LkOYJwEnAELDBtgaD5K6ZLp1/PpXRYDaQhPDPaY+p5UWozJVzlvxiTRHTBr2mlQDDcKCsOTw8OZjEWNVoR+ji/XV8aXo/AsXEZiH9pDFIKpCzBK+9YWfoAbxOeO85S3HhgesVR9hSWUQ59t1WGrJNpSElnbTIOENG1Rzp2CsB6h6+Lz9P8HCm7Az3GhBMbWgU3bT3HfTQHocahi406RLZbi3BWicoGyxI4qsNrp71cTZf+uaL9tqVC6XmS62ctlB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:10.0528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0754c1c-92cb-43f1-5b8f-08df404594b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285

Kernel mode support allows the CPU's CLOSID and/or RMID association to
change when transitioning from user mode to kernel mode.

Add info/kernel_mode to expose the supported and active kernel modes
through the resctrl filesystem. Supported modes are listed one per line,
with the active mode enclosed in square brackets.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated the changelog.
    kernel_mode prints the monitoring group only when mon == assign.

v6: Rewrote the changelog to make it as feature and not as a bug fix.
    Update the code to use the new name "global_enable_per_cpu".
    Display ctrl or mon only when allocation or monitoring is supportd.

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
 Documentation/filesystems/resctrl.rst |  56 ++++++++++++++
 fs/resctrl/rdtgroup.c                 | 105 ++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2d672bbb69be..033d405338c0 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -549,6 +549,62 @@ The top level of the "info" directory contains the following file(s):
 		# cat info/last_cmd_status
 		mask f7 has non-consecutive 1-bits
 
+"kernel_mode":
+	Lists the kernel modes supported by the system, one per line, with
+	the active mode enclosed in square brackets.
+
+	A task running on a CPU is associated with an allocation and
+	monitoring ID pair (ctrl_hw_id, mon_hw_id), which determines the
+	resource allocation and monitoring applied to that task. Kernel
+	modes allow the CPU's allocation and/or monitoring association to
+	change during the transition from user mode to kernel mode.
+
+	Possible kernel modes are:
+
+	"inherit_user":
+		Default mode at boot. Kernel work uses the allocation
+		and monitoring of the user task on whose behalf it runs.
+
+	"global_enable_per_cpu":
+		Kernel work uses the allocation and/or monitoring of a backing
+		CTRL_MON or MON group. The mode can be enabled or disabled
+		per-CPU. The line contains group= and whichever of ctrl= and
+		mon= the platform supports::
+
+		  global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;group=<CTRL_MON>/<MON>/
+
+		"ctrl":
+			"assign" if kernel work uses the resource group's
+			allocation, or "inherit" if it uses the user task's
+			allocation. Present only on systems that support allocation.
+
+		"mon":
+			"assign" if kernel work uses the resource group's monitoring,
+			or "inherit" if it uses the user task's monitoring. Present
+			only on systems that support monitoring.
+
+		"group":
+			Path of the backing resource group, relative to the resctrl
+			mount point.
+
+			A MON group is shown as "<CTRL_MON>/<MON>/".
+
+			A CTRL_MON group is shown as "<CTRL_MON>//" when "mon=assign".
+
+			When "mon=inherit", or monitoring is unsupported, a CTRL_MON group
+			is shown as "<CTRL_MON>/".
+
+		When the mode is not active, the output lists the supported parameters
+		and their default values, which are used if the mode is activated
+		without new values.
+
+	Example of a system that supports allocation and monitoring, with default mode
+	set to inherit_user::
+
+		# cat info/kernel_mode
+		[inherit_user]
+		global_enable_per_cpu:ctrl=assign;mon=assign;group=//
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 28bd4c4d98f2..afbe0f94940a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -998,6 +998,104 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/* Names used in info/kernel_mode; indexed by enum resctrl_kernel_mode */
+static const char * const resctrl_kmode_str[] = {
+	[RESCTRL_INHERIT_USER]		= "inherit_user",
+	[RESCTRL_GLOBAL_ENABLE_PER_CPU]	= "global_enable_per_cpu"
+};
+
+static_assert(ARRAY_SIZE(resctrl_kmode_str) == RESCTRL_NUM_KERNEL_MODES);
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
+ * @of:		kernfs open file
+ * @seq:	output seq_file
+ * @v:		unused
+ *
+ * Lists one line per mode and brackets the active mode. inherit_user
+ * has no parameters. global_enable_per_cpu prints ctrl= only when
+ * allocation is supported and mon= only when monitoring is supported,
+ * then group=. The MON group is included in group= only when monitoring
+ * is supported and mon is assign.
+ *
+ * Return: 0 on success, or -ENOENT on error.
+ */
+static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
+				    struct seq_file *seq, void *v)
+{
+	const char *ctrl_grp, *mon_grp;
+	enum resctrl_kernel_mode mode;
+	bool active;
+	char sep;
+
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
+		if (!test_bit(mode, resctrl_kmode.supported))
+			continue;
+
+		active = resctrl_kmode.active == mode;
+
+		seq_printf(seq, active ? "[%s" : "%s", resctrl_kmode_str[mode]);
+
+		if (mode == RESCTRL_GLOBAL_ENABLE_PER_CPU) {
+			ctrl_grp = "";
+			mon_grp = "";
+			if (active) {
+				if (resctrl_kmode.rdtgrp)
+					resctrl_kmode_group_path(resctrl_kmode.rdtgrp,
+								 &ctrl_grp, &mon_grp);
+				else
+					pr_warn("%s active without a resource group\n",
+						resctrl_kmode_str[mode]);
+			}
+
+			sep = ':';
+			if (resctrl_arch_alloc_capable()) {
+				seq_printf(seq, "%cctrl=%s", sep,
+					   resctrl_kmode_state_str(resctrl_kmode.ctrl));
+				sep = ';';
+			}
+			if (resctrl_arch_mon_capable()) {
+				seq_printf(seq, "%cmon=%s", sep,
+					   resctrl_kmode_state_str(resctrl_kmode.mon));
+				sep = ';';
+			}
+			if (resctrl_arch_mon_capable() &&
+			    resctrl_kmode.mon != KMODE_INHERIT)
+				seq_printf(seq, "%cgroup=%s/%s/", sep, ctrl_grp, mon_grp);
+			else
+				seq_printf(seq, "%cgroup=%s/", sep, ctrl_grp);
+		}
+
+		seq_puts(seq, active ? "]\n" : "\n");
+	}
+
+	info_kn_unlock(of->kn);
+
+	return 0;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1983,6 +2081,13 @@ static struct rftype res_common_files[] = {
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

