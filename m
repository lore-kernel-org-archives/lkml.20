Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876708;
	b=C3zwjrM3XRMB5V1zYjUDiBTZ5TiwcMbbOPnm/QXHOkQQZ0hYcXf3D2TnTl3BkH91Tt4h
	 lD0+BoCOE81NFNmkWKw0eq8Tr5Ybddg46kIznsopVt9v9wMKynSIgvBzFM2sg+bOux+/P
	 FLoqEfHlpT5nw5rkTiBE/gMm/sUW5sT6XasBTfce3Qc1cVE3pqaK7hlIHcwy5QzfU6YI2
	 lPNtcmSvIi+OgB/rIc4PRgHtqxEI7CDGPbEaWS1G8bHBxKjeb8MJSdKNpHcIAU2Im7FtI
	 Don1FkyeLNIhaD6x5CgQFCEEjkhoz0jmkLUxUvi8R/JnssAJnxnuq4tEQnR3NnoNGPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876708;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LjZ7So/ImQ1LwAfwdZHW2p5Atz4bZi/RK9ew+JxKRHI=;
	b=gP7ztz4kaYPmTRJdM89NA9l64DyWS/gc358KO1KlA0a/3BHkAiwzFr9dOWH4sEVI8LcL
	 JEHx3ni/mCLgn8AtQNRCKMVavs7tPQ493ljlpmu2i60/CFt7c4BPq2yMYbJpmvZZk8zNR
	 vUnN2L9QNkpPOXaSvzUgVUE7fHd036w8U96m5GhRDy5JVTo0ttNUF1IuOVR1IxlG+JZ7a
	 LtW+bxCdtHOavZdUTlnVtKRLjRngDaPq2E37wmVSBYVZmpcxrlmyC98F4VetDi/C4FnJ+
	 NJMRgGeZVkCuk6QOtQqrMuOl7f5u+rY9OsCyKRRMfF+sfywnAZ6cdHf0tULOPwGhpiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa4T7FcL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pa4T7FcL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5941A1F000C4;
	Tue, 17 Nov 2026 00:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794876708;
	bh=LjZ7So/ImQ1LwAfwdZHW2p5Atz4bZi/RK9ew+JxKRHI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Pa4T7FcLb6ntxFZp9W+/P4EfjfKtMiMs06Z0OCdy2BxCpyIJNum3WTswn+mnI6tfd
	 nPKQ+oYp6XtY0j9zs3bV9OL+V3dOVJTHWoFRgpQTKgTaOl9WZr/Z+oEZQwF9T1WHOy
	 2+l7HElpVv/XxAJIxRPHYi+LwDjCDEA4KeFhra0nrWgb1SduZmF24wvjQwYv9Mh41g
	 2m/qUQkMLtUjORmLwt8LaP4ogkh7a96gv/M6U5eAIbmcSAWUusfcesVyKHQK9VjyJ7
	 xzSfEesKPGh72SdqoyjCu5uRmsQPeu6nrZ9dULp7zHeMoiy94/kD5RLZyLGoWz7ZVa
	 HtlL3lwvUSyzg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 11248CE097D; Mon, 16 Nov 2026 16:51:48 -0800 (PST)
Date: Mon, 16 Nov 2026 16:51:48 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 3/3] srcu: Remove check from srcu_dereference_check()
Message-ID: <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
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
In-Reply-To: <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>

On Mon, Nov 16, 2026 at 02:59:35PM -0800, Bart Van Assche wrote:
> Users of srcu_dereference_check() must either hold an SRCU reader lock
> or satisfy the lockdep condition 'c', e.g. by holding the update-side
> lock. However, srcu_dereference_check() calls
> __srcu_read_lock_must_hold(), which tells the Clang context analyzer
> that the SRCU reader lock must be held. That requirement is too strict
> for update-side callers. Hence, remove the __srcu_read_lock_must_hold()
> call from srcu_dereference_check() while keeping the fake RCU acquire
> and release around __rcu_dereference_check(). Retain the runtime lockdep
> check in srcu_dereference_check().
> 
> srcu_dereference() and srcu_dereference_notrace() do not accept a
> lockdep condition and hence may only be used by SRCU readers. Call
> __srcu_read_lock_must_hold() from these macros such that Clang context
> analysis keeps verifying at compile time that their callers hold the
> SRCU reader lock.
> 
> Cc: Marco Elver <elver@google.com>
> Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

I clearly wasn't paying attention, and thank you for finding this!

> ---
>  include/linux/srcu.h | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> index d4dcaeb83e2b..5ef07357507b 100644
> --- a/include/linux/srcu.h
> +++ b/include/linux/srcu.h
> @@ -278,8 +278,11 @@ static inline int srcu_read_lock_held(const struct srcu_struct *ssp)
>   * No-op helper to denote that ssp must be held. Because SRCU-protected pointers
>   * should still be marked with __rcu_guarded, and we do not want to mark them
>   * with __guarded_by(ssp) as it would complicate annotations for writers, we
> - * choose the following strategy: srcu_dereference_check() calls this helper
> - * that checks that the passed ssp is held, and then fake-acquires 'RCU'.
> + * choose the following strategy: srcu_dereference() and
> + * srcu_dereference_notrace() call this helper that checks that the passed ssp
> + * is held, and srcu_dereference_check() fake-acquires 'RCU'.
> + * srcu_dereference_check() does not call this helper because its callers may
> + * satisfy the condition @c instead of holding ssp, e.g. on the update side.
>   */
>  static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __must_hold_shared(ssp) { }
>  
> @@ -297,7 +300,6 @@ static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __m
>   */
>  #define srcu_dereference_check(p, ssp, c)					\
>  ({										\
> -	__srcu_read_lock_must_hold(ssp);					\

Should we invoke __srcu_read_lock_must_hold() conditionally, only if the
value of c is zero?

							Thanx, Paul

>  	__acquire_shared_ctx_lock(RCU);					\
>  	__auto_type __v = __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
>  				(c) || srcu_read_lock_held(ssp), __rcu);	\
> @@ -315,7 +317,11 @@ static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __m
>   * is enabled, invoking this outside of an RCU read-side critical
>   * section will result in an RCU-lockdep splat.
>   */
> -#define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
> +#define srcu_dereference(p, ssp)					\
> +({									\
> +	__srcu_read_lock_must_hold(ssp);				\
> +	srcu_dereference_check((p), (ssp), 0);				\
> +})
>  
>  /**
>   * srcu_dereference_notrace - no tracing and no lockdep calls from here
> @@ -323,7 +329,11 @@ static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __m
>   * @ssp: pointer to the srcu_struct, which is used to check that we
>   *	really are in an SRCU read-side critical section.
>   */
> -#define srcu_dereference_notrace(p, ssp) srcu_dereference_check((p), (ssp), 1)
> +#define srcu_dereference_notrace(p, ssp)				\
> +({									\
> +	__srcu_read_lock_must_hold(ssp);				\
> +	srcu_dereference_check((p), (ssp), 1);				\
> +})
>  
>  /**
>   * srcu_read_lock - register a new reader for an SRCU-protected structure.
