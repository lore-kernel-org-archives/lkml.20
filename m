Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826539;
	b=yPLNpFoNBhk+bBQICwdIGfyG/wqICzT6ljSaFESqpwNxbIInoHD+g0oSXPzf465dRnte
	 ysZHQxfjh0hqavBwhEXvpwMivoQo4UHS/KHCK0P/F1ZDCod3XXcAiWgDmGqwXrobW/cKS
	 HQVI51+AfD8P518qgZ0sYvNuhX4Crg41pGfxw1zZYOn54RyvLFyI7QlGwkS023Buww0jM
	 V7EzRSeSk0zfAz7URrCfprYgrz+3f4PJ6i5dD84cYUU0+VMK/DyaTT8YVe2kw5py12nuK
	 V57NJtYOoN+Q/r/S5489w8tzXAlz/gVwLtBIcRFj8oUudoZU/vG3xhU93onOLchYHYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826539;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=;
	b=ASUVjyGG5D/slahGQydHZEnuOUCwY8aObhF8M5lVfp/Ybxk0iNkb4m3g4GIjmAW7i0ox
	 nhCZkZvzFvGQvSRCyoR5fz06cpblWo6tgh+psZbBZPcnzR18+r+f+5OHw0Y20xFNCVheq
	 ahGC8rHto6WqwnnTL719vE4hmyvpyl23tASU/pYrCxGpVLqNrCViTpV2QGrTeNf/0/Cb4
	 QslvvveeYYpvqSD/VnRPCQdUzOL4lbBfrcraZ+HTcSXTq0Lmrs9lr8Hqj+Cz6z0CXIJuD
	 qUQLd38AxSnRVeKq46V4JvFKV59riKBeeuV0vvJfJ/bunibLZftl50w28XLu5eJkqdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=HSAEVzul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.107
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020107.outbound.protection.outlook.com [52.101.69.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0225606A335;
	Mon, 16 Nov 2026 10:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0225606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=HSAEVzul
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu1d/m2ACeoVDEsp/bCph9acf28TJIfn5FH+Tuv8wXk5S34zOOPAcWQegQndhGrnDpNXtWfLHeJGPtKH1fqSCoMawG3OFMRSXlQxTM4THxRFKfr3UQQjOeCtcCbUfSnL28Y0DHA2ERqy89yEytK+PUTXvgeZY7J1NLBkAZubXHpIBSJhtGNfpy24kBI1NbpydTqnmT6AEggAYUqiwMIXpmg8PP8sH2fEx4ifn07THa+z6lR0ptK4x0MXn0gZKv/rYpuArOTt++lspwxLk8G9pUyePsmpBujw3lADRTrziM4GLwwizxvljtKn33pBJgwIjjPjrymzy/7iJrzn/wubsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=;
 b=v9XPwmz89eCDAQBBuCUU3tQIxIY+rkpN65rZhVHsPM6U9Ky6nCb/ClKN6uDReN1UH35rB4wKQZL2gG7sSzj8iALcsdzIqwze+O+ErRB+/gyF1O8DuLO2ncTWHzZFNjzNk12EgESI0+gwO0828hlaxoVRnZxCz6wde8pCyHejra+3rbZ044qgsNKIH1NtUMcGKQ9aD8LisrSreKZrN88MWF8CjPMVrO/LL6TKRBNAjUaGaOY3Z1YE+MeKPTHBbcAs26JfucW8qRvpjNkz9hg5eBzEbzQy8+WrTip4koVGgFRfAVcA0L3MW23ok3jBSnnkn21fE+Av7X13SKfiI0Y56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=;
 b=HSAEVzulwau6HJ7h99Y0y9UDeZRIm5EaQCFB5xXCPj2PoG6w29Ijwhbi7Sut32UgPZlMSQklVKIkATmHHJJYyA0fZvhlNiEk6X93/bhTqubol2f/I5pihbYNbGAf7RE1o7VI8xjgxczGmkWGlPDbnTHsMWeQy+ZEXldcI/neGxmcFS/rz8MKLY0e06q2XIt5Jd+i8xVvvJrvdhvqeRaVBWbPbmONxC/7gpJw4kaQOql9S+0C7npiO6x/4VR+3rqhS82ZRRSvdl6mLiqX4ZmwRrPei+ALoai8d7KD5hoQ6mSXuRdydP/fNDIkht0LpSNMcwOMG6yVVfY3+QEOOXGzYQ==
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by DB9P195MB2759.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:5eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:55:32 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::5f) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:55:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:31 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:29 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 16 Nov 2026 11:54:44 +0100
Subject: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
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
Message-ID: <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Benjamin Hahn <b.hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Yannic
 Moog" <y.moog@phytec.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=1008;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=MB/iG4qEO1Hl1ywoLse6cXIfwi7oaZwo4EAn3kHYEgs=;
 b=YyaRqBpqI3NyduIGX6owkirXTWeagPsLcCc85TevH+ifrrs+vIVSUX9sJ7kkQ62OvXO2SCtd3
 Hc1sSHDo9Q/CghkUXmsXE3dgkbT0C2zJvD59HZr0fGgVkLI/FBWKzE1
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DB9P195MB2759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d26663d-0b8c-45cd-7e06-08df43d02279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021123027099003|261009223027099003|261026121527099003|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MBFk5nvVxaeXiMsBEqpTB1zbxvoy9FiPH8YO7hARhztniBF6kNyQrKbbD2qgv0gNP7xJZDKUsl+0TcgHKCBfeHEMrZO1I4QHFFD/r4TEh9UJqwXForunwWoJFAJPYqR+9xEXtyNWA4LaCPFzd2GHBQyixrxWC+t2atqJE94/qogoOqMd1VbEM8EDtVys3/SGjeqR05K6TznWH/NleUyijPFgW0GFV7DCwf0zW70+o60IlCwcMI6bpp1jao5PLQsJY9M5jruvUzE4dn92bmUcr+PzGCEY1Ib8vm8z3FQJOeDqRQ+Mw/UZnFHTcAI659uDdF8yQTNb5mqB027YuTp6HBAVtog9YcAj+O2cMgpSijwxm4rBs5J1OXUvbAPqulKgN4ZtMeamXrHFWKqOQ/3pBroI+H0UaII5wZ2Tj6xgRfBIhwDhMorzjWw8ZxeqWmiWNNvHl0z3iVyI1ByH2PeqIVLsMSFVnty7uaxQjUL5Yy42tSeZBWZ8359jHOZeBNHJaWdDm245cHJSgzDgaZZndErHwjGPJn4wW4mp5E9w2yAV01kEMC5/AUYZvhiMg08rBpEMqiCCcyY0IGI+LqxFHmBvl9GjT4e/aewluugLrY0I7fWhC54tVMDGCb1xqgkN+f3Oc133m5XE6FsUS7JCtvXabH9Lz9zrZjvPk16SMA7hzdn5DAAMSeCCk/eEHOQ/5YSIkMK2IrRPyBWg6lXmTQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261009223027099003)(261026121527099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YL/h4LZKxenra0vip75MCTIt1jhQCZ+RJb/JFja2Y2itA1R33ZyX7T6EebCj7TaD925FzFicGPwlv3Mrf8ULxZA4wKsybaSQndMKu0mp9ywXpkIG2RCHV3KLIW4O5fNRAwGe6wkGLK64/HA/N/j1whTEee7HmS6+++OoA/KELjKtSjwHFHA1sWdICRnkTVHnux6xJZWCqSVrKFqdVSRVcTzlIaWk+9V9KC9Mm3lFHBusIU/PEA7ZYJlf29sDJtTpXN+3gTN3AHLIzQWIRwvJwzOf9bx2O6pRy7Jz9cOSWid5fk9guhf4Yew6pL6PT23XkL7mj5ZOlIpc8IGO4JlL1/VTFihBnPK/LB3rClNpTe2CzM6iYjm2G+nes+Hmdk265CX66xPInhmtT6rKf9/A8k/ILXfLAYgMitGKW5xljdInGq2ntAjIjlebAeYxsqZj
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:31.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d26663d-0b8c-45cd-7e06-08df43d02279
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2759

binding has no consumer anymore. It describes prototype product only due
to renaming of the product. Remove it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 2d21a1949d949..ae823a7670b02 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1227,11 +1227,6 @@ properties:
 
       - description: PHYTEC i.MX8MP FPSC based boards
         oneOf:
-          - items:
-            - enum:
-                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
-            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
-            - const: fsl,imx8mp
           - items:
             - enum:
                 - phytec,imx8mp-phyflex-libra-rdk # phyFLEX-Libra i.MX 8M Plus RDK

-- 
2.43.0

