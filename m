Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867873;
	b=ENJhry7eij4ebwVS2FdUkTpFazXr44RVZiVyG7076pY/8ccQDFre/CnjuIuw1ZQac+IM
	 vqkEEJ5D/sfeW6cDgM7lMDcd94JLVtUPlWwlBNm2+5s5QWFMAUbXlHr1h1+JIn2uQfOMo
	 cUedIHdf505dCtNCvKftb8ceh3Hy5nrKApXjr1y4nCXFuT6G9ZzLEsyp/9IKNMMrMoPPk
	 WfK+zZaSiUgZLx6cqQgE9fqRquAVGtqGifBxP3xNGXagDlAEgNWBdq4A/J+IjXw84ZuY/
	 OAtcwgwxjFbNSxVtdwpJhgcyi6lZgGrUqDj8iZ9tO4gRxEN2nqhe3AZKj960HkPP3Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867873;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BWzLU+LOzznZtDltvMa3C2hyFrgMmxrFCRNwmZcDI1w=;
	b=JaViUUN+IOudiAoq64Q1JI6BrSC4sFeK/NCkZ3vWplv5aQYnNTHSyMpWXJE/l1A3zhsk
	 9fh7xmaWMqn0DJAoBuNAo1Fki1QFChoM0Me0OTI8rB7JgvTC6q3YXJ5fwGaPLPTeuiA7/
	 y3vcJ1FRvqzUAq0ZseOXpd7sK/5H820jRgT9ZAVjmiF8B7o9YyAsP+N9HGZlf8Vt0RzeU
	 lirHY+ksYNM7R67yppYAQV8ksW2RMrRJYLHd8Jl+O9J/nrWwdNmpyKggKNXGAfTVl5Ri3
	 S1OzDLHGY4WYRFY7xn1VsivVggxha4MmBeFGHhuYxxsxH5eCf2i4XlRw7rQwSMfxHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O0aUQenC;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0489E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O0aUQenC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BWzLU+LOzznZtDltvMa3C2hyFrgMmxrFCRNwmZcDI1w=; b=O0aUQenCjm8GtmD9zpn9l7dNw2
	KcpfkLAJi8UBmvvdfG+YYmjzqDJJhi8Dz2IGRC840fgNaj1vtC3Qb2CYiFapuos7Xw31TNeVvrCS6
	389pIu2KfSxH8oVkizZlWXLrZ1qB1n34NkFexdnMhSas4qx7wXZEHnA+cUGTHVXIQvQnn+1kbp8WE
	CtgBMJr0hh0JNNEEkFFKRqnr3YpP6xbX68uMY/XUjeN7ErYsv31khGW/lss3r9dRjUykTuUPGMata
	JqtEvM/fdjC6p4StumE11vPNN3LGoSxI4jf0HqpWa818k3JHlumDlQaiWsAudr1yJSu+kJHDsdUsZ
	FQ5KGvRg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsyi-00000006JZy-0xik;
	Thu, 05 Nov 2026 08:37:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DC2DB30057E; Thu, 05 Nov 2026 09:37:46 +0100 (CET)
Date: Thu, 5 Nov 2026 09:37:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
Message-ID: <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
References: <cover.1793654853.git.bvanassche@acm.org>
 <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>

On Mon, Nov 02, 2026 at 01:34:38PM -0800, Bart Van Assche wrote:
> Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
> for code that needs to inform Clang's context analysis that a lock is
> held in code paths where lock ownership cannot be proven at compile
> time, e.g. because the lock is accessed through a pointer alias that
> the analysis cannot resolve. These macros call respectively
> __assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
> runtime with lockdep that the lock is held. Store the macro argument in
> a local variable with a unique name such that it is evaluated only once
> and such that nested use of these macros does not cause shadowing. Rely
> on Clang's context analysis resolving that local variable to the
> expression it has been initialized with. Document both macros with
> kernel-doc comments, including that __assume_ctx_lock() and
> __assume_shared_ctx_lock() must be used for context locks without
> lockdep support, e.g. bit spinlocks and the RCU context tokens.
> 
> Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
> into lockdep_assume_ctx_held() tests and add tests for
> lockdep_assume_shared_ctx_held().
> 
> This patch prepares for removing the context assumptions from
> lockdep_assert_held*().

So the only convincing rationale from 0/n for doing this was that the
current annotation can hide the need, and thus cause a lacking of
__must_hold() on the function.

I'm not sure I understand how this alternative form of the same avoids
that same problem, and the above doesn't seem to mention the whole
problem -- either that, or I just can't read this morning.


> +#define _lockdep_assume_shared_ctx_held(var, uniq)			\
> +	do {								\
> +		__auto_type uniq = (var);				\
> +									\
> +		__assume_shared_ctx_lock(uniq);				\
> +		lockdep_assert_held(uniq);				\
> +	} while (0)
> +
> +/**
> + * lockdep_assume_shared_ctx_held() - assume and verify shared lock ownership
> + * @var: context lock instance pointer
> + *
> + * Instruct the compiler's context analysis to assume that @var is held with
> + * shared access from this point on and verify at runtime with
> + * lockdep_assert_held() that @var is held. Use this macro for reader-writer
> + * locks, e.g. rwlock_t and struct rw_semaphore, in code paths where shared
> + * lock ownership cannot be proven at compile time. @var is evaluated only
> + * once.
> + *
> + * Since lockdep_assert_held() is used, no lockdep warning is reported if
> + * @var is held for writing instead of for reading. Holding a lock
> + * exclusively implies that shared access is allowed. Use
> + * lockdep_assume_ctx_held() if exclusive access is required.

We do have lockdep_assert_held_read(), which then requires a shared
access.

> + * @var must point at a lock object that is tracked by lockdep, i.e. that
> + * has a dep_map member. For context locks that are not tracked by lockdep,
> + * e.g. the RCU context tokens, use __assume_shared_ctx_lock() instead.
> + */
> +#define lockdep_assume_shared_ctx_held(var)				\
> +	_lockdep_assume_shared_ctx_held(var, __UNIQUE_ID(ctx_lock))
> +
>  #ifdef CONFIG_PROVE_LOCKING
>  void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
