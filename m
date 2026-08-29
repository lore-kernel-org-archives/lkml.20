Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6170809
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043068; cv=pass; b=nUvpHQ6frIs7VD0F162GZCbzw3IvV8cIvLV2PeHpjiTFgO/UWLpVKhok88x8KmRykZhzFijShazuX598TpNB3f+1+fuR8qjvdKsIEgispdfchx16z411z4F6gwN8mYhnQsSY0uhQiyED9IB2gKWISXe4iaTkz2D6MDAdMYvMlc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043068; c=relaxed/simple;
	bh=TsFZdMOj5rLwtRAOTnKw3BA7IJwz8NSAJ6esGUjlHmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/31ME9AubBwLywzV6afTuw1EQKOnaj9ZQpJe7SKEdAahmWdHjOeqQ7AieuJxDlvNx2sE5H1cnvXHrgYA5Gno4J25yqp3IvOQgzx+ArrDx6NAbfUZZR9Itpc1cr0VNz/AuUx8Aq1FQBgZ81zU6BUh7oaLzlbNbGlThSpPv359wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E8eV7sqK; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E8eV7sqK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1712a04ddaso352939266b.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788043065; cv=none;
        d=google.com; s=arc-20260327;
        b=AF0jRnL9o5kGOYuYVxAIk4/Pr0k/uagPakXzO+/3KrOLz2YOx8BmlRRIWXJ5aKfJH0
         5n+M8KnOElfIPrUlkO1Hq5llG1coHlRIY5S5gLpts6T/7a1ruz7ee3RCQmS6oXWtwUNc
         Cg3C5YEKLWjK3APaaDwyuQK8QahhpomQoXg23YDwjZV8wsJ5Go/NKwkqNgwy/h2q1XIm
         s+Q1+j0qhWdvRWzWtHjt+QosuN3MLWlpqBOfXONKYxMuT+1937HWr2IeHj3GK4sAajzw
         f5vp3a4GWMa4Oudf8uKG4jQu2ASGjjxmaCFs1yQfosQRPZ981GgIZEG+cZJ0ZibKunpS
         4Zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PK5+ebo58fLL90h4T3fdmmHGJC9BFvbFY+KskDlfNO0=;
        fh=5OACF3Pagb20vZOhvOGby4x9KrbobwUNc3TICoKFF/o=;
        b=UxXX5qr4itT88W2AjuLmaPTaW9ZvCotDAuIB8RlSBx4EuYgeWsItrqzTc7pUbOgTNy
         MDHxSutmEHu2oGKgZIVBm3qSSo/xmwC9U8u2sJcj/948SU/XU7L8JXFsbpLaWXwHavQo
         nSriEsTKYuWFwCHe8YjdK2WDAEcF1fnXco+GZhM6nxyBrpoxF3/m9O2sMBw6JUhdweHZ
         ANmP00u1quEz0OFaIGj0Dkue7xSrrhQN8/LZ+3natUdXETQunZtK8nSu3XOyjqaYLfyi
         IU1LTF8s6F9t2FJgrox7APRdeUXJXzegBnFu1wfiVagGN7T/QvXWVIP9nGKJVs13YrKI
         V4Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788043065; x=1788647865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK5+ebo58fLL90h4T3fdmmHGJC9BFvbFY+KskDlfNO0=;
        b=E8eV7sqK2Hk9SxO98Q7vMCqWEWb+tZ3uPwCuHBxtr8fPQ8rnLKGMTw5FJenU3rg7AM
         dO3/11LsKt+yAMfLnK1minHJWcAWrNV4k5b6Dk3bHtD2UQeFjKHH3VRC4TNxgnGaMoAE
         ev6QAf5mkL+KHc1QXVzxMkRDpuBou0bEPeVY6HwT1QW8bMzmSCtrIJxKLt/ti2v3ESga
         UVQwY0j9Oxz/pi2sp/KS3lGmkTqLCX8XTTu4UdQxZvFz/BpsAnN/pKGTwiaJMj8+AWfD
         PrKxuzrS/li5aQIg3TEjlYQobe7/5i1f4I9XgHRdV6Qq2P1Gre1mkxa8mKQZgJ0wNY91
         2vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788043065; x=1788647865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PK5+ebo58fLL90h4T3fdmmHGJC9BFvbFY+KskDlfNO0=;
        b=iQlPRxokrKcWOAKC2r5HW3FmC7rq2glBx+YmGPXDjJ1y2DY+blhkpRdmWreMvt/7UB
         DrYoArWCF/bLqbBNhxFs38WR2hw2vf8KQRokGOMWVEpFAUPYLwfEu0/T3PKemQnpEhHH
         yzJpsG0Wc8XvT4XmxesnHp/jcDLp3a9H1/Tnsy3nz5pKVXBb5UcpS6XppDIOFhJRsBwt
         vuB/S3PzcZVPXn2n/BCuIhuIbbQaAJSBvmchIYMenEQZee3Wc6XahD1NZ1vn7dOaVnay
         GjaIcpXEjuKwFWT2QPIjU0YtVZ/sEe+LH8L8LQVPfuVlxSAzigcelMyK6cIA/9mxEHWI
         U3Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqNqPZxgSJhWeRP13p5G3MsgGkw/qsPkKauzRUF2wVtQM/kFBqbXw7VFehA4iqh0oXaCOfME28l19+LNsI=@vger.kernel.org
X-Gm-Message-State: AFuF++nlmUkbdqt4/AYpr3Sgkr9UWTzWXtTtaa6Yrwbz5kdkCKB4lQ+R
	2P35wHNbi3tD21649sKX7DhmKQWpiyl/4xuKDB8blqUFOJTNF0gf/a3iyD5a9+EZrf28x5Wk4uw
	n6yTXuxWwv6l1xRKU+rDJOynx/Tb0fuY8z1Qdgi+E
X-Gm-Gg: AR+sD12X5Rok4VKYZAjsKcEn0W4Ei1Xd2bWcMZfkMJ2odaMeWR8EHpbJuy9RIjDnWxF
	0nil+Uaf8b9p903lUVwIxU9rOhkNXDDuk8g5dd+wWCzEtA5J4y0aqQlGysS/aRabwtq8s9Fci/g
	GTCrIShBtXEJrMX5LPPxwmHu37JcKi1N1msXPRo4ikGBWW6xexAONwu4qtSC+YiGkhYZHtp7nuK
	VMeqnyiGD8xZpId21LRzfkcl37wB3a23qnbZUWIssStsnpVLRMUy8S7C+EhNcjodPaT6aKQOULB
	wOZv5ucWM4F7fzb4Qh0khr4/rpdMnJALKvbFL8PMgHhirxUD0alwv8enhLHVfHYyNf2OPdmjmf/
	oap/ize1QCykldGvxOluFOeuhY5BMlLo=
X-Received: by 2002:a17:907:9453:b0:c25:68c2:7b94 with SMTP id
 a640c23a62f3a-c2568c27f5cmr737432066b.8.1788043064181; Sat, 29 Aug 2026
 15:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828153349.8061-1-odion@efficios.com> <20260828153349.8061-3-odion@efficios.com>
In-Reply-To: <20260828153349.8061-3-odion@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 30 Aug 2026 00:37:32 +0200
X-Gm-Features: AcwNN1W3eg7UYscs7XyzUecXo3r-P6TD7LYmg2J_i9iZyMJ2aJ2yIR-sgbs3-QI
Message-ID: <CACT4Y+bqqAsAjVOShaGcoV6+6Sh=eWTdeuUYsdCK__mVsZBjOA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] rseq: add per-task rseq operation state
To: odion@efficios.com
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	David Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, 
	Sean Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, 
	Florian Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, 
	Chris Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, 
	Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Carlos O'Donell" <codonell@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 17:34, <odion@efficios.com> wrote:
>
> From: Olivier Dion <odion@efficios.com>
>
> Add the task-side state for rseq operations: the rseq_event::rseq_op
> state indicating operation processing is enabled for the task, and the
> nr_ops counter in struct rseq_data. nr_ops is edge triggered: its 0<->1
> transition enables/disables rseq_event::rseq_op and the user visible
> RSEQ_CS_FLAG_RSEQ_OP_ENABLED flag. This makes so that only thread that
> enable RSEQ operations through prctl takes a performance hit.
>
> Include rseq_op in the sched-switch raise condition so pending operations
> force a return through the rseq exit path, and declare the rseq_op_prctl()
> entry point (with a CONFIG_RSEQ=n stub).
>
> Signed-off-by: Olivier Dion <odion@efficios.com>
> ---
>  include/linux/rseq.h       | 10 +++++++++-
>  include/linux/rseq_types.h |  9 +++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/rseq.h b/include/linux/rseq.h
> index 7ef79b25e714..d1e33906d863 100644
> --- a/include/linux/rseq.h
> +++ b/include/linux/rseq.h
> @@ -69,7 +69,9 @@ static __always_inline void rseq_sched_switch_event(struct task_struct *t)
>                  * was via interrupt from user space. ev->has_rseq does not have
>                  * to be evaluated here because rseq_v2() implies has_rseq.
>                  */
> -               bool raise = ev->user_irq | ev->ids_changed;
> +               bool raise = (ev->user_irq |
> +                             ev->ids_changed |
> +                             ev->rseq_op);
>
>                 if (raise) {
>                         ev->sched_switch = true;
> @@ -172,6 +174,8 @@ static inline unsigned int rseq_alloc_align(void)
>         return 1U << get_count_order(offsetof(struct rseq, end));
>  }
>
> +int rseq_op_prctl(unsigned long arg2, unsigned long arg3);
> +
>  #else /* CONFIG_RSEQ */
>  static inline bool rseq_v2(struct task_struct *t) { return false; }
>  static inline void rseq_handle_slowpath(struct pt_regs *regs) { }
> @@ -182,6 +186,10 @@ static inline void rseq_force_update(void) { }
>  static inline void rseq_virt_userspace_exit(void) { }
>  static inline void rseq_fork(struct task_struct *t, u64 clone_flags) { }
>  static inline void rseq_execve(struct task_struct *t) { }
> +static inline int rseq_op_prctl(unsigned long arg2, unsigned long arg3)
> +{
> +       return -ENOTSUPP;
> +}
>  #endif  /* !CONFIG_RSEQ */
>
>  #ifdef CONFIG_DEBUG_RSEQ
> diff --git a/include/linux/rseq_types.h b/include/linux/rseq_types.h
> index 85739a63e85e..059292695c34 100644
> --- a/include/linux/rseq_types.h
> +++ b/include/linux/rseq_types.h
> @@ -23,6 +23,7 @@ struct rseq;
>   *                     exit to user
>   * @ids_changed:       Indicator that IDs need to be updated
>   * @user_irq:          True on interrupt entry from user mode
> + * @rseq_op:           Rseq operation processing is enabled for the task
>   * @has_rseq:          Greater than 0 if the task has a rseq pointer installed.
>   *                     Contains the RSEQ version number
>   * @error:             Compound error code for the slow path to analyze
> @@ -44,6 +45,7 @@ struct rseq_event {
>                                         u8      sched_switch;
>                                         u8      ids_changed;
>                                         u8      user_irq;
> +                                       u8      rseq_op;
>                                 };
>                         };
>
> @@ -115,6 +117,7 @@ struct rseq_slice {
>   * @event:     Storage for event management
>   * @ids:       Storage for cached CPU ID and MM CID
>   * @slice:     Storage for time slice extension data
> + * @nr_ops:    Number of registered rseq operations
>   */
>  struct rseq_data {
>         struct rseq __user              *usrptr;
> @@ -125,6 +128,12 @@ struct rseq_data {
>  #ifdef CONFIG_RSEQ_SLICE_EXTENSION
>         struct rseq_slice               slice;
>  #endif
> +       /*
> +        * Number of rseq operations registered for the task. Edge triggered:
> +        * the 0<->1 transition enables/disables rseq_event::rseq_op and the
> +        * RSEQ_CS_FLAG_RSEQ_OP_ENABLED user flag.
> +        */
> +       u32                             nr_ops;

If we copy ops to kernel memory, it would be useful to have 1 op
embeded here (with fallback array for more ops). For now the only
known use-case for this is memory allocators, so I would assume in
most cases it will be either 0 or 1 ops registered.

>  };
>
>  #else /* CONFIG_RSEQ */
> --
> 2.54.0
>
