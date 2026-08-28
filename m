Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DDC3793A5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904925; cv=none; b=ak2XgWfQsAzRiqoF1GGFQFD4zJV3Eggktr5y7N7jkw6cUoKALAZZLKM4w/2FOWK6UtLm8JjkDKKLh55YknS+Ftc3tpD/ogldtH/Tp6NqJRDDVFQYRpS+TANDmwmRT+GoYIkAEk4E4PjGPX9nNcVfqwG6RQ9PYu/sh1i6C+nKjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904925; c=relaxed/simple;
	bh=3mZNFLp90zaP+rXK3t7jQxHxyPHZkzDAAMulZKNJfC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGUuqzvYfrt24S5lN3r43cfO1zOaJh/5Ob+fKH0M+2AwmOby7oa0D9eMqGJ9p29ElVQn0gD2G7VliqM6kIYG/DelX0OD5qNzUMJN9lNcrKEeJKtszsZC2FTKmIfIY0RnCeGuYhD+MsB6SgPCxla/QV9NuXuOg7Q4hUykjvSmzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S/60QJ9G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FJFef97Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S/60QJ9G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FJFef97Y"
Date: Fri, 28 Aug 2026 10:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787904921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqW+gXJVyQXgPVNDppZWHF9oYkykcuSqMcWwVDdb9Nw=;
	b=S/60QJ9GlOEbwipwlTDwjt2TZP2xwRWArZLUVQp1g6uaH9S+DHW5Uiuwvo4HYlct1VqePF
	e3CCQuM2ve26ZxBcWRl3tbPbv4nDELCH+hEYySG+G7DHqoFh35J8f8YjI5IuSTVV4LlKId
	+lXPsogzalPbZ4wdMNGGoj9r3xLPKmsgdMO1SG4hMX2Qjlk/ELFy6BTCSUHJMkOfMpO/O2
	UjtPMmfwg1a20WbUtG7yhYWm251HLlNXJJtXD1RJTfUKudcppAzB8NT6LxFV9O94xDXn61
	7xDZGwQr2kSyrfKrUAuW/dXk0t8XA0c1ic6LlYlNH5Ae0X5WHfGApURa/CVPng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787904921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqW+gXJVyQXgPVNDppZWHF9oYkykcuSqMcWwVDdb9Nw=;
	b=FJFef97YeQHbnAhn7ouHzEiDthDlaXEOvKGLHzs23w4lKg7iS6hEKy3egexgVMKYWPzpEb
	LGXNbuunFw+oRLCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH printk] printk/nbcon: Change nbcon_irq_work to
 IRQ_WORK_LAZY
Message-ID: <20260828081519.xqXvFfEJ@linutronix.de>
References: <20260827184750.203521-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827184750.203521-1-john.ogness@linutronix.de>

On 2026-08-27 20:53:38 [+0206], John Ogness wrote:
> For some platforms it is a problem to queue irq_work when entering
> cpuidle states. Since nbcon uses irq_work for waking the printing
> kthreads, any printk() calls when entering cpuidle states can lead
> to the affected hardware hanging. Tegra20 and Tegra30 are examples
> of such platforms. Avoiding raising the irq_work IRQ has shown to
> circumvent the problem.
>
> Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
> an IRQ upon irq_work queuing. The irq_work is then handled on the
> next interrupt (worst case, kernel tick). This additional delay is
> acceptable because nbcon_irq_work is only responsible for
> non-emergency deferred printing, which is delayed anyway. This also
> has the benefit of not needing to raise an IRQ for each printk()
> call.

This makes sense regardless of the Tegra issue. I'm still curious what
happens on Tegra ;)

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/printk/nbcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index a5921a84a80ed..ad79e30afd647 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1782,7 +1782,7 @@ bool nbcon_alloc(struct console *con)
>  	}
>  
>  	rcuwait_init(&con->rcuwait);
> -	init_irq_work(&con->irq_work, nbcon_irq_work);
> +	con->irq_work = IRQ_WORK_INIT_LAZY(nbcon_irq_work);
>  	atomic_long_set(&ACCESS_PRIVATE(con, nbcon_prev_seq), -1UL);
>  	nbcon_state_set(con, &state);
>  
> 
> base-commit: ffe0486b139e45cd9c9ca2584f04a1910fe4f8a6

Sebastian
