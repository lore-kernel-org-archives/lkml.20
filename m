Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769755328A4;
	Tue,  8 Sep 2026 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868218; cv=fail; b=OwGzgYpSPzQZKuCWeiuM0/7EdQ/ddCMZcax87+uShLL93y08owiOBnZSzX3EAWmmCcOI5FDBNYw8ltwsQ08T/emmcP4FF/0FCucsaciwElavxwmdBLAsA57vfqDTiqg48+5uo+1aoZrhodDCcB3hRtUDF9tqOqbrOSEJVhM+4fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868218; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FwyO8+9nMUVRZmq0TzVFj9lpZNtb8kbaFtzSUx2bR4KSjLsFWQ/kwuvOMbI83vfmvjeMY8VpGh5iJVdWJFtEOdLZRjYGmrQ1J+DP89AU6rA8yyd+MzaX97TYoPltpYyAaIjv+Zz7+QF7OcLZ6GPO2yj5b4VFiYB97eIx5s193pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XAnwZQAv; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XAnwZQAv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFeCBB7Q+WOpkFRHKdk9IgWfgyHq51PFOiFUQXFMbzUGH8T4vakIRELSjBvCdLTdwtRn3FcU+URDCT3B7ko2RafXN+4uW7VFFG9uPwg7g7/c1ma0kHQcn0aO8eGnC1KM40OYQLtLmwqIjuRbAAoOfjx/KKGI4DGaFccQT2sblNrw/1BruDdhKWGlIFvWttsYzRA4CMK1NRRzAb59tW+hSMYWoJrCkgVOgX1nh6/18vuyr118rSotMBiwi/M1EzhBfEAGpea0BtS8EkIBsHD37J+dLbwbMdaEQlEoSLt9ZDO90GrkvrvJYO6ALL4flsSjj6XZGQFCMA2jiM4HvRFHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=zRjI3P3yQIboLxR8KBtYratOqG8chqxCwqwzhyjKHuib07GtVM5GHRMsQHXqeW39hna2bUQD5JKItXUt8tMJo8Mg1kx3zMiKzXS0StrVGOU2h+tfOqYTQGWqgGNOoMkEVcinaIWhiRfL/F+fcbzWReaxa1uz91EO03tbOB7GA+YCx39HQBaH9jvAirFZ0fA6Zrx8W8wQaZHlT5X7g3M2lCmeMfIymEjdVCQshW2CBtcRNK8T8yod3f4Ih8YsuwNV2001qU48TUSQg6vSJxrl8WmD+QBwLXOo5doGxf2Z+5mwbzwsBmZ3JOFw89x7sKcOSU9b/h+7A/l1ia8N8s9efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=XAnwZQAv6OB9eLlhoFiLtleCHkfNAxBzeukJrUWBC1eVx+pdwj53UnFko2JMEYlYQerftrFNmiAThcTjOHDOSBU+/8hi7fzO7htZCGiUL+jgY+/TMiCcvmEe5Hcr2Xw38AjIKQ4DW7E7nO2iw6NVdhcGfAY8N97zQYL7rhmhYV/8T8dqTpPxaL7lVnIOWqB2T2JUIRZajUwezGdWATkOixWDUTWt4kfl5r4BJsOZhAJYuHFf9EN5S9SAAVf+HO7ORTERzgn0/IhRHjNB7UmPPxAkEshfX2gr40O5tc+QoDLoP5r1FbrcAIoyFJs1SHilhiCJOVTHFGA669cX3QAYOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:49:27 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:49:27 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 08 Sep 2026 22:48:17 +0530
Subject: [PATCH v49 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-imx-se-if-v49-7-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
In-Reply-To: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887921; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=jMFcnBeC+5r/13IaXfC1W3n6fgJvNDNZC+rnQvy9/E5scIHQNCE1ChgZRZTCA+f/JB8e+5BHY
 TjAj+qd95k1ALcS2XAPOZvdFBv+xMkC3VtN47GcO2em9FCqrqp9Z0Ah
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f3c4dd-dcb2-4719-102d-08df0d9f3c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	IxZ/gHSyU7xMDgLxqMLl1lb+n0u2uL5xxaz9+YyxaVyPJZUkqUhpXX/WqkHoDnPjbCtThGIjGLxwzus7wd5z2cN6V5p8vaQZN8S0SOGXpvr5p0aPO0MroGjwpwDHpCfZ+clykw0YyFr9btoAV21RiZxs3ULSrQQYeXUGaqfuZbeaq1dqWcr0r6pgOlZPCBWt5P7w3UpClpCyNgZIyP2mwgAt7zkYql8GJkEcavYG7052AlcC+/xxUbV0BHto8aOV2cKk4wY2hEFH9d8jNB/UUVIyf3mqtCxcyhE/NG0Ozk67veMh0G1CVpxapuu9F2qLZq083MvFeKAFQgeyoUUVfF8QlFeYq/DtDK+VJIR1slPsFb9bsfdlhrx7QpGcxzkU6dTWyS+mD75/T1xhH00aoc9ke8k7kERJyTZwOWxwM4yo1tLqlqajRLzm+p6GcZrTNSQXnKUVxWBdFU6EtmgR7XT/zV3R/SpVvU2ykyohMX0swxJ6Ed6zsrdJZ99qpGqOT5cTum5Rj+VMdDIULomJ1gHIAlmxe0IbVM9QF3U04Y82T+zIHwwXJwRCfg39YaOChjbhApEbDQfAvzcaysuybQSC7kZAArGbo2JhGtU3tyyWP7CytemoaleS6u+ULtAawxGL9wmkl91PupugDaG3YalQ5fQXO8cpQf2kLxDLQqvdGTypsFEfZPr1mx7/oSbnS8NUue3t/lJ/uFtN8v0r0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnlCN3RqNzZwVUhZeWlmVENhdW5pNFJWREhVRTJWajB6QXBTd2c1TEJ3MWl5?=
 =?utf-8?B?TEx5OWlmNGEweHhma1puYWRxaXBNVGNrZThSWmJPYWlMdWRSQkkyU25jVjJo?=
 =?utf-8?B?Y0Q1Y1pWcTFqTXVMUVhqdHFBcnY4dEZNczZzZ2F1OTNnMzFuUmFkeGY0RHRC?=
 =?utf-8?B?N2cvU0VpVWRmWjZJQVd5UDhDaXZ2VzhiUnd6ZUZZWnV1WDViY0VwKzlqdVhR?=
 =?utf-8?B?NnNtb3FJNzdlZEo1c09pWkd2eit2NlV6cjlETWVENFNZQmQ3MzJqMGdmTHZr?=
 =?utf-8?B?VXVrMEtHaHNoZXM5eWJYQitwQk1STy84R1pqTFl1c0ZrZjRqeVNvekxDMWN6?=
 =?utf-8?B?T2FndHllbCtiV2NsckxxREFzNTlpbVNuS3dPMEpPZy9ONlVvQ1dVMDZPZ0F4?=
 =?utf-8?B?eHZlWDVuRWZHaU1ZSUl6NktSYmJuUUdJQllxSm4wMk83L05QUThjSHI5ZlFC?=
 =?utf-8?B?ZHlxampoZ2VZUm9LR3FuYUZTQ3lwdFNGeEFCMm9jalBhRFFGZmdha3lUYnJL?=
 =?utf-8?B?QVJoWWJqQ0lEU01yM25TYVBmMnE3elF6dGJ1ZEg1MzVCemt4Y1VXK1dmZmJr?=
 =?utf-8?B?VGdXY2ZRQ1YzYi9PMFlJbVdqM2NsVFd1bkFaWTk3N2VHWUtwSUNxMnJLRDRT?=
 =?utf-8?B?OUFtTWw3VlR1OFM5TEIyWXkzU3VHSEE2UzFWVVJwUnFoeGx5OS9UTVBRbVNB?=
 =?utf-8?B?REhBdVFHYkdBbUF1bE9RSDY1VWdTMU9nbXRnaER2MjFzZk03cCtBV1JOc2N0?=
 =?utf-8?B?VExzZThCUlU2cUpZeVVNYUluMWI0WUkrb1BoUUFHN3hJOXJsZXdrTEljZFcz?=
 =?utf-8?B?LzV2NVNBZHEvNDF4bnA5TjdNaE55aFM2NlJSeXlJZU95UGJWT2plbGthVGtB?=
 =?utf-8?B?N1hPYjM2Q3BZWENNSkVqWlFaYkdOdTlSRURsTFFSRWVSRFI3VTJPcElBZUpV?=
 =?utf-8?B?a2lKOGRQQmRycDIrLzlyQmRTOERnYVh1Rm9DZUl5TC80dkV1V2M0QmF5V2pk?=
 =?utf-8?B?RHlqQXhwYWFmcndGYmxyN0hOZTlDbGN6S2tIbStBOXFkVUNlYy9KbmIzc1J5?=
 =?utf-8?B?THMyc01nL0k0Nm1NaXQzL2kyS2VYNUdYdmdubDR0bTVGZXhKMVdRU0JFc1Bp?=
 =?utf-8?B?SHlFTGxoUkxraDQwRnp3RThveUtMTjZ4cTZ0SDlRZEZmQXhxMjE5V3FTdkJl?=
 =?utf-8?B?cnhTS2NKenUvdXdEbEZEQVhFR2JiZHBMOW9MUWFMZkUvMEhtKzVieTE0MVIr?=
 =?utf-8?B?bmhqNk50Z1M5aVYyblZZT00wKzV0R2RkeTVvbjVYdFh3bkV3clpZeERoZGRK?=
 =?utf-8?B?Z1dEeHBtdm8ySGp3b3hLNmM1NncwTy9Obkg5WUQrNGVEUHg4Z2dFVjJjODla?=
 =?utf-8?B?RlVMajJaeVgxbElIQTVQcVhBVlU5bW5xSWV2aG5aamVrUitHL0tEYll3M2sv?=
 =?utf-8?B?a2VTUkJtMVA0YVFGV1ZvNzJwZ3hoK211V0lUL0hod0RjREpzM0FHT1o0bFI1?=
 =?utf-8?B?ZVFGbW1qM2N6NW9BYThQRkhhVGhEZ201WXk1S3Z2WWNUMUFtTFNWaHQvd21U?=
 =?utf-8?B?dWFiajNsUHhHL054bkhzbWRYQmxZNlpWVjhRbGE5Qzl4UlJ5dFhGanhIVkl4?=
 =?utf-8?B?K2I4T1VRdUQwZlZiM21IWkFtRkN4WDJuY1FxUGRsRHRyNldwZUM1bC92RmZD?=
 =?utf-8?B?cEhQb1VMY3pXUWloTVU0OUR0RzZnRXNPTVFqemh6a0VzMnpybmxTZU9QTG8w?=
 =?utf-8?B?aEdRWmVYT2NTYThkSklBdFFrNS94UmtzWDVPWDhuZUQ4WlpnYWNkMmg4SUdv?=
 =?utf-8?B?aFM2Qm93M05pUnZJMm9kY2RLbGtzYmZsZzN0dUFyVUZiZ0k5Nm5wOHNvemI4?=
 =?utf-8?B?dkF4a2swNHhZSC82TFUzTHJWYlNvZktaZGhtYStwdGFNaklyYTZCSDdXOHFW?=
 =?utf-8?B?dzlmSDIzOEVRZGlLeDVLUkMzNlZGdDBlampTSFZpWGNVL1dYcXNiQld5THU2?=
 =?utf-8?B?TjFrZUlCKzdYMCswekdENjN5bGhkTndQanppT3V4NmV2b3RaUWtJcjRWcUli?=
 =?utf-8?B?TzVnWllYdEJPQlpNd3R3Tmd3T2pXNjQ5L3J3cXRXbXRQWXNERDVTTjJkdXBH?=
 =?utf-8?B?ZVBJODV1a1lxc3R1d3drSWVnRUxKeTNZMXpDWjJpZ2FpM283MVZlc3RFaUh0?=
 =?utf-8?B?eVBYd2lKeENxS0pYZHhVWGt0ZTROOVN1ak5TSUFPTzl5aVA5eWRQbDNNTUdK?=
 =?utf-8?B?U2IzeEoyNnhhZGx2dGF4RnlSMHc1ampSVnd6RWNsbUw1Wm5kSlR4SGZxendK?=
 =?utf-8?B?NUpxRldnZmVjdi9VbEJ4SlNSN0FIUld6bUErVXJFS2grbnptVWRNang2TFVV?=
 =?utf-8?Q?GrwWWOEAGFOJclkVLOVYq4iqV5VFeGEPFdMRr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f3c4dd-dcb2-4719-102d-08df0d9f3c9f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:49:27.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBSGoC1yL7oZk2+AX16XHHeAVKyDtVlpJ3s/Uo3PGgYEKJ1RsLNj0hozHXCUUf8cyAJWWRYj/VsLT94ePrLePi/rngMR/QjaCkf69S3qHvLSvUoFe5BLtIqiSLriAhX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780

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

