Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585624;
	b=Ar4SnglAeIkXUTTOL4A1q7BtjjuxCffpxrhDfIK/g5WWG8/T6ZS9EH/q3lyGINnquqru
	 DggpS6/LcEpvKCSpFjuWVf38HfKGJzqqe0HFGqw2Un1gaiELipFV0E6XEsUl+nrsXcmDE
	 4Ey5mxzf1DKhSIL5GSg1zm5NFJLWJ7IqeGeGTu8sxdROKJ+LoxV2VFFZxd6VWnxAu/88O
	 MZ7HQJgVIj3eDLQqu8wPo+fc0qtfFb7EAVMtoLDCmwQQuXlbMqykRBsidwi6NFcgZdJkJ
	 m2lId7HqxBzvJbnHCIyHkVzoSCIF0yqHpRTO//6z+72D1XZ1XzixSeksA9SrdioweXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585624;
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
	bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=;
	b=WzeWBGKd0YyGRrlaA8kH/hgYP+coio2CM0A0tBLwYTU9JzUfsXVJlasHPt9Gcb6fBNTX
	 jwFsCUWAAz9fiMDQSKiyXHIsZteAFNGRTEUxeWgk/DYt2kupS7Xq4FqqCXFBTM0FAhivg
	 Rjl5bDssavKy0R4Aque8gMnBPcrhI54J84TYonAicR2s1TzTbFcIevzhGWvox2LgL0pLU
	 H193T2jl/TSZf5bEgYHtsa/7tj340ZcrHWvVIxgd2VoXnrGxsE+/aTZNtjNEnzYhHPelu
	 XqI+vfZQkhZyc+f5auQ8+6Uu1XjshJ5P5RHMWTNzAIvcFM94uKnuoT34m6weHgaSxiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=aZ1NvBG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.128
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021128.outbound.protection.outlook.com [52.101.70.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AA606A894;
	Fri, 13 Nov 2026 16:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15AA606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=aZ1NvBG4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsDyoeteuzNW7s6pmGbjJTXaFwueQy9UhkwG9QtewE/X0uDWGWNyimJan1it6Hqq+GHiPSUqaGuWE6skY16GEsGIjcXFFzxhLoBkmNiHONVys7vzvK7ruZlN2C4w4dK0ubm8//67w48T+dql+kOlkFd7P3IS0kvvoflTLAkT50OExQa/nxUtHHz9YRjtaeYvBe0rZMAt8fvVitJ2kFokUrn3LUTQ24z9mV+LGyqVzpTqqMfO+2q1VPIQ41kdRQS1uo8XHhKImtqij7crNXiYy/Ns/0q1fjBoLOjspF7tYjrI98njMjXv+6ImTlAsRVjkbA/slEPJkNoFjE4JISRsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=;
 b=bWxJ549A5zEReEhJyVlg8vjZ7/ZZ6nWaU80VybB94Mb6TnXLJ4SD/Fl55RI1vCB5PZ9CkDDlSAUSSp3xlsqm4v5d19rcNBGmxf+6APhLEHNN+ggB9MeF43wMfjEq1bmzI7I6x+w3oMXFWLbyX+XddX/syfWPqRZY+ylUn97QBq8BwGWgI+NCKsmlPe2W8/8lfFN5gnPPKDoFEPf3gKX6vE3YoYWFa8kvbqWEcB3NkT37XiPSSim4c2hTUKKkQjaYbM5Fims4uo/xkt/P/H8KcGozuBV48kmhiFnq2PQBmqC7kHdaVBYDsessLqV4UWQAebE9mZEbqEoKie6accnZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=;
 b=aZ1NvBG4qR9aXgb/M9jZlIZZ8U2pkyxaxifTgfzaKbrrJFUD9wqiomoJ3GN1pZmKu3yzDnV/hPuJlZh9NTf5xtZ9u+dVmjBjfhMT0cJi/TK2ySPu67XY9tWTjtWSMkFm9OCADsACpbZBK2sbDxc/OssJfC20sz5NI3WmSqDW+7A2Kn9tiuY+JINNWU9yz2aLEtes9KnZJtixSodHj/dr4x9NDXpM2xg8l7offBrP94es24zA4akMkbJe7T4s+uYn3AQ5HKpSBtrM58eP4tb1IC4Uh6Txt8k+HGfkJTXPz6t1QPcOH+DY+Z3+oXIjHrq0tFEYvosSe8Gmr6y22pTeWQ==
Received: from ZR1PEPF000077E8.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::459)
 by PA1PPFF46D9DF1B.EURP195.PROD.OUTLOOK.COM (2603:10a6:108:1::1e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 16:00:19 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077E8.outlook.office365.com (2603:10a6:918::459) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:17 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:11 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 13 Nov 2026 17:00:03 +0100
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
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
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=1068;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=6/g+v1v7p00UnXyApsJiJOo3nALZipWK8vQuzknn9sI=;
 b=9eX7S3SJKRjCrVGObyZTGoN6ScHSG4OpcUlBpPUwwfquoWfVZQkZZSf9yCGkH7wo3Vuqpcr3i
 /pZERKbKQt0ATzGmhoxCD72hkJENMxOV67eEG0vq2Sm1Ik2iO412NtZ
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|PA1PPFF46D9DF1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6f6bda-2543-4e6a-a6da-08df419f35f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261022075727099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/Law4B5sXE5gvfbpJ71wFYsOcKVONfLuYtEiFbEKhImtwA2y5mpFCy+/ZY484WkWCgDRAt+x58KvEj1elFH/cini6/0ez4sCSEFhuQuyqY+Ew5CpyddJNICxpcg5nmQZkWyFLfl1yMMKqjVQZPCo+YHyjehS6U2dEbYkjXwn69r4FpozYT2PRZ8OuutmnfFGLyji2e756L5U1qmjRJuEFH+ec8r6WH40HHm04epYdd/KdhOpACEu8w4Ltfec1hs3CeX6aZNLv++DxuibLIZATDX7mQqrWAgVLm0nhrOUGxUhLb79sCBl38IMV9vf0MwVT27YtMaEwlKYUWW/YAP7mr/kxrcUy4L5h6Ewuu3kuJ131lWtTxDjzaUn/D13R9M/sXD3t0c+AJtf2j/frpzyP0TK+ATQawy3fY4udieNiKk4oSD8FMvSNh4rJK6454bkuRFj1tDfpyQeIg5bFRMB8215MINAAVaYXjUGgy7eXzFuz4LNHPuHky0oWooDGAXi1sOAmrrnSOj/8wROl68G1CT2u76Imj5oH3jJBJg9MQazl44ocX4poVILpm0CRSfd4HLv4nuCAtP2rqHPDqT4D3v3FmSpfvufzuI2FQMbn5B1nTdIhkIUc5aCp2g8ZPjDtpgzRgaiVvIn47zTbZePsN0ERtxhNcH1jMVeV7+MsZXhEcKrjGfl0W0WSI9rHdTs6B+G4/inDs6H62BBt0h6Fg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t61WsNTplVD9agMS98nLYSZ0agBTJARgIbGaaqMxiIPHRve21AWwrxFfcjGKATn8Hbymp0wMiNQnPA2siNi0SCt04Cey0CW83DZavFV2Yi8jPJR2btNJIXiSiaUaCcPyXUlxloXYVLOkgfPxAavTtOceb57FFRF4I9zucjPyjCaIz2/wsSoS3YFqcIneYgIkpQhOiyXll9ScDWkL+D4l7immWuQ1tgD6HdCM7uJCoxxP2BdCA1igwjuXLiH2PNzFnDA/xFBYeeJFYdyxJspSUPMYLBL+Nl6zlh1bYb/MDT0Se0tEfsgcsQ43ivKKDWmFs3QcWq3o/ML35D7ZBvm5vr8JOiP7aTgFkmRgLhQRKEJlgY9gdGc8GdWIuWCr9tFjZkq8/AivrvIJn6vQO3EFRp9hxwT/7sLEsGUci+nEf+W0Q185YpCHqvMPuJYvF1gy
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:17.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6f6bda-2543-4e6a-a6da-08df419f35f5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPFF46D9DF1B

Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK and
phyFLEX-i.MX 95 FPSC Gamma SoM.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..43b1ff8d25cb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1551,6 +1551,13 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
+        items:
+          - enum:
+              - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
+          - const: phytec,imx95-phyflex-fpsc-g  # phyFLEX-i.MX 95 FPSC-Gamma
+          - const: fsl,imx95
+
       - description: Toradex Boards with Aquila iMX95 Modules
         items:
           - enum:

-- 
2.53.0

