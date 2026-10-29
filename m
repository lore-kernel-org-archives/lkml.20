Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265628;
	b=yF+ou6SvWMYCeGFZ1jZQIiZBqP9BFohuCSetYKqEySM3EgQgo95XMnTGbrQnvxdzOfUv
	 db619e/vpATEL2hUpgy5OgOjDm/lnt5OhGNSib+2DH2Stj6PEAnqqxWDeDZobLvh2Qs0V
	 SjAMBYoOJY+JFw/aEnBq+Hukg9J9UHkmLUJ/hSDR7momm1ubkH9YaH04hVC4Fs1L9FO3i
	 aG+AfU8emklwYqLAx75RTnVDZqSXAHVOElthKjFidYa+tbDK6gKm+vhZrlzD12FOO31yo
	 66l7IsXbv6sr/qk8Rs55Wk63B6giCUiH7K+da2OFFHrNC6wgBmX3tQVkBA66BTg+HFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265628;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=vy9Ek7b5WYtFv/bk6UVnuWV+fsadjHv/K2xNQh+jTng=;
	b=I6QXDSfkSEKeDPaHZ4RKa4sQDtPkyNCzSPGV3c9oGK8QsFXyFiJXcCaxGflGFbGDBchf
	 U2LUgBjLnyMmYqE2r+ok+G+ac29kC+StTB9i8kOOanHFw2gao5S10mXSLGDe0ggxJrYUn
	 BcUzaTS2KY/phTcK6nTiCoRPhcOy8wUKz+i8xIChwGuOqRA0J/RRz3HKr4mbd0ZTQxmFR
	 VwJSQcCNHtmKFfdnxiAp5fmKpcOeo77wOWRMBNpPfmUPhIVAZcX9nGDeA4MvzF5D4brcl
	 q0UOlKYIzn7AEVQWJrPISJ5LVCfQpg7r62zZNEzMMHu3ldYHd7KtR44ZoeYuBtssinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gt8sKQcv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="ysVJ/71r";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gt8sKQcv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ysVJ/71r
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793265624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vy9Ek7b5WYtFv/bk6UVnuWV+fsadjHv/K2xNQh+jTng=;
	b=Gt8sKQcvjn/FjKek/fZRsQOxfxFzW6XVjmn35URphMg6yf9yS4gQRIC+dhBD5uz39npDEe
	wyNyDmY50u8x7t/kUuo01jC6RCB6wDSp519EoB8m+dvEa4Vuwxrb4kyzayzyT4Yr47VZQ4
	TgNzh0QlK38IbIL598OS9LcL7U3TDgh3aBG13XfpHMY5vs//Vr5qHtGJa6rvGXj9ClchHK
	fwhXcvk9ZTsFQ9QN4Ogoo2cNW4zDIAWeFir0gsmjibAf7B44m3ndpSgOV7QzUimcyDNXYl
	Gd8ivqp3vBsWAo6akilYn+ciE4OtxUw+QOLx/KTArhPHXBDnBEW5CtiGh4raIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793265624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vy9Ek7b5WYtFv/bk6UVnuWV+fsadjHv/K2xNQh+jTng=;
	b=ysVJ/71rjUX6WMPymRjMi+EZh4GX6M3gRjpQpHTbFMyNjDzroYt5zPocI3t5wxRpT8FLAG
	iQqTvyGLnS2dnGBA==
To: Breno Leitao <leitao@debian.org>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auI40MZlSYO0oAAS@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz> <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com> <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
Date: Thu, 29 Oct 2026 10:26:23 +0106
Message-ID: <87a4nwyiaw.fsf@jogness.linutronix.de>
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

On 2026-10-28, Breno Leitao <leitao@debian.org> wrote:
>>>> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
>>>> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.
>>>
>>> How do you plan to use 'unsafe_panic' order exactly?
>> 
>> Currently at the end of panic() an unsafe flush occurs by simply
>> iterating through the list of consoles. That list ordering does have a
>> fixed algorithm behind it, but it is quite hard to follow.
>
> But is that flush invoked at all on the kdump/kexec path?
>
> As far as I can see, nbcon_atomic_flush_unsafe() has a single caller,
> at the very end of vpanic(). So the unsafe consoles are only flushed in
> one specific "kernel ending" case: panic() with panic_timeout=0 and no
> crash kernel loaded.
>
> I think we are mixing two different topics here:
>
>    1) How to set the order of the unsafe flush (per console, from the
>       cmdline and/or sysfs).
>
>    2) A hook at the "kernel ending" sites (the panic reboot path,
>       __crash_kexec(), ...), so we do not forget to flush the unsafe
>       consoles there.
>
> Should we split them? 
>
> The missing hook in 2) is what drops the netconsole panic output today,
> while 1) is policy on top of it.

They are separate but related. We need to address the missing hooks. But
we cannot simply add unsafe flushing to those hooks. We need to allow
policy for that.

First we need to make sure all "kernel ending" points are doing proper
atomic (safe!) flushing. Ideally these are either graceful endings, so
the kthreads are properly shutdown and printk naturally transitions to
atomic printing. Or they are emergency situations and printk must
forcefully transition to atomic printing. (Netconsole does not yet
benefit from this, but we need to be sure that safe consoles are
covered.)

Then we need to add an interface to allow the user to specify policy for
the points to determine unsafe flushing. I would request that the
interface is such that we can extend it to allow ordering of that unsafe
flushing.

Note that the interface may involve some significant rework on how
netconsoles are managed.

This all needs to be coordinated with other things already in the queue
due to the overlap in code and features:

- preferred console cleanup/refactor [0]

- CON_ENABLE cleanup [1]

- introduction of per-console loglevels [2]

- per-console replaying [3]

I am not suggesting that all these things must come first, but we need
to keep an eye on the big picture rather than hacking in some quick
workarounds for netconsole.

John

[0] https://lore.kernel.org/lkml/20260929120546.328616-1-pmladek@suse.com
[1] https://lore.kernel.org/lkml/20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com
[2] https://lore.kernel.org/lkml/cover.1764272407.git.chris@chrisdown.name
[3] https://lore.kernel.org/lkml/20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com
