Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792994016;
	b=oKM7WRg1f7r5CnjnpbzD/nhpl/newL0e4Yopz+psQRp5ZL1q+LGBF1nK+I4ENVpvSCU0
	 QzpSmtvj+CVZxEyWI2ZK0arAIyIMyd/EAjyWA4bknKMeQFxFG5sSKBtr8uUyAJvAbm502
	 8pZfCWyFxxjrXQkRZSChuSwTTAIE++b6P0gKRkK2jkWdSfXK2fw41wB/bde4CBvdrcEgk
	 vWL6FRwV96grQONI/CY4402e+RT9BLvN9gQ4XBuOPVCIlBv+5elVFL6cJbLbZU3s7MbXw
	 0xEpEHRCmFE2sltOJJq+yOVQiKTGW7YinspckkbAMMoZ4JTkVGCA0KP5LYPaf2VDKnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994016;
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
	bh=Z5FVt4xqD+pdPsjAlQ0ZBcUt6hZQ39nWY6pLr3MBpEw=;
	b=ZxGjVWF7RqkWiIpvCr10v1RGoZYEFNRE2gjMqzuDxda8usgBqBg5/vQ/dIOwTGZGLJDV
	 CBpDPtCE+EcTfu7m0vDwx0kx6sl2JGPBTdv3h+Rm4pJsk01ifcwiUNXL64AkH00/dq2OV
	 hror/K7ccqRg1hVjEE5eB6ufKMJkKX16Z2/RJ7VP4sTZ0bc/xftAUu03ZC98cLSy04Cbu
	 3BoUlXXb/Jp7d0vbRrp2dNonbgjH5W6zn88tbyU1H/sfXTGTtvvbmHONya/kuhuhU9kIP
	 VLr8oDoaN+c86sqV013A8LLERBaH9LLz6DjQ6IRwVKvxmWrsPPjIgEkmGVcH9G4faiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=sMmwUuxX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.123
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023123.outbound.protection.outlook.com [52.101.127.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074FC606A323;
	Mon, 26 Oct 2026 05:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=sMmwUuxX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qktnJU+wJ7KRNejjJq1rLiWGnoo9O0VckRvvzv+JqImruWTq0J7ZVxSRkNmv2YRqa01AFO1N2RY7FoSXUeoc5LJVoKMrPjLCU0xvcVEw/hYdpEd2VuLNUhX5HGPSgck210Lyq9cxYHmIByRnmv4BgFyBhMhGgoOUoUVPROj9ZuHUqgie68aMvdf/Hta7yLG3CKVWsKYuK1Cyw2u5plCKcQdiwbj3Bn2EPKTAwnoCrFb3EFg2Tyt8YgpnhzgyXZkpJbQ64mi8NUbFyeToYID/QVXCV16BMKsUp/0RLMavmQRTJiEu7c0YgUApApaRV2E6XRjRfGWSqsaCu8Oac0cwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5FVt4xqD+pdPsjAlQ0ZBcUt6hZQ39nWY6pLr3MBpEw=;
 b=xAoJk1CvPnKq+mGQKbObSY5o0nujfr0gtvr1VauKQsC2lkTqiHQlCLOStcps4vXTqlVupXDWER/HdKGzRPqVlS4RbKAT6VGOdj2DFLFXF/9rsR0xSAjI7QlL7trGIxjbvxbyg0ZA2XWkmGum8J9B2UF03tgbCUW3FsdX9TVvXJA+oquXP/Ldu+Xa6gWNlW7Bm8J5Zo1/WRzrnsKMvTcPswxyerYjetwva0ZLR/ksYufnEn82ifNfrlEKp5rIiLQr5qvDSAT/cIcV2lhoBrPDjT/JogdcUh3l/Zq2EAcZgPhaJy3awzgnvw2MLLZqnDaQCg8LUHsymfJBowSPJ0/kIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5FVt4xqD+pdPsjAlQ0ZBcUt6hZQ39nWY6pLr3MBpEw=;
 b=sMmwUuxXKfAKBP+b+CdMFizxHRtcPXmGltkx244hhGTiGVoFahpWK4hL+VVXuKraVcytgL4NYk1FiM+1ZUYYUNuRvucrVC9Wg5wf4DEf2xii18+slcV+qPL+gLSBP0vwu6rfdn020yL9AupKeNj30v60KChABUYx1U/w2G8w9tM9r0urXbWNpc7H6ydfYjPilhZxc59DswEqI/OGKas6b/pt00KJk6s5nHJYb+2yFUsQQbUMcpO4KtKUCR4Jk/DBd1grisXZu3FEYHf7rHk8egnlh1WDPttRKCysN3oL7WfM0h3uVcnI6JTV5vilgbo47dal2GEV3YWGCSv/mIzjdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 05:53:32 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 05:53:32 +0000
Message-ID: <9d675b93-3829-42b2-b4b3-6ae24a4f3e7c@amlogic.com>
Date: Mon, 26 Oct 2026 13:53:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] media: amlogic: vdec: S4 decoding beyond H.264
 Baseline
To: christian.koever-draxl@student.uibk.ac.at, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To KL1PR03MB5521.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c72527-7919-4da3-cb5e-08df33257741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|5023799004|56012099006|261009223027099003|261022105027099003|261022115727099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aW1mXUQx40TY4qM5s6ClD0JfEZvfGELwrReiHHSmGSwJI0AW7KJfvkRJMhcRNZVVZ0B2jrPdGRwECkw+FTlwpahYoaCwvR/tzUjv73bTB8Der4BeDWjPA1AY7fvNR6IT44oz6oxUijMztA/muaXpuSOUsX1nhI/WvlMT+xM2y0rmT+MZ7RuJzAL3sctQZrFSgO9uIWLDERKe4WDgec1ce3CsjuYgYpm4+EPWzI4nNuCGmtD2PV+pzQc4iKOPwXx3uyotv4r/czmoqBRx1xrcjdcRawe7593xxx7140kAObonvQ2H0rfyFh2hYcEGTDPjbal9Es4CVi9KhYIAnv01oyPAO2hOTZrw8QDF9vkHlGGSoeuvqOB5Ug9thul4qjYvFNgKo99AFR6EvUtTZn319sLWI2BlGun5C/FBoeaJ9JR1vWGkGx7glvHdIx9WXzpIEovVYGthS4K/zkcr6d6iXn4LGyYPq9IfwbAZAv/kMUdNzb9dctCLbiyU5niv95fcQMUSUQt45zte/0XBv36RzpyRal6EOnXz3i0K1drA0GvxGtnjnAFiHi7/FwWP2sh22u2d46+menYPCVCxfz1cpEfXMaTuoaz+KqwwEXpBh6POvR+mGQ17NZuFHjZhPZxH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktEZ3RVYVNQRzg1dmtqSlNCbmJnTnpNaTFrZGE5aGlkMW1Ob3ZudVRIMzZK?=
 =?utf-8?B?VTNnRVduOW1xSXA5ZCtTczJITVh5ZkluWEIwNHZzbTU4OVdUSTJ0YlZ2T0xs?=
 =?utf-8?B?M1BkVFdJZlgyeW5xT1lmRW5xcDFnTFFtUnZxV2F0UDhSWk94YStINzN4Wjli?=
 =?utf-8?B?RFJLS1JLU1dGbXFUQXcrMENpc3hlcFNzL2tFdXZjNnNYYklPTFZsY1ZTcU14?=
 =?utf-8?B?Ukd3UnR6Q0MzVXptWlJkeGlqZHpBMjhpZzlhTTNoOUZNM3ZqWDVhcC9paGIx?=
 =?utf-8?B?RVJKTEdiUUFUUXo0c1plWjZ4K0tWbmhKR2dCQXc2OTBQSS90eE1LcXlnTUFR?=
 =?utf-8?B?SGpaSjR2K1lORVhGT2dYTlNDcml3ell0OFJrMTlXdVFDUkZrUTlrSFJQS0pN?=
 =?utf-8?B?U3UrM2VoVExvTXdWU3hoMmM2UC9vVitwV25mdldxNDZ5NGltNmpXZWNHVHFN?=
 =?utf-8?B?c2hIMk1haGt4aGVFVGhkTFR1SGNHUjhCNjVraUpCTFNSWjlxWng4dTY3U3lD?=
 =?utf-8?B?S1d4MHRXUG5kVVR1V3R4aFhjUHNEenI5OUJlVzJYeitFY2FDWkRFaXlhZWFX?=
 =?utf-8?B?b1YxMTFUOWhER3paQXo1cnhYSmRIUXROUjhEdlgvelVwNmZHL2wrbGpxWUNX?=
 =?utf-8?B?OHByRm83WGRDaTVyekJPZlllWmxnejlsUHFNL0FHL2NCVkJYejZpZW05WnRw?=
 =?utf-8?B?SU5RWWFxNUh2R0pZV25vbTdFRlRmVDZ5OEJIdEtiWUdORG1NTFIrL2Z4MjJx?=
 =?utf-8?B?Z0lTaXRRbm1zREJhdUpHSlZ1bEEzMWFjK0FIa1pTbXducmNkY0M5UThHY3hK?=
 =?utf-8?B?cm9xNG9xMER0OWRsb1RZQ09iT2IzMDdSOXRjUW9HQlVTeEhWeEVGUG1QVDdU?=
 =?utf-8?B?d2xIdStETjkwbGQyVzdHVkFJc3V2enVkTzY2SDRja2dWMUlrUWEra3dQblBE?=
 =?utf-8?B?azJzamlwMWs4TndmWTExSUNNQXlIUGh4V0s4TjlmVEM0R25qNm9uaUpUckNR?=
 =?utf-8?B?Snc2akxwL3Jaejk5UUE3bDQ1eXlxN2FhVTVVVXlwK1FWbVRsVlh1RTE3eTFm?=
 =?utf-8?B?cThKMFJCN21ZTWVrTUdEVlY3V0pld0k4NjYvbEczVEVBWGZTL3hDVUtDcGFm?=
 =?utf-8?B?eU1ZRGtJM1I3RC9jZTJzZmlXeW5SaEV6aEcyN3dKNVN2Vzg1QW4xeWxPYWMr?=
 =?utf-8?B?Y3J3TmNHanVEcjFmcFJ2QU9kdmhhQ0NnOGFyYmVGQ2N0czd1WlZhWVIwZi9L?=
 =?utf-8?B?VTZaUlZMQ3hwMkJyU1FOeWhGdmdxbVMycTlkQjJnQmJyMExJRTJSQWx3NXha?=
 =?utf-8?B?U0EvRXZDaE82NzQrSXdodnpXTS9qRENVOVlUWkdBQlB2Y2JLTnNSZHBwU0tx?=
 =?utf-8?B?ZXRIQzAwb3lUWC9uZCs1Q0NSWTZpY2NXRmhyTzAyMUJYZ1hDOVJEeWdqNU1a?=
 =?utf-8?B?WUVmdFBLbkV4QXpTVUtmMWlVUmJCZ2ZyMFhQb0k0WUdHa1RFWllpeTRjNUZ6?=
 =?utf-8?B?djhybXZWL1BkR011eGtpcjFmK3JzbmRNUno1andiVGY0bWpHRTBzYjJSczJl?=
 =?utf-8?B?RzJyS1ZuWHZMaFJRcTNha1Q2b2RRM1dkM1dkMXFJWFFrZFFGKzdIRS9SL2Zy?=
 =?utf-8?B?RnJtbkVvWGk4ZEFKMmNBZE9OV0pmZUxKK0ZBSmdNR0hhV3RFZmNHSHRyK0tS?=
 =?utf-8?B?K3JGbytqZUZOem5Gb3R3T3ZKM3lDWjcvRlBZT0RUVnhheXJlQm5ycCtrSFc3?=
 =?utf-8?B?MnVEcmxhRXc0NnNsRUI4UXRPZkRXZVFTVTRqTFdBUm9peU8zN0EyZHdPZ1FV?=
 =?utf-8?B?S2R0MGhVQmlhcUMvcWwvNFZNbzBzWWo1cW40RzFsNUFZVnI2ZmF4WUNaTkpD?=
 =?utf-8?B?SWxkZ1k3TlEzdDlveXhOVEtxbm1Ib1gzakV6b2VUNzR1V2tlbys1ZFg0OFU4?=
 =?utf-8?B?Qm9Sc1lvT00zN2ZXNEVUa1ByT1IwQkw1Vm5QQUY4N3hnb1dXdEhEdGs5T1Fz?=
 =?utf-8?B?S1NteHZFSlNYdjdyOXpxanlHNHdUTHdkK1RkMTIxWmI4eXB5RmE3clZ3cmZ5?=
 =?utf-8?B?aUZKemZpaUdjdmhYSWNNdGxLR0dMN1BxYi8zdTI2S0hSbE9ielZFaUlZRnls?=
 =?utf-8?B?WWFBcmJ0ZW5wdm14MHdKZ2NZMC9TcVp0WmdWcVVBdWJmRzdRTnJNSzdPYUxp?=
 =?utf-8?B?UzdiMGxFcitOTEh3Q1lnVkQ1N3FBNkVCdkVEQVZPdFFTaUFFcmlpaVJPbE4w?=
 =?utf-8?B?aHh5V1Vrb1h6QW5XWm5FdnkvUUJ4eHRzS2xCYVd1SFNTZzRYa2E3WDg5VVYr?=
 =?utf-8?B?alAyTnNTcjhYLzI4dTBSdFBKTmQxeTVxN3JjZXIwKzBTanBCOFRrQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c72527-7919-4da3-cb5e-08df33257741
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 05:53:32.1679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c10w8jfbzp+hEKoqb/i69gdrtwQItWMbcsohCLUCoOWo/kWwDlLBhUxUAtWS12M8ZDs1kepfaqjTbzxcV1RwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468

Hi Christian,

Very glad to see your contributions, I went through your patches this 
morning, the way you added support for other codecs is almost exactly 
what I had imagined. It seems that some of the code you added isn’t 
actually necessary for a stateless decoder (like the H264_CONFIG_REQUEST 
process in the h264 driver). You probably added it because you weren’t 
sure how the firmware behaves and assumed it was required. I have some 
feedback for you, hopefully I can get these ready this week.

To sync with you:

1.The H264 Main & high profiles are supported, please see: 
https://lore.kernel.org/linux-media/20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com/

2. MAINTAINERS path was fixed in patch v8, please see: 
https://lore.kernel.org/linux-media/20260831-b4-s4-vdec-upstream-v8-4-830195b9bd91@amlogic.com/

Regards,

Zhentao

> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>
> This builds on Zhentao Guo's "[PATCH v6 0/4] Add Amlogic V4L2 stateless
> decoder" and makes the S4 decoder usable for real streams:
>
>   1-2:  MAINTAINERS path fix, binding update for the second (HEVC) core;
>   3:    microcode loading that the secure world accepts, HEVC core setup;
>   4:    H.264 Main and High profile, bit-exact;
>   5-6:  MPEG-1/2 and MJPEG on the VDEC core;
>   7-9:  AV1, VP9 (profile 0 and 2) and HEVC (Main, Main 10) on the HEVC
>         core, up to 4K;
>   10:   MPEG-4 Part 2 SP/ASP;
>   11:   regmap naming.
>
> Bit-exactness was checked against ffmpeg/libavcodec frame by frame for
> H.264, VP9, AV1 and HEVC conformance and real-world streams; MPEG-2
> differs by the hardware's IDCT rounding. Tested with GStreamer
> v4l2sl*dec and a VA-API backend (Firefox) on an S905W2.
>
> Depends on Zhentao's v6 series (not resent).
>
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
> Christian Stefan Kövér-Draxl (11):
>    MAINTAINERS: fix the Amlogic VDEC binding path
>    dt-bindings: media: amlogic,s4-vdec: describe both decoder cores
>    media: amlogic: vdec: fix the microcode loading and prepare the HEVC
>      core
>    media: amlogic: vdec: h264: decode Main and High profile bit-exact
>    media: amlogic: vdec: add MPEG-1/2 decoding
>    media: amlogic: vdec: add MJPEG decoding
>    media: amlogic: vdec: add AV1 decoding on the HEVC core
>    media: amlogic: vdec: add VP9 decoding on the HEVC core
>    media: amlogic: vdec: add HEVC decoding on the HEVC core
>    media: amlogic: vdec: add MPEG-4 Part 2 decoding
>    media: amlogic: vdec: give the regmaps their own names
>
>   .../bindings/media/amlogic,s4-vdec.yaml       |   24 +-
>   MAINTAINERS                                   |    2 +-
>   drivers/media/platform/amlogic/vdec/Kconfig   |    1 +
>   drivers/media/platform/amlogic/vdec/Makefile  |    2 +-
>   .../media/platform/amlogic/vdec/aml_vdec.c    |  157 +-
>   .../platform/amlogic/vdec/aml_vdec_drv.h      |   21 +
>   .../media/platform/amlogic/vdec/aml_vdec_hw.c |  178 +-
>   .../media/platform/amlogic/vdec/aml_vdec_hw.h |   64 +
>   .../platform/amlogic/vdec/aml_vdec_platform.c |  129 +-
>   .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |  102 +-
>   drivers/media/platform/amlogic/vdec/av1.c     | 3140 +++++++++++++++++
>   drivers/media/platform/amlogic/vdec/av1.h     |  308 ++
>   drivers/media/platform/amlogic/vdec/h264.c    |  477 ++-
>   drivers/media/platform/amlogic/vdec/h264.h    |    7 +
>   .../platform/amlogic/vdec/h264_headers.c      |  249 ++
>   drivers/media/platform/amlogic/vdec/hevc.c    | 1728 +++++++++
>   drivers/media/platform/amlogic/vdec/hevc.h    |  125 +
>   drivers/media/platform/amlogic/vdec/mjpeg.c   |  471 +++
>   drivers/media/platform/amlogic/vdec/mjpeg.h   |   33 +
>   drivers/media/platform/amlogic/vdec/mpeg12.c  |  708 ++++
>   drivers/media/platform/amlogic/vdec/mpeg12.h  |   51 +
>   drivers/media/platform/amlogic/vdec/mpeg4.c   |  480 +++
>   drivers/media/platform/amlogic/vdec/mpeg4.h   |   52 +
>   .../media/platform/amlogic/vdec/reg_defines.h |   24 +
>   drivers/media/platform/amlogic/vdec/vp9.c     | 2004 +++++++++++
>   drivers/media/platform/amlogic/vdec/vp9.h     |  149 +
>   .../media/platform/amlogic/vdec/vp9_prob.c    |  213 ++
>   .../media/platform/amlogic/vdec/vp9_prob.h    |   32 +
>   28 files changed, 10847 insertions(+), 84 deletions(-)
>   create mode 100644 drivers/media/platform/amlogic/vdec/av1.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/av1.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/h264_headers.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/hevc.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/hevc.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/vp9.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/vp9.h
>   create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.c
>   create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.h
>
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> prerequisite-patch-id: 106aac9a55fa72f68fe458d405a69a66678c7040
> prerequisite-patch-id: ed3f15728a5c616aca82b5086dc924adba315993
> prerequisite-patch-id: 6845fd22135330ee201405f38d5c2a72bbe9d452
> prerequisite-patch-id: 626eaa3d309664901ba13acc331d327a4ddc64c1
> --
> 2.56.0
