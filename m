Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793942328;
	b=H5WnOZmyy1+Ly6TYrsQEIvINs6b86R321R2y/WD4f4PhVkG5I+y1oaGiJVkaShuX70it
	 tyrG/DbzvIIQHdP8gSmWaSMVok+Qp18gDnYd602mfZBNho7XpzP2aZQnpFt/DZ2etNUnj
	 SokClPp3+n87jr0/cNQvcecQ19NgQLC/TFFHrjZe9sRit7okmFvnfltxqaVrmPJtX6wiO
	 mgYCSHyWGGMfCMrBstwT6FZIDZ6beX1FfSBj2BSfmm4F0dwaa6dJSZqlM6oBD3P0qrCd6
	 XnF5ZT1W1KrcfxDi2IfGHG36aBK3ol9tH8Haa0MKSrUJXMVt0iGN/cbd79Q/eugSWcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942328;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=+0AenLurBCNZxNZCpytE1kSL5XwVUaCdcl90mdHz9Z0=;
	b=Ityc5r+66AI8cqbeBGa1q+/uVk6tliJ/wG2q2NZHLpDe//QY/VIDNY45acU4VnNsJj4/
	 KS/fZ917/cOXYX59kQOT5L6Qr42+T8K8/+VYYh5M/ra/hxhu/AWuEwuwF+QQbCud36hVq
	 GSPU2ied+Pm1U3iek3skPMV1zbDExVkRoS920+WUQljiopLk5wPc3AUHwNsX/erkItTVu
	 xH7YQ24JJNFA1qwGGjjAaRPWlBNqYFckIxq37ABOoDMC3oijztQD247IfmEdYssLfpm54
	 xJq2G/PfJxSf4zQt3zJhNEsGYWrqz/8IWee6Eaam9gLH8wI+2jS2HnBz/zwKop/6dsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Q9Cuyy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.42
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E48606A31B;
	Fri,  6 Nov 2026 05:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Q9Cuyy7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJwG0eI/SFfOSqSuu21SOoXwbaEAlfUukb6K6V7b0jc3oI31V4WnaJpJKk+FNqvtL2v5DqGTBZ8GcfKQOpUk0Rda5NbZ6fhbwCMpcpAb3lLmxKQ0bVpuhYj9ih3D/jAVSewbqvpVo3apYvVm56rjhW/syMTt3SttiMJ53UE8pe0jp02kMDrCBGGsd4aWUDd+0zHoSp7MWmz8AJ0e7ZlBmrwPUPBflBpA+qy6eKKR2GU6j0o7zNWdfUIpzkmEn44KgFBgFLIsiDM4TOCUo6WEe5bWfaqB2cBUaX7izDfK5bU1HbVcWVl3L7cD3wzGXJ3E1/G2IE5l4RfQkUNCee1iFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0AenLurBCNZxNZCpytE1kSL5XwVUaCdcl90mdHz9Z0=;
 b=AA1kNHU0N5cUdm3Rg2Mn1Z+nZap/pYYpvpJvelqa4u8qDG+JzXCDYv7WQ69Uef/BqR4mvxuB1i0vXM/s6UxgkXy/0ndljhF4oviA798jznbduTGECPIIsbXb6AJSgAuKGhPVnSyUBHci52T/6UgfyXul11Z1fmyKUw/bIGhPLMSrpYKwkZ7rLwTlP73SCk3eoydErNKr9H3Dh77n474mjiwiASg5KCPMLhXPNHEH+1ni8L8/4e6TYZWQTXD+xc0XjphMjVttGD/p9fHMPWfS1eAEihzV0VqdtF3hg+LZ4w7mknJhvHRKo0BlW6Z+UIeZGnHvQwYWYpQ6BfnZiF0Maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0AenLurBCNZxNZCpytE1kSL5XwVUaCdcl90mdHz9Z0=;
 b=1Q9Cuyy7foAijHiBELEhUqZHz0frK27sebZudBBwhQzPpM2vShpUiFK+1S1cGj7bpFNrHkKqfkHjn6wRj6UdtDLlh8ZwekT/9dM7HUXuf1A5qROwvIzOVWymrcAKrYzOLMIpuA92ntzIAvFTijZzn4Dtw7qmc6q3C0/BnnAOX60=
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 05:18:40 +0000
Received: from PH4PEPF0000B60F.namprd21.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::78) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 05:18:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60F.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 6 Nov 2026 05:18:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:18:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:18:38 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 23:18:35 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <saravanak@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 1/2] usb: host: ehci-xilinx-of: remove the driver
Date: Fri, 6 Nov 2026 10:48:18 +0530
Message-ID: <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60F:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d962a7-38cf-413d-568a-08df3bc56b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|22082099003|6133799003|18002099003|3023799007|10067099003|261102123227099003|56012099006|11063799006|5023799004|261022075727099003|261022105027099003|261028144727099003|261009223027099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	t6IHyjwgtk9Tg7YjlFXWVImRSzMD6Af8ybLPn4YTskNxRnphPZD2kA4WaEcamntqEcbrrpojuDhT8n58/rMniohGfvRAqt7bcY4vu4KfF0bi1RsCgd0TKnF8mSh2okieCIuQHR/y2lXVD5VCP6Uy3/ZCVJZlDj8q/n6UjD6P2msijPCE42Kra8FDiEnhEPA61Zlk9ey9Tm950O4ITBRm24FmXpOFTFPovjervM1wqLGVsFkrYIjJmYo07pXIIbfjr1VDTDAaiqCvqGkPkenlag3mcfG5a+ctUga48ZyJNrkevVtv2zsXyPi17OUNhFRiIumW8tQVvGMYlptP4+MrcN/DRVHQ45ND4tJAwJQLvX5vMOzjLlO+05Ol23aVy1AHRpOyccsfFAdLkTcv9rIsbE3H1olttZa0nlJUoBAQCyhTBTuwsdsk3QAdA/GQ1HDkLF/bxY1N4o+NnqEebKtLC+dk+fjYWJxnrNhPbxMnyzx3HC/QMPyso4K8yd+Wo43nFHyxR42h9Ccd55gFMjPGuxoUMboXDQQJBysOw0fs10uJbJNyHDDpqh7m9aMau+mRB+xI6J0TLRzEaBdut99UXbCiZlbK4Fu9jB5EmHDCxWRuXV/OSnzIpD96WUITrRWORfoph9Zbr6WinUGME1ABj1Ph2oot8k2aMzFzH2M354d52jz2JaX3y6/vSGAtUWObuz+Do7GysVnnG5qWoxj/Uw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(22082099003)(6133799003)(18002099003)(3023799007)(10067099003)(261102123227099003)(56012099006)(11063799006)(5023799004)(261022075727099003)(261022105027099003)(261028144727099003)(261009223027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	89wPwnYrmouO0JSx9ITBG7W+nsuDBqRwTbw0V0WcvLolkovkX5TTuFFUSMK+Z64Xa4SdyWR99UDZkUGikzjMingKFmH9cj2U8AkFOQkQ0qujQtSnR2rmZPWqPOc+afS/2IYYg/ap9m/mwz3+U4c2ktIewvXZZ4ZFCEdK8YIplTr9erosU6pprWtfCPNHmDV/tBRVgbDqdeRYcO6KURjPoBTZU1JfrK2/j3IxTeQ2VEDhqTg8W3n4XIEf0Q7F/2qDcZXXVUWRITJPkAzk4k/zKWghh7X5XNAkwUI+ALzum2H6HJGN88n1eNjhmBT/F0qbfAG3QG7KkdbhGhNoOX7Xmccz0ETlrXFhbRs+BIZWlxy4V345roNkHwnb8MQSdLSiqjaClB4emYxY26NGi4ndu8c8hrXbEdHRxU3NvGMrxPM2jI92XdOhB35F6fHsnApK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:18:39.9481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d962a7-38cf-413d-568a-08df3bc56b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407

The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
MicroBlaze FPGA designs.

This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
Suite, both of which were discontinued by Xilinx years ago. Furthermore,
modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
for the legacy PLB (Processor Local Bus) architecture used by this core.
As a result, no new hardware designs can be built using this IP.

Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
compatible string and no defconfig enables CONFIG_XPS_USB_HCD_XILINX.
The compatible was never documented in a schema binding.

It is also one of the few remaining users of the deprecated glue model
where the .c file is #included into ehci-hcd.c rather than built as its
own object.

Given the complete obsolescence of the supporting hardware development
tools and the lack of upstream users, remove the dead driver.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Add Alan and Michal acked /reviewed tags.
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

