Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B78125A0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974809; cv=fail; b=N2s98AfXC+f0Mi7wKojfIBt+pg824tNJljIgUfK7lXgZfhq/S5rwyTd8s74hBS+vQ7s7y4Sipr0B/F2L2clxyPiFODZ6hHkvC1JcI9SoOmMfPP5EvRzYROgRycSilkVcABwCQIlNQ7/Cy9OzcqWRAB3lVWv5RjDABSgoSUZ2EDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974809; c=relaxed/simple;
	bh=vUHQD5SHfLJMCQaiPjszK5tAVWTV9JyW+v1hwVG7JyU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mTkKNbgSQBzvCjfTzgc6WvYmOHNplW7vKt2PYfvywaUrZnyA9kYZOJV4lJI2HzZ6174BakajoqWVbWqF4bvenmNzxEDsgl+Znq+XaFjn0+EeubDkzDaDVudpiCE8fqqe2UEaEqC45UM2ExD2tdVRrTH+5AUU7mpbSwOveGkpOxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u3V+5iSZ; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u3V+5iSZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZMfAmtf0of5TxvkqZFsotMv9ktYGEs0Kp2/e9dINeovZ3mEbN2P1T1XaqPHePc/1D0wgs4N93PEnOriy1Y4YDQ6SwOYobJLT5MteIFj4QF+p3ppNI2BsauX6y7g1JtlyCIeajWrHP90BYhzhrgT9tsDj9knGDqwqoXNzM8x5S5sQjyMVGeDxqrbmezM2+CPaouL2FzB1oOdx4oIZ8C9dcnP2Iql2Fi+mas/ASuRKbeqkO68ldBEXW4s+KK9cEJ9ED1DHrqx9UKmKXVSTXzxbto8tZy/vGHR0rfhNXyLAYC6JSp2IOOX6Ck+IY/ZuETK1j5pHRB2O41I3+PHfoTBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La4L6ZAWpZwFz91iYr9bVJ4bcOyyEn258nuTTGaSTrM=;
 b=hS1VbqXw51kRChbO64Dr6gOEIzsbqKRx7U5IWKjr2LJzS6kw5V7bVNZ2LDZXlnIrysECKLyY3ZOwLPuP6s4jtTg2h7VDbIx/w5Ym5S8hkbJfKdT86mQ13ZqjPSVSu8wqLAV9GHlmvNZIVxLMEOc8uACLQRfAYgI+TACcgwrHI7ma1dkDId+PIR5UFGDwzKx1N1CHpSqj5y/YR6qpoG7T+UsRbYooJ5Px2Js1VPKFTgVce/teOCdnhVmDTpy7W2jm+O64pbVYEJ5BzhhL+xZ6QtDkUJRFe2equpx5nbocoo96nv4QnHX5yFXqONc68mgEcWq/6PI8E/f979YDnk7Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La4L6ZAWpZwFz91iYr9bVJ4bcOyyEn258nuTTGaSTrM=;
 b=u3V+5iSZfzQw5Du0YdzUwahqQtEpu8fE5wp6c5/o3c+cHgr7hI4+bVTy1KC/83YnixmBM9UoDjBjMfYhLWrl4wZdRNNCCKW4H9ELentr9cgBStwmgoQmxNzd+4qQmVyjrFere7z7II+jwmxHQd93W5dsDTPfh3mDKhg8bMXLwW0=
Received: from BN0PR04CA0076.namprd04.prod.outlook.com (2603:10b6:408:ea::21)
 by CY8PR12MB8363.namprd12.prod.outlook.com (2603:10b6:930:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:40:03 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::62) by BN0PR04CA0076.outlook.office365.com
 (2603:10b6:408:ea::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:40:02 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:40:02 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Sat, 29 Aug 2026 03:39:38 +0000
Message-ID: <cover.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|CY8PR12MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: af8c7aa7-a09e-4c55-8449-08df057f358e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TUM6+3Ds0E9aWOxwq2yUGdoggSmBK1iDI+iPa/GNDqvDByW3xWGhnD3vHPrM+BrLd28KwFr7oRE3Y+eXP091nRQrWfoZGoay/TWDNVnVNWIZWKgl3FYkR6PTT9KIA3iekqt6JxEG1SspCLBeh632T1ST3378ljt/awuVdCOPEA3nbc+hXkMfGJRbPiIYs9d6PIYNnBYZuOwTvAYMbcn348pufhNhrqZZOJgI1Q2xZF1cBYOo41Xxl6yUMZ3xS/8CIJuS2bERayz/4UPd3Xzott/Cfzh7eDCJgAzIexxagou9CFkkxE/FzDS/yEhj7WqOH04sgZV6eWSe5HGmzX4DjSeGWgINDl941/Kfxx6em4z7P3DtI1WcidJvX5dUeXRwKAF6ymkgBilPoZlf90dnylYRE4uiPpaX2sBKk2bsAQ4Qb13CWEzUXvpbWyP/Gsib4GAihcZtB8Soe1+QSg9TFD64YsXoZuQ2EUSxpjiH/AhnX/qkf23i4HM8ueNClLwTMRgC5KK+gMMUL2mcHnL4HDx9V1NID1GflXzMHUEKHIp0dYHh00aAsp+b5IbTKBF1eYOYJ1XTL0olQDuGH+S7QXtrdPVHklYg7IJLo+/+dY18uNGUYyrTTp7YrbkP9GSzXYL1f1oHj/d8hGuKFfWL5eBRQGm73N9+Bcmuv7jdxZPf17qtNUeU6r4lPmhgksjsLiWZYoVexvK1FvPRXEG1FQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CoG7jlwuifoLd4zjl9RaxtoKamzx372oOdFOBk5DrW/88FWG/QjRFBLgFkVBSdf14ARIeUlo0kVcCdp8/l/Qu+pgVMFYDcYgdF5gLCW5iCMGgCfJ2G2pyQJOk8Fih2eW8aD7OTsIKqGB0NhgWZelvF6QEYt2OO9ufZ/1cI+SdxIenFthTEmwMrqd0bvBOSPsdlZieUd6/l5o5hISQPSU9I0I30BBJYuvBodQPUqtryfsaZo6lHnqyw5fT7ixHryUP3VmA+oaAE0h/XwBOkLDuV8wWp6AFoieaR4pX5kZCl+4RpDSR/QpwreLW0XA0oKA9p3fmBBEygTpaHhbKLWigWj6aCnj1E/XsPRJrSxfeLu7g9aolP7mqeMMv2HiQ0YLqeRZbosyrAHl5cnDnJajnC+Bdtsi+Ej0sr8toXwYMlmFDs6eo1Vv5fk5OgLIXv0u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:40:02.7027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af8c7aa7-a09e-4c55-8449-08df057f358e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8363

Hi all,
 
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

8. Reworked sev_prepare() to reflect the error confitions correctly. 

9. Moved allowing all of interrupts right after registering the SVSM APIC
   protocol.

Thanks,
Melody

Changelog: 
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
 arch/x86/boot/compressed/sev.c          |  49 ++++-
 arch/x86/boot/compressed/sev.h          |  13 ++
 arch/x86/coco/core.c                    |   3 +
 arch/x86/coco/sev/core.c                |  14 +-
 arch/x86/coco/sev/svsm.c                |  11 +-
 arch/x86/include/asm/cpufeatures.h      |   1 +
 arch/x86/include/asm/msr-index.h        |   4 +-
 arch/x86/include/asm/sev-common.h       |   2 +
 arch/x86/include/asm/sev.h              |  20 +-
 arch/x86/kernel/apic/Makefile           |   1 +
 arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
 arch/x86/kernel/apic/x2apic_svsm.c      | 236 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/x86-stub.c |  17 +-
 include/linux/cc_platform.h             |   8 +
 15 files changed, 366 insertions(+), 35 deletions(-)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

-- 
2.43.0

