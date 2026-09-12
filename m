Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC09479876;
	Sat, 12 Sep 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212930; cv=fail; b=is+UIZOnJc/8P3UmNLBx+nghVIZ/fXeAzgEzbRP1Pqyj4cKvVRgCs6poqjr+9ho+v+RmdvrYYnl8LA++ebP0YCTzIX0ZCl3gyEz6sPNNYPd1BVdmVZEto5T2VtDLB5DzubmytQg+/HBMK6BE5Y8mWIv2fswit3PE8rTjM7b9JDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212930; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KmLsMqFSojRiU2eC7mrS2ImUreDNSNOrg4K7SKyVrfl+fRV6cWHnsOEcKf2998ZPOyT3Ayp5eFaA6KojlwuvyrupZ1sJb7SwZseMfMnazUOwscQ8eL2snTOG8jBbuUpFZVkmuTDNX9B9XXk/hxfE6Frr+KdTkhopNERHGw3yjys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q8LjxC9C; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q8LjxC9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcwvCt+P5gJAHHKYumJzbLZn1DTecbkbxSABpI2YnBV0vTYE1pdIWNTjM9kX/jyJO0RL30yCjisiNwg396earpFlPiDTMg1Gw1IRv247+mqvwgB0oVnAocuz1gy6pKYwQ+soSqQCH8EmpAFOiF5DlHTMR+LhIipqhLyy+9o8eH9TzW3bXbhB+Rn3zwVYockP3z7rjLNmX4aD10UB/1Lr+49bCDlms/9Lmo8LvaCXzMXjMDKp+ldxc57/n4s++towmwdZ9weQ1uwSrNEBD1KqLCIOROk+JPIOVm5Y8vcFFtbEQ708OI3sYkQI50HGL/2Gxafyxi+dp9g5M94G02/9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=SFF1P3iczp94083+Bcq9o4WMVdaTKM5LB16jURfAumYPkVzcL0aS7xXeDCdOw3dtTIfQmK2fW3PHSXQ512B5cIV8jsS8BD64EQq0pMiPbtrKFhT2abgr/vPsn575RFk974zoVi08+Q2S/mew6Y6+MACd+UTSCO9W+S5ZRf6T4RssMRAxncNY1JM3UMmBmdrQtC9BsioghD6qypccgWpmmyTDbe6DPkBCwwQYLJ3NzdyKS3z6VBUqMco97tuFobuMfI2T4mz9S9Ec9qmTdU8eE52LutUXdWNtPk5gFPrNAtaMECHTzo5Lv9VFePmbi02zoVKOTvctnoRjAtOehRb0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=q8LjxC9CWBBBKYNta3rt2ljm7zxX1jK8tjt4Z37SeuvT6OAV/fLaLu/SzF17m2VvgwALbTwmXfXO8bPl4xkPoyIuo4YUyPQRbxwzNkB+9/X1i/5w/gJ0jtYSQtGkeGMMzrIBD/YDOQQIvSiXvLoqd5q7YvztHHnImjlCbzw+A6wsExgGb8cAMHBLrdt0IksgPQKTzAEzDr17r3sIrLxfAInewZiWXZTNlH8S2T7dgMIXXiDE3iPjdxisWy713bGQ54reXy//QUP+h+H5vZTVGeVeWlrmo4AocX3oD0N5kIxBys5iTKZzL6bzXt8ZH+jrLHRmCFRtwN4K8BzaNtRsRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by ZR6PR04MB466071.eurprd04.prod.outlook.com (2603:10a6:910:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 11:35:04 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 11:35:04 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 12 Sep 2026 22:33:41 +0530
Subject: [PATCH v50 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-imx-se-if-v50-7-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
In-Reply-To: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789232651; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=tThr9IdKzT9A/QM4Th+0SEEmm1Nh3NyMRqKy9UF2LwXnrUXiqg2iJvCcB7dt58WvKZTB8cLg2
 kVwbjl16LelDnlui+T3PciWlUuCYSVeiY4cJURnOAFR9jW0qhzRw1H3
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|ZR6PR04MB466071:EE_
X-MS-Office365-Filtering-Correlation-Id: 22faa4a7-1c24-4c7a-e850-08df10c1e36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|11063799006|56012099006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	FXKBFk38GLEi37Fcxzj53XCDMUSUGm0usNWM8sdPR2M6OdNPMlbWjceDVz0xByS+TZ7fxt44nA+T5wxTBaUxsBCP53zZy0dIBZKIvWTnaLbgmmbqMFuBv18s9KzSn/l5s8iI1VOqcktrj5z1fBXLqCUumWsceCUlmgOoYmDM6zbXILrnCbSo/P83S2bfCVIThLAUgqIkOm5k8j/+o07TNWRyj/e/NtEMe015fl6uLh/HI4i3ACWnqdRGxO6sa5Ye0fKfY/qXAducxoO6vHWsQE5988QLe0slpMP3PwR9d5JjeGrmFDSk90zvcfSESls52YnKDs4pjAPo4puKUcMVtbqXSWmZO9yo0k2t/tdCTq1B0Poy/NHSAhlZsih+ShNiLCp2qVh4VsCJYRmvogRMpl6yXmkUiE76Dnsz/J0hYEpIt0Ls3Bf+MQaztafIOzBqNinUip1kUcAIullhXCes1qq4OFrcvK4QKG3eDs+xbaVmEtkI2tf5e5qHGj369Mavg8LqJLA4lCTPnBheOus4Pq3UF1b/VBYR08eBdIcoa04SHoxBdCLR4hhyAfdb3oWADJ4gDkl3ZefJgdxiLQ93kdsk9TBTQL+WJQRzgiTXXfONgpj9NcPs1KGgSIUQpZdlnGK2hzr78eo1zxuPmS84MNs+Wn5UhRm2vLUHtYbP5DWvXduB8md5UITtExb8KttTV4XRrhNY/fSIAwAhCqh4uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHFnWVJVd1BNTEtkOUZURm04NlZGb2FVdE1WTkY5SzhRdzh1QUR5SVgyYWRV?=
 =?utf-8?B?RWp1UVBYb1hTVUpHK21aQURSdEtvWlIzVVl0RkkvVzZ0d3ZYMXJudWNBN3Nl?=
 =?utf-8?B?TFZpOXBaZXIxUE5ZWG9IZlVLOTNaeGczL25maDRLYmZPOVpvbTFGdVFWTFlv?=
 =?utf-8?B?aTQwZkhGYjVkOUlseFIrbG1KVU9wWkpZTlpnZkdUdVRKV01UUnM2eXE5dXhj?=
 =?utf-8?B?d3FQdFlTY1R5L1ZmQmsvOHhFZkxMSlltand1ek81dW9yMWQxUTQwUkhzeGNy?=
 =?utf-8?B?YVN4OUlvUUZOZHJBdXhxWXpIOHc4MjVnT3g3RFBVQkNlRkdxUUhXaVlMSWsr?=
 =?utf-8?B?UENuZml6SStUQ25iMkU3UlNtYkVabGVmUTNmejZPN2dLblZsOGpPdHpsSHRo?=
 =?utf-8?B?dVQ3TEhCdWovQzQxaTlDZ2dDTnhyamJvQkIvejdtaEpKWStwZWlMRSsrZVBh?=
 =?utf-8?B?VnZ4VVcyWjNkVUVrbW1EMU5qdmlEMVhOeExCclBDeTM1N3FaL2MrK0NVb0tG?=
 =?utf-8?B?T0tIcncvSVNTMmNFa0FtT3dHNU4wSW9OQTdlU3ZrK2FTd3BsTnlQRVJQSnJR?=
 =?utf-8?B?VEQ0QWhoc044M28vOHJNNzZ3NkFjM0FVNnk3S3BZZC9hQVIzMUhlcDZGcmhT?=
 =?utf-8?B?TERSSjdaZ09zVmNzT2xSN25GcjdzZ0xoeUFFVkRSVnhtVUlkQmZjK2ZYSThJ?=
 =?utf-8?B?Vm1teHJzTkhuYTh2bmFXU1RsQitsWlViakl5Q3E5ZklwQXpXNWFrSU1JNkdD?=
 =?utf-8?B?emtWcVkrMlVseG5RVVZPVEpFQWdxNk4zclZ3SE9oQk90ZTdwTzdsNUdPV2Fu?=
 =?utf-8?B?TUducTFEcG9pb2ZSOXNmVVNaTkNPc0xPRm5qOTBDMzZOWDh1QjlWY3ErRk84?=
 =?utf-8?B?bm1TR2F3ZzgxVTNnZU9FUmk1eHl6azJ6TlNCYVJCL3lGbXU4RktRTjRBNk9U?=
 =?utf-8?B?QmN2MUNpZGRYVzVzUlNYYitMSHlPbGJkbTF4VHU1dGV1cTFvSmhKU2pvMS90?=
 =?utf-8?B?bm1NZGE2cWVmeDQvM0Eza3FJQ29abzlVWUk5V0o2bnNKcXRKaytTK3NJOEZV?=
 =?utf-8?B?QmNxaUtVVFZpSmE4ZHZhN2lGT3llVDNUMjF4NVZxeXB3NnhEK3lSeHJ0Rkxu?=
 =?utf-8?B?c0RFVzdrU3lEYmxNZC92UFVCSWE4MHF3U3hZSFcvUnIweGJ5WUZpWHpGWUlX?=
 =?utf-8?B?Mzl6OGtEYmdESDA2OEJvSmc4aWVUWk9ob1I2Z1ZHTWxvaVR5c2IydXBkSlBR?=
 =?utf-8?B?aWoxd2xwSFVlaGxqVEZRZ1M0cDk1cDlPa2hNTWxBcXd2Y3M4Q3BrVUFYMWdY?=
 =?utf-8?B?MlVlRDg3UHU2SHlnbGNNZmZodDkrUUlXaDVCNTZla1h4c2xPdFRTc2lYSFRh?=
 =?utf-8?B?ZkhHb05GVS9VMjNYS1B3MmNURS84K3FNelcydG80Z2JWdUlaZzd0OUJTYlRm?=
 =?utf-8?B?eEJpRkdqdkRIOXNlZU5rRCtBL0YrdVFQRGRrbU5yb0tTNFVUKzF3WFl5Q2Ex?=
 =?utf-8?B?WlBRNGZxNEFIUWZTai9xa0JwS1E2Z2lSS2djR05yOEhzS0RnMi9jRkpsai9j?=
 =?utf-8?B?K0JXLzhaTUd3VXk0VDVQRGJEUTJJd1NnK0xsZ3JGTnh6YVV6RzBOb01oSlRF?=
 =?utf-8?B?dmx0SjNSQlM4aGUvbVJmWmZVTWpmMFpGUTRNMXRRa0FRUzNvSU9rT1R4aXdV?=
 =?utf-8?B?T0l2eXZhckV1UWdzMFNiZHJpa0dQeEcrK2huYytPdmVJR0RHSWM4NTFkZVJR?=
 =?utf-8?B?U2VYS1JaYnJDSjk1Zm9IamlmZkFqMGtydWVqM0pJdWFIQkx4YW9ONWZmMWZz?=
 =?utf-8?B?VmZMQmVRTW9UNXpRYS8zTDhoRkNXckRkNlV5cC8zam5GL2NGTUxCdVdvTTlL?=
 =?utf-8?B?ZENkQ1c1RlVWazUzT1BRVkdrQktrK2VXd3VkbXVxUEVkZFZVWU80M0dLMERH?=
 =?utf-8?B?b2NMbGx6WFNOdXZVSkpoUjJVamE4RnMvTndhRC9uYWxoVkR5VU5CUjZkRHlC?=
 =?utf-8?B?SmlSUVVrQk16TjBkMkE1cmRlS283bXFxelphN1NWb0dZOEVOdWxjK2xhelRk?=
 =?utf-8?B?R1VqdUVNMkFRTWR3ckFRMFJlRktsd29iRDN4NTlHdk5Ld3NBYTJtQWJ0T3pV?=
 =?utf-8?B?YzZOQ0NRcFlleVFFbTFTZlVkNlZKM3ZtZ1NxQ2E0WjliaWd4ZTJodFQ3bi9V?=
 =?utf-8?B?MThYbVdmZU1pRGNGRnVoZFJnTm1ldzMxUkNuckI1N2dVS3FCcWI2NnFFdUMy?=
 =?utf-8?B?TlBTaThNMVRKdzZERG5yNTFBRlhLYkEzM2pPeFNlZ0NKZjc2S0d1WGJlcDha?=
 =?utf-8?B?b20xSFpoU2NoQ2FQZldtamp0aDkyVUsyMGQ3VTRKVXU1aFRqNWpzc0JwQ3J2?=
 =?utf-8?Q?SJeexo/ZeXY4l3v2NNNZccbkmzjx0eSHzKqLw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22faa4a7-1c24-4c7a-e850-08df10c1e36e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 11:35:04.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXXq6XULJCnkAgfes+o39G8L/uZLm47RP1WuU95e9RvtD57dwes8rZZVKmEHEuK9tKExnpmUzFAubP/qISP3hX07QgZN3kr5q9DZRSmPb93J8IMJYgZqlwBUDMxk2xWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB466071

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

