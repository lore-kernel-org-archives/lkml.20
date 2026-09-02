Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978038DC40;
	Wed,  2 Sep 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331177; cv=fail; b=uaYGuIOHFjQM7rgpVLpZUiTmmvIkdX9EQaLKhwPY/0iuKZLCHOTeZ/CmY7103PSDmlZSl7LQcI01T0iGB0jLgqwTbIBhV3chF6p80xy908/DBfUNEUEC1aWFEMjrYhmIiphKfTxrkH+f1BBaurNjkaHpbx60y5AXN9BpCa/eXYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331177; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ksB13WQOKicJpRmO/moUd9Bqlno+8uM/uFkqmkD5uI/Ek41otcCTYsoCbjkxhdPQyCyn+OrV3dErMxj78ClayPvRldBD4a2cOT/ZuJ+6rjnb2VHGgoRZYCQ9xQ3GRLk2VLZ2OAHte15TygpP0qbIE4BNuK670f5dXz5NsgHwjYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qFIWJeN9; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qFIWJeN9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFt91oUecCMV9AVN76w9CPnphNxKzTr5hK2fYDzqaVHW2rvWr6AhDWsBY6v1QL5jXbbBvJGHJbbNR2y5zI0AmXsBcheST21whp1IvOewueQDGTmcGQGMB4yVKHL8GQ6KjJH71bEje1nIBgMTtAUBIzQy4vzwcOdYD0/Cn615mvabchTuKIfGkwWRK3oOPWlsrxDpcwq2FFvSc7b7P/mGc+f+50/ZfFpYMipqX5WZs8t6X6RrIQpfiWHketrwQm6LfYXlulenOkd7+AkNjJ0pYT2yL4SZQm6V6ZfMtwxpHhrDkRUJmoH2dP0Z1sKUusAQw2h3IwmYhVcuvsZ6pXzhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=aVdgU6vI9viqcQ/q5UxL5iBAQS278o/KEU6wBCVtqAc1DfPcqfl3Z8lWZB/9ZeBd4HInkW3Rp6VApSi0qza42qmVWwqWuZdAwedEGcaUpvKgdiZkxDKjMWR6/IJl9eBqcwfQGJDHAbNeKtO1aF7UQ0dK5LF0M0Err7ZIY/VzcgiCrX16sq60cjY9eNtyRt7v1NwnkEx6m/TVDOlu2Ub1aoShxmnoX51Oxn6tHBuboksC9EeoWuGmuQ1gJRfW8PHYMpig4JRF4A18CBY66gQllmtZqqZcylKQp+nFqeBX8vHd+AZ3EXZRawGXTPV3wTmdttQuV0C5Cdc0zvysSXbSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=qFIWJeN9H7zPUQldCetls9lQt86Cj2eTWYmArZk6815lsdNKkE3DNm04cLhJYqKBz96S+ckq9aeVQzbRZlzWdFD5IwBODN3O0w2knNLSt/RS5fMHyIZCXE+7GIW53FicNOt2ZEFjbo5x4Ub6p+FZqM2x2kZ4BvsrYHNhKqiKCRZ5ubai+IDJHUYkEzp9ttVgVwrA15JhE7FiP3BYcx7w4+OCSizDOusiGv+ls0j4aJq1YhH/x7I/ugmHqSE7hME66pwje94gCpb+SccjAChpOBH5K3MrcE9tmkYQX5GVOQ6rqLH6HAgajeOqJR1eFIGvNNtgeQi++q8hDdFUtDk+Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:39:33 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:39:33 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 17:38:59 +0530
Subject: [PATCH v44 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v44-7-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
In-Reply-To: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350933; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=aYVFSv6Nfez84eB7rqd3/btlZGleynw/Xxm2mRPyf3eDEAN+IUCK+BxMYiqG4qGCW7CR4cKf+
 78BP/6cgvwKC7zljQFvJCwsJJAw64RvtAPWXEjUr2S/785j7Z2gfMqH
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d580dd6-b4d1-4ef6-73a7-08df08bcf2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|11063799006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	0+IoyURMPeyRzSRRz0hnbmpO2OTmyocy9WtHzNin4W8SI8KLXFhVKETLCBQ7EtxKWnib2G6XY3TQPhrCpq1GPPJiRPEa69DBoWGmDLVFwhK7zQPTNN4SN6FTThE21CeRKVjpjmE4f8vOrwPPzbEVoVZaORp82oe2Ae8kaYZwE0IrnhPlNfvQcjtFAt7PiF7lX0rz9ufTj9tlwsq5x6v6YGkR4i7dYB83IycdQwgvzrP7FCm7xZ3PFhRYONxfjC+NYefXB1Fz651d1GUs5qZpVKWxBioFrQsVPhjJWvHvxDReiIdGaX7nw2hBUDUNu03e7WAD6cmH4pBXR9xz4eF2kVF39SQ8BdrXOnZkTp2Lh/KXVl8ybZ3gcNENH176G0Qh7Y33P2X01jl9MpFsvE4k0vIrynnGYem5rD3dXk1Sp9yNle8VwoQ0CTKuUybTdoWHzv7Fn+evW5Ew6jXu04MkSBtjqlktSswOXtPmUdV1cLx2+cillPf0ge1c+BzgGBp4SfamWKRohmRnxodmECCQmdIWThpRE/w1V9rm0puN/Wg7KapYK+LV6CrtbrkoKJq1nI9WQXrBtxGBt3bnEfE/CGiV2k13NPiua/sFsyezkoaRyMCKkHj3uJZDaij4406Se7UcR6llB5W5ZKSzae1Ptq5orm/t/pM5Bjg6AGOS71qI4KPUQdsAcR9ZdnX12WwgW2IKwFOzrGu1a8jShiM5Vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnM1WllQR3phUWVYeE96YUdaZklpZ2lZTjVqYXlvdmNKTlFZQzUvL284YW1D?=
 =?utf-8?B?cnJWSytLemFPNlZSSUJoSzZCWUJBUEI5dGlaTHgySHVoRjg0VWdBSW5NZXlL?=
 =?utf-8?B?aHc0a0JlZVFVd2t4eHRibnZzTVhoYjBVTE5FYXoyY09rSGVqaGJMZzBTOGp1?=
 =?utf-8?B?ZjZIRmoyNXJleHdJejRiakxMb2lFLzEyZ1l6U1ZNRWNBc0JwV0cvRmM1aDRD?=
 =?utf-8?B?Z2pRTjgrZ21mS255SVZPS2pqL0pMelNjVUR3LzBqYU1OZHhKc1daajdmTm9G?=
 =?utf-8?B?c0p1UENJMmFDdC9iVWFqVmRvYXZ6czYxZjVWbUMxcVJqbEJpMDRGR0swa2VE?=
 =?utf-8?B?Y2lTL2JNOS8vWlVSWFBBTDMxazFrK3FYelVSUTVnLzZHcUhCQ1N5d0FManRk?=
 =?utf-8?B?TG5BcklFVlNKOVJjTlk0SWtlamgrSEd2VTVjMm1EOHlvcFkweXdXSjdSOWVQ?=
 =?utf-8?B?QVVRRmFLMWRFZ0RKK0JWazVuM01SSFZGZko5SC9pNkgvQmNSeXQ0MElpZkJi?=
 =?utf-8?B?TmN5eDhMbmFMTzIrc2ZVdVp5VjBzTnJ1TEtsQnFjY2JFTEdsdkNrUEc5aXVu?=
 =?utf-8?B?OG5OVjJtTWFKalVLQ0VIWnNMWHhoSFR0VGtsZ1FUZStsejZsSlplbEdocm1P?=
 =?utf-8?B?S3hueEJZallmbkdjOGhZeW5JTURhU0laQ3pQT3ZKTXlkeWI1VUR6M0NtV1VU?=
 =?utf-8?B?OGxSbE9sZGFnZ1MyM1FzODl6bnhoenFOcHY3d2crZklQZ3NmbGNQTTVEY3V6?=
 =?utf-8?B?WGFiYTltc3YrSlJBZ3haSUs4Y2Rhd2R5M2RmWis5NXBPQlkvNE50cmhIMzIr?=
 =?utf-8?B?MHFha3pIQnIwcXJLWHVQcUNpRExYcDNXbkRwclIxQUphalZUOVRFWSsyZm1H?=
 =?utf-8?B?Q1hyUHlDdkNkcW5ob1Y5S2tja2wwN1M4NTVESnlKN3NzSmt5NUsvZnZmL1Jh?=
 =?utf-8?B?TUhzL2JuWjdURDBLVGJreks1UjBOUmhRMXN3RWxGS0MxOEhrN1VHKzJOYVlB?=
 =?utf-8?B?NWVXdzBUcHYvKzVaTHNMRGtad1UvSzhyZWg4UFNRNEg5Zk04elZkZldWUFU2?=
 =?utf-8?B?V0ZjanhIT29uWXEzaEtUYUtKR0JBYVNERm5TK1NjbFlNRjRXK2Q5cmloUjJ5?=
 =?utf-8?B?K3RQNWhPOElFZ2NRak9wK2NwcWZVWGhqZmtpNUVYU3lSWm9QQlJaajBFOHIv?=
 =?utf-8?B?WGVKZE5LOVhtYk45Y3g4RGh6OUVKeDc1WDlLUlhnMXpPUGNWZ1ZONVJLdC81?=
 =?utf-8?B?MDhvajN5bXhoZUxtNFBFQnY1aTRpNytNMkVaMEtBcUNjWGtKcjlLYVFIeTlW?=
 =?utf-8?B?SGFXN05rWkJocFppQzBqRy9mczRNeGM1cUhQZnpVMTNzWEFiUmhpNjIvdVhv?=
 =?utf-8?B?NktBR3hGRDFlMWt6bHNqUko5aFQvV0hQWmlqTnlPUDFXTzF4MzJweE1BWnR0?=
 =?utf-8?B?NzhxN0h1aHNsd0VUeEl3VUxRc1h1MDRwZnR5bzJwbmdhM0NOZXNKTWROc1lz?=
 =?utf-8?B?MUt0WldnY0FhSTQ1c0RURUpMVDRHN08wVVNGaW1qYlpVcmx4RUFkZnBPZ09U?=
 =?utf-8?B?ZDkzbVhOL0ErSkFpN1haYjgwWEs0S0Z1VVNzZU5na1JQWDFzbzYyQTEvNFg5?=
 =?utf-8?B?Rm1CS2NlV08rZGs3SVByZzNkeFFoNVJmSDlsS1pEVjNzbFc4NjV4eVlzZllY?=
 =?utf-8?B?TVR6S2UrQngrb2NTb3B5bEh1M3FBT1BOYUx2d3JDekVhUUN6Q2U2ZmRXVTdn?=
 =?utf-8?B?OW5henMrMU4zMGxBNFNWQ2dMUEtMWXhoWXZmeU1uOTNJSlpoUkNkVkZvS3l3?=
 =?utf-8?B?RmtiQUdrcUFHTXN4LzFMcXRYMmNyd1NQRWFQYzc3OU9JM1J0Y1EwYWtaK1px?=
 =?utf-8?B?SFk0SEM3aHRjY0t5cHZyU2J5cVRUWVFKeURmTkF1cmtsaDVTRWxkMkVqMTJu?=
 =?utf-8?B?Q2hNTFkwdkVJanJiOXZsQ3NSRjFIa2RWbmV5R2pIb1h4Y05CY2lFOXhmOXoy?=
 =?utf-8?B?b2dib0dIcWZ6b0d2ZEV0TCs4Q25VdjNaVldjd2VjZENUTnJVN0NteGk1QTVm?=
 =?utf-8?B?ZW50My81UmkyUFQ0bjVvTnltVDF2WVA3aUJJbXp6MjN5QXlJMkZGYkxoYVBS?=
 =?utf-8?B?cUJtL1JaRTJKeGJOclYraWJzY3FmU0tlWENlV3BrVGFqSERUOS9FR1ZmNzF4?=
 =?utf-8?B?VklZbnZXdWUwM3FmM0daSkhlWkJqMU9POXdOVjNUamVlVlFvaGVncEFsZEd4?=
 =?utf-8?B?c2hiS3ZmYmkzWHV3bElvL3lQMFNqTUVXVkZpbTBnQXkvWVVHd1YxMkNPRkJv?=
 =?utf-8?B?VE8xdER6ZnRHWVFFWjBmNUZkVmNyYlRVaCtveWhlQjBBTVRzeW1DTzNhdnpJ?=
 =?utf-8?Q?Q4lhaW69PWsI71Y/fKpZU2jDt4bMjY9JQ/Yya?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d580dd6-b4d1-4ef6-73a7-08df08bcf2ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:39:33.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICWVj7sQdF4cB9kFnmAEMwFqbGQKd7C6OMA7WkQOM5hBlRq43Tllgv8h/6thfy/3uxn3ygPb5omKAfIjnDPzEkOSVpWi373pYNpr5El+tNGyNLR0eEglQzcxOr7qwfGq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

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

