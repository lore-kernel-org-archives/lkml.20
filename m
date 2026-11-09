Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192997;
	b=hWy/u2zdlazJU5bXfzgDCup72DPVpuZO2i32nQREH2KtHFL7c6gwhGl0vvRiOi8v3xlS
	 d1jTC9fknHvtyCaVFLE2kMphVYLUClSyEIaeVpQQw90DtJn8Opx+obu9qyW6Sn3yDskmr
	 m2n5CB4Qw3jgpORGKep+WjrZ78COahRFY9ZIxXKmqrwIwEqqDSR4cB3pD3cJ0rYptmlFL
	 UJNeA1KjdX3hNWpG9YbZNdmIJj1nuBvY3vLyhtu+6OfzKwMBuGzWVbWfxzezb1mBNEWPt
	 nVto7CepHwQ4glW2ImgW30vnQ/Vwz+HuTlhex2yi+zuKHngPdlxx8cyR9wJ+AokOT7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192997;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MdPpR36hTzO4Q8r9b0JxZ571lgYXZdXzXysO+IS4rZw=;
	b=JeFt+K2kQggbFUVO43V+oSJk6CcZoRxQyvR/PU4TjGpMIquegQL9vGwNCkte4rt8Ov2l
	 g0E2fMF8wJ6xuoIWXaxRx0TNQXZL8BO7AYWy1snV0mPvK4q3x46FL7Cd0/IJYrDYn+6I8
	 UfHvt4nOoHLXyW6rQWUCc94TjvdVrxSp70bC8xdX4p/Oclvtpb5BrbmF6lTPjw7BDNueM
	 0agp84XzS+C6dW0iVzoEo6eyRTjFpbJKGPwCeYoa97XbXap3Oh1fGufpq9td9q5wZzgf2
	 KuqiEMk0UESmHG2SjDXO8jJMdLn8k54R6hVaKLypRgzUTT1/7RoPao4i38BA/+s+BZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="J3ky/nLE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.87
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022087.outbound.protection.outlook.com [40.107.193.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D964606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D964606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=J3ky/nLE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmSIjCalmdku2690C/Bhxub/BGpZ3YGjxUbQIcREZXRTgPRiOJl2htHKc5gGS9+N8YpBv6027FFG0jLAEABvFJmG7BC4Q6d8wd1YrjFDqRcl8cLuf+zmo2WDLmle222z7pqxpIjgw0BsnzCEtZeVOCOfzt85P+cZh3W7khPzhwYOgz1aD1csd0gm1KmZ9TRhPqIVnd00h+ErvV5gjyCxB7Q7QuT9u4jIyCRSUgknrv2AIUTYnVdJAcnouiNigNOwF8iw7vzTz36KLK3N98ff4f7KXA19zQIPvaLST6SXy9QybvGuxXK+YXwKeDCbxY+mm5FPbgKWtrKVLt2Xx9VxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdPpR36hTzO4Q8r9b0JxZ571lgYXZdXzXysO+IS4rZw=;
 b=oz0peVNvDMfLmKVgSQe6oKzScNzcQQWamPwb+k+pQlpU7EoqctoXWSRaRoVUvcVMZjcSRbv1Tg2R4hF8xNKp2p7twBT3JZPEYxmQ/RuftYox1Ix5RweyZdywjJP4RKXxQBHFqdg0CevCOWbc+ZUPwnNv7AwkbAlNvAL3ND7btFZsnnzAZqItspRchG56kN1tgXgA5nQ1DshaR9PogRbq9yoVrmXov58W+QCDPcvGsjgM+KZtKGxf3rkONIJ5wUOFc9Nfic7zLyK5K2o2WTP2gjo3CN4fXCykQQg5S1/u+I12Gpzf79FaKZImKBRFfbdGlXBsMz8oID9Lbt9x5p2A4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdPpR36hTzO4Q8r9b0JxZ571lgYXZdXzXysO+IS4rZw=;
 b=J3ky/nLEqWlPco0FXALBLm99uLOEWUwDrTaZ6B5h8F6/Bmi6+pQR3YfAlew6mpvo/SZRx0Kc5cCIZQMJ8siGcodFvr4uA3d6qi4sYsvhiMg68P0D45zyEj8vzKsG8F8TpKLQzNKc6fZlsodNlyj3S+qxP3JFR65ng4B+rxWwm2K5+yX8vq5/GA7RQ7JezvMS1lNhqQCCCxzL9vY18gMi1ilLxyqjHCoY0DF+mU/PaD61x9XI2Skuf4AMi+Uh0gYIySEbw8wufQK2d9A/IJHpb94k0IY2WPQz50TKcgdsp9jtsGhoxa+Ybv8WLbl5czCh9EQVM6HjgSCo43kCmIaHng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQ1PR01MB376387.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:c8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 02:56:32 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 02:56:31 +0000
Message-ID: <fbf32318-bcf2-41a5-8217-b0863ad68638@efficios.com>
Date: Sun, 8 Nov 2026 21:56:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/29] sched/deadline: Reset the donor's runtime at a
 deboost in the class
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, linux-kernel@vger.kernel.org
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-11-mathieu.desnoyers@efficios.com>
 <sashiko-outbox-203929@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-203929@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::24) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQ1PR01MB376387:EE_
X-MS-Office365-Filtering-Correlation-Id: 34723ea0-600e-42de-ef2e-08df3e0d0ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VlxSM+Jccx03vXWzXKnQKs6oCKb4Dzz0/2eF6+2a6bgT4Czlc5Lo6KnQNCK+tbfwScmop9E0JgtrtuohBdRrb9D1DjJI+8tmq8xERYP6OMD5MBXPc9II705GXK4jRtDputCWL0lqWrJcILcmDxD5PSAoj/EDvR4AOJ7CUoSAMNUNRmjx0qbAjco+x35pnELDqeZLRTUAzj7Q/4v9q9YwWbv4AhHDiXf/y/7ar0P4CimsPf+xNLUDigQUBTgbAemq9pCYduUFAS5e3KlWLKeceucbmY95q2gytEZODog6PpM8eA2PLbOwZp5H8ViR3Rnb24z4JYQDboNZR/3NfH4n+OzArqx8/zN3+EGtg+n0OppuYECyd1HOo7aCRnEJ+YVx3YCz15MSCsUENXTRz6Ssu6ICEeej2j9B/ILe4GhpcdU3Eh81L5DBHOuKtM0X/5Ww/NvV0P/XVCcEpQUyuGkiDrnTTdE1w61qJDSQ2YFH7flP4NG5JqTXNHpOUgJyXqGx41dH5whxxDJ5DXRq/JUUZwoVaQUTODFYBFIJm+YTGI/gjVy/Hc0Ye8ae5tKuKf7jKMEOeTE7niNxKW+qaoRZvBs6ZWJrHJOK8z01xcjEr8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnV5akZhKzNiQlNjOEpucGFGY3NmWU1PQ1o3RzZFWmtXTC9aTlJFbFBVdDdr?=
 =?utf-8?B?Z2NJT21WeGVJOHBBckJjaEV0a2cxSTZjQ0dQQlhWZmdyUk54WG01YitHQUdQ?=
 =?utf-8?B?VmUvZm5MRU52NW0yelEwbkNEOEZqajEvUHRPcEV2K3FjVlFwNEN5ZzN0blVx?=
 =?utf-8?B?aXl6WmVsZHBnVFdoYktZOStPblF6UVNMUlBtK1RlcGROMldUUXVJRUFyaGQx?=
 =?utf-8?B?MEptcXZ3bUNsUURjTXRIK1JTK2JnTEdRSWJ2YXljcXE5eU91ZGF5ZGEzWkVU?=
 =?utf-8?B?ejJndzkvSmRoc3M4Q2VPK0RFZmZWeHV3ZzFzVVU3cVNFSTRuNm8yL2Z5eDRv?=
 =?utf-8?B?cllQeVY2VVhBWjUzRDZ5dlE5VTFNL1U1NDhjaUVDTHJoYTJMcmdOWnh3aVVh?=
 =?utf-8?B?Smp5L0pENHZwTytxV1VKalV3MHVhckZUTWRKS01rWVBPTTh2NUVEVjNhV01p?=
 =?utf-8?B?UXN2YWNpMHk0S2lTY3M3bUY3bmQ3KzNXZ2d1UXpsTG5icGxKaW5WcjBnVU15?=
 =?utf-8?B?WmkvdysraEt6YzRsUXNFZkZ3dFM4a1A5VXo0NXRVSTRucVVhblJHQ29Gamph?=
 =?utf-8?B?azRFZkNqbWR3SHRpSzFqdTRqUXRyZk9jYmxMdWVRUkR1OTBTYjczSTJ5YkE0?=
 =?utf-8?B?dk5hTmRqZWl2bWVHTTdDK2xHUXBoNzMvaW4wS2JWaVRqMGhvWHZRRVY2R0I4?=
 =?utf-8?B?ZjFmUE1XcU1BZzRJM09GNzlGZ3ZON21raEpEQUNIRWxCODZWL2d2djRVWHJa?=
 =?utf-8?B?ZFJZMktyUHhPYXJiZmRMK2ltR3ROZFplTkZyQ3FKYkRNVXd3b3BUeTFBRGVO?=
 =?utf-8?B?K005V3JEZ0NUME04a2lqOGpzSHVWSGsyQ2h5aFl0cnpaa1A5NWlsckRmQnVt?=
 =?utf-8?B?QS92UUlFTGovUmlybzhrZWdIVmpqdHdEdjBFSUt6NS9vdnYwM2FOZjVmV2Rq?=
 =?utf-8?B?Q0g1dFJ4S2pjamV2Mm5MNExYaHRxMEhVK0Y5T0xNTk1qcVdEaDlscFZMK1dw?=
 =?utf-8?B?NThMVzZDbXBrVWtQOTlndGl6ZmxNaGZDWTgvWUIzSURXS0NzUitrTDBYV214?=
 =?utf-8?B?UkV0YVhUdTlVclhidGl0Vks3YzZuUmpIMDBHOTlPK25RVWhtQUV4bzMxQzVM?=
 =?utf-8?B?NFJHNDlkRjFTTTA2OHVzRnYraDIxTkdCVVlUNUdHa1JkcmhrYzNoVHpMWUU3?=
 =?utf-8?B?NGdXZDFNZUJHMXY1Ynk2SG56b0VzNS9xOWZ5dE9OL3NWeStRK0syc2ZjaG0v?=
 =?utf-8?B?THpjRHRVenNLNHpmYUpqN2F5dGR1dm1ONFhFSUtDcXRsd1NUVlFTbkJVYzU0?=
 =?utf-8?B?MTR6cTh3dmhVVUNYUUdnVmY4aWV6RGZ2Rmc1NTIyT3gxTlU0QldkenNyUXlZ?=
 =?utf-8?B?Mk5VZEFyeWJZYU4xNXpjZkFuKy9CQ01UMEMrdjBCNkZuUE5udFI5UnlBV21M?=
 =?utf-8?B?b2JWQVJDVUoyS005anhTVmF6QlE5U2lDVTlPRzU4MmVHalAvM05pTzROWGV2?=
 =?utf-8?B?R210L3B2OFZLSlBhM2U4aEdlb1c0aU9Ic3h4RU8reW9hRU1OZGh2RFVEQzYx?=
 =?utf-8?B?YTN5ck5HaVpHbG9YcmpJWkIzdkcydlhXejNjYTVmU3QyajBhMzhpcHJMSEtx?=
 =?utf-8?B?c0JCSDJWenBTWjk2YnptNDBzVEh1K01QbU9OcVJ2dCt2YTNQRTRwYk5ML1BV?=
 =?utf-8?B?K1pzcS9SYjNML0pRK3lpTkFjdFVUbnhDZHIwNnJTemV4NjJPTDNwTG52UU9n?=
 =?utf-8?B?TDRxQ1RDZ3IySy83UjNkcitTRUFuNSs1eHNqdWRnVWtVYk0vZUpqM2N0Tk9i?=
 =?utf-8?B?VE5KaGJHeG5TV0p5dlc2WWs3RE1Ec3ZOdnlRMnpGZFprR0pNUEkzNlJ1R3Y3?=
 =?utf-8?B?ekVsR1Q5eFVuUCtDRFgvYXArVGhXTGhUY1FNcnhRdmN1SlhFRDZxZ081Q2xU?=
 =?utf-8?B?WXZtNDRwUDRWYTdQTTQxT1VJem1NcDVwenhpOGFzRU5kc0ZSa0tLVlYxZUJ2?=
 =?utf-8?B?MHd1aXpwbHJ6YzNMLzBkbE9zZDJZVFUxUFllUmdSdGFJMDJNbjZ6N0R2NnRt?=
 =?utf-8?B?TWZiclFLSUk2RHBVaW5LNlAwOSs5OHNnSFN3ZWhiaWFUcG40OHVxSVlNVWM2?=
 =?utf-8?B?VGhmT2wxK1lVeVZmRGFsSktBNnhReUh0MFVVZkZySnRGbDYwMnVOUWNqcGtT?=
 =?utf-8?B?Z2xsb0xnL2Z2SjFNQThWVkppOEUzNllYQy9JRmFINksrSE9sdnR3YnlKVFBj?=
 =?utf-8?B?RGIxS2xidk8yVkVHNlR2eUpBZDBYcUhocTRxaVNxeFIvWWhZSEtnQ0Z5dXh6?=
 =?utf-8?B?Ly95NHBscmZKS09HbUVlb2tselJ6Tkl1SnYrOU1pck5YTzRZb20rNGNiVGxZ?=
 =?utf-8?Q?VVvp7cpea2LhsmamzUqoXVVQB+iWGirgyzI6KtfMiYS3e?=
X-MS-Exchange-AntiSpam-MessageData-1: zr4CaqkSJlz55y1gTY6fYgicWQ5DzkASIgY=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34723ea0-600e-42de-ef2e-08df3e0d0ef6
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:56:31.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLQM8mSoXeeP93RYt7XJQjZwSqJ+BtvvTjJpR7YVyH7IIh1bxlMpkbrccDMfg+ZmD8KEzDfhx8t3tF8EBy0sSNBxnG4JNoVAu2hmZj1Tjcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB376387

On 2026-11-08 14:17, sashiko-bot@kernel.org wrote:
 > lost PI boost in rt_mutex_setprio() after dl_deboost() resets deadline

p->dl.deadline does not hold W1's deadline. dl_boost() copies only W1's
reservation into pi_params. The owner keeps its own deadline. A refill
during the boost adds W1's period to it. So W2's deadline is compared
with the owner's. In your case it is earlier, and the boost goes on with
W2's reservation.

A narrower case is right. A wakeup during the boost can give the owner a
period of W1's parameters. Its deadline can then be earlier than W2's.
The deboost then starts a period of its own, which can end after W2's
deadline. The next version tests the top waiter again after that reset.

 > donor runtime and deadline kept in dl_deboost() when <= dl_runtime

Known, and said in the message: "A runtime of dl_runtime or less is
kept, with its deadline. By that deadline, the task then runs at most
one runtime of its own." The second runtime comes after that deadline,
in a new period of the task's own.

 > dl_deboost() leaves deadline == 0 when task is not queued

Right. A task blocked on another rt_mutex is not queued, and the chain
walk copies the deadline 0 into its waiter node. The next version starts
the new period in dl_deboost(), from the rq clock. A new case,
deboost_blocked_keeps_order, fails on v5 and passes with the fix. The
constrained deadline check does not throttle there. With a deadline of
0, dl_next_period() is dl_period - dl_deadline. The rq clock is past it,
except in the first seconds after boot.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
