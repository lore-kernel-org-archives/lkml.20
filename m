Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777888;
	b=ZwkSzBNgNOsIS/fhrMCfASErp90+CdMtMST6/KqtBlbVhggn/PunMLUUhFK6L4J+shEi
	 4ZGcwBWmKp3Qdm8arploPpC6i3WdOoQdVnGsie+69agFPNZu35eQtdY65F+mSo+05sv4s
	 ZFPgvU027FFpBAKKcarq6zQEHEWW8IiQCFVh9h8moPz36XmI/4AmWMXCcdnztT7O/FZpl
	 iresLiZADOrXvkWE6VgUDkZEKtsJElo91QAH05TXfKC7fJDMsJzmbVLSXHEO/3PRvIBtW
	 BbuVYw1Qwy9Buz1tKWEs10iIc7gqOcO09MkTgfXRGuIFv3I5DjU+4FUpk+I6n+m1fNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777888;
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
	bh=9LRTBk3nxs+e7fnAgKAYkOgo6rEo8igeJE8NdssqvBk=;
	b=G+wYm8tCx4GFOtLBql5sOismswoacUlgKASC0N9SbtYRMkQCcHlTE8TlwG+yHuQZ6bx/
	 UOXEy3064HBReFUyPkiH2V2qPJCQEFW10MZTvoERAxwlkKw4B42VLTLRP18Tk6E90IKhe
	 adSV2leugBobUL9KmOogPydEtreFdhGu7PbNWC6jlbioxAroCRB7jtKLj5hhO7tj71zX1
	 1CDMR+eJumIqdeA5NiLG3lp6uzRWVItXQ2YqKVgFm7M3qZB6jbPFACnEDKwe868b0sNuS
	 WFHTFfo5GJcdqIs6EW8PP7KTSzcuEeGyvMICSTvdQ5QLXo/67X+DcO28t22AR9+7Ipg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=XMOQEMte;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.16
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D20606A337;
	Wed,  4 Nov 2026 07:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D20606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=XMOQEMte
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgwyfKu2iZ/mM7NnW6kJaZfWZDwRg/gFJTb2t6qKeiB6cvDBy9cnYrWjmpQulcNh9VS4zOSZTpznlUXZ2Cb07LzVnqr6yrd1gSnD5inKfZSytjlkil2qOfMG0yOqJxwKbTACRnpWgnsw+9ZVXAq0UqXeRZcja2r3dPu9C1bbV8R2RH9yKl3qBlVXgpyfjhLYRJqxvoGMjEWebTKipHX0+Mo/6mve6C7V/L99aAEGkpDaHKvOP5mWLJuT2JMQEMR6t/6pArTxwnoQd2X9vBWZVAmbr5eiJhXPTibFCMjkV47foEWQicM4wIJI833RHENBb3L7soW+nNBo3zpHgUHmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LRTBk3nxs+e7fnAgKAYkOgo6rEo8igeJE8NdssqvBk=;
 b=hCbvScxClLhw9tTLiTR3wY9iyLrQiPT+8eOmvmkwsImN/JeT8sbckUaMOFZG+9vAqoFilh9i13vmL8/4meuJ2Mv+xc3tj+jnLl0A/PUlUNu1976WC+4PX9X2XdUcjoeo5VWkuRkNeYB+/5KZKyO+4Mvyzihe+18O6+6wkqAxrdL5BRE+i6AHsGOeUfNA5i3w1J6RtOzkrWDFptzIIkT6H9Jc8Ecu8rlY6U5An80Adk4u66HbIp+T+ym72M5jBum8AWkOf1mtbxLQt4ifgCxbLIUoj0RAxLa66ZgosFMb3E0n1q48mNNiUL/3g9fZjxsZspSaB/benlWLIwvPBQZltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LRTBk3nxs+e7fnAgKAYkOgo6rEo8igeJE8NdssqvBk=;
 b=XMOQEMtezsrfsVrxPYY5OJUUtBcHHnER7BXo6xJUGiZnDK+VX89V/LKDa3EflT/i7C7j6zVIe2Y3mvc69G7GiuS9878Crl6F4bSwoRrF+6b6dwwnisnyHK2MmREuUu+3Ka49Kgej+0vNyOSAajFIe3RjrTML2Oz6mJsGMY4XkkXIiyUlNu5aUnmjAltpCIrMMy/5J9W2vaJGxiqorscMBQVWiQxU30t92ptdqCXjqCuBU+ZCZLtf7c6OvFst+4aXa+TIy9QhxyvddxoopA7Hjt/l+fbinfVV7nA57rC9aN355QL8Lurmb+u8ziONzk5eW555Mq9333tzL9ZYlPzL4g==
Received: from DU2P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::33)
 by AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:02 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::b) by DU2P251CA0027.outlook.office365.com
 (2603:10a6:10:230::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:38:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:38:02 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:53 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:49 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:49 +0800
Subject: [PATCH 09/10] dts: imx: Enable USB OTG mode on BSH SMM-M2 and
 SMM-S2
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
Message-ID: <20261104-add-bsh-smm-m2-v1-9-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=SLub8BvIrVVZkzU1nd2t6PII+l/eIn6L6Q+eSGIuDs4=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVjB+0EovHbd/1dpnbWaB/u+bDBWfe8oXGM2dd6H3
 g+B858u7ihlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCJVBowMl7b27g08wPlrZpjZ
 miYtrfna7Odzk/l1VxQEyMWskKwNZ2SYm5cp9KqgVkhE96Hvzeesc2cXp6tdvty4fy/v7w2ix7b
 zAQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|AS4PR10MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: d77bde37-c0cf-4bbd-4720-08df3a468e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|11063799006|56012099006|261021123027099003|261102123227099003|261021121427099003|261009223027099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XQJ5ezUqLMAFrs7hwG7esATKXEis31cIUyhIKJcxtPO6GdSDXDl9rzeOGymhgfpHI49tWWQkQENeJ3kqTMxn3tglTpV1xpacNiCFqOU1d6wYRlXaxe+y+4+zG701Sj5J9FHnpbwELuNSq5bja3iJNaTOSbicaXRZfEgXsEHcEXpud2LIRtS1H1zN9HjsfBwBxc5gmMy9trvPkSuPQtjKn39gszfy+g0fE4MaOwqeeFZXY5P3IqT8MlqCvu5bBE5RmKVkAXGSsY7dpBdUTDMGBOxdEywJ/1G8LCfZUFN/m6JxGnXJG/29/gMb3yCIjZ4hUOCwKCrKXP4HicP5xT1MyWWd665TwU6upYeU++eeoOTDzYWVcSIhiV+vrJhgkQpZM5ENL1sUkkCWVX0rS41JJfr/Rpjb7eG8E0GRRIa6JaWivceYTNNdfgwYb6jm+j9wLUFA/xuHcsSuB9SBI+ikX+h6d9eEuXcays6jfkwE5fesL7t/yQrd/mly0rJCn7U609Nk33o2dOHeEddtNEtiRZX3W0BiLFGKKqN5dPDQ91VcJkFQR3i1wLAIxWziCMGE3JN6hLbhZ9IuS6gsfsgT2+Ogte5QwptpCsDGKcqHvT1q9HHxLWrgDiu9H4kQlaAMkaKJI0htbqrMOCsXD9b4YQRHmAIUsfYAJCebyCW/Vk+Hs1cGNGUW3PVGfXG/B8M4/NY67XY7XWcZ0uFM7gDXYA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A2Z4rx39VD0Qya7zr/dxGNUQG4jRWLIgoYw/kLDRp8hSf7J+CPn8XcqswajQAfJ7D4KllMOh16WfvvtWuvBR7XFzVjt8WT3JCd9Dl41DFi30s6pYfw3lv9kBhJCGVjNsTaNnCd6PQzxboxDYd96MgCLSMY1UNtrrFO3oJyMHI2DrRuGJombaKQe//1wP5j4QeS9j4UcZBhrLXQAcFp7U0Lh0kJcBOErfUS/xOYLGA24dXFUohoQJ7X5sYGk41byqBtoqxDxuLNcFARyLoGsuLVTI0Vq5JZNMyOCcNYF5WbDHqdrr8/zht2MNLV8InAUjlghXYxXt5jcEJHv7ZKGXU5c2/u/nwDiLNd43FCbjEqVnBAqejV0aJ+cyEKg5JiEDzgMZq5GEflBspob5zQR81ERWe7ZjURu7EYdns6Ly0ieaUJz+GWAyeyVz8utik5vB
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:02.3071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77bde37-c0cf-4bbd-4720-08df3a468e94
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5441

From: Florian Ager <florian.ager@bshg.com>

Configure USB OTG1 in OTG mode instead of peripheral-only mode
on the BSH SMM-M2 and SMM-S2 board variants.

Remove the SRP, HNP and ADP disable properties from the SMM-M2
configuration.

Signed-off-by: Florian Ager <florian.ager@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi    | 5 +----
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 93d662ec875f..cc6b53268043 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -46,10 +46,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	dr_mode = "otg";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..7a121459f95c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -248,7 +248,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 	disable-over-current;
 	status = "okay";
 };

-- 
2.43.0

