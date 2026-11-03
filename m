Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729868;
	b=2sZcC7AwyZBeGRa7gjROi3Cj8xHpRG2AVLt5V27znrAOILgS4uOFvZ6wtlKVr2Uq+3tH
	 3qTkvbH2JyQRpoEvzxy9Wph4lKbHAUrho9ijE3KTMmfITCOPzx0MSueTmk22yHTirvbWS
	 3qQsi4Zj9gfrWa69C7tkhjXXXBnpLVYefYPY7vLKN9MJriYnheQ2wrCJS8/As9HPFyDTn
	 DXJxi5SKWfnMMoldP6P9e4tJE67EdCoVyxJ28R99L8kqcUODvEetDlrb4sjUE+V9qeamU
	 zOOm6Mbcj9cfW1yTwSwHfqBN5Dy6YaplJJZjrtKpGtvdltqZfGl/IBYbNQXA+XbuwVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729868;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=nAY0mN4ePeDJpvyfjyvP42Hy+cpGroSpFYr9jrHC9X4=;
	b=bIx2DI2Sp0TpAVfEXjfUldMtt9wc2n4xa78pkBV7gakJlCfQYbQt0BMTZWuqd7VFwBlN
	 eOmCPn+6xQzaLINc3wkq030OwDA54k9WyeO/KPAixzx+y5P4o5Qf16LCqD0tVvHPpCns2
	 LT7Y0HaAOJ1UuqxC5hZegrcWQYflqTSLrRtnYre2uq3AnnbRHUmLYK3P+KpV1fRKh+UG5
	 PVfholaEkwV+zTPvkLO9JGO+QXffTzLwnae2v88Qqzjdf434uwB0Um6agt3ML50Y4sG9p
	 HDf0rr2QTAJjROOXZE0GbivD/hkPHFq1tUPj17b/9dM2em6gJi6fS21IaRoq19JRT9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D3pDzPua;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.50
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55907606A324;
	Tue,  3 Nov 2026 18:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55907606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D3pDzPua
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUZ9QxWZlaLMI7hOCHjsHGZ8z/6v6ZEr5iQgtyd7kj0C5oh6u9ngLPe6wIS7e/5gJt6C8see9C0bTFJSEZrMl9xKXb//Iya7Y0/hbCYHPpnmMA1JiYRLgCEPMZUSx4vWJhLQ92PkIEk9W16Cd1GwiEBEWqpDx8qasU7ikUpKZZ3FiHNTEjwLx8luStJYmpyKAV/D9N+Fp7+gkQorsfNHNumvWxTCk5D+/aYE80kkwNeMKgdjp5Ny0pB0fh/+N4hdLyfxjVsOKE05FyoDpjtjj2iw63dgYuuzCxs/oQTjsy8FDEMDHBg62ARLFGOgnCi8HVVMP9+1bQBaUoZosh9ArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAY0mN4ePeDJpvyfjyvP42Hy+cpGroSpFYr9jrHC9X4=;
 b=HtCi35Jlz6EzxdqIuyfPVQaYV+BENhO76+xisqQLO5TAYYLps3M6OUIRKHdE0BXH+deiYTjF7l7IuVgJfQ1CIYEtSwHuDMCdedyWj5FWgGJNCK4fkjduTXmkoWDu3oE7cQPrjINBhxPWDiuuXFrldZNLBvfTyvEkADc1b+w/4Q9lpKG3sNc2BYbE8SBIm9c5dLesI1Spw6dymEo5a+wsBcp01kn5QniMOtDuaw+wrdUcgIbExKpHpkPEaMcNEoPDcAg4tZkuDR8x/SjXzZa5apBruA5jRCqMv5wGxJuQDSXWgZpNtzIpMdhv5d/xDL464bZB6XWhCFzfuCpeEHgkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAY0mN4ePeDJpvyfjyvP42Hy+cpGroSpFYr9jrHC9X4=;
 b=D3pDzPuaiWSEcJ/jLQyOgL9NMwbBG+jNHi4EGVJI6IttReqfS5QB4A4PMvt9yOo1nbQ0WdI1Xx5mlzSTFGxJ2rKh72rTSLajLLn+EDCVBepXQM6OjQe6YDDS/e0Uo6zccjqxeGc2B12puLUI4qDSVepjsyKLiFAEG7XJxU6DG/8=
Received: from MW4PR03CA0287.namprd03.prod.outlook.com (2603:10b6:303:b5::22)
 by SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 18:17:40 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::a7) by MW4PR03CA0287.outlook.office365.com
 (2603:10b6:303:b5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 18:17:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 18:17:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 12:17:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 12:17:39 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 12:17:36 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
	<michal.simek@amd.com>, <robh@kernel.org>, <saravanak@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Date: Tue, 3 Nov 2026 23:47:21 +0530
Message-ID: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SN7PR12MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7e8713-59cc-4a6e-08d6-08df39d6bf3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|5023799004|11063799006|261026121527099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	S1+C1ug7arZ5ZRFAPa/VTnffDVj4OC573K0UD7LUd14B8gXCk6ZZx4xbMEm6I6YqWwF+2sJ2K+bIwXEMbQUjykPDq/57S4bLIP7Jh+/4LTk8ktl0/BQo3L16j9OAzVV5Ni0SAMGBkWbtMkXqVsRMmw/VHV9+oHwX+W5hQv7OcE9BmWkl5A3qnPguypDIvuLsLaO7yhHWf1VR6ZguSfZw79/aKyis2PUQeRFEO4luawF8r4erv5Vvtmr3LL0+kHwkv3Y6QAV/u5O2LbSsaNUOZGKyqPwAj0agDWWmm4UEjYt1stBOJgei9apSRzebi+XI0ukrABVNUy/UkPv1f6rXY62uaOW+QR0qikkvnNrdw1JiqyjaWjJlzT3OiMDBIONme2IBN58NEXmEkWrEHUIi/cdDDJ9QDr91FkZlueSJcht0KEWMhGvA/FdYtAPJFC1Ks+xUtPO2OD5iVKhCMjlNcKsHCcCYC4Lccqt5KYGKg8aYPr5UkJDZoL1x/qGfJCd3gBpqFZ0DeSO01wG598ACgq8+hdNFffZHgLWc3MNf2jsV8WVQJ9GDKxHTTyte0s5472bsyWECRpiK3NVutQ5YdrAaGzLfp8z3GvRTd9o6U15/qKWh38V8UphkgXum3E0XsT4RsnvQxJPUPRKg/5PDeHtUV29rRvGixhAMBlP5VR2bn1xa1Um3+vGV2kNBjBMByAi+vHgoZkBDRg8ebrPg2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(5023799004)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cZqTuVA+3z8PecXKncmkm1XjbNnh3dGcG7/bzIm4FbuBynLaRCBUuES606HGv4l4+E6zsqzO0KwXfgh6oRINx76dwO2x3Qw9tehIoOMiTcaUecbXo6EA8kOeR7EU2AAvJlKaJ84GQQ1PxEo/uohAX4qR5Th00HzbtMLuzO1H7otwVnmeFfVlU9xENAgYJAYwPvrB7H5RQENGCnl2ChdpE8S9a+hzZVFNTzf1NBpKfbZydFodBxaJHauBOfI0YVZMz9aIIp3jGKEEQwwy/NRlOC8s7MkuMAHwmqvLRM/vu+OuDQVMSfciyARGF4UL0yF3mw9wy4w4TfKJlsEJfmVozqFbwf2A+SFvTLOV6X+gPpTI3NHNOd8BHiOCbMRbG6Z4SifmdbloqlYhFzEJhxlitXxptJsHpqez00TH8+rxAyRY8BC5H85WsvZ2K6C0BtJt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 18:17:40.2912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7e8713-59cc-4a6e-08d6-08df39d6bf3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932

The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
MicroBlaze FPGA designs.

This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
Suite, both of which were discontinued by Xilinx years ago. Furthermore,
modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
for the legacy PLB (Processor Local Bus) architecture used by this core.
As a result, no new hardware designs can be built using this IP.

Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
the compatible was never documented as a binding.

It is also one of the few remaining users of the deprecated glue model
where the .c file is #included into ehci-hcd.c rather than built as its
own object.

Given the complete obsolescence of the supporting hardware development
tools and the lack of upstream users, remove the dead driver.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/host/Kconfig          |  11 --
 drivers/usb/host/ehci-hcd.c       |   7 -
 drivers/usb/host/ehci-xilinx-of.c | 229 ------------------------------
 scripts/dtc/dt_to_config          |   8 +-
 4 files changed, 2 insertions(+), 253 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-xilinx-of.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 05a88969a6a0..471d203b60a5 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -224,17 +224,6 @@ config USB_EHCI_PORT_SPEED_HOOK
 	depends on USB_EHCI_ROOT_HUB_TT
 	# Used for hosts with controller-specific port speed reporting
 
-config XPS_USB_HCD_XILINX
-	bool "Use Xilinx usb host EHCI controller core"
-	depends on (PPC32 || MICROBLAZE)
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_EHCI_BIG_ENDIAN_MMIO
-	help
-		Xilinx xps USB host controller core is EHCI compliant and has
-		transaction translator built-in. It can be configured to either
-		support both high speed and full speed devices, or high speed
-		devices only.
-
 config USB_EHCI_FSL
 	tristate "Support for Freescale on-chip EHCI USB controller"
 	select USB_EHCI_ROOT_HUB_TT
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 75f780ec3ba0..7842f8a752d7 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1331,10 +1331,6 @@ MODULE_LICENSE ("GPL");
 #include "ehci-ppc-of.c"
 #endif
 
-#ifdef CONFIG_XPS_USB_HCD_XILINX
-#include "ehci-xilinx-of.c"
-#endif
-
 #ifdef CONFIG_SPARC_LEON
 #include "ehci-grlib.c"
 #endif
@@ -1346,9 +1342,6 @@ static struct platform_driver * const platform_drivers[] = {
 #ifdef CONFIG_USB_EHCI_HCD_PPC_OF
 	&ehci_hcd_ppc_of_driver,
 #endif
-#ifdef CONFIG_XPS_USB_HCD_XILINX
-	&ehci_hcd_xilinx_of_driver,
-#endif
 #ifdef CONFIG_SPARC_LEON
 	&ehci_grlib_driver,
 #endif
diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
deleted file mode 100644
index 1d16cfefabd7..000000000000
--- a/drivers/usb/host/ehci-xilinx-of.c
+++ /dev/null
@@ -1,229 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * EHCI HCD (Host Controller Driver) for USB.
- *
- * Bus Glue for Xilinx EHCI core on the of_platform bus
- *
- * Copyright (c) 2009 Xilinx, Inc.
- *
- * Based on "ehci-ppc-of.c" by Valentine Barshak <vbarshak@ru.mvista.com>
- * and "ehci-ppc-soc.c" by Stefan Roese <sr@denx.de>
- * and "ohci-ppc-of.c" by Sylvain Munaut <tnt@246tNt.com>
- */
-
-#include <linux/err.h>
-#include <linux/signal.h>
-
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-
-/**
- * ehci_xilinx_port_handed_over - hand the port out if failed to enable it
- * @hcd:	Pointer to the usb_hcd device to which the host controller bound
- * @portnum:Port number to which the device is attached.
- *
- * This function is used as a place to tell the user that the Xilinx USB host
- * controller does support LS devices. And in an HS only configuration, it
- * does not support FS devices either. It is hoped that this can help a
- * confused user.
- *
- * There are cases when the host controller fails to enable the port due to,
- * for example, insufficient power that can be supplied to the device from
- * the USB bus. In those cases, the messages printed here are not helpful.
- *
- * Return: Always return 0
- */
-static int ehci_xilinx_port_handed_over(struct usb_hcd *hcd, int portnum)
-{
-	dev_warn(hcd->self.controller, "port %d cannot be enabled\n", portnum);
-	if (hcd->has_tt) {
-		dev_warn(hcd->self.controller,
-			"Maybe you have connected a low speed device?\n");
-
-		dev_warn(hcd->self.controller,
-			"We do not support low speed devices\n");
-	} else {
-		dev_warn(hcd->self.controller,
-			"Maybe your device is not a high speed device?\n");
-		dev_warn(hcd->self.controller,
-			"The USB host controller does not support full speed nor low speed devices\n");
-		dev_warn(hcd->self.controller,
-			"You can reconfigure the host controller to have full speed support\n");
-	}
-
-	return 0;
-}
-
-
-static const struct hc_driver ehci_xilinx_of_hc_driver = {
-	.description		= hcd_name,
-	.product_desc		= "OF EHCI",
-	.hcd_priv_size		= sizeof(struct ehci_hcd),
-
-	/*
-	 * generic hardware linkage
-	 */
-	.irq			= ehci_irq,
-	.flags			= HCD_MEMORY | HCD_DMA | HCD_USB2 | HCD_BH,
-
-	/*
-	 * basic lifecycle operations
-	 */
-	.reset			= ehci_setup,
-	.start			= ehci_run,
-	.stop			= ehci_stop,
-	.shutdown		= ehci_shutdown,
-
-	/*
-	 * managing i/o requests and associated device resources
-	 */
-	.urb_enqueue		= ehci_urb_enqueue,
-	.urb_dequeue		= ehci_urb_dequeue,
-	.endpoint_disable	= ehci_endpoint_disable,
-	.endpoint_reset		= ehci_endpoint_reset,
-
-	/*
-	 * scheduling support
-	 */
-	.get_frame_number	= ehci_get_frame,
-
-	/*
-	 * root hub support
-	 */
-	.hub_status_data	= ehci_hub_status_data,
-	.hub_control		= ehci_hub_control,
-#ifdef	CONFIG_PM
-	.bus_suspend		= ehci_bus_suspend,
-	.bus_resume		= ehci_bus_resume,
-#endif
-	.relinquish_port	= NULL,
-	.port_handed_over	= ehci_xilinx_port_handed_over,
-
-	.clear_tt_buffer_complete = ehci_clear_tt_buffer_complete,
-};
-
-/**
- * ehci_hcd_xilinx_of_probe - Probe method for the USB host controller
- * @op:		pointer to the platform_device bound to the host controller
- *
- * This function requests resources and sets up appropriate properties for the
- * host controller. Because the Xilinx USB host controller can be configured
- * as HS only or HS/FS only, it checks the configuration in the device tree
- * entry, and sets an appropriate value for hcd->has_tt.
- *
- * Return: zero on success, negative error code otherwise
- */
-static int ehci_hcd_xilinx_of_probe(struct platform_device *op)
-{
-	struct device_node *dn = op->dev.of_node;
-	struct usb_hcd *hcd;
-	struct ehci_hcd	*ehci;
-	struct resource res;
-	int irq;
-	int rv;
-	int *value;
-
-	if (usb_disabled())
-		return -ENODEV;
-
-	dev_dbg(&op->dev, "initializing XILINX-OF USB Controller\n");
-
-	rv = of_address_to_resource(dn, 0, &res);
-	if (rv)
-		return rv;
-
-	hcd = usb_create_hcd(&ehci_xilinx_of_hc_driver, &op->dev,
-				"XILINX-OF USB");
-	if (!hcd)
-		return -ENOMEM;
-
-	hcd->rsrc_start = res.start;
-	hcd->rsrc_len = resource_size(&res);
-
-	irq = irq_of_parse_and_map(dn, 0);
-	if (!irq) {
-		dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
-			__FILE__);
-		rv = -EBUSY;
-		goto err_irq;
-	}
-
-	hcd->regs = devm_ioremap_resource(&op->dev, &res);
-	if (IS_ERR(hcd->regs)) {
-		rv = PTR_ERR(hcd->regs);
-		goto err_irq;
-	}
-
-	ehci = hcd_to_ehci(hcd);
-
-	/* This core always has big-endian register interface and uses
-	 * big-endian memory descriptors.
-	 */
-	ehci->big_endian_mmio = 1;
-	ehci->big_endian_desc = 1;
-
-	/* Check whether the FS support option is selected in the hardware.
-	 */
-	value = (int *)of_get_property(dn, "xlnx,support-usb-fs", NULL);
-	if (value && (*value == 1)) {
-		ehci_dbg(ehci, "USB host controller supports FS devices\n");
-		hcd->has_tt = 1;
-	} else {
-		ehci_dbg(ehci,
-			"USB host controller is HS only\n");
-		hcd->has_tt = 0;
-	}
-
-	/* Debug registers are at the first 0x100 region
-	 */
-	ehci->caps = hcd->regs + 0x100;
-
-	rv = usb_add_hcd(hcd, irq, 0);
-	if (rv == 0) {
-		device_wakeup_enable(hcd->self.controller);
-		return 0;
-	}
-
-err_irq:
-	usb_put_hcd(hcd);
-
-	return rv;
-}
-
-/**
- * ehci_hcd_xilinx_of_remove - shutdown hcd and release resources
- * @op:		pointer to platform_device structure that is to be removed
- *
- * Remove the hcd structure, and release resources that has been requested
- * during probe.
- *
- * Return: Always return 0
- */
-static void ehci_hcd_xilinx_of_remove(struct platform_device *op)
-{
-	struct usb_hcd *hcd = platform_get_drvdata(op);
-
-	dev_dbg(&op->dev, "stopping XILINX-OF USB Controller\n");
-
-	usb_remove_hcd(hcd);
-
-	usb_put_hcd(hcd);
-}
-
-static const struct of_device_id ehci_hcd_xilinx_of_match[] = {
-		{.compatible = "xlnx,xps-usb-host-1.00.a",},
-	{},
-};
-MODULE_DEVICE_TABLE(of, ehci_hcd_xilinx_of_match);
-
-static struct platform_driver ehci_hcd_xilinx_of_driver = {
-	.probe		= ehci_hcd_xilinx_of_probe,
-	.remove		= ehci_hcd_xilinx_of_remove,
-	.shutdown	= usb_hcd_platform_shutdown,
-	.driver = {
-		.name = "xilinx-of-ehci",
-		.of_match_table = ehci_hcd_xilinx_of_match,
-	},
-};
diff --git a/scripts/dtc/dt_to_config b/scripts/dtc/dt_to_config
index 70d6d5f06bdc..3f9e751a3285 100755
--- a/scripts/dtc/dt_to_config
+++ b/scripts/dtc/dt_to_config
@@ -116,13 +116,12 @@ $num_pr_flags = $pr_flag_pos_config_test_fail + 1;
        'hardcoded_no_driver'                   => ['no_config'],
 
        # drivers/usb/host/ehci-ppc-of.c
-       # drivers/usb/host/ehci-xilinx-of.c
-       #  are included from:
+       #  is included from:
        #    drivers/usb/host/ehci-hcd.c
        #  thus the search of Makefile for the included .c files is incorrect
        # ehci-hcd.c wraps the includes with ifdef CONFIG_USB_EHCI_HCD_..._OF
        #
-       # similar model for ohci-hcd.c (but no ohci-xilinx-of.c)
+       # similar model for ohci-hcd.c
        #
        # similarly, uhci-hcd.c includes uhci-platform.c
 
@@ -131,9 +130,6 @@ $num_pr_flags = $pr_flag_pos_config_test_fail + 1;
        'drivers/usb/host/ohci-ppc-of.c'        => ['CONFIG_USB_OHCI_HCD',
                                                    'CONFIG_USB_OHCI_HCD_PPC_OF'],
 
-       'drivers/usb/host/ehci-xilinx-of.c'     => ['CONFIG_USB_EHCI_HCD',
-                                                   'CONFIG_USB_EHCI_HCD_XILINX'],
-
        'drivers/usb/host/uhci-platform.c'      => ['CONFIG_USB_UHCI_HCD',
                                                    'CONFIG_USB_UHCI_PLATFORM'],
 
-- 
2.44.4

