Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1CA4AA1F3;
	Wed,  2 Sep 2026 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365834; cv=fail; b=JnWFaw64X4O10oD0Ot8l3rde/q7o5CBV0FGV13OJ9daPtJvqKvNRu0CMtmn9UofX1gDtIMI2vIedcBZBmdlTcZT9QTZ55Iq6bA4mNgc55svh6fMaA8M8TAx3KEYn6tzY3ATjdozWGnjkMVT3SEzaqYcd1Y8tRm95EhL1Ff8mX6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365834; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GyrTp57D6pIEAxjKNae8rrG3iSnHkmppRIrkVNrD9TAlIOXCWKl/d0Y3kI/gVwuD4WvFFPqJiA0DEKsFTHVKfJGDYe0frsppL1bPdYC/xy2NYnPoabsRCKrNWSF3Q/Xkz2eth/5+CbnWtt3ZuX5AE8MmoZFRy/V8fIV84G3aBs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uFTR3R5O; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uFTR3R5O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDpnTEWv3/qcsIiLIxx/SbFG0zSu+kWDPj5e7Eutg8NnVKZWoYwYoDWzNuw8IjBehDxGnC8N+LAqc8HLnMfNfcXplf9mpIamupaVYL2rDpUYCPPL4XlOM7Cz/Yb4et+CfsTS2bQ7UDxTrzUJjFyxAmrqdPuDLiJQ550p6N7FqQgde+JlsveqY4Ri7TSxPbr23XBtRSkQyYm/n4DMt6P4xZ4zuWScavysJyu3GVDLGyBQZbPfgTYdAw0qhKdaGqx6MwSeTPIV4zSToDPqG/u8xE6dfNz9VSqohXvB3GPjQRrIEQ/vRDMRfk/FCs5QYTKWCdifA4UA+8ivHNEg5/rptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=IJ/ka+XarSIC4b4mUIp1KB0ogHjqzdgA9V5iuOgcKb5WZKHfWT1sIxaUraxQ3I6nMGO9Hvx4IvDAEYAk57LAnbDtgAac6fzTV2MMSNWrQaN3hLlPBeHiDhXu0QfQ7vrjk5WtpI9LZD1O+QLOEQtroX6ugOmahrLmP0Gun2US+UnCXCVLjn3BcqbXFw/PcbikkIsW7TB1JrN6j71vhCG+bm2qo6LFFFVl4nMVB1ApFr5gqWgE7LKgRS6WTT+JuffWn5g4V926Vvtat3ejOhIGKlb4zcWKa8pcE9z2iHii/6qvfjVEmP7FqXEZpGRZiF8g576nTvRzPDESmI+/U1sLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=uFTR3R5OkKkhJPg6ZwGpSW8M3tg++Tq9Id4meu/lnPatgCr9bydZctc7usyA1UFO12TGOEVKBCWpuW2PqSQtR8/AIGpqXxUdR/UCjBM2AxDSBEK+VDWnzwuKzqI/ydUyw8m08UDepGQptm0JeT5gKW0hgi3Q8/gxYNo6/2JtBRnJ+j89HFmD8L86F7aM32MDiSL/U7nZJfYdbqRNNf6+kLbasQdJTaBaoKv3zqN0teawePZXj9hOzk7r7C8rjJf3VjafACVRCsKQuMLdTFPkTRhtrua2rZGo/f7mLiX/3eDhUGkokD3i8yf2jhVVTEOzt1oN//+c7lF6ydLjrZpznQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:42 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:42 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 03 Sep 2026 03:16:13 +0530
Subject: [PATCH v46 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-imx-se-if-v46-6-aefaab525034@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788385573; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=N474ymnKuQCyimO8Yx/bj3GbZkKxBC7CT0S44fXOv3cNlDIHehav7MWDvcy6uhGtSbExMVYdB
 1PcCmBGN6XzCizDQMG7dbor+n+itwLSbPwSYBPGfSKF/Ixo4KbQuF+Y
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: de64a559-5469-458f-7d2e-08df090d934a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SXs42XpDaxAhQ3opR+vou4i9tlDf7wZRG2j1th5uv3MDG7mQJyYvlob+y/xUEocSyAFKpQ5oi8K2jcZ8U6KtX8X0Gyv/xF5mA+NYalEybZeaoqOq6WIqH7s30NVA3bGFTCBaKw5M6x/6uQVZyDgCpzXcKHDNXl/pFbW+WBpuwbZP8Cow1A1sUzq6emTJnXpYJB3s7jZiEiysgFqz7XVmKbexM8QFP/dymmCdc6viCaesoQ+sp7fN2ntltLrr0zxC+nt6jkAvh8T8Y9OOixDkZVgtLldFIPP7WbNXk12vkzFVJiRzEUDZDNOdaSgoI8JFbCnbc+LR6nvyd6u+z98uizLdav3LWo9IvvRJotSXIWrdrIVwSRIlu8PCBbQcPLJg/AMVhrUGqxtN+VpzN+5lNnENjrWPXRQOXMKMvOVcgG/+xMhZapAl7XkOb9XhgMk5OuumuEUpLN5g8Adq6E1gtkVxXIu6LIDfePKm3L7wFmjig0niMuEg32uVBJ83J9Crcd83TdDrxrWrLFmS4rUc88ajzgD4NltvvSQID8sCS2cPuLNBYt0ub/69cqC4fiRgzF4EtOW6Pxx1X6OH7QgxI71BX+iP6kZHNDXYWcB0gRhUkuRwFb8R1QJ/QbX634o2Kp0jBYLRn6jrfvk6qKvF6Q2Lra/xUXWMsWHIq4SE8kSymFZKysvBmPhUxGg3rvUc8El8IxTWMu7OAMP3NbdJiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1crRzZmV3RYUjJBWVEzYmxnUzl0T1oxcHp6QVFJQ0pvbkRwTGRKd1JOZTZZ?=
 =?utf-8?B?Z295Q2JwQm1TMEJ2UkVFeFJxOUdYMk0rTXh1ajY1MTIzM1hacVZoaUZEQ25x?=
 =?utf-8?B?aVdBRkFweXJXR2dvWG1iOEhIR0txMHVsVU82Q3RkMmpiY1lndEswTUpxV0Zq?=
 =?utf-8?B?M0RINFpaQk5oZzVIN2UvSjljVUxNRE10bm52QnBkclpxczEwc0EvV0ZoQ0tJ?=
 =?utf-8?B?VUZ2K1RuMk5BNTQ5MDJzTDNkVnZVVHJkZzhIUnA3OG1ldlBMUHZXZFpuRVIz?=
 =?utf-8?B?S29xekVHVEtsRnNRYVFiVUxTVlh1Wmp5Nm16WW1KZWNQM2ZObzFnVlNTYnNJ?=
 =?utf-8?B?NGdlcHhvL20zcFk0TkZyNjNnL1VKWEY1ZVVKckZjOVlvQTlZbGdrdnpMcVFn?=
 =?utf-8?B?ZGFoZXVEVjFMWjZQaVhKcTkycHFoNHRkV3YvR3FhWDhkeXFBY3N1cEFtN21a?=
 =?utf-8?B?VjkyZzJuMmJuVVVOYVYxSkowMnZTSDF6NDRYTzlBRmtnRmJNYXB1YzBBRDlw?=
 =?utf-8?B?V3ExOG52cjB2V1diZjI1cXRtUlpNbkI5VTdkZFFXYnBlTFhyWjdFbVVnM003?=
 =?utf-8?B?Y1VFVGFLaWNlbU5PcklXemFtbnBqM3grSERKZmtzNGd3WlJmVW1kajZ5QUNJ?=
 =?utf-8?B?Tm02Yk1sZDhFQnJuU3lJTUxZNEhWZ0o0OEhTaTlyWEk1UzVPdkR5bk9SRWZn?=
 =?utf-8?B?VEVLNGFWdndxOUpoUUhWSmNIZnc1djNZdFcvTlowVVZ0WUhlU0dLclFyaWRN?=
 =?utf-8?B?YXdEeHZoWFQ4bkJFc1loNXo5ZGNrOTFTZEZDcnl5NzZvRWxRaW5IUzBZdlpX?=
 =?utf-8?B?ZHBkM0E4OUF4TlcwZExrZDVuWThNWEZueDhZLy9NOUk5Y2Z6ZTQ1OGR3bWNo?=
 =?utf-8?B?RTdVdXpyWFZnZUZwWUdJM25UaVFwQ0NucStqdTZVWEd1cnBmcEJEY3ZvUUtC?=
 =?utf-8?B?K2lYdmc0d1VYMlIvUDAwNWtJazNCOVBORHZhQ1FiNXJvc0RrNDRkRVFsL0kr?=
 =?utf-8?B?MlIzNThIQ0ZKQURmd2t3WWxJMEw3dTFDRUZOcnNuZlppSzljQytBbjNCbjBF?=
 =?utf-8?B?dENXZGNPaEx0eVNDQVdlSWtEL0FjNlBNTnBsU1RVMzZnTW5oZGJrVXpyMmpR?=
 =?utf-8?B?bDFDWEdLWVN2eUQ0M3lnRkpSQjEwei9GWmdYSXA2Y2UzbWx5YXArbmJYYlM0?=
 =?utf-8?B?U1Y3eUkvcmQyOUNLUVVUQ2VYWlBTaFc0dE1RK3VlMmw3SEdUbXplYlBSbERE?=
 =?utf-8?B?TTVVUmg1OVhWWm5OU2RXc0p5ZmhVUjdCaTJoYUErNDd2aFJEVVRhdWU1d090?=
 =?utf-8?B?TVVnUjkwd1FjVm5DNjd2SG1ORFVMRFJ6RDFzeGtrQU0zRmhRd1ZNeUxyZlll?=
 =?utf-8?B?V2QrSlg4VEhqOFcxaFljOXQ1bytLdEJSK2d1STRURnAzR0UrTVB6OG1IQ0tq?=
 =?utf-8?B?dFZRZGMwd2d4OGI5dFNuOGxrRTNSVlVpQjV6ZTFwc0t6YVRFSy9qem5ZSlIx?=
 =?utf-8?B?RTJFVkRRVFo5TUx6VkR3dGkzWFZEUExqcGZIbGVkYXBENE9wRlJvTkpLSjBV?=
 =?utf-8?B?WDdNRFdQMnJNSmhLbk1JZUZqUWVrejVvbmpVYkxHNkFPREsxOWpGUk03eHRr?=
 =?utf-8?B?QVhIaUdUT2E5V1hZdlYvaG4zNk9za1pBL01xRXJ1dE5UeXNMUk5xVlpZdC9M?=
 =?utf-8?B?SWhaNFpoS08xcHdBUjlwUnBEendtVG8xWTd6czlNelFDOVB2S0txbmdLNEZk?=
 =?utf-8?B?SFB2MGZhdDVxUEhQOThtQTFFN3RMUllIM0h1aTZ2dFpqM2RvRyt3NzlTUDBU?=
 =?utf-8?B?bWFZNENZUnp6dlVwVHN3ZDFtZkJXZHk0eFh0MExQcGswKy9waFhzRlBWamZ5?=
 =?utf-8?B?Q2JPQVRRcW1tVDFLai9MMTNFRUYwQjJ0QytrMEVnUWxMTExlNk00Uk5hVEFh?=
 =?utf-8?B?RUNnV083UFR5OGJORUY5RzZPME5yRXhhZUhxaTNvQ0NBUEQwUXl0TStXV1hK?=
 =?utf-8?B?a0V4ZWJIcnVqbHlSaWtxZXBEUGJVMnhhY051TXJwV1lTM2ZVK1JlcUcvQ25w?=
 =?utf-8?B?TlNjVnRQenFlNFNkaDBWZ3JYeStGRUFnakE1ZEFQNDB4cFlySWhaZ21XVjdG?=
 =?utf-8?B?U0ZVS2ZyNkNJbndRMkhQOGR6S0RMSlpQajhrZ1JUcC9YYlozL0JCM25teFFj?=
 =?utf-8?B?dXZMSFAwWXV3dElTei9NQ2JyU3E3dmdzZ0hCdUFMVlVhMGg3VnJGNTFkVUI2?=
 =?utf-8?B?djIwQmVEWXBsbytBcC9QQnZYWVlvMHc1TS94enBudXByU2UrR2l6a1FQVEhv?=
 =?utf-8?B?d3lQQUw5TUU0MDZzYVNFNHBuM0IraFZoTldrWDFNN0xZK3YzcE9RTmRHRjI4?=
 =?utf-8?Q?Su8sbxhxDPkgvjEvofmA7wqdGjXFST9RRcQ3V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de64a559-5469-458f-7d2e-08df090d934a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:42.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mtYIOrFkAzt5A9x5rlo0U9uPkUI/qLJqzHxA1HHr7HjOuyhW9zQbkTE/O4ksU62gN7XoLJu2BiYrihqFTq74FX/EDGl4wEstDZ94Bx/0GrgVSwCSxNuf/GUBDDQEDx/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

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

