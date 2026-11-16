Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826534;
	b=HcGT8o8ssMwRoAh0vV58bMyrlAmitotsLNta1RmXTWW/nSXPXQWEp5VWrv7iW08/K8VA
	 mRFlYz7M4iCFQOwKVfXBD0V+Kq2U+BB+4Tm0REBzcjEWHYcVYcBwxyhhNkFMPNH5HWR0E
	 R6apcHPDJWfcN1yTRNZts/5RTlFwfodBrQ+Fg3qS+mW+Nm9TMoIVA9ZxTPif5MCaIFfVD
	 yzaU2vCayJynRca+vwD3/SzQqS2IN8UEAXuCw7Yxha8SX8VA9Vhwx0uceBjpWlMAa477G
	 mOAJTQxpYsIqCq6pcwCo924JYuSX+rGnAWxPmf554kt5ip6DnxvgJZWgLxX/JxfNMnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826534;
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
	bh=mwuVbCPyYkQKtfJGgyMEeixdZPSet5pOlsS84SWo4Hg=;
	b=JhFXUaBsRwecsGE3WUbJFOi+Cz6F0BAImtaVfZo5QO74kWUeWgEQMmLvOQ2VMlaXuZUc
	 cE4KQR4YWopEf3SNJ/cJktvA5VdHNGb8vBIH75HlazN4gx2spjWnS4nPyml0PwbwlGCkC
	 J9XSUflcXRLesoldzbfqDxnks4JmCs5mKazx+xaifLrNtQ+mcy2H3YGzy9qj6AcoQ9CP1
	 zk+b9ropbnW8f5wFmANVLKWFXuqIcHaDaK0zavISBX8WvE1weRSXFS7cyAG2JSWRdlsJG
	 PNafPsMvR3rXTZC+3D6Id+Dwh88rgpqZ5DuRKB3lK2FQXp5ZQHIN4WikaM7nk2IxtpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=CFNgTabz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.136
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023136.outbound.protection.outlook.com [52.101.83.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2787B606A323;
	Mon, 16 Nov 2026 10:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2787B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=CFNgTabz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n71gRjFZC5F98gG7B92XrIYM/An1dtOpHLDu+W1tYy2R2AO4x59KsruBLVX5Phx9d0p6FVxP61x8SVTDp529EW/BpPeC3fiQP1nChGwvyyVcTw3VPP9IknDcUEirGO/dZJsurNr+cjTUsBe7b4t/98n9pQ744aFrhhpw90sw/7HlcZxHbEzRfKW/NYlq166WJ4BmqfT0DKyWsq4Xuab5AMK44z2poitBtfnH3+RlINVACz1KR1LadX/TdXrG3zqMLH6+htUQ+6XSMBIcXMTM6O/POrsGCgRkk5btJ5cL4Yl/w6O6TzqrtT1z61eXWfoFxi+IQzHVVfqht5bmHRf7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwuVbCPyYkQKtfJGgyMEeixdZPSet5pOlsS84SWo4Hg=;
 b=JCI2CmBkYjvWHndPGz2cymCIEJ7er+i8ErMoyeqKk/zxEJnsQ7PRg1rF1ePDzn+Lpaw0LUmMr+QPju17g5gmoUit+/pW8aeQPhGhx4k9gQEgPg8fdNtldYIwawGZx0U2S/KZZDgB5HoMGV9sxwAoo8M/zutSeM5dK/hpq00tvhjQM12jLIGa2ktLDLUhCbxcFONvdk4tuczdZ93zZY3ib2RCeFhJaInWC5CK7pXwR1RuutyMFOiyZp8HSQMZwlj3kVYBGndMLHMgMvdjZvIagTo20oWL0Fol676GTXYgFP5UEcRSRd7nAMc4E2yvG57ACYeXaPHcmzi+lrliJxwQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwuVbCPyYkQKtfJGgyMEeixdZPSet5pOlsS84SWo4Hg=;
 b=CFNgTabz1hmft4or45DXoIjLV7nWD4n6v1JXvVfdN74rt6eZPxCB0k+V1HXisu4TGiXqT6GSYpykN54LvP8cDoy3c45gGSm40W26G3igfEaTFUsGAKiFLh8RqUM3HV9TR/u74TRfH5f3qtyFKPFUc298gNKT2EXMg4oSbLqO8StxzgroHpsopKhhAmvTsc3Onsg6obnQTywFgmePHxHWAHNCU1NB5u6mrh/BEuYSgkI+utm8nyNPQwU6pa3lwHbvF8sOKft6eUenviTDFLmmYNVpLVbCTlsYeGoAUn1faNq8KE+RNVN0hpe8+u7ERjPoJgzI4Mw1L018QAIclEdmnQ==
Received: from DUZPR01CA0251.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::23) by AM9P195MB1315.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:3af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:55:29 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::1d) by DUZPR01CA0251.outlook.office365.com
 (2603:10a6:10:4b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:55:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:29 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 16 Nov 2026 11:54:40 +0100
Subject: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
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
Message-ID: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=1724;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=lP5L2VSamFI1MckvDS/bV58LNUG1QsKoSV3021fTg10=;
 b=vbnVNWF1XJkPtmVaIc0M7hOBOtDQa1K8roBb3doa9buQCLH+RaMHZLe+7sex95LBqi2kb8Irm
 lyTxu/hmMLBDo1SBuFYGVMlOkYWjXBAv1O6O8ymbwLyNJHAm9UADN5L
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AM9P195MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 593d872a-d70b-4b88-9fe8-08df43d020b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021121427099003|261021123027099003|261022075727099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	BgPQbsocDzzvmDNBB6bGv/VsU05tymINJaHYXiRSPeMHrAShN0q/nEs6zFuaOvtaVYpHRMySMgzrzaiig52wyr9x+fTJ2111JoD2384lOlldgP9tWl/amk7G9X/+ny3pNYEK46xJSJkau4ogxB1qLJEBI0IVUEZRyWgNgC8h7moHsaNB5X5FkHbAskcK+qcXdlK5RFBsTnMdqkEnOQLCJJTfAEkkvUQDNJF6kqFt4Fz4shav1NZdS9Vxs3KJLmP8JmljEbu9XOA8p1g5KKLb+IEn6wlFpMkCOb7JKAgBHqiI0SMB02FaYPRXyYF2//0N+RlxabbnbcbHfu9uA56KPKtLI3J5Ci/u8AM7gLHl1DzkuKA0X28f3SB5VwxdnAljQFsctRBTDcQH/UXs/XPUXi1Ygz3JrFDkTgoy+zXSCxc+Mi0JDk4ViSuWh0LzkQXej+r5gspVhUURIgoJF5fDRgyrTSK2MAUOctsEziJQ57gsf3r6R08gT/1Y+v7mPaZkOwI1fRbwAjQOd3jU/ccdQiFal21q7zz1MbZ1FoebsdOmwcWU4yo4DjXo/kYqwTZlMJ4yQNUMOSK5v7yiyUnIXugwVZG8Beu/1DeoLDAHzkl83SL+AWkd6Df4xRqe2wIhRrBiQFae89QFybB8zYogDQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B1OH/1yY3y7ExM9FvWgBryO4o4XCcW8kbkP7gUKYOUKGf9AtsqP/DiN6F27Cryf7bJ3ylQ8MYVypfler0azGR0Vi3q3uBLouFp4vUYFGO/0oAdvXqVbvJbSk1+HsyoXgHyGsn7/JsIjxZzMuYAmh71jevAHR6C/MBFw5l0bHcVLwwzsaliiFGnG6YajMH++ggE6GKkntnhhacC7j5Cx/ZUggkjNbJ3Z4MP5E3niaZZTkRTujqVF4iJgMtO2lYp8TCk6ye0VCeraUs3pCDO1bhvhU5YOZqgO7lJm6UrcXMdtkT1AO4YAJmK3ICh9DJSXNG/CkyddxkiDkmFC0qfELoU50MxMYhKeiAHMoGSWSYFifxVsCXaCysfP8sY0L/gu3JuWByy8K+L9h1/wS1AUon8v9bzDZilH9sAscuOgKTCYhtfMPab3Tn50K894Vpvy0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:29.0199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593d872a-d70b-4b88-9fe8-08df43d020b4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1315

Add bindings for phyFLEX-i.MX 8M Plus System-on-Module [1] along with a
carrier board (Libra) that join to an SBC.

[1] https://www.phytec.eu/en/produkte/system-on-modules/phyflex-imx-8m-plus-fpsc/

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d53..2d21a1949d949 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1225,12 +1225,18 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
-      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
-        items:
-          - enum:
-              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
-          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
-          - const: fsl,imx8mp
+      - description: PHYTEC i.MX8MP FPSC based boards
+        oneOf:
+          - items:
+            - enum:
+                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
+            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
+            - const: fsl,imx8mp
+          - items:
+            - enum:
+                - phytec,imx8mp-phyflex-libra-rdk # phyFLEX-Libra i.MX 8M Plus RDK
+            - const: phytec,imx8mp-phyflex-fpsc-g # phyFLEX-i.MX 8M Plus FPSC
+            - const: fsl,imx8mp
 
       - description: PHYTEC phyCORE-i.MX8MP SoM based boards
         items:

-- 
2.43.0

