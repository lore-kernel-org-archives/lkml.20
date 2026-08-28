Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0F3998AE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909038; cv=none; b=qDyGGakKiF8eNuhorv6BATaoIfl7/kjcee9U8gYLMJpgOtAGImKp4CfYZiz83hoNCI9F1EOCK3j+jtULeSToNnS0eNSzSv2oN1YnnoCaYnXaDrwiLoIuwP8Js2eDgukT1ej+EIRoRP06rQJ4Nq/LIRjK4ajEUh5JqKl/Rc0tVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909038; c=relaxed/simple;
	bh=322UMhFdvDDZgOWnNQ6q8zs2pAKAe/iDdvISYD7yvcg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFIYLI0t0NQ4c0uQCNekUWcZpv6U64CFhz3HOppASERxV7yUy8JWvGNIAFPgRrNlRxD1scF8DU8pvZfJd8CUJfcAnAD61ivwJszTHLWjsZ4nVtE5tu2+XfBMiI4BpNrHgvp3d+31Sjs5Wjn0bCb0iE5yqNWf8pRjs9wMpBjiPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LFK8SnRY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wku3h3oW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LFK8SnRY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wku3h3oW"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787909034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igHMLV5RXhRfwi591wsjzeqJizFkQcxicZYsAwNx/e0=;
	b=LFK8SnRYrmkLe9IluJYTBb8cG4l1MK9KdyQUcbHKEhzclJH+kgJmNno9Q5hRI/AkT0jU7c
	MFC9c690RUcNUmIacSfoOY8ozrFy3yYNygY5+CWTuom12qgMx1uIxhygwZvf4EPqabTdFz
	xAmxQUps/U+1TPzhnwV2VxKL+I8OprumpyEqbrojYiV+1GqO19iLr0HRms+ahLVxdDtz2y
	Go9nkeHNrrA1Vr+RQhQ0Obr0XGmKusLaELhzxFtskdoxc+M7fwYz8BtvnbdXmtaVi4QT9K
	hz2ZOHgu+412tdNb4VcZGeLuVCUPC9mCplHynkjXPlf8KXFzNzZuXx07ekjvWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787909034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igHMLV5RXhRfwi591wsjzeqJizFkQcxicZYsAwNx/e0=;
	b=Wku3h3oWziC/gT22u+ywnjm1PiSNMuHOriTK2cK8dP2Ut9DWNuBINZz+NxAI0PHOWT6BBk
	TAN1/DAibmNfuHDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, Jon
 Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH printk] printk/nbcon: Change nbcon_irq_work to
 IRQ_WORK_LAZY
In-Reply-To: <20260827184750.203521-1-john.ogness@linutronix.de>
References: <20260827184750.203521-1-john.ogness@linutronix.de>
Date: Fri, 28 Aug 2026 11:29:54 +0206
Message-ID: <87ld9qy4wl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-08-27, Sashiko wrote:
>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index a5921a84a80ed..ad79e30afd647 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1782,7 +1782,7 @@ bool nbcon_alloc(struct console *con)
>>  	}
>>  
>>  	rcuwait_init(&con->rcuwait);
>> -	init_irq_work(&con->irq_work, nbcon_irq_work);
>> +	con->irq_work = IRQ_WORK_INIT_LAZY(nbcon_irq_work);
>
> This is a pre-existing issue, but does missing irq_work_sync() during
> console unregistration lead to a use-after-free and lockless list corruption,
> which is heavily exacerbated by the shift to IRQ_WORK_LAZY here?
>
> In a rapid unregister/re-register cycle, overwriting con->irq_work without a
> prior sync corrupts the lockless llist if the old irq_work was still queued.
>
> When a console is unregistered (e.g., via module unload or hotplug unplug),
> nbcon_free() stops the printing kthread:
>
> kernel/printk/nbcon.c:nbcon_free() {
>     ...
>     if (printk_kthreads_running) {
>         nbcon_kthread_stop(con);
>     ...
> }
>
> However, it does not call irq_work_sync(&con->irq_work) before the driver
> frees the console structure. 
>
> Since this patch changes the initialization to IRQ_WORK_LAZY, the irq_work
> execution is deferred until the next timer tick.
>
> This massively widens the race window, guaranteeing the irq_work remains
> queued on the CPU's lazy_list while the console is being freed.
>
> The asynchronous callback then dereferences the freed console object:
>
> kernel/printk/nbcon.c:nbcon_irq_work() {
>     struct console *con = container_of(irq_work, struct console, irq_work);
>    
>     nbcon_kthread_wake(con);
> }
>
> Should nbcon_free() be updated to include irq_work_sync(&con->irq_work) to
> flush pending work before the driver is allowed to free the console memory?

Yes, this is needed. I will post a v2 series with a preceeding patch to
add the irq_work_sync().

John
