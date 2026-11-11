Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389057;
	b=jx1mbpOX7e6u73tCzAyzWfjH0r+n7D60gB6AqyA63zt88dH7IArA54h08yPoGHbjLGEI
	 2snWju+qz0JkCixyg8CF3u3RwZlRron5fdgjIPGyhqgNyPTpMCvv+lfW3T22GHmRIZTDR
	 JfABi4xA/fC8bMiPV5CvG6BIym6kxN17Rnmb15eD+yYOLTHi7qwl6EhvuyAmbpk6ZT1XL
	 v6TWUBgVk+d+uvFBjn8gJMiWJ4zGEy5JS2FNM3Rv9VFNzbRkBRwkIXqvGSwPUIqc27ndJ
	 TNiJZIZssG+74Em7EhXyChgI6HLsw9iF5UBhcRB4KOQka8w4jNLM1Nxk2f7n1+uNz4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389057;
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
	bh=C8usJq+9FFAcQb3fBVeuAuYr/amDECfCahgVa1O+MI4=;
	b=wlyEs2ow1mbZL+O6mmjKva/WsdWUMYBa5ubwsTCJF1DzruQZJnL4JhRQmuHvGwK0DnDW
	 DFIWHlZC84dLLbc0mW3ApfuCHkkdJkItj1aU+0xrsssC5C4GHmoO5nZ/tXGvg2RgS/vBM
	 DdSDjxL0iNFNufdUFBK0ljIfcVxZ7xFUnLoisk6ZXZ6bZBodbkejcDcYX7766CtjIwJZX
	 Mm3UOpxJz0MnjVCyiYmJ49X4vz2CmntPFP8T7cRSU4xHHooRPdbVvYo8cF3CXa59pZ5Vf
	 kPYQQnJKNKOlXLiioNKUpVfJXPrbS/344XwAiBOw2iMnjbwyI1U6QJt4Ujj4Vv9U7Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b="SHmwDC/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96175606A338;
	Wed, 11 Nov 2026 09:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96175606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=SHmwDC/Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNFc3XvOrQY7XZnAGQY0vF3DSzwyNJtCXneVzOXx/Jxv5YJrkIsMzLr3GA0NoSezW/bWZwQP459xdv7MKrSgiAHqaU3Z+YCj7XniOf1eqVEk/aL2C0GQalWG2xLFi1NiBxHuWb8iKi2bIbLayVZoqPdBMKeoctbQtLTtGwmOmOrTNVbdsU1yRkb7Ngz6MkNWa62XvEfAULpHxT+PE7J7OjD9xqph3Xpebw6429jtESsrEIRlR9aso0c3iUFo/RyIEfQQUbe2GsCfn2EY1aMMwXJIcnp67nM0dx8lBgrUc08DwkT60YUG8D0rL+wXQ4BRvfMcuVdMzvOL0JTKxx9gew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8usJq+9FFAcQb3fBVeuAuYr/amDECfCahgVa1O+MI4=;
 b=UqlqFTpBfMav+FP5zhKegarWLlZUyp1rTLfkx2nwU/cVaMz+SAIPB5GJBovQO/3i9WWwi0syAQNxOJH8/cxzJ7vrXt96ks1WvJ/zfQRz2BqIZaqUh+JDnKwL8nphr38Iu9OuL2v1UNXGRVFDqekm27EU+zyrpF78enqm9Hv9kwCuJJvQe6ByrKPIdxWE9GoN1M5EXxZGjKw4xInu8tWa83c87wAyCKqvECeJuf/tvtBjCLH+v5W6zMUq8zrTdTwtxKaOrd/aYxaa21YLv+P2DjcQ3P4JWHMSBiSFP01+DztSlbzv7CyADi7LnTQC+Z4Tw9IrU21kY744HkJFEGrN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=oss.qualcomm.com
 smtp.mailfrom=cn.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=cn.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8usJq+9FFAcQb3fBVeuAuYr/amDECfCahgVa1O+MI4=;
 b=SHmwDC/QsXjPGY1syZOsczGyCNVZU7Zj8GATYHx9v1GBQ+owl/iQyxsA7vijauVanItXi7yAdjq3kxm7KvIzjA6m49gYI46h7suJCOakJRYxpNiw4xdR0sdSkheUKn4bi3s5MnBChBf8F2RDQUj1LNsGAieaZMmDwxQI1jy5ptcqp4KHRS4rd5yLlolbH86QdLFtD90rC4tZUglTT4Ucq4XObZEdVplm31VArUyDbMPnL1xhMp5lSoHUIz8q92WFwav/7sn7yFkY6xbhrpVkz0KmzaMoouRagrjb/70zNs39K129TaYQ/vMDbGw+SJOEyiBMvo7nxo5wUhixdzR8ag==
Received: from DUZPR01CA0278.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::23) by PA4PR10MB5539.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:260::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:12 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::87) by DUZPR01CA0278.outlook.office365.com
 (2603:10a6:10:4b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:24:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:11 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:23:55 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:23:51 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:17 +0800
Subject: [PATCH v3 1/8] dt-bindings: arm: fsl: Add BSH SMM-M2B board
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
Message-ID: <20261111-add-bsh-smm-m2-v3-1-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=4OMhtNRdGKzPOm7EcDtkyYV4i9zFz1R6yKZvVbJaQy4=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPDolnZ84kteVm9Xurxv3zW92q2Fka9lAy9mrTx24
 oPV78KGjlIWBjEuBlkxRRbVBO+zklcDTKfNrIabw8oEMoSBi1MAJuJvwsjQfIM5b6aZYuOb19Pf
 8scuPnOuMCaFZ5npgYa8Wya/NCLcGf5Z3poctZW9/ZfimoOm++r7n8XOvHj8ts7RlE9+yvN9bpS
 xAwA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|PA4PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: 167f0070-fa6f-439b-4812-08df3fd58b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|22082099003|18002099003|10067099003|5023799004|261028144727099003|11063799006|261026140227099003|261102123227099003|261021121427099003|56012099006|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	tOmzYVMvPFn4yaBVt4YgiW3PaBvcePmcODohwDSAgCODd5tyFpZxDtYBgL6EEIc+AdeiQ6fm/4Baf2RhGwSLa/XaxT47GU4SieDgwyE5t7nRLE3EYmHECoC/dyJZrjMFOtIVuGY/PzL338MGziZ8Otmnk27AS8zLRILc08mAQH5wXmWOTp0865shcusnGd29RuHDCfc94K0OWuyGgGO+7pwmMahezZWJd0VjOTCPVCJ7Ck7+ZouSjsn/TxkvQm5h2MhCGN45w/Ut3aLS+muNdFjI/4FySltwPMRNWsPkoBvDioubepuUdba9WPLmEsUmnDk6nnLE0zgV3DENsMRYjpnhwSDwKV9eemD7XU7ndG+Y7If18FRr1ibECF6C06ywVqiFRHotsdaTWd6giriRvfWH1Kn5pqSIXHkrdBeOdsMvxy5pEEBlsegFU4bwqxMPMtCLJXubciT4PxOvX8/G0DTOR9aJ1MCaTBzr4fXNftwzZPB5FIDpJs4j/fexzkmHYDhYKN7GeTsnI2XABfSn2kc7BrjIQKdPQ56vn6FyS3/Ve/0M48bH+7wR+2lHsVjyY6gEeuddHijxPXylSVpEJKLIxefN3FlmhW9quhSQrtkhFYNdlwnR3xgxOTimgMzotRufwdwFVfLsT0qDmKYERIzelmCyIBCrDG3y+9dyPqGevRjAcC7JkRVhJMj6JER33VZ15QH4cvLEm1h5o/oqMg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(5023799004)(261028144727099003)(11063799006)(261026140227099003)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mQJ8T6T/IdKwWG/OyKouDsh7j7Mz1WeCwzPE3g9fkfTh2CKucXv9nmka4HFKUwkCc2Pra7TI2YkT/Ht4W9wbpc4AizRawaXQsi2mnrKxy5aeXtgzuowFKJpZ6Ee9Ds2l+4DtPxnOXabi9nQnj7Smzifvrh/Rtl7GS9SlHEF40zmHBQ+Ym5hPf15Scg7khDuFSbV1Nk0QGTNMCWbqik4TwIZ9yG2194V+RvxY6X3zHjapw99PAmVbwHFBuaLvwUOk5H9lD7Ck0cjOQEzsCSiPunVKTO76xxJrusJD+xhj1B7cFizFreUBrdYzB5eFx7rbr/ZNHLDfvu1DOAhK+Sum2xtuaVEGDW7mhep0+afUdPgoqX7K2c793ejECCpHCn7m+02hyubJhBk7Ub/+/zaFeH/6IrmRWwvoP/TZqbejKujoJypUVL1WjkEHh5tcZ5AN
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:11.0432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167f0070-fa6f-439b-4812-08df3fd58b89
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5539

Add the BSH SMM-M2B SystemMaster to the list of supported
i.MX6ULZ-based boards.

The SMM-M2B is a variant of the BSH SMM-M2 SystemMaster
equipped with an AIC Wi-Fi and Bluetooth chip.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f044e9aa04fa..9c86900dec4c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -867,6 +867,7 @@ properties:
         items:
           - enum:
               - bsh,imx6ulz-bsh-smm-m2    # i.MX6 ULZ BSH SystemMaster
+              - bsh,imx6ulz-bsh-smm-m2b   # i.MX6 ULZ BSH SystemMaster
               - fsl,imx6ulz-14x14-evk     # i.MX6 ULZ 14x14 EVK Board
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz

-- 
2.43.0

