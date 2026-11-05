Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846517;
	b=R8Q1jbzfLRS1l3nD/gLnX5DXDobKD6k8Jl/SsOPmgU/g0JwLicRtw9U7r2LIaIfXcupK
	 dBA01FwKl2ybG+5Gar7LQe/+n4a5/EH4vT67WCcYepsJliCIj+4AfEMJSm1pxob2V/fIy
	 Nxxx0afbY8ctyaefffBCUycwaVLEYQWGZlpBqd23xMTO1u7lpVoJSV6lxWz6TBKdU1YPT
	 7L9I6eJFKWCtQHO5aH0zvNw/9NwYB1TuVBV+y9BoVAf1Yxn3lzAVOlheHVygIZYS3N/3A
	 cS/NSWaup41sdgQeADwbcpb5CdEVDqfa6HUzurh12NhAUHITNs1yXHGiqEs+fPqwMOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846517;
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
	bh=mh5/0omJ6GxpQsiZRp9znkmOiBoo2fWN5kfoka8rEq4=;
	b=EXiTD+uI02TA8GDSNzASemesCl9EnEzUWnUt60791rgndOLMZ13y5ZVjfnRsMVpXLxUC
	 ZZ2gjfQKHBNLdICC2NiNwhecTNmgZJ9lLYvpir/rEb+0sah7CpNHYemHgmubUY6UXah2O
	 fi8U0Bj1eikH4IHu1SzbLKWvbx8aXnifPb4DjF5QC1fRwoHXsohw+2K4xPgCw6DkFx9sF
	 BCGmqmT5td3LcvVA+LEi46zTr/kj/5wHR1NYGPhlc6fhLPUAbmcOCzt77edarri5vs6k8
	 G2F4Ktqbxt5Gom26xYV7cNhmlNxpP4P4s7ijnEE56wknax2t7ZjdMXIKwBYm9Ri4aUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=SYWlecIR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.51
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FD606A31B;
	Thu,  5 Nov 2026 02:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=SYWlecIR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaBu9imavlWWTmFue3t8bsMOwRtEza1H9Xm32tqjdEd9fSBIEvCvdQRF8pjPhZYZIFbGDMlflBOmA5+0rbmkA4eDU64LJcGOIeKqdUldVy9scXuaoQnlLDaYWJ2z2INdvwXhwgz9Zgg3jUciYi3CNbVzF2P4sei+ZGSGcVzFcszjhwJ9FjB6Y35yr90kajVlvqF/cdgiHunC1dFIuCvZrOnzLM++/YjebjtAalgr5F0yQZ/9RF2QU6tR18UgpGtybOGGEn8oqIh7tl5rMwPTlBb89PMVnZXo/+gs9lAg2aiD/pR/vNBPwUQEgb1HR2hlOKwUcHjGIfQ1CLN+alyEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh5/0omJ6GxpQsiZRp9znkmOiBoo2fWN5kfoka8rEq4=;
 b=CNDPGD+babK6zyAA+kgNzIT8dc3z1nn0eImz0OdYJrEtTVOhG/kz0ESU+9BYF6bzm8TPTYxQw0VDq87vFRYqzCOm0X7tWReJWqCOv4/j+BD1tQqhJzryXjXMmJz/F/eoCOPC1vWg/gwAZi+7/n5m36nPgbxuOzaWvwbXGHoN/5zXQq6fnZT9f0igjebkyKZtL++gfpyPBP7gGTC/LojNWF5TDsaUkUcZkTciKP2bjqa/+rL3oY6vTv0kiyr0vhqQJ14bLBZ7ZrRW8Iz3735pNi1gkyM5jeIfXXUypsWNNxUMM6x2wLTjBkzc7bj6lOu/EJFX0Yzld6PH+DJJviw4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh5/0omJ6GxpQsiZRp9znkmOiBoo2fWN5kfoka8rEq4=;
 b=SYWlecIR2sQUBAStXzRN1hAFLp8/UdmdUvaWfnzO4Gsw5gdCR6R7WKvTJBqN9Fy+so+86CwCg/n3Vx1BNua3Cv+JZpyoPdvK2iqXIgjbF+6YGOXxHRER94RUhJCwCkV7zTDD6cKTfr9JB2Bh90wFzg+2W6SgNDa83n/53BDxGehRYnamlUvh4HMNxQUdqcTv2b4uAtW+wLpRkj+RT8DBH5a+7yzClWTuxYqs9Hq+liuTK4mA7k4W2B+Mem3exi/+Q0EZnyoqs9KLPMSRQMaBDGPnZFqR5OcP2e4utYYDhaRA3exljAuyIDb+sjFsey7GqkG40QgJtm/JIAkwRy4xOw==
Received: from AS9PR05CA0161.eurprd05.prod.outlook.com (2603:10a6:20b:496::9)
 by AMBPR10MB9780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:76c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:41:52 +0000
Received: from CPH1EPF00000519.eurprd04.prod.outlook.com
 (2603:10a6:20b:496:cafe::51) by AS9PR05CA0161.outlook.office365.com
 (2603:10a6:20b:496::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:41:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF00000519.mail.protection.outlook.com (10.167.241.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:52 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:45 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:41 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:17 +0800
Subject: [PATCH v2 3/8] ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and
 Bluetooth pin settings
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
Message-ID: <20261105-add-bsh-smm-m2-v2-3-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Leonhard Hesse <leonhard.hesse@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=hcoZm4hzuriy1HfSBWIr7Yv3R6zsqUgG6amV6/r5gVo=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7lRzrhDT/+aVHKSuKHRGakVLFfayq4sLjn33fw0h
 49o29dvHaUsDGJcDLJiiiyqCd5nJa8GmE6bWQ03h5UJZAgDF6cATOQmJyPDOYcj+qppSbHyu/e3
 qMWJPt4642vTkm8Vdy7v2Sbk3Dadi+GfxffNOU3nfjAUc35gPsRdkHehQ9jPvf9xz8uq/AX7p5n
 zAQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000519:EE_|AMBPR10MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1be137-9219-4755-ec3c-08df3ae65933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	FgPu6Dg/iGGUWTLWGkKFmikhsvUIVqodjkLUI9X+sQVs+HmEeiHXhJlSxbTLtMwzDDaYI2qlFBC+8uPsDjpwh4itQ8vhUS7CJlt72vZmxen0vrUA9kJqrFEHQwK5z42HNl7KHfLkh0cs9yOetegFb8b86AXi4zJOE1MRGT34TueFIjoW5rBPQAVG8NRPwj7FfSBK1xJ+uHfYLJN4LZgByEit/GDVEwwF2mw+8NYujSZoW9UH+2GtenBowkYEHdytaGq37fg8eDDCBnTOf2NYQtjHZUfTxY3TFVHhJexi7ie2rUPrrSsv5IPHlr0C3ifQ/SywZ17hhXON3Jff3U/w2pvsF3Wrzrks1W4hFAQp/lHS5jcetSBTzNHDmMKiZ4gnqraJin/w2IQpwch1pBok9/Wcopa10X7AhRd6OpKOmpi105AaS0QdVeRp1YElJnv8jh6QMaTuLDfaPx3kso3MgVKCggT63VA6PhTGS8ICPYDkokq38AhUInG0rKfEsfcd3QLyWMQBnnYXx/JIhTs4v0CMreOQxtZI4zvpLaJ5kaz6dCdENVxt9ztC22vNj8F/co5ssA8t6yD7cNd626Z1Nqq8uw6FZzk7j5Au/BpTFO4l74soLwQp7Eh+y9V96p52ybPYHfbHuizWx6IGOCE0yHiQZuElpycD3cWg/y56cDBgnGqJLjitSZPqYnyQJwSr4D4wHFA4wCOFOVVjNWT5DA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NwZGMt0It6HVhjLgybrLOUu8i4b9/C5ImaupqWSyG2G24HOYeyTXyQW9OZ9+9yJFi/1lO4hc16zoUkd4GO8rdcGEw9Sx0odVFcRi3e+DCzazupUOfNCMXWusaLGZ3SGtFW3sxhog2bSPQnH4f/wUvw+08C8e1Wh7j2853fkjowBSlQWDtjSNNUXv6Ci2vbXbyRuZk1bdKJu5JjwsOutQjBgr8e48bKq381ztPyUsfSPKBrn4y/nVhLzyEyu3g6XT4aenhpz6XLvCkBMkbrtnYlOqpSA9rSV/pkewgpcXWFtg1hOEEbhmb2qelKL+mhUUoMBjPkUgzQdSU5B/F6VzIpdL+WgsF3GSONfRqESqToedn3m9ZQDBKaU+lek23obj2rtDojnsyxC/k+xCu1/J1mUCeqLPI8sk/vOROTjrI4T8HOhmVBKrnXFBN1JW2BgO
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:52.2609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1be137-9219-4755-ec3c-08df3ae65933
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000519.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9780

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjustment of wifi and bluetooth REG_ON pin settings.
Tests have shown that minor changes in drive strength, slew rate
and speed resulted in the best performance.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index aac211a9f9eb..dabe17222f13 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -125,7 +125,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -146,7 +146,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */

-- 
2.43.0

