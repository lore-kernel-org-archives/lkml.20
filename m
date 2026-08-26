Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7D3A6EEE;
	Wed, 26 Aug 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772802; cv=fail; b=HdK3Ows+XnW6mMq7GsLAb6YnFGddOdJnczWANop2Yj589W6fR4RniGIeQ9HrEhe40ZXjiF61UzmdDLZoI6wPLf8zK7vHoHmChYhYDegQ//u+Y/vqhXTzl2gQ6v6ZAF+vm1LO+KHvxCnkOZefseirXxJbsS1cQ+C1FNzFrJWBpHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772802; c=relaxed/simple;
	bh=fpiIHe7zZehNX4QHJT1z77ld1ozWH5h+X/F4wEIP/X0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpaDDAnbCJr4ngHT3O7R+wwTTNV66mZLURi7R7htozvdnqmcS6ucBmF+we5k6yXmLs8TyGE38Ca7qD8xm0A5VsexGKekvOa6xAcuF7JK1MitJYmoBNpbstON4hNC9xrAIEDZluAiW/Lr69QrSvG0NrICiaPULK/2T4eceMXVL3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HlLQ82Bv; arc=fail smtp.client-ip=52.101.43.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HlLQ82Bv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9epO2oNpfmC786qtJJOggzeP+i0S/YzEmz9lyhVXi25GaZqxWGmPiWeNQJCf+rMQ1V6ujqDuWCxHoxssGUfJSA6D0Wd1gLUzHssTmvCy2Le05lGEcbtgKW+Ff6pTwpZNxjEZZzFfsuhaobb/QlwkwMDZ00T8onBeeBXvFQ9xa/+dIaYDLtBNebqBR8ZuZx2Xuo1sAjjdLhstNI10FULzDxCETZ0HooKRXxeM/2xfWx1Lb6jSKCCjlKJdGRG8Diz5TEwF7ZGzMKFuwN30TjWbpk/3ok2GmvELA5Kln9N4dY7R9nABHFVtZvENxJAG1qcmkdGXBCEk/ofK6OHbGHmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkZu3lFspBu6GtUCliFWNli+zcMG2WnYpHtunTbvQ4Q=;
 b=HOPrmJOZ0E73azpLqceueCsV1ggAtrnUfOLLOC7zs95PU+GK9ttEjs2eyilXr0H+hwFClucZnO047FBRONjN0GHUYKJoEIGrvJBTBivppDRJ+RnF1c9de7/WlOXxhV6oG4BRTd+Mjklu0hbZbHqTsxrEAh0+8iKIMN7g3lP8Qn0tB9ayI/CS8/HZ9ZUwaXMWeIWETORfBrQX8H76PLmqYsMf7vkHBBIgrV/t/gQUcoqZLeXF9vmoUYYHR1CXXGkVP5OuqvlxXF83OUbzcRtWpYHgAHJGj1NA999ik460A7gdXEhU5Sa34h/2q6ru6ujVvIGAb0gpMb/CjXqUERoOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkZu3lFspBu6GtUCliFWNli+zcMG2WnYpHtunTbvQ4Q=;
 b=HlLQ82BvT6BmhyIHxqWlfCk1tmBlcimlp5cFiee+ZyDWZOFrASYOrXOC41WB1tj3w4n8WlyzM6D/TuCvSeakuFELLAoS1fI2IjUStjBpai9qldFwMjbD5PH5TXv1sUNPBOqLXZaj64+eGWFOBQfLKIFalBom1NQmJD203A7aCYU=
Received: from MW4PR04CA0269.namprd04.prod.outlook.com (2603:10b6:303:88::34)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 26 Aug
 2026 19:33:07 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::63) by MW4PR04CA0269.outlook.office365.com
 (2603:10b6:303:88::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 19:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:33:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:33:05 -0500
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
Subject: [PATCH v5 02/16] x86/resctrl: Add PLZA support to command-line options
Date: Wed, 26 Aug 2026 14:32:16 -0500
Message-ID: <e669cb9aa6a2a4f4c1720d627278bb287cb20479.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e6ffb9-d61b-4b20-2c20-08df03a8db1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|7416014|376014|10067099003|56012099006|22082099003|11063799006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	kQJOU5P15ga4mS7wkcAH+eEJS3+e3e+7n/tJCMr0kRgWWuch5UQ3qLA+lucjJaLOiDqYEyOKunPefDyAUQYHECI+NYBtxZH4Wg+8L1CUi+MUkz3Bad28rNGwZ/TUpqbzlfVAjfXNLpyu8JV+JtD5blz+JXUxNvMQT1iR0ROpNJv1iYSPvwiXc0nlkpKMWJf6kigWlIkUwwB5i5ZQdKUBRdtQ7p2VuxtFC12yU/NYW61MwRuapYcjDbXUO2ebUBGfnvecmQD7rQkok2yxMNYBnW2JCKAgRDr43+QE91vk2cq925r//FM+0FV+scz1TQlypdYYtjin/vmYCdz+5I3EA/0r/u02hwDC7dEClgl43geV4nAB2ShtA/17qqL3uudtgieVBjZyzWgbOFuCcUzVJkelleifJREIueKhi8sC1B6F81XcUfxbs+7REXt1xFGXrn4ldSfyrtvi170BKvUjCW9QtBigbyukZDx/HT4n6PugaGvoVfkQd/PKvitCqXLV/vrF57w1gSILL7EjluJaSCiCcuwP6pDLTDQRtkMki4XkNVL+FbRabUnYU4uoaKLTayWfHjDMm6hDIvpdE2HHS7mYs505qqsX/4z61utvqZ5SA2KM527VE9ConeQ6JnRPDuOYL/tVyaZichFaos4VaK6mRUb617/QgJEirp3lxclKrPB5VfZgyE1IlIgPcMFJdCIycHe/xrelNotODoBUmA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(7416014)(376014)(10067099003)(56012099006)(22082099003)(11063799006)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DdVeqCUhDU9Sn90JXBM1l5s1JFfZwLV5LpfyN2Lh3WGWpdXXbtXMh9+P+au4E5m6fat0htze3kDDyOV5mNQ5HxQq9JuD9pNs6NKPfyRN5SqP33cxJ5UKoXhLD2ZCfRM2VlyGjdTEeECV/f75SGMNGqgAFfulObqVeMfR93QMt2a6FHCkl05GUe4JQjNcCQzpMhrmmhRQhODgpOBSGB2Ndx55qcOQujhq0glTqYI+sM7GrzVtMQMUN4kiwTmulbD60gPfb4z5qbwTcf5kG5FSM9aKJ6KNkSRM5ZfK6swdOW+iq+PsH2U8XBg8+sn0xcka/EEpcp4hO7qWRBr69OEDy+q7KWYEbA3JxFolAg9wR9ghl5WALn0O8abMGg4jKjKb4efsa6us6tDCkm2+ubVIIk244T/idIPoMkFeuYwLUVcnWbex0aFK9mnXB2gNelkO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:33:07.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e6ffb9-d61b-4b20-2c20-08df03a8db1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

Add a kernel command-line parameter to enable or disable the exposure of
the PLZA (Privilege Level Zero Association) feature to resctrl.

This allows administrators to control PLZA visibility at boot time via the
rdt= option (e.g. rdt=plza or rdt=!plza).

Resctrl exposes PLZA by default without requiring any explicit rdt= option
if supported. The rdt=!plza parameter can be used to disable PLZA exposure
to resctrl, while rdt=plza explicitly enables it.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Updated the changelog to mention about rdt= options.

v4: Split the patch 1 from v3 into 2 patches.
    This patch contains changes for resctrl subsystem.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 66c1c879a0b2..9772ce838966 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6455,7 +6455,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..f3e941404967 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
 BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
+PLZA (Privilege Level Zero Association)				""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..4ca8bedeb995 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -803,6 +803,7 @@ enum {
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
+	RDT_FLAG_PLZA,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -830,6 +831,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.43.0

