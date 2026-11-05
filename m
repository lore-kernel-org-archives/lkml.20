Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846520;
	b=Z+C1n3A9nN4Gs1i8/fQ+9Q9dyCaB4v6Wj/mySdnMLCHfvt0nykoBZ5ZvA9dx/GCpUaFZ
	 1ZbG2UjOuqmikuFi3UCTaTTgCRvkJ7Fnr0tXX9Og5PDqia3T2ySDQ4BOSeydO/gS78jV1
	 5PIzQeKaVcXOGPbEZBAuen4Hgl+teV6LvzwIiVEchrHQRcLBBpNzQBmkHbBfudMM3jed/
	 H0ZX9J+zxVxoK6jX39z5++nNdiavaOH5sV7HMEVhkgSyfnrckWGoFO9F/DssQwhy42zpB
	 q5ftAmGUt/1EYNewY/NVA5u0Jfv5jQtBjdfwGYxCK+3QoBIRHQHtJgHT6w7dJnObbFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846520;
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
	bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
	b=jbvBb8be3EheqqpIHQqXIpNGzKnvIAWGZBJs0eP9D6TfYm1vL39++3ui8d5eCc1Czn0/
	 OcfI9qBaQx3GfH4qOgRXomOgM/E5svlZkSoROzL/DBTQkmnLRr3jntLMsLmSrTh04OBSV
	 TNW9i+n4uH8hQCFpAFpCwFXIA/dMV1RwIYp1U53zbC0bFopzofr/ZS/aNXjO9iBOZv6zL
	 Bn6zjZZIG88L0/JDwudnTDXwz/UWkZx3mlRd0RhMpK8/UEtSSPjDcFdRg5D0cnI0OWFGL
	 tWCfMKyYs5lCkj0K7KqLTh7Kd30ATVE1GCqnuEBlV8dmS+pGknZoL9VNkSHfYi4918g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=MxSxBStU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6F606A32C;
	Thu,  5 Nov 2026 02:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC6F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=MxSxBStU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYWF0hh+XicqNWbdsI22iXmXjqiRxhtvP4lnjZ7xyiTLG5bOGM1jJE0YNzKNyEve6o81Z1AeyEnkPWzciLW9UCgf2wf4rGN904r5/bPjdx3ABwirObmSUxADV6066WXWF1ahNINwmE7OjpzBVjXt1qqICao3UAoBFsf/vilzpaanmvhvk6pZE/yzahyge3OKV08ppaQO3LdQuYBbVRKsFTd1OgPl/corLJUN2rWIX8pvEsFQxykkORYZQfYVI7TAC00jDz1PLp8s0SXD/EzJAETnf8oEHe5X/ljztaHVf2sh52NsRDmJnf+xrx/4D3xU7dnviTP7JbK/X5Cr3yg8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=exMbX6v4GA0otVEZkJOODQPquPXJu1H5u7y06lg6XQPrjXBz3MroqmVApO3ZGqZOgwytmQqBHqgvF1Lolhv7ggtK476K5CTkjXCghiVticl3LlH37Wlr4gMFNcLGzHjJIwhXiI4CflXnhkzOaLTkMaJlvjgM8WHyQmRSCVoJX5NzpI6n0hlrD6ZteJrkaQYPgBxZLrPDqiVcxp9JXE0Oc7m9Vy93xPoBu8geGip8Exu0cGeMZHdziUiHdJWS21AnQlIeiDOUg0YTkhMukzDN9emgx9g25OtrxiHdpssB137LpsgShoj/MZG3uZXHjxPB59Nmj6RDxtn9J4w/N923GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=MxSxBStUXZJo5IQM5vY2QT8BaG/SZG0eWzh48K7sY/kxXRuGinm1ZuW1YdwLTVQClVeqlsT+7LZItNWmhQRGMGe3zknOhn0qVWKeAjOylCO15yIsHcUu+wuOi4r8sQu9MTUcLrswS6BQpdoOzyVoKAngRRBTg92fEHalrsPCpTJxoVh5Zjz74ZN37xEObUuahoLEwAe8bwhT44AsMr6rFnI2sQvAj6R2p4C67Vx+MGCvg5T+vcte54wbNITTX1LIxKvNOfdiB01QHcULjWP0LOqH1rNGUAnEKy6I8acGuzsc5EsTv7CcZUq1l/tF+y3z7BFchB1OCzN/g8QnZbPkCQ==
Received: from GV3PEPF0001DBFD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::314) by DU0PR10MB6105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3e1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:41:55 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV3PEPF0001DBFD.outlook.office365.com (2603:10a6:158:400::314) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.10 via Frontend Transport; Thu, 5 Nov 2026 02:41:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:55 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:41 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:37 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:16 +0800
Subject: [PATCH v2 2/8] dts: imx: Use minimum NAND ECC strength on BSH
 boards
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
Message-ID: <20261105-add-bsh-smm-m2-v2-2-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Michael Trimarchi
	<michael@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=0ihmRnmTOHFsqdOKT49ZxDiS9tkt8/vKUkVB5qVqZjQ=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mR3TxV78K5WwHf40I2/Yy+uoRNJOG26+TswN+Xn
 dJnef6X7ShlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCKlAgx/eHl3ObAeYly5USOt
 6qaqwNHJeuLLcjSkG1cfCjwh0b44heF/MFPypNq9+1WN2bTEZ6xjcM2qVJt88bWV25yV/C9nML9
 nBQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|DU0PR10MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8594a89f-4392-41fb-e80a-08df3ae65ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	7K5jSEZhi4IHEFSVO8jGITbTsPsyZgJQSK0O39p9PJ7P2cRP5kyataCTvO5jXJvERMBApS31S0OCN+cxImFFcCf+NwVzO3TQTCdjdC/f+iot7WxCkB/RhRK+LK4ncNVd9IfQ24Ewsarsvuf+szAZsjw1oxM7WumcXVZM/hywouNfroEA5UyPirkFPqbkxry+RiUMJ2DBvb8l2r9rSF+tjixZFMdxJhUI+J+Fzt/HyEMj00A3ku5nJHrO/gkKCmWjkttdSXzmokDVIF8ubDu5AijSCfk3NrdyFbBD68SeFp2eZx5dGIxK1jSdO0/48IP/PxUVpSIr+bFu+KPW0MRhUgpTK8qfLzPkjCJD/Dw1kj/kLaHfvO/KeM2Zzbt7RqEc1JMRBQ+iZgDeRkVP6nc5ELjY9yT9ZB9FSkTmOcHmyj+LCNgKMB+SYd3P+Qf1XM61j4asExpe6f/aMsXfiazdik9dDQECq1CQtQANAGQme8wcvMwWE5aFgaDfw1USvE+kqTr9tDjXdmxVTJsGZSgmyT50139FbosoXi20Y/RbxDP4O4nRsK4uNIb/6NgIBbX14R0oiHDLC3y8oMS1iu2hNYJz0upX4xz2FGt0ZN/7yfjRw4TMIzgMQF2wevvKzajaYSoHL2YoRvnq1bAut0NGutaxcFDaLF5lir/6bVze1A2ZbYMd7jpANCHaxk1Yll6g1dBxr51AWuEup5hiS7n4SA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L9Sjcq1Of1ifinXFSLx6dzH7e+w46XfsivIq37iiefLeNRe4/RQSb2cMNFRMo7Nk7rGZYy3DQ0HZk2ReP6m87LVFyMKJL6ktm4h/21MszlUUO8Q8/odml1xK4NPnhSqX9F/uyOq6TnE6AraSci+rEUK0TdHcmL6x0NGkp4dhLwRBuwiqvQlcbvIaUECm+9sjZdcVumTdRaXI0o6l8SyKF4j0cyxrp9QJp7+wQwskbpZff1UbMET8sXjKU9V6yHYXfXCawQL/C+3kuBf/ZHTmPtaKdU1ocCzsQF0pCS3BCZeSgzE4y4p7PbiAaDGhI4W5tQTlbItz+ODLMbJUj/x6NnkQ3px/AXMHnyMYR66b60EgaGbWYCcEV/apEhDe2uxoY2vxZnBcBell93aODwR1g/PlYfceyNK9wuulj9uvO2gpnrM6F6aXVa7NZGxaXs5V
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:55.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8594a89f-4392-41fb-e80a-08df3ae65ada
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6105

From: Michael Trimarchi <michael@amarulasolutions.com>

Configure the GPMI NAND controllers on the BSH SMM-M2 and SMM-S2
to use the minimum ECC strength required by the NAND flash.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts    | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..aac211a9f9eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..df11f81ac50c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 

-- 
2.43.0

