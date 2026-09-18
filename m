Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840349F10A;
	Fri, 18 Sep 2026 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715498; cv=fail; b=Nlqr0Fy+ARQegLeGS7WrcsVWvZkyg36FXmSvyM+KpLtJFSLpDeNpm6wPSDcLYBydUnYV4js6pY+KtWPjWOeA5UoH3mCfvi9EheKDBtXJSqxSzYFn5aG8I1TZ1xytbQeB0ZZE/gI92nk5sTLiV8/hmsaekF5XFtDIjVj4D0hHqqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715498; c=relaxed/simple;
	bh=hkzY779mNi8IMds6Vb0m16KhLddDq1oYO8Y5UrOHLTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k8KQY/YuCwD1flHkwGlTgyvPXVIRF35v9Ff3rWdktY6d7yadw5NVrlM1jTPFDQ3U9wHCQjQSyFbu6GSNA1gG/VNg8p6PY/sZ0MHMwVJ/mmlSKYNXW3kPMi8mQoMqvWZ/pVqVnL4OTZzqHS6QHwJBeWmUehdpiF2ry8jjnc3wxEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op99gKRJwzy1rwpMWYFHUdkmOAo2cjnpqaNDJrbWoaoY7TaR58p3hKOtioLUZT6RA19hncTW8ZeYydKp/yVGJVilExv/DrIPhEg+vRHcbanSIAcP+qZ5RXPejdMoqAsquYHyUxaiIcQMJbt6mOjU96XZPSov03fZsOIAJ+gsyKuthmD6tBGAgR2C6HzClWoh3HHqwsXujG2hCDDFFRyRRGnK8yM8Ntg6v2GvxCNYChd61OYxu8E5way77WECu+ThV+OlNOE1ARoLBrcIp2K4O2bak2Z3S/Ou6t/2YZ3sZ65oBAyNK05yXZ/jN36BNhTCAvrGM9UtwRD3JvQ8dqDSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYfNPUH6LlaU/r/YsD0q7r1UX4alNJTaeVFK8dkJdVg=;
 b=YrOLywjCN4i1jjDKDWj4Fskj6xPQ0a1vOSsmt3IY0wZi/RLOWjAk7jIFvAMxqCvAJQxxOodKYwadXUKdmtJiZ/nctOw/ZrmCSorS8aJeCv/gX1h635t7VMx/l5E9J6SW71+NtO6AhJr6UqgUXpPrJE4cT0rJuY9c7Txe3ubHItMGibMp/uvLjMvoq9HC/Dhu7ttWk1B/vFPqI5XX8m/MVKx52F5acBBbUb38iAHevNIlKrginVERyyjBwuz5INROcfOa0ovbyviMZOMlOnInUlWPWWED6MSUZWwwEyRniTVOfwowQ01On1IqyrTvYPpeiecZWfirnwAcX1vrICXV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.14; Fri, 18 Sep
 2026 07:11:15 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%4])
 with mapi id 15.21.0339.017; Fri, 18 Sep 2026 07:11:15 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v1 3/3] usb: dwc3-generic: Add Starfive JHB100 USB 2.0 device controller and adapter
Date: Fri, 18 Sep 2026 15:11:03 +0800
Message-Id: <20260918071103.24482-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260918071103.24482-1-minda.chen@starfivetech.com>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::16) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: a53be818-d0b8-426d-19a0-08df15540755
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|6133799003|10067099003|3023799007|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	lKwjUWvwT4+HXBeL9k+BpAnbTWQ0Vz6adRHbhDy4Fpnshk/xRQbW30yiT9U790fmJMk0jZ3xBBxf0j0xptvfZlN+uugtb6gPQ77iPb3yHRBKuTFNflJ/I9m+XIPR6VL4roayT0YO5dLMD2LuYGhMCacBcPyhuztwZZyIVtEuIzRgcO3qEgvYGCuo+wmnttrwEWHlnB+2vnr9Edm7WAj0FjkByb0cw3GmPqkNql9F0A6eXCI8snAwjR1Zz6QlYeBhAlckr8oVe0kdLWraky58W7gX7y1KHptpVeYpoItcdxn1Yl5Ie/iaKoWFSweu8QSuBnvIaDtQ5XDtOxd4nLnoflNNms+NKzxHbtnoMS/VHS17p4UjijHjHOAdgfmPBBLMUtdQ8PQIrj2qBW5kSPQuD0RH4JOMdXKAVMYNp4SouViAlSjITliUFQLPUEl2jkXcbRvFKYvvfeetAj20pimocx76jdP9nLlPIKi15uLFn63dl7oJKNppWhjrNEYGkRnG+yDf7KpnrQDhQiivaU/IspH20ErpvSCLuhcNNIQEQr7COqUQMWxZ7SSr2q62Q2+e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(6133799003)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qd2gzlZLrMk9l19Q9UP5WOWaT2pS1HwWPJkAkc65ig7YFi3OHa9WgQy/cj27?=
 =?us-ascii?Q?0rgF56uY5gosXNu6sk09FhYuuqj7HZATWFy3KBdgpeqeFTT3Y5SMmdAarMC2?=
 =?us-ascii?Q?iiizscd4kXsDdMzyeOEeQJQIQDihMq/z5BRq5xHCtk5A86TEKwSciCHScMKP?=
 =?us-ascii?Q?JxQWyLcMmJSFk/Ye+du+2PEIVOU7zC2oE3BHTJ00iUvrTujI7jg0MArIfx3l?=
 =?us-ascii?Q?tNTy2xM007BLu86gGhh1SpFK2bvreEEQUm6Pa9EkgbScwX2W249sMIiZ1nFA?=
 =?us-ascii?Q?fLCx+UjiIxpFZTp4Jn7gC8jL4mDcaqR0OMzIA6s0Ier8HDj1CbPFr4pfwagC?=
 =?us-ascii?Q?CX9rl83Vv3lUXiG5DFkldyu44TBxkjgDo+yOuJBsk5Yj9rMCkK6MfgDTjC2+?=
 =?us-ascii?Q?1ul4pMffNiTloY+ySciRHljU204ge62eM7KMyeo0cumNduRl3TAu5znb3qlK?=
 =?us-ascii?Q?7yW8m9zUMSPX8Aj1XZ6ScnAKiP61pleDqkzw6dOkJ6bfuUj3lZSy+zxawfjv?=
 =?us-ascii?Q?hRIaFpSpOXwhGerYd6E9Mtb7N+8kr3zl01tH0ouvJkZvM9FxWCfSL3eg5n/f?=
 =?us-ascii?Q?fIcqf08D9SJ9n+mOOzX7qpnqKkeBSwzIdfFpdfB1A/g6phhHy1eRKTV2uTR1?=
 =?us-ascii?Q?qCxjZag1pT2093qRPRZzDZ1ADiOqRQeBFnDSeUpF4AJkJBdfNOxtPRfSjeeW?=
 =?us-ascii?Q?PuidbifF5TF1Y+95rI31zP/oGCylIw62EuggOTdIF9c5uarxywASU/BvXDAr?=
 =?us-ascii?Q?jCPkz9yvywpZH0bYyW9wVUoPiPffhEOi42Kd8RM9+Weob7+iN9G5h3KJKgso?=
 =?us-ascii?Q?EGGLQytha+rtzDnTFwk1CYI+PrqiV7ZA02GJx6hDyl5F47cruWP6+T3thK4R?=
 =?us-ascii?Q?91Zo2qJSt7MJv3jSF5hUL1C6wLcatanlh5I3oPSZPJGdOhi+0mxP9u2uFUqr?=
 =?us-ascii?Q?2spCEjGz2yPl+a/Wz1NSRg4O8Xdjshkr6yeBWziyRctIFJcYppdblN9XVqYv?=
 =?us-ascii?Q?67UCBoWlUNgPigzMnncCu2RmQaYkQJvXqL45m3l/0QZBu4md6WKDSpiizsYy?=
 =?us-ascii?Q?t0UHfrjUms5wJ/W9unLX+qvzu7iQNdE8t3Y/T8mcYErmXY5CVqvQrvSTbrc4?=
 =?us-ascii?Q?Oiw/JEdbdTpaMG7O5FfTUNM7b/It6DoNpPrTyxy2ZLvxRkCiPmb2YT3gT25V?=
 =?us-ascii?Q?fcS+L2TXKEA3Sc5Wa8xUcniQ+pXQCh+PYt4qU7AZAfCyfchfNmhj8piPFX9U?=
 =?us-ascii?Q?Poak8feSYPokJcDsIAOl4S961BzkkIMP8/jD7u2Z/KS2MGGtXZ1BkAITXm9i?=
 =?us-ascii?Q?I57VZJJwT1BriuujQuPpiOMyv7/5HOtEreJMR7cw5g1P8qeuZom9uharIYZh?=
 =?us-ascii?Q?czz1SKAn9FwLb5tSKqM1zbEYdf4sLz1+2ax0DzVgnkeesJI4s5Hzv65zOLOs?=
 =?us-ascii?Q?fmDzwMaDml0fdcOAoz27+xz862coBbA+mfjELybYh1vpCeRaBe5WGr2LmpB9?=
 =?us-ascii?Q?oZeEb02tbUxa/2W40RMxr4cnVSi4ccVb4lwck39V3NDq47C2MRscrQQ5Lzpo?=
 =?us-ascii?Q?Ou4rzH38tuG8SSGhsnjhYnz/HJQsOI8J6toCq/A0Woggrjbz1i3J/8Erh5Qe?=
 =?us-ascii?Q?F+2uu8+hmHYCRDCan8U77/vYx19t84e8j3SRYevBAs8X3zDS5ReFNUlzjy+w?=
 =?us-ascii?Q?7UqK7EOzF94Mr2fiPw5WXWUJLedAjiX4ge0LYcTayRmIhoYrqgP6Ra05uKuq?=
 =?us-ascii?Q?97xayVuwgTGQdM0n4fIh8RioBplA4KM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53be818-d0b8-426d-19a0-08df15540755
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:11:15.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVPWQUIqefeiRfBSiKrR0odOooq1BDPXF+ybvQnkwJ8+H1g2tDgEVe8bQJYfM6IEy9oZ3tflmYAL/W+iwS+DtB/ugNZuTmR1lE8gsMn96lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893

Add PHY or PHY adapter iomem field in struct dwc3_gerneric for
dwc3 generic platform to add PHY/PHY adapter setting.

Also Add Starfive JHB100 USB 2.0 device controller generic init
function to remap PHY adapter io memory region and add adapter
pre-run/stop function.

JHB100 BMC soc contains Synopsys dwc3 multi-port host controller.
And export its xhci controller to host server through PCIe. xhci
contains 8 ports and each connect with one dwc3 device controller
through an PHY adapter. Server host USB subsystem includes
one multi-port dwc3 USB host, multiple dwc3 device controllers
and their adapters.

While USB adapter 2.0 enable bit is set, the connect status bit of
xhci port stat register will be asserted. If the usb enumeration is
not ready for USB gadget, The xhci will fail with enumerate usb device.
So The JHB100 USB device controller adapter require to set/clear
USB 2.0 port enable while usb gadget start/stop usb device enumeration.
This can be treated as a hardware quirk.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 47 +++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..e3394205a519 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -22,12 +22,15 @@
 #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
 #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
 
+#define JHB100_ADAPTER_PORT_EN		BIT(20)
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
 	struct clk_bulk_data	*clks;
 	int			num_clocks;
 	struct reset_control	*resets;
+	void __iomem		*phy_regs; /* PHY or PHY adapter regs */
 };
 
 struct dwc3_generic_config {
@@ -42,6 +45,43 @@ static void dwc3_generic_reset_control_assert(void *data)
 	reset_control_assert(data);
 }
 
+static void dwc3_jhb100_pre_run_stop(struct dwc3 *dwc3, bool start)
+{
+	struct dwc3_generic *data = to_dwc3_generic(dwc3);
+	u32	val;
+
+	if (start) {
+		val = readl(data->phy_regs);
+		val |= JHB100_ADAPTER_PORT_EN;
+		writel(val, data->phy_regs);
+	} else {
+		val = readl(data->phy_regs);
+		val &= ~JHB100_ADAPTER_PORT_EN;
+		writel(val, data->phy_regs);
+	}
+}
+
+struct dwc3_glue_ops jhb100_glue_ops = {
+	.pre_run_stop = dwc3_jhb100_pre_run_stop,
+};
+
+static int dwc3_jhb100_init(struct dwc3_generic *dwc3g)
+{
+	struct platform_device *pdev = to_platform_device(dwc3g->dev);
+
+	dwc3g->phy_regs = devm_platform_ioremap_resource_byname(pdev, "adapter");
+	if (IS_ERR(dwc3g->phy_regs)) {
+		dwc3g->phy_regs = NULL;
+		/* Generic bmc USB with PHY*/
+		return 0;
+	}
+
+	/* usb device controller with adapter */
+	dwc3g->dwc.glue_ops = &jhb100_glue_ops;
+
+	return 0;
+}
+
 static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
@@ -231,12 +271,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config jhb100_dwc3 =  {
+	.init = dwc3_jhb100_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
-	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "starfive,jhb100-dwc3", &jhb100_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1

