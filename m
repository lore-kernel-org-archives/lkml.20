Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730664;
	b=q8i5g1XiTuGFd3WsAQ6/bw9S5PDJI51/bfyBXVM663WEdVqJjgWjB0DSlt73qqE47g36
	 hAywlktHB/N5rO+f8+NVl7/AO7uk0aCoL4bFbPoQ6VeeaR9CYEOOBX+6vg+PBMHJm8CZY
	 nwth0E1625y+FKvCUpxxG7ctxgTMYHx8kF/7vaIrBDiHmRBqKQNJ9bdPFBu1M5Y9y2USf
	 wmTzX5ZvPn/wsWW3NuEE0ZOaT2NFm6jtZGwvlmjqAHdzr1maoABDlhUXqpcVkRpuRrE6C
	 9N+xjka0urswE+7PQNvz1LG2uHtvZEWa0oVBD6mHJb720QGLqqjUnndJBvq5FzvWc9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730664;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LYA6yi5NMLYhekD/8gFnXEyoXnXXWPArMhhtuI60vcc=;
	b=C+PQu7Udm7pMoj87JScmMrAbkJIEYodQYdSm7DN3kVk7GT3VjmgzqqT8d/0bQ+8fwGON
	 6aOvcJ6+F3WRzCGPyyvPXqg+DfVteqAdYaJd5vOHNyRZ/jRyCt5rDN1GGVyhpkkU5xXxy
	 16cb0geLTnUaHAOC3vVFWL//neaQYZY0j/5kn2EjGRsyAor1hFvCGT/4K7MQwUP0kILGa
	 YMrfckJcemZNm3ZtLSW2zVhg/EyJE4BLkV/ulzkQkIdUZ8+rMxIU1BWioTpWoi6BmplBt
	 rjjGi1v0RsZ9n+4IFAzFhaUSV9fIk8btvi9/MzfFWaycMBLqgRMRcLjtUixG5e1JKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCXN0tf+;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7772606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7772606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCXN0tf+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793730663; x=1825266663;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Ycgz008Gvth+ctSBnLKeTPtI9lm/efL5I0aLC6JWCfI=;
  b=MCXN0tf+qj1zhvudpaLgRyNRGd8uABVX0LYVFoga1g2eTdtKT0WiRQRG
   BavNaZ78VfZn8OR9FDsvnkDIYLU/An8H2LugYSwpsmOuSq9YcqO+yiGCQ
   WIhv/HAMcDyTuZqhRuOZpwS7zF9iUD7j84UF4ZrKsRH8yWV+Ht+EctCV+
   krwzSwpMn9EiAkMXoUL38ji1a5jZp+HsGHqbqhX/KE8qFavXrf4oS6yEP
   /9Jyv/6dpiTbogFoI8Tm1hGoH7j9mYSIsIviZIf6Etnwx+ayaxk/G249x
   N2kPgywJk3aCcpCYi0MDyw9VLMNf2OnEk1My/3dILEu2ckOdljGoh8Dtp
   A==;
X-CSE-ConnectionGUID: liovQxZXSVmKus9XDX9WLA==
X-CSE-MsgGUID: hX5eX683SViirp8nkRrfng==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2348907"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2348907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:31:00 -0800
X-CSE-ConnectionGUID: U0HIhJN6SIWBHxmPIlarMQ==
X-CSE-MsgGUID: 8xBk0smZSUCRFOmt+IGdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6494317"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:31:01 -0800
Message-ID: <fb4a9d54488c92206c0f983f7cc230d71db3b192.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare
 thread and CPU counts
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org, 
	mingo@kernel.org
Cc: qyousef@layalina.io, yu.c.chen@intel.com, vincent.guittot@linaro.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Date: Tue, 03 Nov 2026 10:30:59 -0800
In-Reply-To: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
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

On Mon, 2026-11-02 at 10:15 +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20
> invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> CPU count, only for its 20% margin.  Qais's series changes
> fits_capacity() to take a CPU number as its second argument, and this
> call would then pass the CPU count as a CPU number without a warning.
>=20
> Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> x * 1280 < y * 1024, so there is no functional change.
>=20
> Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina=
.io/
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> This keeps the 20% margin.  Qais would rather not add hardcoded
> margins, and llc_aggr_tolerance already scales the LLC size here, so
> the margin could go, but that changes when a process stops being
> aggregated.  Tim, Chen Yu, would you drop it?


Xusheng,

We tune the system based on a default llc_aggr_tolerance of 1,
where the number of running threads is 80% of the number of cores,
to prevent over-subscription which could lead to regressions.

This 80% factor is leaning on the conservative side to prevent
regressions for workloads where cache aware scheduling may
not help on multi-threaded process with little shared data.

We set the llc_aggr_tolerance as a default of 1 for more intuitive
tuning.  It varies from=C2=A0

0 (no aggregation),=C2=A0
1 (default with conservative aggregation)
100 (always aggregate)

Hope that makes sense.

Otherwise, the patch looks good to me.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

>=20
>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..dfd6528d18ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache=
_group *grp, int cpu)
>  	return false;
>  }
> =20
> +/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPU=
s? */
> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 5 < (u64)nr_cpus * 4;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_st=
ruct *p,
>  			   int cpu)
>  {
> @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group=
 *grp, struct task_struct *p,
>  	if (scale =3D=3D INT_MAX)
>  		return false;
> =20
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_thr=
eads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_thread=
s,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
> =20
>  /*
>=20
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
