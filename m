Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB994756DE;
	Wed,  9 Sep 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944139; cv=fail; b=ALB/R4CMvXuo6427iHo6dfntYBQnYpWdIPVD2H5aVyip/+AvSgyDl1V98rspOcYjcVm2HLvDQnpZ/QZ6BdWDqsNlZB5kiyzA5oTROuUPdZwO4NVMebGVwsM4/kBRjuiv04Fq/OR82PPSnrGA7Z4gT75D6McIwqrkl+HCTwHo9Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944139; c=relaxed/simple;
	bh=0ddywPKFwVIVj/+EHVlB6QLnCs9P2YnOaEuSVaIMstc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g7Ub5Ss0SeCcTiycoEnc9T2Xb/NGZ7T/H0zM/eQPPdsXGfx6iKePpG9ax9Cg2F21tglgubH3/1L2epWhBcmpo3yW0FFy113woaj+4RggrGtzsjQ/pweEmeDfzQ+yox20gx3krkHQs/zn4lT+68TUB3K3GGhrHSH5/WTcA8QsGIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=to5wTRlc; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="to5wTRlc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4tmimB6CzHnDs2OAitbsqpcOMUR0ir9il3D+Lk32pbESG7PfejJnmO7IecXoGZOiYafYQmKkIPyaaKuZpHKSYfBCSNQnjMe0xvDACm4wqRZoOD/dvmGcaCSMtemxFfkL2Cv4uOaKo73kisRP0CKKyr0+pEKpWDz7KZv0d7iFbmY2h69n5pvhYJDVQmgCr2EQwuVXdW0URC8QlV42ZNdPA6OE8aXCO83mi4E/6ca/62fSqfUdeHWnPrJ+x7QBIWVpLjsTod+hWJZGyqXdY+p7ufeZFoULm0cVz96ElomUwm5U8xjR8wnygSgEBvRWE/8q7IeBB5/W/PM7NfzhsnOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KOCmz9TNa9kueCLZuHY/K1TcRTXOzzhhoFMOALPjO8=;
 b=OCTaod0kvnX4G3utuRjkFujPVhPeAWv3YqUALQQVaoPh50UQURtNvGdCU1cmM8TlbWRxVNNr3s6n5Vw4k3lG34KeronhGo+B5pkENcL2HeruaAb9q7LAl2FQQRvMZkWxNNHBVhVI82WDPa3hSdtYjFBRl/Iz6/G+xcn/kBGsn+YFY41rE7jA0TVITnw4OUxMnI5pHH6nmYoJa7GjKqFcjfJBKTZws37ABbVnfvc6mCLnRVrCArWW9pIYZdL7skY9FF+c1Z/vxgKPVWRDVV6MNYhoYH7ADaOqXXwnLk93Xncz+DyCxFMx0FaD2AAxj9IJFSa7qqdeSraX3VzqT6KOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KOCmz9TNa9kueCLZuHY/K1TcRTXOzzhhoFMOALPjO8=;
 b=to5wTRlcEGNLaKnatUx+uzw4veI9u/tskWeFSSW1W9YeStCmo3QFZppH84T5Te9qdWT1QgUgx4oSWSVR+yvMM9k32XKSehYIWIodnWB9/LBFIzWYFq0cf0eq4pV2kGu1F6N5Gl7Gy5kU6sct0zZt/ST//Uxp2xbYvSFwei6UpV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14425.jpnprd01.prod.outlook.com (2603:1096:604:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:55:34 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:55:32 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
Date: Wed,  9 Sep 2026 10:54:58 +0200
Message-ID: <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cdd0e621-5906-47be-1b2e-08df0e501b0b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	fIlMjRPy4dq2uh5nDtvlHBf8Yj1dw3i0Eg6EKPagKyhixFPIkcvUs/dXpixS+m3kOiMmqyePPy6YUuqrFA1tBDdaMRKIcUxs9/4Hnuii3Kdg9C3AoiprPHgxOCrylRqxU7EPkaGxKad0kiJ+p5rdkq+9PvaYkUDGd+41MJ0ec+Hx9Ubt2898yAPBgSbTwRrCa0iZL/r3JLFoV4ODVCb+ytKzqYS0kagV8vbI3S/JuQtnBu6M9cIJlZqvCINfNmMN0zeD67PkB0ae5GPgsGgamazCAisiwAcfTHbEOpVbPQwGy86zZxNu3S2GmA0skvjSHUwrZw2ZkimaeH4HWXVMA7d87OlvEI3H1yiz6YKgJcb7ySyckYufdIGNG5xOCO9hGexwcJjOxQjyAJkO0nJlu2fpZr58MITOUi5+ZgtC3kjekjX6+qQookar6uTgMKwWjJUcuV8e29Aeb386LlYhQhQmEKohj9hUQaoN5YuXjddQALAek5qK/EeJ6UaaGj3NeCCTRfLbev/P+UidryHNaVgPM5rljCXIhRjGYMl+GRl/Zf7ExZ/iSarfTTJXkVtw8fGUCLT1z6e5S/OSEECXufJw7Y1gpQn4vYb0MPuqRLsu5WKzLZCG7K3xGmyFZOmqvEZ/vCaMjeXlVFm8twpDbFUtPpxV5lQj5FAjxF5NrjBfbDlM6ocYBKB3f/i8MrMMjssbm/BQqe7+a1MAOfiQyQft6NBLTpnz0wLQ9vTzgZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XEYWPjNCEX16+rKPNZEWBEPSpz7HRHfx6rYukxc2mFyIjogO9UDsQ3TPt+qi?=
 =?us-ascii?Q?LYIbMZ9DVSynwOQAb2oUQf4h59VigEzoysV/fRutXjMQrQ2/rk7HA5nKCoZf?=
 =?us-ascii?Q?74mUVVXsYKkl7awNosnd/GN16wCzueHYcOm/Fqk0xavThFLtpz3H9KsFsinu?=
 =?us-ascii?Q?rpTpNjPW5D5GZcMuczDurD3zJuyH0j4NlewNP6NDlYeXps+zvtnObYBVPlNJ?=
 =?us-ascii?Q?hJoAaT2dT//XX03X+0JqHDSKXQxDkyFc9LlowGVGKzFEHlQBcAgY3QQY+Dn8?=
 =?us-ascii?Q?Slqv0gfAAZkRoxXQ3IalZZs60aPs3Eq5TNAbCw0ydVMG7DkJguCu9aqobDuM?=
 =?us-ascii?Q?eLgVvgWTDoN7hr2VEEjOdfCQMtcxaWVYk7XXoOTgSawDtqXonPT53yY3RoUb?=
 =?us-ascii?Q?6WHbSLDOjjHQdw5xibc43Oso3ssdj0sp+IR1zXtH6w3n3065gJit0F+b6+gl?=
 =?us-ascii?Q?6Ao8XeJWBGy8pWbe7DFQQo1kLzMvZRNdOtsxdY35n3k4BXbYxJkiPaNEWnyg?=
 =?us-ascii?Q?M7QanV0Ib+Fc6lV6pXEY2qazB4U9IiVgqzHTL4fLKAyjGLYABlInoCCRbb69?=
 =?us-ascii?Q?tU70SZZYhoCMm/E0/eDx7lc9e70iVNYHgHxj3kluqKKU4HdFqvhLZ/M0NxCO?=
 =?us-ascii?Q?nJBMPR6mceWdO/vWgJARuda1dveZNgFk2A2Cq2gLQtQwzU7Pyhtop0NwcIw0?=
 =?us-ascii?Q?V+Hg45vAqz+0ZltZH3BRDscQzr1rAxz1j3AVqMvt1rwxonLzLBwojVHhTakK?=
 =?us-ascii?Q?alVdHhxuhKaO1xIDiAOGpA5V/oUVXInNxdWKwr7j3x2zy3T2/Wkm1exVAHxG?=
 =?us-ascii?Q?0h8UOpAAuHIDICJAojhzSxUE3qOfgMLn1eJCgMNbHOYhvDldMRdWQTKr6iYs?=
 =?us-ascii?Q?9OHHBkiCUpLkX7drR7j+/QGnZQREFJxF6uvOVyo39ZMOXmqsMWtqJ94HNnKd?=
 =?us-ascii?Q?8EgMNET/tk4r6FjqUCTyH8kR5PgnPWp5BaALee1CVlq07QhqI2s3dOf2o9fX?=
 =?us-ascii?Q?WDvk1tyARyCqwHmxUCumG++S29AfGyLrD9o1KCekVGBwsqzqYIms2RXkZsWs?=
 =?us-ascii?Q?DijZOYPU40gUHpOkUT9l9AtsuJDSmi83YFDTYDQMSnhsQMXUZsirsx/gevxd?=
 =?us-ascii?Q?Atm6+2dkxWlcVT7QTn+A3fgsCUE5wE2lnahmTgFjSR9ugxUTS2D8EKo3fPt8?=
 =?us-ascii?Q?eNU42h0K91plpKjYp81gbnSYq2djEkCEq9tgV8+UtjYKL/gfNcgVtZbSJxYr?=
 =?us-ascii?Q?HHFxDMgCHP572zMi3INCDl1fcIJavhMAKtkPwxmETkR/FJDsZVkUDFsXl/EB?=
 =?us-ascii?Q?r2rtglpvI7tFEoHW1M8xtk2UV7XcpBlOJA7wMw3u0RbBfE2XU8/rpJPIv1u9?=
 =?us-ascii?Q?/RyjG2oQqbxqRd70mmL0vMM00fttV0QUZ+xclM0YH23+T52fZWT4rd4+pxYB?=
 =?us-ascii?Q?1BYJSHLtiZoqGdmAl8DXx+/zqij3Qet7aYtbDBgRkd4e+Gtz+5qdwjxFbChR?=
 =?us-ascii?Q?Loepz1Dv83hACHAXPE3X6tuxvFPQd/CK5Nf9cy0HovzHUe6OEHnTKrMziWp6?=
 =?us-ascii?Q?zdPgkioN3ELwSfhu5jvlMoO2nueslAeAeeGsy2TEfNAWe2ypB37F8Auqzd/L?=
 =?us-ascii?Q?5PjWIX4E+ySMxAoLrxRxLx4ryQJQ+yWDQ/ERUjPqDbTcIkmxA5DIj+XR1XgK?=
 =?us-ascii?Q?e4Z4o/so5IiLK3EZPoyDDX/LcOA6s0kJnn/+LBw21cwhRVPyYOMx1soK3jjj?=
 =?us-ascii?Q?LhYQlroXrpMrdV1+2GQHtJzeh2VVie/T8mGhoPgG+CdUfcNXqBeT?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd0e621-5906-47be-1b2e-08df0e501b0b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:55:32.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ+/SZ9POZTAaMPBnGkOttR+WlGjuJS9TpqQ7bdIoF9giO6DM/yOGYQtbaSTlcXTDgcDeRv7vfVs//ySQGvBYaN7p4+DZLa1Pn5KltRb+34DoBm4U9b+pmijecgmQE9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14425

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Cherry picked from "Add RZ/G3L USB2.0 host support" v7.
   v7: https://lore.kernel.org/all/20260812141940.246223-7-biju.das.jz@bp.renesas.com/

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 608ba1f9e2f8..10123281c53c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1127,6 +1127,110 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

