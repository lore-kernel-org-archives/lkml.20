Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87F4B5CB5;
	Thu,  3 Sep 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445296; cv=fail; b=WAtRTN0eqitDEm/wxi6nzKs/qKjnV7GD/TG0O4Ffal3q+KBvGzJjFsZBdzsgblxpOTtLPMtCP7+VO/bKM1iALbT0JXw9Emys9sOvjHnwRaCL5ArBZZRaQvhBigRdqr80FCZNHNYYQbbdM07TecBXTl0/Y7U342PeI9Czj8b46ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445296; c=relaxed/simple;
	bh=JPnwneyRly6EF8t6+pbO7Uw5BibzTwtmdbH6TkdPpfs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjo4vd5didzM2HN0pbvjaRDmcWHM9RVSmW3FkQrIvLAqfgluNof8dsPa2Xc0A5yg1uAb2ZUuDmYoOma+dKxgcTvTjn2UZHz8AR9AZFY+TLWf0w+qhw87X3FBtA4EtC0Wc+7QL8pfBAULvy4QyFNAx10eI6QlkXwEzAaOV/tC5mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E9eFIeDm; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E9eFIeDm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH3z00Hpj0kdvzAq4u/iUQEaUcoZUNPPPpQ525ifkjCWlUMjpeu7w+7zlHbktZCDaWZA5Gqe4/95Zvy+yzTxY3RLGi8tgTdsLnr1e+PgnXij5ohVI900XKnHDCYZNcmnwfB0DubITMfENDHwBHxhnFg30BX2p6K2RFEzr55iXEAhu2Ofw5R2B/ne48o7kwi4GOTRVMkMLkXJcnO2vaL5POarXmmMNkbaxEJHTlDw+44o5ztjOzV+SKqIMVQc0DuoRuGMes+kTVnScf7b9+NB/vYEgXvoZRne7QNbvUHaG1F4nGmRdLaP+mtCKk9laSHsT1g2V0/m8vFXJLUnyUHH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMyMS1kqp35WcU4ZBdBgMKd65wuFVg2XO4HQnWiEUHk=;
 b=Q95YRFp5659FxfVA5a3t+EA200p+Z5Y9fnhK3U9NYhqDrKjUc4RtGY65w34ZJeJHhzYmVYAXXYIfxzCw+Q1OkxqFl6PEAFJkzSeiLQ7nuzI1E6iELZE+8gJVlS8szOMFjWb2DsfLaXxZms2Nibn3eS2scKrK8dGIgSthMKfYO5ll4a4GjNSMoU4XUp57rXJi3oJgYhg6Iow8xuDCPT54jROCyAcoh39zPgOXeSAIAF0V8MVfLYCuIo3H52YMPDRoqG8hiuWNABHHCAst/GE9f50jRU/t0vO8b+Gy//tR8F09raIM3xb5f2U9+ajl1aHVMJNymDKNC0sae0Dq8GnbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMyMS1kqp35WcU4ZBdBgMKd65wuFVg2XO4HQnWiEUHk=;
 b=E9eFIeDmma8x72gO3VDw85kJPZwCasK/z3IPl0Sp1f7chbX6Cj2r1IDWVdzif2FpnTrpOlghRguvT2UM9HVER6Rmz/bWj6zxHGx6UFK0GscllQSaj1r3XFwCssvl0GhmmKV6Imz/PkiEonmTPA39Dh/z5AHmC6JdsqmPi58I48I=
Received: from BN9PR03CA0665.namprd03.prod.outlook.com (2603:10b6:408:10e::10)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:21:12 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:10e:cafe::b) by BN9PR03CA0665.outlook.office365.com
 (2603:10b6:408:10e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 14:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 14:21:07 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 09:21:00 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH 3/3] x86/mce: Increase MAX_NR_BANKS to 255
Date: Thu, 3 Sep 2026 09:20:49 -0500
Message-ID: <20260903142049.4126599-4-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903142049.4126599-1-yazen.ghannam@amd.com>
References: <20260903142049.4126599-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bec97f4-4faf-498d-abf6-08df09c69842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ACfEDAGmOYSWLTs06KFN/xk6GiTtImvkVfiHoNqxV+A2vSxJhgHD9ku/6aSQ/IXcZgpyhFl3b5lJdDWN9f0SatU9HjspoghM9kMOWSDEUplKoIOJI/OmFZtcJLsoRWnOSIGn73pInDgJIykGWYczz0pUUKTazF7bOv5WYOg4Uf0TinQGPWQTk0VHOWAhwFCrMYMKFKn/gHox10eY9oLUz/2vKa/evuOWKFBAsK+zdTevTUeex7nz3Ho67YghTBKfCds2RnsLM9rzQ7icQsNXMU+MAfYDPpk6DnhfMe/TNyOnf9dbhcw/RLN8q3wg+YSChH968GBNKvue1TpAvCrMKC6weAKz9VWttbXLvs6Jush0tmspDLrpjSCPS11gve6H9C7NChakpKpXNV9eA0f9w1N/uBDQSkZyxL+nAIaf//ETkk40pSa0bZUit3stISqBU2CGypcZvMWH2Ece2LHThQA7oBbF5G9IJogGIjNYp82LzOAPoAu2ZufprqdbXbrh9rw1pkXMyhQh5wGWOKNuLLTBCXWHJyNTs22p3XUsbILQ+w+z/IRLI+qQT5Bu0SGJVwAfgIOv8O9ZngOSMi2TBCM1S4DwwZdW6M0L2fyrkBDIxSWMYJC8UtegIWCyzIXaEA/BWJSXgnjqTITKBj7FE4yUg8bBhBANG8i89NC5/S4ufinADYA0A7D5N9gDQAErThTPpIJOvXCpgcOiuLPD/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuxLaJe9/LdantCHc+DfJhkcl6wtJR8YRyHW7M8zVWweUosY+pivLKKkKST5ZxCASQozc5wAPr2Er0SVbngyeGtjAlYAU2GTf7on8kbMUI3TQudPeU6BDSPswO1DDcokLDqXD8QJkcdG4vDLkTMUE3AO2uWfW9/uBbjYxo4/QxJY0DeNgR2MXIFfWoKffcaM0/StHUba2eoY02FG6ZG6hS5CrT1Ezd9xTlPIlnqXvYAVkCGy20SidAJ/Ll2FASVFZce8djHo6NhZ/ikK/+txnqx+0/r9RCysX2wX48O0KqYwRe72pgqqmPWs+c9Y79WGHrAxAFbFOlbpn6XMbgbwhDbAdJ9i2DAbwn8c9loPs+OwC1Po8aHocq2PkHQsEHFowaDpjWtOoa6SRY4EH0x5xPMSYiEjQWqXChe/kJvljZNf9VO4vqsfBuHrzAlug7WN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:21:07.2155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec97f4-4faf-498d-abf6-08df09c69842
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

Machine Check Architecture (MCA) allows up to 255 MCA banks per CPU
thread. This is based on the size of the "Count" field of the MCG_CAP
registers. The "Count" field is 8 bits and holds the number of MCA banks
per CPU thread. So the value range is 0-255.

Change the MAX_NR_BANKS value to match the architectural definition.

Drop the clamps in __mcheck_cpu_cap_init() and cmci_supported().
MCG_CAP[Count] can no longer exceed MAX_NR_BANKS, so neither is
reachable.

MAX_NR_BANKS sizes a number of arrays and bitmaps. Growing it by 191
banks costs the following, measured with size -A on the MCA objects
built from x86_64 defconfig.

Global bitmaps:
- core.c / mce_banks_ce_disabled
- Total: 191 new bits = 24 new bytes

Per-CPU bitmaps:
- core.c / mce_poll_banks
- intel.c / mce_banks_owned
- amd.c / bank_map
- amd.c / mce_amd_data: thr_intr_banks and dfr_intr_banks
- Total: 191 new bits * 5 bitmaps = 120 new bytes

Global structs:
- core.c / struct mce_bank_dev mce_bank_devs[]: 56 bytes per bank
- intel.c / u16 cmci_threshold[]: 2 bytes per bank
- Total: 191 new banks * 58 bytes = 11078 new bytes

Per-CPU structs:
- core.c / struct mce_bank mce_banks_array[]: 16 bytes per bank
- amd.c / struct smca_bank smca_banks[]: 24 bytes per bank
- threshold.c / struct mca_storm_desc storm_desc: 24 bytes per bank
- Total: 191 new banks * 64 bytes = 12224 new bytes

Section totals, which include alignment padding:

Total global size increase: 11152 bytes of .bss
Total per-CPU size increase: 12368 bytes

The per-CPU total is replicated for every possible CPU. In the linked
image .data..percpu grows by 12352 bytes. The first per-CPU chunk is
page aligned, so each CPU retains three more pages, 229376 bytes up
from 217088. That is 5.7% more per-CPU memory, or 6 MiB on a 512
thread system.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/include/asm/mce.h      | 2 +-
 arch/x86/kernel/cpu/mce/core.c  | 6 ------
 arch/x86/kernel/cpu/mce/intel.c | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h
index e575b702063d..877641d76efb 100644
--- a/arch/x86/include/asm/mce.h
+++ b/arch/x86/include/asm/mce.h
@@ -268,7 +268,7 @@ void mce_log(struct mce_hw_err *err);
 DECLARE_PER_CPU(struct device *, mce_device);
 
 /* Maximum number of MCA banks per CPU. */
-#define MAX_NR_BANKS 64
+#define MAX_NR_BANKS 255
 
 #ifdef CONFIG_X86_MCE_INTEL
 void mce_intel_feature_init(struct cpuinfo_x86 *c);
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc89..66bc30f2b106 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1849,12 +1849,6 @@ static void __mcheck_cpu_cap_init(void)
 
 	b = cap & MCG_BANKCNT_MASK;
 
-	if (b > MAX_NR_BANKS) {
-		pr_warn("CPU%d: Using only %u machine check banks out of %u\n",
-			smp_processor_id(), MAX_NR_BANKS, b);
-		b = MAX_NR_BANKS;
-	}
-
 	this_cpu_write(mce_num_banks, b);
 
 	__mcheck_cpu_mce_banks_init();
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..fa63f864e4ad 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -95,7 +95,7 @@ static bool cmci_supported(int *banks)
 		return false;
 
 	rdmsrq(MSR_IA32_MCG_CAP, cap);
-	*banks = min_t(unsigned, MAX_NR_BANKS, cap & MCG_BANKCNT_MASK);
+	*banks = this_cpu_read(mce_num_banks);
 	return !!(cap & MCG_CMCI_P);
 }
 
-- 
2.43.0

