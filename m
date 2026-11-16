Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794833899;
	b=c1QUXWGPAmkN0/w8WQtZNYPl7TNQI+b3xwCa3EMgua/pbwuUOjK8gqdo3gRsL3DRkn+e
	 0pfDzPoh9/W/hOXLQu2GLpOZ81duq8K5azO9SLGnTIl/0HzJAeazHr+437DVFw0/amGbY
	 BGi2smQZFU4WcEzwko1rHRSAwxhwIE9eZMka3K+7aYpLRYNs5Y2z8uJM/P9One4heqmeo
	 mupP6hYbdO3NbqlbjwB6os5HMz7r3YUT0YLBTf6mdyjcAcQrQPH+DWgu/hIcWrx5VIPpm
	 NsCai3UsSuK9wNsb0AiDI94dISj79yPWqf0pjO5M3W9w9MzESxdOTsnbnvGwKolfKsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833899;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=RIUQI0JQHvFeREU8Myb9hCMnj+Sb8GvxHUoTg7q4Gzk=;
	b=rQEUgG8G5boR4fMcbbGF3XHr1J8w0GT3ddh1sp4s18Y3fGFTxGU7jdV3T25q5/ccnZk2
	 YYzQHg7HXMNQuCxSprk0xOQsmGTNMO9khDH6HULB7NVchByOUEst0buR/zvynPjQrft8i
	 k3BS2bwj2da3q+eaO07s+aNw+1GbPy+Ikdw2cLJBPWhpvAC7wBTz7vKHKTvs3AZ8IsbrZ
	 v2g3vMalNblb0HYfrRFey722zxuBNXgqdfWiOeWHgYGqVtBFmLpr8yrk7Uc/C7vqXuUXe
	 ulkA8kxdh3iPQgkSgV3xaqfgFk5VG2kOBTgOvI2S0Dr4zBWcy5zwQ8K2ZdARdSBULNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZIpBObUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.7
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1632606A31C;
	Mon, 16 Nov 2026 12:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1632606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZIpBObUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIx56i+5p6nlcgI6pB4/OOuon6MgHjIxvwXznoUfngjrSXTItNPZyYGM9yzUE6Ybf1+m2ZceFfIKzOBjd79UDgyiZgCgxe8QsQCZK7HfZU1zrznyFumQmFNqYQVIV3CW7X8r4CHcLNtp/PTfzcKv+9C73py2QEhafo8brgoXlB/pLicJMiMBMNDiVLbck1zW3RfWoj3ZMV5Vll57Rw4Is2LSNplih5smRKsyLHFWjTtV/WAURHbJaqMw52JFCs0WEhZkKk8pgrtPIkswuU2/fqIrtEs27aV6x7ty9uAil5Q3YTdtcN5Msu1C7Zy6V7jgXO0XmH9C1pwosUYzl54HIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIUQI0JQHvFeREU8Myb9hCMnj+Sb8GvxHUoTg7q4Gzk=;
 b=nVam01TbExNUd7ZSesGS5zGe/SKK37oESUTcebHd6ET5JBCHHIBi0PAbDBXz3mbaR6rGXH2Em8QdCmkYZPqbePLm0V9aEcnDp6+CEQU8inlB1KEKdVUgcpJWrQQ4u8u1A9cqsOrT3ZZTKRsF43303x7FyqvogiOBnc0z2WmuCWHmMaPAFFjGrMZyx96AJnVI2q8/alM/hav4JlR2YHdF8nl/cKhI62NcswHYiCKCNXGC1mxS+jEGXf/25djZhwB02jR7GF0RBOa32q3cfaDKMYWF7IwdBssKF5rfWmPTp8zecJSuFwy8zHyT5Wy0FBT//Pd+kX+O6U67DpImsjLjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIUQI0JQHvFeREU8Myb9hCMnj+Sb8GvxHUoTg7q4Gzk=;
 b=ZIpBObUDmPn6aorOt6T7bkKAb10Lec4GZcprMoVQLysD4V9n1Ti0yyJPpigWjvX8Wb9TrUnzbYwdCC69Bwq01VP5WGiyvbLZYqqllt6mWWNqdNb91UFY37Pf5Se73wJwyZwjlBQzrKzkSnljGbvhox02cRIOugmdvwqjyD+kTgQ=
Received: from CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::13)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:57:13 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::34) by CH0P220CA0011.outlook.office365.com
 (2603:10b6:610:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 12:57:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:57:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:57:11 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 06:57:09 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: dwc3: skip extcon lookup for fixed-role mode
Date: Mon, 16 Nov 2026 18:27:05 +0530
Message-ID: <20261116125705.323670-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: bf93f22b-6a6d-4e01-d966-08df43e1221a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FehbWyn9SYWT/DLWZitl8+2YjvbBaHLzfDAMrglEuV1fgXo2ubWFSMoUVlmNvKnE0jtWEVaL7vyLepCifdKzxGuCFBjUdskt6/LYZonOoIlqAyuWjoRxYIAo1enCF9d4PmXLqCGsg8EfLbm7ERefvzPW5t5iX6IdfJfHfRbQiyyfKNvBPaT3J72hrUKdiGa3Ce3SrOuWvuo2FfrAklGdZniqXPFZb5pSE/K8OfOaSwpAoP08Mi594Ad8gzszBHwss56uwH7jO0RMueknC3cJ741afxR6HrZ6E4e8gFTam0Br/s1M/9uPiKr5iS/q42sTiri5DgNlIPuxgEEVl81Ji85xNOA7jH438c5ysXbStD4uIx83dgN9v748wsnTCtvocvtcPN7IJEnatXixWxta6zfCsn4j6Pqb1BOsVE2+5qfEdMlWCUJXmBz+/P837YiRyN3LbmR0pBqRRbxbj0/Y5zw5/RtdzdiZ1zHavk9nBgYlqnUIfe6zKJR92vtr0E+6wGHoZtBIE4LR2v3sNBQ42WDwRHHRUm8rWObyraseHKCSoLlqz0FwkHvjxdYTd6ZWQU/g5uDaBemrI8B6yMwznJnThe+/zkbn6kIkT7HPiIKQnNR6g/ok37odk7ZssB1KgvqR9bOWTcLKWunAnBY64m3bdHjZtPr3OM8yEMkw7PQOvuLieG3lKjbtwTsLTaQViExToyDFoLLyw3KbK9btnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Suf24N7p49jN4A+x5widMRvxR7vJugXop0yCWiFUzDj8cyrxo3F8SotH87MPcT2A4p83LiVwqhAndh12qJa4TlemUbz7jL7OW7QCfQ4IKhOb842/JurAKgc+2sAScOsqpdvRx5CTvFkXBDqEWQhbEaLqq55bhQK4TZpv5lrzFsoV4OmlCbVwbLHGtt2S5wj9HEwdbBQ+JFCl5hVGSaZ2X7RfFa7ydLh42lm2fKmq7xkVne8h9fZuRMwb/vaZNaMfk49Cb6YiOLaSqnMvKm/lpzGl2XPwkw1i7oNAfX4zAsdzeCX/BrZ6IjwTVOiD91H/jUncorao121aEHvW+6l855aydUVbZ9cjFNvAoba/Is6ktbwASjNKHNajSvT9r6xEOyREH/Y6xzoH5Ug5i07FWUi4XgOI6M9j5+y4Ts9hUsP53WWzRSNxC1Z5KP/Hzn/R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:57:12.8156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf93f22b-6a6d-4e01-d966-08df43e1221a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680

As a last resort dwc3_get_extcon() walks the OF graph from the "phys"
phandle and asks extcon for a device bound to the remote node.  A PHY
"port" node no longer implies an extcon provider though: it may link
to a Type-C controller for orientation switching.  There
extcon_find_edev_by_node() returns -EPROBE_DEFER, the same value it
uses for "not registered yet", so the probe defers forever.

An extcon is only consulted for role switching in OTG mode, so skip
the graph walk for a fixed role.  dwc->dr_mode is still the raw device
tree value here, as dwc3_get_dr_mode() runs after the lookup, so also
derive the fixed cases it would force from GHWPARAMS0 and from the
Kconfig role selection.  Its remaining OTG to peripheral downgrade
cannot be covered because it consumes dwc->edev, but it is only
reached once the lookup has already returned NULL.

The check stays below the explicit "extcon" and "linux,extcon-name"
lookups so those keep working for a fixed role.

Fixes: d182c2e1bc92 ("usb: dwc3: Don't switch OTG -> peripheral if extcon is present")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---

Trace sequence before this change:
dwc3-xilinx edec0000.usb: extcon-dbg: enter, raw dr_mode=1 node=/axi/usb@edec0000
dwc3-xilinx edec0000.usb: extcon-dbg: phys[0]=/axi/phy@edeb8000 graph_present=1
dwc3-xilinx edec0000.usb: extcon-dbg: graph remote node=/axi/i2c@f1000000/usb-pd@22/connector
dwc3-xilinx edec0000.usb: extcon-dbg: HIT - no extcon bound to /axi/i2c@f1000000/usb-pd@22/connector,
returning -EPROBE_DEFER
---
 drivers/usb/dwc3/core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 372737f4750b..a70cfa9e1df1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2003,6 +2003,26 @@ static void dwc3_check_params(struct dwc3 *dwc)
 	}
 }
 
+/*
+ * dwc3_get_dr_mode() can force a fixed role from GHWPARAMS0 or from the
+ * Kconfig role selection, but it runs after the extcon lookup and consumes
+ * dwc->edev, so replicate the parts of that decision which do not.
+ */
+static bool dwc3_role_is_fixed(struct dwc3 *dwc)
+{
+	unsigned int hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
+
+	if (dwc->dr_mode == USB_DR_MODE_HOST ||
+	    dwc->dr_mode == USB_DR_MODE_PERIPHERAL)
+		return true;
+
+	if (hw_mode == DWC3_GHWPARAMS0_MODE_HOST ||
+	    hw_mode == DWC3_GHWPARAMS0_MODE_GADGET)
+		return true;
+
+	return !IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE);
+}
+
 static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
@@ -2032,6 +2052,14 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	    device_property_read_bool(dev, "usb-role-switch"))
 		return NULL;
 
+	/*
+	 * An extcon is only used for role switching in OTG mode, and the
+	 * graph walk below cannot tell "no extcon" from "not registered
+	 * yet", so for a fixed role it would defer the probe forever.
+	 */
+	if (dwc3_role_is_fixed(dwc))
+		return NULL;
+
 	/*
 	 * Try to get an extcon device from the USB PHY controller's "port"
 	 * node. Check if it has the "port" node first, to avoid printing the

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.44.4

