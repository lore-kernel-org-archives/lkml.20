Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792557465;
	b=pQ3pLK5ItAv/J7wQjlJnHtIk4DLXpHIjTgtLu8c1eINw/Io3j4J++5BTXv9XPtaPNN90
	 cgYCbYPo4eQtJCthU+KQjrDS/R9BPqo51fK20nSIgM+xPMVUoHxEm/BVTQplFC1rqn1E4
	 WRHVCSRpSa5P9z+7MiCQsyO4N50w833snK9xEqPcflfsViAQplc7sWp3yDmRErx9Q5PtU
	 87nVgNfueaXiWpScqSLW225m1H9SW6Bc9ecM3ofFLgnZwKREhdzUifvmdhF5fxhT/c/Ae
	 D8AX/sZnNfjKC/RrshJa0/rZwEmjU3pVpkBquq4bTsJYpptzbzMd5Wt9fhRxagfExTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792557465;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=pOkRKdx8Vk66QkZ+asvEGoFNTYxSGgVQbch1+rSMLx0=;
	b=Y4JE4hNGaP9rItD4K9yL80fdsOpuaCLwUo0nvta4gfY4nF3UmwDDc6bDMGYrm1DLt8pd
	 m77cLt0yZRPBm79Zg+/KIsgzsSCaE4aoJiZrdjvM6BZf7aXSuCm3sWMWyEZd5n3Kwlul+
	 jwbXtTRJfjv32LqYlZbVVtLDDHfqT77zJNnAh81UDxSgJ7v/L08VkUPeVw4NFFf5qo1lt
	 ww5sl3oUEvjUvUih0rSqvRhzAyL1HjMgypZ4b1Pk+h48X6WVtCweXkd5L+pb9KzqkMS1f
	 GFrFy58wTtxO6qR703mPcB5+VfM5yVckulFiZ1v9CRlMsetVOENLErZIZ9TjvV47C0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Io18hd8T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.38
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50719606A319;
	Wed, 21 Oct 2026 04:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50719606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Io18hd8T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEiLcAeH49AKAPuspcgz2UtzgnruJF1XHGRF+Da5LltEJOtLBek2LVRtPOkE5x7YL07gwhK4gkt8G84usWKJ0oC7hxSL+fPYLtMb+/TRwa3hqQcA2/6AmkLZQ048XkNp0Nx7V/wiEy5JiLxO/dKltzZd2xBy9DAIxull8IuLegXTEJKlsYPdUBy40ztKWPpLLzhmxgkV9YwMgZWLV+rHCckVWJV8oHAZ/RpI6QNTcMKv4niwg1iPiuZ8gipJRrRJRRxPyCxNAMKBMp/4wd8iADAYzrAelWqwmO6dn9G/WFu3DVVBlxCXu27sN+YyQSA5xJB6jVYEGO0sPH244VPQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOkRKdx8Vk66QkZ+asvEGoFNTYxSGgVQbch1+rSMLx0=;
 b=OYpnO19XCVFnWSD22VVQUfrtAOGjEKZrt2LPgll4STXQGhGmWAB6+qhuvZWI6ABRrWDx50NmpQ1LzJDBFW2q7ddv8PF6lwNbsfAQM7cNRK3vzom1abzfEyMOLOhl0xEfhXbozQUMPvkhMWMj8AcT26asPirvMD9eXxFNxjug1FgTB9RI2EL2vtE91ph743y/O1613AMRvoDGIYbjK4rG+IRL3uXmnqW4rMKh/ayfJM7YWJB+zxB1id17nHcdGs7AqfpwaxBVxDVRSHnHI4Bm2XkzKo2lBjNvrvDyLcUZm/OfgIhYcF5MNN/vJFhHZLFgqEwEeEvLivINMMxlbBACFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOkRKdx8Vk66QkZ+asvEGoFNTYxSGgVQbch1+rSMLx0=;
 b=Io18hd8TjMhx7Sx2BMUKRVCH5lt8E4XSV+np44d3rw90aSgiZZIMM0zIBOheqQ3fd/RQCC4pJuE8kwjw+515e1AIqt4JBMXIE6ueNaLmIZ6CfmShKpoKgWXdVEoEEFEyE6hcHUG7s13ekAn57dH+wQD4UZwCmVI12RDvG6P0j8bVDZXRfdNEd2KPPBgjxue04dCpj2YXJ0P4//TP8dMCKhr5YJo2t59vVCUhEyAymKdvnTG5rsv2TGXAk+E6TazYafp0/pUtyEeixRUG1UwGuaE4l7pQc5hfESqOI1wET7p4dPS6SsOwAxAZp/N4bU422gctDkHBD4mAVs5wbPqeIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AS5PR04MB9972.eurprd04.prod.outlook.com (2603:10a6:20b:682::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 04:37:41 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%3]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 04:37:41 +0000
Message-ID: <77fb2be1-e9cd-4300-b7c1-b70945bf1725@oss.nxp.com>
Date: Wed, 21 Oct 2026 12:37:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX937 FRDM board support
To: Joy Zou <joy.zou@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
 <20261019-b4-imx937-frdm-v1-2-76d949a61954@oss.nxp.com>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-v1-2-76d949a61954@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::18) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|AS5PR04MB9972:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c095782-3821-47fa-ff8d-08df2f2d0a51
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|23010399003|921020|56012099006|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ETjpvFefPb/W0SWSqJVur00tg3yZR++StuoyVYXaObeaPE1v6NEqaUn65Tlvt1GYADPoKxwYWPUj2Ur4eF0Rr3lsZMkAqpGF5CD1jiU5s5S+hoWwsZ8BQXhFZDSiplylJMXVJymqLxeK4/VusxYjzDskGRtv3aDkT3Ax20NJye1wtm/JzrAJFCHNnGL62dOTRNf7HV/J+EF1/Afs8qVNV5X/5niaGw1wLqKA1GZawPHVIp1Edwagu3goJ0VOhGqKraQLh8lkojFx6qcAjY9dnzlf00AFztgUTdKol/zMB9PeS+Ngz1thdhPrt9asaNpAD7+/s8f37CQQn8vC/lfZ5BwZBf4UQmB/zv3cwru6/hDtv29ZYhFGe8PdvmFyQmdpf+6Hhf5Z4tFNpgGbdhn4SRJy1+8izCwe6leqRxHVn1XX4B6nHn0V7SGLRX1oCo0hqik8VOUFPeHWFhtaZw2qR4noXX7feac0at5DSbCbjTL+cgs4/4FXhxPFP5hpGhIsA3Mj4W/Tku23trE3V4kkyQHRU63svNv4KYAoQck8YL5Q2AOMLe5O8Nnaeh6YHhoOZcJl+zEefUHEmHp6fbvJNZzADtMg/Ae21e7eNkJYQP/JkFcC2FcLChSuq62R2T9NLkUu/OR/qUB1aFu7tTJNxS92xwZYZFEiHGCOQxeOy94ZaAjfmSnmg/+AHc7edYP4kEZ3chMeJ4EbHN7C4tdPcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(23010399003)(921020)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzRnQjAybGdOWFJIQWxsWFNrSUl6VnMzSFJ2aUVhZ2hmWHluOEtNT0IrdHFy?=
 =?utf-8?B?aTlPcm5wdkJ0TVltYitwSjFTWHB3WENSZEIrTWJ4MEVqRE9GWGlrd3BraDh6?=
 =?utf-8?B?Y0tjQjR4SUJKelRwdTNHclJLL0lxdytkYmREWFgrUVRlZGk4OXM4L2wvOFR2?=
 =?utf-8?B?aCt2d285RzhQTS9Yb05tR0pmakRNbXo3NXNpRkF5MTFCS2RpTm5xTDRaWlk0?=
 =?utf-8?B?YkgrSnpqSG1qWVVkWTNpTlc4ZndTTG5WMWtSSWF1ZG53YUF3WVRjcGRBZWFv?=
 =?utf-8?B?WnF2aDdwL0YzQlMwSkZQYXgrK3Naa2hmajUxT1JkMnhpZld3WHF0Y3JseWV6?=
 =?utf-8?B?SjNXZDV6WC80NEZPVGwxZkJyanpCb1V5eWJrdm9leTRscU9BNlIxU2x5VGZO?=
 =?utf-8?B?ZnE1VWFVdmVxUzB4TXRIbjFTYUNWK084NVYxckR1TXRRZ1JIekUrYklLTHNl?=
 =?utf-8?B?RFY0VzlUcStSVUxxcTNWSmRTd3dCQkFjcXZxME12R095YU5CREpDNWJBamhR?=
 =?utf-8?B?cjFVNFJEOTR5WUdjMEpqVE9uQ1Q2RUJMeHpqRkxqWHJJSUUxYm0xRDA4TW84?=
 =?utf-8?B?OUxBN1VFemVYSXVpeTZKb1BaUk13SE5vZkMrYmJHMnZPdVBXU29wN2Z0SHpY?=
 =?utf-8?B?OTQxSTQ4S0N3V1ByWmFUSFd0SDlOaUo2RXJHbTMzRnhvSlVaQmNYTzQ3WnY0?=
 =?utf-8?B?c241endLM20rMnRyNC8yc0ZXdUZ4R29qbC9WY2h3QUlOb2xtd0FZT2hLajJO?=
 =?utf-8?B?RGl1QjhCbXhLeHhDOFlZc3JINDZtdnlkVUZKM1dkTzZTOS9CUWFYTXRWRkdN?=
 =?utf-8?B?ZVExVVlNeWdydXFlK1VyZ2IxRXRJMXArNHpFVWFtV1JtRXFkN1I3YjZ5eDda?=
 =?utf-8?B?SkRidURjbjdXb2Q0QUFHODRKalhabjBVMHdrL2FWbTcwdDhYQ25KMVR5K242?=
 =?utf-8?B?RVhJNzRlYXV5WjF4cTQrV0N3RHgwenV3UU9xWFpRU3lhUVZHYXpUdENiZncy?=
 =?utf-8?B?ZzRsZmFYRnhBdnM4d2xISFNDbU1SbEVaRTd5RTdKZTRaYUtmN2ZzdmprQXRh?=
 =?utf-8?B?M2RHS0oxNUVPOXFQaXJBeGFwZlRFVnY0RUFxRnY3REI4UjAxczF0QVpDb1Nh?=
 =?utf-8?B?ZEJJTEs0REZkSDRIL2ZFT1BqR3FISlN1MEVvNDNJSmNzSFQvSkxBS3V5VVhZ?=
 =?utf-8?B?ODljb1ZWV1g1VDVlWFNBQ1Jpa2trQWh4bjRaaHNVaVhSSzdtb3VDU0JybEho?=
 =?utf-8?B?VzhESCtiaUZlT2ZTTjl1bWp4MTdyS0Q3c0RFdng5WHR6emd6WXRPOUt1WkJC?=
 =?utf-8?B?b21pZi9oNU9uN2RkWGo2b3VTUWVWOE4zOThYVDFoL0cxUHRtSVFYMHNrbmln?=
 =?utf-8?B?ZzduTE1ZdDdRRWRyL1lndHczVHJsN2VEOTlMaDhkVndKUW9PMUpTeTdYUFlI?=
 =?utf-8?B?cVY0YzVWOVU2OUQrUmw3bDVyU3ZVWFp0WUprQ21jbmVzaElRVzR5L2I2Uldy?=
 =?utf-8?B?V3JsUWxYSGJvS2FxZTI1ZnMrcTBIa05KTk01YzQrSFNMRGcyK3ZOYTNIRldE?=
 =?utf-8?B?MW1idE1KRDFUdnVHZDlLSlZwVHhzeVhERGRDV3JMSU15SmlIRDhvblJ3UTJq?=
 =?utf-8?B?YUh5TXplMXliNkJ5ZDEvQ0p1bkJTVFhpNUc3dHJLemgwMkRaOS9ZYVNZTHIz?=
 =?utf-8?B?TmJQT2dmaUZBRTJIb3hrbHZKTzVUYm82MncxQlhGNkdVRkhTbWhwTnVZcFlt?=
 =?utf-8?B?OUN2S3phQzNFVTFheVZhSzBkUEt3OWYreVVvcW4rRytlSXNSLyt5ejJ5YVM1?=
 =?utf-8?B?ZW5DcU5GTFpqeXJ4YnFrc3QwOU5zMlJLQlE0NnRUdS9aMWxYRlk3SWZzL21h?=
 =?utf-8?B?QkZHalhId09XNDdwN2hwRnRobThsVjVvcDNZeG0rQkJuUnhpbEdJekVtUCtz?=
 =?utf-8?B?NEZKU25FV1N0Z0doT0RQUlRhQnpRU3NBcC83L0Z4ZFIrUGVwcnZIZ0RzOVJR?=
 =?utf-8?B?WVFkQmQrTXZXenhQWUt5d0pWVUhaOUV3bWVTd0Q1S1RHWWMvMkJncVRXL2Jq?=
 =?utf-8?B?NHlEcUpwMFFKVzgxaXV2eVFGMHRRb0dQNzZVbDR1Q0R5R2hMOUhLVnJPZS9u?=
 =?utf-8?B?cFd6RkQycFMwK3FLayswN3k3ckt3UGJHdUppMEw2S2FVSmpLKzIvZW5nT0lK?=
 =?utf-8?B?dnR2UXZjbEQwTXU0dGVnbk55NTVVeUZYNDJ4NGdFTThIc1hXZWdwcVY4OFNI?=
 =?utf-8?B?OUczR1p0WjFJeEpPTWVRQ0JZQ3ZZZ3VxSHNLZGlWSFhIY2loZXRnclVWWlRS?=
 =?utf-8?B?V2tlQk9PM0thM3ZZd3c4VHlxWkdJL3BTdVRtam1VNEM1ZmFOc0p4QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c095782-3821-47fa-ff8d-08df2f2d0a51
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 04:37:40.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mfkgux+EtHKSPE5mtyt5wgr4nbkRb8+Ws1hfJpUOSulZuCm/PHZa1UGUEFA4w4alse+214k037C1UGxisW8NSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9972

On 10/19/2026 7:10 PM, Joy Zou wrote:
> The i.MX937 is a derivative of the i.MX952 SoC, so it reuses the
> i.MX952 device tree as its base. Add imx937.dtsi based on imx952.dtsi
> and imx937-frdm.dts based on imx952-frdm.dtsi to support the NXP
> i.MX937 FRDM board.
> 
> Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
> blocks and runs its Cortex-A55 cores at a lower maximum frequency.
> 
> The PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM,
> unlike 0x20 on i.MX952 FRDM, so disable the inherited node and add
> the expander at 0x21.
> 
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/imx937-frdm.dts | 111 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx937.dtsi     |  12 +++
>  3 files changed, 124 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb5..5945969ada9c 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -944,6 +944,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx937-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx937-frdm.dts b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
> new file mode 100644
> index 000000000000..d6be48c81057
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx937.dtsi"
> +#include "imx952-frdm.dtsi"
> +
> +/ {
> +	model = "NXP i.MX937 FRDM board";
> +	compatible = "fsl,imx937-frdm", "fsl,imx937", "fsl,imx952";
> +
> +	can_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		#mux-state-cells = <1>;
> +		/*
> +		 * PCAL6416 (0x21) pin 4 selects the CAN/GPIO mux:
> +		 * low selects CAN, high selects GPIO. With GPIO_ACTIVE_HIGH,
> +		 * mux state 0 drives the pin low (CAN) and state 1 high (GPIO).
> +		 */
> +		mux-gpios = <&pcal6416_21 4 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	can_mux_pinctrl: pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		can_fun: can-grp {
> +			mux-states = <&can_mux 0>;
> +		};
> +
> +		gpio_fun: gpio-grp {
> +			mux-states = <&can_mux 1>;
> +		};
> +	};
> +};

Hi Joy, 

This can mux is also compatible for i.MX952 FRDM. Can you please add it into imx952-frdm.dtsi instead?

Then new pinctrl for flexcan2/3 can dropped here too.

Regards,
Joseph
> +
> +/* Select CAN on the shared CAN/GPIO mux when FlexCAN is enabled. */
> +&flexcan2 {
> +	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
> +};
> +
> +/*
> + * The CAN transceiver silent-mode line is on the 0x21 PCAL6416 on
> + * i.MX937 FRDM (the inherited 0x20 expander is disabled below).
> + */
> +&flexcan2_phy {
> +	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&flexcan3 {
> +	pinctrl-0 = <&pinctrl_flexcan3>, <&can_fun>;
> +};
> +
> +&flexcan3_phy {
> +	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&lpi2c2 {
> +	pcal6416_21: gpio@21 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x21>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		pinctrl-0 = <&pinctrl_pcal6416>;
> +		pinctrl-names = "default";
> +		vcc-supply = <&reg_3p3v>;
> +	};
> +};
> +
> +/*
> + * The PCAL6416 GPIO expander is at address 0x21 on i.MX937 FRDM,
> + * unlike 0x20 on i.MX952 FRDM. Disable the inherited node.
> + */
> +&pcal6416 {
> +	status = "disabled";
> +};
> +
> +/*
> + * The 0x20 PCAL6416 inherited from imx952-frdm.dtsi is disabled above;
> + * re-point every consumer to the 0x21 expander (pcal6416_21).
> + */
> +&reg_ext_3v3 {
> +	gpio = <&pcal6416_21 13 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&reg_ext_5v {
> +	gpio = <&pcal6416_21 12 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&reg_m2_pwr {
> +	gpio = <&pcal6416_21 11 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&reg_usb_vbus {
> +	gpio = <&pcal6416_21 15 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&reg_usdhc3_vmmc {
> +	gpio = <&pcal6416_21 9 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&usdhc3_pwrseq {
> +	reset-gpios = <&pcal6416_21 8 GPIO_ACTIVE_LOW>;
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx937.dtsi b/arch/arm64/boot/dts/freescale/imx937.dtsi
> new file mode 100644
> index 000000000000..7912a9c282d8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx937.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx952.dtsi"
> +
> +&gpu_opp_table {
> +	opp-1000000000 {
> +		status = "disabled";
> +	};
> +};
> 
