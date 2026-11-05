Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877741;
	b=sKqGxrhzFXQ+pHxwY4Uj0eM/Sr0Vwm3x4xXL9mWGvuTglPWUhuUL2lss8KvoNVyvBEWM
	 DD9nKOZldWJ2/GOGM6kx/lHQrpmj3twYi6g11VY3HdQ/xNjcX2XEIEH8XEfbIZ7QGr6EH
	 R1WsoZEfTaUqt2qhjrSgguF1IpFiMo2z039duE1QfUjPwmlXc9yLtvUpcB+66Ic9j6A/H
	 whDbTp3z6z4eTDk+nQB6stmwpqbKdLku8ZqAI9hvSC8NdVN6OROrAB+cqwGsXaIKFMKLa
	 6bKqbgxXZJeF9rneXfFj0SrCEPKbVmZaE8nzeCr1ITIT+qTvGDIgIePfrRuxGF9IXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877741;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=zOws4qSg9XUwRk1s0vgXvIriiAie79NPEGixZkbOkAg=;
	b=HzICuCctIPcUb5baOXGYoEs0ihIqW5qW1KovNDwVO9ciz81kXzNKtp2aKWYpFrtM/YWW
	 z19C5Aq4+aZ/03kG6Dwz1nsJl11cJodPKWVooWvqjH14EEMlUMRLPER8K8AYA41fpLY9j
	 vqvvaezmYgBHP580uGiitUQN1PLgKQaO9WuHT3BNR0BUqVGsYfTkJYyKevasOeMOdOm2s
	 DcuuJTEE/gY/Mv9daGrg3KGQ02Bl81D8bDINnaQZrBsPuwD9VI7rF4I3Fc3ItK9LenGnR
	 vmOhmatKsxnQDVpkbxY2WACWRBaBK/tP1VvJsxRZTXegh138Ah60SbhlFxPvLYDvpQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx1WKsYF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AC606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx1WKsYF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028ED1F000C1;
	Thu,  5 Nov 2026 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877741;
	bh=zOws4qSg9XUwRk1s0vgXvIriiAie79NPEGixZkbOkAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hx1WKsYFQ6zeI85ZedyozrhBEmt61yIzl3cwCzckcW9/y1tJhrBw5gMH3bz1YVtjd
	 Tga9LQTgh3psZmMN0WHuS7ogf+TkZHA06hJt973/3nhzcDAENqwgIypYtLdyFTFGFo
	 NSsQA/7Lo3HFvM4jQJsJnGrtJRoN3G6e8OCNwiUCdpYCiDMgesmgMZjPNdFDEDT3kZ
	 9VecZ6/evSgdx18yTNYcQJlrEuhMH4TRJlZ0CGQ33K6C68dT0mklSCCURGNMwL89M1
	 IE6wKhrct2f9afILPi3MUtK2F+GtjBE8bMEy68RB9+GifkcmSTPnPhIESPkDROc8DC
	 UyWSX1EGp6RWA==
Date: Thu, 5 Nov 2026 12:22:15 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Weiheng Qiu <weihengqiuu@gmail.com>
Subject: Re: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
Message-ID: <auxm5whgKM-uiSGe@gmail.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
 <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
 <CGME20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958@eucas1p2.samsung.com>
 <eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>
 <auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>
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
In-Reply-To: <auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>


* Juri Lelli <juri.lelli@redhat.com> wrote:

> Hello,
> 
> On 05/11/26 11:20, Marek Szyprowski wrote:
> > On 03.11.2026 12:26, Juri Lelli wrote:
> > > dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
> > > to determine a task's current root domain. For a sleeping task, this
> > > is stale: it points to the rq of the CPU the task last ran on, which
> > > may belong to a different root domain after a cpuset move.
> > >
> > > This causes incorrect bandwidth accounting when a sleeping DL task is
> > > moved between exclusive cpuset partitions and back:
> > >
> > >   1. Move root->partition: task_rq(p)->rd = root, destination in
> > >      partition -> different -> bandwidth transferred correctly.
> > >   2. Move partition->root: task_rq(p)->rd is still root (task never
> > >      ran) -> looks like same domain -> no transfer. Partition keeps
> > >      stale bandwidth, root domain is short.
> > >
> > > The root domain then over-admits, and when the task exits total_bw
> > > underflows.
> > >
> > > Introduce dl_task_root_domain_cpu() helper that uses the task's
> > > cpus_mask (which still reflects the old/source cpuset at call time)
> > > to find the root domain where the bandwidth is actually accounted,
> > > instead of relying on the potentially stale task_rq(p)->rd.
> > >
> > > Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
> > > narrowed to a single CPU by migrate_disable().
> > >
> > > Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
> > > Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
> > > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > This patch landed recently in linux-next as commit b4a61fdc19c5
> > ("sched/deadline: Fix stale root domain in cpuset bandwidth transfer").
> > I found that it triggers kernel BUG during CPU hot-plug tests on some
> > of my tests boards. Reverting it on top of next-20261104 (together with
> > dependent 41a7968022ca3) fixes the issue.
> 
> Others have found issues with the set and we have been working on fixes.
> 
> Can you please check if the following addresses it
> 
> https://lore.kernel.org/lkml/20261104211207.1392343-1-mathieu.desnoyers@efficios.com/

So given that the first patch triggers a crash, I've removed
these fixes from sched/urgent for the time being, waiting
for an updated series.

Mind sending a series that is strictly -stable suitable fixes only?

Thanks,

	Ingo

