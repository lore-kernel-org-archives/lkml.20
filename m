Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405477;
	b=jQywjs4THIn2nOr4S23TzvUrATZEzDUVme/Bi0viyFtJc+RVtxHSNdmNgy8ronGqucFg
	 0xZUBvSVAHba/TEitukp74YaHmJobqW+BURMFfQ3pBjLJI94BczG6JkX2Yu0VRX4ym+Zj
	 iykXi1HFSgBY+F8Wm9O+d/CufqO0GJwhWGEH4zHjJfyLN2hnNZFsd5a/xu9CKHDf2esPk
	 tIWcPr37cJz6Y1sLyyiKnR/dM5UHyI8Of9RbkF+m2O2LfJwvEpHgvnnF5OOQy4lZ2d//q
	 reF/z1gtNebAMh0/rhNYabQOUIKJVacCW99BqyVmDE1FVAXIdTn6N6pBQzwraQBs+DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405477;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=n9GMvFODg18zWU/mu9C7TJ9bHfouknvt760ZwKdDong=;
	b=Gg5pfJBBLjOdjczP1K8DJEP9thUVi7QXbQCdQq7wt/Hq21bttaygXafmllnOSrc2hY4v
	 enz912hfcRpZzjhsR4ozlxF3NryYhhDr/mwxBAC5TH+2KrOORW89qPFfD4UMK6DGAMLUB
	 0p62Pya8JB4PTB2rALebvFuvYkTogWXjB42QMCXrngLIZZNc6Gc9qoMM74hB6i/7U2QVk
	 bsZC+DyEz83TF7Ndc6UlTD6ACLcvzOd3jFmFnrEza8yB2sUPMoUFooAl33lmH/DwANha7
	 prsx2FrNvyhxBhBot+Jzm5ToDgGQ9J0GNqSa6Slvofngf32pvOM40WO626M3cgrP9FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=reYF+UbF;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B4606A885
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53B4606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=reYF+UbF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n9GMvFODg18zWU/mu9C7TJ9bHfouknvt760ZwKdDong=; b=reYF+UbF0uhtnCVUJDtIXt4u2n
	vW+zZNiqKnt2Ak6JuW+H1Vg/Cc0y2gh8NTOYX5gzhuF3w115D11torYRjCsemxuB8hdDSK77+jDRv
	EUwTXl6i5YsvZSfe4o9cuGBEGHNMnit0gKxZGuZqZK5jbM4GnIcVq3SNGTMG6v6RVcKryFibTcmuH
	rFgBf4vCjvYC7E3XpSfMRQH6f3u74Hodu6y4GGy4aRRYvLMLSs7AeElyoVaQL5RpwBCv2xyRMGgff
	c7FGsYXPaxM62GdhydybsKT0awTUrYxZPPy/UEqQMjkQZ4EV+bzVLK2xklRPZiQrz4qIyFHbVQhXU
	vSe55oag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8ph-00000009CW2-22ht;
	Wed, 11 Nov 2026 13:57:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08465300969; Wed, 11 Nov 2026 14:57:48 +0100 (CET)
Date: Wed, 11 Nov 2026 14:57:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 00/12] sched: core-sched fixes and balancing
Message-ID: <20261111135747.GP2668200@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <3461bfecf6bc383facc218d56863d6c4@kernel.org>
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
In-Reply-To: <3461bfecf6bc383facc218d56863d6c4@kernel.org>

On Wed, Nov 11, 2026 at 01:46:16AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Sat, Nov 07, 2026 at 12:59:13PM +0100, Peter Zijlstra wrote:
> > The main difference is reworking of rq_clock due to TJ noticing the previous
> > one got it all wrong. The new patches might seem a little aimless at times;
> > this is because my initial idea for fixing the problem didn't pan out, but I
> > kept some of the groundwork for it anyway, since it resulted in simpler (I
> > hope) code.
> 
> I wonder whether the clock management is too subtle, and as Kayra
> pointed out on 05/12, saving and restoring the flags doesn't work when
> lock sections straddle each other, which core-sched makes common.
> Stepping back, I think the clock needs only two things:
> 
> 1. The wakeup path wants the following clock update to be skipped. This
>    doesn't need the REQ/ACT handoff. It can be one bit which says
>    "whoever updates the clock next, consider it updated without reading
>    it", cleared at the end of __schedule() so that it doesn't leak past
>    the reschedule that it was meant for.
> 
> 2. The clock should stay put across a section including while the lock
>    is dropped in the middle. This can be a per-rq depth count.
>    rq_pin_lock() increments, rq_unpin_lock() decrements, and
>    rq_drop_lock() and rq_repin_lock() don't touch it. update_rq_clock()
>    reads the clock only if it hasn't since the count left zero, and
>    that state is cleared when the count returns to zero, which is the
>    clear on unlock. Whoever locks the rq while a section is dropped
>    comes in at depth two and finds the clock already updated, so there's
>    no separate freeze state and nothing to save and restore, and it
>    doesn't matter in which order the sections end.
> 
> Raw lockers don't hold a count, so they'd update each time when no
> section is open, and double_rq_clock_clear_update() can go away. For
> core-sched, the core-wide selection updates every sibling's clock
> anyway, so it can take a count on each sibling as it does that and drop
> them when the selection ends.
> 
> What do you think?

Yeah, let me to play around with all that.
