Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134792;
	b=mMUSfRtP1x1lh6zsFehhsA6BIVcYmKrY5iruyTaHMp8+CEklMkERUq+VFa6yUCUWGu/5
	 EpIrqgdANzjUDRlrNSR0WyPySq6o3Tgveci6eIa7jB5rwprObZHDWS+4C9g7ngiyon6Av
	 fFr/a0A42xET0j08ospucaGxF3w/j5hbUjJ259JnYLhzUgcxb77qUItofmx7y7CRXESoA
	 jX5JrPXa3RHpz3mHL06wOHlNEdJ93CSe2lsmubuuYnhZaApx6bGzjP2yWbYpY+43cMawg
	 K+AZUhvk6DOQnOAAqKbgWuibLw/DV6Zc93Avkioe429Rry5jJgbRlORhoMIWIJS9agA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134792;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LpyPtxseQpwtb2TIMkuCXyRaplyqqRTLBc+Wl89xoJg=;
	b=esQSLn44rrekuK2vmwN6GCRLqsnTXalEpdsHFqE4LjniWbN/uiGxLGn5tf+lmafsVTeX
	 XYpQdgvBE8W7pM3pflM/qbeBVg8EgxGli2PmdOkmLbcAWa0QzA2NxUTxNAox51k+RY8LY
	 JOfr4CCozb1sR1r+mdDjlTg/VJbjxtv5ZEtg6rl1zBLRMBr5fSkakp5FZktX5dJ6ezxS7
	 HDXCE7RxP7Jz4X6rcV/c0rW2thmVpiZhcFv/5uhAzt3wpXd6iQFKqzp0StKQnglfcuU3/
	 GvxJip6UwI1PAGa3REa2EuuK5GFXwm1JhF62YqvUp0K+ozV0qjLW30J3Y6jrnvIUOag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fA/hcTR+";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11597606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11597606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fA/hcTR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793134792; x=1824670792;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MAl3pREYI1KD7uI9s8iSiWkFshjkDZkF1WjACyyDCLs=;
  b=fA/hcTR+6sPH4AIWbHRe+N3QExEQwkRZu+8PceqMigv4Gb+9PPhPjtuh
   9XlohYaIMmWdkGGqUEC5+v6JoZFQxD8vc2GYQg7RG0qQHF7vEEopYv3dx
   XC6mR7a0D9nXImhFdLak8+Jmrggysn2i4/q40nkOKj4B54UzlAdHXVquT
   idqzEylqbscZoZO2RZtWlUqEun7ZLf0boUS9wXgOhRbG4Bxu2f0/2bNnT
   LWua9TW1siwBYc2wLCO7GFtoDmQa6QdqG1lHGPdcjRND3c01feRGKIhMa
   B8ioGZsVg1ijdpMu3Z6DvJJmhKN1E33W+MXIwBX0f3/4eXV+X6uV+2TLT
   Q==;
X-CSE-ConnectionGUID: z2q9+lbbR1SICe8TpwUenw==
X-CSE-MsgGUID: 1Yg2hXT8Ti2dZoZKfxoXFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1860881"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1860881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:59:51 -0700
X-CSE-ConnectionGUID: kz0dzsB0TYmkG+8QR5g7oQ==
X-CSE-MsgGUID: gPj+Qtl2QkiWY3AJlKP2cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5043469"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:59:50 -0700
Message-ID: <6b637582edf72e2e013136be0ac979095fd5faed.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Li kunyu <likunyu@open-hieco.net>, mingo@redhat.com,
 peterz@infradead.org, 	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 13:59:50 -0700
In-Reply-To: <709db04c-eec7-db96-acca-81cb2ed7265f@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
	 <6d8ff4593cc93c0033c6537eeac281085726c220.camel@linux.intel.com>
	 <709db04c-eec7-db96-acca-81cb2ed7265f@open-hieco.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-27 at 18:44 +0800, Li kunyu wrote:
> Hi Tim,
>=20
> On 2026/10/23 4:25, Tim Chen wrote:
> > On Tue, 2026-10-20 at 16:37 +0800, Li kunyu wrote:
> > > [Background]
> > >=20
> > > In high-performance computing (HPC) and cloud computing scenarios,
> > > maximizing overall compute throughput and sustaining peak CPU capacit=
y
> > > remain critical optimization goals. Within the scheduling domain, the
> > > primary optimization focuses include:
> > >=20
> > > 1. Timely responsiveness for task wakeup and execution startup.
> > >=20
> > > 2. Fast and balanced distribution of CPU utilization across cores.
> > >=20
> > > 3. Preferring task migration within shared-cache domains (e.g., L3)
> > > before burst workloads arrive, so as to reduce cross-die or
> > > cross-node overhead.
> > >=20
> > > During development, the following issues were encountered. The above
> > > approach ultimately yielded measurable performance improvements.
> > >=20
> > >=20
> > > [Problem]
> > >=20
> > > It was found that on servers equipped with the Hygon 7447v CPU (Model=
 7,
> > > 384 logical cores), migrating tasks across LLC scheduling domains dur=
ing
> > > load balancing caused significant performance degradation:
> > >=20
> > > 1. A low L3 cache hitting rate (due to factors such as non-shared L3
> > > caches).
> > >=20
> > > 2. The traversal overhead of higher-level scheduling domains (e.g.,
> > > cross-NUMA scheduling domains).
> > >=20
> > > Similar issues were also observed on CPUs from other vendors during
> > > testing, though the degree of memory bandwidth increase and other
> > > latency effects varied. Consequently, a series of patches was develop=
ed
> > > to address and improve these issues.
> > >=20
> > >=20
> > > [Solution]
> > >=20
> > > This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
> > > feature. The main work is as follows:
> > >=20
> > > 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
> > >=20
> > > 2. Skip SMT-domain balancing after a successful push and avoid pullin=
g
> > > the pushed task back.
> > >=20
> > > 3. Restrict newidle balancing so it does not pull from higher-level
> > > scheduling domains.
> > Kunyu,
> >=20
> > Have you tried to set relax_domain_level=3D in boot parameter to
> > prevent new idle balance across NUMA nodes?
> >=20
> > grep . /sys/kernel/debug/sched/domains/cpu0/domain*/{name,level,flags}
> >=20
> > to find the right level for NUMA and also if the SD_BALANCE_NEWIDLE
> > is turned off for NUMA after you set relax_domain_level.
> >=20
> > Wonder how much this will improve things for you.
>=20
>=20
> I conducted a comparative test between patch4 and relax_domain_level=3D4
> (scheduling domain levels 3, SMT, LLC, and node). Their effective schedul=
ing
> levels were the same, and their overall averages were quite close (+3.28%=
). The
> trends for each item were consistent.

Kunyu,

Thanks for running this quickly.

>=20
> At present, relax_domain_level has not solved the problems encountered. I=
t
> merely serves as a reference for patch4. Subsequent versions of patch4 wi=
ll be
> optimized following the style of relax_domain_level.
>=20
> I would like to seek your opinion on the modification of patch4. Please r=
eview
> the following:
>=20
> 1. If relax_domain_level is set, patch4 is disabled.
>=20
> 2. If relax_domain_level is not set and the feature is enabled, patch4 ta=
kes effect.
>=20
> The overall average values and the data for each test are shown below. He=
re,
> smt_buddy denotes the patch4 code, and relax denotes the relax_domain_lev=
el =3D 4
> code:
>=20
>=20
> type           smt_buddy_pct  relax_pct
> hackbench	-14.94%	       -17.65%
> tbench	        +12.54%	       +8.70%
> schbench	-4.27%	       +0.48%
> STREAM	        +21.80%	       +23.29%
> unixBench	+1.19%	       +1.58%
> overall average	+3.27%	       +3.28%
>=20
>=20

From the data below, relax_domain_level=3D4 and the buddy patches give
similar results, including the STREAM gain and the hackbench
regression. To me patch4 duplicates what relax_domain_level
is trying to do, preventing new idle balance across NUMA
so I would drop it rather than add a mode that switches between the two.
That is also what Peter suggested about tweaking SD_BALANCE_NEWIDLE.

If this restriction should be the default on the Hygon 7447v
platform, that can be proposed separately as a topology/flags change
for it.

I am not convinced that patches 1-3, 5 are helpful.

The scenarios targeted by patch 1 should be handled mostly
by newidle balance at SMT and nohz-idle balance. That is
fairly frequent (~sd_weight or 2*sd_weight , i.e. 2ms-4ms for SMT2).
While patch1's task push fires at the frequency of SMT domain balance, whic=
h
is ~31 msec from get_sd_balance_interval() with busy factor and
8x to 16x less frequent than idle balance.

Please try Vincent's push task implementation
that is a more comprehensive implementation to quickly
send tasks that need to be run to available CPU:
https://lore.kernel.org/all/20261002154415.2270586-8-vincent.guittot@linaro=
.org/

patch 2-3 are mostly to prevent patch 1 from being undone,
and do not improve performance on their own.

On patch 5: the burst wakeup problem is real, but I think Peter's
idea (track average rq depth in periodic balance, and spread with
cpumask_any_distribute() when the local depth is well above it) is a
better direction than scanning nohz.idle_cpus_mask in the wakeup
path. That scan ignores LLC/NUMA locality, which goes against what
the series wants to achieve. It may be worth doing as a standalone
patch to deal with this issue.

Thanks.

Tim

> hackbench:
> group   base  smt_buddy relax   smt_buddy_pct  relax_pct
> g1	0.262	0.215	0.202	+17.79%	        +22.82%
> g2	0.288	0.322	0.334	-11.81%	        -16.12%
> g4	0.407	0.421	0.494	-3.29%	        -21.26%
> g8	0.567	0.613	0.756	-7.97%	        -33.17%
> g16	0.836	1.100	1.103	-31.61%	        -31.99%
> g32	1.411	1.907	1.646	-35.15%	        -16.63%
> g64	2.473	3.077	3.204	-24.44%	        -29.58%
> g128	4.502	5.538	5.190	-23.01%	        -15.28%
>=20
>=20
> tbench:
> clients   base        smt_buddy         relax      smt_buddy_pct  relax_p=
ct
> 1	475.97	       493.30	        489.21	        +3.64%	  +2.78%
> 2	714.48	       680.53	        853.52	        -4.75%	  +19.46%
> 4	1349.73	       1569.21	        1493.59	        +16.26%	  +10.66%
> 8	2059.00	       2240.22	        2285.86	        +8.80%	  +11.02%
> 16	4364.25	       4326.11	        3381.46	        -0.87%	  -22.52%
> 32	8325.17	       7740.42	        7052.11	        -7.02%	  -15.29%
> 64	12614.20       12955.47	        14898.40	+2.71%	  +18.11%
> 128	15845.07       22412.27	        19323.67	+41.45%	  +21.95%
> 256	20837.93       30456.97	        29053.70	+46.16%	  +39.43%
> 512	29820.67       32227.33	        28809.13	+8.07%	  -3.39%
> 1024	25969.93       32078.90	        29487.20	+23.52%	  +13.54%
>=20
>=20
> schbench:
> threads   base        smt_buddy         relax      smt_buddy_pct  relax_p=
ct
> t1	10.75	      9.20	        9.20	       +14.42%	  +14.42%
> t2	11.20	      13.00	        10.80	       -16.07%	  +3.57%
> t4	12.80	      14.80	        13.00	       -15.63%	  -1.56%
> t8	13.80	      14.20	        15.60	       -2.90%	  -13.04%
> t16	14.80	      16.20	        14.80	       -9.46%	  0.00%
> t32	17.00	      17.00	        16.60	       0.00%	  +2.35%
> t64	27.20	      1713.20	        1139.00	       abnormal   abnormal
> t128	2844.00	      2855.20	        2856.80	       -0.39%	  -0.45%
> t256	5656.00	      5668.80	        5672.00	       -0.23%	  -0.28%
> t512	9680.00	      10467.20	        9744.00	       -8.13%	  -0.66%
>=20
>=20
> STREAM-10:
> operation base        smt_buddy         relax      smt_buddy_pct  relax_p=
ct
> Copy	  103034.5	114194.9	120734.5	+10.83%	   +17.18%
> Scale	  100012.0	113639.7	119969.1	+13.63%	   +19.96%
> Add	  128469.0	134292.8	140613.4	+4.53%	   +9.45%
> Triad	  114401.2	138207.1	138510.9	+20.81%	   +21.07%
>=20
>=20
> STREAM-100:
> operation base        smt_buddy         relax      smt_buddy_pct  relax_p=
ct
> Copy	  122156.6	176227.5	167672.5	+44.26%	   +37.26%
> Scale	  127074.8	167997.0	158140.2	+32.20%	   +24.45%
> Add	  140021.5	165604.5	175501.2	+18.27%	   +25.34%
> Triad	  136455.4	177236.9	179608.7	+29.89%	   +31.63%
>=20
>=20
> unixbench:
> cpu     base        smt_buddy   relax      smt_buddy_pct  relax_pct
> 1	1808.3	    1835.5	1854.8	    +1.50%	   +2.57%
> 384     113834.2    114835.7	114505.4    +0.88%	   +0.59%
>=20
