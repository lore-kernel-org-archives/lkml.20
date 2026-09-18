Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9865226B1;
	Fri, 18 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756090; cv=fail; b=mq3btY9Gsviv76PzV97IFS6hv7nae/KHhP1pvI+R16YH5jaYUDSKVhEblJtckFiUeeXyqu4gbffqCowRdB/0DN0GaBL9Vb96Z049LmIffebPgWd9cEeHCdFeyEbic5dCsCgjcHPhHYgKlPFzVnQi/F/wyC5OJ7NEGFqDni/2LJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756090; c=relaxed/simple;
	bh=vaLbJq0ZA2wLTiXnBHZu/fPtoBnAIkOMThrjQ0lQL2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JyROmGEs9PTsKGYmHXedOZ7fru+/ljZJ+z1sBD4pNKEAlPIPUBsHVI4CtWSFtEhqWbwDi4luQotXE2+WepFmMi0CLJW4iUY7iDwnNslvYe93XZi1C6Pi131psGyf5yDYkO4cYRL6V7NhiTrnKrhnPmFc1FhVZCv+elDRbnq9S+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WpmGtoDi; arc=fail smtp.client-ip=40.93.195.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WpmGtoDi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyfpnWVc90juc5lTeoJxJCo2R34hs2utgGhff4TSiu5MmJdXY8hwZ7scZk8cJmu+5c9W000kcY2VGNXRNiaX0mOx3SBVjEyecLv3fksiUWuM5JdkI6Vu+p59AXvmOiJLYgwp9l37B95vAdxbpzB7SF8llLkbL4mBoMk64mQ5wE6/hPncHvT1fdzybDMU2njVVswv0W+B6yF67/+jfwUpcYaNLlTanb2BZ2ID9QzOXGDjjl6B1mN8/cpZ4n1oseyezPF+mn4Yieo4hysbFOvfklqghN4iTWzA5kknfuBdGcHhwF7QAK2uzRas0efoe0iwSL0M9CMEnKtULcW2eOMtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1r7Wu+u7QD18w+zhMxjbCjrga2U/rjLupqBNB8s7yU=;
 b=diGLY8JComRrGZLdkGYTITS3S4sAyI1vj8bp3DgceHz/FM/sF8oOiUXytmTJ9M4wo6e6CH37ZvYj+5TGJoBZ1Pr7WzJA3WuSpQZHL2L7NmoRUecjJDWP90Rx95V0oFyPmO/QjRS3DrriAXxXMxOBHWnjfYdKCyAmghMPlprFw0kVpd5nkQnwA/SHAQp0rxMyCO7uRXcefdvQPg43faUSGGtjkr9+fz50xOzJssBHyg9zbhtI1ZRIUucRQYislYnLF0BrAxKPXeppbkOrycK4yB7uRsajIR5+wsNFIJYBxUGCH00ea3VcnHiK5Wg8+hjhd/q4B644VDTw2JwkILrIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1r7Wu+u7QD18w+zhMxjbCjrga2U/rjLupqBNB8s7yU=;
 b=WpmGtoDiZUbkeVnxBs9K1ATeSfjY+lueZ/Ile1y9KAaruX2znp2DfKZbD/3uCOjY66/EqM3Z5D13KEmPwf5ebYEF3EahawMyHIZz9aGmyygV/MazMdU3riv+TzGTtLlKY+w+TwOLU+IC7Jt76eFt9o1DNqV/finSE/Ma8hXVLlY8dsigqTefLj9l4v4dqwBImFnynjh26DXWLQ/7yZjoO6q7O5shfomjQObTCApwTmyMuWVVWfodXblUS2FcSQ9PIezVdzFep9o7Ey4aT1l2eYJPDMv3GpGU/92+E1xNI8S6HqQYUCwrr0X9Lc/l+ruEJiEnP85lhwjOACqo1HYNtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 18:28:00 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0428.008; Fri, 18 Sep 2026
 18:27:59 +0000
Date: Fri, 18 Sep 2026 20:27:52 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
Message-ID: <aq2CqGXjH_lrZVnS@gpd4>
References: <20260917140707.3807229-1-arighi@nvidia.com>
 <20260917140707.3807229-3-arighi@nvidia.com>
 <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
 <CAKfTPtD6i7BMpfnj4pEPJMMOSXyMWL63YDX00d+jRTn0x+ot7A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtD6i7BMpfnj4pEPJMMOSXyMWL63YDX00d+jRTn0x+ot7A@mail.gmail.com>
X-ClientProxiedBy: MI1PEPF000008CD.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::43b) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e98c20e-6162-4b03-0875-08df15b29156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|22082099003|18002099003|3023799007|4143699003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	tGJH59C/KO43iK2TTzo5yUiStwp5Yjq8CH0dlnOWxTERiGKvCGWmAeuTJdPYeWp3E6XI//ApUC9lAZteZB7IETZPUjOHhcdmsNQCAm6lEUIT9GNAnz63v5w8ucCFDzGVaXcXP452DiBrIM4wt0IUpL5SIHZjZzW7C9MzIn79YuiGFkn/LtTCyd/fvgsWT7zOXY5QKfLrZ6FRjPdUlQmYhlCeZScGrD72wzxEbl1SmNj7xwKJAD1fBIpO/EEcu69/DQtrR3hzpa5XzB1d6V6ypCs+zrQmCZkCuPeYOlFbC2Oh+yGh9+0XE/t7kkqSEsKZ3aYeIt607keHgrt/xtETp15IYb44Z/PPB4YmglYQ1hT06k4ant6BDUxwYpEwAhuRnVcqIUHOc96UjrCW1j376DE1/TMtXCp83Y3cNYxkPDc1yN9ZwOh67GI5Lyv0a4ffJbkCXPQ12Py2MCg1ZkRMhyG8zYbGJ6eh0zPmK/Y6HpDbewGPJ2rlQ/bEsPlvgfA81trmfiKB7ENj1Cxl8SOX+zV4/JplDaJNcYYQFqPIKutgyjF07me/kxxB+I4EOEn+8d35iWZOuWK4qJJ/MydqiSsSgjWrAtpoZs0Xe+OhXhtSKoh/wf7bm7eOJujdXwjfKSe3r4AKn0bukg89dcW6FCfkpTftEvrmASgVpDoGPME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z9FDbQO+JdvVTg5u8UuPU/gMGK5VnMP9wLLLPWnBw3EMfbsflMEmlHrYgFSY?=
 =?us-ascii?Q?0Edpw92FgifGKFUzzVVTfRBUFd/tniZmkBk1Sta+e5HOX2bYn6twTLoJOBxG?=
 =?us-ascii?Q?nfC85J+L40FyPZ7GMeo/oNivpMCuoXLk7ZJDG45uzSWdPG8B4TrYEjng9aL/?=
 =?us-ascii?Q?pc7co2t8h4MUEmBU4PY0ubYqPflE9Bg3jFDUVb9SnzS2P15+4eXJenIO18du?=
 =?us-ascii?Q?cU6BEKFwxPYzTGKfJao/xyc72RoP7wDOdF0T0OL7Y0h5OT4T6e6BY58vWZme?=
 =?us-ascii?Q?HoZjFvQ+iuR9v7uupUrcXqFSQgxA5QORVBoUgCpx1ctFFM6Z6gOKhmHG5Bny?=
 =?us-ascii?Q?YqvGIIdwiLyO7T6ANHbtZsNGFnJN4maj+qSZsNFAkV+G1ExlX2G88/5tF6/D?=
 =?us-ascii?Q?A+LFewSQVqgvvnTrTe4Ne3nFzL+tLmcURttZViHEmSd3v3drY2JytV/EmRc3?=
 =?us-ascii?Q?GFBeU2qngRDHyiE8+SCw7cdWIx2AvsBqdnrkuYESjW4+wSgVGTCjtToEwgDh?=
 =?us-ascii?Q?s2lpb5/ejX95DkJNCLkumkzBXKaM/qhaqq7zqRRYa7E1KgE3yOLNkl1tHVYz?=
 =?us-ascii?Q?qki6u/Col3ygMoxX8hQliz3LC1rMdKH+m4Z1Fxkme1htYkJ4nfOZHH1Uims0?=
 =?us-ascii?Q?wY4Ey5hL3PKAmu/0BVgeMqviMhvQquMRGDJVCmeumHDzrxaNriKmqe6I4QNb?=
 =?us-ascii?Q?ETIe68RQHjHwQpJ3LDuSwI/e668JoogrJ9jJT+QND0UYzY/xsu1EsUKoIQjq?=
 =?us-ascii?Q?lkqli/yIRxdcUKO49JeJXOUeYyEy/kabZ3n+yrMcCx4Y/6m69Nm47KewufU2?=
 =?us-ascii?Q?DXgPVuKfJQOabdGgh7pi/82RU1ZK5TVyNyDsLOJWyaemvW6Dd2hbFYqOCDmk?=
 =?us-ascii?Q?uzf5g9oPuK68W5sfiQezZI2KzVE4GL+Ut7jJrxJDRd5t8hc5kvgk5lrQWwPs?=
 =?us-ascii?Q?C9YZlRX0ajHzfZR83KlzSRuUt4cgNjWuB46ZcmTNhg+/jj+2ELsedKqOgX/a?=
 =?us-ascii?Q?G6Rs7J0RXhgPVKpl/pVEgYS/qIS9FvDff82B0noseay4EaBQQNHkoztVi21K?=
 =?us-ascii?Q?4u4WsfrdoOGo9+N2P9CyuJr2YpLhRi2D6/ZE0UbXgWUqqsygjQ1rr1FoAjbF?=
 =?us-ascii?Q?BoegKkvYx/896hQnOphm3NGLRkdHW5XO4KS9rRfxMPMIsUCkPRSZ+bU9W5wB?=
 =?us-ascii?Q?xfUBi0wGqSPTkTBl7O96bZEcPbBOm+MQREJMNHoGNcnMfsXfhdq/W8sjySgg?=
 =?us-ascii?Q?3eCb9xqWdFomJC93p6ycfJb1uG280cpFelBTyhJLDszttopR1OXaAA5CEFbB?=
 =?us-ascii?Q?QA5C6lkrSfXkFYjBNv+PjlYls3FyG2qob60Vj1+8YDzuqmzmtNIBQYqDw3cr?=
 =?us-ascii?Q?QFZRtuCuXPbGF0moW0na7ob/OogE9EwErhQExbCwcLe7Jp8yihQw7SWIMyCl?=
 =?us-ascii?Q?t7YYxOtPiWVrcJ3NlUopLve5/69ehw1kfozlca/0tLmMLGryvP9V09/QpMrN?=
 =?us-ascii?Q?xqyzvivMHz8Kp8e33mfsG0R9w7Neb3KKpa72JknZ2iYVsgXVpj6S+3gHilWs?=
 =?us-ascii?Q?vBqOdkhftMDT+5a6JWTatA3Y1yRqnGuwBWznwx3l0BE6nbfn9BCalcgtl2pD?=
 =?us-ascii?Q?e3MckMy2Bu/0ra3l69ubYllaSvnIkqeEHB4lHYPyz84InZrkjITsCdzLBaxq?=
 =?us-ascii?Q?Lu2EA0dhFW+J+z+ksv1Lz58GXp841ySeTLv/xW3zoyetIldXTBgsfNemK70c?=
 =?us-ascii?Q?SZwwvap5Xw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e98c20e-6162-4b03-0875-08df15b29156
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 18:27:59.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LD/VX9VSA0qwxWY7jYgUbspSwWoIjCpPhIOifBDpiaZsVbWmuUmJ0pZDC/7TOGhB2bPAThNAtAIheX3g2SGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471

Hi Vincent,

On Fri, Sep 18, 2026 at 06:03:53PM +0200, Vincent Guittot wrote:
...
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index 33cd30996e47e..36c3b2e563441 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -6799,6 +6799,17 @@ Kernel parameters
> > >                       solution to mutex-based priority inversion.
> > >                       Format: <bool>
> > >
> > > +     sched_smt_asym_packing= [KNL,SMP]
> > > +                     Override asymmetric packing at the SMT scheduling domain.
> > > +                     Format: { auto | on | off }
> > > +                     auto: Preserve the architecture default. This is the
> > > +                     default when the option is omitted.
> 
> AFAICT "auto" equals nothing added in the command line so why is it needed ?

Right, auto is redundant. Omitting the parameter already preserves the topology
provided by the architecture or firmware.

> 
> > > +                     on: Force asymmetric packing at the SMT scheduling domain.
> > > +                     Idle CPU selection prefers siblings with a higher
> > > +                     architecture-defined priority. Siblings with equal
> > > +                     priorities remain unordered.
> > > +                     off: Ignore SMT sibling priorities.
> 
> Is this for debugging purposes?

Yes, that was the intent, but I don't have a concrete use case that justifies
exposing it.

> 
> only the sched_smt_asym_packing=on is really useful to force
> asym_packing when firmware doesn't provide the info

Agreed. I'll simplify the interface to an explicit force option for systems
whose firmware can't describe the SMT preference.

Thanks,
-Andrea

> 
> > > +
> >
> > Wasn't this option/parameter to come from arch specific file?
> >
> > Isn't it going to be confusing for archs which don't benefit from asym packing at SMT,
> > but now there is kernel parameter to say on.
> >
> > >       sched_verbose   [KNL,EARLY] Enables verbose scheduler debug messages.
> > >
> > >       schedstats=     [KNL,X86] Enable or disable scheduled statistics.
> > > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > > index 0248227d983a7..cdfcecf673fd7 100644
> > > --- a/kernel/sched/topology.c
> > > +++ b/kernel/sched/topology.c
> > > @@ -32,6 +32,46 @@ static int __init sched_debug_setup(char *str)
> > >   }
> > >   early_param("sched_verbose", sched_debug_setup);
> > >
> > > +#ifdef CONFIG_SCHED_SMT
> > > +enum sched_smt_asym_packing_mode {
> > > +     SCHED_SMT_ASYM_PACKING_AUTO,
> > > +     SCHED_SMT_ASYM_PACKING_ON,
> > > +     SCHED_SMT_ASYM_PACKING_OFF,
> > > +     SCHED_SMT_ASYM_PACKING_NR,
> > > +};
> > > +
> > > +static enum sched_smt_asym_packing_mode sched_smt_asym_packing __read_mostly =
> > > +     SCHED_SMT_ASYM_PACKING_AUTO;
> > > +
> > > +static const char * const sched_smt_asym_packing_modes[SCHED_SMT_ASYM_PACKING_NR] = {
> > > +     [SCHED_SMT_ASYM_PACKING_AUTO]   = "auto",
> > > +     [SCHED_SMT_ASYM_PACKING_ON]     = "on",
> > > +     [SCHED_SMT_ASYM_PACKING_OFF]    = "off",
> > > +};
> > > +
> > > +static int __init sched_smt_asym_packing_parse(const char *str)
> > > +{
> > > +     for (int mode = 0; mode < SCHED_SMT_ASYM_PACKING_NR; mode++) {
> > > +             if (!strcmp(str, sched_smt_asym_packing_modes[mode]))
> > > +                     return mode;
> > > +     }
> > > +
> > > +     return -EINVAL;
> > > +}
> > > +
> > > +static int __init setup_sched_smt_asym_packing(char *str)
> > > +{
> > > +     int mode = sched_smt_asym_packing_parse(str);
> > > +
> > > +     if (mode < 0)
> > > +             return 0;
> > > +
> > > +     sched_smt_asym_packing = mode;
> > > +     return 1;
> > > +}
> > > +__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
> > > +#endif
> > > +
> > >   static inline bool sched_debug(void)
> > >   {
> > >       return sched_debug_verbose;
> > > @@ -1950,6 +1990,15 @@ sd_init(struct sched_domain_topology_level *tl,
> > >       if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
> > >                     "wrong sd_flags in topology description\n"))
> > >               sd_flags &= TOPOLOGY_SD_FLAGS;
> > > +#ifdef CONFIG_SCHED_SMT
> > > +     if (sd_flags & SD_SHARE_CPUCAPACITY) {
> > > +             if (sched_smt_asym_packing == SCHED_SMT_ASYM_PACKING_ON)
> > > +                     sd_flags |= SD_ASYM_PACKING;
> > > +             else if (sched_smt_asym_packing ==
> > > +                      SCHED_SMT_ASYM_PACKING_OFF)
> > > +                     sd_flags &= ~SD_ASYM_PACKING;
> > > +     }
> > > +#endif
> > >       sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
> > >
> > >       *sd = (struct sched_domain){
> >
