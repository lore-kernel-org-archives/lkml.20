Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389038;
	b=3ge2uSOG/SNBXu422/AKTVKGG4QLFDyXM1VdkyK0tSQtMabpKd/Eql0kgEqySgIsChr0
	 IfHrnbTpofX6espUMLoFvahh8/BB7LsA/W0l7rBW33DqQabAzeUxiJk3hMz0nOEF/FL5+
	 YuHUA69sRNZH8eLId3QrFTOiPHfvpku5aVVTPvmbHxsxxawE7v7CCKjbAS2Pl3jrhSIsS
	 KLHDuBu858EvORIKCMbSO4mZq4BXqEtj+nhNUKEVTaMPeBLMAoJ0w3RnG9jKlnKpAYncN
	 ZI4CFrmodIC3Pg8Z29sdHHS/vyh1f42yPVtk3hRJuh9t/jV8pS29uMZ9i2q+rbqIlrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389038;
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
	bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=;
	b=az0QW3Y8pyx92k6Jf2/xs26L9i5MyftOORVC0TQpPQH5P4IxzsTZs1KC3uGxjvVZ8siG
	 FomzD39uWnUMn1Q2zXMhWA481a7UhV2vONI3I4TUtWOB02Xqmn77MEg5kT6LSE0tU3u4N
	 5b9rumG4oLI6Vf5HcA1TsF4TIrMYpnoDASFKNDeBzBYGTmhWGXhXvOjlDYZWEqLt+T1P3
	 0qPMcUZxZKsb8nk1H5qYChQwJZ2NSeLZb4/qdNUD0f1Bg4Gos2GUt/rcCezPO/rwKK2qs
	 wLGtr4AkOHKbIDbyjD6whYf3cO9GiRt+iosoM4D5+WkEtAj4HYB8HT5lHmx7EKZUKPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ltZJUZb5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.20
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB1606A32D;
	Wed, 11 Nov 2026 09:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CB1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ltZJUZb5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIvLhA+rkLd3LQlHQhNzDL2sDbyoXTuoPmKhXIixnEc8kKxZu8BlKwm+/EmcaYIMExyN6RYmaRT3wMpUgcGp0MkGDVpTZ3fkBWYU96ZkvO9qI/w2aVOAb/+fV29R2rezbE86TDReziUdSURPQVMBo7AnoioX51Ie0A96SqF9f6rmDCPv9bKsKVxkop+jJKdqI4YaqNnjqbgAwqjNu0/Yl+H/bJS4ym/OylwHJMgxfuJ+hIwb1Naj9kW+NwRmdjAST+NqMHXIKrpnUd5VbuD+HA/xWO5x3odd+buUN3zLy/UaAfxzFaJjeB34NWj/OTEWzsM5so/MxCD2320SzV52zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=;
 b=jpeFLDufIe2hG1tBHqluBmN1H+uWnYQ3342HQ3PvXeJfIFbAWmenGkDNYioXTeExmdN8Ppb4A0ZEeMGpCtDznf08vuBDRQsAaty0EU9MxGBRDVFcGbR0ccc4S05MFctEmpGE2I7WByScdLhJKVi7VrnvRFppxMAKFt765AgDkkd77oBSzqXJ5NLutmeIaTle1yI10scKPP1vzOV/F/No2QFZrLfJIiNHyDqiUqiNePXnmGW9+w5ZGb57zssY9W2d86LBZ55dcNBCfAO3onJq/bj9t22nm0SNwaw5DGHZqDfgwB6oZDxS/FM0pQyD5p4pXgLVm6zoxlMebwo0gUGLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=nxp.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioZC/+/dE3KvhD56QKMRjB6kDxDJy1bgz3Od/RtauJA=;
 b=ltZJUZb5e27BHyX24tLzXey8h3KsK3yhS7cPnbwh4ZeQ2XYssNUSH+aBmMuPfK4hG6+wnwkMJ+RicwyG0AGwJP1wvTVPSQL8v2a1iEBKCHsnoCE6FUXHvBNWfyIDH731hI3csjsrWeYSv5a4Rx4NsGecPpzTNPNYibM0YIdiCp5MFd8j6B3IW8jiFwK4WiPHzUaM8C8ANkHzvDXqCujm7ek+4JaV0zYCsbKgopz0aAwaSqNnZCVPKTTtaH9nyzg3w7ldRw/R6F3v4Kk25kE9OVYb3PiHXEcCHUdHe7k+oMbPXx35up/C+z0feaXdIYzTocXi6Ohj6FmnAabF1jQFWw==
Received: from PA7P264CA0401.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39b::11)
 by GV1PR10MB409108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Wed, 11 Nov
 2026 09:23:52 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:39b:cafe::3b) by PA7P264CA0401.outlook.office365.com
 (2603:10a6:102:39b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:23:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:23:52 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:23:51 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:23:46 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Subject: [PATCH v3 0/8] Update BSH SystemMaster device trees and add
 SMM-M2B support
Date: Wed, 11 Nov 2026 17:23:16 +0800
Message-ID: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
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
X-B4-Tracking: v=1; b=H4sIAAQ09GoC/2XMSw7CIBSF4a00jL0N3D5oHbkP44DyEAYUA4Zom
 u5dWiemDv+TnG8hSUenEzlXC4k6u+TCXKI5VURaMd81OFWaIMWeUeQglIIpWUjeg0fo+MBQjZL
 rgZNyekRt3GsHr7fS1qVniO/dz2xbvxSj7ZHKDCg0/Wio4FxTZBc511NI0tYyeLJpGX+F7k/AI
 pipM0ZyJdqhPwjrun4A1lWi2vEAAAA=
X-Change-ID: 20261027-add-bsh-smm-m2-57812d9c7e87
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Michael Trimarchi
	<michael@amarulasolutions.com>, Leonhard Hesse <leonhard.hesse@bshg.com>,
	=?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, Qiu Guochang
	<guochang.qiu@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=0bUF6kYh6Bbz8QjYQ71h8rLyP0QsWdLZ7gGCmTcC6SI=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPB8368gu7NTefsLds+VC8rbNTt8ZqW4dmtLfHvq7
 9vKc7uso5SFQYyLQVZMkUU1wfus5NUA02kzq+HmsDKBDGHg4hSAiTwIYvinrt3Q/GBLS/OOIm1e
 aUNf/bvpdW+OLdgltiNMjTG+5Mwuhv/Fv7uuOS7cLPnjkGr4ognq95YZS2R/yOgpUs748Ux05wx
 mAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|GV1PR10MB409108:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3818b0-6b96-4e23-3204-08df3fd58035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|261026140227099003|261022105027099003|11063799006|5023799004|56012099006|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fATqurOodibQ8gNYNSL5MjieLua34ROlNFMJ+Y+6h/NEI/VdwpithEkB+DK/7+MspBIT5COieOWGqzHW/LxUyqg0UrTAe3cuvAnr7tomwdhp7aWGzuJR/v9rIPkEDcKLKL8fbxXcm0tx2ssIfcmXv7lVzyH9j6dgw365K/HI45DwOwny2v0L5qjSE812fW5KvLbUtNMDwiKTa70wSJC0o37FGedaHUhENbASqHwVoEyDWzkOk8Ui6hKhypoq9eNjYXkGq87aGZ9Vlxk+iRGN4bAKTEElIs6rCbCM+QF3ReOGKwKAaMs1JxJOriaIqhxFNMahgfRGRKw1pIlFU0UOUT8jCiWOZgU8j7L7cgyNyBEKL0W9cKiteDnVEXGLnKJS9n+JH1eeRzw4noT1wznoCWeCJjiJn0JgDCf5ZxJQ/zUonuzV3uHqAvuzWSjmZzd3XWsrmjgGvwnjyn0EhppLdafVeUtQ3ubTedBCTwkvzI+/DXz5eeYYQw4TbjR5XBKXuLjR7RfVKpg1HGYPD14FhSphOJX0YWJrQPF9NFaoAYbkGlxkFqAOywZGlXfehUFVFPof/n6xjUbn/eFyjV8lB7QHRForZU46j+sH50nc6sC3/zX6kGnWvvKTLfPr9ec58Cr5/SA5S0UOWUma6ntEr/2vcRTXu5A0LpuEspwGn28=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(261026140227099003)(261022105027099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qztHD7vBF7Vi5p1vvkmf1ca3v+TiYrr6l/j/aQDr5u+NqAETlegkratn0q8mZDIxHsBzfE3/C51xQSvYQ1ttT55VusA/PptbNuEN24qM1LmBvPRdnu8RT3z0S3JecDrjXaBGSp9yNq/k7L6w7enDbKsBbSjc0kFbidljn3nD9CqpmlD/g5eCwqPe3p6vcq5+fK+um4dLMMBWrw9juNJ1LNBOWeKckuUGQRu7G5G1MOe0kh2noiyEEGQlw9OzqzX88ZTmGxq4vmWwzRwO8yZTq78jbskqbJHmiUUixCsFGyCUoiZjSnDVcG0OSll8jQK5x9aRQyDRDIIu0x1ePgbZWWw+6PNmHctpnLx7TAJqrjT5PWIk5olZBXGWM0i+gdPMH7ptaFSs1tTXo1hN7NeADXwRNXVYuSVnE6Ty/xslOoy7r9ddBfz1jAYH2XTKT1BF
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:23:52.0278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3818b0-6b96-4e23-3204-08df3fd58035
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB409108

Update BSH SystemMaster device trees and add SMM-M2B support

Add device tree support for the BSH SMM-M2B SystemMaster, a variant
of the SMM-M2 equipped with an AIC Wi-Fi and Bluetooth chip.

This series adds the SMM-M2B board binding and device tree,
reusing common hardware definitions shared with the SMM-M2.

Configure the minimum NAND ECC strength on BSH boards, optimize
Wi-Fi and Bluetooth GPIO settings for EMC, and pull down the
active-high WLAN IRQ to prevent unwanted interrupts.

Configure UART2 pin multiplexing and enable USB OTG mode on the
SMM-M2 and SMM-S2 boards.

Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
Changes in v3:
- Update commit messages and subjects based on Frank Li's review comments.
- Add Krzysztof Kozlowski's Acked-by tag.
- Link to v2: https://patch.msgid.link/20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com

Changes in v2:
- Drop the redundant RNGB enablement patch.
- Keep the WLAN power sequence in the SMM-M2-specific DTS.
- Move the SPI display and touchscreen overlay out of this series.
- Link to v1: https://patch.msgid.link/20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com

---
Akhil Narayanan (1):
      ARM: dts: imx6ulz: Configure UART2 pins on BSH SMM-M2 variants

Florian Ager (1):
      ARM: dts: imx: Enable USB OTG mode on BSH SMM-M2 and SMM-S2

Haoning Cheng (1):
      dt-bindings: arm: fsl: Add BSH SMM-M2B board

Leonhard Hesse (1):
      ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and Bluetooth pin settings

Michael Trimarchi (1):
      ARM: dts: imx: Use minimum NAND ECC strength on BSH boards

Qiu Guochang (2):
      ARM: dts: imx6ulz: Factor out BSH SMM-M2 common device tree
      ARM: dts: imx6ulz: Add BSH SMM-M2B board support

Roman Smrž (1):
      ARM: dts: imx6ulz: Pull down BSH SMM-M2 active-high WLAN IRQ

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |  3 +-
 .../dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi     | 86 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   | 93 ++++------------------
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts  | 13 +++
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |  2 +-
 .../arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts |  1 +
 7 files changed, 119 insertions(+), 80 deletions(-)
---
base-commit: ec7b37c768d34107d06bd629d05cde0e2218ee9a
change-id: 20261027-add-bsh-smm-m2-57812d9c7e87

Best regards,
--  
Haoning Cheng <Haoning.CHENG@cn.bosch.com>

