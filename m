Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367198;
	b=FlfZ9BxaS5mEBcnxPrMu638U9fKcK0t/RAVXki43d7rRcxCp0izXQlw81sBBOympy7pm
	 4Cg2Q5UUyT1l+q6z6xlKsNhmNw6d2dv1jel+15Y3PhaqRm0EiagfnmhMjxd1yjGaHjjzJ
	 N/I6f2E+uD27LR6vx70vWTVFU1jpNJwX6aNwnvE/Eko5qJ+lqpwCxTjuOFFWhN70vGm/t
	 4uM/lRRcsiCr0dgEWWOXyPmjSN1m4a1M2eEa+dnojqJbWUMv8uH9S3aKM1wgc2MJvvgM+
	 ePjWawkpdSQJ66rmPU88DaiKxYlliIBmDjb2lRFu/bHvz/2ZaX9ymlK5xvipFhhmp6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367198;
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
	bh=M6M8K3scr7RWTjjAzToMsF8Y5tRlMLfwtFek2ydLJgs=;
	b=Vw2KyvapI0ES2gWX+Cl2pMtEplr8mgurktoDPCYIvd6bohB32B13G4AUkemDUYnt+Aau
	 Y+qvnTZTQ0h47ArfUpykiq5M0Eu82B0LJBoRUlvR+LBZZQbYCJig+NNbYxf+SWL0sENDj
	 fkeRJIbF8v3RQCVFoizWN8H+xszNaW4OsLpgRvoQx4b4whJwEPDbnFZMm5AydKiFSGoo2
	 ZlqeTup9SFSOy198jI2cmjDzrlfwajYkrNN7yITgCwh3TfZ7GBGPDbh1KtOodNdzpJtzc
	 Kwe4Y4XK54v/jGhIhX5lHtIBW5NU0tZAWCmdyucg1/ZrfCIyNQFjeeai+Va4ymm24WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IzvkHXI0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.119
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021119.outbound.protection.outlook.com [52.101.70.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF5606A32C;
	Fri, 30 Oct 2026 13:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37EF5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IzvkHXI0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3v5ZVz5GbY0uRpTTdvDpzJutGUYzTc/YKdy3d441EzTEW0e/KRfxgFfFc8Q1Koi7ZBk6QUU8NUB87JvY8n2McWvPB7f+uPHAcicIUI0rNeSyjCqVviim93sDTyXZu4GI5EKP5Feb/GpVwrOHrJmcqKjXe7cU96F1/lRXjmFBPzRpM6btBa9s+eT7bsCOpEbcqFn9uEYFhBxETjR2LqiR7oq+5lDjIYGGB/LeUTb77LwWczZYKmiNr4w6sPWpXYB7QtA6lrmDhF/yb0Hq8bYiClQDY2eQvI/EMz4ESWuxqfVqOBuX2S+YRf01So+NTqhtdNwKltm+5m2PWrVNkn5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6M8K3scr7RWTjjAzToMsF8Y5tRlMLfwtFek2ydLJgs=;
 b=nhJxVvlJNxMBSAE9Nk4rVZBTsFcxLIw3gguHNtkaAwy7D0Shp+oZBohs4iWPDR4ohQI/A0zCFYO2h2ZXzbSyEPTIJx+jBJgKVccq+Db/wpI4jUfZzm32sBA9zHeOE68fU9CQRzpmymEuSUdbokcPoIVeOTCyUwIwOTETRFMOAZCqY/sDLLCsYI2oTWbldqU6ulA2C7CnYKMOW5q+9HM752lKiCV0YYetfgkW61n+uPLf0EeSMMlaVJr+j5U3ufDrkiszApXg+tcBBj60C2WvomFwg05TZn9+80UJIvjIt6ZgFTT9PqmjnKc34/PANJk5q0nbOhOdyQTEvfqiGWIbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6M8K3scr7RWTjjAzToMsF8Y5tRlMLfwtFek2ydLJgs=;
 b=IzvkHXI00ySImKvagwCgT8gQn8wXwM8r7PZEezIy4r2X/PZt78DkVpKJDRtwj+/S7oBR9j87hBwp5LLROapRiq+bE+4uuEuNJa/+kj40IiMNjavZ5fS2uwlYyyECLVpCSRnLTJMLanBO6fTTbd6jL2Jy3vPqWEXzjq9DPG7Lx/mXcjBYBktFvcmXUTmN07OTPegHRWUf/iUNq31hY38Zy1ZWsNcrNTVq+VGIbcgHXEbokJRRHQ/J7pV96ZOo7pysPA80Pu+0PiHZjljGrTWMGEeKc67cTXWudNAEulXtWE5NAuqxWCAEE7CoPofhpGAzjTVN1xsEEknObwpaQjOTig==
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by AS1P195MB1421.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4ad::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 13:33:11 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::98) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 13:33:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:10 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:07 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 30 Oct 2026 14:32:47 +0100
Subject: [PATCH 5/5] bindings: remove unused binding from old Libra version
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
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-5-1c1cebb5be99@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=1002;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=MiuFlqnlHmTZ9g51TNoaTAJTty9eaJej3Jyt/Fo8NiU=;
 b=NYp1fRizSgW1aw5KjvRcJp78/e9R2xsJglrRV0pf+NxhkyhFABhBT2B0p1CzVrs5pbelVTLBz
 8/39+ZEXbpvB2bJGkfCZhOJC0TB+6tVdrBHLQIAkP1QGay+A0Hb6iOK
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|AS1P195MB1421:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e0a12e-ce2e-4721-398f-08df368a575c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|261026121527099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	vwlCuIloi0V5+qjQtlXTMjVyVndEL9IDRhyu05pg5FHtOGWdVXexHytjcw1YxHzbi0TQ78LuX+M6N1B2S1cf0VW9qbNTELoDqz2gIu4pboBgNekStR0p0rknzb69JsAC4ndVdRN9tH2ptbBRTUBrI56CWOhVzB4vstJwQvO1lPNHacXUJCa4Pu7Jmffqk8/uAVuqWxkyWK1HehmFNVuQJTTSVdHuSXEZqL0WqLCbkGb5ByTNVO+LKFv00Z6P3SpqCMR8LLA8PXQ+31LLHyLjs78T2tBTcoICVbaZx9eG8shOi4l1h8/Jg22t8s0EKRNx3Dm+QfZNMl+eQqcQ5z6NcwcRKbhAcpqVmHM9+4nNwbu1onVZ5+76WD4x+OFseK+FUcc3WoIJvUgqZNkdY4y/7rnda1jniu9ktA1nqpRVUE6V/FUPggp3MaixjpbM080y+cK7UVsRtsSwWUkZyVpF3XxsM8NgcUmRQqAjKm6On2gdRCLgefFuxIrIOhjIaZfpiZF6kA9rRQAC/WYkcscgpCf7+3bBAAVbR+w3rwgkN33J/zkjxXKcWmjXmbZhlpyP9ZpqStFw1SFaW4Vr1QNZZ07Ptgj5D8LYvsts+ILQ8w0wnKZLUOj9Co5U5N715trRLiAOqg3LWacE33q6a/QLrFQZqPve4THMjbKKVAQ+ag6Hv+HIKwf3p4gS5wld98WqWians25r1fNviVciSeHOCQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(261026121527099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2xzdI91ucY9OQzMGOnBYpvLP2HkO9rEoRApYNKclarLcIb+oMWxjFJ9wg/BeBeJIkBih0Yn6N5Qnx6Do+VLbsKRyv8OjPYjC2UMEm1x+9vuQzHtNlm2FrzarqeOZ01G7webFe6ZVjxN9HqgZ0cN0yvfKKYL2W/LK7PIkmHmf5sDYIOrru54MvGIE0Vgqn/qcd0G3lXvB7GSy6pIwNjpo2aE2bXeG3HDl5I1nU6YfkYDKh1UrP2vcxY6HTn7RCUDW72ATu1WPz0VeV76Op+qaKfIKl5zZRLBD49R3V3q1o2MR+tTpmbPyDEDTYCpv27dU0q2NgTSDSRbIsBtPYEWJl/rtmQGmm/6gjJad1Iu4/MeCsAvpUWkODrzgGq+dFWjsrQwApzlE7vL0qRS+lgcDbM7REiFd7Zuu9QQLCIz48YC+xSbPXrdxBzpi3ax+okcp
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:10.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e0a12e-ce2e-4721-398f-08df368a575c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P195MB1421

Remove unused devicetree binding from old Libra board version.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f917ae7202e9..dec6e22719b5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1544,13 +1544,6 @@ properties:
               - fsl,imx952-evk            # i.MX952 EVK Board
           - const: fsl,imx952
 
-      - description: PHYTEC i.MX 95 FPSC based Boards
-        items:
-          - enum:
-              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
-          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
-          - const: fsl,imx95
-
       - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
         items:
           - enum:

-- 
2.53.0

