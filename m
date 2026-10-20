Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526221;
	b=GYUU3KGkvB1ZajZVEOvXoUnGFTOFe8f9KDHgAj2/aXxuasv/6pynKviMT5FgGZV6cjll
	 X9DkOskzm2Z0D7+2+RjiuXyn/gPg1bvA2PqRuKBlKzYl52L94GfU0ZthWi9iOaLAZ8Wxa
	 p8Y0QAms3VNa3Lf0Rqij8xLhTE/0wVZD8y7qJxXagLuxsZ2ZzYLPsDJeMUnKOptvxOTyi
	 2lrTO2n7nuaZFvzTtbBPDFdfKSHgpo3tXJK/Wjafes3RA7xkXGsv96BKDXXjFbCU434Z8
	 Af7XJTMJ6jliA87nFyETi0M9PgiHWho9NHGgjivw5RBLrxWEulVV+YfKIw4fr/5UoqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=ZHJqnjP8g/3yDGwxBSj5xvPKD1sNfHJrCGIjTMarSAw=;
	b=LTHv9AtOGQ2i4XmZiWp68qPHGhrmq4Hkoxko3XD175XFjSj5UeODgvt3l79OOmp3gLZ3
	 dnDS5gBsJCqdfWVkHHNrtve8fVDcfhQMHg8dWe9BlSx+CSPPxPq/cuzJGwSVnYWpv0MFY
	 1wFxsR5ON5Dt0ifUBDtBDPOFh0PtQxYfMuZttikTEQ0lA2y4LskA8Xn3rm41cBV0lP49k
	 345cojfAJB/gIVY91sQI+YVu9IDiqzRy1WFeiKBBrggnyeHOqVzTxxo7+FkUBjDV1QScV
	 PifdrVO0WCptmTdoR1PoQY67oeOGSHd7VevibuXoe9VhOew9Fxmo3pBruJLyUjwQwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePwCjIbN;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B104E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePwCjIbN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792526221; x=1824062221;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=awu3qVpHXeUGdCR1yBLT1pFtzDDKmfiOadqoWwHL7OQ=;
  b=ePwCjIbNU6ocHPCJtTvU7Opc59E1VuzC6zo365TNGPFyGtNwglFRmc0x
   rEHkxZXX5VtrCEevA/PYOIYCe50m6rPQ+2AUoN6+nA/mmCppgOlDOrcLr
   W1Ro/xoxJNHpX0JhnhhdNrePv0xG6BJ8iMKnMf4wpip612L9tG76oCKrf
   pQzXZk412vR/KUDnjmfJJs0TP63V4UQal+NWMf48sCO6zcIGHjAhEPclx
   qQfz92pG1mdrPGeiRpZ8SyQC6pt4zg9vglVOxfiUjf9acjgi5r5jz7maZ
   IqRKJkr8WGnrAyNTR4WwnwNDJNoUG1B3vAFHcUDjfTV3CFhKPHQWjFlWZ
   A==;
X-CSE-ConnectionGUID: UhAjudbtSdWp1egeULDKfg==
X-CSE-MsgGUID: 8AC59iloQGaa0OS1BvA8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1220499"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1220499"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:57:00 -0700
X-CSE-ConnectionGUID: CZwSjB9fRNC3N+m/KAtdNg==
X-CSE-MsgGUID: 7NjMx2TgTaqykoTjw5wHBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4643579"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:57:00 -0700
Message-ID: <ed3daf45d18d539c849b1e6c804fc9dca961b028.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Ignore non-fair current in alb_break_llc()
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>, peterz@infradead.org, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Chen Yu	 <yu.c.chen@intel.com>, Ricardo
 Neri <ricardo.neri-calderon@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 12:56:59 -0700
In-Reply-To: <0bca533c5667732d3490341b4f766dda5852e4ad.camel@linux.intel.com>
References: <20261020161755.55690-1-kayracizmeci@gmail.com>
	 <0bca533c5667732d3490341b4f766dda5852e4ad.camel@linux.intel.com>
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

On Tue, 2026-10-20 at 11:14 -0700, Tim Chen wrote:
> On Tue, 2026-10-20 at 19:17 +0300, Kayra Cizmeci wrote:
> > Commit d6b9afab44e23 ("sched/cache: Fix
> > checking active load balance by only considering the CFS task")
> >=20
> > Stopped using task_util() for non-fair tasks. Since the values
> > of non-fair tasks can be stale.
> >=20
> > __active_load_balance_cpu_stop() calls detach_one_task(), that only loo=
ks
> > to cfs_tasks list. So if the rq->curr is not fair, doing a decision
> > according to it is wrong, since we only migrate tasks that is fair.
> >=20
> > Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
> > cache-aware balancing") uses cur without checking if the cur is in fair
> > class or not. Fix this.

I suggest rephrasing the log a bit:

  Commit d6b9afab44e23 ("sched/cache: Fix checking active load balance
  by only considering the CFS task") stopped using task_util() of a
  non-fair curr in alb_break_llc(), as the util of non-fair tasks can
  be stale.

  However, commit f0d243a96f26 ("sched/fair: Avoid creating misfits
  during cache-aware balancing") still passes curr to
  task_misfits_asym_cpu() regardless of its class, which then calls
  task_fits_cpu() on it. A non-fair curr is never migrated by active
  balance, since detach_one_task() only picks tasks from cfs_tasks.
  Ignore a non-fair curr so it does not affect the decision.

Tim


> >=20
> > Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-a=
ware balancing")
> > Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> > ---
> >  kernel/sched/fair.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 0feec172fd37..6347ae4cb419 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -11016,7 +11016,9 @@ alb_break_llc(struct lb_env *env)
> >  			return true;
> > =20
> >  		cur =3D rcu_dereference_all(env->src_rq->curr);
> > -		if (cur && cur->sched_class =3D=3D &fair_sched_class)
> > +		if (cur && cur->sched_class !=3D &fair_sched_class)
>=20
> Thanks. util was already 0 for a non-fair curr, but cur was still
> passed to task_misfits_asym_cpu(), which would evaluate
> task_fits_cpu() on a non-CFS task. Since nr_pref_llc_running and
> h_nr_runnable only count CFS tasks, curr can be e.g. an RT task here
> with a CFS task queued behind it, and active balance would only ever
> detach a CFS task anyway. So the fix makes sense.
>=20
> Suggest that you put a comment here:
>=20
>                   /*
>                    * Active balance only detaches CFS tasks, so a non-fai=
r
>                    * curr is never migrated. Ignore it and avoid using it=
s
>                    * stale util in the misfit and LLC checks.
>                    */
>                   if (cur && cur->sched_class !=3D &fair_sched_class)
>                           cur =3D NULL;
>                   if (cur)
>                           util =3D task_util(cur);
>=20
> Could you update the changelog to say explicitly that the issue is the
> non-fair curr being fed to task_misfits_asym_cpu(), not util?
>=20
> Tim
>=20
> > +			cur =3D NULL;
> > +		if (cur)
> >  			util =3D task_util(cur);
> > =20
> >  		if (task_misfits_asym_cpu(env, cur) ||
