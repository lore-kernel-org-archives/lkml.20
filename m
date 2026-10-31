Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453417;
	b=cGl6uXGGsfvyqu5HdnsJEByjBfAOwP9j56bpKR0KAogyp5fYq7GOeIlUJeJCTXliNere
	 swnwphpxJ++at6JiodfnIURpMfcV7ZZlCJD5BwUmY5NKWmfYK83rsuSD+ssUmqlBepTYT
	 mGhCW9MYc2hGorjpmz4H5rf0MBa+J6Q/4aIUkp5lVZByWP64fJMy8ZNJXwq2ek6Qjm6p+
	 MgHogY/hXPA6UBLGVzhWDZAbw5hjlb4bbgLI9PgSvqmUr+XJKqhdMEJVIAXydOB2k73LL
	 pWllM2mAQTHXclSURmb7Tk87Fh6AXK7cwebV+40j2AiM8oGOnfXN38WYabeqAM+NZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453417;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=W/gp38RFD/zeBmARJWcpGGxx9xSRN0u2OjzpXoxE75M=;
	b=qpgG+SYo8TDAPxViLkyTsPS1zIvQQH0s8jkhciZCO6dK67FitYivatCSDQ++e66PAQ7j
	 FTd+YjanNN3OmMz4t8CdI+RGfbhCYz9+Bg699hiWvfpL3X67rkjg/4/dqg1lSZet0rt/o
	 IfUStYgjBXmgGrsnaRfNgFAzcgmTH8VsoROi7HiKwKWAHF+eoFdatGP1t1WIaL2whJxNZ
	 t5+okv3DyMhQn8uwSbhPjzoeCQ3tdyn7+huqAMF23qE40MdOatyibltpx/Dqje7WbyuZ6
	 gAI9+SYZlXLhgIDO7MklXEfjSAyQ9HjPH/Syj9lsJ8hvwoDCUqC+jzyS3rTP8FwP7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LNz/8kfy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNz/8kfy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6BE1F00919;
	Sat, 31 Oct 2026 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453416;
	bh=W/gp38RFD/zeBmARJWcpGGxx9xSRN0u2OjzpXoxE75M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNz/8kfy2bey59kCDf9AH3+83TikCnBYV49DeArnuUB3lqsL5cVjysb9Lez1y7Tic
	 nnBcBvbQRHVk0RB8npXNK9Le6IKI9E16a0XFajmrYZHakxchR1lFC97c6fxI8J6Ivl
	 BKk5HC7ZsuUxD8RnwnsoVi091irkrDGvfMiAWiGhIfJa7p21I/hUgaa4y1TE0zwTbM
	 5LlJJBaCsvLHb+zGnMIde7Tm6Vdqftvk+RVWWcj8+bC6anv7FswwHF+yQc5sy4Mxw9
	 iokaHf8osUTJIwh5hCyS1Si2Y4diEVbvs/y5CUTZMOI4HZYPTexV3Qe8mdd3sGtfRs
	 Duti6fn/ORieg==
Date: Sat, 31 Oct 2026 14:30:13 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Stian Halseth <stian@itx.no>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [GIT PULL] Scheduler updates for v7.4
Message-ID: <auXtZQukFeJy4Ehc@pavilion.home>
References: <atSiuBt4n03_iQNW@gmail.com>
 <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
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
In-Reply-To: <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>

Le Fri, Oct 30, 2026 at 02:05:36PM -1000, Linus Torvalds a écrit :
> On Sun, 18 Oct 2026 at 00:43, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Please pull the latest sched/core Git tree from:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2026-10-18
> 
> So this seems to trigger for me on my laptop. Not every boot, but I've
> seen it at least twice now:
> 
> > Stian Halseth (1):
> >       sched/cputime: Don't account idle time twice after dyntick-idle
> 
> where the new WARN_ON_ONCE() triggers at boot, resulting in a splat like this
> 
>     now < tick_start
>     WARNING: kernel/sched/cputime.c:481 at
> kcpustat_dyntick_stop+0x82/0x90, CPU#2: swapper/2/0
>     Modules linked in:
>     CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted
> 7.3.0-19045-gb92f6e90cf05 #7 PREEMPT(lazy)
>     Hardware name: Dell Inc. XPS 13 9380/0KTW76, BIOS 1.26.0 09/11/2023
>     RIP: 0010:kcpustat_dyntick_stop+0x82/0x90
>     Call Trace:
>      <TASK>
>      tick_nohz_idle_exit+0xaf/0x140
>      do_idle+0x1f5/0x2e0
>      cpu_startup_entry+0x20/0x30
>      start_secondary+0xf0/0x120
>      common_startup_64+0x13e/0x148
>      </TASK>
> 
> I haven't tried to figure out why, I'm just notifying the guilty parties...

Sorry about that, Stian has a fix, I'm just trying to wrap my head around it before
giving a final ACK.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
