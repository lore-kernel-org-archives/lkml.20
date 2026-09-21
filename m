Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C851FCB8;
	Mon, 21 Sep 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029623; cv=fail; b=UlEkDlLy9/TwQ2gkC+IxpM0cVZotW1qU6/WupdWqxgI4QXL/96q/DIK++r8YtaTA7PExqI9jvvwwRHT0YNuRgSNvkWvnhsuOjKrCR32ALv+PNgdDQMZ8ZKPbMwR+ZuVmdQPQzRQjBqiyWUD6GZKNy10E//P2X7NjLm3IcGHPi2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029623; c=relaxed/simple;
	bh=dp1qqVEzqvB4Be+89RRSg9pQHqDpA90F7aXlPmyuTfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KIn10QbBE9hvPcGpCysgGlt0dPeJXnvOl3uUv7G1cfLxTpZUU/tHLzCr5BUYMIeJCUuDLfDxOChruAuAGkOCcuYjBMZs72tHte5saYLLsFxBdz5Tr6ctnbMQdRn1e11kqOx+mhW94iTEuXYORg1a/kk3ZK76XkB0vhU2hsgB5hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c1+AL6i8; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c1+AL6i8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDiEj6YRYVnzcR/IDYS1WxCjiIhq8nmqFlZCZJS0SaSbqVFRC8nxQMK7MbU6W6Xcd7Ck4LioJnW8tNHgBRMgQNVZ9IVM1+nktUtHgJ5PC5z32XuCtWRnA1FqT1QqpK6ChFv93puAivkrIjuEGV43JEhrEFeRysDx2wK39feC9OyB53GPEIh6aGSd8D8I7+JsZ261caqzmSCOjaemQ9rN9DBw3XqR/yB9AD3VXrL22po3DNz/9JPlolQOR8Ktx4mfY22li0UyjRTojC6QG6y+Su9SXSal+9LcnqsKucn54RpqwRSKMdyF9MMq9nyxqDfK7kvQSLVkIzv0b4eP7ZBKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Rza6jJL5kpc3CBmbpZO95JZxl3xLwsMMNH4sRc4nQ=;
 b=WUgr8X8a+0rcTFifFnAE2G/Oyzwl1V0GeMOyVIbOQ72GAV5OkAIuOGlxfwkzrBQYe5HuCe/+9TF/KzrfUUMIHuHRPCYza79Vj4swa70V7bLWj91svNVBrBtwlFHkHQiAhaI2U4PkMW8rbfXDMQVTePSHhnTdCcxGtFwf/a7zSrS0pWlXG0KhCZ4JhGr4ypMqZKDnnWvhIdUF7ssEIPmycaqb93vaJ2hh6pNlJTcV9/fM3mrFuEKn6o8fNOsYczreawjkWNAxkJxtpQLCXNgC1KqpGza2gtiwtcHy8q6ewH+d8tfYsPXH4H3IrTGLLIEYvtsJ5Uz+NzftXu78S4fSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Rza6jJL5kpc3CBmbpZO95JZxl3xLwsMMNH4sRc4nQ=;
 b=c1+AL6i8qpPMaufJRssms1Ffh3hd4XxI71hZ1ICxCNQ7re7k8BqtsH9fNtU4ttKWmRyZrGTUgXlBhu2dCh3w13LxJvXAkz+DShGeCW1FxqY+Wam4gFfBx1GZB2Qt6klrVVoINqIjXjdQqwTbNcBO0oWGaEOy7Vg/RZAWxEJ4Lyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB9927.jpnprd01.prod.outlook.com (2603:1096:400:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:26:59 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:26:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Tue, 22 Sep 2026 00:26:24 +0200
Message-ID: <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cf1023-2cda-4a9d-ef42-08df182f7359
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Z4BfUR+slD0WhMDBx+fRaaoDdztHARlZMTOOl6BaQTBSAzlz2r4CvFup7o6itLLIGtefLbrGYT93Kr2vMJoDxWZOBQ2rGZqvykRE55ffuLSBnNud5Gkb37efPXZtjpbGdOQWqr0aZKjhT8lXgktvX7fTxPgoq3ya2c14iD+gb4Ax//tIYhgOh6HunQuj12ebKny+rqG2mUmdIMrGSzlaGFtQCpPjj99bFWhgNAe+ikA0X+yEiKyjbe3MxdxXordmdroUO0QOyheFXLqUbhGM69TGuKQ94CxpzE5eKwGJKLq1/IFQuDV8u4Bt+B1P13swbOqVtZWbhQ0riBZBLUUxpf+sm6oMYW8C4lP8G1nafUUzsttqYH5mFietq5UX79FM018hcE/yuKsn0cflCi2F5XCzl41C+rYBYLhiyd+nzNN6l+3zwBdG3ppDg/Dd1O9DFxSyHksB6BJ6oOXm7OkE+fHyRTk3jYMGA/Ol/CxfNuqYq2GaMEIVSDbkBHRTVQXsllti+u2CLAyNsn64HX4Kl/mVF8mXRCW/ebFDSSTlYrhRDBSncNv6jo4wwwDGxEuKkWpkvyXq3FQ01OPTPthP4bLtK9WEb1r+2Xf+KtokOP+HaoKAL1CxbBv5XUIVkHAYF6eVIE5suj78OcECE+OtLS9WbpNvSFNCFxibFynOskccCZLVrw/0tjBESq6KB46A0fuvmalx7SSgoBTQR7OKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oR0yv8kvdm6AoYLBVDWtz9oo643yHIgD+ceJ7OzWn/h4+avE5UkF9gr4uGhj?=
 =?us-ascii?Q?kjviP2K7GEP3UOXBfzLdTox/lO3PYVkj/WuXLAnrnUhqawC4K196bRVZ6yhf?=
 =?us-ascii?Q?M7juErRkzcqJOnIX7ao3TWnITgaYLeWA7v7puxj64Vu9ou4u5Z3C5CQaJr67?=
 =?us-ascii?Q?4j8Pac+SjB3Al5EdTfGvz2lCFZpADPPkR4KC5YfutTHduB7W71j3cU07Rxm1?=
 =?us-ascii?Q?Lfc/OYFS9a6gAontZrab9HgCWAHJ5AsWl+h3zQkQvg+dvnczbgiuCgKScTeY?=
 =?us-ascii?Q?kbmHKaz7A+RT0y002bsTvOfSG+zSDPXO2SUcpcFeGMf+04ey3o3C1bY0+1lY?=
 =?us-ascii?Q?sqpPFjMcty0uAA42r2IorE3y17rH4Gyk5FR66pXr4FDSDSkr2UTPEFkjA/w1?=
 =?us-ascii?Q?vNRN5xjmH+OLGMGy6a2bQbsPlvypN8HYB9oKXRXuewtjDH9RV1r2Cm++mHdI?=
 =?us-ascii?Q?O4z+PkDB0Y3Kr0VcunrhXtG31MRSIrW2aYKV/jN31vziUS8wJVVuSShEXQ35?=
 =?us-ascii?Q?eI0Nsnib+JL/aNlBDwTkPv7VdCVFa43XOnupsra4jvJ+Kn2te7G5H4TEO9n2?=
 =?us-ascii?Q?6IBD9uann1YXn3A+E05yjaE1lWbOKhOm4fKjcBc6lAeuvJdddsNncRFHw2LD?=
 =?us-ascii?Q?kXvZmVZ1/S7oS+pgWYDG7QrAamnHyPK/X5xpQQYMw4HBVApztzXcGiTE7o3Y?=
 =?us-ascii?Q?Nt/heRhWbVuWEILzOeqOwRmvEEQJYJbn7O3v6sBvlYCFFs7c7kgfb/Ryzcu+?=
 =?us-ascii?Q?/RP7+mvVCn67ZlerUoPfWOBpvqopSG4+xqQE8FlPEtG3lMy9yXgDjFmtYt8u?=
 =?us-ascii?Q?ATDZ3nZxH/+Uy1NWtDGGWUmii+CUlwlsqFlJ8uJpAk0Qjs9l5vHZKoMs0oPT?=
 =?us-ascii?Q?hlsRwzHXjG57na2qL0Lyxhy3weuq5ETgqjJIatK/uk1lhW1BSLQMC6PtZCb4?=
 =?us-ascii?Q?k5DBQBxz7NrxIBTBRh+UZ648ZVAXG2bfQO2w2+UBbryvFfkanMThpxJMPApa?=
 =?us-ascii?Q?ON4ZsayPnZPM/08oarfvPsQdvGPDA+p3DZqN/a7b0EqrZL00T8S5nPTo6Rez?=
 =?us-ascii?Q?22cnlYqAowXXpCF2ccKdwq9Z+tj5nT1ECJE1n2jj/xWgcZJInxwxVW9cSBLy?=
 =?us-ascii?Q?vEbWbBLbwJAPKj4c5LYqG4AuvCHOpihkT3o20wPrJdg9UQBGpNHPZwH+Kybl?=
 =?us-ascii?Q?a9jskpMBHKHDCptexruvtaeEkb6JJ97Rr2I7jtJlkxYBDfNKBWw04kqleXR7?=
 =?us-ascii?Q?uQUCfz7WMvVSoYJX1fFIaHD8Mr4osd+Wdu3oslTsZS/v4FZecO3QsVZkzSN7?=
 =?us-ascii?Q?ZyRMg8190x7wjLmdF7Gj9XsdQaC6uFxvU4b89X9mcQnbzkbyyJsZWSbRENQ0?=
 =?us-ascii?Q?9jjju1hLC4Nz81UTKuwoQpadmVewkCSaUX6x4c2+r2in0aUZ8oGCySo5NWCb?=
 =?us-ascii?Q?O7FjiQO4nm9e6EF03Zp+mC17MDfPeJBIwK3WZ/5JUqcuuFatsgi4ACA0d1ag?=
 =?us-ascii?Q?DS1xART+FVnGAj4WxS4eJbb1QLLTF1vdDc/SZ+KWXGU1+BQ6S9NqtGuOjarE?=
 =?us-ascii?Q?25Qt58bwvE9EndG8aq8GmqiEOmEfhjVF9nWeTU3NvMAATZCg+Gq6f/+KoBdq?=
 =?us-ascii?Q?IfVQ5ZVV2Z3cFdRYIZx5IDDg7SJkMNQiH6XBYMNyFGf8ia5OM6MYp/h1kZfk?=
 =?us-ascii?Q?1u9GaA5AL1esM/2oyg2zl/Q56K6OS2snS3Zz7ZNeYzm9OJDPWk0HcbGdT+Be?=
 =?us-ascii?Q?4PN76K5UbJf0PpSwEnuTEyKsQgyuRWmV8deXej/kkCOdm78CRcqp?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cf1023-2cda-4a9d-ef42-08df182f7359
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:26:59.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4f89MsdzZDx5ZG4xNfDP5d5JzrSro8Z9VESU2glnYvptzHZsphqncBNT38v+3NXpwxKLffteLiP2hETqDlE55Rq8MgSBOXGjudsn2RxRK7Qy590BesI5A8ozOSyW2P5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9927

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected tag.

v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 72120e2abf8b..56ceedfb8ae8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
+			status = "disabled";
+		};
+
+		hsusb0: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.54.0

