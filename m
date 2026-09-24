Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012069.outbound.protection.outlook.com [40.107.200.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D31486B86;
	Thu, 24 Sep 2026 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263624; cv=fail; b=CCst98yMgLZ30Z1DrHyMLI581kkwjccR6nmIM60/HX6akODT1i+4GtLRgUvN9tK2vwfQqVa+YrRScq5XWqKXBEKgZzJKQIhNPP/nLZMTce0YIsWIY9RQpHy/SvKHYLGjvxBJn1lT0k3j5jYWNxestwR56fg5vWuLW5xto71A1QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263624; c=relaxed/simple;
	bh=11Uc1auiAVNehbLsV9llLbgJm5754GB93Wffu77TSes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jyDDucUO5rDPqtX5cOY7CQ4xYKOPteWG43n70QQl1nGPg92LwejRnjitiLzT4Jz6lVQ1xeUOC8eExqhaSCG497m8TiTMNZsZVD+WynpIP6rxMABpfUyRcs5LNcSapxTpoho8fUPMRVnTPbWjn3lllLPrB4u4WqWFuyX8SgxxxQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IFU0yPCM; arc=fail smtp.client-ip=40.107.200.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IFU0yPCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcH2F/xJK2gVp++/SVgYwThVhC1L8973kuQ5oD9lJndS085az+k8S3ZwXQmffN/joUnvnJdpHTak6k3F8AmYAyULtiEuSPdDeyo14J2Wy1tuIqwJ2a76++15gSePuDEMvmHjZ1h3LU+XqC7SoGe43+yT5ZHJ9TrHTIQ+v8ehNUl/Q23RkJdy/TInR5aqQYs4Bh9OSwgHS+m8jl2rL8k6XuF5KLoGylUkmEHNv0HHoGoELc9DU8RiVzVd7nYK3y04ZnJH9eeyT2AwIF6XbL7J8lkGE0FIDwYXYoWv30HGKmn+biUZcIgbreuLgz4keR6p+AIGFruuSWlTHN7ikzo7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q3OIS5K+YiMPENCuqkvTjsBf2ogA/gvPa7v7RUCmag=;
 b=aFJNU3Vfg8EmB9C6aytNwIa2HfrTric0D3tvh07IVFAU8wXwJ0i7fQ0rcC57eYmj3Wn4X21ndD4vqywgMWEUxfD2cc9soAnAnU0GmAGHc98+7IJjaWltwJWHbHRPnFNvEIytNWqDki709fZulB5h090dzJriP1ANCI649jBJq7QrvVBlMNdRBbzh+FmYuvzDlAAvrPYnyKEJ7rwZOo7kDw20nXoE+iA6Ef2Z23a56AurnZKgnozsEMRxb9lIXAFkVI9JxZOHQbwGc47MK+7DzTlqV4zP0CtpMy4mGEre4R0OfGaBjLKD21uvOvKG/o61WirvLFheIHgOv2AQV6CVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q3OIS5K+YiMPENCuqkvTjsBf2ogA/gvPa7v7RUCmag=;
 b=IFU0yPCMlAqLsEgzYhD11UVn8ou5ZFbj79C5O1zWlMfzVcq8VbJ1VYHPfRT/E+O9yDmn5HczRcjGh3NBYszKBFZBhLp9iMdG4O2q1CFIZ3/8XvCBL4/XkX1KtGiyXRm7UNW3VKQNHl1FYU/dh45jadbcuakaVpXzpsbzhXKDM/o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS6PR12MB765380.namprd12.prod.outlook.com (2603:10b6:8:411::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:27:00 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:26:59 +0000
Date: Thu, 24 Sep 2026 11:26:52 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] RAS/AMD/FMPM: Fix out-of-bounds read in
 for_each_fru macro
Message-ID: <20260924152652.GF1080284@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260826035314.1536340-1-qirui.001@bytedance.com>
 <20260826035314.1536340-2-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826035314.1536340-2-qirui.001@bytedance.com>
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS6PR12MB765380:EE_
X-MS-Office365-Filtering-Correlation-Id: cc53b11f-4847-43d1-de97-08df1a504694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+mJARXb3PbMqrF1H+Zz10h8I37OJuWO4wmXsxxoqnCOh5EZ8So6DELAY52Ff5XpoI9MeoLsckrgJgukwVg5XYVrIzfcZdFuNq2cVTPIwOPLKODeVqhXi9pYEDGdld2hu4DPe5iGnDNuqTsSYgLmMR1PBJ+o8EF8cORwzoXYm9yIuopy8um0KADaMnaN4XeIMcyAZovK6pkkbm1EhfCQCHevazn+8YQDhmk3cRToF6NiPoz9gPen9rwwuM9a3A6CdaV3Pm2oYo/9n6vK10PH+rDOjaNXKlnfAFvSBZsXcgDOtKQUmeHZ2bo0TQgLvnO3nsXTETd0Rm7Yoxn0fNVnAru6b8GpLcqsjpIcVFyWa9cEcTvhyEos4Q5WXqfe19QIeLIi43Oz+v3EcdGZvwyQN9vckvgdy8rWifVkKAMoi7nEphRRx/2uWyoFUjz1aLXX6uQ0FP3D4t1oRj3Aiw6TqEQ/EX9qMOSUhx+qOyEBk7HPlMbnBfRQxLjbUxUYcxHIPFizfBgWlBIWGtp3gPYeqCn/7A/WSnJlK+Fqha3VO59L1oIEso9BorCKAGwh/4bgDIlcwE+GH+gAus8jWw7UAUSUwuAzxNpg97TqPTTJ5LLPglok+Tky4eACc0QpZu+KNVkuTfLviF4aQE6gQQQe2s7iSJjFNTWqWLrYYeaOKOXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GGXfSarwCMby5DC64JR57YRLCrYuxHQa6LpnWhMVcv7Kx16yO2DC9OzSoxfV?=
 =?us-ascii?Q?N0bQNjN6KVfd9KiJyy2dl9/wdsfzIKr3xdE8mj7DWYfQwtkuuVCQvfM9/lco?=
 =?us-ascii?Q?bTsDUPp4Wl+urJwsGd61Sg7MJf7Va8U9jTqjU4W61gSk/VHJ2Xfn+/MUtT+m?=
 =?us-ascii?Q?99qiFTU+qKBEHwg+XDjyf5l6j6mOskaqy2UtL1Xyms6dymRk6/FWgnoKfBdj?=
 =?us-ascii?Q?50wyv1I8MpkiJh/U7F8VKIGZGgt1UttcJf78Jo/XYEOYwVXZD9XBSY4RllQt?=
 =?us-ascii?Q?EzUEalTC/xOlHIKxIr1huKkK8wbV5irKSWrJsEDXUWGsa7efh/w8ivmwRF3C?=
 =?us-ascii?Q?BPkGgr1hZgyu/Pbd1GgA/+kg4mG6Xamd3nE7UkYEFUKg1OV+R3/L4dj3+KaW?=
 =?us-ascii?Q?DA5iQQ95tcJkaxw5lEmAhXucWfQ2gG6YWlGC+Li7dOGI1Hressbmmrk00aeZ?=
 =?us-ascii?Q?rSGh4CwS2iEe9AF/Jgh41+R6Os98Lx3eGfA+LBssCkUPvuKsyJKIvl/+tFQl?=
 =?us-ascii?Q?YxY4LmzaJBIAcOlyZHKHaNCaF066Y0RS87GmU1HRXeszKh0RNkHtvBo7ThBc?=
 =?us-ascii?Q?rv3qCCBa5A9NBYJ4J6QdyGfCCsvKHldQLMkf12rrdgpApiRKB9EmRim5X72E?=
 =?us-ascii?Q?01iGwjSPtUpTNXZylJthCg4mYnArrVB3Q42CFNZO4OfMRxLxMmzoUZ+bYqvv?=
 =?us-ascii?Q?8G8+cjEkg9l8peXzI83IxUv1tUlGRV/dP6aLWg642lVa4ASfHE7N3gR8Y1tn?=
 =?us-ascii?Q?DGpqYUradiI6Z56TqlAgGMigL1X64YG8dXAcoA/V4IZ7ie5hSVWrxE7olt1O?=
 =?us-ascii?Q?3Wo/djiP0BF43QT/BBJH6uqRLYB5mvbphSZuceww4gtttIN8uOfMhp8le1sL?=
 =?us-ascii?Q?/GDQB/PEdWABCGzo1h+ujMtnjHSwyIFM2OlsAsuyoMhfUl0Y5ZDySpJDz4Fj?=
 =?us-ascii?Q?UsFQi+PyhmRWosNJlBixZMG50Z4x+txGw7KRBgoRBJ97dTpmEnThZtuD7yjt?=
 =?us-ascii?Q?rScKbSH3oZCQuPJjFdjrvC4+7gqgyNFMRUUnt9yzX4CSjmZ4FxW9X4THDOf5?=
 =?us-ascii?Q?Fd368j0n55hehH07hXbwoMIAYWZE8kJEnU/vlRX/VNNyg21DaG34ko2E8b9O?=
 =?us-ascii?Q?4eggRctAmCx6KobGHUU8zbhHuVtbJyXt6NpMT79rfo4+uXMTSjcupQhEsCuP?=
 =?us-ascii?Q?VwrYiAko1cXaXmGZC5Wla5Bm1HGas226tP5grW08ZfGp6SWv263gNxEmAU5m?=
 =?us-ascii?Q?FOmUtkteOzGr9Rcd2+7dbPSofVsj2I8UZwLDWbCLpZfj/RkldC8mI5SLySop?=
 =?us-ascii?Q?TDdyH3Au0qLAQyZOA4GxdxJVIPozuyhyq/RJk7vNufm/vpk9v+7XsxwRmgqv?=
 =?us-ascii?Q?1c4xuUaZ+XbLU92G8X1yLay1lfHoys6FbBak+HzKJhVoEAaX41elB9UpcXUs?=
 =?us-ascii?Q?dgfUJ/N6uZEQRKbX+UOWrSMfhuwUHMr+BB0u+kyTnq9GEd4sRIlodfUFxXdP?=
 =?us-ascii?Q?ZoqQNZYxlWlknkd+VY5xess4EZRU0GwQ/RtgIk355R8bHb3Bzm6XG6A7km1/?=
 =?us-ascii?Q?yieU26dKKuzjfFbWHJuS2ba8C8XdzHzX8jNDh6N3WoEI+7/g4hKQj2b5Ihoz?=
 =?us-ascii?Q?S0QVLfdn3Y3Wu45SghNForldZxo1giqpORLzvXMqSxkXJ1SzaHslUXC4ePrJ?=
 =?us-ascii?Q?vrwOEvvrLpzKaWRUrLhzzC00OibDXmBTgP1N3jc2IGdZhi8f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc53b11f-4847-43d1-de97-08df1a504694
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:26:59.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfaZT9nJjnQQ6kyGtcMqT3KgHCzv+PhHlTblgQAj9HKCrWapL3vLLy0aRd5sF6CwRdfHBR0x7j0pbZ+kkzGdbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB765380

On Wed, Aug 26, 2026 at 11:53:11AM +0800, Rui Qi wrote:
> The for_each_fru macro evaluates the array access "rec = fru_records[i]"
> before the bounds check "i < max_nr_fru" due to the comma operator's
> left-to-right evaluation order. When the loop terminates, i equals
> max_nr_fru, causing fru_records[max_nr_fru] to be read before the
> condition is checked.
> 
> While the garbage pointer value assigned to rec is never dereferenced
> (the loop exits immediately), this is technically undefined behavior
> and would be flagged by KASAN and static analyzers.
> 
> Fix by using short-circuit evaluation with && to check the bound first,
> only accessing the array when i is within range:
> 
>   for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), true); i++)
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 4ccaaf7b70bf..81d7f02c053d 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -169,7 +169,7 @@ static unsigned int spa_nr_entries;
>  static DEFINE_MUTEX(fmpm_update_mutex);
>  
>  #define for_each_fru(i, rec) \
> -	for (i = 0; rec = fru_records[i], i < max_nr_fru; i++)
> +	for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), true); i++)
>  
>  static inline u32 get_fmp_len(struct fru_rec *rec)
>  {
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
