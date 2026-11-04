Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793789957;
	b=wAZknzSIPs+vHoamO8Nvq634zDVS76iN26tzNjerbZCOVAosQ4Qt2+wnjCLdvbTwcMMC
	 CYjltAd6heNFKgdQQbsGT6+AqG1tAcejDXle3y9EWyhX1Vxz49MJ0g/QkPEbJp531LqJn
	 8h/3WAPutn56pwbxLPVLApaQYaZGsxt/CFcTODG+rn5FlzF6e7pxFQ33caj7nibbCtRMb
	 wlPQu8ToG4Z8QaELg02YPwvi5u4syLI84ov1fkXnDxP+orhfbNA0S2o2Wg4y+1bCKRfnD
	 gVdeVhVTFQxvI+vJYugFRqXUj2vIG8ra9zRB7qrWdt+K+nKebud/xltzWFpc5M0uJlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789957;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=BOu3pEQUeX+vmqU4R6yIYdlqjqOU3pVZblTxulR4Guw=;
	b=dBj7prB6I6ev+8j080CPfrmzYoGQowANokIgVcaOJRjIp4usvXjvHbVTM4q562ZTy+Ts
	 a5u95QGz69vFRLsAB9BITanORz8oe9B9D/1FfaG7OSTkF3eWE7O68npwVxwGHPcFujGB2
	 KNniVVs6PKwAdMn8EFo1ejzAiNDrcC/d8e4yd4kujqwAYQFj5LL3vPeLd+v5dRLfhS+9k
	 awxYN9vLYYXi59zwoesBpxvUk3/MSQ8QwG/bvdlpAh30Eh2k5I9uN1ChM5DK9v39MJB5t
	 DhjCMrE6Vx5UcAjKgpmC73IbEq005IU1xAiX5T2wFSL/IQ6fute/ORGTD3x/YRtByiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QECOf72g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A15606A32D;
	Wed,  4 Nov 2026 10:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A15606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QECOf72g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKcdPhNhFoTE9wWT2x8t18uuox1LMzFaA5PD9aqIcCZ2NTuM5cLzBmfRZ6q0mljVjISF3gLM95iEgnUeyYTcWEhDkEAQ+NmlRg/4BxQPqgK3PMMxtQx+QOZyLNl4cB+Fst9y3sgvEQMzq5Up/uRrVaF18F9IylvY4Xl/bRSKLBv7+6cY6x7nBYDJZIvHpdD55T3mAx4pq3I9Y3vKe/2ltHZGXcP15K6vu8/H0gQ5aimn+VO0lwHOzfqAecymCHbF6tDKASgIXqsUB7w1+qlcfyg8u1csV9s394gAb+Y8e98MLy54fGMr7IFgkEOfBCmqPhLGPWtEPSwru/2E/RWSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOu3pEQUeX+vmqU4R6yIYdlqjqOU3pVZblTxulR4Guw=;
 b=URzCsLmzyNvAbkf8hD+uZVhsMQw7M6or1GzAu06LSvnQG1u21KcXwdkg1ZhQNNxH9JbrBOVV7SqEdF/H3g1j51XdDj1Xz1DVkLCw+SFrAL9wLNdyLk1mgyTsVZDrxMtFgCeJQbJnb1CFGB1AxcJlQ/sHmvQqvqPjNjarYxrNlEZro406rVGX/4XzRUI8ahthZsOxnMcxpodJJEYBZ7mYQyLM02dqEexQkvbcShwbUSRqA674J/mU0lAzhFuM1w5RpqW9pcgfeWCAMxH5J/0Elwn6wVGL3t4ZTHj7kWzXvSeEUUyeXA/D/2Q55+pTgox8fiwdJwQO36iJtfjqdrvCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOu3pEQUeX+vmqU4R6yIYdlqjqOU3pVZblTxulR4Guw=;
 b=QECOf72gvHtpoXRI4SeXJX4AL7O3EeB+qbsglPE49L+KQOyRkN7GqgPcj1mFw0IfTMWO3I8c99VVUzEk7HeZLUiiusBdNqcEURQQa8d1mFPxwkqLrm2hFMP6SC/NYpLJMcv5uL5+rW4mmpTp2GBBzQVOLE5UIw5Jw7kdz+/jxBk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 10:59:11 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 10:59:11 +0000
Message-ID: <27613b5d-5ca3-4770-9f03-664c7652bb69@amd.com>
Date: Wed, 4 Nov 2026 11:59:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: xilinx: versal-net: Remove CPU idle states
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, git@amd.com,
 ptsm@microsoft.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sven@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
 <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <b9213a36eb1d28f3e7b8610592c085f627f5c7cf.1791374721.git.jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ef5af0-38b6-4b3c-265b-08df3a62a83f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261022075727099003|261022105027099003|261021123027099003|261026140227099003|261026121527099003|261028144727099003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SwoQvsFs4sYT9+O8edKw68qIymItyL3Hg8sH/ecuUWdS4UVb9KwI+PA4rfapKN/SZCWdhTi7JPkYBhgddtah3USZUKJcfzdRXfP6dh9CEW5pDnOeRC4zuj5f2hfpZoXr5bcEJ12Zh6nu0CB9gQjnbBm3/sexw7cdy3njqKgZhLucr9weZO/EoDDZWNGStgKXYQKcFnc0Gj9M2KtCwJG7HnnR86ToN1LEYXAeOJm3ATuTD0knCS3WKJQIBYVFL/Tb9VC5e4cOs8AoEO0VVPTKalMpVHWw1QFr9lNeYqUcYc1OSqC6yZmbj3wk6gGCeJJIRiXmdXXAQBsW6d9Bi9pID9On80VZmN29T8YaM2mT82tBHQoOC7ebv22rCZid9qJXa/YYPvT0U7wjnaU27LwTlxLlsiNzXAUlsGwHnMYaVMSMHeqowPgORs93A3oW2y0W1kpthUH3nZ04mLSjr18USUfhHQRPkj5u5fIMBXuxr+lHeGGP/745O1k8/IyIGskpXktfBcUEmHlUtLUU0r+QtVLpptZYwoBb1vejhuqTZcbvUqsvcv+85udYiDcaHLNdOHj3Y33vN8/WXILe+RCvvkOKqgCJq0GM9b6UppbnmIneo6oOubYWW13w0y1SbJJF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022075727099003)(261022105027099003)(261021123027099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ptWStDOS9HaDZBRzVsZnNHL2lIeUNtZEhkSzJNUDdwS3pwNHQxaVMxVFlh?=
 =?utf-8?B?SmYwS1ZWWHM4RmY2ajVVZk5pdHZmdVFjVm83T1A4aktxY3J3dGtGbW1LYnR6?=
 =?utf-8?B?bHVjYkRmY3VLMWE5YnNzc2kyKzNERlFKc0EzMHkrMGMzWjdlSTFmaFA2ZCtB?=
 =?utf-8?B?bGZVQzhRQVVFang1M3YrSDVTYU83Ly9yTjJ2U25XMDErN2lhZ0hERW9vN0Np?=
 =?utf-8?B?ZjdMMnNpTU5yYWQyejgwVzNtZjRrb25uMGFKZm95NUdKclJXU2RpMGc2aVlN?=
 =?utf-8?B?U3VPazFxWUJ0Q0RRYzljUTQ0TWlZdVRBU1dQZ0lJajhSNzFadEEwa0tvWFZ5?=
 =?utf-8?B?SDhHSHQ0ckpYVXhnZnNSNnhuVm53OGowZGVGNEJBTVVGRUtqM3cyL2pJdkNm?=
 =?utf-8?B?M3ZEc2N0aGViY1ZibFBrMVVjL2Y0MHVEVVIzeGtQZ3Y3aExxNll1ZExWQjJu?=
 =?utf-8?B?SHRZOWx0cE9ldEV5Z1hqcmpnRWRaWVhubFdmNTEyMlNZNTlYM285YmZpNVl4?=
 =?utf-8?B?aXd5bFUveDMrNkhnbVR4NXBSZWxZWnNubHZCcTk5MkhJMXJvbEw2c3AveGpB?=
 =?utf-8?B?UkFlNVNEWWVlOW80V2ZoL0xXbEtJYVZUWjhTT2pqRFVXbzJPUlBEOEtZVXZS?=
 =?utf-8?B?ZEVIZTgzOTZhL0NoM2g2QU9QZENqSkdvaHNpdEZpYWJJVTMvckwxSmdyQlA1?=
 =?utf-8?B?bmtaS1NXU3BjejZFZmtQRlRSRGo5ZXRUeUwzbWxTZDV2UzJTK2c2a1pzWU53?=
 =?utf-8?B?ZnVPM2lmOFU5Q21DSjlsaWh2Z0pVd0ZzVVJoOUVqY2tUSEJxVkNDaDNtZkdp?=
 =?utf-8?B?bWE2R0FUcEtQeGMySnFneFNiWVRVbWNmd1l6OS9iQ0RPWCs4Vk0yVmhnMEdE?=
 =?utf-8?B?d3N4QjFGdlozR1dwaVJucUdoT1I5bmRVbk1ISElZMmV5WjVsNGhlaG1JRjNH?=
 =?utf-8?B?OXFaMjRLZldvT1ZWQXRETklxcWU4dnZnZkx2TWp6T3kwdTZqQWZLeFc4Rk92?=
 =?utf-8?B?clhCdmdSVFdTSlgxYnhia3g3MTZRblNCR2sranVOY0M0K1pWVEo2d0trWnJK?=
 =?utf-8?B?M1g5NmQ1bHZYdDFGQXNiMDdPbWlUTGhxT21sMUFWRmM1anZNYUU3NXB5dlFH?=
 =?utf-8?B?ZkJQNUNSdG9FcFo1cXVYbGFMTy9Ed1dndjdZZld1b0ZpRzJ5c0tCVVdFaXNu?=
 =?utf-8?B?dFZ1U21NSlFod2R5MENSWWl5U29hTFRlbHcyNTBpTHpSWG54YmhWMzJseEVj?=
 =?utf-8?B?c3ZBNkhSNlBCWmxGN3N2TFgzbzYxNkJsdk9wV0d4WkUvZUdCczhUQ3lvcnZq?=
 =?utf-8?B?RXVlajd1enNnU0FZUWs4a3Q3MVZIbVQyVVNJZC8vZmdKTnplWG8wYllUSUFU?=
 =?utf-8?B?SHd4dXR0dUF4WUxGdFFCTXhXK05tOU8wYjV4MkRvK0VFNU9PNkU0aTZXb0dO?=
 =?utf-8?B?dHBDYVd3QmQ4NER2WUhWY00yd3FrUFA4aW43anRaQnV2TElqMWJ2WTJJOXIx?=
 =?utf-8?B?cG04QmxOai9oSTdHN3N6OTh1VmYyMWhRaHdEamN1OWFMaXhLMlFQcHdNVzF0?=
 =?utf-8?B?MUN3MjQ4NjArWnRMQ0kwdlRCWUFrbUhidnl3WmpUMHFkZW4vQ3lDV295Z1I2?=
 =?utf-8?B?Sm9xVzc4VUMwcHNUTkNZSjZkTFVwK0pEQVZhY2xXMkFKWHNLMUpIWmcza2E4?=
 =?utf-8?B?SDR4OFhuZkE2QUVMUWRvZ0RiNVRwcjMxc0hzYjBCc0hiVkFoL2dlKzlJWVVL?=
 =?utf-8?B?czlZTmpXMkIxWkNPV2xsR0ZEa1hpQU9ha042NXJlRzcyQ3c0V245N1RDOTRH?=
 =?utf-8?B?ckNEcDA1Uy9TUE42aVkyazcrMGhlTVZwZWFhTVNJT1ZzbFBjWi9LQ2QxTEJT?=
 =?utf-8?B?VHFCM1F5VHBDTEM4R2Y5SUxka1pUSkdjOWhma2JSL2xRa0dQNnh0MmN6SnZk?=
 =?utf-8?B?TzFzL3hRa0lBT0d0aVdtL2ZscE13T05qNnlMYUVXeXkyN0NHY2VDZTl5WmxC?=
 =?utf-8?B?KzNWOXl0QzNhNkpPZHpsV3J4Qk14Rk13bjU0OUt2a1BwNk9KMWJGeHNMSlF2?=
 =?utf-8?B?UzJwdnRaazZLVWJEVUJYVTJKL0RXeldYdVR3S29ZN1hnSTVxc09neTJwaHMw?=
 =?utf-8?B?RjYzbml4ak1XMXpHOFlxWmZJbzdzWDBML1Yzc1VQMTF1NDZRbTFXVzh3YXRy?=
 =?utf-8?B?Z29PcXVmaFhyaThhMFhSSlNWcUl5Q3FXcW1ORlpZcVA2M2VzOENONjF1T0Jh?=
 =?utf-8?B?OW5BRFdIQmF0QzVKd1hTVm00VEpWR0UrbmwveWZldFRMU0xXdUxJazQ5cW9M?=
 =?utf-8?B?WmJaSHpxQVJiSDY1Ylh3WUoydVkveU9yR2FqL1BxOVZwRWR6NkhTUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ef5af0-38b6-4b3c-265b-08df3a62a83f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:59:11.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzZdZzwpPQIggSweoTyLQFxBVEMU0XAMihid16xKKunv5za0jcaF/B0ZJGMNTBSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749



On 10/7/26 14:19, Jay Buddhabhatti wrote:
> The sleep state powers down the CPU core, and the wake-up time cannot be
> guaranteed because the firmware may be busy handling other tasks at the
> time of the wake-up request. This leads to unpredictable and potentially
> high wake-up latency during CPU idle.
> 
> Remove the sleep state to avoid this dependency on firmware. The default
> backend CPU idle state simply puts core in WFI and retains its context
> without being powered off. Since wake-up from WFI is handled entirely in
> hardware, it is effectively immediate (a few cycles) and does not depend
> on firmware availability.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
> Changes in v2:
> - Remove the idle state instead of replacing it with a retention state.
> - Update the subject and commit description.
> 
> Link to v1: https://lore.kernel.org/all/20260727121842.3410495-1-jay.buddhabhatti@amd.com/
> ---
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi | 29 ----------------------
>   1 file changed, 29 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 21bb917bcba1..9b74e59fd64a 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -103,7 +103,6 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			reg = <0>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -133,7 +132,6 @@ cpu100: cpu@100 {
>   			enable-method = "psci";
>   			reg = <0x100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -163,7 +161,6 @@ cpu200: cpu@200 {
>   			enable-method = "psci";
>   			reg = <0x200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -193,7 +190,6 @@ cpu300: cpu@300 {
>   			enable-method = "psci";
>   			reg = <0x300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -223,7 +219,6 @@ cpu10000: cpu@10000 {
>   			enable-method = "psci";
>   			reg = <0x10000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -253,7 +248,6 @@ cpu10100: cpu@10100 {
>   			enable-method = "psci";
>   			reg = <0x10100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -283,7 +277,6 @@ cpu10200: cpu@10200 {
>   			enable-method = "psci";
>   			reg = <0x10200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -313,7 +306,6 @@ cpu10300: cpu@10300 {
>   			enable-method = "psci";
>   			reg = <0x10300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -343,7 +335,6 @@ cpu20000: cpu@20000 {
>   			enable-method = "psci";
>   			reg = <0x20000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -373,7 +364,6 @@ cpu20100: cpu@20100 {
>   			enable-method = "psci";
>   			reg = <0x20100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -403,7 +393,6 @@ cpu20200: cpu@20200 {
>   			enable-method = "psci";
>   			reg = <0x20200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -433,7 +422,6 @@ cpu20300: cpu@20300 {
>   			enable-method = "psci";
>   			reg = <0x20300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -463,7 +451,6 @@ cpu30000: cpu@30000 {
>   			enable-method = "psci";
>   			reg = <0x30000>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -493,7 +480,6 @@ cpu30100: cpu@30100 {
>   			enable-method = "psci";
>   			reg = <0x30100>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -523,7 +509,6 @@ cpu30200: cpu@30200 {
>   			enable-method = "psci";
>   			reg = <0x30200>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -553,7 +538,6 @@ cpu30300: cpu@30300 {
>   			enable-method = "psci";
>   			reg = <0x30300>;
>   			operating-points-v2 = <&cpu_opp_table>;
> -			cpu-idle-states = <&CPU_SLEEP_0>;
>   			d-cache-size = <0x10000>; /* 64kB */
>   			d-cache-line-size = <64>;
>   			/* 4 ways set associativity */
> @@ -632,19 +616,6 @@ llc: l4-cache { /* LLC inside CMN */
>   			cache-size = <0x1000000>; /* 16MB */
>   			cache-unified;
>   		};
> -
> -		idle-states {
> -			entry-method = "psci";
> -
> -			CPU_SLEEP_0: cpu-sleep-0 {
> -				compatible = "arm,idle-state";
> -				arm,psci-suspend-param = <0x40000000>;
> -				local-timer-stop;
> -				entry-latency-us = <300>;
> -				exit-latency-us = <600>;
> -				min-residency-us = <10000>;
> -			};
> -		};
>   	};
>   
>   	cpu_opp_table: opp-table {

Applied.
M
