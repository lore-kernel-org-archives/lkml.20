Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30846A60E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196644; cv=none; b=kvcSPk5nuf3BDNShAMbyaIh8n2oB2lUBVwagKUFE1asp2EfSuofByprnxG7koLpkIRt+PmBF2nKx/qeUZsVyIiXodyVSx0+5Uo2VX8PqC82/pzz/lQYVZhttc0z8Vkz1Y9M6QBjvrctwaXiyfhI/nOCOAqlb5lcfl4dWl1E0HXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196644; c=relaxed/simple;
	bh=8iKKrfeGIsfYQadpq8uC8qemr8s/MTPd2XwL/VKscpo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VkVwSUoIXnlLT3kIJlGJj1B73CPkqREU+JxIl57/XjnBURtizRo7rjaInlnf5DGDZAZ46XIibDHEpk7VPR2bq4Nskrn8e1GuQIdBijopJGjktbAyGeh7NlG6wRSZYnscANdf4mV6lXdLmdiNwcyI24H04favZbenHrY/EHJ7eok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvFU9FCj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvFU9FCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788196642; x=1819732642;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8iKKrfeGIsfYQadpq8uC8qemr8s/MTPd2XwL/VKscpo=;
  b=TvFU9FCju77itZ/doJbNParTm0vWRI9oEtVMrN8vbHI//qiZsycQvmpm
   heowRC2/1InR8PHRS5zqu1sdPhkN9PwEzF7jpS1vu2rHhwUd9+V2PK7s/
   NWw6YPZ+EHLmoayFr1WTSFQLFtJgbbaCvva98uCtvLOjC1qU3rWctnExi
   yxQeQn0DAh/zRHpYFwz8ZzR8TEk8OaOKY5QofqbvAOJzUBxeiRl83JQ0l
   +IqSPnBGlYJBLaisRI3/4Byw/eMdwZrYbZVS4BqoauTLdUIbZBDxqLjh5
   tPYArXXqqw2PypCUGRVtmqGP/DNOAY+eoK5exR2tCy7eMPNzPwO1/HVU/
   Q==;
X-CSE-ConnectionGUID: pm1EMD4uQbGpaj3xhalrIg==
X-CSE-MsgGUID: KD3cGOa7RmW/Z3RkygfBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111382993"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111382993"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:17:21 -0700
X-CSE-ConnectionGUID: knhHntseSSqQjaHdeOeenQ==
X-CSE-MsgGUID: aeLxuhBBQ3Wu8+7iypl8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="307068130"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:17:22 -0700
Message-ID: <71c2ce7a2d443246755035379556382866a83156.camel@linux.intel.com>
Subject: Re: [PATCH] sched/fair: avoid creating misfits during cache-aware
 balancing
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
 Chen Yu <yu.c.chen@intel.com>, Ricardo Neri <ricardo.neri@intel.com>,  Len
 Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
 linux-kernel@vger.kernel.org,  Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>
Date: Mon, 31 Aug 2026 10:17:21 -0700
In-Reply-To: <20260831084149.GG4120091@noisy.programming.kicks-ass.net>
References: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
	 <20260831084149.GG4120091@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 10:41 +0200, Peter Zijlstra wrote:
> On Tue, Aug 25, 2026 at 10:41:12AM -0700, Tim Chen wrote:
> > Cache-aware load balancing biases tasks toward their preferred LLC. On
> > asymmetric CPU capacity systems (e.g. big.LITTLE) the destination LLC m=
ay
> > contain CPUs that are too small to run the task. Pulling the task there
> > turns it into a misfit, trading a cache-locality gain for a capacity lo=
ss
> > that's more detrimental to performance.
> >=20
> > Guard both cache-aware migration entry points against this:
> >=20
> >  - can_migrate_llc_task(): forbid the LLC migration when the task fits =
its
> >    source CPU but would not fit the destination CPU.
> >  - alb_break_llc(): veto the active balance under the same condition so=
 the
> >    runnable task is not pushed onto a CPU that cannot accommodate it.
> >=20
> > Both checks are gated with checks for hybrid processors, so symmetric
> > systems are unaffected. Tasks that already do not fit their source CPU
> > are left to the existing LLC policy, since the move cannot make their
> > fitness worse (this also preserves misfit up-migration to bigger CPUs).
> >=20
> > Additionally, if there are misfit tasks found in the load balancing
> > classification phase, prioritize misfit task migrations
> > over LLC load aggregation on asymmetric systems. A better fitting
> > CPU will boost performance more than better cache locality.
> >=20
> > Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Tested-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Reviewed-by: Chen Yu <yu.c.chen@intel.com>
>=20
> Tim sends patch, Tim adds SoB, yes?

Yeah, I forgot to add my SoB.  Added that in a followed up email.

>=20
> Also, we start $subject with capital after subsystem: part.

Sorry about that.  Let me know if you prefer me send an updated
patch with those corrected.

Thanks.

Tim
