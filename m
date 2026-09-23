Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC440BCD2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150117; cv=none; b=rGfwXU27BOgrd4mL1gpgljOgoFu0hRQ6bksqgHE59Yh2bXm5W4T7MSspTr0EJ2gefG4OnjUOZCRBMazWt49GVxbwwL80hUGVsaZkAoMH7iMnjcg7erxJXccmueD7dA9UtBwXShOrIibXaYRloVoePxY6jL+qPf3StffdOOFCImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150117; c=relaxed/simple;
	bh=397Evnt4yeYgpI5tG4ikWuPZt93cefkXdHVKxfbnWL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utYoOZpzjokv+1FrhFW6CSe0MNYe5dMKzcf+CbGi6eqVLLTiba0Bt2BO9taYFYGibj7y04Ch8Q69T3Xk/C2oI44rENsJ9//zTw/hq2+hhSmW2+7dML7Mvo+S6YuLRkRIQXpMUZo5L/39I2+jBvYNZGF6J4KFZ1trethYj0aepJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ybz+iRQd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vdnVgsc+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ybz+iRQd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vdnVgsc+"
Date: Wed, 23 Sep 2026 09:55:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790150114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aleo6bYYQBkxXaI+U5b13E+g1qCodKmpJm1XNXrRnQ4=;
	b=Ybz+iRQdWvpwV8g8nzvB0ry6yYaosSbr+xjqjEhsgnWvEESQxhEzvBj5QV6yvngKIY7Nsp
	CdK6BPSPIWd7T8RzysDd3ljfvf7cOkHJ9ZEYV/XyEk7UhmEY9h6ekxVVYinljZlxhxuJYd
	yzVsn3jC6XkMvJmcfTQ8wDnkomMtxi8YBmtx514IZZS2E+fop8gmfRvnuh7ETOi+NLvrCv
	CBj6kmxYVfHBJdA2X3DJZMG0yBnXRpoJL2wkMshGcv9cucN2jULQHHSuHtBb/uJ4VmRUX9
	LousAfP5OLuQXL6eqpaTJXNdrf2ZhYVf2glkC0t4EhDlqYMApPhpV8aIn8WGlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790150114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aleo6bYYQBkxXaI+U5b13E+g1qCodKmpJm1XNXrRnQ4=;
	b=vdnVgsc+Qgc5kPcX91gBzdbSjMsUL0VFhZlh5tCTCQTW5qWjEYnPBva2tzmadM2hlU7vaX
	8GIOffR8uM7g1xDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <20260923075512.SBaoMRXt@linutronix.de>
References: <20260914143412.1sMcp89V@linutronix.de>
 <87zex9tcip.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87zex9tcip.fsf@jogness.linutronix.de>

On 2026-09-22 19:35:26 [+0200], John Ogness wrote:
> > @@ -4643,12 +4637,11 @@ static void __wake_up_klogd(int val)
> >  	 *
> >  	 * This pairs with devkmsg_read:A and syslog_print:A.
> >  	 */
> > -	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
> > -	    (val & PRINTK_PENDING_OUTPUT)) {
> > -		this_cpu_or(printk_pending, val);
> > -		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
> > -	}
> > -	preempt_enable();
> > +	if (wq_has_sleeper(&log_wait)) /* LMM(__wake_up_klogd:A) */
> > +		irq_work_queue(&pending_wakeup_work);
> > +
> > +	if (val & PRINTK_PENDING_OUTPUT)
> > +		irq_work_queue(&pending_output_work);
>=20
> The ordering of operations has been reverse queued. Perhaps because
> irq_work is LIFO (implementation internal detail) and you wanted to
> preserve the current ordering? Or maybe this ordering was chosen because
> the code looks nicer. Either way, I think it doesn't matter if the
> legacy flushing occurs before/after waking the klogd waiter.

Hmm. I did not give much thinking into the ordering because it shouldn't
matter. We used to have "unlock" followed by "wakeup" in the irq-work
callback and this is what we have now given the LIFO ordering.
Having "wakeup" first might not take effect immediately because the
scheduler delays it or puts it on the current CPU and then it is delayed
until after the interrupt ("unlock") is done. So=E2=80=A6

> Reviewed-by: John Ogness <john.ogness@linutronix.de>

Sebastian
