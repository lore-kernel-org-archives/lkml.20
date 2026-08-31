Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A824293C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165725; cv=none; b=rRUGfQQ1gb+WOLMPl9nsTTLFeonrAn6fzBdIG1Lv6OxKM6O5gGNmTZzUJiwZ9gzCnO58GykhPxAPDvHurSi+Jv73g3MrRsPU9WfEBBbg4MMAVn9NJ+O40JzodM0DrH+BEDuaSnf97ejDN34rmEda3HSygHNFPc1tLjPkrHCNsFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165725; c=relaxed/simple;
	bh=bZGz3hRMdWzA5iUNb2gMNM1s2jD/9qNs0udQGVk49hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt+BwqxlO5QU2Gmxk1HEK47VlT+P5WlD21OrJ6GV1cfL07uIRXOW+YxLjgFpAyb0yQhSjFMwv9lPNKGyszAFc2xHErfEjPcoGcti07T/XLNCFNS+dqGuu3v64qFFm0b7hzyWlzsWw4/3iKoY8r56qbQZTkrhxp1XPVZkGVNRmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gNrTUDx8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gNrTUDx8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zdu0rTEgbzFagZLehqaRa0zvAA87HwwdgF0KAAoQ/Ww=; b=gNrTUDx8FchBqNFbDRx0DYcGTH
	msPkpV6X2IbEv98cMJ+z3N9EpgxhOKc0Q/0ibq9FX7VNCp8d0NVQyvRPVeyiliBza4s4NFS19a+G2
	mI3A1B9sP9MkXQ+o3bPAq4DVDn3TElKpHlDjc35wVljtHlX5amZcx4Gn7W1T0hatYR5n2YJXHur3Q
	S5x7ir+WRJdUoYPzQAVzFuNHlZxk5Mi3dx/lSMGSYEALeFpR58E6/9R8Tvnm80SlNs38g6L4DWmKR
	fSJPFSohpJGTk+esBMfFlNbDWGsX4wdW2Ue5yuxhHok1Vt79g0hSgMnpzrU3QMSeNThr7IVan3MUG
	Mu/VG41g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xaQ-00000002v9f-2MXa;
	Mon, 31 Aug 2026 08:41:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D419301A42; Mon, 31 Aug 2026 10:41:49 +0200 (CEST)
Date: Mon, 31 Aug 2026 10:41:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Ricardo Neri <ricardo.neri@intel.com>,
	Len Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
	linux-kernel@vger.kernel.org,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH] sched/fair: avoid creating misfits during cache-aware
 balancing
Message-ID: <20260831084149.GG4120091@noisy.programming.kicks-ass.net>
References: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>

On Tue, Aug 25, 2026 at 10:41:12AM -0700, Tim Chen wrote:
> Cache-aware load balancing biases tasks toward their preferred LLC. On
> asymmetric CPU capacity systems (e.g. big.LITTLE) the destination LLC may
> contain CPUs that are too small to run the task. Pulling the task there
> turns it into a misfit, trading a cache-locality gain for a capacity loss
> that's more detrimental to performance.
> 
> Guard both cache-aware migration entry points against this:
> 
>  - can_migrate_llc_task(): forbid the LLC migration when the task fits its
>    source CPU but would not fit the destination CPU.
>  - alb_break_llc(): veto the active balance under the same condition so the
>    runnable task is not pushed onto a CPU that cannot accommodate it.
> 
> Both checks are gated with checks for hybrid processors, so symmetric
> systems are unaffected. Tasks that already do not fit their source CPU
> are left to the existing LLC policy, since the move cannot make their
> fitness worse (this also preserves misfit up-migration to bigger CPUs).
> 
> Additionally, if there are misfit tasks found in the load balancing
> classification phase, prioritize misfit task migrations
> over LLC load aggregation on asymmetric systems. A better fitting
> CPU will boost performance more than better cache locality.
> 
> Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Tested-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>

Tim sends patch, Tim adds SoB, yes?

Also, we start $subject with capital after subsystem: part.
