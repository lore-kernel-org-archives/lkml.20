Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927796;
	b=rGpPBIoNp2NqVVJVI8B5xdEeh59rpdGAiFJAm6KWlnoCJ6fAu/mFLjB0E4MZWjLfG0w1
	 FO6LsB8b4EAOW5ayYb6f2JYbB9pCh1OgURlA289e/7+w9xTtJ22PQv4FQEEivLmTJxzvU
	 q0KmU9Mg3GPxadC6Eu77X4etONGRdW5aHlKhwW9CGhSW1SbWpPL1V4S0b7OE7sleVs+zI
	 G0q4irmk65uM0Bfbqv99NtP5GlOKfOUaVGApMKSgTdT6z79DK81hIpmYeeQw96d6DWizX
	 WvkGUa9RMKRQS+IfNM+JVY2BbxC96GFXV0Fc60FHkfOUlRVNJkeA6UFHZvdI+ho9TWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927796;
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
	bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=;
	b=tW4//nM3jVNYTmYJV8cLzrN2bQTE19MFSqcAuGQez2lumA8FX8KHEAqE15KCZb3clI/8
	 iiR+Sdl4NfD0lss2xXcbA2C1b7paqV3ul+aWSL0FL/6hY2tCQ03wt418l9mQa/BDkTbfe
	 qKg7rjgKxIFzYd9VcDTkan7kbscoEig8AYTQCdsuYP+1BvIaehnsCVcn8qi0ur32QFRuq
	 bBzrtMoYsQN0wRP4jC0jLagTfJF8CY6WTWvmAdZGOHHN/6WK0xipc7+y0toFcovesYutx
	 eQTYkqTM59KcH+7ZcokECTIh1XZ8YRSMs9zjhH2QEzAXMveQb3z5jPw4ulsCmRoJvkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X6tY4dva;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.9
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990F606A33D;
	Tue, 17 Nov 2026 15:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4990F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X6tY4dva
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8DrwAcZ+s3CcI1BtCNHZnGXc1EE626x6Gu4C8zvV1hNuw28uEd/m6LETnTxws1WWi5pEwPG/FVvKrA8lUcmOGwiEwApYcoyydK3yRLFMLTYXHnmsu3thVZGP9fKq9Nb6E0R/C8GHpOvkOgFtyvUE6b34CDLQtmsaTnMAhlNrPv52prmdfUt0+Q3I31zzp0LIEbyXJRD5XgJjIV5YM6I50wUBy8xm1i1ROqwfOg/mOOC5EiNMdFgIq7Thwa8hE2PWITBqut2HkV+tk9uWYEdGvkPaVx2ukurCuTK6Wr3EJd/mjxIK+OhkOUpLMAU2ajSKiE1ny3lyq1qLGMwe93riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=;
 b=M8opHcMjix04tZKO9lvFnNaOL9uakYr4ZnBYHTzsZOX5UwEhz8zM8Yh6Xii3qqvk9WcnwRXYaKagS4FBEP6B4fnQ8C9P+M8F5tnV/8UxA7ZBafUF4fKePFp/lYHhLWKzkgNdblJNAL467iq/RelHL9Sy3rPfSQZcJoLy/W5Khe7PMaia+8KmMyYEmD2zVEgYPYyeU/bpKw7T8S5JRHCtwHD+x9XmLZyQYGeXyZ/3iJEXWs+3J45c/CtUNhN62og48Twq+G7W4GU0QbWzQm8KSbtXSk2ZzWkdHF6x2Q2Ga3MEeFZ1iWVjqo6ot3vldl175ivC6cuEXB+3W8t4lp3OAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=;
 b=X6tY4dvaeFn3F5gBenHep+XFhZDf8VgADRvGfze1zg+xUL2HadpMcsRB5kxHUP2RSTi4rFbyQ+KMvYijW4eIOYTHr6yBRHFwva0DNWkecNlAdrx3GRamIGMIW3QJ0u7nBFIwaHDqsU2v+OUbd0Zwze7+s5dwlAV4edhOp7Runro=
Received: from DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) by
 DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Tue, 17 Nov 2026 15:03:05 +0000
Received: from CH01EPF000BE942.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::3) by DM6PR01CA0007.outlook.office365.com
 (2603:10b6:5:296::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:03:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE942.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:32 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:28 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 1/4] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Tue, 17 Nov 2026 20:32:15 +0530
Message-ID: <20261117150219.1326693-2-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE942:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: adc561ca-891e-4747-fee3-08df44bbe21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022113327099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KAbzObPyrhAzKEH1kSutjH/yNILBWitTF9qXv3Bm2YFo+7uREcpJHZjopGl/D70V1RSydMB0NQUA1wHMFna420XVNyI6xDObfueKmfQuUAg0Io3kAEc5ceV/op3fOGKtRY2Y2yd6cacmgngRCYefgfgwAPdW61DB9S3szNx3oBJIEBv1sFAtenzHEqgu7O5WEYa7MgpSCucjmhnc9nnxZ2/werw4ZyUaAOhRMAH/ipW6K8IpAteY5B8eRfRWitUkSnyv7H9UdP54qGhp/KfIzoV/cwhYuyOaR4pd1hAZ69cYfH1JqB+lPfUIit5w+mX+J/qViGncdxmNH2AaLUHDQ/q7qGDltrP1CqHT5ik7OzjpxlCBwL19gCTEixOOWaDMy+nYSVo/GM8aDTLKcNL6mbc/+iZ1XrP5tbLC6mzog7ROF4qcMC2N83UiOOy/SK8SeQayuaK0Dm4N6O5grR32VKI3dAZ/6gUDyy1Qb+86ix4VH6mskpoyCSIH+d3q9/o87TE7XpUWQ9NjwD09ooBTrgakXI0RewGaHV9fLLAAvFKVGe3lwcEWjKZmk896goivGfm/oqCfXGJADjHdTJr8Gyu0D7SEtJHYdlJ7YgmZMmMgAkeQBlcihS5l+aopWlPEBqU5wtzangjTaciW+o+YeYJHFT6SjOoKqXP7PcqDvE+/3Po5JLh6YEALJQgoOqFEn4M2c9ck2XslND4N1hd+Yw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022113327099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qWR/IIEoDJ02p3126X6p+UzoZpYDQXb10szuDnsq4sLsKE361nurTKgh6jKXo16xxDzougYQlgV2Hw3pmowTcXYx9Pk3xBl071+mh0K7OktNW0ShIVtQH8HO+/MFImGuMQenM3wB82i2bgXghs4jC4PUfbG4kpR1+QdoEweBOKcYIiOwLLemTqHDWe7hm8Mw7pVYlmqCjgFAx7RATs39ac1hb4hmlhUa88ih0gRQCYQ2oL9+ZHuMj04KyGd6RkMuxpXWbiAumQSUHPZu3f40FdwCZVzLIGw9glqaAWkgIX8E4xjWFXwpxp5IqRbsbDlNmt+IzNFENBzc82U60yRZba9svxEJ82MsuIL/EfWqKhJObkBN9bObCep6mNEGV8JeKXLByhoVKUBmUHrkytNceyfLCzgrfAoz/48bWbTaANatKIjWo6YWFit3pnWhmNi3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:05.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc561ca-891e-4747-fee3-08df44bbe21a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE942.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069

Use device_get_match_data() to obtain the platform init callback from
the OF match table instead of calling of_match_node() and dereferencing
match->data directly.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v5:
- Existing standalone patch merged to MMI USB support series.
---
 drivers/usb/dwc3/dwc3-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 095bc3dde0fa..b58fe034a94d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
@@ -330,7 +331,6 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	const struct of_device_id	*match;
 	void __iomem			*regs;
 	int				ret;
 
@@ -342,9 +342,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
+	priv_data->pltfm_init = device_get_match_data(dev);
+	if (!priv_data->pltfm_init)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform init handler\n");
 
-	priv_data->pltfm_init = match->data;
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
-- 
2.44.4

