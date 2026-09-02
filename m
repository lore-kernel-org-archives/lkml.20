Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366804734EB;
	Wed,  2 Sep 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347167; cv=fail; b=dENwchkkuH+0M1GIipVgRi9hVbBaF6kF3OXVnQech3exyjfF5btrIlgWYap1rTe94S9burcoURWQ3ThlvQvfoeyYnff8dgecPA/AojZ75tNRaIxuew5rtTdEHyKbaHYyWWlPalDnAQRdoGGSSL+Z30Z9PafbmrLaWRSEG4bfOcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347167; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m0dLF7zOZVSI70eHbFPO+NaK/rTOjbBz67mKd/9dXYxmx/IaU+i+n4UgnLlWWDuXl0MynXjOs83mXOIIu35d/mcFH+HYnrGSM0ORz5+gMiBZE41SwXCCTC8/M32zcjoIt9Nj3BEJNPAHSxHqt4KHoEymHXYEELBjOzY/Ot4+EXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rjuqZpZO; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rjuqZpZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBIDCPsZFvIa7dBUVxLwM41vrzkuJ3SvHMXCzoSTgHYTQyRw5PcDOi1Z4JhUOas70bvqAyQqA1xYYsVEogUV85ZMWd/L+j+w90a3UtTLyo5uLW3tPUZwM2YKXPy1AtZODdBftWiXv4hBPVKRZTlt+/zGYIUnHsZwxF1D5SNZAFstv9An08/HwLkRDbgi2PleG3jgPgHkQJDbeVs1z6Unop/GuOkhbnZmSpdgdU3EZOPq8pL95Pl3GJj9Z3d60NA2uIm4i8eyMLHm0mS3OYDfKBdzOTf04NLB0DBjATCt3af2tbaRstm5q/z53DPXGE1NO8owff/6v2VEdg2QR0/BBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=GU9oGknsl0iRxZBNldnuom7jPxWtUfnwopp2i+pxkdEUHc8IsOTLqIIrFx+pNxD1cEsCq84nOQPaMoUf1Jz72KSj6kob55lr2zWt97cPIEiuLc7X8JOd/7P+hoTpKYomS9sumaJ6poHHSjWuYsdI49qymIQETf8Rs8eUT6GCXGXrTD9gRNDi0JIF7VqjxGINLzHB9rRP1wGN8pPIw0CRqcF4hp/8EwEwgA3tHIcmSbIuBptqBa4ttyVQUkciIYf0rSysHtV4lacuPcaPursM6J0Q6A4q2DFZVlHoRg+IQQJ57nFk8pD0XG/RRrmDmJvvY/TSZHYfxwir/6ABc4lP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=rjuqZpZOLiu0mvOtgE6+W5Oa8ZF+13Oz4odXfRh5o+iF5Sfbsivki+ASKfrNktDVunj58hRv4kxYj3ZyD9uwajWypaGLcoQv0SLtLEPxTFgCiKnAr6RqiCeRSX+SvdfgkCrdf8KtNT+lljjrWh1fkV9/hAn7XG/+TxAobVzFfCmopTUSHtVqC9ePOeirOey1nInxBoYjQkvQFJhe+4r+slucq711fNjWPVSa847lhA1wuqlQplGarghN8NCV859TvFxWimGOMyYhQdnBvjhHSGA2PnAZYfSX3hpERrNg4p9fj/Nt4HGJ2Ttm1TnZ5WilP9HOMyiotI41xTBceb9Deg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:05:52 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:05:52 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 22:05:20 +0530
Subject: [PATCH v45 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v45-7-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
In-Reply-To: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366919; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=oOKv4orcdkipZnByIV+RBdzg67WOECXVEm6uzWQW3EGQ3Z9ilwTc3ewefFVpTJ7dJtnQRMD7H
 8EYxWrI1m2DCVIb8iEHY+fOoik+biCONpN3PqJkKi2RHVf+9Q4GuTAy
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 50fc858e-933a-44a4-e188-08df08e22754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	caEGGXmGHDLzCg+CW+rk5X/JN9VnPAjDT8LitEW8N5PwJ7SFZCjmcRhP9eTRGMdsOEhKJr562+gNz6HwVgsXlmqHQH4tPCXwjXc5BJ0OlT8EurWFE4w4u871iois4CBV2YUkArz/AofXyoztGP5ImjZyQboEVDY6g1OIY7b/4ok0NoXlLYWXj6nJwvtVU1kTyQDGwGq1qhaBc0z71ZAX7KPXtWLTBn/VNzqM8ctW0bHtkewx0FyY08n8Gevkpmi5oh/6SnbPfQwfSjVXk4kzBv58Thjhr1BEu9K8vV7DGAJaHLp2+FnAtGpmyBGKcBnuJ+UJUbEC/Jxk+uIRrm9vrtwn0WF+VLCWcrG1QfoLyRJaWFoWdcxRDBNKG9MHr4OJX7DYniMsJjuiro/AaG2ImLnx3d/LkjO3y4FoQ8OiB3W9IwFJJDLWMRvWyAFoXj7HFTcqIoK45SrxoXJx+8OZM/MtbZr1cE4o1zGfPx8T43ynuNDr4lcGXSon3cM6P2NQTWrN4AkSLbqfGehGWy4UUIrOlssx0OHAKeygKCpDYqg4fb6NZ3NgESdJfepCCGZvYygtdKkAGhK9x62HsdadyhLL46KBPmit8V9YX6FNBmOE2ZgvXgVxOrkUZ32CxXMQPUTweChUxohJNG8Ozw2JwPoPs0C9l59vB7A3Z1WlVkbREh9hVzYeFW4QosU+7xnaXsmZ0vtIR6zOGTW0JhTRfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEN3Yk55enAvVzNCaHBvOXN1UUpEYi9oOUJLRlBLNTlqdFhkcUdINzhBY3N1?=
 =?utf-8?B?ckxlT3NUbmNOUXVUV3lFT0t1UThPMEJzeGorNXpoakdzbkcrc3hXdEpkK0Z6?=
 =?utf-8?B?M0Y2ckNrdmVGZFdZeUc5eS9qOEFhbmtJTWwzeitVRWE1ZkxLUnhOV1ZSTXlS?=
 =?utf-8?B?OUdVODloS2RCUzFjSWh1MDZWYzZ5eng0d1BReU53SDZFdFZRYm8xL05uSGla?=
 =?utf-8?B?Ny9LZEhMMlFWK0VqcnZyTHlHUFd4SkRBeWpGcGdURk5MNE9iclNnd3BNdU1T?=
 =?utf-8?B?SUJ1OXF4eGJmQVc0emJFaHJjNW9OL0lhSTIwTG1UV1l0RmhOTlNmTU9IU3VI?=
 =?utf-8?B?YjljSldnRSs0NGxROWFySHpPQTJXYXlzQU5JT0ErUUpGK1AwQ04vbjdyYzBV?=
 =?utf-8?B?YlVIOGFnZm1NakpKU3RoY21yOHVMdDhXelZKVy9MME14TXMrNEVHVHdrQU5j?=
 =?utf-8?B?OVhlaTdhcm5DT3NRblZNdFRhckV6UXlqMVRuOXpUNW5ubklDYXZFOGFybGVL?=
 =?utf-8?B?amx5M3lYblgxUStIYTlTV0FaUTRKMXF1RlhjVTd6Y0U3RVRwVkVBL0t5L0tw?=
 =?utf-8?B?cllqWWdvWS9rNVFGQVBlZkR2UkpYTGUyOVJuVFhtUEdXZVBjaUtiYkZUK1Vx?=
 =?utf-8?B?REFDUU1PSW5lSDJKb1lYTkxuUUFTWnpiWTlNUlJJaTlMdFZNQnJWWFVOdXRx?=
 =?utf-8?B?UjFldU1mdmtzd1dJYWtvV0E3L1RxbC84VVNVRlBjQjQ2T3hndUR4cmF6THBI?=
 =?utf-8?B?UE1PMzVDRHJiY0h2SVZMOFFXMTBqUk02TWNMUzFVUXZ0dFVCV2NGQkplaWlP?=
 =?utf-8?B?bFVPVXZSY3BFRENtYTFpN3h0eXd2TXhVN0NpSTRHTHpUVU9acEhYYWQ1eGdJ?=
 =?utf-8?B?KzBNZ1k2MVJiendCUUNkRllKUFdBZGMvcG5KQm03WmorcjZOMUlIR1cybUZQ?=
 =?utf-8?B?MWZScTFDUitkcXlYdHRhZndxZjNvU1ovQUczU1ZTT0lvcUJ2ODNtNDJzaGtj?=
 =?utf-8?B?WEx0K3EzT3hHdXErejJ6WHRRRVFNcVkwZFJKZEwxU2MrdDVScEJ1ZHlpZW1h?=
 =?utf-8?B?WHZWV20ybnFnZVNWSUtlNUk3d0RnWGNna3NIRVFYaUcvS25CWUYzcitBeHV6?=
 =?utf-8?B?UWk2RXV1TW45ZitxWFZBTkhkYmNhaEE4VDNvNTJmankrUlM4RXY3UlhZYW9C?=
 =?utf-8?B?MG4vNkF1R05hdmVLT2FubUpFZEJLeDNWL2haRHN2aCtsNjF1b04vVXJ6cDlt?=
 =?utf-8?B?WmROeXRISXc3M3NHU1FMa3g0d2ZhN1NoTWtIWjdYL1B3eUtGbHBmK25KVkFG?=
 =?utf-8?B?TEVMRW1JNUtiTUpVR3dHZEc0bkp0a3VrSWRWK0ViNzdtVHBqZUprVlMzV1Zm?=
 =?utf-8?B?KzhJWjVWSG41Z0V1L0diSU84bC96bVBnci9QS1drNkIyUkk5cGhoSmlrWUdT?=
 =?utf-8?B?MTNDQ05aTGdYNDNZNzRqK0VEdlpka2VVcFVKZEZZeUhkZURDekRDRDlydzE0?=
 =?utf-8?B?YzdIS2pYbk05UURNTE5aaThGREluMlJTZm05WkZpa0NoaWNmQW5CeTBVMlNi?=
 =?utf-8?B?RThGZFZNbDFSU2VXMHpIUGMxZmV5OEUzNGxreTlUOU1ZVjRJUnFYdWpLanZl?=
 =?utf-8?B?RDhRRVp1YnIrcXh5SXlVR0hrMTNNRThLL21aV0RKV3Qrbm1Tem45ZmFRbmlq?=
 =?utf-8?B?UHhia1BZYy9SVFN5cHZvdHJpYmtTT0FmUWpjTkd6VWFxOU51WUh4aFgxOEI5?=
 =?utf-8?B?UDV1V2xRNWpLVXlJS3prWHV4SUthWVBRYmx0MlJaOFdTSEV1Q3k1VFF2U1lx?=
 =?utf-8?B?VmxINURQYlhhcjJCalp3VFFSQ2NlaTJRQTBMZXB2YlVqdHp0RndVOFY5clEw?=
 =?utf-8?B?M2hBSjRuMnR3SjFzaElOOWR2b1locUxXMzdzMzBLcXg4WFMybFIyaVU0d0Z1?=
 =?utf-8?B?L0ljeDFYUEp1VzY1b1hhclgxaHVpMHhhMVQ0ZHBxTDhQdnJCejQxZlJmNmtq?=
 =?utf-8?B?WDkvbm4zMXBCbmVaOS81ZFVYZ1VkMjhOWlRuaFRZVVd5VmlVd3Vwa01wWlpr?=
 =?utf-8?B?dHB6VFJ1UUxYVWJIUlUyRm5aTWhhQmZRWDRPeXptclhUUE9SQlY2NWY0Y2pK?=
 =?utf-8?B?STdHYU9Gb0gwbWtOK1NTMnZZdWVOUW1PZGpXcjVIbmQ3ZU53Y21wZ0FUWUkv?=
 =?utf-8?B?Q2JrWFJzcnc5L3NXcytKemdJbzl6V29pZm5NMStEc2xQd0RQZG9SVmY5UUt5?=
 =?utf-8?B?ZDNkWnhmL3poK3V3bXRhbWZjcHZqTHc0VjUrQ3crVU5OWlRFZGZicjZ0UjdD?=
 =?utf-8?B?K3NrVlp5TWdpUnNwTE11Y2kxZ0pvMS93bHRLR0MycWFvWjloWnJvN2dUWisr?=
 =?utf-8?Q?lH3mv6sBKsm67LR5fVoDQ1icgKCcsPXAryXUm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fc858e-933a-44a4-e188-08df08e22754
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:05:52.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFDrUJF+mWUZYNT/GP3e5YWsWMinDA2ey1b3X8U2/ngAeObaGSvE9IhCymNmAm+e5C3avS+waT5Rk6jmuRM8jeMexXLyztkd1uHVjhYNXuMritUPjRi+4063t/eXYmzb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

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

