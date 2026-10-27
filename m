Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116990;
	b=dp64SIR5j0FMjCBXnVmEFcVBibofRnWkQnYpzxQDNzypSYyCPxM6c6tJavXadrjARLkl
	 PUnSMAeXYKBlu+lxOJrgd+n92MXAXX0Fd+PPoyJ068bbA71T7lpaRsYI1lLKTFIroXby2
	 K48KQw8EGCL9oaPgvkmmpdcni2Jk++HMSh7AZtC9glMatBU5rzg0gkV8kZ0SWPP48UB3R
	 CcUg8UWYZYLpyI9a5tA7QgCAdAhxgUvFDIXyy7PphxxpApEKbtLkmvnhiA8TyEMVLX9Uf
	 H47WZt1Xu1sACtdpigPFOPZx9nEgjKuFtFrFwUepitWqhYKD2IjeJCj8Fre9fS8rxqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116990;
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
	bh=dSMHWJB6pw+2WwOcuB3RDAjVlWA+AUyk6Pe74KflIfE=;
	b=LQgkP+ouY7MI8V2kV6ECDZdTewQmollDFqqaUaKE6Uny4IUtDWMMZCa2dQYR6u6VSbhx
	 GNzef4W8vYaKfMjRWk7voqjZR8c3+zNFfrjAAMnlqX7YLhSBKylHaZNP8/RzN1JVq3Xj9
	 xJFGFh4MtX5N0apyl2eagxoVM6OrqWWjueCrG2EmU56eiOJCfHV2jc/sXR0ndl4vmVkr1
	 xW5KHxJSsLlgqHuJkWRgSgYbE7y/ou+YfmZAjQFPMZJvtgMeR92xf3bJ6jmw3hyDXBD0A
	 3ODs1I6PdgVgIeIr4JvBHsaFIlRVskPReqqrLtskGL3d/GluEybnEvq3igF2D+S4/0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=XQxO5+A+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.70
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BD606A31D;
	Tue, 27 Oct 2026 16:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=XQxO5+A+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGhsFkuyGU8m9NYAM/EcH/tal9/G9MAs5RcrvvpgJq9nXggC0WliqQ4MRL+qW/BRbhtwOyye6H+6N8GxvEf9wdVFsfaKxSGlLOtxeYkbsvW2YkeV67hBdZhrs1d9caN2RtxnFVmSofY05yVEMra5uU4JwKI3QOkpbEmsne4ou/cVz7415q2g5RtHZ+LXRBlkqUUokhUQgGjklwm6tH3WuuSA5FYq8UARvK9wpAMSBigu8wyvXB9lZdaRlGvi07jTmpQfchIJ8wkW/cASrBjGmtAR5QifwOuk056n2lFlpKzxI3z03wVmKu7u9isH1M32H5dYTKH5NycnurgMZ3YfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSMHWJB6pw+2WwOcuB3RDAjVlWA+AUyk6Pe74KflIfE=;
 b=CSTAwb6wq97ekvF9GRz32pOR070EVRGwwHNbGThr1TDCXqR9g7jPLSAEkhiUtI9iiM4QRpljtDdO7RWY8mJeNX/kOPes7OKT7/c5o07ZAn1zL9zxwTCbq49U4/tS7uuqtCSORHCoj+psqeBPs7iaajEdaFK43prMb564Lfn0Wxemf9zRXx07x12g0i+ta5HoSv+9HuNpsqnB1CQoJODP1XtK5O+NVQrLxMYqE9YFjBy0SbkdzE52kNpgfYYwIQL5XSs7p+Ow3INyoUVa6J8p794HEtrG+dIqoV83phXo+TkdajZt0jZG5ARXkrxjEaTnO0s3k3P57FWjzhFHMnqyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSMHWJB6pw+2WwOcuB3RDAjVlWA+AUyk6Pe74KflIfE=;
 b=XQxO5+A+9WswqMdaSB6yXtu+6QrGmXb2kk9rDjGC1XcGM6KYyrC5gx5XC6zolbHjlVvivvKeHQt6INXLwTL0uXSGC9A/yPOt6WGvp6g/el7QXiBho/V9J2bz2H39n8SM15exCTYTSmLfd3JWzRg9lTy6c5zOdOYTu3YuvZ3rko0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:03:04 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:03:04 +0000
Message-ID: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
Date: Tue, 27 Oct 2026 17:03:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
To: Jianfeng Liu <liujianfeng1994@gmail.com>, heiko@sntech.de
Cc: HystericalDragons@proton.me, amadeus@jmu.edu.cn, conor+dt@kernel.org,
 devicetree@vger.kernel.org, hrushirajg23@gmail.com, krzk+dt@kernel.org,
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 macromorgan@hotmail.com, michael.opdenacker@rootcommit.com, naoki@radxa.com,
 robh@kernel.org
References: <5520293.6fTUFtlzNn@phil>
 <20261027022801.377819-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261027022801.377819-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:803:14::33) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 4214a192-0e26-4627-e7e4-08df3443c871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261026140227099003|5023799004|4143699003|11063799006|56012099006|261026121527099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HMZYCkkkwOngZyM6M9qBjukMXNQeUSD4gKLSdNyIdVIWldgXia9ZIXbYpy4VIA6ifhAuwuzc9xpsZoGM7IVM8DngHDMiPXq5a+a6tlyzoqdQpxM4XmAyJYjmRDEt+lYWXpz+SwfB2sjsZ0gOfVDxserDa5HtY3oBgVd1t44JJ6yjAgmeIPQg4CtFvgg1tzP/HH0a1YCTP7vdT7qusegLMtDXAJ2435ggFq+7uZGjiTbs7mqCuaSIWlhmYG9qzNHcs63S3h8hNNmobZ0dDKEftkxcFPDMYVDKoM6GFK5cYQ1PGlimsbDxmMPWSyUv5MKx6KVzhOvZKetZdTZmAuiLpBTVB5AdoZ5cq5tm6P+/ugitZk/F8G54t/GNfD67P6p5CA9+5FCImi2j7hzVzdlUeEavAHkkTNU/qJstoK58+AqWKcxOXQosl3u9SYILnoROmN2YOzQbMcTtyEgdjGzU5F8G0Y5ejHsKBz/y4ygjMFfkIDf1+0vEkXOS+8Wnsy0qdEc2duDvELCz4pAPJdLc4kawvheQIGa380+psCyTkT0GyBqu2gPAZBRmXoEWbKhQRx/Bhgci6ibSd6yDLiNKdrNgRXRZop7A/pJK7INKXOiIcpngWh6v5DDhOBPyCRrz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261026140227099003)(5023799004)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MklXaVZQOTFXWkRDZk1FeVp6ZVNMUDF4amoyUEowc2NXS3BkYndUK2NseDdZ?=
 =?utf-8?B?MDRoR2dlV3cyYzZSTUNjaFNLQXpKc3RyTjFjS2VvTDRWcjlxV3dBUExVWm8w?=
 =?utf-8?B?bk9KZFhDaTM5NzU2cHJsZjFWeFFLN1NKaVRiSnFNc0pYc3l4UmhEcHZBM0U2?=
 =?utf-8?B?aEw0TGhpc2dxbyttOXlMUUZTUnF0VG1vRTlWQnZOVUFMOWhoSTFBNEY3b1lk?=
 =?utf-8?B?T1N5V1A5WWwwdjRFcE1PeXlpdzM1L1RGcG9HbmZWQ0w1L2VnN3AzOGkwUEh4?=
 =?utf-8?B?bWNtdzJjOExFMS9oNnVhd3d6ZENUSHUwVjdJeGhKd2ZJMjNMaXZhWUFUNEVo?=
 =?utf-8?B?WkNxSnFjV1ZIRG1zckdyV2U2dnRzb2J2bFdJT3FKd1piRll2ZGg4WDJTR2RX?=
 =?utf-8?B?dVhDZ3MxYklhcmE1aWZJajBXTGZwa3ZFRHFOVlo4SGpSeHFLZkxWSHdwRmdK?=
 =?utf-8?B?L3B6Z28zWXNBZ21hSVRCWjRnOXh6RDlzeUNkZWlMUDZHWmRnWUNXTDlLdGFl?=
 =?utf-8?B?MU1yWkU4N3FsOXQ2cVlVeFY5b3YvUzdvakVlMERPY3FWMUtnM3orQlo0UnVR?=
 =?utf-8?B?SG5FSTgvN1Exa05oSVMrY2tRTlhOVmh6QUN4ZisyT0hnU3RQTEsrT2RjeVJU?=
 =?utf-8?B?dHI3TDBUamJTdi9pbkpFQ1FqNlZlcHBlV3hZOGg0b3BGMVVYRFM5UmpQaThB?=
 =?utf-8?B?Sm5rd1BDQWxLTnljS0Q2eGlFaVgyMlZ5OUJzNStVRWt5L1k2M0d5Zmxydzlj?=
 =?utf-8?B?YWxlMUhLZGlyeDliWXZxenA3Mm43TDJCNmQ0MGhOWE5xZmVJZTA2R1NqS0VJ?=
 =?utf-8?B?YkgzT3BYSS80a0RtSWhSNjQ0bUFUOG9GVXlzNk1sQjBsVzZtbmZDamx0TGtt?=
 =?utf-8?B?WWYyQWdqVDhWdFJneEZ5dEpDQzBhdzdhOCs5b0ZQa2xoc2xhWkdUdDdXS2RI?=
 =?utf-8?B?K3hVTVFVL0VSUDVBaXUyOVZSdS96WS9QZy8wdjcwODNBZW8zeDFZdjF2Wmhi?=
 =?utf-8?B?d1Rvak82LzBBbGo3cFo3aDk5cFVaeGNkQzVXY0ZKQ0Z3c01KYlRzbEM4QTZN?=
 =?utf-8?B?cEdlL2NZOGFqNmZzcVpGWmtCVnZEZDV6TFRPVnI3cXc1TS9ra1poZkFLNzJo?=
 =?utf-8?B?a2FBUzlINkhyclZ5OUlWOTlxaEVNLzg1b2lDcGFzSE9Gczc3RnZSdkJ0NzNP?=
 =?utf-8?B?eXhwY1JrOHpUblZ4dkRhcHlsbFJ2RUVOYzFTb3dHbkU2WVppTDRqS1FDbDZQ?=
 =?utf-8?B?aG5wRGxxeFdGOVZmdWFhS3BBVXVkSmFlSVEzKzZhR1JtTzJvSGI3dUhQNkxE?=
 =?utf-8?B?L2Qzekd4QlBCYi9rMndVL0N5Q3oxYVM5bVdPeXN2YVJId3ZBaFl4bzhMSCtu?=
 =?utf-8?B?QjlGdE1wOHFMaEJMNitCQ2tOMDN3Rk5WQTZITWE2Y3h4VWVMM1orUEhTSzdx?=
 =?utf-8?B?ZUtSc3lyRTlOTlh1RTkwS1dKWVRNUlYyOTVrMVQrMEh4UVp4NXFBdGxKeFJB?=
 =?utf-8?B?MG1NMUpLdjRZdWtCU0RxOVBOcXliTmxPZ2p6Y29aOUJWQnkxcmFYdENla2tz?=
 =?utf-8?B?T0JLWDR6cmowNyt4RXpiWVZnRml4R0tiUy9YeEd6RjN2TlpOcUplWFc4SFN0?=
 =?utf-8?B?YUNYT1BFL053TXpGZXNsMEFuSElsS3V4TG00a1VRWHJ0KzNRcWY3QXE0NVRt?=
 =?utf-8?B?OEJmLy9WOGh0bmZNaTJBODV5M1UzZWJFYk45RXdXTkhTNXhmd0F1TXZKUHc4?=
 =?utf-8?B?a3JoNmhISlV4Y3Z3UXQvNUlnOWFaVkF3RGJJb2JPZ3phWVZEWmIzT3U4N0pI?=
 =?utf-8?B?OCtpSWRBQ2ExQnpEd0RiVTkyUjducHAwSWtRNGNFaG5vWUpsdXFOQ0ZTOGRN?=
 =?utf-8?B?UGxyQzlTSEU2RjZyNXZtTUxOVjI4VGNSNU5uYk5xTjUxYWRLdG1maVN4MFdV?=
 =?utf-8?B?RlZlWWFNdG1reVYxYmNxVi9KdVY3bk5IUzJaaldSNDZxK3dKY3htMklGUWFs?=
 =?utf-8?B?K0R5OFRkTXRBVlUzTHk2YSs3RHZuMFl0SUtzeE1FVWMyWFV4VUJxZFl3NnZK?=
 =?utf-8?B?WUY2NklUaWZMWHdrbDZJZU1VZDMybzltbDNzczNScTIyKzVmN3dJb2w0MjB5?=
 =?utf-8?B?ZWRzVmhYYkk1eFhScGJzaSt1NHpham9CYk1DNHRDTTJpc1pUNnNoMzhjZlBm?=
 =?utf-8?B?M2NXYWV0M1ExVkc1aS84WlJ0Wm11MjMwOE10MGVBNUpoc1hUWnZWZ0QyQ1VM?=
 =?utf-8?B?OUZadUYySnZKSlFTV2pJQitCUWpMZW5KdVUyS2FaZmZoVi8xUllDQVJLTEpB?=
 =?utf-8?B?TDByU1YzMHM1bzBWRlhLcmVnZThiNnpia0tIRXIyZVpUdWwxOGlVdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4214a192-0e26-4627-e7e4-08df3443c871
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:03:04.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6f2rbtw+emPb4m2goHDDomEL9l4CGDBMt2NxhUkOEvz/mKEPTaF7XHO3kC/T6uvq6qdqzmlopZ0wcCP/NDkonTFiKZTDuWLImGsjHvlJo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043

Hi Jianfeng Liu,

On 10/27/26 3:28 AM, Jianfeng Liu wrote:
> Hi Heiko,
> 
> On 2026-10-26 11:43 UTC, Heiko Stuebner wrote:
>>> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
>>> hardware design from CoolPi and confirmed that no hardware design
>>> modifications were made for the Sige7s.
>>>
>>> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
>>> than being independently designed.
>>
>> if it's the completely same board, just with a different print on
>> the board, why does it need an empty devicetree. When it's completely
>> unchanged, what's speaking against just re-using the original one?
> 
> The existing CoolPi 4B DTB does work on the Sige7s, and I agree that there
> is no hardware difference requiring a separate device tree.
> 
> My main reason for adding a separate DTS is to preserve the Sige7s board
> identity for long-term upstream support.
> 
> The CoolPi 4B appears to be discontinued and is no longer readily available
> through the purchase channels listed on its official website
> (https://www.cool-pi.com/buy/). In contrast, ArmSoM is actively selling the
> Sige7s and has committed to producing it until at least January 2034.
> 
> I'm also planning to add mainline U-Boot support for the Sige7s and
> integrate it with Stubble-based UEFI booting.
> 

I am not sure I want this in U-Boot. Why should we have add a defconfig 
(and thus increase the CI build time) for a device that's already 
entirely covered by another defconfig? I guess the Linux kernel doesn't 
care about this so we don't need to discuss this here.

> While U-Boot could update the model and compatible properties before
> booting Linux, Stubble may replace the firmware-provided DTB with one
> bundled with the kernel. Having a Sige7s-specific DTB would preserve the
> correct board identity throughout this process without requiring additional
> distribution-specific modifications.
> 

 From U-Boot's perspective, I would have preferred there be a simple 
difference we can detect at runtime and based on that decide which 
device tree to load between coolpi-4b and armsom-sige7s.

> This would also avoid confusing users who purchase a Sige7s but find their
> system identified as a CoolPi 4B.
> > The shared dtsi ensures that we do not duplicate the hardware 
description,
> with the two board DTS files differing only in model and compatible.
> 

I don't know Heiko's or Krzysztof's opinion here, but I think it would 
better reflect the actual context to NOT use a dtsi and simply have 
arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts include 
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts and update the model 
and compatible properties.

Cheers,
Quentin
