Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367195;
	b=JRwtoU0YX+um6VrTlUEaXOlhbEqBu8nKuX1zo1LpTAU2DbPBRbAB7gat3hU/CL97Y/Q0
	 LSzyeQAjLPUG63XMnFrqxya+Hd65hQtI6hU72W6LouEn65jhqI66kOj5xwS6w0hCdfYkb
	 2rwNrAqfUClKMJ5v+wW2RNeSgJXglssSTUEgRqIlLBnF9RJXUsBiS0Z3nEPe1jfj8H0aA
	 90LZQP7wbPbLM88rbZNHQ0n+YleNm7IxNjjnrpaEEwli5A0+1plKyoAvqQwrF6pHtovdX
	 F2zd388POIf2Ve3kE2GqVZ0+uK8nTYviBZWh619MPMq/QlSdb6GEUGMqCFoMOl2hI2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367195;
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
	bh=+q4iAq9i3J9tyl8tU+UhPaSh63KglkSDGAQ7SB12KCo=;
	b=CqkKYP7IdIGrEanrqaQc6CitIcHs2C/8jiFHhF8SLiyfmOFWEQI09VpHt/pGzdsbisIU
	 Nu9FfJHf46xTtrivI4gIyb25tPdIiTXi7pbGDOOlyb4I3A9Q+oQnguSFgCOOK6ipjGbpi
	 hd2LQnHAu3LEZq+wHtMUipPAnSFD6Ve2eQxf7/WekjW3I3vugVwhXgpjdnUWjkuelx6cT
	 8vDGYM/Wj6iNYcRSp6vnFTMxRQAvbMxMagWqBvA/EBRm2n3min7qmULBIarTwC7beJ4wP
	 QcOfLo5+bU6GBC6GkBL/DtXemQ7gtEMWLEPEZjHB0B4dw59v8RiYJKjijgjByNxdx7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=t0ubLGO+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.74
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023074.outbound.protection.outlook.com [52.101.72.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA92606A320;
	Fri, 30 Oct 2026 13:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA92606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=t0ubLGO+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hilJglIWofNFOFDDnSCftuEbAhQCwhofJ3S8Pn5p/DZNpq6q3y3lP3pESR8sjtxZPBT67gYn5BkxfTXrg8wTCsB/QPAZRXvWXOuOQHI6dru020S3+xl7WKKctq3lM5W6oe6B2LwiaSJq+S8c7gdEp18HA3oiINjAlZ+lRB2u0T5qeEqfw5Sy9r57oeu9rMwD7qOoJeOxw/0o8IY6laS6FDx+fBN6XTqjG8130Nj2GylScSoqUoK0XeNXMFmXG2sY+XNb21Y/OW6o0issFeOJr14rmer7yunQcPhsnbDFG0PgKvhcG4Nk881ArnztdPUOWAron5UaqH94h2IcuD74Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q4iAq9i3J9tyl8tU+UhPaSh63KglkSDGAQ7SB12KCo=;
 b=YhDIVb+RpTcPdiJeVrpejjBHOggbwBLHki8cgnXbDJFCAOk45sF4FXeOXY3o6TVrSKw2izDlPwG4rWBHmMHYOdCzuuDcdcvA+Aoo5fzwbB6H3xT5hf5NSU0bidV5oP1RRMV0MFmWZdtM8Wbk851aW47tTKm2xAOX4e+Dzqveh6Qry/c7YflX0CzJF6+QcJ+rl1F/qOY5Ydo9eQTEJ2EnAig3F71LBf3VUmye/6B2wumQ5eo04FpupYNMSijZCyIrL6eDo9Pr9ufUp3dm7EeymRusW9tLU18SqaOeDIo5FJc0Mai17Xej+yz1swyxo49LpY83xu40lOQvIbwplpfeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q4iAq9i3J9tyl8tU+UhPaSh63KglkSDGAQ7SB12KCo=;
 b=t0ubLGO+Bn69yXg7nnLBt6Id4lxsyiC0B9WLXq+bPRMEFfE36LmfMD+wEO17x3hsvc5Itim5tJjhTml0O3xkI58vjQFAvwTsDK95ZCxb9iPKqYWCLm9kH9rwvZ6iE0MTMB09nAxA3F0MsnWZgJEkCQG8OaGq9ZdVAVx8+9DFmd3nia4pPFLAOs1eMzPzxiJ9g/Jp/06GiFwG4ej4AsUeNIGrRARmeKHjvaRSOB0z4y7lhxa2AXfTDLu7JmQ13u/KFJpmHWhI4AeRVh8VJ/rh9FQVkxCD8KibNZBhP00LDTBRu3nSEVPrcQrvsdxsr+X9oLx9qLM12L2j1ZPpzRN2eg==
Received: from DUZPR01CA0325.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::22) by DU0P195MB1843.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 13:33:08 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::21) by DUZPR01CA0325.outlook.office365.com
 (2603:10a6:10:4ba::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 13:33:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:07 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:05 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 30 Oct 2026 14:32:43 +0100
Subject: [PATCH 1/5] bindings: Add devicetree bindings for new phyFLEX-i.MX
 95 Libra RDK
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
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-1-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=1066;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=WdjNLvs0tSRaZ+rVMlxu0kWa1aR0H8qjupkx673sXno=;
 b=chB2SKqtFbMErkePSuzPtgPL2BSD65lg54rPdPcV/Zx8wAPPVNDipWjUnXzohRdAkBI9fIj+S
 01xK4PRif5PDMv/CZGLkXHudRaG+0ChdigrIuERW9SqWjEawMn4iQEz
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|DU0P195MB1843:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fc8f9b-01cb-404e-c598-08df368a556a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|82310400026|36860700016|56012099006|11063799006|261009223027099003|261026121527099003|10067099003|261022075727099003|261021121427099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2RQPEGZ/Mf9t0gtzFfMXMflaLlQrNQaDQIkMyQlCc8MkN1YNAGT5KxThfrmJCOtN0XZV0P/OBd49pJrs7byCjfA/+jgkxtzBle6DG+Mr8ElNg6U9BwIHlz3BXMGRbuRI6tQYEHMeOuD03pD6FrryAtzHGOFlGcBlW/umTAMUe++vM645WaGbwVyYQmjZw0uiSpkHrHMRv58KfM4tIQWYymp4gg32N4ix0uxpM/MCinl7wxHe6EE+/0hlCaCVsBLTSd+DQb2x9YwMTvnwOLU7e6JrGuMJgzIculTHDtttUGO5bQOREKyvxqwF2Gfcn55myE4SeXcfukqJDp8tjiKg1IGh944bVHJVQKvVTRkvIrIfkb+WauRT3HmvuTMmou5+rEnfu4snDQtXSXh5rK+Ahy5pfibinvP5thIU17eVDcF9atl5espVv77VnaSIrinB+ojgyWrjqIRCk8qHM74JMcaH4GYCtLeTzCOfI4bBTG1nuTWliXSqYqO2s+i2A9x22Q6nGa3RKP6Qkk0Bugz9zNSXqraMqx13JO6lrKfiSvV8PIDYIlxjbKrYDtJBzHGcmsLK5whFyIcvLOqRhtNAGzv8dzCMtTIhJAJm5tVR95pmBhruFCx9CV2v69nqmu7cef5DDzKoQYSoBDxB3UPUZu7E4lCWp5ePYpIj0UOiBsnJmnoJCOIJ1dIWjnnZzoeor4+t73xDeCTtdPHnkeJ5Bg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(10067099003)(261022075727099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GtZHFv6FhaVH0eP6cbeynVLk+4Kg94uFjXZp2FMBsh75nYHuWcOFQM6Ct2GaqBTk8uUKjCkhrlcGgI/gLXTIu0/6imcjKlRt4vtE0KT5cxiNHETQ27xVXsiePDdPZoVLHPs5GA//V6goScMhESAmAfLrI/i/hi5+O3b4JyTDg19crOf0WJ+V2QBU2nDGDOhSgsG+sE9VW8wiVrw/ru5UDg3AhNqsZlz6cmLgFWTnClWBJUK9vmwl7X/RQbUt3u1pC6SFl7+hfdAcbC9hBZGJArAspwRQGJO7v7nqSIAQAFEgli1fzaP2xrYSBOjAJTyM47mviSO2gXsTUAhsyZe7rxzseB2MRw88Ioqh3P3TMxG0dXyCrkpXShf8Io9fukdYaH6tb9sb8MyjDZ+ekOorU+39KJL5PTrjY6/MGakKhRdUBwUFS5knig/r6Cwmdhmo
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:07.5503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fc8f9b-01cb-404e-c598-08df368a556a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1843

Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK and
phyFLEX-i.MX 95 FPSC Gamma SoM.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..f917ae7202e9 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1551,6 +1551,13 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
+        items:
+          - enum:
+            - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
+          - const: phytec,imx95-phyflex-fpsc-g  # phyFLEX-i.MX 95 FPSC-Gamma
+          - const: fsl,imx95
+
       - description: Toradex Boards with Aquila iMX95 Modules
         items:
           - enum:

-- 
2.53.0

