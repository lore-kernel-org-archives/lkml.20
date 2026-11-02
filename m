Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658151;
	b=O7mLQ8WPpwjuab6fRMNWnetvgSyntNDkHSxzi1wFskDvV7VNNq0q5lUkkUWG+tabsekr
	 +49WOlugO0fGa7Lg1pDc5opZpKcGRptP/Qr2x3Sg4id0x8ccFTYcujlSiujVvrmWPj4Kk
	 uLm7NxPZ4JgR4EkY9ZCVqMmVjERWSTjF9HPhaDig5n6anriC9kB1TFlH1YEgHlsngEWeY
	 qVLT4aLBM1a9ZWVi/EXcZIxhgFaKY4SX4cEZ+x1oWnjK8wT8VoTcFMjGaGdqDKuYiPgkq
	 8zTfuRaDN2r0myxyxwZZWW1VCQHbkCv2EehJfl/7Ahj0vOQ1b4hzly8O1zL+dJKs7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658151;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=eEITTB9Xwc9DXw4H7g38mLRolEy1Vuns7syOzrMkeE8=;
	b=QKjGFr2flRTC/GLripgO2R08sA75+JS2O2NCiyrnQiRiEgM5UnFcBhxpygu54gmZTNys
	 aMGXg1DqqMKn0foCy7/ErGO6rT9XhFI4T4ulYU24a6CZZwxFa7TBsrCZTY2N6TGtQgug1
	 2CljMsiCjGCvk+bTUf6Y88jlqIulwM8HG6XIF97iKuRgxOMSZzQNFIFDGT1sHFLhvLbeg
	 vGKDC3rflH1QSFLdl9G10lQudfuErsVYJDy36GuziN+bi/WDdvM5wMjacf+wC5czH1CC7
	 IY27IP8m3BVhkQPimYujkgq/rk61QZ2dGmnUoI4SdhioAjc2MPwGprDm4Fer1o6GK/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=45ZsUJx3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="rjnqN/HX";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E214C606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E214C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=45ZsUJx3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rjnqN/HX
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793658148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEITTB9Xwc9DXw4H7g38mLRolEy1Vuns7syOzrMkeE8=;
	b=45ZsUJx3UfRb4lRjWOT9c3DSl124r1MtSlkYZNmAeAyvNs0PWD2VRwGlrGT7XGdpK0X/IR
	yePuXA9OO++l6L9NMgUiAAF+c4j2stVOhHDcIdXM/kijGd6x3MYex6wV0073NoxjBdb1JT
	m5X+i44ItQztIeISk3gWCia3IDMGPdlh0R/nqUVjdZRZH94ce7sCAAclfjuGBZdJhOpM/z
	q0hejVOJtbYg+hfjfDIvlfe+9JBJGDTGO/08ej300UPo2E60FrYUWBt7z/MpGjyHXHhhYb
	Acr8NkDqdnhvrpyF3ppPvsdWltdIZ9N6E8Cd/p9FH+h1h/kFplqukvhVsRGiVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793658148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEITTB9Xwc9DXw4H7g38mLRolEy1Vuns7syOzrMkeE8=;
	b=rjnqN/HXMfv7FwV17jwasCpq76NtaqlZe5KccwCJTb+ryJfaOk6gyOtdNzPEaRk0EBBeEL
	7sxaMmmaVqz+EBDw==
To: Petr Mladek <pmladek@suse.com>, Breno Leitao <leitao@debian.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Rio <rioo.tsukatsukii@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auhl3cdwrHt4Vw7U@pathway>
References: <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de> <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de> <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de> <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de> <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com> <auhl3cdwrHt4Vw7U@pathway>
Date: Mon, 02 Nov 2026 23:28:27 +0106
Message-ID: <87v76e3mcc.fsf@jogness.linutronix.de>
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

On 2026-11-02, Petr Mladek <pmladek@suse.com> wrote:
> I have a crazy idea and do this:
>
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1688,7 +1688,20 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	u64 stop_seq = prb_next_reserve_seq(prb);
> +
> +	__nbcon_atomic_flush_pending(stop_seq, false);
> +
> +	/*
> +	 * This is a compromise. Otherwise, NBCON consoles would never
> +	 * have a chance to show messages in the panic paths where
> +	 * the unsafe flush is not explicitely called.
> +	 */
> +	if (panic_on_this_cpu() && oops_in_progress) {
> +		panic_nbcon_allow_unsafe_takeover = true;
> +		__nbcon_atomic_flush_pending(stop_seq, true);
> +		panic_nbcon_allow_unsafe_takeover = false;
> +	}
>  }
>
> It would allow to flush the messages directly by printk().
>
> I know that it would be a step back in the reliability. But showing
> the messages looks more important to me than a reliable reboot.
> And we could make it configurable when needed.
>
> Also we could add more checks. For example, do the unsafe flush only
> when "num_online_cpus == 1" or so.

I can accept this, since legacy-netconsole had these risks anyway. My
only concern is when we add an interface for the unsafe flushing policy,
will we continue to have unsafe flushing be the default for netconsole?
I guess we would need to keep it the same to avoid regressions (just as
we need to have it on by default now).

John
