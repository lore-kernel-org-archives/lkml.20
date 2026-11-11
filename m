Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437130;
	b=TgnM6HNFZjWoyhi/UknOaOn4xb87U3LIHghQdkkg4Qn0APeWLyOaonDn3JEQN8YLx3lP
	 IeZQjKSIJaECrhqNgBwnMpKLJ9gW9Za1IfGuzbGcODiKwKTp1Ard0ppoePw1kit516XD3
	 qW09t0BOXQa6NIW0qG0XoRQfF950hBQwysBmWXvUnkZoOPKiOHkW4RvrCDR32vQt1yqxk
	 YVJFWQnevgOreVv5K67f1TLziw2wsf0C+uwLYdin2RKXBsp01JjKO+ZrICKaLd0F1+USy
	 Alvik0yJigN6g4JdW5pBNni7pKr3MoviZWR3tXSRkHHXjaBu5lfNmbY+A+rd2eQtQdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437130;
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
	bh=WobJdfRazUpdwmvtmlM7FNPVcwwVO85AmOG9s0ebd1I=;
	b=m+dQfP4G+0/uqTnTJzL4RXrX7pigP1nxFl3C+5Q+9old4sJkrur6BaJiywV6EBj0eZHu
	 IkIStn8Ffoh3gMGkR29K8xTQgSgVHy+l8O/5tqGZgv1A7HDtxGP/boRGZnVepPuR3ba92
	 EXIbO9Lg+uzIzE7SdPm7GLseNnmJGTyYKy2uIrXqXmTAgpY+m1dE3bUh8yTUkBwwphIav
	 +IFEN7ceu1yhbtaKKykPKNcJct6r7wlx7CZYheIm167gMjsmJwraUpwQPL1H//CK9vxZT
	 LXuwtgZKL49N3LHgGZpQQXkgX+5676RTRLmNiC5LEqovuZKVUe+5g+pX/1yavXCN/CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OvfaXUYe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D08606AEC4;
	Wed, 11 Nov 2026 22:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D08606AEC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OvfaXUYe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp5ODlN0p2t44SOvSqeiwSp+nXFnqTdp9s7DxPqGIO9BxdtrzZfWnBxxlaE26/IYqWSYw55j82jypHZZrfv0pDBdlBLGidIONXgvup6dRgt9JoF0Ie4sXSPNHiTvst7sOr1z0dpFMX2VVns1YbFThJWzj7Zu1QacWRPXi78+y9xXEVk9qY3xbRIbgAx1lH9DHcxo7JHQ10npZ2YCqfd2SOfbLDIG4Lsf8y2YwjE42BGO/Ht3uzmjWtmcTaKdPEw0kRV24mmxjvdpKyzosyjwyTsUYIZqd7pMXUitpYyT++tMd8t8hMSyTqDJJKbe1g6isxepEJkRItrvKJcdeTI8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WobJdfRazUpdwmvtmlM7FNPVcwwVO85AmOG9s0ebd1I=;
 b=GHXa5rijgbqWkiwQdWrRn6+MzKqC+jZV2D8yE7/uasVPbjKEjKRIIwKgGp38ai0q4CXvRpU4XYgcFqOWdeQS9rKiL5XuFYpTx7E1FQhksBGMVxx8a8WsVcC5zgdca4UcLDzbOAIAkUFjwoUtODqdNOl+0fTSYKfJt/0cY+Le9ETafWfWtpNVeQ2K6DWjsMfJw9Pz9qluOVVwnySv3vMZC+T8wpxtFrbaVsSjoVg4AjMk/dZvrcpEPbfILEAab9yvUq1jV0fCYvTkVpQ4c2GWkTW0grzSr4M7eEMQLLeoDE1MA8jiSREsU3LS0qRI2Ip/tRIIlJ0/gGqjMb/wGrjtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WobJdfRazUpdwmvtmlM7FNPVcwwVO85AmOG9s0ebd1I=;
 b=OvfaXUYeezF8M024R5hpMU1gm7T3M/Yr17BHO/pzs0BNwW5WTW/Yr7QpzYAbwcr8t9RAkm/dw0dkaA2lH6ukvx+OBg+ZVwFRf4Tv3FPRyCNXufol8u7xhM5k83lw5N0RMX8+Q+aKbX/4k1nrpkhVoRoryqE4UJ98LS2H+CJx/lk=
Received: from SJ0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:a03:3a0::21)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:45:21 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::67) by SJ0PR03CA0256.outlook.office365.com
 (2603:10b6:a03:3a0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 22:45:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:20 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:45:18 -0600
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
Subject: [PATCH v7 05/19] arm,x86,fs/resctrl: Introduce arch hook to program global per-CPU kernel mode
Date: Wed, 11 Nov 2026 16:43:58 -0600
Message-ID: <f8cde88cf957622d50fc6c17c8b4c1c3cff50af5.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: f0430250-bfe9-4223-2dd8-08df40457758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|260925021311599003|260925022911599003|260925021911599003|10067099003|11063799006|56012099006|261022075727099003|261026121527099003|261026140227099003|261022105027099003|261102123227099003|261028144727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	pl5XmXQMUXUEGkwNYDSug/j7OGXC4WcyC/TyugSNnUGGBs3dyXmC4x+Y8KiOHzxNfAsqW1HLgzWqljz00wpCY7OnkX0/lp23d7zLVeb76lnyxkWG97mQPccRrH9eFS+e94Mr0pIR/+zBm7VqFQB/BNYsDnquU4JJ9k3ceYdV6+cA+o0H/W31kcBttXDA0jolgbesPcc90nXm4TtE7V/e4LFbY0kcjpyPTQa5wN1L5pWxrdnSl22/s6+84PplvvnDlxw3gQj3HvyXzjWgUZBZMF8aQ4b/Afi8IK3b5xv0nvD/SO8/H+vF8+PLuU8Boeaw2VCNr6hjA38rAcVVqEu5aDAwHw4CQxKKQYG+rRDg9x+OTtbryeESvRztt+AONiOIbATgVJHiSUHhpZquKTfWjV43kDx9PtIBJnXEghCfIeKiYs6HytFbcintTw7AAIW3WShDgEnESlLzas9wLkGKlM7/IiKBpd11HcHspcWHmv5TzL1vd7r6fEH8OVWKjdpOtFVBu+pafLiM4dXNymObJG+3gh/Oq30efh9f4NdCd6BMrNCX2tdTciZm9hTtcSERezzz89BibW5Giwnk2bcbsLzqb5Jfi71BCIltkgsNe0JsuUQ2OQyVmCjGNoJw0eP9+/Pa6/l6wh2dBGdcfPAnfpVXuTb9+CaA2ZARfGoLZE0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hZkC2zYGFwMTufsfmSM6ehdSIZrMhOvCXtoz7mKSZ9Ct5lceEGzG0387BqksIltIuy6wOUNwxdYQxCLgw/1348ifi/OPPjspvETGT3E0ilX7imAZipXbjugM3puXfMHvgON5oqlp6wexgSOjV0MvDWAIjkhuEGw3goZJRIWlN/Okk/qrXWmaOWijQaPEIKYej3Ol/5DBuv1CXYaln3y3DisJt+ud5NrXJ8BVvifKRnUhBzG0fKQvTx2+Occ7x9aIwXL3lEBspPTDZWBvwvGIJQqCmqaMzA10nRCFhJb3Wk//kQMdoUM9mawpDcKyrWmwfMrscm/O9ta+EfAbzeAPye4GdBEmTowgKmkt+TgOQ2F8+u+hnYfAPQAQPTn9BEuLTNJ0uLkRYvbYgenX2QBlhgVOlLK1DnkixE/nwyWvgr3a4FYeIx+yIFxXFsyGQEW1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:20.7824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0430250-bfe9-4223-2dd8-08df40457758
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586

RESCTRL_GLOBAL_ENABLE_PER_CPU enables a CPU to use a different CLOSID
and/or RMID association when executing in kernel mode than those used in
user mode. On x86, this mode corresponds to PLZA (Privilege Level Zero
Association).

PLZA is programmed per-CPU through MSR_IA32_PQR_PLZA_ASSOC, which contains
the kernel mode CLOSID and RMID, an enable bit for each, and a bit that
enables PLZA on the CPU. All fields except the PLZA enable bit must be
programmed identically on every CPU in a domain.

The mode is enabled independently on each CPU, so the filesystem must
program hardware when the mode is activated, when CPUs are added or
removed, and when it is deactivated. CLOSID and RMID can be programmed
independently, so the architecture callback provides separate enable
options for each.

Add resctrl_arch_configure_kmode_global() with an x86 PLZA implementation
and an empty MPAM stub for ARM systems that do not support this mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated the changelog with consistant terms.
    Update changelog based on comments from Reinette with minor changes.

v6: Rename to resctrl_arch_configure_kmode_global(). Rewrite changelog
    for RESCTRL_GLOBAL_ENABLE_PER_CPU only (not a bugfix, not a code
    restatement). Add arm to the subject. Document parameters first;
    closid/rmid are always programmed. Split fs/arch contract from
    call scenarios and name the mode explicitly.

v5: Fix kernel-doc for resctrl_arch_configure_kmode(), wire assign_ctrl
    through to PLZA closid_en, and update the changelog.
    Add calling context in API doc.

v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
    as discussed in below.
    https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
    Reintroduce independent monitoring assignment via assign_mon after removing
    the task-based PLZA approach in v3.
    Changed cpumask type to "const struct cpumask *cpu_mask".
    Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
    is called from FS layer. Thanks to Qinyun.
    Re-wrote the changelog to be generic.
    Updated code comments.
v3: Removed task based PLZA implementation so related changes are removed.
    Per-task RMID handling is replaced by group type selection in the fs layer.
    Updated the change log with details.
    Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
    It is FS which decided which mode to apply.
v2: Updated the commit message to include the sequence of steps to enable PLZA.
    Added mode code comments for clarity.
    Added kmode to function names to be generic.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 38 +++++++++++++++++++++++
 drivers/resctrl/mpam_resctrl.c            |  7 +++++
 include/linux/resctrl.h                   | 28 +++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 62044489b052..79b6fdcbc553 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -137,3 +137,41 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 
 	return 0;
 }
+
+static void resctrl_kmode_set_one_amd(void *arg)
+{
+	union msr_pqr_plza_assoc *plza = arg;
+
+	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
+}
+
+/*
+ * resctrl_arch_configure_kmode_global - Program Privilege Level Zero
+ *					 Association (PLZA).
+ * @cpu_mask:	CPUs whose MSR_IA32_PQR_PLZA_ASSOC should be updated.
+ * @closid:	CLOSID programmed into MSR_IA32_PQR_PLZA_ASSOC. Always
+ *		written; required even when @assign_ctrl is false.
+ * @assign_ctrl: Whether PLZA should program the kernel mode CLOSID.
+ * @rmid:	RMID programmed into MSR_IA32_PQR_PLZA_ASSOC. Always
+ *		written; required even when @assign_mon is false.
+ * @assign_mon:	Whether PLZA should program the kernel mode RMID.
+ * @enable:	Whether PLZA should program the kernel mode.
+ *
+ * Program PLZA on @cpu_mask for %RESCTRL_GLOBAL_ENABLE_PER_CPU. See
+ * union msr_pqr_plza_assoc for the hardware field meanings.
+ */
+void resctrl_arch_configure_kmode_global(const struct cpumask *cpu_mask,
+					 u32 closid, bool assign_ctrl,
+					 u32 rmid, bool assign_mon,
+					 bool enable)
+{
+	union msr_pqr_plza_assoc plza = { 0 };
+
+	plza.split.rmid = rmid;
+	plza.split.rmid_en = assign_mon;
+	plza.split.closid = closid;
+	plza.split.closid_en = assign_ctrl;
+	plza.split.plza_en = enable;
+
+	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
+}
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..548bfb336be5 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -139,6 +139,13 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
 	return false;
 }
 
+void resctrl_arch_configure_kmode_global(const struct cpumask *cpu_mask,
+					 u32 closid, bool assign_ctrl,
+					 u32 rmid, bool assign_mon,
+					 bool enable)
+{
+}
+
 void resctrl_arch_pre_mount(void)
 {
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 6f3e57ec4aa3..e43415ae6e0e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -741,6 +741,34 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_arch_configure_kmode_global() - Program RESCTRL_GLOBAL_ENABLE_PER_CPU
+ *
+ * @cpu_mask:	Online CPUs on which to update the CLOSID and/or RMID.
+ * @closid:	CLOSID of the resource group backing %RESCTRL_GLOBAL_ENABLE_PER_CPU
+ *		mode. Always provided, even when @assign_ctrl is false.
+ * @assign_ctrl: true to update the @closid for kernel mode; false to inherit the
+ *		CLOSID from the user task.
+ * @rmid:	RMID of the resource group backing %RESCTRL_GLOBAL_ENABLE_PER_CPU
+ *		mode. Always provided, even when @assign_mon is false.
+ * @assign_mon:	true to update the @rmid for kernel mode; false to inherit the
+ *		RMID from the user task.
+ * @enable:	true to enable %RESCTRL_GLOBAL_ENABLE_PER_CPU on CPUs in @cpu_mask;
+ *		false to disable @RESCTRL_GLOBAL_ENABLE_PER_CPU and reset the
+ *		kernel mode to %RESCTRL_INHERIT_USER.
+ *
+ * The callback programs %RESCTRL_GLOBAL_ENABLE_PER_CPU. A configuration starts
+ * when %RESCTRL_GLOBAL_ENABLE_PER_CPU is activated and ends when the mode is
+ * deactivated or userspace changes the backing resource group, @assign_ctrl, or
+ * @assign_mon. Each call for a given configuration uses the same @closid,
+ * @assign_ctrl, @rmid, and @assign_mon; only @cpu_mask and @enable differ.
+ * Before a configuration ends, it is disabled on every CPU where it is enabled.
+ */
+void resctrl_arch_configure_kmode_global(const struct cpumask *cpu_mask,
+					 u32 closid, bool assign_ctrl,
+					 u32 rmid, bool assign_mon,
+					 bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

