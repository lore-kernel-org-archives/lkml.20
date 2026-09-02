Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE64AA41E;
	Wed,  2 Sep 2026 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365843; cv=fail; b=oeVq3DQmwIMtsUsEZ1FPeXNMYbGlToK5M9W2tU4vE/d7C2KUAxo5NEpXwt7uLNPBDfRh7a0WC4dy2XcO07iZNub5elmJGFi5UUWxvq6vmycOoGlJpkM9J49kDgj9lpc6OvWa3ENAgzNQ/ByBXrThXgtpz4PtqS4+rmGSVJEJ/30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365843; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RQNm39v4q7QGpUPJoscbKICpVGRl8RNuyVC03H0r0X8nCVQ5JCYFk5QoT1LDiw3g8zgts50yEV3hH/z+8+riv09vgjDY56+VCcUYFRSJm8GpTAg+V0wpw7Teu7x/bTpEgaUUYT1Ibtooh6rmFWt35dRiS2wfyj9tLY2FfVYOn+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TWXSfH+z; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TWXSfH+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YopgNsceZHoAva7y6m3pkUQ8SbPijDtc94XhbVvln6vcpSZxSW4DrUl/ARAKdtVP7zK/ojOBUI+uwu84z1KUqhgHWfaqTgv6Dti+8RCVFqBzhXXcMHBl5J+Srncqt6k7vc9Cr46AvnSNxnLP5qfk7UYAfeY1za58hWyLoQC71XaQSOkatYV4KKGG8QRCbCGbZWfTi5g8sMkhf8+yCk0pQgV6zRpWnCBfwak4bL8d59aA23FrTxr1tuc2kOGA7q7WEXxioAJh4BWeek4WFCroLashaha4t4G7gDBSb/CXbwDQJ8rACQoch3pGSOKFninhMbAEGGYPUKGUWP5AnPXBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=mTcDIeXy5YXCzWjQubp7vKefnpTfr2Vuiabe32YmQRIqxwjAF9SOm14+kWepkhVcxHfLap6meCp+tJJcfEgpOHkH65hSxYHiWMv8QiBnM7ra2OODakZa5cDP9iypjZQTs7BxumHHiOVAY08lWjEDLhyK7XHjmy2wbGRfynuZFQfomWt1uFYtsTmwReaDDHoa5p3Zhq4Wsq8U0wKqSI7FCqCZZoRMTvI2qCfr0LpsC+axBJu5K4arUiuwnAA6AB0KmVKAMyxW+faf417HcEA42BCggui6b9x/KIyMuCIhNnY9iIRaOv7B0KyoACd69RPP0OiLEcltMms8aGcj37qYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=TWXSfH+zaGYRBfve1Pz9f2zlkyE/3+yiPflyVZuDGgFM1lrt4F/3jlfLahPjHAOa1fFDDXK5HuWQ4+Mh8kwbKLLNLKmKIEiYiidhlxPsMtCZuG4HIMWWilI+ZK65d8N3jjtdumKfrFcPEZIUU85owMmqBHFtZ68KZJwQGQ4n5rbizYs/cgnih9akXkej8lufRDWBwcFyckGuMvd/tEttArgKNKceEr8ErmLJQYODawYb0lVQuRtj18EX9pNr2rGaInFJBcPkUz/i4qtX/ECnVHiTq+idqgTm+Y2f0i9PBdkI/mJSrCYZ+CkC9g6qlLPfEkT9ZxoUlsxpyWI6jGhULg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:47 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:47 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 03 Sep 2026 03:16:14 +0530
Subject: [PATCH v46 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-imx-se-if-v46-7-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
In-Reply-To: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788385573; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=hp+VLHckSvlm+Oi7hDY0i9cciPAUj3oZtum9ODk1+VULZWiN6xfsU3n3IgbexpueAWNEFB26K
 K2nXhs7P+bLB9bZeVaUNHfSLLb1bL5TULGc0EENFP5jHmsnw/0qCMzl
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7208057a-3f7a-411d-3043-08df090d9664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s7X5FZM+1JTFA1zPksOxx/sL+qUtKgulw+JvFiicF1VlNrjUVoVarWrhLA+zmnHNe3RZuSuaFDrwXwge2xyqZFApWeiyatAKmOtYFF3Z8F8RcWN4s1hmhH7zDuCOG9jAU8G+B3zvKHBIzzwl1+iJtA6lK0N0jfFkCAqLWVCLJUN2GEn4PKwx9FSww6ccvAsnW9fw1lFwz02P46FSk/MScvJwwxIq5o/JM+8ZBppREmnube9NmOn3efU8hG25Z60CrJm9lEdLiiaPBSS77gRSFo3tGP50i6FuEwVqNRRYiLhFSwlO8DUQDiFimv7OTKZ9ObB5hmpedV0FkHn/FqwinZRgAkDiGYvO4r9YWWOgW9V8mrGjRrTFqW/HyIpm9wqmxa5hncxCqR0RCGTE4D0jbxqMzHHbMpUI7I3FaxCGpi4t7Ex2VEcoQdJCYUSl1VmKkhkpoH1adOW/3UYX4FHpSi4e6bg1suePnsZfZsQN+dhQ0rwlqy14PNiFJOgMU1KBKNudUHq3IYEjb8KOPxmQcXhRaGK6u+1mBrb5uqdKNqj8bU4K8M7vSfuggv5dZA0tf8ZC+IpRRQyxXGvwZHzkgjCHu0l14P++HZQDV/+I/opiFJlcioZLybdCycl7egnlts8VdKPsgN/vORIZT9UQvkJuiMQDJ1dklc4fPG5ut3FiAuTD6UjF53NkM9FjZ6RbSNbXxKqqRZc56/ocBS7nlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek90Nzd1cUFaeUJsVHBGYW8wN1BCd1Z1MmdxRjAzVHBkVDk2dStIbkpuRmNu?=
 =?utf-8?B?SkVUVkkzOEY2cTVIM1VWS3lOdDdjT0FzdlRwR0l4d205ejlBM0dvWUxNaHB2?=
 =?utf-8?B?dVhmK2pUVHBtNm1Lb0lOY2NXMzRRRE9WWEZNbjZhMHo2eVY4OURtY2JpcW9T?=
 =?utf-8?B?VHNxdGVJT3dVcUNLWThFNE5UdjJEcXVFclpPbXM2dXpPMkcvZFlvc0prZ3kx?=
 =?utf-8?B?b3hyK05CSDA0MjErM3JOc3VQT0hOK0t1a0JLNzY1UlZDbVVWZ3Yxb3EvKytO?=
 =?utf-8?B?c1k3TGtPamZSOHBrYXpXSXZndy9STjZtZnh4Y0piTHNZNEs3Qjh4SENZSjJF?=
 =?utf-8?B?OGpDZ0pKRVU4TkNPa25md0FTVVp1WEVzTW51QUVscEk5bVlVUHpUZVFQQk9J?=
 =?utf-8?B?NTZQZ1c2Z0cxM3hVb0ZvbVhRRDRtNVhSbUZPeURkRlpLNjNibEJyWVI2MzFG?=
 =?utf-8?B?VlpSdUk2YzZGbGhFM1h2REhnRlN4bW9KaXNjWVcvM3FseUxBRGpwT3BIVm1w?=
 =?utf-8?B?S2NSSThTM2EzMitrQ1dsa2x4YW9UZnFvT3ZVditoUkZ5bGpqQ1dIeTB1Ukow?=
 =?utf-8?B?U2tCU2h1TmtLMVlFSEJyeUhqbnBYYWwwbTB6Ny9hZzhjd0NiUFFUY2VMMmc3?=
 =?utf-8?B?RWxacWVtRm95S3hleEVURUF4ZTI1ZHdTUXdYSWhSbHFjVy92OGpZOFdwWU1R?=
 =?utf-8?B?VEhKOHY1SDY0NmUxL2d3VUo4U0Y3STl1ampKbElhdXdaVEJPa0IrY1hNay83?=
 =?utf-8?B?S3RnRW1zZlZNTlF4dWpwWjhaUGxseStrSDR2RXJYTDc1clhNVkl6QjFNaWhh?=
 =?utf-8?B?S0Vub1RKOVpka2VXSWpxODdSRDZvbDY0ZVZDelFDcUdUdzY0LzVNU3lHT2hL?=
 =?utf-8?B?elVJa2tQeUJEd2VoYUFmdFpqL0pYRWMyV1BXUjBZckJ2aUdOcEdmMVFtTHdo?=
 =?utf-8?B?ZFdsOWZMRDJrREgwQ3NpQlhoN3VxSmxSMTFvVkV0blpaYmcyVnM3aFN3anlt?=
 =?utf-8?B?YlJIL25DYkxCUGpmNDQ3T0ZiUXFkc2p3NTUzWjVpUDd5dTg5Yzd0YngveFpt?=
 =?utf-8?B?QmpLNEttYmlUQzQ5NlhlRzlIcGZqbkdTeGQ1am96UkVBYmI0WUdzMEdzd2FU?=
 =?utf-8?B?QnNVNVZjZ1dZaVhuSnY0MU9DaU9oUVNQajFpVTNyeFdWODQwKzRZUHRZU0JD?=
 =?utf-8?B?VjZGKzZXUzNiWSt4Mi9TbjFWUlpCOFV0c0w5YU13TVBrZW1GNUU0NWx3SThG?=
 =?utf-8?B?Vjlpenl1RkZ6VmdWMStHSHdmemNXbmgyRCtyTWJtT3VkUWRpRnNpZ1pUZGo1?=
 =?utf-8?B?MDFUVVluc05zT1FzQXJnYzAzS1ptZ1FiR3ZTZ2VOeDNkZWNib0VoU0oycldT?=
 =?utf-8?B?enlXQWJ1UHJ6QVRBak1hTENXT3d0QWU0cXlRUnZaOHQ3MjR0NlVWekp1cmJV?=
 =?utf-8?B?ZmVGdWRCMFFOVFZIWEo3M3VabUEzWk1rM0tQYzlQam1MU3A4SjVtL0N1Nmgz?=
 =?utf-8?B?eXVzN1hKS1Rza1BQenkxVjAxdDUzeXFqdHdKd0JDeVBHVnJod2JTUDlUYzBw?=
 =?utf-8?B?Sk9KSGZsRVpuOFlZcDhMaW5iamRMMmpONll0aHZDcVdoRjNOMFdWand0d2Ez?=
 =?utf-8?B?NEFtdEg5OXRCNXpGN3AyaGp4OUY2VDZjdmI4bm43V25tT2IwdUhub2dYcVVr?=
 =?utf-8?B?bG5IRHJ5MzJSRXh3dVVBSkhzT2pHclVTVDVXSDloTUw2U3ZuR00vUEtwcWRX?=
 =?utf-8?B?MGs3d1FsSmVZZHZ0NEsvTTlQL2YxZ0hJUlVLOTZhdkJ3N0dsVHc1bTJhUi9Y?=
 =?utf-8?B?cGdyMTZ2U1dtMFBrc280SkpsNVlBQUZiNFJQeTcybEg3V09hM011MFFRUkpV?=
 =?utf-8?B?TkRCUGZMSUQxVDQxWXVOdFpVM1lLSkpVNkNrZXMvc016NWRNVmsyU1ZOelli?=
 =?utf-8?B?azhCb216N3VDd3E2OHcxb0NoeThpY2JLSTZUN2E3SEUrVEFTNWNPRHFSY0xj?=
 =?utf-8?B?UzlzeVZYNllKQlNSVUtPQkNud1Fsd3ZXbXpMUzNRNGRxaFA5VUJwWnF6eEFs?=
 =?utf-8?B?WWJCQnBPRGFUUzBoSFU0SGIvRDlvT0xzY1Y4OXNsSEZDeEFFZ2FvV1dOZ0wy?=
 =?utf-8?B?bEk1MGhrSUtzMXU5VnJXUnUzdEpDY0Z2emFaT2xSdXdncjFVY0NCekthLzRo?=
 =?utf-8?B?ZXhZR1pXMXM5Rzh3MkxqOVJLUjZVUmJQRlJVeVVPSXlSZklqOWd6RHBmUjdx?=
 =?utf-8?B?RVMxS1VjZjVSOXhueS9mVlR2S1ppSTNLSzB3ZllhWTk3Y0ZFU01OWlRSYUxO?=
 =?utf-8?B?SlViWGFjSzgrWStKYWdBM1p4MjdRK1RsNzhOQVFpQmM3UGxwMi9wQ1F2Mmx4?=
 =?utf-8?Q?XJhE0xmIvmtKpFJABjWDiRb6btzhhvXW/iQwI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7208057a-3f7a-411d-3043-08df090d9664
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:47.3329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jJ6/s/IkHgq8gpT63cG5ztp8lNOl3p9iqBKA3DP6vhaAYtopRon2ftqsSoqiylFKuX0o7GcOudnK6JvraheN1G6nbE46EqMVY5CqbTkYuCXkdYNn3sjerGxD5GK3Y3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

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

