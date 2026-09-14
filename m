Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D232A3C8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370474; cv=none; b=WcAe/q3bUr05FNDirgEF8jiryjZgyARME/SwR5hPrOn31w1W7L708Xugf/sk2vb/vP3Uz0RHhGzfoNRa1JuLmDXfcBjSGU/26m4b6cv/RAy01olDkRHtMotm8ujnPqbAA09oopWWRlXiCWIe62e43/mgyR+taOGvFmvZaIftkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370474; c=relaxed/simple;
	bh=tmeiOhsH2t2XUgNlYsOkQyBRwmc+1NulSxnFFaB+knw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1QSfsf4s/8c6YJ3EaG6AMD+knmpIecFq+4ZRHaYbZEi7W/kdXii7koAyDi1jejqzrw1EWzKmI/GXVIXzcXiAx8SOwPRuep2r1SLghYI+PxYMvb6gQoPNu3/Fksk4jLXY8Bp1b1SCE+3D2fAJuEsfF4yvRFl/vqZHyFTa+GtHw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MbrnRFdx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eUubzH/1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MbrnRFdx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eUubzH/1"
Date: Mon, 14 Sep 2026 09:21:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789370465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+hiMIbfRxaMSum9bpvsURyyOqU6gchsQqWZHM0dnhI=;
	b=MbrnRFdx87C2ex30BKffP4wN160uU+bzpa7uVQvdwcOkwXq+JrrFdGTp2IuV7JE/I/Uwrn
	jLPfjpFZ9mB+OKxTcA+XuG5ZCz8ZZuEfnCp3iQwhjVJwTs21rvYqqOiMf8KgNuzkssIPGR
	+oHuWBcvdBCjqmjzQU17DoEF7J2CQ9QdsdR29DMRcDNGvyZnIBIaodvB3Gh73vVPzwCcWy
	aryFMFwQYUru2vnS5Y6SWDI9CwUuxA9riHN4wADiSm9ipj/IR/On6cdArqjYwoOIG/HWBs
	/K8bEIeDqmPtlSjslxOoP0BmqaCp85X5DDmmsRTJBUAB9UUMSenPBPzKlWDbQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789370465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0+hiMIbfRxaMSum9bpvsURyyOqU6gchsQqWZHM0dnhI=;
	b=eUubzH/1NZ2So6eegd1Bj49cOxGZfdk8l6TtVIWrmXk0Nyd2hVl7BC0LrSgeIGFXJlZb8t
	K3N4mOt/i5TKucBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] futex: Fix futex_do_wait() reference in kernel-doc
Message-ID: <20260914072104.1348vvjR@linutronix.de>
References: <20260911215655.6557-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911215655.6557-1-kmehltretter@gmail.com>

On 2026-09-11 23:56:54 [+0200], Karl Mehltretter wrote:
> The kernel-doc comment of futex_wait_requeue_pi() refers to
> futex_wait_queue, which was renamed to futex_do_wait by
> commit 93f1b6d79a73 ("futex: Move futex_queue() into
> futex_wait_setup()"). Say futex_do_wait.
> 
> Fixes: 93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
