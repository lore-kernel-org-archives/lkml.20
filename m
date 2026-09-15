Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C383F6606
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467972; cv=none; b=fAocediJ4gVNYf22iM6uL21TGfF/8FB6Q2wgJs8e/Aq/ubGIDLLilyFAEiA8bHI15KoXTWznNpq49f0G7L7ExSu88SuT/JXCe9GGKVPXMk9irgN36rOPpuKLxUaVBBLSnflC6iMl5Oqw9xRjX2gT7moXcEAj+v8POSh6G2x3DSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467972; c=relaxed/simple;
	bh=o3zNSrPKWhPyBT5s3vKJC+i3gUl8bfTaVyt0rXeL7gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjLO9ZDJYOBAAuapg7jFnN5960M/ixzQrkwxfZAKLGeOPmLTywbs1BHeIc1V3GU9xyUJiosDQeTqANz9SCz2XVETAsvknr5KZRk/LnlxDXSx5a1iBo2LrRziRnAkO2KJBNv3OuyQmF/61Dv4Po08LNCLxMgGWX5ObdzRkvXHBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=btLG8vuI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="btLG8vuI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2ld1d++heh1+aCjGujuJAtCKL/RcY+Mky9r77sAwiWQ=; b=btLG8vuIWx2reCXgZRKxtepQXL
	IDEzFR9t9RadaAXht8QRSuynrdS/eg/3QkdAsg8cAY3uKxR6P1u8lvGDNSgmlI/JWLU29e5iP9Sle
	iheCqRBXS6IEP8zySNVBO7oQgfOCJcim6c93FbH5rwSNRE+C2TufGrXypdwO+HTZe0IxSvCW07jI8
	1cFOB8FALy7TAw8r2vP5PFgLtzwFV6hbvrZ1pqBkGkgI0FUC6xg7Nu/9F9Qng999LCR5iuQ27AKWt
	IR4fvEsQhoctC91pc73yTZtUeNiQ3KhSH8fSWB0oPy/Aa4aqhYB7gQeE7QzUq6WQTI1drFY7wuFa8
	Fck5nM8g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QMV-0000000FeaK-0sqR;
	Tue, 15 Sep 2026 10:26:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 35313300328; Tue, 15 Sep 2026 12:26:02 +0200 (CEST)
Date: Tue, 15 Sep 2026 12:26:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 2/9] locking/osq_lock: Save the cpu number for
 'prev' not the node address
Message-ID: <20260915102602.GC4121620@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-3-david.laight.linux@gmail.com>
 <20260915083340.GY4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915083340.GY4121339@noisy.programming.kicks-ass.net>

On Tue, Sep 15, 2026 at 10:33:40AM +0200, Peter Zijlstra wrote:
> On Mon, Sep 07, 2026 at 09:41:26AM +0100, David Laight wrote:
> > The cpu number of node->prev is needed for both the vcpu_is_preempted()
> > test and to update lock->tail.
> > This saves reading the cache line for the other cpu's per-cpu data.
> > 
> > The cpu member of optimistic_spin_node is no longer needed.
> > 
> > Merges patches 2 and 3 from v3.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
> >  1 file changed, 14 insertions(+), 19 deletions(-)
> > 
> > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > index b17aa704c449..01988d00c480 100644
> > --- a/kernel/locking/osq_lock.c
> > +++ b/kernel/locking/osq_lock.c
> > @@ -34,9 +34,9 @@
> >   */
> >  
> >  struct optimistic_spin_node {
> > -	struct optimistic_spin_node *next, *prev;
> > +	struct optimistic_spin_node *next;
> >  	int locked; /* 1 if lock acquired */
> > -	int cpu; /* encoded CPU # + 1 value */
> > +	int prev; /* CPU number offset by 1 */
> >  };
> >  
> >  static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
> 
> > @@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
> >  bool osq_lock(struct optimistic_spin_queue *lock)
> >  {
> >  	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
> > -	struct optimistic_spin_node *prev, *next;
> > +	struct optimistic_spin_node *prev_ptr, *next;
> >  	int curr = encode_cpu(smp_processor_id());
> > -	int old;
> > +	int prev;
> 
> I'm not a fan in the asymmetry of the naming, that is very confusing at
> best.

Maybe something like so?

---
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -34,9 +34,9 @@
  */
 
 struct optimistic_spin_node {
-	struct optimistic_spin_node *next, *prev;
+	struct optimistic_spin_node *next;
 	int locked; /* 1 if lock acquired */
-	int cpu; /* encoded CPU # + 1 value */
+	int prev_cpu; /* CPU number offset by 1 */
 };
 
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
@@ -50,11 +50,6 @@ static inline int encode_cpu(int cpu_nr)
 	return cpu_nr + 1;
 }
 
-static inline int node_cpu(struct optimistic_spin_node *node)
-{
-	return node->cpu - 1;
-}
-
 static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
 {
 	int cpu_nr = encoded_cpu_val - 1;
@@ -116,11 +111,10 @@ bool osq_lock(struct optimistic_spin_que
 	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
 	struct optimistic_spin_node *prev, *next;
 	int curr = encode_cpu(smp_processor_id());
-	int old;
+	int prev_cpu;
 
 	node->locked = 0;
 	node->next = NULL;
-	node->cpu = curr;
 
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -128,12 +122,12 @@ bool osq_lock(struct optimistic_spin_que
 	 * the node fields we just initialised) semantics when updating
 	 * the lock tail.
 	 */
-	old = atomic_xchg(&lock->tail, curr);
-	if (old == OSQ_UNLOCKED_VAL)
+	prev_cpu = atomic_xchg(&lock->tail, curr);
+	if (prev_cpu == OSQ_UNLOCKED_VAL)
 		return true;
 
-	prev = decode_cpu(old);
-	node->prev = prev;
+	prev = decode_cpu(prev_cpu);
+	node->prev_cpu = prev_cpu;
 
 	/*
 	 * osq_lock()			unqueue
@@ -165,7 +159,7 @@ bool osq_lock(struct optimistic_spin_que
 	 * polling, be careful.
 	 */
 	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
-				  vcpu_is_preempted(node_cpu(node->prev))))
+				  vcpu_is_preempted(node->prev_cpu - 1)))
 		return true;
 
 	/* unqueue */
@@ -200,7 +194,8 @@ bool osq_lock(struct optimistic_spin_que
 		 * Or we race against a concurrent unqueue()'s step-B, in which
 		 * case its step-C will write us a new @node->prev pointer.
 		 */
-		prev = READ_ONCE(node->prev);
+		prev_cpu = READ_ONCE(node->prev_cpu);
+		prev = decode_cpu(prev_cpu);
 	}
 
 	/*
@@ -210,7 +205,7 @@ bool osq_lock(struct optimistic_spin_que
 	 * back to @prev.
 	 */
 
-	next = osq_wait_next(lock, node, prev->cpu);
+	next = osq_wait_next(lock, node, prev_cpu);
 	if (!next)
 		return false;
 
@@ -222,7 +217,7 @@ bool osq_lock(struct optimistic_spin_que
 	 * it will wait in Step-A.
 	 */
 
-	WRITE_ONCE(next->prev, prev);
+	WRITE_ONCE(next->prev_cpu, prev_cpu);
 	WRITE_ONCE(prev->next, next);
 
 	return false;
