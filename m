Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB125540A1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979949; cv=none; b=sdD8ZURfRi82BT6Qr6qKwymDP2xYs4SZD00Ulp//oD3HMM0Q6WjKTVPjJXcyfBgCaMVZMpkvmhd7962rHaK62+mOlMdTzYwvcYERCOVGk6sNn1/EctKV8flhb2m8O+rq3tFXP8DI5J8+hPxjOJU+k2p8wrYkkxbqtqNPZVdwGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979949; c=relaxed/simple;
	bh=YqHzduw5BVWS5NLLYy9jAep6i3D194vMOU2LazPl7I8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKlg5p1QHkrz6BHYzbS3cNSaAta8xnY0WUop2cDoqhYL7KVKUz4++KRFlX3Hkjf630MuFBgMqCKh1Zgzcq3+qqQZI+y5e6OiKfnpd/OV5NCalOpKxPZM0ZXdnHpuJzdG5KMWQNvxCPKHaIJONCm/1l7iwf5CYsj2HwUj0L4AMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQqRkgxG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQqRkgxG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b965570d7so69638165e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979946; x=1789584746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QoabyxZhl6nCaYtnAqV+N7yTRWoig/QCPmOsVSpx+qw=;
        b=KQqRkgxG0yENdNS+N5sRmXWa0wu9SkrFVG1jbLnzkU4UBwdr+pdu9it1sGgby01NIH
         cv8j3YmvH8VI6R12x/Bi2clYqiocu6MFM+m+tdJCJGQqwlinwgG/xTr78kU+HCJB2JhK
         IFtOMiFfS2v8kKpYcwHY1xoaYcwVNjqlA8gAd/GKOn/eEb84G20ODDDweKt7dPOZFhed
         ikMa1aRZeEMMGVuszqrY0QzNdurYKVLvjinD71rOj2Ebm75LY9L+gUurSOA0pAc4CQxf
         t79qDIMl2akuNoSLbcUYHY0PPmEgz/M9pFAbFqJwfLnuk3eFsD4mJckDieAQwsYVkkCe
         B3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979946; x=1789584746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoabyxZhl6nCaYtnAqV+N7yTRWoig/QCPmOsVSpx+qw=;
        b=ibQFKlu8or078NwO35pBDT/B+fBnRvv5ts5WEXxjBT1V8qlY25H3knt2MvtabwNTN+
         m9zuD5qt/8FjWzstsi2GJLnSGYRX0FpZcWGu/g79DSdwVj5RseNkzykZplf2Wg6l3dwC
         G46Bfh6NG9uh4+xExGx6n00K/uKs8N3RIi4DHi6cpvDjuQApA7mBfGzNVb/lnGC6if4C
         X83g3J2znvsUsNAWJai6ekR6dnRbDOOfbR+YmALpl3weoxbQAvktOtiC10rUWdkzUNyv
         zqy9j9s9lNjkeGV5WL9d5Yb6yCEDpXGoAoM/yMgRzGItf0ZEv9vMfmGKwcu3LF0GwIlg
         x7jA==
X-Forwarded-Encrypted: i=1; AKwUvBwyRSy6IIrwZjRsimmTOSPnBGi6yABXGdKY88mLkubVpTyXnlikZbcl+3OqsGnoGo0J9lnFbyNvrJ46CXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqRCQCUMYW51TH5j39YfQDoexvJJk9zgouIcQzXtLaS+1Jmoc
	F36TaZW/v1lc0qNUCI/zUcW96xMILv15BqFapTjTii/cULVnrweBqEgY
X-Gm-Gg: AYBFou2Zk6GECTyxFm855kHSIFQ43rPlI3QViX3JtYWcI1N+sCGsiYtsDQgFmiPpDht
	++T4fCjcbiwlGI878+obyiwnALBwXCg/ZYReiTvOrN18YQ+uzbjVKdHWEQCWCtrthvtRp0F6q6t
	bJKbw9g4QuXSuqpS5+WxJSybcQ/JDwoXHPWEOBeIeNOUTbujRKAh4PGIZQiMxBXrn0IEDveF2LE
	prR87CADpgqSLLvDQnCUqv6bkTcIgK9HCoohXWQYDzLGYmYLofk0U8gA7CRh/QZKdcBJUSs8yHq
	W7OV4lpfLQF2gB41H4ElcJF1NpkAoDz3GbHYY+USKDyAuKlYEDFHDceD/Gniz3D5i7MKf0brMCW
	JHmFw62rAAsj1NvFc7OPtda7ChImo/ClRL/0RfwZjxe2/utO7eaRW72nKN3VWJefRF4wAp7j86/
	+zeEec1l5/+WqogaR/n3qA5HLUjLf7KNvmteQ2VjivPnK9O41dllI3pZUQiAhSjivq0wXOC89Jl
	xDxPJKgWrWQQNeZ1/1stIqgIwz90tqoL3+p
X-Received: by 2002:a05:600c:81c5:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49d0443096amr281996735e9.27.1788979945610;
        Wed, 09 Sep 2026 11:52:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm12769505e9.1.2026.09.09.11.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:52:24 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:52:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260909195223.4d2dbe86@pumpkin>
In-Reply-To: <ac626425-08d8-4967-bbe5-2ceb971af668@redhat.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<ac626425-08d8-4967-bbe5-2ceb971af668@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 14:01:59 -0400
Waiman Long <longman@redhat.com> wrote:

> On 9/7/26 4:41 AM, David Laight wrote:
> > There is no need for separate prev_cpu and locked members of
> > struct optimistic_spin_node.
> > Using a single field simplifies the code slightly.
> > It also removes any possibility of the two values being out of sync.
> >
> > When cancelling a lock request explicitly set prev_cpu to zero.
> > Nothing actually looks at the field, but it means that it will be zero
> > after a subsequent 'fast path' osq_lock() call making things consistent.
> > The cache line is likely to be dirty (or be dirtied) so there shouldn't
> > be a performance hit.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >   kernel/locking/osq_lock.c | 57 +++++++++++++++++++--------------------
> >   1 file changed, 28 insertions(+), 29 deletions(-)
> >
> > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > index 01988d00c480..23f00c670507 100644
> > --- a/kernel/locking/osq_lock.c
> > +++ b/kernel/locking/osq_lock.c
> > @@ -35,7 +35,6 @@
> >   
> >   struct optimistic_spin_node {
> >   	struct optimistic_spin_node *next;
> > -	int locked; /* 1 if lock acquired */
> >   	int prev; /* CPU number offset by 1 */
> >   };
> >     
> I think we should document the fact that prev=0 can be viewed as a 
> marker that the osq lock has been acquired.

I think that happens a bit later in the series.
Trying to keep the comments in step is quite hard work.
That is part the reason why patch 1 partially describes 'where we are
aiming at'.
I also got in a slight mess with pointers that are cpu numbers.
Mostly trying to keep the comments concise.

> > @@ -113,7 +112,6 @@ bool osq_lock(struct optimistic_spin_queue *lock)
> >   	int curr = encode_cpu(smp_processor_id());
> >   	int prev;
> >   
> > -	node->locked = 0;
> >   	node->next = NULL;
> >   
> >   	/*
> > @@ -158,46 +156,47 @@ bool osq_lock(struct optimistic_spin_queue *lock)
> >   	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
> >   	 * polling, be careful.
> >   	 */
> > -	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> > -				  vcpu_is_preempted(node->prev - 1)))
> > -		return true;
> > +	prev = smp_cond_load_relaxed(&node->prev, !VAL || need_resched() ||
> > +				     vcpu_is_preempted(VAL - 1));
> >     
> What is the purpose of assigning the return value to prev and 
> immediately read node->prev into prev again in the next statement?

It isn't, it is only re-read when the code goes around the loop.

> > -	/* unqueue */
> >   	/*
> > -	 * Step - A  -- stabilize @prev
> > +	 * Step - A
> >   	 *
> > -	 * Undo our @prev->next assignment; this will make @prev's
> > -	 * unlock()/unqueue() wait for a next pointer since @lock points to us
> > -	 * (or later).
> > +	 * Loop until either node->prev is zero (lock acquired) or we
> > +	 * atomically change prev->next from node to NULL (stopping prev
> > +	 * handing on the lock).
> > +	 * Note that 'prev' can unlink itself concurrently with this
> > +	 * test so that prev/prev_ptr can be stale, but since it
> > +	 * is per-cpu data the memory can always be read.  
> I don't quite understand what you mean by "it is per-cpu data the memory 
> can always be read".
> >   	 */
> >   
> > -	for (;;) {
> > -		/*
> > -		 * cpu_relax() below implies a compiler barrier which would
> > -		 * prevent this comparison being optimized away.
> > -		 */
> > +	for (;; prev = READ_ONCE(node->prev)) {
> > +		if (!prev)
> > +			/* Lock acquired */
> > +			return true;
> > +
> > +		prev_ptr = decode_cpu(prev);
> > +
> >   		if (data_race(prev_ptr->next) == node &&
> >   		    cmpxchg(&prev_ptr->next, node, NULL) == node)
> >   			break;
> >   
> >   		/*
> > -		 * We can only fail the cmpxchg() racing against an unlock(),
> > -		 * in which case we should observe @node->locked becoming
> > -		 * true.
> > +		 * 'prev' must have unlinked (or be in the process of unlinking)
> > +		 * itself from the list.  
> 
> Should we also moved the deleted comment about cpu_relax() to here?

I nearly gave that comment its own paragraph in the commit message.
It was added when the data_race() was added (because of a KASAN splat).
The real comment should have been that the initial compare is only
there to make it less likely that an expensive atomic operation fails.
The loop now has a READ_ONCE() at the top so nothing can be lifted out
of the loop.

Thinking about it, I'm not even sure the test is worth while.
If 'prev' isn't zero/NULL then we expect to be able to unlink ourselves
from it - so the cmpxchg() is expected to succeed.
The extra compare only makes sense when there is a reasonably likely hood
of the cmpxchg failing.

I could add a patch to remove it/them.

David

> 
> Cheers,
> Longman
> 

