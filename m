Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C547ECF6;
	Mon, 14 Sep 2026 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395126; cv=fail; b=PES8Poa6LSzZ7edmZ+mhZ4iPSic8Liis6CG7LNTXwGtO/MNFCJIWanX/JkYzXw04gTatUemsBkRoMpXAXsp2RFOwfBzC34T6wO8Nk8DUe7UmtyZ233p5Wp9GJ8ZhA/LE9sI069IDRZaDcDgjizTrwTBFaT0R39ABNqgaks5tl/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395126; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B+wJ6meBaqZXbnustm34MRf94EAhODMtXWgczh9vl6ZwZJqr5y1sR2zHbXKxyw6pUHaHpLRTwDkmNe1XpvKx0XrbhlBcZD65FBl+XkGkHxtZZ6RIH34uf85WYQfZU3v11iHF3/ylXd4u3jvcnWU/sIi2K/gZWQDWhrMXDbH3Umc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YdWmylpj; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YdWmylpj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkUmWu4fP/rQeFbaRIcIDKyyiiR/JMTOjvmudZbwzoQh+wXqsuchvSANx8TNL+jUA4I9g+wwx3kB8QN4R95H2cwF3nU5UL6EOguP0JULfxlVF50KNRlN20s3Wmlnbi6yUfVrYXB463ssNQ8nfMN5mjEh5vmm7tAu2cVN9xn2U3U0izJBkomIhjAQ4QdZmyLLcuKT3jTVD3XWCJUROVDpUZaqZG9Z3Wf+AC1nmu1wjlTlNhfNcRM/uEU0VfOXCEY2ym7ZZZ0nD9lyA3t11c6f64whhLGRZ8C/YUAI/GtaFa4wk8PPhCTUbVo2L/wbEyYnDxu/K+PLPmvotN8oJsT3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=g/b7+ZP58XnY1q8mwNEjmGqYndFGBNnPaf2bQOuwdGulwBAXyxFk4MSOvGoKolG3IJiYduNbcwnInDB80o7AQpTGHzLzMqbAsvib8Ds8qpp0cQ/py+VitEH4QdgVp/XQvsbgn3Eu84mi+qyhI7gH3ZOsOSkcreo5v0N/NA8T7vIL9itfDXVNmkHT0tE2Ir2Mg9Opu0LNF7njhRcLGY7Il8Qr/MtJRmwWWrb+aYFf3Bhxs7HB5wUtPjs25TMfv9apor/FN5MDQbdWII26OMwcTqP8V86whjJ59qEe01lEgkSS8dyIXAwNGt6NIMC99UgoFZkxaPK56L/LrgubfjQvIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=YdWmylpjZ9qgf5ipU5kQGikIQfhYhRdiNEXo8bdFhLCnXkP6T2H4KcI6lgGDvqCkSS4v5/GLoDQgYgKUn4leK58UpS+NhcOgxfZg43W5Q/hSF3XsQcpfhMz7Eq3bl5TfwIpzpXj3z28bG/cy6RCE7+8yY/pWW608WXzhynyBTTl0K+1vDbV54riJw0vEIW4vd8axjVRD/s9YurBI9eSdwGQffFPJTBMMbs6aYbicuKnlp4ZuIBuJqOiOv45Iog909HfyjzLuvNtNP/aCNSBIhwM0qWplHqW8g8s3OExICqVvh22azgNt1tq88l5LRBMc8AQc7B1ZySpx2K8s8Tnxuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:11:19 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:11:19 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 15 Sep 2026 01:10:04 +0530
Subject: [PATCH v51 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-imx-se-if-v51-7-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
In-Reply-To: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414820; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=KVWgMDZfM9mLR1M6Pt+nqxQ/woC1r7hcmjT+tyv2qJ8o8pm1aFOta5dv08X4IHaq9fQV9F8eA
 ciE097xvaxtAff0qyGHFVnAipoEGu/oPO9HVu4QZ/BNGJVhs1Ud1BFD
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0294.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: b35eaf02-7f4a-4067-d460-08df126a0c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oxgdThyx4t4oaEpLhvQ9MjG6PptDJG5pHvCRp3c+QVMMF8Hhe3WIxLXH44vbYkgU19wRLomgDGwxxWxJSQYYGQBDQHbpqIyxqvyGCfGisi/XbZoJlK2Zoik53tKCxxkxCMpblR/QVRMmZAbk99tXzhZ1O0R5rFqSbZ6z6bmOuAOr49OftZJRQI3tZ01Mnr3UoTqmfP5yUSqBTaNRpX/cN9JiB8a9xNL+tmviA9G69N/IHsIgNVIUiXg6jCV3vRtVxtvXMqvglE1SCLhcdKCvS1x7o1zr5R2qlU12Fkqxgv9B7U62QeT/7zLRlxOItp6JrWtzjHqxZizkGb3qkZ4BIJ2yko9jirbBjZhzRVdG1ItbPFcC2UmkBpiJSBx3G3VFRtNVc1hnCFsTg1qFA1YusLj4u2EMT92ldxhcxQlrMILHTR/YNo7IdmpnhxWHsgrMvjD0++M+ZVyQr4l+VNo06ansuiH2PdSXLBuSqH+3CErmOx04pFp45gfHRznT/WCHNjsJfw7gkK8WKoAfYZvdX7iKp633LV0MHoAWkGfOEPlQW+k8ZyWUzL3KGTY1DddjQ3z1Ooz+0lznPnsUZDkx5jDrLmgnTtwB6Mn+iQIe87CVAwh/WxQ71pAxHESKypNVPWweZlPeklt3AvNLBn0V3DWxXMankv6tPxCb18vhauaQJ5BBu2kcB+hpZ7SSOLQP/Gxe/SaWqzbM/ek3+k9/fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmpBdXlRUVFzc1c1RFg2Zkk0V25yUUdxcWNBb3Z3ZDZPbUJMWWFMalN2elIv?=
 =?utf-8?B?OWVQK3UwZFNMQjZybG52Q2FjeHZ0djZmd0VrMFZOMjdWazBjZE5iZE5hM0FW?=
 =?utf-8?B?MnQ0VFVzUFY3Y2NqK3pwZUZGSmFiOVZvWGhBZlpqNUhBQ2VVSHpKZStsbmdN?=
 =?utf-8?B?K1hsK0lPeVVpOHdkVThKTVVSZjRKUUtTZHB5c1lMMXFyTExvQkJoSWRIeGZm?=
 =?utf-8?B?WnlZQjRnSkRVWXIxSWVDYktjVGZuSHdtZU5qTkcyR0JCRmt4Q1RjcmhwbWlV?=
 =?utf-8?B?WGlLM25Za0wvZzN2Z2Urb2hhSjNwYnBkQlIySzY0SDNNMUErMU5vbExIMU5M?=
 =?utf-8?B?eWE4ejF5U3dEcGk0RGtDanJJbFA0WjNyOXAwUjB4R2pMN3k2b3VMZ0ZCS25q?=
 =?utf-8?B?YXk2dG5uV096T3NLMjR3NGFsb2E3OE5EOTRydFU4TGFYcXRHMjI0SHZOZUdB?=
 =?utf-8?B?a0FodTRqYkE5NVl4Wms1NXFpTm90N054cGdzS2s2TUFabEx0QVBJVm9mWUgx?=
 =?utf-8?B?VXhUODFjQU9zclZOTzFsYmplYVA2TnUzV0RTTXA5T0ZaT042MUYyTmVUc0NB?=
 =?utf-8?B?MFBMbXRMU2NTQ0RCUTBGZ3ZKU3YrOXBOeUgzaWx3aVJaSVJGU2xCNnZRVG41?=
 =?utf-8?B?TGZIODI2ZWR2SnNmbkdaN2JOdGZtQ2txRmNNMklvZ29iRFFYeVpFNDl6bzli?=
 =?utf-8?B?cmJKdjdHWThQZzlsZkU4WnRkZEZYZUttdGlsblRlbkVSK0lnZDU1TGVRR2VV?=
 =?utf-8?B?T2tpVktvb1lrVDBSOUpTVHlqdVY1QnRnekxyeHpMUlN3UzZkOGRNMk02ZHNC?=
 =?utf-8?B?MCs2TVZQa3paVzNVUnd1Q1A5VnFuSlozanZjdEZlQ3FndCtIbTZiMUEreXdB?=
 =?utf-8?B?WUdKUlZJYUFtQTZyQURldCtsZTFTbFdQS1Ywb1hWTlM0R2JLQWlsaUhvbDE1?=
 =?utf-8?B?VnF2d0dsMjNhRFJxbFBBbWhpbXBVdmRoLzloYVcxRkhBSjNqeEFNQzhUWUFL?=
 =?utf-8?B?eVp5aWVQSGliaHBCZk9XNjRkZmlHNG1wVkt0cXZRQ0M3NzRuYVZMQlF0Q0lL?=
 =?utf-8?B?WkhUb3RnaDVvcXc0VTFoR3kwcDdHdnNIa0dlOUJrYWVEVjNwcllKcm5TRzZK?=
 =?utf-8?B?NGlkSjZ1RGFvLzBDNG1xV3FrYkM0OFJFdWRiT252L3FyL3BQRWJPODlXaG0z?=
 =?utf-8?B?U0lZN1dzdmVZdVZFcEg4WnlSeU5KZ3VpcU1wZWk4MzZIeCtMNS9UVzFXZmUz?=
 =?utf-8?B?UHZtWTU0OGN4UXVwZ21payt1SXl1TUdIMGFxOVhweDkxbHlYbTJ4ak1DZWV2?=
 =?utf-8?B?Z09BMUdkQ0JZc2NwVXNTS1c1WkVCVGFwTDJnUWhsb0dWZU9aWmx1NVJWZ3pN?=
 =?utf-8?B?S2lsZFVWUTRoQ1VFcFRiejgzVXlOL2NhOTdraTBXV25LTkNBMzlXdWN6MkVp?=
 =?utf-8?B?bmg1R05scEtyR2pGQ1B2dEhVWGNaSWY3aDAwQTA3ZGY0S2VuTUtkVFBvZFAx?=
 =?utf-8?B?bndiM2wwQ21LbmFJZmRLRmQyS2U4ZWVpSHBod1RNZ1NVNEFMMHRNQWR0enpE?=
 =?utf-8?B?MXIzZUdia2dpMUQ0cE52bTYrdTBzZHo2YTd3UnZWaW5nSVpXaThtTTc5RXJL?=
 =?utf-8?B?cDVyT1JoV1RrSHJPYUZ1QVZmMU5FajE5RTFKTXQ2ZmM5bDNBbmo5QlQwYXBL?=
 =?utf-8?B?RW04UndLaWtMOHBKRnlIaVVFQ0FxUTJINkdYYmtodkhQNzdrU0Y0ZjBGZVFG?=
 =?utf-8?B?Q0dMS1d5OUQxZitUYTZFd3NQQjB6ZWhkT0tRMUxoWUlpUjducXNSYzg0Y0xD?=
 =?utf-8?B?VVpNRy9vTllYc1BITTNYWmhpNnNGalpCNHQrdlhEM0UzSjIyWkVpelQrblp1?=
 =?utf-8?B?T1lMR0ZoQXkwMmM4STlqOXhIVFQ2MnZPaFdlNkZneFRDYlZuTmVqTmFQVzZM?=
 =?utf-8?B?M0RpQ21HZzRJT3RGYncreFJmZzZ5R3FUN1oyVm1MUjIxTHdjQThPMUszY2tk?=
 =?utf-8?B?L1ZLL0tZMGd2eDBvUDA3N0ZRb0RlaEpha3hyVVhwTzRaamxDdERnaUFaRUdr?=
 =?utf-8?B?cExnOU84SHhiQVRiN0JzQU1XMHBiZy9OVW9TS29GV3hXNmE1NDN0d1JGaUlm?=
 =?utf-8?B?YldkeUxNWVlPZlJwMzFtaytXczVLSTZUTy9zVTZNU1pCcnAxTnpTRlRtTWRw?=
 =?utf-8?B?NlovZWFBU2tTdnRoVXZtQ3hvQVB3SUxIQ1ZERmRoOEZ0ekFBWTcxdG1pOERP?=
 =?utf-8?B?YWxBY0VPdE9uMENUbm1sc0h5TkNjb2ZTUlBnTThxSnNSdWdnZVlrK1U4N0FY?=
 =?utf-8?B?QjY0QnFCVG5wT2lwbm85UzJrdGsxSXM0ZWJ0clV6YjNReCtyZXdzMEhDWDAv?=
 =?utf-8?Q?eVkTSuDWL3NCo1T8RKGE4K/v3gui3RQn8vq9w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35eaf02-7f4a-4067-d460-08df126a0c3e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:11:19.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEFn147VpPSh0oXP95aC49Ed8M8ikqymEDo4qrnbfpqEfnZx1AsDMhnTKrPCZMl/PzDkYK45nmNFNeGN1FIrMEAOvfglvddLpmxg1HN4Xm5Io3qb7VRMUopQiKh/apVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

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

