Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974099;
	b=WkOPswp0T7p7Ua6Td4+5HWnsJ0sW+KFJNMVPI/3nOx47ffF3IR5mSGsHxKmvJRSYKvVl
	 YiBAt2Q7fp7Zje8QATGmChp2SZJol5Wmbfg/GYwCr+ttKrSAAQzD6JoEO2v2+Snj0cI56
	 vPruJgpfpfGO4KC1DiGo3SgdnMuisSvTREFrZ3ubWsK3YS/iLQyeZF+LBPfpw0Hhv3kZB
	 P2S6tMFC5wfzHMJ8CYR9NrTzJcpjqfytRl6lm2lVhg0ZDVQDUTpeHM9oTaHwY8E/yHR87
	 txgPIukSkP+53aWDAFtEIPCVui3cgyjHW1rB2ZugJNTq4wU8ZoQMOhE8aTWxHujKtAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974099;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
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
	bh=IDchoAoRvRXhcPmKR8My8QNpg3TK3MVbMZeEe9JE+V4=;
	b=im8KR/XzeD6m8KiXZ18x4Yo7Q5fpwak2T1VfOobW8trCGIwI8xoJQ9q2OxOpRd31r9zx
	 tZwXeIhro8naGVgJjqPmN5aY9DXsSpIZCQgL9IlH5aZlLL+XpqlrDu2sPcX1q2glvlXRR
	 7aZBJCpUqfxPQFCQPrkQ8/RymnM1uytNTZFxoSwPBqP22EofwEN7/Wz5V2YNGzrPNEK8O
	 xy4HlbvqYuXEXV41TxOKvTvALfud8lNoNEyPAKCnslAKPHZwY/p9nfv1SBaYGOwXzjKGD
	 ASGJ5eWuhfPPHdTKZtjFThNa9pvdmTa4hAuxUZyH1sDQkuEIHKxTzRMCOm85F72g+6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Dz6shIWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.121
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023121.outbound.protection.outlook.com [40.107.159.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CD606D815;
	Fri,  6 Nov 2026 14:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2CD606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Dz6shIWJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgRik4FMsY6wmSxgD/Thi9HGQ7QEf7jhoGFiXlHudzJ1MIkh3XtLyHyINS0lOpkDw7Q2kgbX2Mmm/840XSl66AJ/CfUqVJ+iaHtExOr62bF+jo3FtQQkM/IxWsBiridr7gyOaH90t85qONUu29hKhwKChUnXeYROF+9MOLYy5kNCPWocsLdDBy8pIl8dFSQ8mCS1lBJov+KKZrn7sXpEATnN31KBY4/HqDY5tTXZL5ZlVPD1N2Ip9qz9fYVtWlN6k8Khvt+yp6fJB5sI1uxi0ibj9REBnjhzykdPlWdRdRJcxn5UL0/+gPhjr3IxkqPG9j9zrHDqDnDX0DY5VSg9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDchoAoRvRXhcPmKR8My8QNpg3TK3MVbMZeEe9JE+V4=;
 b=kex33pXJinxaSa7vf4KaIITJWhkQ7iXSpJeRh82I89soDYCPRPteAvOiwCM9BM9PfoGsNAIPLZoNqS1Bwddg/Xyer8hQZ+PiBXY2lXJ0zPeBNtlb/dwKGT3sZ0AkH+qbnQ0w+iBcRc51MFxFFJi3h0a5CjqB/z5dxZ9ot0FI8rfJsMK91S/7ZHfdGv2gzO2Vanc9HMj5sTsuK05yFwNeI5cs2TtMm0YZOpU8Lzq4ADKel8Rt0OAUtl2xT3eXUfdBALrYpM33WRnvOgFnJDmP69llCRjQD3qdPS9+D3JyAjpc3L1Qn66Hhs92qosE+XGrKXo42fdtmkpXPh2ceRg9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDchoAoRvRXhcPmKR8My8QNpg3TK3MVbMZeEe9JE+V4=;
 b=Dz6shIWJwAnzGEb5u0UEt2eHEXFIFusJGOEATlxUpJOBF/r52vqfFdlMof8+6DvxpMQ9yuAxXbQ29dLqSpUbDMftShGDdCKVMXWVbu10V2L2tDGRgpZs/zaDuHSSieVAW4m76GOhbJCVvDHtBphznH4mKYoBVGauEXuq0vk15iijhlp/L/5aEkI3tZdjool1Ov4SwJKwrWrhxCnNJhs81r6rILV2WOP2O7nyNAb9BapKhPL6wNqLF7fM0+9M4TyNAw9WDgq9nwUd2+C3B4GtQ5bcg1+283I6lcCeat+TmF7FDtBjZGEEE17LltLcbIY9661Y7CD4NKo+zysdio1k9g==
Received: from GVZP280CA0023.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:276::15)
 by AM8P195MB0898.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 14:08:12 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:150:276:cafe::22) by GVZP280CA0023.outlook.office365.com
 (2603:10a6:150:276::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 14:08:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 14:08:11 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 6 Nov
 2026 15:08:10 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 6 Nov 2026 15:08:04 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mp-phyboard-pollux: update
 gpio-line-names
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
Message-ID: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-2-aea3a86f3f57@phytec.de>
References: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
In-Reply-To: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jan
 Remmet" <j.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|AM8P195MB0898:EE_
X-MS-Office365-Filtering-Correlation-Id: e59a9af1-0103-4ed9-4cfd-08df3c0f648c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aXQC4DWHPgIHRaRMuA5xmCWMZvLFb6JQMidP8x+pSPpdjDMINkZAaHigwmckxNyyIETPDCaLSrpj4u9ifo2Pfn5z+i2yAH0m/Ni7VQgmB39oqqYOHQEy7Qfb8o6O7qh60E1QjR2ySLlKNl1fo/4JmLy59UAvE2fkB9oHTKQEqeEAeqdeUSsGkt5q2afi8x2PyWc5IuCiR6CeNE1vDuj7fH0JFU/pb3gWZKe69RiIj5uW/NShoHGblzyDn8EZ2Js7ne++DoJ3bhWjiDJha1eCxCHdiWf1HorOv9LX/fwGkkD4JixgSb0BNbhIWdnJtSucVElFYzfBiLwjm4U1vvYZ2Sp/0j+S9KmuGFit2XabTwkWXwnYtxPg1gWKioxgcsWNe04YfKxFwtsGYZ8dT8qG+F7hQKRGMfIzbkP3GINpgs11BpvB/aYcqgFbG0SB1oDpyNLbIF5yhR9hx7Xb04M0EHYCb5dLsWp/kzzqmXxH2Lowhti1O2i0Qz5FxOsf0/tH7LJTeBfIi/ig/NVzhEmA4vqDi9jmkeSDwzPmcACF+EjjQoV7JBLtW2SlKmz1S1ROCJLelAaCHokf6k606JvBQ5XPSK8d+ByhvHsPuJxXuDrxyVY/Piw2+7+pt7CcotxL1vuLYw1Mg8Vms8JQSCscId/IpUdxEadC+N9fb6R5D/+3DU8gPztbqC6qabQlQ/RBjyp07LJe2ICBS16aoUiugA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e47bAX4T/UkATNNLZfdGgaHNPow9yMydVb41I+UXJ13fUuJNzX/GlZG60Pyr9zjM2MPBRMfs3NK5Dxf4erAHiWyxHE8Yvlr8SXnNuf96UTgBw6sDU33krBnNQSMEyrsEElfy+oogEup06P/tQ5Ygn9Ya8cboYHiiS06Qili8kufWg7p+33xX7fDKhLda3rBK+HIGyA68V5LafJACR4zA2Q6rfwjZaczm60J61+70o9pWRagwOi7nQk8NBG3qkmRQEBFKBlbNrp3xSkd00YgNcK0L1pAM5UGs/LC2Zcf6BFbd8eWdqOUQe5p0veSJMkAPfRtCPsEMH2pnW7EnQlEMaGuSkxUbvhzE3m66zJLeEb+lpR2xUuV4TdSzT+grRGfARo8KpiQv3PSV4B0rjN87Xu65jISBpr5m+5Ga0eKVa/SzBoPwd2za3NVYdxXhvINm
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:08:11.8419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59a9af1-0103-4ed9-4cfd-08df3c0f648c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0898

From: Benjamin Hahn <B.Hahn@phytec.de>

Update gpio-line-names. Add missing and remove unused. Also add GPIOs
used by peb-av-10 and peb-wlbt-05 overlays.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 8bb2a8976df8..15968db62326 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -411,7 +411,7 @@ &gpio1 {
 
 &gpio2 {
 	gpio-line-names = "", "", "", "",
-		"", "", "", "", "", "",
+		"", "", "X_SD1_DATA4", "X_SD1_DATA5", "", "X_SD1_DATA7",
 		"", "", "X_SD2_CD_B", "", "", "",
 		"", "", "", "SD2_RESET_B", "LVDS1_BL_EN";
 };
@@ -427,12 +427,13 @@ &gpio4 {
 	gpio-line-names = "", "", "", "",
 		"", "", "", "", "", "",
 		"", "", "", "", "", "",
-		"", "", "X_PMIC_IRQ_B", "nRTC_INT", "nENET0_INT_PWDN";
+		"", "", "X_PMIC_IRQ_B", "nRTC_INT", "nENET0_INT_PWDN", "",
+		"X_SAI2_RXC", "", "", "", "", "", "X_SAI3_RXFS";
 };
 
 &gpio5 {
-	gpio-line-names = "", "", "", "",
-		"", "", "", "", "", "X_ECSPI1_SSO";
+	gpio-line-names = "", "X_SAI3_TXD", "", "",
+		"", "PWM1_OUT", "", "", "", "X_ECSPI1_SSO";
 };
 
 &iomuxc {

-- 
2.53.0

