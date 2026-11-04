Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793789793;
	b=HZarpPKiACxanxivPDBZ+c/33gNRqOEVyXNPXHS6zo7uuP4rjxDEitdRrHMtGxhgABWg
	 M8keOBsvUqz0jmHtOsL8eeng5HKdNUFN10rzRjsSJkCmMlvaN+3tjpi6YLoi8n3WD++Dy
	 HboO2d962I0hsjTs3yzkXg6yiss9SSsQXbojhJxH7HoSLCi1C1OFIqxMYLwJgisM9l9Ia
	 cSY4kTdB+rc5dzyJZG25X/nNxx4wd2EUhh2mTj/Qwb4uud7lUDbepOJfj4qhm1ZnM/uXl
	 6gTvQVLvz/pA1qUL49p2Vhr/LbHfHtUydkk91E9fjvyYmghAYU7OviseN94ifcv2ndA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789793;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=R21FIurnaiDMf9lXaF0Y3Re+i7pf5pamzXHL6rz49sE=;
	b=3VZbq6Vc38K8+KLt8wPnOMoOn4i7XHRiNjslw/sBBVajQB6YXo8WgBDhVg4Hvjtry7GY
	 yfCdDL3hUmLmP9lxqlSUH3WcYRh2GkshyYKIHOYrMARyosCvyf+EinpIWZR9HWRVYeNG5
	 zWrzp6xcnD/zxfwg0WPs/J/8s7t8Vw4J7lP3WXrldUucdIhkhyIQ2pkOYjIFqslstWYsk
	 UW0ruXtz00oBOIM5BfFpitF1bPD2EaS6/xgunK5axA8PtjMvNjCSSEFtSiViV26sOBCIg
	 2ZX+w9r5ocJPhoBgKYoDbR8SheMytpNY2fvJeb74NS4TSi72M7NHhBYagFXo5BGIgmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GDJqNS7f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.58
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A77606A331;
	Wed,  4 Nov 2026 10:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A77606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GDJqNS7f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG+WCmriomPeO3cM/XQPfjzuFy42qmIGyhzjwF6qHIMGsZD9iQ8vMNnbZyBIWi1RJYBdmqPues5ExcDj9iQV7bRB4/kjI/c0srMme6Ll8QsoK2esbd1U6E8lvCKUyzWRoRhzIteGAHiMcUWZD1pUIWMrN8Sw6nuCpANPnDgDhv21MKc+0314gpIEPEBWMYBdbBClB6EDrEbnfz9/57nRwEr2wPzKZrSglygm0fsTbLacnNiLVh8BAbSEQZTzF7+8E6Q1ZZbeBD1H9hNz4XDD+HdzBMu53E/vQW5hUKQLvYQousINB3XURgUYNX6ba2PHWw2Sd2LYRfQX/9lGuk0CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R21FIurnaiDMf9lXaF0Y3Re+i7pf5pamzXHL6rz49sE=;
 b=jqlh40xQK3/f6HFpuXFhpcLceeE1p4Zosw6mzV4bgt1Rv+xp7YkTcgnvU70sDcTMZrhP7Vx3LDEf1VNGd1DrYOtF4NIS8un1cf/NnkDXkElqHRRsAu9KyJ3FdlaALemnAvW18JTzfsxSMnkYo9nFaF1219BNDiZ6WcG9VdYlXLBXGXtMzNTlkXjDgXgYwh4rVZbu1Pri2gsY8nCRTXZ+i4px0p4ZyUWZhhyzU3bWDB62+l56A9wyie/Hp2UCQiqc/Ylj3gUfEYmtlQDMUE4v1mHaLq70Q0YslA0YhkWDzfYswIqRZPGS+yWfaAMzEus/cB3vTrYQ/F46TQqH63wR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R21FIurnaiDMf9lXaF0Y3Re+i7pf5pamzXHL6rz49sE=;
 b=GDJqNS7ffDh0ZqB0T+ntDiaBNy1mWOFhWwSKV3XG+nWEOM3GZNnToh9RKmaUIKdP+AhRk3sgR/QbcYv92CzOhkMbQzpgP0SslwcbRXUAy7WK7hmiOp2tOtrN5yCGABRpVpOoFHZpT3YIQVK/7mmRo91LegcOsM3TCbVtloPkteQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:56:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 10:56:30 +0000
Message-ID: <7c53f83d-26c5-4b01-b47d-b8c18e6aee79@amd.com>
Date: Wed, 4 Nov 2026 11:56:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260916204509.166633-2-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: fbff2662-888e-448c-46e0-08df3a624875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261102123227099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p+wxxtnxTbae5HSYxSSVzCyDckxZ21mbwv/6VLmF+9mOhvyP3b3MhTs59HjNGpKQRS9N/haVcmp5+KeVaz/tIDwmuKxR1ysWBFOIqRFAV8rioLspFp2wcyfRZzksdaXNvg+NXepo8TvDakxMUAebz4ufC1LuaJE5ZJtzYwB4dTClxbImu8OMs1SpMr9k5AgWPsbmBOAMygfP7x6cuLs1QX96ZabSBzUVvB1NPZLrh1srlcd/jGdscOYH7/wb1ccsmbIjwFHlC3JOsr3Re53bZyZaj6COB4fZoWqUSZvypdGmA7NeoaIWqH3IwR2cW8KxRAuApEXEuY4bboKzBCQYXir0K4/Jr5nBDFO8KoHkjCxjGLxv9xtNd0NDrodYpJfqZ3XagVOFjKhbYJsUOIUP8pP9Z4Mt5zM/nkpmzbLVmTdKbBe5Jybym2mM7w3b6Nee++HwHD19+52GfUxZECh05rU4DOl/B0vCDL857fsWgsA7LfD4/nBpv5xyQ9Fe5uvESsmYoohkZg1MLeT4qTSzo+N1cB0XookkUKVvX5EYLQUonWhV3jy0d1UGYrMrzfw4cmW+cLrRuufdLdeiS9JY/Wml/kP551D2Czo3+HL2KDpwN7uysEuQg1WaO2l2RMqI6mQ5XifEystN7alc8qkwkMpTvQSH3K3DExRauIVCbmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHFHdGljS0hmVitKV2Nmdm1JdXkybi92Z1ppc1hnTjRqemxVY2FNMExjRW1H?=
 =?utf-8?B?Y3lFQVI2MExkQmFjRUd4Vy95djMwSnhxTjBBeXlBRmZkcStON1Z0Ny9lRUxU?=
 =?utf-8?B?cjhWTW5JYVAzVDhnRWhlZVYyOFMxOGl4dDM0UEVmNncrcmtUZzZ6VVdmN2FY?=
 =?utf-8?B?MHdUMmovWlBWUkc0blRWaFlmcGx3ZndQdDVlSG9GNFBFQm40WE53emkrbWEw?=
 =?utf-8?B?ekhoeVljWnZXUTRuajhYWmpxc3dLQUMrWkpQU2prN3N4ZHcrY0NCV0c3KzVs?=
 =?utf-8?B?cjVGNmwxTlpDZG5yOGNPeTJOcWZlc0xJeUtyd0twNWh1Uk9jOUpRYjVFWjUv?=
 =?utf-8?B?Wk1xL2IvTlFPTStza3B2U1Q3ekd4SkhrYWMweC9SUTVTdDZVbko0UDBpZG1l?=
 =?utf-8?B?TTBnNGJHSm1uRmRCWStGOEZrVVdZMDF6K1NrK09UdTE0RUM2U25kLzhLbHdJ?=
 =?utf-8?B?WXVkdDlsSWFKZVFwV2o1M1hlUFIyM2R1VjdVTURSSXducm04cHZ2endJUEMz?=
 =?utf-8?B?aHo4UkhXVGltS3VzbFM1TFhxNXYzeERDVGxhYVIzSit2SWZuanlNYVZGZWx2?=
 =?utf-8?B?WlBURzdLUnkxSDRrb1NPei9ZejNLb2JmT2kweHcra0x2K2pudk1IUmFveWh4?=
 =?utf-8?B?Q016VmpyNkxmUHl5bEM2VGJaT3FuUUpESFhtZ1lLRXhnamU0SkJBbU5Bb0tu?=
 =?utf-8?B?U1RFWFdsODJZSEtoYkV0SzEwSTYzTFVGVVZrY0VpUEZ1Y1hBNDlnWlR2bUhn?=
 =?utf-8?B?NmRJeE9DSVVrOXZQWTRpVGFsV0hGZG02NitqY2tTTHRrVWZVeU9TVWZ2VStU?=
 =?utf-8?B?NDZwVy9GaEc0Sk9YT1pGMWd0UmF5VXhsYmZ2Smw1NzFTcXBaTjFNQkcvdTV3?=
 =?utf-8?B?WGhndjZxanh6SGkyUEgwTWdXODJVaG5XUzNOdk02d3dJdVNRS0hCM0RLT2tB?=
 =?utf-8?B?QlUyRVVhMG03VnFuSDEzbDB5MmNwRTEzSktNN0NodGIwbUxVZWpFMFJSeGdE?=
 =?utf-8?B?aWZFNHFIS3V2dmFQYTZWUjIwM0RGVmhyOFJHVVNhd1h2VVFEdDlzT1daU2w0?=
 =?utf-8?B?OWU3QXl4Q0lKSzFVM1dNcmVVSUtPVmZ2TURSVjcxaklDK1BsNmFtN3ZiTnJu?=
 =?utf-8?B?V28vUWJTQXMwZkpIdFJTOXRJOHZoUzdDVm9rSnNoOC83cW9VZThZa2tqMGRE?=
 =?utf-8?B?WkZ5MnpGei9lSk40YTZKczkvQzJsSUs0REh0b0J3QlJPR1JReEJRRmlNeHpX?=
 =?utf-8?B?Q1lJaHBTS2NYL2hoSXVkUmFEUjRvYlQ0K1BvQ0FQdWdyZHRvekpBMTV5Zm9Z?=
 =?utf-8?B?ZHcyay9kVE1RaWQvRnBmS3ZxTFRBakdlUS9kSDdkejdyS2srVkJMaUMreFBJ?=
 =?utf-8?B?UWdsM1NhZVlHbkJXMlFrdWpFNERRelAxWUlzdkFOSFJMS0JYMTV5NE5aeUdq?=
 =?utf-8?B?UHYxOEViYWh3S1R4eGgxK1owMnVJUC9tS01vbmoxOXQrN0RoUm1JUWRVM2FH?=
 =?utf-8?B?WVF1aTREbWw0YWFjYmJra2Q2bUJyMXkxaEkrV3Z0b2hRTG9QUnBPSG5PMXp3?=
 =?utf-8?B?MlYycGRYenJLeUtlRVlncCttbzQ2MW1NRVBNcDdZaFRJcXlUUm9qRWxLeHFB?=
 =?utf-8?B?czN5L3kxSjBuUVVIcXpzSnVBekZmc09pSTNQSFFsZVJTRmdJamxHS0FiUHpm?=
 =?utf-8?B?eDJDTzAxaVJZalQ5UXRjWUVESTczUWMyRDBuY0ZCWEx5RUE1TDVpdFhVTmV5?=
 =?utf-8?B?YjJiU0h2OEpPcU5RR3I0ZXQvUEpONUU4ZDdwd2NtTGU2SnFhY1RTeVFCVjdH?=
 =?utf-8?B?ZUZvUTdaMHZHbDJHbElHOUcxajFDQjJZTXkvd1VXR0s4MmNwVmV3U3FNYWh0?=
 =?utf-8?B?K3E4UEtqQXZiUnJ3ZmdBZkhzSkZuOWV5NlFsb0xZMjdGd25BM3pIZUUzVm50?=
 =?utf-8?B?NVdjZEJ2ZUFwdWJTRXpaWURqbkE1OTdzd0FSNE91aHFaU3h0WmRacnRxWFJ0?=
 =?utf-8?B?UlJhMVVsakJUVHV6OHNzRDAzM203b2NZRTJxeW91bmtLQW9nZ1lBMnppcVEr?=
 =?utf-8?B?b28yRHJSQytOMkFNNFd2cEh6NW5sWGlBK0VFUWZ1N0piU1FxaTdIQUpuNHJE?=
 =?utf-8?B?MDcxcXdFRzdPQnMvTTl1VGlnNXdxT3NTQVJRZ2xuQ2ZZcitKYnlBTVYzWERG?=
 =?utf-8?B?V1c4RGVxc3ZBa1djbFkzdEwyUjJjNU1pUHpMOW4vN2orZHFwbkNKaXpxekxU?=
 =?utf-8?B?MVFkMlNuYVpvZERSU242R1VHdjF3Y0ZIU1Vyek5wZHBUOUJPWkhlNjBwUHhw?=
 =?utf-8?B?UUIxRUx3ZFRpbEtFMFA1ZW10SW82Z01XdXp6OHNFMXlDZWE5NGhKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbff2662-888e-448c-46e0-08df3a624875
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:56:30.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T75KtoesThruuKMhjPbbqvAkJ4MXH3MppTze2YGpkz/xLhlo4yzlC69SGGRVIRJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946



On 9/16/26 22:44, Marek Vasut wrote:
> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>        undocumented, but the TI DP83822I is generic C45 PHY that
>        is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
> ---
> V2: - Rename lm75 node to sensor@
>      - Use GPIO_ACTIVE_LOW macro
> V3: - Drop bogus clk_ignore_unused bootargs
>      - Drop gpio line names
> ---
>   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>   .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>   2 files changed, 301 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> 
> diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
> index 70fac0b276df0..936ddf6eb80a6 100644
> --- a/arch/arm64/boot/dts/xilinx/Makefile
> +++ b/arch/arm64/boot/dts/xilinx/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
> +dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-vhip6-evalboard.dtb
>   dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
>   dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
>   dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> new file mode 100644
> index 0000000000000..ed2c6d170426d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * ifm Zynq UltraScale+ MPSoC VHIP6 Evaluation Board
> + *
> + * Copyright (C) 2022-2026 Fedor Ross, ifm ecomatic gmbh
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +#include "zynqmp.dtsi"
> +#include "zynqmp-clk-ccf.dtsi"
> +
> +/ {
> +	model = "ifm ZynqMP VHIP6 Evaluation Board";
> +	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		ethernet1 = &gem1;
> +		ethernet2 = &gem2;
> +		ethernet3 = &gem3;
> +		gpio0 = &gpio;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		rtc0 = &i2crtc;
> +		serial0 = &uart0;
> +		spi0 = &qspi;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +};
> +
> +&dwc3_1 {
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	status = "okay";
> +};
> +
> +&gem0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "mii";
> +	status = "okay";
> +
> +	mdio0: mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy0: phy@1 {	/* TI DP83822I */
> +			compatible = "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg = <1>;
> +			reset-gpios = <&gpio 78 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <10>;
> +		};
> +	};
> +};
> +
> +&gem1 {
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii-rxid";
> +	status = "okay";
> +
> +	mdio1: mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy1: phy@1 {	/* TI DP83822I */
> +			compatible = "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg = <1>;
> +			max-speed = <100>;
> +			reset-gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <10>;
> +			tx-internal-delay-ps = <1>;
> +		};
> +	};
> +};
> +
> +&gem2 {
> +	phy-handle = <&phy2>;
> +	phy-mode = "mii";
> +	status = "okay";
> +
> +	mdio2: mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy2: phy@1 {	/* TI DP83822I */
> +			compatible = "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg = <1>;
> +			reset-gpios = <&gpio 79 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <10>;
> +		};
> +	};
> +};
> +
> +&gem3 {
> +	phy-handle = <&phy3>;
> +	phy-mode = "mii";
> +	status = "okay";
> +
> +	mdio3: mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy3: phy@1 {	/* TI DP83822I */
> +			compatible = "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg = <1>;
> +			reset-gpios = <&gpio 80 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <10>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	sensor@48 {
> +		compatible = "national,lm75";
> +		reg = <0x48>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c128";
> +		reg = <0x50>;
> +		label = "ifm-logging";
> +		wp-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c128";
> +		reg = <0x51>;
> +		label = "ifm-deviceinfo";
> +		wp-gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			vhip-signature@0 {
> +				reg = <0x0 0x4>;
> +			};
> +
> +			vhip-version@4 {
> +				reg = <0x4 0x4>;
> +			};
> +
> +			vhip-size@8 {
> +				reg = <0x8 0x4>;
> +			};
> +
> +			device-serial@c {
> +				reg = <0xc 0x10>;
> +			};
> +
> +			order-number@1c {
> +				reg = <0x1c 0x20>;
> +			};
> +
> +			article-name@3c {
> +				reg = <0x3c 0x20>;
> +			};
> +
> +			article-rev@5c {
> +				reg = <0x5c 0x4>;
> +			};
> +
> +			hardware-rev@60 {
> +				reg = <0x60 0x4>;
> +			};
> +
> +			product-type@64 {
> +				reg = <0x64 0x20>;
> +			};
> +
> +			software-compatibility@84 {
> +				reg = <0x84 0x4>;
> +			};
> +
> +			manufacturing-date@88 {
> +				reg = <0x88 0x20>;
> +			};
> +
> +			production-order-number@a8 {
> +				reg = <0xa8 0x20>;
> +			};
> +
> +			/* Each MAC address is padded to 8 Bytes */
> +			cfg_eeprom_mac1: mac-address-1@c8 {
> +				reg = <0xc8 0x8>;
> +			};
> +
> +			cfg_eeprom_mac2: mac-address-2@d0 {
> +				reg = <0xd0 0x8>;
> +			};
> +
> +			cfg_eeprom_mac3: mac-address-3@d8 {
> +				reg = <0xd8 0x8>;
> +			};
> +
> +			cfg_eeprom_mac4: mac-address-4@e0 {
> +				reg = <0xe0 0x8>;
> +			};
> +
> +			cfg_eeprom_mac5: mac-address-5@e8 {
> +				reg = <0xe8 0x8>;
> +			};
> +
> +			cfg_eeprom_mac6: mac-address-6@f0 {
> +				reg = <0xf0 0x8>;
> +			};
> +
> +			cfg_eeprom_mac7: mac-address-7@f8 {
> +				reg = <0xf8 0x8>;
> +			};
> +
> +			cfg_eeprom_mac8: mac-address-8@100 {
> +				reg = <0x100 0x8>;
> +			};
> +
> +			next-block-offset@108 {
> +				reg = <0x108 0x4>;
> +			};
> +
> +			section-crc@10c {
> +				reg = <0x10c 0x4>;
> +			};
> +		};
> +	};
> +
> +	i2crtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +	};
> +};
> +
> +&qspi {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-max-frequency = <80000000>;
> +		spi-tx-bus-width = <1>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&sdhci0 {
> +	xlnx,mio-bank = <0x0>;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +
> +	eeprom@0 {
> +		compatible = "atmel,at25";
> +		reg = <0x0>;
> +		address-width = <16>;
> +		pagesize = <64>;
> +		size = <32768>;
> +		spi-max-frequency = <60000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	reset-gpios = <&gpio 77 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};

Applied.
M
