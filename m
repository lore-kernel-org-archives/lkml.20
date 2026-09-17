Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C74D4885
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659537; cv=none; b=qmIiB6hc3ksRt9UGN7xGwG06RKkyC80MvtEOHfXpTmLAixdIVQarpHbKgHIBktu1kVgtRgaSjm32KbtRdag/oZn7+oCFZV/7nrUhADI4RlkR/ENsU7/+BJ8icRPPASC4kFYoBxb6gdVZ/rn142DZf5fDXdHieTr+0zhpSYsHIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659537; c=relaxed/simple;
	bh=wPHVTD9v0wXWheVwVbJJsuZDFlHqdPTacVOKNaCOKTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/UsTyrxXCx4Gy5xiTKBQcdxNEu1fl38ywkttsJiHAf7kftpI+UWdCN8nI9RjY6nv6hJIiOQFbAmMrmdh9qE7figX5nO4/2YC16TpEEZzPtpAnluH528gtxhKhmOUrzHh8nh9VkGsFK4UPcGP2B1NL493uuANugInwXKuw1sH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cFa+nWuh; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cFa+nWuh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PVanFvhNCVM3BxxLpjzMstbj/VB/MiNfX5XS/tGswuk=; b=cFa+nWuhQM79iJIwHKgd+XwyoU
	zYv7vNh1GMK01dJVAN1uqYVgO+z32F7VkhlfRyAsHae6MV3AzQLKQujVPHMaoJ4FNU2fchKRP7bWJ
	KCKoagVtgp4kcLR4mTcOJPhySnez9rL6A/35Am2bcFXJbJ5Kgb7sjJMVOWWBT0WNIDgyGR/MzY57h
	w96U1v/4FsAsRdo8NLUVCsiKZbS/ltPSHb0t4ymkyZZu7GTpG6Xgwyx80GwD7Rj4OzVAxhdfZa8Bg
	cohKpBifINds/qY+oW10CcqtGCFvRs5h00f1J9yU7BRiL5ms56C0qSFMnUpBqGWz4Krz8TYCn/x0e
	7dYgpK9g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7EC0-0000000904K-2mDx;
	Thu, 17 Sep 2026 15:38:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A7A29301C77; Thu, 17 Sep 2026 17:38:31 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:38:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suleiman Souhlal <suleiman@google.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>,
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
Message-ID: <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917043339.2093426-3-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917043339.2093426-3-suleiman@google.com>

On Thu, Sep 17, 2026 at 04:33:26AM +0000, Suleiman Souhlal wrote:
> Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.
> 
> When augmenting PING futexes with proxy execution, we get lock order
> inversions, due to the lock order being p->pi_lock -> mutex->wait_lock
> in the scheduler, but wait_lock -> p->pi_lock in futex code.
> 
> So move the futex code to use a new lock, p->pi_futex_lock, to
> protect p->pi_state_list and pi_state->owner.

This is of course horrible. Lets not do this.
