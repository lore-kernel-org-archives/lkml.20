Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705126;
	b=4ANXznoUEup2cKky92y4gQ8RNKNH27UnmCdzEiYI/pWHSdMkeVKfPbLd/iiRqNVFtZ2o
	 t40Xl2zdGH6NnfqXvsJPmkFkVrK1/rWP+0QmtsIQhfs8wGAWYcxn2fsXNXCeOoQWF8Par
	 Xija3644jBZJ+j0OtXrTdvcN0h79Dl8Ynmiq3jWueEd1hNZA0Q+A5u8/qIlhFrNMlEGRU
	 6dIAHa3892gaiQDu0EIrQdThohL/+/rgC80ceqNUe6xE0GSgHa2Kpw+BMEiLtJYX2FvDv
	 rkOFbUBIkY86u8Eb8rgkN1tw3NxDicy89X+6UpW+zH1kkdhlXrSdSuk9lFNMVx+18kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705126;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Cc:Subject:To:References:Content-Language:From:Autocrypt:
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
	bh=jsYO6RrKzGS5IPl6nQZOxJP6TmjxfSrlZqsOpzCUYSs=;
	b=GmRYzGF1IODhwVW0hWrAfMxVI01324ARfxwNQiU2g7kz0DcmFxvaSo0PRmj/Rk0azf6c
	 EFADv3Egy7cbl8oWvh2JLD24RUwGIlmN24UHDCAdGGudi1ODP9gtanUfD1OGW41mAc1uU
	 km7Qu91agnttNdRpdTxvWuFm/bPirkSBl6eB9IDec3KewcVE9MwuaSh8gsww1D1lAciXq
	 Kiy9nzDLwulDpBmzmYTB9+63mLylmaVmeh24XyJlE2Qa0CRls/Jq3W+BVmwOsa8fVzqO3
	 019vr8ZdCCGkeMZ9iN67PC0FTAilw2kkaoIiWbYA/N1D1YUe+sskgSALDWuIHueL3cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=BsQCjRXo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.61
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B785C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B785C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=BsQCjRXo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Amd8sBWhFu17bRHG+A/uc5zaaorTGRmSxcDXvEBsHi6CuYL5NRVxz2ephZ+BgGBCICm3A4k8MeScMRQ7b2+froL6Rgde6OIcCbtGt8BWGkdwwW+qb5cRP6tx3T6lJvDnDFzJsdoUcJcpShbCHx+H/Z9ufU1mg8rhvYzzsnUedq+o16ugd/DxOCfnjSKPBv/RQl+ZGy5bgidtHxD6Ud85I5bMAwq08xgvysCy//aLJv8E9kXVThfI1mfqfK0cdSEQp7wfcUZqEj1DjM/DW1uk/4v6/FuiwGUUeK+bTSEL3OYuE5Tl0timFPtLOjKvHbdTJgnuBSjrcss83Yto0H6tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsYO6RrKzGS5IPl6nQZOxJP6TmjxfSrlZqsOpzCUYSs=;
 b=oxSuhb9Xq3Wbj/CE85q81A9ldqxRBPLUTytRb+UWU1c96q+P+L24BTfUIyQYgpq3JfB4GqQHrdgfPHCM9XEJjBtZzsPcVv7cXlSOgdIbjG5/sUlWYPkZRfK585SK5wNtZ5NaO8m/6aZ4qxtvdk9GVjjujgo9+lPkI4HR96ApsDdOdE7mVqr5QJHeQwmmBW+hQozsslJI3dHWtdp776r4cmzaicyf7gO90xqVi7AOlfDCt+IirYx4jCZTQ1jyIyTQABV9K5wB6vJ+hTT3VfXQB5c5X2Uk1eTGWzWGWzt30Ek4WdpoydOHOocDi2b75a5iUQHxCvwJIuxV6zw+iOTV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsYO6RrKzGS5IPl6nQZOxJP6TmjxfSrlZqsOpzCUYSs=;
 b=BsQCjRXoYspZjxzUBApmbZUqRnT6jpMsySSvIp0D+g8Sd9z3eInG2kUu/kpGRrVGSz3ziqtmcpPh9JqBIQPDMogS95vF0SLXArovoK/Hyss5mrECHzdcU/OqsfTjc6f3+wSHXnRNgoFhzpS6cFxt4f6mwIwVeitaXIqVfVnxfZw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6600.namprd03.prod.outlook.com (2603:10b6:a03:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 21:38:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 21:38:36 +0000
Message-ID: <569b6f91-a58c-4516-83d2-2867e73e9076@citrix.com>
Date: Thu, 22 Oct 2026 22:38:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rick P <rick.p.edgecombe@intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 24/24] [DO NOT MERGE] x86/shstk: Depend out
 everything incompatible with kernel shadow stacks
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
 <20261021195153.06D8D679@davehans-spike.ostc.intel.com>
 <72a56b3d-5747-4a9e-8408-624ca4f707d5@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <72a56b3d-5747-4a9e-8408-624ca4f707d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bd4048-b2ea-4ecd-14ae-08df3084d455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ncivQRA4yQ9jz6uISlYTJBiRIixXECjgxGOO/J+ARjdlbOsfcU1IL6yLYtppDlF8RaH0Twl4se4WzXTtkXj+7OntD+/+TWiFYQPDUzXCTI1MWtTYKMjKfZOA/HzlGLmRNfj20fkjyvbPNSjHmQdM+Su3fydsNJzqP/z+/+nmH/Jm10/HawV2JLGKD5WefgSnhQxcodlsFIPoFAPiRtZlif7ouqA38hPnM391tiYvVCI+jQzfKLq1pyZthKO7BcMoNHANX5VoLsyAQ7/l6jc/D0X9mReQmPZzwAElTZRU6TwfpK1MvXXmhdoLcs0j9zVv2bWXGOVMq4FJDnB/ZLX/vaxnjhcot4ye7JfXhh6q7sI3qlylppFoqYDQQktwImAWyF6sCTEiPWPrsqMfEYyPS7cVpIDzP0mx0vZqxEGE57UIo/Y/x1jMQpvc/QWZGqnSOlJUNp11ABFrrGyPRKM6wU2uIBP5PL1pfOWTw1XJ2rEmOJdXsxRgCz4+rpn1cp10doGNeI1HKZwR/ZzyuwpZwvd431pOB4+LT2ad3IPXXAdhMy2ezkMhYEcuKCJEQD+3dxxHPZcAy3tcIek22DEGgUnei8hVne9jzI+dCY9bBcYrpc28a5cmtQFgIl0c1s5HHLYBb6/xiwi9l04Vu/GWSOemvwYSPBuVzLkF3XJjpWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGIyUkNCYThwTXIyYWxVdlBqaU5OZjJsVTdSNWJ3clN5bzVPbUp2TWtPTlZU?=
 =?utf-8?B?dXdacDVvUGVXL1VwWDZTeFlFaTMvQ2Z3T3kwaGhhNjZRckFLUlpET3h3V1Vy?=
 =?utf-8?B?UXNuaWxKSlRBR2UxaGNaZ0tkWjBYWHViN0ptRkRGdUovUlo2ZkNpM250elVI?=
 =?utf-8?B?L3VWSnZqSFRnd0ZuaHVlWmxGOXQzYVdXdDV3ZkRPdFkvSHdacEd6SHkyNHhi?=
 =?utf-8?B?Q0E5Lyt5aG9MZGNESW1jaWd5YXhPaVNENHRNS0JGUGN5RUJEaWV3L1ZRMXpx?=
 =?utf-8?B?RXdMbUF3aUZYdHVpS1hHVXN0a21GZ3M2a3BZOHIrTzgrWkdNbmsyZ00zWVgv?=
 =?utf-8?B?K3NVZTdieVIwTXlySDkvdmQxRGxtTytjdXA2N055ajlZamozamZCT3g3SVRm?=
 =?utf-8?B?cTc3NTcvRG8yVzBhbzg4SDhBcVNSNVRxN1UwWWFCTTFLK3hFN3F4SmZLTFJn?=
 =?utf-8?B?SFhVMUJvR0pPU1UwNExwdm13dklNVXFPVzdFcURnUGlhYnZrREZlTXVrYzQ5?=
 =?utf-8?B?UTR0VVd2cTdub1pOby9aU1g4WW1oNjdHRE5VcGRUTTd0RElhMHlPYk9FM01O?=
 =?utf-8?B?azFKVG1RY20yU0dNV2ZCZC9Qc25hVjRlaU05NDF0UzA0N0l5bUJkSWdLWVI5?=
 =?utf-8?B?ZXdvZ0RXT1NVVHlQSnJLRW5MWlpnZm1wL29UZC9uNG9wb2tZSm9zUVl5UDNs?=
 =?utf-8?B?SVdua3hPS0crelBqTm9la25sd3dkZ3NSVG9BQ2NGOHFNajduQnZ1b2xSL3JF?=
 =?utf-8?B?SlQ4YUEyZzVUaHc5R0xITFYvRmZVR00zNjVLdFFKRGlkMkpocnBBU0ZFL1lV?=
 =?utf-8?B?MFlBREpUeGwxaVJJdm1pMlB6SEV2cWdkbXpJOTB3aVZaS2ZYV3dFRStDaXUw?=
 =?utf-8?B?OExMSW1rZU9LRmhUdmh3MW4xSVNaRkZnU0RBVUVoYWtLK2hQSXNPLzFuMWdX?=
 =?utf-8?B?c3JsdjNOY2w0TnZ2Rm9xb29HUzh6b0hYSFRsZGdjMzN2VFRMK0N1a3Rqdkc1?=
 =?utf-8?B?M0RSWlZJdXpDMVlPdmYvUCtLRjZzNVg2N0FUMzRvZUVWcGxIUmMzalV4U09r?=
 =?utf-8?B?eHI1YUZZS29NcFppRDdWTndBOThMY0lTQXZMNFd2R2NNNVRHQUNibFpoQTZj?=
 =?utf-8?B?VEdjdVhranNMWlNWaGN2V1FKZWNvSUVheGZCUVl5Y2FjcVFoOTFiYmJWNEgx?=
 =?utf-8?B?RmkrQVZEeXUvc2tNQzhaQjV5aXJueHlqQmVWWGE4ZVF6T2EzdDRhMmVpYTlU?=
 =?utf-8?B?WTdoRFdxbllYQkV3MEVJTzNOY2FpOFNyc2FsVmpUZGZnenJVTDkvRW1valNp?=
 =?utf-8?B?RjVjaEN2b21xaHhuQ3NvM2g4NitYSmYrWkZFbDJwM3VQY25hL0I2UVVoQ1ZS?=
 =?utf-8?B?Wi9HYjI5OWs0dXZwVGUySTl4NElMUG4yMEVvVC9WN0YrSCtqbkRFbmRoL1RY?=
 =?utf-8?B?ejJEVTR0Q0FrVDYrMzAyS3gxV0R5dk8rRkFwajY2ZnIrME5MWUZTWE8rbVJi?=
 =?utf-8?B?RDMzOStDc280aU92bVJiNVJKRVBpeUpNTkUyQkw4QzFiYUc1Tks4YlduQjZs?=
 =?utf-8?B?K3hlcnRJS3RpRjRCcnZzVjg3Q1pYMXExbWZ6ZkkvdDY1MXpoQWhjUG9BYzZw?=
 =?utf-8?B?QnhBNDk2cmloK2l4SDhhekVycERlclR0d2lYdzJLTFM2WGVWUC9SSXBOcElY?=
 =?utf-8?B?azBoSjQzWlZuc1JXRmZmdVlVbGVTdU5zbmdGSFUwUEhNUG4zNkt1aW1Qb3Zh?=
 =?utf-8?B?Ti9TdDBWWi9sN3o3OUZsaXpzampDeGpVOGs1V3MrMnhYalczb0REcWdvL0Jm?=
 =?utf-8?B?SGNUWDZqVCtVaCtBaENZVEdEK1RVbFA5bkZxK0tCYkJ5RDYzblJaUXg2NDlt?=
 =?utf-8?B?ODIrZFJjbmY5Y0Rjdk05V29mNC9YRHdxQ1l0Q1podkNqbno5MHk5V3Zwam1W?=
 =?utf-8?B?RThDcHhqTFozOG9QZEVzL3YyTERiNDVITndIS0pDTHYrdEdSSmtoeU5kTC9n?=
 =?utf-8?B?SWFOVW9Bb004d255L01PcGFsNzQ1MDJFekpMb2FBUUFSTWNXck9NV0h6SGlv?=
 =?utf-8?B?NzVxUGxQcWRrdlBuT3phUkFtS0NKQnFYTEVMU0syZXQ0U2xFR1JveDdhOFJS?=
 =?utf-8?B?NDNtTGx6aUsrQmJ6SWRib2NTcGdSUEVCMk5iVWFwaTQzNldTVjFqZXlydFZa?=
 =?utf-8?B?ZVIzMDJVK1UrNkpFTzRFeDNreFcvQ2V2ZWQ2TjVFbzB1L1lmSjBmQ2c4UGU4?=
 =?utf-8?B?NndReFZmcXVydytUSWVEOVNQTG9EdC8xZllHOG5HZU9BKzZVemZVMXdGNjU2?=
 =?utf-8?B?dzRhYTBFcjFmZWN1eHdLSUppMllFUUhIM1duQXdWS0xpSXc3bGVMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bd4048-b2ea-4ecd-14ae-08df3084d455
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:38:36.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/EQtMv998OB36PQ980EJgku1I0xN6iy/sRsIMCeC3Wsv5ANacuVZt+LbsrQdzMySgjNsJjYmgvAr97U5uwKT9CaR7gZqQL08SVcMxHAH+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6600

On 22/10/2026 10:35 pm, Andrew Cooper wrote:
> On 21/10/2026 8:51 pm, Dave Hansen wrote:
>> diff -puN arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible arch/x86/Kconfig
>> --- a/arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible	2026-10-21 12:36:44.598893837 -0700
>> +++ b/arch/x86/Kconfig	2026-10-21 12:36:44.601893842 -0700
>> @@ -1873,6 +1907,79 @@ config X86_KERN_SHADOW_STACK
>>  	depends on VMAP_STACK
>>  	depends on AS_WRUSS
>>  	select X86_CET
>> <snip>
>> +	# PV guests run the kernel in ring 3 without FRED. Kernel shadow
>> +	# stacks are FRED-only.
>> +	depends on !XEN_PV
> Xen PV guests will not see FRET or CET_SS/CET_IBT in CPUID, because the
> features as a whole are incompatible with a kernel running in Ring3.
>
> This is not a restriction/dependency that Linux should be putting in place.
>
> ~Andrew

P.S.  They won't see FRED either...
