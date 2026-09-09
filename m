Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB623AEF2E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936080; cv=fail; b=df1UmdX4etg0IjAkw/xIDZPBVJhg9PV2HzIqVFfeFE2oQDyA7L2U7dkpDLNAAR+LphyIfeLMZtkW0+MenjfmpKQU3M/tSuSsSRkAiIRkOl4oT4GD8d39fJpSYKT+W6dH2aIkpotFzvG7rPEu8hGu1Bm5e3APBAStcYtz2HGbMys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936080; c=relaxed/simple;
	bh=rvP7SpRTMvdO1rdHHZjnTCwNOietixwKtn2+WxaE66I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SJaPd3BQ2De2/AmD+SZI3yMQDs1zisNTbM+6yo0nXsdZxR4d3csJZlxYlMfAjlduxGsjyaPY40AudHsZbWNSGEDmT/BwXGxJbZnjo6N3jzm5Mk+NKkT+BfMs9Op0c69L/AOXqWQQ9gQ040C8mVI7TQ2bWKaOZehDN5QqgQf7j5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q8BeeCtw; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q8BeeCtw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRa2sLw9l7qff4yOMX180YxxKbpT3O8zQ8lNNwVgDKlq3S8O/3VoqswjV7iYjnfhL6c2RWKW7BT+sG8S/5TUnGyuuR1Ba7FV1YipXOaNmg4+lmT2UVFS4NItG1zUrqF68l+p/gVKTrOj6PM5lzzAfjVUuw9A6To8fwvkc9RdFqjTh2l8AE9DAPKjO/V9dTqmo1UQfEqLT+cu4ompxZHOiyAofG8RxOEQ8YJ8X5q79IW4z0AzTRPYuUQDg7MtP+vxGx02MCegslFv7VtzKAXrIlbB+lS68nUQS4nWDGjfrln8PEsy19vrbaxHwfxCyhfK3+qRMGZBo1VqzzD7xV6vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn8S3sK6fk973DN0z8O9L55uE5FRGNKuKW1RUhUM9yU=;
 b=UdMXxXh+DjA41rky/3PJgjGDGZ5E+gMsjtQ05HhQUDR4HUqempqSPT36S/EnIXzYKXM7HfSJuhxWCcJXCHbGUi0+ZWHYLEDR7nIXdW3UGAaI92xBQmcKO3Ro3cNpIG54fmiXIPK7aNwp+a+GidQMEimiEgHqWWS8efBx6ULVIQ9uheLuiBOfqj2oPnjImIapyM8rLxIRPZSvUFIBITf/4LrbzGmFVOSWwowtOLRG4hH21saQyLA6byhT3MIBpahEvonn96dWnS8iyYAf+9tKWE8AkHf/6LPfEpM+Pbo46t2oFi8Skf6ShNJ2Ja6B2ChCdXS46tYTFmoRZIp9xdzkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn8S3sK6fk973DN0z8O9L55uE5FRGNKuKW1RUhUM9yU=;
 b=q8BeeCtwqR+vAG9DqnpoXR/pOHR8uJvxxEeTDWbgJmCfhChfuvFr3KNUQE0p4JZvJOmq0PUJz6hUFqPuxv2xprajiMYoKCUekBRJawVDsFtHOiHydcs9FT4ndTMbfW+PYuVbzVn4zW4sQ1YROVh/v53e6rn2be4yWDdYH2g5o4OZYrESFPpekBItje8FBYLQU/cGSav7lT9Mk3bvNANH9BFix2gvznFMvAQdq11gOHVggwhgYWikzCwfYPoyeOUGzEt8hh+1487HXWvfYHbNOqFk4HASY/BnjAEsb6eytjlPVm9SoCOri4KFjwSnDAkgVbylBjjRzml4v9rSxc4j8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 06:41:14 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 06:41:14 +0000
Date: Wed, 9 Sep 2026 08:41:06 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <aqD_gpvJOFqcmlmg@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <ed191145-d58e-4463-8f54-a7bb86cce646@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed191145-d58e-4463-8f54-a7bb86cce646@amd.com>
X-ClientProxiedBy: ZR0P278CA0200.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::11) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 532a9c61-47af-4935-9ea2-08df0e3d5849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tqaDF+kCmshCT4wCugxa+kYTUo2c3O6yvdIfghsRBFUci1xy5B7PiTppEvADiT5PNf/yOu1oRpSdH9IkbY8xO5JZYTnRHb7q5Kj7jZ5k3v39yGBhBdr3m+mRT6f4ZOpSVf/1dYn2hBXGZvp7C+Du8JyD/1I4iKqP1hyk0irG/VTKRmBIgZ1Y056vz2UVya8/OEESN6FsVUcDMbOQNxcINV+o0cFSOnHfBLjPv0PlyDc90SM2J7bzubiGV5463cTRlwUBUkStxK7DF+SApVDR16Me+vq8OVMZDmwxULYJ6za+1RU4GjAZtn5ACOK9RFXiCCh+iJ4IZACCKqqQvrA2XELrPxqZPAwW73PUW0RM6qvZ1V402jhtwGhk9u1pCV74zNZvbPoNhpXGLlZZh1YXoMT1QmiOyENaiCTV/WmHH/RVYF5PW88MZOOIHfYsieMGwYUEQP6+AO8JTDwxUPefl+JwQUL4C56IYFl6TMOpElKsO39r8V+UkHpZbsPaDpyNbW1kZpOtsJHeeHZ/sHnUumnQh+sdBvgmDcajcmJKvHHfcnNNzI+ll3DCAh5NJCJfKL11R8MzHbEOYkuDe3CYB/LlxpiGn64UFAUZH8mDy3ejl6HmOpbfmFfg87yNGvpT3TId1YQaxKrCWzkFbQijkc6Q0ztlwbzuOAbkLWmKzY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YZPagcBUEfbUTpxkKrsL7OFWpSFCMkd8ORvxktv+65RtmPzX1KjW3aH0PO3D?=
 =?us-ascii?Q?pTpk6PPbfRM+E8c/ImxDyrWEljYR1G1aR3y6NcG6gvJjRERLx9jRyq6/fHZr?=
 =?us-ascii?Q?hWqdvQ5AWEDY+P5liNbXZpKoZZbplnvqRly40ALxMyjpeVHzysvxaHOWOpcu?=
 =?us-ascii?Q?WHIAneiiGqmfP/b+z+g1umMPFqCEU3hoNjA+y8y4QYo7BgzfSDmKH20rmiSI?=
 =?us-ascii?Q?nXnEN5taHdAfILKlWiM8aBgHY3dPQ48vgoyQ3gfNOLMVPx0/Ufy8qUJw1cET?=
 =?us-ascii?Q?HV9zpugVWq3RIvrdV3yaOH28SiBW4r2xt9FuUmbReH20L9lKmuK1t2bp4+3p?=
 =?us-ascii?Q?tTuhLyzCHVeh3/xFVMyRIoAKBWPhsAdrqCxuAaANqwg1XVjoxdHVUWNTXjUG?=
 =?us-ascii?Q?Qjk0+Tum+CMhTvm8lJpArHxAoXlBBZF3EIbtEqt2VwJxtH/D2mM+0TZ74wJO?=
 =?us-ascii?Q?TAmO9+QuuZtCWVvPiXQHRayoi/H9OElSfCRIVQm0w3LerovW+EBRL3PNrEch?=
 =?us-ascii?Q?y05iaAwt3vCJqfAdGGMI+DyTmZe9S6RaHfXSvr+bZ8/A+BEIL924gBFQsuj1?=
 =?us-ascii?Q?z6Z2uWGwg0vUa7hQ0zapGEYV28AoP3w7ck5aDnWdnhrylc2bSLb/ZnBxwtN2?=
 =?us-ascii?Q?Phrk04ir7W3354XLA0KsOJdnOSC/1bgaUJNP6vFbx6NndfZZMLG2fzI8mZYi?=
 =?us-ascii?Q?3mMUIIx+PHuk33ZPhQRxi4YloME2q5wOHezi5QJ8+uHYaiES1XxekoChgkNF?=
 =?us-ascii?Q?T4uW/oAjHnfEoQieTUAXgHVXLvkV7kOcLtZ4e7ZPat3SUQ2Q/r+vUR6zTXgb?=
 =?us-ascii?Q?yjksJi7A24NF+9Uax5qmHZeWTQ9RBmN+9H28igkBpT4kCrflBh6nMacpiBif?=
 =?us-ascii?Q?Nfg2BCD/Qp/zq6ViN+t7HAiVrSwO/iEr8+I2JhpZYeHMEqVNak7oxkraKNgI?=
 =?us-ascii?Q?+SlZCF4CMeSCH25tOlSXYPdokpLStSA2imQrlMHKhAaUefMYEBXxJ48gZNw1?=
 =?us-ascii?Q?/S2VHQ/BIt/aSCwgQ08O9at0j/4RXSvf2pO5Pta+d30t1EKojVugfYnZ43Fg?=
 =?us-ascii?Q?NoSRaFRYYSIVuCkRPf2LnRZSFRUYcALEpwUlYmsL5g9HhLJ477UDTGmsVjUj?=
 =?us-ascii?Q?c9d84IHSs+f60g7cYqHcB09A/ZApFp/S08h+upcp4QVHVCzF74SegZQPUN8z?=
 =?us-ascii?Q?STwWTAaSTFWKttYl1rDGlG/czPQ20VvlGnCuxiefGg4gKNEk0OXS6NyAopRX?=
 =?us-ascii?Q?NraVP7WrhhrMMUmpvRHNXdUi+vTM/X31v7u0nf+UDZd0vlLlLllEg560vN0p?=
 =?us-ascii?Q?sU8igOsRrCtbrBjCuCJL5hLbZdHjlcjrIq6oHkPT/cPT6g4kH69VK7+AbVMh?=
 =?us-ascii?Q?CBp3nHpSG6Y1WCFymSCDpKOg1UcjoHtZsw7UByGpiiBIxLqnV8W0zEMdXfDd?=
 =?us-ascii?Q?3d7zVi8/jjc7Viakdg80NfthP1GMdh5U0DjWk+2mAqSlTzOlHrnaR+EM0oI5?=
 =?us-ascii?Q?Yyh1cHud2R+Egg4lJw2wzzneIL6LTD4N93cSsiv1JJfTJylBS1XXONqTSyfq?=
 =?us-ascii?Q?S4tVfB5RAMZGEu2RjUQZTafAA7o6IkL+k1+K8rYitif+f3lIwMJT4udFjqWi?=
 =?us-ascii?Q?Xb9ZCEtsKDH+F/LkYcm67riBCtNSNgTVV2zl47Fs+E6oUEykkIrCX/CIM6ng?=
 =?us-ascii?Q?6cBWjFXm4i9WqH1xzYakght5RGoPx16A1+X1IiYU8xYJfolMKGNDeyMn0lPx?=
 =?us-ascii?Q?0w8DTKXh8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532a9c61-47af-4935-9ea2-08df0e3d5849
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:41:14.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzNpvE41RcpXYHXO/rKXNTlGd4EW+AwnP0cCNsUhzLc0J00AGptx6zsSy53wy9mO443S1WRKwv4DLQyMXJy7/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

On Wed, Sep 09, 2026 at 12:06:06PM +0530, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 9/9/2026 11:56 AM, Andrea Righi wrote:
> > NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
> > When only one PE is active, the core operates in single-thread mode and
> > that PE can use the full core resources. When both PEs are active, the core
> > operates in two-thread mode and the PEs share those resources. This
> > behavior is common to SMT implementations, but Olympus is particularly
> > sensitive to brief sibling activations because returning from two-thread
> > mode to single-thread mode after a sibling becomes idle is not immediate.
> > As described by commit 293f9611ae735 ("sched/fair: Prefer fully idle cores
> > for NOHZ balancing"):
> > 
> >   Briefly activating an otherwise idle sibling can reduce the performance
> >   available to the other sibling and this effect does not necessarily end
> >   once the activated sibling becomes idle: after the ILB finishes and its
> >   CPU enters WFI, full single-thread performance is restored only after the
> >   sibling has remained idle for a qualification interval (10 Ki cycles on
> >   the tested Vera system).
> > 
> > That change prevents the NOHZ idle load balancer from unnecessarily waking
> > a sibling of a busy PE. However, ordinary task placement can still select
> > either sibling of an idle core and repeated changes of the active PE can
> > keep Olympus cores in two-thread mode despite little or no useful overlap
> > between the siblings.
> > 
> > This series makes PE0 the preferred sibling of an Olympus core using
> > SD_ASYM_PACKING and teaches the fair scheduler's idle-selection paths to
> > honor asymmetric SMT priority. The scheduler first selects a candidate CPU
> > and core according to its existing placement and capacity rules, then
> > chooses the highest-priority available sibling within that core. The
> > generic scheduler behavior is enabled only when an architecture supplies
> > an SD_ASYM_PACKING SMT domain.
> > 
> > PE0 and PE1 have equal steady-state capacity, the preference does not
> > identify a faster PE. PE0 is used only as a canonical choice when both
> > siblings are available. Consistently selecting the same sibling avoids
> > alternating the active PE across wakeups, lets PE1 remain idle for longer,
> > and allows more cores to remain in, or return to, full-resource
> > single-thread mode.
> > 
> > The series was tested on a two-node Vera system using an 88-thread
> > single-precision GEMM on the 88 physical cores of NUMA node 0.
> > 
> > With the workload allowed to choose either sibling of every core, observed
> > throughput improved from approximately 9.4 TFLOP/s on the baseline kernel
> > to approximately 10.1 TFLOP/s with this series applied. Repeated runs also
> > became more predictable because the workload consistently settled on PE0
> > while PE1 remained quiet.
> > 
> > Changes in v5:
> >  - Remove the redundant olympus_prefer_pe0 state (K Prateek Nayak)
> >  - Link to v4: https://lore.kernel.org/r/20260908082345.103087-1-arighi@nvidia.com
> 
> My replies failed to keep up with your speed on iterations :-)

Haha, sorry about that! :D

> 
> Since this is same as v4 and I had taken it for a spin on a
> x86 and an ARM64 server, feel free to include:
> 
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

And thanks!

-Andrea
