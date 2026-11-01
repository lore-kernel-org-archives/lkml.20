Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514846;
	b=K1JaQAL46KFka+XvMuNtU/O0Jx8f3f9bBJ/PVxlcI9VFslKmOHCtD30AurWATZmb9k+Z
	 pVG30kGHqS7z7DsVNaoIL4r9BLfXUVisRYaqfxeRJ2cIql46DPd6+tGyfPW7SHsv0reTg
	 AbTOcfMZe1QGA6gTWCy1BVH0cRZH2IeJQBKXziEsYxMdr137CjjnKZjebi3EtAW8t3Dv0
	 V9ONIjp3wnIcFH8IKZQmTbcP4AxdTMp0uzZugDqbGvlT0wqHdxlQxih1aak346LfZb4as
	 7BDXHkoJ6D4Ox1HmI3xuvy5lBbF9t7e3RsS8d3xebgAu3CEAe5mfpA5Q7y591SCzY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514846;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rjhYpG29KiXec66lehjT+qnTIjxBrflMBNT7bdsSn/U=;
	b=n6AAuDWNaVjjxorW0VJFY5XlLSnPR4q9GN2tHdS9oJR0/V+b7go9OUeZbKGKcTCDAYyp
	 yfdd89g/0uYBdo2hzho9i7nTx5pBQk/AsqD1WhyMhwsEzzGNXrzFXWpORPjr+t7sHFUNv
	 dJCg3hlJDOQNkQH0nRjYkgpOS2UlU82EUD03KzUqrkfYYkcoYhIZwA3sTPPNd0abBdWFw
	 n2BM1rDtAefIvqPM9hjX76Ms27NqruMRqN25C23MZ+97omG7yq+QEv09nro+r7XBomeyf
	 rvohxrI+CvZH85lIBcGUg/aUgaQGREIqQ3/LXNl8RK+KNGHBPVHtKb/MgGbTRLkUdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCftg+8C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCftg+8C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0431F000C1;
	Sun,  1 Nov 2026 06:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793514845;
	bh=rjhYpG29KiXec66lehjT+qnTIjxBrflMBNT7bdsSn/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCftg+8CkBGXhzAMGHuCn0XTNgqHPlPKWwYomrrRvc1nVTFUDd3BC+wzhyKWdMLYi
	 TRoUSowB7f/JpcTXG1/SKDzCqLv3fNQs81f+71TRKwHmJ7SOTf0QgM7iwkDQ8cOxfZ
	 EO67bbDZdXhhr/tnTV+P+umDIZJmynpMTOwnLvmoHEvs+osMbY5croIYAssBk6tdv0
	 LCQd6HFk/1eADwcpN1L4yH8Pwzm06f+F3lfP01u6w7sfLTK2UEw5msCbeDo/r/r7Tl
	 NgSiW0CZ8Z+M3c3rwpXjekJTwSPb8Eak8+dV31kRdSP5y8rbuOYyNwgJsU04t7q1G5
	 B0sIPYSVLLT0g==
Date: Sun, 1 Nov 2026 07:34:00 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Stian Halseth <stian@itx.no>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [GIT PULL] Scheduler updates for v7.4
Message-ID: <aubdWBZEm35Eqe3o@gmail.com>
References: <atSiuBt4n03_iQNW@gmail.com>
 <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
 <1350c2fef9f74d5654041c99d255a22885fa0ec2.camel@itx.no>
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
In-Reply-To: <1350c2fef9f74d5654041c99d255a22885fa0ec2.camel@itx.no>


* Stian Halseth <stian@itx.no> wrote:

> Hi Linus,
> 
> On Fri, 2026-10-30 at 14:05 -1000, Linus Torvalds wrote:
> > On Sun, 18 Oct 2026 at 00:43, Ingo Molnar <mingo@kernel.org> wrote:
> > > 
> > > Please pull the latest sched/core Git tree from:
> > > 
> > >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-
> > > 2026-10-18
> > 
> > So this seems to trigger for me on my laptop. Not every boot, but I've
> > seen it at least twice now:
> > 
> > > Stian Halseth (1):
> > >       sched/cputime: Don't account idle time twice after dyntick-idle
> > 
> > where the new WARN_ON_ONCE() triggers at boot, resulting in a splat like
> > this
> > 
> 
> Sorry about that. Paul Menzel and Breno Leitao hit the same. 
> Nothing is accounted wrong, the warning is just wrong, and the fix Thorsten
> linked drops it:
> 
> https://lore.kernel.org/all/20261025100202.2584654-1-stian@itx.no/
> 
> Since this is getting more attention, I'll send a v2 with a better commit
> message and the reports added.

Thank you, I've queued up the fix and will send it to Linus soon
so that it gets into -rc1.

	Ingo
