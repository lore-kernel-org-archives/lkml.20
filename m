Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8784D09FB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161837; cv=none; b=uSOoLWmbXL5aRaIxjdQsYIN1sY46O2/YGszhBe3CCStnSRSJovZM9cVU+k2/uzrLNZNTGQeCR4Nw/QvRlfss1R8rNFE6/ziw9h3+24MwKQThh3EL9KiKSlRM67dZbZujRKSP2HxwgJMj4xDBmSXWFvA2Ie9eyNeyrWJM/DO4Os4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161837; c=relaxed/simple;
	bh=J1Q/Q1Mrwkgw985kLpbw6VKpHRGgH5RqKq6L9vMk7i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qraVsFuutx/SQcBDwewcW56Izrf5fBeieyiLgxMzPYBQ/abLY691RNLyJ2Lr/ERWamGqKtjsScC6Z5qGYxq2Y2yPvRix1Qg0KGHiylclckTjqpOFI72li6xakAvJuFnc78qgL1hftZdRW3PoAnkmzA4/fznUMq1kyhaS72wPjd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hmj3b3PA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hmj3b3PA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso272655e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792161834; x=1792766634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOETA3nf19cAe1QBHzeVrm7+5HNM5ud+Puz+h2+j2BI=;
        b=Hmj3b3PAO6T7T6zHkHAxigoCYDruGhtVPWsNgxR2a9lGucRwBELi07e7ZMYEE++SY1
         DM6l9hdVB5yVQ9uoI3qLwVldp2UOz1XavRiKFo6GTNrITTRndb2ln3XRpHGjYPUHxk75
         +W+7EBa8KUVjRVs1WDi241AbshNGIn/8fF7riCNbhVJkPPF9lqhkQcpTasunE5w785/I
         STD4r0MN+CNq2cgR2eJGUMsKLMOuX8Ko7mCTRm67Bbb1A63SKp7hcZHTTkIlIbOAEAqu
         psdxydELHLQ5K4138dgWBGaJojZ4DjqaoYnTubNZsO7hdpA4oD8HVAC08B6r9lt0oADJ
         E9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161834; x=1792766634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOETA3nf19cAe1QBHzeVrm7+5HNM5ud+Puz+h2+j2BI=;
        b=CLATWmUhemb7dfPDv2zV+Kod1gBZmEa8z7O3sADrijw1i3QGNMaHjWEnjUheZwZ9lD
         BFRpHmgKxXsEVe+Gwcw2hT52cCJWBT3tZ9n8E32r7+MY3o9MDcCJ+IfK2QORDEI6H7JG
         eXdli8oPY3e6Ri+EjJFBmIap7XyxkskM7in8Q/rac7etJI5eqjTzpYGik0KMswvlGXNk
         n9w0gG2jFJ1eh8vSOZis2J5BKKcB6op0HKbIY2iaPvyJe85UZk5rX9nJ2jaRHwZR/xoI
         TOxfgfH8679DMFnKEOAP9c/TgxeIgAPfp4KI28VKo1Y62DKJgPSqSp5mJAzT0EyPYf49
         8J7w==
X-Forwarded-Encrypted: i=1; AKwUvBwcONZqbibxjTm0Avbk6w/nIkys8UvC4a39R4c9oaIEMEp3eAu5WVLKb0fN+MisSUoM1XIrMw2c1nZB0gI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl9I33LfuvmG8/UTZiisrGVGhRjM2JJIShel45IGyhhSBgsaXm
	k13euv7NXwO57BIfjsNQAaZIqWYnF388Gs84HY9EQobHMWDl3pZCMOn/p91TC7KtmOrFPqj9tgc
	CpzsPIyY=
X-Gm-Gg: AYBFou0pHRjQ0SO5MN7AX5b+vPPTHyOkwOVyq08sRFbeFbzyoxOByQ4m0U/B+sxAoio
	yro01GHdWpsADQZm3aC13OiX/nvfipxCFdvTSfPdSWMiH/SQvWLum7tbOdnWshK5Gu5bvSw1mbx
	zYC8bT8Eew6DYIWuGMxlbK0JZNgv/wTnGTrAK+/0S7kErJBMgLq27uhOp1VEZQ4BQsMjZR8FIc7
	D8m/9pWARHLH/Au4CYuMU5dYF0iaaB6peUhk6hH3WdcQulul0nO/W4H04UhsN2928w8Hj6nH6iT
	HbkP2wntK20xfrVLnwdaZ4GcWO4SenEzkaym8uThc0x65fJL/XfujG7VRtO3b+AflX/n6/6+6cb
	nB+KzzigF5Kz3WtV7MceS8GPAF2lO9n0zjHaz9RAXvZO3GXahEE0EYScKVNkjHA8G6yFyNYPwZm
	/S+u8I3bjwQSIFvKK1xqIDo7UyddvlVmbo63PR6l714ttDFyAbrswpl2e6aijgBdBPG0k31xUe
X-Received: by 2002:a05:600c:6215:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a1d760e4b0mr190735e9.25.1792161834386;
        Fri, 16 Oct 2026 07:43:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm28934835e9.9.2026.10.16.07.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:43:54 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:43:47 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
Message-ID: <atI4IyP7LtxsTzIF@pathway.suse.cz>
References: <20261016085441.857695-1-john.ogness@linutronix.de>
 <87ik31iz4x.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik31iz4x.fsf@jogness.linutronix.de>

On Fri 2026-10-16 15:00:54, John Ogness wrote:
> On 2026-10-16, sashiko.dev wrote:
> >> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> >> index 0ed86b5e8b160..9a205f94bfac7 100644
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -3864,7 +3864,7 @@ static int __init printk_set_kthreads_ready(void)
> >>
> >>  	return 0;
> >>  }
> >> -early_initcall(printk_set_kthreads_ready);
> >> +subsys_initcall(printk_set_kthreads_ready);
> >
> > Can this delay expose a regression where a use-after-free occurs
> > during failure paths?
> >
> > If nbcon_kthread_create(con) fails, it calls
> > unregister_console_locked(con).  This unregisters the console and
> > recursively calls printk_kthreads_check_locked().
> >
> > The recursive call restarts iterating over console_list and may
> > unregister subsequent consoles, including the tmp node held by the
> > outer loop:
> >
> > kernel/printk/printk.c:printk_kthreads_check_locked() {
> > 	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
> >		if (!(con->flags & CON_NBCON))
> >			continue;
> >
> >		if (!nbcon_kthread_create(con))
> >			unregister_console_locked(con);
> >	}
> > }
> >
> > kernel/printk/printk.c:unregister_console_locked() {
> >	...
> >	/* Changed console list, may require printer threads to start/stop. */
> >	printk_kthreads_check_locked();
> >	...
> > }
> >
> > Because hlist_for_each_entry_safe relies on the tmp pointer, the outer
> > loop will later process the already unregistered tmp console and call
> > nbcon_kthread_create(tmp) on it.

Heh, I have missed this recursion. It is obviously problematic.

> > If this succeeds on the retry, it spawns a zombie kthread for a
> > detached console. If the detached console is dynamically allocated and
> > freed by its driver's exit routine, the kthread and the outer loop
> > will dereference freed memory.
> >
> > Can the loop in printk_kthreads_check_locked() handle the recursive
> > unregistration of the tmp pointer safely without resulting in a
> > use-after-free?
> 
> The case Sashiko presents is possible (even if unlikely). I would not
> associate it with this patch though. It is a pre-existing
> condition. Probably the cleanest fix is to pull
> printk_kthreads_check_locked() out of
> unregister_console_locked(). Something like this:

Breaking the regression is an obvious solution.

Alternative solution might be to split printk_kthreads_check_locked()
into two similar functions. One for creating kthreads and 2nd for
removing them. We need to combine creating+removing only when
a kthread can't be created. The removal part should not need
recursion in principle. But it might require duplication of
the various checks.

Your proposal looks easier.

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 0ed86b5e8b160..0a87f49b3908a 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4322,9 +4322,6 @@ static int unregister_console_locked(struct console *console)
>  	if (console->exit)
>  		res = console->exit(console);
>  
> -	/* Changed console list, may require printer threads to start/stop. */
> -	printk_kthreads_check_locked();
> -
>  	return res;
>  }
>  
> @@ -4333,7 +4330,12 @@ int unregister_console(struct console *console)
>  	int res;
>  
>  	console_list_lock();
> +
>  	res = unregister_console_locked(console);
> +
> +	/* Changed console list, may require printer threads to start/stop. */

It might make sense to warn about the potential recursion. Otherwise,
someone might try to optimize it back. And the problem is far from
obvious. We should not rely on Sashiko...

Something like:

	/*
	 * Changed console list, may require printer threads to	start/stop.
	 * Do this outside of unregister_console_locked() to avoid regression.
	 */

Or we could add a comment above printk_kthreads_check_locked(). But it
would be easier to overlook.

> +	printk_kthreads_check_locked();
> +
>  	console_list_unlock();
>  	return res;
>  }
> @@ -4471,6 +4473,9 @@ static int __init printk_late_init(void)
>  		}
>  
>  		unregister_console_locked(con);
> +
> +		/* Changed console list, may require printer threads to start/stop. */

Same here.

> +		printk_kthreads_check_locked();
>  	}
>  	console_list_unlock();
> 
> I can submit an official patch after the 7.4 merge window.

That would be great. Thanks in advance.

Best Regards,
Petr
