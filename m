Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614701;
	b=mdQfphAfbN0NoUKHbWLgKEYlehEk94XWcyyodZ1lZJbnaGfA+4XR+AMNko9XL4MCUbh9
	 4JX8+hE0amnm/Rb7Hhuy0YIVE8PxCTTcSEcSGxFQlK0WkhP8T9i4zPaDEOlJe+OoDMMFU
	 PLrJGiFZGekKBsoXHJSOMF+JJfVWb6+5G1wQUsZ1HhrpidgdcW3XDWHKdw/NZFORpMMBg
	 c1Bf69vVQnXJE0t7dwse2KRWmXzkUNWJVV2jDkuGdujUa/Et3MjdaXBLef1izuCjgIslk
	 /m3EDt33TrVREmN1LdJRh37dQAq5/ME6RzewNhc4+8+6SMZ4F8CaeIBrn7gV9VWIx4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614701;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2RvXsQzUpa201cjl7B7pbXVTLOR4xWL+MdQoRqYkAIo=;
	b=H/jNHPNcFvUMpmCYEUUeto1+Rff5br/s6EfXRCp1xxnRUN9QZvMdPIiJe3cJsPhoKhjk
	 RL0rtcImD6IytfCpMVtRh0z6TXboxy9f6bS53MZRcLt934/bQ4GAGRvVtuwWyItAEbP3U
	 Nrdm/nHkyPkIE0WUItYwtJFuPk6+fdfwWZBB/YNdinQDV2OdSpbt8jZnWN30GTh7SL7uc
	 goSi8F0KZEqwab3VEE/v9tOxpNkyA6uuffVn2hN+BAxXgvlfVquvyd4NJYk97GxhYwUS4
	 AJZqALyuo2W6sfbymwbD0wSPYr5nQbiThiFo8vPzsVWNf64MRhrB3d+kn8Erx+uUGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="U/gi3x2u";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E0F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U/gi3x2u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2RvXsQzUpa201cjl7B7pbXVTLOR4xWL+MdQoRqYkAIo=; b=U/gi3x2uOwZEtBKK2bE8PeEKgu
	nGy9erWVzOg3IEqn47GbvDwel9mtEqSgMWuKcHfI0ke7cCbWwmPVXSG5LbQ4wQfJXVG1vARv6IzCM
	Zj/qhlBLZfYbKNKW/yfUPjtiixoxmDjXWiyrklLm3K1S/biTEwjuJADbfJDhZ4VIlqo3K972E3iq+
	20Sl8p0WotRDH1c7j4WZ3F1S/cHxxo8nKMMD5N1rNI/uw+qCXFm8WO8XZxrCFNf/Gq8wio0z8+KuG
	zkuoolKVhpyMsDxX4lA75Tj25LqAmjBRRWnNKOrSN3JKpW/pYXYu1GX+r0gvRN4VptxhqcCRZkmh1
	2dfhkBaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp72-00000002MYG-0Z6R;
	Mon, 02 Nov 2026 10:18:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 749D53014C0; Mon, 02 Nov 2026 11:17:59 +0100 (CET)
Date: Mon, 2 Nov 2026 11:17:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread
 creation
Message-ID: <20261102101759.GF1813469@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com>
 <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
 <20261030034540.2074077-1-4ncienth@gmail.com>
 <20261030154940.GW2668564@noisy.programming.kicks-ass.net>
 <36ce43428e53d1d6e47dddb43697ccf2@kernel.org>
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
In-Reply-To: <36ce43428e53d1d6e47dddb43697ccf2@kernel.org>

On Fri, Oct 30, 2026 at 04:28:54PM -1000, Tejun Heo wrote:
> Hello, Peter.
> 
> On Fri, Oct 30, 2026 at 04:49:40PM +0100, Peter Zijlstra wrote:
> > Now, AUTOGROUP depends on CGROUP, so we can make autogroup_move_group()
> > also use cgroup_threadgroup_rwsem, such that the autogroup and cgroup
> > logic stays the same?
> 
> cgroup_threadgroup_rwsem is a global percpu rwsem and taking it for
> write on a regular basis can be really expensive.

Yeah, but setsid() isn't more critical than moving tasks between
cgroups. Also, AFAIK nearly nobody is using autogroups these days,
because systemd does the cgroup thing.

> > I mean, yes we can move sched_core_fork() into the siglock region, but
> > duplicating most of sched_cgroup_fork() in there just to fix an
> > autogroup thingy seems weird and inconsistent.
> 
> Either way, AFAICS, autogroup doesn't need cgroup_threadgroup_rwsem. The
> cgroup side has to be settled early in fork, but the autogroup side
> doesn't. Can't we just move the autogroup assignment later in fork, to a
> point where it can't race against setsid()?

That is more or less the proposal, but it rather creates more complexity
rather than reducing it.

Having two different rules for p->sched_task_group, depending on cgroup
or autogroup isn't at all appealing. Not to mention adding even more
fork callbacks.
