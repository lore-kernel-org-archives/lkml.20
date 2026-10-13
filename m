Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A752BE40
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913878; cv=fail; b=gComRUN4E/MZeBigyJgWwpbWMUkfkTEbXugBqSwPOx/ERPG4SH9YiwwsVqMGwmcXm9RyxUqhc86QO0hkbTkzm7X8Ug5xSLq00JcVso1lZPEa5r/naJiR/vbE2qKhkc1aBVYlbBjLwCyqHF9IE+iPRz3Y/MmO7Ia5yMKrtn42go0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913878; c=relaxed/simple;
	bh=1BdYjCWZEWCNGtHrecU1HOT6f7xuddgNQozXqNM1H4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KNCWdBRzFPR2Zeaf3Rq7FKczVHb4hMpMhhD9poTVahYMvJpdTxGVHul48+P+7x0/I4puvl34Rg4x4AC0WAAnPoAuVNycqv1YFKUJgB/HJNxb7FmEYsz13cZO/uSXB4zwhi6GrYBeupqGA4qlt6GVMqHLkuQRX0s6NIpp/kSuWwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bI8N/TtT; arc=fail smtp.client-ip=52.101.56.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bI8N/TtT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl+83TNtc/EK6Gq/vnbsxDUiIaCMw/41hVTynqOKxNYEycf0tQKsU5hJz2L3InE/4L75o7LRVh7oN0ygvwIqBnwOA5SmsDUP3srwiV/vX7MQCYp25bafDxZPomY2UpwFOpT5qeAncvmnvWQekNsdXYRZ/sqihi6l71tkewbLRU0k59wAvL4hWXyhOVGNB5kh7q8vfISGmLyTGKHeDGQoTYNU533EpTgf3L7Xq54LPA8M8BLSxPbY3FxYGvVfJe/xh1PnRB4HPvO4Xt5iuQNmBPP0BdSC/C9gvTGVeIvzJs3asF1l692i/QcX1ziZNzddadrkuTQeqETwVGp1Aea+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA1PTN2c0UlgzBlGy6UaIumdc/NnscqSIJEF6f9YLcw=;
 b=MsN1JBWYiN45/uY2oSOJww5f7mNZx648+SDJkvXytLRUAoSuxh46WtHReaZbkZ0SpS54BXcDjpMG+cQAsEDcbV+f7le8pqg5/yn1zw/TxJqK9jKBXdj3W3tO9Z9kWp3gc8bxLLVsxbPTgoJyK2LqtGA8QUc30Eosu1oOFGJB5qC68oKMgD2V7HgzWNlVWCaJeTrUoIosTk1+1LHW/11zMIDScMxuZETSc8UNlvNGwE4a/of//m0zWtzo5Pm9d0YFMHM7YilDL6CQafVwhcCUyp3dZyyw9VORl4fzUD/Nk0izRHZXcTYOg84imMS8sepUXd28A0FzUi0fmte7LDPAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA1PTN2c0UlgzBlGy6UaIumdc/NnscqSIJEF6f9YLcw=;
 b=bI8N/TtTu2+5Vy7u+7BmWoJkDUSfwjppOz5TGkZZf1WQ5Ryttf+M3U+qe/phxdVoa3WXBf8u+Z+ZsSHiezKYp7hzjaxp2Nk5IOQ1MBSWEWtG0rm74Zjwhsq4yXqV+OaAzyEWS6dxjBtDG2xQ9bWoYQqFLm1miBIf5W3tbdvsJLI=
Received: from PH7P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::27)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 17:51:09 +0000
Received: from CY6PEPF00000048.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::94) by PH7P220CA0041.outlook.office365.com
 (2603:10b6:510:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 17:51:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF00000048.mail.protection.outlook.com (10.167.247.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:51:08 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:51:02 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 0/7] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Tue, 13 Oct 2026 17:50:47 +0000
Message-ID: <cover.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF00000048:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: f4708e7a-a5a3-425c-df95-08df29529007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|11063799006|261009223027099003|18002099003|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1M9ask4on3Hqka58sjcrVc1uhaE2DT+0SgDiBKQDlHnxUpny8j8hlyVjG1MJ5Rrd8ckySsaNf4+mYuli1kfg5HUndZTEA8Zmif8uWTdDgrdSHEgDzEUxDmbkHTt979vpecewNodUgQtK02GjDNy5dUdN4CATmTZorSewY5FwJ/Wv+eB/FnZrdjnjyPRjRVxnjyaDI7xNLoElcBKjcZDzIjvSubLDeVcI/RPIvnXd5/dCtKLPOEuQ/Ke4+260jT2R0DckWGUeCegERGxrsK7fPL6E4ZsG0KMrhxbcmAHfnN+R8c6z9i1UDMlKoBIn2V8/0e0UqR65JiQpf/YWTXrXDOgBSjfaE/7dVtoKMPThUYTEPYj0Ihft1BsjlmN5Q+jwWOZlCC/ZyXyki6NnPeMa7aH8wl08a6vba3NqYoGN1KTQ4Q8ieEju0vchM6Msv7McSIB63zB9mvtgZON7S/o2cS/vuHqrDofMt6WrY0kOmMyY2y0UjkmYXArxLkteDl6KI3aPUGn/J2eNyZdtqbeWbNPyGDlSmZAp3gd+UXELTJTu1zUG8S2jrQD1ir1UsVF1pg4quk9P7JVS9Nkv0VweF5YAw2RDH+MFKN3BqCm3j8KrcV0wlYBycY7PMe30V4NrOZ3vt5sqrlrP0flUK5DVOWwGFhCydwvQtT6g++iYQTefgX7D2NvDTsGdaHs/rxWCCXgpUGaR9hrutyS9xkWi1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+VIhkCETHtKDoM5DT7pH2ekJ0UzgrwqfRfXyplMZPz54rJpiEzz2svhAWkRrIvY61/FhHd0UcMxQoEej9D+N6rUqh55w74A0TwjTmXmsEAb2GMyS60Cl+PkqFPlnQGLaLZ2/MCI/YXIzPNaDDylfV60nb5E14C3Fw053Shk3PZYmjzHIGqtnL90qqR9uyL5sACbsX50M8zkwrMZ04mGvPthRKLmH63FB8yvMU80w+Rw1JNj4X+SNXPfh4uRysy8hhd9OdNa6yN9hSGSCjK2wcgmH7wgv3d3aIhVOTJHSK9jFkH8IoZlriPMdx3MTDmpi4yTnA24U1pXjFxbfrW98HWNZvT+SjWItBrRu7LIZ6VugK8lOIxGlQOvx6x745t7NH/nWBKRYv6010MwK69tNDXCBvyRFoHY3QTNfVHtTvWw/gMCZlYk6MSQkIHSn1P8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:08.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4708e7a-a5a3-425c-df95-08df29529007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000048.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250

Hi all,

This revision addresses all review comments from version 3.

1. As Ard suggested, handed over the registeration of kernel guest for
   Alternate Injection with the SVSM to the OVMF insteading of calling the
   SVSM for registration from kernel guest before ExitBootsService().

2. Added a common function for SVSM APIC ICR read and write.

3. Added a common function for sev_apic_ghcb_msr_read/write.

4. Changed some comments for better understanding.

5. Patch "Make-SVSM-calls-preemption-safe.patch" was merged to the tip tree.

Thanks,
Melody

Changelog:
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

