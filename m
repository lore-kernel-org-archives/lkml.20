Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769079;
	b=gCSHn62DHUBNV3Zd3nOEzL/6S43n9XGIyzdhOFJ5qi5Rf5437p/KC48SGhXWd4QXWKji
	 ybSRC4nZkqXtuTrQNIvIsP+9meaoEg0KD9w067/1SoTZ/na86O33z+7lJhCAkOXnMxcB0
	 EMqeyvqL2fmAxuZEgPADHHqIMfYeebr/EiHci+25C0+gLl2atKReWy6xmvmLFTVT2z6OU
	 8vMJ7G6v/0BJ1MA01d24Gubjg3fn+U4z3xP1QGsJxyPvQIbzO3Uiwj/ZmMlbaw9/zFcZA
	 VY14mbYTg3FNT8Y4YnyejD7FyNv5Sx1HcUOjsbeJ7yVh3vyMgMdXtIpMX7tO9ET8V4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769079;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=WEZLQIF27kouXphGeFW0w7Frm+OgPiIQXZ2e5YtGcQY=;
	b=pFD6kAsfaNONO11DWKhobt/Vv3xy3krF2qnKC2rvnYLaV7zk7a+yoTzFnXm+sOtuzOIm
	 apvPsmbC1La5Xkuif9CDv1t3HEFJJS6nYeXeU0CFktVdLxjv9VJG6xb1b7w4msDAw6eCv
	 GlrA3A/3wRNNqcGz/HEtsjLC9IA/eLwdqOPk04nHLcfrLOP/T/8rD28yssBwz7FG4nbUR
	 pqrqQ4eJ/WODs+fiSEk2VzQ0S43KpgH7+iwh4s+cnxYeiB5M/qY2Fg9ZR+gXDRNPPMzzH
	 pnDtoxuHZvd1UODIQ4mi9wXB9PQE0yguToOf5dRVSNB92Iyhm6Qq3hSJrYG9ikGhzYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zz3EydVZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.59
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Zz3EydVZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7Op1P1wZllEBNKVgYSpn9UqYLhKN6TiuUFchFkmq5RVufs+r4qOwZHGKV7tn+qSa4BeOEgzBqeH33826wmlm0W2jiGxq0m6vQC7EjK4ZI7cuJoETAIHRAPL5V1Bc3lq0+bOfeW2vH40yTOC7+sicb1xq2q8UR7b1nYjxFgbiYJ8lxnkIL2xmMSem90HJDwUXf/SV1spmRAKNBsCD5kt+Zb2vS6/9yDSKgPbxXpuyK9JZWbe6fzEy+ZDfoz1GGpR4tS8AqEXgiAlvv5ZAtnDha8igKpDGbCWlMd7/8Kxxfy6mp1Gs/wXftkhZi/buF31C4Hn71ZUiQ68DnmkCXe7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEZLQIF27kouXphGeFW0w7Frm+OgPiIQXZ2e5YtGcQY=;
 b=uLpz40eNPL8hPsHAZ/Sq27NZnjbem9CIiJrU6MSMXti+RruIIJMOEXMdpwTyyg/MITOHu31LJfij2gTfp+EEmmjZ7aCwLZQR75E5SRrq5pp6svbMlFpjwTzkjT8A2Iep36WUBBNE0Xs5Aos9DS+inUgLm/90M7WPVRi8eyGQuz378Y1VoMO4W+Ct3nvC/0iaE3Jf6QhPBsJtVcOKMmUrBM3d3o1OtDGzHmNSAk5mLFcdDQQx99ar6Np/DCScsUBb+W23nGWa2CsCWmk7luOmbZwIBWZxFjM6PemR2xWUddZ4EeXNdix1hvaMfOxo0n+MA1x4qu72giLVIEG75/DU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEZLQIF27kouXphGeFW0w7Frm+OgPiIQXZ2e5YtGcQY=;
 b=Zz3EydVZnvrAeszvBRBCL+9nN8ETDal2rZExS5GR4dhx0hda/dLLJbEHrs8LzBPlUdB/EPOkWZsP8z7sWE0Li6vcoUT25J4nlJZ+hsV9R0zT0KQP1y9JTtIY0pbIhpe0fHQZ0PjpcFMT+H2N8EgVEY8uprxXh4Q15AvyuIBAY6wIRDQtgIf1Gr4TcTUCKduNxUfh6GV1BZh57LtCZMd29p1D8R7GyTfb4C8q+KayTxhLQW8bi34fcem8etlTnzYj8oHNZeTnCxkR0X6D5MoWHv4GC30scHealxQIB6Nw4Oub+TyGMBT7jQKrG9tYi5mSDIJJY5l6l1kSIyYGbYYEhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 15:24:35 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Fri, 23 Oct 2026
 15:24:34 +0000
Date: Fri, 23 Oct 2026 11:24:31 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Hui Su <sh_def@163.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpumask: Fall back to online CPUs when NUMA lookup fails
Message-ID: <att8L4Q_eeTOXGXV@yury>
References: <20261021060352.1351469-1-sh_def@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021060352.1351469-1-sh_def@163.com>
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 61be77b4-5634-41ba-8b89-08df3119be42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|18002099003|22082099003|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KnIN7QxvrIaf03JtHkTdfvw0dYReKjgaxsynem6I9+pm3aYink+JvsYpw8ltiFishLoZ+cRSCpmI9if1L1rQBOZhfgG8MvtCK/xkzuixavnZEjieVgeXcOtKb1ZZi3Io2ChhVoqALAC+8OPRTw+okT4ZjhplwIu22SZV6MrGThM5QeOD95B5LZpoUJKc9TvLj/VsMUYfBm+QlWW60yM9/MzP3EZMJ45cKw7W4WCgLWuQE6dD4PP48Z6b8uTyRtNFHI826w/w8IbVo/6TzvbwnyaYOlvGI7hnuaQAWbSWDxa72cTLBN1t6J6lGM0ucuswfX0Dl9GOZSJP3ASSzmdPC/2+gYyKFRxdv3+jkaFhvC19rT0kZDvI39qsbVvzYnR4RHzz7YjpSsmR5kLzLuCxe8wOuPx5uSCHw8PFMtaddIk+zHFBZvu7i9uwI3OcSX9CZupt+M+aBH8YPfa3gUzcD/7C8ktkYpciCbzIho0ikLe7FeC1HfmkVtsdxKb707Vv/Bntdql5OE7iwTKlbZX1VY0xfQx/HsYgaFxScFZnEk8KWNfN3BNlNI05IohTKXv0Wf3j2DIJR4PnOV1/ObpO8RObbtkwbjk88iWDu5nXSEqPAgK78ZuBAo66qUe5hXFTR1ntWwwKqlruQ/n40deTkSNaeSTTIa2D3O58I+0jOkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(18002099003)(22082099003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bABmainxLeXZTVmDSGNARDxbMkMIpclutSnK+ITvvIuRXAripyuYQV3DC9FZ?=
 =?us-ascii?Q?XJ0mpiSq2uejc2YxFoutpKG9DNCixSwpdb8ghwS+VJeoyPUJeOeOTtQhQUUF?=
 =?us-ascii?Q?4ux/rKddX0wcTbnaVFcb6T+zFNSaCGrEfHJJ56vTgjkuyfHt0+FxJTyM/HLt?=
 =?us-ascii?Q?aGnVUleFZtT3ioZa4GPqzCIcJnjwmCiIOBioqmqalE3LD5rQXLMUdf+PNOZz?=
 =?us-ascii?Q?dr9W3qzTYoY6bLxi9rj1SMYbkmDHHJCbMZI22e+pF4SfV91q0TwQNFtE1v/v?=
 =?us-ascii?Q?zzf05RaVjEFB/i6hflCJq+KLzWlxg3Fd9+UN0BevUFxv0ssDz7XPHRjk7v+s?=
 =?us-ascii?Q?3dfmm3MdCpcHiWDjmG6hmHomSb7Z2nJ+zz2Ez+Fhb324ikYnio6cX7pXlHvQ?=
 =?us-ascii?Q?2Ecw0y1qCiBL4BM4UGwyvBIDMR8Kjkz4v57ZeUYHzn+kupf2eKVAxPA29Jj0?=
 =?us-ascii?Q?pZJGa88t2fy4Jw2zSSdlaGcl0xSCKeXxuSSoAXQbKdYOtcsjJZdzfljyIHtW?=
 =?us-ascii?Q?u9fCKff8OcYyxFttm3LcxN5/UxGufho4gvKmXRx/RZ575v9wuFPYsXgDmJmR?=
 =?us-ascii?Q?XcQfnkG0VsshfFYFPXgLvb0tv5ohUxhkNwC2pbdEIhoP82zWAWPoBr1THsdT?=
 =?us-ascii?Q?OzxW2j5zd4uW1UwJKy2QPwTFFbANeVYHBxwFYuu9ZEH7cFIuSyH3mRuNYDT8?=
 =?us-ascii?Q?3CoTTHfYwqaBe31MMZSH3+JgTzLY4kSp01WzdR/m4Flhvxm4ugL0g7Gt4hTz?=
 =?us-ascii?Q?jYd5S++7tu7pAAJsLxthoDSR3kAzFA7LsSlWpOwwk/jPEO0s3B47Lrse4LET?=
 =?us-ascii?Q?E4g8xhMWpw0A7K4Y6gnZlPpxb+WXVb4jdb/z/YorsfZRvEK40XXGQp8bzfMA?=
 =?us-ascii?Q?Zci5wQdyKqZDyU9KcxvEybJ7yUy9V8eUoTWeA3vyjOy0dcgMXhATZx5++ih+?=
 =?us-ascii?Q?bGg9L9joVeoyEbTNwTow6higwYC/86l1prP3LfpTJxMEH/dzbvNqPqmO2wT0?=
 =?us-ascii?Q?8QjiEpi+tx76igUd379cTOu99TwUfPcuO03gXhuSqSai8uNI5+aNSA+ia+V4?=
 =?us-ascii?Q?OVp5NwBR/ETuFRdQiV61UjqUE0s4YoDnKSjp2Z4B7D29+93S1K7Df+TgNtce?=
 =?us-ascii?Q?/flcmJF+/drVz18PNBDsx/JQpD0+1bhgmzfnwcfjxKdKINgNz4jsqfISt/Iy?=
 =?us-ascii?Q?dih06JpXPPiTy3ulPag1/KIk0s4510TwPtx3+mbChiHOFLM424wVdMy3PsNp?=
 =?us-ascii?Q?nME8ZYb3EHdGTm2p8UNVZHHS0LVAUAkhy0LCiOAXTfAlOAAJNZP9+tM5nz2b?=
 =?us-ascii?Q?E7IiZdJyjrI/qzzowx9QMGeUbEhCdSpvAYg5pfWB3ITJ1vSyVIDhwHdD76Tn?=
 =?us-ascii?Q?KSQdll9ZqJZeV5HC43yvJuyt+6gt90q0gy8LJxEeTvv9wlKBGBexyn9t0QmK?=
 =?us-ascii?Q?/kHYvW9ZQTuBeOvpmZKZxmBwJTT/jGRxPeaIQx5Ps+irYPPD4Uy7mEJZVuPn?=
 =?us-ascii?Q?anQ684cL5oG0fR4d+iQtWuBKDBpgrSwP+l8Ceg7M1Frr3XVBaOnGZ/H++JBr?=
 =?us-ascii?Q?Bjq7ll7NRLg3vizh/XlqLgqZhmrNkD4BpUyvLzPIN0MsW1z8ol2evIshFwXU?=
 =?us-ascii?Q?Lgz7pbWWsHLkcJZDQOg8KUenAfokOuY8+fxz3u0lfYrBSGl6f/AblQazeh4H?=
 =?us-ascii?Q?K+/lcS/ImsD4devuPlmqt15Br2jAClFPJYrj1jFVppPy52MwtL3uXniCTUzc?=
 =?us-ascii?Q?BQrQnYw3qmTxWrmHrYeZWtHgP7ae68rEANW1CIdTFFJiYTs4Nmqr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61be77b4-5634-41ba-8b89-08df3119be42
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:24:34.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCDXRqE1gpmVo0xJCjvCrK0045bzqMhkECUbC4CwutrXofeU7ldogW+g4hjbkCYm+oAxN6mTU20A6VtcSKqHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39

On Wed, Oct 21, 2026 at 03:03:52PM +0900, Hui Su wrote:
> cpumask_local_spread() wraps the requested index by the number of
> online CPUs, but sched_numa_find_nth_cpu() can return nr_cpu_ids
> when NUMA ordering masks are unavailable.
> 
> This can happen after a sched_init_numa() allocation failure or
> while the NUMA topology is being rebuilt.
> 
> Since b1beed72b8b75, cpumask_local_spread() warns about the
> invalid result but still returns it to callers expecting a
> valid CPU number.
> 
> When the NUMA lookup fails, warn once and fall back to the
> corresponding entry in cpu_online_mask. This preserves a valid
> CPU result when the online mask is stable, at the expense of
> NUMA ordering while the topology information is unavailable.

When the topology is unavailable, it's wrong to call this function.
If you do so, you anyways can't achieve optimal placement, so
returning a no-found looks reasonable.

Can you explain, is this a real bug in your deployment? Can you share
details?

Thanks,
Yury
 
> Fixes: b1beed72b8b75 ("lib/cpumask: reorganize cpumask_local_spread() logic")
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  lib/cpumask.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/cpumask.c b/lib/cpumask.c
> index 5adb9874fbd0f..f09632219b267 100644
> --- a/lib/cpumask.c
> +++ b/lib/cpumask.c
> @@ -114,7 +114,9 @@ unsigned int cpumask_local_spread(unsigned int i, int node)
>  
>  	cpu = sched_numa_find_nth_cpu(cpu_online_mask, i, node);
>  
> -	WARN_ON(cpu >= nr_cpu_ids);
> +	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> +		cpu = cpumask_nth(i, cpu_online_mask);
> +
>  	return cpu;
>  }
>  EXPORT_SYMBOL(cpumask_local_spread);
> 
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> -- 
> 2.55.0
