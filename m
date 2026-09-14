Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CE2D7DC8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384960; cv=none; b=ko7N0vgRbgRlYixywVzjFS644kfpEbF+bVVG2Oo+HaMdOkqGLlTafMpq3NO3WOwNglYEqv7oOaJYZngHd4kozkuuY1Geu0AIh3UJ/WwpVC8oLAg5+oL7Vgt7qCfunvIyXzIeZRnLhIHdb0LCf1URouAoTEU1+fAdumusc6t+ADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384960; c=relaxed/simple;
	bh=fOZY9r7GYmr74OQDITJhZs1KkW9cwkudx5/l0jQdQic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkfJMQr0JIpA4bjOkynQ4SzLG6/QhU65vlS7i9xG3gwi9JMqf/75fR7nsc7ihrC9Kx+MyYvYjE4pOUPpuDLSg8sp2HI/ENUcwmL8+YiBeZUO2rK7yGjpz+lhiX56MZ+Lek3hN51AKdj3iZpQ90k5+VKcvWBSDW2jP30StLrPquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EJDHqCAO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EJDHqCAO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b6h9B7SjS+nD6fl859nfFSgHxbx9xqTYAJEWyrVktok=; b=EJDHqCAOcv5YkaId3X+q+bMK3D
	VLeA0h5X+uLKnTHsqMHESKzted4TJDruxDC2s6KVcMwf8opMs2xmfKXx9fZ8Qi43pmZO0EWZAhZuF
	SYzU1TL/c228tTkmDyL++ek+cO2+DzafBXdDARYfE1YqYf7QO2jSmHbvA/hr6Ffw5VPdvLJot23Tl
	7M/j0v/gCZxPszKaVMN9rd41AAhxqQ59luNEaNYZ2BDtlbWEQf3hGRN27+1j8No0CLf0xVcYSBhKs
	yfDcfSnf5ZaJpPevtmz0OQle1qSktfw55lx9pXj5SpEAtOLUCIYWKjNpT5KIYHGRzIgM65dawgRwK
	Uxy19D/w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64lX-0000000AbRd-1HiC;
	Mon, 14 Sep 2026 11:22:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 37D7630066A; Mon, 14 Sep 2026 13:22:26 +0200 (CEST)
Date: Mon, 14 Sep 2026 13:22:25 +0200
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
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260914112225.GA3500130@noisy.programming.kicks-ass.net>
References: <20260910141908.592414-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910141908.592414-1-longman@redhat.com>

On Thu, Sep 10, 2026 at 10:19:08AM -0400, Waiman Long wrote:
> The osq_lock is special in the sense that lock transfer from one CPU to
> the next can happen either over the common optimistic_spin_queue.tail
> value with uncontended lock or over a lock waiter's own percpu
> optimistic_spin_node.locked flag when the lock is contended.
> 
> To ensure proper lock synchronization, we need to provide
> the acquire/release semantics for the osq_lock/osq_unlock()
> functions in both cases. This is currently the case for the
> common optimistic_spin_queue.tail value, but not for the percpu
> optimistic_spin_node.locked flag as the proper barriers are missing in
> some places. Fix that by adding the needed barriers in those places.
> 
> Note that the two percpu optimistic_spin_node.locked setting in
> osq_unlock() are proceeded by a full barrier xchg() call, but the
> contended cachelines are different. This should probably work in most
> cases except in some exotic architectures where the barrier semantics
> may be cacheline specific. Nevertheless a release barrier is still added
> for safety reason as we may opt to relax the xchg() calls in the future.
> 
> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
> ("locking/osq: No need for load/acquire when acquire-polling") a while
> ago as the smp_load_acquire() loop was causing a performance hit due to
> the repeated acquire barriers in the loop and it argued that an earlier
> atomic_xchg() call could provide the needed barrier. That may not be
> enough especially if we have to loop for a while before the lock is
> released. Now with the new smp_cond_load_acquire() helper, only one
> acquire barrier is added at the end of the loop. So it shouldn't have
> the performance hit noted in that commit.

You need to substantiate this *should*.

> Currently osq_lock is used only by mutex and rw_semaphore code for queuing
> purpose. As a result, the imperfect lock synchronization support does
> not cause harmful consequence as the new osq_lock owner of a contended
> osq_lock will still have to wait for the real mutex and rwsem lock to
> be released by the pervious osq_lock owner before it can acquire it and
> go into its critical section. For correctness, we still have to fix it
> in case it is used elsewhere which doesn't have this inherent protection.
> 
> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")

This doesn't make sense. You cannot argue that the code is correct as is
and still add Fixes.


