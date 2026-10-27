Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793136112;
	b=iRa/NiWgKPBPlqKTXy197E/GerTxwr9uCwcdIAv/8perbtveXcHfWbmZ6EWsnXZ7gQQI
	 5zZ/pGckm+DC2NDd9z6xBw6EvVnMiV8lLidcQQawOayYgT8kXlIHePiAll7jFbSGrESbX
	 OsyMqe6fnY5dCp5wvZ+gu84T/Ec2tPI+sgHGbSh5zGRL04QyP4sjl5shM4+kybmiyCSBa
	 p2uIMujhTBofTPJkm0VFDfRA56kRf13ZMQOD2cwtUSWQtxJEvsXZf/XtFlcRnk+oO4fh1
	 Y6tP353hFsjCaSEVRj/07vdl7hKIR82wIbKU+oyBDBN/UwP2uXQO1mkoiXSwDJpuBmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136112;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MszK2b39TiNQK4E9xoalkTwZvjcxSNRIUnOyqHVl01I=;
	b=kpbClU/iHHJCMxI0Q8bX+O2xNAUNpGHwhokEUnOW1reA4Gl3kaAH9pUZxZvKrawa4hXq
	 DN4pZFINsiC3nc11/m68a+illRlEqtAe6x7e63IGWshfru+Jh0HfRuIKa6+54qTiZDHN7
	 kRjRXWYbKAYqwuHMK/UvELZOW/z6VUWTAuIGK8vk0hebOCDXZPgPbA/7p+T3rmqAzZkLC
	 LImrAqA2DAokay4L2tPfUqHOEJylrbpGNAcR+HQdH8ugZtpsv4ns99QqLC6rFOy+/eMxK
	 LCgr0ChiuelD4SKN0CyWTEjsEsQ2qhKUYUuZ5Vc3ZtHSD/WeNDyYFtFw5x1h4d28HZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=axPQl6oz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.37
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C53F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=axPQl6oz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vU9Xb6aPlQy5HL5MKct5DiQqgo/lYyZJTGE+viWP3MWL3V+yAFGMjvs05AV5YjJM3BajGKPDjK8V+Az/jyljLoML2NyzNpYGRCphnZNnmSkyc+RpWV4D1B+X8DXLaARwyyasvJ+0oM/kiSyZe6efpQ4VIn+N/nu5k+62wKogOo5Gy9VZEOHQRPY/k+OH4wzL2mLsTZtw4mWAvVqS8fsHwBieRPXvWbqqf7QqdKbCIgFGWa7Pt0mV6tq6/valjx7PQfo4/YxRtDtEd0C11vGjW+1bRISfAezKZAkIiGWNe2O58i3IDjgxiwlo5coshw63hnRylOvIMNsI3Bn/a5WNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MszK2b39TiNQK4E9xoalkTwZvjcxSNRIUnOyqHVl01I=;
 b=Ms45q34m21NSbuUNKUeVkfiAyOnmRfAsWQmrclEFomgvy+fgx7exYwy0URH1kJ5LaTg+T4mvYE/vXUf+Aev7EdmEGiG0ruenpYvZzY7AYtTp0EM8XdXxBDWJ6F+WyWqxh77n+NJs5s1eRnBj5SnU26FUR6qaMOMiGmNKERIVqkWDP5wXo4lhq0ywJjCG8+4PltXp0UliKcPocNUMSawlJ0St+VeE62qW8FrlJUKJkVYTCXqEkPTD8o/pZTTVOYgfqW8h8jWqBOo6WqR1HjCtC6OXnNKHU6Cks69nu601AOFmhi94cg3sTP+et/S8PGpuqxRFETjhm4MSxK+07YySDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MszK2b39TiNQK4E9xoalkTwZvjcxSNRIUnOyqHVl01I=;
 b=axPQl6ozps2JtRmz7cLg+tHb3MfUjXK8LVz5mt0b/SGRSEG3Nhpk8Sw5iY/i6OtjFfd5GHAdzPA0ddFc6AiZlhiDqw2dpAte4MKVItD7NYxCJ1UNJX1ztOwcFeGfBrNW4LcJcelOea+C7ZLPlb2NUxlVvaeiFhl70GpKTaUr0GxO5dv1aMhY29OOfduVKOr24lf3WX/HUFVKl6INsrtqkaN7hJeIX1FdWuBLnHjVFeN2AsalcPWKjTepmee2B08hqd1i8LgBcEApZUzR5GguKeDhDs04/m61ExysjdDQE0ftDfRvZKGVG4EXmIVWUck0MKHQiowq2Pd0vhGU0bFjHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:21:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:21:48 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
Date: Tue, 27 Oct 2026 17:21:40 -0400
Message-ID: <179313607406.344724.6134525075748073104.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ebb2e1-a558-4bbe-6d39-08df34704f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|261009223027099003|261022105027099003|10067099003|56012099006|261026121527099003|22082099003|18002099003|261026140227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JuATlFTR/e4aSmkt2dcp1wm16QuCdyBhLLFAAiNpAsSEv3XV+ZNi+RFq2u5NNOUQBwNUkq/PggTsuSWneoTbdhWGZIe9ad0lHo0cbH6NgguML9gVUIS0zpriWP0cCvXVqsYz+eEi1c6G6kwXR4jldLN9KOjjlf5ikw6igXUN/z8C3YxMqjDvFuKWK+bmMKsheQgsl7/nU8qgh7N6fd4KFKRjcMadxmHWMAJf5fL4izmoJ1Jr3LLpSiTBCUiJ8jXzb+eLRIrnCxqXJJdd9eYAUEqrkAL//rmqgOZyFalD1HbPnhhCbvjZ9ggAKneMWRlA22UviwRayGG3uYeJKnUEOE1yMT/fo3JRV0HBSTIf0ZjeiDGv7tCaRN8G9/9tmVUiQGmnzTilb6f0ae3sTSs2OL1E7ye602LU3YiDKK9OvlJa2ww6OPPtSPsVMlFANAZS2iQXhWXNk/57UOqw3pxVlb+xs3doUoYUZ6k7gPcmHyez3Z8svyLh9FPSgAoHusFl8UoRcoB+/g0UqAS1xqeWtvLvrlJ0wvrUE1dmLkSot9Y+bNRXl8X8EZTo3l7MElGUbwh37QQlPsycw/etYGOIxjYUf2uh0pw4i2MA/JyU1bBPZHu6YUNsAchrhSqUt6Zw8bBppAqEgrFT39evgFtINagsqPy+kMejl1eCMgTxVdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(261009223027099003)(261022105027099003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(261026140227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEFQU0RpbmYxenAvQTlyVXRhSTJzcmM4VDdPSGgrclhsd2ttODhaOWpmeEZE?=
 =?utf-8?B?eXBiRFR6UFRGUkZDdEFTR1RLb2xvTGgyV0Q5YmlmRVJOME0wUlpSK3BleU9n?=
 =?utf-8?B?NC83Qy9JQVhleW5ObkYvY3NpUGtibVBWVEpxUjVLUWhlTE5NL1ZZOHVqbGt6?=
 =?utf-8?B?Nmp3Y0JUejR0dUVuOE9VV3UyR0ljRXBPUzlOMER5Vzc1NXJsTjJlRG5CK2VP?=
 =?utf-8?B?Sm9xOGJaNGhuT25LTWVxSkZ6WmpCZXY0Yi9iNlBRQnVaa2ZTQ2FhSEVFZmdx?=
 =?utf-8?B?cXdCckJoRTNVOXpJd1A3VmpDSHc1QXlUWFU3UFQrc0swZzJ1T2dQQUFyWDRp?=
 =?utf-8?B?dXZKUURiWDhpdVR0czlGVnc3RXhqa3Z6TG8zd2VwZWdTeGs1WGM0ZjFJN2dV?=
 =?utf-8?B?ai9hUFlsQm1Hb0N2VGFvMjFzNjREd0hQNHJHRHNGbkNWc21sUUNnd1Awc3cx?=
 =?utf-8?B?ZUsyMVVLL2tTUUJoSzJWeFZ4V0wySlI5S1dzcVZpV05Za1VQYmxFZ2czSTBy?=
 =?utf-8?B?a0NZMnNvQjVxdDFRS3R4dWo1VDZidUV3UjBteG44UFFmOS9lbUhvdGhaN1hJ?=
 =?utf-8?B?TTdzYUpXbUExT0tlQTlRQnFDSm9TSGRnZlBmdUtLdUNUdmhmdTNCV0ZnbUt6?=
 =?utf-8?B?UnFyRHFwQ0tQbnphUThDL0VQUUMzcjRUcDZmYXRBczhyTEFONWxMRlh4NktI?=
 =?utf-8?B?R3Y5NTZQUWVVL2R5MlFHdVpxaFNrajlIeDg5MnVLSWt5SHBlRkhOYWtZVFNJ?=
 =?utf-8?B?SElSdUtXQVMyR1NHMkdnUGNmazNMUG4ram1aK0tsSGw1QU8xSEdpWDlZZGsv?=
 =?utf-8?B?NnJSa0k0elhPZ2RaUVk3YmpXZlNBZnFDbWVTRCtCc3Ryc1YvcVZYc1dEem1y?=
 =?utf-8?B?Vmsvc05yK3pRQ1ZyRk1vTVZLcFVIbVJxRWlsYXMvVzFLcmFlWGVBMlBySmkw?=
 =?utf-8?B?M05SMGlTNE5aaFJTT3lYbG1HcmRnZklwc096R0VQd3lTTlBKVTFQd1ZsaHdz?=
 =?utf-8?B?cTNFbXBmUkJkb3ZHUUlKRDc2Y1BGMHZ1K3J1VHZrb05wVitxK25MNGRJWjFO?=
 =?utf-8?B?bUljd2I1Vk5mVVU3RzFPQ2FISjdRamZ1M1RORHpsU0FNUks5R0lhekxLR1F6?=
 =?utf-8?B?dkJUb21DK2Uwd2RCYndYMUR6VmlleER3MVpOK1JzSFRiczI0Nzd4b0ZKYUM5?=
 =?utf-8?B?dm5pQ0JsV21aQ1drekl0d1I3VC9iRTQzbHRMWmIvMk9OWVF0Z21odmZKY0JE?=
 =?utf-8?B?UWxiaGk4VkNlZlVQYTRVNEIzQWNjdVM1UktVVDlWZjZHWGdNWi94S2VxNFd2?=
 =?utf-8?B?enBRRlp6azdwYS93ZFpnMFVxclYwSTJobU55blhFTDk5Wnl1c0Iwc0djd1Yy?=
 =?utf-8?B?NUZJbDZ0RDU5ZnU1TFpXWFhzNlJOZjBSZk52Q2RhUzdtdXlJeGRHdFZFa2RW?=
 =?utf-8?B?MnRPSDZBS3YxeitVWm5JQVplcVhRTThGNEY1RFIwSjk4T1VQZW9BUm85Sm5n?=
 =?utf-8?B?MURYcU5XWEdnVldwSTNTZFZoekJaemdLWWI4dEw3M1pHQ3FNcmZKbzVYQ3B6?=
 =?utf-8?B?ZnNGZ1dRZDZRZlY0SFpIcnozdGxuTUlzOGRsOWhvU0xvbmdiQ1M2NHFqblhF?=
 =?utf-8?B?R1NOSFBNYnJoSWVEcjNTYWtXdDdOcVhqanRTcjRMWWJOUGxuVXhBVDF2V0Vu?=
 =?utf-8?B?akRpZndXVlh4SHl5dGpMNFBnVzg2VE5tTURZSDAwQ2Z5K3ZXUDJhVlV1czA2?=
 =?utf-8?B?bGxxYnY1QitTMHVIUmRRRmRHNU5Yd2RUOHJiQkpCZE83a1ZyMGZxWXFuR2Vm?=
 =?utf-8?B?QWFTVHNITkhZYjl1YSsyWWVrZjdYK3NJNGIvQXRrWVVIUlBCcmYrK0duRGsw?=
 =?utf-8?B?SUIvb3M2eGh1QUdFR0Z4elVIb0V4Vm5xeHhFOWJaK3FkbStaOHdsQ1NOQUtD?=
 =?utf-8?B?RkNYa2hnMGNLTllyUVJVdjN1NEtkUFZoamNRTGgvUk81MkpzdWhScGl6MVRU?=
 =?utf-8?B?NWZ3MkRobFplWnM0eGtzL215TTFXRExjT3E0ZVRnWiszd2lmUTNwTFJRQW9j?=
 =?utf-8?B?L0F6ZTFXYXppMFgrejhKTUVMM2xMS3RMWG9tV0t4V1NOTGl5YnQyS0hnSWt3?=
 =?utf-8?B?Ym9TcWRtVEU5K1ZwWVhKUmh3NEtmWTRGcVh1clQ4eGNaVWo0MXYxbHBIZ255?=
 =?utf-8?B?SlNRS1BZTUxBUDRURENnbEFUeXRHUDNRU0dPRjJEejRwOUpNOGFxNCtERXI2?=
 =?utf-8?B?ZnkvSDEzeU13QUw4OThEQmFmbi91Tm5aKy9uQjRUUmtwM09FTkcraEdVaWpQ?=
 =?utf-8?B?SG9VQVRtQ2pWS0VKZ2c2dlpjdG9ESmJwVVYzRUo2eGZaSnBuZC93cFRWYjBV?=
 =?utf-8?Q?1134DjvxbLXfvecpCabGao0KTin9IS0koKiqv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ebb2e1-a558-4bbe-6d39-08df34704f81
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:21:48.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55Q+VxDd76Z6zz41m9Pmr02NzAWtcrVF8xvCC2McfZoKF4eoNpnHFEckeUfvBVytLx0wtFPwDeLBzAIm2GA4LJInTBXGZSWsC1Hyo0PncL+W4ltDM3ryNYnG6j8Gglt5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455

From: Frank Li <Frank.Li@nxp.com>


On Fri, 26 Jun 2026 22:37:35 +0800, Felix Gu wrote:
> When clk_prepare_enable() fails, the error path does not release the
> clock reference obtained by of_clk_get_by_name(). Add clk_put() to
> the error path before iounmap().

Applied to imx/drivers-intend, will see in linux-next after v7.4-rc1,
thanks

[1/1] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
      commit: 7077362fdfbafa7febb94d1c595f6edaae3b8c3c

Best regards,
--
Frank Li <Frank.Li@nxp.com>
