Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C11BD9C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071013; cv=none; b=C7kobid5+lMs0HCRvDuwr5su9ol8QR63jkB9Fgqy/+5h+xeHcwuW00W/YByyCsh4+2QUhGbX2/cXNXkY0R9nR+ItKQ497/xSruHVDcTiplouVV0Vw8/5IgJ3VwgR67tN2/La2ibnCg/YgPNZwyBbCj/b5sI8vgZOqmuxf63U0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071013; c=relaxed/simple;
	bh=KPOBKOD35I/kw5qnrK8MZW9a9/HArKtRUri5ODVfi+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qYf0lpMxZcQayehskbf8hKgHn8KU6t1oh1wYPYFXUihrKHkorrmJBU2iTPUpf4gLhn7Z+nwFwKArc/P0MR4XuvfQEmJZAVKK/2nBJ4d1q0b6w0udhXWMFQtL/Csc6COKHYqTSM/NinSVl/ifJLKk2OUAuOCcVnRXLzMMr6qwQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eHiR5QW1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nkUMds42; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eHiR5QW1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nkUMds42"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792071009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KPOBKOD35I/kw5qnrK8MZW9a9/HArKtRUri5ODVfi+A=;
	b=eHiR5QW1+pw+S6T5YWHJcLz9sUc3jWWvEUhCjcWU2S8vImS4UO9OuxcF/6Xbcmw0HqYW4r
	8DqZvrQhIS53I6g/CXPxHYTW9O8dJkf1biGk+ewHJwLxUEqNhWGOlczveVeoIgbUxJ/YhW
	JxoyXahVEy1cOUzNI7Kbfofz5KgafqbubA/NgKz4nvv1mh76BjhNcci+NXFw3ToMg3ijWo
	DVaRdPi4nJ/vxfBmraKY85ZSw58UGMgkb8CDfHEfW7w29WaGRiSVvtD7CacApOUO4sS8ir
	JOMIOqlPez9kbnQDXoyi59Vzq+ElxKBlI/sE4CflLUV2jr8itW/bT6T7ObGr1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792071009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KPOBKOD35I/kw5qnrK8MZW9a9/HArKtRUri5ODVfi+A=;
	b=nkUMds423pOZx8VBO//UXEzmHI3jDhe7iIPX5N8v03Qcjftw2J5LytHOTm/qYpLpeIBZ9F
	xyKhKeqoNiQvQ7CQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Derek Barbosa <debarbos@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC printk] printk: Postpone kthread startup
In-Reply-To: <87ecdrqfhw.fsf@jogness.linutronix.de>
References: <87ecdrqfhw.fsf@jogness.linutronix.de>
Date: Thu, 15 Oct 2026 15:36:08 +0206
Message-ID: <87bj8vqefz.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-15, John Ogness <john.ogness@linutronix.de> wrote:
> There have been various bug reports related to SMP systems hanging
> on boot. The reports vary wildly but seem to have some overlap with
> regard to missed IPI's during SMP setup. The reports also show that
> reverting NBCON console usage allows the bugs to disappear.
>
> The NBCON kthreads for console printing are started very early
> during boot using early_initcall(). Since these kthreads are
> actively enabling/disabling interrupts during early boot, they may
> be interfering with SMP setup.
>
> Postpone kthread starting until after all arch initcalls have
> completed.

This should also contain:

Reported-by: Derek Barbosa <debarbos@redhat.com>
Closes: https://lore.kernel.org/linux-rt-users/arPmYPbFLf2EldIl@debarbos-thinkpadt14gen5.rmtusma.csb
Fixes: 5f1b414ca027 ("printk: nbcon: Start printing threads")
