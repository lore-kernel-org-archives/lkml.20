Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974096;
	b=z2JcLfKEr9XgUlB0Xr1NehIpRG2xDUCScwnfSZN7eZxxLHFHtF6dGC/Xmm1SAw8dzy4I
	 NuGn/tGSWxxTFfz98DmBMwdJkUUfR7waMW4oJ4WpO2iToA3DB6lC3/uKHMhpE8nfU4IcX
	 d+Ta8HPI09IanNThIt52kvs1STRDlRH+KYgd9XhxEw5d/icIuXw9b89DKl7j8jwv5Y5Ni
	 eEIR4dzdckiFB209WMF3jQBvdkDeUoCv2ElwBLsjUyqDFEZSE5+9b900XkcfPV4PIIqZu
	 LFkAn0hhAcPjqmKZTJ7HZLN5qeEvUncum5Yf2V34AvRXbXQXohnju8SasEHZFDg/S+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974096;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
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
	bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=;
	b=YO7XnxZkP0SrRqG0x8RoitBfQTmA4jM1KcnhJdCVhbdoE4/vgnByAUEzvt7CikdTwfPi
	 3JiQtJGiM7wQdupej6UF71G52u4hweEy7S8KInDOa0iuqBFNDElcjMoW8WuoxAJBJ9lO0
	 BDP/Zt1negat8ZPUgXM/P/bRh/ZWMaMAzkhNf9ouOkhE88VI5T1VhGM2h5pG15rdrIYby
	 g3imFYXdLjklgJfI/kcf02wZ14Ysq7wBdUEBb9xEmeiWfHVbGdEwFSgRbfEmCCT0r7HK7
	 /Rbg1LaBV4d5Db7I7tm3Ifff3+DWcVT7RKbK+kDzu431TRa0M6UMsiivK3AJawDp/KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=VqlCqGhJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.139
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020139.outbound.protection.outlook.com [52.101.84.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79D606A335;
	Fri,  6 Nov 2026 14:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F79D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=VqlCqGhJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVv5PMap7W1D1yJr9BhjMlMmNmxkt+6yvk3hKHssCn9tE9hyMmGO6O6QRGCW3pfBPhohxkyRKmmev+wKzAhn8RKANUs0FZBvqOE+yMr4hhxKvTH0woM41dMSNkExszokv+RwRCTk4XIEkjHhIgqw4PKYvqthjkSZPqoJWHrwM3fSvE6HeDwKfXTEt51tsfSQmLhE2Tfnl6S5C9LygH+ymeS1XpXdvnd8/u1CCiZhQxso5SN8cqyBoN0jAn/q48oLWtqZu6Zt6sXa/xW6inkfvVJeZjWnt5ctvybxiHE5e/cIvVvGdxeMY4oEkDl38U7edm9TNNXnjD3Qc6FWCPDUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=;
 b=U6nGqWmClrIj2/VHfWzj85U5ltGDpJcPejgQL+mVDDAAz53oziBYUv4K1Gk3Rr9t8VjQm6k6M/BXOvNcVVu1CmRkii72o1eUJ1rqUkevP6c4OqLK1GdPdlyA2f+c+E6PDc3DWnzivBLmFOUt0eEt5LqyxVuubM5cUAyv9IEPFdKZxH5Qr2uY3dwTfplikgDC6gmOQszAQ2SMe2j9ATf9E3neqcxgUpgcZpVGff7N5r88n6SlsStzPGomblGfphiB9oq8DW/sOtjvyNebYvxl7evDocqC+DAHrZRUuITuq1D/h/iUjSbqnE1JPbaWZ7oKQAMl88Uyr6+0QLBIaAeB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=;
 b=VqlCqGhJI7Dp4hEsc/pwlWAAQgyOz+siIwuseafJ504BbxZmGx7dQ0IuTCgKSF8v9Q4/tQC76Uu5lDndn1N3bnnzfeYcJiE8fPvPiFW/9Mc73ja2szK4Cmrf2e62Z9gETpm8bCb4XKurJ2aTZZkITHCZomqA6pTz4WZgpoAsVlhiPuW5RomRjuX3VAxO9UFWkOEdrejHyLZqq7J0xvyr9DKzSdZQ5q3mWYbwvsCXDubNww2znfu8LDaxMyHu1O6r3RTazfPZ1/ZPyKcUTXSNAP4qB1PxOISausN4tg9YbyBiF8rfj538pa5zMd+uER1OCEn2ULmS/oCTV4TUv6fOAA==
Received: from GVZP280CA0029.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:276::6)
 by DB9P195MB1370.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 14:08:11 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:150:276:cafe::4b) by GVZP280CA0029.outlook.office365.com
 (2603:10a6:150:276::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 14:08:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 14:08:11 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 6 Nov
 2026 15:08:09 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 6 Nov 2026 15:08:03 +0100
Subject: [PATCH 1/2] arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-1-aea3a86f3f57@phytec.de>
References: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
In-Reply-To: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jan
 Remmet" <j.remmet@phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|DB9P195MB1370:EE_
X-MS-Office365-Filtering-Correlation-Id: 973e6d43-f033-4d1c-7b4b-08df3c0f6411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|7416014|36860700016|261022105027099003|11063799006|56012099006|261009223027099003|261021121427099003|261021135927099003|261102123227099003|261028144727099003|261021123027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r2Z/dv3eVfS83e5Z+VKA1IAZcny7pXJpCbNABlYtqfr/xftDAC9KKSgSV0e5L0nhmTl/WKyN2Bhmz625JABVMFVciFqy5t9fZvA/iLL8uFZaGfz50X55fosUf6AKYOf5mRxAooH8Etm6tyevn2Tkrm+e4Lz4OAXjP4stZCtm7h0in3Vdmziot6Pv2OGn3EOpil+U1l3PD3pD/smfuRV/r1W4q+vedjk6nYtZ+RC2nxnSmWLOLmO1dTBrpTekqCBjuX5bjD1n3D40kAr6X1x+pYJbXhy6PWSuiTDuYAs17Ta5JaB4dOYb2AyBM7eTivDAaZ8MXuZhfNff/EmmIodDMtZhKjbZOPqKidq4AB+xS4VybYPk6U/gBJWZk4Tw04a3A9D9Lwo61wZYtzSlv7YgmNaQ1LrCVQ22ce7GDPq5qPt9EwLqCywgbjPSeZjz8kVCt3DnpL8gmOaoZ+rza/+aEa77iH8VkKJ1adIwR4zwc2qDBlwvzO8prJ+WdDro5o40YI6yYnGRosnRNl3E87bIqArsKGL01cQRMQIatgf7nO61WY3NAMPBWApp++NfPuvVQiZFNChkBPGxSCVjPStGztpFuJ+6QREY87fiIwY/unXYfSI+izHMTIUFDEoFXyEgJlLnvXh3yDAK0+tMqR50jNhfDG+LVyPbVhjIYVXQE4QuVZVNi8PAzWHR9Bdrc76c/MIJtUY2hy3vNkH2KYwVcw==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(7416014)(36860700016)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261028144727099003)(261021123027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9wBoDWjcuNA6t25/WwMWyvyAbQr31i/UD2wuhwWwXRF4ADJaoQwujPNYA189FCvpNrtqyKHFp7x/XBjoERVaCXFYzmxrMleOI9lW4xr9q6+9PKottnxYogS6QsGlCXLNnD/MgzsSqt0IiQtnCN3Re7biQrLm1V6vwzzNusUub+/3jNR+mXkG6Y9v5FuKxY19L+sRv0X7KZtW4h74FmoSArIMzNGTZY/TILU1hZ0WTJdgKbSHoirApk4caypYzxX39j84SMxbUqJZB0OxbvxQqzYOcamTgTNh5MaQ9ub+ZhNZ53P2t9cApsTz0ruCLU+7V0ZNvnTw7bFFTO7auij2erZUSM/Zeoivs5NmPc7tXXqYzL0YIdiGVCw4mMMPb/lubjMAgqmDNuxv7gIzKQ3VFfUCVVCfl+BVUSk2ZAYnGk5voge7fkv53O8PUsK7vrOe
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:08:11.0371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973e6d43-f033-4d1c-7b4b-08df3c0f6411
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1370

From: Yannic Moog <y.moog@phytec.de>

sda-gpios and scl-gpios were swapped.
scl is GPIO5 18 and sda is GPIO5 19. Assign the correct GPIOs.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 4efdc6bdfe12..8bb2a8976df8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -289,8 +289,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	sda-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
 &lcdif3 {

-- 
2.53.0

