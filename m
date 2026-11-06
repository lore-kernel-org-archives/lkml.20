Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793956129;
	b=3d218A2SI2+mbEGyEilA6wv8tTaECjdysArcFnwboFSVG8ZSkUW4w1xv5UMIflgwCNfi
	 80YDJPd5MG00rNHPUyTH7r4O0rvinoQwoF2ZVIrU3b/hauoNthlyRNHLDNnubbMNhJo/i
	 zIQ87+4hHuCmCsf6/wpIozTNrHMTmws0IGvOFsA3SZ0O3CqT+LdMW0MV69razVwRP7rTO
	 +Biq527dg6UgHpPu0TnBSo2vo3qpzAoWNCAIvcpo421Fcr6nY/ZivxkNsv2axjjOwDHzX
	 TxtS6pvJSw5Z5/a1B04vFlAdAGaU8BDT5B+WM/kNE54KXeHCTdHZ3otwWjLzGvZVJRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956129;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6gnisccY83rYmN7wVOpfi0/YwxTyrqHiYgT8W6GCxlc=;
	b=jhOqXypvAejKFVysfNXEnkvx+1LfHMNpJq5JKaGw2sUcVo0bduSKmFBpGPEsuoTLzwAp
	 N0awS7LhUXDNe+RHuT5Pp5bPAVk80a/KQMhJseDKSTxgmFHYdhLFKpyEi5C6CFie0WVO6
	 WWyiewc9Jq7cvmB0R3LHxExZqlGTuxeTeuQNszu9ctU2b1cdtRbk1TBGKKRkBYlPfmSaP
	 U0BhbCR6NaItMq7vMzi2Z9U8kM78yvA6MZods7Mto8qKed4+7+kSGw705WGafp97BoYcU
	 ceaAvkVS5raPwYfbNCwQppNPLqlLxVjRZF7/eGWl92N9j773eM6Z7UJKTh6yitbkcdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=outlook.de;
	spf=pass smtp.mailfrom=outlook.de;
	dkim=pass header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=hW8PrroL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.39
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011039.outbound.protection.outlook.com [52.103.32.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5672606A329;
	Fri,  6 Nov 2026 09:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5672606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=hW8PrroL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwX7e6aJAPPLDkb8InoAPrduVgaiapxWeKwcXigGRFPmlGh6+b0zz8MT4wcO+Rahu1O9C3uWkTlGm7U3Yg7xK5+ocLNB/kQilExTmZ2GMai/YRJe75qvvrT4vR2+oOM2oj0aH/KqRgqrgKXNXwDRBazahNhWjGrE470z6IQtEjALNyTOncbzma3UFIId/HQ0g3uqdyXER1hkxj3d5a+S573A/WQkYbCIeIkeSW4ahP3Uada4ikZLVGS8anPCIjcxOGwZcfc3/6JsCigJIznTMxgGes96vVQknqYxqonItejEyquZtS8oBDDWUi0qFXNtuqSZ33audsGKUysMJtutBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gnisccY83rYmN7wVOpfi0/YwxTyrqHiYgT8W6GCxlc=;
 b=iH5AB+Nc5cJdKn5T2P5751SUOE0oOPq29IeeCekh0nMkPWmI3yErePwepsnDyhlNWlaYZUiuGCK6Jl/JJGvvfiWvloDFMrkFiwwkj4ZI1lKUs+HhA6BGhK37adCzRoonE8AullIFIrR5ukIGo6ra3+1LsVhlkSvsr+RsGu5MoeA/1SOyfS6zEbSwJVkXmDxjDhGfpBZN6eSd5lTSU1/r6GIui+bVILdX6X89GVZ36QEbQp3qltfwwJo929P9Z8p0OSbmK+J0IlouvwZQxlyoGihGVIW3TOKMhmSUy0/pTpXPF0YWcpiGnW8+In5/EOjVqADG0FLGss96YAwD8AIgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gnisccY83rYmN7wVOpfi0/YwxTyrqHiYgT8W6GCxlc=;
 b=hW8PrroL9ECtPrQUyLuHo7T6+u0ZBitBgmLKdG+GDNSKMbTXI0HGZADmfUST/ISCsb/Yq54scFZe2N8OFsCaAPB+O357uKgeVyLxbdnBH0gXhMk7ACmHK3thQJmIg/F3kn1bhTUnV7+cooiifccK04g5shcaSZqRAIm9Dk1/24NcQgKgS/Tnvg29Qnf4+yMIiqsYLmDNqhJ4R8mUpH9Z8NbMklrnTVZj37Ut/svPTXU45TD9LGpdOCp8n0Dpm1B79mssBaCYD4iSIvjNbUESwJQjkvk8DE7iNhbQzJLPWSfs+D1wM7wV2fL9Y3Nq36GY0xyHMPP9XjM/9O9l+Oxtew==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by GV1PR08MB8692.eurprd08.prod.outlook.com
 (2603:10a6:150:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:08:45 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:08:45 +0000
Message-ID:
 <MMZPR08MB5493154ED731C67E9B453F8AFDDF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 10:08:42 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
 <20261030-glossy-coral-worm-bf3ff6@quoll>
Content-Language: en-US
In-Reply-To: <20261030-glossy-coral-worm-bf3ff6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0151.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::15) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID:
 <2c94ce77-f2ea-4f3f-b9d3-437fd91d219e@outlook.de>
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
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|GV1PR08MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: b6224c96-a51e-493a-7278-08df3be58f6e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|19101099003|5072599009|51005399006|6090799003|19110799012|8060799015|25010399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUtKQjkrU2doNmUreGpNc2NCU3RRQnFOZmtxOTZBemhPSGpMa296cjQ0RXpR?=
 =?utf-8?B?cmE1MHFOK2hwZHV2UDdBTk9JVHpsbDgyUVZoSC9Tb1BkTUVyRG55RHc2ejla?=
 =?utf-8?B?YjZYWUh2bkJpTE84bFV6KytjeGY3VURZc3BFMzBPeWhNWmUvaEFmV3FOdi9V?=
 =?utf-8?B?dE95dW9xOEtFUmc0MFl3UmVQTW5CM0hzSFRmWmVVSVJqVURuTm1yUmtyUGV2?=
 =?utf-8?B?RENCNlVlWU96VFE0UFlqYklCUEdwd1R6UUFRSUQvQU93Njc0UU9YY09WTE5N?=
 =?utf-8?B?Uk4xWkRqU2Z3Si9HSmR2MkRkUjArNkFvUnoxWlJ1NkdCWW5Jdm96dnJLK0w1?=
 =?utf-8?B?emF4cFpqSzNRVUp0dDRpY3hyeWNyOC9sc2dTRVhZZUFIbjBzb0w0Rk8yYytF?=
 =?utf-8?B?Q0sxand5Ui8wOFRIeWpyZ3BKdEo3aXF1alhZckVnTVdRNmVaWFBnVWwwMFM3?=
 =?utf-8?B?czIxa0hBek5nWm1jRzhLNGt3bWp4MXA5Q1huREdxVVVZbUJOSS9HMlphSHF5?=
 =?utf-8?B?WDhLeG9XZWdGWTFRN0tZVE1MM0ZVYVZlUUN5NFBEMWMydUp5WFQ4KzdXOUF5?=
 =?utf-8?B?dFIxOURJQXhubDlXSVk4dU5WRFVWVDdxenBtbDVFY2UxYjJ0VU1DQmJuWVRn?=
 =?utf-8?B?NnR3ZllsYnhiUWxaTFJVTTdXMDhsS0IxczgyS0FLb3JjVElrajhoaXl4cmtp?=
 =?utf-8?B?amxYZHU3Y0EramJBVXo0azk1N0VPbWlhRCtRYjZvekZUbEovb1QxSlVaV0pD?=
 =?utf-8?B?SW40eUpsYWtKZTRFV3pLZHAvMit1T1JZM1ZrUnRkUWZxaUFEZWthdkt6aHlS?=
 =?utf-8?B?c0tvSTdlMllJaFFNZDFDdmpza2dGVmFsUUJnbEN2aGltN29IVk53R3Rhc2V4?=
 =?utf-8?B?UG9EUGhKcEQ4Q1doUUhKWHdkQ0NQQm9GQkFyMzEvOVdDekJXQ2FTcVVkSDhR?=
 =?utf-8?B?RDNsVzY4OXhpVm1EVlhFL0NkU1pvUlJWWEQ5TVFFTGNId0RwOHRwOW0wMGJN?=
 =?utf-8?B?cTJZOFF1OC9MU1I1RllQaFpLY3pJdjZoMlExMVZ5YWdiTk02NXJPSTd2QTBG?=
 =?utf-8?B?VmQ2Z1loeEhjcDlSaWhGYVBHZjkvWXU0YXk2Q20weHdrNVF5TE1tc1ZhUUZP?=
 =?utf-8?B?VWZMTGUwbVBQTFpxa0QrY0RKejV2VGJlSDFNRkZZeXNiNE9TKzBLa005cHIw?=
 =?utf-8?B?OURwK0dVZURZVEFpbHo1WVRqcXk0SEc3YittQm1ncXkxclZrcXlnS3hwNEd2?=
 =?utf-8?B?VUovbm02V1VSd0xYS0tVS1d1YmpmeUZxMkszZTc3OGprbERGUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dSs3ZHNMU1BuMHRJR0VCSk81QUNFcnhQNmNvdEJGQ2VFR0RRTk9NZFBoY1N6?=
 =?utf-8?B?RUxkVWVMMHFzNC93Y0xaSUsvNXZMTFhIZlI4a01EUm10UG0ycU9hYVpOS3p5?=
 =?utf-8?B?VmJZZWJEMGVPTkE0RmFic2ZBa0VNTkRDNGtMNFJwTVFyT1I4am5SbkF6cVVn?=
 =?utf-8?B?SGpaUlBWS04xKzFjZmxNN0ZkWTZIT3R0RTBEb0h4NHN6ZC9UcWFKQWR2dk1X?=
 =?utf-8?B?WXl4aFF6Y1VuM3NnaWZ3S2lTWDhnTVI3eGZKWjV4SVpydVIyby9NWEhMdG1s?=
 =?utf-8?B?eWUweE4wN3l6TjJ2aTVMb0t6NG5DZzM0Tmt5WmJSSzZFTHU4NDVrMXBnRWpZ?=
 =?utf-8?B?ZGFEMkFBbnRsMVdBelYySjBPOGRCZ1pGcjlJbHh6dWRtL01jY3FoNndnMDdx?=
 =?utf-8?B?MkJsa0sybEJJWEpBM0xaSXBYK0JTbjNIWS9qekhiTEpPYm5BYVhZbFl1cXU1?=
 =?utf-8?B?QVovcHE5a1NaSGEzcHRDeis5bGNseFdXSDFzazhMRzRYYlBvS2c3MnNWQzZY?=
 =?utf-8?B?RnJYeGtMZklqVk5jaTM4OVZHcklDR2pLV05pNXBkRjhtTUNDQ3R6VmpnVG5Z?=
 =?utf-8?B?eEJ3bklvcmh6ODhuTzFTcXI3VjFuZmZNdldhSjVzLzhERC8vSFJmeC84eXF3?=
 =?utf-8?B?VUdmMnVzL3VKZ04wV1RtR0g0VE8zdjNwL0FrbTVIOXd5My9JSTA4bmNnWnYx?=
 =?utf-8?B?VHRBUisycHdaYjNWL1hiREVMS3ErTVdjMklvWk1VQWFwRHhwWDBla1hKNDZG?=
 =?utf-8?B?SHMvcmN0M2dmK0lCNHMxNFVhNFV6MzVxOUw3RWY1SDU5YkJUREFBTmlNVHVT?=
 =?utf-8?B?KzUxNndhZWlXTGdRR09KOGZrRDBnaVFueGc2RFNvNmNNbkI4VFFHQlVqMEsx?=
 =?utf-8?B?VlJxcnZwUGNsazhpWS9MSkgwK2pFSmplb0ZmM0VUMkxlZHdvTmtrUWJrMEtq?=
 =?utf-8?B?N2NVemwrVzc0SHRhR3p0N0lzS1d5cWFIKzVRUE1kM0Z5MEU5blQ1cmhBT1h5?=
 =?utf-8?B?TVpobEpEdGFSYnpBaHdDQm16Zmd4cS84b1JreDBrZXFHQ29wWmRRRXJ4VlBJ?=
 =?utf-8?B?a3ZRRFl4blpDS2d5M2J5Znp5QWIzRTZkVGJ2OWJrZWZsUnJUeFJScE9rQUYz?=
 =?utf-8?B?VnEybDR0MUt3MW1mTTFyWnlnTndGUjdHaDQvclBQb2Z1b3k1d1JtRnRZUlhR?=
 =?utf-8?B?ZnhCcEFzZXpmcHRQTzVKK0VZcFBrVHAzam1iaC91UXM1SWgzVHVYRFpBb0JJ?=
 =?utf-8?B?cmc1UmJ2NHpha1MzOCtJc0pqWnhhbDgzYWVNSGs0Q0t0SVQyWnYvem9pOXNP?=
 =?utf-8?B?V1NNdm9kb3R3WU1oZGRiUFZsbUZCd29sOEVKbXBGRnNtNG0yRWNxelBhQWVG?=
 =?utf-8?B?N3FnTVJsbE9wOExwUlZrZDNJSzNVL0dwUm8xVTF4SUhCWUxqRVZ0U3d1N2pM?=
 =?utf-8?B?WnpsWTBQUUQweW5WZ0NjNUdXR0tISCthRnZ5NW8rbVhlMXNTSzdHSE9KaFVx?=
 =?utf-8?B?Y1g0eFR4T2JUNFNSYzNhMlExS1dTeFQzQk9zKy9sSDhWVHNaajIxMVpWMHA4?=
 =?utf-8?B?dGsvWUNnVStXZjdhZHFwNEtrYmZLR0dNWnlYUXQvalUyZDlpeG8ydU9PUGR0?=
 =?utf-8?B?azAxMFY0YlBLRGNOd2c3TTZVRTJXTTNERTRqVXByZGZBNEVwTm4rZG05K05S?=
 =?utf-8?B?empzbytkeEUrTTlLQ2pQQ1JRZkdrVFhiSDRkWFQ4OURYY2pWTmJmS25KNWt1?=
 =?utf-8?B?T2VBdWR6SUtRV3BhTmF5SFREUThRbUpMOWpZNXhoRmJjb2dndFhrVDJDUHk2?=
 =?utf-8?B?aFJKTTdWdVpLY3J6RXd6ZFU1eksrNjFWV1NJT29vZTgzZTJXZGNFbC9oVUhM?=
 =?utf-8?Q?9ajVaKk4Qj4io?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b6224c96-a51e-493a-7278-08df3be58f6e
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:08:45.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8692

On 10/30/26 11:59, Krzysztof Kozlowski wrote:
> Does the AXG has power domain too? The patch claims that yes, so you might
> be missing explanation or "allOf:if:then:" block disallowing (: false,
> see example-schema).

Hi Krzysztof,

no, the AXG GE2D has none, only the S4 one sits in its own power domain. 
v2 adds an allOf:if:then block that requires power-domains for 
amlogic,s4-ge2d and sets it to false otherwise, and says so in the 
commit message. It also drops the AXG fallback, as Neil asked.

Kind Regards,
Christian K.-D.
