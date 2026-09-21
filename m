Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D424A5C3E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009260; cv=none; b=iUWYG92ovIwiQj4Pm7k0jPhTzPOkscPWnob5xYjy8Kh3HlsML3x+/GG5cmPGadO8LhijOvwu+IFXJCfW8y0JbPb+DXSh7Z9xlZKQ2nWYdwNPaTAgryxnyP8MhWcJ8bs/gMaJyUlZmiDApSOhu4rcaSHvT+XQ1D0MVeIN1k8Nwgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009260; c=relaxed/simple;
	bh=2KH79UjqexNGJUxukoAHS5kO/NMwFgWuuhRVOOuSzv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lMsZNbrOIhgJylm2GBd34Q6szgi6f0wqgdfffxCg7+cVZTneV7qWi9CRcOQspGqKRYzOuJxpX8zfaEKQ2mPR36gfbw065zsVFWbZj67ogV6m3+EgiyKptoE6+K5QTnl/JMX0ok7kmsh4sroVlMrLUEXqPUz3ammNeJV+OYbJkyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eEW/oqav; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=meDcsSvj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eEW/oqav";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="meDcsSvj"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790009256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KH79UjqexNGJUxukoAHS5kO/NMwFgWuuhRVOOuSzv0=;
	b=eEW/oqavHpbBYuVA8ljS/ONKN+mCyUmZo/6tCoTRLhXDDBK/I5n5VSA6AgxW7qoKpbephW
	XVRMolcdtGyvUJU6PG69RT1qMPYKnaE5AVWLaitNxhF8ip4pD8vgCV0d++aIhauQsekBy+
	rLuQwufNzsgBt2RSPaP3bAtAORdlNuE7dfBERhZCLAchh3A5ZN7zBdtsekOuZUoKiQKGdj
	ey/xDktNDtz38nYyIfyXN6GmQaRey3AP3s1nFduXIY/K+cvO3Jryl33Dp5nnL3ERnmYmYx
	ICfI9K82zgEuwL54xu8wnlzwcmOlV6b3qQdNRipJTzyTXxOgUf2ZydG2LIsXiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790009256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2KH79UjqexNGJUxukoAHS5kO/NMwFgWuuhRVOOuSzv0=;
	b=meDcsSvjuhVaIMjpANYtE8Ob0eWnIz+xLeo5jbXliiM9Ez5s1akkFKwa0EH6/L013JDrHG
	addkC/EVvdDDo/BA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] printk: Remove preempt_disable() from __wake_up_klogd()
In-Reply-To: <20260911105800.3PL182jo@linutronix.de>
References: <20260911105126.aPCuP2jV@linutronix.de>
 <20260911105800.3PL182jo@linutronix.de>
Date: Mon, 21 Sep 2026 18:53:36 +0206
Message-ID: <87v77yh7pz.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sebastian,

I am responding for completeness...

On 2026-09-11, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> didn't we want to rip out console_irqwork_blocked()?

As I mention in a previous email [0], it provides other significant
benefits. So we do not want to rip it out, but at some point we should
rename it for its "true" purpose.

John

[0] https://lore.kernel.org/lkml/87wltbo97m.fsf@jogness.linutronix.de
