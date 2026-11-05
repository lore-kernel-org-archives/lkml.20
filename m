Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888097;
	b=c0S1w8Vi/2l8sikZxiEXK9JE3S/7EzxCwcPid/4/QhLJlHEdWQjss8NgK1KHYS2l2dRb
	 t0wZ2mOFXJumELD6r8lmNy14JqMS2cLxOMslpqUtXw9O9bZGoAMNVNq+8z5Il51d9wQJF
	 qBsrWoygrR8sQi+RtxeC52oqKokhy4TZ2hR1PUVLW4qQZAjQdm2MKI5BV1HDy9WiSLq6m
	 k0XjbBacMUtKdtkxqVGH8dgY1XKYPdEuO9rQSnTDF4aDhee74Bae0U2QF+4d3sc4XWX9c
	 4D91QbLSpK5FU0PT8NX072fD/Lt5stJMtmgPWa0i54Fx/7Yrm6nqBH5/WlKA3NP4Cwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888097;
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
	bh=YvSt0xmGYm7bNXry2oeaOSsOCYc+SgX/gXTX30aSOck=;
	b=5kowSe/foe0QkxK12645uQ/WlmJofDOXV3xxdtljncYg7LZapeXAJuwg/B2Te7fDMmXD
	 CfuKcXsh9veAJNhohlw3dcPSo1+1doZs+vuskKuDzVK21NJxfzZWpYarZ0FO6nB0FrgyV
	 IpiiVPw6/nvXrHUXLnhUT0S//m83/5qx7LGyYoLqLgeHeYcB5bWekGhEgvfdz5mBnxa/G
	 58D1vmbIQ3/LblxA7xbSQCQCU6od5tAnco3RZM6gmF8VC3v4/LeZzhWAwdLLSwv2tWkS9
	 abG3mahiGZRYgiMqoRvtZrCvVGcib2A1cHf7NzRX8inEc59B0Pq98aGFLXpEl+mwwvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pGIVdYI+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA8608362E;
	Thu,  5 Nov 2026 14:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCA8608362E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pGIVdYI+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBC25qTstvKbKoGwM4W3FBBxmn/QLkH+sU32GxWo127LT7CjoekHtq64G1DJN4AOJCYKScY32XdZXcLfQD8Zr4B8iWWCS/jW3aIxawLkVbxT0eOjlWLmJUCXcpJva8XE5YVbkBmcvHoptcu+2wbfggfBGCUyJFE1IN0cs9EdN6K9QL+gvkqde0hzjFUmz5ZK8VHwEeaZ7sojfiPlk0z2NtFQZ0bhCY7FuuTvN08hzti5ge+//1s192cn/RbB7K9fQ4FGEPEuRJS7aWldiLm61CMe/ml5+VMat08t3ct3OQyZD7rSPicS85eXyMbQpaTltVI5NfRdkUTbJX/d54xjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvSt0xmGYm7bNXry2oeaOSsOCYc+SgX/gXTX30aSOck=;
 b=M7GyawzQUii7siVKxXGrMMJGzqrbTLQI767m6LShyI6P6djRJffB9MnamTkSzke92sNLqL30K686iKshdCZGkTFH24nuygD1pQhkbwEOZHsPDH4ZfR8/oLacBxMHuezATqKez2kwKNwbRyQSkDjHkCeLniQ47bWLBqgU+cruqFKtTXv/8LGWBRkXfbWkjsJl8pC/SzrVp7Tqwh96/AfG1dBIf1fWxtFfuRKsLfE7HvbGK3foghz6kIGFcu7U0Ea9vRHrlxb8EbvheMRYWAQN4qPB9wL2qqZqufKgd74pXRnqKSCw0h4zuZ+XuEV/UieiPYkD78lj3NmHThYNKkkOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvSt0xmGYm7bNXry2oeaOSsOCYc+SgX/gXTX30aSOck=;
 b=pGIVdYI+gxMkN/46G6YcHq6SfK+jyKzElgYNrvdtigONpmiRSER5JqYcy9STJC0IO5sNAxUUw1d+osOaRymqN0t/7HzT/9Fcz92+IB1aU3/g0Dqv1h+aED5hEnyom3Ih9PQHvGyu9V7jdJNopdDr69E3ViU4JMettFy8xS1xh8U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:14:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:14:51 +0000
Message-ID: <7084fa7b-e6c9-447a-927c-c9c05fc1264c@amd.com>
Date: Thu, 5 Nov 2026 15:14:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence
 reference counts
To: Danilo Krummrich <dakr@kernel.org>
Cc: Edward Adam Davis <eadavis@sina.com>, sashiko-bot@kernel.org,
 media-ci@linuxtv.org, sashiko-reviews@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 sumit.semwal@linaro.org, phasta@kernel.org, robin.clark@oss.qualcomm.com,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <sashiko-outbox-198550@kernel.org>
 <20261105052707.55911-1-eadavis@sina.com>
 <ad203438-ddbe-4445-bb3e-9632e738c1a5@amd.com>
 <DMNBUJVZHT7N.232EWW7QZINWD@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DMNBUJVZHT7N.232EWW7QZINWD@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: a46c7de2-2995-4379-75a0-08df3b4727da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|5023799004|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021135927099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0GBRoxy/wx00KDjSBLybLnBK7D7w2dtCbGWcqOpvmVXUvqt64oS+higss7kmdJXfNyioOh0ZXbI8A9N6tfyGgtLPr+0kZ0u6AIBPGmnY75zsskXkrnyCSvGEmeXmO+AZlTx62WftqGjl3pbDOrMu5OQtu0hDchVntxxvYigrEt8RY49AJe85unzu49Y1XOxA1nzHCKZduIxG7LD1fMmVyi+yWDq8ZUhol7EYAHtGD5GUvubXicE4rrFLshei3U0UHiZFxiPjfs+L/AcR3T8Ko0d5uM6Mr6KaPO8aLfLQr34qagOKmDI+neH1NVxMEpZ5+ee4WI6R6zce/O6QF8Sy+4ZGqF8djx9nOxJeRv9t+EQ9Bqc9tOBfWOFbPiM0IPPYpBK1AQvpEzw1KBLFW1gfxrwwR86dE57831YuTZqLq1p+ca7DWrnsMjTeEv8tquKKH9zVXzfaFRvA6ETGpU+zW5wNbxnpw4A0BycGmDmQzbCG/UA+xC0P6MxcP5xy9ejYVq/gp7/fyIvp6R5joJtd3yEwHxk2ZWMRQHjqepgvLqmbDNb+bnOUokcWuW1FDANGumC085oadCbadzBhZi5S18Bl0uqMydJaZx74BJbBYgP7IzNTcDPdJv+/6XMqljHumm3zl2A5YSN6tnShDFtgVCC7egp6n2hAY0QzvFl+HwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(5023799004)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFg4UjNwbzN5R2xHazhVWjdYNStEM0s5VHViUXZUdk51aXB6K2ZkSU1VSnhy?=
 =?utf-8?B?dmU2N0N0UEFRTWJvMkpFY0tRdzBsQ1JmKzdYWnR3cFp0OGpFL3R5d3M4SUZ3?=
 =?utf-8?B?ZGJkSnFJUVkzSUtGNHJucmEwMHE3RExXak4rSEF6UWxJOWNubzRLUU9uUUVS?=
 =?utf-8?B?NXE0UW9SckNaUXRMYUsvS0R2YWlGd1cra0FVTVhNMmJjL2ZPcTVFQUV1SFcy?=
 =?utf-8?B?d3MvaVlJY3NGUXA0UTQ0SjRJdFRRODFTWnA2bjl6eEI2MkVYM05iY09CWWtM?=
 =?utf-8?B?TGJscFBUUkQ2Wnp5blU3UEp2bFFFbHBkU3NGT3FXeGlWUS8vL2t6MHFPZWll?=
 =?utf-8?B?akJZRHBFQ1EwODRrTmpQYjhoTm1NMDdoVGlkR3JZMmFZRWRkTThLaDVCb1Rk?=
 =?utf-8?B?WHZlQ3haa1BPQndzaXpZNGxrUE9idnVFbW9ISFpNaVZiNGZqSlJ1MEhuSFUx?=
 =?utf-8?B?MFNvM0x4V3YwYlNWUWRmSXNrR2NmMHZ1bnhYQXBGSUJJdVZxcFR4VDNDdlg1?=
 =?utf-8?B?MEdTY3ZoOTBQKzhqWlZLa2hVYmtSdmZIUldXaXpOemRTTmxEbzRVYzZXbno4?=
 =?utf-8?B?YWJSNnFIbUxOczBDV1pVQXhndmg4QmI4RFpuNk56cHRvakNxM2l0alV0a3pt?=
 =?utf-8?B?YWRDYzRXQ09GaHovK25kUExSRHB3TXVwd0puS3BKVnp2andJR1MrU2tYMW82?=
 =?utf-8?B?RUxlanQ4WDdVeGpYRUlsR0NsUFJ4YmE3RkZ6d1FjSVBkTlB6N0JUUkNFNi96?=
 =?utf-8?B?VTJrbXJZVFZyM3ZqdGFSdjg3NjBwWnBRUkx5TlhZZnZNaUVDQzVSYk5qYWVD?=
 =?utf-8?B?SjJFVVpCRGp4UjJpRmxDQ093Q21QdGtXajVRc09IQy9MK2dIK3ZWZVJaSFFG?=
 =?utf-8?B?OUtCazcyM3hZU3o4TWtmL09qK1FGYnoxcnk0MlV1S2pEbTJ1Mm1VOFl5Q1kz?=
 =?utf-8?B?OGV4L0Q0OENxTzdaMEhMK21SZkJ4N2dxSU9YOHc3NkNrR0hyLy9vOXNwV3Nj?=
 =?utf-8?B?WUYvMEV0UzNBdmZaZlI3aDlFdlg5Z2piUVowUkRUaEpobjBLcW14K1dTSVpl?=
 =?utf-8?B?QUMzOXowcmhyTUwrNzBBNjZ3bFBSVkdKbWhUNkx0NnZSNEpxNHlpSVFWVVM2?=
 =?utf-8?B?TFlBUllDUmhiRENibTdjbnplNkpvTWRod0NpdDFiU2xFNXpHMW9kSk1reTZB?=
 =?utf-8?B?b2JNeHEwL1pINTF6ckIzYk5lNlplQ1hJaUdiV3A1Q0M0MDl0QlJuNVVrOThX?=
 =?utf-8?B?aTV4dDc5RDgyK2k2ZnZDUVV2djV5Z0g1WW82LzV4MnU3ZERKcld2d0NzQVRy?=
 =?utf-8?B?UkJZT01BL3hBRWpwQlk0YnhnU0pBd1FPV3plWUpCdzBmMTVNaEFrMWJ0RGlq?=
 =?utf-8?B?Y0drSjByWS9ib0RzQk9qdW05MS9TQ3pMZjI5L1U1aDVFb3FtbDI4ancxNGl3?=
 =?utf-8?B?NjcxVW5HY3N5eTVNYnBKOVRRT0JieXRFanVoNkFOd0p3d01pNUtqSXovYS9D?=
 =?utf-8?B?UUNpM0hJeXhmSHlWWVM4bHJ3eEZiZDJZaFpUSUtNTG92L0hNQ2JtSEs3eTRM?=
 =?utf-8?B?L0hpdnVMaVIraktDQVlaMGw1OGZuU2hMYWszczhqOThKZ0Njcm9HL1FLQThR?=
 =?utf-8?B?NytNRHVWZ2xTclZsdC80NHJya0M4Nm4yWnZVbVRURVNqMDdMY3phZTFlVnJT?=
 =?utf-8?B?QjZBS2NGcVU5WWNFQ0ErelVIT1A4ZTBLVmRoejNueVBPbkNNbU0rZ2RzQ3lW?=
 =?utf-8?B?YWRTR2YveXFoTFhJOG1kZVcwSjhzWnpqMnUyc2xjekU3b3BDdVRjU2c2aXNP?=
 =?utf-8?B?QnlkMVZlMnhxdVQ4Y29oYWVwZ0ZLRHN6dFpSTVRScGxhdDEwM241bVRKVUxs?=
 =?utf-8?B?V0JOcTRNbTdQK01vUmNRUmhhQUdNRXREeUlrTVlxM1MvTEtlSDZhZ08zT0hM?=
 =?utf-8?B?QldCR1lrbjVhZ3cwOFVwWFRGNkFyeUlnTzdIT1dCZXhuWkpwL0Q4REtQWGha?=
 =?utf-8?B?dHg5cGh5LzljKzBWSnBmNk9NTlNqai81VkhFd2JhNEtHQlhKVnJuQ0NkbVVL?=
 =?utf-8?B?L0FIQ0kzSmpJeEk0TkJDZXFTSE5xWllXdUFOcGExRWVueU5jVnd4cnBPakhB?=
 =?utf-8?B?azc2OGpCWUdFMVBpdUcxeHhIbWVRcGZncXl4dkR6T3YvTXkzUHUwa0ppTTZT?=
 =?utf-8?B?S244d2xiYzdoRk53aTh1OVBUS2Zrb0tXL29zWUpNMHJOcWpZOVl5c3U3MThl?=
 =?utf-8?B?RFg1UlVRaDU3cXJWREpVcGQ1V2xTNjQycW1aUFhlek0rUVNPdDRVeHlkWkkv?=
 =?utf-8?Q?QqqB10vzMtj5fzpdLr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46c7de2-2995-4379-75a0-08df3b4727da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:14:50.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Goqrz2p3x1VJsdpTZDoWZWiCfj0BO0yF/Lb9xSRFQywXprCyB3G1thVeh8XvgIix
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780

On 11/5/26 14:55, Danilo Krummrich wrote:
> On Thu Nov 5, 2026 at 11:03 AM CET, Christian König wrote:
>> On 11/5/26 06:27, Edward Adam Davis wrote:
>>> Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
>>
>> Please completely drop that. This is not something which has any justification to be backported.
> 
> Fixes: identifies the commit that introduced a bug for better reference,
> independently of whether the fix should be backported.
> 
> If something shouldn't be selected by autosel one can add
> 
> 	Cc: <stable+noautosel@kernel.org> # reason to exclude from stable

Oh, thanks for that! I wasn't aware that this possibility exists as well.

> In this case I assume you said that because SW_SYNC is test infrastructure? If
> so, AFAIK the stable team explicitly does backport test infrastructure as people
> also run selftests on stable kernels.

Well yes and no. The situation is a bit more complicated, the point is that SW_SYNC is largely deprecated test infrastructure.

The provided functionality from SW_SYNC can intentionally hard crash the kernel without any chance to recover.

The patch is now fixing a bug which could potentially crash the kernel while using SW_SYNC, but for a component which does exactly that it is kind of pointless.

I mean it is nice to have for documentation purposes, but SW_SYNC is only still around because we don't want to break the uAPI and keep CI systems running.

And *YES*, SW_SYNC shouldn't have been merged in the first place.

Regards,
Christian.

> 
> Thanks,
> Danilo

