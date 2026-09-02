Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC723B1ECC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379969; cv=none; b=iZMHpGmJT+a8mXnHQirZNL1ccVYybP3gz0Juvd323ShOzYEQnqViT84IiD10fvdOcZC6PC9CXdlKopQoikLeyqgykjhW8u3sEsj8vgvPqZAf7Pl1Wt30JGJ0ZS8GHECh89AlozyU3qIFU/LKSi8zFV3J9VqWwcPMihdeP6+fg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379969; c=relaxed/simple;
	bh=Q9Vi+mj5yVT2JDYIAZz4gPOjf4XKiS0mrZm0rGA8woI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1TuyaUAkEFBoiqt5hgupfrC0wl7iReIWqlHVPzeZJpa9nBT0CNVIQ6XiGfE7mMGoYpNZcFzIQjGkPI7YqvUDXFDHoF3Qc/KHfOW3dHjxsx+AHgkCSt2aGtu/IEyoR8zpIbsUUXvHHe9yF2JmKrwCFaGGP8i1bnyeJJ/yb0a++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=budlNcaZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="budlNcaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788379966; x=1819915966;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Q9Vi+mj5yVT2JDYIAZz4gPOjf4XKiS0mrZm0rGA8woI=;
  b=budlNcaZVXU+bKiTeKb9Yc/6/VhuoQr5xNI95Ez/ooxKl95G0V0CNpia
   GfY393qXgIePo3icV77yldDEnyxu+r1Z3yxbyOM+4T64E+Nx3aV7fHWyn
   s+Kizpqlb/YJG9hvln4LLadviOZRHHf8aiwPlfUgdLjMuGLMIyKsNkCPy
   mJgRmmutbLE/VnBCMjhAmgbuJ6LiPuezdZjSukoEVSEzCMIE7oRb+Ikxj
   eO++zKgO2O2dpjwECEez/3ZF7bwXNmuTyU63TlG3QQXFHTBCSIBTVN21j
   jszO/EnkkdqLNPTPE7EqQmEzaZvpBPD/7Q2co29dGlD603zVoqQ519vWe
   g==;
X-CSE-ConnectionGUID: OFyxTfO/Te6mqFyD26yIkQ==
X-CSE-MsgGUID: YDtav9qrTa2a4wYMXM9hSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88699173"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88699173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:12:45 -0700
X-CSE-ConnectionGUID: vTuM+mWeSH2RAjWl/RGgTw==
X-CSE-MsgGUID: drVJlz5VS0Co8W/SHutW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="293018429"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:12:45 -0700
Message-ID: <c5a2d651a5d647fb29f13fe483301b3b6e292b4d.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] sched/cache: Use execution context for cache task
 tick
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hui Su <sh_def@163.com>, peterz@infradead.org, mingo@redhat.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 jstultz@google.com, 	metin.kaya@arm.com, connoro@google.com,
 yu.c.chen@intel.com, 	linux-kernel@vger.kernel.org
Date: Wed, 02 Sep 2026 13:12:44 -0700
In-Reply-To: <20260902163336.1552840-2-sh_def@163.com>
References: <20260902163336.1552840-1-sh_def@163.com>
	 <20260902163336.1552840-2-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 00:33 +0800, Hui Su wrote:
> Cache-aware scheduling accounts CPU runtime to the mm of the task
> actually executing. update_se() passes rq->curr to account_mm_sched()
> for this purpose.
>=20
> With proxy execution, however, fair_sched_class::task_tick() receives
> rq->donor as its task argument. Passing that argument to task_tick_cache(=
)
> can therefore queue cache_work and update the cache scan epoch for the
> donor's mm even though the corresponding CPU runtime is accounted to the
> execution context's mm.
>=20
> Use rq->curr for task_tick_cache() so cache scan work is driven for the
> same execution context whose runtime is accounted by account_mm_sched().
>=20
> Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-awa=
re load balancing")
> Signed-off-by: Hui Su <sh_def@163.com>
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 09ddb3802c28..866f2a5dd101 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15045,7 +15045,7 @@ static void task_tick_fair(struct rq *rq, struct =
task_struct *curr, int queued)
>  	if (static_branch_unlikely(&sched_numa_balancing))
>  		task_tick_numa(rq, rq->curr);
> =20
> -	task_tick_cache(rq, curr);
> +	task_tick_cache(rq, rq->curr);

Thanks for raising this issue.
I agree that the execution context should be handed to task_tick_cache().

However, the donor may be a deadline or real time task, in which case
task_tick_fair() is not invoked at all -- and we still need
task_tick_cache().  Note that account_mm_sched() does run in that case,
via update_curr_common() -> update_se(), so rq->curr's mm keeps being
accounted while mm->sc_stat.epoch, which only task_tick_cache()
advances, goes stale.  After llc_epoch_affinity_timeout epochs
account_mm_sched() then resets mm->sc_stat.cpu to -1 and we lose the
preferred LLC.

So maybe the check belongs one level up, in sched_tick().
There we can test whether rq->curr =E2=80=94 the task actually running =E2=
=80=94 is a=20
fair task, and call task_tick_cache() and task_tick_numa().
That test is the same p->sched_class !=3D &fair_sched_class=20
one account_mm_sched() already does.

sched_tick_remote() would then need the same two calls added.
Without them, nohz_full CPUs would stop getting them at all.

Tim

> =20
>  	update_misfit_status(curr, rq);
>  	check_update_overutilized_status(task_rq(curr));
