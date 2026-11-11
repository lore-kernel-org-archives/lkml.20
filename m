Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416325;
	b=WUKfJvyBRRS8DNVHZQPhSCUBWfo+/JhlkHeWnX+wkalDNH9nC/U7jHn0aJ99fuimt7wV
	 q08l7cS2fqUP0J1Nww4HGb+Y985ZyjmwaZUvLnrwzDw91yn6ClbOQBt2UE+uc+7RxKNx6
	 S6+58NCe00rke88kueYzcp78RRHqATkx/i16rJPzmDRkwbugPHVp6VCjQyS/PccdTTvN+
	 rQNAEmuAImgxs7OpUVzYzCjSjDDzgItwC//TWLVl83TUQvnPMyZypAnppzzM7gw9WfZg2
	 WU2SS50Uxesppjh8m1kXdqM9YvVL6DHHYsJgxveKKuwB8BEXrWT4OZdOsYQ3JWFsjvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416325;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=6VnbO8pD5BjzBxA7dV8WuTd8b1Dq0H1afFoCmUiOLYg=;
	b=fx5jZEIqjroKet6HiI//cUbUPbgRvWl7cdVSM4h2jcsHajlHTmoeloxgOO0ITwvVusIj
	 Rsk+GolPoQTIl22H/WEYJJHTjZwY/czHz+FGKoma7DBVzP47hhVR0H1y4/8a2Vz7Ny2mv
	 7fSN8WF8Ez/OhLxHcJ7Bfo+OgTAyxewwN043Rmz3a/1h908aLdZswb4s/l0UvIJn2e/C0
	 LiYMGQOTlehB0uTBzywsHSG3++OgqZ0B9gwobdXY+/ryj13h6quxmSLG1WKEVcqrMLbYQ
	 dGWj6lcv0/x3XblV7dsUfCK2yAEiZKMEVPslyuRB231fn6mPfmdl0M3uFzZH10EN4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=N2UxzWrT;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F331D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=N2UxzWrT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6VnbO8pD5BjzBxA7dV8WuTd8b1Dq0H1afFoCmUiOLYg=; b=N2UxzWrTOeQhA3tMKxPf3RLxbP
	aWXG8PZ2cROzotpL5WtXUnSpJqjMsRVYfrveV3Py/un1XZi97d4te28kNC4QeCUSqxAKYB3lMT+SJ
	BCEM94hhqZ8GDVYyjN2JSHQ9OQWtTsDh2t1KYiYRHpqlUKGaqf1VSgHIiyw5QB7lQ4HBYpTeb2XPE
	uga5br7N0ca7/BKnM8fWOyLHuA59IwY0VDv6JnMX+0PJNo05oVcoAF8ZUxhhMYETMzgLxMN2wRgGV
	dVshuS7bVjkKd0dx320sAJTeLVXCJd5Al+2tKhc52cyb5PXEiRgY5xhkm0Sc2bet4fppGiBqqbcQJ
	Gty3LDDQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBei-00000009MLP-0TrY;
	Wed, 11 Nov 2026 16:58:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6B05930031E; Wed, 11 Nov 2026 17:58:38 +0100 (CET)
Date: Wed, 11 Nov 2026 17:58:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks
 idle
Message-ID: <20261111165838.GR1779021@noisy.programming.kicks-ass.net>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-3-marco.crivellari@suse.com>
 <avSeXluNMl_XGPEw@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avSeXluNMl_XGPEw@localhost.localdomain>

On Wed, Nov 11, 2026 at 05:57:02PM +0100, Frederic Weisbecker wrote:
> Le Wed, Nov 11, 2026 at 12:43:48PM +0100, Marco Crivellari a écrit :
> > TS_FLAG_INIDLE tells nohz whether the tick is managed by the idle loop or
> > on IRQ exit. With idle=poll it is set while polling, but cpu_idle_poll()
> > doesn't run the idle loop again on interrupts: a nohz_full kick or the
> > expiry of a stopped tick isn't re-evaluated until something sets
> > TIF_NEED_RESCHED. The tick is therefore restarted before polling, and on
> > nohz_full CPUs it then keeps running after the wake-up and interrupts
> > userspace.
> > 
> > Enter dynticks idle only on the cpuidle path, from cpuidle_idle_call(),
> > and leave it before cpu_idle_poll(). While polling, the tick is then
> > managed on IRQ exit as for a running task: on nohz_full CPUs it stays
> > stopped if possible, and nothing is left to do on wake-up, so the task
> > doesn't pay for a tick stop after waking up. On other CPUs, leaving
> > dynticks idle restarts the tick as before.
> > 
> > tick_nohz_idle_enter() may now be called on each idle loop iteration and
> > always runs with interrupts disabled; tick_nohz_idle_exit() may be called
> > outside dynticks idle and with interrupts disabled.
> > 
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> > Cc: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Link: https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
> > Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> 
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

So because I only receive one out of four patches, I've been ignoring
this... 
