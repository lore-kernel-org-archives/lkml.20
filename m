Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369604;
	b=eLphHElhIHTo2XAo7MQyqevQDpPYLuWKjvrhiTsvMW8xweYdoMKFhitzhd/DKLziSZ2b
	 QZx6+5ezvKIdMaYINWS45ClbHNrBDOV1fsU7ZjxcjzAqdguO8V+cBaQo9d19z0HpBYlTH
	 8ozE9qfmmCsxdPhkPzjkKCFyniGDzd8Ry72w7O8G5FZXwtdNy1j4fL9GNN19c0DZFcQ0c
	 6lCcthB17zj7K6Xk1+eG53pX8UyRXBEEVeF9iFxmYFez4p8Ih2OcIf0kDPwV+XtYrNN5q
	 oIwfHgg/RdlExZiN6d/iBDjJUmH/boqRedBeTpbXib1JeQe5Qs3/Vi/Ag3xW3A8+QDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369604;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lU+2x8scRC18VNUX+VljgMc4XkWC/zplEJuZDkOMSzQ=;
	b=ewGZ0RAURZy++jdb86w4TksKDkKdlBjwe9Loa3keZuS4euqRpmnJF+TxZrPWmS7YSw6Y
	 Uo0rKfNkSSh3m54JP2eHJlA3uIjvvih0Oc9Syk7xjcEF9iosxEf/eoJCBxXNxhMePTxzT
	 rKfdvoCSTQ5BzzQXQ9VcaNKAfA+nDIcgnnhLQSZvIHZbSpFdNFxZi1zvq77aASPXzjgfq
	 paHz7hL6CjR+8ZIIjoSm9NQHcGDyyTYEMjcSvsFfHzyd3z6o6Ys7WkEPwv7P38S5E56k8
	 kSJJhImeTF2cE8IjB2HjcBmuDhLecKhc2GeXW+TxVRcyuEu/+n0nesPPpHVvC7+Mraw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Nq+GJUkU;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E822606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E822606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Nq+GJUkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lU+2x8scRC18VNUX+VljgMc4XkWC/zplEJuZDkOMSzQ=; b=Nq+GJUkUNQPaEOp69d4M6+1EKg
	oT4nN5Ed0sq7GCqRwPHvK2nQTmupSiQKhz4m7cQ7UVTmYJZ0ZyHj4uK7r82hCdM2NpZmUEiLqNMtU
	4tnFuHtWDAEKRkw9kHBnyqfxkF//V8bdEphlD9xIt0ehlilZl6m85P0tTafi40MQ4fJ5AghJA3FjF
	6dKpBJ3c0sqBPXJqc6a1yjUb0Q91ZqRgz/FhRFrkOvyBKskSujUTJVpPcIBeLOEyPX38DPQzP2Il2
	fjIKGfCYMTt5mDbpNFNNKuewm+j2a12V+tMbKCaQeF2uRIJENfqnVk3zoVl+37WZ4SkcyqqecCo5x
	VQrl4P0g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnM7-00000000Pfg-0g6h;
	Fri, 30 Oct 2026 14:13:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D2DA2300578; Fri, 30 Oct 2026 15:13:17 +0100 (CET)
Date: Fri, 30 Oct 2026 15:13:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261030141317.GP1779021@noisy.programming.kicks-ass.net>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
 <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
 <20261030112825.z7k57twgua27p2vu@airbuntu>
 <20261030121518.GE1813469@noisy.programming.kicks-ass.net>
 <20261030124119.xulxkpo7aas3wlwa@airbuntu>
 <7b9c9ab0-7b3d-414b-b1b1-5416be256cc7@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b9c9ab0-7b3d-414b-b1b1-5416be256cc7@arm.com>

On Fri, Oct 30, 2026 at 01:21:30PM +0000, Christian Loehle wrote:
> On 10/30/26 12:41, Qais Yousef wrote:
> > On 10/30/26 13:15, Peter Zijlstra wrote:
> >> On Fri, Oct 30, 2026 at 11:28:25AM +0000, Qais Yousef wrote:
> >>
> >>> Peter/Vincent, what do you think? It seems we have a schrodenger task that is
> >>> both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
> >>> this be fixed? If yes, any thoughts on the right approach? Should we throttle
> >>> if there are no other tasks on the rq too? I didn't realize the semantics are
> >>> that strong for enforcing the quota.
> >>
> >> Urgh, nothing is ever straight forward is it ...
> > 
> > Exactly my thoughts..
> > 
> >>
> >> Bah, so this is because the core does uclamp (for classes that have it
> >> on) but then the class does the throttle without going through the core
> >> {en,de}queue.
> >>
> >> Does it make sense to have throttle_Cfs_rq_work() and tg_unthrottle_up()
> >> do uclamp_rq_{dec,inc}() respectively, along with the
> >> {de,en}queue_task_fair() they're already doing?
> > 
> > Yes it does, just wanted to make sure we agree the bug is there rather than in
> > the current patchset approach.
> > 
> > I remember seeing a patch to remove the uclamp_enabled bit and defer to
> > enqueue/dequeue_task_$class to handle this instead. Maybe I can revive it if it
> > makes more sense to go that way.
> > 
> > Let me find the path of least resistance and add it to the stack. Not sure we
> > want to tag as Fixes for LTS to pick up this independent fix. Note we have rt
> > group throttling path flagged up - which I also thought was false positive but
> > not sure anymore - but it seems to do partial dequeue and must be fixed in that
> > regard anyway even if it doesn't force idle.
> 
> I can reproduce the idle path without uclamp_rq_dec through sched_rt_rq_dequeue(),
> too, so IMO that needs fixing up as well.

Right, every class that has uclamp_enabled needs to be audited -- this
seems to include sched_ext.
