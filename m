Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791089;
	b=5RivhpCbh+MNGgdfBDS8uklsUK3AKjkd51ZTl2AwOFX8Tfh5Zc6ySpAJfT0wLkmwUnNV
	 lMQ35fNheMsVHCsi5m6VAQdqPamNoxqU2HMwJmEYGDIZGZk6lQJS619hVJqTqie0WMufu
	 a5B3VY61Pdbgx95qldSzRWc+ZWYKVDpS26eYHzEyH9qvB7W/AwRop0xeHQ03mOnJhikYG
	 hb32fYEJBbHgX4Z7Wq0ZnH5tWqKiniSDn+CPa2w+pdJebuVWYfU6TQMt6PQ9Z1Yq5U3br
	 fALcAah/8L4TI5i4cumX0HjGyav+tYDWILZJb3EeQxv4FykGXWFVNGNhwHBfXknpvLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791089;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=GdB7ha5Ol2+3aKUubt/pFeZzYzcYVHiZJwAFxYp54n8=;
	b=f91+EEawKkquZJo8Q4cZ9c+/Wa6S40w/Lp+32blFURDDSRg9NF0YFxbRCIQZnHavuxyZ
	 iemG6OHMUiq2mYTgXag260IULtFovrMnUULjLshO2+zb5eyEIKwC0krlN3T2nCYeJvlAf
	 Y0APKWtnyXl1k9kPbVIsHZZlWA5PRPTo6n3uXnGDoveW63oK1XTEECgRRhP4YO1GR/6qn
	 uw7O7282xKxF8e+capf9e3eIyFlHnp9Gj0ubrirjkXMN+HWB2UZY92GAyyTaDoonZuCSZ
	 lbP6LEnZic7ZJKckpLSj0zl0JDK+XaE6G66m9yx6uvftve4ScSWlMjeoZofQKSgq9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ibYY93iM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sXvLBb84;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCB606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BCB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ibYY93iM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sXvLBb84
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793791087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GdB7ha5Ol2+3aKUubt/pFeZzYzcYVHiZJwAFxYp54n8=;
	b=ibYY93iM4SbXwrtT+ddFtYH96VvRqkUQArUocFFNv/3wf31G6Xurw+ZJ0CGPUcAlsNWxso
	lJ3bixRKDi0vNl5XmCTXfzzVSDUnqmoBMJ2uzoMpsf3WvbuOj2OKGQd9vKWhDoKuJPnF9w
	GU1XiUECRlLspCSCA5eEJUIeeK3ruhD8E92vUehjswPFP0pg7dDGphIxUZ6KIj2b2ZVO/Y
	Y6xvff5xSJMCwl83upXX2KtOyyZAszEyqo5IT9ro9d1aA4s6Fot05HK0TuhfRou1IoJScL
	Yl8sUrwxbBb9T4Ijavgp0onnSV+j0IdocNGYvfzZEPEcNLhXLN9+TfEBNvC6xA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793791087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GdB7ha5Ol2+3aKUubt/pFeZzYzcYVHiZJwAFxYp54n8=;
	b=sXvLBb84vY/yAyExJBmKLKrdCSBRxnWhsELMzgABF78WY5zJIR2GKd6XpQ8VMVOTpXJB/i
	7NG1WSy1NYsXEgBQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auniMWhvteH8C3E0@pathway.suse.cz>
References: <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de> <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de> <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de> <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com> <auhl3cdwrHt4Vw7U@pathway>
 <87v76e3mcc.fsf@jogness.linutronix.de> <auniMWhvteH8C3E0@pathway.suse.cz>
Date: Wed, 04 Nov 2026 12:24:06 +0106
Message-ID: <8733tgc0b5.fsf@jogness.linutronix.de>
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

On 2026-11-03, Petr Mladek <pmladek@suse.com> wrote:
>> I can accept this, since legacy-netconsole had these risks anyway. My
>> only concern is when we add an interface for the unsafe flushing policy,
>> will we continue to have unsafe flushing be the default for netconsole?
>> I guess we would need to keep it the same to avoid regressions (just as
>> we need to have it on by default now).
>
> Good point. I think that this basically goes down to the question
> whether we would later introduce an option:
>
>    --panic-focus-on-debug   or   --panic-focus-on-reboot
>
> The current state is somewhere in the middle. I would say
> that:
>
>   + the legacy consoles are more focusing on the debugging side
>     because bust_spinlocks() is called early. And
>     console_flush_on_panic() is called before emergency_restart().
>
>   + the nbcon console are more focusing on safe reboot because
>     nbcon_atomic_flush_unsafe() is called only when followed
>     by an infinite diod blinking.

Note that this difference between legacy and nbcon was one of the
primary design goals for nbcon. It is not chance that we are avoiding
"hope and pray mode".

> It looked like the nbcon handling was good enough before
> we added netconsole with an unsafe write_atomic. And maybe
> even before converting the widely used uart 8250 serial
> console driver.
>
> People started complaining about missing messages with
> the converted netconsole and uart 8250 drivers. The current
> nbcon handling looks like a regression to these people.

Please let's not throw everything into the same pot. The reported
missing 8250 messages are real regressions due to missing flushes. These
must be fixed.

The netconsole issue is separate. Unlike 8250, the netconsole does not
provide a safe variant. This is also a regression, but for different
reasons.

And maybe users want safe drivers (such as 8250) to enter "hope and pray
mode" on kernel ending sites, which is something even legacy consoles
could not always do.

> My take would be to modify the nbcon handling to be more
> like the legacy one and focus more on debugging. If anyone
> gets concerned by the reboot reliability then we
> could add the --panic-focus-on-reboot and make
> the reboot more safe in this case.

I prefer we do not hard-code policies. It would be trivial to add a
policy field and flags to the console struct. We could allow drivers to
declare their own diverging defaults if they want. When we are touching
all these flush sites, let us add code guided by policy instead of
hard-coding policy.

And _later_, once we have /sys/class/consoles, it becomes trivial to
expose these policies to userspace for reading/modifying.

John
