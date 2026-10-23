Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748113;
	b=t4SsN9xegZ8hra3ucfCY7HrXJAbfGIhvzQpwaGoKI9mc/2kAdjwT0ljKmsFCla4cenHK
	 8rEF6oTxusOiCeYvKILXJh2syePvo1KColD4+RYg6TSfak/ayrOiUMVG33XN+lKPjHVqF
	 nIU/QYKy8vuX1d8lLvnRZU+AHPGa6qcnXWlf3/TeqeiYkHzO2JdB5/8ar2GJntPNQkynA
	 6WETgtmqt9azdDpEyxUGjRLC40i7JOJHwplhFcky7OewFYoLEoF/2tRYPs1U9q66HerZI
	 ruM5/367p6hOVXnoiZ0TbBIm8yyryow59QKy77GFmbrWNSNylbUlIVBr+JdoYN2CfQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748113;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=/p2dtukBPWbkRywQZ5ucF/rysnjkZ5ykYHpZ9Hr4Ur0=;
	b=BpmQ+7VxJ9dlSHNBlzXZq5p5K7N+J+x03bMi8lsNttOmI1CoCIebIxp+h8ZfSNZPygJg
	 nj+h21Yy7ABiZZKdcNQF+mH/8AEtBFGKrlsQ1aVos5gKCD+GYeINijIUY1laqZ3oJTwIk
	 YDegx2rxAsBw74RykkLznMGqpROdcj1iEN37ixs4DEewKVcPo4ZSjxYbCG49p5nFZAuY0
	 QZpSPt7vVNX3NSk8ZEECHtmHukJDoS3/RLKSOlmflhjCeH8rYrwKH5laaOgKTTc/zHIXB
	 TQkP4MJa12Jn5+bSoM+Vsrv/LWVO7/62KTwZ+yuHQMY4QjDYXD1ut1IzCtPJlIliiKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BHhdeGmn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BE606A323;
	Fri, 23 Oct 2026 09:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BHhdeGmn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDx24Y+moeiIQVH/cMfma8l5MZovfIclyXJGJXeMsxMrDve/Du/bZ2KBgAdpMBZXe6AEintAfuMuc9RX7GfVwSr2G1A5IrJJRgIA5/eeZ/uIIVRPJqHTOKQt4z1Ff4oQEO5SX43PDbrIc4UiywK7EgWy39FU3NjVOFUG2g8uOTZlkmpLd5KEOgDjc1l3UiCvvDeEO9bJ788RiOMv5JuSbpk515PqkMdc2RUSb5M7kFkmjxN+vhzJnkRO82jINKs5FG8opiw1vwaVtFFO+GeVpJibPoaN5klcmQd2MMp04FbCkJ8idP8yFa6Tr2+fT6va29cTbauGv/HgGe4bVWn5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p2dtukBPWbkRywQZ5ucF/rysnjkZ5ykYHpZ9Hr4Ur0=;
 b=Al0bYI3xTb0cNg8UVFwevibes8nNYwuDALYk3ALYN/whqBDdB7APGz4angTHqlN5HszSmUUKOYbzwRApIBgj4ATg1g8wCOsxkBWLIDOMzSvKk6FLUT2EFFbU6aeEfU5eT2nsX6q30Xi9MV8Sh8l2ncBEZXEJwIeOuAaqNJa5YSsjHXtbcoL3lR9c/XFjiejYTUN03QQme1sGd7t3YCMC8GP2ZeDvNy7pHace8phdA9fc6zljVCfwJhFAaF16ZQNM7RfJRZsE7K+zo5nsdpXdwdqUU7AIFe4eyyBYzYjPSX03kcOK834QTztHloQ6GD7Xjp60K4grZJ5TbB4pzluZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p2dtukBPWbkRywQZ5ucF/rysnjkZ5ykYHpZ9Hr4Ur0=;
 b=BHhdeGmny7woWK4LGfEriHD2VC4WNSxJLwYVabZ+3DiAJOpYwFwyEwh0g9mqNWEaTlSHKTwK5oqoJ/gq908W8NTS7PL10VG7X/sXFPpXnY8R8MrJqec9OLm9CCWwaeyBNvg6nUSYxNjgfn4/Y+sK6AFUXWHgFFKQaiHNV7IDHEm/5LWKyxztFZ5DXDSG3LMrWC6lVukC1gzhvaXOtqTkyVsj65gGw938WBbCfoTb15fTMedjZdvcOXLepPusQBHl/po7ZogFXQF/fQzUEkODmlhx4q12qXkjkpKk54FhlM8WgajEOhzKcolnoVxBgzbdvoSW6vu75n39e6ViSZguOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB8643.eurprd04.prod.outlook.com (2603:10a6:20b:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 09:35:10 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:35:10 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Fri, 23 Oct 2026 17:37:49 +0800
Subject: [PATCH] arm64: dts: imx95-19x19-frdm-pro: Move PCIe PERST# and
 vpcie supply to Root Port nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-imx95-19x19-frdm-v1-1-a15eecbf9963@nxp.com>
X-B4-Tracking: v=1; b=H4sIAO0q22oC/x3MOwqAMBAA0avI1i7kq8SriIWaVbdIlAQkIN7dY
 PmKmQcyJaYMQ/NAopszn7FCtg2sxxx3QvbVoITqpFAaF4McirMoXZEOt+QDOmOt0r0Wxq9Qyyv
 RxuW/jtP7fnjWhpxlAAAA
X-Change-ID: 20261023-b4-imx95-19x19-frdm-9455237304dc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792748279; l=1826;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=NWAD1JUJ5hWDt0l5qnBBihQz8UKP30/HI02M3Ngrhx8=;
 b=fg1kthVt+/bngK5bvG1eKNtD59Cn1IC3EGIn94w+Gdeo1YBkXaiIZ3Z06eNnUKZnA+1JWfaLb
 pmL4pm4252kBrz0NCTlSvleU/XWWWJkeHTnw9GoZI8s9srqU4wsjQYQ
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
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
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7c7525-ebd1-4121-391e-08df30e8ee4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|19092799006|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n+4mYuTpZD6bb4IgME0XVebMgd6lvGfGeLOZhd6CCQ+sw4NvQb+bzylL8NqWv+QJ/mRDpjw7HQJqELhz1xSkDODB+hLQ0ZTGBT2mz8YduHj/9+I16zkAdl5KJnJx7qqlWt3BgYIbD465O0qW5e1TQwGroqqrBBf7+Mbld23i5icIQ7vWKU/50d1FM9aPAp9LdRFVodd9i6GdgkNywiR0lufe8Toi1LO7rae2um9bVC8zT2KTBWR+yfmvd0hTCXzl0Q3jLD9y5Yodx3/0aSNeRs59Xc2kBtVHJTI9Ba3E+w3dd4T2WL0RHzkRpTmbYDRmBtzddOB+xlIJayRC1JduUH8iDEOu4gBO3XM48UsBswduvdWJpRipRDw63owJqF68VrA4WY6D9BLeEMWk0PvzyctPDRjq7LkLWmijC7d2zHlY7UH86sBaHvssNhl5s5TQZ79T9SO+S9uMLfa+eidt5vmU+xxRIEi4dznMX2WmDCmb6oR6lPqYRlr1fPJ9fTvUy6XZdnknaiWtPTcL5UPegH4L9aHkLVFGuqR4Wz6bQ6BYuTSGGH19S5cLtXkX5d0jbFAxLTzGkedag/JkJXFXLw0CWpLzmqZgbUQ4fc7kVajkq311YimvoST+O3EG+dMprbKOIDJL2jrnMfVAVqtthOJvBrEfrcfeXcUSjN4bN+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(19092799006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2RzdjRDL2NRa1h6RWxhaUlvV084SmVMNzN1QVBqa2pCTERFbzUvZEJiR0Vu?=
 =?utf-8?B?OFpobGk5WmZsOWhLcEY2U1l5YWRsS1pqUENhZ2VoSkwwZUt0WjVIbGlhbkxn?=
 =?utf-8?B?eVczVWc5NVpjcXByU2d4VE5yNkJxTDJhelJRN2lpSkN3cmhEVk9OM29sMEVz?=
 =?utf-8?B?K3daT3lIMzBtRTdCU2VOZjBvS0dLdWYrVitWOEo2RGZLd0FGVTcvMUNKT2FX?=
 =?utf-8?B?YXo5OThCMUhMOXdYendRZjVFcTN1QjF0ZFVZYkVuVUZaSGMxZEFCOWdGSFQy?=
 =?utf-8?B?eXBZbVpoRiszbjFnbFFaK2ZjRVR1OCtpYng0QnBjTnN3d3pWN1ZReDZ2ZDNw?=
 =?utf-8?B?Q3ZwbWh2SUVVYnhDOHpPZ3hZNm1hYXZqTURxL0dVcysreEJuNnl6SjQrbnZl?=
 =?utf-8?B?dTVIUHpuY2wxeWlTL3Bob3Jzc3Z4TWszWkpHaVJHOG9JOVFLSkJmQWZsVHBS?=
 =?utf-8?B?UlcvdjlKendZd2pZazJ6VHFZWXMzWUdDbFUzRW9tY2tkbFBNSE9YSEVUYmtM?=
 =?utf-8?B?Y2tUN3RZWlhlNUlncGZadkVZb1o5aEVjSElIai9kSlgrWG4yK254WWJrMy95?=
 =?utf-8?B?b0drbjR1aVRJUENxdkF0dzlvQzJJRU1QaTlTVDJzZHZSUHpJb1BwZk9rZzZ2?=
 =?utf-8?B?YjdBR0xCaWhvWXZXS1o4WmN6bjY5cy9aYWpjMGxuRjFQQXprZ010MTQ1QlEz?=
 =?utf-8?B?VlliQU9kY29ETjVBWllXaU9EbSthdGQ4NWxSRlVHR3QwcmZZd3RGV0tuMTFt?=
 =?utf-8?B?VGRJaGlzMlpwZWJndUhOeWxxVHE1OGdIclc3Um1IRU8rSmovRWhyVjA2Ym5q?=
 =?utf-8?B?dUVmaVNLZmVkakhuZW5sR0JQRTN6TlNSR1luL0dyQmtoOGsyVE96QU1EaXJR?=
 =?utf-8?B?Ri80SzBtNFZIMjErVmZEZkhrV01Id0d6dnFMWTVwbkxEK3VBdzcxUDVZb3pP?=
 =?utf-8?B?eHg2Sk92bTBRT0JkR1F5T1F3ekYyY2p3YThXTldnVEcrRjMwcXpwcXZVc2I2?=
 =?utf-8?B?bjNYVmV1bHBydzRaRUk1Nng5K0xjZmlhWWRYQ05EbThTbVl1VExSWkhqSUlT?=
 =?utf-8?B?Tm5iUEEyV0xiM2VhS25NOXFYeUx4OGhuVExYTlcrZWJNbTdnUVYxYWt5Qm15?=
 =?utf-8?B?NDh3bzl0UDJwNXpjMHhsTDMyTk4zSDAyWFZMNHJETmNha1hTWUM1RWJCblRk?=
 =?utf-8?B?VmNEbjNtbU5YVzdUTXR3SlNIbi9yU3BpRWZ4UjhQWlF5ZktJYUkvQkNNKytp?=
 =?utf-8?B?RWUzWU5PdnJsMnRjSUhYaGRSVXh4R3g5b0F3RCs2V000dHpRMWdGZWV0RTI4?=
 =?utf-8?B?RmVNcnVRL2VxT1lmZkdIem44Qi9YaXFuOTRSMER4M3R3cFJ1QW1VeWhxMHNI?=
 =?utf-8?B?aWIxT1dYL2ZDYW5Say9id1dXNGRCaVQ4ZmNjMStqNmFUdW80Mi9qRk1vR3Fa?=
 =?utf-8?B?a3NvaUFyNDF3M3RlVXZsOFNhYjZYbDNqTml5L1ZlYVdUTE5FY1pNeUtCdlpk?=
 =?utf-8?B?WlQ3aWRldmpHTGNMcWE2YjRrZFJodDgwVVhSc1QxQ09KTlRuVE9vbmIzSXJM?=
 =?utf-8?B?YkZCVmtTK1dzZ0tJYXVYeDM2c0xzbkVPVE0vTmZSbW0ydlZGMDV3bFIxcXVa?=
 =?utf-8?B?UnFXN1AzQ0tpb2o3b21PQ1FrRzdVd2h0OHNkWmI4UFV4R0hqc1ZaQ0RzVDJj?=
 =?utf-8?B?dFAyNGtNQkNDQ09KUi9jckt0OVNyL0tDRzk3Y29HMkNuTzlrYzZBck05NTNW?=
 =?utf-8?B?NVNKVkFOV29makFzT2VlOVdDY1Brd0dzY0R6N3F5Tm02Tkd2d2NHQzhNSmhQ?=
 =?utf-8?B?WitDbEhmRnFpdEhwZkl5VThnb0lMMzZhR3NvSmZMS3pNNytSelJzd01Wa2VD?=
 =?utf-8?B?RFBLZkNzOGE3Q1F0U0R1OUFLTUhUWDZhc1hQUXlSNjFlZmgzbzRBaEh6cnBQ?=
 =?utf-8?B?L243cXdkQ3pwNVI5a0pOK256SmRjaVZvNFMxRlhrbEhOdzR1eEJIK2h3dmRs?=
 =?utf-8?B?SGdPbG9jSW9Cd3RHZlFMc2oxODZZSlY4OE1tSGdCVEduenVzOWVMK0dDaWgz?=
 =?utf-8?B?ZkxiU1NaMC9kU1FrbjErUXA3U1dDQkl3MHVMa2RDL1BHdUMzZmlPUEFSL2o4?=
 =?utf-8?B?eHRyankyMWlreTdLMjVrRUlhaGgzK1FLeVRrWTF4b2RpRm1mbElGOUUzbTQy?=
 =?utf-8?B?dzE1SEFMTng0SlI2TDJnLzBHckRDTldpd1RjVzJtN1dQeXE4OFVEUHM2a3Zs?=
 =?utf-8?B?ckp0SUJEWXRBOFlQVXlLOHpGV1g2NWhBcDUwSnZnMHRYTWxQMEdqUHdoWWd3?=
 =?utf-8?B?U3Y4T2U2TFZPMHpvWjZyZUpQQ0REQldkendIQnJ5TEkwQmJ3U05pQXFOZEdE?=
 =?utf-8?Q?Z+pMlqEz4zulWMTecNomcWlFc2wzDlTTgJKEb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7c7525-ebd1-4121-391e-08df30e8ee4b
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:35:10.0375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRcUUnd3xANeoZt1d0oJpSN+Htq1xOJT2iD0NsXZgsT85TNXa4qY61MBoFF705ZMOWS6arnfIF51Bs7e90a462y5ajIefY51Yne4oOyjoIUsNMbN0JKSLOwDXE8qLkzD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643

From: Sherry Sun <sherry.sun@nxp.com>

Describing the PCIe PERST# and vpcie supply properties under the Host
Bridge node is now deprecated. Add the PERST# (reset-gpios) and the
power regulator (vpcie3v3-supply) in the pcie0_port0 and pcie1_port0
Root Port node.

Since i.MX95 is the new platform that under development phase, it should
be fine to simply move the PERST# and power supply properties.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index 1f62d729a5e7..d764d195caec 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -497,19 +497,25 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c4_gpio_expander_22 19 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_m2_mkey_1_pwr>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&i2c4_gpio_expander_22 19 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_m2_mkey_1_pwr>;
+};
+
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-	reset-gpio = <&i2c3_gpio_expander_20 9 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_m2_mkey_2_pwr>;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&i2c3_gpio_expander_20 9 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_m2_mkey_2_pwr>;
+};
+
 &sai1 {
 	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
 		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261023-b4-imx95-19x19-frdm-9455237304dc

Best regards,
-- 
Sherry Sun <sherry.sun@nxp.com>

