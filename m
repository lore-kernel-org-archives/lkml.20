Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586655;
	b=RLBUS862xpCaIRQywMcufnEoxOg7ilzBNOu/QnnSb42UVKvUJcYl4AJLIOCG/yDVMy3+
	 kd7uVqU42Ot2+yBv5Kpf+paCwIVHbfVwPtdEWvYBZ07AUR1+a4Jz1vW+Rk5pVWTXchevu
	 rmlitlfjTFfSVditp9zczOoZxLZZjrh+GE0anKVHqk5zCdLfV8tod6i8WKxHd0neEkjyL
	 Sm/Gg02myWzJ4fovP90M8DewhlFPZNl0Egouecxv+HPEv03Qs/hwa4ei4hKeGtU7wLz+e
	 /GFSzYFn6VDaVQ0Kp0miqthj3Sx7M1zMLKlVaHRjKh4H5lMVGZLefB1pgNXQu/qExMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
	b=thKaffnj9Ap2XicD45WyaAi0Y/PFm+0Hs0qwz4eBl1AsIGXy9QSPHlQRrgjRxt/ZFcmX
	 9BVoJ2QxHpBa1llM0gM4ZIGev9UJhyCq1n6CXjbG+UbY4fkth80jNSa2LpFntgk7nxi4p
	 /Z3l2bgZHoRPolj60WFmxqhd/VV6ZNXNPQJyJhm9g3ssApaU8FN4owjv+tGg1pO1jYdo9
	 TFHEJQL5GEMcVEgzX4LC5FLXcdRHLF6mV1YS5DjlBT0b+/ZguIyx5oCIqHDtKfrlDCu4+
	 YbJgERW7WscvDXxNmwbNf8tfVUhX+Yl2XMyRKTVnmP1ubnVVgGX6wJsu/jcTZOpPdTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bW7BLm3U;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E40606B2C9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E40606B2C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bW7BLm3U
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so294486166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794586653; x=1795191453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
        b=bW7BLm3ULaZG9+TXG6uTGyNRM4dzUALgQQXOu8Ffj+OFQFVZBk0Mdsy9MlkuUPxRJK
         tDNCLmxqs+qrouVMNevyEN6I5JIkG5Swa4QT7YdCg+2R+gFJiA3Pb03kwtHcA8OFcLlM
         CYGMI+PRRBqgbyPjW+QESdLduyH/AIZr/Nlz4ppEqCz6p8mcCQuPmVwbt2rk+0RHwGm+
         HZMdyMRZsfSeCacCFTTflgXw8edX4MoTl0sozirPmUJ4VW9aU8ZIJ/JFyHzXIhUc/rT6
         hdd0Sd25iimAJNtD2SBIYneKlbV+mgbw9Il5mNBBMxw6B+fAfRU5fFaAzC+5cGfAdtOn
         pdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586653; x=1795191453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3U6MCdDzdZgylBNSuWirvYPWE1+TH01NTWEY/nVWgI=;
        b=d2emAv8jqQJwNvtxf0jDwWfLKGm1sIyYbGCnS10Q2rJPSHVYRKLpTZgftDSjDNxXxz
         A3C6YhMWrDnY4Mkt1IB//hh1LzDeWYib9+pGz4IKz1tIysT/AT2OQ++VItgmkOU/c1Ju
         2KHmY05W6PtaqU/Y2n96JFe2sI46QVyF4/aUPZLmrunEObu0qDQ3YpW5X56dh4b9Ya7s
         YxWafK5/Ij3ZVvarJVVnTvm8X+TtbswidT6aRS6LGJmHM8tnFGeSzmydTlIToQJSa6V5
         nSd03C1kGEwXw9qUYThqquYeKGonkr+rxDIVw9iV+QNDLYXv94lIBmH8SDDKN4nQjvsB
         3AVg==
X-Forwarded-Encrypted: i=1; AL+hErF3IZ8KawD7W9E/xpvycdpqwZ90by020Nu4PHAwNigC7B8WttpDyZFaPm7Osc71YFV9yQHWYnx9n4PWr/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3PffPih1dVbhp7Onnc6c4Q1ckPgxwRKom6BMiu/UoImHJ5GGZ
	slc3RJ0MrG9X1d64uEnZKlXm0gxwDzzBCvSXdbBODw8vpy/J1cUqWx/1JmRuHFZbZx0=
X-Gm-Gg: AYBFou2kXgSadlFdO6DGyMw9hXM8T5+321m1xzSHdfRF6gZxMXrYzTIE1VQWLiK+nwo
	knW/5hjI6W/i9pQeCKnRsF7cWTWl+9z4smvvWwycpxOQqJXDkX1f0U8oaFexrF9juaow3z+7yXH
	IR+4CtasvD8JRJnkKbdP1r9EuIJUD9yhN6NcgmjNmoAghuu5y1/1YeUOMrMuKHTdM6XdqONy7UA
	MDUgkwLosmR8vu2lx1CK1aOPL686KR/RorJl4ny91yKqaqpbl1+/yAFepQPIUwEukG4ykJj4qT+
	ZHOUXB1G0G6yS81VZdpvEqdZm+JyyfulOOLP+ymCcdmy6WviIKiSsCTSAF1iIz7rLvc6KoONiwh
	9fKJ7ZtbvbaKnHiE06LWrL0Rqg8gfGc4AFYEeZ9YMNuWzBw6vV8OAJ1SxjeEJANq95uoOsHaOpc
	qLFrmbgd1c+/LTTPypGFt2rfsr+1lQfGQEJhiFRpC68AegcI/v4V0ANRhqI79Y47V/qryRCHQuZ
	WQRqn4TYS+bK27HA5fUAe2obNDrTm5ECjl8CxrIZCKDKfuYAxilifrsZh+OTdqp3A/oIurl4kw8
	Oz37JF/p4uIE8sG9iL2uMjNcXbDO5w0=
X-Received: by 2002:a17:907:3f02:b0:c4c:eb17:3da with SMTP id a640c23a62f3a-c509636a83emr347881466b.22.1794586653209;
        Fri, 13 Nov 2026 08:17:33 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6091dsm118589566b.57.2026.11.13.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:17:31 -0800 (PST)
Date: Fri, 13 Nov 2026 17:17:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v2 2/6] console: Introduce unsafe flush policy
 flags
Message-ID: <avc4GVqYdpL8r3Un@pathway.suse.cz>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-3-john.ogness@linutronix.de>
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
In-Reply-To: <20261111181942.593695-3-john.ogness@linutronix.de>

On Wed 2026-11-11 19:25:18, John Ogness wrote:
> Prepare for per-console atomic flushing policies by introducing a
> new nbcon-specific console field @unsafe_flush_flags to store the
> unsafe flush policies for a console. The policies are represented
> by bits, specified by enum nbcon_unsafe_flush_flags.
> 
> Currently it is expected that any @unsafe_flush_flags bits are set
> prior to console registration and do not change while registered.
> 
> No functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  include/linux/console.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 06d01f1743512..beb1ee04535b7 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -194,6 +194,29 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
> + * @NBCON_PANIC_FLUSH:		In panic, unsafe flush before kexec or reboot.
> + * @NBCON_PANIC_PRINTK:		In panic, unsafe flush on each printk().

Do we need to distinguish between flush in printk() and an explicit flush?

IMHO, there is no reason. We usually call the explicit flush because
we want to trigger it. But printk(), called in the same context,
should trigger/do it as well.

> + * @NBCON_NORMAL_NOTHREAD:	During normal operation, when printing
> + *				kthreads are unreliable or have been shutdown,
> + *				unsafe flush on each printk() or on explicit
> + *				flushing.

Do we need to distinguish between panic and non-panic paths when the
kthreads do not work?

IMHO, this is more about that the system is going down and the
kthreads do not work.

Also what about emergency context when the system is about
to continue?

> + * @NBCON_KDB:			Unsafe flush kdb output.

OK, let's assume that we want to set a policy where we allow
the unsafe takeover in the following contexts:

  NBCON_ALLOW_UNSAFE_NEVER
  NBCON_ALLOW_UNSAFE_RESTART
  NBCON_ALLOW_UNSAFE_EMERGENCY
  NBCON_ALLOW_UNSAFE_KDB

, where

  + NEVER might actually allow it when explicitely enabled in
    nbcon_panic_flush_unsafe(). The word "never" just has a simple
    semantic in the context of the other values

  + RESTART would allow the unsafe takeover in printk()/flush()
    when the system is doing halt/reboot/crash_kexec...

  + EMERGENCY would allow it even in NBCON_PRIO_EMERGENCY context.

  + KDB would allow it in KDB context


And I would get the context the following way:

enum nbcon_allow_unsafe get_nbcon_allow_unsafe_request(void)
{
	enum nbcon_prio prio;

/*
	 * The kdb check is copied from vprintk() implementation.
	 * We should put it into a helper.
	 */
#ifdef CONFIG_KGDB_KDB
       /* Allow to pass printk() to kdb but avoid a recursion. */
	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0))
		return NBCON_ALLOW_UNSAFE_KDB;
#endif

	prio = nbcon_get_default_prio();

	/* FIXME: What about SYSTEM_SUSPEND?
	if (prio == NBCON_PRIO_PANIC || system_state > SYSTEM_RUNNING)
		return NBCON_ALLOW_UNSAFE_RESTART;

	if (prio == NBCON_PRIO_EMERGENCY)
		return NBCON_ALLOW_UNSAFE_EMERGENCY;

	return NBCON_ALLOW_UNSAFE_NEVER;
}

IMHO, this better fits the existing terminology and design.
And it should be much easier to understand by developers
and users.

+ *
> + * NBCON unsafe atomic flushing always occurs at the end of panic() before
> + * the kernel enters an infinite loop. Users may choose to perform unsafe
> + * flushing in additional scenarios where the current kernel is ending in
> + * order to increase the chances of seeing console messages, even if it is
> + * not safe to do so.
> + */
> +enum nbcon_unsafe_flush_flags {
> +	NBCON_PANIC_FLUSH	= BIT(0),
> +	NBCON_PANIC_PRINTK	= BIT(1),
> +	NBCON_NORMAL_NOTHREAD	= BIT(2),
> +	NBCON_KDB		= BIT(3),
> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -326,6 +349,7 @@ struct nbcon_write_context {
>   * @data:		Driver private data
>   * @node:		hlist node for the console list
>   *
> + * @unsafe_flush_flags:	Unsafe atomic flush policy. See enum nbcon_unsafe_flush_flags
>   * @nbcon_state:	State for nbcon consoles
>   * @nbcon_seq:		Sequence number of the next record for nbcon to print
>   * @nbcon_device_ctxt:	Context available for non-printing operations
> @@ -461,6 +485,8 @@ struct console {
>  	 */
>  	void (*device_unlock)(struct console *con, unsigned long flags);
>  
> +	unsigned int		unsafe_flush_flags;

I would call it:

	unsigned int		allow_unsafe_policy;

> +
>  	atomic_t		__private nbcon_state;
>  	atomic_long_t		__private nbcon_seq;
>  	struct nbcon_context	__private nbcon_device_ctxt;

And the net console would get initialized to:

	.allow_unsafe_policy = NBCON_ALLOW_UNSAFE_RESTART | NBCON_ALLOW_UNSAFE_KDB;


And nbcon_allow_unsafe_takeover would get implemented as:

static bool nbcon_allow_unsafe_takeover(struct console *con)
{
	allow_unsafe_request = get_nbcon_allow_unsafe();

	if (con->allow_unsafe_policy & get_nbcon_allow_usafe_request())
		return true;

	return panic_nbcon_allow_unsafe_takeover;
}

What do you think, please?

Best Regards,
Petr
