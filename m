Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F813B0594
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387440; cv=none; b=YzvgU8XYBr48Vqkzsm6myBSVSQV16r4jFoyv3JTTuizYjjZ/ftMILlTxI8yezXAm5CqzAO6Oh4thDUCdSWudKYaulZ9OE9HKF6RlPgwjJ4ADd+dzypyd4Ql2tUoDLA9cblJTe6lQsv2AoJ+0jMI7v2Z8uHQOxpBp1CGh7os5Cik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387440; c=relaxed/simple;
	bh=NH+/GP4vFtwuHPuWkUzuYIWfvZjs1JBMnufN3gOnkL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjVyoMGoG2/nt4dwYuNnhtasQHs6qVJ+GqIpBHepwGWnLJfDx/NyalJzoI8MB9dMgSow4sKYhr16IKgDnCZB1Zbuh9MdejWYJkvLACh5Xck/WbS4VEmkhG9lBSt5kgIlOeqfXODHpI87uKg0EjFNf7IA4IBPP5gVIHcNR6BVyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wK7RZvl9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wK7RZvl9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JZd+UOQDFy/E0v5Ar2hwnVR8iz/Z2JUbvw/wD+LnGgw=; b=wK7RZvl9NTQZCLZYEycfos0YYj
	r2AeGwKNtLcELpxtTJRjwcvWAHet/dq9T0EnJjP2pNH6SN1uBdQmf4nkk5Isk1W+oluP7Hzcc4fbm
	M0jF/ybNRbnMqikhPbTg0eAYC3zN10EexFmnY5Zu4E8wXm0Pw+ikgHH0jkOifLBcqWZjwDAVYfpCf
	jsapobp4oIyNKOLdjmwHOqaLM+t8v7nI9NoKh82rUuORJHIh5VlC5BNACKoAoUjj06iqZNn133Z6p
	oWkSYptvBseiawQpB6yzNmEQuzql09iDfe9yudFC4njW3Aap+9lkmhDwMkLHgQp78Ohthcyxp/hVc
	x1+M5hfw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pd-0000000AmZ6-2IG6;
	Mon, 14 Sep 2026 12:03:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AC00230066A; Mon, 14 Sep 2026 14:03:52 +0200 (CEST)
Date: Mon, 14 Sep 2026 14:03:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260914120352.GE3500130@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907084133.3696-4-david.laight.linux@gmail.com>

On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:

> -	for (;;) {
> -		/*
> -		 * cpu_relax() below implies a compiler barrier which would
> -		 * prevent this comparison being optimized away.
> -		 */
> +	for (;; prev = READ_ONCE(node->prev)) {
> +		if (!prev)
> +			/* Lock acquired */
> +			return true;

This lacks {}, but also, is not ACQUIRE like the return you remove
below. Did you want smp_acquire__after_ctrl_dep() in there?

> +
> +		prev_ptr = decode_cpu(prev);
> +
>  		if (data_race(prev_ptr->next) == node &&
>  		    cmpxchg(&prev_ptr->next, node, NULL) == node)
>  			break;
>  
>  		/*
> -		 * We can only fail the cmpxchg() racing against an unlock(),
> -		 * in which case we should observe @node->locked becoming
> -		 * true.
> +		 * 'prev' must have unlinked (or be in the process of unlinking)
> +		 * itself from the list.
>  		 */
> -		if (smp_load_acquire(&node->locked))
> -			return true;

This is an ACQUIRE.

>  
>  		cpu_relax();
> -
> -		/*
> -		 * Or we race against a concurrent unqueue()'s step-B, in which
> -		 * case its step-C will write us a new @node->prev pointer.
> -		 */
> -		prev = READ_ONCE(node->prev);
> -		prev_ptr = decode_cpu(prev);
>  	}
