Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777885;
	b=GbbvnloE83STEOoV4g44v77wAChUpib4w/1fttE3Xu1BiT6Je/MfUFiHDcfNCU476TzA
	 JajHw8qQENsyaixsnJlh0PwyAxCl+A3KRd+yLytVORA00zTwOtWJwKWAw1qCpGAbrLE6t
	 6tqUYcEoDEnrkJZ8FAQL1e/8Ug2zvolsTDZCap2pnvVqn5VJDFeifwi4OdOHNgTJTF54Z
	 9bFr9q3gQU9L9LKA/mCDJ1FcWIlNDAuZC7jB7zSU+puxbVVgMnHD1OEq73ts2tvph+zW6
	 EddQhRlOYVKsR9AE7FL59S0VpLBXomOIed4Fb4/VZtMyBsMZhcBbl/siS3WuWVvhw2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777885;
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
	bh=rvLot5LxYCltO6B8wt5je3k3Gvi1i1WSwtN/TAMvCY4=;
	b=ucNQ3cX8YS8o7HP9PSzqMBheDIKwxTaiRceFYlmpiuVeBUjKyfho8h5kK/PgMP68Z1Ru
	 EUtPvYgAdnmItjFc0oS9a0wpQ25PdiI6yjbj7TIYPdJ+Ig9d5pbZkWXhZlnFRDqnN/sLi
	 xBqDxB4UUAiwM7po7TWwq60um8LZB0BE0bDzTRyYul4DAa+j5tjIyftIp1xN05KAi/4qH
	 NKAOp/QLRmGgMkSvCJ3660NL45CxqIS5gXF/ybmtwXExqOzqFmT+WkjZzAT3+BGsE12eW
	 fVX4vdnxdFhvemyPm+GOGtnrSLfbSYeJuR7ikMu2LbHS2xf2cILkCmlqEyPp925G5fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=CxmN2jwn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC13606A334;
	Wed,  4 Nov 2026 07:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC13606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=CxmN2jwn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkwzU+HnlEo0wE4G9NUqv85r01tSxNHgnrDHoavNHeCd7YdUt/ZWa1Bp+hBXKGNYYvy1H+S4ik1pSXG5oTc15h32FHNmNnvU9d3BRCsajknN24my54spBbXpuzaB2SJaFxmSYjfwlRgpicpTuVER0U6FAdRHtBGdOyguLWF9wPFZbOyYMwIJREzTZ80xNc1h6bKhNpdkDYw6TZIm6U1I9/OaNxyi0fOrGsO5Y4QPowS69xzSxs935bg/U4RfbxZ01d1A1QtQ457PCGkemHw5vxhgyky8aors/vygeCOI/6BRqydhi6HZagZx7j4rKuaHq4KL3qEw3H1t2S1MZYrKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvLot5LxYCltO6B8wt5je3k3Gvi1i1WSwtN/TAMvCY4=;
 b=QLahgybV/ATeXsfX0sD8Up1+FktVruXuwmIwFCoo3mkg/+22ERJ1LEbMICj2e3vN7ddqcOLaUZU2kksI9N2oEqld118cOfrs+vVWKk4gx+8mPw6wBz6E+GHeBSyCYyDecngB3euLf4eNRst2nMpqL+Q4unxJK1cLlQ5iyW+RB6FWdP07T6jIMwN6qL8wrxcIpllTOtzpIzPIhsV13OLhqmEQ2iuMWXxtstsBG3LuHKTYDNyHbE/TiYxs7VXKavAzp54VbMbQF/aGmklElUexgQg3wL/8xT9wJbCESjSJPw5iU8dWpTVSsdf3wmsNRqaiJ3elCYnIyXJu285QZJRViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvLot5LxYCltO6B8wt5je3k3Gvi1i1WSwtN/TAMvCY4=;
 b=CxmN2jwnVLABSD4EaHL30IgFYNWyFqMKhdOcQu60qzruE1R149s8cKd4zyCZe/CUuTZDIkmUK/v/gjjYfBxpAwyOnPJ2+i2UzBRmXDina9pBYkzpI5uj00OHHoa0ZkqJgHToJjVjmSs9wxeieCopMZpGZlk4UoyWSA03C2m7mcRrg0fP7V4lhvBwCdCWEXBGR235veUzvSSwrB35wm1PdRw/7ev3PZr1AQDSowZUZHm6NiGlvLwgJF65cKZpN7/kclPww/fDHHQVWeYoqK/SsUN2eJLHTOiVogCtnz6X1Z9/Yojc3KAD+BIlNj9GTY++fsriz5aKveZPG/i4yVdctQ==
Received: from DU2P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::28)
 by GVXPR10MB8782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:00 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::a3) by DU2P251CA0026.outlook.office365.com
 (2603:10a6:10:230::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:38:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:59 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:49 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:45 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:48 +0800
Subject: [PATCH 08/10] ARM: dts: imx6ulz: Configure UART2 pins on BSH
 SMM-M2 variants
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
Message-ID: <20261104-add-bsh-smm-m2-v1-8-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=s6PUmaYA8qhZ1CrsDf7ouWaUkdJGPXrVYGVEOepPlm0=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVjxU0n39lmOk6s3yKvoPjvwtqD8foxC7LGFvfLb3
 B/ny/u4dJSyMIhxMciKKbKoJniflbwaYDptZjXcHFYmkCEMXJwCMJHlNgx/eF7/7mV+dD94u7l9
 CDO3bJysfoov81aOrNfdbtu3LnhWzMhwM9rgzZqQq6XPqj/PSXXdIBC5Yfd2bU1Ou6cOKWrH49/
 zAAA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|GVXPR10MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: a519b293-4cca-4ef2-ccd1-08df3a468d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CtYChQG5YOHX13etlwqx5V7Flct8P7MsHqYhsDo7pFAhDs4qFul+fBUa95f850mcrTfN/isVCIIffWLJe40lEqyoqe1CCH5bEvN2wQQwAeYfAeWGheQboC/1hro8HAxwN5/14EtcsJZHb5PoKtf0ol3L8v9sEU392swp7eeKFYMNqMmNT3MTtdVqMFYn1FlrpHVxjbH0eHpbAoW0w5tgD4xOExuAgY2zIEOPNo9mKhouPMeMfF5VpWGumzjtyOro8Qj+krvq5F1yvrfx8356zbgJF6kDvCg2hNLFU/3RH6eGrPZAWkC8AaJC94vjxni+/PM3vQ/ja4P9/X9Z9jTQS2P7qz+56xXRO/2+abfNVdW7Ff/ygzZHjK44D3rpAKUoaZ/S+GhoRE4IROaoE3mDGyhFIdcO+XDDvkupHLOLHuyEyTUMy+lMaGvmMBeUCJYVTgUFu88joX3NjfMLYvysJkZwBxmhgqQ85tXOk2sDtCNE6Ggwz9wuSKEhZew3XTnB+CZp+3NVwBtlok0EWkjOXtNdeT6s/EvztHEjFo0GJcuZ5VZaYAgJ/02RLPdBi5QRczhBxrc6mbbQPkoY+G9z81p7h89WaKO2R6xwsjyZlRaU/6kbj9OyoCCNnVId/iEctaRWozqvGLKyHxfst5lMTvoI3fXSnBrF5pj/fS42ZsOTd5mfnfXDJ2WwoR62rGUwe0nC8IxTYss45D8EgmRGFw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cD7uzAmKodz2XkvbHZfuWRXEQHsCTP3v99FE28wnOAqxzXs5U0obHQju0JtxWrUrLTSbsZi2veh88ev9Xjmc8kbW6LKxq6Wkr20JjoB0umF6yc4391R23bBxG5Mpi2DlLyTfO01qDetGtRYwMkd6TFdSpOpGPBd7FVZQwW1Dp5vgwg9S16CVvS/KBsvGciAcx6AsFG0L+AqUr83q1DBJ8a+/Lk7QzIcf+VzlEOAds5tpq3eWsvEx42LfJ5iHqp5YfGdMLrivKozCbrLBYE35EFbdfhwRNxwnr81XZD6EEikgAFK9SAtj7DNmCVcGbWfGP6TvEsm7lqlqKyKLCzcWhhAzoDzDrqt8huuuOmGj3HC6bEAbxkCKgcSf0TxEnBItp1HDM9BhyhfW3TOkvNKOa/nP56Nk49JCxHMooz6KoQWfac2dp78Icmj8eeQivUpS
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:59.9470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a519b293-4cca-4ef2-ccd1-08df3a468d2b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8782

From: Akhil Narayanan <akhil.narayanan@in.bosch.com>

Configure the UART2 RX and TX pin multiplexing for the BSH SMM-M2
variants.

Signed-off-by: Akhil Narayanan <akhil.narayanan@in.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 5c9109da6806..93d662ec875f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -34,6 +34,8 @@ &snvs_poweroff {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
@@ -86,4 +88,11 @@ MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
 	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+		>;
+	};
 };

-- 
2.43.0

