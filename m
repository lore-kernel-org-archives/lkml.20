Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D95013D1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862216; cv=none; b=atRbkhx+mO6X0fTLBLE/5mxJ5U0xCNBM17f/Fna9LOmkgexAjyY/VDWzehefHJdmB9XqDWbvrXhcBjENCQ5raNFxyRlz730eKFh/R4KZSXvy/vYmfc6X9kfAKgN53zHjQdImPs+dwbIHkaVA0lBfkCQCLvXmjRtDH+FzsexVJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862216; c=relaxed/simple;
	bh=lwNLv1r3vRx0gBmZdBgW/HBHy+ft6ACkB5YxcOqhy0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QasVbiEsZ2EPJF9lrjJ/uPJaV6MT9f0cIX8IKTrhMM5yIAB+tN1GF2PC5UwLmJ6n3VVA04I3pyIq2Zf1vKDVDG5rB2wAy8vDpWJyKkscFPD5VYKTN6hJtYWUe0LGwzycVBP10oohC1UhaVzA7Yb5GrNhABHP9CNQsrHez6vUf98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ENbosRue; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ENbosRue"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1vsG7XiD6sL9YMmM8ppQ3+215oi1mT4W0zZcrvfdovo=; b=ENbosRuevb/A22wOki6hizCEtI
	IRBd6Osp6rZfHz1xhqMqUbBJTFuO4YF032qjFfcj3dbcj0koo/bK7NmezGb1Fq0ispAbteGxeZThM
	Ovo+gsQEJb5IVr4hDE5o5tbxQtCZoSAjZqlNU69HG2KzLJ8jXgqwVAdvbmVPGEqMOqnELevnC9U8w
	g4KJHulX/E1quz2hgO/hL16xjIsEQXf3Hu9U9PMfa+4XIO50CAbIaZn5eIYbzd9c8gOXpp7LK0aI+
	RP3+lL4QA5gRiv6EuJnzNrQV5ZmlYl2T3gXPvAA7k+6BJ7Alral4M+dFZX3yqcOyCcwgHQ6XNR832
	KtA3hBOA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCH4D-00000007p3d-2bPR;
	Thu, 01 Oct 2026 13:43:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 807A53006FA; Thu, 01 Oct 2026 15:43:20 +0200 (CEST)
Date: Thu, 1 Oct 2026 15:43:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com, kprateek.nayak@amd.com, elif.topuz@arm.com,
	sh@gentwo.org
Subject: Re: [PATCH v2 1/5] sched/fair: Take slice protection into account
 when arming HRTICK
Message-ID: <20261001134320.GR2009045@noisy.programming.kicks-ass.net>
References: <20261001134016.3881268-1-christian.loehle@arm.com>
 <20261001134016.3881268-2-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001134016.3881268-2-christian.loehle@arm.com>

On Thu, Oct 01, 2026 at 02:40:12PM +0100, Christian Loehle wrote:
> EEVDF can end a task's slice protection before its virtual deadline when
> shorter requests compete on the runqueue. update_curr() requests a new
> selection once protection expires, but hrtick_start_fair() still arms the
> timer for the virtual deadline. Without an intervening scheduling event,
> the next opportunity to reconsider the task can therefore arrive much
> later than the protection boundary.
> 
> Arm the fair hrtick for the earlier of the virtual deadline and live
> slice protection. Keep the deadline fallback once protection expires.
> With RUN_TO_PARITY disabled, vprot remains the minimum progress quantum,
> so the timer must reconsider current at that boundary too. A same-task
> repick restarts the timer without renewing protection, so newly eligible
> tasks can compete without waiting for another protected quantum.
> 
> A wakeup can shorten protection without preempting current. The enqueue
> path calls hrtick_update() before wakeup_preempt_fair() updates protection,
> and hrtick_update() leaves an active timer alone. Recompute the fair
> hrtick after update_protect_slice() changes vprot, including when a timer
> is already active. If the new protection boundary has already passed,
> request lazy rescheduling, as update_curr() does on protection expiry,
> instead of falling back to the later deadline.
> 

Right, so I don't much like this. This wrecks the steady state behaviour
in favour of our 'dodgy' wakeup heuristics.

I would much rather we stick to the paper for steady state, and let
wakeups be wakeups.
