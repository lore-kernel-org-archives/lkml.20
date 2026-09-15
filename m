Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A23B6BFD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461229; cv=none; b=RB/FeHi+SZRj1Wct2tEMpTlIVDaJbQlZRmjyhv1MDwy9BExFWrQDlGgXKDh81gev9XHGoxAWabzPd9ir4V4Eau54fDEzOkU3BMMG5QcXx5UoFpbZ9dpqyNissWBgI3GovpOV8GnvHaGRJdPKleXlJ9SOXNE2EVu2e+tULEhDvXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461229; c=relaxed/simple;
	bh=0gX1iY8HfKAY3g+8rB2lct4xHb4HdMgYzQRHaNBCdfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0eFOq5ivKfG0UjM+YsXKL5c7WWkTaoOKuX1xt6XmkZA7nj7EqAI0+dkUNm5B/u1v98Vp+La8NJVAtlOWnDDpy8WQlhzhgj6wc/3KxKurZ/z2dPXImO6WfxMF+bZ2IKVvwwa9dCTT36wsgYFtWsY2w1kpyxRCSFEFdEeUIum+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KL3gvNS2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KL3gvNS2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tn9GJN/0WaH2zgn6xcwy+ShM9iDmjXHgO4C0IvbLhaI=; b=KL3gvNS2ubQrnaDYJpnMWrY4LB
	zXRVOnn62AzGlWf1WfsCuqTviuamK/4/upYFEMRX+w6xFLMLFlNxkg5Sj6OVZD+auiW+2SXvzB+Fp
	cGRxIK6CNhKfOwbit1U51Nf6JmEz0enP5pdphyZ6Ixc6lyk38x5/C5H4KxUvWUp6UaoHGSAUIUakl
	nrhSonh3P3TpkM+M6Jiiak8Gt/4q0TXhJmjRQVpOjFcm8rWTUMSwGba2zkgu8kMOFtwTXQckecgar
	rPb5ydUl7ztJpTDgAB8Q5i/2/nnuGTG/rWXXkpeR1YSl+YPQ294qAqqQ1ecBteKVgIkmB9fp+MqXq
	6qMo6ukA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Obk-0000000FH2Y-30TO;
	Tue, 15 Sep 2026 08:33:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46EEF3012C6; Tue, 15 Sep 2026 10:33:40 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:33:40 +0200
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
Message-ID: <20260915083340.GY4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907084133.3696-3-david.laight.linux@gmail.com>

On Mon, Sep 07, 2026 at 09:41:26AM +0100, David Laight wrote:
> The cpu number of node->prev is needed for both the vcpu_is_preempted()
> test and to update lock->tail.
> This saves reading the cache line for the other cpu's per-cpu data.
> 
> The cpu member of optimistic_spin_node is no longer needed.
> 
> Merges patches 2 and 3 from v3.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  kernel/locking/osq_lock.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index b17aa704c449..01988d00c480 100644
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
> +	int prev; /* CPU number offset by 1 */
>  };
>  
>  static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);

> @@ -114,13 +109,12 @@ osq_wait_next(struct optimistic_spin_queue *lock,
>  bool osq_lock(struct optimistic_spin_queue *lock)
>  {
>  	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
> -	struct optimistic_spin_node *prev, *next;
> +	struct optimistic_spin_node *prev_ptr, *next;
>  	int curr = encode_cpu(smp_processor_id());
> -	int old;
> +	int prev;

I'm not a fan in the asymmetry of the naming, that is very confusing at
best.
