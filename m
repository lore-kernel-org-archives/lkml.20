Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793404602;
	b=uw7Rklrn2bwqbBg8v1rTBH2U6CcWaaq8X801zeRX8MB0sj7MsJrXocxiHfr2dH9koPeM
	 GuCNa+gkeac5t4qwviG8M+KlVjmdGueZ2UZgqJ6kRTyhPC2TEZp3cFqrYFlQ6O77DCHi3
	 neQHlUxP+N9NRf60rBtt6I/AcmdOjbQly2ApF7V/j8TI7DmGFsM/CXThCbZM/jyoiF1II
	 uYFY5jGLlFfqxcpI7b/vtbuh7VPuGeg2SmjDYGI6c2Sdw2M4Ie7jGKGs+JFsAhInYdgv2
	 IeUvNsFaLVhTaFyO+L8Q5a1BvWbIdCep663iH3hMabr4sym5Y9/A8WyF2k1UROSqFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793404602;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BDaHsLTeFS9uNn3ux2fwusgfE2J5PsxVZUwAq3RoQ60=;
	b=InmaIEE4GIpFzjoAorH88wsgC34JLem03HDDluqD6+ut2kyP2P9gHgU7BrcVC7cFwfVU
	 H56y7dlSZRLL/YCv3LQ8/8WiqenHlfK+IrwaGwsHzwdwWTwETcnxtPDkgd8dMpw90V18f
	 C3bwuJtvi/yC+PaVGNy44QcDkiG0LPrkE/VfWt0DB2Vywx6D5hIdMeL1s45QpWwLJ+pwC
	 RmQh8cTJ6q9BfzumEHuy4MoORZR/7aziHQKRmmnFdStwSp0ZAqaW3pvuJBH3uuDKV8hwm
	 RF6xc7+QHsvTl/efX7ll96XUyO3RMDhKkGq0GL+Tj92Y0qjYzG9ZK3/OzG/dEMlpNww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3cWys8N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9EA606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3cWys8N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4BE1F000C1;
	Fri, 30 Oct 2026 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793404602;
	bh=BDaHsLTeFS9uNn3ux2fwusgfE2J5PsxVZUwAq3RoQ60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3cWys8NzRoR5iji4VbwnppP2F99hQ09nWZ2HYE+r0avE7eTlictybnZyKKAwL5kZ
	 fJHD9+5VXqMHbofiQzrm0wGvGx8GiEBtL+AhyD53fY5PqBQWsAdfGmwIDs2/SnrnSI
	 tE4g4FQtkLP1D0ayza/GkEF4Q5h7Mpk2OzpqvAPkCqXjjoSMjFC99mpXQNsMxFzh2X
	 UIc4tt3snwnZw9HwgJYT6TWS03nimGOfvfPEblWg2yDoHpLNW5lL9f7/zeEaN4MdFt
	 h/FvI6hZ7XBVO/kLZlUaTBuEAdvb5XsPUOwzSKqjP+WpInh1m5yMnw2f1wc+OatjOB
	 j+uez14nOkGLg==
Date: Fri, 30 Oct 2026 13:56:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched/urgent] sched/deadline: Fix stale rq->dl_server
 after a server pick returns RETRY_TASK
Message-ID: <auUuuJnEI3HWkwYA@slm.duckdns.org>
References: <20261030221842.4071610-1-tj@kernel.org>
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
In-Reply-To: <20261030221842.4071610-1-tj@kernel.org>

On Fri, Oct 30, 2026 at 12:18:42PM -1000, Tejun Heo wrote:
> __pick_task_dl() records the server in rq->dl_server whenever the server's
> pick returns non-NULL, RETRY_TASK included. __pick_next_task() clears
> rq->dl_server at its top, but a RETRY_TASK restarts the pick below that
> clear. put_prev_set_next_task() then hands the stale server to whatever the
> restarted pick takes.
> 
> Since b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()"),
> fair_server_pick_task() returns RETRY_TASK when the newidle balance released
> the rq lock and a higher class task was enqueued meanwhile.
> 
> That task, an RT task for example, then carries the fair server in
> p->dl_server until it is next put. The RV deadline monitors see the fair
> server switch in with it, and core scheduling, if enabled meanwhile, treats
> the task as deadline priority.
> 
> Don't record the server when its pick returns RETRY_TASK. The restarted pick
> records whichever server it goes through, if any.
> 
> Verified with a synthetic reproducer.
> 
> Fixes: b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()")
> Signed-off-by: Tejun Heo <tj@kernel.org>

Ugh, please ignore this one. Sent out the wrong patch. I'll test Juri's.

Thanks.

-- 
tejun
