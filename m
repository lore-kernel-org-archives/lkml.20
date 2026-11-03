Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689488;
	b=BXnfy11QRRszj/F+V1qb9nMgRfTsGy8iKzo0/mmSKRG7bXOOlgr6LXUdGNPPYJU0PvLy
	 NsEq1cgmsW/CrIlStADkyvlBN/aYvLCZyc9QxYoZ1p7Dj8OLE67af9CMg+BSPx8/NZXg3
	 92XXTqHb/mg72M8qhBNIk65Z1O13ZkrJSXQ4TZobKfRENdquyC0uLk3ZutzfX/B/o/a0V
	 lxDu1Sg9icTugmhFPdC8g/TFpTmCGVFJIQKyz9Blo/pXlSy/DjVyZFiV+qhA1SUwZIKv6
	 4ZpE9BQAneowqTCjIx8lRpTC4+08i9KbgePriST/x5UIvCO+BF/8RBDxcdvFlED2FFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689488;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zJHZP47/fhUXWqh9W2dDuVxmEaJSmnIlCvHcfwIx7aw=;
	b=exYfAf9VpYL4fzGZRxRCDK2WhmtZ/Fn5E8ORFE6T1lkmacheS1E/3pxkmVKq18wN2sri
	 +byPAFiTzhA3kyIfrIt2pXNvQ0iWaPrkfEEJ8LbY7owrnWfBVda3PX01iOFXJl9GPp38g
	 YGOjJqwoOEO8BEJbHNYThZUEqsRT4i+McGtb5LYxQud7qtf6JtvrJ508pCd2655rv/mcc
	 5VTAcUc1IYswKiqVzmGVH+JkIw55bFnPO5qKF2h/fP9K5cC3VNIFtfgStkDu/93gRynOM
	 d4/JY4USw6ZXQuv35kd6AeDxACwmczLsH0dgLbzhf6IBdiWlx4Wnz/DCutVuZ+9ZwqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rTxOBvCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.23
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147C1606A331;
	Tue,  3 Nov 2026 07:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147C1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rTxOBvCh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF64DjKDs46zgP+V9MH5GRmfReDUIa/O96dNtqohvDV/LM+EemdO7mzmS51XrWbHYYqJiQsV570/b5ZSEEUWHFVpsO1o4ZnoA93B9+9ifEia3J5cM1kzWPO8UZqE/1+kYHn5gpptsqSLYbmKAemBAHF3TmPjGZiLevBUApUXrXpYz5w3E0vABCSbX5m3NqxhrsXM22UuXxhmAbdFEppyv3GExgP8/qY89eMJbhXr2TfA9alCbsHOXWlLkXfzkFLe/IKRCzAJ8l19NE2LAa8mfKtKKmjfuv5D+JAnaJKHypewZMw21HXcilE4MffDLPnp7roQP9GPTNhxTCrMusEg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJHZP47/fhUXWqh9W2dDuVxmEaJSmnIlCvHcfwIx7aw=;
 b=OByb+9e6nAdSDAitWJtEGebkkuQCz/cltDZc2wFyR6wek6oBfC/1tybLd2QIUeju5bd3tZDwuiASmRpnELR+xiPIUgylpkj4j8kAhqysSgkpAF+hcFpJlI0/Klrt03S5YRjnirB5UI35x/ZtWdGuaG7eZ2+RtzOyiWqWUtd4Y/DFUtXzkWfHZMMZf5fslw6xUMmz/jdkC3Do91QiRRYXS/87d2UcXVT51VuzMW2DqpBHpe0bcuPuup2lkfFjWujsCyp4j0TBz4j+7gxjpcBl6myG/h8axPhT8K3jhyq/ug6zPYBWaR8hk0Xy8JcK38EPDDeMBCfivmkco/KviD4M8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJHZP47/fhUXWqh9W2dDuVxmEaJSmnIlCvHcfwIx7aw=;
 b=rTxOBvChIL5581sCw1gssBPHdsb7nSUydFDNYh7FzG1nUJncvYAW7fdQgWwl9iR5cEwf73GoMwnIzwq4VhF3A3RUjHpHKdZ6PjBPnH+0zTENATnVuESicBiGFHhud7T7TBwr8NXmykTgeqTmSIIg5xjfeWG4Evy9vRvFOHduMOzDGbOa/rMNpaeHrlpzQC/dfjXIQxsGZZAZby4m3+Bw4UY5p0JHlKjt3FOyUmxSwR98vzGWXgvINzjaaeKKXHjHBjDDWFxvsSbbARqAgLS4zDZ50ap79OsJHIBpU7UemXiH65k8pzBT8FOovuhk0ff1tTcIJrU/JduGBPpBQVALug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by MRWPR04MB11518.eurprd04.prod.outlook.com
 (2603:10a6:501:74::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:04:42 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:04:42 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] arm64: dts: freescale: Add IMX-AUD-IO add-on board support
Date: Tue,  3 Nov 2026 16:04:29 +0900
Message-ID: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0054.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|MRWPR04MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: 686cc6ac-1665-415f-b2e8-08df3978bbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8n6Dr9Tok0zqurzLJP09bY4/218UimDpwM6iKTZHh1/c6O8+jnCLJMtYto9zXzuvA5dBS7Pgvt3bF9gEIDOqYTomsMELTQ83t9Ao9m4OIioKLVp1VsxyLz3selIXJhEyaMbUouALUlwpqn0PBWsknv+cOiz83eBlep9gFShWvVaqV/b/kb/6ciqiJVGrpKmauB5eOtHTdKH7ZIa0binUGF83evjy0zPeHIOnRUs/BxXT+REcKFgR+rqdMwwRvzAoye+gguMhfXbMd1HH06g6ftqWwK7NKtffbwoKlwg/pQaT59/5gQkGTDC6649gEAkzuJY4k2Tqi9oRIbjcUPCHG1e2+en2AeoV4CKnqGrTaoY918gqDy0Dh4qwNBThYEcJwXXG8U27Yn+VWxS5nBwU3dLVmeStOBC1aCLC2zZcWCu4DTEASq3gxgbIReK/yLIEFB0DAORDUgRNq5xc5WgsT6bYkcjUajkFbMh0DjCwUZw7P7/sK3RIBQ4PiRmxWq6OYGWe/xERftaVFjfukdXYbkRiMme4niumfYUXJ6jkHpTuMf8Cj4EGIPxr3qVoMY7HzxXMk38aRlql5scOQDSmKtBtSSAwLkwBD+EkZLsBewD9Wnh/s59y6Nww5koTY5UJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TtvtY3SPSEFw0aEZehtvneXTuzPhU4VBDWIaj47lQguF0KDeGE11cc9/9ZbT?=
 =?us-ascii?Q?xLorLlIhSbPAprlXRLuziy/NVVPes5mL7TyClOx129Suwr9uiU4xU5uypKld?=
 =?us-ascii?Q?YJDUqTP+y6l/2QmDE0mCl9epTE93WxCmg7x3xCoQp0ZX3gxgKjPBFRT3+0GV?=
 =?us-ascii?Q?vfpiU6z4vLGtHKdapuuBj0EmDIczPwMg3QQx8Fi6fnZTlo2hOC5GIpyxgkAa?=
 =?us-ascii?Q?049pXhjGjGYZxBaMYDcZa3aCmDdL6xKw24rzFOtO1+Hphw8c/tTtWI/Jei0L?=
 =?us-ascii?Q?gfBJX1xKeTOIqJ2G4O7KJa3/AxDL+6lYdKAmR0uRmF175RT2JJuhm4YeWT4j?=
 =?us-ascii?Q?VduIddIk7wb0mGDshh03r/tzJfKE1vhBD71XorgzmlMWFB+Hmy4E1Tiw+J+D?=
 =?us-ascii?Q?Jds4HoKL95mYEriehKManAa4w6PsMzqalzXZItwQSvROv0vXIwoE93XNzCOG?=
 =?us-ascii?Q?Z4MKHEcOxj/XG1b/dRuQe8Ysy1UFH5kA0jyTl1CFy5749/ZbZrK7y2yrnY4l?=
 =?us-ascii?Q?dN6/wmZTWkxjKkTqEh/zw+dH2MfDHjRrQVdGefi8k/kAhDwCaUK+C8GJD+6d?=
 =?us-ascii?Q?G0yV9CDI/+fgCEafmJWLc8fY89K+UWJAlMwHZS3Ce1TZqGwZixvBbRO5/To0?=
 =?us-ascii?Q?2epvv40K0uLzbnDC6/Ojn1QawNDJMOJI8bMA95YplyISo11imql/ulCmbXqZ?=
 =?us-ascii?Q?x4sS62Habf7QvJDuGSv66lcukOUEzNZTUmtqEVjqVGgnieUiMHD5o41gAfLJ?=
 =?us-ascii?Q?dc2ORY8mZcDPq78Rzzdt/NqTQ/qC2pDPzVFcG056DfbCB5yI09snPzhVhRa1?=
 =?us-ascii?Q?8jav8BKPaDJY/CBpPkpkIFUabZphDlWGiGgRP87FETOVDLboPmfh3Y3HP8e2?=
 =?us-ascii?Q?tj2VBBEPe1qsLGnBbusSyazzbN6aw+XfeYwHV+iApdQfS3qIiY0aqBDjGv4T?=
 =?us-ascii?Q?dzH08UkowOCNmX7hvOuZ1dVlDt7VIhzvIH4cdIFQlpe2oom2C1s4DfNeNcf4?=
 =?us-ascii?Q?RwoH2QxeUrISSWQCypfOGDDBb3qhA9zWR+p2BJ8apCsp1Zq7zGsbsCbgSP/9?=
 =?us-ascii?Q?FwFCQAbJ2z3pa4xBr74pR8Sw9MUD2MZXBbgJxgn9oOisYo0XP25laQciUZm6?=
 =?us-ascii?Q?8NUJh/0sMbxeJjG3gTp+cZpKCrdDHhUgwf3unf8DizA+6pVPXZGc0+fSfb2i?=
 =?us-ascii?Q?OLRf5U99XtagH+YPnAc7h01aH9/9nr700ElWwwdszDGtVSgbZbRGne6lAwB4?=
 =?us-ascii?Q?BlgPjTBY2x8PJEsMjARBxZxXuZ9HqVQSwbyhUtIUy+vBZJ7Cf1WZTSuE8kj2?=
 =?us-ascii?Q?q/yQeR+XpTzUGoSZWhmX2YFn0jXBabLepNNld/rUgNoaPSpt8qeZL1c2miQF?=
 =?us-ascii?Q?KegrVAFrm13Jw6rY8+0RV6zD7iH0Yx/xNFyFJ2JFIiYwGMCBiL+KsUGAUGVA?=
 =?us-ascii?Q?4zR1fL4OBrN0Zyay1GZo9B+9hCFK84bE2g3P1OdHbcSj48Icz84RA+4VVNF4?=
 =?us-ascii?Q?wne3hUWVlTUp2Itn39nnDv89mefVPl3UIupskQ/0hbBCUmx3fBw/uTx3Q/1a?=
 =?us-ascii?Q?m/rU9/d5K3BCLV2cOUbJzBahHe3a65TKeMtziZn+jvq30n+1/zE1gd8PjhL2?=
 =?us-ascii?Q?f4g36SUAp+BqbimtSqmluqOU539u5amY24Vpqc3Fz+RwzjLKAJLh9Q1oBegH?=
 =?us-ascii?Q?hV2y9TkVZQ8wFk2Dbh0npkK9MRJgtu0VLmJ4Rn6+g2tMHSvuXxu7lUAMlvt4?=
 =?us-ascii?Q?WJ8Xt5N49zK4ZIEpNver0zINgTJgsIS3UjfFPM3kGpWVTkE9J4zO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686cc6ac-1665-415f-b2e8-08df3978bbae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:04:42.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikklte0qh7fl5h9epdqhYGm7jlPLZln8IoYJQvD3ZgwiWGJwEJCMXIsOP6IyadY7oRXVpyPv8QP2p3Q3VbelEebT2PsbQ6kAJypprwtI5H5qk0/CkYm4QrH1/JW1m+5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11518

From: Chancel Liu <chancel.liu@nxp.com>

This patch series adds support for the IMX-AUD-IO[1] audio expansion
card on the i.MX95 19x19 EVK and i.MX952 EVK platforms.

A connector is present on the base board to attach the IMX-AUD-IO card.
This connector is described by the fsl,aud-io-slot binding. It acts as
a nexus that exposes a constrained set of I/O resources, such as GPIOs,
clocks and interrupts, through fixed electrical wiring. All actual
hardware providers reside on the base board.

Also update the EVK base Device Trees to describe the connector and
required board-level resources. Add a DTS overlay to enable the
IMX-AUD-IO board.

The approach used here is inspired by the discussion[2] where a
connector is described as a nexus mapping board-level resources. One
important difference in this case is that the IMX-AUD-IO add-on board
is not a hot-pluggable device. The board is connected to the connector
before boot and remains present for the lifetime of the system. As a
result, the connector is modeled to describe fixed, boot-time hardware
wiring rather than runtime attachment or hot-plug handling.

This series depends on the clock nexus support from Miquel Raynal[3],
in particular the clock-nexus-node.yaml binding that defines clock-map,
e.g. commit e0be7b4eedd3 ("dt-bindings: clock: Introduce nexus nodes").

[1]https://www.nxp.com/part/IMX-AUD-IO
[2]https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
[3]https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/

Changes in v3:
- Drop unneeded clock-map-mask and clock-map-pass-thru from the binding.
- Constrain gpio-map/clock-map/interrupt-map maxItems to the number of
  signals the connector actually provides instead of a loose upper bound.
- Narrow gpio-map-mask/interrupt-map-mask from 0xffff to 0xf.
Link to v2: https://lore.kernel.org/r/20260629074734.3643227-1-chancel.liu@oss.nxp.com

Changes in v2:
- Drop [PATCH 1/5] clk: Add support for clock nexus dt bindings. Same
  change is already present in Miquel Raynal's ongoing series
- Drop PWM properties from binding. This connector carries no PWM signals
- Rename compatible from fsl,io-connector to board-specific compatibles:
  fsl,imx95-19x19-evk-aud-io and fsl,imx952-evk-aud-io. The i.MX952 EVK
  uses fsl,imx95-19x19-evk-aud-io as fallback
- Add property constraints instead of redefining common types
- Fix inconsistent quote style for '#interrupt-cells' in binding
- Add required GPIO nexus properties and reference gpio-nexus-node.yaml
  and clock-nexus-node.yaml
- Make gpio-map-pass-thru a const value to pass through only polarity
  bit (bit 0)
- Modify dts accordingly and some commit messages

Chancel Liu (4):
  dt-bindings: connector: Add fsl,aud-io-slot binding
  arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on
    board

 .../bindings/connector/fsl,aud-io-slot.yaml   | 106 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso |  57 ++++++++++
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  54 ++++++++-
 arch/arm64/boot/dts/freescale/imx952-evk.dts  |  69 +++++++++++-
 5 files changed, 286 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

--
2.50.1

