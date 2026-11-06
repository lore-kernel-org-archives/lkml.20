Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793961289;
	b=PrYg7Ry7pg3ft5SsPty5QV7vInjVgp0f1zrerGCZUxKo0xcNonfwVYn3SKS793oQPQC+
	 rLzqO7ei4oLu3ehiOOX9PyiIYcD8BbykW3JYCtdkLthk2KNL/iYeEeTe6bl2K17NFShoe
	 Kgsoji10k0Hsp4eAowWqlFXO/kZ24zqS3NYILKfefN8V4aeA4fHSVSAmgFnW+aEEJt5Ha
	 YR/7tf8E/VeTd4P3h7dWY3RdEd5hNc+ejZpICpgojk9E4wAnCXCrEiNwHQgneLDGEed92
	 KC1dVxuYz7NxlDCMtZT+Gj1DW9WpEMyNYN23gxkzO+cpcQ0QW7xHQ3tD2zPMC8ArONA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961289;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=qiLh7vyAApWlZAt5SbIuDxqY+pzzbqOlArB6fWNJDTQ=;
	b=vLD7+OmGjn0CaTCrur8T54PtMzXP16LXbcCxD+QNNhhSFRXb2H9F7vRcOd6d60CxHXTC
	 VLuOdjS4o62K149gTFYWDPBdfkUGYf8xw2N1mVKAJhZIySwr7AXB3LsoMT4AGuCPyV8kn
	 n0RJIUZKoCjflYNE2m5QJAXmS7heA5bY2yZk+/MECFC388DzztuRRWKP0tjFDm3Hmsx/h
	 pJdGuvA21rVkkrZfqZw2/ZODRWrzNRSFbRSI9mLJr9OCczPdRzjze9U/bC2X8q0Fk40Qi
	 qFow4u2pNTJgzqq1haQ58v24mkz6WPMrFfqu3bNBxayA3rUBHjkUqHDre72BbG2VKNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kLzfYvTp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.39
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45916606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45916606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kLzfYvTp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMPcypSmUJ/sfy4YTNsiqoF7tEtelCcSefpYmcYDdSZ9AHOPVkvQtNmKf+gIMFEPye/RxDx0FHkqZQaFNmnUXOEjdKAEjfWVreevYnfd0kLutP86VvY9iTxZGeRQ6LeoJ0WYaQ26cXsAU4sRgWUexlRgusZHAhrFlRLzQUwhehKwaPE+1OkecWnvudOx4k2l6kBIQ+qnvWq6vonAw3ZsTnjV5Mu1XRb+08G8c7NLcJUvtHaGAJeUogJ6tfgArZyg9HTzopa8JPFYdOCG+EFPh0TkbqO5hW1zWz4zJkDQvsaBZL+nBqkeKqugzVZIzitE4YehL9TbHndNG/55wLxTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiLh7vyAApWlZAt5SbIuDxqY+pzzbqOlArB6fWNJDTQ=;
 b=Qf0NxmfhKu+DtO08chEKvmzpSoPmGStMqSkBIG6smVt7OkAMleTtGRT/sTda6o+DnaIr+kIcGSO7+nUSrN4EVmVvzA7cm7rgoB9NCAvZWBL5OtrUBzuoTsHtCIJpL6vX0hA5ZY4P5LjX8stTjA0yE7mxAmG+lllEe1ZcWMelLMLfXSnTNyhS3Lwd5w2IRvk6c3OYwMgptgF4pJ9XVIJFTR/4Zg7VBg44htdd+CHAOsbqgJQ/r7umbuwNh/3GZPRyGIly1swGucl4j+4inKqZQ2tFQr977NAQnnGCgH7QkR6K7wLHPO4nOhqrcORtFJGp2vwZC9ZcfwJ7R6tgIJBx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiLh7vyAApWlZAt5SbIuDxqY+pzzbqOlArB6fWNJDTQ=;
 b=kLzfYvTpt/5tsh7pUJJXWUUkUZwjneyM/p9ckBk5GRYLeXXpwAqmK2QFcr10S4odp6MXX9v/LcgWML1YOEDqDl5ICLWwMc0Y+xny9HaJ6OfAJKbASO/Yc+mkjFVfrYUel43G+YSst97WwM2H53Owm5otkpGhdt2cbwqp7D44+tUEAt3O3x69hfSOaEy+Luv2atvqjnqMCOhgoqbpbBXhLo1gve7/wg57ITf4fFi47ydCqAtVQ4DztSfBQStUPc4/SWngk0zkUI5Ykc8LL3g9O4YIgBCVtgOOHLcgavgJyONeOnIw2yf5I+cq4Z7GUaWXAicIfYCsdu4a7R+UDF6U+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by IA4PR12MB429550.namprd12.prod.outlook.com (2603:10b6:207:128::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 10:34:46 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 10:34:46 +0000
Date: Fri, 6 Nov 2026 21:34:41 +1100
From: Balbir Singh <balbirs@nvidia.com>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
	akpm@linux-foundation.org, rppt@kernel.org, apopple@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mm_init: factor out
 memmap_init_page_from_template()
Message-ID: <au2tQaaMBg3umthq@parvat>
References: <20261105120615.16817-1-lizhe.67@bytedance.com>
 <20261105120615.16817-2-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105120615.16817-2-lizhe.67@bytedance.com>
X-ClientProxiedBy: MEVP282CA0049.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:203::9) To CH3PR12MB9730.namprd12.prod.outlook.com
 (2603:10b6:610:253::9)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|IA4PR12MB429550:EE_
X-MS-Office365-Filtering-Correlation-Id: 7658462e-f471-4851-eb35-08df3bf19385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|23010399003|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|261026121527099003|261026135527099003|261102123227099003|261026130827099003|261028144727099003|261026140227099003|261022115727099003|261022113327099003|261021130227099003|261021123027099003|261021121427099003|261021133027099003|261021135927099003|261022105027099003|261022075727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wHXKjUgosXL+NgW8E/PvJsRmW+c0C2OqqgkR15bb1xrp6u2ytLRi2/n5eDKmSFJ12Tb1pahnCxiuKwpQFDfTlFLxEB6cH48AcxbXJAGYAhjVAY6k9o3qLbeIgVio/xXevkQFpV3iSd30zbW80/CchRNNRsE90cicB5wrxqJIdTmkL28rSSfvbP8SwZns6Yu378LVlQnqxpfkVd/VQoyBvJpws0Fd8Kmba1Ayk3+YOYjCNi+lVKTMpNtBPy19FxJprQj6gdagqrh/BQnY64LgIzgJSw4GNlEyC/E6GwjnaInBtOZi6ZWUCigPn0CtNNwnH3ezDML93gc0VcDMbHjgNcF2fvzqqlky1AwlZU4rtT3rja+U1giXXSbw6ZemFM2mJExXZLitgN1v8YWfd4s2MWxBWwW0+xCnRTvIlOW99M2x3qyFm95jsp1AhVATUj4YQLKTIlGTUzGtle9kMdw9t6KyO0x22tupvAtasDHr8BsZ9s9f3MSwckkrWu5UgSvD/SxhVo7s6Fy5q+8Mthy1Lk9uulqOiWkh7GnjXCWxP7ivpcICbj9xV3wFsh9PTy2zCRIV9Ver83H8pvS8uIgrbqzunFGVbbB+okPZImrGTwGy0T6UFpkEaNLbENv2vRxOVLJ2+wX2TmA5OY2BpASSMrGtjn0Ltl/cN1JDhJpFnIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261026135527099003)(261102123227099003)(261026130827099003)(261028144727099003)(261026140227099003)(261022115727099003)(261022113327099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021133027099003)(261021135927099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yan07RzzhW768jhkGQctbs/3yiXaSHVEmaW1YEjyrPitbY6XQdq1+mu/Aja1?=
 =?us-ascii?Q?AWcPLmFthZfILOpV00JffarYHiGgTUUjx+Zp5bQAF3K/DFkzMkSyuhIn2qOp?=
 =?us-ascii?Q?o28I6wO/fP/h/lwWJqbsGdOX0BIg6ywAsF7Sk+ESCI2Mg5jk1gKL+NtBIGu1?=
 =?us-ascii?Q?1tugjaFsuSqqOMU2TpfaCnqSTQbXIRo+EgvyAaNitxKsJFtfc/hm5rF1wbOq?=
 =?us-ascii?Q?PEWcYfPLV/JNC59gxFawENV23AV8uR4Zn1a8n0vtV1imnRw03el1F8sybyBu?=
 =?us-ascii?Q?4WvbVNPF18MBsooveroSMklgUjHd0sQSLgRXMojgiCm8USjykDsCQkk2cYrM?=
 =?us-ascii?Q?60qTTqDe+CvY93B5q4piHJpunU6PJMcjbMOdcweRazopP+Jxrq97XMGdMjj0?=
 =?us-ascii?Q?z522YrP1B5SINTD5eqNnJ2XSWidKLjDs6WnSFhgEzdMzOokPCGEnfHHBjgRW?=
 =?us-ascii?Q?DcvHUw18CqmiNAz8O39mrtOp95HrMA3rQIiEn9hqCGTo2inI9/6ajUJok0Iy?=
 =?us-ascii?Q?+vyEKd0m0sMiY7Y9DTBDFZ/egz8YxxvEbeoTbGiK1P98djtTc5+hXO+OXQRd?=
 =?us-ascii?Q?9WVPEAPi0Tv2ulF8PyjQPO9k3cD5j9nyTbhgHlYzXj0IGN7TjPQwerPuNYtE?=
 =?us-ascii?Q?jydotzAdhVMUQT/0na6Gff/EEkqxrwQLc/dt9n0qLQ/EeeBB9W9uBuHo7ITZ?=
 =?us-ascii?Q?sVOG7hdmit0oAt4IOzzXl2Ks2fi/kO1g4pqGP7LFIi1ZMasmCKplczrGAATO?=
 =?us-ascii?Q?LQCCDsUlRBztLG30smVrm8MfoYqGmlqzlGRfuaeRKuPJrPAq/JVJPF9mJRwO?=
 =?us-ascii?Q?dhgJOQ7whhk3lM4VxIikpgowF3wdaD2U4iRrMz67l0e3cm0RwyQ6RI+ZPs/g?=
 =?us-ascii?Q?0vXz8ymi19sPidAxZ3WONOXOWmTQjrzTuVItDUXDgxD2qsh01sA1I0i1dX36?=
 =?us-ascii?Q?1yR7DvQMD+CO3xZY2knFkF5Lo4DniBrW64mdfsavPNFi+M9Yeb2LMt0Eh8fN?=
 =?us-ascii?Q?uC1juDST323s1kPNoF2d8ifJVVzHHgPN6Cy2RX1cFugBiQPLVdAg0x6Hh/cG?=
 =?us-ascii?Q?bXiqlefR1lZag6L8YyNfS75gRZkPb4Mqy6J6Q11dRn9ars/DscpK2ekBB/SR?=
 =?us-ascii?Q?AWjejVQSEVh99T9oA7LbIDBbEQMjw767lp6E6zrVA0wgbiwvLZ/9T6x69i9B?=
 =?us-ascii?Q?U+QymGmeP+jWQPE8SgiJjWq9C9rMFHX6nLc1JbCrVVHpsIlnYDbAn/bxwUGU?=
 =?us-ascii?Q?lFuL3dctM0SJHeZfUTD3ilRGz78NvkoNKLt4jrfSgk4yoWLGDEJBDn++o9M+?=
 =?us-ascii?Q?VL5/KI0Y8bGeG9HqvMnbr131zMV/Ia2d71wLaeNbmGeek4eLNTST79EXo4W0?=
 =?us-ascii?Q?Hq6f5FQ1MVQCBFzbXlSDAe81NpneNGcIzInnhlY5F/8iU8Ao4vYbSiaAKEzB?=
 =?us-ascii?Q?x8Lyu4KUjQMlRMlVPyXUczwTcmfQ+ENmsNydx4apgbkxidqeG+XCxfoj284T?=
 =?us-ascii?Q?Gpj+djnjJj9fn37rfLoyi9qFJFlnoFm2LSzI237URc1fx/HBLHskuX0GLJzF?=
 =?us-ascii?Q?YY+NM2cUM+Not1SxcsA15FlIUuTZxki7zUUsJ0J/v4+m0yDDNDTv7kRmQCtA?=
 =?us-ascii?Q?Uuzck1YR0Q5c2FYl8gV5cYQlvUnxa2CXk6/gQh+HLCfCzzkCQZKXap8wX9ch?=
 =?us-ascii?Q?SZMDYJQ0ZTB6xlhyZzAkYSsX8uzIA5j6zYjCYAjEM0dfbp1Y9fDHCFhUmc4c?=
 =?us-ascii?Q?dRw1HrpvCpdW/hncxpzEMNXlxQuQei8EhZcsRgmB+qWk92HtXG6xTvb7R8AF?=
X-MS-Exchange-AntiSpam-MessageData-1: ttDGyItME1q2rg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7658462e-f471-4851-eb35-08df3bf19385
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:34:45.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lAaDOPFErNitcr3KFWusauYfVvffFJqvNEru/ZeEPazwYTPVWLlQ+gg0yLQfVXy6jYQ4tDmWssgvfVcdleumQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB429550

On Thu, Nov 05, 2026 at 08:06:14PM +0800, Li Zhe wrote:
> ZONE_DEVICE memmap initialization already uses a reusable struct page
> template when initializing compound tail pages.  The template mostly
> contains invariant state, but a few fields still depend on the target
> PFN and must be refreshed before copying the template into each
> destination struct page.
> 
> Factor that operation into memmap_init_page_from_template() so other
> boot-time memmap initialization paths can reuse the same helper.
> 
> No functional change intended.
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  mm/mm_init.c | 29 +++++++++++++++--------------
>  mm/mm_init.h |  2 ++
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 2a0e782a151d..495e20fbdec0 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -625,6 +625,17 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>  	vmemmap_optimization_verify_zone(page);
>  }
>  
> +void __meminit memmap_init_page_from_template(struct page *page,
> +		unsigned long pfn, unsigned long zone, struct page *template)
> +{
> +	set_page_section_from_pfn(template, pfn);
> +#ifdef WANT_PAGE_VIRTUAL
> +	if (!is_highmem_idx(zone))
> +		set_page_address(template, __va(pfn << PAGE_SHIFT));
> +#endif
> +	memcpy_nontemporal(page, template, sizeof(*page));
> +}
> +

Can we make the template a const? Why can't we do

void __meminit memmap_init_page_from_template(struct page *page,
		unsigned long pfn, unsigned long zone,
		const struct page *template)
{
	memcpy_nontemporal(page, template, sizeof(*page));

	set_page_section_from_pfn(page, pfn);
#ifdef WANT_PAGE_VIRTUAL
	if (!is_highmem_idx(zone))
		set_page_address(page, __va(pfn << PAGE_SHIFT));
#endif

That way we don't update template once it is set, if template is r/o,
then we don't need both first page and template in the caller to
be different.


>  #ifdef CONFIG_NUMA
>  /*
>   * During memory init memblocks map pfns to nids. The search is expensive and
> @@ -1073,17 +1084,6 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  	}
>  }
>  
> -static void zone_device_page_init_from_template(struct page *page,
> -		unsigned long pfn, struct page *template)
> -{
> -	set_page_section_from_pfn(template, pfn);
> -#ifdef WANT_PAGE_VIRTUAL
> -	if (!is_highmem_idx(ZONE_DEVICE))
> -		set_page_address(template, __va(pfn << PAGE_SHIFT));
> -#endif
> -	memcpy_nontemporal(page, template, sizeof(*page));
> -}
> -
>  /*
>   * With compound page geometry and when struct pages are stored in ram most
>   * tail pages are reused. Consequently, the amount of unique struct pages to
> @@ -1136,8 +1136,8 @@ static void __ref memmap_init_compound(struct page *head,
>  
>  	/* Initialize the remaining tail pages from template. */
>  	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
> -		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
> -						    &template);
> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
> +					       ZONE_DEVICE, &template);
>  	prep_compound_head(head, order);
>  }
>  
> @@ -1192,7 +1192,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
>  	for (; pfn < end_pfn; pfn += pfns_per_compound) {
>  		page = pfn_to_page(pfn);
>  
> -		zone_device_page_init_from_template(page, pfn, &template);
> +		memmap_init_page_from_template(page, pfn, ZONE_DEVICE,
> +					       &template);
>  
>  		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
>  			cond_resched();
> diff --git a/mm/mm_init.h b/mm/mm_init.h
> index 0034e37dbabd..22c465122b47 100644
> --- a/mm/mm_init.h
> +++ b/mm/mm_init.h
> @@ -111,5 +111,7 @@ void memblock_free_all(void);
>  
>  void __meminit __init_single_page(struct page *page, unsigned long pfn,
>  				unsigned long zone, int nid);
> +void __meminit memmap_init_page_from_template(struct page *page,
> +		unsigned long pfn, unsigned long zone, struct page *template);
>  
>  #endif /* __MM_MM_INIT_H */
> -- 


Balbir
