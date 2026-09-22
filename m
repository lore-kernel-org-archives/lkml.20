Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54F4D4898
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098531; cv=none; b=appEjGgWx3OpXobT+7EU941jb+fsVqCY5ov+jCYJ6SZtQH9mG6V6CBM6CtT7iEd+jWub1KUwQK+IX1sKPddB5zYJxP4KEiWbraZZhE9WiseTrtvDF7104+ZV2OJHy+ZmIYdkrEu0iGoPgSD3PMYYr4mWlHwdjUi8Xt4Utiykhl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098531; c=relaxed/simple;
	bh=aJ9dXLN16ilzCTWiwZeAXyd9HWRwS+Tv8L0rxfjmSmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SBmb6kAKyW94HRQ2Yf6oqZLXFLJv48n9wzkuOGzGjkwCWyJGD55N70igYIjTRITaXPakLRaPQCl+o5dlmXthMItIb3zmfGOMo0Rc5L56q8i2FsfFZlvsuS3+R2ihN/4UbA9TnjB4BfHkv8qtOCTRpUAEse+TEKgR0E0dgRaQYMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cJ8ceG1h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HZGy4fW3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cJ8ceG1h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HZGy4fW3"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790098527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WFuOeCl5vZioLXWwayNMzdmgaR64Wl27RUHg7ijOKs=;
	b=cJ8ceG1hsOTKm+W3sVV75avwz/H6f4xQ6rr/GJYzDiGleLZuJuHyYNn3fGwYnmYducehAd
	qbYm0xWwQYmP24bUPXE9Id4Yk0fGe1iE84p124pSvLm3V7eh4jaRAkVePL+ec/sO7OyQg8
	7fWmWOg95ysy8GjgOm1XXBpKgRO9XNKFk+zL1eNbfa2sB8B2T2Tib6jHsmOcgi79RGAhQv
	9H84OzOlm3iFyPkggUJQ7cs4+adPkJyAJ8KtiAHnpUdFi1vBe4ZOMx75fo8fBarV6poA6F
	R6zKaY14mdEAV5lPD3PSUGLLgBfEk3Ggf/6IjZdB8GSYp6XDxB94OuQwsJStLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790098527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WFuOeCl5vZioLXWwayNMzdmgaR64Wl27RUHg7ijOKs=;
	b=HZGy4fW39tlcQu7V90KoelNdn+z+Itj9Bl6fiJFu8CGdkMEQR/DJ/hWK8nxbqwuwwA/4tW
	QUnmxLEnzC4hH4Cg==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
In-Reply-To: <20260914143412.1sMcp89V@linutronix.de>
References: <20260914143412.1sMcp89V@linutronix.de>
Date: Tue, 22 Sep 2026 19:35:26 +0200
Message-ID: <87zex9tcip.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-14, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 6d3d18a50da74..d5cfd56f1a001 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4593,31 +4593,26 @@ bool pr_flush(int timeout_ms, bool reset_on_progress)
>  /*
>   * Delayed printk version, for scheduler-internal messages:
>   */
> -#define PRINTK_PENDING_WAKEUP	0x01
> -#define PRINTK_PENDING_OUTPUT	0x02
> +#define PRINTK_PENDING_OUTPUT	0x01
>  
> -static DEFINE_PER_CPU(int, printk_pending);
> -
> -static void wake_up_klogd_work_func(struct irq_work *irq_work)
> +static void pending_wake_fn(struct irq_work *irq_work)
>  {
> -	int pending = this_cpu_xchg(printk_pending, 0);
> -
> -	if (pending & PRINTK_PENDING_OUTPUT) {
> -		if (force_legacy_kthread()) {
> -			if (printk_legacy_kthread)
> -				wake_up_interruptible(&legacy_wait);
> -		} else {
> -			if (console_trylock())
> -				console_unlock();
> -		}
> -	}
> -
> -	if (pending & PRINTK_PENDING_WAKEUP)
> -		wake_up_interruptible(&log_wait);
> +	wake_up_interruptible(&log_wait);
>  }
>  
> -static DEFINE_PER_CPU(struct irq_work, wake_up_klogd_work) =
> -	IRQ_WORK_INIT_LAZY(wake_up_klogd_work_func);
> +static void pending_output_fn(struct irq_work *irq_work)
> +{
> +	if (force_legacy_kthread()) {
> +		if (printk_legacy_kthread)
> +			wake_up_interruptible(&legacy_wait);
> +	} else {
> +		if (console_trylock())
> +			console_unlock();
> +	}
> +}
> +
> +static struct irq_work pending_wakeup_work = IRQ_WORK_INIT_LAZY(pending_wake_fn);
> +static struct irq_work pending_output_work = IRQ_WORK_INIT_LAZY(pending_output_fn);
>  
>  static void __wake_up_klogd(int val)
>  {
> @@ -4631,7 +4626,6 @@ static void __wake_up_klogd(int val)
>  	if (WARN_ON_ONCE(console_irqwork_blocked))
>  		return;
>  
> -	preempt_disable();
>  	/*
>  	 * Guarantee any new records can be seen by tasks preparing to wait
>  	 * before this context checks if the wait queue is empty.
> @@ -4643,12 +4637,11 @@ static void __wake_up_klogd(int val)
>  	 *
>  	 * This pairs with devkmsg_read:A and syslog_print:A.
>  	 */
> -	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
> -	    (val & PRINTK_PENDING_OUTPUT)) {
> -		this_cpu_or(printk_pending, val);
> -		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
> -	}
> -	preempt_enable();
> +	if (wq_has_sleeper(&log_wait)) /* LMM(__wake_up_klogd:A) */
> +		irq_work_queue(&pending_wakeup_work);
> +
> +	if (val & PRINTK_PENDING_OUTPUT)
> +		irq_work_queue(&pending_output_work);

The ordering of operations has been reverse queued. Perhaps because
irq_work is LIFO (implementation internal detail) and you wanted to
preserve the current ordering? Or maybe this ordering was chosen because
the code looks nicer. Either way, I think it doesn't matter if the
legacy flushing occurs before/after waking the klogd waiter.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
