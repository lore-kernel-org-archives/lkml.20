Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585633;
	b=MJyZCWrl3YNfvaNTcewXAoJ1yKozApptzCiNQf6CaH+vnS9fg934IWQf9f3U+xK3rJDK
	 YsNaylAT8sZQ/6NDrE7LI5GvFsRaE8fJajKOSF4eJMWndXH1FOhobVkukYdQQIWi54U+h
	 gVBxUDsPQyA4CiqZ4fDWFdezwaNqrDR7qqdvbXHKZcmSRFzWH6bcx0b2+21E38+fWh2H5
	 Rc3tKmImHARLHg2hCk5Ikh26ne89uGbzEv9tGqZNNigyi45RX4TwyQNCRqPixyrluijwn
	 SK1+zjVIRwh0Y1syhyzHdUBgcyQ/jDDuVMsLnulZyxv5I3hg9gs5oIOsO0bd+nWXzDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585633;
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
	bh=s3o3/o5IvSKkxvKHV8kBa/AdvbX0KhF1f54qGrkbMD0=;
	b=xjgDhFTFBpxVxD/Mwd0DJyNYNZYAye3nMFBQgi92uIRNfc3iFVXPmp7Dd0f8rd69Tucs
	 UEzoP/lnWZgFAtHRPwn5l9XmjNqOkESGTXn8ZUshmoIOGTy5Fhsenvao3HPj5MfkVAdaD
	 61C5QlNTUzBsBvKp7sEnhgLhSEHJMBjL/Xm6YP5rToNYsHSpZnFMyDUIAnd3yEz9w3ohQ
	 7guW0qHcjULWB0WDY+TTov/JJJrDpSHSWto+IB7hcDZtzYr/TqePsxBM+E5tDHaP1KLJr
	 gvUVlwqI6fGVCStpsUT4QJFtlAV2dmEH9c+jn4AE+tNlBZJvca9nCXtH0ZgSniuFY+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=sW6Erno8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.121
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8860A2631;
	Fri, 13 Nov 2026 16:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E8860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=sW6Erno8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFmFNWHXTENhUZGhbLqWPpwp4pUgDjPs82LRRsZqcjdsMOp6mmJoltl7C5+n+/UStyCknVWAV7GwJ/bwHoh+YRyEvshQRnOgca2uhGsnBfMf99eWQEW2V1WNmFW7dlKA161Qaz5JnIFfPEQMhKRns9Zhsgc3Lk9MkdxpDyx47vRmFawqVBYVVHrRk2QCqkY/CnMbH7FYWtcr1+LE+9u1KCZy77qqC3ghSYKBJecHLQR+CHM2QTlbZwppCNibLLWyJfNbsCeF+sd8G8t0QZAoaakWFEVnih0daOfAM7DQpd9se6lvHTMlweIxOM1/M48PH1+Kt2WCakLNrxWUKXp2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3o3/o5IvSKkxvKHV8kBa/AdvbX0KhF1f54qGrkbMD0=;
 b=J3ZaSHogGEyT8urHQNXTOzBO1uiuzcl8oGrZihd1iaQiwoYJ1X06TQ1Z75pdyaYcC7qJTfbwGmRYmdunW4jW78t8Tcs5knII6y7oqCiKVw7OqabpV5ZOFwjWoumuKvxY/ENgLshwfz6uDaSOJeIOw31MhgBOXot4urhbsufKW24Q6k9AG37/lHOHdvCPt7hLUcKE6LiIS8+HsHkqPeZ0T0LYaOo9CHwCHRIS6LaDgBHcBwI1VfMcVcC/jEg+epISRjBH7of1yz5Gi5wlcXxa+YwjEBfrJPlhPvEa93m2HM5Hy/XDXNZ8fgrKWmGkbOa79tISdqIlDOwFLrP351tSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3o3/o5IvSKkxvKHV8kBa/AdvbX0KhF1f54qGrkbMD0=;
 b=sW6Erno8MwyQ08EYflRz00zjIiIKc2pEb/E5GIX9dJq3tufu7rV5k7HG+Qv74eWe3vJcMSkQpSlIC6J7HDl9curhR4PvKLN3RLqgCrn/gkv5I0a/45P1AVaitK0kYKuaB/Iq75RvExLOrGGO4f2PVuSvGeqZvcXsDJ3zNJgLwQDOewAdNnTkQ1d8UWdZ/zfgfaDO2/ovM0diIB7ZlL+85Z1vYPjNGeC3MDO6T3Y+rHAtyF7/ORkwmqeoWnJ2vXSoht04aviZqttaU3f54RO154TYm1XXlLmNC4XirrbQnwZiD4NMbY2Vwu/4BN+KSSVdn/9y2MtNCUpxuq/l4uFJbg==
Received: from ZR1PEPF000077F7.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::444)
 by AS2P195MB2082.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:552::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:00:28 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077F7.outlook.office365.com (2603:10a6:918::444) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:26 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:12 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 13 Nov 2026 17:00:07 +0100
Subject: [PATCH v2 5/5] dt-bindings: arm: fsl: remove outdated PHYTEC
 i.MX95 FPSC
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
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-5-3ef58af5e689@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=1574;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=HmyndjApayRV0xHhzYgbrI/cc8A+xIZjEnhdHBkl0qc=;
 b=kgJvxeWHDUocbh30e3JoAvixryf/qRUtAvBOF2Zk8vtiUR60/iPGrmFs74LQ1Lws3S0wn6D19
 00cQV8s+l/dCwSWSccmXpZmsshvnoLDbXAghSbScAt/XlmdldNkNG1h
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|AS2P195MB2082:EE_
X-MS-Office365-Filtering-Correlation-Id: a7807205-49de-4541-c1a4-08df419f3bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|261009223027099003|10067099003|11063799006|261021121427099003|56012099006|261021123027099003|261102123227099003|261026121527099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oPrdHDE62wZYSUAFCuKkX1xJwQHY0fyCG0zgrtApVW+0ZtPnVSpf9381zVGwLdzDmHeo+E4D3m+UZjqoKj3W+vJXexCZqGVQVddngE4gBsPNB6o9W/6KRxlH1H3XneNhBUtfhrs34I8B7ER//l6d2k2kNAXbG6E8bIKBnh2iByFuTjlx0uW+qscv2UWs0UAUIskJ1rWnFzlizg/G40+hJHyxOnCbSQdZSLWqHk0RBgt3vx65swuy7msNbCfrXanKCIICg5UJQpEi9qJ9Cdte5RDv71j4x5BxMzsqXUPkaadaUVZVbrXexA5NqAknYzuxbj6QkOb4l93QAIXshWp7ESPuXHksdmRyoh0w3GKqDVjZOu1mThZB+OuH4AQv0QvsxZ3RTzNG9Ff1MUuwI+A+cK7yalfuILgYcRBf95d6EMo9ei3BD9TBZsesF5N5Kv5vwtJNJd4Ojo2nu6Pfv7+vmh9iNXpEiYBvdiHML1IhVqVJX99qwfHJ3/ZaTFU3BY8U0qwKFxDOzFH9WIvHCuq6kBA2PFFugaqEU8n5yQZzN1LiioaaYuqlDXuYUls5qpgimOS0hND1tNeKpdjKMV6VgOEJfL/4B+LShDTtVhTmFBiFdltCxtIvqxLDVIxZHm3qpx+dbanzuVPYg6DsqHUoHQYgD957rYpF4ZMqw86MZZpM9kbz7Mzkk9fImA7Ece4B67243nUSaCzXwdKPCXsNCg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261009223027099003)(10067099003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TfYLjFvttsvq7s3vxT3ZPuPuFawGA2EQ+sNUoTBFPwWM44fJeu8FKboQ9X9SlFe0Ozc7e06SumLzKAnvjfGW1Bm9ObBaHm45yB+PKBd0bQinrh2r17UB7qSEjs7abUp/JgJUqHnKBMa0tdWEgNNqc4Xgix+cwhvd5eql7G3pJ5QcZ5ZQ8eYVfnMTB8AKHFh9gY1/P6cA9wI7+13FfEbja9UrWLzTEQ45utYjaIjK3aEFjGEPDciS7cZMs3GSSZA7lU56fdUfr0mL44Px2Hk97a5MGyiibtRcKz4w0ZThVHmIiMkeMvNKfB5bGsbUsCR0Hy9kMJstOr2fCZwerkQ0GJz9/hQBx9TxNORqEIMXcQ3bzXPwFKroNhuMxm/3yTn9UgxRT/NhDyjHLF9GJ8wdZ2E7LOPHoX9ZmKsqJtjXdLd4qEdtg1UeMQb/ChxqoSNE
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:26.8319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7807205-49de-4541-c1a4-08df419f3bcc
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2082

Remove the "phytec,imx95-libra-rdk-fpsc" and "phytec,imx95-phycore-fpsc"
compatibles from the fsl.yaml schema. They were used only by the Alpha
hardware version of the Libra RDK (1618.0) and phyCORE-i.MX 95 FPSC SoM
(1620.1) built on i.MX95 silicon revision A1. That hardware is EOL and
it is superseded by the phyFLEX-i.MX 95 Libra RDK (1618.2) and the
phyFLEX-i.MX 95 FPSC-Gamma SoM (1620.3), which use the
"phytec,imx95-phyflex-libra-rdk" and "phytec,imx95-phyflex-fpsc-g"
compatibles.

The corresponding devicetree sources are removed in the preceding
"dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra" commit.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 43b1ff8d25cb..f387cf42b906 100644
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

