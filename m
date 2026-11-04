Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777876;
	b=lX/XZl/KK4e9Vfv08LocD+0FUVVhMLUxm+YFEXApKI7Z5o3po7vj6jiOgW4y4LQq3E0h
	 snPbV6zxyC3xGhyjZztbouunr+QSMxgAipoUCydJyYl7KY+ciXLB+AnO8GRRo9FGPyZ0k
	 3LHOWBpzPD/PQFLU67Lnl55j6A31u1134OoLO8BAYmw6omc4G/QdRzjqJicPuu01AqxDk
	 tl3ZLvN4BlbzOUmGyvRrpSAyqf6rbhdrB7yTnW8VO+CgX8Ss9qm5cLf/WmqaXj5oxGtkO
	 kUcZBXYra+20HmC2RYM02RnnOZTJw0KQbQ6xA/DcO5i8k1o2Hi2pj8KUtM0CtmEqiDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777876;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=dhv72M6pOpNrcgVowCMIeU/choi2rTEoEKfJYimGPe0=;
	b=S6mEpX5EMfBrgazIjcaTN6kK6fDE2ykxC1moO83g6a0cK9is+G0OZ8a+1+7IQPXIMty0
	 zqbbuQBCfuM5scnSCjCD1iUVk05ZeME8oKdjvYVV+mgoZn2wR66XD+wggNrsJWMgnxhwc
	 kyrTjLzzzHdBhaW8jVZj15szryHaOxmH1llKq6m3x3ohxPsQbM5xgveGiLOp4Yl6u2aF7
	 62/RCnVOUo05PHpJC93v8CMaN+I+JT5wW7GUZL7tJX1v3X2MUtZXHzwh1ZfGJzklEYhyJ
	 okZFEX204vcguh3IBJXFaHSXTLTCmr+5/N897so7vLXHRxzZxiSFhIWrDsEPx6K7KNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Kk28MWNX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.71
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16D606A328;
	Wed,  4 Nov 2026 07:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F16D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Kk28MWNX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCuYgzjisObE5XshwEeSEeVsILaQpE6xspwRkXiraOlM4cuRgU5suCbLVCNIiOuLOv2aA1xBF0M83vUnnjON6uo/h2DUrXvBiLa1KX5gOhSIOCBWMN0GBKy/eXZ5pv+dnV2+Y5Qk3c4UpxQXm/TskSnmxMp/L2RsDp6SpZIcZMPBxcKqNtxfxsNDAIw72o1rGWQ+81LOnyrqXMr9nFA9VJFVnvswnMrvFHOkj2jxqAfa/eR29Yao1/FixYYILEq7bzTwOhlukrOrr+Hbuhc3F2nh2E+MuJDmf8gMTwdrMSaz3Hzo013K/Qd3x8UGCRugXp3OAajKkuS+ia8Q76sdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhv72M6pOpNrcgVowCMIeU/choi2rTEoEKfJYimGPe0=;
 b=Ajjwl9oU+WRVcJz5RGOn8t7qPUcgBWxKwmuwa6krzMnkCwAjHLCqcMjNal3qZNbmPvahUzF9DJI+gy+SrWPqhQYdCALq5hnGDuovwkxOHPzd4fgbE0bzyRTkN02ZwBofTYpetjYIkrWrr24QyIZ0XHmLO/sQqbSlC/j9ql0L+ejEbhcfMS+ZHRb/ckraZIWOJB7plWm/+9rkp1ioV6u1jAGbxKmhYeUCdLDrPGNJMdQRstHmVB/K02grCpEDUT1VmtgO1dzEVBxEbkwZsugc2fyX/Qq2kyX1/sbBJEPJTiLRMB431U6IfEz0vjzklZD/dHVsokEtaMP+nr1M91tBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhv72M6pOpNrcgVowCMIeU/choi2rTEoEKfJYimGPe0=;
 b=Kk28MWNXX2d7tfULpC/g4mB6CMdGqOuKH6Q0NPcfjvdYqotlGfVXAYIqzFjkxVM3zAFtAypO//V6PKFk0q+YRVXRZPnWtUN0YtXUMqAFkMAAQXCbal5lXdOMkUOMpu5CNqG4UhqAU3P4r7BGvUB+MTEsFs4UtRbaEbUAsSKBEuk8QgVSt1XTNY4k99OC294m7Dppmscugfu1gZOuCP+WrSuMUGP08R6SRic2lvqf02EWT2nD7BUsk7k7cyaWuU8mJ2H9v8XGtpq+2pPqv5zWSqCDgTa7hH3OpJKbL04r99cqdYkoIzsNM5SScdx3qCLuAeknv3szvui7YA7jPY78Ug==
Received: from DU6P191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::19)
 by DB9PR10MB7387.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:37:51 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::4c) by DU6P191CA0032.outlook.office365.com
 (2603:10a6:10:53f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:51 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:37 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:33 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:45 +0800
Subject: [PATCH 05/10] ARM: dts: imx6ulz: Fix BSH SMM-M2 WLAN host wake
 configuration
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261104-add-bsh-smm-m2-v1-5-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, =?utf-8?q?Roman_Smr=C5=BE?=
	<roman@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=ArdAlMmS4r16xlEd02BHZuQ3feXhdLInJsh82xHUBls=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVhuLLNj44EpZ1oDVXoSU9Yzfb0Wdvl4I5PO/1/1u
 3SOv37v3lHKwiDGxSArpsiimuB9VvJqgOm0mdVwc1iZQIYwcHEKwERyvBkZTjl4dhhJlf/6vfnR
 HC/D6Cinsuh976+GNXz32bFa9GLeL0aGWQpK+Vnqgc0nmGws5Wwn3s3Vu5vv+EH+Np9slRjr7x+
 sAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|DB9PR10MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: c21baa17-3909-4731-89dc-08df3a4687e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|11063799006|261102123227099003|261022075727099003|261026121527099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wvr6W1RXB9CsBVQaJEPUWz5YMZKY8JDGHiXu6H7hvsd/iqWFd8pCr/sF2eTbxf4yiMyB+rHjGaEuRVaRsQ+nDkTsU21753F4tf9nB1PsYBaCrJeM47wGKds79+MzZ9Nxxgm/4uj41pJ8rUE1FnzNNK8LKgG9+mgt4mcUU0ALcjn09vHmkLKoHKm/QtbgnH2rUITqipWtnl7AqL+2XI3/FIA858t8dP6X4LYJ+J1QiHkQKyrPNOQB2D2rn8c/oy2p/EatgFYwk6Vgs4XIaByfGo7ARMcsvtup7X6L8/QqFbP/EdGbr6DXxlOE1OLXhVx9GzSwT22DfVbKhvbsz7+E+tYU7lW7P3SS43aZ4kv2FqLA/E903/ouZIART58nhFm/0vloiODad7EBYrB/12VKI+ZzztCMt6ittnNTXJqyaDsg2WFRni6ussoxOmuN8v9aGg5y7jd6thwax0MALl1OhNq/lVHl0amw785Daa5sEX9bqxj9PMR8ZaYVNn2lUjEq9IVzFhfINtDLKswhRU/IsW1FyBFLYOeDgCJSqOudmOJWE0olIgxDB8DHq8FWno5hxxr8d09qw+D2Q+qKf8gCkbOldSjAumZc8jPlHgrWvZTQry7oQmc5aCbrnG12sqSSQhfxQndOiU9OxAqcCmd8bd27/KXsTJQ7Mie+G1ahGHeGxK9XqTuMcfmq45bcC/iz2k/xYsNKNcMqY+ypHSu3Dg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261102123227099003)(261022075727099003)(261026121527099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	afg92Nr2yKQF389MNxYVZfCG3bnr2a2z6QhN2BXstQ7yKM8uvW92eILGpPWGqT8NU50wbpk7cVFj9a5gJBfRe1RfdL6bvmF6FdKJv6oZr7QoPnUeIBRQ8pUh2gFMCtexbJCaAzCKGDmXa//aTcMMnje7i2VN6ug70Wp/ZbXf8B4Fz1TiSURjVBEFbGkb/bW4nWZbVOqpeFslbJtJ/dDS5pd1D6Cc4tBYtn3Rpdi6GqP5v0bfFFR2hC25hdRFjfElEtbrQoG75Bo5bjhf+ThbQ63DY51zas10cFBt/RuDdrqvxKDVi+woW7E+sPrScBl5f0IMi7Z1+EXla1M9ID7gRSZ1WrFwS5Co4PuNI5BDUBkqZhKt3A1w4/NhAZ/JRpnBb8H5mI6D5nF4/utazZ+nK7Nj5n7vfjU78eZKexXtBw2UdptafFo/EaCAOL8YS91a
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:51.1018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21baa17-3909-4731-89dc-08df3a4687e5
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7387

From: Roman Smrž <roman@amarulasolutions.com>

The pin is active when high, so pull-up configuration can trigger
unwanted interrupts during module loading or unloading. Change the
configuration to pull-down to avoid crashes there.

Disable cap-sdio-irq as it is not used by the driver.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 792d23a39390..362a26a2a1b1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -85,7 +85,6 @@ &usdhc2 {
 	non-removable;
 	cap-power-off-card;
 	keep-power-in-suspend;
-	cap-sdio-irq;
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	status = "okay";
 
@@ -152,7 +151,7 @@ MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
 			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
-			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
+			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
 		>;
 	};

-- 
2.43.0

