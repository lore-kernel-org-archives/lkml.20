Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24F63B442B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721564; cv=fail; b=i+0i9KVAMllpUuZaYuJF50thcYi0NnHyRE3uADryJ1hH+pUhIrp5TI+tU6tWe5VtuKaJLUWNG0f/hqNafDSFZqdyi1N36gEjL3OPKosxsIl5I18R2iXXqjWZ22GFIvZncyajU9/okRgeEJuIGoY5UIQ9sV2lBMK7ujN1KUc9Wtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721564; c=relaxed/simple;
	bh=pW7VSDONcrTrcR4QHVDy0FI7dx5wZdODCbmiTggFUz4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FX/Wa52EX+VOd8o0UISoVBm+AKjPlmIdgSmfkJe3EOuZFqQUb2LjgE6ideou8ios0B6l9sxZO+rx2IknkV4SrD7IxBividj5+mOh0NLJFlww9YZTC40JHmaakPev1FxbPoZur8MnuifU6qViCmP6K20RbpoWh1A/65aS5QcwzwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N9MMVDfr; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N9MMVDfr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL1K7QDnKreyLD7nGn76z53x4NBeCqqeznj2QwO5pb2WXt1l6xxlc49EwY8YrAMgOpkkDf/PvIAfwFrW/LD2Xh2/z0l2nqor2GBllh1vfENDfaBpmD0MbXwQ4L+Ys7sn7TMpkPJ+H2Ju6jaswSKZITa2mYapE8zjDGC8aV5EvCSWrKbLwx40XG628Ri/xKbJUMiOjQTgLxQ7FXdD1p5DzMKQBDIg8RqDKb2dfqupO1DX0glQ5UbxULCkHb/V7vOu+TshQZPHb+if7MMNpJovZKp2xUOWC40UCJ5avBtUBnvm5sNwaW/yL0ZemTSzds1ErBz4735is6rwpncf34IudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYQ0Md6XHwKoPipLCIwuE6ep7rMUzcEVGv9y3ISv/9k=;
 b=h5vhnNCLvp+ELLLGfJ4CuXfPaDbYa+dxgVZGhMGOqv+TOvH/VyNqNvK/ti1UweQqcZZxu2TKLKuHrQatU7a9MEmfS4wHtFLwnwfj/LboGs1pTuDByrtiTW9dZpXbu3CKlgeQSmEdLaKbZehC5/7ynP+VfNCdQgVfYEYrCGr1WVAhkSz6wXT1OolEo5+kn5XUfq1iKDjGyBrBN6xDRlaJwTdcsQGLV/WLDpd/UcWQWaR5Ctu+1F79FzqVigiwsWg8LV+INQVqXrXaGZViC7wthlK7dMglFEZUhlsOEIF3vB5LaqdW7YWnNlHzyjM25WMGpGBz2yxg3zHYugBjMb3Huw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYQ0Md6XHwKoPipLCIwuE6ep7rMUzcEVGv9y3ISv/9k=;
 b=N9MMVDfr04vckdMVBd8CobjuyBCCZ1/6vnm0Je32SV9lXMntQAURsP11mcbi8Vdv07aM/cJ6xBxkRimWEnWesBcuJftry1/C4/DCPNJvTpaSWmENCrmwOFyqd09iVfjYgkSJ5yswKifFRZoGfgbAk9Li0QGe8b2AXo33FO9YUqU=
Received: from MW4PR04CA0382.namprd04.prod.outlook.com (2603:10b6:303:81::27)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 22:39:16 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:303:81:cafe::18) by MW4PR04CA0382.outlook.office365.com
 (2603:10b6:303:81::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 22:39:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Tue, 29 Sep 2026 22:39:15 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 17:39:13 -0500
From: Babu Moger <babu.moger@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <reinette.chatre@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <dapeng1.mi@linux.intel.com>,
	<peterz@infradead.org>, <thomas.lendacky@amd.com>,
	<chang.seok.bae@intel.com>, <jmattson@google.com>, <kim.phillips@amd.com>,
	<prathyushi.nangia@amd.com>, <acme@redhat.com>, <nik.borisov@suse.com>,
	<namhyung@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] x86/resctrl: Rename AMD resctrl MSR defines to use MSR_AMD_ prefix
Date: Tue, 29 Sep 2026 17:39:03 -0500
Message-ID: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 195b0b5b-8a43-4f61-e5cc-08df1e7a7de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|7416014|36860700016|13003099007|260925021911599003|260925022911599003|6133799003|10067099003|11063799006|260925021311599003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ld8Sms74GyAhTLJNv6U85JUblDIPK2H39UgEwVkNXYb3CbH3ifloGI/YycOISy6sbpMdoe72X7WPq6CLC5hnsXCNpbl9Jh/xdWvGFd5vhSuGP6dkAwjW7EXvVW2jskykx2WOmN9iKxaFTAOfMvOso88oDv2wLED0o2Ct94fhjdoIu8Rvfo88ndkKl24GeYIji2GEB80iN/YgFNFBZQsPTizgnpioCpZywf/AJlQjmj0Fwx9lKqYXiwhnN+KAowQ3LoqFEED3R+ZD+aZNrX8rx0yK6SPB1eV9zdBj5guL/74ELR7CGaylvO0C7kB1WbksV2IFf7ovulL9mA0kpnvt/T9Vj0yARku8bV1cnkUYY0PNXAfU7ZiLmKlvX5sEp2uZ8oaQMIXOyhEwVgS0l8GcZSvxHCoKaON8jee44y4ktk7+hhLglO/7SDGAXb6ph0NURfOEv1CORwNzlAyepXaDw8iEhIdJZ619bTgekzVMEWKKDxhNw3lRsnX4AsZ8SxTcR8fzNL4wCgauzGoWDBq1GeiCFv/p6FUiosqjW3C7Cb8Xu9KlSOxqwdm5D9rjDp2wjIiWkodSew4oLzA+rkcOGA5viR2yiqAPVC+kMhTjTs4zdzO+DvigNn5oI0a4jmaI5iwztUAVxgRh1HzgZ9lpTZMe88R7YrThxQalyyzFS8M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(7416014)(36860700016)(13003099007)(260925021911599003)(260925022911599003)(6133799003)(10067099003)(11063799006)(260925021311599003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r7IrJEmLGOfuC6N2BT5WYKnOXvWfvj+yfaF16NAk2Df9jP+ifINPoUAdNTE4EAiRFsKOnDcsbzYDJbjpnVPQL4r0PzmB7XvSKALUSGo88XB3ZB2l4fQ2pweikxUbR1yb/Sen9yWbYANbgjTgItWxsx5fcRYG9KO5ZTJ2p6XHPjAsOZDeidBnqFrclr3uu30e0bMdplDBW27seBsmks+RKErYVGhpck1aS4nC4vPuUFMrFVjLKpLCDerhGNJ9wf99zIK+wuFX2WzLByMNz2FY64n8osKOrrHIBHbp2LMdZOjWvBhfKEVueFmfrDRspxO+hrFm40b+CPiYel0+3L4SGqF8sbBsnhz7jElHNPrUW06v3r9zUzbIMJIrB1LuImU9m0Jw7838ewJj+DxMFaZ96a7SVJX3xwRff659nml5J6tWMC8yKdd7XYRsu8Q7EQe+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 22:39:15.6504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 195b0b5b-8a43-4f61-e5cc-08df1e7a7de9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776

resctrl MSRs in the AMD address range (0xc0000xxx) are defined with an
MSR_IA32_ prefix even though they are AMD-specific and unrelated to Intel's
IA32 resctrl MSRs. The MSR_IA32_ prefix is misleading when reading or
grepping the codebase alongside the Intel MSR_IA32_* resctrl definitions
in msr-index.h.

Rename the AMD resctrl MSR definitions, update all call sites, and keep
the tools copy of msr-index.h in sync:

  MSR_IA32_MBA_BW_BASE      -> MSR_AMD_MBA_BW_BASE
  MSR_IA32_SMBA_BW_BASE     -> MSR_AMD_SMBA_BW_BASE
  MSR_IA32_L3_QOS_ABMC_CFG  -> MSR_AMD_L3_QOS_ABMC_CFG
  MSR_IA32_L3_QOS_EXT_CFG   -> MSR_AMD_L3_QOS_EXT_CFG
  MSR_IA32_EVT_CFG_BASE     -> MSR_AMD_EVT_CFG_BASE

No functional changes.

Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Fixed few redundant 'MSR' texts.

v1: https://lore.kernel.org/lkml/96992e30d6c02ebb7bdb58f2d8060bfd61274649.1784739398.git.babu.moger@amd.com/
---
 arch/x86/include/asm/msr-index.h          | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
 arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
 arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
 fs/resctrl/rdtgroup.c                     |  4 ++--
 tools/arch/x86/include/asm/msr-index.h    | 10 +++++-----
 8 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 82ca6356dc62..7998fd116aa8 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1302,11 +1302,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD_MBA_BW_BASE		0xc0000200
+#define MSR_AMD_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
+#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
+#define MSR_AMD_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..a7c2210859f8 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1055,10 +1055,10 @@ static __init void rdt_init_res_defs_amd(void)
 			r->cache.arch_has_per_cpu_cfg = true;
 			r->cache.min_cbm_bits = 0;
 		} else if (r->rid == RDT_RESOURCE_MBA) {
-			hw_res->msr_base = MSR_IA32_MBA_BW_BASE;
+			hw_res->msr_base = MSR_AMD_MBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
 		} else if (r->rid == RDT_RESOURCE_SMBA) {
-			hw_res->msr_base = MSR_IA32_SMBA_BW_BASE;
+			hw_res->msr_base = MSR_AMD_SMBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 62044489b052..25a5f0c8dc56 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -108,9 +108,9 @@ static void resctrl_sdciae_set_one_amd(void *arg)
 	bool *enable = arg;
 
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
 }
 
 static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
@@ -120,7 +120,7 @@ static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
 	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
 
-	/* Update MSR_IA32_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
+	/* Update MSR_AMD_L3_QOS_EXT_CFG on all the CPUs in all domains */
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held())
 		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
 }
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..18d9558e944a 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -40,7 +40,7 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
 
-/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+/* Setting bit 0 in MSR_AMD_L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
 /*
@@ -49,7 +49,7 @@ struct arch_mbm_state {
 #define ABMC_EXTENDED_EVT_ID		BIT(31)
 #define ABMC_EVT_ID			BIT(0)
 
-/* Setting bit 1 in MSR_IA32_L3_QOS_EXT_CFG enables the SDCIAE feature. */
+/* Setting bit 1 in MSR_AMD_L3_QOS_EXT_CFG enables the SDCIAE feature. */
 #define SDCIAE_ENABLE_BIT		1
 
 /**
@@ -187,7 +187,7 @@ union cpuid_0x10_x_edx {
 };
 
 /*
- * ABMC counters are configured by writing to MSR_IA32_L3_QOS_ABMC_CFG.
+ * ABMC counters are configured by writing to MSR_AMD_L3_QOS_ABMC_CFG.
  *
  * @bw_type		: Event configuration that represents the memory
  *			  transactions being tracked by the @cntr_id.
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..c6036b09a67f 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -498,13 +498,13 @@ static void resctrl_abmc_set_one_amd(void *arg)
 	bool *enable = arg;
 
 	if (*enable)
-		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 	else
-		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 }
 
 /*
- * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
+ * ABMC enable/disable requires update of MSR_AMD_L3_QOS_EXT_CFG on all the CPUs
  * associated with all monitor domains.
  */
 static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
@@ -542,7 +542,7 @@ static void resctrl_abmc_config_one_amd(void *info)
 {
 	union l3_qos_abmc_cfg *abmc_cfg = info;
 
-	wrmsrq(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
+	wrmsrq(MSR_AMD_L3_QOS_ABMC_CFG, abmc_cfg->full);
 }
 
 /*
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5ffa39fa86fa..6590ebf6b29d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -96,7 +96,7 @@ void resctrl_arch_mon_event_config_read(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	rdmsrq(MSR_IA32_EVT_CFG_BASE + index, msrval);
+	rdmsrq(MSR_AMD_EVT_CFG_BASE + index, msrval);
 
 	/* Report only the valid event configuration bits */
 	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
@@ -112,7 +112,7 @@ void resctrl_arch_mon_event_config_write(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
+	wrmsrq(MSR_AMD_EVT_CFG_BASE + index, config_info->mon_config);
 }
 
 static void l3_qos_cfg_update(void *arg)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 68be9b903ac6..552ec06886f6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1794,8 +1794,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	mon_info.mon_config = val;
 
 	/*
-	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
-	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
+	 * Update MSR_AMD_EVT_CFG_BASE on one of the CPUs in the
+	 * domain. The MSRs offset from MSR_AMD_EVT_CFG_BASE
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index 18c4be75e927..b68ad3088779 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -1290,11 +1290,11 @@
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
 /* - AMD: */
-#define MSR_IA32_MBA_BW_BASE		0xc0000200
-#define MSR_IA32_SMBA_BW_BASE		0xc0000280
-#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
-#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
-#define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_AMD_MBA_BW_BASE		0xc0000200
+#define MSR_AMD_SMBA_BW_BASE		0xc0000280
+#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
+#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
+#define MSR_AMD_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
-- 
2.43.0

