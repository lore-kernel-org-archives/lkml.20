Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE7A439349;
	Fri,  4 Sep 2026 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513777; cv=fail; b=gwnJRCwXndovqw9LehkB4fAtlka0rTqLvxIOE78Z/nOzwyNUDaVCYiNfbqpZY3vAZrLmr89Gndm3Wya85/qmUhb76krVpwFvM9+ZYOtsD5+Tl57/Z5FnQ2gat0NArwpHxtbxRam+Jn2EKhtgMeBCN2H9GMb2hB4V9qOtazg3o9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513777; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i5XLVDrEknjOVsdngepGnTJs7suMUZ1I0aOYJzEDydpFaHtqu/8gFUygJdzycB2P7HJGnVkYrIVbDXzeN0KM4qEylawvLaCWwC0A+j2RqtD5T9F57JN9seOY3BtjW9HCXp3KE/P9zQkJR1CUUcpgu/PTkn6rkNA8iKxpijZ2KFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gMYD8cf6; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gMYD8cf6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U24KbZHQ/0KSCBNFo9JzyRIBpdrYraSeGG0mc23P2RitBIcccX70/lYS2VNOty/AsSGEPrTOdfTJWWGqaR1stsMCGYztCoy9Y2EC/G4eKpHv6/zpwrTBQBe6sm2sMJcCQxE39Be50kCsMmJWXTHVTwb3JnOfM/+wfiJCkSNghxTlHro7Z+cBTfEOz8wb6630nQ44SmVsZ61OlHtNZ8QxcfgO6ZlTMy3KDLkr5NfgFqC/BaKqgh8Aq5YlP/coiKEL9BQpjRjA/kw/ecEKz03hr8rrfyxcMA+cEXRuHkRb5Pd2sHXsmlYbwqcetMYS/IdiVUgoyhQeZMpqQTTTzVcmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=xGy5xWb0rDRALxPVdz2TnIvp+EC3O26r1T6+zgVsGWJw4tHFnYDY28HUi/inzuzk5Rj2tjF2usuxWolNstmDTGGxFHY+vGvg7plWSfb4biWkQwwPeuOmdzvg6JgDWxbyxsIhcRGSkiU+yTXHFSKYQ5f3oeQ5yKMQeQYNIUausf4v8lykBoQDZm09mp1JmswtFfX2QXFmfXIwJkaSCcS3yKOOT5HJtYRUGTMuMXY0TVvmWv92gqmmgc6dI9GNgtivqSKrVKYTULKb2fjK3PkcYi6aC908UD1D6J/QtnF2KmjXD4I4awPQ0EMH7FMjswbXfqZKk9B9Wc76VcXKAhiKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=gMYD8cf612dvF2OZzQJJBOQfX+00yXqDl5aCeOU/UBVkV+zS8d2HR2PDVhm5jHdMOeVy0HGahV/XBTG+bSvqhsgCIL+fLz56aShy+Agqyc2ZQDD8KkArZJhgeoANFRmyCOQmf5UAGTTZIi+ZJUij8uI5ePUrya3qLxWRS2OH6Vn6pPudOyP9gQMlnqBckwbM25JiK9yztzP/3MpwgOcUbbBiZdsfKv5Z0OI9ojGA9j0fFj8hHlqNWfztVYjRGP5QllDxgr5t2k/GpLyvNYUsDACxb5RtikJ4dH3OHmZafD14QbhAfsMuMYRAIETcXVxu+wTsxuDGp/bLJHpy29rZQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:21:57 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:21:57 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 20:21:24 +0530
Subject: [PATCH v48 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v48-6-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
In-Reply-To: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788533484; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=Wyb/m/XCwlZJpIXhWE++wOsO4R1RFhSmEZlDnw0tFgv3IuYkx0N2sA2BLfBQTT9LBNTEk6ex4
 XfFaaAPe1a6C1Kb9eLCh3tPPxG6/QFKw0JqSUp1cEtTP0V8QxPMgf0/
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 51db36a3-124f-4678-ca1a-08df0a65f779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	P7IAknF0k8jxxQ2Xb9bPPIo38qtHzBpZyvPfTSB8+ctf5T+CSdDpHPZk0BjDPBsLmCe9xU61nymTSS/SVJpPvcYoq2CiB5d0KV+9Lfqpm05JHoFbMtFhYrIW30F3RD5IcqMYZFZk7WFCVrXwz1upL5EaQsBXCkLRKYF1tRsqWwhi0d9KMkYYSvedpRhQQkDyXe7pJqv8qSdeY9v9uJTl9FfHUxBahszHApix2Sgj82WzAuDApU/rfRtfREzkGbcgesjDUjqO51eo98+Q65e+P+qOLIhZNS8DhMxjGNvHt57iDJde2RGj1g2NvUOhM0tLJxHBowv/PFK+Z5CW8oOQ6neHBn4DpccF4JGBBYWFpMO+IVszMBGpppQP4Tj+sUTyK1fM8x+E1mXMjVU598Ww3iZBgsth1oi24Vy0Y3lekaw84ueJRjJkWaOIpgWuCQ540Qnrq7HZexqoad7y/zTC7PRwtY9r98RRvInM3Hn6724Cke9CA5ONRn8ZqIV3nvS/b5XSyUmXr3LBcOwZ8SHgMzFl6g3vSX87X+bVbIR8MktEguO+JGqjfX0csp3Xql4jJGFuOQCVnlpz/7SVfRudWaq+xqOzaFvCjyqel2MIyReEzgNBz80GDg2OhXjZzjoMKzr2XV7+JNx0BDfQ9axwMPlZAduw2/38vCmEmV7tYmrSjwexIvcB9LJOgYO3E7JmS4nFiIzXNOmySCTgXLkFqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cyszQU8vMGdKb1ZJZ0VpT0laYVpFZDU2NVg4V0l5Z2M0eUs2UldIUlNwZElP?=
 =?utf-8?B?Ujh1eTRnVVRaM2pKdFplTTIzbzBzdEdPL0ZmRXJiclIyM0k1Y09ZVkpkclE3?=
 =?utf-8?B?RXgwNnEySXVtNkFSbHFHT1FaekxObTd2dFRMV3VuSFhhSUFzT3lVQ2ZGd3Jz?=
 =?utf-8?B?cWZqWjNYYTZ6Rk03Q043SUZ3NURPenM5YkRFSkY2aFRPNlJlK3RBL3VPd3FX?=
 =?utf-8?B?R056cnR2bDlXVFZrdVVVT2ZoZUtkUGJBbldZTkRoNWhPbWU2VmhXY0VyRHhH?=
 =?utf-8?B?TDFjalE1UUlYMC96eTE1NGUrQW5GUnRMVE5yZ25WcmRmK1hnV0VYVjhibG13?=
 =?utf-8?B?TWFXbEZkamk1dFluMFNGV3Z2bVVqZEliWWN0NWdFNENrcmZkYUZEMUZnTWs5?=
 =?utf-8?B?WXpYTDFIUlBGRVZRMWc0UVR4VnB2SmhqR2FLeDNETEUrNFVSdWp5Z2NnYlg4?=
 =?utf-8?B?QVl4VjUzdStIOGtRa2VQbUd1U0VSOFBpQmJJTWxvQWlaL0FKUUFBZGRwNGpk?=
 =?utf-8?B?RTNnOXZrQU1lMzRQVy9TcDUvNVpRZWxEakFRdHFhNzlWTk56bURseEtzdUVU?=
 =?utf-8?B?TmEzWlg0aUxyL2YyeHdxYURwUVBMM1dPYnJVc2dDZEZuZG9ZU0ovWEsyWE8r?=
 =?utf-8?B?eWZzeS9iKzZIczZ5RFNsekNWM3ZwanQyY0hsSFVyTFNaNUpEQlJKQXNTRFM5?=
 =?utf-8?B?VVFFYVk0VHk1dUJLSjdkbEVMNTF5WjRrTk9TQ3g1UHZ4WkxtOHN6ajNjT2xY?=
 =?utf-8?B?QWtHZXJ5TXozenZQT05ublljT2FrVHpFTi8rRjB0Tnl5M01WTFc2NkphdFlj?=
 =?utf-8?B?VGU5ckxCY3FGVll4bDlRcFdOZFp0dE9rcjhRaldWSExvRnlTbkp1RUFLemNz?=
 =?utf-8?B?cStVbmUrUG1kdlhzbnRkUGd6VHY5ekJtUjU4ZFVBQzJHeCtQZTNuMTJ5Y3dk?=
 =?utf-8?B?U3NFS0tUUzJpWlpVUlpUSzRodDQyV2w4dGdndzJzajFvQWlkMUlKdlJCdlc0?=
 =?utf-8?B?QmNhcndRZ2dBOE1IaTg5dldRMFdNSlZaL0dURUxTc2NBb2dCRzllS1RlTkVW?=
 =?utf-8?B?MElmVjNPUVZCZkh5N2lxdXFUSkhzVEZZUEtaL1hkb2swdUJpR2VnMk5yVHFh?=
 =?utf-8?B?N1Bsa0FlTmNWcEk4U0IwdENVSDRaTTJWdUJFZzBweWtMdTRESWFFMWN4Vldx?=
 =?utf-8?B?L2FHMnhCQ3FHaXN1WWpMWUVGQWsrcGdyb3A4RGEremFhYXVCKzl6WFROWXAy?=
 =?utf-8?B?T2dkRkdOTS91ZXNRK1paU3pZRmtrenkzeE5pS1NlRkl6aGpUMG80QkREcWFz?=
 =?utf-8?B?ejE1bmVkUE5MN3V4M21SeWVTenR0aWZEOXBBeWpUQTNwVlpDcEt1d09TZGpP?=
 =?utf-8?B?di9GS2s1TUhzK3pCZ05lUUdRcFRHR2prTjh0dkZMZ3MzdWw3eFlLUnhKQVhF?=
 =?utf-8?B?djhZTUVMamJNeDBFazQ4eFhwM0xONDIrRWQ3c3ZnRHpJU1RxcHZKMEdYb0E2?=
 =?utf-8?B?L3ExWjlNc1JNS2N2Z1RIRmlaYkJxcHBQZE5FVzRPb0pscW9ObGIzNFlmd0lu?=
 =?utf-8?B?R1orM2N2ZE03QmsrbUExQ3QwUlZXZ1B3a1BqL3B3YmtVdEtyOXpyRW45UWhn?=
 =?utf-8?B?ZHZWVVhjK1B3bVJnZFBzZjVLelVkRVkyN0wvUGh3bHh2NVR3T1lhaVN5MERM?=
 =?utf-8?B?V1lQMS80TXVKVENpbityTVRFeGNUVTQvdWVpUEs5L3o1N3UrYU91MzY4RmZP?=
 =?utf-8?B?OFdIMVpuNXlGMUNJMngyQU1JTFd2WkVCRG1WSG5XS0doWndnTFBUa3N4ME5R?=
 =?utf-8?B?Y1doZEI1VnpkMmRKT0dwN2lGQWE1b1IvM01vSDFvREZDay80V1JtMmo4ZjFD?=
 =?utf-8?B?OTNtQWJHZEU0a2RZRTlUdEQwTWVDcDNteEFaQzRsQ0lmcEJNYlZMQlAwbFho?=
 =?utf-8?B?dlh6Z3h5MU90MmZDSUwxeVZKMWxRU1ZOalI5ZHFsSFE4VkdpMHpIRXZyN3I3?=
 =?utf-8?B?Q0xjOGFFVUo4UHJnc0ltVkZwbnJxa1U3MHFoVHBkTDQ2RkhtekU4NURvSjFL?=
 =?utf-8?B?bEZ5Y2VwbUpORnd2YkVhWXVmRTVyK0ZjNWxnYStvemI5NVQ0SkJ6Q1huZmdq?=
 =?utf-8?B?Y0ppbUpJWlVleHY5cHdTeWwvK0NpbzNQUHQ2Unk4bkNhRVo0U3pNQngyYjgx?=
 =?utf-8?B?K1RLZG9IVjdWZ0dSbklHM1F4aDRBd0s0MGxmSEIvTkRidXlnVHJzd2FBYW5P?=
 =?utf-8?B?RWhDZi9naXNBMjdpUFJvNjNVTnJDOXRUN04wVU0wcStVTEc3MHdwMTFiNldR?=
 =?utf-8?B?eHprMjNGSVRTTHBOV1RXTE5XVjI5NisyOVNVU3MzcDNlRUtBdFRsU3FxWW95?=
 =?utf-8?Q?QgKJr157o5VBDlh6Ns6jGw4z9r28lNmZpSK9G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51db36a3-124f-4678-ca1a-08df0a65f779
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:21:57.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecb4UjRJbiVw0EHjBZd1m2sLUmmwy7957macTr1pRDv8ThXF6x8umVdLLn8fvVsmDGN2rUE2cyNEecUqMzhvf2o33UJmClqQ3xEFqsKSZEv6uKmF3fPZZIKv/bVIHW1S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

