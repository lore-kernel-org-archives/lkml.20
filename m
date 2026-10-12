Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24DA39CCFA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830957; cv=none; b=sp1euFWzCri3m4S3q3NAQJUkufbSAym/0uXNTkFog0vqBNndGKgcVQNVosk/z7AF6/C/jJsLyu0TF9N+bY22EcmA3HvFWNS2ZSmmokk51uPy2FPh4krOnRSs7O5O1iWa+xejRGrbSHXjzoVcarOoLEJ4lqNUAlfY0qiP7GuJADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830957; c=relaxed/simple;
	bh=2tduk3tp+AbNiP6Gry34FnP8tyo45f1auzYKLtVD9vA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NqT2rBst8nJllbDbtNwfGRVSpzAa3VgQ9rlVOhtEPaIJebeRdgalTWK+RBPKzvIwi30chnqS9UA+WP1Keeg0614DKrpc1qOY1k9gufae+AiRvlMwZZGnaywpBcDIHbANsha0z5Xb7FNpERtJFkZMxzDdc5Vl/6z9MkPwUuwPSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CN2OXERK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN2OXERK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791830956; x=1823366956;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2tduk3tp+AbNiP6Gry34FnP8tyo45f1auzYKLtVD9vA=;
  b=CN2OXERKEriZSlTv/Ye7lzhMySeANyOxdwfhVHm8GkSd1+dln3lIUcKW
   ArYk5BL24LtcSzqUWCLPUQN2zlAfsRA+Uf1qmUzoVFKMl8Yz6XVPQjHZ1
   zFDlT/H76clscnTdUCfJcLRCBk55PpRXtvW9Mpz+IP0PJqoqa+04cKsn9
   yBDBVxoxQPd4O0Q1vpORAvoHk3wgFl6KBab1W4YU+IOs7bliP67w8BYWM
   TgMDhWaN4NPK4n8QowwioBakvmTC1JObLs1e4YddkjYkIBb/3eP+hQ+c9
   abk+5bB/ve8Aj7Nebcr2qqG35o3Sik286z5e1aN9CKE9QA2yvGRyLnGV5
   g==;
X-CSE-ConnectionGUID: 59Esb//GQserMzV1FzDoEQ==
X-CSE-MsgGUID: xKg0H8gAQnKjUzQKM8FU2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="555246"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="555246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 11:49:15 -0700
X-CSE-ConnectionGUID: c1O0R7PvR42ZKZLDGC5fwg==
X-CSE-MsgGUID: AcK+LaTOQbGJzudm//HTlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1291437"
Received: from unknown (HELO [10.241.242.105]) ([10.241.242.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 11:49:15 -0700
Message-ID: <fd5d7aa3a61b9214b6f73ab807de7837834eea90.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Avoid publishing partial LLC utilization
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, K Prateek Nayak
	 <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, Chen
 Yu <yu.c.chen@intel.com>, 	linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 11:49:14 -0700
In-Reply-To: <A360FD1F-A067-4466-824F-5702E96F3E05@gmail.com>
References: <20261010113425.34829-1-jemmywong512@gmail.com>
	 <7c4dbf1d-ba28-484d-b7e1-a713414c284d@amd.com>
	 <A360FD1F-A067-4466-824F-5702E96F3E05@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-12 at 23:10 +0800, Jemmy Wong wrote:
> Hi Prateek,
>=20
> > On Oct 12, 2026, at 11:34=E2=80=AFAM, K Prateek Nayak <kprateek.nayak@a=
md.com> wrote:
> >=20
> > Hello Jemmy,
> >=20
> > On 10/10/2026 5:04 PM, Jemmy Wong wrote:
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -12121,6 +12121,13 @@ static void record_sg_llc_stats(struct lb_en=
v *env,
> > > if (env->sd->child !=3D rcu_dereference_all(per_cpu(sd_llc, env->dst_=
cpu)))
> > > return;
> > >=20
> > > + /*
> > > +  * Affinity retries can remove CPUs from env->cpus. Do not publish
> > > +  * partial utilization against the capacity of the whole group.
> > > +  */
> > > + if (!cpumask_subset(sched_group_span(group), env->cpus))
> > > + return;
> > > +
> >=20
> > nit.
> >=20
> > When sched_balance_rq() does a "redo" and arrives here, env->flags
> > will always have LBF_ALL_PINNED set.
> >=20
> > That would be a much cheaper check compared to cpumask_subset() to
> > ensure env->cpus covers all CPUs.
> >=20
> > Thoughts?
> >=20
> > > /*
> > >  * At this point we know this group spans a LLC domain.
> > >  * Record the statistic of this group in its corresponding
> > > --
> > > 2.25.1
> >=20
> > --=20
> > Thanks and Regards,
> > Prateek
>=20
> The redo part is right, but LBF_ALL_PINNED reflects the previous
> busiest rq, not whether the group being recorded is fully covered.
>=20
> For example, if cpu1 in LLC0 {cpu0, cpu1} is rejected as all-pinned,
> we remove it from env->cpus and redo. The next scan still carries
> LBF_ALL_PINNED while recording LLC1 {cpu2, cpu3}, which remains fully
> covered. The flag check would skip that update; cpumask_subset()
> would not.
>=20
> It also misses the hotplug window: when cpu1 in LLC0 {cpu0, cpu1}
> becomes inactive, a new balance pass can exclude cpu1 from env->cpus
> before the domains are rebuilt. The group span and capacity still
> cover both CPUs, but utilization is summed only over cpu0.
>=20
> LBF_ALL_PINNED is clear on this first pass, so the flag check would
> allow that partial publication; cpumask_subset() would prevent it.
>=20
> So I would keep cpumask_subset().

+ Chen Yu who wrote this function.

The partial group issue you pointed out is valid.=C2=A0
=C2=A0
I think Pratek has a good point.
Using LBF_ALL_PINNED is a cheap check and can eliminate
a lot of un-needed cpumask checks. We can do that first
and only resort to cpumask_subset() when necessary.  Something like:

          /*
           * A redo repeats stats published on the first pass. Hotplug can
           * still leave env->cpus partial, so util would not match capacit=
y.
           */                                                              =
                                       =20
          if ((env->flags & LBF_ALL_PINNED) ||                             =
                                                                           =
               =20
              !cpumask_subset(sched_group_span(group), env->cpus))         =
                                                                           =
               =20
                  return;                                                  =
 =20

You should also add a Fixes tag.

Tim

>=20
> Thanks,
> Jemmy
