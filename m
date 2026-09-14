Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AB238166
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347466; cv=fail; b=ctLjlVSKln5786Q+6trJ+VnJM1tRVeyuc9wP9x9iM17VG5dUYfLOmhU7/+6QtAgqgV4DvyDyh1Uv9i+Lyc4/YokzMgA6HYi3KmvRYMgbNXh4WUkvWnLsvmXURjc+Nsd1u9ZuM4E7GTDRF3aCK3eleT/2pDKOhZVSuIOhbmdIGqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347466; c=relaxed/simple;
	bh=+Ntqm8S9aABSlFem56plIym+UkhG16q+rbSeLI7vIoo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KxpDUbKtCt7YXgXuH70+jGP79KKohqFxg47MMi5LyzZiYdnkrPNMGlmUEmuBDHu9Oz1cUvzlxTuOu6dL+oHBdIazwmgrKTaOjZjniXLVt608ycjnhxO7WjVTQf/7KmnsqFRDMKbTFF7wk8efdJfi4Gb6z0phrTog3En21fmVqPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lnEO9y08; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lnEO9y08"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDybDW5EYgzzOe3cdXtl2pdL/Bk3RtZPozxe4jukxCjYzgJ6HIQPukS5GEtgrGY+c5IvUEGvN9dmtWrGSAIX4imfqL1ugva9B2cScSmvgSLakESgbt48mX4Lfdy89vzOXEQ0MOjparn2kK7TZhpn0lNOp4NkhdH+KAdMpqCDuU5OdRJ57NmofBNe1Zmut3aGnsF9xg6xAiz6r/gs/UaaR8iLHsDagTdTzHhVAJ6YXl85zudDAJkwkzhu0ATH/IWk5c0aBuPmllamP+iqIHI9Moq01Mj5Doa7lyrMSTpPQH7ja5enKkmfYqJSLxdd35Rvnx2UTztgHqEXLYuRWEiFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpC0XGFTf3Kh2UXx5h0+t96FOvDuWiKiGPthrlWPCac=;
 b=vUWH13j+/eERD5CR93+ZDVdDf1AJKwLkTjMhEvZt5GpmMZA4YE9JV9RXXLS2ZdAl0SvlkpZF7cg1g4BILV2530k6TgYYb7XQ+usoobYetO6KP0HsimZkDCJSX87+qtpbXjhyrfMlb6n+a7cSx3txl8fkSuqwXmdK5R3SmBnNgHO7oiuSWMovORtgDrgEEw/xtQkyNaU5AhzwXrMWPiI5vPBDj3A2Ac01pW6VtiCteqJoy0qgRNM9XfcM1byqlFlvU4JrPfYQCVUVlGYFbNdwGiaIDVHcvL0Agm47D1RdMUvxVfyhtSDz3BBV2GYFwmZv6VYfvJ+RCFj7oKw2wBxAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpC0XGFTf3Kh2UXx5h0+t96FOvDuWiKiGPthrlWPCac=;
 b=lnEO9y0831noNef8V9h5YRPJzU/e4vSY0MhKfVetrrehiWOVkVfvR9J+3cyQ06aYdg676K4/nVRqBuXYpQ13g2R9roI+/2tjWUm3DEbp1vjKC49CS762cFPctMxJDL8AMOOycIg3K6vwXK4/kV8JMW3izaRuCy/bHcQVOVO+HQg=
Received: from BN0PR08CA0021.namprd08.prod.outlook.com (2603:10b6:408:142::16)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 00:57:38 +0000
Received: from BN7PEPF00000095.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::74) by BN0PR08CA0021.outlook.office365.com
 (2603:10b6:408:142::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 00:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000095.mail.protection.outlook.com (10.167.245.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:57:38 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:57:37 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Mon, 14 Sep 2026 00:57:16 +0000
Message-ID: <cover.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000095:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c83e87a-1c56-4003-985c-08df11fb2c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xutKPeEewbfFrJA4aF/yEgyBA0UHNjkMvwW60+OxEhgcy64xzCzMReyssyfEiAvq4hvbU2uVaW3RTzI3DhAA/FCLaL/WFkWbWW/Q18O2t380enWEq9aEpU+V3ipRxqwXte4HYDzpqGAWWVn9A636edEyK2E3Zp4AN3dEPlybqJBepWxZ9YRQKV58BnEx1bE7A7Of1l2r8THDHAARFDy6P1MbRt7p7CGJN7AIeiWR4o4Dh3prWBxTCoT87DODiGkv5NLZcPldAhgeMYaA9c4T+qrpG2L5VUDBTU7nbE902pxG4mWZLu3XITkixf8spb52+hp2fn6lABtoQxu9Qa6lge0ewpKmn657v0Wd/YXA8s3wOmrzBkWzLku345a9kQqg4fQLjtD433FHR8qVggZXB6beY920MAZVX9385eUu3+UhuPUManbsOSkRsv8cwo5t8znqCo/7WdIzIPZmi7HT2y1dTRWGND3x0p2XDulE5Qn7Cuul2jgiuF3adazyv5XwfVuzpeufMPCU+/jlpo+LIHDyRiv5lumKqI4GVfAW2DrsO6fkzLfu/1LA5jDmZHRrM2fb90hDMD5+CC6xreO9cjhjpE76iWuPY66kjB/UzMbmo0QUP+n1n6SP4JyU4yQiXnAZ2D7PfLwK6FZgh3H3tk25u+7H4T644qmiSukveC77TX3SLMTzSZPYSi5LI9cWBycVuFACZ5dpoNDD063rXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BXoCIXiKTyONKmBagRSDp5Rpb5sb20TwnnZB3SNT5JjsQoEnScdiyhOB9ULTTjoWro1oxbi5zjSZtUsGXyoK9/pOD+GI/Hvodq3R0qNEU06zKDxcU9UJaxQF431SdsqxrHCv61Isf7OibVGu90dPtC23l2KJI5Oi7JHTg5X2jO+iVuTc0mP36mb24Dt0UmFBWPYxhkcDItGBxf01K5BwMx0XFo/Xr2NNkuci4kYrHKlAr0mfYBMUe375ZIkWoEabwBcLGdhqYrq9VMi9Lxp1IHKYiDaFk2tVmjEbQmC9ZiNlQRS2xtWrY4E0TMjNeRUQjoJPw/IV0JGjkoB4ukw49W3eGzPQTAziO7RJ6SAOPdiavtR/sa5KyJKS9/dGMWAnnsTsIAZhlbSNL6Sd6cs+UcHHJ3YKqqKgT8h+BxOWUheFP0F9UwEwELfHp8Gp0D3l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:57:38.4800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c83e87a-1c56-4003-985c-08df11fb2c28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617

Hi all,

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

Thanks,
Melody

Changelog:
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
 arch/x86/boot/compressed/sev.c          |  50 ++++-
 arch/x86/boot/compressed/sev.h          |  13 ++
 arch/x86/coco/core.c                    |   3 +
 arch/x86/coco/sev/core.c                |  48 ++---
 arch/x86/coco/sev/svsm.c                |  10 +-
 arch/x86/include/asm/msr-index.h        |   4 +-
 arch/x86/include/asm/sev-common.h       |   2 +
 arch/x86/include/asm/sev.h              |  20 +-
 arch/x86/kernel/apic/Makefile           |   1 +
 arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
 arch/x86/kernel/apic/x2apic_svsm.c      | 243 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/x86-stub.c |  17 +-
 include/linux/cc_platform.h             |   8 +
 tools/arch/x86/include/asm/msr-index.h  |   4 +-
 15 files changed, 385 insertions(+), 60 deletions(-)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

-- 
2.43.0

