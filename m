Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959940;
	b=sguNbjkev/dz21f0Aj7+h+donH+X52RYhPXwNxzqt0rO5+OvY4zFenYydPUgvKYeGreD
	 ZnO/J6Hi8zp9ml4hz8IuIdktxzgbXXOidPbX3XHIdl/AP998zBh+wXSGtfq32x9x4AHUo
	 Z9db9akIHZrURdxU8SGlyD90TAH+cHvo5HUxbL5LMyPcDkXqoPKj+eNJydPLclFq5eA2V
	 UgjOYMYGMTCjNafZDPWPCfJ1Iir2cgGg6+Glh6mjfv1mjrpHNEm8Rp2UU9hLzFd8tzdSN
	 aVIlTz0S9AI3DaYEmfK/MdmxVBlawEh8NJsRBb8r9Rpk49KvpI9afNzEm4PdaXsRqjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959940;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FmudOikpHmeFVVjsiJ6c59ke/T9iuUkncQxbxGaHC7c=;
	b=OYB5DRVUJqnE6z8E3ZktVPosTpmlwUtraSn924v6Yh7E1Yiu5ox4Mxckz+4MeUlRe7MD
	 qgy9RY/1fZc0sVIMVQD5zsgLe0AG8ilj49RWVX61CPLqTmZOYWnoJ1R3qF1BxA2sjvfJj
	 4XPHPOweFZNHC0bWtljMotFFl7Qeu5QwAS2RFtIYNRQ4VfXZuJz7qjDiSYjni0LKA7rOr
	 WNJ4w8ZaspkGUzBuo2RhZsVXopDxp+msBKKToST++UrPrrZKwA1ueH3DE8wtwU7FKKSSH
	 zy4Fe0eKwsKBQZMSbsW5fJphddnfJl4DIoGvoGPvEAG98bTfH3jJIZeX5+5K3KflXkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.73
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023073.outbound.protection.outlook.com [40.107.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C6606A32E;
	Fri,  6 Nov 2026 10:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66C6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP4EgzL/vt6qfWwQ7ycEJLpS2EZbGYYcBfqfrQVy/fjldhq3qriQNWmkUylwV/EjDnU+xNPxtETn1kg6dQXm3YZ87KfuM3zVWQa9/c7C5jYmzjKode94WQGgLAZlBTQi+45ZMpevWTWvWlwNUhoLrHvu2lInoVpH2POmcxPLnDu4YZC75XemJNTmemHDf3Tn4uVwOVkMs24lXsWsKbNvSEbJk6/yweQEfCbNXsix0BXQ86jixnyMLiZQnGYAFV9mgsU5bRNZXH8YIIJVE279YIhZE4w159D3iWuZ6oZ+jX+Uy61Ozq5jf+imBMDyKe0ORuZcQnKawsw8EqaWa4xP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmudOikpHmeFVVjsiJ6c59ke/T9iuUkncQxbxGaHC7c=;
 b=fua4nlau6r2ZIFfozETFCAMCw34dJFh+JsK72JStfwXuw+fVB8epbmj5xfmpwhju8EY3WxcHntBC9pgBZJP0haTC9Se++6pIDqS+rjFujdD3NYqlbHAQLgfXll3VPFcaAafMio1+YqCozvxOHevqsvJhZTE8T2OPnGmEbE2MqXecVhL+T6hgZnulK/E73DS4mtEFUWLhIVPYVNb6imiyyA6RSs56xVY1G1LgekQYraKWJ5xae9NdWHO0+re+YTRfoonQ2eKO8i12RNUfhAAh5C6OeVA9f6EGYoBDUvj6mwDi4iQime3EWXmP0xRbRvEWXPzJKaYX+ptxVmDk6s+MGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0012.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::18)
 by OSNPR06MB8590.apcprd06.prod.outlook.com (2603:1096:604:492::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 10:12:15 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::38) by PUVP216CA0012.outlook.office365.com
 (2603:1096:301:16f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:12:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:12:14 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 779304102E6A;
	Fri,  6 Nov 2026 18:12:12 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	hongliang.yang@cixtech.com
Subject: [PATCH v7 2/2] usb: cdns3: Add CIX Sky1 glue driver
Date: Fri,  6 Nov 2026 18:12:10 +0800
Message-ID: <20261106101210.1059256-3-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|OSNPR06MB8590:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a76bc816-337a-47e1-ce3a-08df3bee6e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|1800799024|22082099003|18002099003|10067099003|921020|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261009220027099003|261009223327099003|56012099006|261021121427099003|261022105027099003|261009221727099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	6OEg3Q7MoaJu6/eqTv7JQqTYN8BoMiiI/OV9U1WJiXU0oAsZYHlwIqFDo0+QL+7XnYnF8s7k+pQ5qC1CN+NXUzhuDdPByd5s7B/Udl8X8gm27hj7Y3zrbTR+8td3d3OspUxOd1MZmg4hls3Kw4M/lONkntAbBuq2q0lNvCYRCaalb/t34tV0y1+lZr1iFhehow0BL4fF72+bvfjldmf6i7xR0fmwgIw8Fm/Q+qyT4U9ffzv9EY26D11egDqakGktg2s0ydGZ5nes9ftkFLHYaY83aIgYbW4+WvWBmVmRHZg/Dkcn0UjSZz2L9DRCfU8d/nOUBs0ZOOc03UVJS4Zxzb6TdmPxKtx41PkDfSddJtvme0kAjH3eWb4p2pB+CK/Ltj7D3Zvf7V1ksiYjHk+uWUK8Yy/EqvRGFrtTz12TZIOZh7jhPC6OOCgUUtFKREIAoybn508M9UVABySwgYqMvuU2UNV6K/BHFOK+aBjmM+KCQgTzAiASteXOr0yiPpue6Jo0uRfRInierFTYLnxBGJuDd9zDWwXWh93PWJhKDezNXD5bZGuxppHJdydwW3FjNgNkDmP3d6nkIDZST+ZoUJrpIsJHUNGyvn0KoTUMi3Ugsz633A/eisQ70tr8cklk///xR+2LEsh5UW99I3hoabu3yUGAlSSx5pbrY0aSRMINDRrFoUSaqRpADhzPA9tLrlRj88wjFY2PvqYzB2dFIGM/R9Lp/kBdW+l2gn7WxIlKAOXMEQodD7MPJEdtQ5kr
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(921020)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261009220027099003)(261009223327099003)(56012099006)(261021121427099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KaP2XYGlPy0QCRAXOT1noAILRnZ3RZV0XBy+GyG1YgqDvwlwldy68qHpTU/u85uklfKKN4l7yBxkzChSYimd1AhChkZMX5fVq6aiOS2R+y6bqFuv9JN0ngGo7/Pa1tUQy1FAw0NI6Gr6LUEf+/1MKSIQ+arv0xU1K/LKo+wAwI8RDndblwjx68z1hrsbtta0chMe5dz/XntGn2e/3igT+P4TRfj//xH0hTAIeIPvB3xOYZEaxbajp2OSdVHlb2tA0c+p85lQsjKJ9qxLa9AxzoPPB+ky4h0E85CTYDhtpQ4FwUF/CllnMdON6Uks5gfbeQaR2FQH93KyQ4bq6dB6tzrOHqZf/s9Obh65UhKh8G1/+1Erl728zBHWa084Fg8q4RPuLisL7gvGt2sVSFUEt+9UrnCOjtr0A88c86ixIpKamN11Aenf+yebbCUu7GW8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:12:14.6143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76bc816-337a-47e1-ce3a-08df3bee6e4d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8590

Add a glue layer driver for the Cadence USBSSP controller integrated in
the CIX Sky1 SoC. The driver manages the controller clocks, resets and
the mode strap controls located in the Sky1 S5 system controller, and
writes the AXI cache attributes and polls the AXI clock status of its
own controller in the RCSU block.

The register range is mapped with devm_ioremap() instead of
devm_platform_ioremap_resource(): the two Type-A controllers share one
RCSU block and their register ranges overlap, so reserving the region
would make the second controller fail with -EBUSY. The offset of the
AXI clock status register inside the range is taken from the
per-compatible match data, as it differs between the Type-A and Type-C
register blocks of the SoC.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
Changes in v7:
- Map one register range taken from the first reg entry, instead of two
  ranges selected with reg-names.
- Map it with devm_ioremap() because the ranges of the two Type-A
  controllers overlap.
- Take the offset of the AXI clock status register from the match data.

Changes in v6:
- Read the USB mode strap register offset and bit position from the
  cix,usb-syscon phandle arguments instead of relying on the usbN
  aliases and the undocumented id property.
- Use dev_err_probe() in the probe error paths.
- Drop the unused over-current GPIO handling and the unused dr_base and
  cdnsp_pdev fields.
- Do not disable the clocks before they have been acquired.
- Drop the redundant depends on USB_CDNS3 and fix the compatible name
  in the Kconfig help text.
---
 MAINTAINERS                    |   1 +
 drivers/usb/cdns3/Kconfig      |  13 +
 drivers/usb/cdns3/Makefile     |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c | 710 +++++++++++++++++++++++++++++++++
 drivers/usb/cdns3/cdnsp-sky1.h | 100 +++++
 5 files changed, 825 insertions(+)
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5144d02fc998..3c609d371306 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
+F:	drivers/usb/cdns3/cdnsp-sky1.*
 K:	\bcix\b
 
 ARM/CLKDEV SUPPORT
diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 39ad23d1ada8..678cedd8de97 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -77,6 +77,19 @@ config USB_CDNSP_PCI
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdnsp-pci.ko
 
+config USB_CDNSP_SKY1
+	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
+	depends on ARCH_CIX || COMPILE_TEST
+	default USB_CDNS3
+	help
+	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
+	  (device tree compatible cix,sky1-usbssp). It enables clocks and
+	  resets from the SoC, then uses the shared cdns3 platform core
+	  (cdns.ko).
+
+	  If built as a module, the module is named cdnsp-sky1.ko and must be
+	  loaded after the cdns core module when both are loadable modules.
+
 config USB_CDNS3_TI
 	tristate "Cadence USB3 support on TI platforms"
 	depends on ARCH_K3 || COMPILE_TEST
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index b2e4ba6a49a3..ab813aaf9940 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
+obj-$(CONFIG_USB_CDNSP_SKY1)			+= cdnsp-sky1.o
diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky1.c
new file mode 100644
index 000000000000..65c2c692d2a3
--- /dev/null
+++ b/drivers/usb/cdns3/cdnsp-sky1.c
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * cdnsp-sky1.c - CIX Sky1 glue for Cadence USBSSP DRD controller
+ *
+ * Copyright (C) 2026 CIX Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "cdnsp-sky1.h"
+#include "core.h"
+
+static const char *cix_usb_clk_names[CIX_USB_CLK_NUM] = {
+	"sof",
+	"axi",
+	"lpm",
+	"apb",
+};
+
+static int cdnsp_sky1_set_mode(struct device *dev, int mode)
+{
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	return regmap_update_bits(data->usb_syscon, data->strap_offset,
+				  GENMASK(data->strap_bit + 1, data->strap_bit),
+				  mode << data->strap_bit);
+}
+
+/**
+ * cdnsp_sky1_clk_enable_all() - enable all clocks for usb controller
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static int cdnsp_sky1_clk_enable_all(struct device *dev)
+{
+	int i, ret = 0;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_NUM; i++) {
+		cix_usb_clks[i] = devm_clk_get(dev, cix_usb_clk_names[i]);
+		if (IS_ERR(cix_usb_clks[i])) {
+			ret = dev_err_probe(dev, PTR_ERR(cix_usb_clks[i]),
+					    "could not get %s clock\n",
+					    cix_usb_clk_names[i]);
+			goto err_usb_clks;
+		}
+		ret = clk_prepare_enable(cix_usb_clks[i]);
+		if (ret) {
+			dev_err(dev, "%s enable failed:%d\n", cix_usb_clk_names[i], ret);
+			goto err_usb_clks;
+		}
+	}
+	dev_dbg(dev, "enable sky1 USB clock done\n");
+	return ret;
+
+err_usb_clks:
+	while (--i >= 0)
+		clk_disable_unprepare(cix_usb_clks[i]);
+	return ret;
+};
+
+/**
+ * cdnsp_sky1_clk_disable_all() - disable all clocks for usb controller
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static void cdnsp_sky1_clk_disable_all(struct device *dev)
+{
+	int i;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_NUM; i++)
+		clk_disable_unprepare(cix_usb_clks[i]);
+};
+
+/**
+ * cdnsp_sky1_clk_enable_resume() - enable the clocks that are turned
+ * off while suspend
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static int cdnsp_sky1_clk_enable_resume(struct device *dev)
+{
+	int i, ret;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_OFF_NUM; i++) {
+		ret = clk_prepare_enable(cix_usb_clks[i]);
+		if (ret) {
+			dev_err(dev, "failed to enable clock %s: %d\n",
+				cix_usb_clk_names[i], ret);
+			goto err_usb_clks;
+		}
+	}
+	return 0;
+
+err_usb_clks:
+	while (--i >= 0)
+		clk_disable_unprepare(cix_usb_clks[i]);
+	return ret;
+};
+
+/**
+ * cdnsp_sky1_clk_disable_suspend() - disable the clocks which are not
+ * needed when suspend
+ * @dev:	Pointer to the device of platform_device
+ *
+ */
+
+static void cdnsp_sky1_clk_disable_suspend(struct device *dev)
+{
+	int i;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct clk **cix_usb_clks = data->cix_usb_clks;
+
+	for (i = 0; i < CIX_USB_CLK_OFF_NUM; i++)
+		clk_disable_unprepare(cix_usb_clks[i]);
+};
+
+static u32 sky1_rcsu_read_status(struct cdnsp_sky1 *data)
+{
+	return readl(data->rcsu_base + data->rcsu_status_offset);
+}
+
+static int sky1_rcsu_handshake(struct cdnsp_sky1 *data, u32 mask, u32 done,
+			       u64 timeout_us)
+{
+	u32	result;
+	int	ret;
+
+	ret = readl_poll_timeout(data->rcsu_base + data->rcsu_status_offset,
+				 result,
+				 (result & mask) == done ||
+				 result == U32_MAX,
+				 10, timeout_us);
+	if (result == U32_MAX)		/* card removed */
+		return -ENODEV;
+	return ret;
+}
+
+static int cdns_sky1_platform_suspend(struct device *dev,
+				      bool suspend, bool wakeup)
+{
+	struct cdns *cdns = dev_get_drvdata(dev);
+	struct platform_device *xhci_dev = cdns->host_dev;
+	struct usb_hcd  *hcd;
+	struct device *parent = cdns->dev->parent;
+	struct cdnsp_sky1 *data = dev_get_drvdata(parent);
+	u32 value;
+	int poll;
+	int ret = 0;
+	int count = 3;
+
+	data->wakeup = wakeup;
+
+	if (cdns->role != USB_ROLE_HOST)
+		return 0;
+
+	if (!xhci_dev) {
+		dev_dbg(dev, "host controller has not been registered\n");
+		return 0;
+	}
+
+	hcd = dev_get_drvdata(&xhci_dev->dev);
+	if (!hcd) {
+		dev_dbg(dev, "host controller have not registered\n");
+		return 0;
+	}
+
+	if (suspend) {
+		while (count--) {
+			value = readl(hcd->regs + XECP_PM_PMCSR);
+			value &= ~PS_MASK;
+			value |= PS_D3 | PS_PME_En;
+			writel(value, hcd->regs + XECP_PM_PMCSR);
+			/* After controller enters D3, disable AXI and SOF
+			 * until AXI valid flag changes to 0.
+			 */
+			if (sky1_rcsu_handshake(data, AXI_CLOCK_VALID, 0,
+						100ULL * 1000)) {
+				u32 ctst;
+
+				ctst = sky1_rcsu_read_status(data);
+				dev_dbg(dev, "enter D3 failed, register value:%x\n",
+					ctst);
+			} else {
+				break;
+			}
+		}
+		if (count < 0) {
+			u32 ctst;
+
+			ctst = sky1_rcsu_read_status(data);
+			dev_err(dev, "enter D3 failed after retries, register value:%x\n",
+				ctst);
+		}
+	} else {
+		while (count--) {
+			value = readl(hcd->regs + XECP_PM_PMCSR);
+			value &= ~PS_MASK;
+			value |= PS_D0;
+			value &= ~PS_PME_En;
+			writel(value, hcd->regs + XECP_PM_PMCSR);
+			/* Wait power state back to D0 */
+			poll = readl_poll_timeout(hcd->regs + XECP_PM_PMCSR,
+						  value,
+						  (value & PS_MASK) == 0 ||
+						  value == U32_MAX,
+						  10, 100ULL * 1000);
+			if (poll) {
+				dev_dbg(dev, "exit D3 timeout, power state=0x%lx\n",
+					value & PS_MASK);
+			} else {
+				break;
+			}
+		}
+		if (count < 0) {
+			dev_err(dev, "exit D3 timeout after retries, power state=0x%lx\n",
+				value & PS_MASK);
+		}
+	}
+
+	return ret;
+}
+
+static void cdnsp_sky1_configure_controller(struct cdnsp_sky1 *data)
+{
+	int clk;
+	int v0, v1, v2, v3;
+	u32 dev_cap, xhci_cap;
+	u32 val = 0;
+
+	if (data->u3_disable) {
+		dev_dbg(data->dev, "disable u3 port\n");
+		writel(D_XEC_CFG_3XPORT_MODE_VALUE, data->device_base
+			+ D_XEC_CFG_3XPORT_MODE);
+	}
+	dev_cap = readl(data->device_base + D_XEC_AXI_CAP);
+	xhci_cap = readl(data->xhci_base + D_XEC_AXI_CAP);
+	writel(dev_cap | AXI_HALT, data->device_base + D_XEC_AXI_CAP);
+	writel(xhci_cap | AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
+	writel(data->axi_bmax_value, data->device_base + D_XEC_AXI_CTRL0);
+	writel(data->axi_bmax_value, data->xhci_base + D_XEC_AXI_CTRL0);
+	writel(dev_cap & ~AXI_HALT, data->device_base + D_XEC_AXI_CAP);
+	writel(xhci_cap & ~AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
+	clk = data->sof_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	v3 = 125 * clk / 1000000;
+	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1),
+	       data->device_base + D_XEC_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1),
+	       data->device_base + D_XEC_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_100US);
+	writel((unsigned int)(v3 > 1 ? v3 - 1 : 1),
+	       data->device_base + D_XEC_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
+		+ D_XEC_PRE_REG_100MS);
+	dev_dbg(data->dev, "readl:%x, %x ,%x, %x, %x, %x, %x, %x\n",
+		readl(data->device_base + D_XEC_PRE_REG_250NS),
+		readl(data->device_base + D_XEC_PRE_REG_1US),
+		readl(data->device_base + D_XEC_PRE_REG_10US),
+		readl(data->device_base + D_XEC_PRE_REG_100US),
+		readl(data->device_base + D_XEC_PRE_REG_125US),
+		readl(data->device_base + D_XEC_PRE_REG_1MS),
+		readl(data->device_base + D_XEC_PRE_REG_10MS),
+		readl(data->device_base + D_XEC_PRE_REG_100MS));
+	clk = data->lpm_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	v3 = 125 * clk / 1000000;
+	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_100US);
+	writel((unsigned int)(v3 > 1 ? v3 - 1 : 1),
+	       data->device_base + D_XEC_LPM_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
+		+ D_XEC_LPM_PRE_REG_100MS);
+	v0 = readl(data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
+	v0 &= ~(CFG_APB_TIMEOUT_PSLVERR_EN | CFG_APB_PSLVERR_EN);
+	writel(v0, data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
+	if (data->u3_disable) {
+		dev_dbg(data->dev, "disable u3 port\n");
+		writel(XEC_CFG_3XPORT_MODE_VALUE, data->xhci_base
+			+ XEC_CFG_3XPORT_MODE);
+	} else if (data->ssp_disable) {
+		dev_dbg(data->dev, "disable ssp\n");
+		v0 = readl(data->xhci_base + XEC_CFG_3XPORT_MODE);
+		writel(v0  & CFG_3XPORT_MODE_DIS_SSP, data->xhci_base
+			+ XEC_CFG_3XPORT_MODE);
+	}
+	clk = data->sof_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	v3 = 125 * clk / 1000000;
+	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_100US);
+	writel((unsigned int)(v3 > 1 ? v3 - 1 : 0),
+	       data->xhci_base + XEC_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
+		+ XEC_PRE_REG_100MS);
+	clk = data->lpm_clk_freq;
+	v0 =  25 * clk / 100000000;
+	v1 = clk / 10000;
+	v2 = clk / 10;
+	v3 = 125 * clk / 1000000;
+	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_250NS);
+	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_1US);
+	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_10US);
+	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_100US);
+	writel((unsigned int)(v3 > 1 ? v3 - 1 : 0),
+	       data->xhci_base + XEC_LPM_PRE_REG_125US);
+	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_1MS);
+	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_10MS);
+	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
+		+ XEC_LPM_PRE_REG_100MS);
+	val = readl(data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
+	val |= HOST20_ACLK_GATING_DISABLE | HOST20_UTMI_GATING_DISABLE;
+	writel(val, data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
+}
+
+static int cdnsp_sky1_drd_init(struct cdnsp_sky1 *data)
+{
+	int ret = 0;
+
+	reset_control_assert(data->reset);
+	reset_control_assert(data->preset);
+	ret = cdnsp_sky1_clk_enable_all(data->dev);
+	if (ret)
+		return ret;
+	writel(CIX_USB_AXI_WR_CACHE_VALUE, data->rcsu_base);
+	cdnsp_sky1_set_mode(data->dev, MODE_STRAP_OTG);
+	reset_control_deassert(data->preset);
+	cdnsp_sky1_configure_controller(data);
+	reset_control_deassert(data->reset);
+	return ret;
+}
+
+static void __iomem *sky1_of_get_addr_by_name(struct device_node *parent, const char *name)
+{
+	void __iomem *addr = NULL;
+	struct device_node *node;
+	int index;
+
+	for_each_child_of_node(parent, node) {
+		index = of_property_match_string(node, "reg-names", name);
+		if (index >= 0) {
+			addr = of_iomap(node, index);
+			of_node_put(node);
+			break;
+		}
+	}
+
+	return addr;
+}
+
+static void __iomem *sky1_get_addr_by_name(struct device *dev, const char *name)
+{
+	return sky1_of_get_addr_by_name(dev->of_node, name);
+}
+
+static void sky1_put_addr(void __iomem *regs)
+{
+	if (regs)
+		iounmap(regs);
+}
+
+struct sky1_usbssp_cfg {
+	unsigned int rcsu_status_offset;
+};
+
+/* Offset of STRAP_STATUS0, the AXI clock status register, from 0x91c0314. */
+static const struct sky1_usbssp_cfg sky1_usbssp_typea_cfg = {
+	.rcsu_status_offset = 0xec,
+};
+
+static int cdnsp_sky1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct of_dev_auxdata cdns_sky1_auxdata[] = {
+		{ .compatible = "cdns,usb3", },
+		{},
+	};
+	const struct sky1_usbssp_cfg *cfg;
+	struct cdnsp_sky1 *data;
+	struct cdns3_platform_data *cdns_sky1_pdata;
+	struct resource *res;
+	unsigned int args[2];
+	int ret = 0;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return dev_err_probe(dev, -ENODEV, "unsupported device\n");
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "missing register range\n");
+	/*
+	 * The two Type-A controllers share one RCSU block and their
+	 * register ranges overlap, so the range is mapped without
+	 * requesting it: request_mem_region() would make the second
+	 * controller fail with -EBUSY.
+	 */
+	data->rcsu_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!data->rcsu_base)
+		return dev_err_probe(dev, -ENOMEM, "failed to map registers\n");
+	data->rcsu_status_offset = cfg->rcsu_status_offset;
+	data->reset = devm_reset_control_get_exclusive(&pdev->dev, "core");
+	if (IS_ERR(data->reset))
+		return dev_err_probe(dev, PTR_ERR(data->reset),
+				     "failed to get core reset\n");
+	data->preset = devm_reset_control_get_exclusive(&pdev->dev, "apb");
+	if (IS_ERR(data->preset))
+		return dev_err_probe(dev, PTR_ERR(data->preset),
+				     "failed to get APB reset\n");
+	platform_set_drvdata(pdev, data);
+	data->dev = dev;
+	data->usb_syscon =
+		syscon_regmap_lookup_by_phandle_args(node, "cix,usb-syscon",
+						     2, args);
+	if (IS_ERR(data->usb_syscon))
+		return dev_err_probe(dev, PTR_ERR(data->usb_syscon),
+				     "failed to get S5 system controller\n");
+	data->strap_offset = args[0];
+	data->strap_bit = args[1];
+	data->u3_disable = device_property_read_bool(dev, "u3-port-disable");
+	data->ssp_disable = device_property_read_bool(dev, "ssp-disable");
+	data->sof_clk_freq = CIX_USB_CLK_8M;
+	data->lpm_clk_freq = CIX_USB_CLK_32K;
+	data->axi_bmax_value = AXI_BMAX_VALUE_DEFAULT;
+	data->xhci_base = sky1_get_addr_by_name(dev, "xhci");
+	if (!data->xhci_base) {
+		ret = -ENODEV;
+		goto err_put_xhci;
+	}
+	data->device_base = sky1_get_addr_by_name(dev, "dev");
+	if (!data->device_base) {
+		ret = -ENODEV;
+		goto err_put_addrs;
+	}
+	ret = cdnsp_sky1_drd_init(data);
+	if (ret == -ETIMEDOUT)
+		ret = -EPROBE_DEFER;
+	if (ret) {
+		/*
+		 * drd_init() leaves the clocks disabled and the resets
+		 * asserted on failure; only the address mappings are
+		 * left to release.
+		 */
+		goto err_put_addrs;
+	}
+	/*
+	 * The platform data is devm-allocated, so it stays alive as long as
+	 * this device; the child devices are depopulated before it is freed.
+	 */
+	cdns_sky1_pdata = devm_kzalloc(dev, sizeof(*cdns_sky1_pdata), GFP_KERNEL);
+	if (!cdns_sky1_pdata) {
+		ret = -ENOMEM;
+		goto err_quiesce;
+	}
+	cdns_sky1_pdata->platform_suspend = cdns_sky1_platform_suspend;
+	cdns_sky1_pdata->quirks = CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
+	cdns_sky1_auxdata[0].platform_data = cdns_sky1_pdata;
+	ret = of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);
+	if (ret) {
+		dev_err(dev, "failed to create children: %d\n", ret);
+		goto err_quiesce;
+	}
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	return 0;
+
+err_quiesce:
+	reset_control_assert(data->reset);
+	reset_control_assert(data->preset);
+	cdnsp_sky1_clk_disable_all(dev);
+err_put_addrs:
+	sky1_put_addr(data->device_base);
+err_put_xhci:
+	sky1_put_addr(data->xhci_base);
+	return ret;
+}
+
+static void cdnsp_sky1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+	of_platform_depopulate(dev);
+	sky1_put_addr(data->xhci_base);
+	sky1_put_addr(data->device_base);
+	reset_control_assert(data->reset);
+	reset_control_assert(data->preset);
+	cdnsp_sky1_clk_disable_all(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
+}
+
+/*
+ * Because the wake-up interrupt and host interrupt are the same interrupt,
+ * closing the axi and sof clock will result in the inability to generate
+ * port status change interrupt.
+ */
+static int cdnsp_sky1_system_suspend(struct device *dev)
+{
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	if (!data->wakeup) {
+		reset_control_assert(data->reset);
+		reset_control_assert(data->preset);
+	}
+	cdnsp_sky1_clk_disable_suspend(dev);
+	return 0;
+}
+
+static int cdnsp_sky1_system_resume(struct device *dev)
+{
+	int ret = 0;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+
+	ret = cdnsp_sky1_clk_enable_resume(dev);
+	if (ret)
+		return ret;
+	if (!data->wakeup) {
+		writel(CIX_USB_AXI_WR_CACHE_VALUE, data->rcsu_base);
+		cdnsp_sky1_set_mode(data->dev, MODE_STRAP_OTG);
+		reset_control_deassert(data->preset);
+		cdnsp_sky1_configure_controller(data);
+		reset_control_deassert(data->reset);
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops cdnsp_sky1_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(cdnsp_sky1_system_suspend, cdnsp_sky1_system_resume)
+};
+
+static const struct of_device_id cdns_sky1_of_match[] = {
+	{
+		.compatible = "cix,sky1-usbssp",
+		.data = &sky1_usbssp_typea_cfg,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, cdns_sky1_of_match);
+
+static int cdnsp_sky1_find_cdns_dev(struct device *dev, void *data)
+{
+	struct device **cdns_dev = data;
+
+	if (dev->of_node && of_device_is_compatible(dev->of_node, "cdns,usb3")) {
+		/* keep a reference: the pointer is used after the iteration */
+		*cdns_dev = get_device(dev);
+		return 1;
+	}
+	return 0;
+}
+
+static int cdnsp_sky1_find_gadget_match(struct device *dev, void *data)
+{
+	struct device **gadget_dev = data;
+	const char *name = dev_name(dev);
+	static const char gadget_prefix[] = "gadget.";
+
+	/*
+	 * The gadget device is registered on the gadget bus with name
+	 * "gadget.%d" (see usb_add_gadget_udc -> dev_set_name).
+	 * It sits on the gadget bus and has the function driver bound to it.
+	 * Verify the device is on the gadget bus by checking the bus name.
+	 * This prevents matching devices that happen to have "gadget." prefix
+	 * in their name but are not real gadget devices, and also avoids
+	 * NULL pointer dereference when device bus is being removed.
+	 */
+	if (name && dev->bus && !strcmp(dev->bus->name, "gadget") &&
+	    !strncmp(name, gadget_prefix, sizeof(gadget_prefix) - 1)) {
+		/* keep a reference: the pointer is used after the iteration */
+		*gadget_dev = get_device(dev);
+		return 1;
+	}
+	return 0;
+}
+
+static void cdnsp_sky1_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
+	struct device *cdns_dev = NULL;
+	struct device *gadget_dev = NULL;
+	struct cdns *cdns = NULL;
+
+	if (!device_may_wakeup(dev)) {
+		/*
+		 * Find the cdns3 child device, then find its gadget device
+		 * and release the function driver before disabling clocks.
+		 * This ensures all register accesses in gadget_unbind_driver
+		 * complete before clocks are turned off.
+		 */
+		device_for_each_child(dev, &cdns_dev, cdnsp_sky1_find_cdns_dev);
+		if (cdns_dev)
+			cdns = dev_get_drvdata(cdns_dev);
+		if (cdns)
+			device_for_each_child(cdns_dev, &gadget_dev,
+					      cdnsp_sky1_find_gadget_match);
+		if (gadget_dev)
+			device_release_driver(gadget_dev);
+		if (cdns && cdns->host_dev) {
+			struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
+
+			if (hcd && hcd->irq > 0) {
+				/*
+				 * Clear HCD_FLAG_HW_ACCESSIBLE before disable_irq.
+				 * This prevents usb_hcd_irq from calling xhci_irq
+				 * (which reads USBSTS) after clocks are disabled.
+				 */
+				clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+				disable_irq(hcd->irq);
+				synchronize_irq(hcd->irq);
+			}
+		}
+		reset_control_assert(data->reset);
+		reset_control_assert(data->preset);
+		cdnsp_sky1_clk_disable_all(dev);
+		put_device(gadget_dev);
+		put_device(cdns_dev);
+	}
+}
+
+static struct platform_driver cdnsp_sky1_driver = {
+	.probe		= cdnsp_sky1_probe,
+	.remove		= cdnsp_sky1_remove,
+	.shutdown	= cdnsp_sky1_shutdown,
+	.driver		= {
+		.name	= "cdnsp-sky1",
+		.of_match_table	= cdns_sky1_of_match,
+		.pm	= pm_sleep_ptr(&cdnsp_sky1_pm_ops),
+	},
+};
+
+module_platform_driver(cdnsp_sky1_driver);
+
+MODULE_ALIAS("platform:cdnsp-sky1");
+MODULE_DESCRIPTION("CIX Sky1 Cadence USBSSP DRD glue driver");
+MODULE_AUTHOR("Hongliang Yang <hongliang.yang@cixtech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/cdns3/cdnsp-sky1.h b/drivers/usb/cdns3/cdnsp-sky1.h
new file mode 100644
index 000000000000..751904f7bfb9
--- /dev/null
+++ b/drivers/usb/cdns3/cdnsp-sky1.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _CDNSP_SKY1_H
+#define _CDNSP_SKY1_H
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/types.h>
+
+#define MODE_STRAP_OTG                  0
+
+#define AXI_HALT                        BIT(31)
+#define AXI_BMAX_VALUE_DEFAULT          0x7
+
+#define D_XEC_CFG_3XPORT_MODE           0x2040
+#define D_XEC_AXI_CAP                   0x2174
+#define D_XEC_AXI_CTRL0                 0x217C
+#define D_XEC_PRE_REG_250NS             0x21E8
+#define D_XEC_PRE_REG_1US               0x21EC
+#define D_XEC_PRE_REG_10US              0x21F0
+#define D_XEC_PRE_REG_100US             0x21F4
+#define D_XEC_PRE_REG_125US             0x21F8
+#define D_XEC_PRE_REG_1MS               0x21FC
+#define D_XEC_PRE_REG_10MS              0x2200
+#define D_XEC_PRE_REG_100MS             0x2204
+#define D_XEC_LPM_PRE_REG_250NS         0x2208
+#define D_XEC_LPM_PRE_REG_1US           0x220C
+#define D_XEC_LPM_PRE_REG_10US          0x2210
+#define D_XEC_LPM_PRE_REG_100US         0x2214
+#define D_XEC_LPM_PRE_REG_125US         0x2218
+#define D_XEC_LPM_PRE_REG_1MS           0x221C
+#define D_XEC_LPM_PRE_REG_10MS          0x2220
+#define D_XEC_LPM_PRE_REG_100MS         0x2224
+
+#define XEC_CFG_3XPORT_MODE             0x2040
+#define XEC_PRE_REG_250NS               0x21E8
+#define XEC_PRE_REG_1US                 0x21EC
+#define XEC_PRE_REG_10US                0x21F0
+#define XEC_PRE_REG_100US               0x21F4
+#define XEC_PRE_REG_125US               0x21F8
+#define XEC_PRE_REG_1MS                 0x21FC
+#define XEC_PRE_REG_10MS                0x2200
+#define XEC_PRE_REG_100MS               0x2204
+#define XEC_LPM_PRE_REG_250NS           0x2208
+#define XEC_LPM_PRE_REG_1US             0x220C
+#define XEC_LPM_PRE_REG_10US            0x2210
+#define XEC_LPM_PRE_REG_100US           0x2214
+#define XEC_LPM_PRE_REG_125US           0x2218
+#define XEC_LPM_PRE_REG_1MS             0x221C
+#define XEC_LPM_PRE_REG_10MS            0x2220
+#define XEC_LPM_PRE_REG_100MS           0x2224
+#define XEC_USBSSP_CHICKEN_BITS_3       0x2230
+#define XEC_USBSSP_CLK_GATING_CTRL      0x2234
+#define XECP_PM_PMCSR                   0x2240
+
+/* XEC_USBSSP_CLK_GATING_CTRL */
+#define HOST20_ACLK_GATING_DISABLE      BIT(4)
+#define HOST20_UTMI_GATING_DISABLE      BIT(5)
+
+/* XECP_PM_PMCSR */
+#define PS_MASK                         GENMASK(1, 0)
+#define PS_D0                           0
+#define PS_D3                           3
+#define PS_PME_En                       BIT(8)
+
+#define D_XEC_CFG_3XPORT_MODE_VALUE     0xa0031e07
+#define XEC_CFG_3XPORT_MODE_VALUE       0xa0031e07
+#define CFG_3XPORT_MODE_DIS_SSP         (~BIT(31))
+
+#define CFG_APB_TIMEOUT_PSLVERR_EN      BIT(22)
+#define CFG_APB_PSLVERR_EN              BIT(23)
+
+#define CIX_USB_CLK_NUM                 (4)
+#define CIX_USB_CLK_OFF_NUM             (2)
+#define CIX_USB_AXI_WR_CACHE_VALUE      0x33
+#define CIX_USB_CLK_32K                 32000
+#define CIX_USB_CLK_8M                  8000000
+
+#define AXI_CLOCK_VALID                 BIT(1)
+
+struct cdnsp_sky1 {
+	struct device *dev;
+	void __iomem *rcsu_base;
+	unsigned int rcsu_status_offset;
+	void __iomem *xhci_base;
+	void __iomem *device_base;
+	struct reset_control *reset;
+	struct reset_control *preset;
+	struct clk *cix_usb_clks[CIX_USB_CLK_NUM];
+	unsigned int strap_offset;
+	unsigned int strap_bit;
+	struct regmap	*usb_syscon;
+	int lpm_clk_freq;
+	int sof_clk_freq;
+	bool u3_disable;
+	bool ssp_disable;
+	int axi_bmax_value;
+	bool wakeup;
+};
+
+#endif /* _CDNSP_SKY1_H */
-- 
2.54.0

