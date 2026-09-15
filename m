Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0F485501
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470700; cv=none; b=dtzY4hy18caw27PcgDhlA3LJ7aEF4wkaVfDoGGniJlTPWZ8QXLKf+1GWcDV1y4zW3b9Nk8tYsinuDXsw1CXs31WGuW9CGdAZ3b0ZXK8kJ+Pf3qJXqRkYPv28LInLyRiXZ/DHiyh1J70EJXMfT/xorC2xJ1J0UPhG0547BL30nUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470700; c=relaxed/simple;
	bh=DHpCLSJC7pl3RCMJfd71Cl2q/KwysooUKUQlgFsLhes=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmSMw9k9CqA+Ds+MR9R/r8H6dboiyK3cw3uihgxFpg9gp5aCfdydeAamj5dG4mRCAdvAq6rw/+/qHxrKqm5yMjWKu4CIJDs0Z8FninibOz01jgWc36vkOqyBnomGPnDeQ/HfwAH9ZW7TGkU3QnyaJWhvcR11wwOAtdc1jfm64Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPDjBtd6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPDjBtd6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so23081445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789470696; x=1790075496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MLBbtif5YejFjj+3Ug6G1Fl4ObZO4HNvoqv00SoxZyg=;
        b=iPDjBtd69Xg/1I2/rRhpgGmyxm3NPQnJpwWFdn/OGJ/h6x61BTzZi4QZ1AVJJHeQj3
         L9qIlc8bRettpIpqZSijN02chBOjVXLfU0D9PrNe5lmUQPkPhA+bFBjUUpGqCkeXCvpJ
         proPlwNMLIyNiQ4xvSvtls5cBvFHdO++qu/a6xaGDXcYvIekYRyPKq+mEK0dlKyo1UX8
         xVK2u92vzokhi9Xqu8DnjWx/Ho0VuhT5QA8XxTLAp+GR4mvxitqRXAAgvmBHF8PInzsT
         r8Tc2SF4LjiwLko2pIQikUo4bIxXgR9T1LVU+dlN70wWQX+xcfYNUiRLjWQov86Xcbhf
         6kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470696; x=1790075496;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLBbtif5YejFjj+3Ug6G1Fl4ObZO4HNvoqv00SoxZyg=;
        b=KzbwHp5/tPBBHhWeytnM2bJWK+3ueeMpI3gcG5UwhuIp+q+Y+pDLMxgg6Ztbxz9SdZ
         FK0v7k7e+9jnTVh8frGssSc6/16yZsEkn2jeCpe3a8a29QsZOkBNmyLDGH9ZycvoKWid
         L15cTjJ7YYy9ibk++bgeOWg3+Wi5UEGK0wQGKLLg28xbUXqyQQPik8jbP07Wb9ee6vCa
         wwfeC5UT/HSgpdFMcrSYrm1KHcE2jndrYd/Vm4GVuiddQ+fpiMLCnAd4a0lj/FJxNnbl
         DmpxgOIJDU66zTtFeRIvUqiBaM7oXtlgUos1ohLnt1GwhsVy1giHdhJu4UgOe07xpBPe
         0gGg==
X-Forwarded-Encrypted: i=1; AKwUvBwkA8jXGFq4kB6YpHLV9I+HaveSNqzQ4iECNCkK1Wxk1LpANgabHxZQP9sCZlIQoplxuUjJJTzQfcSxLY4=@vger.kernel.org
X-Gm-Message-State: AFuF++lF3dBXqa0J8u11xDrH7EGrbBtUeyHBiql8GAKkurIR1UQtnaoz
	poWV+GV6NB8yH2QpLJ5cUfzROOcUI+0UUYcH7HxdCUn1Vbi2c2MNO1Ll
X-Gm-Gg: AYBFou1jGc/3EAQ2zTEX3hT2WlN/QTzQHsfaKVuvEyoD461Jv4j6EpsHWCEpqWFSf51
	3Uukz6uX2mw0som9V2SLuSH5lQ0LKkpA+8GVZQeeOM2fC/LKZL7xw+Szbc4/HgPhh1LVwAZTQCM
	DLTKr/5qzfbO+EpGYaohYnvVf6wmKs6GknRiKU4PD3yzGPVAtMrBJCLrZyCpyBeorZX/WfgQFD9
	9jCrYhUa2NTYVP09Ru7HunxztmyPUv8/zsTPvx5YVl6TUDTs1mXlP5E2cH5Bl4TCIzlid1qO3a2
	nmQwYm19EqAh8VPwGN2OKTrl931Ykj7TANvbCxpRmz+vA+FCVpS/LTWDztXjDU3IB2lSwbI4X8D
	nBFyLzcwl4S1FZ5AW7kdhQ5wqvjfXSwdWnNzf5O6fXMuNCqdBPFtRHZdQR9ynKKfZB50utZ+yv+
	qjptrk1p7rUmSXGSO2dtI6e5ZBcgUVHdPwiLqycFqmPXZ6i6cvntOJBmdZ1XZL5KED8SQR8TGE1
	vBLnHiyI0mtSR3MoPH5+aIml1kJmt1iiUfi
X-Received: by 2002:a05:600c:3548:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49e7a656bf6mr137799465e9.8.1789470695669;
        Tue, 15 Sep 2026 04:11:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e8249e3e8sm9658675e9.12.2026.09.15.04.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:11:35 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:11:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 2/9] locking/osq_lock: Save the cpu number for
 'prev' not the node address
Message-ID: <20260915121133.7aaaed4a@pumpkin>
In-Reply-To: <20260915102602.GC4121620@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-3-david.laight.linux@gmail.com>
	<20260915083340.GY4121339@noisy.programming.kicks-ass.net>
	<20260915102602.GC4121620@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 12:26:02 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Sep 15, 2026 at 10:33:40AM +0200, Peter Zijlstra wrote:
> > On Mon, Sep 07, 2026 at 09:41:26AM +0100, David Laight wrote:  
> > > The cpu number of node->prev is needed for both the vcpu_is_preempted()
> > > test and to update lock->tail.
> > > This saves reading the cache line for the other cpu's per-cpu data.
> > > 
> > > The cpu member of optimistic_spin_node is no longer needed.
> > > 
> > > Merges patches 2 and 3 from v3.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > >  kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
> > >  1 file changed, 14 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > > index b17aa704c449..01988d00c480 100644
> > > --- a/kernel/locking/osq_lock.c
> > > +++ b/kernel/locking/osq_lock.c
> > > @@ -34,9 +34,9 @@
> > >   */
> > >  
> > >  struct optimistic_spin_node {
> > > -	struct optimistic_spin_node *next, *prev;
> > > +	struct optimistic_spin_node *next;
> > >  	int locked; /* 1 if lock acquired */
> > > -	int cpu; /* encoded CPU # + 1 value */
> > > +	int prev; /* CPU number offset by 1 */
> > >  };
> > >  
> > >  static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);  
> >   
> > > @@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
> > >  bool osq_lock(struct optimistic_spin_queue *lock)
> > >  {
> > >  	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
> > > -	struct optimistic_spin_node *prev, *next;
> > > +	struct optimistic_spin_node *prev_ptr, *next;
> > >  	int curr = encode_cpu(smp_processor_id());
> > > -	int old;
> > > +	int prev;  
> > 
> > I'm not a fan in the asymmetry of the naming, that is very confusing at
> > best.  
> 
> Maybe something like so?

I was trying to avoid changing lines that weren't affected by the patch.
So I left the original variable names alone.

Every time I come back to this code it makes my head hurt.
Perhaps I should do an early patch to rename everything to this/prev/next_cpu/ptr
(although maybe without the _ptr).

At one point I considered using OSQ_UNLOCKED_VAL (instead of 0) for
node->prev/next_cpu but decided against it because it make the code
even harder to read.
I think it was added when the list tail was changed from a pointer to
the cpu number to reduce its size - the value changed from NULL to 0.
Having a non-zero initialiser (eg -1) is just asking for trouble!

David
 
> 
> ---
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -34,9 +34,9 @@
>   */
>  
>  struct optimistic_spin_node {
> -	struct optimistic_spin_node *next, *prev;
> +	struct optimistic_spin_node *next;
>  	int locked; /* 1 if lock acquired */
> -	int cpu; /* encoded CPU # + 1 value */
> +	int prev_cpu; /* CPU number offset by 1 */
>  };
>  
>  static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
> @@ -50,11 +50,6 @@ static inline int encode_cpu(int cpu_nr)
>  	return cpu_nr + 1;
>  }
>  
> -static inline int node_cpu(struct optimistic_spin_node *node)
> -{
> -	return node->cpu - 1;
> -}
> -
>  static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
>  {
>  	int cpu_nr = encoded_cpu_val - 1;
> @@ -116,11 +111,10 @@ bool osq_lock(struct optimistic_spin_que
>  	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
>  	struct optimistic_spin_node *prev, *next;
>  	int curr = encode_cpu(smp_processor_id());
> -	int old;
> +	int prev_cpu;
>  
>  	node->locked = 0;
>  	node->next = NULL;
> -	node->cpu = curr;
>  
>  	/*
>  	 * We need both ACQUIRE (pairs with corresponding RELEASE in
> @@ -128,12 +122,12 @@ bool osq_lock(struct optimistic_spin_que
>  	 * the node fields we just initialised) semantics when updating
>  	 * the lock tail.
>  	 */
> -	old = atomic_xchg(&lock->tail, curr);
> -	if (old == OSQ_UNLOCKED_VAL)
> +	prev_cpu = atomic_xchg(&lock->tail, curr);
> +	if (prev_cpu == OSQ_UNLOCKED_VAL)
>  		return true;
>  
> -	prev = decode_cpu(old);
> -	node->prev = prev;
> +	prev = decode_cpu(prev_cpu);
> +	node->prev_cpu = prev_cpu;
>  
>  	/*
>  	 * osq_lock()			unqueue
> @@ -165,7 +159,7 @@ bool osq_lock(struct optimistic_spin_que
>  	 * polling, be careful.
>  	 */
>  	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> -				  vcpu_is_preempted(node_cpu(node->prev))))
> +				  vcpu_is_preempted(node->prev_cpu - 1)))
>  		return true;
>  
>  	/* unqueue */
> @@ -200,7 +194,8 @@ bool osq_lock(struct optimistic_spin_que
>  		 * Or we race against a concurrent unqueue()'s step-B, in which
>  		 * case its step-C will write us a new @node->prev pointer.
>  		 */
> -		prev = READ_ONCE(node->prev);
> +		prev_cpu = READ_ONCE(node->prev_cpu);
> +		prev = decode_cpu(prev_cpu);
>  	}
>  
>  	/*
> @@ -210,7 +205,7 @@ bool osq_lock(struct optimistic_spin_que
>  	 * back to @prev.
>  	 */
>  
> -	next = osq_wait_next(lock, node, prev->cpu);
> +	next = osq_wait_next(lock, node, prev_cpu);
>  	if (!next)
>  		return false;
>  
> @@ -222,7 +217,7 @@ bool osq_lock(struct optimistic_spin_que
>  	 * it will wait in Step-A.
>  	 */
>  
> -	WRITE_ONCE(next->prev, prev);
> +	WRITE_ONCE(next->prev_cpu, prev_cpu);
>  	WRITE_ONCE(prev->next, next);
>  
>  	return false;

