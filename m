Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389112;
	b=P/DfsCv2s98aZk3/mbOOoBoRRbzlsizIS/HeEk1f5Y9zv/PeyNmALSuxyb8jEqPX+kF3
	 g2xOBfg988kMJGpery+J1j1GUlQtZij79COxLg5W90Ruw2bc73lsFcYeouMbK04WgtdJT
	 93RIpd/w6Fqry2lFoiF7BXUOmRBdWnmAafWNzC1QcdIzo0SemSHZaZcVU+Ve5ICjVbCPm
	 BJJOpVp8fTDxFR8ZSbjKy7zx3DOxeocQATth1OYioc0yEra6Vuvg3aKXvYSLVcCGdg86m
	 G38WrkFSd1sy9Ea0nuL8Gk0p15VLl0ympARqUxUVFNxmelQCG0dujM5GcNohV268w7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389112;
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
	bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
	b=KmCz12tNecmLejTHdhJkonQWvw6gmtoIkSEhyXJVKhVWIxG8sB4kBsNDZDYdwViKy5Tu
	 CgsgqmDhWY8sVdKwYdZ6EHn+6gvGGLf5peOo4sW/awe0uhidL+DK3vquwplyl8VUVoSUN
	 d0A5AM1jqhBaleCEC7wuuSQHOoGpCGz2+AxQ/ZBqstws5dF1Th7OJJTOPrMABbPnLybVO
	 /B8rE3Muf4U/zGRcFxuW927ze4sz7Kjw/wj47fx9r91i4PIUM8p32wYv4rzMj+5vikXLJ
	 IKfnqGpili8pEgutu8mLJcXQdiesZhuEXHHCxrU13q+Hzz/TZ3pWwaSqs31ZD5MqxIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=InynUrzJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02C60A2605;
	Wed, 11 Nov 2026 09:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B02C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=InynUrzJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI25tx2i4QsGNMqs9/hE0a3Ua6EVypRXSlNa+FnmbiJKCuDIpuFGQJj8B2g3nSuc25DpPNz1tOG/vsuSsjLFULapJ1ESS+BzEKb8ng1Zbmb3meYv8XLI/EoqrgLiqqS28fAJvTDDb5dujUDZ5jauSVnNFSaq+gQleq9uk2gtaDzglHMCRE3T+ve4fH/OsPjpA76AQiPrc8QV7cqe31eAJy4fMb5VwXeyd00eeLMiNe7mUBYmjJuBE1HGCa96tm9E1nltr/lErkcZUlAGiZUl9L7cJevHHtG6fWncLcqR/oPxwxVPry70VZ2KbyrhsnFHybmQxFZDtyOAHp9oS6pznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=cMA7QwEER+eIK1YU5coFrfruE7/12V3hRbtWTfy47UQZ3XeJb8bAPmPFmESNbUJJY4xhEgQzBFsITy8nC95JrC1r2lm5v5tGTCCDuP2LSUlDRCPOyWv5+ea5AiB0wYxatcr38zUAWY0VlZiXwviVOTGcBogxIewLTt8bb8dO0zIWIptU2Fi/XJVk069BB/JBvljUBcdtUMRoUbkHrqQR6ZN9m7AqTflIADnHfv5tezyY8ohynJdN1l9/yjY1qzmdYD1kCrm4mVbqgGbrpaq93QPzcTNUNr80lOotTbiX6GCVQA8MQWd1p5pzeJeuDHPAsGyZ7PKM9SPNEWovGZsh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsNUOT/l/vZFz8nmdnrEFwA5r7M6uFFAuP56TPAVC00=;
 b=InynUrzJD7ipzBaSt/23otlt4D9qIuObsOMfQH6vNZIJ1rURFV92hG8vsp/t34qB0TWdvJxwQq2V7Gr9a26Lv+bKutSk647hCfUjzNWiBEsoXvgWzT0KSuN8Hcg3VX+MNTLbxVY49rdf1vVXaxzuFV3JOnDvfR16NjLfDpw5vKHix7HfoQnY9eYzdHxPAbr7sWv7S7eWW3fPFjsfwCjdJdYsjf9Qygds1BAC+HhSA09Ljhi67DFmlLgQBBLIAkTKorgZtZCj/MRQEZBzi7hDbv2vxzhQZnFCk4KdkViLX/KRjqYHsJC29I3ZwOvhfoxUGcjEuooP6prm44QRg2nyjg==
Received: from MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:51::6) by
 VE1PR10MB3760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:34 +0000
Received: from MAD0EPF000008A8.eurprd04.prod.outlook.com
 (2603:10a6:501:51:cafe::38) by MR1P264CA0140.outlook.office365.com
 (2603:10a6:501:51::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:24:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008A8.mail.protection.outlook.com (10.167.241.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:34 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:14 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:11 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:22 +0800
Subject: [PATCH v3 6/8] ARM: dts: imx6ulz: Add BSH SMM-M2B board support
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
Message-ID: <20261111-add-bsh-smm-m2-v3-6-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Qiu Guochang <guochang.qiu@cn.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=Wu4+NJU1Wqab+k0K/gKL2a12YrgZQpuITcxOXPjHLfs=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPCEiR14ckM8Mj8g1v1mDtsX1oVuR/PSeE+df2Fx1
 uQJR6pXRykLgxgXg6yYIotqgvdZyasBptNmVsPNYWUCGcLAxSkAE7nKzMgwk6PPYP89iUDRqXdP
 LUh1mhZZ1vv2z4LHu9TspU40R3sfY2SYOHFN16LdhQmL+56+nvqxmiX9H1NEQdiakqby15s0//x
 jAgA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A8:EE_|VE1PR10MB3760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acce2b7-8e58-4e93-a110-08df3fd5994c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|82310400026|1800799024|11063799006|10067099003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221727099003|261009223327099003|261009220027099003|261009221227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZFKOiRSfipTyN9bFhkLPBfhCww7PIFC2CIICHx9O06GDWJojzAIBJNvMTy10dK1Hu+BjjGnVkxeMuoq3fZSSbap5wNdmyGFcMqmmffWWky6esw9e7e7jgii9gW2bpNGTeg7ZuvWSmfXw6tB2EhJVqsJuxZwTPge1Kkx/48moZz9PUCP748oL+3iAwYqmukO+n6brtkAcAMWse2poDW1/oFL2clLW7GXkejEqUWzX2b+r8MB8PRRiDNUhSo3NoS7A+nVKL7oQs0yf/988mATpi6xkEu60OS/hrqfaXV6c5ucDJtu/ooF/HqLzSq8sj4bk2keafJuW1HLLHK3qzFC93Hqj6YET7pjK/GqVQt9lKN46jjEz7Uf/e4DHYyRcWo4AS6olqJiShM65HfWOgz1gmFvXJ/lvkElrYIr99mtt7f8dxy58zHP40vYQ3uD2t3gb9kNqlFidYXd3m5eKrxv6M4jL8tjUVMRkoFqhHAaAqk+bMZWb0eR50QvmrSiXf2ZRs0lX15MYYksGg7lbjEDqWLGdS+s/oWt7ayJf5FA4U08I+7VZynpl2u97SSlZxGR0wCYotb2JWqbT+0jdEBS5QPO5KRlBw3EF+Oah7QU13dcThXuwRGBwpd2UXlMSfJwhR2ll9DfB+sG7iSry9om4dVMRWuG5T4a23mv/kM4/rFfcPSpXqYq4uzMpmmHbtF0Aq/gicMS1aegCCk6hypC3Rg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(82310400026)(1800799024)(11063799006)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009221227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p0hD7awp24TlJzHDhkCOR95HHCqm286+RwEGcL5U4qc3+lIRv7P1nJ+jhVDn5rTXmTp0WIn9vntYvpe0KycAY7vKpNCltR9Zs9xJwowwsNV6UBfvPHxNMxpbMi/BUPLOuH4RBOAyELjc/uEad8PKsiODxGp2qz2qc/98voWCWrZ0fEvGiYpIXUYcXMLv3d8Bir8rC7orXpi6jOo6L9u5pIn80NrQ8dAsDVa0V24EDkxgj9ljfeqBwO6p6bkmDdBdnd0jMYg6RmWlnTxkcXvM8YFe/TobQo8KVWwJeXtmmITwjxntNwifkpa90FMCRt36+vKoMivgmjPD67SQBm2YnzvLUTLeHT1W09QVI/KBQyiMfKLCMviHdzblgQq7Wubn6VWDG3+ZB3QpS7ATnglZkoBpmw5TmVckBFWpqbBpFOKoLVvxceAc7M5QIz2f5UBJ
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:34.1304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acce2b7-8e58-4e93-a110-08df3fd5994c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3760

From: Qiu Guochang <guochang.qiu@cn.bosch.com>

Add basic device tree support for the BSH SMM-M2B SystemMaster,
a hardware variant of the BSH SMM-M2.

Reuse the common SMM-M2 hardware definitions and provide the
board-specific model and compatible strings.

Signed-off-by: Qiu Guochang <guochang.qiu@cn.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..de9a317132ed 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -420,7 +420,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-var-som-concerto.dtb \
 	imx6ull-var-som-concerto-full.dtb \
 	imx6ulz-14x14-evk.dtb \
-	imx6ulz-bsh-smm-m2.dtb
+	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-bsh-smm-m2b.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
new file mode 100644
index 000000000000..9dc92da6ace9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 BSH Hausgeraete GmbH
+ */
+
+/dts-v1/;
+
+#include "imx6ulz-bsh-smm-m2-common.dtsi"
+
+/ {
+	model = "BSH SMM M2B";
+	compatible = "bsh,imx6ulz-bsh-smm-m2b", "fsl,imx6ull", "fsl,imx6ulz";
+};

-- 
2.43.0

