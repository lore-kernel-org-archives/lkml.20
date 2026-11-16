Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799473;
	b=JUNwTvBblVmvqQkLmptVTQb6ABNqo+ACNoHilSXCLMycAP+a+bVbMAoa6k/UJsfXcjU7
	 bIjXYHtbrO+6gTxfY/zuy8RmqX+b389iVsFSY0Sx2j5atIG97+JI8n3crVZSwXwE/uM+a
	 jIAoV17Oc088KcqrcA5GQa50AvxcP2GmMJd6aJ/5l55rfivz2K8NjrB5bU3ouqAVp0SWM
	 66vHteHA1NHw+eKpkyJue3724NxQL1qiIDuMtYD6yuGYlrs+jVpsnCNAxzrdT4Oq5T5V7
	 g8JX9oGvxIbNXIRUPIFyn5iH4xnL+E2ICqS4qKUZoL2KfEdQhOM1Rhev0rXGeNlLHIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799473;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
	b=BSkLvCW9t/U+WiXFu89JmFTwyHVjcuS2fyajVeg6I3WuFx1n3UlBbvQd+j5ChbW77BCV
	 rd0Lg1+Y1Sis4NhIzX6z7w3J40BxiDXHxep1v9C09QsS+iJ+EoBHwtfQZcBDqFPHKJd/D
	 bXE/f7yyRZCDNxmBtTeVjGUACaPPo6HjX9IGwrIy7mtCq6kcncVD4vb0ixHXdEXHIaXDB
	 b/8TtDdL6msVwHUXSf1qr+SHzDvp4INEbbgVpCl5IsMkDNusM3TGJk4hkyqLffKf1e8uU
	 B3GijoGtxvTHq3AHgXVxn/BDkkaDKI1vPWrkjaSDWbhmhcWAYdIuwGVP9N5lnDHa9dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WtnY6f8a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6245606A890;
	Mon, 16 Nov 2026 03:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6245606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WtnY6f8a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6vajsKxNkTiyphYqxumiOk9cFg71TtvOS9A4yL9RcECuoxrWsBb3TNAkmxWbh/w0yJXmD81yIoKQsXDa3HMJvB4T2KK7i7Cwgo4yyn1U+cCcMoovlOJnqQgYyvbLxplsH5uKUSdoxtVIak0xYI8sBnaDN9STxpKEonZslRv/XQIvmptoFPCqxQMd9awQTWtyjxOeiph8XuZOUf17y1rU6YpnlMt8WTyeOAcJ2loRntSpGKkVzRGa9Gn4lcC7VtMliKpVcBELN6IDgG87th680mXSK4WrB8D8mcN0puu9Yl9sFLTEKfia1unxMbmV31QQTuC14mMq7y/38sM14V3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=Yl49KqWuRz9cN1WBMI8Z13A3kqw41JVnwVHGEcidsC3Tqoq1w9WJuw12eECvmDFCCRvcP4euGKRzyDdwfdrK/ZF7X3mIEdJ1Y+t3w9fQazDAA+xpBtnYrrSWZIkrk+vXzDNxC7qD6/OEos0iCDukom3ieKAmASOJmFn5msRr+yzs6pyAmfvD7qC4VcPpO3sfvyOMSCdifZs4GHXEuYjEe02SUXsjpojuBsAZjELWsQJ2+KMkclfB/PN2Xa793WQ10sPWknfEtwLqiVJE3lnFRXuWzEJWWAEc/xSLXKEXhB3xcJVcSpJfmj4S/PyQNxYTyeNQu73PxUgGj8OGwMAzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVgCD/g+vxKKIKywtDNm/X1sosQg2B5HwQgIkq+yIYI=;
 b=WtnY6f8a9mbuWyVFd5iIpEyAogYNoL9AlcPrrKfcKJ3WqCWImoZWsMaIZzh20i4T04JN+7si5tRx1mNnxZCwaI3UKxLLhgEe+wqAR67IYoaqFuN9JQ04Bt+rRxoT8y4oFuarzqBw7V9upwVuh0D+HNcO2CK5KyYDPP+DXGfCFY5Xd9vAdyPpVe0Piu9h1wAvYcfR4Vq0uTPAvrO/o1XErWZa/Pi14VZk6X2flzXSQt5q4iDzeRQWEo9Gtx6zuHvMxVfJSXV9jQf5m2FT3/obUcnH6D5KALFusOf/qw1jLhoSfj6nZA7bptV45fqjZucHYJ+OxCH2V6SbVSulSWcxqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:23 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:23 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:27 +0800
Subject: [PATCH v5 09/11] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-9-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=1620;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=hM7YNo+QahG2i8+Ibiv45XBkWtXGy+XAQaAAxvA2TIE=;
 b=KuG1XhKaQU4tm5YmxNtMXFW5FEt8F2L4x3uf3qG8pPKXNkIAPZq5Tc0PLrF7rZEGcd8v5g4Ct
 l2RaPeCcyRbBvef/2y7enVm+oT3aNp4HH/vLIZ0SJ6+UiZI52pSAVXZ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: b064e97e-01bc-4d8b-e5aa-08df43911c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|921020|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dWk7fSmKPQc+9vV0bLlrMg4TyFeBuNIMeG5usOAdZyrQjeWMGWapBfoyOF5duxtoWIevqiznLYaPI+OO+WONZU1qdErG31JxB5t0ndGB9HVIsCflqVkFeanmTAH0bJhnqD1HE8iBzfx7zOmkumpieNOe3vkfQZNwRoP5x391LUtWs4GhQnXeuCPdWQmgsv7SfYai+kE/ItZyOI1kQQwLygi13g2wqNIFZL2SwFIdQ5zfAF+0IrEarpc2otyIlKZJTRZcsZysIC6/1dceK6uK2m753vL7o7UpSNWDu2i4RloT8o9zsbQ93uEeGPPN9FuJNSk5Pwqiqw86Eps/od6+wN4JSB5k0PquoCJPR1wP9bFcrCLUt5PEyy3+ZZIzB5ODGvZ/Luf+VLGg+84Wsu2e5AVrP4opnEcZTT8DRJGzecUuE1xSTZqnWVmsnwmw2O6p45cyRFzrECdhO6fQBuS2Bo6/z7IWy+MuwthbxtTP9O2Eee37K7W+8T24a+8/G55REbUrkhpy66YSiiXRyZerAoraz16NCLPPo8+F+igv3T5sVxZ9YmbfBYm/gkXIkGhSNZGRIPgKs1e2z013+PPmg1LRK1j5ZV9HIv5laM7ScVQP7qEEaIsCoeQvSG/+IU7U8rVEVemEawa8McEUng3VQJewAF/vWLIS68kyYM2/HGociFv5aglFWOA7yC7wRfHCqYEHROSWp3m4zSccwgmOdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRPcGJ0UjA1S2V6WVhqZjNkRWRHMUFqRU8yWjg3YjhLZzREeUlLeGVjZVJp?=
 =?utf-8?B?ZlZFV2FhVWJkZDhlRXpIR3U2MEtxQ0FXREowbjdKZEJhRWVBZEFubXI1SXJo?=
 =?utf-8?B?UTJYdUdRaUNUQVdwSjNRNmczaG00ODA0RzZRK0F2OFBHS3BKN3hrN3RPajB0?=
 =?utf-8?B?MGVsOFVYSXlPNkJrZGY4RVg0NEpKdFFENXRXZWQ0Tm16dGNERTdHSWlEUE1W?=
 =?utf-8?B?cWdYbkVZMFUzYXpkckhWUHRaM3g1WkVyNHNZRU1YZVpBODNMUXg4SmpjM0Q5?=
 =?utf-8?B?K1U0WDJ2RE12UzMwdUlaL09LckxmUGU1Ymx0THROY0ZpUERoOC9LcGpxQ3M0?=
 =?utf-8?B?cDBtdmJEQ3V1OTQydmY4ejJkN3M0Y3J4UnFmM041ZFlpNTNuRmxvaWt0ekFZ?=
 =?utf-8?B?ajFtTkNScEJoTmVhVVFVU0o4b2l1US9KTmJIUStJWjl2aEFXa2tCanVXNEF4?=
 =?utf-8?B?TmtWREVkUUphUWMzbXQ0SjJ5SkZFWFR1Uk4zWUtUZWhVVmZkSzN2Vit3QWFk?=
 =?utf-8?B?bmhmeXdMUlZNd3drbFA5UDRyc2VVdzBkWEpHb2FSSDdTZE1DWEFnZGkyQTEy?=
 =?utf-8?B?YmxmdUZ6dGhSaWpXZ3JaMEFTRjJXM0tVbkwzVU1ZZG9rc3VFVlQzbFovMVZ6?=
 =?utf-8?B?WUJpSlQwSzZlaTNQQWJBT2VOQmxJZ281czVaTVd5Tm84M2VPcjdGR1I1VDIy?=
 =?utf-8?B?OEpGSnJEbElmQ3BrVUxDYXNmWVdHdkV4RmZVTmhZTVFGY1l3L1V3bkZzZHVR?=
 =?utf-8?B?VUVPbGhmdUwrSjREdHZsaUV4U09ZZ2RhbnkzdGhWRmJsTnN6RjFTeWN4YWFz?=
 =?utf-8?B?dHBMT1lOdW9zeVJ0RWxhUkFBa2IvbStxbVJEOFlMVDk0S0RQdFkzdHFwQlZD?=
 =?utf-8?B?MGt6UDl0L0lmektnOUhPMTcvMFY1TDB6OHI2Rm9DbnRuREN4V1NMRmx0Y01w?=
 =?utf-8?B?VFQyUGhoTnI0Lzd2YUNQWjhCenJ1OGtwbENMcjQyekdEOXJRdllBRWo0UUd1?=
 =?utf-8?B?bUZ1SC93bW9ZZlYvbHVjRUkvNGk5MjVzM0ZsTG1zUUhYeEI5Mk9RVTRZU3p4?=
 =?utf-8?B?N0N1RTFkTEczRzVQS2Q1eExxNThNWTNZNVNDbm52U3E5MFByY2I1QVpNanFW?=
 =?utf-8?B?a3RTcEk1V0twMnhQSXF3cFdvc3E1ZG84SnQ4QzRGejVlZGN5SmdDbUtmV0lP?=
 =?utf-8?B?NzRsL3o2cVVVbGRSOTl2MFA1aGlHYjhPQWxKSTRrdDA3ckxJT1VKQ0VsWkZs?=
 =?utf-8?B?azBVVmNoM0xWZUtnQ0ZIZkFCQlplTnpVdit3ODNPeTA2ZE0wRXBVMEt4ZVpj?=
 =?utf-8?B?T1BpZGlFTWgrQzV0ZFBHNWVyVGs0cDVnWHpHMlJnMHlsdGRSV0pQOEhWREJR?=
 =?utf-8?B?WmRMUERCYlFiQkFFNkRSLzhuSm4yczFreFp5dmxGVWo1UUdycERuWXV2VEky?=
 =?utf-8?B?NnBSVFhIOGVxRCtKTlZDbmFvM2VzVWt3Umk5WkZRdms3WEJNaGdRMWt3bk4y?=
 =?utf-8?B?QXdsZmM0bUNENlAxRTFoYTRzV2JLVlZROU01WHo0RXhXbTE4YU5NR3dnQVdH?=
 =?utf-8?B?emxSR3pmSzdVdTdLMWxjdXJYMkMyNW5WV09zTit3VDdmQy9zaWIwaTBPRlZ0?=
 =?utf-8?B?UExKUXhZQkkzT2dQQjBYdW9zMllPODVOYjB2R1Iyd1RkMGxCeWFnaDRpK3M5?=
 =?utf-8?B?ci9oWVBjWFdWckRZSUZheWV4ZS9MOVU1dVh1K2dRLzE2RFI2NnVHUVJ2QWVF?=
 =?utf-8?B?bjJKNDJ3K28rQUt3UGJOMGJYc2FBZ216REk3KzR6UlpOOFBxdzRkOCtaeStD?=
 =?utf-8?B?L3p4bkRrOXBoUXlVOTJGK3paSnYybEZ1bjR0S294cFoxcXhpdDUzTmNBQkdt?=
 =?utf-8?B?TVpSL0RBdWVwQlFNNU1hNHo2Z2V6dWQwdXVqTTFTNUJ6SWFiYTBMUlJEZHBQ?=
 =?utf-8?B?eG8rYi9qamNOQ0xxb0F1TDlrcXcrYy9xK2FoTUMramhxZzRtb1pIMjVkNzdK?=
 =?utf-8?B?NllGbk1MZ28wbDNPaFNDaTdNQWVPZUR3clZPTmdaVWdwR011Q0NrWHJYWS9k?=
 =?utf-8?B?WE1WeWo0MlQ1cmw1end0ejRaNWxKRFUrNVgxQ2FRMm52blhNS09MME5peXJG?=
 =?utf-8?B?dmVBamdHVEdBdGtWMHBZcUpybElDdnRrbGRLQVdOUFhjTDZmSnk1OHR3alM5?=
 =?utf-8?B?TFJLZHZvL3VZQzZyY3FJOHl5RmMzUk9TS2MxSXBwSno4VytBcnErQ0ZkcDd4?=
 =?utf-8?B?Qy9PdXlScFNjVnJXSTNkaUdyTW9RczByU2hhUTZtWGlCSWJpaXFsWCszWGR6?=
 =?utf-8?B?TFJmU2cya3pIVUloRUEzck4xTCsvZTVKcjFlL01wMUlQeitPOGNac0p2UmdO?=
 =?utf-8?Q?TFCe2Hf81cunh6AP3QI29MY3OlxAFxnZzk7sI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b064e97e-01bc-4d8b-e5aa-08df43911c33
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:23.5468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwBQyhJ6URwi2HtcUxKXDg8e7G1NHjQJ1wBODk9Arla21JzP5lJ014dr03oU+mxvkCBHBX95JIA7Ke434xEEQ4kT2Om8C+HtmX15Vz1xBeB32ji+8r3BDErCE4ifyxYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
primarily addressing RAW data alignment. The core functionality
remains identical, so the i.MX952 ISI uses a fallback compatible
string to fsl,imx95-isi.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley

Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 279c9cd3034a..d0a99f00a45e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -18,13 +18,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mn-isi
-      - fsl,imx8mp-isi
-      - fsl,imx8ulp-isi
-      - fsl,imx91-isi
-      - fsl,imx93-isi
-      - fsl,imx95-isi
+    oneOf:
+      - enum:
+          - fsl,imx8mn-isi
+          - fsl,imx8mp-isi
+          - fsl,imx8ulp-isi
+          - fsl,imx91-isi
+          - fsl,imx93-isi
+          - fsl,imx95-isi
+      - items:
+          - const: fsl,imx952-isi
+          - const: fsl,imx95-isi
 
   reg:
     maxItems: 1

-- 
2.34.1

