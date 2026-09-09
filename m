Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B1498915;
	Wed,  9 Sep 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944146; cv=fail; b=gSNaFkJdTUMWeANGY1oZtH8Oh1BnpS8lLhazaWAbLvMRIfSD0glVycXRft+sRRg2RUEc11tz5QnNQglG1RVEwipv83Aj5aToYSEteEKSAYOYnb8y+mR2T0Qo2GmMsr496ezg6UR4e6f1A1ng95lHzCPKdFQi1GbaZs3FvQZGQRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944146; c=relaxed/simple;
	bh=VUuORPzsU+W2AQ1AMzkoonw0Yv27cJHe7mmxxDeUpSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RaHj+tXFAtI/VjVStt5To5WDJ5sjvkGSXg43FWnbgb7jIpyKzVEoa01O29oxEpnu9T53DQImwc9NiDZ3uN6xJR9TTn/NhPbneyDInQAHC0nmBMK+djKNdWslWzeGKXNXuip/3zakvKhRgPyk8ioCrm/uIKcqL4o2y3HVjgh0Lm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LcELTagm; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LcELTagm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8SXiyebHBqbLUO1Xw4AdYXGp46Ye9VUGUub+tFj+EDaGHVvkrPbMvOofgTQhtwqvD/+aOWPodzX88zD1++LdFA11/BxcTxwVOibf+ybcSmoTVHvktFgvP0YXknWzeuYsTgRcDxfUUIbUSkGaycYQykbcZiuhHEShgVSHDoYGUKztNiiyh0UPA44/bkdqc+8PquwntNxxQdYMMuLF8z4PC/ExYbDNo7HJPk1Gtpbgb1pAWIx09dhYFmr+x4H1cnPr/KuAjcNn/gjBYgAx5TDb3bnG+awGqL6vZZaQI3yhjfQtVzBBtqaC4g1fOXdNuqB+bACEfX3Dt0rZUtJCm0pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk5PD1lgu984fQT3vrWMU5l2XFJI3Gq2gzEv9lcMH3s=;
 b=lalGVe35MBjm7qqoDQpCef2HSYkyUTwwToH38HrcAxpar52WqBk5CsfJMFGjxOnkzTKi89+Mu3R0OJ7AZCm8rYba9+iRXSVxSviX8ahRRxLypo4pRC3nDNhwqu6HsP60M7+/eOXrHYtXrGWarRbGjy0p+E0ByoKR8RnKg78Tl15at6yKfapnb07GfuVzGWR6ULmOqsbncwOp8HLIshpVIUMcohEDMkKYuNaiLxTdAaFsBOOV1pxen1ikYUxqDWFDwMQMkxg+G1zawie0Qbizjg9wEFXYRiW9qewWhqSjuRvySK3VA6bkaNDoAhi2ZbVUV28Fd5w4TL/KT4Fxj5q+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk5PD1lgu984fQT3vrWMU5l2XFJI3Gq2gzEv9lcMH3s=;
 b=LcELTagmVhQTpvaTfdLSAra9nJqqVP16Jz784oKJgvmSLoKl6yRwerEn0153EFi2d9qgFIOGwwuhj5hnyW6eGKtY+XGh6fgtw6L+hDdpVbxikGdfyCkBgvuohttB7R/Hydue/fx9jStiEKbeB8wUyZV4XJikMW8wuTDyBX6VJE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14425.jpnprd01.prod.outlook.com (2603:1096:604:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:55:42 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:55:42 +0000
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
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Wed,  9 Sep 2026 10:55:00 +0200
Message-ID: <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB14425:EE_
X-MS-Office365-Filtering-Correlation-Id: 90418fab-20aa-421d-33b4-08df0e5020ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	b2IaNf981QvK49YFwwRw1ifmWR3+yWzbevNkDnoFDPGBZAObVV4eEEjiyJOlnDgqObPJ2DhCXUZ2UxVCSrJ9Ifj66/X1VxA0yRWL5wz48c1Sl9Jvur0FSEIcPEocfGiAfyPTRkweyXUyLQr3KsrUnEoRD6K1EZ9fHah3P/TTa2fh6ubUgoQWRtOpUyLCbqByz7qlq+ET5BJ2uufRWW7hAG9O1y0WNy2eIF9d2ERsONTntrMgLzIAlP+tnqHpdnYma5R84iwgvTOltgCV1xODRoyuD9G3i0ds5BsUqQX647jZUtDFxZPQGe7IfrJXxJ2mlmJijaRt5/1E7Uw0l8pjUUdXV8d+TXC2N3AbWn6otZKxnWjlvBKNHma1OgZ1+IcBbWZxIFniLWB3Gfqur8IRzUsTkNW87nWQTIclEaJPGGTu7SxZ3s7kylxOksq793dXAA/KBz6G1BOBIr/8Lw+D3HPbUrPLeQkObV3dVJjoWj/7rclVgmkcRnOs5HYljp+3v7JngHdnh356nWP+9/AQTBlJ18/hwzA9E5vdP5u1PsK4G7NiAcfh6P9Lg6WS5uQe+KfIYFaOY+hubhJCpMdZhQeT1FnmGkBJLfBrbCTwRbTZ8YxQAZdROmCo1Wifjij8VFAxWz/hadQA6ln++oH2TKZ5LOx9fLzDePURf7tqCfRK/eqnN4sdrQ4ojo2hW3FAvTEYAsyrkjPGBvnBCu+sVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YyhCkD2TKPSG6xYhMwKN2OZf7AdTLiQFXqdi1miWNIvOWmonyTR3IpKtRTDj?=
 =?us-ascii?Q?abVpfLxWbhlFSWmb4Joh7hKdnRobmn0P6fNlYUBP4WZWBgRF8XKE864lmybo?=
 =?us-ascii?Q?4fp1WSi4qcTNrebOQw/QUbzz9awR7+ar7XbTmw6d80Trwk0WOTykNahG/mHD?=
 =?us-ascii?Q?EeVi22veBOC0hA2sFrzXEQV0TdTWGdZ6B0pc9Us04Bwwcx+U2+eNg9IbRDPS?=
 =?us-ascii?Q?KOoqCZYH0bKSHwQ9pubCJA5LNpOQtMGfDBseJtn/7zcMCAvO1M0OcAGpVRoK?=
 =?us-ascii?Q?2nXK/sQ+P1VD40Qz6bPrSdUZOA0y/33b3DGmw7AZwS9iOUeHE9VAEnbttY7Y?=
 =?us-ascii?Q?FhcZTyN4jyY/b6fk2Mjqpml/c6lThketzl77IgTHPsDoiwMrMTuNdTGMsm+m?=
 =?us-ascii?Q?6q/33JA/sT6BRFWr9mlp86lIvc0RIclcpk28m6F9TSoYBuFrDS/5w7AMkusq?=
 =?us-ascii?Q?McZl0pIl+3JzCycVukzAalILguRHaBCTCfbw17y8mVnQ1zESznrNjsaTBVcr?=
 =?us-ascii?Q?Rn4MKY2y0UTGhcmYETZj+ImZ12awdr73ZwAkTLmigO0IsunMtB1IEWEl0nTe?=
 =?us-ascii?Q?nJAjJzvpuc2aeBbDpPkYqxTpvrvKM288mp98xGAUQccOKE8owHb7RQ0AzsO1?=
 =?us-ascii?Q?h/TXuCBsGCG18vPqZ8R0hH+pe9LhtXt8scspp7A4LMluoH19lHrdGzr92khk?=
 =?us-ascii?Q?bpzL846l2k+OVqCxS89zXDA+srQIfrbUVhC86UYPF0SfGfSSTg186Ra54bsi?=
 =?us-ascii?Q?z483GTBbZJ3Hy+j+jueKOb5D6QyMqi4GLLVSY/UuzTSTjLJJ8/UFQranYK7d?=
 =?us-ascii?Q?UVtkGpcMFos0yodMKa9Vy1z5PP83cEkIVnlRgLm4zrnDtQWltpkUA97NfsAX?=
 =?us-ascii?Q?FgLtDPiMkfVtapnYQfH8FeE8Wcb7bPtNWCIRS/AH72yU6OzvH8nm3bzRYYBN?=
 =?us-ascii?Q?ZhySJRQE9b2TaerNh/aiJ6RiGpEuJaAf6E2A0TMs3iCUYsM4QRyGLqH1SFDV?=
 =?us-ascii?Q?q6ULGDC7cOWA53eWX3UBg+2vuG5Vubhp3YAml/oG/766KB3oyrYP9pC71u9r?=
 =?us-ascii?Q?BeBvpCfxtZCuNjZOhQXMLEtmVWKuhOUgACeNRniDIp+hyd81bEbIPvN+t/9O?=
 =?us-ascii?Q?c4JNI5FSd2JdzhrcFGsw4OZ7inKr5StRFTfeR7FIkMDhrwrg9IyYhdmQwfvQ?=
 =?us-ascii?Q?voUVmSg+ty1MGLygGid2uhDo0XKZSvGinTgUHUlCQ8icxqc8nE/cWjm9aRaA?=
 =?us-ascii?Q?b7tH/hJaxIWlfZZvN0sKNOR5qVUla0LzI0/w4u9KAxOoL3FIkAJumJbOjplU?=
 =?us-ascii?Q?5QOUrH1phClq/faVdt8JbA/aDtk0tirQvcRwiK7cXU17aIorSuhQ8oEdDkuP?=
 =?us-ascii?Q?5PGWKvJXoB7Z/kktMnesQRblQ+Qfgbe3uC5SGNuheTSDAIuQVWpU7QdMUWi8?=
 =?us-ascii?Q?iCKX49og34YMvmNlwbmBmYwcwn2hhPAbCdTT2z1xEUAd2IQizIWArBaEzAyr?=
 =?us-ascii?Q?7fHYM8gN31TKi659l39mADaE0uHOzqwYY8nBDdfhKkrlyG8sDkrcH/by07u9?=
 =?us-ascii?Q?IBRLXSgfrRM8lr8SIJ9XOfsR43FacWQ6fNdmiCAwG+k1ELjlFAqST/1nQ9si?=
 =?us-ascii?Q?ft4Cdtr65O9EA3WFkLvdEs7wSXF5ATKX8gonzTgYfqa7HSNgCtRYxF28jtq5?=
 =?us-ascii?Q?U6+SLJ+/YP7a32LZP8oP+lsjyaKsIhVChQrBt5Ims8o7WLJSKfNEQUbWAzy8?=
 =?us-ascii?Q?QD0SH8xy9sniFQUvFZFcXE9laGsqPYEgG921fLIwYXBeRNYkqXxy?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90418fab-20aa-421d-33b4-08df0e5020ce
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:55:42.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIQBHjaqPz9SoLM5ehrIIXmuetSpt1nCbW0C4Bvwm70VTXO4srjCsSIRhIQaczl/Cahk9C0dyYoFij5Gelha93GXZ3sH/W1UGdteGZnWgENEhJTp39T7TrnWG+WmAMDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14425

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - No changes.

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

