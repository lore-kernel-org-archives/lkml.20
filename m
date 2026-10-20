Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792495662;
	b=AFm/tqZVU5Cuyv7Rni94L0urybxZvHuLEU0g89nFSd8VUIed1BiSvxy2ni8/NRBXfEqX
	 1a8iDoLZ74V0bDY9c3dQ/z5x97n9ikgB9WLHjkzsfnjBtOIVF5SpyJ0txBiyNwCZzosX5
	 CJqvQ9D5MK0HOnTAYBgAaAREIKcnb6XyPzJxSKQ3YJJUbBWQU995B1YCgQfJzQ2uoaEev
	 7ULQe0DEWcrAiw3Lw7BsHTLwRYhHB9uVilbSLGm9Ty8Fh8DHFMW7QNjAxQr5X6vRBC0MY
	 +CdwQY/5pw83KPIwscQTcDBzK3cQq1I8eDTyG4yh+xxWTlH5BjxaCI2rKtzv5A/GRiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495662;
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
	bh=G+iWxylRmQBF79EuuldWrJcSixmKZ+7ZQMUoNZzvypE=;
	b=k62jPhs/EwS+pU6HohvMH9fSnkJJfhBY8RRTf94ka+CX5rcDV95stYT7/VA4STL3k0O9
	 yzFkl8YAt05dfGWo7IODYTSCtkA8XSqWWBcxqlxFr9VbfQ+vCzazPkNihPDi4ROmHxKGD
	 ouYR7g5cJdudXGoTYv97PgDXYBP3tFPCFtLY6Vr5fQQQfripa+N/WLQ10MVCaeGqArRnt
	 i/d0hEVGznnfZyXUvK40OJngUWpeuxNoH2TXsZ0FevtRH+QeFwIWXCscPKS6f0AG+lQAJ
	 nHKE9nlujdcGoF8dByzJF5nk322+yJxGKv2mTau/xdG9md7CkzeJ7SA3oSj/W3EGZDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ybemqsMk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.54
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012054.outbound.protection.outlook.com [52.101.48.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609A606A32C;
	Tue, 20 Oct 2026 11:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B609A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ybemqsMk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riauwCwWLpp4SOOrp+nRNG0Qf33b85KWW1BqR78LIC4JZXC8BTBGW80iM3hoeF3nqKgv7w6ZUo8Y7HcfruiWg/wnM2Qg1iLCzvoFQ7iKPgvxF2Vv7A9xTKi6go+1tY+QTXpL2/pbsFEwbYAe4GYSf9QbIlN/3f07xharPRJgvsRyZJLC0KbbdNGIOPqTzBAeopXXafooMGE7wDrf43kauEdAPleEZvbKHIh7l4hxiogzMnJs1hEp1Sbk/PxKptnMCkphox5viCbajfSeeRZ7QY50H+kR/9sCK3PMGeW4S7RSIevmZbwHZCYbgdljOPgW5cGv2D8SCI2eL4fRAyVMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+iWxylRmQBF79EuuldWrJcSixmKZ+7ZQMUoNZzvypE=;
 b=H9xn07zFLM4N4uHmt0f+zVTYT084ThCqmkC1tmjAGtt/iJmnIjPE2YM/JGdf0Js13zltSz+6XWOlrIOV28w8E0N05RHCLPp1LL896v7Puw39Q8x2Lb2dTf/7vanvoKTd3n6xbNwOS1GDZk3SxeiwaZ8PJzDo6bXvh/JaboZQMUCa5ssOmPh9mA0bmQ8ZSxRhAUWGMvAHvzsJu2j4AnflSGwN13oXP1yxDd5zqzrOj4UJIK0f6+tmT+2zTc8r61/QL+eQv74PgwgLjQwqIfUm6HlrdWPf8X4yw52FofqZVUoMHYTpqW20u087UmEL3NTwPLMDi/9CSLpD5i4fX/Mk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+iWxylRmQBF79EuuldWrJcSixmKZ+7ZQMUoNZzvypE=;
 b=ybemqsMkhNiux5w8Tps4joVfxr0AooTuBLArpSaSck1EjrFoNr3xL8DakdLYAjLbDwa5nhM3zUXQZKHAaYd3P6DxjRJpciNkPYfwOlZHrt2XeOS1RKxKQQhfR9g7b0XVwkxKzgkYILq5cgd9XACHKNIhnwyhXoJ99HvK1q7CGvc=
Received: from DSZP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::15) by
 DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Tue, 20 Oct 2026 11:27:36 +0000
Received: from DS1PEPF0005344C.namprd04.prod.outlook.com
 (2603:10b6:5:280:cafe::b) by DSZP220CA0001.outlook.office365.com
 (2603:10b6:5:280::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 11:27:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0005344C.mail.protection.outlook.com (10.167.23.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 11:27:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 06:27:35 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 06:27:32 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v4 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
Date: Tue, 20 Oct 2026 16:56:35 +0530
Message-ID: <20261020112636.2661087-4-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0005344C:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d84732-abe0-4ea9-1d06-08df2e9d244a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|82310400026|1800799024|261009223027099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Gq6BLYm4VKxWlCorJ4p+HGTK2a4u8T2np38+jA3WQ6KYo1Ib/2oH9gOYiwPcw4xoXPfq5xiGsPRbQVRDlIaxSTiulYj9kt14trddwXsX16q7OXGnjcGW04AgxYyspNlznglOBoiJM+65Jp9mnuuR3vKdJSh6yl8ZQ5yY2FnClarjx2Qwa9YkpHIeF4jUaZ3kja8sBW6UBWyRptfxzKvc4M7pi4veTA+LOwJhyRIXwiavMRHMLHZvp/7MDDPo2CKPRCr4Rj2bWwzCGy4jatrxTEmXEMDpfSnCOYckMvArXGEEL2gmbg/5omESd3Os8w5o3a4jJBxFgBEwSaCNQsXyUEjL/m56gKBolwxlqNByvwk1qAQKw+E3gmg8+WleMaUipeHLCNfAwwhnkdoiGcGek8ZGUxBtGiYTZMalYEhYWTpqYsd6iq75elZvlXD0J93V0AMj+L40102L6GUJPm3J525rDJOnEl9+bu/9W6B/6PK6tQxj5B5v3yL0be7VJInJkDJzaFwff2Wq0TJN8K7IGFMKdm6cKroT4xObmyDHYddEJYKm+nGjujHZoM3g0E/j/LTiuufqK4BPP3HCvdG04sLJcNcYlYtRZl/iCBRd1oYZ85ewtBeWhcdv/m1i9y6wQqvXEZeTmA/MSEaPyZjUxWpUbg7RSSMNy67yzybn+gO5STUmA97KMLOydFpHoHhWeDg4B6EBKOLUalSE35Nh2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpk4xpbsm19B0H9MDlx+8SQc96gwxi1+XJYG/IO/ZXKIUAepXcnl0q3cjF1Xwu2rTa5aNXQKHa3dk6DhM9u4gmz5YLeHH5ZLti/xkLG1L4vxO9ZkfiTqBilUL/5k5YzaFDfYHM2C+kvj6BAGWcqYs9AjPXO3HIilvNO3EXTsS+1wr8ucXtu6VdXw5swstah3nkBvX37y2Ei0SlHaFXiJ91cvPKfQOIpFDLH/ub6i90kiuMCeaQNsKEKiz839tQWBCz6PWVkiYP4kDTDSX0UxI4QGz+oGAS2ZQR/t0uakWaay4NXM7mK93XECTa21L7bysnRblC8LSyQvLMTahMPJ6uwiCnLkw2/jFMqLR+IgGrnONwKw6AdiVeMEyqsMPo9cIp3ZUne4i6HwGxPp4DNaTkEFmL/mrYsqeprnrI0zCj8UvaTe6jJiX8JN4uUw/8ms
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:27:36.2742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d84732-abe0-4ea9-1d06-08df2e9d244a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0005344C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

Introduces support for programming the 18-bit TX deemphasis value that
drives the pipe_TxDeemph signal, as defined in the PIPE4 specification.

The value is supplied by the glue driver through struct dwc3_properties,
which the flat model provides for core properties the glue knows at probe
time, and is programmed into LCSR_TX_DEEMPH during SoC bus configuration.

The configured value is recommended by Synopsys and is intended for
standard (non-compliance) operation. These Gen2 equalization settings
have been validated through both internal and external compliance
testing. By applying this setting, the stability of USB 3.2 enumeration
is improved and now SuperSpeedPlus devices are consistently recognized as
USB 3.2 Gen2 by the MMI USB Host controller.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v4:
- Pass the value through struct dwc3_properties instead of the
  snps,lcsr-tx-deemph software node property; the flat model hands core
  properties to dwc3_core_probe() directly.
- Drop the per-port DWC3_LCSR_TX_DEEMPH(n) macro and the loop over
  num_usb3_ports in favour of a plain offset, as MMI has a single USB3
  port.
- Only program the register on DWC31 and DWC32, where the LCSR space
  exists.
- Add the UNSPECIFIED sentinel to DWC3_DEFAULT_PROPERTIES and spell out
  both sentinels in fsl_ls1028_dwc3 to avoid -Woverride-init.

Changes for v3:
- Define DWC3_LCSR_TX_DEEMPH(n) and multiport handling. Thinh: Please
  review on this offset calculation as MMI USB IP support single usb3
  port.
- Default set the tx_deemph to the DWC3_LCSR_TX_DEEMPH_UNSPECIFIED.

Changes for v2:
- Don't use compatible check for deemphasis programming.
- Rename property "snps,lcsr_tx_deemph" to "snps,lcsr-tx-deemph"
  (hyphens per kernel convention).
- Fix double space in LCSR_TX_DEEMPH register comment.
- Add blank line between register offset define and "Bit fields" section.
---
 drivers/usb/dwc3/core.c              | 12 ++++++++++++
 drivers/usb/dwc3/core.h              |  8 ++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c | 11 ++++++++++-
 drivers/usb/dwc3/dwc3-xilinx.c       |  4 ++++
 drivers/usb/dwc3/glue.h              |  4 ++++
 5 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..4e29056a76d9 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -642,6 +642,17 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
 		dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
 	}
+
+	/* The LCSR register space only exists on DWC31 and DWC32 cores. */
+	if (dwc->csr_tx_deemph_field_1 != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED &&
+	    (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32))) {
+		u32 reg;
+
+		reg = dwc3_readl(dwc, DWC3_LCSR_TX_DEEMPH);
+		reg &= ~DWC3_LCSR_TX_DEEMPH_MASK(~0);
+		reg |= DWC3_LCSR_TX_DEEMPH_MASK(dwc->csr_tx_deemph_field_1);
+		dwc3_writel(dwc, DWC3_LCSR_TX_DEEMPH, reg);
+	}
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
@@ -1695,6 +1706,7 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 		dwc->needs_full_reinit = true;
 
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
+	dwc->csr_tx_deemph_field_1 = properties->csr_tx_deemph_field_1;
 
 	if (properties->gsbuscfg0_reqinfo !=
 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..032f801954fa 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -182,6 +182,8 @@
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
+#define DWC3_LCSR_TX_DEEMPH	0xd060
+
 /* Bit fields */
 
 /* Global SoC Bus Configuration INCRx Register 0 */
@@ -199,6 +201,10 @@
 #define DWC3_GSBUSCFG0_REQINFO(n)	(((n) & 0xffff) << 16)
 #define DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED	0xffffffff
 
+/* LCSR_TX_DEEMPH Register: setting TX deemphasis used in normal operation in gen2 */
+#define DWC3_LCSR_TX_DEEMPH_MASK(n)		((n) & 0x3ffff)
+#define DWC3_LCSR_TX_DEEMPH_UNSPECIFIED		0xffffffff
+
 /* Global Debug LSP MUX Select */
 #define DWC3_GDBGLSPMUX_ENDBC		BIT(15)	/* Host only */
 #define DWC3_GDBGLSPMUX_HOSTSELECT(n)	((n) & 0x3fff)
@@ -1195,6 +1201,7 @@ struct dwc3_glue_ops {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @csr_tx_deemph_field_1: stores TX deemphasis used in Gen2 operation.
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
@@ -1447,6 +1454,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			csr_tx_deemph_field_1;
 	u32			wakeup_pending_funcs;
 };
 
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..4c2eba2a0a3f 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -223,7 +223,16 @@ static const struct dwc3_generic_config spacemit_k1_dwc3 = {
 };
 
 static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
-	.properties.gsbuscfg0_reqinfo = 0x2222,
+	/*
+	 * Spell out every unspecified sentinel. A designated initializer
+	 * cannot override a single member of DWC3_DEFAULT_PROPERTIES without
+	 * tripping -Woverride-init, and a partially initialized struct would
+	 * request a value of zero for the members left out.
+	 */
+	.properties = {
+		.gsbuscfg0_reqinfo = 0x2222,
+		.csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,
+	},
 };
 
 static const struct dwc3_generic_config eic7700_dwc3 =  {
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 5c7431d711bf..70f28ed16faa 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -45,6 +45,8 @@
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
 
+#define XLNX_MMI_USB_TX_DEEMPH_DEF		0x8c45
+
 struct dwc3_xlnx;
 
 struct dwc3_xlnx_platdata {
@@ -517,6 +519,8 @@ static int dwc3_xlnx_probe_flat(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		probe_data.properties.gsbuscfg0_reqinfo = 0xf0f0;
 
+	probe_data.properties.csr_tx_deemph_field_1 = XLNX_MMI_USB_TX_DEEMPH_DEF;
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)
 		goto err_clk_put;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..8fa7f0f696a8 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,16 +12,20 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @csr_tx_deemph_field_1: Value to be programmed in the LCSR_TX_DEEMPH
+ *			register, setting the TX deemphasis used in Gen2
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	u32 csr_tx_deemph_field_1;
 	unsigned needs_full_reinit:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
 	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
+	.csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,	\
 	})
 
 /**
-- 
2.43.0

