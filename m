Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643161;
	b=P29x8wGA4HKxUUYDTMdxQhgSWDmaHGnmK4Px7WqE5X/S6e318UlrMkwXiCBR7DfbmfzX
	 54MFV354HgFLgc5Y9SsMS/M+f07Qg28QdYfQdAiL+aok0nVOM445Fk6lKbqXTppotd2SR
	 L4G53blRX7P3rH4sZj0mUc4b7LvKDdLzxWiYH9HBzl97LeK/7r7F0+J3nLSaFtThwpiXP
	 6KzL14G+Mv18JPVNjOTxEKr6YnrjrF9CvNgvVrOFypdq5MCbeCgsvcJxRHJN2WmSjuZZr
	 lfdK+RsFpDgJltOGvl3trSOcW6kHpHsNs/xAxLO/d9mlZOovYq04JypsPTjRujVrpCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643161;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=JhtDxeY5PDczhLqmcC9tlVIyt9VuBxhgsTcI8SS6E9o=;
	b=wLcjrSrmi1huHm6o29WcS1j0cs0yO30VQejAfQAjuKYrreuEJIBsLDiOEH9nK1p4zJfD
	 xmYl1rGcORSJxbJAXE2SyXvFPHkEv3H/Ryn/tCc63Veg960Fm4f35Ja48/VerENJx/kbA
	 /wJ8OmdN2JEbGSaa/IxKJKAZHu/lz5ELdFa3RYfpZLc9uHp9cgxUr+vwcaQjsZJXXWP7S
	 WRhNvUHUrGNBTFd30FAU0XIZrwBPD1AD0vhAehaNAME/drLvIXKmfVDYnHpcIl1pOxKkO
	 vWhFxJgAINPmfPt0K8+5rF4bKwUiL9ZP8c9MElb4m/ejP5Tma8REdQistw6qWG2+lVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Mfv3uQCQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.42
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319D3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Mfv3uQCQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBrMosHJOCIxhGM4LpNiUbimEo2M6eHyh77Hv5603XTPv5n+ppSngRuCiF6kNa4wSEQNTFC6m+rbhA+Lh+EhQ6K+u60V3gmoYpx2Nuaj05Z88zheyKZdmpRlNxDuzK5gbWfw+xbPJwlvXYErriNfp4SWIwxDK3LrZluZiNZFaWrX77gndQ3LO7u5N7fTlxBBJDjmhsXs+wVA7kYAzYx8n1ezp8cNQIP6rpksy6mGq8+FFDpIM4L9ONdyPHMrx6wDJh2ToluApEa/PH5UGeVX3vDc7JtSJSuzvqjDVOXMV7NO5IxVoXtOZ2fTyU95ijTZTFm8vkpHN5OuDJYy+k/LZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhtDxeY5PDczhLqmcC9tlVIyt9VuBxhgsTcI8SS6E9o=;
 b=ZGysEgStyzwWCQqP2d+PsbbWwEVPGWMwnD+xvBIIkfmweLgA6ivXFkEM0nHMN97HuWeA8UHqGTj4WSWGUL9gcJP7rk9PNnn5lCaacu+xvRdaogXle9MHUdoXNOvhbe1FlS7UOZlCCSFhYnI/zLFWLt1qvDaflBpcm9p9c/MvJefb2cGMSzt9tT4dvvrZqkmwqbsTMXAal2ZW9mb1W8pGd1L8sLmuYly2uosCSbKBtqNUZ6d6jzcF0suydQeRkSLvD/INjoXLvTReKapnFDoxp6tqek7LzGUuDBiwNNToqPnbHaY1CW9vs65NKvQGr7eZkkjIM35PJ4f/qj6288uTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhtDxeY5PDczhLqmcC9tlVIyt9VuBxhgsTcI8SS6E9o=;
 b=Mfv3uQCQKSLggcZ2NGhTlBJE59NgVu8MJ8rnANJVUO9EY8Z+4OgwHp3fx5lJXUXiVMvH2Lq4+4wJhUDFyvr2SfrWS8swC7SQc2EhxCdpV5fSrQwKP5ZWNKUmBZcunGjgTUir9Tp00z2f0Fc0tO+k4G25IneFGzAfyhyHPe+Hd5Q=
Received: from MW4PR04CA0289.namprd04.prod.outlook.com (2603:10b6:303:89::24)
 by CC6PR12MB259526.namprd12.prod.outlook.com (2603:10b6:170:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:25:58 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::33) by MW4PR04CA0289.outlook.office365.com
 (2603:10b6:303:89::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 04:25:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:25:58 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:25:57 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 0/7] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Thu, 22 Oct 2026 04:25:36 +0000
Message-ID: <cover.1792206487.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CC6PR12MB259526:EE_
X-MS-Office365-Filtering-Correlation-Id: ab226d99-fe19-4557-aa8b-08df2ff49237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261021130227099003|261021121427099003|56012099006|261021135927099003|11063799006|261009223027099003|10067099003|18002099003|261021123027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	v+UaVpq85uTICu86mIaEVWTYkpfDfc1VDjpsMtKGzw2Lf1PUNgE1oC2EUw1r3juTvWi02nVaes2H6nUY06quR2uOfD1TbM3jym4l31rFjoZt8aCr0OWGXy/X+YHy59o9PFC8ykpBqnMbw2xCvolDNCNqgF/49LmWpb6SIg6O0B3bDoz86ltNZQPGWesJScz+ASo1iSEiFkdsZJz7yFXbRcDhubyE9ikJ+F6/ex98mZYsEnNAiaxwc4qNett51t4ASA6EgCiS9/FfM+Cu+Oc+2EIbelRfq5zIXxY8iWRB7XVrGppxkcm6fsPBYZV/ZZbl7vDEJRdcSQq/AqM05pqmzyw+K+KfMdT0ZHUavGpGnctdV1veUeTNmldbu0Y9KTe1oFAC0Qq1IU2u+qpD4Yz/ALFQnu8T8yUDvzjXEdAkTRuceZKUiKBvMddR30hlByCUM1xyB4BWkE4G1x8QObuxsilXI5ueIja6HjjTNoPkKUjFAwWoD40ZIzLrkb4SCjOTMvRqAL6GbrKc3klJ9rVxBkXSb5TDsYBV3cg+FSxk6AcYn3KWRGPI2tU9YEXnhtpMdqbZSazHJv2QPWdJ+JN9MKe9Hjp101g/wX7IqDASjgzNHntbbvEojDEgYOPAZJXJMILmkW1oKQR2PWSlYaMssCCgBOAEGY/nkyN0m9XokCWO9wRqiwx3ZROACjG2UGpdZ4SiZuwAm40Y22c696XCKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261021130227099003)(261021121427099003)(56012099006)(261021135927099003)(11063799006)(261009223027099003)(10067099003)(18002099003)(261021123027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f3a62ZhIZkJDcWPWYGARX57rokk/h1Qid6FxCox+6Vd/MueoIy1bVX9HU7MUHoaUyXSBNS2807DILK+pdbBFKX3y8KAyI3QweOW+3fBKsjYKwxCcPDx9MB9o+iKAQiWZIovEADMG8jPEu63EbrG8U7rpJAeDnGheFEEa44YJLbjNB1UzX5loVj0QNLPKmk0tGUbvdMKruDQYzSmwsZ+UkLgmyGRXxDurrm9F1kZiwY+ZqfB94rWVs4dtLiMGYyVslrkSjAisR26P+XbhO0VoFH/KkJRLsymd3Gqya01qUNdVBr/W9HfbvcWRtGmEGbHCCOhUwL7efJO7Y78bK0faNPNuPxMHSxLJ4pB5ag3xbScdHmKHrr1XMSK4Cw8nWKcWUtYdnKOBINcjdlTncJ0dsHayOEkCIeMeFWNY/3RhRkY264G4dkhMJ7qvmnrOO860
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:25:58.0870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab226d99-fe19-4557-aa8b-08df2ff49237
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR12MB259526

Hi all,

This revision addresses all review comments from version 4.

1. As Ard suggested, used a bool as return value for svsm_register_alt_inj()
   instead of int. Adjusted code with it.

2. Added more comments here for better understanding.

Thanks,
Melody

Changelog:
v4
--

This revision addresses all review comments from version 3.

1. As Ard suggested, handed over the registeration of kernel guest for
   Alternate Injection with the SVSM to the OVMF insteading of calling the
   SVSM for registration from kernel guest before ExitBootsService().

2. Added a common function for SVSM APIC ICR read and write.

3. Added a common function for sev_apic_ghcb_msr_read/write.

4. Changed some comments for better understanding.

5. Patch "Make-SVSM-calls-preemption-safe.patch" was merged to the tip tree.

v3
--

This revision addresses all review comments from version 2.

The changes include:

1. Moved sev_prepare() from decompressor to EFI stub.

2. Changed "Register Alternate Injection" and "configure all interrupt
   vectors" as two APIs located in compressed/sev.c since they are
   self-contained, avoiding exporting functions. 

3. Added more comments for better understanding.

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

Melody Wang (7):
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
 arch/x86/boot/compressed/sev.c          |  11 +-
 arch/x86/boot/compressed/sev.h          |   2 -
 arch/x86/boot/startup/sev-startup.c     |  20 ++
 arch/x86/boot/startup/sme.c             |   3 +
 arch/x86/coco/core.c                    |   3 +
 arch/x86/coco/sev/core.c                |  48 ++---
 arch/x86/include/asm/msr-index.h        |   4 +-
 arch/x86/include/asm/sev-common.h       |   2 +
 arch/x86/include/asm/sev.h              |  28 ++-
 arch/x86/kernel/apic/Makefile           |   1 +
 arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
 arch/x86/kernel/apic/x2apic_svsm.c      | 245 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h  |  11 ++
 drivers/firmware/efi/libstub/x86-stub.c |  42 +++-
 include/linux/cc_platform.h             |   8 +
 include/linux/efi.h                     |   2 +
 tools/arch/x86/include/asm/msr-index.h  |   4 +-
 18 files changed, 406 insertions(+), 50 deletions(-)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

-- 
2.43.0

