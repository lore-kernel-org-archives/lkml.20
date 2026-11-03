Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727746;
	b=mZj0vTFOCtO3aYHSu/iszeHWXF6KF21g81Cx7C6s3vq3Btp+m7STjmtZOMYjoUFkm6tZ
	 Tem71bqq3KIZKAlYOqDo/cj+8nJxCQxCCwTs1NBqtEqfBzAYwwMDd4j2PoD/YQDkccZnJ
	 wwyBFSsdpY1z9wDVpLA+VtuglXA8DbKcsotQq7mbpgykjyO7Pfr2jJEX+FxrJbSvInv0g
	 CAt0Y1LZ0RIrQERs7r2uktUa3g8SY0mW99qLq8FT/fChQqOaF0A4XipTVqsH2af6BJPLY
	 A6K816jf20DW73sZcH1kwVZH2547nbGHPnXRlt7iO1HyI7s6MDeKf6Qw+VlLv76Txsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727746;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ORp2Mvv2JQ6LsSrah8L98N/gxwqlDedxdKl8V4R7bMo=;
	b=28E4Kh5IAk9/+dVuzC3be7XQY86PN8YxxyU5hjk2mw+ecJaXFygaQEfkm7WQM+8C70M3
	 1NkwqiKCFuZw2FWfO5vm8/GOQzRVyPVIhS+5ljIcI7/DJSSllkP5G01EdJbVQXw6gw2Dj
	 nfR5AxRh5am162heQO0APlrflIPKcczJq8kKo3PbphXYvn5HRlc23tVyqaXS5nh8VKKdh
	 je5aZwiXEMPXZ6ZX0Ao2rQ5cTzoeNvxIj/jU+udBDc8bX2cwdkAYlHG7sUeN9lMpry+fT
	 trVb9GdoJm6qrx4Bts7I4WwhNHERf7a/rQBQUn3TZ9o/eqxy3cpI55izSJ5D3kyNELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvkTJYtM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C79606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvkTJYtM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956061F000C1;
	Tue,  3 Nov 2026 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793727745;
	bh=ORp2Mvv2JQ6LsSrah8L98N/gxwqlDedxdKl8V4R7bMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EvkTJYtMA6hYKnzmbPt/LFBkpfNJb1i1c2bDhElKx4UQvD20J7P27a0S6vX4pAn7q
	 f9oJlO9V2JCfgxH56hF0L6NXCNF0H1AJPKcOJRWREYd/IWuEkKqRBgwbpn7TPd4Ia/
	 yPkYls7uK+mF+RK67tibhc2TghIpf6RtZBo44Rdz3wOmdszSPlNxpOaJ2wKKogTiqV
	 oZX7SuaGUHsTjpzRLtcq5CAsOH65p5Q+RxAlJzXb7xjFYt5sjNHTtszT05bVj2n8pR
	 nDRGb7devXgqtSnqQoFktgMavWYRGHE5I4xtgHqHfH/mfH6CNoxu2qk0Ratjy0cYFB
	 vm9aH+jWeUiVg==
Date: Tue, 03 Nov 2026 07:42:24 -1000
Message-ID: <477c7b868652b4d9152ef61c4c94fe16@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread creation
In-Reply-To: <20261103114557.GJ1813469@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com> <20261026115707.GF2668200@noisy.programming.kicks-ass.net> <20261030034540.2074077-1-4ncienth@gmail.com> <20261030154940.GW2668564@noisy.programming.kicks-ass.net> <36ce43428e53d1d6e47dddb43697ccf2@kernel.org> <20261102101759.GF1813469@noisy.programming.kicks-ass.net> <705081716ac8615650a0cc4b668689ba@kernel.org> <20261103114557.GJ1813469@noisy.programming.kicks-ass.net>
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
Content-Transfer-Encoding: 7bit

Hello, Peter.

On Tue, Nov 03, 2026 at 12:45:57PM +0100, Peter Zijlstra wrote:
> Now, using cgroup_post_fork() seems weird (also, I'm not sure if this
> calls cgroup_subsys::fork for *all* controllers, or only the enabled
> ones).

It calls ->fork for every built-in controller that has one, whether or
not it's bound to a hierarchy or disabled with cgroup_disable=.

> But we can easily move this into sched_post_fork(); all we really need
> to ensure is this happens before scx_post_fork(), right?

Yeah, that works. AFAICS there's no ordering requirement against
scx_post_fork() though. sched_move_task(p, true) skips
scx_cgroup_move_task(), so the autogroup move doesn't invoke any sched_ext
op. tg_cgrp() maps both root_task_group and autogroup task_groups to the
root cgroup, so sched_ext sees the same cgroup either way. What matters is
that it runs after the task is on the thread list and before
wake_up_new_task().

> +	if (READ_ONCE(sysctl_sched_autogroup_enabled) &&
> +	    task_wants_autogroup(p, p->sched_task_group))
> +		sched_move_task(p, true);

The p->sched_task_group read races with setsid() and cgroup migration.
Maybe READ_ONCE()?

Separately, there's a pre-existing misplacement. If setsid() lands after
the new thread is on the thread list but before cgroup_post_fork() links
it to its css_set, sched_change_group() sees init_css_set and puts the
thread in the autogroup, or in root_task_group with autogroup disabled,
even when its cgroup isn't root, and it stays there. I think this should
be fixed from the setsid() side.

Thanks.

--
tejun
