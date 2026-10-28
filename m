Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180216;
	b=fMi1Bnfd//DfdID8cmVdNHULOh+WM77pVqLQmm95SFmNwXfKuLsOj4tm2avCXsd4fpnF
	 PGrY2lTSy7Nmb+tXQsPsbK5etMxa2Q/ufNXAwVBFWtSx6LAQ6UO86+OSiDXMHvZxsfUFf
	 6uTGdz4CRwnulmd48bSuo8VzRBhbFjEwMFWmLbYfS2h6RURf8ncWmKOC6a15aaOjbC2de
	 syHlk7ApoIehnrxemU0hlfyKn2ed0wCj8OuvomkZUUEA8RkcwMx6WWZEZDGjkb9i7QmKv
	 2jPAWylYCLTGJOOGwac35i/CWkIlvNZIvOTCCDaarjfVa1ZAy2Yd8LhORNn+ByUIlnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=b5v0gxoAKYQWMOKUOAidjye1Ds+x6+RhYPz/df76/To=;
	b=wdW/QOorymJZopj/er8/iP0rUBvUHLHkp5mNRnfJ8o6SN7g1V3tnwuDr5/g8UzXOuPcH
	 PiuFV3TD0g2VbTtmos6TMsqfefOmbU6Sn/OWZVc0BOBuqzLqoiL3WykB7ocD1jJxHQcza
	 I8YEV8U2jC3MU+2sve7j/IDLCWUT9w2cEWDYklUCq63mVNe8aDOcSOLcFv3nAotpPJxGK
	 nYWvCSYGajhru8/oX3J0yuHE4WwPx6CwM/nyDZSdHlseMH5g1khEBc+x84zL3JEcLFmMr
	 N1teofAYV8FMvJQGyD3mIyjushwFK3lTHF1xYE29kJu/je/2haYyy6H3DK02hTt/Nog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WkkIYifL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.35
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013035.outbound.protection.outlook.com [40.107.162.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54142606A31D;
	Wed, 28 Oct 2026 09:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54142606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WkkIYifL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkL0eEj6HuJzGMlMbMRsEk8GScL7mOoNyoilzCxOI/iNJd8ddU4NqCroQtSVB+nlXxB6glFjFoqHUrSFGlja3gyUNq/Ran0fWAf2XkaC4R0ukmMxYQdDEd5LLiSZS/wMl7CecODHynl3irFK7JqytOz1jvuaXqkkfW2qoq/0UNFIbEaP+qUI3si6y1oBKxrdCRCnnH2CpYKohimKwiW801gougwsv+cZKa0vvq8lkhy7uhukXCgGYR7ny650GCdmnxuhQW4ACVNFBo8Mp0Ug+w/dGmeNlSCmG308hzeTJBE5OvYFyzT5BI05DgGfydj8yKY8eWC6pDOmTFfJqmalCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5v0gxoAKYQWMOKUOAidjye1Ds+x6+RhYPz/df76/To=;
 b=NGDFDq/FOL22B8grb4Kw2f3akKydy49rE9OpJMwF9lRg7ffVs20ukeMfxcqxY0AHPr/v1DQldUfF7e3EElgibxA1Zkyh0If3/0azjvJ4k6StChKhCnmeTZUly3Df3aMeH3l03N24FodCK4FWRdCnsZDntlX6BuNohHFA9yrYZP/E9nM7ljxdh9oIVsm0ht8xwz7erDNWPYv4bs5nkLkewOggGv0fXvUirKlh1qNXvwBUPpG4AW3ymg84elBq4C97GMaONfiXVfCtzTTAkQ5NdzPWS3sAfchBzhhRa8e/o0NjSLQNP5q+6a2Dhduq67HZwj2oz7kSeqCP2QBS0WJquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5v0gxoAKYQWMOKUOAidjye1Ds+x6+RhYPz/df76/To=;
 b=WkkIYifLIsy9NSmDvOMyTyRg0P7Z9DpWL3b3C7Erj8YWpFbqk+TNqCKZ0MfjTU6iqNE9rjBPQBRz/YC1A4GKJWxrDLjFRdg4UMsZGEAPsjUc2TiI8W83b0Iy1ZwZnjUX4BdPO6igzJQIS19nMs+zPGXdjFsISLRgO9w8uFv5rvAkvl3CnbotKcDvZQOcC4MYoEN4DxngBFuEd5UHVHp79BDF7YQKoJVzUXCkgF0jo/NSvnVaACEfEUO39fjk2YbkECK1aO6t/zFXjSgx7Ic4liHHbVUfyKiV3dm0/XO06O+aCb9Vw/wHXcDrCC3gvVUDF7ZfVl+y+/xEv4aSos+1PQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by FRWPR04MB11199.eurprd04.prod.outlook.com (2603:10a6:d10:172::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:36:52 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:36:52 +0000
Message-ID: <dbfda1e7-73db-42bb-a812-0b572171fa35@oss.nxp.com>
Date: Wed, 28 Oct 2026 11:40:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|FRWPR04MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: 896f814d-a92e-4c2c-729c-08df34d6ff73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|19092799006|376014|1800799024|921020|11063799006|56012099006|261009223027099003|10067099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E8OemqR1KNVCc8UiE+lPRXGL4QaHeA0i3GilnJJw1Pw7AlXsg0Z2J/9IQBWOjzx5TPTNQ1p8IRMMO4U5a8ajJR/MKoarTINym1K514VJUSQTlO+UUQHcDYruh1sDg4QaAEVSQ6+rtMpmLStVG532z5ENVoYxVQhcu+vDmheW6r0Yk7nG1/j5m+B9JpLdaP21qkBU2J69bpHWdbk6+lE8cDJZlX6Lzn2ZB3v+hHYPrY/HqNYzBcu/pcVugAxXAbcVxZEEem+x7xVO2kZoDENwLBHL+bmP784j4jWDne7AiaHT6bXVp8MocLaZbzy1gUVRUy7nUJwnpRHYpxrnIUgDOr2iHzjTotWDQEXtwm1plFRn+OHI0lmkMCRVuCMxaCUoIGXb4CuqsOLtJWc8B0JQ5TpX5K31wN1mjMj3NJ1KOw6DuGk39rMeQFVJguf+xur7gbYvzTpOt2onNsNcvF+CjPzhNw1ogmOCIwLO4keAkC/NTR+SLhXNEesUNcbY3H4K7tDxvJic2wIc1+/uHSJltOFuXNXit9f12/MZyi1LVCxbUBJFYdQO8zeHTgmQKLNBSZnzGfSXkGjd4Nq9cWaENuLlj00SSJ9r2sQD7q2lFpdlDwjgWp5RSOjm11RizBNmzO7ioXFqPIFnzXpdp7+VQ5jUtfHf6Zv8gRqF7RtfAi3GcLwCS7EDuWNOx22EdQuXOE49jf5HJEo8HGhn7ZPvuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(19092799006)(376014)(1800799024)(921020)(11063799006)(56012099006)(261009223027099003)(10067099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGhrVVNWay9QVmpia1FZKzJBbWw3akFvNVZ2K09BbnFtWDBVaFV0eS93RmpC?=
 =?utf-8?B?TkxqMkZBTTRKMkIwak1sREZhczRTdWVKSHBWc3UxMUdzSEx4T0sxSlNMWVpk?=
 =?utf-8?B?QTFaK0RmRDZaRUZNbTdUU24xcVZVd2gzSGEzanZndzMrUUpiR1B2Q05BckVh?=
 =?utf-8?B?RGVBWFN2WFZNeGN4V1RxUGZGVHQ0NnNzUGc1QW1hU1V1TXlsbTJLWnJmbXNp?=
 =?utf-8?B?aE9FaU5VRWw0OVVGT3BWQTZoRmR5c0s0ZDBHNzVSbW1XKzN1NkhmM2Zmbk5j?=
 =?utf-8?B?T0daaWxqL2VlT0cxL2F4L1MyZi9ORWdsV0xYWDkrQTVoc3hJNUxXeWtqZjRL?=
 =?utf-8?B?Q1FJVzZxYVB6VXJBazVqdGx3dE4ydEh2cHd4NDhYajE5cTFlTVk4THkwTGlq?=
 =?utf-8?B?MG83ejhaOG81Z2JWVFlhNzBRZXFUWTlYUDlLWlFqMnJzNUNMNlVwSnlnem13?=
 =?utf-8?B?OU5UVGR3Vlh0SEllUWhDRzJ4Ryt2bm9XT1I1MFN1amhYWGN3Yk5GTjVHNnM1?=
 =?utf-8?B?TDNpc00waDVuWVdZVHJpdmpjdnhDeEVWZkt2NEVod2R1R3QvQnR2WG5SemVB?=
 =?utf-8?B?bFlDOTZDdHpjVS9YcGdYTkpjQUYvNEpndXpHcGFCSTdXOS96SW1EMUpJNS9E?=
 =?utf-8?B?WjZVYVFXRHdMVWY1blFlcnMzV1A4YWMySnhNbEpJV0NOZUdDSTJkNFd2a2du?=
 =?utf-8?B?N3ViNVdRZUttcXFRZ0hrbjhIaG02anVKNUJPMnEvZ2NSY0x3R1l6S2R6eHBM?=
 =?utf-8?B?MGVYakxZc1hPaEJaM0ErLzF4MWx1d3ZNeHUvNC9oNVFIUEdaUUp2blRUbWt4?=
 =?utf-8?B?SWxBME12a0VtNDJBSkVlZ1VrMkhiMDVDNDM1MnBqWUJOZFFhUEgveUx5ME5s?=
 =?utf-8?B?OUR1SjhOV0JmY3ZYRmtkNU9UcGREbXJFVzMvc2szV2pYczBlYkpOamVUTUJI?=
 =?utf-8?B?NWN2ZldMLzJ0dHYvMHFaamNNcmtQek5tOU1PRXVjcXFLNGxuWXZjYklORVdO?=
 =?utf-8?B?cUorSFRPeWEvSTBuTmNseGZIU0FzeDJZUXRMZnN0SWFqSGxUNnZESDNnYnlx?=
 =?utf-8?B?L2tuUFZEQjQ1UVMyd0tQT1pSZy82TDFyakZHVVQ5MHJySjh0MElpSCs5cENQ?=
 =?utf-8?B?OS9qenJ3MFNpSFJtNjM0YVlIMnFFU2J2UHFRRHRCcEhYNG1rMHdLbVpkRjg0?=
 =?utf-8?B?TENrMU5xUWFLVFVzOENrdTd6MktlOWpCckNmODV2L1FDUCtUWFNoSElsNC9G?=
 =?utf-8?B?MS9qdGpNK0U1eVFsN1VYSmFpTS9salNyQ3F3U2k2UTMxa1NTL21hMHNidmN0?=
 =?utf-8?B?SUFLalZHV1BsenN1R0h6NGhqVm0ydm9pR2NxRWxucmhpMHJhM0RpTmRocklI?=
 =?utf-8?B?L1BGYWhqVXJkR1pxYUJXdzhMLzNHbS9ldHFNUER6L05ZcVpaS1I5TkIxVWoz?=
 =?utf-8?B?Q1JjdE9qZDhPYmJNSXpjMklVZHpGK0FBUHpRcWJLbEN4b2cxeG1la0F1VEFD?=
 =?utf-8?B?bSsxODdYTXJIcEpzT2RaSk1rNE10clp1ZjZmVk1sbk5EOHBrcDExcDRwZkNK?=
 =?utf-8?B?Rko1cWptUlBmdFBBNDJXMTF1bndDN2dFNHdtc1p6YlVSYm1uYnlwcUlrUFNV?=
 =?utf-8?B?TXNpZWhBZlFLdzFqYTVyMW5YRzhLVXVUeUgzd1B3dmlXTEkyekpBZkxLc2wy?=
 =?utf-8?B?WFpoemNyNUg1YkRZUXlmdXJONWh3Y2RKYjd0UlR5R29SUXVLNGR6M2NneFR4?=
 =?utf-8?B?YllIUmM0ODJuWllSM0ROUjlDV0ZlK1JreEMwT0o0RWhrSWpIWDhJVjgwTEE1?=
 =?utf-8?B?SXFiOXdEdjljcDRxNEpmaFhwVXM4c0ZYeWpabUF2dUJodjdvbkpwU2pPMWRR?=
 =?utf-8?B?VFdIS1ZJc0kwWlhDMXVrcE1LZytmY2ZXRHhqS016TXdqRmdEZmV5bGNEWTQr?=
 =?utf-8?B?TDh0dVdHbExYZ2tGQnRlM2c1djliZUxlVFFkdWdFU0w1akEvc21xTDd0V2pN?=
 =?utf-8?B?SHZ1ZWYyT0drRDZFWnBoaVFvTitXb0ZHdUtVVHh4VlRLd2FtNlNZZ0x4M2xr?=
 =?utf-8?B?bytsYkN2aGtvUXZaS2RSdlNMR20rTTlUWFc2Tkx4QU56RHZJcjY3Sys5Mmov?=
 =?utf-8?B?ZTkrN3FEd1VaK1QyT3FNUzBUTHlYOWZtZDBKSjVUeThFWVZ3U1d5Vjc5NHU4?=
 =?utf-8?B?MVFHdXV4eUZnY283eTJPaWZJK1BmbUxSektEV0NFdHR6QkgrOC8wYXJrOEE3?=
 =?utf-8?B?djh5WnlLUVp0bk8rQUtUbnNsTHhHUTRHa0JLbTREQkc3NGttM0s1Qkw4S05L?=
 =?utf-8?B?ZTNqYjJHVW1tc3hzYkU3dXdsejE0V2Ntbjk0RzYwK05LblY4RHNRZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896f814d-a92e-4c2c-729c-08df34d6ff73
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:36:52.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPgm7gTFP/nj8nnAO9NhzGadRzrf25fw/iahbtUodHiXHs5mD+Y+jKfYBOaqbAwSKrbIaPO3RybHZR33CHNJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11199

On 10/28/26 05:16, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
> Changes in v2:
> - remove the duplicate properties with dtsi for mqs1 node
> 
>  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 74 +++++++++++++++++++
This will be included in the upcoming imx937 frdm board support so will get mqs enabled
there for free.
