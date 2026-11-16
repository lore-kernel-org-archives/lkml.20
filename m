Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794815330;
	b=ZBpY4L+wqJhbrUl2kt2OycTMnE4DPN3JECTTP56MqetnaDqJDoqqL4utFHri6pc/7et5
	 ascW8a4LZKqLM4h4VC0jLdns4JD0R91MOZDcFaIgy0Xxxg+i1aODvmTddDXCYUCT5dbZl
	 nK/PIOzxtehs66Hc2rGyGJc8ZFoi/HD9btXLt5gLFxVFEbZfXZ/A2bS0ZoVcImkov2VK5
	 5RwuMthr6FT9fGVLYjXylFIxLGezPtthKbU28GMIG1Tcx4dswBILwz6dJdD0aSdw5eyyG
	 Sv4gnQ4pe2kSpSgPoHYFzqrCM1pHJZN8WYAfejcoXz4vABoPRBT5nkvMaRJunpuopaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815330;
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
	bh=3e9nW2/6Yw5ad6ZQzrWqg8kjnMJAeNrLhqwspkvJ0bA=;
	b=rax8OXaALItFTeaSTYqyruaXxp4RtnI4AqEGSM0dnacRdHqKtkjjSjUBI/AOduTpalSL
	 Rvp4GdZflH1QtZfzZNY0O91471YEGBSqvoTZboJanYJ0bSW+cyTk0tqhyV5xEcDIZUGJZ
	 RkqOpbtPegIX6w3Rd2yqqC2TNi3wR10epqD2FEIsm1qul7iuDxussRsl1TESrkgttEAXR
	 JUfGlj46T5NulE+mJlvfGwleGAqLZph7oQvjGyOoppZmsTePKCXamF69kPHqmb2qLMOZo
	 ASj/mH8b23mkpqjzV2yXuoVT8VZCEg5TgkoYAiS3LpHmMxm7GGFEnaGaW3P3R/SCR2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=AkgHxByD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.111
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023111.outbound.protection.outlook.com [40.107.44.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE65606A323;
	Mon, 16 Nov 2026 07:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=AkgHxByD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fk4hZ+LYv9JjaWMJq5D/AanGKW0G8RR/mN1HynqVA9U7zj3XB03jb4HirdX4hTQXgm9EH7eU+Hhy4NaRoBYjLeQj7X1ORz4XdomjX4QgZg6QWPSO72nDTovzsvhdOW/hbuhJb5RkZ4Q2RAB4P4C4GK7egu8God0KYI+rwTusHewrTyY0fq0LK1oec9+52Sd58gneDTIoZ3fsGCpa1IcWupQU6Igt4b6Y9T8Bwuhfm0czsayCyl/1FvVmYCfT+8Ka5ytSraelHbppPMbuXwY+M7Q6H1Tn23cqwSfWYqS4h/8jxPqr23IKkgkyywgMV8HkTCYwEyFTsRcBoB3YjzvweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e9nW2/6Yw5ad6ZQzrWqg8kjnMJAeNrLhqwspkvJ0bA=;
 b=dMa1Awxz/LxIwpAuZnZUCJ2gsEuc3fOx9upvIssXBTpNLFFr/qAKTNTI/CnP/nD+xlctHCrrvHutCkbJsEzhqZebB8t6M1c+wQSgs9B1yb9CO4rioO2x73Toafkc1eAKR3IkgjD77g7/RQb5YKI1v817Utdvb6NHBmOJgUoMANC6TYqOvXTZFZ7BUHDCG9pQNBAOPdURd+vAYaTLXR+Nlz3KoqCpGULTCw3Tp9t3NmQ6di3EAn0cIrsqsJ2qtTpEgplgeHMtwWQMvajXpbLKv4TGzru1TYKaFxOlwlscjBshBlWM7rcyRSBM7OmPEGm7R0O2LpaDsEPByHoZwdgSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e9nW2/6Yw5ad6ZQzrWqg8kjnMJAeNrLhqwspkvJ0bA=;
 b=AkgHxByDBzHIsAqq/auGLyROwGqXKMYJHKGv4JS9ewySbleq5EFqXceHjI1gEhuJOqxmY35Utd3FohkX9GLiM/ovMRyOsVx51AeFKcgbg9qoaJcplpgQtOm2hpNeFMiiZ/5YZzQ/4zpBLgeCYscOwNnubk/+z85n1+BRKYdNhScAkuGCTJ8yySml7vGoAmpK0J4pRUiEBnbU5i6Rk22H4OOJHjGYBDoXeAOW++Ik0XGs0th6cojhJSGUftlF8VD/qp6+0I9XeUnxLrUK+watUsvpHqAcPULXYWWqwHxEg1lEppWXc3naTpKZ0gyAIQXBenMEL2y9pgK0HNyKBrBmBA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB7759.apcprd03.prod.outlook.com (2603:1096:101:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 07:48:44 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 07:48:44 +0000
Message-ID: <b4ad7333-28f8-43bb-84a6-5b53ab884a06@amlogic.com>
Date: Mon, 16 Nov 2026 15:48:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for S4
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <b2999c2fe5193eac3ebb0796f3de44710e993200.camel@collabora.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <b2999c2fe5193eac3ebb0796f3de44710e993200.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:4:297::14) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: fbccd21d-62e7-4273-4b46-08df43b6097d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261021135927099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	xvJnYEK8VYST0t03xdpqKYTOn2mFs10+lXZE4qTuz/bASnZErq40HRHXWB2UOUNOTbxWtdgFH80rKwUJEZIhQIu243VeGKC2LTHn/J7yM8KwBq09h96SuiytSIuAbpSs2mbNLspXaQ91XfQMRakHKiausmZB/hroDncCUn9OmbvLPd+G/hRiMrmmX68j4ZDksLksYpCBbL9Kdy/sTskRbCMO1LuOIUEWy5bP54dOUPPZHjA05RMhz69V76b51sEbPKw6fu/J2ElX4FOwZET+VW79iIyu47b8O+9kJ5/PgqpkTag2zwUHEGNcDDro7bHXIf1g87c37BWKsT0DJcuadJKUhBXOZDIZHIuDue0FP7FJHpN4Kg5sVIzRRlCss0E7gd1In6Irj/JFIQ98cpWVYYOAXMfSEW/RSXvvikqF/S83WkgaDNopID3pfUr6UGbyYPchzEF+/kBFyWLpkMyxLWHpwhGkuiXu1WPWrUvsSDW2+XJXIXi6Seux+DgOISr/mpk02/XITF2//Q+S3XkrSoV7/8I2HiyujUGpLIjnIb6GK6fe9vs4xeqn7BMXSDtmRu9wU9ZO1zhVxINmY3SijawPR+pMRDtKR379EniJZexJ7tshs3dk/u+RM1Qp1cng
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261021135927099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9kY284b2t6WHRWNnhTb2ZXSk91WkdSTVVOQTBpeE5TVGlQaUM4TjNPNHkx?=
 =?utf-8?B?VWJNSjFIYTJXVXFxeXhqRXJVeFl6TFNaUkkvYVVEYnJ6cDlyVGFGRFJsUWpv?=
 =?utf-8?B?bVhSNy9wZWtpb3FSRmFjR090YzlDL2U5TitvWHhWMGdLV2l0SmwzVnZVamhX?=
 =?utf-8?B?a29ySEhGKzVHdG9ZQTR5aStMNm42RjZHNU1WVS9EY04vU25GQXcrTnorMlV5?=
 =?utf-8?B?cGRaNTlEUDVMRkdLQmFMcTVBdDBTV1IwZEtrZWQ5akl2ZjFwTmxheWo4OFRh?=
 =?utf-8?B?R2pKNzhzd0IwWUc1eGN6cUN1UUUvUFhOUHFIeDhHcFdWa0FTdm1HRXg2aVgv?=
 =?utf-8?B?UzNEdjRvS0hHSE1xd3BBRE0wUjdXS0xqVFVwc1FoY012R2JWakw4Mk11TE9n?=
 =?utf-8?B?Y2lqd2hKWHMxWjBPdzIzY3QzTHY5UzNPLzk0OE8wMnFaM0tIREFSU2FsWkZk?=
 =?utf-8?B?NXNIZ2FldXRzeUkrZTRwTDFMcVNTTjhhcGE1QUlZandmUld1UUI0QnhjdDR4?=
 =?utf-8?B?WStRdkFDTVJrNnRSK1pNMFN1WFVtYWF5U1V3Y1ZqSGdyMTZ1SkxWamNTdGdX?=
 =?utf-8?B?ZjNEWlpzRmhwWFBaekRDTFBtZTVSbUdibTJZaDhaOENkbkdNOGFPb2lRNlRa?=
 =?utf-8?B?bW52d1FXb3VyREJDVjAvdDZ1YTBXclNOS3gwYXZYVHZzclRwWHJRYzMyUnNh?=
 =?utf-8?B?Z1dPUW1tT2d0d2ZscmRTeG1ySDM3WEF6dWliTFA3VmF4NFZWNkpQNWJNYWRv?=
 =?utf-8?B?QnpSY29LYzMwblNMbzJ5ZTJZZld2UmJ5Z2pjNXFtM2U4Q0tlSTJNN2s2VEtQ?=
 =?utf-8?B?WlRXZCtTTjhKaWx6R2V1TTZNcndBaGJ5QXBFdU16dzE0SEN2bkFvbjhCelFy?=
 =?utf-8?B?OG12bllFTzBvWll5V0REbWd5TjJsanByWTY2dnI1eVJoaE5CcE83QWxTRUhN?=
 =?utf-8?B?WXg1RitKYWxaNFlyMUhYRkhVaStaajVEZysrUHFtNjkrUHd0eUpyZFl5MXBw?=
 =?utf-8?B?aXU1OWRpcWFVelZYZlBBbUg4NEl5eEM5aE9zQ3JoUTE3b3M1S3FUakpTT0xD?=
 =?utf-8?B?VnAwQXpRQWtQckc2c29LZjdxV012NXhWbU9sMnYvRUVFZzFvUEZNUys1dGh6?=
 =?utf-8?B?bkhLOUVNT2NZenR1SStoUXhuaDZLZlFxdWdkU3dVQkJ5VjVGVjViQk5wQmVF?=
 =?utf-8?B?S09zQ0ozTXZVV1Q3QzA0OWRiQktodWhUbTB4bXZYOXNHTkc0RllOZjZnajdB?=
 =?utf-8?B?V1QrS1JCaCtac2tKUTNpVGpkcFJsM3R1dmVKN0hnU05kWnJ0SjBWTjBWcHBL?=
 =?utf-8?B?VTZPZ1FWSVNUaW1saDBSQjd4S0NrdTV2Mm80Zy80YVViUjRnQTBkcGpnejVN?=
 =?utf-8?B?cHpvTmZJVUVCSkJuTktIaWxyTzBCeGc0ZGh5VmlxZWdhN2tJTzJNRkdDdzMv?=
 =?utf-8?B?clN1ZXlrNVh5RTdTejd3Nm9oaC83aGFyUTNVaHBWY2pEeG43Y0F2dW94UEJa?=
 =?utf-8?B?amFLOFZrb0FQWnQvdUdMSnpsSkgxN2dGTTBCbWxlbks0RUtFME5vYmNVMWtx?=
 =?utf-8?B?Z0lNVEJ6T05QV2l5dUZzN0xUbTNwUk9wdTZ0eXM2WVFHY3hKTklpTU9TbXNZ?=
 =?utf-8?B?eE5CVVhkOWgrdm45eVFWZXJXSnVET1FIL0tOOU5Fbkg2MU5HMVZacFAwMS8z?=
 =?utf-8?B?bFlSZVBaY1IwUzVKNE9xZWtnT2FVWHVKTVhweFdCdHVseDFwMG1GN2RlNnZB?=
 =?utf-8?B?My9GdDVZUDFuMGViUG9BTVBFc1hVSm9XN3FHY05GdnBrU0srMk9veHAxN1Rw?=
 =?utf-8?B?UlRYdnJ2QnhwVE5VcGJlRmx6d1J4bkMxRFhqMzV1ZWVzVDZoNXNQYW1RTEdk?=
 =?utf-8?B?OVl2dU4wVW5McmZsSlExYXlUcGZwVUZha3JPVG83Z3BIQVBOQzR6R1lFWmVF?=
 =?utf-8?B?cVljZzRUSzh2VXJWMmVTZzJOWU1VVnNQdE9ic0QyQWNITnkwK1pNSVRvL3Rs?=
 =?utf-8?B?RWY1WE4rMUc4V2Z1WC9qN21BVlZKN1d5Tjd0UURUNkx0S0pyWVJ0ZzE5dFBj?=
 =?utf-8?B?anZOTnRLeGRzcWRuMmo1S3l5Vk81MGhpL3JrZ1JMS3hRTlpCSzVkTmJEc2Qr?=
 =?utf-8?B?QzBNTEk2azlQQU9GQktMSlFXU3BYaHdKeTQ3c0dZSUVsUTVxWGZnUDNzMWZx?=
 =?utf-8?B?bVprRis1WjRJbmNoNzdjN0VTRUlrZTBKM3piRVRmVnRXbW1zU0dESFJ4d0dM?=
 =?utf-8?B?TUtabU9FMHBBYjEzajlkU0JBTStFNjZXUEpDbktqQlk3NWdNeVhGR3BudFBT?=
 =?utf-8?B?Um1Lb2p1YTE0Wit2c1BxSmRsbmc3RjJmUWlWZm96RXZuSGJZekJ3QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbccd21d-62e7-4273-4b46-08df43b6097d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:48:44.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIaOyZohVLYqNKpsoxINnJaZpaDFQil4zCSdG1eWszouoKRYjFEWa8uEQbGsRBTotQKD1TVeqd+2w6SSCfbibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7759

Hi Nicolas,
> Hi,
>
> Le jeudi 22 octobre 2026 à 13:26 +0800, Zhentao Guo via B4 Relay a écrit :
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
>>
>> The driver needs to work alongside with a signed firmware. The loading process of
>> the signed fw is as follow.
>> Stage1: Decypt and decompose the full firmware package when the driver is probed.
>>    +---------------------+                        +---------------------+
>>    |  Decoder Driver     |                        |  TEE Shared Memory  |
>>    |  (Kernel Space)     |                        |                     |
>>    |  +---------------+  |                        |  +---------------+  |
>>    |  | video_ucode   |  |                        |  | firmware      |  |
>>    |  |    .bin       |  |  Copy payload to SHM   |  |   payload     |  |
>>    |  | (from fs)     |  | ---------------------> |  | (Secure RAM)  |  |
>>    |  +---------------+  |                        |  +---------------+  |
>>    +---------------------+                        +----------+----------+
>>                                                              |
>>                                                              | PTA Invocation
>>                                                              v
>>                                         +-------------------------------+
>>                                         |             BL32              |
>>                                         |  +-------------------------+  |
>>                                         |  | Decrypt Firmware        |  |
>>                                         |  +-----------+-------------+  |
>>                                         |              |                |
>>                                         |              v                |
>>                                         |  +-------------------------+  |
>>                                         |  | Decompose the full      |  |
>> 				       |  | firmware pacakge        |  |
>>                                         |  +-----------+-------------+  |
>>                                         |              |                |
>>                                         |              v                |
>>                                         |  +-------------------------+  |
>>                                         |  | Store decomposed .bin   |  |
>>                                         |  | in Secure Memory        |  |
>>                                         |  +-------------------------+  |
>>                                         +-------------------------------+
>>
>> Stage2: When a decode job is scheduled, load decrypted fw via secure monitor.
>>
>>    +---------------------+
>>    |  V4L2 M2M Framework |
>>    |  +---------------+  |
>>    |  |  device_run   |  |
>>    |  +------+--------+  |
>>    +---------+-----------+
>>              |
>>              v
>>    +---------------------+                  +---------------------+
>>    |  Decoder Driver     |                  |  Secure Monitor     |
>>    |  (Kernel Space)     |                  |      (bl32)         |
>>    |  +---------------+  |     SMC Call     |  +---------------+  |
>>    |  | Select Codec  |  | ---------------> |  | Select & Load |  |
>>    |  | Specific FW   |  |                  |  | firmware.bin  |  |
>>    |  +---------------+  |                  |  | to AMRISC     |  |
>>    +---------------------+                  |  +-------+-------+  |
>>                                             +----------+----------+
>>                                                        |
>>                                                        v
>>                                             +---------------------+
>>                                             |     AMRISC Core     |
>>                                             |  +---------------+  |
>>                                             |  | Running fw on |  |
>>                                             |  | AMRISC        |  |
>>                                             |  +---------------+  |
>>                                             +---------------------+
>>
>> The driver is capable of:
>> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).
>> - Supporting I/P/B frame handling.
>> - Supporting vb2 mmap and dma-buf modes.
>> - Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>>    DPB reordering to generate reference lists, the stateless decoder driver
>>    cannot access reordered reference lists in this mode, requiring the driver
>>    to perform reference list reordering itself)
>> - Supporting NV12/NV21 output.
>> - Supporting Annex B start codes.
>>
>> This driver is tested with Gstreamer.
>> Example:
>> gst-launch-1.0 filesrc location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
>> parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv
>>
>> Retry the compliance test based on kernel 7.1.0:
>> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>
>> Compliance test for aml-vdec-drv device /dev/video0:
>>
>> Driver Info:
>> Driver name : aml-vdec-drv
>> Card type : platform:aml-vdec-drv
>> Bus info : platform:fe320000.video-codec
>> Driver version : 7.1.0
>> Capabilities : 0x84204000
>> Video Memory-to-Memory Multiplanar
>> Streaming
>> Extended Pix Format
>> Device Capabilities
>> Device Caps : 0x04204000
>> Video Memory-to-Memory Multiplanar
>> Streaming
>> Extended Pix Format
>> Detected Stateless Decoder
>> Media Driver Info:
>> Driver name : aml-vdec-drv
>> Model : aml-vdec-drv
>> Serial :
>> Bus info : platform:fe320000.video-codec
>> Media version : 7.1.0
>> Hardware revision: 0x00000000 (0)
>> Driver version : 7.1.0
>> Interface Info:
>> ID : 0x0300000c
>> Type : V4L Video
>> Entity Info:
>> ID : 0x00000001 (1)
>> Name : aml_dev_drv-source
>> Function : V4L2 I/O
>> Pad 0x01000002 : 0: Source
>> Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
>>
>> Required ioctls:
>> test MC information (see 'Media Driver Info' above): OK
>> test VIDIOC_QUERYCAP: OK
>> test invalid ioctls: OK
>>
>> Allow for multiple opens:
>> test second /dev/video0 open: OK
>> test VIDIOC_QUERYCAP: OK
>> test VIDIOC_G/S_PRIORITY: OK
>> test for unlimited opens: OK
>>
>> Debug ioctls:
>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> test VIDIOC_QUERYCTRL: OK
>> test VIDIOC_G/S_CTRL: OK
>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> Standard Controls: 6 Private Controls: 0
>> Standard Compound Controls: 4 Private Compound Controls: 0
>>
>> Format ioctls:
>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> test VIDIOC_G/S_PARM: OK (Not Supported)
>> test VIDIOC_G_FBUF: OK (Not Supported)
>> test VIDIOC_G_FMT: OK
>> test VIDIOC_TRY_FMT: OK
>> test VIDIOC_S_FMT: OK
>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> test Cropping: OK (Not Supported)
>> test Composing: OK (Not Supported)
>> test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> test CREATE_BUFS maximum buffers: OK
>> test VIDIOC_REMOVE_BUFS: OK
>> test VIDIOC_EXPBUF: OK
>> test Requests: OK
>> test blocking wait: OK
>>
>> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> Fluster test result of JVT-AVC_V1.
>> Result:
>> Ran 77/135 tests successfully
> After looking in my past data, 90/135 would be expected without deinterlacer. I
> already find bugs in the review, comment on that patches.
>
>> - 52 test vectors failed due to interlaced or mbaff clips: The Amlogic stateless
>>    decoder driver only support bitstreams with frame_mbs_only_flags == 1.
>>    Test Vectors:
>>          cabac_mot_fld0_full
>>          cabac_mot_mbaff0_full
>>          cabac_mot_picaff0_full
>>          CABREF3_Sand_D
>>          CAFI1_SVA_C
>>          CAMA1_Sony_C
> I don't know them all, but at least this one, and CVMA1_Sony_D do not contain
> field coded macroblocks, and should decode fine without the interlaced reference
> list. We've seen a lot of artifically limited decoder like yours output 90/135.

I checked the CVMA1_Sony_D with my bitstream analyzer, I found, for 
example, in frame 0, MB 320x192 is coded into field top, MB 640x176 is 
coded into field bottom, anda few more field-coded macroblocks in frame 
0 or other frames.

That said, the interlaced feature is already done. My latest self-test 
results with Fluster are:

JVT-AVC_V1 Ran 130/135 tests successfully in 101.885 secs (ran with -j3)

Do you suggest me to add the interlaced support in the next version?I'd 
really appreciate your suggestions.

>
>>          CAMA1_TOSHIBA_B
>>          cama1_vtc_c
>>          cama2_vtc_b
>>          CAMA3_Sand_E
>>          cama3_vtc_b
>>          CAMACI3_Sony_C
>>          CAMANL1_TOSHIBA_B
>>          CAMANL2_TOSHIBA_B
>>          CAMANL3_Sand_E
>>          CAMASL3_Sony_B
>>          CAMP_MOT_MBAFF_L30
>>          CAMP_MOT_MBAFF_L31
>>          CANLMA2_Sony_C
>>          CANLMA3_Sony_C
>>          CAPA1_TOSHIBA_B
>>          CAPAMA3_Sand_F
>>          cavlc_mot_fld0_full_B
>>          cavlc_mot_mbaff0_full_B
>>          cavlc_mot_picaff0_full_B
>>          CVCANLMA2_Sony_C
>>          CVFI1_Sony_D
>>          CVFI1_SVA_C
>>          CVFI2_Sony_H
>>          CVFI2_SVA_C
>>          CVMA1_Sony_D
>>          CVMA1_TOSHIBA_B
>>          CVMANL1_TOSHIBA_B
>>          CVMANL2_TOSHIBA_B
>>          CVMAPAQP3_Sony_E
>>          CVMAQP2_Sony_G
>>          CVMAQP3_Sony_D
>>          CVMP_MOT_FLD_L30_B
>>          CVNLFI1_Sony_C
>>          CVNLFI2_Sony_H
>>          CVPA1_TOSHIBA_B
>>          FI1_Sony_E
>>          MR6_BT_B
>>          MR7_BT_B
>>          MR8_BT_B
>>          MR9_BT_B
>>          Sharp_MP_Field_1_B
>>          Sharp_MP_Field_2_B
>>          Sharp_MP_Field_3_B
>>          Sharp_MP_PAFF_1r2
>>          Sharp_MP_PAFF_2r
>>          CVMP_MOT_FRM_L31_B
>> - 3 test vectors failed due to unsupported bitstream.
>>    num_slice_group_minus1 greater than zero is not supported by the
>>    hardware.
>>    Test Vectors:
>>          FM1_BT_B
>>          FM1_FT_E
>>          FM2_SVA_C
>> - 2 test vectors failed because SP_SLICE type is not supported by the
>>    hardware.
>>    Test Vectors:
>>          SP1_BT_A
>>          sp2_bt_b
>>
>> One remain failure is CVFC1_Sony_C, which contains crop information. The md5sum of every decoded YUV indicates that original output from the decoder was correct. The YUV was cropped by gstreamer. The correct cropping method for this bitstream should be to crop 30*2 rows of pixels from both the top and bottom of the image, and 13*2 columns of pixels from both the left and right sides.However, gstreamer cropped 13*4 columns of pixels from the right side and 30*4 rows of pixels from the bottom. We are trying to find out the cause of this. Other failuers mentioned in V1 and V2 were resolved.
>>
> Would be nice to report this bug.
>
>> Changes in v12:
>> - Add additional check to avoid the resolution happened in middle of a bitstream without streamon/off, due to the non-standard habbit of the userspace.
>> - Add a separate initialization claim, init_ctx, to protect the hardware initialization process.
>> - Add rejection to the formats whose type does not match the queue in all four s_fmt/try_fmt paths.
>> - Link to v11: https://lore.kernel.org/r/20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com
>>
>> Changes in v11:
>> - Check clock/power-on failures before operating the registers. Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync() so the usage counter stays balanced on the error path.
>> - Fix missing validation of untrusted bitstream input in the H.264 decoder.
>> - Fix instance/resource lifetime issues: do not re-init a live decoder instance when only output or capture queue restarts.
>> - Link to v10: https://lore.kernel.org/r/20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com
>>
>> Changes in v10:
>> - Rename the clock/power/interrupt names in dt-binding and dts to match the name of decoder sub-core (dos, vdec, hvdec).
>> - Fix the h264 high profile bitstreams decoding error issue.
>> - Use the allocation bitmaps instead of poc != INVALID_POC as the slot occupancy test, since INVALID_POC (0xffffffff) aliases with the valid POC value -1.
>> - Link to v9: https://lore.kernel.org/r/20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com
>>
>> Changes in v9:
>> - Rename the clock/power/interrupt names in dt-binding and dts. Add the descriptions to the clock items in dt-binding.
>> - Optimized the handling process for reference frame loss. The address of a lost reference frame will not be configured to the hardware, to prevent the hardware from accessing an illegal address.
>> - Optimized the error handling paths in the driver based on v8.
>> - Link to v8: https://lore.kernel.org/r/20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com
>>
>> Changes in v8:
>> - Rename the clock/power names in dt-binding and dts. Add the descriptions to the canvas and secure-monitor node in dt-binding.
>> - Improve code accroding to the feedback of sashiko bot, including:
>>      1.Imporve the resource cleanup and error handling paths in the driver.
>>      2.Mitigated race conditions between the decode path, interrupt handler, and resource teardown.
>>      3.Validate codec-stream parameters passed to the driver to prevent the potential risk.
>> - Link to v7: https://lore.kernel.org/r/20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com
>>
>> Changes in v7:
>> - Addressed Krzysztof's review comments: fixed DTS coding style, added board info requiring the config to patch 6/6's commit message.
>> - Improvements made per sashiko bot review, including:
>>      1.Fixed memory out-of-bounds access / buffer overflow issues.
>>      2.Fixed concurrency and race conditions related issues.
>>      3.Improved the error handling paths to avoid the risk of resource leakage.
>>      4.Fixed the improper V4L2 framework usage.
>> - Link to v6: https://lore.kernel.org/r/20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com
>>
>> Changes in v6:
>> - Rename the HEVC core and the associated power, clock, and interrupt names. 'HEVC' was a development codename of the decoder IP which accelerates h265 vp9 av1 decoding, but it coincidentally matches the acronym for High Efficiency Video Coding. To avoid naming ambiguity, HEVC core is renamed to HVDEC core(H stands for HEVC).
>> - Get rid of the unused function and interface.
>> - Link to v5: https://lore.kernel.org/r/20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com
>>
>> Changes in v5:
>> - Rename the compatible and the clock item accroding to Krzysztof's feedback.
>> - Use tee & meson_sm helpers to decrypt load the signed decoder firmware. Add the meson_sm describsion and reference to dt-binding and dts.
>> - Link to v4: https://lore.kernel.org/r/20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com
>>
>> Changes in v4:
>> - Use %pad to print dma_addr_t type instead of using %llx.
>> - Add initial values to some local variables.
>> - Link to v3: https://lore.kernel.org/r/20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com
>>
>> Changes in v3:
>> - Fixed the DT check error:
>>    arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: video-codec@fe320000 (amlogic,s4-vcodec-dec): 'amlogic,canvas' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>    from schema $id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml
>> - Added DOS reset lines to dtsi and dt-binding.
>> - Fixed the issue where some B-frames were not decoded correctly(The fluster failures mentioned in patch V1 and V2 were mostly caused by this).
>> - Fixed the issue where canvas_index leaks occurred during the decoding of some bitstreams.
>> - Rework the src/dst format storage. Use v4l2_pix_format_mplane to store formats that related to bitstreams into the context. Add the reset format function to reset all the formats to default value.
>> - Store decoding parameters related to chip platforms, such as maximum width/height and alignment requirement, organized by chip platform.
>> - Link to v2: https://lore.kernel.org/r/20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com
>>
>> Changes in v2:
>> - Fixed incorrect generation of the reference lists for some B-frames.
>> - Rename or get rid of some properties in DTS and dt-binding.
>> - Remove some useless code or helper functions, (eg. clk helper functions, reg I/O macros, and some superfluous print messages) replace these functions with existing ones.
>> - Replace all the printk messages with dev_err/dev_info/dev_dbg
>> - Use the helper functions from the existing meson-canvas driver.
>> - Use clk_bulk_data to map clocks from DTS.
>> - Retry the V4L2 Compliance test on 6.18-rc6, fix a newly introduced bug.
>> - Link to v1: https://lore.kernel.org/r/20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>> Zhentao Guo (6):
>>        firmware: meson: sm: video firmware loading via secure monitor
>>        firmware: meson: sm: Add video firmware loading SMC call
>>        media: dt-bindings: Add Amlogic V4L2 video decoder
>>        decoder: Add V4L2 stateless H.264 decoder driver
>>        arm64: dts: amlogic: Add video decoder driver support for S4 SOCs
>>        arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
>>
>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml |  114 +
>>   MAINTAINERS                                        |    7 +
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   33 +
>>   arch/arm64/configs/defconfig                       |    1 +
>>   drivers/firmware/meson/meson_sm.c                  |    1 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/TODO           |    7 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  846 ++++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  260 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  168 ++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  570 +++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  161 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  249 +++
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 2209 ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>>   include/linux/firmware/meson/meson_sm.h            |    1 +
>>   24 files changed, 5314 insertions(+)
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
>>
>> Best regards,

BRs

Zhentao

