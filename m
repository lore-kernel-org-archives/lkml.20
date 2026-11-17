Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929161;
	b=0Jl9lCYYcPAAwoATTqhnik/gjhGrh/QpXA9CQNdqOHtrgHGyBLdQ9EKu8ITxyodi/Zys
	 e/8ejPBGOBq4Ecw/Krz5Rg6AXM0JEF4DiQuNNoivn8u5Y1797roZz2ectp+G1rrAjG2EB
	 qRVDDGHKdtWOltayJqHUX0ntBuqkVubfpkNtk9/WS/O/5z3K+SAnb7DQOLnaLZ6sPgDNE
	 NrWaII60DArlfCn2ouWWJWfDcHNvZtf6ctYO3N0rXy/8qvU4EUgB5Z5l3S/EHfH8X6sKi
	 aRxokk0dA5dqXTpY/95LmlBVZkJO7PoVIvjKMv1O35EGyZyfF1MfrL0KMliKk1kYlAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929161;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=EXE55mQKN3BnJtD+/KvGpW7W4kWqKlltOiM44HMRDro=;
	b=O4xtpx+um/EJDI5DZa9sLGkZZBxl2B3967BaA3l4YGdun0qE9oOcoMI8aRx6FQJNbeto
	 XcdS3X0GyAkSFdQXr+ki1NuGXCDcuEGLH4GvQUcZcKrjpLnfFZXZs5CMUkheqf1Few8+p
	 gh+HX/4MSNrz/df7wH9OyBgxYOEypdOiEL87nJTwu8iA8ltcepXy3HyK63OW4tYk6iP36
	 NN2GxhigGUKclbj2zDJaR4aBTdLh4MnjvxYErEwjaepwDGDTqGtBjQANSOlYdk/JrKWT3
	 qXjZYkiVVKrFPNakROAVQZWyCy7hsgQ44xz/M9GMWiQr29YSf7CWoeigwQerGsqx34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=B3qmSKvY;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F4606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 472F4606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=B3qmSKvY
Received: from omf12.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 6EBA4160478;
	Tue, 17 Nov 2026 15:25:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 5ACC117;
	Tue, 17 Nov 2026 15:25:56 +0000 (UTC)
Date: Tue, 17 Nov 2026 10:25:54 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar
 <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Seiji
 Nishikawa <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261117102554.402cbab8@gandalf.local.home>
In-Reply-To: <20261117152026.GI1813469@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
	<20261117152026.GI1813469@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5ACC117
X-Stat-Signature: brc91q7h4tbsbic6bmax4haftzouyqhb
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18nClPDu39F/0kPj3QX1FT55S7p6+iR8/8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=EXE55mQKN3BnJtD+/KvGpW7W4kWqKlltOiM44HMRDro=; b=B3qmSKvY9QmXX5GZySjKSqhGGLZmdGrDK35vSE16BT1uDGRsMqh3/RFYFwnIXPJVNXC6YSCPl7LVcFkqjSHR46ODDxsoNCH9j81ZANekGdxJ5cXnBcDOSXx7ZQatJfjZ52HgplvYUSakVhPn4x4eTTwG9O9vQ1qhsTRXhFYCi60=
X-HE-Tag: 1794929156-594778
X-HE-Meta: U2FsdGVkX1+PKOEYOXPHYBCN29Sic4/YsX0FyR3qxh8nCQMQcry0fZLQUDj++Fy2k3DUMa7hVkPlVaPmrcHvui11CYv13uCKm8MN3yz3QKvNZP0uRtU/hSjSWNJsnriQN1/b3kkERbFrZW3i9hP/DgU3BJBZnBK2sHhQov3coYCsjqkxIbwHssHH4xEazgpA2NRf+GKhPYnfhzni8M1l31qqgJ0X+EefvmR1VQcDt4FL38ldegRmt0VF2EunHWpWEsmneB+MGs6a6czKPxqeP0EaALuyg3tCweacVmfrdx6Vtb8KF7SNX+cV9JJyYatVntWZWmxmjmFKOXJF+gT94Igg0triFjLx/FIqqqwV0PqO/8PTM134OyKrOF/q84q0

On Tue, 17 Nov 2026 16:20:26 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> >  
> >  static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
> >  {
> > +	if (p->nr_cpus_allowed <= 1)
> > +		return;
> > +#ifdef HAVE_RT_PUSH_IPI
> > +	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
> > +		return;
> > +#endif
> > +   
> 
> 	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
> 		return;
> 
> for both RT and DL. Sure, we might get an extra load, but is that really
> going to be noticable? Lots of scheduler code already looks at the
> migrate disable thing anyway.
> 
> I don't see why it should depend on RT_PUSH_IPI, it never is actually
> migratable, and so it never makes sense to have on the pushable list.

When I took a look at this, I was thinking the same thing. That there's no
need to have the HAVE_RT_PUSH_IPI check here and always do the test.

> 
> But perhaps I'm missing something; the above seems to suggest that is a
> theme today.

I'm still trying to dig myself out of the tracing patches backlog to spend
time on looking at this :-p

-- Steve
