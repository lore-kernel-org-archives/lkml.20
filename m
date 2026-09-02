Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D3385D90;
	Wed,  2 Sep 2026 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331147; cv=fail; b=UHAReQImqkmkoIkec3U5mm3LomCxeNws02Zx+F9ULGRDFlkl2JttTKk3NO3SyiWlG7DsaM1Lmfi5Y8HxJ1C0uiKl2SrBvPk6TQnjds18D4Z6mBby+HjmEdh5pL8z6HM3Ec3DJ4GG+dKHtdT0HNRjhUIN9u3SzoJ/uG7igzzXjRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331147; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QfdFXZ9K8RnEAV5FBxLBZFhJgQWfeArUimTSIiMxr2LpOf+k4nVdyYG9+VbH0xudth5Kofmo8oRNDEo354/jTfeQkfy14/at1LkSOmmhAZfZYkmZ8tTMdxkm0Ai3ztRrgIqVG7Q/+Mf366ZVS+xZLV1GjI81Q/jzOy9W40yimQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JKHcW3hc; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JKHcW3hc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WExw6XdALFCi0IZbQjn1+hAhOINKbBapidtcng1W4dSlyWAfr+isYGjekMe69aJOZ9CcYnp4yCfBMC/S90Kle6bisf2+YLucebMqZiyOavcXaCY2MGiWZ3a812iJXzoZSaDNwreQpwcbd8BWC9YKAguCtmwsEUwejZO5Nq7d/O2U8SNl5k76YoDHTowN1b5IZmUpASSeD/EeGxMNy7YhZDPBzj3v6KLLnsZg9UxKP7yFykx+dxJLG+ppMEIWkdR8g9Ch6tjMc610+phrgkRTxPJj9TwF6gi7SUA0jJJuyWB4KI6tshR8GslqRCCy+2BvwGiG9YgTPPstgr5+ir5Z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fF3oJFY4qyP+60YdwyTZxaiugEhGwFalJ3UJ8eftFD4UH0JhfEGyY9q6AafzRm2o+NViRiVcBSq67UOfcNs10J4JNlPJhpXPCaiV7C/+x/dDBajCAUiBINpAujfIpnTh5nqG1LTrJlt+OtyEeHmfbVyhn89fcx2qXUu904eXMaV1sOrJjFy8SI564lhCNSAVJ4Klc9/S64Hy02d2GLN4379kJPUxsV+l+652ydrzcESnJpmx5OiOuu0gTUhGlmmmzm2G9CGtyQMe71WDzQqa+n3XwhUsZoBID+4MyM/Vezu7y8HUdg4876FZAuaUf3O0dc3AU0YG7OcglCk5MbqHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=JKHcW3hcgQpTdBjNRNEJ9g2Ekx0Z1/NRY4D0xetR06DE/Xotc0lvjltumFEMGzTshPFtBTTP+MvC4rbVOob2LuplvTsgaoZAMErrtUm0YXVHszPSCsciivrZMDwzRvzOjb5VjlvP3L6dKXaZfszOUkwxmD8K5APUx+oZjGMzUJW6dCnY5ewjaUKNZO8O4MncF2/AY99C0XtIh4AVs9KqMarHp75SgMWVN2Mu9ImROmYATdwoinfb1Rb1R0ib86TLQ5zIee4aQSl8yN3/CUGC6DaDeGYFP0UHpHRxMtGHKivBJxjCmmzcuwG0PTDFKljGrXbobnNYFGMK4ae/4SbBuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:39:03 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:39:03 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 17:38:54 +0530
Subject: [PATCH v44 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v44-2-104658bf941a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350933; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=zG+5ZCLVQlAW574Nai0nDh7uJqjHHvIksCx0FkRSoxPlI6xqsSqMqNXbdiN9WtJj62D5T0N29
 IwbqjSrn3khCM5urYRI9BAR5AfBA0zkhmbCoX3SXfLDTE855d3s3p2j
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:295::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cf3529-771b-4902-bada-08df08bce0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|11063799006|6133799003|10067099003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	7IbmSd7iJ8eZD8XaFwncU/8Z7nHxRJ21CgYBcBXs2RIEbz8Qz67lkys8SR9ExA/jwDfFYgOplyLbdDeZqMjQxdDJPmTDXgWLtEE2w5xcaqCIbqkExM7ZEvLG7Syaxk0wVQWIVu4akSTceYDoCnCwYsWycJrgGvS5CpErtsw7+6qf9qvjwOeg35xI2I7q8B2/K6rPFWDSnlo2JGRQYuxCi7PUm6ia2mNLx+op8FxJupb6p9KAShHIxjLEHe2HlBrbUSdQpb85BhRTeAAWVFhTUp1qWdQLz9f97vl6pIsOMjeA+Ydmy60qmzNYfZM21c+0YDVodJWzy4xDY7Z9dZTN6DuJUYuh/I1eJoDuwwN4c2ySYkyrOvhIkIwVPCfr9DFYNCMQV67aMP98/PVUbma02l440p8fmwvDrdiOl2LZ/U3sOYM8dtPRQl0X40+zq9rXGFEwruwM8vrZDC6Dke5yjBjY5nTMILJV/x1m/QUwrTelt1uLS4RsEhKJVHlH5AgtsItZ8skawzd7o2eykjHpfz3eU9ft15nKdMJRchsYkz064v9mNh4Ixoo4zAvTLDvr41pk50dCndItBEgr8PWFqmgogXiGJ+FtCmYwA3Y24KRkLbqCFCZ8TqnSF0DdWiSQhP/seatdNkc7dyh0GC4ZhPQ54M+Wqkdj2Aaxf3bx4ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(10067099003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpSZy9ob2FWQWp6SU04N1E2NzQrc2IyemNtVjZKZUdpb3lNWTZKek4zeTFi?=
 =?utf-8?B?OFBRZ1FSNUpFK05ZMld2ZUhSbHJyOEc1M2FybE5VaGxZQVVBNHNNN3RRSkpB?=
 =?utf-8?B?dnlGdGxQRjhJOGhGeVlsdmtheXNQWkRCNDZZdjNGRnJuMVdUUU5rWGJmck1Y?=
 =?utf-8?B?Vml4UnU4R0FQMWM0K1FTS1JXMXVrR1pJYndwMTRzeVlmQ29MdlBDdUJ5RkVm?=
 =?utf-8?B?ZS82YmxyblV6ZlpkTWVra1NUVFpDUFJydC8yVFg3eXc0MmRXK25BWHppTU1s?=
 =?utf-8?B?em54ZzgvT3lsMGdsZmdkNkIyRXFGKysyejVkRFM1RUFtOTZRdDJpWDVuZHUv?=
 =?utf-8?B?a2EvayswYmZYdWpPNUtQbnJvRm8rMnZVMSs0OE9pY1lPOXVuQS9wTGUxL0Vm?=
 =?utf-8?B?YVArYWRjZ2p1bS9nOVE5UENzVlJNNzVJQjNqYUFGV29UdnVoeXZGVzB2RTY0?=
 =?utf-8?B?aHByeG82QUJrN1p5QkxkYmFmcVdCYnRybXhqRnNBNUZobUdXN2VWSTVuS0U3?=
 =?utf-8?B?L2R3ZjBTYmpZVzNEOFlya2RUNnVCZUl5TkVBbVlnYlNJS0k4a25LVEVXUGlO?=
 =?utf-8?B?YkZoSVZPajExeldwMmZwNGpycjVIL1FZVnFDOFRxa1gyU2ZFSHgwUk85MmFy?=
 =?utf-8?B?Ym9VVG1SMXJoYjhuQUFKRXBSL3VPRTh0OGNZbzZWSXVHRmc1WnNJWFdHUWh3?=
 =?utf-8?B?K1FMWkt2elkzaktvaStVSkxFOENzeEZES2Y0MTE4L0ZoNTlpcGVYMk9DU1lp?=
 =?utf-8?B?SnRUYVF2a1lKY05adkxkT1J6SzRuc1JzS3dweG9EY0EyTEh2aFkwblFKTUht?=
 =?utf-8?B?Zm5EUFk5K00zSVl5YVNWbUFWbjNQaUh4c0VHTno4T1dGR2lUSTg5VUVMZU0v?=
 =?utf-8?B?VVZPYVlMb0VXM2xtYldadUQxTHUvL3hBUXdtZXJjTkkzU3B5NUUycThrSnZC?=
 =?utf-8?B?NGZhWEVxbVoyWFFPOHB2Z3NzVU1sb081cUJuV0pJTWM3cUVsclRJREg2dVRU?=
 =?utf-8?B?OG0zdUhodHRUQlZ5NUJ3S24wOU9uNkdxTlpkc2ZDWTNpaFc3K2JpZU1UOU45?=
 =?utf-8?B?NWNpYXlFUG5WV20vRGsxZUhCVGcybG1pME1KR3FpRkF2ZXhYM0RWNWFjTGNY?=
 =?utf-8?B?RHdBS1BjaDBsNnNqVFRDak1SV0hTdEVZWERMZUdUSFBNU2ZEZlQzYS9zU3k5?=
 =?utf-8?B?VE9yN1EzZjlidnFhM3lML2d2Y3pydDhoK3hUV3RFN29kWW9yYWFuM05YR1Ir?=
 =?utf-8?B?SjNTcTBYRGxkZUFsck9TSGQ5NzB5bUptNU5SZ0xUOTBYalZCZEcvaWtOQ0FC?=
 =?utf-8?B?ZVVzU3RNWXFhQVpQSlN2V1hyMjQxbzVrOXFXVVgrSU85dGt4L1YzWTZKUnVa?=
 =?utf-8?B?UTVkQVZSOW9sbXMxS3BydGx4bXBTdFdLTHdSTEtwWGhsNUQrMGdseTBUcTZF?=
 =?utf-8?B?bnZGODNSZmQ2YTRTZHBZSkgwTVBYTVpGRm81QXlzR05SbDJ0YkFzcmM1aTJx?=
 =?utf-8?B?bXptNkdXV0ZxRVRPcE11eHMyN1Z2WkNqa2RjZW5Qd1RabTRmRzc4bmMxN21s?=
 =?utf-8?B?RytlOVFDZk1HZ2NFVGY2d0xwQlhLdzdHZlQyUExpL0drd1ZsUGdNU0xIZXUv?=
 =?utf-8?B?djJwMHB4UE1ESFMxS2hZbUVUS3FpTWZLczJnY3lLNk5QVngwd2RiNndaN2Vs?=
 =?utf-8?B?SlJpQ3RzcnJGemZyd3N2UmRwcTJHMDByY3BJN1dHS1k1OE5JVVdYRlprRXNm?=
 =?utf-8?B?K05jUjJzT0lTTm1XSXIrWHR3WW5UblJhYzd2M3Q3SzE2dDF4U2pEa1NYaEdi?=
 =?utf-8?B?d2dpV1pUVXBEZDJJWUxsdlF2OENkdENjZ243QWNkZzZMRlQ2ckMxUmZlTmF5?=
 =?utf-8?B?akFpWW9XMFNsbHVDL1I4aDkzUlhuMDl3YXNkMk4xWnJSRHc2cS9VSEdUWDI0?=
 =?utf-8?B?enpvZ3RaNlBZejViRzhZNFhrcE1yV1Z2dkI0Y0VUSGgwVCsrNHU1NXlSUTJx?=
 =?utf-8?B?dFZJWUxzV0x6NDExclkrZXhRNENvN0U1WExFM0NPWmpieVhFZHEwZmQzMFo1?=
 =?utf-8?B?eFdQZS9CVU42ZXV5ZnBrdXFEN294bmZkVy81dlRkNE10c0sxQ0RYYzBTaTBz?=
 =?utf-8?B?ZXgraU5DQkdKcXc1Y0h6a05JL2h2alBGYTNQU25SVDhocldZWVR5b0lONytw?=
 =?utf-8?B?UGIvVmorSjJ2L1FVdWRtblBTbzNKT3BYTWlQOVlUMjJrSGFiQ0RKRE1DV0hJ?=
 =?utf-8?B?OXN4RXhWdEVHMGxENjc2alB1NmRFTVRzNFg0dG10WkIyNW1qSUUyNSsrbzlr?=
 =?utf-8?B?Q0lQT0JsdXFZRWtmK01QK3BHSmRwenl6U3Fsc0xKK2szelNkZTgyeGJCT0Qw?=
 =?utf-8?Q?Hitx1lGNwewntWoXwvSnq8wkLbkhz4+x4KjTL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cf3529-771b-4902-bada-08df08bce0c0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:39:03.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCANRktENUvXE/YdJGiwL0Iom/WrJ+AbfUWe/S5aFhJusdMxBb0FLc0QinDR4m0yioVqLSc3OzsQirlSrSVfvAVnz2vK4clwnDNzhYCTBU4kMo8n+z1/F4phR3hQ6UBo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

