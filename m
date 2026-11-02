Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657685;
	b=0jd68UubRzUuHTFrKYxJ7dvbnMXrfu8EjCktZ9gBYRUGbIP3DNFcyKeY/rSddzGbOY4R
	 zaTWoDYILAJnp0WJwLWANW2bDCKJ6knwisjp0VHhpE7Ye8wb8r5M0//ZmA9ac3nURDWHK
	 chFJWMNHnOAjh9L4yRcA9v78xnHKOPjZTOoM1pLt1L3kvzU9wlMgEvzonHOnzc+e2rnw/
	 HMTXBH1Xd+TeH5855alho9pApF6pWLl0O7b+MvkULJLbd1jfv88Okk2MPSuW5n27TM9G5
	 gl5ffgcubm2zmgfAFCqRmX4PsIXnaS/FkTVDdNEtaAaQ6graTFg+4/nlhz5txZQlFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657685;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=1lnmjW1KUbQSs6fHEOmWRmXj6fTPZ33Ittig9wLH7RE=;
	b=Esp7NmpVHcpBeh751X5brVA0Owci4drvo7z90kIWy+s8vLvJkeiHNEW0Opg+dDPDZrfg
	 lG5gSbwWL2IkB2TY4iV4uPmcKKH0Xt/W0YlpbBa6XBCMitHsGPE9SqMXLXEZV1hbinmVU
	 0L2caKPWfT2Khe/EMk96FrVKOwNuEMxUcajA1cZKcAXj+fiYkdc3PC6Z2qUGS2VRRuuus
	 ASiR8EsDyz54Hbd5t2rRkHkZR6RAKrI6pd0DS0DEjgVwQCEE2HUCp8j1So7gmymRc6fzt
	 gf4QvU3lChUi9xXPUd5LUjyM2CU8POMf+KURntgd8WrTnN3NtMt9oUVbuQFMI9tD4Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=G17OJBMT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="A5pq4ag/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDD606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BDD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=G17OJBMT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=A5pq4ag/
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793657682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lnmjW1KUbQSs6fHEOmWRmXj6fTPZ33Ittig9wLH7RE=;
	b=G17OJBMTi3dJU/NF/hKzTe4mcbCGBovYHQ4vPzzni9Fn/Zkms3MGsJzffK4uWZ6mi4N5i/
	M2COt1Qp6VQz9uzlc/v+Ee5ibrejrwC8TuiAueQ3I1bmKTiexEJio/Ug/tp1CY2toKoX/5
	qyJSwxvcm0v242kVYrnqSaewIcpg23i2gjnHUiT0DJCY3f+ZiGWR4wlgZGZnf2Oo9LS9wC
	RLoq2mImee8qYjRuDekCpb0RnA3l91LfzeiGIU19G3yjGqNhdHiALREeO4ohopwcVtPpwB
	RSaBacm6dAMEDCzN4Urs0XcQL5lZoxczl+4ugVTwbP8bs2gjTv5UKkBRRnhRrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793657682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lnmjW1KUbQSs6fHEOmWRmXj6fTPZ33Ittig9wLH7RE=;
	b=A5pq4ag/WKoh6HHPbXQo4JtOGTYfGKxlYH7NqY08q7WhdGeabPIDMLdzQvmsYQl2jj6por
	HKenEpuZkuoW6EDw==
To: Breno Leitao <leitao@debian.org>, Petr Mladek <pmladek@suse.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auTaBZlNbpm3jgvb@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz> <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com> <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com> <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com> <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway> <auTaBZlNbpm3jgvb@gmail.com>
Date: Mon, 02 Nov 2026 23:20:42 +0106
Message-ID: <87y0ba3mp9.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-30, Breno Leitao <leitao@debian.org> wrote:
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d0bd2d0cf8990b..d00a8ce5cb618c 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,6 +140,13 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  
>  			crash_setup_regs(&fixed_regs, regs);
>  			crash_save_vmcoreinfo();
> +			/*
> +			 * Flush the unsafe consoles with the other CPUs
> +			 * stopped, before machine_crash_shutdown() tears
> +			 * down what they may need.
> +			 */
> +			crash_smp_send_stop();

I advise against this if it is just for console flushing since it is
changing behavior. If it is generally a good idea, then ok.

> +			nbcon_atomic_unsafe_only_flush();
>  			machine_crash_shutdown(&fixed_regs);
>  			crash_cma_clear_pending_dma();
>  			machine_kexec(kexec_crash_image);
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 91e48d33b7dbbd..e14b1b60828130 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -723,6 +723,9 @@ void vpanic(const char *fmt, va_list args)
>  		panic_console_replay)
>  		console_flush_on_panic(CONSOLE_REPLAY_ALL);
>  
> +	/* The other CPUs are stopped, flush the unsafe consoles too.
> +	nbcon_atomic_unsafe_only_flush();
> +

As Petr mentioned, this is too early. It should be after the final
printk().

>  	if (!panic_blink)
>  		panic_blink = no_blink;
>  
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 5f8afaca886650..a43143eca1a015 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1653,8 +1653,9 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>   * __nbcon_atomic_flush_pending - Flush all nbcon consoles using their
>   *					write_atomic() callback
>   * @stop_seq:			Flush up until this record
> + * @unsafe_only:		Flush only the CON_NBCON_ATOMIC_UNSAFE consoles
>   */
> -static void __nbcon_atomic_flush_pending(u64 stop_seq)
> +static void __nbcon_atomic_flush_pending(u64 stop_seq, bool unsafe_only)
>  {
>  	struct console *con;
>  	int cookie;
> @@ -1666,6 +1667,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>  		if (!(flags & CON_NBCON))
>  			continue;
>  
> +		if (unsafe_only && !(flags & CON_NBCON_ATOMIC_UNSAFE))
> +			continue;
> +
>  		if (!console_is_usable(con, flags, true))
>  			continue;
>  
> @@ -1688,7 +1692,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
>  }
>  
>  /**
> @@ -1701,7 +1705,21 @@ void nbcon_atomic_flush_pending(void)
>  void nbcon_atomic_flush_unsafe(void)
>  {
>  	panic_nbcon_allow_unsafe_takeover = true;
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
> +	panic_nbcon_allow_unsafe_takeover = false;
> +}
> +
> +/**
> + * nbcon_atomic_unsafe_only_flush - Flush only the CON_NBCON_ATOMIC_UNSAFE
> + *	consoles, allowing unsafe hostile takeovers
> + *
> + * Like nbcon_atomic_flush_unsafe(), but consoles with a safe write_atomic()
> + * are left alone. Meant for the panic CPU once the other CPUs are stopped.
> + */
> +void nbcon_atomic_unsafe_only_flush(void)
> +{
> +	panic_nbcon_allow_unsafe_takeover = true;
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
>  	panic_nbcon_allow_unsafe_takeover = false;
>  }

The rest looks ok to me.

John
