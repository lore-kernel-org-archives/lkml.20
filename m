Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBC3DF01C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928243; cv=fail; b=TjnJg52bD0tkHLdwYh1CCqP4I5fqOTYK0YsHMShaKeYy5FwGt+w3SEuq3YulLxNsJJ/TwkXLyhbEDmmRFYF/gCbZ/7Gr8S/wbLX1vIDdL4oGgQsKSHyF8a9RP0aAOSjvBN/HmNF7MpqJ34B3cpLrpEy1/L7IikFgMjfumDEF5DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928243; c=relaxed/simple;
	bh=qAvQRg+qgxoaC0EEc5gN7e6Rk3YfwBk5f967juFlgi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kMOkyodRv8ZYdv6pLSwQFzKdWtZNIui7mTsG1T6xJFkqva++fHb7vnR9R5NKWG7v+g/qI+GY32OX9Yo/SOwVeELff30uoOsEIwRhSgnlzkAzg7aAG6WKRzPjIIKiQDLhcXAMpTKc/WCcdTbS1vxlGvt3meTfSBZ3oQ2id7n5fUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r8xBkNlr; arc=fail smtp.client-ip=40.107.200.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r8xBkNlr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX4+xo9U42OPvhzCWK/I/iVk8P6yTkvz+AjyYI0xtD4lcj2WANiVR+WEDYDZ4bXpFaDU5t+mZafMqbr32+txrVn06vjhDs4foN3YR+eBFZX9w6ZY/35ibXLpVkUahjgDj9/LmudV/OhecaTXHiIDoYWoKk/ogYezpCwAsZvm0526NS+CjdjRvjzsN/dOkTvbUf9wKnKmv4pGuvi+9C8Tbys6+/N3Z+9/l3VoN51tzlA9FAVe2HO+7rUOT3FJHAYaSNyMkIMtpYCo/GhPGf4+7WU955oWW35hHxxWRX9AU6oUk7rLspzQIfz8Yn2oyomae0m4C2AzSWZWqZ0r838hIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXS0/8Rb1cwtMci/iW7r+MrEnJNgzwc+TrwIOl2rSzk=;
 b=f2+wfsLrIPRz4w6GxxMC4xvujx8BRGOGmdXcHkm4cpoSi/aOPsDLStSZwGgGGmXv/u09G9PSaId3FUOBvNV8tGi6LGbeAKYWV9As+PecApI2IvTpKeRNqCgwfZ9kQEO+eWVNNlDVP5pBBGY8JfO4sWAE1KPogPu6lrj1UULCSA/twf6uIdI92EfpETirc4gxCbGx9Y6nKNKoXcPNjI6v7kx9HFdItiTGpX4AtO/f/iOaJ5JvrFrnnwctNeJcPs2orvlRzr53DnH4S2yHTeivm0JMiyxiIHDpSuGkGc1jk6YCpnq1x//CSAzfY/urYKhSTRiUSXjc7HXrMYfrxMslJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXS0/8Rb1cwtMci/iW7r+MrEnJNgzwc+TrwIOl2rSzk=;
 b=r8xBkNlr3G2rxU/OChSUzJCe0lyfofr/QU5loGfidHjaLdeX7ZCJfYp9EktmPFACV1858PdTlxCZ2c40FgVTxS+wnB5B0PymnShKvG1e2pbXgx6D9zBCQml9vi83+xmKUr1FfepEjxvZZP0NurAey+KpWRJpJzKVxPMvhNTL51w=
Received: from BN0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:408:e5::26)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Sun, 20 Sep
 2026 18:17:15 +0000
Received: from BN7PEPF000000A1.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::88) by BN0PR02CA0051.outlook.office365.com
 (2603:10b6:408:e5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A1.mail.protection.outlook.com (10.167.248.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:17:15 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:17:14 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Sun, 20 Sep 2026 18:16:52 +0000
Message-ID: <cover.1789927246.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A1:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 7595265d-4339-44b0-fb94-08df17436645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|10067099003|3023799007|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	YENWPF+9UM4lsTtBw7XtBJCLhZ9WS9jHrwWmStQ0uM3zoU58prqcyJsq5nPR4BT8JtINwcVZOexdo1XrSUTmp+vo+5pdBlrIpNRtIO1b+dk0F1oVLlPslyxxSvMVEdaMEjXmo+XBm8jMnR40ydYW4F/Fg1tyTI1QSg0Mgw2sNcG0Sqo96XPL0JtPumZGa60LoiTj3BtPXp5saEyLXWN7dQTn991l4ZIj2Kvjh5gHtXu5QaLfhNeTncd37YuDXwp3nWZ2OuY3oEL4jxrdTmoQFMWotNLM+0Utt6XvzeUtUtKNvkRKW3UNiPO+dnhd6JC0uPI3FJEe6NC5TfKm+ly1omg/WZ2YAMvseALN/hEPt6wPYr0DgNC6j9EmSkhDYNSka7JbvUqf8WaECCpezh1StQL9smG7HV+dyoHAAZY42fbot2B/1zE52UfdR1/Q1IbSMIxasBspcPlJ5O38J9CbQRq8eta/Mp9+qm8j69WV/GiR5PpdOueXdo5kPMqH7Ouea7deA/AHCxpTkdcTJhpb/rVqxKSXTJQegq2pJQivB3FTsjQAPnnd7gRvT4N/1cZdi5Ee8+aH6LXixI9Y6KrIYLeYf46W7CBip3efHBUpUGwsGbjEzK1ufFxdNquqBU0CmlbWLQBbxPtqBc4o+aH7ATt1Ymu9my46w1DJ2/Ln2Ga//DxCBdFcy7c9IfhPgsBRIA8DNNOQgle8BK2b+XQcpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(3023799007)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vC8kujTqpHtleRvmTnjJeutZ9ASqs0OtX7SL6KzRtsZbcHVtUPcTrLF+lDIrAVfCrgSkA5NuOrHnDpS+t/qQ4yPITNzX5f4+6kmy8xkRw3uPyW36O1WOGQouHhjdtTNr49AM9EUBzRb6VpKMFuy8LssZqd67Isk64scn4EcE8Cqh3wiebY+vtUE0dMomkV37kbbdXGlQVH2zv/gV8YuOPgnxODnT8hNWdBPkNJuFB42uu7SQd2Uaab3MpTl3sumpY/w4Ko57wZllvzJXFOVZ87ur+IaVYrZmERcqxp2dUAYhrMO//DwINQZi5IpDXClsqOZP0qWrKnXz59mVOLjl+Voxi6YiwFUzY70Ox4sSD18Ny7ta8V4mYQ1BJwHk+JFrD3FSomG5GYygQkRPN4RHIBt4gjRda7uUV00rYQftabd5vL3O13ayy8QIFUWbFnZY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:17:15.5575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7595265d-4339-44b0-fb94-08df17436645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
Message-ID: <20260920181652.DaylKLk1VHKZdRnacoQscYPjoPcIq4Kbp6SbGG6fr7A@z>

Hi all,

This revision addresses all review comments from version 2.

The changes include:

1. Moved sev_prepare() from decompressor to EFI stub.

2. Changed "Register Alternate Injection" and "configure all interrupt
   vectors" as two APIs located in compressed/sev.c since they are
   self-contained, avoiding exporting functions. 

3. Added more comments for better understanding.

Thanks,
Melody

Changelog:
v2
--

This revision fixes all the review comments from version 1.

The changes include:

1. Changed a few comments for better understanding, deleted some unnecessary
   code, corrected some typos, and some minor code fixes from the review
   comments by Sashiko and Boris.

2. Unified sev_apic_ghcb_msr_write() and sev_apic_ghcb_msr_read(). 

3. Move x2apic_svsm.o after x2apic_savic.o so that the secure AVIC gets
   preferred on machines supporting it.

4. Reworked svsm_apic_probe() as Boris suggested.

5. Updated tools with renamed MSR_AMD64_SNP_ALTERNATE_INJ_BIT and
   MSR_AMD64_SNP_ALT_INJ for completeness' sake.

6. Changed svsm_apic_send_IPI_self() with writing to the dedicated
   APIC_SELF_IPI instead of writing to APIC_ICR.

v1
--

The revision fixes all of the review comments from version 0.
 
The changes include:
 
1. Changed a few commit messages, new file names, variables name and order,
   function names and more comments for better understanding.
 
2. Added a pre-patch to fix the problem that in two functions in the the SVSM
   vTPM guest implementation do not disable preemption when fetching CAA. It
   is moving the CAA fetching operation inside svsm_perform_call_protocol().

   This series relies on this fix too.


3. Removed svsm_do_call() helper function and some intermediary layer
   functions in SVSM APIC driver.

4. Removed the Secure AVIC check in SVSM APIC driver since it will never be
   touched. 

5. Terminate boot when Alternate Injection is enabled in vmpl0.

6. Added a common function for SVSM APIC read and write.

7. Added a new SEV_TERM_SET_LINUX value for Alternate Injection and APIC ghcb
   msr read/write.

8. Reworked sev_prepare() to reflect the error conditions correctly. 

9. Moved allowing all of interrupts right after registering the SVSM APIC
   protocol.

v0
--

Alternate Injection is a method to provide secure interrupt delivery for
SEV-SNP guests against malicious injection attacks. By handing over the
control of the interrupt injection to the guest itself, the security is
applied. Alternate Injection use Secure VM Service Module (SVSM), and APIC
emulation in the SVSM to secure interrupt delivery.

This is the guest side patches. The patch set includes the following:
1. Add support for enabling Alternate Injection.
2. Add support for the SVSM APIC protocol which uses a subset of the
   X2APIC MSRs.
3. Add support to allow the guest OS to request Alternate
   Injection.

Melody Wang (8):
  x86/sev: Make SVSM calls preemption-safe
  x86/sev: Add support for Alternate Injection
  x86/apic: Add an SVSM APIC driver
  x86/sev: Route unsupported APIC register accesses to the hypervisor
    APIC emulation
  x86/sev: Add a function to contain all SEV-specific setup operations
  x86/sev: Register the guest with the SVSM APIC protocol
  x86/sev: Allow the guest to configure interrupt vectors for the
    hypervisor
  x86/sev: Indicate that Alternate Injection is supported in the guest

 arch/x86/Kconfig                        |  14 ++
 arch/x86/boot/compressed/sev.c          |  58 +++++-
 arch/x86/boot/compressed/sev.h          |  13 ++
 arch/x86/coco/core.c                    |   3 +
 arch/x86/coco/sev/core.c                |  48 ++---
 arch/x86/coco/sev/svsm.c                |  10 +-
 arch/x86/include/asm/msr-index.h        |   4 +-
 arch/x86/include/asm/sev-common.h       |   2 +
 arch/x86/include/asm/sev.h              |  21 +-
 arch/x86/kernel/apic/Makefile           |   1 +
 arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
 arch/x86/kernel/apic/x2apic_svsm.c      | 243 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/x86-stub.c |   9 +-
 include/linux/cc_platform.h             |   8 +
 tools/arch/x86/include/asm/msr-index.h  |   4 +-
 15 files changed, 398 insertions(+), 48 deletions(-)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

-- 
2.43.0

