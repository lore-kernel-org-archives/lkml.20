Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777868;
	b=cUd8jyHvWQxfVqvJ4WKjxZXnPLa1XSzcHZL487BzfCKqw3/f9eNMsY8h0dVIUzO4s01I
	 isL820EIJnQsuAsU3zwmeVjRfH0UYIQwdGDpGvIc+lGUBikHCmFHyU4kfwjSCWfYjSExH
	 5wPzbD6cS9ux2GlZMl/aJft7DJwQrge/31UhqcSBWRwxBzWkN4C399sPY+rhd+69SEiaA
	 SymY5f2WKmxlx+WziQbbuizLJVleOld+S1JqZMr5ZQcY+pOk0J3nlLweSboqsESfHn4SN
	 /hmJ67z/7K00l2NsS01L/Pt2TQO+vNx0h9VBmX/wrESc0LihjOxudMSwz/huA/x3Plw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777868;
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
	bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
	b=5D1PRey3oHG/eGVHGarszYjHXBHvcfAykliGeXrA5TPpoIY2QNo9l/ukIQzcxVwtGM1j
	 kfJ9U4oWrFgAFkbJyiW++omEyG1ArouX1vFrf0UpA9irCe/8z16qqOHEkulHLcdkvONrB
	 c1W6P1MRmWTXJnnd/Qf5nAHyrRxiDahHm+DLMkoGPxFvBubnQzc0qQKwdjoDNChqUzldY
	 wTH2YP6JX0KFtm3n+y530CAoYaXMWzvaFe8F5+6VM3ldF0tWXj4Z3BvbMjnpHfXqScjGV
	 VBQaixsS3Re7ocWJE14ALQJIwfxAO+o4lHxn6zmRE8W9rr1ykeLQdGc5yYBUS00w4wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=cCoKXM8h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.44
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE61606A32E;
	Wed,  4 Nov 2026 07:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE61606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=cCoKXM8h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBjZTcyViAcWL56KgAI833087trUcEpWDUUqMP5VlhuPcFt1yK/OiN8c5rVszv2K0LE6AxwwWhR+oP5eg2nGm05vBnsyGbBASYqskYk6QUmv7X8psSi9A0x+xnHmA5bhoT09QD7xKrqgwRK5lYqrdWV1uu6YvbgYSuliLhPKfE2O1u2UjCHJekvA3tizoRBOLkbZsBNiifkC/mQpv0sB8vdEz9aKWHBMK994/AmuzE1mcsQC3935k/iOktKjkJjvRKRIHk7OPUJXbiN4C2Ul+h2tT1i9h1JD6Ozgrt/fJn2GMjOAgXmmKUkzW94kKARiRL9EKwSrRr27jYnv02tS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
 b=hAxn/3/KQ0B/ecDtVtdmaSsI4vowfZGqANqRa6lxlE/Oy1BOZB2JydcsfglxAl+M+Rj33LvnoV7HBin5snlRcD8M3n2bG8HM7ihK2wffRo7Qqx0F55Dszpsa3NHwruHdfbtw5Yx6QBo15hReQJXM+K9neUsySaPKQJ336SD1T2VpRcFsUCS7FQshTaHwi6tGK2hcnbM3ExRLBDbhTAENHQMM3IUEyKavbhmvwfCwzsXXFCEsH+kvqcw4esUMXvrXtem99Fqg239Vst9ZgVhSWQ/R7uSL+gUT5ynGPQO7yP8Tl/rQXuo4DLpIWpyA+bgg5W0QL0hM/MC6SZpxQunZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/6x4evL3o2c7rBdXBnJxZWvFaWsAZhBZCzSABpAz+s=;
 b=cCoKXM8hJaAsrou+0VW5zYW8wycwPsVdT8MoibDenfwousNY1KrMpLAVJ4YcIJ16S59wJ33xDMeWp6YPxG9MqxhITz+1zL7eMfC9FKlg0jMkDwL57Ax4+zUZaRq507Lcw5gB4lmOGzYSukSudbqvdrWZ9Vi/E3fgO/9OvYuOqwTSkAli9lzFrxLGTZ8J0jo8S0lz6HIwXEM89VgyvwULJYx7AWIk9EDdmGQzq4kC3qy/qnBO0WPwjWL8MJuYl/m5TAEJN4z5FOdwXcVKWPC41Y5sw0wSrun1IiN1P7vQs5kbOfk6MEz+XeUbocknRwo3Un6n4cpJ4FHlTtsbAct5Pg==
Received: from MR1P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:55::19)
 by GVXPR10MB9164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:37:43 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:501:55:cafe::22) by MR1P264CA0173.outlook.office365.com
 (2603:10a6:501:55::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:42 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:21 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:17 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:41 +0800
Subject: [PATCH 01/10] dt-bindings: arm: fsl: Add BSH SMM-M2B board
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
Message-ID: <20261104-add-bsh-smm-m2-v1-1-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=2VBI52WSa0j57vCZIO+pXkJJoxv8Lw3OMFYgT/cSDCo=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVj+96Hs5ceJW28eTDh32PpRQLzavOSAr5+apx41K
 uGoWneir6OUhUGMi0FWTJFFNcH7rOTVANNpM6vh5rAygQxh4OIUgIn8/8HIsHjV6tv71Y2ZvP9+
 rtJyOSVUsOKkWJ2gjUbh1bAVpkU7ZzAy7FxVxTFd5ft5m9f5l5OEf+yf2HDp0YbCtbXdYp5Moff
 TmAA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|GVXPR10MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2721e6-f273-435f-799a-08df3a4682e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|5023799004|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	z9QYjvLfTbVBMwTExKbvjryAfDu+s8bEOIYDFEeshtjxALTFetNaff6hH142YLIqVLF/gvPltB3VKwfOD/m0esyC35uyS7zPttLP4eJNWXQ4w/itsIRdTLzYtLi13YiUL/sfihAGOAoG9Psvz4//SpeI2AlGc7EBc1kdWhEytycZk2T++Gv6EHzAcPxlq1AeeqBdS0tWAU3uQDX61JD6zBl7NLLozzp+7aXbyv8mrLiDze+bzhSKgylRmFOyMg55SOy/Pvs6ZgIs8chTbZc6dKfpZ5gINH3Qz4CdDnpH1GJMsESKeDKTe/35l+MJb2EzMGR1Yd9a07haYAVJViLdJJuCyBrrZE+UIdo9D5JuE6pFID23wtqpvhwmJHhb+kgAiLWSO+Ml9gC1pQ4P16XOnAmK6spKsOuU881CnTT3OQQvEKJb10jzztLLTGZzTfZ8UYqWE+5IfVIYLaqiu841Hu9BXgSt2M+v5vmaa7M9xV7Xe+K5R5j6OdhKDi59erxO914tEEqs/A5eBy7Yn9u46qOKqAohGnW0GY5o0NH2vM0VhQ+DLYEVKde105Uj5TUhs/HUemMZC3q6iQpAakCU0snCfr3M70Tkukisp2UIqzfGeEYTHi7sCKfsGVfJSkO/fKkWOU3m2jH/PQkFgoeZovj7JIrnacNjfLPRHIqLMAr0Hq1V6jZPuD6fK/kftKLjNmQfmONqxaVAYEfDpWNClg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	64KKMKDBbFGo+16RpFd7ZJhir0Xh/9X5AO5yz5ybPJ37Y6kqZ1EPHrbCI5S4JFRpoguksc4n3GUf4UoTuXa3uFXdS4GEL6DdOxwk/GHDAJBmqdhTLqzq9aECrymwmpD8Az+2USLdObsG55BtJyliXpC0jqxnk48cK+ja5mPgewxm69OrVXkPSWqNb2P7WoTNCBvOtLtwJJkt+FCJA5NxYSyDehHhUvCvsKkTqNEmHlDyv4Qwlj5kM1iN6wKZL21kbuamgYvykYRY/bzw8LJWgl3QZeoJiLaWQlScaYU+2N6xQWCjcWNnf+oFO7gi41qpW62/Kn52ZYKxnXRU0SP5lPpOCn2Wj0+1DY3mXUhL6ICI6qlEIOrY95sxSx3he6bxalv2mJXl+NpW44doj4tFxKkei1kWGiFz+IMHBRMBoe1uGBZMfHNBGEpg0miIEfU6
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:42.6913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2721e6-f273-435f-799a-08df3a4682e3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9164

Add the BSH SMM-M2B SystemMaster to the list of supported
i.MX6ULZ-based boards.

The SMM-M2B is a variant of the BSH SMM-M2 SystemMaster
equipped with an AIC Wi-Fi and Bluetooth chip.

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

