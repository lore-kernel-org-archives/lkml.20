Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F33E8C74
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170659; cv=none; b=I6pEVUB5cbfzWCFKw7hHm7cxA3kUym25yWSDoRKLHwwsezIf9Uf3/binWeeQMgAnOkmBWJ7zHnoF6KwbxADNvcB9HgkC4gc1FRmDz2NV+I0M0FEZAh3uYGIcF/K69J4eMsA7Xu3eryq77hVwLlWY0s2yiPzzCk+JwFpqhF9gm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170659; c=relaxed/simple;
	bh=pB/yhQAIvwPCcGshpVqZwoCOt73inVedOwPpehLLcos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ncn+DcqEyOca6s5NyLY5zlffIelHAgH5HQdWzwzxB8qwe2C9yMIQeBchxgZ2odeSk7BI/fPXWF8d3rNIM4+hcQqviNefGLJfhg3xhMPS2Xh+E7/LpUUSrrfjam/ema3uWYJQgOmBVO86vKxlAN1ZVk66Cvb/xYKn9CgpNj8d86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vcWR19Vc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZdYB0sm/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vcWR19Vc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZdYB0sm/"
Date: Mon, 31 Aug 2026 12:04:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788170656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCQ0uyM4692RoIkTWKrkGu+rliBBROpUs8fWhmht4h8=;
	b=vcWR19VcrvMLVUa/4K8K3SOnyMwCg1ghhwEs0ehCHq9u1rYo6KytDe6agVmijeuCGNEhjD
	UW7enWy7B0sl2zS4ho0V8cmhZfJvGQD3jPiQ4Uj6yOqW49PSPx7wsBZarsQql2Ap75Vcjo
	lzmeRlQiAgV/A5RXzfOF4n/MweY7DdYTZofKPtcZsk3DxYinI+X38n/c4IF4EOY5J9u7DM
	W4Pcj+iSfXkvCDCYvgFgd+SKs0OifuhHZH0QXJXNW7TtLTRFfgruSZ3lNSClkAbYdo1lm4
	PeSf/zg4IjxGXF1KzwovQBIH2wHofs8MDz8DVsf4RHEOhoDohazB13yaC72V/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788170656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCQ0uyM4692RoIkTWKrkGu+rliBBROpUs8fWhmht4h8=;
	b=ZdYB0sm//eKlIf0ySbEEjnBQEcqTseALllEudAJfgw+DWF8nit5vZyQ7ZUb3Tagf72UJr7
	+I2ZZk40qRYznTBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Hugh Dickins <hughd@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
Message-ID: <20260831100414.Yx-lNATi@linutronix.de>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com>
 <apNjw0HRyr1Oj7q4@linux.dev>
 <apOAF5CPFWUUH9du@linux.dev>
 <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com>

On 2026-08-29 20:26:02 [-0700], Hugh Dickins wrote:
> > Something like below. I will run some tests before proposing a formal patch.
> 
> Thanks for looking into this, Shakeel, but I don't think complicating
> __munlock_folio() is at all the right fix. This is peculiar to the use
> by mlock_drain_remote(), isn't it? Which is not taking the usual local_lock
> because the CPU is going offline. I would say, just take the local_lock in
> mlock_drain_remote(), but (I haven't read the history) for all I know,
> there may be PREEMPT_RT reasons why that would be completely wrong.

PREEMPT_RT does local_lock() as a replacement for various
preempt_disable()/ local_irq_save() usage in mm aiming for the same sort
of synchronisation.

On !RT __mod_zone_page_state() is usually invoked under an IRQ lock or
within an local_irq_save() section which ensures the per-CPU counter can
be updated safely without racing against another counter update due
preemption in the critical section.
The counter update does the not share the same local_lock() so for
PREEMPT_RT reasons the preempt_disable_nested() got added to ensure
preemption is disabled on RT, avoiding the race window since there can
not be any in-IRQ updates.

If this warning triggers on !PREEMPT_RT I would say you missed disabling
interrupts somewhere. Unless __mod_zone_page_state() relies on disabled
preemption, too if there are no longer any in-IRQ updates.

> Hugh

Sebastian
