Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72C4FB9A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456189; cv=none; b=AcUT13cT77S+7kTtIst+AfX1lnAF161tis8ZnmgPG03vuGkrPTEUJSTgiWF7th2TfKH+Ivw+4TPoTqFuHBOGhrtsreaqXahnSW2KhdKqgxQf5gep8Uw23MFZBJg665JVEDgP5eYtbtgEzae6efPMyozYRMx+SdDyxjWc9z9q4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456189; c=relaxed/simple;
	bh=2CAytTgZ/VhI8i9KfzuySsfd4wCy9Fxaqy2eJItOw9A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fDKkYQ8sfakkEEhr7yaXHmKQF3OFOdCx9YjvH90eiXefg4QFRKT2GEI8pJpV66oE1UV8LxW4aXDSgMhccxb38fiV+pbx5a1WWeo5Ck6l4AO0yhSJezhvRFT7xA8i0Za2VOlNUZY1HyiBlO5GQl6AqnExnQBbA2tUqhR67c30IVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUzdsHfK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUzdsHfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788456187; x=1819992187;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2CAytTgZ/VhI8i9KfzuySsfd4wCy9Fxaqy2eJItOw9A=;
  b=hUzdsHfKLKsOO65eGum5xD6zz4SR2N3uy4VM4cq0ICMATfd6qvwp6ogw
   Eg2qkqyJuiMYNzoRseuont6x1+bj3ACbj9svZwEW6UmvGN+PLpvcsSpJT
   o4e53X07CS7ruMs+Emy2Y9tWLfBbJ/31iqcHzmHKdD1+bqp9oaRg1CDqH
   OwhovO8tKQtBf71anQnPhyPm4U8sML958l37tzjD5aLd1005nWl5b48Bs
   KKdlptC1OWqLgoHEmR12hAao6FF3qHl5WgV79IL2yDJ7IcTI1dKa8piFq
   sKq6qGsA2J0h3UK0GCe/xlc2ZQ6PJUN/srDGImFWgUkFbRTB5bAPi5jO1
   g==;
X-CSE-ConnectionGUID: FcRAfPMgRqOFpJXtXIIdwQ==
X-CSE-MsgGUID: juVjbaZXTQSpkieO72xO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114492927"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="114492927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 10:23:06 -0700
X-CSE-ConnectionGUID: 5X+1Zoe9TDqIenyNirmvgg==
X-CSE-MsgGUID: FKA/6MVsTFe1YDm5qNzTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="263604101"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 10:23:06 -0700
Message-ID: <0051f02bd8d6f69fa7018b34386ccc22034dffde.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] sched/cache: Drive cache task tick from
 execution context
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hui Su <sh_def@163.com>, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar	 <mingo@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot	
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Valentin Schneider
 <vschneid@redhat.com>, John Stultz	 <jstultz@google.com>, Chen Yu
 <yu.c.chen@intel.com>, 	linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 10:23:05 -0700
In-Reply-To: <20260903041154.2479761-3-sh_def@163.com>
References: <20260903041154.2479761-1-sh_def@163.com>
	 <20260903041154.2479761-3-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 12:11 +0800, Hui Su wrote:
>=20

[snip]

>  void init_sched_mm(struct task_struct *p) { }
> =20
> -static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> +void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> =20
>  static inline int get_pref_llc(struct task_struct *p,
>  			       struct mm_struct *mm)
> @@ -15042,8 +15042,6 @@ static void task_tick_fair(struct rq *rq, struct =
task_struct *curr, int queued)
>  	if (queued)
>  		return;
> =20
> -	task_tick_cache(rq, curr);
> -

May be worth adding a comment here. Say you consolidate the
exec context stuff to a new sched_tick_exec_ctx() helper.
You can say something like the following here to help future
reader of this code.

+       /*
+        * Note: misfit, overutilized and core scheduling state describe th=
e
+        * entity the load balancer would move, i.e. the scheduling context=
,
+        * and therefore stay with @curr rather than with rq->curr. See
+        * sched_tick_exec_ctx() for the execution context counterpart.
+        */
>  	update_misfit_status(curr, rq);
>  	check_update_overutilized_status(task_rq(curr));

Tim


