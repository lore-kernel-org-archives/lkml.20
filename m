Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F73D413C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029817; cv=none; b=gh8YfJdKKVwbHFj8ZzJAUTQhlN2ybrpM1LM6rYONSmwO0ODI1kAK3bzI1ndJe1yr2nbeL4runizvbf1KcgW/1JAcg7cRh2owSc7u9tKcC1WyfuVrrMpTWyyWUvQ5hLQqLhSzsy/CBDVK7P2GpVBObBpsm37wZSdYO/a4DhIEJTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029817; c=relaxed/simple;
	bh=SRKp64lnNA77dUylf7XN64gLz/cHoFfXPA1J0Sc1KA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NmNkeP9nO9ARVz/3Uoa6AgHhYzR8S/A3Tg3RjWOqcnX7Pisu/y7hb7tw6qtF1AGsSCBpIh+sFkYdFMWCtkHLKZ4pCpSJLryfZzovmNjPS3ifn+72cq6F1JIhCFacRk4Rdf80Oy2/Lsnzo5hRIJJdNiSo92RRFIW3FuwLMN8dSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LriDdKDr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kvbAzSlM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LriDdKDr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kvbAzSlM"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789029809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRKp64lnNA77dUylf7XN64gLz/cHoFfXPA1J0Sc1KA0=;
	b=LriDdKDrcYC7k/oKtbFe8PjrGbTz8K+1ND9KQkeLBSgMxwFFCPeeUsYRBTVqBrhN2aFMXZ
	HvsrR5AjWjpZpzWDP7qakP1KrI+Su4Y+rrmXeczbA1oBuU+KvZe47UnUsqJ+bH4sPlwxjF
	/Z/7l++hRgIXIgY99uQJvBrfpY20YPabqt4Vi2XLSeQJ3cmONFHhwIthyMSOeEqlQaBpP3
	EGDw97CJHxs1rZY0jHa8bXE4ViGH9DEnSf0PLDSrpz0VloFnAx1i93h+rJsCMGvC3X4vSd
	qNJ4m0PE31lPmKF+tIP+Wid4lfGHQNTRG/0HFjDl5S1xKW7LQjbZGLK2B+U6RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789029809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRKp64lnNA77dUylf7XN64gLz/cHoFfXPA1J0Sc1KA0=;
	b=kvbAzSlMuECbTwo5ZVuNwHjLZkb7duC66H9dryUK+kGp3Fo+Cx7rHLFbbJiZijjjlDimoB
	q/f6bAFzHzRPpdCw==
To: Aditya Chillara <aditya.chillara@oss.qualcomm.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, Aditya Chillara
 <aditya.chillara@oss.qualcomm.com>
Subject: Re: [PATCH v2] stop_machine: Defer legacy console flushes while a
 CPU runs a stopper callback
In-Reply-To: <20260910-defer-legacy-console-write-on-multi_cpu_stop-v2-1-88324d2f4e7f@oss.qualcomm.com>
References: <20260910-defer-legacy-console-write-on-multi_cpu_stop-v2-1-88324d2f4e7f@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:49:28 +0206
Message-ID: <87fqzhts27.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-10, Aditya Chillara <aditya.chillara@oss.qualcomm.com> wrote:
> The cpu stopper thread runs above every other scheduling class, so while a
> stopper callback executes, nothing else on that CPU is scheduled. If such a
> callback emits a normal-priority printk(), the legacy console path can
> synchronously flush the pending console backlog. On systems with a slow
> UART and a large backlog, this holds the CPU long enough to starve RT
> kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the
> CPU from advancing the state machine while the other CPUs wait. The
> resulting delay can prevent watchdog servicing long enough to trigger a
> watchdog bark or bite.
>
> The same can happen from an interrupt taken during the callback:
> multi_cpu_stop() keeps interrupts enabled during MULTI_STOP_PREPARE, and a
> printk() may be emitted from a softirq run on irq exit.
>
> Run CPU stopper callbacks in printk-deferred context to prevent legacy
> console flushes while they execute.
>
> Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

> Heavy SELinux denial logging had built up a large backlog on the
> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
> Handling it eventually led to a printk(), and because the console was a
> legacy console, that printk() synchronously drained the whole backlog
> over the slow UART.

Note that with the new nbcon consoles, this will still happen if the CPU
is in an emergency state (WARN/panic), but that is the intended
behavior.

John
