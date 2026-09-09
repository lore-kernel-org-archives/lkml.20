Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5457F736
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970945; cv=fail; b=Dpnk3AKA3WdByrqRqvIX90tMIY2V+3D93AV1R90Gcqcz34Jd3mXWkBg23p16oY7e7zLG9gD9SyJQUWaW+sGK4w+97rqvDiwPDs+MNCE6azunw2Qhz1Ty26sojw5b+Mo5zv2S/y/JNM+Uq435ez9pxfPR3gqYI9pj81AIWBcpbKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970945; c=relaxed/simple;
	bh=z99vgtApXCAgePzHvH+4XZrAAp3ZZE2iyai4EzZXIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l3oe+icbECpxRB+UTxqkJleKEp/IRUkuRUIXLa9CWA+OJ8nC+x92zjM45TZ59lMtJrhbd01susphK9k+JZp22kv03RQMRpfSrfmM/wjGU501lM0YHuDucM4BzpgGlsJxcEUWxewEQ0l0eIZN3D5nm6YGaYknZ9XfTqxJArORgtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TLXk8iQy; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TLXk8iQy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2YPfOqbktLa9D7xQ5aHo+BTlAPKNORJfd13Xwwb7idmntx0MnvUrZMubH/o5FObn+L25M6PiRBT//ZsjCywesY8ZRvWo+B19a3VQJN2l+kGmN+PZQOtHYEu7cm0Te/yWORqxwbEkBN75Bt1ObpWHeanGJKkoKGXu3lqBVL/OKy7nOyghBLOGqaWxz6d55AJrRGoAyGY4LN/1wffuYhv3yqFEJkAOChcRIRiQQ/h8xzjosLBpTkVHhlIXE7TZql7kUP2c4MefcR3osBQopQZvqX0+sMNgh+WtAwlLRrnlDVkc4HjXyYbFp5mLy7QDBK7eTY0ahvLWNL4fDpxr8waZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsT9uDCS6ynS9P8HglVSxvbqQqFErINXoVYW1Vl+EDY=;
 b=dPh4jN0PzqGwBMoUl1bTZwVD7LpFcEDTgQe1tc/+CduwgIFrYnx5Edn+Xva4ie0X9Cvfq1wdl5VPz8jOTXDNNU2PVPuaVIU8WQxRHCQHtn77OZRdQb9B80mUHPWDr3trcfE8lVZiMaLnOupMIVcwcePdmIA+mO6U8zDCnn5uwJQSewCPk1f8RCii+DE6uGxBgPRFMv0xVKHBVcUej28FlQPKuzGVBG9zFiE3ovOtUoubbtIaKYdXTeib4ItGnvniyVWZ4q3LSzs60uPEqipfCfCo0CHrOx7ZPe7+AZMW3Sytm2gw6t1RAEde+QzhCmn2eFUKYQNbq4/pyI6QQ7NkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsT9uDCS6ynS9P8HglVSxvbqQqFErINXoVYW1Vl+EDY=;
 b=TLXk8iQyx68oT5s3joOzSHBY6c0Q9csRpEa+hE9XBR14VIur9Y0/+t4u1nDEkHCGpBx5HX+YJ7xwdULQidNS5ONQW4NWc3ErSkB2qvj/vHAXU2tGqMr8OQOaFLInFGYBeYkI6n9N2KMo6YLgAZUHf2VYzigoqsy+M5JlAZ6wyrFU3mwPB5iiI6RiNOXxoNWjaeR3RlwjPOYL6AP+6EpOKo8MnZXAmuWO/NztZ9E/WnnbbgygXzF6PyhVVw9EIvAQwAanV6CYJVu6p/RuaAYeHhjK4aww+zx16LoBh6OCxJ3hRa1UsQ1VokHWQRLncDjkPRfBv2hllWkLrV+u+HFXQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LV1PR12MB999328.namprd12.prod.outlook.com (2603:10b6:408:3f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Wed, 9 Sep
 2026 16:22:20 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 16:22:20 +0000
Date: Wed, 9 Sep 2026 18:22:12 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <aqGHtIo2Bk2irSdu@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-3-arighi@nvidia.com>
 <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com>
 <aqF4sqhjpYjIPgQF@gpd4>
 <CAKfTPtASXty5hOOgmXokCh95w0idU0y12UDua1_vg9m8teF9Rg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtASXty5hOOgmXokCh95w0idU0y12UDua1_vg9m8teF9Rg@mail.gmail.com>
X-ClientProxiedBy: MI3PEPF00007541.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4d3) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LV1PR12MB999328:EE_
X-MS-Office365-Filtering-Correlation-Id: c579949b-9ed4-4477-de98-08df0e8e85a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mJla1NbzG5xZI2fWztvAwvReI/IaLYMIoB1P2XEV09b3uhfMhCDgMTbrLwEnKtDOR61IXRpUuu1dFP0a427m81oNYbyAlIOg7gJO0jISbh15Uze7VO89FLXgBz4IeXxQAJwvl0Rh3I+abFkQaW3LvLeJzyrtEaEHnhzguG7hvIxsmXnh38psYuF8Q7c21nrFUnKq3k+PXru+H1PbcmpB/hUL3nXHXzmQ/DAmZ6vYYjmUiLQheuRxaUdzyAVrq642n8QmLCHRzRIovKZV7MgNI210paQ8g7i7aoYtUg+kNLAvYruIfKbOBFQraTGcP88cuLCv4F/GR7kVtsNDqXJXkwCOs0ABPvBIuRvwYB3kCz0Lkjnld6cJB0aasYkJIZ7nCaUdfd+7dOv00FHC2CtzMNzgWY8mY7D/ps+hrMY8dft6G4i+F/plW0qA9KSGVPE5yQvhXm+R+srgmLI8DN+xG1Xnev2Sky8YNRpHdFG2HOmZ1Zi692uZV4Ef/3kXSGUV/EEywDlZyURMD/tCAlQ8dOlOCXp1S7QX6jZbUSdrOOB+hr1/f/iVPYwHa/ZgBmBBa1fz17SHywaRHzpp+ReJuVnxTkPuKVmKiqL87JC6jPo8cy4FCJO6wppC0OQUvKPHyhFzx5XHe0mL4AmY/VO3X0DcKQFf3pUKlua99QW6Unw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvW6grVhAxC0pjhpLS9277h/7d+kWZs6W5jEeIXgQDMWe5hTcFJmdgWtyANq?=
 =?us-ascii?Q?fMzI4Le3Dljwb5cIiTuMIDIyHIkX1EVNny+fkUINGUh20xgIkVXJba6QAKIp?=
 =?us-ascii?Q?Wl589fXJpSuKsz4rz9T5OOJcLLosyGDXNI12CBL6ziUtY/gR8H5zI9Ny69LV?=
 =?us-ascii?Q?Zpm5X8hhQ4al86JT+ztGGEFDCrQ76Gfwz4M2NyhdPosLtjZMomfOGY+jYQi3?=
 =?us-ascii?Q?U2wYPveocyzc1iXUZSiL0gnb/5hFYCeyiYcPJGm5fX44/LZ+HsvuDpTPE7s7?=
 =?us-ascii?Q?q6FcFwMAIeDdbgqjY19iQ2Ei4kV+h0n/XDoBMFQS8Ooh/VdtjRA5r7Ewu1gD?=
 =?us-ascii?Q?jcezIoEjSEZCvHn+nXIUl1cSsWFAPLYVpJryKsPKkZlmj4vALqAcNCBUXHTu?=
 =?us-ascii?Q?W1amOWoTkyMbi8j4ewpuch4+6B+sUWDU1odrAGXno2sjJZjGCSXIGqYHNHIM?=
 =?us-ascii?Q?YSq45mcwRYRXaDxpRoZdGQCe1S+rMilQZrHd5O2rs3YtejvmKtuSy8eRdyhM?=
 =?us-ascii?Q?EN4a54+lEH76A5DqOmeLOuSyfsJu+m49YVKavelqTCZNPOhY+qmSKWjc7thC?=
 =?us-ascii?Q?roHTISxwFtvW3VeSUtoCnSNe+imIn7dm7Kpzwi+PTE3IfAQvWjxjDptfZp6e?=
 =?us-ascii?Q?IOimzIcHyfVt7a6TdV+9r2ICQdxc4noxnJGcKEXExQqUY93ETl10mHqOJTzi?=
 =?us-ascii?Q?cjessgLzRBfs+mtB6+8WOI/8srg/nx5qJlpbPBZGa5d+g79/FlJDUTUCC7JO?=
 =?us-ascii?Q?cfFGJiz0xH+P/KRsBi5X0lj1kiax8BCCxFFAz5zxWcC/1+Yfed/6hPLs9z0J?=
 =?us-ascii?Q?qh6goEXKwmCa7XqEDASxss2A3y7r4t1I6TSrzA5HS3CCr/rjnoNSNohQCB8/?=
 =?us-ascii?Q?B6LXS9djMy80oRKWP2b6k6dV9gBlRDRmIooX5syo8g8ZrLmmfdhoU6iZXXnj?=
 =?us-ascii?Q?nP11vWlisZTF89U3NOg54pWGvWVoxvK0tnj49C5AIjwrlmYmNSFl/k7To2en?=
 =?us-ascii?Q?aDl6xUqsMZ/q/EjrQiRrHwLnVIbXAKiyXeX/+/6FkTx/lbOc4ZjHmtFzMzPk?=
 =?us-ascii?Q?Qtsb90KLPU4ISxu6tKTMLbqugEGV9VwEl3LGFPwekAR8y4U3hCjpaS2P/Txi?=
 =?us-ascii?Q?YAgxgS3Xs9gxoUM8gx0E/aNTrlB2OYDzwoycYWSVvVQgL2trI4mkqtliA0Wu?=
 =?us-ascii?Q?qhYxCUU42hL8qRoCdIUYsym/Pyq2WIilaAyhYOaLHdk3rOY+JH6btY8iTqHQ?=
 =?us-ascii?Q?M2Zvr0s34CEIwi/1boFyYHmvwnWn7ZgDoHqkJy0hmwPbCfjPqhyT4YCroKDz?=
 =?us-ascii?Q?MtHiZ2xRs91DuxfMqgl7MaxFGgkfWpReziBaXaq63XxguL457YTSpWgzos6k?=
 =?us-ascii?Q?mzXW6anKi6QFMMf9Z5TsjXzVCw2xspRbN/eoIbwykCMqnWAdVH8mW2zM3GQx?=
 =?us-ascii?Q?tWDo23U+EQnssAL08/B4jNprgTVZpCzd11AW79vLSuFXejFDDn3qu5LQa0EF?=
 =?us-ascii?Q?oQMYKWHQtMns1aqcBVt62pWZE4u4gVZGj5rCQipabCaN2uRnnhFjc87Nb8wd?=
 =?us-ascii?Q?D4Jaeg6isausK53CdYSmkY9nKNli84fOv/RwgtPVywJ99ihHMuf3/Fqu2mWF?=
 =?us-ascii?Q?+UnWmss/VMFqbKmwdLzbvdMGLf1KCasAZ4vJyHPSa4tyaiettfYAO2XLsrGc?=
 =?us-ascii?Q?IeE/qGvuMJnIXqy8kVDyhDRMGyOIyfaYBD+kkk1Xp7/M3V5ZZfXiJ8p/g/xD?=
 =?us-ascii?Q?ufNcwYvvKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c579949b-9ed4-4477-de98-08df0e8e85a7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:22:20.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIS21NRgoTSk6rB12QaDTEugj8HncFC7q1YWPmfnFqjALPCm7Mv+NXgAUcP+H6eFvabWx/0tIgkjkYbYPh9TAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999328

Hi Vincent,

On Wed, Sep 09, 2026 at 05:42:43PM +0200, Vincent Guittot wrote:
> On Wed, 9 Sept 2026 at 17:18, Andrea Righi <arighi@nvidia.com> wrote:
> >
> > Hi Vincent,
> >
> > On Wed, Sep 09, 2026 at 04:42:44PM +0200, Vincent Guittot wrote:
> > > On Tue, 8 Sept 2026 at 10:24, Andrea Righi <arighi@nvidia.com> wrote:
> > > >
> > > > POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
> > > > level to order hardware threads. Idle CPU selection does not consult
> > > > that order, so a task can wake on an arbitrary sibling and remain there
> > > > until load balancing corrects the placement. On these systems, that
> > > > initial choice can prevent the core from entering its preferred
> > > > lower-thread resource mode and cause a large and persistent performance
> > > > loss.
> > > >
> > > > When idle selection finds an available CPU in an SMT core, choose the
> > > > highest-priority available sibling. On SMT2 Olympus this only changes
> > > > selection on fully idle cores. A partially idle core has only one
> > > > available CPU. On wider SMT systems such as POWER7, it also fills
> > > > available siblings in priority order while the core is partially busy.
> > > >
> > > > Apply the preference to idle-core and idle-CPU scans,
> > > > asymmetric-capacity scans, target, previous, recently-used CPU fast
> > > > paths and the slow path. Inspect the lowest scheduling domain directly,
> > > > but require both CPUs to share its span because isolcpus can split
> > > > hardware siblings across scheduling domains.
> > > >
> > > > Keep physical-core capacity selection independent from SMT sibling
> > > > ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> > > > maximum capacities, then SD_ASYM_PACKING selects the preferred available
> > > > sibling inside the chosen core, whose siblings continue to share equal
> > > > capacity.
> > > >
> > > > Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > > > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > > > ---
> > > >  kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
> > > >  kernel/sched/sched.h    |  6 +++
> > > >  kernel/sched/topology.c | 36 +++++++++++++++++
> > > >  3 files changed, 110 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index b8bd308c2d5b1..37837c36288a0 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
> > > >         return false;
> > > >  }
> > > >
> > > > +/*
> > > > + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> > > > + * subject to task affinity.
> > > > + */
> > > > +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> > > > +{
> > > > +       struct sched_domain *sd;
> > > > +       int best = cpu;
> > > > +       int sibling;
> > > > +
> > > > +       if (!sched_smt_asym_active())
> > >
> > > I wonder if it's worth creating a new static key. All other pieces
> > > related to asym packing use sched_smt_active() to opt out the related
> > > code
> >
> > The intent was to keep the additional sd dereference and flag checks out of the
> > wakeup path for the more common symmetric SMT systems; sched_smt_active()
> > remains enabled on those systems, the new key lets them return immediately.
> >
> > Without it, the additional cost should be small when everything is cache-hot
> > (roughly a couple of dependent loads, flag tests and branches), but this is a
> > hot path and a cache miss could make it more noticeable. I haven't measured
> > whether the saving is significant, though. If the extra key and its topology
> > accounting are not considered worth the potential saving, we can remove it and
> > use sched_smt_active() instead.
> 
> If we start having a static key per sub part of a feature like the
> asym packing, that can quickly become unmanageable. In this case we
> should better have a a static key for whole asym_packing feature
> instead

Makes sense, I'll remove the static key and use sched_smt_active().

Thanks,
-Andrea
