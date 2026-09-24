Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3C4A688C;
	Thu, 24 Sep 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263879; cv=fail; b=i33JNFkDrdAfLKczFo59cClPhBM9m78lxXRu55I/4US+4aNm3M6BGE/ZU1FVmGlaz3bWVuOk+r5AFLGoNUYHgaO3FVujXqSriEx15j0VfDAzD8Xj8H1PeX1WPYWAw23T1Bl89VnDz2ZytnBx4deLbNgxIlGdReWdfFJl4I5wT14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263879; c=relaxed/simple;
	bh=OSsHcX/4+opZyQqtwVxIN7f//0LjYqW9mL19iJIIyhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PCNnI+VGy31dUty2QdDBVSdbh1o25fHgmffvE8TKemY/CVqaC1MeQ136TDKSVllDUnXnZv+hGpJe+3Y9UHCbuhi5x34SGyzQ5pQBkad9tNHeyx7ZzxXypL5vdSi9vkd0fsNmhV97/qulhqNELjkG98hSYr49C7z2zzS7u7IQTAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g0BubkK3; arc=fail smtp.client-ip=52.101.46.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g0BubkK3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqOpEgLunO3emOyz+Otx8Et5Oqff/6ZvOF4qT01Nv39O3GL7vJgzJMqRtqT39VzR8sWO85H6HUGl2iItCudszLWV6gLhJsijEqJCln+8TY/6eMyFlR//Fx8RNnvDDRh3pElhcSeSav/1s9KYrC3FhIibHX2HaXMpSGRS7666fN8DqPKaLWTI/mqVIUxYA3Ipi1TGmXW5nOSwEs0rC3J7NAeV9qA8KEj9qs5bWgzLTb/1fR4IE4KcYOVFtHSyAhtBLVnrV44OFc8DXngi0fsmN+Qy71LrPrLpYKOe/Z6QJH1+boF0yR1MBSAi/GXuO3bU7bxBproJEhFIeNttMtxqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUk1gnqrZD5mD/u81nPYqoRFE5M2LJYEKuNuHvCBEVc=;
 b=qMmlsDslXeqkkLxq4SRnhAFN54IoqPBHci+3/ZyDbLjlkhteJ+ptIaDKwECxcwLuI6e+fzwOduqhNuNGQPoWcghDwboM9DZYtpBzuuMZFA7YQG6RWT6Q4ngggh7Cumbog1oytYw9fziyVQ542V5zoDx1Ct4WwcP4Q9LevOIIolpgontysGaHH2ul8yqcIFhyPnBmpBo6bul61nS95Qyjghl75ZMxS+b4//ThX4wrBRZsjQGWJ/OXfq48YfGDkp1LWDyz6JDYoee4rMGFCqBT66c5D5qmBvVW0DF2HV18MnwRQ5AWbk7/dMc1EiJT4dbFpk//bIahhPf/VL3cCK6esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUk1gnqrZD5mD/u81nPYqoRFE5M2LJYEKuNuHvCBEVc=;
 b=g0BubkK32rj3GcT+88DiDQmTGThB494g7yrT1eM/NjKe/dA26PlEIQXczb/gyh30/U0n/z1VkvjlYy2/BNr/mNTKN/dP7eTXL8aPs4qGvlj/31eQfMLOdHBlsAfcadvKnbabC/0ryOu2PxaX+6M0dd8bSyoZvc/8F/sFU8s/1OI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS6PR12MB765380.namprd12.prod.outlook.com (2603:10b6:8:411::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:31:16 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:31:16 +0000
Date: Thu, 24 Sep 2026 11:31:12 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] RAS/AMD/FMPM: Make max_nr_entries read-only
Message-ID: <20260924153112.GH1080284@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260826035314.1536340-1-qirui.001@bytedance.com>
 <20260826035314.1536340-4-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826035314.1536340-4-qirui.001@bytedance.com>
X-ClientProxiedBy: BLAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:32b::12) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS6PR12MB765380:EE_
X-MS-Office365-Filtering-Correlation-Id: 20613ffe-c6cc-42cd-e735-08df1a50df92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|6133799003|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5oGHl77A5IKYGvNC5D3uA3Jnaz2FMA4o0q9/cyvOwnZZHGiMR1hwayO6XZ7v2FWvqrGFdp6Tvk6Of3EO07nJQI3I4ZSy05XJ3vaz9AjX/p0iZBMdYKiw9BlFmxyX5rv+sM2b82dW8SxGtYjGEyy1rlJ0G4fo/YAENBV2zwlDad7ma9kNpy5i/xQSC8cqBs5k9C6afaA8kkPa6q3/Y/t4Qdmz5IFLQvRCeg70DLwMyWgOIINUb0V24sQBs4X6qVwPeWmowAgELXiVE6XqJejkOFn8X/P1Sh+EedMKLQ8N60ePLvTSmapsRyoLSoywC43x+gFHUkRQAsxMQswvMBMkR8kGHh8jtR5MsF17SoWw7TnMrAm8LFvSH9fWj2TSTxdgAbcKnVQglA5U05x8v/2lQp10YUbeNnj9kZ4/d2UzmO9G2wdPRHEs7oygOdFWd/2H5GXxKnJja3XayM2ir2pQL3hHX/uQeNGWIB6dWKMJpjpdRF/BB5HKLrNhgtWLvCEL9JGq4FeCwaijZLvtDFJ8wH/BJ/vLK+v7yvVmJ2r5ePunIgdetucpedveOkM1O7LT+abcB83a4dcE1NG9ASAoXVto5oTMJ97Ud9yyw2m8hPe/jP0dWUTK9oKXQDe2XrLJDSXV9PFljWY0TFkMOGai8Tx0rBIqZRGcWon1Mg8maDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpMMttazqx6lVOzNsB5rtokThkbHghLPyR9l70WIUkM8IdTO9n06zVm5BsKg?=
 =?us-ascii?Q?LHbjKVUm1qLTA4hbSfSmaXmOYnxIAk674uxWRN/daQldgINSw4+EI/xUYKo4?=
 =?us-ascii?Q?zFbgQuRpK1UMJiL78PnnwRzt+9Rvr9yEMbUAby2oduN24+WkbvP/JPNk5mPA?=
 =?us-ascii?Q?kUAPM7kYs+uaREpSskP6JBD0nezuGngxjw0tD5SrXAXjdDVIjhhdU3Y0CevY?=
 =?us-ascii?Q?TDz3wLG0/xQ51HyihT9qeDoiVdv6Vep6E9ccbp8CrZM+kSdNuKr7Z6opeb6Q?=
 =?us-ascii?Q?EDaAj1U6f8U43L8f5E+vk+VnlwlTC2XQAau1lG0MYkoaNllLBEa8Y2wwd0l+?=
 =?us-ascii?Q?LAtAG6/FAC1W6VrKfpExS8oZZ1ul76JjJA59GTW/80T5oUHJ+TuhHIdOcs0A?=
 =?us-ascii?Q?YSbhqVd+Ttwfhl9R7goK+QTmNmjyZyUlYbR+KY/zdj6u7pwjePJYzU0GhDrA?=
 =?us-ascii?Q?YIPVNmPrWlBiJume2e9rQkr6ST3aYrCc+EUm5x8u4M6se0/KIJFFB6d7RlYe?=
 =?us-ascii?Q?1CPWrCStZ2/3EDbOvyePoZ+1sjg5Hnu15P43lMOgN++iFyQS1eslNH5fJAPh?=
 =?us-ascii?Q?GPxQg+oqel9MkWizjlSFWM2Ih+DIUa90WRnUHrdnW12BAaFl68qeX8SpbXkY?=
 =?us-ascii?Q?syUridYGAiPSV5d05Ojd4J7xJorZ9+2VvS/b3z5dx9yPV9fiOe3YV5CzzVaS?=
 =?us-ascii?Q?HNDV1gx5ZhQXs7YvMWpnhZ9Vt6/trjJFZCIUgIChcmrs5s89jp13rFPrWARU?=
 =?us-ascii?Q?51wweK/7NUkl16PVWThp1mJ02Cj4K8oPAO2VvnIetaUEg9IGr4B2MAsZyrlj?=
 =?us-ascii?Q?IMmcbFm0zVhA0wB6COZsXO3BO5dLvfHFO+/zUUWsrT1dVf5JWY/ZnrU0xuD6?=
 =?us-ascii?Q?N0VGxSV/tac4GjvitbMh1cyM6UcuMMTcoCL1QgmUjTxJG/atZCYEC9sABpVV?=
 =?us-ascii?Q?MMSyuQmqTBDTTjxa6ImAozBVSCS1CUfqDQ0z1VnvF3oJHGM9QD7PYrkW1Sfb?=
 =?us-ascii?Q?iYWpbxxIIHUpBjCUiPn2t4VkXvlsWPvgfLFYEdWpOoqfo+iVUJtufwZqKSdA?=
 =?us-ascii?Q?fJcG0dqQUYOGiizQnB6bMLBdJ7cIQZXi0X83zDz5IjBDuE765h3CRh45YWr4?=
 =?us-ascii?Q?mpzgk4fzFdHY/qscJKo9rJK8MAzerY8Fy1iCvpw2WLq2cUmisO/iHlTnK0MV?=
 =?us-ascii?Q?ltvqsJNWV06+dMMOuzB9/YVXZ7xt+ncp6nGofO/noozQDBwk0szO33pfV2tF?=
 =?us-ascii?Q?nh4eJQ/igP0HHwcLLVY5U+9uwf5/u8mleknC2XgSOZfDmTR438j5hekql4b/?=
 =?us-ascii?Q?K/vPGFDkGrG0GJSVatlOhpB1AEOrBNXvtb7lopeDbRS1i/xnBI7poeWfFoD6?=
 =?us-ascii?Q?yu7Zymexxod50EUxJbqcCzr7NY+q+DXVyeIyoIG+lJsgrHbUEbDUylv9CDbq?=
 =?us-ascii?Q?xiHrYKj9Yer8h7xDjZ7gK0vIWKaZvWSV/+WdzQ6slB1VKyiQNXrvLX4do2P+?=
 =?us-ascii?Q?+Y7ZH2DZXvt7Wk6Q+Auvf+NCwr5YvSMzXkcn3FKcY6tS5GQPJ2xYPQAOLwOw?=
 =?us-ascii?Q?95Xop2FLXyATxns3Emr2K+Qeco97RwWy9WrFDNaORFDLEiu79h7PxnC8mG0y?=
 =?us-ascii?Q?zM97Cq3/Aw8O2nSZXjyJJQTIA9/K1rPQ1MjydFyPs2RM7yChehtM73aTMjoc?=
 =?us-ascii?Q?QEQGVN6NkEbH17X4ev4Qfok33d1ofv7qE4RNWZhL+NJtaeYp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20613ffe-c6cc-42cd-e735-08df1a50df92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:31:16.2548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Yoguj3osf9F3KiEGcHjICcXhvI88wtkW9U7GZiFhsKJlWm0gdDza4cKj5tnqOMCO7XnJdtuTA5b60dxalybpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB765380

On Wed, Aug 26, 2026 at 11:53:13AM +0800, Rui Qi wrote:
> max_nr_entries is used during module init to calculate max_rec_len.
> That length determines the size of each allocated FRU record and is not
> resized after init.
> 
> Leaving the parameter writable lets a later sysfs write raise the runtime
> limit used by update_fru_record(), allowing entries beyond the allocated
> flexible array to be written.
> 
> Expose the parameter as read-only so it can still be set at module load
> time, but cannot diverge from the allocation size afterwards.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index e3f7bd053479..c13db1f743e5 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -138,7 +138,7 @@ static struct dentry *fmpm_dfs_entries;
>   * No input or '0' will default to FMPM_DEFAULT_MAX_NR_ENTRIES.
>   */
>  static u8 max_nr_entries;
> -module_param(max_nr_entries, byte, 0644);
> +module_param(max_nr_entries, byte, 0444);
>  MODULE_PARM_DESC(max_nr_entries,
>  		 "Maximum number of memory poison descriptor entries per FRU");
>  
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
