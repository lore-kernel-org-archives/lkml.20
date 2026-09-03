Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9C50AC20;
	Thu,  3 Sep 2026 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463911; cv=fail; b=Y8lm9IOuXYCYFmkP4Q2MFw7uy7smy0SQDBMQccYS0DiE1VI4OS6ycLYWb9m0oUURtoXG0RT0h4qIB5CAWTUsT0rQX7Cxu1k0epRPZ5/7N5M/ZCL5J5SmmeDL0Dg9gFb4CU0C01eyWKCQ/5Cxv9W+iqrXJ4iPO0+o1tL5kjlG7Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463911; c=relaxed/simple;
	bh=pcYUxaj4pwuYXKmq6RSRRC3grJ7liLU2lJdHSF31Y74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ds0c5ANLwY8YGQZYYA9RsQBMoGb4GOAGnTGayTP3qYg+LI2vSmMlcVbBT35u2BFemF1ghT3CHrSbjKuEIuIeMxq3f4AlG5W0AuWk818Z5j2xf/tL1ZTByTk2bbAn38I7jQTxvRj9JOb+7aErI1ZEMSLDik3NIR1li6gUusV3DlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xm++H1Qg; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xm++H1Qg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZNLQsZJ5apUuwXm8yPOlbiJN4e5lEXeIh5+o82qOgLeo81Z01DhWjcPwUA9AwJvkljyIHk+j80VDUzLDij32IlF0c46gx8mpOglZfRvhUYOtkGNaXFsYkExLMhlP859cr/CLys1HxsGlgdj3+MBpZnjYLgVE+mZNKBkx1tFUF4DD67KYsEbmzYRiCRtqWnrBvMPPkVYT6Au8NX7NKqDKnRgCPlv+rGdUmDWvJB8lYrarf2HpQ6ai/9ywOvEhgqyTiAKbxMYE6ANNR5yAw9CEqDkkd0pAAvV9OeWkDNXN+hcWN4mM6QtA2chq8JDyNyeFuaWGkgjle/OOfV4Mueu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUs4wZMmB87gLFZzhktBaFtgIa5c3uGF9xnvTJSNnXo=;
 b=ZgwrnyDzHkSWN3RGFnaAlX+mNYPJ6rRKjzIOVrr8TLX+UrT8Da43BkICkqI3erUHzRlA25N/FS2qY3A0KfhigQr7GBzNpFk4QTwStVi9r/fShAqXSe+YNrl8aLfchNRAtjnVbocXyjCDpN6CYK5U8dvQ1THpPjVeXS1kOiA1J+dQuxoxy7Zy4cnXrCaep77dAXJgmXfY7gesYmuwLJhnpinlVlFoKGYiHZGiovy5zQY2aRxae6upvlMZM0RPOcELTBFWo+hYRCQI1X3Anl87G12lIFE9mfHx8+WqfHmFI0P/gWpW3p9i7RyCq0zIl1e0hAJMK+sjBz3RQp8ekxfbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUs4wZMmB87gLFZzhktBaFtgIa5c3uGF9xnvTJSNnXo=;
 b=xm++H1Qgz3+SOFaWpDUiBUA8bmICT8akUJ+Kgenk0ZFVTuoIeaGY4z/P6+yroOm0TGX6AtgjbO1Hc/u6QY1/tegEkZgsyB0+E7w22mBcZT5bAsEILCR+vyCOz7q+zpo/XvXE283VfZ47qN6ePGMp2kr0ydihmijBYrx8FHXNZgSlHs0d6q7KVewKLM7w8ay8DLSiUtaiJId8j82/KuFsKB56+TQBr33k2cutOBFVor7liPTHGcDxuJLpEngYUYYFFw6M+BdUZDql1kJ2Jn0qv2y8+43EghX3BPCkyp9aQ3A8mBh9lQR1prs4cRpPIizZnhGZqlO/2RWPTORwd1bPRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:31:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:31:37 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/17] arm64: dts: Add MQS1 sound card support for i.MX9 EVK platforms
Date: Thu,  3 Sep 2026 15:31:29 -0400
Message-ID: <178846385187.3156663.16228382252430873369.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY3P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4034e5-9005-4f83-8de3-08df09f1f850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ypc//EMl+81YFSQAhlZLsGcn4YoDIP5m6VfHvB8HmjS2vfdoIPE1bMOWi2g3oLMaUInhX+vMK4HFSFLxZZSgqO+MyVEm9GQZ95gk0WKA6CZ6/lFqB2MExC1K05E94SSFRTcAD7vDLdEU9bsrW7/7OmoGxNtydnrdEgg68iDxWV85sjSFCz/SNHSL755miuN8RqUXYif7A7hd4azkId7AuGRRC54QY9him+XTZjmb9TcziCKRbdjsHGpStXfD11Fc8YUZoy3hM9Y8ELN1m3Qrx/Z0ih9CBNxJ1zYv3eZy7uY/5n0oSm6jfsv9oqvUiis0LLxxw7g9nXWGJ5hYlV29Hmimu84alT2TQHg6cEHtLX3Adct5F+Kebm92x+ImidrPUsNdcyT/YnZTHx/jXeYG127+Tgvq00Ty7qiGhYpltpoJZ/DklJoVq/qHGgmImfnPAkXeL5HMVuZySOke2eMssER1S9KXymxNmAY4tU7z1DACTUaEGW/xxHDDO7aVdDGFb7QJ7UupJH004RX2O+nMVx8nQx0ci4YH5xxNKOpOy3zD448ZAQaBVXcWgRF9l92Dr0oQG3iog0FobXcb3PP/iIhgx4bZPi+D8UuUzFE2vKFwpBsgnSZMUhwMWbA2xffCJQSDGyfN1Vir9Tn1X47lQJE/LBN7VUJbkeRmkdWfpgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVI2dHU4cU1KMk9qRnpTcm12RTBiSFZiUmlRVFJlaVp6blJIRW5EbFpDdHQ4?=
 =?utf-8?B?R01zc0RuT3lDV0d3RXpIWHJuZjl5VkRLU2h5NUczTU4vRHltZm5RckhKblgw?=
 =?utf-8?B?ZEgydVdCcmlIK3RLSldMNDdwWnRJSTB5WElDV1dBUkhUOVFDQmQ3WncvS3Fp?=
 =?utf-8?B?VURGdnBNek12MzdKaHhQTlRQSjJtdlFiU2NLd3U0bS9RSHVBQ2dKNU1LR21I?=
 =?utf-8?B?Y01uVGkwSlN4dmtKeWpNYTc5T0tHdzAwQzMzN0tkTGVaam11ci9WL3JZVFVY?=
 =?utf-8?B?WWFaWTUvRDlha3IxcnZCcjFSMDRob05vL1o1WU02RC96MUphazVDY1gvbEgv?=
 =?utf-8?B?RXpZcWxEUGdyRWh3K3NzOTJLYnNRMElaUmc0TUtMMUZ5cnJXem5mb1RGNU41?=
 =?utf-8?B?NGdSTXpUODVLN1lENkllNldwRy9jWHF4b0hIQXB6cy9KM2lkTUhsL1p3WkVF?=
 =?utf-8?B?aDlRb0Nrb1Q3ZUVFYkkvNDg5TmxhSHlSbFRhaEk0Y0hUSklhNWlYRkdSVHNK?=
 =?utf-8?B?VzJuSm9sTjlvMGlqY0ZWZllzUHpqMndLaFZ1czhmTThYNUtKRFNISTVCcHZa?=
 =?utf-8?B?dGNaRU5DUTdqd3IreGZDNUw2S3UycUFSSVExSHJXdDkvUTIvK3JzaG9GS2Jj?=
 =?utf-8?B?WjdkYnI3TEI0ckY4Q2o3dy9DajYwZFRTUHJralNmZ2tnRmpURHFOVDZiZzFy?=
 =?utf-8?B?SHJuZnRtN1VSdzhnMjByUmFLL1N2OW83Y09NOEtFYUtQbEE1RUpCaEJUUVFL?=
 =?utf-8?B?UjMwaXFvOXJhbGNoR0h4a0t5TlNJQllJY2swdG5Ca2xTdThBMHJZMVVNSElL?=
 =?utf-8?B?Tk5BRmU4N3dDeG15bTNOdFVvWXgzL2NZRE9nVFZTL09SRmQwZlBVd3c3STFi?=
 =?utf-8?B?cW5ES052MXF4UWtkRmlSUDc1U0M4SlF5Rmt5UDhyYzZjbCt3MmNSYlVzbTNl?=
 =?utf-8?B?dTUzbkIzb2lyWi9QaUN4K1BUMDcwNmJOREk2N0VGbSt5RTdQM1FkM2tZMXBP?=
 =?utf-8?B?U1IyeS8relRWTzBhWU1VREl0QjQxMkFHN1JicEZVVWtNaEZZcUF6b3E3b3Ay?=
 =?utf-8?B?VGI4NjZsTHVKaVhHRTNoRndyNUZWaWt4MzNFc2VvTW1nbzFtNW16QU05QjRn?=
 =?utf-8?B?Q1lKYXZHMCtFWG5NM3p4MERKdjVlbDhjcDlXbHJiVTYvQWFMMFVLNE02Tm4w?=
 =?utf-8?B?Q1JUWTJmdTM2K2JsWWFNaEUxbEJLbmJjU0hsTnVZaFNhRFluQXQ3OTZhYXV6?=
 =?utf-8?B?SGJaQjlPK3RBQVdsdWFqVkVSdWtMVXM0RGtaRSt3VXd2T3c3cHV6TE1yM0Mz?=
 =?utf-8?B?ekZ5c0NUY3FBZ2tOaHdkbytYV1lvTDZpdnloRHR6K09EQkE3ZHQvcXhvRVEy?=
 =?utf-8?B?dGJzY2c0WEswSUZGRG8yeXpIZXhJWmY4S0FRSk1wdk50TTEzbElEaWFlcXpW?=
 =?utf-8?B?WG9FYVNqSFlUQXkzMm9YNWlqdFZFdlRFMGFXTmdjbTZmc1haVjFEb29XOFI4?=
 =?utf-8?B?QThJK0NVZFdYQm03aS9nbkhZMnJERTVMc3N1UFZFWnFtN0N4aDczUlE2UTN3?=
 =?utf-8?B?c3JsbDdyRnluK3NWa3FzUXRIb2pkT3BHTXhGWXg3aG5aZHV2aTZ4dWtoSkEy?=
 =?utf-8?B?VmI1N09qTkFDcDg0UjQ1MklmaGpQNFZjT3ZjSG9ZWUwrN3ptUFNnc2ZJMFNM?=
 =?utf-8?B?NGRicEU3QVA3ZUhodGo4RitkOWdFdE9NL3labFpJaHB1cW5Zem5zMUhtM3NY?=
 =?utf-8?B?T1NyYkM4OVRXcnk1ZG1IbHdEbGgwRG8zMU1TejVYVTgyNGhqZXhuZzU2ZHFs?=
 =?utf-8?B?YTVWYlVldUFqcXQ0aXJYaTNueitVeVZTVXV3SHhUblBjeTB0TEJNOWNESFdi?=
 =?utf-8?B?a0IranNCTTBWQlpqSHhTSzI4a2tobm0wWE5icitmR0t4bHNheVp0dXR1RTR4?=
 =?utf-8?B?dGlURHB3cU5MTWJoQUxBcGdBUDY0eE8zc2pmRXpiUGYyUjI4VnFJa3BHa3Y1?=
 =?utf-8?B?amVDNTFHVmwwMUJYbXRQOHBWaXcxeXZkQ095ejBkRm9vTnI3TGZadlk4SmNm?=
 =?utf-8?B?WE9kRTBGc2t0VUFaSmhpSUNkMS81YVViUnhsT3l1cjNHUnF0UUl3Sm56c3k5?=
 =?utf-8?B?RjN6UWh3WER2elJPRE1jdy9GSnRIbFJrOW1ZSGJMemVkbGUrRXNBY3FZMU9S?=
 =?utf-8?B?YnpmejZ6WCtQc1ZobHJ4ekcwbjF5M0I3NW9GWmVxR2pHSXl4aHFNRE1TampJ?=
 =?utf-8?B?MnlBcndhOUFuajJuenF2U0ZJQlNvZXd2aW5pYllZNDJTY1Y5UW9pRmNxVjMz?=
 =?utf-8?B?RzBVcUE2cjdLcEs4QzljSGd2amFqNzdnUGlmTVZSenhjRHZxanVxWDRRWWtO?=
 =?utf-8?Q?kWqoQlP21uLMXesTzB8eR0hMYHYMav1WfePk/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4034e5-9005-4f83-8de3-08df09f1f850
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:31:36.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcF7dSG4CK/uZRlKyOS+ARcFKLEN7LCS+NYb1bq75aaejc/x7MQnNCugF6P2wS6bVhaOwnJTYBWkB7xrD6Q7+rT2hkbxRm/jl+BkWbC9oK2YIyWKD98zmJGlSmvNhsCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984

From: Frank Li <Frank.Li@nxp.com>


On Mon, 24 Aug 2026 11:20:03 +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> MQS (Medium Quality Sound) is an internal audio DAC available on multiple
> NXP i.MX9 SoCs. On EVK boards, the MQS output pins are typically shared
> with other peripherals (CAN, PDM microphone, etc.), so enabling MQS
> requires switching board-level pin muxes and disabling the conflicting
> device.
> 
> [...]

Applied, thanks!

[01/17] arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
        commit: 1e2a3d4a57fda613cd5127da8286183115a6b2d6
[02/17] arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1
        commit: 3d25b0671b1b6395d3f64f2895ddcd72d04a9275
[03/17] arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: fb33393964e4fbc4e3da2e0543830a17e2519d02
[04/17] arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and MQS1
        commit: 88f5a21dfd1ccbfdb1ac9bbea8e6603013e813eb
[05/17] arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: 3feae53c3fdd3f0860e63e511b8c1e8d3d58a0a3
[06/17] arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
        commit: ef9889f3421da84b46dddbfd93f05574390f8c2c
[07/17] arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: e3503236b06af1ee92d5bbc298c6450aed4e06e3
[08/17] arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
        commit: f33c249355b29b6f9582ef41b69093294b3d63cd
[09/17] arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1/MIC
        commit: 9e1ae128366b6f6b2aa4e13b2f7b62c6744ccfa5
[10/17] arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: f3a2aaa1dcbf46aa22a05f7d8ea823e2942b66b5
[11/17] arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
        commit: 117f69ab74f5b95206251fa50eb3779e4b254a18
[12/17] arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and MQS1
        commit: 810b7a200ce88136fa822c8e7258e0a4fe481a9e
[13/17] arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: 7956a20c9fbca9036f417fbc50e8e17ed92d09b4
[14/17] arm64: dts: imx952: Add AONMIX MQS device node
        commit: 2fa5c26d926322c7aed9c59740eb693da2335971
[15/17] arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
        commit: 3bedcc4871b1e1e68ad755bae40567aa39183d50
[16/17] arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting devices
        commit: 8b6cf4986aa5436f3aa7f4ade6cd353e521669c6
[17/17] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
        commit: 153a8f4b71cee0e6ade27d7765de730af530653b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
