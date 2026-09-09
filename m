Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816D57D221
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970660; cv=fail; b=EWjS4oCRUsO4ckDiwdowALF3TKQoErqBBA4RCxGVjQn1xXv3rGnrWUlCDdZSf3qn6sBGPANjoyYZPvPqW+kF1mn93kbQUnmo6+pikPun8ZiIfoNvTFTIZkg2uDSX5WVO8tLoher4Nwc7dtMGNHA9CqS5h3rDkOpnD/+lHljOtCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970660; c=relaxed/simple;
	bh=MSrE99o3cWHrIW5zuvFUCW+hSuvtjpKw42VRwlt8HPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FZ3Cb90pLXVeOvN1AqH4yv5kxXLCakHjl2VJXdLyewl+UR0brnjr5o+2mMdfeak686CKYXNWNeXL4sFDcYDmj932a8jPFDLFYTQeHJDAl0C6Uv2rxJ7tNHa5Dekga+Nejg8MFabFUMh6cW8FCyXoIcLIQgQBGTIKNobhL0PRpFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nb0n2jF/; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nb0n2jF/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmV+U4G5lRNagGXeujOgMeSoIQRvUjlryN4J/78wqMINfRP06YdezlsObdjQFjzjYxKD1bSu8Y6HJw1IVCm4wfDzQVdfB7p03O3mj0pvn03oz+1bw5wh3MS6dxSVkOP/DaSkeDj818l0KJ4CzeWx/+KSPp8OO8XYngkTn9HEMMjcQSpUiE0bsWcgoc65+1t8J6/kH2ZciHNRZtDwGekWYnrVVRpKlTwcjD8Xi9pyHwEvfml5gkDO5Xt9wgkXQd2MF39To73L4ddZTVJdnWAypr5g3sv9Lw+YsxSR1nySUbzbJpm+Fi4uB0QfWjJVIarU39BROxF/KnthA9a7MRJMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb62NBFhRSwz/uL/F/hEYGQyERgKZwxiae5skJKMFgk=;
 b=SQLpJ8cCWprf0mRpBRHOH1iueCeUBY1u0/O8apEv1N89A4rp6HjFobPpve48BDpoGkaqfKlHVPW1xN5o1y18b4J5n780uvqyq0bt4qxCBYRBXw+1OamaeI9L3yhSbbK6rXDo4fsf9Tnj9xrP/ncCqlgJP0WEIcyhrjOxVTY9AG1Nso80j9xrxw0pq7N9wwJOK02qd6hXBPx8qJkVira7KXgIPf3SFqcsoSlwHICThLuocsc0WQUKdLV+CnpaDMV+NZGDdRpgDC7YaIKgLvA0VJOoH3ntonvVUfWfiAwnhy2qwFkpr+Ej793V1fSC/e2fdMxkUBwFnjCGyZiEgJlGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb62NBFhRSwz/uL/F/hEYGQyERgKZwxiae5skJKMFgk=;
 b=Nb0n2jF/+YhWeQIMjOrYtawbRlXDnH6530o33gBVk39PvnnIkX6i4fVofr7uWpqWual3q/WazmB8tJISG/VmybFEsIjmAySaADRYO6tOyEdX9b82a1SeuydTv0xXoU7dSuFrSKOGkM92GIp6IHoV6VgdqNxPFt1Zpo8WYRDyeQeUWAbtYhtlEeYOTiix6xdzTXjbKAnQSspYruKQjANYxpm3TubYRdBr5CBgdbPmIGTABgge2ntsp+ntCLelFIzJR2UKD97h6UOCyIii5Lus0nnT7dG9iaowWhI2IKIl2vj8ICefmLdmBquD9pRpMubu7hzXw0IQzESuMgZpQEryjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:17:34 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 16:17:33 +0000
Date: Wed, 9 Sep 2026 18:17:24 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqGGlNce4TRLS1cW@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com>
X-ClientProxiedBy: MI2PEPF00000B83.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::419) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cdefb0-f1d5-4254-47ef-08df0e8dda9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LrWfctAf3RsAzAkqfsTjvv6YViqZbq1cna/omHK3LDb6daL2FbaRdFaQF0Y7SE+J/pbOfPm6wksD03HowCFooRmlwie1RHowcfzHjlpjmdaW2hozPFk2Lwed2RgCvA6+P/jwgDQ2ik8S9HAF80yXmquIN7tWiFrR/L9BMewZTRasnkViOMnwYMCm+GaSewKwW01vlIdli2LKPb4NuvyfsiL09Fd/jHKrmSe27dcKg6cXCBLHuw/IezJq1IVHDwnkdj2QIDuK6+aL2q3m3Pj5GUFCJy4ezEaJdY6j72OH+e5OmDs2FtYkkuiBqNMCTWgz3O+Pr7zmYf7OKAwNygHhPj9nvyKwgPeJVU/PzW148M1eZbiwGyLqNHduI7rh39M0v3nWQo6rowQFqPqeINYbjjnqGcD2sQe8/At1jS2wXtKccP+xi2zLCy6+6XsqjlYui9KWwls7VYl7BY0leMOCfjLo5gqkU91ZKGE6mOSBET50iEZZHEE1dipB/Wdiii/gpUv23SW9DOKKBJimAq4vx7ji1YdspqEbJGAjGuTK3PsnqWQ3WB9m9AU/dQc887Tw2I9JtnpeyYnxeCwQiZoL3o/L86w/5Sn61LPatwet6gfDuinpFrTa66DRWIXLPa1hfoDwkPjjb1y4Fp9TmorvQW+qY+hCS2a55ie0wx8LZ6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?453qI5CpEEIwv+Z9DUyArHxiiZgMGRsjrqIGZ7HZZW7MME7M/lwCTSrbR3se?=
 =?us-ascii?Q?z/GmfHQtWYAl8qe6kSeKrtlE9dWUA+ZW+yI6JHOG8YTeAzCCcSZK5osoYjR3?=
 =?us-ascii?Q?E4dg7FnougOZfOpE6/Sca4tcanoS+jRurbEm2TObV+TauyLjH4g/d2/Muk1g?=
 =?us-ascii?Q?9g8H/pWSsf21jH9U+wK6kpNgC3ENqxHNmfQ4H3XoMLdB+NKteAngw6b3k4fP?=
 =?us-ascii?Q?I1SXmSxMgbz7ytQP/652W5dFelCVr8kawasD/Wv7P0mZqEtL5mS1HY0UCUeH?=
 =?us-ascii?Q?MerTrbx/qiyePvj8XOR14iIvEqAJm1RzY1cONosSt8EW6iNJVfRD6iN39E90?=
 =?us-ascii?Q?w+l30rTK4/p9cG6vJrwYJgt1qEvTG9TKqnuXvTL2qKZ6JuQZvd9QVckilL1d?=
 =?us-ascii?Q?SovwCyqtQHncux/clRpSs/mNbHv9xPhn+zoIQxf746mVz6GdwsggYIejGkAp?=
 =?us-ascii?Q?qtOEm2B9bjJTRObb9TvWwv/LF2tyeGfwIOPTdnn4iTErcLnj8RJkZNGVNijA?=
 =?us-ascii?Q?dYrFhzZvaIrQrkP1TV1MmUB9VBLziVJEQafZbtF1MzbjLE9HBYbsBTbGXK6V?=
 =?us-ascii?Q?7rl/TdmrFa8tyrCNdLq9uretWjYomsVHxxkbi6xX1840ayNGf/u93NOjfLxm?=
 =?us-ascii?Q?19P4jSkLI8L0Ysc5kG4l8czH91shVfxSiG70WbdSTayDreqMlH9aEB9Kg0ga?=
 =?us-ascii?Q?zFgoOBb0ussFL+2V5AOXoQt00hvJ38k2M2T6iIyFD0AkGhVmK/3FD8/uzVfA?=
 =?us-ascii?Q?kYTXqcVbhGrVihwsev1TKU6vzLYyFfzqVPmDvxtlch809kT/m87undpxY2Vt?=
 =?us-ascii?Q?YuSq3/O0DPU09UpeO88xEPJ3u3xEIt3/cEKPjrCyyBJSsFtclDO7WASH37L1?=
 =?us-ascii?Q?gQJOAGEl2LkFRxDehGbiu8EeDPmjfMMbya38SjqWWmprNAUgNqroLyUEud4b?=
 =?us-ascii?Q?rjKdxMVvw+7CN2mXVwb56NDLc7vPRk6DnCpqRjlI3AuTNmMDzET4O6+KeRBC?=
 =?us-ascii?Q?2ernysdykHyKjdhH0XQj5qDkH6r1LFANqDQe3vkDILYTXERestoOlL/Ui8yj?=
 =?us-ascii?Q?LGFCXG2mKfLN4hJuMliGC2ZTr1I47rs/WuOMLVFj2jOg8Jw8NetBXq9OUlis?=
 =?us-ascii?Q?vkFwvIzYVx9q12buS5JeSsmQu3l7jM95j1a24g/QdQqU9cLuOdzvV00+oILP?=
 =?us-ascii?Q?5R/MJ4MTYdL+x6nsndNHbaaizbvrRuSrPRFOw9L/JM/W81sGGM1s40rdrwVn?=
 =?us-ascii?Q?nVSsEN63gVm7OnPrH0uyjNClKZsXL1H/gACsj186N74dq9VHd7oTYHrDBoWq?=
 =?us-ascii?Q?gtLUHJENQGfeMEqWZm/Lu6WDcgvm/YunVL9Uzwhx5nRjEWILSOCGkOZ93G8i?=
 =?us-ascii?Q?8CIAmyDt8ciKAQdgOI53tIhYG+SfiYzoEp2Qj8zqM5LsgmEaHrTwQOARBZ8X?=
 =?us-ascii?Q?OJv9yN3OlaIBj3T0/INXpzgytF6oQFi/+z5TIw6/+fvxMBaiZsA/H8lwke7i?=
 =?us-ascii?Q?gdeDJrFiG2bVnBi+TWNQkt7iOjwrmG37xwFvIxCsChdFA/nFKUBlH/OMZzzv?=
 =?us-ascii?Q?Xrf2OchVjAU15N3i+fW3QFeiMutTb74WWawYzSV1mpimI5TcO8UsPw9ak0NX?=
 =?us-ascii?Q?h839aWfY4gfYypC9Qcv1QBg6VpndwAxBRqmgXnnqDTf/hNG0FDsrjHiIc4Ph?=
 =?us-ascii?Q?mEkE7vSDKoCiXubNqV8x4bS16rrBrRMCd2PN3nXsEHYjE+55EHR32RRmrOL+?=
 =?us-ascii?Q?DwYW5M3G5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cdefb0-f1d5-4254-47ef-08df0e8dda9d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:17:33.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeehY7F743vYFy4OMhIg4s2aXEY9RfIOaED7xx2KpXZev/+pZni15aN9Iyc1H69J8KKNVGqvbyWYwfyZvWxIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091

On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
> On 09.09.26 08:26, Andrea Righi wrote:
> 
> [...]
> 
> > +void __init arm64_init_sched_topology(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> > +		return;
> > +
> > +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> > +		return;
> > +
> > +	if (!topology_core_has_smt(smp_processor_id()))
> > +		return;
> > +
> > +	set_sched_topology(arm64_asym_smt_topology);
> > +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
> 
> I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
> alone here.
> 
> > +}
> > +
> > +int arch_asym_cpu_priority(int cpu)
> > +{
> > +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> > +}
> > +
> 
> This is done since it will only be called for NVIDIA Olympus since it's
> the only CPU model enabling this. I think it will work but it's still
> ugly :-)
> 
> [...]
> 

Agreed on both points. As mentioned in the other email, I'll coordinate with the
firmware team on a proper ABI for describing the PE0 preference. For the systems
with the current firmware, I don't have many ideas on how to enable this... a
special scheduler facility enabled via kernel boot option? Other ideas?

Thanks,
-Andrea
