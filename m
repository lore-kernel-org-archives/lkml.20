Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB552480DEF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058771; cv=none; b=Dob54uhTxxzv+OzGi2fbJ6/OWymu/cfU5v3u88u782c/X26CQ9wRwfSmU5skOQwdTr7YMx9qmclSUw3/P1Z0reYX0ooAB7sd4Ui4K8J4xgLcnjEGERFx3oMGWihsezZtoqvoiCF5BL/uuhZCN0W1Q543pa9aIv9X92k8hCQc9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058771; c=relaxed/simple;
	bh=z7ps7vxL3c5ALq8rghQiOmj0SsDKKZQCGg/eQ/BflLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOnpZzYs9wiF1XmFlqNwzpsD9mEuXLAXQ/EIlqu/uFUmmXxgfjM1JzNs+6FzhiqLFE6/HTJCXZDBuev1D0O1+01w6HlUoKOh4SDtlgiHf2C2HzIGrDROaBaAKW5ZFPbokzIgZQDv70mh1FcaRCZFXCXkFQmjYS1ZGvtICu8ItQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NCSaIbK8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N7Mq5HL1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NCSaIbK8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N7Mq5HL1"
Date: Tue, 22 Sep 2026 08:32:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790058766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+xGQWrj4gneiT1aUgakAvd1JMhnqRzA4YYSoDpjn28=;
	b=NCSaIbK8CNNpesvyO4rRapdWceLef+jbgHVQQCdJO4ga05yfpOkHpEnv73nNqjfxvmfb3S
	BKQ+AwSlznZuPWMnnDl30YbIXg9iw+bSCr933s29dLHPAtcQbICWzQFcy2rquVBNf6P2sg
	GO/234i3rcUS6ffqb6IwaiRWMRVbq43lGlz0x9TOqm72fMgSHTVltYhMlBP9oX6hkX5s+l
	ed9F/7elGMVk6pg4qZg18ibNIZMoKXSQcOaV4verjf8oAZzMfEhSi2lattACABgzDPfO/c
	XcZAZwctBnTTAJZpyhXfaHjExXVEbintYUraoQDRtHhmc5T1uSyVxi1rAMhXsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790058766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+xGQWrj4gneiT1aUgakAvd1JMhnqRzA4YYSoDpjn28=;
	b=N7Mq5HL19S/wVP10aX0hyh9h5B6n7H45iKzQpF66XzT5eAJwOSbO14c2KFCUT3b7+RTVsg
	6lafFrt1BohbLeCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] printk: Remove preempt_disable() from __wake_up_klogd()
Message-ID: <20260922063244.xMLkbYgo@linutronix.de>
References: <20260911105126.aPCuP2jV@linutronix.de>
 <20260911105800.3PL182jo@linutronix.de>
 <87v77yh7pz.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v77yh7pz.fsf@jogness.linutronix.de>

On 2026-09-21 18:53:36 [+0206], John Ogness wrote:
> Hi Sebastian,
Hi John,

> I am responding for completeness...
> 
> On 2026-09-11, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> > didn't we want to rip out console_irqwork_blocked()?
> 
> As I mention in a previous email [0], it provides other significant
> benefits. So we do not want to rip it out, but at some point we should
> rename it for its "true" purpose.

Then please do so. Right now it looks like a workaround for tegra20
which has been replaced with the lazy-irq-work workaround.

> John

Sebastian
