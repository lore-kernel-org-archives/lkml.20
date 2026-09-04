Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE58424D7C;
	Fri,  4 Sep 2026 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503234; cv=fail; b=U4ZxPCpB18X64ntSqq9bDMUe6yeGri9LAbR5snijrIEwQb7q+j8zk8Fpdk0UtJJr9O3ZDgYa47Sqf8GBIQGIj6lSolqJLCujOoXP9Oc0gfIpIe2154UGy33QxUDLr+Va+/P2bSw1ZFnEuYWM8/vlNoDLg+pDqLzEhaM0x3qYGYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503234; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WvPXL+sLBDoJJjgwQW3tvcqZXVKmCJHYjgXlS+EFXpi/3h9nBIHbjp8NSaSot/XeUX5BtamuYQPQAYaPym+UsNWSlDaZN0k7fNH/JcKCW/yqjCwhbWIp0lRG6fZo7RND2CmHyT1YcwnCeWkIZtdfsuA/+NWYr4Cm2nE3nHgqb+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OSU3AEhp; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OSU3AEhp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av9PHucLcx/yNjR2pz4mftYt5MlHlkE5sboUp0lars5cogvKdDjxZbsY7/qnb+OgIo9M4NkmB42gsLiWEAm9o4QPr7ptt3cQOKuMKGfSHGwh3H4D//TJM35roBAKtEKrpYlIiZ4WoveVAYGoj4KYUTLHMxQXXeOi8+FVuL0LRVFNAQvlUQb50G3kikDl+/Fr0gmgzPgMX205a3uGK7yJ9MZMzZERWlu4TBTDCU7cNOnl6K+day2NRCuJoCfwZx1pElOzVel1uGBXCQRtgbwmS0L6/1y8BWFAGiUEq3KB5YEr9HZ4NK11EbUe8ywDqMSQRUhfBHnsUpn7LsHsyH9+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=el61v78wkHbgnEEPj8lGZMRxeIP8y+ORu3XV95V2HFv5hhyKeB37boyaKxKUMfbyAQ0c25nuiIFSV1c1nHY87FktywLwu7XHbYvyAik4U1piNNIDQl5H7EQx/s6KJ27DTDOU0T9e2s8YQU3U2QaVOvndBMUQagzfMa9DRpJDZuzz8m4yAhGddhR3BKEYlerE+8oEQk1bnWEsx/zT8i9HgZTayDuM4c7jkFBBq2OxGbytRZb1zYRpu3vinwwXh8G8Uwkr6QwhGQ2sSK/pg7Q1f+7gwYx8fFA7h2rG3TR+ccQkVKoDtAa2BBfWVBEb+SWFmI7D6DrhtZr/NANCDl1vRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=OSU3AEhpbXlp26N49RV5joPkF44lQ+hYEcC8StQsd25cYvwl+0UTK0ys5wlId516jpb9Q8d8Pz4EUT2xu9Qjf7ls4w10KQ0rAnm9r0uylaVlcZQF042Wk1Sho46TjLj5gdbBtBRDTF8jKHLWRUqEQi+HkbrGYetfkUwIIufthYBnJ/sXXn/RVGAPRRxO8Dq8RnIAlaK6CjCTJdMbb8N1O7u3ATNj6nkYZ4Ovhs285w4hd25cNNqF+fNPaGHKNcIcbd6eHa1h9Xyse9c6oF/L7Rw5gVCFkawI9At+ZB1eusKs/PT+eC+QS4NUc2KLOjxhOv42CuxpqZBXsyKD2lH4qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB11395.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 06:27:06 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:27:06 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 17:26:05 +0530
Subject: [PATCH v47 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v47-7-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
In-Reply-To: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788522985; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=qnbuuU4nU9bn2ruLR6s9l6uWbt3z//ZJo5hPrsQGhNSA/uqxljXKGe96D1dqKvEJ/dWySB2eb
 KMqDIGy02CuD2vLbfkXeAD/wKO07FGrBLa4s7jrIJnj80h3WQ6iAgf9
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB11395:EE_
X-MS-Office365-Filtering-Correlation-Id: dab7fb1f-2993-4e05-d85f-08df0a4d8a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	6j+HIRFxDtQU4XqADwBS4MG1sRMT/LVQoyszSLEucR9beTbg7QJ3rg5zRU9wooup95TeJ9fBJKp9Ow1b7JUdpplGBqud2vKXvQo8v5agyBCPDM8QJWptv8tOWoY505OT86ByVMk2UzhWhi8REVtIU/T0ZHVsGkzxvrO2xuqaPyduAUWWod4uup4BF0YtH+/G0rzgOfvYnRi+nHseWV6mo/OzvWGJKinGSqIVOt4hAOvOU7lzCup6kuaZY6jtbeToAzZ8S+YZBgVU/etSRBmsy2KeOv1N710BvDfkOB0Ou/ZoDe+uq7sEDaVV3MeZ8Knq31N5J1dKtIbOVabInAmZgLe4qiGqQ+/IAyMJDKV4u1rsFsREpuqNxSfo6XmH0cCug74vAdm9tk/PDlgXxMYSJLmprAH/a+lRiBJHA3lpuWTPUeEGrL5d+0lNrfWPLzqGuDzgXfkrlf7T9oNpO0YAK5KWGTJ/pJsqEz4xDAzmqSJev8j2U6b8zYU/GEKzRObCejSAOf6q4oeOk8riZlVtxdY3DPzbpnbUEusYsfWBKm+dD35Mhvi1wYx64rFt8W1quQrEGUY2YExbuq9wMGR2sd6YG98VUqpX9uMiIeYMFEPFimgUk7PsktIenCD2u6OmkjTPsAyHmxZ74o7p9wi/hO1V2jQby5npvSo7T2TNxI71ufxe/ZOKp15DKoV6hirRoyAvOrHqo7EjzkLA1gZ1Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWpHcVBzdXRLbTVJRkdkd2ZrdjNBQVhlMzB0M3BHaFZDQzBIMENOZjFkTlZT?=
 =?utf-8?B?ZGZWMUQwdFI3RVNYdnhlMzNIZjVRTVFHc1B4TWxqNW5lV05TKzB0Q1Y1ang4?=
 =?utf-8?B?NUlRbmtPWTUrRE9YeGtiY2dZZ2s1Und6M0UzUU5YWG9zQjk0cTdKYXIyb3Mr?=
 =?utf-8?B?am9BRzIzQ1IxRy80WHp4V2wzUGIzWWpKYUpNZDJOZ1FZbXVHN0RWbWx0MzN2?=
 =?utf-8?B?RFEyRm9uK0h6RWE3cWRkSkdsMkQyb3R6bDY2SWw0Smw5am16Q3R5d3BiZy9w?=
 =?utf-8?B?eWdQNHdyVjVVTnpYYzhQQmY4WEY3OHBQa2tLczAzR3o1SkpZT3pWNG5mclhk?=
 =?utf-8?B?aXJmNWpJSlVaajY4c1g4akp4a1JVZGhGcEJQRjZ1d2RjWDUwWEV5UXNVTy9n?=
 =?utf-8?B?L09PT3VaVkNNVXVaeFBna1dwOVF1TmhheUZlTjlmbHNsTjFNd1d6TE11Z2JH?=
 =?utf-8?B?WVgzMW1RS2IvSWlXRTc3cE5TTFJxN2dlZ0N4RDZjcmNEd1NOdjFqZEFlVEtK?=
 =?utf-8?B?ejgrZm1zT1BCb2ZBTDJXVTJwd2JvZ2ZUOFJla3JhUEFGR3RYcjcxdmxhUEhC?=
 =?utf-8?B?OWlUWFA3Z2syMDFjSWJYSEREUGtSQy9xbGZxbUpndUwwYythSGp0dzBqUm9I?=
 =?utf-8?B?L1RnNTBYb2RaYzF2dWxUSytFR2tzc0MySXJhS3lmMGMwVXZic05NZ1FmRjk4?=
 =?utf-8?B?cWlCcmtKaFZpb0pvZ1NteGNqL3FrK2Q1WmxNci9tSTNsdmpnZDNndGpIdjQr?=
 =?utf-8?B?Qmo0aUZ3TlNXdjlEWGZvcGdBUkQ0RVVvaVpxUlZvT21PQnJUWnNhQXkycUJq?=
 =?utf-8?B?eVAvWmFVMUdJNkZtb3NnYzZSbkFqTTFpemN2bnkvWFovbnZhdWphVUc0OU9W?=
 =?utf-8?B?eEE0NEZFR0VMdHpza05Ub05HUGh2M3ZzR2RrMVpDVUcxMXF5R1VJRjQ5Um1J?=
 =?utf-8?B?SXJzNUpzdkRXQ0lsRTRjZTFEZ0YyM0c2bE9heDZsRFZpMWV3SUhDWm5XOTNO?=
 =?utf-8?B?aTRJY2o5cjZ3M3BsUzdZN29kUDFrbE5sOWwwM3M4NEsxd2tOVmlyQnVPNVZr?=
 =?utf-8?B?S056NElKcEJVQmM5bHptWkhGUDY4blJDNThDcXJJRTNMdFR6YlBuSUQ2dnNr?=
 =?utf-8?B?eGR6VERSdzliSEFxQXVJeVp2NHBoYmZ5VFJjdllKbHhLUVBDcXBVVmdBY0tN?=
 =?utf-8?B?Zi9hOCtkdTA4SU9NNENjeE84SHNSWTRINVZNM29TWHV2NDhLNjdZNnhsYXNT?=
 =?utf-8?B?allHSWtKMEJsUGNBVEVsVUFZb1pTcmVKQ1g2WE9BaGkvVWxJek9JTGNyWFZs?=
 =?utf-8?B?VUFwTC84bmJXNUt2a1JtWnp6YTNsb1lSQnNzSHlEUXROMWFHT1BJaGFlMWln?=
 =?utf-8?B?SXZNRTdBaW5xOTR5T1QzWmVUVnRURmJzSmV0c01nbWhJMHBKQ01HaTd5a3Qz?=
 =?utf-8?B?VTAvNUVzYlRINFllTGZrdjlSblVycklUSVZHZ3lqNTFlWW1UNVdnM3NKZG9h?=
 =?utf-8?B?eGJrcnhsWmZoNnJGbUI5djNFUUpUM2pPNnlGaGxma3ZGSXZHRkgySVdiTkNB?=
 =?utf-8?B?VzYxSkRDUVllTWYzcnF4WWdMV3lIcUo5Uk0xNHFsU0thZFFHdjk4UjJDU1JO?=
 =?utf-8?B?bjVYQitRcDM4cGU2aUFLdkZLeE9SODlIVGlRcFYycGl6ZnhuZUdoejVSVzdU?=
 =?utf-8?B?cnRKWU12dFhwL1JuaGhRRGZxR1IvdmxwdGV5eW52ZUJLalZTWGlRc0dPMmpR?=
 =?utf-8?B?SG5FZUtHeDI0V2Y3clJLalpaaitka0MvSmJQaTMyNXBOSmYrdVJhR0xLS0xK?=
 =?utf-8?B?bHBFQ2Fsc0lUQlN3ZGQvaS9KczBHQjM0TE42VWdBNjY5NEt1R0NjUkdRU1ha?=
 =?utf-8?B?UUVXMTl2VVNHcHNxalo5b0poNWZmRTVjZWlSKzRiaC80WmFzc1d6NmxNUGd6?=
 =?utf-8?B?ZEFDSjArbitTaC9nVDEvTkpEbTVxWWUyZ1kzYlBBU0R4YXY0UzR3dGc5aXNT?=
 =?utf-8?B?YzIxdWdadG5UbFp3YWpzZDN2NDQzK1ZVSlRBakpjakZBRkdua1FZTDZqaUJl?=
 =?utf-8?B?M2Z0VER1dWYxc0Q2WVFhbERRNlVzNDl1aGJhWjJlU2NlSUFFOUpxcGo1bzhN?=
 =?utf-8?B?ZnA3SHp0bGhPWjAwaElIZGZ4NmpESkxDbUxndEFMaU5YcUtBY2R4VVlmRHdC?=
 =?utf-8?B?TjNST0tIOS9lNkl6WlpyaTFidStCdzBqTExpZmRzOFdZWVkxMEN5Vm5FOENF?=
 =?utf-8?B?aTBhRlJWVEJidkVockpsbFpZM3FjMnJtZHA1SGF3RW9rUk85RWE2VFQ4UWlu?=
 =?utf-8?B?OGxSV1FkdGh1RmZCRGZNN3YzY3hReHRiR3cxN3FxWVppRFQrbjVEWmk2Y1A4?=
 =?utf-8?Q?vmg0mY1bos+9ONhEAsdPQ+vdgO3tACUZ3S3oM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7fb1f-2993-4e05-d85f-08df0a4d8a89
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:27:06.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Pg78FdEHZWZcSlxYmllFa84J0UjWmZbua28QAdGQqpt63nQKUZ+mGvZsmdVI3/lhAtu2r8rsCLr6ev9Sa4Wa+Wo5OGinJBd8rDfSRsgN0bo4aCJre9jA65Gp2oKBRBr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11395

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 4b925832bb66..5fe58a025cfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

