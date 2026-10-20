Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520088;
	b=VG3Pod4W1TZLFVyt+5sPLwE7TiVN40WNNyphK8aBY1I+Ndj0KnwHse5JdlIvc+qDd59Q
	 lviZh8/Y0w0SdCCYByTJYADgeTJkuMLq/Jj31FHsV/5dHjQJDm/GbGbpGrd5SeIobSDic
	 fR+CLiLSbTFLjJgUtj8Q7mhxi25P7JnrfPpZabbolTpFDAO6BcWtbVQ6/vzohyIOjS4w+
	 Ul9ttjUUoweqtC2Fq7lzSQmb412ULu7Jbh+6pXg2jFfZMyDNIYt8AL750DRkWsecfSHvq
	 O3beccFyuTq1XiKX+ttBy6YH1r8mWzsnCj5+uND9rNXYMDjc/psriFVcUj2b6DEwibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520088;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=cpPd+3Gl1HqVU5OtA15BBQWN0HWz8WP2kDaTgqcB4NU=;
	b=x1Tf9QUynYdNUcJ1+HZNETnJGX66xEUa9kiPNdmo5OZou7/9uTnQEGDkOfsWN79xh4RU
	 62YJeQgsilLXHMdpybDrnql+m7+mSgBAhJFX5/4Yyjz0du4UVyC9WEjV2OMQ1WKBsvUWW
	 y/VSoBsjpGmekKdbnuNXpbCLC6g3Xc6GK73UaxN508rEgkQrrhLafSSVWs42lYitkSlEF
	 gPP2AfY+CWjd9ZGCZHBBIt0zjdN7vmkQNxL3HcXWOfxI4H5ZpCJEhJ7GUu7dwfEcDX5FX
	 l7/muam4DqZucrxBDONUJc41q0RIl8xeT296AZpHJDbgI/Acza9p8v+CK6PWSqvoIpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YytNISqr;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378A5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YytNISqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792520088; x=1824056088;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9GnU9RcXqOwVK9d9kqJdumTtAtor4mIMiGCNsfjN6s0=;
  b=YytNISqrrRtI0nNUCr++01FWl6HNMPQw52h97NxnAy986DK9UXZ5g/wB
   dBysvJPTPcqdeymQ+7IN5Qw7SMOeSCBGe3KnZ05htbQ69WmEShHoN/+HT
   n4+h++XQE31vD1Ta0LfC85owMytz8w5nmGSZwJUscV0AxZMv3cy8crz36
   43gnF8aA24w4La9HqVrrYlZ2hqH8hnIGUJ7cEJV9G7oB46deXlHoJDMzv
   deT3EPw6gNfg37xdh1a5P9Go7B9YLw3/1/iY+VT2R46OYoUNiiW22gXhk
   FzoMA5RHZNFVtmB55/r4TcA4v/KQrS5igr7yU+C3Z3l/5k9BYOUC3unP/
   g==;
X-CSE-ConnectionGUID: JyRXfNPCR2OaMf/u7b7Ggg==
X-CSE-MsgGUID: vsevjhI+QNiAC6P/X4s2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1234690"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1234690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 11:14:47 -0700
X-CSE-ConnectionGUID: o79s5JPgRiqheAJw+QDDIg==
X-CSE-MsgGUID: nCaK+1tFRJmDxPEqxJZkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3188425"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 11:14:46 -0700
Message-ID: <0bca533c5667732d3490341b4f766dda5852e4ad.camel@linux.intel.com>
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
Date: Tue, 20 Oct 2026 11:14:45 -0700
In-Reply-To: <20261020161755.55690-1-kayracizmeci@gmail.com>
References: <20261020161755.55690-1-kayracizmeci@gmail.com>
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

On Tue, 2026-10-20 at 19:17 +0300, Kayra Cizmeci wrote:
> Commit d6b9afab44e23 ("sched/cache: Fix
> checking active load balance by only considering the CFS task")
>=20
> Stopped using task_util() for non-fair tasks. Since the values
> of non-fair tasks can be stale.
>=20
> __active_load_balance_cpu_stop() calls detach_one_task(), that only looks
> to cfs_tasks list. So if the rq->curr is not fair, doing a decision
> according to it is wrong, since we only migrate tasks that is fair.
>=20
> Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
> cache-aware balancing") uses cur without checking if the cur is in fair
> class or not. Fix this.
>=20
> Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-awa=
re balancing")
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
>  kernel/sched/fair.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37..6347ae4cb419 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11016,7 +11016,9 @@ alb_break_llc(struct lb_env *env)
>  			return true;
> =20
>  		cur =3D rcu_dereference_all(env->src_rq->curr);
> -		if (cur && cur->sched_class =3D=3D &fair_sched_class)
> +		if (cur && cur->sched_class !=3D &fair_sched_class)

Thanks. util was already 0 for a non-fair curr, but cur was still
passed to task_misfits_asym_cpu(), which would evaluate
task_fits_cpu() on a non-CFS task. Since nr_pref_llc_running and
h_nr_runnable only count CFS tasks, curr can be e.g. an RT task here
with a CFS task queued behind it, and active balance would only ever
detach a CFS task anyway. So the fix makes sense.

Suggest that you put a comment here:

                  /*
                   * Active balance only detaches CFS tasks, so a non-fair
                   * curr is never migrated. Ignore it and avoid using its
                   * stale util in the misfit and LLC checks.
                   */
                  if (cur && cur->sched_class !=3D &fair_sched_class)
                          cur =3D NULL;
                  if (cur)
                          util =3D task_util(cur);

Could you update the changelog to say explicitly that the issue is the
non-fair curr being fed to task_misfits_asym_cpu(), not util?

Tim

> +			cur =3D NULL;
> +		if (cur)
>  			util =3D task_util(cur);
> =20
>  		if (task_misfits_asym_cpu(env, cur) ||
