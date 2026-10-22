Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704920;
	b=Js8fXc/FbbLubhFJXd3KSLkK0SKlp+/1KX1uO3Rd4iOFGevFN5CaSYsgqYAckKhdG+9m
	 FLV2bMrwQARRyI60gAbVqKrc/TNzpfE0fhWEh6LYlTPvL1AAec0yj21JIKX7HxNIxpyec
	 svxwC90LEVMiIF1aOGxujc2d/r7qXDdtqgcFiDuSrOy9pRWQVm9NR9ulAGBTRFlcin2Wm
	 Hwu8KnxoeZUVKATZOyBiOboZWBH0JaAw5tUEEtyC9JZ5yxwMeMmsD4ppb1x12O1hteYPl
	 x7QE+ZR8DdG2EttPEcIGDUWa+IZbgJt6W+SqpVu9XBwFSHBUhld6i/Hi5TZ3S9zCbYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704920;
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
	bh=WmmXYTG4zBSkPc3j/L9u43JPBRCtNp7kQ5YASif/ae4=;
	b=TZbJnJQTrCLxYM9cSdRmGXptqT1ZH+0GkddStR6dQ8MYYxtZI1F3aoVqG/0QS8N0grAW
	 PiB1KcpwhFn6Vo5w24fKPePnK8L1ErinyZoUoMJXIvOa40P/6RFcO6bYS/l4WdCkBOz6c
	 dX+gq5fL1L+7MTdyEZKgrnfsLw/BnRLA6HsxsLBmL49ahNmGMxjPe/+YBQ0q81uK+imyp
	 MhK4o5fMRYm2IpdZeO30G9cqxPTsDwm59xt2uUwrHh53yNbE3ibO3Ip8gIBA6Hm6ZjDMs
	 9DoYwMmX5BOv56W6Yb42p+j6qcsBsnwmKxQdGv/+RU1rn9rYyYDLtY7AjAiQm+Gco4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Gq407H5g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.38
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D78606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Gq407H5g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc8AXmlukySJoup2z8eeGLOTs59G5zxSqenya+j4DQirYbbS7/4a6Hp10+BBk7azR4FmqIxlknGBe4UGyIb11whKWjeLxPawUOCaFyqq5Ipm0wOZBSKUot/exI0szP47MUVoQhhXKQRhYQIhmSlDla/aLcXi0LvPSIswcDqZqcFu0lKqPEaJ06MxbZ9onvGsGnGEtAt2bWLfvzlq71OY4njxi5RUcotbpCvthWoKJknEupYbCNF+1uOhm0unsbLjRymII6C3L5cL6fI9Piuar0iLtrsFoc/rtAdOT2EOLmL2dGSfUi9LeR9UujN3zqlDmhsXHmitJhurcKp6ckapuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmmXYTG4zBSkPc3j/L9u43JPBRCtNp7kQ5YASif/ae4=;
 b=neTSWSAPBDhyFABL011nScjMA1RQ+VsD14enV1QElZYIoe5ltI6zNxNsZ9bKjD8XGF7X3x1c4ctXdWk2Fq6hh4x7xORFDFRb2sdVW5J4z+jgFgNhzOY6ZpKUgZh5wiCZymxlqBA1WP0ffyI3RigxouhJPDETWF1z2/z4JPhdeqdz/sN+o/jkWn4pIHXHCf42OnCOaO1WHS/B6gWr+7BW8uq85IwFYMQicrRqm6Y5mWnjANYxDpTKOP0/n12vxCt83MQrurASKg/887fCIqehLVjLJ+4GxT2qoXZyUPjoWYur3TAV1wc+3QywInGzNyM6SZWRJh2ypteGIHIYLGGVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmmXYTG4zBSkPc3j/L9u43JPBRCtNp7kQ5YASif/ae4=;
 b=Gq407H5gGBCfhHWg1MOQcHwkzrNIAY5UrfedFvVmfG+5/j1EEqq197qQlKOBDyJJiyhBAS80Qpevrf0HiwFhZUl8jGd6LRV1M4dRNJLnrlWNFnfd1tsiFXZVu9cbjkodlpdGGRKwqaJ9Zy+Jkg5FA2Q7rkmWDbJ8ICMYoC5eE3s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PPF70CEE1097.namprd03.prod.outlook.com (2603:10b6:f:fc02::38f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 21:35:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 21:35:14 +0000
Message-ID: <72a56b3d-5747-4a9e-8408-624ca4f707d5@citrix.com>
Date: Thu, 22 Oct 2026 22:35:10 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261021195153.06D8D679@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To CH8PR03MB8275.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PPF70CEE1097:EE_
X-MS-Office365-Filtering-Correlation-Id: 675ce0bd-08b7-4bfe-5d96-08df30845bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261009223027099003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CODWThfjN8TuoE0Y67oYwpf0ROqem71NbzalP034I2yU7yEm6xoZ5f9L5ttX4y5Z9SMqBZm9QFmFMv61HV4jaEyXF0/ncfpYhSWhDdqy7sptRs7wpSNSEV5Jv/F/dqFx3cCJgMwXLsapsoBjSQH/mefhlNkGkhytJMdyQc8ehBc9U81HOZmDzWPZC+STgJcYZNACusYDu7M6YocLaSE0z7Ti+F72e9hZB4vytSPBtRpA6QwBx8r2M6fAFawEaSra+Jg2fKiLM10Ip8lxInm/xoLpJEaKNtkNbfSA+hNFpRXdzeOxrl5kdV2D/iaSfwJjiWAyrFvzpSMWONfUXIJYZftM8q9fuMUH/xRbY2BdtiutqJ9Lc5TWrc/0AVEF/uFsi7VpKBduoFB38H2LFpkzyAe7e7O8NdTDwEWFUTOhHgwJ5JZbOO+py+FTwFX33mzQt96K9G3cPtfuxBwi1c6Bay3cg7PMVmekcGDEFECk5ktpUGABpRXzo/ZjIVfgvTu1M3Ii0qI80HI9rqpc12J1sbLtdJ4dEtJXZS+CtLiGFHwBR4u0nTfB0FCsQ6GTlxwoM6pHzVvPk5pWahlG5d37Vc+WRNd5nFFMjQzIWwXBBqeBp7XSPo17VacPkmLjeZibCKevA05UF6qelwi8/qruad2t+fBAUxJO+NbBuRlbO3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261009223027099003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVdVUzJENjdtUHRDVUt1NCtLMzMzemtYVGt3b2FJOU81L1VvNzhWMXpEajFx?=
 =?utf-8?B?cUEvbjdVRy83YU1wNi9RejA5R1U4UldxTXZPQ3l2UDZwc1JtVGk5bE93NFZi?=
 =?utf-8?B?RDZnZWtBZXh0VWtQUGJsTDc0N1A3bytPcHdZdmlLbWtReS9adTNlRDJPYU9K?=
 =?utf-8?B?S2gxaFc3UHVleHBGNVI3WUNVRXlNaUVLZ1RMZUJiR1RIVGVadFdhemVPdDMz?=
 =?utf-8?B?RFFnaS9tN3AyS1l4elExT3NnYzdJQTNTRkorbHRaOWVBc3JLVHFNWVB5RzZ5?=
 =?utf-8?B?NllDNDdWdHdoOCtSK05aN1NRRXhsdmpCZnhwUW1tTHZER0JSZ2pGeFZJdHgy?=
 =?utf-8?B?cGc5bmpTM095TXNaM1IrZ3JGUzJVNlRJNnlSME5YdG9DM24wRVU2Zy9OMnFK?=
 =?utf-8?B?UlA3NDBLRkNuUUUzRXh4UWNFYWs0SnNlTUFKbHB4TWZBNE5wM1p3R0JNMStQ?=
 =?utf-8?B?R2xiSFlGbDF1d1dUQmRmNnNjYmdrTnYvaGVzL2N4OG0wc1V1Yzl2R3cwTFBF?=
 =?utf-8?B?Rk1hM2dBQUcwUFIyWHBMbysxQXE3bENmOEdjTmh4Nk9uMzlSLytoZWdOajBn?=
 =?utf-8?B?NlllY3Nsb0FJZE5LNTRCREl6K29YcGRUS2pHQ0JvbkhOb3QvcW44ZWZ6UWlX?=
 =?utf-8?B?M0tac1E4SnNKcEtZa1NFL3BwODJuRk1rUGUwbnNPZ0I0L2p1YUlBZEl3bjhs?=
 =?utf-8?B?cWhsVVZqMEZFQm1jVEFQbnZHQUpQNUI0MEZPZWZrdUl4WTBOeHFBeDlxbzVI?=
 =?utf-8?B?Y0o4a0FCRjJVcDkwcmkrN281RzkrRktzcWI5NGhrOEdSaVB6WnNRbXZxTjFM?=
 =?utf-8?B?NXRPUmZsdkw4aGZUeWVrUncrdTJsdEZUTm84MXhJSUo2a3Jxc0JCcE5NUWtE?=
 =?utf-8?B?KzRReGllWTNham9jdHJsV3BmK1ZOVkRtUUc5MDVjODl5UDhlMnFEV0thOWV5?=
 =?utf-8?B?dktwSVZwMHRxc0tWaHhSU2RaamxPSXV5TWM2eWFublZpdlM0VFFlUzhiVUE3?=
 =?utf-8?B?amE0V2JWeEJQTWQ5cXpkcjZOSDh3d3c3RWRXU0l4bUNEWkIwN21nMXZYWDlW?=
 =?utf-8?B?alU2STg1RDI2WjI4b2JiT1A0eVZoN3Q4RjZENkE4bFFscWZoVUVtSWVrSjJl?=
 =?utf-8?B?RXRtbklDYTRYMDR3VGJ5ak5IamhUczJadERkUnhJOGl0TDhvQ3ZkUjFoUWtz?=
 =?utf-8?B?b3dEeVFzWExvSWhselJqVTQvdHI1UDAyeHpIdFRqNXNmWlRCeHFrMTJQcndi?=
 =?utf-8?B?ZUNGWENieE5SdDRHcEhHS2x6ZGZSUEtQOFhweXk3RlhyaWFPQ3FYaUduV3Jw?=
 =?utf-8?B?RGp0aSs0WlFRaXpua1hmM3pjb3A3bGZZT3ZWMzUxUDliZnArZEE2UldpanlU?=
 =?utf-8?B?WFhvOFIrdURXZ01tUDIrSXFGbnluZVo3aVJHWkRIMXFLL25YaG9OMjBtMTJs?=
 =?utf-8?B?MjV5alZRcGFibjF4UWNITjJRVGpQVStxbGs4ZXdZcDA1K0ZkRDVMVkdlOUkv?=
 =?utf-8?B?R0d4Qkp1RCs4Mm1MTEtIek1YQWRkMWc2SGd3Y1dYaHNwNjFXdDRUOGFwUzl3?=
 =?utf-8?B?cXJzcFIyb25kRW05R1BzNE1SL3gwR1lVS2tpMW55WVo0emYvcmZvc1NlWEJF?=
 =?utf-8?B?dFpyYmlPMU5VeExZMFg1VFdCNFIyOVN1dWRsVTFnMEdDM3FLM2tuKzEyVkJ2?=
 =?utf-8?B?OHhidXE1Wi9tYk43TVVDN1NuRXlTK0VIdVU3TXBGbGdRSWVUdGMzSDBOQ0Zr?=
 =?utf-8?B?RDNvTGoxVk5COFpadUhucy8rVTdpd3hxbmJsSjhydGVQRmt3SmVScXpCR29k?=
 =?utf-8?B?OGxFTXpGcXpaZnlURG11YzBabElBRmNsUm1mdHk1WTRNanpqTXpneXArYmxO?=
 =?utf-8?B?bmg1ZEVpek9hUGhwMHRPZStGUGhMWkkzeTc3K3FTNlljVDh5clBJbExmcFZX?=
 =?utf-8?B?eW1seTR6UFIveG95VmlEU3ZOVHpvS0Q3aUcwcCs4d0Y1WmFTQXc2ejh2cnpN?=
 =?utf-8?B?elNiSDRvdEkzVUNJdmdjWFQxek1FYjZNdWhWLzNyZEdhOHd3YmZ1d1FNeDJH?=
 =?utf-8?B?UFJvR1lwYVVGMm12bC9OSkNxUGlIaXRnK2EwSS81eHZ2TjRaZjJIQitoY2lt?=
 =?utf-8?B?SlZwVTBVdkZsTVNQR29SZThFUGIvU3YxQktQc2N1NzVLelE4V2p3ZGR6M1Q4?=
 =?utf-8?B?K0hqUU02NkVEKzdocTgyN3MzRkxicituYi9TbE82bDB6NEIrSlBIVjl1L1U3?=
 =?utf-8?B?Nm1FZVlHTFRpNmdnZy9oeURObDBGOFUvU2UwSmIyUURNUGZFa1UxcXJXbGpt?=
 =?utf-8?B?OUdJbWpmV3EwM1NleEZ0ajJHbVU3bE51a2VGUEdtQWNnOXNlVnJxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675ce0bd-08b7-4bfe-5d96-08df30845bac
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:35:14.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUO/2SFVqF6x+hj6qjW09pmatC7SX7X2hvUfnGt5LuA7KqIxK6Bv6hWEFQ+qxbc54pRCQVAvcJyy1ELxy31b4fuD4Q8TSeazexJbyBYU928=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF70CEE1097

On 21/10/2026 8:51 pm, Dave Hansen wrote:
> diff -puN arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible arch/x86/Kconfig
> --- a/arch/x86/Kconfig~kshstk-kconfig-depend-out-incompatible	2026-10-21 12:36:44.598893837 -0700
> +++ b/arch/x86/Kconfig	2026-10-21 12:36:44.601893842 -0700
> @@ -1873,6 +1907,79 @@ config X86_KERN_SHADOW_STACK
>  	depends on VMAP_STACK
>  	depends on AS_WRUSS
>  	select X86_CET
> <snip>
> +	# PV guests run the kernel in ring 3 without FRED. Kernel shadow
> +	# stacks are FRED-only.
> +	depends on !XEN_PV

Xen PV guests will not see FRET or CET_SS/CET_IBT in CPUID, because the
features as a whole are incompatible with a kernel running in Ring3.

This is not a restriction/dependency that Linux should be putting in place.

~Andrew
