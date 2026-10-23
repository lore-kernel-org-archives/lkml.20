Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792722104;
	b=npOZC0SAqEUAk71V2G4kQzbXYGlPOX7c1vPSQVw0lACnbZOe0amerfNHZgIa1fvDl5XT
	 C1yJz9+P6Lh+1Qh8VRTirFx4arjXdfiPVCdGPuCGiTqPhWKTQGoWyZIJtz5Wv2TETrpd/
	 D6dS/KLBQZMC89FzLB5tx3Vkz1xDkRhVSe6Fou3ZOD2g+M5dyNZAErS8uO46ddJOwf8Fe
	 9lSHxFNRCRX+ZCEPOIYvC3ZQHle+dqrv8zNEmTlDEyDOH+gaF1JMgZL2kNO9VcblYLmpI
	 ln7CtL/4MUkoBp4CG7SsajRF4kwotbY5lgbDAkA6gFTRPz9Qs8fM4A4vkvvFLgE0NwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722104;
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
	bh=oT/N9c8KW2ItVkDrK1iePdkvpIg1JtGd/pT3ap4h7nM=;
	b=FCm698+8JHZGm7sQ83W9enRxaEsmu87dwsPAb2M2qSzeuQIyUMJh2bc8viT6N8b7GkT7
	 X6VO1t8PwlIFOc+ZN9o/1H2662u1djIagfzC1QjInBDZYNw4Ejd8iIjG0tq0DhDF1RYAq
	 o/3zZIWeyox7XcfEqPIxcFgb7Unq1YUA42jQYvlNxw9VGVHHI2a3WBxxuR2wpqmEYPXZL
	 DhBN6RC9hx28vCEnITKd5MICZ1FOXruxOjAWPYFM9QyLsRi0AYZx4gErd/bB66mLls7eG
	 dEX4E8u3BWM05aEqOfwRxkQCiofOKHfh9xFqQDvKVoe+F1pLmThJtZ4iNGSHd2p+G+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b="e4d1/cjg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.58
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF876606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF876606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=e4d1/cjg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObB7nnE0A10EybiGF2GE4JCX7hMYXUeKSt5ocBxnI0t190hkJqVhLtWRYoUWWncv4ToVJ5etrTTOjyadneaV7jr6WECKw3PoQD8r3fWybUmEpJVN5PVERvh6KLilTgIByrEuALLb/YBM/M3hVEo0pKYlv5nRGmFuDIYE//KewKoK2gEpFzAo0r6EulfsyVg+P5Kt+uWkJT9lBPCuL4DEbf+BqOEgrp6IncEX5OO9Rt7sgFGeP/QtHNVpWISZeGVGRluSwtGpmlpmxHCfrVwt9yG3+P0UliUHnqdMpFO022h6faiowRJ43EzGL8meIkK9TVPGDAr0zQYpNyENVrVNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT/N9c8KW2ItVkDrK1iePdkvpIg1JtGd/pT3ap4h7nM=;
 b=r/BsX2EpuKDVOqTaQX3VNSa3d5mS77CmoiuIg+L8ykKNjIOB8z5jiO6nyd/qcjeJ3F0ob4flZJesyx90X4TB7LdqWDpgb5T8YpU99mqSAAPsYuzb0S+mZJe9p1OZW5uNPOEmXFxhJOO0wAL7bJ5j0Muwo2oUQwn7IM2qULFf0JqUWLVqVrBMSkMkuVpO5HSsf/WxsskmtiNpsdtLZuIW1DLuheSpIiRoxk1bhu5D5B4i1F8GRwhg8XZQmzSkHevwdx4Soc7yY4a1UE7Ol+ngM9+iM6QjIW7vd1RYzggONZG0YLMhZy+jU4CjJhGlYjZ9qVg1udog6b3jQzewRI5rng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT/N9c8KW2ItVkDrK1iePdkvpIg1JtGd/pT3ap4h7nM=;
 b=e4d1/cjgSB6IOO7rLCYyhLOtdm0r+oN01lxxi0YL1U5eADykZ0D61LKDK9JEknlreIZyhXGLi+OVcjmObFr+raK+N7bW9PUNE+axSR9Am3MqigaypW4AvXPjf4XeUiJpqcHwjvWDWI2UiEOW8hbP7xDCTw+J2CseAc5tFaAW/fs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7237.namprd03.prod.outlook.com (2603:10b6:a03:523::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 02:21:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 02:21:33 +0000
Message-ID: <c8accd0f-118e-49ae-839d-7474250b14e4@citrix.com>
Date: Fri, 23 Oct 2026 03:21:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rick P <rick.p.edgecombe@intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To CH8PR03MB8275.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: fde65dcb-5711-4459-9a4e-08df30ac5b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|261022075727099003|261022115727099003|261021123027099003|261021121427099003|261021135927099003|261022113327099003|261022105027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vVHhM4b9vHCb0dy7vemy+8F80cvIEBWqa9Nhse1LcVnZyzJ8CaFtOZJFU4GDwNq0Mxdrs7Hgc7X4vGietiFLZtSJUz3HDezzgGdmonK+bwdWXwleg2gJmSiwcp1/4ax8ISCpXN1T0NwHFb3O3rDxKzdFvxVZtgtWq5WrxvtprPN3J+zN8FY3C6uG9/AIESU7s+wSkTZS7DqDDU1YKn4qtpVExKsyBCLEa0b4BjepfF3KO+atBwTfFjEeldJO8wRBpMVb3NFOl2J+69haLG2tifISEyCjfy1KeXpV7LewkI6jbLJzDjTLlJYpFRxV+153wOYioI0rrouMhvfiPZQSoeDmsq3G47DZnhjDslQz14oEY6QcKZaJZX1c0WRemN6xNasTFybFbWnDEYOkGCxONwrPCPSM2JvrRf0EK5LcTvooHP0ndp9qTxxQX2VeaRRGZIEJIyipIb6Q5ciSwMM6XSc4HgvSMQK1zAFW1J2PM03mQWXNBtDdUNOdpwSf6s9YbzbT5oSzoYcgYQy6uJEntXmBD+QTa+4nNf1QndtUUyC63HO70zf42BJQCMCrVu2roImMcvw7OWlgZ8FR+5BHpNh3hb6m+HgV7N00XP4ADxkXGuNQh/rOMomSoyO3JNDPc9/0x4elPjx06SanJG+idOfvwpIZcyXY8kBCLAVViao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(261022075727099003)(261022115727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022113327099003)(261022105027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldMdzhIYldXdkxWN00rVFBaNjczdTNVSDMrN2ZyRjA4NnlBRmpNYjBDYUZG?=
 =?utf-8?B?YjhjVkI2NXMvNng3RzZQMlZ0REZRcnl5MkVXZkF6VUlkZVNhcVFzSDlZQ1Uz?=
 =?utf-8?B?SnkrbkhIcS92ZTJKZnhPUFR3cVkxakR0dWdnZEtQL2FvQ2lnbzZJMmdqTjBU?=
 =?utf-8?B?TzkwQTlueHlJeExUOGx0T2czU0JiYnFIeUhZaTZ5TC8xVnhXS2Z3U0ozMGxG?=
 =?utf-8?B?LzdySzRKR2M4QTM0M0pVYUpuWlZQcDJsR3h5aXViOVZsTWlRb0dRbGdKTTBk?=
 =?utf-8?B?SkxZOUhKc0xMcGpZSU1ldEpuTWx3eWxwZjIyWFpoRzh4MlFXMzd1M0lVSHYy?=
 =?utf-8?B?Z1BLUjRTVUU3U09wZkl2VWEvaXFLZERvdkJuV3RGUVEvTmdUQjZjVHR3QXhH?=
 =?utf-8?B?U2tPTExoamE0M1YwNkt6aW83UmJhVHRuRlE4S1F0ckl6czhoMkppVy9aWGt1?=
 =?utf-8?B?MnZKZHpMRTMweXluQkoveTUzSFRmd09OZTE0THdLMndnaWQzaUxsTnlDZTAw?=
 =?utf-8?B?SjBmMStGV3ZOZWF5YmtPWXhJZmRjcnA2NDNxaXlzTHlRQU9rZXAxUlZwRm9m?=
 =?utf-8?B?MVFxajVsNWxUZnRSaldCMEljTTFiL1Q5TWgrTGNveXJGS01ZdFA2ZDdrUHBC?=
 =?utf-8?B?RDBERGVCU083WjNSTERscHhPNmJ3TmxOM3lxTXBuOFFuSVd1YzRRRFdYMys0?=
 =?utf-8?B?VzJDMlJJYlNETUQzNEdlZFRybGM5WUlpdHhMV09Udk54UUpqOUtUZUxjTXpa?=
 =?utf-8?B?Uk5IZ1pUNno1dzcvYXRDL3UyY1p1eWpZYThGc0hQSjJxaDh4U1NQOENPTEJ5?=
 =?utf-8?B?Zk00RzJLcVhCay9DMEpFbVdTRHlYTFR4YzQ5OHJvVE10bVI2cXp1WlVWeUlj?=
 =?utf-8?B?WEtTTmo5M1JES25yanprZVZza2RTWTFONjlqaklzYmZxNzdzV1o5d2E5dVhi?=
 =?utf-8?B?Rk1KTDZQdDhLVVJCZGhiWThTUE9LTXFNWjhhazdndS9Rd0YzR1VVL3lKN1lS?=
 =?utf-8?B?dTUzek9EOHZOLytFTXNRT1BQS2JQakpqb3IxVE5NdlMrTzNvcGRpd2xmMEdC?=
 =?utf-8?B?U1JoVERmVlhOUUJwRkdLYXh0T3NQaFRVRmQrUlhLYUkyT2pzQVhvQzJsVlRW?=
 =?utf-8?B?eW5UdEh3TTBjMWQxVStxODJvd0hOSTdtT256b2t3cU15YmNtZ0NSL21qQjJ4?=
 =?utf-8?B?UnFCQ2JCU0Zoa05kYUFRbnN1blM0TjB3amIvQ2JhdGpEbzhJVFBQaklTYlVC?=
 =?utf-8?B?b2VGSzBZOThOSXhSaDNRMW9mOFBjSXVJL1dJYnpVZVY1bUF3eFp4Q1IxVDAw?=
 =?utf-8?B?dXVCMC9JUXVSemRDcUM3ejREK1ExemdqUmxHQWpDWERkRXArZ2tEcmo4ZjJQ?=
 =?utf-8?B?WUM5ODh1S0FCRW4xOUY5ZUgyRzZGdnpxeUF1bVpJd0l0MDVuZ2xmRURvZEkx?=
 =?utf-8?B?WW5jTjk5SURkT2hxaHgycTRHOHd0UlVUQ0RHRis2SklHOW9ScDNJMEx3VFRz?=
 =?utf-8?B?R1hGNGFWRnBnblpGRkwvb1REY3ZXT2o3SnZrMGNQelBUR0Y4cXBlbTZHOFZ4?=
 =?utf-8?B?SFNnMVMweTNMb2NtaytuVllIdmVEWWR0cGdqWkc5VThMNGl2R2hOTjd5bmRu?=
 =?utf-8?B?dis5c3UwNDNOWmFHZGVVZjVkNzFhdEg4TDZpcy9IdkhmUTdhZlNlYkJ6L2V0?=
 =?utf-8?B?ZmtRbTBaZXZvd0liOFNGQ3NXZk5WOXAyNWlpZVByOFArN0ExK0liakozamVM?=
 =?utf-8?B?V3JtaU0vT1pOV2RoY3RJVFZUWkE3RnczSlVvVm90V2pPYnJ4OUJZa014NHBl?=
 =?utf-8?B?eFpIRDl0ZTBlQVRKMFgxb1dpMXVqRnZycFhacGZZRWJCbjdXOTNZM1pIY0Fs?=
 =?utf-8?B?N2p0WGhCSXFaQjFyRGpJNVNUZWg2NXlsYnFSUzhoOUhYd2JJeEQ5YytJZGNi?=
 =?utf-8?B?V1NadHhILy9pR3ZDVHpGWWJpeDNLU0Zxc3ZrdndVQUhzODkrTnNSRllnbnZR?=
 =?utf-8?B?VTVENDQxTWtZSzdVbWxMYUxBOUE5RGVRbUNCVndRNlpWSmNMUTQzditpUnZ4?=
 =?utf-8?B?bks2eGRtZTRNOStaayt6L0VxYW9XQmhodnN1RVE5N3pvS1pUbU5PSW0xazJn?=
 =?utf-8?B?V2RPb0g0b1dvdHRFUytta1pGVktCb0UwajN1cjNhb0JkZUUva2xWa21IMzhL?=
 =?utf-8?B?b3R0NWl4TXZmOTBlVUkwd24rdkdHUkR4VGRZdWNzeUhwV1QxdE53TEtiVzJ3?=
 =?utf-8?B?TzhMQ25YNUV0OVNUSGJNYVpBK2ZRL3lLZUlPaU1rS0dnR1hrTGpTckUxaERL?=
 =?utf-8?B?Qm9BOEpac0ZLS1RDaURYeUppYWtJY0ZFbFNnNFo1eW44aUJyQTg5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde65dcb-5711-4459-9a4e-08df30ac5b3f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:21:33.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZtBU25H78BZdA6NE4oWFcryT3gEfM6hAmnxclwE2FN9dSn48KS5s4Vq138RMY2z2wFRUyOow8085zRNnwmTo3FLCKcxB65i1ObsP6NnrnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7237

On 21/10/2026 8:51 pm, Dave Hansen wrote:
> == Warts ==
>
> In order of things I want folks looking at.
>
>  * The shadow stack is not used for the init_task. The most ideal
>    thing would be to find a convenient, simple time where the regular
>    stack is shallow and it is simple to create a corresponding shadow
>    stack. This is not currently done.
>  * The context switching assembly is overly complicated and also
>    subverts the safety in the architecture-intended
>    RSTORSSP/SAVEPREVSSP sequence. This is more nicely fixed once all
>    tasks have a shadow stack, including the init task.
>  * Locating the FRED shadow stack event frame is ugly ("Stash kernel
>    SSP on FRED entry"). It is currently implemented by reading the
>    shadow stack pointer during event entry and stashing it on the
>    normal stack. Xen seems to accomplish the goal by unwinding the
>    stack instead, which has more complicated code, but has adds no
>    complexity or overhead to event entry or the entry data structures.

Xen is already in the process of moving to stashing on entry.

Unwinding the shadow stack was necessary at first, and it has taken a
while to sort out some prerequisites, but I don't recommend it as an
approach.


>  * The direct map alias of the shadow stack is left in place. This
>    means that an attacker can write to the shadow stack without needing
>    to leverage one of the very limited WRSS kernel sites. This is a
>    big weakness in the security model. But, kernel shadow stacks with
>    this weakness are still way better than no kernel shadow stacks.
>
> == Future Work / TODO ==
>
>  * The main thing left is to chew through the list of things in the
>    last patch that are incompatible with kernel shadow stacks. There
>    are some quite essential things in there.
>  * Add a "warn on #CP and continue". Good for debugging. But, bad
>    for security. Ideally, a secure kernel would have no easy to
>    reach gadgets to disable shadow stacks.

This looks attractive at first glance, but it's really not.  There is no
safe way to turn CET-SS off.

WRSS, RSTORSSP and INCSSP will #UD when you turn CET-SS off, and even
logic such as

    if (!ssef)
        return;
    wrss(ip, &ssef->ssef_lip);

in regs_set_return_ip() will die with a #UD as you're attempting to not
die from a #CP.

I suggest just leave CET-SS on and power through the reports.  It will
probably be faster overall, and it will definitely be a better end result.


>  * Zap the direct map shadow stack alias. Might also require some
>    performance optimization work to try and constrain the shadow
>    stack allocations to a more modest set of the physical address
>    space so the direct map damage is lessened.
>  * Work with non-vmap stacks
>  * Work with IDT-based systems (without FRED)

🤣  A courageous plan.

~Andrew
