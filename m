Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012029.outbound.protection.outlook.com [40.93.195.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5937BE63
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789927964; cv=fail; b=ZSAbSCzOXJLPKOH5vl2sIxsz1/szwEDbz1vLADoPYSQFlsLLqfgCe1ZBafA1Sbb/udxVxtvC85ZRMqHnS4a8s+MXT4BNo7O9bjPVbBkUchBKGoexN82n4sQDRHvY5jQAkATcdFV0ahHC20n1i7NOnFkFr6tFHGDYkMagh0wLQAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789927964; c=relaxed/simple;
	bh=qAvQRg+qgxoaC0EEc5gN7e6Rk3YfwBk5f967juFlgi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VSa3lscTw0tgvivBh/BwnNER4n25SiCHPxWTUxHkPnT8dUh4BZKdyj628RFNXhEGvoZs51n7gvNSa8Kjf+as8l+iOYtatnMo48p70O6z+R0qTjl7jHDLzrc4jmwExu4oJ3/SCH8j+lFG6vWvCy1gn60c0pyMVreEiE4KH42jO7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TgGfj7xN; arc=fail smtp.client-ip=40.93.195.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TgGfj7xN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0iIXUGwL57kkPHKnyGI6Zm/8a5uFX9aVzSGlO3rAcGCkuIwcHNM5c1t6OFKs14vqdcA8+StfQFvKN+BNwFqwnXl3jNij3UHqJcaaGUGi5ix1AqfjWspHJ7KrVtblFVcszrXGH97occ1FDcbZ2ugGh6qWUyUi/nRCshDkJpcOrcP13vbRPbLMF12V0h5t5FsZ/offgvWOW3kylD9C2jwOJ7DwUWxvov0CrDiwpXdCtF1SDU8tlMOqT4ImztlyHP1e3avmfc0FDHsVkyo8SXS+OMIJFi8tyTqk9H9xip4/d7IWg5WjbFNjhZCNwZ9swf4utDpytwXBLhGhA8Of5aBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXS0/8Rb1cwtMci/iW7r+MrEnJNgzwc+TrwIOl2rSzk=;
 b=VxMdVqrHBmc2ucB2/F735FdNcUgNTuWcWWn3q/3bMkWEeXJANS6ZTZkQAAUKNCbiP0uG2a6vGB06GEa4WHzlVnoCwS1VWWUrX6uR/i61VcPscQ1RdfAWWnf0vzLTlnnxaDVWt6KkGVAAm1Di3gD4iASutHpfN7ystkWMC1RLkGgCDbc1kyIgkTjtltDDVDiGv7XOQ/1HfAPmSk6E/rszx/fMtT/wlaQ0V8vH7EFU4GxWNDljvIUCCXeAEth9n5ej3a4Ci+qykh5/wZ2XIorJP6945Ae4MtjpGebtpqaWm1X/ZlJyD+SKcEnLHw6+3VvLB9P4p9Gp7dUaJaHe/TBo8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXS0/8Rb1cwtMci/iW7r+MrEnJNgzwc+TrwIOl2rSzk=;
 b=TgGfj7xNEncBdl6ChD9cCJlpscqNsAWDPW1+G4AohaJ0Ln7nozvDBz8TPu1Wr7kJElDRLHoS6mVz3f5vj4FoIr0airyIeRKxJLHfuBfq3WPXcsB358QoXBxzkM2N6jQMjZ2S3tuZGlTpQPwaV3Dpefhi9c5OUHkOpbU8GswGXpA=
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sun, 20 Sep
 2026 18:12:37 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::82) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:12:37 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:12:36 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Sun, 20 Sep 2026 18:12:09 +0000
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f52406-9d10-42fa-d5ac-08df1742c051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|3023799007|56012099006|6133799003|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	QqsSlnZhF+6wUUCP/m5XVEwL/QOUAEBrDU5OkQGT0nzNwlPnHlzADLpD2b/IMVzYi++ChElVgpR1cCoACxzqTUtPmEx2TWmfn550RYeitcvTHLpWbXfnsNX/ETGs48vClRXWH8hRZV7MFy3SKu5LFz9pVgg+2wKPhh+qgPy2KlhqurFgBm0HgRQGgfqF41TESVAqGTl9SCg2pw3Hg3izdjBU7TOUy7b5SH8q3wRRsUsGgEDPS+zATpwTGWlnQ8E8k4yMLtzRgL6mZIU5l6pSdP1/t+v/DMkt+O2fbusLJvX+5hBS6Y226s/3cNVatPp7Ju4XyWkEa7RFOB3xWxpW792GtU0i+qnDctjKucZ6agwSIgbbfcaS0nrLJrgLINx4twmcwyFw34wbyfE1Lg4nw3XKH9uz+iPPI3G99nuz0gelUHsLHE/hUNJjKyKi+tYvfs7u9tLBBL4Z+n4FjltBV6OOlqQ/nQp+m8Hl2hIUee/cpvltVmi/ziZk8WGeDoxIwNpamH8+VAsxZnjK6azHgVuf2TXaR++/HxL6lSVC0YPpvPfKDz28uuSA+iLdeczSPxZfgjIdhuaGuwqtlvoj6B56HxISnGdancp9EDAHR05gCRUIb2gJuqC9+ywXhcoruvOiwoOky16OFH0IjprNgiJg9ZaKZIlH/FO0BkTgdlvtftrLydn+N250zCKY6znZ+kkfPbBZtgenpbT+cuX+fg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yu1sOwlH/JBqzYHaHaXOmdSWHXV8mGriA3j+jBM7aXY+6tnPHnWAIqrH1ttS7vvOHr3xHAGYRe5o4kAK1jv8A1AagkAKKceyfEMhsiUpOhZZoejHAsw02HT89mtIcfGUEo5RRLs71wO5pLvWByYu9gjoWVmu4At1lRwmd0csKWRMMD2SRarXYv2JWP3sfM9viiIjRpDVTV7tRhIG0xpSMWTgyaTTDv5bC3sQ+LeEl4JNFFtCQIfAJRp5UglqfkxWitoGRcCSPqTO7Otf+bt4DvrmJo/+u4KpSZ8bpvA8TIBD1HXPZ3VT5t2jYI2Oba6mAjednShRoXP0kHJpe8toFDNp9r9imLGt/Okcgx0QSwKDMmdGORBdbjuZBNa3cLUVzFG5kN6PpHAJ8rc3ZdN5eJyLXX3AyrdXCXBHRlf4Bo9Dt5MHHveBIZAOyscoi8o0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:12:37.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f52406-9d10-42fa-d5ac-08df1742c051
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558

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

