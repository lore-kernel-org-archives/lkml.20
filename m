Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A73101A7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873983; cv=none; b=UWZV0pJRdehPNPWlffVe2iNvaNqwWqY5Go0Wo/S6JtAjxk+NYPCgKQ+jBKvhvBqQnOtEkvW5xN2NLhczQt5pT8VNALqQ1YdlY/5p8N2Ibe8x8xvubv2qSvRO79HkBXX8YinwXzvP8/mFmJQIOCZLk2joN8/I80D9ApmjMT9Vu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873983; c=relaxed/simple;
	bh=9ovmOPg9Pb4IQ7W/UE15L6p4EfR+xH0ZyiLzY/YGBec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzM/gSFQ9V71M0UHaOF2T9M7ClnQHr/8uLGaKu0yjR/1oIwwj6viwkJOE1hlLhgFtxx8TDRL46t5Qt7x7tUCfuavonFG82k5VpPTBmd7DxFvGH5pSBxKc2UUTCfQZQivRnBhkqcngpxLDmaIfnanhAuJTpXmmsZ2VnQK/esLMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FC0BpoXT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D75rw7u2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FC0BpoXT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D75rw7u2"
Date: Tue, 13 Oct 2026 08:46:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791873979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=utp7+jNU6jDsmQHBvc9ksY2u0WKcyExAM2mAe/mA7sc=;
	b=FC0BpoXTE/0Y2CA6Y6C96dH2t8n+Zv4YTB0lAyDTJs9YIYTmg3xfmXqyjS75Npw7scEefr
	4PAykj3sZAOzQbPQbZtCCNZCzXnMBuQJP5eRdC+OuS74mwk2FD9tXiUQ5q42vxl5238smg
	PNX1awXA6JjsSy+HPROcjJ1K1IxJ+6NZ0S9BBS1waDb/ZypOgfWH0lIzpvPjCNqZXXeo8Q
	/kcfucgbEWfqxdbWBVDr938ARLCLhhM1QBi80yCujk/5oZFL65FSIwn0vC4de0jeWuxadb
	2m1sBxKaiaNdYM2tstihROBAbv1xVru4wLT6JR7jBfqMkZpQ0CNLyo0hPnh2uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791873979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=utp7+jNU6jDsmQHBvc9ksY2u0WKcyExAM2mAe/mA7sc=;
	b=D75rw7u2BdUCTcXm48SWEe3iqedAdv7tlx3TUAi0/INlR7IByyVqdLAkZ+OoCSb9MoSfXh
	kInp0ZM9iS9eNOBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC PATCH v2] sched: irq: cpu-hotplug race vs
 set_cpus_allowed_ptr()
Message-ID: <20261013064617.jw7Sk6un@linutronix.de>
References: <20261012103946.aOSAmrRe@linutronix.de>
 <20261012143047.GV2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012143047.GV2009045@noisy.programming.kicks-ass.net>

On 2026-10-12 16:30:47 [+0200], Peter Zijlstra wrote:
> >   There is nothing that waits for the interrupt thread to complete,
> >   there is no synchronize_irq() invocation which would be required for
> >   the deadlock to happen.
> 
> But any other set_cpus_allowed_ptr() call in the kernel can suffer the
> same problem, no? Why is the irq thing 'special'?

Not saying this is special.

> I am struggling to follow along. The actual fail scenario is a
> combination of hotplug *and* migrate_disable()? Can we get a picture?

let me grab the reproducer and a few tracepoints to make an accurate
drawing.

> A CPU must not be able to go offline while there are migrate_disable()
> tasks on it. Are you saying the migrate_disable() happens after hotplug
> already marks the CPU offline?

I *think* there were no tasks on it. So based on fading out memory:
T on CPU0 in migrate_disable(), assigned to CPU1, schedule().
CPU1 about to go down while the T on CPU0 returns does
migrate_enable() and should migrate to CPU1.
But this old memory. Let me get the reproducer and get back to you.

Sebastian
