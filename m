Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E15399346
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481735; cv=none; b=JlUgWaWZtUQST/wTzsbrvc+xtu864mVrx3RtcYkBrPScBXS/iCYtc+oegGHVtGYlik2IPxDq0+02hdalA5+B5axmMXpGXufNZvYOAdOCRcxloZ9pM3ZdoGbSj/Hf+kKAVbSLvZ9EAxkHcRJ3yaFATHqMocUfiALZrEPwog6c86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481735; c=relaxed/simple;
	bh=vOV7bWjrFa4ZVA9xuj/sBvJYyAeu13Y/UVCcL9X9cOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQkPe6+AewRiNvWf345wCph9sD6Je5BbaWHku3H/+49wt18R5GRz14N031D2ehdmf9bUsdCsTSteAw8+8d9NI1f0S0NLRw35aGVXg5vbm+cWra2AeyB01mlFbfUhkDpE3cpuFbt8aTXf1jyPSyE0UDXy4hgDu15ezTgtAmNJgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xlh7ZHEA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xlh7ZHEA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ylui/XjdIqNugBdG26QbOKnDWAYQin+Cyhkytw4ndUk=; b=Xlh7ZHEAsBJ22vgeUB51ako/aJ
	9lptC5YUcw91WkRi6f01lghOPfWunSMZg7tFkIyiNAUW1P5FKh+Ua8Sr7s60avarr4XIA1WA+1zoJ
	mh2W35oU2ugPlX7r6GaeIIvSKSQ6K+4wrsjP+Ss7vij3vt9jmF9RWpO9hh6mxI2Jjw2Y96/Sj1mea
	cfeYIAV7sRBJe63VX33c4gIumOH4mt1D1TCbv6D65p1iR9XYRGd3o39rcEF5zujzyc6zplQMUrIuM
	OaaDFTh0mdTMjDqRkJTOeEZ0W7N42P92lC3Fn46fOyLX2kQ0/uqHai7xWCvTkrIA6Pwr/xxX+FULi
	gE6F0XhQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TwT-00000006s9O-0syW;
	Tue, 15 Sep 2026 14:15:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C085300969; Tue, 15 Sep 2026 16:15:24 +0200 (CEST)
Date: Tue, 15 Sep 2026 16:15:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 4/9] locking/osq_lock: Delete 'fast path' code
 from osq_unlock()
Message-ID: <20260915141524.GD4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-5-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907084133.3696-5-david.laight.linux@gmail.com>

On Mon, Sep 07, 2026 at 09:41:28AM +0100, David Laight wrote:
> The 'fast path' code in osq_unlock() is pretty much exactly the same as
> the first pass of the loop in osq_wait_next() except that it doesn't
> have the optimisation to avoid the locked RMW when not the tail of
> the list.
> So just call osq_wait_next().
> 
> Move the assignment next->prev_cpu = old_cpu into osq_wait_next()
> as it is always the next line.
> Rename osq_wait_next() to osq_unlink_from_next() since that is what is does.
> 
> Change osq_wait_next() to use atomic_cmpxchg_release() (not _acquire)
> on lock->tail.
> This is what osq_unlock() did and seems right to me.
> 
> Add an smp_wmb() before the 'prev->next = next' assignment when cancelling
> a lock. The previous 'next->prev = prev' assignment lets the 'prev' cpu
> complete an unlocking sequence and do its 'next->prev = prev' assignment
> first - corrupting the list.
> 

This is horrible. From the Changelog alone this should be at least 4
patches.

I've tried to recreate this one patch and ended up with 5.

Please, small steps, no random changes and definitely no
maybe/perhaps like comments when talking about memory barriers.

See here:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=locking/osq
