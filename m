Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881190;
	b=syCsIEg2mF8RLoHL6jbc+M0yMx9fQsNSnEVnMpvEznGzd7BFG3iscXGSxqxcHJW/aJfb
	 xdCtWyXXXMI0nNNuF8BDTC2hhFZj7bwy1uCG94mJhtJTouazXhFOjP9EraVY6lrjQXr5Y
	 U3mP+QCzM71KUkDCoMiyUNr0q4GAOIMHmpB+MggQBwgpKW1ldbcgkieb2qe3pni7SKFwi
	 7xCc7QgK8yeER7doqBfMABP3lEVc3QE706KaSOCzsRpIW6FA9h8nVZQmrqqpJ+x82dpdP
	 tMrOH7rv0KzXwWsPmrnAWLALfAYQF0jvBIvV9EiHUj88ouvWt69eS1SEOvAhLesHHuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881190;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=Dl4enz8J+87vuPf+GwulMWatcc1pvCwNoKIkR5G0n7o=;
	b=V9qlp9X2AMC3S88wmhSPPlQB5fftUiMFYfp+WzPl39B3Z2QqjEmTlDGWnUQHDUPeo4Og
	 5hlf9GAkC1advaAQyds1giYq9SgB/CRnG2m/1noq3zZOwEapADQTT2RMaoon3KNNfKJq9
	 vSRgGFU21BDqm2keam97undbh176vHXEFu5pw4U0J29TcVytw7lcuPPQj63dsOyHa3j/D
	 ZL4QB3HMGJVfCnEi2b/BUV+HQqsyTbhyCuholnSCENHJCglEInRuoCLUbVJP8CNDveTde
	 MiKMMgmBXZTLKawmBnbbW1BG97sWlpL8oYa2GPlGnhKHn8ZBvZWRh6g4nXgztE2UQ5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=hjbMWs3y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.21
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC2606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AC2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=hjbMWs3y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMnUI5CpUeqs57UGJmvbHrpNO4v2ZcsCAII2x+KGkTHmqJWYuWFYEpV9t8xOnLMIn4+pPcBWvCTsJUyK7GpvXz0DeA0Y64/o3ZLCi7FqF5ZY0Gzb1AJHo99LrzpUSECDoowxc9+TZytDnQTEtaMNHLsOgaMW5LDVvmBca2Hv0TwlRiAyQN7XFOo8O9O1ECbHL0X+k9cdbIy2LhqhdkwKHwsaaOOf26XkjFBWdvvGb8zN5rvlu12T6ZR5JcR3A/fVrWa00Lfi2LHIrRqY80zHUjGsO/Ejm/5t2p0TrCzu6/0lBNwRKrBDydQZQ117NIapfwwMohzDBp8J3EYjJ9caxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl4enz8J+87vuPf+GwulMWatcc1pvCwNoKIkR5G0n7o=;
 b=sqoDhks7dJaI7kIiQ6jywW8TxUVtYPUd5hkVxQIFMJRAWA46YEsBS3BV2fsw8M/7Td0e21Wes8gIr1L3i6WP1zlbKD1hw1ZfEgMLd8/eLAiLSHPKhCv0fBXBcj7/oWUWHYfgHmcD/qfJrQUIfhR02uy0a3e1tJo92o8oB1iCny5rbJLxTHi1CvSptLmxMt5wXTJYq0kQI/rJhM3voW0MnSipFE0Zdh6qCEihmYhmkE1HC4RE6mG3QsAi6kX/bI3mGbs78NXmfxHAukU7BKJe9BE8G1dwjD6C/CZT/HSvgQHGZceebGNQPL8+n4H7eb57sagWC09UA2Du2SA6rCftKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl4enz8J+87vuPf+GwulMWatcc1pvCwNoKIkR5G0n7o=;
 b=hjbMWs3yhThaBG26+AndBukZn2aSyhFjabJZWTFWIF/9TkJiKdq9eW9zR+onFBSb1zoYRmGVEtU8i/bnC342Hp/V1VL0B/5p8uupHkg4kUmUfrJKYM3/NghnapXhCpQuI5XMVmZXxt8ucD5ML8yP/hcXAqmv9erZ9gjW//MkWuk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by DU0PR09MB5834.eurprd09.prod.outlook.com
 (2603:10a6:10:3e1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 12:19:44 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:19:44 +0000
Message-ID: <06025d29-44b4-4ae3-bc82-84185ad786f1@mobileye.com>
Date: Thu, 5 Nov 2026 14:19:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel
 was built with
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
 torvalds@linux-foundation.org, olof@lixom.net,
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
 <20261103-pushcart-very-04a34d0ffb0e@spud>
 <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
 <20261104-saddlebag-starring-4380fcc9293c@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261104-saddlebag-starring-4380fcc9293c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To ZR6PR09MB889505.eurprd09.prod.outlook.com (2603:10a6:910:e0::22)
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|DU0PR09MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6472a0ef-a518-4617-85b8-08df3b371320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|10067099003|22082099003|18002099003|261102123227099003|3023799007|5023799004|4143699003|261022105027099003|261021121427099003|56012099006|261022075727099003|261028144727099003|11063799006|261009223027099003|261026121527099003|261026140227099003|261021135927099003|261102124527099003;
X-Microsoft-Antispam-Message-Info:
	hNMz+dK1OmFTJy5PX/NLgcfLvfAPDKFtzVJ/fE4Dv3nvNxx4GM0TYyyfEdzYZDfzwPxAFfnd6AWqtyln26R8mnBh4qJqR024WMiGOzJv6oZp4oV/zxVPF+XGIY6tyn2Qtac+78pFGLj+yuU+pPTyn6z7NvPL3WswmMyftoDaqf5v+LVEGzzpyD9xQPpTLwmCtYPcfB9n/KVGuGuNL235NItI55Ux3OlkWuCuBiyMY1U4Jd7cIbAgkSQc5JaTC/+m5ez/768g9GesFHnkcvz30jngALfmgyBpfdY/JsIM23IJ+6Fvt8UvLZlTEUr/XaxVFGIAfdQWHvShCdM90Y/Oq/u011vmwece9efjiCIbQjHvMfpUVYF7MPxWuypfC+6u6he3/jgxR2ZjuAUzbxw7fC3fjc0h0FN4NbC4DC356nZnhmxBON0VX+OAbV7ZKElooyrd+pF/ymYrYTql1Im5ALoF+T2MOGOnJrG9+njtFY4EAV1Xi4HT+lLL34Fa+aqWcPiT2sHBrDC8S/3ExmZYzUjzQJU08OVk9/ec3oI16FoKwTTOaPBcSSTPLt024MkJyszAD+EuQZ1lLU//cJzXTxuIEdhN/emtKtFP7w7jH7vkJqnooofxbRqoa48tj06s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(3023799007)(5023799004)(4143699003)(261022105027099003)(261021121427099003)(56012099006)(261022075727099003)(261028144727099003)(11063799006)(261009223027099003)(261026121527099003)(261026140227099003)(261021135927099003)(261102124527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVc5RzFwWEdQN2Z4d1dLVjMzWDFnRWFhZEQzb281SU5MUlhUMmRQeTl5c1Iz?=
 =?utf-8?B?UU1MRU1IOWtCcThYcStHTHNmRVZTZ3ZhYmVDN25tK1pLL0k1MVFWYmR2T1Ay?=
 =?utf-8?B?clFNRVRPL3REQ25mRzQ4V1FCWVhJU3ZaTWdYeE1FaEkxY3dLVHFzZ0FpZVdB?=
 =?utf-8?B?WHVmYTYrMWFDdHpYaG9rUEIzSmNHSUhNM1M2UTJ2SDhoTitXRmFrVGZpYURY?=
 =?utf-8?B?T0ZMWk1hQUk0Ym1DNCtBcjVxWDNYaW4yMHZvRFFYSklkWEJSMGxXeEZqRG9L?=
 =?utf-8?B?a1lPaitEWEpBdGtPNEZXc1pIdFpEUDZ4bWhNbkpnejZxOVBTUW91N25PVGV4?=
 =?utf-8?B?TE5uYWt1SlFEc1ZTTWNMSVFZQXRaMFFWQ28vbU5XSmRDU2NZVlZTYzlldlpm?=
 =?utf-8?B?akd4eUhGZGxZMzZ4ZWlnMkN5Q3laRTRsS3hYZ0F5Ym1MZTQ3Zlh5ai9zVDY3?=
 =?utf-8?B?ZVpuYUh2T1RIN0xnMCtYcUg4dEt1eEZ3Y0JUbkZFbmNTV2JUbWhkdlFPdWNl?=
 =?utf-8?B?dEJ0MnpneVI0MXVLWVRyTWZYaXU5dEx1N0g1Rlg0K0NOK3hEbTNLY1ZIeUZz?=
 =?utf-8?B?c3NGRnpyKzkrKzFUWDN0UEl3ZVVHMkt6SHV3V01kM0tuVytUZXNKN0xrUmpj?=
 =?utf-8?B?cEV4RWR6VHRaTjQrV3BNUXBvWkluL3NEaldDWFlEYkJuZjZIVjlycDJDZnJy?=
 =?utf-8?B?L29XYW5IQXFpa29jcFp2dVN4Zk41dGVhd1hSOUsyRFlqUVFiRE9GWGJEQ2JN?=
 =?utf-8?B?U0YrdU5pSDVRWE9wU0czMkZjZ0hoRUt4Y2tSdVVqRzJzVmJYaEI5cEZFVDEw?=
 =?utf-8?B?Rk9YdU1ydHBqSmR5NE9SUkJDN3RwMXdwVU1tYXdvZGZhc1Z0dlBGWmJMR3Yz?=
 =?utf-8?B?QkVadE9tZDAyVW1zU1A3UXh6OE1jUUxMSHdvT0VEMTNUOW5iaGRYT1pzVG4y?=
 =?utf-8?B?UXJVTmZ2R0l2S1lPaXd3YkZ4S0xxbVA3YUs2MkdvM2FSNU5iN2lXdkVrYy81?=
 =?utf-8?B?SWtnOElQLzFLRFhpeVBuSEtIbTJPMzdmS29GZC9jKzkvZDgrSlJPNk1OR3NY?=
 =?utf-8?B?U243NGlFaFdRaDk3alVoRzJwNVZ3ekNicUhhUFRYTFg4bmIwZXFCangzck9r?=
 =?utf-8?B?NGdPR2ErVm1ZZEQzMUpicm1ZZHBJeHlaWjhEUDdVNy8wUEtLRnQybWhxUHJT?=
 =?utf-8?B?UkM3eldBSGtPdDFYOTkweXZHZk93UTZlUmdoVktEVHMrVlJoM3VFUGc0WDZu?=
 =?utf-8?B?M2JCUUtrbzAvbmVqOFhNNTB1NzdERy94QmplVXRkelNnOVp3ODVWMURkbHJi?=
 =?utf-8?B?ZTZ3cnF2L2Vqd0pJTkxrYjdvajhFY0xZYlFabXZJQ0lFdENXNEVsWFJIaFlh?=
 =?utf-8?B?M3lLb3RnUEZOZVN5eGlUS3R6OU5aZkROZU4vNDBCOGIxU25JT1Ryb2FsRlc0?=
 =?utf-8?B?MkdTdUZyVkYxTDAwYVRDK2M3QjdpTzE0d2RhME9obHI2dEFSZlJvekJYOFZ4?=
 =?utf-8?B?dnhualpiYWhjTHhqeGdOZjNic2xmVDdqM1EzR1dYMVZ2QUorOHYyenRmNGFV?=
 =?utf-8?B?UXl2QVZZYmtHZGc0K3RjVG53YVhXcU05emVmZklCY3ZUckhlczg0b1ovZkRD?=
 =?utf-8?B?eTJ5bElxQmJVQ1NqMFJuWGZUWHFodGp6ZVcwL3p5SVV6dGs4Nm1idmtPUFNn?=
 =?utf-8?B?QnNsTmJsMzFxcWF4a1hOUkZEMnJxTXVHajVGNE1zejV1L29uQWlhUnJtVWFj?=
 =?utf-8?B?UTJwcEFqT2I1MTVRNUlleUh0bDA1T3pjUEhQVTR3MGF6a2F5a2RJNXpXUWQ1?=
 =?utf-8?B?REdOS3pSVmMxNG5wSkFaOUJzeVd5R1pXeElydzdCbGhzMUVOWW9iK2U4eWpN?=
 =?utf-8?B?S1pWdEZGaDRrdTNKeG8vRkg2UzdGQWhUamc0aWltMUw3OHZiQzlWOE14RkJo?=
 =?utf-8?B?emg2RGU4Q0pYMzQ2MjVrYi9NLzJCWmFJckpwbFZkbCsyODVpS1JRWjBMeG5K?=
 =?utf-8?B?dnFSbWFtUHovZkJpazVWSWlQdnRVSlJMV1NKRHYrWHUvc0wwZ2YxMVBQVWEx?=
 =?utf-8?B?cUI4elFkNUd2Q0xSWmZxYVhQM3NXcFl6dk4xRDk5OTdXbHcrT1RhckJFdENq?=
 =?utf-8?B?UXE4dEdzQVYzaWhsb2xYdXVaVXI3RGFES0kvUUduaVV6dkErYjU5Tnc0bmNY?=
 =?utf-8?B?c3JKcE5RWTlETXEyQ3FWU1htQURDdTQzV1FVc1Y0R1JmWEw4ZXg4YTYxTnY4?=
 =?utf-8?B?NEpHZGs1MmxONEszaUJJeXVBUFdJc3ZCS1BtWGdteW5SSzc5dldYYWxwUUpE?=
 =?utf-8?B?VzVvRlgvWUM2SkFsc3BxN3IwWnQrMzNRQWEvZThXTXlpdjRMVXlCZz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6472a0ef-a518-4617-85b8-08df3b371320
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:19:44.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDnoVqiVS7cYxbkTaE7OSMjbnf3xWO8iptpOnwNJoLeg2WVFa34u3YX/yPp5e5/X96rwRIqgsr+Lc/d8966YNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR09MB5834

On 11/4/26 23:55, Conor Dooley wrote:
> On Wed, Nov 04, 2026 at 01:23:52PM +0200, Vladimir Kondratiev wrote:
>> On 11/3/26 23:41, Conor Dooley wrote:
>>> That got me thinking though, I feel like this breaks some of the
>>> extension parsing logic in other ways.
>>>
>>> If you putting zalrsc and zaamo in your devicetree, we never do any
>>> backwards processing to set the a extension (we don't do this for any
>>> extensions by design, we only populate "child" extensions based on their
>>> "parent"). If there's some userspace thing that expects to see a in
>>> cpufeature or w/e it'd break. There shouldn't be since a has always been
>>> supported but who knows. You need custom userspace anyway so I honestly
>>> don't give that much of a shit about this going wrong.
>>>
>>> What does "worry" me is hwprobe. Currently you've not modified hwprobe
>>> at all to correctly state that you do not support
>>> RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of whether
>>> you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)
>>>
>>> Maybe, again you don't care cos of your custom userspace, but this needs
>>> to be holistic if it is being done at all.
>>> Personally, I don't want to lower the minimum requirements - the people
>>> designing this stuff to run linux should have checked to see what our
>>> requirements were (and have always been...).
>>
>> I will drop this patch and keep advertising "a" because formally it is
>> true - all "a" including amo instructions do work but rather slow. Also,
>> not worth to complicate logic here for (so far) one very special SoC.
> 
> By that logic, do not complicate the kernel at all with this zalrsc-only
> stuff and drop patch 1 too. Please do this properly or do not do it at
> all. If we are introducing the ability to configure the kernel so that
> it runs on systems with only zalrsc, people should be able to run the
> kernel on such systems without a) failing to boot or b) incorrectly
> reporting to userspace what the hardware is capable of doing.

I am reading again risc-v spec, and it says here:
https://docs.riscv.org/reference/isa/v20260120/priv/machine.html

"M-mode can also be used to implement features that are too difficult or
expensive to implement in hardware directly."

I read it like the feature implemented in the M-mode trap considered
"implemented".

Thus in case of AMO emulated in M-mode, it should be considered
"implemented" however slow. Indeed AMO instructions are executed
correctly from the S/U modes standpoint. Program compiled with these
instruction will not crash. It will run quite slow but correctly. So
proper wording would be "slow ZAAMO" and not "unsupported ZAAMO"

Is my interpretation of the spec correct?

Also, you accepted patch set introducing this p8700 SoC with "A" marked
as "implemented", here:
https://lore.kernel.org/all/20261103-agent-lagging-d7fe1c9334f1@spud/

I will follow this direction, keeping "A" as "implemented" and offering
choice to use faster atomics implementation for such system

Thanks, Vladimir
