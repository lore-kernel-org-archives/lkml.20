Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B11475350
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149358; cv=fail; b=GjG10Rzt3GLlCZiumF/YEQd591lW0yJsRE9Z//ojsBg6e8EP3xUYf3yfMpHvW5jzBU1OnlXYSShliKJWg09xa24EreJeVl7YP6y1VJmMTZDJj3AyY7eONk5yEPTVlJdKeBeuQmdi9pqq9ofzBKN7WzavKe241hjGsonkGOPJbZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149358; c=relaxed/simple;
	bh=BUjfb/5lCT/SkiVvvWlq6S08QRKnn8TFUpHmusvDHLs=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f7c5iokJHLniQPUPGu9hAtPr2eXPlGq3mkEnBB4zHHZkfGSzwD8Ff/yjYou46SngmeO0YhdzkYpiHf6/b9iDpSHS4eV7maPIXo9aDKkFDfBe4zIvLV9LacviBeZ2MA9/qAnjLRaKWPvlQVqiwu+bMUknJ6Dg09TzebqmB/d5a5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=BuDyusox; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BuDyusox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FocVU8dnxO4ezIfk4nxix62xVgzWhrfHY3Bk1SnueONH5Wp2G8n3liySSOwNd8vc32fnPHnsFvRN7a7Ef0RKgy0A9wMkZ00T9w6/GJdjqvV4ComZKp05UEfHKxJwtskspxO8UbUUuM72Zg9v5/6aswWUxPDyjNeRokQj35nv1E449ja8QVmy9rChjeNg+/21ZVmiiibyRhkS7nzNCAlostdpurCtoeixf1Yc4T8P0o44iQbChUacH3TJZE2nQuc3/U4pr1YjERpqoTeT8YLWZprq6lLzVL7Myrj5jmBoIdECKIQBjE32KrG9/L5dXtIGlwT1rMc22Z/Eb698rCqDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEQRgVwsP3P3JCBhOFhOC5oNvH97q3sXzg8GqkPu+sM=;
 b=L+nN3oJkYxzc5UP0xjvUgSIALYNinxyweqav8B3GCKKq5M09mfRssYgD/0iSLSezM7+K2EWuCQ5lJ37UsI7CwRXWPC3cdLu4tYr39zEvBDWmbPiac560rhcOHKe60JHi26nmJlnb01/jFMKTgaHOkzhykkPiGQaAv+RSYggsCKYEoXfKRt4rwP4RP6U1ZUGEkrjnqOFR5ejy4bfRmw2V1f6LgG2aTuDeAaddSSTgz0HeSUSjtCP/mpFLuinDZmjz3OklYpL9MAjp9J0zmxsqToSDLbiUdr5sRqKqilHjxiT3cZ+01aItz8Ac7sPiQu/gu5J4GTgaTTJO9juzJ+Q36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEQRgVwsP3P3JCBhOFhOC5oNvH97q3sXzg8GqkPu+sM=;
 b=BuDyusoxSpxShCeG5NBWft+Ql1eZzg/f/ByMJOTizvJyprzx++mmEnLH+NC8YpIiJE7fR+ghrNiKI/ym7Q1+oQ/qbVXOKmsTcC1Nv9aK77+s+OJigezmptuXUskLMHU/aK5WypVnWAubhTsTJPB9MkPecdeW3niVgE6B/2zY0LY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5310.namprd03.prod.outlook.com (2603:10b6:208:1f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 11:15:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 11:15:54 +0000
Message-ID: <9a8b0ae0-ec49-4af0-8e5d-1378319f2857@citrix.com>
Date: Fri, 16 Oct 2026 12:15:51 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, George Dunlap <gwd@xenproject.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: Use VCPUOP_register_{runstate,vcpu_time}_phys_area
 when available
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792146192.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792146192.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: e08e31ee-c612-4b4e-892a-08df2b76d860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GqqXAPkdwHDQCUX9TO+LTjrw2tddzD77NuAvmzbr26ZRvB79PyeEZT9KxD+g4DzwdGlkPTF8QpDZTXSanjF8b9nksJkRHsVa/yWvdsvzEOJUwZt7yrwdmK/3LNrPRWG6ckvRGoeJ2hCmAT4LELdMF0LMHzq225BoijOr9TpIY4aPMbcMeL6FP0NTA3ojE50j7+l4rT+BChFM85OJoCKuYFeQuoWZa9ebdcH1pdkFoRSSxM/u0xxNL+rXj+NMdi+oUwrbOfpcg7KIrfOkqnJfMaCqbhJNmodYcv4Sb53LHhQ+HjGSSDpS1EVLFb+wEMA4Rs91Kfk2nQsmWzDjEt2nNpuy7T11TI6A8NXx88TDn96HAuRpiqJdM43O8cG1fLYFkq6G5wDBI1KCAB1+3le9Ls4dpRW8UlejIIHOq9SIpWVFy/sKwKyWz/pz5g1lzR2Na5sGhrftD2H+qQNEPVqvIpaNb8EtkBf2dMiy9IA4kWvpPMgd6tZvPCRlVkF5E/wgqYw/HTdKcQw9VQqXQtykESDpY0Jnghft4yJqcyM6XsMVFpDaa9oicYva9QMT9k4VgMOsSKbj9x/QtZE1JjSavaV9lL2Ez5YPVX8ZNxjt/CQgJp3A8fSs8jePWvUB1Kros/UCS0orY6IJw38XjyU2wynLl4uhWvFh9JC8LjeZJL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vjl4V3orNDBOM0o2RWJzaHJrSm03c0R0MDlNbXd4THR3UHpzRlhpSUQ0bG5q?=
 =?utf-8?B?aysxdkh5eDJhb2hVa2M1Qm55RFl0dm5WSXJoeUVkRVJiMXBuNVNYTHd2c285?=
 =?utf-8?B?NmVob3dVcUprSVBhOVlEYmF2bElJV2h3VHVBdy9LT0VveTBWSTZHbXptdnRt?=
 =?utf-8?B?VFNJNlE4OWdJdHRjWGI3NVlCYkFhcGlLNnFVTzNVNzc1S0FMa0xTa3pCRTRu?=
 =?utf-8?B?K0E2YTc0UklOM2NmcDJPZ1dBdmNQbHZSbU9oQW9WeVpOV0VtNUx1dFF5cEI4?=
 =?utf-8?B?VTByVzh3S0swT285SnhrLy95WWM3aHBoTjFPV0RsdEE0elJjeW9YZDMwWHNG?=
 =?utf-8?B?L1h0UzZpblBjaTZrMU5kVWdlbEpFcmtubkgwekZlVDJNMUJYeUhVamdGNVFh?=
 =?utf-8?B?c2lOVDVYdEYxUEhQcjA2U2FaNnhkQ0VEbGVBRjc0T2xsc24wNWVIRkQvT2hJ?=
 =?utf-8?B?LzMrVldoRyt0MElZOVBzOHRGcVVXVVVFS3p5SWFmY0xaV3pUdVpLTW9YUTJE?=
 =?utf-8?B?RjdaUlF6blJxNXVWYWdMZWFJTnlBTldNY1Q2cVNVSkl5QUd5VEYwMXlORXB4?=
 =?utf-8?B?Nms5ZW9WQUtUR1BNdERiM21xL2FWQ3lSUGxxUlkxa1lUWk45Mis1MnBxVUpz?=
 =?utf-8?B?QUZEZDUwaEkwLy9DdStkOVFRd1lSM0E1NGxVekIvcXdBTVlGdlcvQi9peTZN?=
 =?utf-8?B?V2F0OGRyWlFtZWZvbGpaN0JPWXNyeDhKUDhpdWVjVkFXcWtTTmg5d1hoRUls?=
 =?utf-8?B?U1o1eGVnUTIxNUVvQkpBTEVyWktlYXdpbEx4cnRxS0ZGa3A1VVRRRllJbkhl?=
 =?utf-8?B?ZDFBbytkTGFBY0lYMXBLNnRCd3lteXdQU0NEMURmb3JyNUVVSTNiNHppTnlt?=
 =?utf-8?B?WWxPM3ZCR21sY0dUM1l2UUZWUmpmWjBwQUJiUFZvYU9PdC9CR2ZhRkM3ZU9E?=
 =?utf-8?B?MTIzMTNaU0sxdEhZVmdWVGtnYVRVWnFHcVgxbVlCemNvVUw5VkZLT2FXWGZp?=
 =?utf-8?B?Z3lDRVVOV2FFQ0hBQldJdi9UUXZieVdLeTN6ZG1pVkx5QmEyYVVqSmFiT3M5?=
 =?utf-8?B?YXdTUnpybEhBV3JOUE5keklCWjVUME85bDI3dy9JY0ExU1gxcjBQcHRlUmJH?=
 =?utf-8?B?ejA4aDRpV2VLZXM3dzMyb2tqLzB2QUNYUFhwbFBzVGt1TGpqZmh3TkE3ajhw?=
 =?utf-8?B?dmt3b0dGZHFaaFJRNTRVRWxDK3M5K1NCb2hkYzI3NDNlMGNjNlhBc0k1UWJm?=
 =?utf-8?B?U3JkZjZHUFRSTGkzRU02V3Y5UnRpZU9IeUh0M2k0YWVlbUZOUGV5WEJOdURl?=
 =?utf-8?B?T1JjNVJoMHhvZUFCVTltR0dUQVhWd2h0eFgzLzB1YkMyRFlsRU5OMjJUaXVz?=
 =?utf-8?B?ZXNmQ3JsKytEYVVKRk5JamZwVTRySGR0QWhGU3gxRmgxcG5JcVl3emNHUWEv?=
 =?utf-8?B?aVFBbGZkWjQ0RmRJWjVWczZTWG5heG8xQUZyWmFrWFNRRUZCQmJLVG81NEJy?=
 =?utf-8?B?UHpFT2ZmdHI0bkVSWEdWZGhHN0FkejNLQm1OeHY2bFVoTU9rK1p3MTlZbEdD?=
 =?utf-8?B?MW5oN0ZFbUdaTnBORFZUeWdheWpJZWpSYllJMmxaWE1ZQ3IydnQxNjZ3OTVP?=
 =?utf-8?B?UUpUdVNMOXdkVlM2WTd6NnloZHlscHdTbElnd1dBZGpVN09MWDVybmZ1TDdQ?=
 =?utf-8?B?bWNpUDRwc3dLOWorVi9ianJ1eDRQMmRhazE0Z1NSZUdjeml6WlE5empEWVBQ?=
 =?utf-8?B?anh6YVRQZk1IY1ZRRmx6eXUxZm92dTI5YnVKWnZIc0VYSkVoYVNVbzRDeHRK?=
 =?utf-8?B?YkM2Smw2MWpMcGJIOEtRaHBRV2RQYzVzczU5NWlCN05tS3N0SjJ3cDhGcVNj?=
 =?utf-8?B?dWRSeTMyUlhDcWgybnhQem1NdHpLNWYvUURGeTFEVWVGeGNEdnkzNGZOZG8v?=
 =?utf-8?B?NGhYbnFOOGMrYTRjRFJUWmY0NkVDQW5MWjJEUHNMNktNTmxoV0puK2tCcjFw?=
 =?utf-8?B?OWlFa3h4dUZvZnZlYS8zb0REb0g5eFlsUDZjamNEOXUyQkwwR3p6T0xHNG1D?=
 =?utf-8?B?NUt0VmR1YmxNQ3E1aU9va0VVYjZtVFk0QWN1VVFicjhyTUwwN0kwY3Z3YUht?=
 =?utf-8?B?S21jVmpKcld5RWFHUEI5aEFnZU1kQ0s4QTJYNE9oQ1dXSC92elcvaFp0c0RG?=
 =?utf-8?B?WFhDR0h2Zk5QRkRwODc2azV5QktJT2FwVHI3bVMzUk90aXFCaElyYnNmazlK?=
 =?utf-8?B?TDZ2U0VEZzhkMFdYSmZDZnpJeW9oaXgrQVR0aXpjcHJ3QkhTYk51cGZNWW13?=
 =?utf-8?B?YURaRUc3TnQyYlZoWlZieEJTOGoxeXBpVGRDbWZYVERncDFTTENxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08e31ee-c612-4b4e-892a-08df2b76d860
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 11:15:54.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En2KOPc4A8TOwtME+EdxzmWUvEGHSK8LyHsvKYs4owTyVU4USizObDwB4CvTWJ0hlHYikPm9aubMgnu/JeKKzm5LIQirs/8jpqx1Gn5fwgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5310

On 16/10/2026 11:22 am, Teddy Astie wrote:
> Updating these area can be expensive when done through virtual addresses
> (especially for runstate one), in particular for HVM/PVH guests.
> Xen 4.18 introduced physical address alternatives to address those
> short-commings, but they aren't used currently.
>
> Fix it by using these alternatives when available (when reported in
> XENFEAT_{runstate,vcpu_time}_phys_area, but keep the current logic
> in the PV case.
>
> Assisted-by: LLM
> [guidance and testing]
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> When using phys_area ABI, the struct is not allowed to cross a page
> boundary anymore, hence we need to be careful with per-cpu struct
> alignment.
>
> I've deliberately put the PV domain (!XENFEAT_auto_translated_physmap)
> case aside as it profits less from the physical address ABI, and it
> would make things more complicated as "physical address" doesn't have
> a obvious meaning there.

It should always have been a guest physical registration, even for PV
guests.

The virtual address registered with Xen doesn't exist in the user
pagetables, and the way we discover that is taking a pagefault in Xen at
the point we need to update things.

> diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
> index 5c7822254a01..19ace1b78ae4 100644
> --- a/arch/x86/xen/time.c
> +++ b/arch/x86/xen/time.c
> @@ -37,6 +37,22 @@
>  
>  static u64 xen_sched_clock_offset __read_mostly;
>  
> +static int xen_register_time_area(struct pvclock_vcpu_time_info *pvti)

This needs a comment explaining what's going on (by GPA, falling back to
VA), including that passing NULL means unregister.

> +{
> +	struct vcpu_register_time_memory_area t;
> +	bool phys = xen_feature(XENFEAT_vcpu_time_phys_area) &&
> +		    xen_feature(XENFEAT_auto_translated_physmap);

Not related to your patch, but the xen_feature() infrastructure is idiotic.

It takes a bitmap from Xen, and transforms it into a u8 array of 1's or 0's.

It wants storing as a proper Linux bitmap, with xen_feature() being a
trivial wrapper around test_bit(), at which point the compiler will able
to collapse expressions such as the one above into a single operation. 
(except, you need to remove the XENFEAT_auto_translated_physmap aspect
to include PV guests.)

> +	int op = phys ? VCPUOP_register_vcpu_time_phys_area
> +		      : VCPUOP_register_vcpu_time_memory_area;
> +
> +	if (phys)
> +		t.addr.p = pvti ? virt_to_phys(pvti) : ~0LLU;
> +	else
> +		t.addr.v = pvti;
> +
> +	return HYPERVISOR_vcpu_op(op, 0, &t);
> +}
> +
>  /* Get the TSC speed from Xen */
>  static unsigned long xen_tsc_khz(void)
>  {
> @@ -395,7 +411,6 @@ static u64 xen_clock_value_saved;
>  
>  void xen_save_time_memory_area(void)
>  {
> -	struct vcpu_register_time_memory_area t;
>  	int ret;
>  
>  	xen_clock_value_saved = xen_clocksource_read() - xen_sched_clock_offset;
> @@ -403,9 +418,7 @@ void xen_save_time_memory_area(void)
>  	if (!xen_clock)
>  		return;
>  
> -	t.addr.v = NULL;
> -
> -	ret = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t);
> +	ret = xen_register_time_area(NULL);
>  	if (ret != 0)
>  		pr_notice("Cannot save secondary vcpu_time_info (err %d)",
>  			  ret);

How does this work?  Answer is it doesn't, because the print message is
bogus.  This is a failure to unregister the time area, not a failure to
save the time value.

At lest the error message wants fixing, and in a prep patch.

> diff --git a/drivers/xen/time.c b/drivers/xen/time.c
> index a2be0a4d45b0..6b6ddc7a5822 100644
> --- a/drivers/xen/time.c
> +++ b/drivers/xen/time.c
> @@ -152,11 +156,21 @@ u64 xen_steal_clock(int cpu)
>  void xen_setup_runstate_info(int cpu)
>  {
>  	struct vcpu_register_runstate_memory_area area;
> +	unsigned int op;
>  
> -	area.addr.v = &per_cpu(xen_runstate, cpu);
> +	if (xen_feature(XENFEAT_runstate_phys_area) &&
> +	    xen_feature(XENFEAT_auto_translated_physmap))

Again, PV guests want to use phys when available.

> +	{
> +		op = VCPUOP_register_runstate_phys_area;
> +		area.addr.p = per_cpu_ptr_to_phys(&per_cpu(xen_runstate, cpu));
> +	}
> +	else
> +	{
> +		op = VCPUOP_register_runstate_memory_area;
> +		area.addr.v = &per_cpu(xen_runstate, cpu);

I'd suggest factoring out the &per_cpu(xen_runstate, cpu) calculation. 
It's not free, and can't be hoisted by the compiler.

~Andrew
