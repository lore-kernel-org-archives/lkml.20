Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32D4EC66E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564130; cv=none; b=nNyZNDPN91txtUu5SZXE8IcScd//DIiGKohZEA4zdp3K+A4z5WMXhP87RjJhMuxP1r+G5/E5JGwsYBS7OcWrLrhyKlhbnoYxOidnaqaJ+Pn1vOKfh+XOAdWRnQQ9dKNYUwD8se5d6bEeXYjBMAx+Bt6ymHEivFMpT7zTol0hT+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564130; c=relaxed/simple;
	bh=5BTWtbg0mu1rNzz8YWaqDv3ULpvdcxRNTxoK5iQyhFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiCfBKpFes2gV6tJuFe+rx1c+5AXVu1S5br+fKn7WffnGAgaC9t5jzRXR3E/7DVOlir9lWErVdCmtOTgP/V5x92+kbPEsbVBZo+nLoKcp7Wob9B/mbHLf05xpGxZ7nhlIgq1yd/WTaDnViquvyE85R3eLN5onR8U3ee5BUIkZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CFS18/r3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CFS18/r3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so6338435e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789564127; x=1790168927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XsCHM+rpLim0MlmXFlwYJpF1qUZSo7GdUpT+e7YkU8=;
        b=CFS18/r3g4FaN9ieRC9UO9AzbQo1GGZkrzVgNtP7SsT0JRFK7YazJlFVAC4OiXwpU9
         51303r4u/rsSVyd5FhKLPo9CDfMa6ct4ng/QPDDFJjhqS6v73jxEpMpLYC93z97m9F+u
         xpBQmAu4TBKFQbO2BfZqRu1UuO2RbcBEfcClpbqcUQg4R3dmBRgoeswtwUq/Ngn098UW
         K+bA9N3lZ4iUm5hP/7KitJ1RrjBaS7NB9AG9U8iYHlC1VPXdL64w2iZgQBewT3HoCJpX
         dLJsiUwhISqi3MONi9MDNHKhZqHsZ1mBpgOdAtCSmflCCj2/oIyIZwMiX3LFyaymBaP5
         UaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564127; x=1790168927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XsCHM+rpLim0MlmXFlwYJpF1qUZSo7GdUpT+e7YkU8=;
        b=RgV5oM0kmjdPp14dJf6xVxNMIXN6w0biYnZy/weLnppT6pjbO8cN7/9fgjT5pLjobD
         JPIxoazOyRBcmT6v1maakCFceugFE610CEPRjGLeOuN+uT/uvSmsnaE7QQg0ExIya/Bt
         PIm1qSQnS54aCaiCGsmWU81zXjQbVNaIa1tok7onRxGRBaZSMRJNat72ScYck/eYbWz4
         ufGjwxpyzu/QtW0jO+WwURp69wWpvBUB0BpJsXMQllxHB47lKg/CxR2ziM4wX0UpqDHM
         Csz5YDuLEH16iC9w2+ZPZJQLsWu0VCPnqiFxFt7vyH0NftJ+/3WndKcWsK7dAYjZ3Yxp
         Bhwg==
X-Forwarded-Encrypted: i=1; AKwUvBzhG0lunsngnG8qONA92VclQLFh8pA+Fv8J965lgqj8v6hWxgLigTuETpaM8WTvj/doYGFbnWQds/04IdM=@vger.kernel.org
X-Gm-Message-State: AFuF++lmoscXDUdljLImG+AwdN9ri9u+1epkWqhNy+kLecKnKVPtB9ze
	4KR1J9ZgNcymGRFEelhHTHUhbWPQGrqIjMBV4IjzYiUK8N5tBhxprGSHOF/HiuQhZlA=
X-Gm-Gg: AYBFou0Is1IaMNYMtEJxW77mfhdx28+HMbayKk9yYBgmQ1wPackn/eDrHa9cPGPysHU
	w0ffuSwH7vAG7hT7txuzarEGowppdCdKWvzX5/mFbtTu7rkK7f/N8ilJo75zWZk2/VjJemIb57C
	aghlepmCK21k0PnN5M79Vm+HvPCDJGe5rozRvMz3ljCB4oki0OfwKhAWLvaEzYJ5UV+5aKXbIkt
	dlhA5U+REtce+5U3R859CzWDa0LBD4/KDg9hRloeRiA+Vf6cSAGXwvUBfOQUOnCOL2Utod1TySM
	6LnNjzw3IzRDuabotGN/JxEXixPlugjlMXWmrTjOsWyLBYv9CqOYrjFzsFC5MlucfR5HK3+T/2w
	fNTs+oNrzBmLFGspu4CaHs6xk9svV130C8R0BAanejLc4uN/W8cRZj4geOFoAzLY55i0tE0ZIBn
	OsL7dfk3/WOXsoLTJW+RJBXuAm5B1tdU7VqD4tUByRptB7goVJD6oej5KDU9XRJ3MwJIY7QhEoQ
	5n6tepp53ncSwk=
X-Received: by 2002:a05:600c:8b8a:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49eac463921mr35610465e9.7.1789564126743;
        Wed, 16 Sep 2026 06:08:46 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm55325365e9.1.2026.09.16.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:08:46 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:08:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <aqqU3I7d9lMAjSvy@pathway.suse.cz>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100140.3631650-1-ryan.roberts@arm.com>

On Tue 2026-09-15 11:01:38, Ryan Roberts wrote:
> Netconsole registers with CON_NBCON_ATOMIC_UNSAFE, so its write_atomic()
> callback is only usable during nbcon_atomic_flush_unsafe(). Previously
> this was only called by vpanic() if panic_timeout=0 - i.e. if the system
> was configured not to reboot on panic. So if the system was configured
> to reboot on panic, netconsole would never receive the panic logs.
> 
> Move vpanic()'s emergency_restart() call to after the call to
> nbcon_atomic_flush_unsafe() to solve this problem. The downside is that
> potentially unsafe operations are now performed prior to
> emergency_restart() which could theoretically reduce the chances of the
> restart succeeding. But we are already in a panic situation so it could
> be argued that everything is best effort already.

The panic() code is like walking on bumpy roads. It tries to be as
safe as possible. IMHO, it has few important tasks:

  + show debug messages
  + create crash dump (optional)
  + safely reboot (optional)

The debug messages are important but some users might prioritize
reboot over the debug messages. It helps when the panic() is rare
(low likely race) and the system is quickly able to handle the load
after the reboot.

This is why we put nbcon_atomic_flush_unsafe() only into the path
which ends with an infinite loop.

> In older kernels (v6.19 and earlier) netconsole is able to print these
> panic logs while the system is configured to reboot on panic. So from a
> user perspective this is a regression caused by commit 7eab73b18630
> ("netconsole: convert to NBCON console infrastructure").
> 
> We have automated test systems without BMC access, which rely on these
> two features working together.

I see. To be precise, I would say that the primary culprit is the
commit 187de7c212e5fa87 ("printk: nbcon: Allow unsafe write_atomic()
for panic"). It adds support for consoles which will be flushed
in panic() only by nbcon_atomic_flush_unsafe().

It is a big difference because printk() tries to flush both
legacy and "safe" NBCON consoles directly in panic(). In addition,
they are explicitely flushed by console_flush_on_panic().

console_flush_on_panic() is called more times in panic().
And it tries to flush legacy consoles the unsafe way even
before emergency_restart().

OK, we should close this gap. But I suggest another solution.

We already have the following functions for flushing NBCON
consoles using write_atomic()


  + nbcon_atomic_flush_pending() - flush CON_NBCON consoles
	using con->write_atomic() but only when safe

  + nbcon_atomic_flush_unsafe() - flush CON_NBCON consoles
	using con->write_atomic() and allow unsafe takeover.

I suggest to add 3rd variant, for example:

  + nbcon_atomic_unsafe_flush_unsafe() - flush
	CON_NBCON_ATOMIC_UNSAFE consoles with con->write_atomic()
	and allow unsafe takeover.

And I would call this 3rd variant in console_flush_on_panic(),
something like:

void console_flush_on_panic(enum con_flush_mode mode)
{
[...]
	printk_get_console_flush_type(&ft);
	if (ft.nbcon_atomic) {
		nbcon_atomic_flush_pending();
		nbcon_atomic_unsafe_flush_unsafe();
	}

	/* Flush legacy consoles once allowed, even when dangerous. */
	if (legacy_allow_panic_sync)
		console_flush_all(false, &next_seq, &handover);
}

But maybe, this is over engineered and we should just call
nbcon_atomic_flush_unsafe() in console_flush_on_panic(), like:

void console_flush_on_panic(enum con_flush_mode mode)
{
[...]
	printk_get_console_flush_type(&ft);
	if (ft.nbcon_atomic) {
		nbcon_atomic_flush_pending();
		nbcon_atomic_flush_unsafe();
	}

	/* Flush legacy consoles once allowed, even when dangerous. */
	if (legacy_allow_panic_sync)
		console_flush_all(false, &next_seq, &handover);
}

If there there are people really concerned about the reboot
reliability then we might need to make it configurable, e.g.
by adding reliable_panic command line option which would skip
the unsafe flush before reboot.

See below.

> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -732,32 +732,22 @@ void vpanic(const char *fmt, va_list args)
>  			mdelay(PANIC_TIMER_STEP);
>  		}
>  	}
> -	if (panic_timeout != 0) {
> -		/*
> -		 * This will not be a clean reboot, with everything
> -		 * shutting down.  But if there is a chance of
> -		 * rebooting the system it will be rebooted.
> -		 */
> -		if (panic_reboot_mode != REBOOT_UNDEFINED)
> -			reboot_mode = panic_reboot_mode;
> -		emergency_restart();
> -	}
> +	if (panic_timeout == 0) {
>  #ifdef __sparc__
> -	{
>  		extern int stop_a_enabled;
>  		/* Make sure the user can actually press Stop-A (L1-A) */
>  		stop_a_enabled = 1;
>  		pr_emerg("Press Stop-A (L1-A) from sun keyboard or send break\n"
> -			 "twice on console to return to the boot prom\n");
> -	}
> +			"twice on console to return to the boot prom\n");
>  #endif
>  #if defined(CONFIG_S390)
> -	disabled_wait();
> +		disabled_wait();
>  #endif
> -	pr_emerg("---[ end Kernel panic - not syncing: %s ]---\n", buf);
> +		pr_emerg("---[ end Kernel panic - not syncing: %s ]---\n", buf);
> 
> -	/* Do not scroll important messages printed above */
> -	suppress_printk = 1;
> +		/* Do not scroll important messages printed above */
> +		suppress_printk = 1;

We should not supress printk when emergency_restart() is going to
be called. It might print some error messages which might explain
why it failed, ...

> +	}
> 
>  	/*
>  	 * The final messages may not have been printed if in a context that
> @@ -767,6 +757,17 @@ void vpanic(const char *fmt, va_list args)
>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>  	nbcon_atomic_flush_unsafe();
> 
> +	if (panic_timeout != 0) {
> +		/*
> +		 * This will not be a clean reboot, with everything
> +		 * shutting down.  But if there is a chance of
> +		 * rebooting the system it will be rebooted.
> +		 */
> +		if (panic_reboot_mode != REBOOT_UNDEFINED)
> +			reboot_mode = panic_reboot_mode;
> +		emergency_restart();
> +	}
> +
>  	local_irq_enable();
>  	for (i = 0; ; i += PANIC_TIMER_STEP) {
>  		touch_softlockup_watchdog();

Best Regards,
Petr
