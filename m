Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928360;
	b=WlNfFt7ajh9vNQx7Puq51pwk/00EJynWIro25tgt4CBoYuOmlXUkmS2OGmgMBPkJM8e5
	 fzwm7xNjSG3RO2P/g32vViSGMiLS45YvpLJes0CEUvrbK14sKTuBI75SNCACXx1OjmfKp
	 dJXx1E8Hbw2SG3jeejq87X8+hD9UR3Y2mM6hBQpzZ/JYfhr+UuupWgDwRlAe24jv9pYZw
	 Wa4WjLPqLzBkscMy33HA2TvbPed3QbYwUNHJx5HZxKmtQwxU7QXWVog5kY+jfZopLyq5U
	 8Slu1pVCUEM3QQJkKqcut4bSB8E1nlenvZGjG57VeaUskax8o8j/c48sJgGsQGH2jaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928360;
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
	bh=YChkfVNOdL3VMaanB6SlWK9gpYg5GaeAwI8eBY3OpGA=;
	b=OrNc5W1d+0k4C6EO2dsN31uQWncfd+S2jMlFI9ccQEFpz4sEYVFSthOAI8EUXL6do32x
	 br99wKsHxhErskCCMsMr7jxJdYfqIu/mVRj4ux1YWjjey9lMvjWefku2+AZHTAujzed7w
	 cU/v9VQzmkJBV9NRsw/IidQaxp3TaTVORO21nKqFJdT8wrEZFOWwMS0h7K0rlvJkWSF4t
	 1EUyOeCMTLy4e76TVreRZbYVer7wInFUgTgGAH3i2vKOlzoZBWtw4Xln8IXWjWS6bh5lH
	 75srnPXKsABj/UasC6cpP6EhZanyLTMd/uVxdngEuMi8jjkw5ABdx4/7wCuoQYX6nOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2qcx2+to;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.43
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875E606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8875E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2qcx2+to
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGY4JUK/QrdwrGrOxNB5A7cMuo7Ri4DZu80+gc4wYTh2EKDvE3wNJoPNT0xuVSbLzDnjvHGbWKDeuRO/lk/IcJcMvAcQJHswvBSOQUMAD08Nr2WAXMIoTIHVjw/VuGzS1r9R2xC7hjKbfwZ9klhUcfaZf2p7pz6ghLKWT8h2wZ1SZm/Awwuj+58Z5kdCduuKnFQus/Lfsk7Gc0W35knmI6iT4QGm94FoCqlKhM5A/jh/AYWrwnHlcVF6EE0s8k90qd5B41+3WxYF4nh0TaCdJTnbeBXVG4tYhm22U3h0QUrg9HqzciEeysDAQnAy4/gW3/II0aYdzr3tRd3YPD/r8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YChkfVNOdL3VMaanB6SlWK9gpYg5GaeAwI8eBY3OpGA=;
 b=uOIudQtG7pFBkae2bsXnlcT4npisBiuD6BQh+FfeVe3d+iaKT+4yLfz0QqP4p9OmjTk5mrYs2yNLmo7j0Syl36KmMTKTpq5YqoCDeQcSKAjBJR6OiEIxlittVHGHOn/z0MsP9pTKIwYRq8CqzEAJSehVx0OdgZHTeIp+fYs3mTG/R9zB5hir32mRj7YuLH4qzxE5Td0WJsOhHIe4m1cwxehbPBRwEq/g/3o/YODlC/KJ8IybVc8vYEZwh29S4XtqSvCEHDWlkmh/pFNs5Nib1v5nk3zzyx5ta4+ehvQ8k9xjLoQjkR038INZ2TyTOAg9QhHXfVd9d+4ZFgI7Tx0dEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YChkfVNOdL3VMaanB6SlWK9gpYg5GaeAwI8eBY3OpGA=;
 b=2qcx2+too2sEOQqxuTls1g/NXEohq1BljWPsE6XnDgMnO92Q8r2ekAF4rOjV1RPTbb+lFk8hGWOR6DaCG8BXUZw4GfCwo0aB4dKYVhh3p7iZUsG2XDQV7/MeUlTpJ0e1Hbh5DKkcMfT4WMeBCfvMiBno0XiCQU/pTO2LzxY3GLo=
Received: from DS7PR05CA0052.namprd05.prod.outlook.com (2603:10b6:8:2f::30) by
 MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 01:25:51 +0000
Received: from DS1PEPF00053452.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::b) by DS7PR05CA0052.outlook.office365.com
 (2603:10b6:8:2f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 01:25:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00053452.mail.protection.outlook.com (10.167.23.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:25:50 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:25:50 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 0/7] Alternate Injection: Secure Interrupt Delivery for SEV-SNP Guests - Guest Support
Date: Fri, 6 Nov 2026 01:25:26 +0000
Message-ID: <cover.1793926736.git.huibo.wang@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053452:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: f70d00c8-75c0-42a5-4452-08df3ba4e4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|6133799003|3023799007|10067099003|56012099006|11063799006|261026121527099003|261026130827099003|261028144727099003|261022115727099003|261102123227099003|261009223027099003|261026140227099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261021130227099003|261102130727099003|261021135927099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	AYk3BZpNIRMw/EaDjvh5MnFmahGtxJdTwIdPGjkm14gkJs5Pt2SkAxrQ79RQjK0D4mV/mavH8f8dCQAx8+tmu0DDEli+fFBoOfe2XzZLJKrjxkQV77YJvyTjrr7rM4sJal/uGvssXirJF3NXgSF1YlKLnLS9j1Xw+gkXgYpfRogkSuBEyrFrED5NzaNmVsURb2MQHWQ8j6KkQUOQ9DRaC5Wljs0Bf57lkHSCgO11hhRRs4EUp0hzBb7N+/JIyBibvD8f47/ohtri5eyOQIZF4NDcqbufXjW6ZRVW1hyFLnwirAu1Rq86lZjMTOE+/XbWpcKiHJuO4ANpUwqvojNey3PoNXmuUrBltuYVjifnaLjiLdidp+Tt/QoF9YWgEESvBUX5WSKyWUlR2Adevacu0vJYyFLPiZv7uZn3+GWN7gyse27AOeFzeJEogkM6yfpk/L3YAVsk8pvBXWjjb3HdcxrTP3mUCAILQRdH951a2I8iOW8MfkHt14DQ06JbQhdjcb/rZioQU+mIufLbb3+s4ENcO8RQ8voXhPDgMHK/nRqnPPvMVJmixSp7dROll9cAei6j87/LjdG5yYk/HzC+zY58BGAPn9Bap1wZo5+P+XPD4VrUb9Smm3fXDKB44Ty8ny073OIrExWZWDaDqC52LFll3NNb8O4QzAha8VEs3rwFIXw8ruig+y91cw44WrEiO45ZOgXViu0eFqhn5uIk+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026130827099003)(261028144727099003)(261022115727099003)(261102123227099003)(261009223027099003)(261026140227099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021130227099003)(261102130727099003)(261021135927099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	trAj6KTdybHTXar9pLB0uQ8rNpg3Jzj+hZ67zlP8aSBMZfNLq9FvGVvr/tG26u8FEIBFeyEf1kSooi0Lo1N0i9Xh/lqcGDOWVvOZ8quyWEgAJv1ss2LskD6XhDIcJUOTpbptLmjVyv3uupn/IWy3mcWNPDZZAsNUM+QjqUZzmtMFD3/3F81k5rhBz8cI4BItTQyOZUaqrRf6g71qLa0hLJwALM+3wz3awzQs2S4lNxMrp5ssgVJ7AnDgYNPbuQ26ChfKD+7hFD357DGVl7ymHGc0+6lqCC16IgZhGtZOoNQuDI66/VVgpG2Fc1USAB3I/7X7tSUZTvfV05VH7xjEsiRiPe+gIQxSJah+ytO02oKhfQ3ZaqBrpicyisXO8gIk8ftnudfB62faxYYUoeguu4EwbyyLOgaNQXHfUQRS6mrMndORQ8T5eHD0moO7ThzF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:25:50.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f70d00c8-75c0-42a5-4452-08df3ba4e4e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053452.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318

Hi all,

This revision addresses all version 5 review comments from Sashiko.

Key Changes

1. svsm_apic driver cleanups: Removed the read-only MSR from the SVSM APIC
   filter in svsm_apic_msr_write(), and the write-only MSR from
   svsm_apic_msr_read(). 

2. Clarified and updated the commit message for patch 5 to improve readability
   and context.

Thanks,
Melody

Changelog:
v5
--

This revision addresses all review comments from version 4.

1. As Ard suggested, used a bool as return value for svsm_register_alt_inj()
   instead of int. Adjusted code with it.

2. Added more comments here for better understanding.

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
  x86/sev: Register Alternate Injection protocol during OVMF boot
  x86/sev: Allow the guest to configure interrupt vectors for the
    hypervisor
  x86/sev: Indicate that Alternate Injection is supported in the guest

 arch/x86/Kconfig                        |  14 ++
 arch/x86/boot/compressed/sev.c          |  11 +-
 arch/x86/boot/startup/sev-startup.c     |  20 ++
 arch/x86/boot/startup/sme.c             |   3 +
 arch/x86/coco/core.c                    |   3 +
 arch/x86/coco/sev/core.c                |  48 ++---
 arch/x86/include/asm/msr-index.h        |   4 +-
 arch/x86/include/asm/sev-common.h       |   2 +
 arch/x86/include/asm/sev.h              |  26 ++-
 arch/x86/kernel/apic/Makefile           |   1 +
 arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
 arch/x86/kernel/apic/x2apic_svsm.c      | 253 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h  |  11 ++
 drivers/firmware/efi/libstub/x86-stub.c |  42 +++-
 include/linux/cc_platform.h             |   8 +
 include/linux/efi.h                     |   2 +
 tools/arch/x86/include/asm/msr-index.h  |   4 +-
 17 files changed, 412 insertions(+), 48 deletions(-)
 create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

-- 
2.43.0

