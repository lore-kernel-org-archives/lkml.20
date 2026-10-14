Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5454CF6D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990540; cv=none; b=r8BTttWjD9YFkq521peuoYcsVEe5RjBkQ437uxU+VoUwVzxoDL4Ev2LT/SOJf4VJND9urd2Tbqsgx7L2NckQQT9Kz2rgoztNDez5yKmHbCFEthcX6ZWT2ujSIOO3gKP4vkIhWg6J9uRB4a+kqkYlH+cM+VMXDpMA0xsi4463O60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990540; c=relaxed/simple;
	bh=kmmF0P+i5UWKRlZ9F/TFFB8xOojGwHSnZNx1VhtwHr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAA+W3ViEkVZz5Nxt1sisVDW8HPvn0mF5UH8dAXC8Tqux8DCwidiEmlW7WSsJQLl6bSqA+a/cYIi6GGkxUeqpdVrk+kj2JOgZ6gcygxXBZMehPk2rcsTN6ukFazSVUPkB7OB0FIMuCt5t+7BS7sSMx0UFMWQWZinbpgV2GvZco8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mLALfMK7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1LuPuFtT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mLALfMK7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1LuPuFtT"
Date: Wed, 14 Oct 2026 17:08:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791990534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3APKaQu/b4+Iid0imheNzIZFinTC6z+bGAfQ94t3c=;
	b=mLALfMK7Fzggs3t0AYQpg1ocwxErtF3Dr8xq+hJofeWD9RVMwtKCOs0SY1M9cMgXQJlqSC
	TIKwoE8g17gw955ZBlCDQuchBIn+jWiI2peyb0uiatXweCXChKMjqkdH1Yk6YrEgbO9Zpn
	rUXcVDo87Vfc9R6q7+QZ1P1alCPbJtdYww1w8YOmOJcj8sq6Ok9yOs1aXm01EiXrOvTwT0
	erCgSwMGGjJOsrmjxoVRYdJYW2OqGgISxFedpNhEmP4q039FEQYVcj/HWiQv642DN//Z1q
	foFO0iU7nveiWMlzyCv80zsntJ5esd+HdanJWFR4AnQed3oAnXGvEO2QnXehCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791990534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3APKaQu/b4+Iid0imheNzIZFinTC6z+bGAfQ94t3c=;
	b=1LuPuFtTe9YHcRgJP8AVdTyePRRJeJg89Mip3HrncKEC1iU7nOXq8KDOc90t7dARB7TPrR
	QY4qcdQOTbM/aEDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: wen.yang@linux.dev, Clark Williams <clrkwllms@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6.1-rt 00/15] net: Backport backlog-NAPI threads to
 resolve PREEMPT_RT softirq warning in SMP flush
Message-ID: <20261014150853.f8I2fNx0@linutronix.de>
References: <cover.1791912669.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1791912669.git.wen.yang@linux.dev>

Please keep the networking folks out of the loop. This is a backport
request which goes entirely via the RT-queue.

On 2026-10-14 01:58:34 [+0800], wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
> 
> *** Overview ***
> Backport the backlog-NAPI smpboot-thread mechanism and its prerequisite
> NAPI/RPS/defer_list work from upstream (v6.4 - v6.9) to v6.1-rt-next.
> 
> *** Problem ***
> On PREEMPT_RT, RPS steers packets to a remote CPU's backlog by sending an
> IPI. The IPI handler (rps_trigger_softirq) calls ____napi_schedule(), which
> raises NET_RX_SOFTIRQ. do_softirq_post_smp_call_flush() then sees a softirq
> pending that was not pending before the flush, and NET_RX_SOFTIRQ is not
> masked by SCHED_SOFTIRQ_MASK, so it fires:

I was about to point out that v6.1-RT should have duct tape for this but
from reading 1/15 is see that this duct is not complete and is missing
RPS. Indeed.

A backport of what is merged is my preference, too. However, we should
get v6.6-rt fixed first then v6.1-rt. Otherwise users upgrading from
v6.1 to v6.6 will have this case broken.

Clark, any objections here from your side?

Sebastian
