Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742271;
	b=wrJr1q7c+w63AVl0raIHDFWJp8Ur6y5J3+9fWLjeHxrG6FISlZn4tHJ6q4HeJMqBRmUM
	 5R97xnd4he+aDX/jbHEmWsM6rcxoPWGsP/JEvsEm3cvLfdciKvoyds1qdD9e6MhTCnQ2S
	 h5V+28kc4ir56AcxWDE1vlhK8hg7E+QlLZRqtLMgZEqgfWoaiI8UCTTkHTs93Lz9kNlaP
	 nYcGAWbR0h4te9Z8D72cpX3pOf6nQs1lFBSwMqB/V4eP8fKFlbgnlbPjSjmfyvybApRyr
	 KdsB1LJwYMcE9WmzaRiBTl/nUd52RTlPmCwLp/k5lHTQyrhsJfe6mCEc2ohnotqp/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742271;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=H9K8UQaTm6FUmdZW3dAU9Cxo8vXO4GP30YDB2LDAWrc=;
	b=C6pt1vfwAqnS9+xXyCbMRCOnwL+Smo+5Ny0/UKq3o+F3t7wYiQSuhZlehwoJ4T7FJLMO
	 xtUHICXXzDrt4gAOaqyjoh5J1JtrOkScLWZ+0u28ozpREIL1tKExe4hYhiQb38MjnLvnZ
	 ok693vd0nIbuDW1nP/roFbgObicWTC8ixzlP8G3x0wLUjM0U2R1I/nX8JW+gDGhph2Tf4
	 9FV0PQQ5qB75DcfDiT+vXrTGm21XzmUCcMjofwr5R6NXYK6Wdfiok+quoghVbiQ1QylW0
	 tAhIgmt3zXK5vq+s8M/AzzpCAmkzgti17LiWB5syARgWYa1nDkbFX/YR5BIcSvWD1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x8C9fRrC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=35zw8GXt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2357606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2357606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x8C9fRrC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=35zw8GXt
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792742268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H9K8UQaTm6FUmdZW3dAU9Cxo8vXO4GP30YDB2LDAWrc=;
	b=x8C9fRrCT2qGN2nFt18RVpBfHFjri0ztkAGGDbG+1f8FIs4ajcKEejTth9cqRD6fEwqPTG
	+2sI0JAFhtRQ24Dg7xYbhZD1sP+KFYRIbfOMtxyV999EcXV9s0zW0Pf9798pykqfdh0FHu
	drQafy1QX3rbLVHN2buf0DxSticQDlrmruULVvJHwP/OG0F+TNRUGfqoGRtzg07ywJsV83
	oj7/VwFsmC7aZ2mHlM/ZoJJMoJ7hEM+Dj2KYvBtBOQwYPUDau2hxS7cXfQiHdllh9u5KeS
	+ojK4sH33buVhzwRVG1R6oA0dsiLHzC3FUYGTnMX8eZdyTwJSHCacgywew15Ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792742268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H9K8UQaTm6FUmdZW3dAU9Cxo8vXO4GP30YDB2LDAWrc=;
	b=35zw8GXtPgbByQzMsBxinQmVOgGMHoG0jFqu59cWFfHJE3j18pxC+7BUSdOyApV1w1j1Qr
	wdEe84MzmipOLsCg==
To: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <aqqU3I7d9lMAjSvy@pathway.suse.cz>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
Date: Fri, 23 Oct 2026 10:03:47 +0206
Message-ID: <87bj8kkfwk.fsf@jogness.linutronix.de>
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

Sorry for the late response... this fell through the cracks. Response
below...

On 2026-09-16, Petr Mladek <pmladek@suse.com> wrote:
>> In older kernels (v6.19 and earlier) netconsole is able to print these
>> panic logs while the system is configured to reboot on panic. So from a
>> user perspective this is a regression caused by commit 7eab73b18630
>> ("netconsole: convert to NBCON console infrastructure").
>> 
>> We have automated test systems without BMC access, which rely on these
>> two features working together.
>
> I see. To be precise, I would say that the primary culprit is the
> commit 187de7c212e5fa87 ("printk: nbcon: Allow unsafe write_atomic()
> for panic"). It adds support for consoles which will be flushed
> in panic() only by nbcon_atomic_flush_unsafe().
>
> It is a big difference because printk() tries to flush both
> legacy and "safe" NBCON consoles directly in panic(). In addition,
> they are explicitely flushed by console_flush_on_panic().
>
> console_flush_on_panic() is called more times in panic().
> And it tries to flush legacy consoles the unsafe way even
> before emergency_restart().
>
> OK, we should close this gap. But I suggest another solution.
>
> We already have the following functions for flushing NBCON
> consoles using write_atomic()
>
>
>   + nbcon_atomic_flush_pending() - flush CON_NBCON consoles
> 	using con->write_atomic() but only when safe
>
>   + nbcon_atomic_flush_unsafe() - flush CON_NBCON consoles
> 	using con->write_atomic() and allow unsafe takeover.
>
> I suggest to add 3rd variant, for example:
>
>   + nbcon_atomic_unsafe_flush_unsafe() - flush
> 	CON_NBCON_ATOMIC_UNSAFE consoles with con->write_atomic()
> 	and allow unsafe takeover.

nbcon_atomic_flush_unsafe() already includes CON_NBCON_ATOMIC_UNSAFE.

> And I would call this 3rd variant in console_flush_on_panic(),
> something like:
>
> void console_flush_on_panic(enum con_flush_mode mode)
> {
> [...]
> 	printk_get_console_flush_type(&ft);
> 	if (ft.nbcon_atomic) {
> 		nbcon_atomic_flush_pending();
> 		nbcon_atomic_unsafe_flush_unsafe();

s/nbcon_atomic_unsafe_flush_unsafe/nbcon_atomic_flush_unsafe/

console_flush_on_panic() is used in multiple places and depending on the
user, it may be too risky. Yes, if there are legacy consoles the user is
already taking this risk. But with nbcon we would like to excercise some
risk management.

> If there there are people really concerned about the reboot
> reliability then we might need to make it configurable, e.g.
> by adding reliable_panic command line option which would skip
> the unsafe flush before reboot.

Yes. When originally developing the nbcon, tglx and I talked about many
more details related to this topic. For example, the ability to order
the unsafe flushing. That is one of the reasons that nbcon flushes the
full backlog for each console, rather than each console only flushing a
single record.

If we are going to expose an interface to configure if unsafe flushing
should occur, then we should also consider ordering. Even if we do not
want to build in the ordering support right now, the interface should be
such that it can be easily extended to support this.

*** WARNING: Now we get into my brainstorming, which could be rough. ***

Rather than a big hammer option, I see this more as a per-console
configuration (similar to how we want to go with the console loglevels).

Netconsole is a bit tricky, because it has its own format separate from
console. This would need to be addressed for the per-console loglevels
as well. Maybe it should be extended to something like:

netconsole=[+][r][src-port]@[src-ip]/[<dev>],[tgt-port]@<tgt-ip>/[tgt-macaddr][,options]

Which would allow things like:

netconsole=@/,@10.10.0.2/,loglevel:3,unsafe_panic:1

This would also allow to specify that consoles should _not_
perform unsafe flushing:

console=ttyS0,115200,unsafe_panic:0

And it could be used for ordering, flusing from highest value to lowest:

netconsole=@/,@10.10.0.2/,unsafe_panic:2 console=ttyS0,115200,unsafe_panic:12

(First ttyS0 is unsafe-flushed, then the netconsole is unsafe-flushed.)

For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
unsafe_panic:0. Otherwise the default would be unsafe_panic:1.

Unfortunately the above idea does not consider the reboot vs. busy-loop
paths. I could imagine there are those that only want a different
ordering/disabling for paths where the kernel will continue to be useful
(for example, a reboot). I think that makes sense. But I am not really
sure how that distinction should be made. We don't want to configure
ourselves to death. Maybe that distinction is not relevant.

John
