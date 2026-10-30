Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793402669;
	b=Y9eRlgyM4ncm8jB2W3brMC2njuNvWaov7OPMYJldSyuzbQ/NKPompQgKI+kGMqAsfd14
	 7rIXMiFsTAHRDfSIbHHNfce4JrUsTSG4W6GFiKe/8lzmCZRzV28MhZcZKSzrMdgZa2vVG
	 sr0M4gb6s4JEg3K+bCE28hJpXSQ01BxXYHYnOHlGVOwNWqqz71a//db47XrVq1+hFSaEy
	 0qAp5zcnrefpOiKcCVaPadN45dKz4T0L+74BCPihFH98Ua9BKY1vG1XOuO/j+VlNtKDyY
	 d3iQPfWe1D6mMBy1KIRQezBNzkK9Kx8YjqnhaIOe9gs9bx84v/OUdkdFmt5IaG5BNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793402669;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iRUToUEYQ5+pLNami4cqTlxxaqWZbejTheSmhH26wrI=;
	b=lusQi3id/r4gic88bB2ZTuoMzOC6ZVH0VnMK0nKBvnQwOdT9shL3sz0pIPqXlNaJvydI
	 Aw32FDK2LQT2xkgz30fGihI7eWmdE8dNABOTQbn9FMG5wGZeZdTwI9zrXrfXrApYVuoeY
	 VrLk1moQuqrjTTcwz5uXljhraMtI1JFk2HF4Sjq0RyEPX6e7FdU9aYHrZe+qCfghft8N3
	 vE+B/XckAMOc3m4a0lvI4+2Kv4grGxkwYNqqS7Or6+eqCjPoXzbwF1gN5CvVd0lIh8LZ2
	 2NGQiHyCjS+fFoMbaKnwsoGk+nmmPL4+q+h8czEneW3JNj6JBhMMq0Jgcy7Z122fatA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcB6cP58;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC59606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC59606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcB6cP58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793402669; x=1824938669;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GwfwChtmUiK0DyZM4Sbz7P9UuIn3gQQ7a1p4aimiRwM=;
  b=jcB6cP58YV8s4rLHhbI0fuqy2npaMn6+Vc7UlFJoYXUyVe/T8LK74ML+
   teCTMPlS9d1fMrLOdrkotaDTrrlaY0j2Q4u/nKh7CP6alZW/vukw8qT0H
   h30Tgb3r904i7244l+tkwVLSFhf8GjccvmmE4/rEdTw5i6jBR1nhah9qy
   D/LD4y547D/YrBhjWInEF3t8NYTXp0eH7o07s0RccUDLpdMwKU708hXRj
   61YUfPNwV75XtAYYv3n7hIKgGHVQscUmdvFx/15fGK2O2mNf/Bdgzr83x
   73eSkEzFOvfNqcPoHCcCgu4J0dl1KDUBBEt2nWd/k7HJbuU8efj5xmche
   w==;
X-CSE-ConnectionGUID: NDlsHOTnQ2KvI3DnPsi6YA==
X-CSE-MsgGUID: DwJFuJWXSWe7fxhV8S2QFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2167662"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2167662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 16:24:28 -0700
X-CSE-ConnectionGUID: LTd44okxRrSWPu31oSRFCw==
X-CSE-MsgGUID: tHVvwLtnQwq545G07CYMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5445043"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.109.99]) ([10.125.109.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 16:24:27 -0700
Message-ID: <93e3e1388b3d4512818e7f1e19003e0feb4890dd.camel@linux.intel.com>
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org, 
	mingo@redhat.com
Cc: yu.c.chen@intel.com, kayracizmeci@gmail.com, kprateek.nayak@amd.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Date: Fri, 30 Oct 2026 16:24:26 -0700
In-Reply-To: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
References: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
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

On Thu, 2026-10-29 at 10:36 +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>=20
> need_active_balance() moves the only CFS task off a CPU whose capacity
> is reduced, for example by IRQ load, to an idle CPU with more.
> alb_break_llc() runs first and refuses to move a lone task off its
> preferred LLC, so if no other CPU in that LLC is idle the task stays on
> the reduced CPU. =C2=A0
>=20

The patch moves the task without knowing whether another CPU in
the preferred LLC is idle.

> Like asym packing, which was moved ahead of
> alb_break_llc() for the same reason, this is a performance case that
> cache locality should not override.
>=20
> With two LLCs of two CPUs, the other CPU of the task's LLC busy and 60%
> of the task's CPU spent in a hardirq, a CPU-bound two-thread process
> stayed there for 20 seconds at 38% of its normal throughput.  With this
> change it moves to the idle LLC within a second, as it does with cache
> aware scheduling disabled.

I agree that this is an issue.  But I have a couple of reservations about
the proposed fix.

1) There could be other idle CPUs in the preferred LLC. It would be
better for the task to move to one of them, through the idle balance
on those CPUs (via same reduced capacity check), than to move to a non-pref=
erred LLC now.

I think the LLC override should apply only when no idle CPU in the
preferred LLC has enough capacity, as your change log describes.

2) There could be ping pong migrations.  Cache aware scheduling could=20
move the task back to the CPU, because with only IRQ load on it, that
CPU is considered idle. I think this would also need to be dealt with.

Could you check nr_migrations in /proc/<pid>/sched, or trace
sched_migrate_task, over the 20 seconds on your setup
before and after your patch?  A run with 20% to 40% irq load would also hel=
p.

Tim

>=20
> Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from the=
ir preferred LLC")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  kernel/sched/fair.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..e313c6d212c6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13585,12 +13585,6 @@ static int need_active_balance(struct lb_env *en=
v)
>  	if (asym_active_balance(env))
>  		return 1;
> =20
> -	if (alb_break_llc(env))
> -		return 0;
> -
> -	if (imbalanced_active_balance(env))
> -		return 1;
> -
>  	/*
>  	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
>  	 * It's worth migrating the task if the src_cpu's capacity is reduced
> @@ -13604,6 +13598,12 @@ static int need_active_balance(struct lb_env *en=
v)
>  			return 1;
>  	}
> =20
> +	if (alb_break_llc(env))
> +		return 0;
> +
> +	if (imbalanced_active_balance(env))
> +		return 1;
> +
>  	if (env->migration_type =3D=3D migrate_misfit ||
>  	    env->migration_type =3D=3D migrate_llc_task)
>  		return 1;
>=20
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
