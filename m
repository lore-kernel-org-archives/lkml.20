Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25E54EEC5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083106; cv=none; b=kn7OjzRewkPP+FUaoQKIrMD91j5PzgtLS976fRYobQf5DPXMuWJutsVSyNRBXW6sLz/wEvpD4WV+uQ15CTPPC7dh5ZjcURuHlap8MCM32hYXGxOFpITRDchH5m+UBfwj4FsFN66ysMU6341ORFXxF1RjrQnA/PhFLpa7Tooq1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083106; c=relaxed/simple;
	bh=SY22YJ0vcQPmZiJP6Er9mAdvPYI0WQ/d4WQaVFbS2l0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eT3WPDaz2ZOqD5ceHnWAuunS4ADr0aJYzOOQ7XuBCw03o/OlcO2GzyQTSXXQSZh5z0jNaCgAY7BwR8QTEuszlRGjrONwRIMDfCl1/sfsIkfRKw6HNfRXSM8uHNTD6FihkD8PowXxg3+WKpWXxlfR/YWPY69cD3sbAFrYgARz8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HicJvPmV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T23jZA1c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HicJvPmV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T23jZA1c"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790083102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7na/zEgvL24eO807bvPesMqaeejJjuljgdUjJNNsbx4=;
	b=HicJvPmVbRatLaMX7/WHQG7d34s9qlCvrz9UBmBhpJBCpwoQ6pki5lR0x67t3u+Ppdjmh0
	xM+Cf5SGw1sMOL0iwUCutY3t9hW8vth21ydqra8UtYc5ECBf1eWewt/caeujaS8Fay4Qwk
	Md6r7+YNGCbU2BNU1id76l8jvaWb8avSYySsEJl+OrGz6f4o02eqVAJ488XAlUbmMcmha+
	QQF3h2hD7n+buuvssK3GDDL/dRiF8kqrq8mCzeQ0h9v7g1kbqP7hpi8AVPjYcqJbTteNX6
	3k7AamD5kAQ4Oi5j1oRUhrand+u1eS1ULOu/b2Awustv53B48+Afs1OiaciBKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790083102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7na/zEgvL24eO807bvPesMqaeejJjuljgdUjJNNsbx4=;
	b=T23jZA1c9eot3don1pV/rrrU3QoMj0Eoaflw8LoXqo4QO2DVyrouqbkOiplXXJVoPo6hsB
	lhJq4J9IqRZyrYCA==
To: Petr Mladek <pmladek@suse.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
In-Reply-To: <arJKkvOTNs2DD9ba@pathway.suse.cz>
References: <20260914143412.1sMcp89V@linutronix.de>
 <20260922070834.2kmMtN82@linutronix.de> <arJKkvOTNs2DD9ba@pathway.suse.cz>
Date: Tue, 22 Sep 2026 15:24:22 +0206
Message-ID: <8733v1v2zl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-22, Petr Mladek <pmladek@suse.com> wrote:
>> Sashiko complains here, https://sashiko.dev/#/patchset/20260914143412.1sMcp89V%40linutronix.de
>> 
>> | Does replacing the per-CPU irq_work items with global items introduce a
>> | system-wide starvation vulnerability on PREEMPT_RT?
>> | On PREEMPT_RT, IRQ_WORK_LAZY items are processed by a per-CPU irq_work thread
>> | running at a low SCHED_FIFO priority.
>> | If one CPU queues pending_wakeup_work or pending_output_work, the item is
>> | added to its local lazy_list and marked as pending. If that CPU runs a
>> | higher priority RT task for an extended period, the irq_work thread is starved.
>> | Since the irq_work structs are now global, their IRQ_WORK_PENDING flag remains
>> | set during this time. Any subsequent calls to irq_work_queue() on other CPUs
>> | will fail to queue the work and drop the wakeup requests.
>> | Could an RT workload on a single CPU starve the global printk/klogd mechanisms
>> | for the entire system, degrading the isolation provided by the previous per-CPU
>> | design?
>> 
>> while this is true, it is not limited to printk but any workload would
>> starve in such a scenario. Also, for the per-CPU variant to make a
>> difference, one would need to have a printk output on another CPU, which
>> is not busy with long running RT tasks.
>> Long term this is probably the "legacy" system as console drivers should
>> transform into nbcon interface. Here this irq-work would be reduced the
>> userland wake up while the printing would happen via the nbcon thread
>> which also has a single irq_work queue.
>> 
>> I don't see a problem with this.
>
> I agree with your explanation. I do not see this as a problem either.

I also agree with the explanation. This is not a new problem because
starvation was always possible. With nbcon we have the advantage that
if an "RT-loaded CPU" enters the emergency state, the backlog will be
flushed in atomic mode.

John
