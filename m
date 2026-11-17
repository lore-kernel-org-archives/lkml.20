Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932044;
	b=besCcaHViLFBNAVJKPe5BKptVxpByxgqS0h1WmaV0iPDipyjwRJ/bnLZtUBaqrZylh+c
	 mhogYeEJ7hhZX0KGSsJsMXTrWc0/ffXp2Z3L+U+8V+CvYu6YT/gPeDnVdQUXDZilTEfN4
	 AR27B0fNxo8CBmET+TVf0f6A1Ua8+7HbyBbnyTkGNDgzBt1A2FvbtSeJ+kLHsdeheIHHZ
	 JyYuUBHIDhQoyBrqrKjdV4MiT931dKPqdDXdRVYqzWIiDLOPaA3gHoRm0sZ7/eLGscEgj
	 UgLJ4a2xlB5Y4vLU68MRP+bhC47RpOjjVr6rjTqXmvPiDGepGLhaAsXN2+mv8IaN/uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932044;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=TmIWIwzpvVPW5qWTRBA8J9URBFsswe1CcGXepVcKOrs=;
	b=oJeZzRVxuKOuCsC+FZwgl5OZA7f3YMlXom2qcP0vyz5Pb///gzMQZuEMA8b43dDxwzXk
	 cppJ7NmNKFxJk22EDXSlz9I4xqlVxBd3qsYDjlTrDA78N1WHM+cfIM11viHSBASdYetTO
	 2bcsWqLbwmUwcLSczRPzqEw2xWWCE9he1p0poArasGb++6fIBdHevJ7+Gq0RX5POcp7w2
	 cRU7C3jXFa9a1yQuyNf8XrK3dtnfnAM3xnRTxEzVdXjTFDETEoVBQ/NKSnZ2yGGVMeevh
	 1NAVK+zD9ok+3w4wJcUZO7NOGPp0k73gHvVZBpP8FFnEM6ihbEWWFHZVBrRfjRAMtnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D10606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D10606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+uf5bdPsY8vGHxdeQnHYQiy9Z8RFuA7vzKkUy3e86PHif/slF5M+ZICw9Z+XqbJ+9DUBDLsM5AxucGIRlYaCawJp0jYNpl0/xPkvbIKHRt/7ORuecJ3kuuDao2psRHKuhpMN6uhokOT5nJ8Fk4gluY2sAp2VNWdzKEYcumecq3efQv/cEzutW7R8MzYETbcGAlDhTzZsQoRfuQlQAUo+ZPCGBBLgJFriQiVAWIFX6lrtTeuSCeTsQPtdrttrYHwz8VaieE5NepL9Oql6ZsNrwAqtFlnm98b++/Eyo/fXdkwpd5gv8q4P5mCqCuVCtBZdt5uI9lyoyvHboCZBQ+LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmIWIwzpvVPW5qWTRBA8J9URBFsswe1CcGXepVcKOrs=;
 b=a2lBdXDPEoTrTohGsXwGPmK2+rKU0K/CvLzxPsUIwucnVlPnzHadXE5OUqBpRAHJokvsnWz27g7+U09MaLJyX/TfNjSDEtttyCiiaMJyuoyucTurbzo1zJAiSHLJradnKD3GfTAcd9QtVf8DAI/RCSyDojaSqK3JMjTyMMYGvhW1XBCpLK4UmJ+qJEx/f6vFT7MoEJLNTPsMLvUnTpEnPIZPrl3DuyMkmu8KbyVfAIDRsDgtoC0VbhBWypyu4MOf28SugpagkDqI5b4ohy9PxetMnlWeilRB9zmuYgSQBJ0h8gekV3z3P/VRvN68aXrecQAi6MKqLot7POToezVjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmIWIwzpvVPW5qWTRBA8J9URBFsswe1CcGXepVcKOrs=;
 b=gBXmYVrB77uV8DzTYJ9OiblmleUPQFksHcmpR3ao4KEpij46Y1GykIfqJryY4mkLBbVfF2daoY+MhwN+Cso1QKnk4LBOfnYxN542BnQ4WagTA8G4bbIDuBV5iiE+Chpn1vcMPTGd0YHjeJVEXL7GrnECxxOYOXt8Kw4hLxvIszKxpEMorEdwAjOKz826ny+7z5WqnoB6gTL8hrw8WwwY/L+wsROQUkxpvgJPgGCfMlERLoWpKdlmP1GpPp7H1YWgFYNaz/Tz/0qbTdpqZZ+znx4eBA2q+x2XHwBKdLcTVoO/ST7oSVAwicYToANTDKSNgVnYyR9o38nJ5usI8I02jQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by VI2PR04MB10114.eurprd04.prod.outlook.com
 (2603:10a6:800:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 16:13:59 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 16:13:59 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
References: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Message-Id: <179493203722.1421468.4624148645241955168.b4-ty@b4>
Date: Tue, 17 Nov 2026 18:13:57 +0200
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-ClientProxiedBy: AM0PR02CA0158.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::25) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|VI2PR04MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: b599c1e4-a183-4edf-77f2-08df44c5c98c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|18002099003|261009223027099003|22082099003|261022105027099003|261022075727099003|261028144727099003|261026140227099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kn6Ga5ZDz92fArhWSXSPykmJz5DUS6lhG+FYRaH4asjctDp0s4osOerlLZXbVH0Oo9Ju6/Fo+y9aTvBb1nX4FkjYdFKlRIRgty1wcWgDXfOrfdCR0J0yAA6AVFlmLMrLJ5TMvvyN/STebOji4yrudSCYqaM306ANW4laIsgD+/ivoj6J7MsKe2Az9jIDMnjFH4j3F/OEOReWoY5WK2O1D8YyaYMv12RySLpkj5X+hageonKvmizNNVFLm47MQZcPW1qaDufquajLEN0W52qLGXv4LmC3m7Zk/khxysW+tYja+TcbNkoHsp6r9xVGqOOG7l8ZT3VK74rnsNKr6UgtxbvvXxp965+/O+Qu8wUM/VQnAgoKYpmjYOMjXdst/mkgA/AQVYSZ39OiJTly7gB1Xc31WiEg8zxVV1tZZrx4zd1AQe7HlFGgoC5fNgmrjFr8mZl03QkjFb7cJHDhlMZ5YE65EMjut79/NpI4fQ5kLkC9wdEIUi+MgH+1AQYeEmXY8R/WKR5nU9ohegyTpuEE5VTaP7eu8Ij5HVZJb00imlCkIUDFRLTuIeniMCLvn3HiUHg7/sOQnztQvoma+g7dUX3Ih9wPExNhOydEp7gVQZ4YK4DYylvNcA3q2TR5RjXhVgZCgdkXepSO7xPN34S404Zdl4cymy1ixxnbAaalQm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(18002099003)(261009223027099003)(22082099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlBJNEhtTi9BUHRmRVdHY1ZtcGpick5UQzErbWVEMjJWQ3dUb3pXWURHTkhJ?=
 =?utf-8?B?T1VlWXRlZUk0dTJLZytOeWd4RURyeVhXVDUxWjFrWEw2T3hwd2wwenFlbGtl?=
 =?utf-8?B?NWVyakp1dks3NkdBZVNEcUROU3ovM3JKcjVsb3FXdGxlNUR1cTl6YnlmeHVl?=
 =?utf-8?B?L0IzZnBod0lxaEZWS0tRMFR4NHJKSDluQ1NZNzdvS25ibDlzbmxNZWxhNUM1?=
 =?utf-8?B?azBYemVIWXBBVmkzZnpNWkRhOXY3Q0pyZVN6bEt6R0JNTnovNXl0dGRaVkgx?=
 =?utf-8?B?UlV0VGxETXUrRmN3T1pGZkE0c2liMnRGY25lSWRuMnUyL1F4QURWSytMczJu?=
 =?utf-8?B?bnRhODlvcTVISmw5b3p5MWRoRk5zOFhXM0NNRFdvWCtDK1Via0pqdFVhWk1O?=
 =?utf-8?B?YXEvUkYvaTZlSFIyTWc5dzZ4NGhoNXFDUkgxZFFVSmt5dUE0MEs2ajlZdE8z?=
 =?utf-8?B?bDhQd0x0U0orWHIwMG80NC9uUXE5T0J2eGE4eGhNVmF6ZTVhMFRORy9ZaU9w?=
 =?utf-8?B?UVdKQkF2UDhWUEpsYTd6NVdxTlAzTGVDQmhvSFFJcUU1b29OelNvT245WE5K?=
 =?utf-8?B?UGhRNCsweWV4SGcxdVg0ejlPdFZ4cFZMVittLys4emYrZ3NYcGFLTzByOUVp?=
 =?utf-8?B?KzNEK3cvNEgyNGJYZlEweVVSQVBnRGQ5VFRSTEpmTS9kaVNlOXF3OUNmeWll?=
 =?utf-8?B?Qjl4Z1k2NkhzUWp1c2YyK2hQcW5sKzVYTFk1SDM1UXhNd1lUUks4cE5NZklN?=
 =?utf-8?B?YnJkWWlBU2czSkZsVHM1b3kyeHhRdmxYMVR4b2o0TWJScEJZdDRaaElESXNZ?=
 =?utf-8?B?MDZkVHlVUGVybnFOSksyVTVBcVFZc0JHNnNRNm5ONWFOeUQrQkJhZElodWRX?=
 =?utf-8?B?Q1hDTWpxY3VLbkllUDZCeGdQTTkwQVVod2ZKekV4YWhJUStCWmhPd1FUS01E?=
 =?utf-8?B?VkFldGQzVlJEYktjcHMzdVlRRU92T0xFbUpmaXdjUVBQUDQyQWRZYjJPelE2?=
 =?utf-8?B?VG51ZmdqVnFVTjZudmpDYU1LeFlKWDRNa0JQY0xoaTJnR0RSUmlkbVJRalJB?=
 =?utf-8?B?bDFleDJQNEcwaTYzWFhtbVFOOWFZSFE2S25hSDBsekZqV2IzQmprdTRPZUtO?=
 =?utf-8?B?bE9SRjE0U25JNCs1YStvOEVsMnFOVHF6Tk5WWkI1azRCMmVicFQ3YlBSYnNk?=
 =?utf-8?B?ZWpGNkxuNkJJcFVjZ0ZkYzdudDFNdDNONWROcW9CcURXbTJ2QkovWjlObVNR?=
 =?utf-8?B?ejZxNHVhQ2VtUVFCT1U5Vmo5T0hxQWIvd0ZHeDlUNEJUQjJFVzVqUWNoY2hl?=
 =?utf-8?B?MDNscnBNMmVSUStOYksvTVJqbkJESmNSNHJYalJmYXF0TkkySDM5aEY1MUNz?=
 =?utf-8?B?c2tOOERlQ1lpeHhQbTMxOUJMVkFYRkJaWnBrcHorSGJqL01sNGFoMHA3UU5Q?=
 =?utf-8?B?bGM2dVdNeTlZQ3l6ckJmSEd6NXRYWWFPUHFiSVNIemVqeHk4SE41dmFuOHZx?=
 =?utf-8?B?VUVWQStVNHB0OXN6am9EOFB3R21lNGlxZXYwYW1VdkY1bnF1UDFzL1hUeTZv?=
 =?utf-8?B?ZVpSVmNob3dmbFFibDVLUHY2Zjh3V1lNaU04eXY0ZUxTVWFyUGtUYTdhTk5M?=
 =?utf-8?B?THlrUFUwUWtlUUtzdGRMVGtPN0FOTHNWcXBYWTdHbHlNdUdBOWVGSXoyeTRr?=
 =?utf-8?B?T3l5N09vVWJaSmVmN2ZnRmcraFJGeGY5aFNCWUQ4UWVaNjl3L2tuM0h6bGtW?=
 =?utf-8?B?TUIxTHZOWEw3WWlYSHpiL2grWVVMNVVHUzNnU2xLTEgzb1BHRlR4TWxQMlJy?=
 =?utf-8?B?TE9INnlMckRmK01ySXVBMEtkUUZIMXBDcHh6QVh3dGxzclZ4dEpJbmEveENq?=
 =?utf-8?B?RENRNXpuSzVEVncwUjJCTzBrYUp3T1ZiMXM3eUxWMzhlallkT0IrbFpNejJ1?=
 =?utf-8?B?RGxvRFdPZFVQNnRWd0o0RjNvblgrL0g1aTNjZ0FQUzVVRXg1THJvcCsrMm5r?=
 =?utf-8?B?R25tSDJBdlFxcUI2ajFCUXZZR1ZSWEl1ZzJlTFlMUGJneXhNQUtBMDNuVGxJ?=
 =?utf-8?B?ME5STTcvSjNmSnU1c3BRVWlNQjlWUVdsN3NPUkNwUzAreFRvRWpWOVZ2RitU?=
 =?utf-8?B?T0ZyL1dzcUpyU2tlN20zZWhCWWZ2MGo0c3lmZGZqNmltcXNUaXNOS0dNM2sw?=
 =?utf-8?B?UDFYeXpTSWsvbGJFVllSTld0ek5NV05JZ3ZTRktZcjl4ZXJkTVRZQmcvVE8x?=
 =?utf-8?B?czVVaE1mUm8yR2s4Y2lIZWFvUVlWbkRta0t4eTF4VjZwblZERzNNQjdtQWVq?=
 =?utf-8?B?aWlHY0Rxand4bHh6aHNMc3locEZSRzRYTGNScGpicmgzUS9PUHVoVFE1aE9K?=
 =?utf-8?Q?GbQSQxpa9AAXQpQI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b599c1e4-a183-4edf-77f2-08df44c5c98c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:13:59.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HELt5Bbl+RByI9XchWPbSQsESV47Ts/biSeuG5+kLkfm4gkAMUZMrMhX+MfoXrIQb3nIkJBO7e9kx5x08cluYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10114


On Fri, 30 Oct 2026 19:13:03 +0800, laixiangwu wrote:
> dcss_submodules_init() enables the DCSS clocks before initializing the
> submodules, but if the first submodule (blkctl) fails to initialize the
> function returns directly, without disabling the clocks again. All the
> later error paths already jump to err_clocks, which calls
> dcss_clocks_disable().
> 
> Since the clocks are only devm-managed for their reference (devm_clk_get),
> a blkctl init failure leaves all five DCSS clocks prepared and enabled.
> 
> [...]

Applied, thanks!

[1/1] drm/imx/dcss: Fix clock leak on blkctl init failure
      commit: 18e73878de68302508dbddbafeb5aef508640588

Best regards,
-- 
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

