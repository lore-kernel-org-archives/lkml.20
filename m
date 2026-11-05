Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793845266;
	b=grud7Y98rWrk4LFYZmYdyJbdXXwGpNYBk6ilpBSTZZ1gKm0+fSjifG6Dp4zDVz7mNDG6
	 VKsZTagYvN7dLU4xfddF5KTmJdlbXjobQj8g31TYFo8abz1W5YppWn2TDUCBeRoTs6rxm
	 MjlWRFiH3eqBx6cN+ym97hy4OY1afX6/z3tEVWsV26UA6jIF8fj7FrEI30Lsvk0+u2FqS
	 OkZ1TRoyWfMHRSRLFP1YBqAJNWWsbo0lDqXj0+Ekuq4GMcYpWjGsT1+uC2ZJ1MZT8sNMo
	 2V5kEwPtPB65rfSbVc367KAWJZDZmGtM199et1Z+GqQmLSZ2y1qFEzx2pmpyd2UxHjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845266;
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
	bh=Pyarh2x13L/F59HpLpE91BDPKbFbVFL1dhvQNhgomvU=;
	b=KY8xrbBzjUjHhWcItGHVRaIcj0jJ8y0Jy2MhWQdIVpS0iKs6SfUMJV0+hczbT9BLdmmD
	 tCkYlqqGdcYPvprt5KNqOYqWlOXEtbmGv9YAsBJS9Enz+mMv7rIqgkoolsrUCqwM3twPn
	 sjJuVEWBc2gPheUIZxhXMEVURDRhGNnxA2UplHDUS7oUja9mY6vaj+n8KZyXx6J6HmpMd
	 3+TKyhH9TK6Wsc9DHcgrfmPKG4fkjB6RkvS/NxyP7nCZvqztV1fAcug7LHWXHUe5bn/q1
	 GlRm3Z+L+FSElCFDvNyYVQEUUM0zTBUPANdPB1uDavcTjmYBAplDTE4NrWe2+bmsNRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=XKmka0Tl;
	arc=fail smtp.remote-ip=40.107.162.42
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21332606A330;
	Thu,  5 Nov 2026 02:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21332606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=XKmka0Tl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihedSbgQuaKp3St8Mwl76mh5h+gYmPL28wH5ugjpHmfpWrBkD3EGtVvsLqjgHRbiYbOm2tGBKn71frmMyQOX8oQzrJDmsemFcTjaRRPWP5l5sxCnQcBjkcrP6yTDY48Ax4MMcJ4PxlWKOWs9BvIz79xTMmDTjplUBYcQ3d+jnHJwLK87N1qDLfPXHu7lp7c9RVe3FOp8Vp77kVlLq+hdvFtjTEiCc/BnUqUR1OyMAvDtMBYYCSTBcs+8+6VLLZaADtLkX2ax2U9oQAEjB36fomuIl/KNXb06WVMLpVTlybzAwEInkW3zKDePPMSc4sNp1AweXGzA/5Uih98BpPpFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pyarh2x13L/F59HpLpE91BDPKbFbVFL1dhvQNhgomvU=;
 b=iGdjSE15LgYYsrcTtJvoMCktT4Jwt0PHfC0tt0Tn6vn7z2hmHodIKZbsu+EO1UEQTZPB8fVHSYVaHLL6lRt+nVfv0eeWK+bWCqCNOEeICK6Hi+i3V2GCJ7iDw0gPmt2lEES/CFL51L4hsGkIsRmFapbWpMCmVLsJyUuIJMAYICXSwKyVY+hq2NKCHywxJF0VniIHvm9XU8wOhr4Cr1cQXO/JtdNKTZzG5Z4fSxtWOsVYJQnmJJin849UHPWpm2BuNn8qe4jdhu5VrYtTuA2uhVwdM96VZy0AnLkfFDFjUsFysjpcQEfcakvTrEQkI0AnJZaJYKiISlR7BXcCBCMHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cn.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=cn.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyarh2x13L/F59HpLpE91BDPKbFbVFL1dhvQNhgomvU=;
 b=XKmka0Tlz7ejU5+82z1bS+dTHqb7jcKqoJzpnMJPLpz8g+WmSXuDsTLJlG1W3dZ7g7wjh/XiQuDytw8T2dnD0lkpBKRXahhynIM6l3qavn6oHE6iuQmhvu+L2RVuWUudH2VX6+8Oyf9Oqk6t6GaQUdPxn0m8DdXprxOCrKsWaeXaSjyC41E1OnZpHbal9F94hnLGr3jRiZzXSeCw0kamNFh+KxEoSX6luM0bEkby3FTWDDIU2C0HyXB8Nye2NrZ9WroC/goQeP5TFfJ47Y/XvW3h2mEH0XupIt6iAvcqn26zA7BXtDZTAH9zUIYr8lCUunw+UBVML/tG08OwP0OuWA==
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by DU2PR10MB7882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 02:21:02 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::59) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:21:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 5 Nov 2026 02:21:02 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:20:51 +0100
Received: from WX8-V-0006W.wx.apac.bosch.com (10.183.144.211) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:20:47 +0100
From: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:20:26 +0800
Subject: [PATCH 1/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Adjust CPU thermal
 trip points
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
Message-ID: <20261105-b4-bsh-s2-dts-v1-1-8586d0ba44dc@cn.bosch.com>
References: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
In-Reply-To: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>, HaoNing Cheng
	<Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793845230; l=1182;
 i=kaiwen.zhang@cn.bosch.com; s=20261103; h=from:subject:message-id;
 bh=QW9Y1E93bHYSLn++9I+JurZGav0Kwvfr3Ofa5JBEs+Q=;
 b=skd1Fo2IjS15Yrfr5ZJNphBReGcfZg3ct6cER/knzNL5EohkB/7oNteuHwTlXlsjAgR0G1Vor
 ZctgeTdry/2DFj0qiAjQqQqBY7nQjd1ozocZ2lRWzmu6U0PdRsj2I4+
X-Developer-Key: i=kaiwen.zhang@cn.bosch.com; a=ed25519;
 pk=8Ap+lAs6RrhqKlHTUdPD/pH0z8/aAuWeDjMasYu4huU=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|DU2PR10MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbdfa72-8350-4cf4-3879-08df3ae37001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|56012099006|261021121427099003|261022075727099003|261022105027099003|11063799006|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	3yswxa0anvjLAZA429e3is7PwXrU9aYdl2DCEm+fkRQbqzGmudz2eGdo+Uw+eU6kAF7xHPJWis8EKOS7dd6q8nlPgYLJShEOIFH0bqVSmDzViIqVIDkGQGOWvw0rDPwyEYrifEDKuctO6oiTzvSjXilaTZ2qjbmjNZh3tgG0MsnaCYKVrU10xntCCCx7mNfv3XcbfLId0FB2KstvRN65eHshXDGPnxEnW4ADyt+IPty6iZ4NpnK51/c/EOXTM/Fmf9hZEu5MXQO7/OBtK/oJEJK+ycA3+Sb7yE0DS1c6hwu1u9JcwaN5xLOsEmdg6XgNcRPR840MCfP1KW7WVV7i/DMcHSL1Y4gn6seISqSvs/TIHouTT3rSjS1I+3j6Y1azumonl3v26lIksk5sQk2MMWGq0ylxEtpFEekbNPu67zAUL6+m6lQTnOQ64zrjRvwlw17YAE00sCpxdq7wEXZq+uwwhBN6v6wPw/C9YwZlzYkLfRaXS3uLdfBroYPhe3TjGtGtRPe3eZpeAW2kJhR0N+Uri6avqkTLecRpN2QH7maRfb/hq+ZEtrfIVEJuxtMcEzuBwrzORnTgZGp7sYpdHj7L5eTt3rEuuB3Nq5iCQD8ty0VAIskcJt28qF837fvu52bxIK7kfIypTVbv6u/dcasybr37Cki0teS7l2MGsQDtGwIbwYxQBKqLRgWUBOPiJxNqtkjGmREq6bo+m+T8LA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(11063799006)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	grwCDmXUZG+8fazGJ1JoPYIXYPo2s6zF+A4cIJKMSiaX5vwP6WZvS3v8nSD8cQUs3MfqG7RQJ2elZzpaC6r8f7ydtYxzwGdLPrYVfkQ1D0EOSBnYoekDb0x2cNT32GCEF1ktBCxSz7cha/Uh8uE/Psafk/8EYgGrg4XQDA0XO2ZrLAZH5v6PZDUQcPLmk8AOIqcKRqIwQDh5VG5V9IWvzU9jg/1tkawehj/k8MWBIhULyGLCpRUcVGGg8NEVl2kd86i/K/JpW9+C146eCmxf8ZivsXswZNC2X/O9Omq2aUAJ/vE1JWwEfj8hB8HannUf8t+T/Y4h3mMZOatVIgxGKyA3Fopj+OfP3Oole6WhU2FmjtbuZCH3kNc1wSt1+2cAY4g8JlPQuKL9rdh3QnKyheJaYyixOLD6AYwz0OwEoVMW2uorj3m+FGRwReSuMnGJ
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:21:02.0015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbdfa72-8350-4cf4-3879-08df3ae37001
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7882

Hardware thermal qualification of the BSH SMM S2/pro board shows that
the existing CPU thermal trip points trigger throttling too early
during peak operation.

Raise the passive trip temperature from 85 to 101 degrees Celsius
and its hysteresis from 2 to 9 degrees Celsius. Raise the critical
trip temperature from 95 to 107 degrees Celsius to match the
qualified thermal limits.

Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
Signed-off-by: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..638e2417d74d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -425,3 +425,12 @@ MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4			0x0d6	/* I2S_CLK - WIFI_GPIO_6 */
 		>;
 	};
 };
+
+&cpu_alert0 {
+	temperature = <101000>;
+	hysteresis = <9000>;
+};
+
+&cpu_crit0 {
+	temperature = <107000>;
+};

-- 
2.34.1

