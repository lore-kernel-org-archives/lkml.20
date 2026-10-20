Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526523;
	b=N2NQ9yewpkiHvY4bdq4gM1K1+lZxTr1T1zf0MD4pMjemyTkS36Q9nWeX8nO0coMDRtq4
	 4usQOOl3eRQvHXR6giqG65OW5FfuPcB3W1Qm8IheUacxrSq8rXtf/EV8sWzCAY2rgTcOA
	 CoeSsZNdYuIhkERRVVbDVk0oMhSx6YY23lGVFG16xwvcHn4Isuhd5TYlQIxVB+lXjEBA5
	 tCqGrna3xcawsLWgAFyBhNPCbmtHmJ5vrEN9Xh/R7wGVou77F0mCQG5qoNYFvhlfOakz6
	 VFBkn/7/KqaOFt26iD+7CR9SvP0bN6vwNgpf4FCt4Nu/nmC2aJ4KlaGs6naIPcSIiYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=JHXwTP335MxDgP+BPDXR7Sif4BPFnwVWZi4BilcXnUE=;
	b=0iLsxXg61S5Bvz4SinxmtlGSD+BvvvYSADFPFlo1XGbTruWvMNqm3Y/j+OizUxz3qCyW
	 ABJJY9LuMoAIgDD7zO2IylAPtoiyTrikPfAKpJKhm724ZHXC8Dx+j0Mim1tDHdGoLwzqe
	 6wb5wM4kgxYd2hkktsjnXREt1QS7jugUcvaAqhHUs/IhEkC08Uqusdl/KhWySrNW7QSty
	 KKF4aK5ezmBmWxZyhnKkjKqEXvQ5oqGZOOOthOaXTg0MCWYqwikls9pHUMHS0wOSEcN+H
	 zPs1cUcMIHRvI1/QbyhorgqnB4xpyvSdfDhPMUD0Ii5gmRlQMMY2w1v8lMU7tKInb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UOqol7H6;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB12606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UOqol7H6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792526523; x=1824062523;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Iz9a2HXW9rNhwpna6g7KdeGMBg4TiEzYBy3JslOSDfo=;
  b=UOqol7H6cfPdiKQ9pEOS8vvBtFL+QzGGyq9LdntmFuUnv4nh9uFUE2Xz
   s6r7z20rOFfhwPsp6Lpp1un11H+fgMNvkr1zoqhgSBfu5Q75Sdy0Q93iQ
   pVaVt5JZmqs1DPnLGWKilR8DEq6g3Iz9uEzeAt5fgcZs8rUPLikZ0czVs
   uRzJntOkWCV0mDRTrF2hfihksttaHOKsG/tVoDqhRIs+qjPvvkptd3kz9
   RzVJnXk5s96StJemQyr7mV74QlDIzVzPWzCub9DK8Olmit3BGtuQDgK0G
   LShYNGk2tDEDyTpg4anmWrCBeOes9/UyhUAHRspQaWUijWmGWKKmDkizD
   Q==;
X-CSE-ConnectionGUID: Jq9o34ITQTqtyerjkTg4jg==
X-CSE-MsgGUID: cpRgXpW9QlioXiCrB0LD2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1134150"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1134150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:02:02 -0700
X-CSE-ConnectionGUID: oc4JofqPSbGCmSOWyZB6gA==
X-CSE-MsgGUID: FG5SfCQbTvKkCfCtvsEjvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008852"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:02:02 -0700
Message-ID: <96c89ebc2cd7f8217e0053a7e5302594fb039683.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Ignore non-fair current in
 alb_break_llc()
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>, peterz@infradead.org, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Ricardo Neri	
 <ricardo.neri-calderon@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 13:02:01 -0700
In-Reply-To: <20261020185402.57017-1-kayracizmeci@gmail.com>
References: <20261020185402.57017-1-kayracizmeci@gmail.com>
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

On Tue, 2026-10-20 at 21:54 +0300, Kayra Cizmeci wrote:
> Commit d6b9afab44e23 ("sched/cache: Fix
> checking active load balance by only considering the CFS task")
> stopped using task_util() for non-fair cur.
>=20
> __active_load_balance_cpu_stop() calls detach_one_task(), that only looks
> to cfs_tasks list. So if the rq->curr is not fair, doing a decision
> according to it is wrong, since we only migrate tasks that is fair.
>=20
> Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
> cache-aware balancing") passes cur to task_misfits_asym_cpu()
> without checking if the cur is in fair class or not. Fix this.

Sent out a suggested update to the commit log of v1 before I saw v2.

This updated log and patch looks okay to me.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

>=20
> Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-awa=
re balancing")
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
> Changes v1->v2:
> * Add suggested comment (Tim Chen :>)
> * Change the changelog so that it says the issue is passing a
>   non-fair cur to task_misfits_asym_cpu()
>=20
> This versions not compile-tested. Tho only change is this comment,
> so it should be fine. Right? ;-).
>=20
>  kernel/sched/fair.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37..9d7fd6cec376 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11016,7 +11016,14 @@ alb_break_llc(struct lb_env *env)
>  			return true;
> =20
>  		cur =3D rcu_dereference_all(env->src_rq->curr);
> -		if (cur && cur->sched_class =3D=3D &fair_sched_class)
> +		/*
> +		 * Active balance only detaches CFS tasks, so a non-fair
> +		 * curr is never migrated. Ignore it and avoid using its
> +		 * stale util in the misfit and LLC checks.
> +		 */
> +		if (cur && cur->sched_class !=3D &fair_sched_class)
> +			cur =3D NULL;
> +		if (cur)
>  			util =3D task_util(cur);
> =20
>  		if (task_misfits_asym_cpu(env, cur) ||
