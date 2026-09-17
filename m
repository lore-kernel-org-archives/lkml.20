Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4E4DAFBD;
	Thu, 17 Sep 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657114; cv=fail; b=EMLTWkC5Ba72oRoeSpfNfoPzBAbcNkWKA7cSi6+f1MLP99F3nSyqzcsCQMzDl1ORZPm+sMyaSssWEUIM+P60426FJ45GLkF9tkdyri6xQmyNN5Ip3qEj7XRarYzqOMWKVUp9MBL8HdTCZjSpYMq3Y/gP8vx6UZ00dV633uh+VLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657114; c=relaxed/simple;
	bh=D0Wuy0tvY7GSw5iX59g6FZq3xg+X9PpsQ7GrWeiR6rc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c8JkIxGzCek+Jep0kBV2qMgRcyg9ZA7huIiqQJ2nWNAFrsFWITqH41/iPcWgBE1Bp2xQO/KCZx3TyKVBBM3c4ZCEFELbp9qySCes0Ulqtt1wgHxHXFLFO64TlsRvm/h5zA0gvk1tsuPXURqhVzXlhoaLLj8I0q/bP7fE1tVT4E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L+/iGqwD; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L+/iGqwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBfnrCUi9qrK2B4u2Op+PW/OhhEhgqQpq9BCOoeSL3DhnTZ8Kmn+kGe7jNCPfPve9MaftHPBRRwIc6dhfUUYDRLPjdaqIAud80l6mhDEzlQCCNVeUWGl0TmpC6nPk9eIPCOOCJ32+//jB1RLAihw5qAvFfWmtbQOpD483XIw07toBDjqQfEehYmd/gtd5HdtMa2+tvF1dmqcGO8bMphbyabb2ivQ2ULTt752AcgMswsCkBJin0YI51kKTfNgygiN8vqe1EOZIJLl34TJWftw6VQZo+8oCgn4VwGx5AzE99+u/XZ1NQKXb6qRIbDorp1XvFZu001TRP6bDI9Zccwhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7agiONl/R443cWBil/+y7Bv9VaSjnOksfSXOsJiC1y8=;
 b=lZizRNi+etYVAzAoraMkXM0Mt5iEenHPVoEBSUlbhCcQn5sFxQcO9HzNlYBjz2PBkY47uH5TrCOaX2GJ4nnwLaQR1AdqkGyiyztBeqe7EcUr1Vj/Rrcpx/d+fb9tzK7tdyPupqWt7+Tk8sDTT1Swxa600R7h9EKGC3VGdZHV8kxnRrr9N10i7w0MTvpTisj/Xi7IrMFTrkPJ+4hFeI+mVKHaGHvblnWPVKLso5pHgaLO62jEAlYXDSfan3ALpzfcQxeATPQ2xrSX6rBToKQDGtJoGdDJ2VYouCs2MjO2+U04eeaQp6tWon6K/uowbYnXczFjWRS1TYPIQlsoI7sh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7agiONl/R443cWBil/+y7Bv9VaSjnOksfSXOsJiC1y8=;
 b=L+/iGqwDsa69ZQUwt2bCHcmXsq8V5vzyRiJn/cJkR8AD/Msxg1YlBMndIAGMuCWNm1sOs/Y52P0rx47mzQywoot9m2oXAgsLfXOyWglonsuYwQqEasR0CS/5YWwcz/BW9GXzoq3kr9G+83pZ3jo/pmUuPolOwp08hhRQr1RADw2kFfyDOzRFYhWnekjhDmz0d1CM/dvjUJ34yJLdklajoLf301Ewg0Fz4N/o8ya7cnW3YLbsr4FDVz91WtutPE159agGY52IArzZi92n0ld5NKYV032mWXPvQ292BgV4gzqKs+lihNkoK3g5HAbVK3jSvRsCxokSLlji+ToOOdn/ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:58:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 14:58:15 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add #phy-cells for usbphynop2
Date: Thu, 17 Sep 2026 10:58:01 -0400
Message-ID: <20260917145803.838836-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0006.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 24583495-9cda-457b-e03e-08df14cc19d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|7416014|1800799024|56012099006|11063799006|10067099003|921020|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5ky3TUmKKIhkjkiogtngBbcgt31cMzI6mrwba9ndd+6GH46OIgGHKLwbJC2EWusf7gg3pkISd4Lv5YMFTrmxuzlMQ5T4ATeA3lAEC/hoDtf6B6JWMuB2dHeE+Ghrdf9h2efSYYI4b/lfC3bgfgG3qrP/v/UA7ewMrqI/qVnXuSRZXZxBw3dCxIcyFJj40IaUvW7sx2O2GQsDVUjpnv7c0I34legHWLguIgmYJuVPVSWET5DPVaIZdzPwgSGNXdAz0XkmifLvQGulTycCiZxbt3G3Pweie7V6VPBHU8rN+viGHx3aaUSJM1IG0Dc/OvXOONZUagFi71TOmDzFuF5YLoA1jKjDN6CJpuE/MOZ6gi2ab5Zk/gAxwYP/o6FU1ygC54P2i7MmNvEPqftJ8/2h8R2s+0lnzyZl5FXXVeNM4a47KGozstsBtk2bAJIj9TBxtEtAAC8FHj5fHHSIrtFvJqO+WtbpdZd97u8bG0NB4MdN+g70giqDFVdUcur53ewzHbXOmpZL7DKSUO27jdfxyix0yRw+Wo1/hcItwiIN6dpDZwNPVydzjwNtLZpQOwfWJU9nyJU50wyX/5kCIc3d3bk/u1WUgwezzEB7leknjSiLcLy8uJXZUSEVHe5d03/Jw46/Ch08auzxyXFSfJFlvTvbfxMUXwj2nO+v8S/bm+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(921020)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RULpQEwlNE4PE0+C/3lb3AExg4lVmZ0KH1II8DZ/9SpFZen7+mRfdJAIokzi?=
 =?us-ascii?Q?9qR2C4uTLy1mg/2PJHGLmMu8bG3TbZ9FRwCBc1jB0WtISQnc5oJIyv6WxyeC?=
 =?us-ascii?Q?37vgQjYZf0Zrx+/8KaIpVWYWoio+kX1VsUo5m9029sysjnuROlJAUy2qHom8?=
 =?us-ascii?Q?wOMw8grMKrge3y7YXhqWL95P/DLBYB/15JHiHIueUc8jcMVfVd7z8GhubOXU?=
 =?us-ascii?Q?lQqxvGFu1z82L4JGqE4BsA58MBWaxq/e7vBQWyd9A6DQUwiEiLuitXxd3Q4j?=
 =?us-ascii?Q?rhFbIKwB03N78O5ku8jZl44/5l5SgcN8Tetsnww90EJtrPdhgR+uoSwkxmOi?=
 =?us-ascii?Q?63wqVCfVqpaBlZMUmYnbu8tPRvVHTISEoFoucruos8+Vfir/3ZXeALF0YN6I?=
 =?us-ascii?Q?zqkajr1rOy7OFtXPtZ1HFVuzoimcOTkyhIR6+jT/fellVIQivqj/xWNzgk42?=
 =?us-ascii?Q?RQgT+j0IuzfIAPxXq0NsEjn5Bx8Cxv0ER0WG2jz+daWHP+OE05pm6pL+/QHj?=
 =?us-ascii?Q?vaXZYIaqbOOFymkmHLlR/rJnVoJ3kTBT+v4mMbTd2MR/HcuibuUo6JnsXF5W?=
 =?us-ascii?Q?702uOWey94ajHd6xr9/sBMRztUudkFjQNV+EyWNR7WW91Ok0Ep76/mgOm95Q?=
 =?us-ascii?Q?Up9A7X+R6k4lPvECD+A1ZY3t5i1+mV8gkrgBF3JAiJuiaelYhlvFZxGtsaXe?=
 =?us-ascii?Q?lu8u9gB8svLrQB+NKxRPYON0cswBlMHKHyIe237cXqMJFl31iTN9PbUACdiy?=
 =?us-ascii?Q?D2E4OBES95Si39JvCXVJ9C7keIDgVHJz/lKvCKwlwvCnGaZgIDf9EBbf8Zee?=
 =?us-ascii?Q?pb1g3dkiWqH7oZb7kf64ULcTCrOmJRNNeLyHJvj5Bw5MTCKlBqDgft4B2S8H?=
 =?us-ascii?Q?N4RMiSXvo0/13uR5Ns//+VazAGQsUJext+HdzcT1xl9B7xXaxlmqoA2IL462?=
 =?us-ascii?Q?eHdRblK5wWqvtlTZ2OxQQCDNqSfJsTpfSKuxpWm2MxcN9PPi7fqbeM36qHhj?=
 =?us-ascii?Q?lONnBQHGPBRqEH34IpzpKLpuddZigvHNaNx5MacToxW/LSI4uFFaoGPWrOQ4?=
 =?us-ascii?Q?gMEarRs6UZiyD+7T8uAr0i7GSBeZtaN/8u8tTHFB4ZVMtrWzhTX5emSNZeV9?=
 =?us-ascii?Q?8e/xzvS2iFbCe1q8pa8I5u7qnqfu9K4HeO0KW3Pzep9mDAcGLdL9Jkc0Mt0m?=
 =?us-ascii?Q?QUUZT58vd93JjIGl4nNXEOWlJBjK3BO8CjgKmuvC1/HT0oQOIT/QCycN+uQ/?=
 =?us-ascii?Q?K35pxk6qIFUh+mcX6yIYRaJ/1mZrg5pGaP1ZzSEyF9o2wVbg6hLLETpmbB42?=
 =?us-ascii?Q?7yvkrZ09jRFsnJGc8CpByTQnyVc5K8mEk13t0DEm4sqDSpULOd4wVmy78jZ5?=
 =?us-ascii?Q?zbkPdGJYvRMNhO9ZWHOyHfWyvMK/M3yS1RtPuPCXN1WPm5y+nqylTXj2PM54?=
 =?us-ascii?Q?cYoRY9rv+xi3E9ctqDDWhusVWb7Cdd0KMJCP8M8yPqnYIsQYqhdvQt5uQCF/?=
 =?us-ascii?Q?vVlKtXsUUOtKQ8sPhlxC4fSGn9p6qHMq2w+rCcvKH5lJt2yG7P5UiHGwCm0d?=
 =?us-ascii?Q?fejPtLz6oLKzBKgBWaMeFrE8YKukPt+Az7ctfkELr4nry1VEcuXEdyYH2Csg?=
 =?us-ascii?Q?t+mfJPUf0W/m4YlytYPiBMBp2ijC0uzdQl1xum+APbpnWv9dEyaMbfynwLdw?=
 =?us-ascii?Q?OiJ+iUg516Xe6z2X1Ok3j/CLYfEynDybTtjzaxaf8G6jcurQ7TOXLWJID7P9?=
 =?us-ascii?Q?bzn9pjgRPyiyxjm7RTPe8LqzlHeqqSgNby9GjyA+8PL4T/zpacIZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24583495-9cda-457b-e03e-08df14cc19d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:58:15.1051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86cC/1L6zfdyiwbAVP1lTfrd+zOeK5ojXNv+hUb48N6DTKU41e2mzUFlJxguXKs9rnJU3GGa4JS7bRpIGv5uJIj69/ftpUm2BzSk3KEKgHKV0kkSTtujZNR2DgjD9Wx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992

From: Frank Li <Frank.Li@nxp.com>

Add required property #phy-cells for usbphynop2 to fix below CHECK_DTBS
warnings:

  arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index c7063aaac4a34..61c73e701b10d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -9,6 +9,7 @@ usbphynop2: usbphynop2 {
 		compatible = "usb-nop-xceiv";
 		clocks = <&usb2_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "main_clk";
+		#phy-cells = <0>;
 		power-domains = <&pd IMX_SC_R_USB_0_PHY>;
 		status = "disabled";
 	};
-- 
2.43.0

