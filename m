Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792495659;
	b=r5I8hEedCcSwZFzVdwQjc1c5t26USVHVY1GAE50WpBa02jOPmKYFSCxEpAtlefu+f0vt
	 OgMcZu/OWGaqY/+gdll2trdR+ibX+p0cXkcHNOzXb3qtgdbqF+MjPI3cr1sqsP1ABlaR1
	 Ex9prGXJSGZrP5TTeL6A/HoSWZLyMwuuATtzFb2gzmO8rLPT5rAtSdbM3k1tEVSIYuU94
	 16tmGDWrXHCYUEuMV62CcCEEXgYqEVpn4VLJuoSC8xwS6R75wAO1giL6kgIj6372whOiG
	 ZVTMBaAu60J3sXjQu3NlVzYsOhys6pjRNLs7kMOYZwkcJ3qNWKGqPOick9MKE8aW/hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495659;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=vcEe/fGScb+mqPW05kEXo/fV4mzom7gAS02Cbger8pA=;
	b=4IsOkxe0Ra8Co+ywYaWFugIKjQejzwLkn9pymY4+Z0OWfbneEM08dk9TIths/icDZFX8
	 1AoGtxPC1RimOp13zLhSTbT0+u6RCAPvSUbfNHe2hJ+iQyQVEGrxHsjDgQa/U2HmUyAI6
	 WecOXw8aUyO2DF4t197tHoIwDjKIYbJP7l2EnhUrV0+5oPtUg13EiEzcZb/nISBxrzH0M
	 2UnNlebrpJcCnxNw7KtfvGyUFUJ4CT428o2Qn3bum72TL+0hStUqPVa+QBTwrMx8ALLom
	 l+fQtXs4PP8WHBnbFGfDtr4XOTMoPcrta54JzqDOP5B4aaVIqi9fq+NAq3ycXWvIplA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jIENPmSD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.40
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A35606A327;
	Tue, 20 Oct 2026 11:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A35606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jIENPmSD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jA6okgYZr8/wlOrxFtSSq1rCh61ZnCjF8vZsY436cp5jLYk+o7noHkfDU4N40UyZqlbqjB7mlkECPTCFgS2F9c72CElxvWvSwAFLxiIE5HtirGfH4G3YIeYy6kNtW2WdPN/9pNnjufuvCzSyYtLh3Xks6NSpjPsU2CjLMZOEuPXAuUY8lsFsGragdEsugKErvU9Gk3Cnvjn+qZbeTTTjVS5qiJbAW49qvqxRl267J/G0gzKrSjdg+JE/O9nVf/GHntVnc7iSIVewNGxrPImPO6yLGVajGmAFh8YbNxC0LOyWTW8wiv8fnv+UOse2AQ1i0lnE6e+/hidX6f9LDgpq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcEe/fGScb+mqPW05kEXo/fV4mzom7gAS02Cbger8pA=;
 b=BFuyyAAW5lU1BO6iM8M85g+N7vU3+HtW+d5KCyHOWaHhsNiVi/1CqH/55p4pOWrUMHfXV3gWHjvHsLSH+J6Z+QtERawe3fJFCIH0zhwS7cBvxSwkHMAt6a14QfsE56UkvHTiPY8MeGyHN24K3StIgjJ0RRZxlOlC3UurRKU3mueZwxsw2dGbzH+BDgxSWjKVyO0PcifOFonjykk/bmWZnVwOz1eQKh7vDN25uHvT/SsYPqXMxurdzux/S6KN/r2/byeoUOLdbXsWvP+7A69CF2g7E7Kixuu72OyDd1abXcDFan7NT62yQOtmzoe69RL75/BwbH7Rr3/sWCz87rwu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcEe/fGScb+mqPW05kEXo/fV4mzom7gAS02Cbger8pA=;
 b=jIENPmSDE/30Av6P9rm9CcDa/ByNEJ8bhQrE3HEHslE9gxfRpLGNEdsazijZMHIotAqNPZ4DHJihN+GFYw85oy1AzHF8yfm5PR4WMzpIDzhWf2tDkzwyLA1L+L7TWVDGu//Z0c7d5qVSt6XFjk3g0byy6SvUmm6EcKLQifAcYSM=
Received: from SJ0PR13CA0123.namprd13.prod.outlook.com (2603:10b6:a03:2c6::8)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Tue, 20 Oct
 2026 11:27:33 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2) by SJ0PR13CA0123.outlook.office365.com
 (2603:10b6:a03:2c6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 11:27:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:27:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 06:27:32 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 06:27:28 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v4 2/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support with flat probe model
Date: Tue, 20 Oct 2026 16:56:34 +0530
Message-ID: <20261020112636.2661087-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e816ec9-69fa-44e8-f30a-08df2e9d2260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|7416014|376014|1800799024|30052699003|6133799003|22082099003|18002099003|5023799004|11063799006|261009221727099003|10067099003|261009221227099003|261009223027099003|261009220027099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LAYgZzTLouyfkek2L157WLmtR/Rkgwl53hBZQP/vI+IEvTJ72mOZacnZ33mDAznFfBNFaqWbBNVSonNhuutNH7dH/wWwbadRARwuzpDJ0Y9nhagmkcG0C9mnoGo2aAFfSjIl5dzvW80FHZd6igyIcQQepo7FC+B8kjrnGCEWoc37navDB/yiwOtuMlOnDL2Lp2IabFfoz24rUGJkzml6ilMNJfHj4EIGzb4tK3CYwmS0BkWCv1PXenyqJSTi1NMZ3zpYXhLU0QJ9ub2h/QxYg7Ybn2f5rGu9ycWCkEI1/3t1aJf1pk+V4BsFXgD+w+75p71skGDW82stiRxOLmWiVyBdo826i5OhIg5qq7iH+Oy4p5cVwsQ1MDs73DZmPpfGzD7KcNSeqsn5NW7g+NUbu8KGAFxoo31wQszdiBGplCrAcYGNNsHggt8CtkOS6RG3yvfV+pscNiAourzcHCse1g0cbMv1Indm1JF3hYTBJ550Lh8nr020nRnKbfDyuoVUROwGpmWMCeBm1o0zKbFpHQuFVGnVt8ERq6tTPLXypterTKbKwiwy647w27kJ1eBhqFR16UICpwT73BfcJXsYYNzfkvqQAwSJuxwSukk1TAmXNq1dLz5P4H2xBIbsXvjTbpz00OaGN12ZUyROi1XJhdkKIMk/vSRXXJB9snKgsPGhTYBbP201QyMayOQF2yQtILLCZ9a6nrOhDLpT7D8U4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(7416014)(376014)(1800799024)(30052699003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(261009221727099003)(10067099003)(261009221227099003)(261009223027099003)(261009220027099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e0ATGhAGlm4RLP6/1ZYL7NYWOGF3VouAcEYShGJRU2E2C+rqGAUXOrJ02oy3mbFVgTEm0ZVCORjem5M5wVf3CswkAjp/abI7XgMufh3TrjUwc7nwZWZSYP/U933oY3sN7ThO3Zw3VDGq0Jqs7LfK8ml0wxMNtO71jBsHrnpgPazEFPGlwidw88J9dxBetC3NxhmcIKdZeUOR1cUWTG7QBkRIfb6beyvjjMC6ttmAfDRCLmnGEm0HZP1eDQZB0D7mG5RnZ+vKUJr8rEX4KDG83s5BBpWXCrGVNWdFk1tFuA4xCHdE7RYxKzXCy6EXkYykl7Vs1nNsXNuTPKZ2R/JcZf5zAnR2dPAunH49vz8fYofAA1YGrpEYB71yjHJ8ch39at8V0RUiWlV1FbkKQo/WNMHJg0VXiE2GUamrBwjB2fNZNL5t1R7wuoujM1rveB6F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:27:33.0132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e816ec9-69fa-44e8-f30a-08df2e9d2260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741

The Versal Gen2 MMI USB 3.2 DRD controller integrates the Synopsys DWC3
core using a single flat amd,versal2-mmi-dwc3 DT node. Unlike ZynqMP and
Versal platforms, it has no wrapper register space and does not instantiate
a child snps,dwc3 device.

Add support for this integration model by introducing a flat probe path
that embeds struct dwc3 in the glue driver's private data and passes the
controller MMIO resource directly to dwc3_core_probe(). The core is
configured with ignore_clocks_and_resets, as clock and reset management
remain under glue driver control.

Rename the existing probe path to dwc3_xlnx_probe_legacy() and select
between legacy and flat modes through platform data, preserving existing
behaviour for ZynqMP and Versal platforms.

Introduce a flat platform flag to handle differences in probe, remove and
PM flows. The flat path invokes DWC3 core PM and teardown callbacks
directly, while the legacy path continues to use the child device model.

Add Versal Gen2-specific reset and PHY initialization, and pass the
platform specific GSBUSCFG0.REQINFO value through struct
dwc3_properties, the mechanism the flat model provides for core
properties supplied by the glue driver.

In this initial version Type-C reversibility is not implemented. USB3 PHY
TCA mux programming is assumed to be done by MMI configuration data
objects (CDOs), and the TI PD controller is configured using an external
Tiva programmer on the VEK385 evaluation board.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v4:
- Switch to the flat probe model: embed struct dwc3 in struct dwc3_xlnx and
  call dwc3_core_probe() directly, instead of the v3 wrapper that only
  skipped the glue ioremap via no_mem_map.
- Replace dwc3_xlnx_config with dwc3_xlnx_platdata {init, teardown, flat} and
  split probe into common, flat and legacy paths.
- Acquire the USB3 PHY and the mandatory (non-optional) reset in
  dwc3_xlnx_init_versal2(), undone by a devm_add_action_or_reset() teardown;
  drop the udelay() now that phy_init() sits between assert and deassert.
- Pass GSBUSCFG0.REQINFO through struct dwc3_properties rather than a
  software node, and set ignore_clocks_and_resets.

Changes for v3:
- Remove mention of xlnx,usb-syscon phandle from version history.
- Rename map_resource to no_mem_map.
- Add assert delay.
- Rephrase commit description.

Changes for v2:
- Split config struct refactoring into separate patch (2/4).
- Remove unused regmap/syscon fields and parsing code; defer to
  patch that first consumes them.
- Fix error message capitalization to lowercase ("reset", "deassert").
---
 drivers/usb/dwc3/dwc3-xilinx.c | 329 +++++++++++++++++++++++++++++----
 1 file changed, 294 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index db3a9204ab64..5c7431d711bf 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -25,6 +25,9 @@
 
 #include <linux/phy/phy.h>
 
+#include "core.h"
+#include "glue.h"
+
 /* USB phy reset mask register */
 #define XLNX_USB_PHY_RST_EN			0x001C
 #define XLNX_PHY_RST_MASK			0x1
@@ -42,18 +45,45 @@
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
 
+struct dwc3_xlnx;
+
+struct dwc3_xlnx_platdata {
+	int (*init)(struct dwc3_xlnx *priv_data);
+	void (*teardown)(void *data);
+	bool flat;
+};
+
 struct dwc3_xlnx {
 	int				num_clocks;
 	struct clk_bulk_data		*clks;
 	struct device			*dev;
 	void __iomem			*regs;
-	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	const struct dwc3_xlnx_platdata	*plat;
+	struct dwc3			dwc;
 	struct phy			*usb3_phy;
 	struct reset_control		*usb_crst;
 	struct reset_control		*usb_hibrst;
 	struct reset_control		*usb_apbrst;
 };
 
+#define to_dwc3_xlnx(d)	container_of((d), struct dwc3_xlnx, dwc)
+
+/*
+ * The flat model hands the glue device over to the DWC3 core, which stores
+ * its own context in the driver data. The legacy model keeps the glue
+ * context there. Use the match data, which is available either way, to tell
+ * the two apart.
+ */
+static struct dwc3_xlnx *dwc3_xlnx_get_priv(struct device *dev)
+{
+	const struct dwc3_xlnx_platdata *plat = device_get_match_data(dev);
+
+	if (plat && plat->flat)
+		return to_dwc3_xlnx(dev_get_drvdata(dev));
+
+	return dev_get_drvdata(dev);
+}
+
 static void dwc3_xlnx_mask_phy_rst(struct dwc3_xlnx *priv_data, bool mask)
 {
 	u32 reg;
@@ -113,6 +143,59 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 	return 0;
 }
 
+static void dwc3_xlnx_versal2_teardown(void *data)
+{
+	struct dwc3_xlnx *priv_data = data;
+
+	phy_power_off(priv_data->usb3_phy);
+	reset_control_assert(priv_data->usb_crst);
+	phy_exit(priv_data->usb3_phy);
+}
+
+static int dwc3_xlnx_init_versal2(struct dwc3_xlnx *priv_data)
+{
+	struct device *dev = priv_data->dev;
+	int ret;
+
+	priv_data->usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
+	if (IS_ERR(priv_data->usb3_phy))
+		return dev_err_probe(dev, PTR_ERR(priv_data->usb3_phy),
+				     "failed to get USB3 PHY\n");
+
+	priv_data->usb_crst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv_data->usb_crst))
+		return dev_err_probe(dev, PTR_ERR(priv_data->usb_crst),
+				     "failed to get reset signal\n");
+
+	ret = reset_control_assert(priv_data->usb_crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	ret = phy_init(priv_data->usb3_phy);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_deassert(priv_data->usb_crst);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to deassert reset\n");
+		goto err_phy_exit;
+	}
+
+	ret = phy_power_on(priv_data->usb3_phy);
+	if (ret < 0)
+		goto err_crst_assert;
+
+	return devm_add_action_or_reset(dev, dwc3_xlnx_versal2_teardown,
+					priv_data);
+
+err_crst_assert:
+	reset_control_assert(priv_data->usb_crst);
+err_phy_exit:
+	phy_exit(priv_data->usb3_phy);
+
+	return ret;
+}
+
 static void dwc3_xlnx_zynqmp_teardown(void *data)
 {
 	struct dwc3_xlnx *priv_data = data;
@@ -142,8 +225,10 @@ static void dwc3_xlnx_zynqmp_teardown(void *data)
 static void dwc3_xlnx_release_teardown(struct device *dev,
 				       struct dwc3_xlnx *priv_data)
 {
-	if (devm_is_action_added(dev, dwc3_xlnx_zynqmp_teardown, priv_data))
-		devm_release_action(dev, dwc3_xlnx_zynqmp_teardown, priv_data);
+	void (*teardown)(void *data) = priv_data->plat->teardown;
+
+	if (teardown && devm_is_action_added(dev, teardown, priv_data))
+		devm_release_action(dev, teardown, priv_data);
 }
 
 static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
@@ -288,14 +373,33 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	return ret;
 }
 
+static const struct dwc3_xlnx_platdata zynqmp_platdata = {
+	.init = dwc3_xlnx_init_zynqmp,
+	.teardown = dwc3_xlnx_zynqmp_teardown,
+};
+
+static const struct dwc3_xlnx_platdata versal_platdata = {
+	.init = dwc3_xlnx_init_versal,
+};
+
+static const struct dwc3_xlnx_platdata versal2_platdata = {
+	.init = dwc3_xlnx_init_versal2,
+	.teardown = dwc3_xlnx_versal2_teardown,
+	.flat = true,
+};
+
 static const struct of_device_id dwc3_xlnx_of_match[] = {
 	{
 		.compatible = "xlnx,zynqmp-dwc3",
-		.data = &dwc3_xlnx_init_zynqmp,
+		.data = &zynqmp_platdata,
 	},
 	{
 		.compatible = "xlnx,versal-dwc3",
-		.data = &dwc3_xlnx_init_versal,
+		.data = &versal_platdata,
+	},
+	{
+		.compatible = "amd,versal2-mmi-dwc3",
+		.data = &versal2_platdata,
 	},
 	{ /* Sentinel */ }
 };
@@ -326,33 +430,44 @@ static int dwc3_set_swnode(struct device *dev)
 	return ret;
 }
 
-static int dwc3_xlnx_probe(struct platform_device *pdev)
+/*
+ * Steps both probe models share: claim the glue context, map the wrapper
+ * registers where there are any, turn the clocks on and run the platform
+ * init.  The models differ only in what they do with the core afterwards.
+ */
+static int dwc3_xlnx_probe_common(struct platform_device *pdev,
+				  struct dwc3_xlnx **priv)
 {
-	struct dwc3_xlnx		*priv_data;
-	struct device			*dev = &pdev->dev;
-	struct device_node		*np = dev->of_node;
-	void __iomem			*regs;
-	int				ret;
+	const struct dwc3_xlnx_platdata *plat;
+	struct dwc3_xlnx *priv_data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	plat = device_get_match_data(dev);
+	if (!plat || !plat->init)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform match data\n");
 
 	priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
 	if (!priv_data)
 		return -ENOMEM;
 
-	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
-		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
-
-	priv_data->pltfm_init = device_get_match_data(dev);
-	if (!priv_data->pltfm_init)
-		return dev_err_probe(dev, -ENODEV,
-				     "missing platform init handler\n");
-
-	priv_data->regs = regs;
+	priv_data->plat = plat;
 	priv_data->dev = dev;
-
 	platform_set_drvdata(pdev, priv_data);
 
-	ret = devm_clk_bulk_get_all(priv_data->dev, &priv_data->clks);
+	/*
+	 * Only the wrapper models have glue registers of their own.  The flat
+	 * model hands the controller resource straight to the DWC3 core.
+	 */
+	if (!plat->flat) {
+		priv_data->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(priv_data->regs))
+			return dev_err_probe(dev, PTR_ERR(priv_data->regs),
+					     "failed to map registers\n");
+	}
+
+	ret = devm_clk_bulk_get_all(dev, &priv_data->clks);
 	if (ret < 0)
 		return ret;
 
@@ -362,10 +477,66 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = priv_data->pltfm_init(priv_data);
+	ret = plat->init(priv_data);
+	if (ret) {
+		/*
+		 * Registering the teardown is the last thing init does, so a
+		 * failure here means it either never registered or has already
+		 * run.  Only the clocks are left to undo.
+		 */
+		clk_bulk_disable_unprepare(priv_data->num_clocks,
+					   priv_data->clks);
+		return ret;
+	}
+
+	*priv = priv_data;
+
+	return 0;
+}
+
+static int dwc3_xlnx_probe_flat(struct platform_device *pdev,
+				struct dwc3_xlnx *priv_data)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		ret = -ENODEV;
+		goto err_clk_put;
+	}
+
+	priv_data->dwc.dev = dev;
+	probe_data.dwc = &priv_data->dwc;
+	probe_data.res = res;
+	probe_data.ignore_clocks_and_resets = true;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	if (of_dma_is_coherent(dev->of_node))
+		probe_data.properties.gsbuscfg0_reqinfo = 0xf0f0;
+
+	ret = dwc3_core_probe(&probe_data);
 	if (ret)
 		goto err_clk_put;
 
+	return 0;
+
+err_clk_put:
+	dwc3_xlnx_release_teardown(dev, priv_data);
+	clk_bulk_disable_unprepare(priv_data->num_clocks, priv_data->clks);
+
+	return ret;
+}
+
+static int dwc3_xlnx_probe_legacy(struct platform_device *pdev,
+				  struct dwc3_xlnx *priv_data)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	int ret;
+
 	ret = dwc3_set_swnode(dev);
 	if (ret)
 		goto err_clk_put;
@@ -397,12 +568,30 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int dwc3_xlnx_probe(struct platform_device *pdev)
+{
+	struct dwc3_xlnx *priv_data;
+	int ret;
+
+	ret = dwc3_xlnx_probe_common(pdev, &priv_data);
+	if (ret)
+		return ret;
+
+	if (priv_data->plat->flat)
+		return dwc3_xlnx_probe_flat(pdev, priv_data);
+
+	return dwc3_xlnx_probe_legacy(pdev, priv_data);
+}
+
 static void dwc3_xlnx_remove(struct platform_device *pdev)
 {
-	struct dwc3_xlnx	*priv_data = platform_get_drvdata(pdev);
 	struct device		*dev = &pdev->dev;
+	struct dwc3_xlnx	*priv_data = dwc3_xlnx_get_priv(dev);
 
-	of_platform_depopulate(dev);
+	if (priv_data->plat->flat)
+		dwc3_core_remove(&priv_data->dwc);
+	else
+		of_platform_depopulate(dev);
 
 	/*
 	 * This is also what makes .shutdown behave the same as .remove:
@@ -414,13 +603,24 @@ static void dwc3_xlnx_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(priv_data->num_clocks, priv_data->clks);
 	priv_data->num_clocks = 0;
 
+	if (priv_data->plat->flat)
+		return;
+
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 }
 
 static int __maybe_unused dwc3_xlnx_runtime_suspend(struct device *dev)
 {
-	struct dwc3_xlnx *priv_data = dev_get_drvdata(dev);
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
+	int ret;
+
+	/* Quiesce the core while its register interface is still clocked. */
+	if (priv_data->plat->flat) {
+		ret = dwc3_runtime_suspend(&priv_data->dwc);
+		if (ret)
+			return ret;
+	}
 
 	clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
 
@@ -429,13 +629,29 @@ static int __maybe_unused dwc3_xlnx_runtime_suspend(struct device *dev)
 
 static int __maybe_unused dwc3_xlnx_runtime_resume(struct device *dev)
 {
-	struct dwc3_xlnx *priv_data = dev_get_drvdata(dev);
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
+	int ret;
+
+	ret = clk_bulk_enable(priv_data->num_clocks, priv_data->clks);
+	if (ret)
+		return ret;
 
-	return clk_bulk_enable(priv_data->num_clocks, priv_data->clks);
+	if (priv_data->plat->flat) {
+		ret = dwc3_runtime_resume(&priv_data->dwc);
+		if (ret)
+			clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
+	}
+
+	return ret;
 }
 
 static int __maybe_unused dwc3_xlnx_runtime_idle(struct device *dev)
 {
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
+
+	if (priv_data->plat->flat)
+		return dwc3_runtime_idle(&priv_data->dwc);
+
 	pm_runtime_autosuspend(dev);
 
 	return 0;
@@ -443,12 +659,19 @@ static int __maybe_unused dwc3_xlnx_runtime_idle(struct device *dev)
 
 static int __maybe_unused dwc3_xlnx_suspend(struct device *dev)
 {
-	struct dwc3_xlnx *priv_data = dev_get_drvdata(dev);
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
 	int ret;
 
+	/* Quiesce the core while its register interface is still clocked. */
+	if (priv_data->plat->flat) {
+		ret = dwc3_pm_suspend(&priv_data->dwc);
+		if (ret)
+			return ret;
+	}
+
 	ret = phy_power_off(priv_data->usb3_phy);
 	if (ret < 0)
-		return ret;
+		goto err_core_resume;
 
 	ret = phy_exit(priv_data->usb3_phy);
 	if (ret < 0)
@@ -462,13 +685,16 @@ static int __maybe_unused dwc3_xlnx_suspend(struct device *dev)
 err_phy_power_on:
 	if (phy_power_on(priv_data->usb3_phy))
 		dev_err(dev, "failed to restore PHY power after suspend error\n");
+err_core_resume:
+	if (priv_data->plat->flat)
+		dwc3_pm_resume(&priv_data->dwc);
 
 	return ret;
 }
 
 static int __maybe_unused dwc3_xlnx_resume(struct device *dev)
 {
-	struct dwc3_xlnx *priv_data = dev_get_drvdata(dev);
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
 	int ret;
 
 	ret = clk_bulk_enable(priv_data->num_clocks, priv_data->clks);
@@ -480,23 +706,56 @@ static int __maybe_unused dwc3_xlnx_resume(struct device *dev)
 		goto err_clk_disable;
 
 	ret = phy_power_on(priv_data->usb3_phy);
-	if (ret < 0) {
-		phy_exit(priv_data->usb3_phy);
-		goto err_clk_disable;
+	if (ret < 0)
+		goto err_phy_exit;
+
+	if (priv_data->plat->flat) {
+		ret = dwc3_pm_resume(&priv_data->dwc);
+		if (ret)
+			goto err_phy_power_off;
 	}
 
 	return 0;
 
+err_phy_power_off:
+	phy_power_off(priv_data->usb3_phy);
+err_phy_exit:
+	phy_exit(priv_data->usb3_phy);
 err_clk_disable:
 	clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
 
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static void dwc3_xlnx_complete(struct device *dev)
+{
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
+
+	if (priv_data->plat->flat)
+		dwc3_pm_complete(&priv_data->dwc);
+}
+
+static int dwc3_xlnx_prepare(struct device *dev)
+{
+	struct dwc3_xlnx *priv_data = dwc3_xlnx_get_priv(dev);
+
+	if (priv_data->plat->flat)
+		return dwc3_pm_prepare(&priv_data->dwc);
+
+	return 0;
+}
+#else
+#define dwc3_xlnx_complete NULL
+#define dwc3_xlnx_prepare NULL
+#endif /* CONFIG_PM_SLEEP */
+
 static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dwc3_xlnx_suspend, dwc3_xlnx_resume)
 	SET_RUNTIME_PM_OPS(dwc3_xlnx_runtime_suspend,
 			   dwc3_xlnx_runtime_resume, dwc3_xlnx_runtime_idle)
+	.complete = dwc3_xlnx_complete,
+	.prepare = dwc3_xlnx_prepare,
 };
 
 static struct platform_driver dwc3_xlnx_driver = {
-- 
2.43.0

