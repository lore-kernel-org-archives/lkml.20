Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777864;
	b=AIymdPmHe/iqNqnfZiylgqBMJA6q1JuNMD+DBfMb8bQEmSD49RWdbTgbvL8prAMQST9h
	 GmDrxMuHOAmxK2fLP8dAtvPZw+yp7pkj9ZfWv/DY4ymDrh3TPLZ4uGyG4YzpMeYrYrSP2
	 KDuoc/dX6+PqJDj773aDECz9JT9Xbj95NaxrpsKUF4getxaUgf42fP3dPLZpw+J8N9Yyp
	 5kuy+u/TlaY42gu69ohKGQzUdJfCrY1rz4F95/TuDQE5Ig1c0jRFSD9Sdw0wSWDASyLiW
	 kX8Ub3YQ6WZh8V2jAX02ggRxX0kD1N5jmNJpIF2U8N4lg1wyFXiFFqfMJCHPW47j12Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777864;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=rEEJPtEhKlyl2grvG9HlRz1cc2E0CRE+pfvZzj7L+no=;
	b=hm/7sZaYcB5HOn+PUAzGd3NPIIQo9JKLFWoRXonXL9XhB3mwVNW6XUdP/HdhaHeT+SFy
	 tK4Tjv/5Zei2v3vUcdDUGFMx7+PyO+SJ62ae6Ccn+aKCkNdehx7FTFKYouhUVLqGtJXcb
	 CRyG8381CBaK0nAzsvUfiV7fXRyxxGmbYo3eanwX8eMuht7cK/LeXHSDzfGZepoDEC1Ev
	 03CFP57Hs+m0djlelAmUgxFbiFKvnycCSxmBaFtj1Z2bGkNriYq7AhEGAIdz7e2eYnwzm
	 UlUOvk8dxiSCnBXrffVN3j/8wwnXNKQO+r+AfgAbuXLJNy5llv/ICfJxokm1E71nu9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=iAFbEWP5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.20
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E4606A31B;
	Wed,  4 Nov 2026 07:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=iAFbEWP5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1G52irkTktMk2qaMmAci9rLSmpKh8O/ijHyg6J4BtM4ilGo8kXOcOafkY1KP06NFdFUgIzoQ7iKvRQMdxKVb3Wo71pDVrgHi/9GgNfV2G9WXSiFTLC75VMA/ZARCmAGpINbpwRgVrhCGbircVuLN+ucqgoRfuIZKCmayuMKLpmCPFXI/UKXUJSRenUdrxz8Y2s3ozmLH8mMIj5Kop010z+ZYlu+exytQqEmWWMqhtToj/HFNHoXgNCOzHxtfd2kM/vjNU5uxtFrLP8hk+UOLBJgBpSnKZ8Z1zr5uVFlOnBbsyGq2bwze0lhAQyeax3N7M9Lg04tW0ZRvN/Qh9W6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEEJPtEhKlyl2grvG9HlRz1cc2E0CRE+pfvZzj7L+no=;
 b=t0QSb7aubhudWPokWG4jp8firRuwdsdB1zdvwbeUD7Q7AijWfa3tvylnE5bpG1hnNsoQPR6pT8EqwoAT7+tI4VEZEnCPBakwsK7XmzjnSRui/1TFe7jBYbQVOhI9rJLDECYKZ1cGwJQBcJNqSPmKjYeExYZO4lrBswZWfHtQfdRAnNusdcislVOR2M15foLTbbJ6mWO2ILX+/uJrjpzDDRbBg4lpUipqpl+c4mZvkkiXUHtmiWwfw+oPsF4I7HM76ndMCSKf0YI/+OoyNMTBVeU4lONxdu86RvXcD6+hZRMck+7Zz4jWQQ8nTObV8/ZZOLyfbGs+TDnMUTLqHpeHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEEJPtEhKlyl2grvG9HlRz1cc2E0CRE+pfvZzj7L+no=;
 b=iAFbEWP5YT/hITlw0stFqHRQ/0t9YKJjzeCSj8S6UQt4g6Uun0OmZgk2nC4OOY+3ejaBv2PTS9sVPkQ4Axdmpa5nZl7xfKaZaDJVK5WWbPrEa5+qLqynOZxoGbk5nkynX3Q4zlP/Ke5o9yS80DHffxhuuRdCQChHfQZ5Wo7JJDUei35Vw1+Xgq33EoL21xeTf+BWm6tw8JLOnlkZvg09FW5B36eDy+3HqK+0qX3XhkF9kUf4tRfrCvzkpMnMHhDXwmumlJVGx8/kaiU7ltGZT/LLHX4tS0JaNdqgcMSgUJjy/fzyFG39haPNJkeEC0w3II5naqroWtMBCpPqJ1k+ag==
Received: from MR1P264CA0167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:55::8) by
 DB8PR10MB3290.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Wed, 4 Nov 2026 07:37:38 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:501:55:cafe::c) by MR1P264CA0167.outlook.office365.com
 (2603:10a6:501:55::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:37 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:17 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:12 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Subject: [PATCH 00/10] Update BSH SystemMaster device trees and add SMM-M2B
 support
Date: Wed, 4 Nov 2026 15:35:40 +0800
Message-ID: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
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
X-B4-Tracking: v=1; b=H4sIAE3g6moC/x3MMQqAMAxA0atIZgNtQKteRRyqjTZDVRoQQby7x
 fEN/z+gnIUVhuqBzJeoHHuBrStYot83RgnFQIZaa8ihDwFnjagpYSJsXGcp9IvjzkGJzsyr3P9
 wnN73A/botVxgAAAA
X-Change-ID: 20261027-add-bsh-smm-m2-57812d9c7e87
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Michael Trimarchi
	<michael@amarulasolutions.com>, Leonhard Hesse <leonhard.hesse@bshg.com>,
	=?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, Qiu Guochang
	<guochang.qiu@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Florian Ager <florian.ager@bshg.com>, Simon Holesch <simon.holesch@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=NB/MRCxL6I6NcgDs+ztS99mfV9WO0hPEO9PpViFsn0o=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVh+Wehrlq4m9y+B0MeSD8r2Z7K2vCqdLXH/qPWiH
 eu2Jh5/2VHKwiDGxSArpsiimuB9VvJqgOm0mdVwc1iZQIYwcHEKwERKeBkZvq9Y8LfhvXx16XFO
 q2CVh+Lu9r0X3r9YXCWa0MMw9YWIJyPDq3RTtT+NRTm98eoXngf/ZPpjWrpXtKmacRZD7u2+XgF
 2AA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|DB8PR10MB3290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e99dd9e-873f-44ad-3bc0-08df3a467ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|11063799006|5023799004|56012099006|261102123227099003|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pUa29PGO4e2cYfDj+T9Mrb4NMIctu2FnASdQilA/N4GsABq8OuQ68LHBWWN4wqf2v3RHOo4UPFgo3kAvPsN8N0DYZIYYYY/oNa+uhL03zHK1Dr1oh0A9ab30FYv0RrMKJglsm56zCbf3CPdxVngweHm2hTdAkFTG/bpUMUA2qm9698FIfaunaQkwVge4bc/jVw8t/BypN3q9c1F0wLKPJWg0IQUZi1yryBLkFhDKYyDcAymkJmWx9z/fmYv3EanVlxknm4wKZUSBtlxqiTS4q2c08DBZ3EulWGxZJMMPUukd6XUuxcU0MdU62Bt3LDoMq5nvJqjaxC/1sYnisAsywv5JMKmdTIIKFMhfV70aXhhX47ytRCbf/ooIn37wLn7rvvfHVkAugf4/FZUCOdgJRX1ivJL6Dq0cveLDm9NVc4SSS/22Vbm+uj7beqHIRLqGru7C7MiE4ajjQdGSPuIhwNfRI86VspXWPyZ/4VrJJ78q11q/oWLonk91gByI9bRGQ0C9IeP/CHZsCEF96XHxX+LSmTnZEasOPyvDAEWX/HpfVcRPuhV6cGFGETrvq40PFZVbwDSbAQXAcvsGyVLawdfRNicoILqNHhHsu0V9LIYCRoHKxM+A8b4vmT9+OCC+toEgVkm5tXvzPGthulQ5pja6NidE2hZ1PeVVD6Jc8e61rbkbZz9MIZ+vUcteo+YeLedO3PbDfwPlwOlwP7i/hQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(11063799006)(5023799004)(56012099006)(261102123227099003)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6c7I7ND3hxsHV+Q7klj0VJZgKA/d8gsdgZtFinDUy/2WminmwL8ScuuWgC+4YzHibJeAq31xIYf2376ZVmE1OKRVNzI4OicHW8PaCaQRbexKVpNJrWEjWufpOrvtrs8YK+Gi4vzZ0EIJLnqd3vd191zdY11/m1uTX62HPVWCa31/4U8Fr9NS9HhOsvsdSGAgQbRWA5ZCo/HJW09lZikPIaHVKy+sbixjUzOEnQvSjtPOz2YuVgiX50PLEfIvryKaOuEhjdO9/5FxlAzXAFaKsWTK47r05ytIb0nkOIxc2tr+X5j7V6fxviPohM4jUQb0X3HxDFqjhCDYWPB3g/hdfHOjR+5MB+WG8vVEK/SWAiPS0wQqffq4RD03YK9j/E+U/q2SZPWGYKZIko3d22Qt79Dz+mHYPGO8NX3X/cPiZfDBdcJkpSEw3sAiN3WRa4w7
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:37.7478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e99dd9e-873f-44ad-3bc0-08df3a467ff1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3290

Add basic device tree support for the BSH SMM-M2B SystemMaster,
a hardware variant of the BSH SMM-M2 equipped with an AIC Wi-Fi
and Bluetooth chip.

This series adds the SMM-M2B board compatible to the Freescale
device tree bindings.

Configure the NAND controllers on the BSH SMM-M2 and SMM-S2 to
use the minimum required ECC strength, and enable the RNGB hardware
random number generator on the SMM-M2.

Adjust the Wi-Fi and Bluetooth enable pin settings, configure the
WLAN host wake pin with a pull-down, and remove the unused
cap-sdio-irq property.

Move the hardware definitions shared by the SMM-M2 variants into
a common device tree include file to reduce duplication.

Add the SMM-M2B board device tree and Makefile entry, reusing
the common hardware definitions.

Configure the UART2 pin multiplexing for the shared SMM-M2 hardware.

Enable USB OTG mode on the BSH SMM-M2 and SMM-S2 board variants.

Finally, add a device tree overlay for the SPI display and
touchscreen on the BSH SMM-M2.

Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
Akhil Narayanan (1):
      ARM: dts: imx6ulz: Configure UART2 pins on BSH SMM-M2 variants

Florian Ager (1):
      dts: imx: Enable USB OTG mode on BSH SMM-M2 and SMM-S2

Haoning Cheng (1):
      dt-bindings: arm: fsl: Add BSH SMM-M2B board

Leonhard Hesse (2):
      ARM: dts: imx6ulz: Enable RNGB on BSH SMM-M2
      ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and Bluetooth pin settings

Michael Trimarchi (1):
      dts: imx: Use minimum NAND ECC strength on BSH boards

Qiu Guochang (2):
      ARM: dts: imx6ulz: Factor out BSH SMM-M2 common device tree
      ARM: dts: imx6ulz: Add BSH SMM-M2B board support

Roman Smrž (1):
      ARM: dts: imx6ulz: Fix BSH SMM-M2 WLAN host wake configuration

Simon Holesch (1):
      ARM: dts: imx6ulz: Add SPI display and touch overlay for BSH SMM-M2

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |  7 +-
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     | 95 +++++++++++++++++++++
 .../imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso    | 99 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 98 ++++-----------------
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts  | 13 +++
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |  2 +-
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |  1 +
 8 files changed, 231 insertions(+), 85 deletions(-)
---
base-commit: ec7b37c768d34107d06bd629d05cde0e2218ee9a
change-id: 20261027-add-bsh-smm-m2-57812d9c7e87

Best regards,
--  
Haoning Cheng <Haoning.CHENG@cn.bosch.com>

