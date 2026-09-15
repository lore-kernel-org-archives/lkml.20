Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFD49B219
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460827; cv=none; b=nvNsCTuKWAcc7X788axdgd8rG17Th5b0FpcQkJIK+uEh3iOcJyqyBDcvz3rT+lU9mHBpziui/hpC//Ai4OJ2d9Rk36M0i379YRjN/1L0yEEf2ZOJD1FIuem7ulWntq2zvDfP+JnhcHe3HJ2ydq8BjSPanKaNE6WALu+eWBE+eYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460827; c=relaxed/simple;
	bh=zTS5eRWIqKfrse8vsXTFlR8VwOwpFGwImMR8yK/g31M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0z/lIneXcnV8H066SuFaSq+f+JHC30hmox/qeO7Byo3Q6pnKcYcMToo9ATdWZ73UHy52UcREpwOm/w4D3m7qbH3EHVd9uS1p5Mb46k9nWPlSTjUNBLqO65BMqx7lmF/xYq4HjNfQgv5CB2BHHZ1ThRhhFW1AXlnWQhTe7EL83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U5oBSp1F; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U5oBSp1F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KnRkjJQ7ldPXI0H4z/sA0HKZKioad7psEwo6kUVI9KQ=; b=U5oBSp1FSl8CaRftbR46EvQPK1
	RvZ/NmnzizKmk9lpW175SumBQHsGU7uG3hUmWZ3EZJxF+D+4zyY1epYEwdtCwXFf1BSzSL8unYGUB
	z+xWR32b7VtmtODT8LoMq7M3f3q4Hp88fLTmDQIhy9Zu4FspOkHAjhZ146i60NoLFMnmnbnksaRrZ
	AWzQEfrUR49kDUi+b6k7FmHbMNl02V9PMC32Ccd6lPOHPxzpOK159hdAs2OcBW8UFwz8IHCPjmBwL
	hKq5wod+Nuu7Yu5aQ7fIts36kSnlZ/N0Dhe6xQ0vg2+tpU6e4mUjVlM67o2MMLb3VfVpfv59hGCzz
	KzFtBTVQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OVE-00000006QkG-0N0l;
	Tue, 15 Sep 2026 08:26:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 65DD03012C6; Tue, 15 Sep 2026 10:26:55 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:26:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Haakon Bugge <haakon.bugge@oracle.com>,
	David Laight <david.laight.linux@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
References: <20260914202102.551333-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914202102.551333-1-longman@redhat.com>

On Mon, Sep 14, 2026 at 04:21:02PM -0400, Waiman Long wrote:
> The osq_lock is special in the sense that lock transfer from one CPU to
> the next can happen either over the common optimistic_spin_queue.tail
> value with uncontended lock or over a lock waiter's own percpu
> optimistic_spin_node.locked flag when the lock is contended.
> 
> To ensure proper lock synchronization, we need to provide
> the acquire/release semantics for the osq_lock/osq_unlock()
> functions in both cases. This is currently the case for the
> common optimistic_spin_queue.tail value, but not for the percpu
> optimistic_spin_node.locked flag as the proper barriers can be missing.
> 
> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
> ("locking/osq: No need for load/acquire when acquire-polling") a while
> ago as the smp_load_acquire() loop was causing a performance hit due to
> the repeated acquire barriers in the loop and it argued that an earlier
> atomic_xchg() call could provide the needed barrier and reordering
> wasn't a problem in the way osq_lock is being used by mutex and rwsem
> for queuing purpose only. That atomic_xchg() barrier does not work
> as a proper acquire barrier for osq_lock() if the lock hasn't been
> acquired or isn't ready to be acquired when the barrier ends. So an
> acquire barrier is still needed in order to have proper locking semantics.
> 
> The performance impact stated in that patch is due to repeated issuance
> of acquire barrier which can be expensive depending on the architectures
> and the actual processor used. It was not clear what machine and what
> benchmark was being used to produce the performance data. Anyway, with
> the new smp_cond_load_acquire() helper, only one acquire barrier is
> issued at the end of the loop. So even if there is a performance impact,
> it should be less than a repeating one.
> 
> As for the two percpu optimistic_spin_node.locked setting in osq_unlock(),
> they are currently preceded by a full barrier xchg() call which can
> provide the needed release barrier. Add comments saying that a release
> barrier is needed for the proper functioning of the unlock operation
> to alert people from accidentally remove the barrier when the code is
> updated.
> 
> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
> Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/locking/osq_lock.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> [v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
>      with comments.
> [v3] Fix the comment above smp_cond_load_acquire().

I still see no reason why this should be applied. Or even have this
Fixes tag.
