Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A34A8A3C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060919; cv=none; b=hEJw1gKZ+wfp3cXaBdQ86oH+Alag+n42zWj/qWdEzynTk1jfWaTJbB6f1tg9cWd3XqJ5XnsxZVKynDmvo1tFn3C2uhGBW+EknIVKb2pzRjiPuGxLJ4OTLFxFWjZy6/oihW2hA9nCfUXVHU8lW2MHkz4odINleQqNzutSf1RMhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060919; c=relaxed/simple;
	bh=4ej9mjfd2xHfvTq7TUIBejWb6tQf1Rk6n5AnfJN5ohY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WokNdowBtsB8DT7tJe7P13SXO4cO3Fd3YcvTlFLfee8MVr3+D0CS/ehsS9BaokjKayIs1IrMId/Duabvr1lq9TxRpHCiFy/vLXtxzWywJsjGvhKU7thXLBPRQo5KlZYOz9JF6ozKDmqEMmnn3qnQttxKPgb2rd12ZWVkf2QkegA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MEGKLQjc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DUHZ+s/3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MEGKLQjc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DUHZ+s/3"
Date: Tue, 22 Sep 2026 09:08:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790060916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ej9mjfd2xHfvTq7TUIBejWb6tQf1Rk6n5AnfJN5ohY=;
	b=MEGKLQjcOmHKo0GHBnY7UmKjwzbLCdwbZR/zv7nM5Eu63lCyLjevK7c59NYUbeh2eV03fo
	fZpp+UdftajlRe90U3fu79BkX7gi0C5LifyJ6a9vqzE6afhkfh0Z0PQRGKSbmBtYEdktgo
	4Wr46mL/Vc+bEcl0tAFW7WQnwneK/xwNjeWOx1w79udjqg4ZmwoPQdzVu36c4ATWkHebaL
	jYX6qSJK588m6jihwLlinBFBOofpykNgCGDFWQJG+xw40t/B5TuFHboF+Rxen4k4IXspGE
	eF1eubncJFHDH2wEnALWRoAvkbUwvCCjDd7uz650qqmZrBC5XXmffNBePkw+Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790060916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ej9mjfd2xHfvTq7TUIBejWb6tQf1Rk6n5AnfJN5ohY=;
	b=DUHZ+s/38rFCXRo+tmW4blIRFl3P9UdBML5Ljrv31k1dhzz5zXAK/XuW8aok8CJ9K6J9qs
	Q4TjWqRZyvm0blBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <20260922070834.2kmMtN82@linutronix.de>
References: <20260914143412.1sMcp89V@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914143412.1sMcp89V@linutronix.de>

On 2026-09-14 16:34:12 [+0200], To linux-kernel@vger.kernel.org wrote:
> In commit b845b517b5e37 ("printk: robustify printk") initially got its
> delayed wake up which is today implemented via the irq_work. Back then
> it was a variable which was assigned to 1 if a pending wake up was
> waiting. This variable was checked on each timer tick. Therefore it
> makes sense to assign a per-CPU variable with this task to avoid cache
> line bouncing when each CPU reads the variable on each timer tick
> simultaneously.

Sashiko complains here, https://sashiko.dev/#/patchset/20260914143412.1sMcp89V%40linutronix.de

| Does replacing the per-CPU irq_work items with global items introduce a
| system-wide starvation vulnerability on PREEMPT_RT?
| On PREEMPT_RT, IRQ_WORK_LAZY items are processed by a per-CPU irq_work thread
| running at a low SCHED_FIFO priority.
| If one CPU queues pending_wakeup_work or pending_output_work, the item is
| added to its local lazy_list and marked as pending. If that CPU runs a
| higher priority RT task for an extended period, the irq_work thread is starved.
| Since the irq_work structs are now global, their IRQ_WORK_PENDING flag remains
| set during this time. Any subsequent calls to irq_work_queue() on other CPUs
| will fail to queue the work and drop the wakeup requests.
| Could an RT workload on a single CPU starve the global printk/klogd mechanisms
| for the entire system, degrading the isolation provided by the previous per-CPU
| design?

while this is true, it is not limited to printk but any workload would
starve in such a scenario. Also, for the per-CPU variant to make a
difference, one would need to have a printk output on another CPU, which
is not busy with long running RT tasks.
Long term this is probably the "legacy" system as console drivers should
transform into nbcon interface. Here this irq-work would be reduced the
userland wake up while the printing would happen via the nbcon thread
which also has a single irq_work queue.

I don't see a problem with this.

Sebastian
