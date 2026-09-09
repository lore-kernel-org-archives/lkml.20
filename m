Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF257ED98
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970042; cv=fail; b=GUMNT9A0GEoGPYsSsac4yUkIMTVg4qZYsIsdSSJLTfmlc+aoJO/q51eCQO41St15FBOiQBjeiqAHHoW12UM2r2T8ihnpBaKP2Y0ef6Z9oNiHTFa3DlnyTxf/gDawZNtXVdZU+ANHzMY/IIonoW2NCJ0hEIUlLbjn0SKbkzt5UdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970042; c=relaxed/simple;
	bh=vgZOCJCAscBh8IgiXfuhGk3oEcrJLQYE/nvVb4hqtVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZa34zA94eet2Ir/8X/JrQYmbHIOdkkfVtDk+jjqEZhwVvEDPcuslx9M1/1onYCsa0rTeLDp5s5nFUndfAUZr0HbRTd8nbr00uRsfGy4vsSSwDfry+FJPtMz1/6ysg2JZunTZA3tBr0vXQ1macnTmNS5eLK9FDFJjOXaf4vlLCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bUBCs9h7; arc=fail smtp.client-ip=40.107.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bUBCs9h7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoWQNjhu7+T5e8Oj8ftu1TIgc+zXHg2Ljtsrme4rEdXL7BfHujupJWGT/LoBWEN2QdlAlbfQVtQIE8y07JT9dFzkTFreT8XQTQseGOdQz4RauupKePzeMhUoqwZKreisQVhGuKXk2y1Rn3jTFokfz+cf9mp/kDDe8VA3BKKXFCIaYfeIrvl16IdzHi4TO+udclsHYRbsYG9Q8kKMEugdc7Z14vOwq/h5gDQ1IFN8vmHrTnNklflvXyb70QQBrTndOJhkvWZ6uOcfsVIui8wFzbFudqEBOfYzIsdYNBNlvDZ3py1aVNepMh77X9gR9yWQN7gkAytdeQcH0AFvs4QclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0VNtwb/abYHvq618oBDPApEthWFfGq7rv1dmA9Ftq0=;
 b=eUAEkJLUguVE3bJCIiI8L/QaAR0OA8ZMYoPZy98fvhB5xM20QiL4Fp2WDI9owwWmwxwnoXeE8Zf5p7S7vO6D/uoaV15mnvqtCBHjGl5VAv2MQe/wLn/jexo2W0xcPh6RZM+cTfRuRBIDzIJaVOKnLsFcPPDJX1QXfTMM8FjZlHmf8dZdw9xz1P4czwLglzHXOql45wJerFaxEJfe1PArNjmjR8uJQXKdMYjGxP5naQ4AZsftk8tfTszm/kAMPw6QO/FvWJhmDa6HzsxKChoYdrjbFbpKq2Z9rCRyqLzzZA9YFAZ0DCphOO/OCbopy9JSWrW+VO1Upj/8pe+Go1A9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0VNtwb/abYHvq618oBDPApEthWFfGq7rv1dmA9Ftq0=;
 b=bUBCs9h7yCVdFIcfDZyZaT7KupBBrCLu1PdSYxBjCTHCOQo5f76D6piqtUhfzePVoytNHM08NBxiguhO1heD0Hvg5Re1lMdqr8B4FG1TAuk0K1MrrjE7mKAu5m5RwakF9gYwW/xPfilT5LeUkWKWo5ZW40eNG0Zw9Y4y1KYd0dTc55xD6iAgS8qbmYHe+hIDA2Yaq7qOAv5mY99LqWE3VtLFb+4RD4D+FoNqEH0fLYp1YCkyOAHS0PYdgPHX1vJIEy93S2LWwv2KdocCqxWv2CTA6XIdG/wLbUaGP3TpUC/hXFMrmplI01eQD9pKqqtBp5RKFprTfGXi86OVzMWLWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by PH7PR12MB7842.namprd12.prod.outlook.com (2603:10b6:510:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 16:07:13 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 16:07:12 +0000
Date: Wed, 9 Sep 2026 18:07:04 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aqGEKHfxcOzYiuBy@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <aqF8euAA8wLmr4w1@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqF8euAA8wLmr4w1@willie-the-truck>
X-ClientProxiedBy: MI1P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::18) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|PH7PR12MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f0d25a-32e2-4ece-a060-08df0e8c68dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|4143699003|5023799004|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eTd4Cvt+yyJ9dyObhS06SbtJ3HYG5IiumdmRpDRSI01ocee86xpo9t8ows8EogtWYw9DExTdySz1yQrgF73Vm7q5scOlaFgNRqTWk746s6pwWX2vQbecG+zPeCvlVHWBGXwxsJOss1eN0Fa8fzSnFBGo49xGATfTPOZum2Wd7AGnMJ8NPVGdYg358x6AanRNUTRQY282nHF7NQfXHxHUDcj+z2kicQ24d9HTuVnUz2jJDc5eoCQjbTT+u9oLCx7sDySRc+hecVxwYKRuw0bWZn7VpkC/I7olbnbBkzGejm20W1FbYp7P8JVKBYn8blQWkb5h+o8r214E1/iFed34Wi3i1/N5KgnlnDjc7F3YGQjm26auouyRz9ORxjbXmpruDhzt1XxU1rj5Qnhlc6XZG+RB//jwun6TQyLwi1CA3T1BpwkbdpQ6dWsQGEd2oLyyGuAiBaacHclIfDE3JxapZE3DatV+8AaeKkQqPTm2EzrZv5A2q6Rl5Jhh4KorY1KVF9AhaP0BJlfPirXHG7iM3BzvIVXJ+6VVtjQcZgvzJlctP1Vw2nxUbBS7RWQQebYtvszsGn7746Gp5l6VltVMQl1eOJkkPEhcUWJgHfMF9zsvnfLl7+nwtu+7+9HfgVdrajGIT1q+M5smLuTXXqNmM2iyVI5C1s3SABjTiG7h7PE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmmEGy/oBPHS+jIa3hV+7KmqvOavqa98AgNWuIwPFtK1SVARamLprkAQw+Pr?=
 =?us-ascii?Q?4L1Hrdpq/LR+YjefIgADbWtd8d/MRAewO8sHG1b+EEgLNoilk1pF0U7vJE6S?=
 =?us-ascii?Q?VCT3WmYy0V3JhLJNG2R/4Cn/Ml8UCBhOykms8Y3XZjE/bomZznJdhlfxNU2t?=
 =?us-ascii?Q?5zdNzEjf1/rtHJXojyHONjSPwMNAhrixK/XFDxMb+Tg4iO3OLH/fP3d33Puh?=
 =?us-ascii?Q?AULXRFkzTS4dYzP8Js/8u0xDHwz+JXTQpkAktXc4ANDC1t19kJKdmM9NkX0V?=
 =?us-ascii?Q?8AOynwo7/Q93UGMCK4Ye5ZqZOAkuMpsielkoqD5oKR1A5K/5o3U3LY/JYqS8?=
 =?us-ascii?Q?hvn7MDdOm1TS+6faq4vT+ltFiGHmgmAKFZdPnx+IUBWaBSahRg426KQjvVaW?=
 =?us-ascii?Q?cz0e2hEwwgAQ6C8wT6u3JREabOrY/Yho96Ix01EV/jzmy9QcE+UPQGaOjMfb?=
 =?us-ascii?Q?Y573AZ4ZgCgPU8BiBT75lS6hJWh6Gu6AZJ82qynk9Yh9nMglf+VU6mj59u/P?=
 =?us-ascii?Q?K01LJW0yuTnZ98isCjhhjV3E5NgqbXWZ8fp5gVCcjLbr/6lZ9xN0qtME5fQ7?=
 =?us-ascii?Q?jlzhfA0jMbdvUIMT6WSMF9n2MRF4XtZVUiQxYNEtg1xps1MZA9/pxzFdf8NH?=
 =?us-ascii?Q?yamC/8v3ujr1jsr0UbDjt57UT7rcCW+xGYinYK/GluvUCgZ5wZLnOVDXttO1?=
 =?us-ascii?Q?VIoK6PJwXcVtyyFoj9HTZhlCPOh24lgZfsKRQQRO6va27rYa/5dtFE2igxvi?=
 =?us-ascii?Q?hn/EJsooOVLEge6JA2SceROPm6tx+Vke4EBtsspS1+CQOTnOqGksV2DvODQW?=
 =?us-ascii?Q?aUt8GrXzb0PebywHFgWH58t5PWqDfY1oZ9jMCcEPkg+ghNme2RUI0kWnTGEx?=
 =?us-ascii?Q?+irayEBdvifgr1VTW6koXIoEzQkKokMjR2yGS7MkOkR4cCVli19WAlXGHTtO?=
 =?us-ascii?Q?zeiQPrG86CmCVwQRPaKoT/cqMbFs55/wZ2zgIhzv5T3PybQnfWESMPBEcYQB?=
 =?us-ascii?Q?b/tMfRvrc8slaAMC2Zs7Zlst4E8i3umWn0pcz1SYDvmV1IwgzDybyELVZoiZ?=
 =?us-ascii?Q?DfPZQC3FOzb+rJL0qWTf4TVrJKUogpCPwtNKuF6deOOHIl/uFacSvcbeDi72?=
 =?us-ascii?Q?w66kgSLHxrMGyk4vN3ZD25VwjzDSlyGmJEqi1jIJGFEalkq8NMPj1IJtkvq0?=
 =?us-ascii?Q?qFOTSrFYJWAPvDzMCWE2GkUeEQ0RnYHH1Lef0LK6PM24suzqRx+XbaHOgcgh?=
 =?us-ascii?Q?h4l9nty6motEt0aWLtNGl2lv6VM8bFg0JwtK0ZIJUCvBfFgoMgAc9YoNxc6b?=
 =?us-ascii?Q?4LW7NtaSl0RHnXzTY6uEVG6QGCcs6GgJQJhgHWfxOMHlLDxjal+9d9kdgATd?=
 =?us-ascii?Q?hc/BPFBQA+wtrAmygBNUtw95u725nhjbY6X01/90VcSfJ+TRv8s8176lkd6W?=
 =?us-ascii?Q?qC7ake6t0/Xp4YJmtMcYBttLFY97OSHlAbpLk1ke56zv0gXwsUSuz1QKZEOo?=
 =?us-ascii?Q?H5qD+rQ/xcIbRxQNpoayUVMSQ4I8RSb3VUUUB2awx0L4HTKyh0j6SxuSOESD?=
 =?us-ascii?Q?67QrgBzEGgEQeqRK+CDz9UFLMD4MA3DUhQyd4CssHPqtsK/htC0IyGMjq8i7?=
 =?us-ascii?Q?fJ3ykjIgDUdhSVs8PmG63nTW4Pg7FBIBTlzOa1GHUvpY4HfNjNxDp74G4DjO?=
 =?us-ascii?Q?ZmA1mxG4iykKpkhZ0wGNo8JdMQFQVd2GZJj+r4snAfjrJrGVIFDwRsImyond?=
 =?us-ascii?Q?SHZY5qKFMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f0d25a-32e2-4ece-a060-08df0e8c68dc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:07:12.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rciWy1+PW+rQPHCNBEyri6g4RyaT6ulVrr5QJMuC1sIIajNodGupgrLwOu1rzPi6Gt0tYNprNOiHvFV2JZcpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7842

Hi Will,

On Wed, Sep 09, 2026 at 04:34:18PM +0100, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index d28438f8b83f1..e5a7a4b2e3844 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -19,6 +19,8 @@
> >  #include <linux/init.h>
> >  #include <linux/percpu.h>
> >  #include <linux/sched/isolation.h>
> > +#include <linux/sched/topology.h>
> > +#include <linux/smp.h>
> >  #include <linux/xarray.h>
> >  
> >  #include <asm/cpu.h>
> > @@ -44,6 +46,55 @@
> >  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> >  static cpumask_var_t amu_fie_cpus;
> >  
> > +/*
> > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > + * two-thread active mode, with resources partitioned between the PEs.
> > + *
> > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > + * mode. Firmware does not currently describe this preference, so detect
> > + * Olympus by MIDR until a firmware interface is available.
> > + */
> 
> Fix the firmware?
> 
> If we add this MIDR kludge, I guarantee that it will never be fixed.

Understood. The existing PPTT already describes the SMT relationship, but as far
as I can tell ACPI doesn't currently provide a way to describe a preferred SMT
sibling. Both PEs also have equal isolated performance, so representing this
using different _CPC highest_perf values wouldn't accurately describe their
capacity.

I'll drop the MIDR-based enablement and coordinate with the firmware team on a
proper ABI.

In the meantime, for systems with the existing firmware, would an explicit
kernel boot option be acceptable as a fallback? It'd enable SD_ASYM_PACKING at
the SMT level and prefer the primary PE, but only when requested by the user;
the kernel would not infer this policy from the CPU model.

Other ideas?

Thanks,
-Andrea
