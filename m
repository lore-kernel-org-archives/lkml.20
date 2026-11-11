Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392907;
	b=OCPzTGWUgyyzQ8z25KVl1EIt46OgMtepFVu6Vl/WgEso8pirDKIE2YBHgvhkY/ABnFoj
	 8vJIwJL6+pesY8vPuAvFN/t7+WbBnkIjxNDYdxmdo1evaGBdLrkN7icPF/vDrRRH59rvb
	 K+XbN8m7ebcaAiXXSvBiYv9kP70mJKixe4/AHPc2gRcG+neHugYEbxI3v66EakmiPKzQL
	 EJ7IxNtjPQ0D4ge2tehwzC01xvMd3kCEehzz2A2jTfYNSvOoqwuMwhuIOpTIca5sCv1mK
	 BUnGDEij8RHzhv5Rp7yf/QO8O5QK2ddPcCNad1SOdxUt1oFc+yykLsTxqW+SWYCridQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392907;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TFQAtw2bHUiyoK/CSmtS8daD/f7tLYiZ9TxppAyT5oU=;
	b=1xf+2xIxIxrooq3I8yqlzZWma/wVTWybl5Cz9CDbgnra4PCAtB6QlTUxgT7DGTlcW3sg
	 X8Bl60zEJjbOvxKHEVOM2voDjINyIkzSL//kykqHSil07er9yHzPix8sDr7AQN1xd14ZY
	 YYjp6CbgEuzPmJ7emeYC2J3pBNxvGTspQy9370lqFbcrdYTzsCQbkuZ2zlli2n0HrAUnG
	 0+7KJzpScQZ6kXmdE0GLXpaVi4TlWPv6a7X1DLJ82e3pb68GiIyo1S6cmWshI/lLSbUiL
	 FOBcKhxQuAErr9fS8B8nyZ7x5Cemv5W9ORZxZiGhbFkuwStNHYJzjVxc8BPoZ4VEqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ECBU4HW9;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D4606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01D4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ECBU4HW9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TFQAtw2bHUiyoK/CSmtS8daD/f7tLYiZ9TxppAyT5oU=; b=ECBU4HW9Vzch+XVnaztWXtqeDZ
	BnF9Cov4Xv+pSMdwoaLmFdd23b+KLQYQfdkueDrRpWAo2z98SxWC+RvY9ECzjC8yA+m5bbgu1yZXc
	3ocEW4GjvPk9POXL8VLV/cqTrlwMxF2UnjQCKL+PkQ++uScfgAGDvCz0tKF63v2sLmmKAcTh8avl4
	HP1sb4ekcMX0D5Flp/E3muIMQc9jn5JQ5cEv3PdiKE/YDXoXPm+1i2UDzWD5R8LXT4N4UMMG0g31H
	wQfSvpge6n2s0EGd5JI9zeE/WnSXnlJC3vwWhvP08/mY2YgwrZP/1/8npYrcP+2l37TfCjLHsZ5Ne
	r+Yd0bKQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Yw-00000008XPN-1bVO;
	Wed, 11 Nov 2026 10:28:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FB6430025D; Wed, 11 Nov 2026 11:28:17 +0100 (CET)
Date: Wed, 11 Nov 2026 11:28:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 04/12] sched/core: Make __update_rq_clock() skip
 updates on UPDATED
Message-ID: <20261111102817.GN1779021@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.126979364@infradead.org>
 <3ac37e055b66a46f72edd235f1e93f5f@kernel.org>
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
In-Reply-To: <3ac37e055b66a46f72edd235f1e93f5f@kernel.org>

On Tue, Nov 10, 2026 at 03:11:28PM -1000, Tejun Heo wrote:
> Hello, Peter.
> 
> On Sat, Nov 07, 2026 at 12:59:17PM +0100, Peter Zijlstra wrote:
> >  static void __update_rq_clock(struct rq *rq)
> >  {
> > +	bool update;
> > +
> >  	lockdep_assert_rq_held(rq);
> >  
> > +	update = !(rq->clock_update_flags & RQCF_NOP_MASK);
> >  	rq->clock_update_flags |= RQCF_UPDATED;
> >  
> > -	if (!(rq->clock_update_flags & RQCF_ACT_SKIP)) {
> > +	if (update) {
> 
> RQCF_UPDATED is cleared only by rq_pin_lock() and
> double_rq_clock_clear_update(), so a path which takes the rq lock with
> raw_spin_rq_lock() inherits it from the previous holder and its
> update_rq_clock() is now silently skipped.

Let me look at that specific case.

> Previously, you said to clear on unlock. Why not do that? That'd be less
> confusing overall.

Yes, that's what I tried, but it doesn't work for core-sched. What
happens is that SMT0 and SMT1 interleave and things go to hell, patch 6
has that picture.

That is, we can still clear on unlock too, but clear on unlock alone
isn't sufficient :/

Patch 6 even has the clear on unlock, but commented out.
