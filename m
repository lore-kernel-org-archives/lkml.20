Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927882;
	b=og3Nl7eeXoyAZVCyQt0e2YbU+mje7yC/8IsYKAmKmILF/0KxuvwWWT0G4O+IRNrvNpc5
	 2kPv4BHzCgSjmPAoGX8rfpcaEQqvjV16wvYVk0pxGmqzZwf0aIeTLCTsrE8shGwCpW5n9
	 wecI4ElP2lEQiXUlDcqrvMtWmp1Q186IDrTMXsyrxetqxBc/YckVCCryxHA1BZlIYXfYt
	 Z6CE0YrIA4bw8uaT8eGzFwcTQ8ml+ycRRcIBXX5wmKiW8vX6lmTIMi97ehxIshtoG1QvL
	 sU0P3dHIHOSB4P57vWfowv4Od4/4XySBjAKZYWrw0bsAGUbFqfGsg0GTWw1r0vyblJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927882;
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
	bh=lSe/bHIuEZVLAyh2VZ5u6jnxREpdLhnabsd3o7OI0U4=;
	b=HEOmkgNd7exaao27Z5ss3U4F4psOmQctJWmCRK3lXZbkJmnpF+Zx/hO7VJb7B++Qkzys
	 B/C4lC1Neutesu1r29igt2V5bkZ2iWJalhZk2SO3ZI4hi+5THnEa5Ue/gFQ18ff3irHu4
	 RvN0XB7ZiwOZJik8ao5faugBSy+IQ95j54k0b8mFVFN0a2uoik+DTDF5EcOnB05ySEzBz
	 279G8P0vz/Zby8gqEhV8nrEcFHogCcn68XY1DkYpEA6lsN2Wi/fCRTDkwjZF13KBABhv6
	 HmlXeD9kedi/Z9buAZJPnmeUAIlf6z1293UjLpu1FBicALtrHNE/15yhDo4NoZ8L26Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XQqDMrAX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.19
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCF606A334;
	Tue, 17 Nov 2026 15:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDCF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XQqDMrAX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtJOzrnKsI++2aTT6hE8oT02/hEmwaSbcGtFbRJ6vViCH+GVrcOekAs/RRXBna+L0A2SWK66KcHvpMu+OB3MBAOezsX7+ZSGK0YYvurO4GZYrGtp+Ox3THTXLLMbZlK/Zj5a/rLc4JjZTCFWjblFgQFFcr95VyqEd3bfzaxKzxgRMZ2gstySq4rECMyxZeVsoqZZioB+xqd0E3dl9HQOe0v46aL0Q51bT67SoL2IU0igJFG4JOAfU4vgyIybUiLA4/9chdaWvMskz0498qAczQ88Fwyl7bYJC+P/ULLXTASVtprC/W8g27fEeZx2EjfmSzJ+zPL8qTVBwQ43CKswqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSe/bHIuEZVLAyh2VZ5u6jnxREpdLhnabsd3o7OI0U4=;
 b=mFdqiot9EMAN9/PdBupIer+VdoEksPpm5qC+WaP7hPFyDfK4n84gaHWWaploGGvz7o/GkRu1DUyiFLCly49TWjjAxAT65UelC0Cx2IQi6SP8LUYfuBN6KEmeQekjRuDQ0VCHXjM22CIMkSTFTlXlyoY1C9mTrv7+fZDmGZfbmLJOlW1zTm9sy0C7NWB8twacEJR7w2lkfcjX9zXkE/FIG5AVF8TLdYmq5HbbFxuo60BVrcSpEMK8TFtU6B/VLcqCE4HdkDdQv69Slg00KqvyvJHDSI18iRpiMU7ieFGkp0150N7IB9ZUPB9BVHorfvHDw/oVp9YeKvVGyLxP1mQz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSe/bHIuEZVLAyh2VZ5u6jnxREpdLhnabsd3o7OI0U4=;
 b=XQqDMrAXqj8mLjRWFpurzPeescgVzGCdQq477Gl7+pHN27Nuv/FQooQEhAbgATqZELx4HZkG8uqsW+ieLZM9Z9FWToRnMjL3MFlCVRRguBGMf1+VzoreFb3xgvqKbRJbKCG/xyE1VM6QYAXNgK1PeHU9kTXzGVmRpzx39es78Q4=
Received: from CH0PR03CA0435.namprd03.prod.outlook.com (2603:10b6:610:10e::9)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 15:03:13 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::2c) by CH0PR03CA0435.outlook.office365.com
 (2603:10b6:610:10e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 15:03:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:40 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:36 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support with flat probe model
Date: Tue, 17 Nov 2026 20:32:17 +0530
Message-ID: <20261117150219.1326693-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9aac39-48fd-40b0-37b9-08df44bbe70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003|261009220027099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	HZMUAAULKSPamdbsF+J/wcYcLcP/UmHxPeiKg7D7tjIOfTal9fCIjjZGT5V0rHGE+jZEDUyJYOvrhfDWjKBXyHQuWZO6WBTtHWi/OvvwMLdaSjCNjVM3ghqi7o0NOTqfpmVyDIEdCjezIOrcntwUXHdBresjsy5dhJsm9EGp43w2vW3IhkQgAc+ftcBoECd8VzQNgceUFFbVT0T2SkXTSN/81QQl2OPrOjqW0gR5XyGVJtXLhlCdEtwBbO0dL37fXvRUao9e5FTTdRsnwts1bvRfqydmYyVYf0EtNBIOTXj5s2PVuZxQS2KCNvbHoBw4Xg6m3TXMkDqLtHzerkYxupS3X67IYEk6qyD3rptVxlGKMufNp+Z23yLU1YXSXEnbZsLd3DiwxcOH+zdKl+gjKha/AH6pJBMcacawDqZmFO3PCfmgjZS9lUrS2t8VLC8PXCn43r5rZm/cHsjOvbS3CmEMunBXdoXkEFcnL5E19+TfIcEoMvYOzMvabmVOHVkiRwtCRV32rJUkLVb1ep1aLHv7koXzZ8mS1qRHU4sRJnSwXkbgd0KvjbMdkvYrbi0tYUPqF4zLt8bMY+htK2iNS7qx//i13zozTrrnTq2eE4rjL61l1Z2P1u91var/S0RdNa2+obMoY1ZPc1Ig8kdcFn5jH5a7GB3iup2FOIdcvOnDK9C7L+8MLXhsYZrz9NRPSsLz0AdZYqMRYM6xmawjjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009220027099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nZ8NhGPb0hbl9T2A3EqXhmE/vCuUrRptm8UPs/qWgiPYq9CS94X/azolRFFANehVd50ikCXlX7H3fTCX4Ihh+EzzYrbpcAx5IzSsCz7cRXBcTCn+En3KmuR9D920LKWEMxsRbbx0T955DMM66wwHSIp8uCl3nS7EcKeW7xW22RM/LNRHL/f8sx6o0mnKMVbNac1pdtY/Xcmxg6/eHHgh+kwIAWc0jGSy9oqPhXlvDlODg3a8ah09kvtCEZKwnyFL1MLRIxJ5nFhas0LZ5jW4BlL8reB98DBPJ53O1RQUIfsNZlUMgWjIPfJAFVK5DhVDgVM2Cpv7BZD6qVCtVl85a+bep0Mr0rmrg6Kxn3Db3803uWpSOI8LFNXJeL8go1kg+U31DRI+VBfoeXhhGZF6r1PXqlpocsbWrhtEwOtLS2N1LvQDemWAqwoTpucm2oIt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:13.5127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9aac39-48fd-40b0-37b9-08df44bbe70a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793

Versal Gen2 MMI USB 3.2 DRD integrates the DWC3 core using a single
flat amd,versal2-mmi-dwc3 node, without a wrapper register space or
a child snps,dwc3 device.

Add a flat probe path that embeds struct dwc3 in the glue driver and
passes the controller resource directly to dwc3_core_probe(). Keep
clock and reset handling in the glue driver using
ignore_clocks_and_resets.

Rename the existing probe path to dwc3_xlnx_probe_legacy() and use a
platform flag to select the flat or legacy model. Add the corresponding
flat remove and PM handling, along with Versal Gen2 reset and PHY setup.

In this initial version Type-C reversibility is not implemented. USB3 PHY
TCA mux programming is assumed to be done by MMI configuration data
objects (CDOs), and the TI PD controller is configured using an external
Tiva programmer on the VEK385 evaluation board.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v5:
- Rephrase commit description.

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
index b58fe034a94d..c68246921a4c 100644
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
 
 	priv_data = devm_kzalloc_obj(dev, *priv_data);
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
2.44.4

