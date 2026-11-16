Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830596;
	b=E4vM2pN7cwHAF1g0O4yXtbYiBYUXst7wJdBK9F1OaawCfmpeEso+iiQdLQ7r6gUfSsA0
	 3H854V5z6ZhHd9Qc6gRAditT0nfVY0e7fX99PPezR8AE463Av9W9RegAoEfGP5jtbtmD3
	 1mYAeJc5i3Wt1trVDSh1H37dsH7dZkM633C6z7snIOviCzuEFTazOdMuygYFXT5bt47qg
	 FlXSJN8L2f7PbnUCFlxeQ4v7Rvd3Fo6mHY3iS/abgd3/KzKM1bKkDdIFkTiqbG3z5YnOP
	 Eolv5kSIg0q+zUDfrZnEfldbrqdGV+HWigrwNO3BUe+uyziGKS5/NHBtZWbBDNli5dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830596;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
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
	bh=9I/MA66wUnM290t51PK71z+fPKKVCFqjtrdqznh+pas=;
	b=Q2TnCDbsAvkcOVopBuRckn7l6S+Hi1d7B+t72vQjXOfXlgtedY4S8ulK0Sf5jBVGqdQB
	 02laml0fBFQ3FGG2TnsxMTszCgG137clDo/pt/v+/+0mRJM9YfNlj6NblQbuTi/UvyLlz
	 rMiZddtd8m9XcysS0NWvvd/IiTWLurF8UZrbevEoTNU8Baq9YPjh2i+/kQ5tMJtx80t46
	 03qH8sQU1NWmulHvl3/lsU+NvUT2MKAOVfpLOKhmecHyFaQxPQBGDgnQSIbPm+OVD6Z6G
	 Rfl07PzfeLpTKuoiZAcHagY/6RT6FPOSFIQg0Y6WW9AHO7VzKCegPli/uCmICHoS2Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=O2eEebz4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.136
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023136.outbound.protection.outlook.com [40.107.44.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D8606A337;
	Mon, 16 Nov 2026 12:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7D8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=O2eEebz4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK2AgFG0PNKfb8zG1shfUOGNsq/tb2W4mRhUlzZl4UVtei3+1hVs1hid/NgyX307dPJwY/k5LUAU8kv2/2WeJYi0xkbNaM7prPQ4BVuOWzk95zgd0VvAuHPjy/RMxJDYAEZ03ksd99d2wrqFdkKOcJiZsgHOQ3fpN1mR28Wp1ryhT0TTbWJS9B6S4v6MJmoU673ewI1omqrCrNLKZeckKISsrbG4E5Bfi0vwDAFrXvQ6b0UHVwbpgMmkIklg/OVYDdolmqcv8hT4BVP52V9CjyFVATEb/WvZxB7Skyq2LjkV6KbeoOV0odr/RmBOa3ohaYAXmV32nk9zoS8Y76Wp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I/MA66wUnM290t51PK71z+fPKKVCFqjtrdqznh+pas=;
 b=b6Mo0fV0sWcVSPU8rMcApZWuNxSY0kGHEX6gbrz991warA878+vJrYSQuriyoDmSATncm7lkWXfSRv+iR7b6+heGzpzC1Ibt0gKDofN9y61JQFfVmiPL4JjEbRDvXpTbze4WY1hGvxiVg49wFDucxeDGRF1P+VFt0AZZ3FkG1wFFw0021gznUOGqv9gZGG/NNVtEedsAQZKEKX1cOZL7niFxbJRNgJGeo8x3GH2wmXgOK2gu186Ma7Uvm6//Qtq6hKKUWwAC+nil1tOTew1SUio9S9iyNRNGjo47/VpMFIxT8vxKWb1BssHoEKAkmenxI81h3CZocEoKtV2JVkPazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I/MA66wUnM290t51PK71z+fPKKVCFqjtrdqznh+pas=;
 b=O2eEebz4sxezInvNk0cdzLW3eQdxHf0MDcZf4+Yx04sr1u+rL740J+cYxXmEqhhhpnEVkV6B39WFk07rlsIV6wEa5NPqiYuQKRbiebhnhv8fB0DitKLQF11XM6ot7HBNeGG/gIUI7J8TK++tUSTa57PF+JWg2pRrnTJiz3WlNYadqgyA+3EFddk49bvtmSGy2GExh+XtX3SY7bHn9dE6TO9JgiUVyADWFwDOjQdHaXDxAC0qzbUYW5zIMntxcXPXeB0IbAAvRJHbnntHjew43NqzWljRddy5i5XbvB2Re5oR+qefrjpAfdHgbTLJYba9aURqOYp7RRozsg+v7YQuJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SG2PR03MB6610.apcprd03.prod.outlook.com (2603:1096:4:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:12 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 12:03:11 +0000
Message-ID: <bd4c8a15-ab13-459f-8fb5-fe3f3b04af43@amlogic.com>
Date: Mon, 16 Nov 2026 20:03:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
To: tanure@linux.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qingpeng.Yang@amlogic.com
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
 <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
 <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
 <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SG2PR03MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: f76c1b1a-3e14-4c57-c280-08df43d99625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	i72eIpqRrN96wKPS42WPbK1/NggB9t+xvSQ5vsELp1LE4apqhZtr/rlggTFbr/zsZGlzRLoUEJo+n+Denpq/zoVdj16iIEO0dUDPVEyX0eH3zOkjpU4okU2mF3sN1Gjoh/oZcYcEbcELrtuLV2lGDS9G5itZUhUxM9QvZgcMCH4o0R46uiUcWC/HsCX4Fmu4mkXezOomMSf9NfzbYyd7AsGr6Prf7qBth2QnFu1FFLR0vbJsB1XfouZPsl0GTGNeaR4YgHq3lFnXJ9/EwX5fyyM6+uW3nH4Oo8bOQz8IsXOZBoHALi+afc75zsTUKpDgEXMntP2bdDTBHZW1bGdy75ab8LQlWGNpOr8DM99wBgQwrK/4IsNrBYqidF5+M2fssnd7nRr5pgG3ecZ6VaUqtR8UGjOdVQ5w7lEZAJWyYcIxRiT/w6tLwkLGu44vLBBFUX0ptoYbzFqzL7fK6ivu31sljgCaKKViJhrRDgJhpN7FTeddVz9FnZlkSbhSZADvlGM9WiTbfh3Ehn1mVq33T2BOFqQNh16qbM5QbdfyGJeg2ILxwMlU/maeWZQSsbuz2z07BO4viY0N/ZlO9uIcnGJmStw+8qAqokPf5u6kLLQVyDqIon8fz5Gml7ajTnZw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGFQWVpwaktuTGtpdUNyMzB5SUJXVS9mdld1RENKdmtjME9PWXJtckg3THdq?=
 =?utf-8?B?a2dmUHJqOWlPRWVwUFg4a2ppeVNyL0N1dmZEeStkTW10Nm1xcDVsZlRVV3VB?=
 =?utf-8?B?TVQwekI4bHhnVnp0RHoyZWJGQmhIWWZQWG91V3FjZ2hFbVpLR2hsV3pOSGkv?=
 =?utf-8?B?bnN5amo1Tkc4VFUxYTR6T3dhWGxDSjQ4c0FUOUJMZFZyQWhvSFpubWdubWx3?=
 =?utf-8?B?WURYbGI5MG1qVUNFNFJTT2hqb2RtK3d2R1VZSTF3dXdzMDl1UGNlZGxCQ1dO?=
 =?utf-8?B?cndrQkxQZkU1aytuS2xTUkRQOEY0K05rUGE0RHc3ZW9zcm5GbFVGcU5OMTE2?=
 =?utf-8?B?WGN5aTVURHhPWHZjV0VjTlpxZkxXNEpHanBuMi9sa3hQSnVzbk5raU5qNk15?=
 =?utf-8?B?dFBMVjBCQ3dza0NPMlhZN01MWUdPei9iWVpvcEgzQlgvZ01SeWxCcVNQSnd4?=
 =?utf-8?B?Q1RJRVo3aUE1Qnk1U2JiSi9EaHNyVitHSTkzSWJnV0QvWmRzS2RmM0prOE9Q?=
 =?utf-8?B?Nk1hVnAyN1pacmlqZ2dIOWYrU3RiTzFxdmQ3YzZObmZQR2tPWmZoZjFFOTV5?=
 =?utf-8?B?UjlhYk92TURhZmY5ZVkxNmhIOFpod1ZWV0hqWnhkZTJGMzRuSWR4dU9rakJ6?=
 =?utf-8?B?Mk12czExU0lDbjVHaVoyc1lSRm5lRXBJaXE1VFVqbktXdVlVZ3UxcnU1b2U1?=
 =?utf-8?B?UDdKdkhzVWlsekFPL1pGdjI2VW9KbEF1cm5raU16aDdGUTkwSXpZcGNrY0t5?=
 =?utf-8?B?b3BaU0VCWEwvOXZWblVad3FRcmdWV1h2NFczRHJSbm1TS0gwb3J2WTZxUStF?=
 =?utf-8?B?ejhkVFhuMzRoRno1aDhpSVh6M1VEaTlQZEV3eGpvMzNQV0Rmb09hU2tYalhI?=
 =?utf-8?B?OHdzYWlIWmQ4ZnM3YjF4RUpoSm5uZnNaOWlrcFRGaFkzQlphY0JJay9Qa2cz?=
 =?utf-8?B?Q3ZQZ25LRmFVcXhrWWxFSFhEKzUrWjZFUWdsUk1xbTVkUXVSVllkdm9KYVlm?=
 =?utf-8?B?NWIwOURtQTRTaEFMMWFlbDMvT3Q2T0RMQ08vdFZTOVFIU2poOStmMURBV28z?=
 =?utf-8?B?R25IVmhLSVI4V0o3Q2pwYWo4M0xaM0lyc21mRTNFaGFENFRSYUhwYjRVRWxF?=
 =?utf-8?B?TEozTnhoZ09JKzFvQTlqbFdtQzJlTWFWQW5vRm52Smx2S0NLdHY3TjdJRXox?=
 =?utf-8?B?UlhQQmo4VWtsdTJGK1ZVZ0FuWWFaZXNQOHNzbDkxOVJwS2hLRThaaW5VbjZv?=
 =?utf-8?B?alBtNytuQ2M4YUs2UlNvYUJhZVhSaEVvRTlxdzIxcFUyclAyZHZ3U0lQTTZj?=
 =?utf-8?B?NmVucjRsSDhyUjlGdENydVprVTRJT29NdVZQdTJuMmROeXZzcVpENHNUWjhT?=
 =?utf-8?B?MkhmM1hFZlJNOTdQU3luSXBSZ0xlYnpKbEtiOXRyRE1vM1k4Z0UxQlN5OFRt?=
 =?utf-8?B?ZU9NRndkNGdaL0E0TkM5RGN0N1hZQUpMMm5QcGlNeTJaSjZqVENRZHo3WDEw?=
 =?utf-8?B?Z0Y4WVF4TXE0NVhnUDZxR29IdVczNHVwR1JIQlg0WUtTVFRvaXArbkl0TjI3?=
 =?utf-8?B?NUdoWTdFZnZhTVNKVlRYNFExWlNnYU1PYXhYL2tRNTdFTkQ0MEplMW9MMTJr?=
 =?utf-8?B?bmRkbHRHMmtSTUsrWTRPODNLRW56dUJzeDlSS2RIQzd6K3BZQzNhV2RhaVhx?=
 =?utf-8?B?djFhaFRWQ3pzT0JoWVJhSjB0YXlEeXROT1hXb3RJRTJLVWo1SHhrcFRYZHIz?=
 =?utf-8?B?ZTRINU1Sc2duQmZYSkNGRCtaK2czOUJqM2xzU3g2T3U0K2FITGVFcjdFV00y?=
 =?utf-8?B?bkFWNkt3ZXFLWXZTMHdCa1JtbEtPcFNSbGVYdkhRSWtlcTJzODRQVUw4OGhK?=
 =?utf-8?B?WGhvYVhKVDRXVWN6dFUxT1dxYTQzZ2lBMmloZ3hVaGdVajhjUzNXS25nRkR1?=
 =?utf-8?B?UTl6bVUxN0FWbkNsekNkWmJWamM5NVJlMDgvbTRrWkFla3VvL09NaGRPcFov?=
 =?utf-8?B?dnhaZnVYSDRxMjF5T21WcnhyUGJPc0txMVNMVno5SEhMM05jUHJGWld4aXBQ?=
 =?utf-8?B?Y3UrM1F2MXVIK1FYa01DTjhhdGx4TCtwSjV5aGhPTmJLUVE5R3YwNy9wbXhi?=
 =?utf-8?B?NFpCbTh1enZJazF0anFwSEVwWEM4VFpLMkU4VllscmowWW9wcml2S2twR1F1?=
 =?utf-8?B?YmFiZWZUMWRiTGFObW1TQk5INlNNTkJIZXoxYzU0VlgxaEpOTVRkeUl0dkNU?=
 =?utf-8?B?Y245Zy9XTzlwbHF0T2dOVG9IdThlWW5BVWoreFpRNGxQYzQ3Ym11N0NpTTNR?=
 =?utf-8?B?VGlaRUwzZUhzck9RZEtuK1ZpRnhLMklCa0xvekxKbm5jbWhZTDNUUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76c1b1a-3e14-4c57-c280-08df43d99625
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:11.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1bT6460YowAX8n5FRzJCVit5Rhj5TiVUImA42PH42bGI5RZVI/7p2r4W35rte84rWii70XoduibZa0WbASNFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6610

Hi Lucas,

On 11/13/2026 7:40 PM, Lucas Tanure wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Nov 10, 2026 at 11:43 AM Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>> Hi Lucas,
>>
>> On 11/9/2026 11:43 PM, Lucas Tanure wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Fri, Nov 6, 2026 at 3:16 AM Chuan Liu <chuan.liu@amlogic.com> wrote:
>>>>
>>>> Hi Krzysztof, Lucas,
>>>>
>>>> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
>>>>>>
>>>>>> Assisted-by: LLM
>>>>>
>>>>> Drop this one.
>>>>>
>>>>>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>>>>>> ---
>>>>>>     .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
>>>>>>     1 file changed, 59 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>>>>> index e769c9bb70d8..6de013e3e8f6 100644
>>>>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>>>>> @@ -23,6 +23,7 @@ select:
>>>>>>               - amlogic,meson-gxbb-dwmac
>>>>>>               - amlogic,meson-axg-dwmac
>>>>>>               - amlogic,meson-g12a-dwmac
>>>>>> +          - amlogic,t7-dwmac
>>>>>>       required:
>>>>>>         - compatible
>>>>>>
>>>>>> @@ -57,6 +58,59 @@ allOf:
>>>>>>                 - const: clkin1
>>>>>>                 - const: timing-adjustment
>>>>>>
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            const: amlogic,t7-dwmac
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        clocks:
>>>>>> +          items:
>>>>>> +            - description: GMAC main clock
>>>>>> +            - description: First parent clock of the internal mux
>>>>>> +            - description: Second parent clock of the internal mux
>>>>>> +            - description:
>>>>>> +                clock of the pipeline stage inserted in the bus path between
>>>>>> +                the controller and the DRAM. Without it, the controller cannot
>>>>>> +                complete DMA transfers.
>>>>>> +            - description:
>>>>>> +                clock of the register block holding PRG_ETH0 and PRG_ETH1.
>>>>>> +                Without it, the block reads as zero and ignores writes.
>>>>>
>>>>> This sounds like you take clock from other block. That's wrong, that
>>>>> device should take its own clock.
>>>>
>>>> I see that the clock in the dts patch corresponds to <&clkc_periphs
>>>> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB Bus
>>>> of the ETH PHY controller, and this clock will affect the register
>>>> reading and writing of the ETH PHY (including the ETH_PLL). See section
>>>> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.
>>>
>>> Thanks. That section is the PHY block at 0xfe028000, the region of the
>>> mdio multiplexer node. The registers in this description are PRG_ETH0
>>> and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
>>> them too: with it off they read as zero and ignore writes. My datasheet
>>> revisions do not say which clock feeds eth_top. Can you confirm it is
>>> this one?
>>
>> The information I can confirm is:
>>     - The base address of eth_phy is 0xfe028000, and its corresponding
>> APB clock is <&clkc_periphs CLKID_SYS_ETHPHY>.
>>     - The base address of eth_top is 0xfe024000, and the base address of
>> eth_mac is 0xfdc00000; their corresponding APB clock is <&clkc_periphs
>> CLKID_SYS_ETH>.
> 
> That is not what the VIM4 does. The stmmac core enables
> CLKID_SYS_ETH before any glue code runs. With that clock on and
> CLKID_SYS_ETHPHY off, PRG_ETH0 and PRG_ETH1 read as zero and the
> driver's writes are lost: U-Boot's 0xa0000 was still in PRG_ETH1
> after the driver had written 0. Enabling CLKID_SYS_ETHPHY right
> before the write makes it land. That was the v3 bug, every frame a
> CRC error. I repeated it today on the running kernel, toggling only
> bit 4 of CLKCTRL_SYS_CLK_EN0_REG0 from user space, every other gate
> left on:
> 
>    both gates on        EN0=ffffffff EN1=ffffffff PRG_ETH0=00001601
>    ethphy off, eth on   EN0=ffffffef EN1=ffffffff PRG_ETH0=00000000
>    ethphy restored      EN0=ffffffff EN1=ffffffff PRG_ETH0=00001601
> 

Sorry that the information I gave before is not completely accurate. The 
conclusion you drew from the test is correct. The relationship between 
them should be:
     - eth_mac:  works with CLKID_SYS_ETH only
     - eth_phy:  works with CLKID_SYS_ETHPHY only
     - eth_top:  needs both CLKID_SYS_ETH and CLKID_SYS_ETHPHY

> So on this chip CLKID_SYS_ETH alone does not give access to eth_top.
> Could the register interface of eth_top sit behind the eth_phy APB
> slave?

eth_top is the glue between the eth_mac and eth_phy domains, its 
registers are consumed on both sides of that boundary, so a register 
access has to complete in both clock domains - with either gate off, 
reads return zero and writes are lost.

> Either way the MAC node has to enable CLKID_SYS_ETHPHY, and
> the binding will describe it as the clock of the glue registers.
> 
>>
>> The CPU reads and writes the registers of these peripheral controllers
>> (or Processing Units) via the APB. Consequently, the registers of these
>> controllers cannot be read and written properly if the corresponding APB
>> clock (sys_clk/clk81) is not enabled.
>>
>>>
>>> Thanks,
>>> Lucas
>>>
>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +        clock-names:
>>>>>> +          items:
>>>>>> +            - const: stmmaceth
>>>>>> +            - const: clkin0
>>>>>> +            - const: clkin1
>>>>>> +            - const: pipeline
>>>>>> +            - const: pclk
>>>>>> +
>>>>>> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
>>>>>> +        # The RX delay line of this glue is fine tuning in 200ps steps,
>>>>>> +        # added on top of what phy-mode describes. The TX side has no fine
>>>>>> +        # tuning: its only step is a quarter of the clock period, the full
>>>>>> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
>>>>>> +        tx-internal-delay-ps: false
>>>>>> +
>>>>>> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
>>>>>> +        # properties instead.
>>>>>> +        amlogic,tx-delay-ns: false
>>>>>> +        amlogic,rx-delay-ns: false
>>>>>> +
>>>>>> +  # Delay definitions for Meson8b and newer
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            enum:
>>>>>> +              - amlogic,meson8b-dwmac
>>>>>> +              - amlogic,meson8m2-dwmac
>>>>>> +              - amlogic,meson-gxbb-dwmac
>>>>>> +              - amlogic,meson-axg-dwmac
>>>>>> +              - amlogic,meson-g12a-dwmac
>>>>>> +    then:
>>>>>> +      properties:
>>>>>>             amlogic,tx-delay-ns:
>>>>>>               enum: [0, 2, 4, 6]
>>>>>>               default: 2
>>>>>> @@ -106,6 +160,7 @@ allOf:
>>>>>>               contains:
>>>>>>                 enum:
>>>>>>                   - amlogic,meson-g12a-dwmac
>>>>>> +              - amlogic,t7-dwmac
>>>>>>         then:
>>>>>>           properties:
>>>>>>             rx-internal-delay-ps:
>>>>>> @@ -142,6 +197,10 @@ properties:
>>>>>>           - items:
>>>>>>               - const: amlogic,meson6-dwmac
>>>>>>               - const: snps,dwmac
>>>>>> +      - items:
>>>>>> +          - const: amlogic,t7-dwmac
>>>>>> +          - const: snps,dwmac-5.10a
>>>>>> +          - const: snps,dwmac
>>>>>
>>>>> I see no such hunk in the code, so not sure how to review this.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-amlogic mailing list
>>>>> linux-amlogic@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>>
>>>> --
>>>> Best regards,
>>>> Chuan
>>>>
>>
>> --
>> Best regards,
>> Chuan
>>
> Thanks,
> Lucas

-- 
Best regards,
Chuan

