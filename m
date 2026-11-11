Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437195;
	b=S2Dagx9W4kf0GRKowr/ZojUSblLpAOiGn9rRzj189iB+dWSWUQD7X3Flk0zSbhrC3J9E
	 sK+e0uYsc+EnqhpsYwPazhemXBE9/PuK0qoiIKh9YCqirdIBQW0RNxdCH9r1WkD1/HTjE
	 WkKFO2lXE+sW+Lp7iqbo67STrjmSC3H0+RpodeGMuGuKTMp0HcWOI1tB2evb5dlKH1sc6
	 gfEyNBezffgXL21rgKu+keJEMUy8Fg8Ly8fxU1oHQryGETBqPF8N+rejatk5w5SMEAU62
	 C7h5p9nQunbu7J1hGSWlXZqCN9yzehphS7Cz/GoGXDzEfMix0EaDrkPlGoTlWehV+3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437195;
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
	bh=GmXPCelTq6ueAkM1sFyrEyraoBa28nCsHUayLmEXAHU=;
	b=ir3CG0wKiIAZHwmvETbDLVRDGcuHlLvkb6Ghwqds/YEDihUDTIdmOSUEHXIn/Qc6w97z
	 bh/ffikLOqw0thuDUuVA81ihzITIQbduBgW7jNetgoQoU13H/ryW5uuel2Mbul0iui2BO
	 iCf732y16END6kbLKhVg+sMnr+uKxB0QpSSCbQyVvW9ohG2vSyozFS7AiR6hbNKNwFJ7J
	 q3BTF31Bwk0qPProGRxkGeMl7uARMcoGAv6G0clGFqSrYnOSrGDlkLXPNPzQwnJpFivvB
	 JUYihBJMjApo5R0M32GqOCObydWlzjQIpONv5XzEiAZQZjPynVZe5eJN7+3rayqjFxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g3nMQ60L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.35
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9B606AED7;
	Wed, 11 Nov 2026 22:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D9B606AED7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=g3nMQ60L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQzDhJ+YpPRqm5KmSrgXNc0XW5SoR5Fjv/liOEsbKON75hDAZlall6N4y+QRSbIhxIf1MgdVPEMpX0WYvTxfFIgPP1+aBmnWECtuL+jDa5vKMJSXxuSts0MJ1XBaQzYFMUw2fjtxIY9CaAJ8j8tRUWFldEj/Ev4iBriWQUVrUp/fBjLHS90ugOpWBEQvBynXqDyRCe1DgkKkSfrA8hgGSDduNS3r+btFjR6mlMuQFgT2ZeBYAx3RI4BNkBwYQ1Ji+jHS9t9jM8HSWwDn29qobi5oEsJ0JmIR9hYULXNqeHHBHhs51Xp+SaiqCeoDjOp/shM8VnhvSUxRBr5p2AjBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmXPCelTq6ueAkM1sFyrEyraoBa28nCsHUayLmEXAHU=;
 b=UJt3jcedI4IUYVPlr2jHljxDcChFViOHxd76QXoY5sK0I7CpC3ZP9EvEC9lHq+ZPwE7FJNLO0BlU3IHKipMeltvbQNhGEhAdkMaU8n3pTOvqiB/JEpVDVyt7WWi51kR/rRziFXLo0cdCSCe3T/qP41Dk66FlVE89yUrmQvdgM2ouNPddM3pi9s7IejsPCtE6+945Upj1sYUyJ9V5v3d3f+nOn2r2whSuxA+wFEz+kOJ77zP+oNFS1gp3VBFDSJjCKCfJAPReg6gCuxA7LYsy11keVsliVpFh5bHEVsCM1Kef+lHpcvsqWx6RhhZ0ikvyzb+abJLWzs/NMC3pdQ4Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmXPCelTq6ueAkM1sFyrEyraoBa28nCsHUayLmEXAHU=;
 b=g3nMQ60LqaKpXNmHKXReBCyYMSVWvtXea7jm6SIfVzWL8/nuS5Cdmx7oNgZ2wbn56XD791epM2c72znMBfXJ+fMdKMxlNT43PDdfGUULx7SXt4PswoXNYcmpSuGfcAwDsLxP2x8f+GmEy1bIku//EoXrEjRnCIL/zV5eGtWYEbA=
Received: from SJ0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:2c0::10)
 by AT6PR12MB026552.namprd12.prod.outlook.com (2603:10b6:170:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:46:31 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::21) by SJ0PR13CA0005.outlook.office365.com
 (2603:10b6:a03:2c0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:46:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:29 -0600
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
Subject: [PATCH v7 12/19] fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
Date: Wed, 11 Nov 2026 16:44:05 -0600
Message-ID: <918bff3f72298c9f0925831498237b6ee975a71d.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|AT6PR12MB026552:EE_
X-MS-Office365-Filtering-Correlation-Id: ba95bc69-cbdd-4223-ef5d-08df4045a146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261026121527099003|261102123227099003|261021121427099003|11063799006|5023799004|56012099006|10067099003|22082099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0/POKVA7xRdI2z3aAHlYumTLAt6RMh4KE35x1PwZWRLznCWU/qFonmXgtoJ4dRRaxxLZ0G9d4lFAl09pw3FIcEVJvymDC8EiFQ7JLeC3Xvbv2MV9wd06tEpD4ib3kPb/hl1A7XViOSe1QoYFsH7ySUAXOZUMsjJXNNzM/M3RxBWtoF1bCk4pfj1Q9IefJxiFTHRI/9lQXMILxRJcY/4nv9cADvkz0m9NY+Mr6R9qUrhhE+ifCaxgSTSoa+Tpqid2k5OsMrhJul5yMUCWP3jkmJovheZiINAtfqWJf5/MNFGyFetszCKmbsPY7Uh3bzZ/XXprI5psZcj4lzK/oglX+zS8w1NXspUUle0XEgYAS1HiOHSGs4FVvaUyKzOO0IBLHMcjBPUv4z8mQLxbbsa3K8u7NFcIUlTUxjiJVty7m4DE7VGHX1N5pfgr0J56QamvhLMyP2f+FSeJbF5wFbenZxOAuB39ICWEHorZNDTfG812/ITpI/lGKEh/opmwaUXma+7GYgGn4Yknb8mY/LQNBjgxBcWeajY2X+7lqN3KDdlgzfVxB4JRyIobTSsFXBvXojIYAjyvs5B5Bs0XlgJeFFibWwCh7KNMuoMiA7jriRgmrVC0Av6bH8beIaD/P+GJzP7cXDIKMaexeh8OVSfrvO4GYAoIQMtG11Uo1TKe+7s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261026121527099003)(261102123227099003)(261021121427099003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pdq766CTMdQFluX57zDOVeAzEyCgiS+YoDAqDIx227+JIBzSiu8O5Y1reGTmy2uWP6k7A1eddGrJwRH9P/+LqRl4a7A9O2mzlAnKKO6bDsRHI1pNtrlbU/teLuOEkt6vwiF4blnfkFDRx2YYtJUP+8w0i/Rei+XRBJiaLUdnj97a6YA0UQrMZsSCn3aOaDZ/OW5RTVO6XL2BEssqa4EPhXHMdMxqnJ79j5LaaRfNvcVajKXTEh/ow0SRFf/MfE4EMCxRClve6hFCQ/eWUJv0JJ34FXgcSYWtT0DnyoAFiGzVTg2kQ7LFNsHrdiTgmicF5zjTq23DlhR567ETcYv4/Aan0coIUBEg9QiaScDkBs8FtcMUb4WnM08M+/dSjbKHeMELekgD1g6zKuONDLdJ+weIO+9e8AsacU68qb8jgmhxJHNF8cXfMYSnLODzwsW2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:31.1348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba95bc69-cbdd-4223-ef5d-08df4045a146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB026552

The RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode allows CPUs to use different
CLOSID and/or RMID associations when transitioning from user mode to kernel
mode. When active, it is enabled or disabled on a per-CPU basis through a
backing resource group.

Add kmode_cpus and kmode_cpus_list to display the CPUs in a resource group
backing the active kernel mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog updated with consistant terms.
    Code comment update.

v6: Drop rdtgrp::kmode. Rewrite changelog (not a bugfix; association).
    https://lore.kernel.org/lkml/ef8804d5-f20c-49a1-87cf-ab39437a5f0d@intel.com/

v5: Updated the changelog.
    Removed the RDT_MODE_PSEUDO_LOCKED check and added rdtgroup->kmode check.
    Files are created hidden.

v4: Rewrote the change to be generic.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 fs/resctrl/internal.h |  3 +++
 fs/resctrl/rdtgroup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 909511e985a1..a473b408dd9d 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -216,6 +216,8 @@ struct mongroup {
  * @mon:			mongroup related data
  * @mode:			mode of resource group
  * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
+ * @kmode_cpu_mask:		list CPUs in the group when backing the active
+ *				RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode
  * @plr:			pseudo-locked region
  */
 struct rdtgroup {
@@ -229,6 +231,7 @@ struct rdtgroup {
 	struct mongroup			mon;
 	enum rdtgrp_mode		mode;
 	enum resctrl_event_id		mba_mbps_event;
+	struct cpumask			kmode_cpu_mask;
 	struct pseudo_lock_region	*plr;
 };
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9235f094245c..16f68f4317ef 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -390,6 +390,32 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Display CPU mask of the kernel mode backing the resource group.
+ * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
+ * (range list format); the output format is selected accordingly.
+ *
+ * Returns -ENOENT on error.
+ */
+static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
+				    struct seq_file *s, void *v)
+{
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+
+	/* Verify the group is the active kernel mode backing group */
+	if (!rdtgrp || rdtgrp != resctrl_kmode.rdtgrp)
+		ret = -ENOENT;
+	else
+		seq_printf(s, is_cpu_list(of) ? "%*pbl\n" : "%*pb\n",
+			   cpumask_pr_args(&rdtgrp->kmode_cpu_mask));
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -2266,6 +2292,23 @@ static struct rftype res_common_files[] = {
 		.flags		= RFTYPE_FLAGS_CPUS_LIST,
 		.fflags		= RFTYPE_BASE,
 	},
+	{
+		.name		= "kmode_cpus",
+		.mode		= 0444,
+		.hidden		= true,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.fflags		= RFTYPE_BASE,
+	},
+	{
+		.name		= "kmode_cpus_list",
+		.mode		= 0444,
+		.hidden		= true,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.flags		= RFTYPE_FLAGS_CPUS_LIST,
+		.fflags		= RFTYPE_BASE,
+	},
 	{
 		.name		= "tasks",
 		.mode		= 0644,
-- 
2.43.0

