Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777248E0C1;
	Wed,  9 Sep 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944141; cv=fail; b=ETQ7JOdoBsUa8LAwZGDAoeF1xmTOb+zx4sWkE8526H7Y9hSh0vEHhouwkGyb7oazz8KWgRjVZvKyA/ymNOoSiQd3n3jmhw8qZyJhQyqjro24Xv8K9vOJSLQsQSB/AYfoRxAKp+VTmQnPMTTOYSl2yfonPEL/FOO6WbJOFoOOCgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944141; c=relaxed/simple;
	bh=g7EtR2bKRlHJvrgVkkLBo0FqY2imJ3Fku0rOyuM13Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NeqlKqoZJHAqMvNCCH1vn5ayJKwy0xs5LRFNdsOvt89UfL5ohDuLoKO9w7bVQLFj/BdSblS4nw+XXMBf3hktst2CstStpvGwgV0my1WYShKpUW537NDpLbvfAS4SjCG1H2YDpDzfNJtfME1k8jbu6LEPov/crJiqHZBUMe+Eg3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N/xhRIeL; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N/xhRIeL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK2axWwu0s5NEFfuFyR+A86HHhk+hGyKX8Hy/Fi1Q5hQ+0vgyuSUKKrXCRFufsf93dIi+vu2YwoC6Zl+sUitDObVPbjYE/UzbN/HxW5iyF+RDm/UNEx3AVErqQDQQ3IqAp59qJrZMkYiLlyZ+94JxPYhW1B1U0HVM80KtURzCod46/rvpe1ftZ34SbcCxvkhDI47RKzypoaN6KVUG3XtbaHnpu18pN/3x5oBjGKZjp8fV1Li6tfhT3ZtvQBSsh4GkiSyUv/sGd0CJamI9Hdv9NuTw7thuLSEEaaEcCxhrIQHSSZPbHCwB4Kdhd+21qJcvG9pxO9MVsMBS56hixs91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxNNZl485ootQ7JSwgAaelPAFwTkTAPxP+989C73eiI=;
 b=mgqbOlkkhazbYLGCGRPs/x1HOtmjyQtwF/rE3zoOjBm1kr7SKIi4LxRHi1+tgPOhhiMrf7Ju0uApc/SWM9X+SGeXM+TNdzVAddrUr79Sw2d9rLzDXLWA3xS9bxTjBCSi2VPBCL4Jbf+q/CYPCgFbRGymNREbNItqvKkowfmcl0wSTRL15A7MNHMoTp3zsXJUazpzdjp28nA7eHJCw4N3jaRYO41mk+QzB4rL+Rn7ZAbGJrEy4clmczV4gKSWcaCmOY02RNyi8rokMjpTp1+r+95DZ3w971u2DY4TvLP7/mDKu1aFrt2EUWQcRdjTiUJbkDTd12iCnubP9F+RG/5olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxNNZl485ootQ7JSwgAaelPAFwTkTAPxP+989C73eiI=;
 b=N/xhRIeLOELW28GOSSnOIhP78L3575nYdRstrNQbnh1K1bp56rrkgFp61VVLEo7tF4iPQU01EnVSxfEDkzXfiqUkG3VRuQQxQEvB0VAPQ75dO70kJd8CSMPXsyZV6mMjWNhfOS/AQWWEupummg3XhkNg+aruLYy+13GkpqBa9zE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14425.jpnprd01.prod.outlook.com (2603:1096:604:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:55:37 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:55:37 +0000
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
Subject: [PATCH v3 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
Date: Wed,  9 Sep 2026 10:54:59 +0200
Message-ID: <af1e188babf5455b04f7d0a9e1a056db9ee9ddaa.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6d4b0c4f-c609-4c02-f6ab-08df0e501df3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	KReA1wQEUL7jpD9+BgN+5iFEjReGJ01r7285ubA9xAfBJeSs78jVSUTe4xEMS1/hD5IjAI78BpaZXnoGJnlUhdGv3BlGlwP/aEOmC7OGybUqVtIZHeXSJf4grHXol2LY67L6BBFMRkIEDJgxtkMXrSslDMad+T6tA9jg7NhHSHZafOW5flVN6bJfWV7ZIPb6AMhi+gBCfT23FDViNAcbgGqmqbp6zMbJmbRE2vDURUi2a92yea0YR3d5To4rD6M85LsORMWbhqsGf9R4HAuQQweW51Mv6OklE87/nSmjs0q3qLpwJpiqZa9VMmuAV6xFMu6GN+ez59PiLVgnEw1eDJ9KPzgpMtnbfbsayH+vPUQapILpeRmXvEyP+fcpyZcQaPKbybrI13e6BrcBFaJLeJCDGJln+vckpMFTjWWah+9IqDocIJl8DmQCrsZc+/DP7C8cBaFways9yJUqwbUR24aKoF1Rq2xgIlNSde3fVyEsS5ycdlUs3R2fk6enRrgybTX8Npg2VSjXur1HAg5ee0YJ54wUc239tLawOuiowFrztMk1uSmXS+bkERbqCL66unVvAguWlxDjCV/zaFqpkII+phoxSxttqPjhG6LbzckqO2j1Ry9CPaRQ/BnFEDLQXWQ+S/N2STXuJcRLcrTJR18wwCgYGO6cQvu8pecwW2d01Vt6qe5Pk8O6LYtgAO8B/T98NTdXzUjzHWuappGzSa4SUmvLLtdvsatkBrPR6yM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9UO4jeb4mW9geLVhuUCsCDluE6VM2RyJKch/6+QIcrKKABN+ZEJ08baSZlc?=
 =?us-ascii?Q?7o5TDVLvKRMN13peOkMy4H1glGTj7UzqeeOdXD2u1DDXRPB1dZubYDosudEp?=
 =?us-ascii?Q?k7ZZ6EqEG3pVhHDPIKY8aU0wp+8iiFQlFkmdu2+nNwtHNGhKeJ0bv1gHZzwc?=
 =?us-ascii?Q?Q6qBvNuW6ObAQpjgxx2f2JGmXgqFfraivBj0aIfoT7YnRPc5C8BiK5SCrWMx?=
 =?us-ascii?Q?Aur3xcHO0TfpNya6Qv/OZEI3RFTKvNYfJdpvnBmgTGx1v2YP/XBM7ZHcjGPv?=
 =?us-ascii?Q?+nIe6tgdGcUTr/Om4HjwCgGxUYXrDBroo1FUq2T/NXPJz3e5CejCQsx9qQjj?=
 =?us-ascii?Q?DS4DPjWrJnVXnBABU3lTHKiTl89FhIwwFbcE7ow8GKtV/SB/V9p9Lz+nYNMw?=
 =?us-ascii?Q?ocNhi9w+LbAJZxPH8sh1JMzISFd39R62mZ4rjZa6fQi1P1ctv0P46g0JMbJJ?=
 =?us-ascii?Q?n5A31E8xGH7o/JGadByzIiDVqC5NIxUDmBBRlTdHe1EV4ItsBOjq0YcJaEGA?=
 =?us-ascii?Q?g0TKmr2M9IE2cL4stI7hUhHu00iWYgPS5UwgtPPftuMKqEzFm1N70esyGQcW?=
 =?us-ascii?Q?heNo8X2ieBZnfrAs6urgREZUHxf7ca3UC2MxuH+hs+GYKEbCQV0meEFZmwM6?=
 =?us-ascii?Q?Ux3mjjWUb732i789fcZfpu8bt0KfMfvMJMKsXu+kjwBEypaHbfv/trpkhYRt?=
 =?us-ascii?Q?TvCNwH9Ib3RxLJjX8UuY8THU1vKM2Ux8/dUuVoKFd+EZ/D71I3FDX4zsMLD9?=
 =?us-ascii?Q?YvsqGoN5rZTYHV8nCJnu9Wvg1qzutG/5dGgXVfTht4rnqrCJFraYWQpJJQj8?=
 =?us-ascii?Q?e6MR90KefdR4vpA+O7rx5fsocEnmfYPhP9H0it863NZSx9RFbARN2n8XYJI6?=
 =?us-ascii?Q?8Xi2QVr/zcpa7rX7pBxy7hZVAdzdl01krZuIYqr5aKytoFXrDnRp06wmjQFF?=
 =?us-ascii?Q?Ir3OslI8Om17iHKpeCf0kmoThdVlZdHRikht3uOoGV2XUA7NjhN3LTQGtTlN?=
 =?us-ascii?Q?FZFZ/ME2fsXVxbDAobNmoxRrKGfCgedZpQEkJQCPygqlJOEB9S+PwI0qUDzU?=
 =?us-ascii?Q?GPhSGhgeiXO0JFRdzDcoS7IfAU55h+2cqEGwOU0tet71llrY1V0T4cHH9UyG?=
 =?us-ascii?Q?3EgppmS2EYc4P0ZXBZQVcvhZlmk/ooswDI4HDynsVrAxFygg16WmaR+ENGc7?=
 =?us-ascii?Q?d0IH1vP5pPBh2Jbq1H5QkmS4A/PS/Ga5RvfSf+svVBgK6uBohPyT7YS5ZKQQ?=
 =?us-ascii?Q?7LiC/2xpwhnJFQIyYog+Gee6tjlLntmqSi5Qgm+Xlk664+loUrJWxaNxKMbF?=
 =?us-ascii?Q?G5NABevR2DZvI1rsSYl4UBJtfvgS1lAYBxCVrJfcy0DrXgccCsTtkK97nu36?=
 =?us-ascii?Q?x9/Yk0uia1BoO3KyRjP1+WZNBw0zkVFJ7wwxdqANsokiYeszCzaSwuo4dvWJ?=
 =?us-ascii?Q?Y3ibNMEbrsnxM+ocn+2edvcWSUBUHXsp3kZESdIZKl+vKMLTFDl3OrjrV08Z?=
 =?us-ascii?Q?H70/gD9Ds4lL7p6HPLAPqEsYFgLgrfyhO0/USyaSP2fXXc/+DASqaF9LmsDr?=
 =?us-ascii?Q?nRm5nQaR1mRCj6zeBE26fiDbw7+c64OJkyReAw/gZClNMooghe7l/NATJpkV?=
 =?us-ascii?Q?wDgBiwCpFP/LeqkgTqt4BbDdO9ygquz9qGxKy+rBqOdv25Si8G77gxc2k/TS?=
 =?us-ascii?Q?acL7keRMkBpfry9YVgIri9m35rqp958QLDBwqL4pV8cmd/mhstbWE6E6663H?=
 =?us-ascii?Q?x2nsVrgmn7WMi7xb8sYTa7BCs6ZZ5ehp1YBW+jeugYLRXkyJyj2c?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4b0c4f-c609-4c02-f6ab-08df0e501df3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:55:37.6261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKFyzzJzXOPF6vSedH7HPJO0KZpVo51kGuTOJ2vaIf5Ibzn6FhJvmH/kfkI6Plt64+iB42bTQd8qs+en8vZUPjtKdVjRTzektPxb8m4nBoRTZnk3+ismTLqtBjZioP2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14425

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Cherry picked from "Add RZ/G3L USB2.0 host support" v7.
   v7: https://lore.kernel.org/all/20260812141940.246223-8-biju.das.jz@bp.renesas.com/

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 10123281c53c..a2773e813dcd 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1231,6 +1231,44 @@ usb2_phy1: usb-phy@11e90200 {
 			status = "disabled";
 		};
 
+		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e30000 0 0x10000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

