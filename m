Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D3517BB4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073647; cv=none; b=ZHJehzp5tWxNNf+VFq1hOY2n0IVLwVIyVAayq7YKD5BGTPDtDotr8kugjd/rTU7zv6eCf2Y8PU98ZUVvlwQYRHqIsgfqkBmfgXW8qCBYD4VrIrlQZy4K1dErvEwGOqnUEd0wFuZepuzMMpgHENW73Dpad8kwq+zO9iEKFZZ4RYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073647; c=relaxed/simple;
	bh=USIGwq9qduiXYiuF58cA/gjdaWWzRB4kkK95VSxMaBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8kWx/121uolfP7X9hjz6cOKrkIjRXt5Ti+0Mw6gg/Utr3Ozm6gY7Omt9H2+Zsnz53XBEPR/pYZ+CdHGjw3gbITWBsWai5CMfKzRBVRv7Mv+pqzFaXbprGxKegdI8XWoDlidYTOLwwwdYmk1gj3XF+1mEPTAw4OWNRkJda1nO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rv3jB5YP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rv3jB5YP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MPwi1dVbEeC1SFApmtkX9fQImDWyvlelco7O6lPC3ag=; b=rv3jB5YPxmMjWU8LIQx9JOBzRB
	xPZ1qMUL57f5lsvCDOMTybh+7nl0T5eokfYII4kW+SDvv41uph4zAMZuqTMSaBAW7f4a9m207VdcS
	fdQe5t6O/Do+Cd9zYoYBLbBZgSlSs/fsCrWh09Cuo171sPqTbaQCnjGlnwCDJDm/suiWzYj9k5IbI
	cQJM9YE/78pgeA6Mgzezvy2boqq98RGdgThyuuvAU1Hf3lVAlWVOOef62bSDl10I0Gp/zH34CrIfL
	ld99EACJua2L15XpS2S9hEcng78R1PXwCDTlcSA7cTfq1sRJwJIIbUKuCBm/L6dePy/kDq7c81yD+
	ChpWDJfg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xvO-00000008FEV-2WQW;
	Tue, 22 Sep 2026 10:40:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AAB43300708; Tue, 22 Sep 2026 12:40:33 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:40:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
Message-ID: <20260922104033.GW788244@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-5-vincent.guittot@linaro.org>
 <20260922100233.GP776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922100233.GP776954@noisy.programming.kicks-ass.net>

On Tue, Sep 22, 2026 at 12:02:33PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 21, 2026 at 05:22:34PM +0200, Vincent Guittot wrote:

> > +
> > +	vlag -= calc_delta_fair(delta_exec, se);
> 
> Should this not be 'W+w' at the very least?, ideally it would be the
> complete sum of all decaying weight rather than just 'w', but that might
> be a tad tricky. 

One crazy way would be to add a second tree, then on dequeu, set
sched_delayed (to 2 or whatnot) and move it into the second tree (rather
than keep it in the normal tree).

Then have update_curr() or thereabout advance this decay tree's zero-lag
point (rather than moving each individual vruntime entity) at W+Wd rate
and check if the leftmost entities have 'aged' out; if so, reset their
vlag and properly dequeue them.

If they get woken in the interim, compute their new lag based on their
relative position to the zero lag of the decay tree.

Definitely non-trivial, and I'm not at all sure its worth it. But it
should sorta do the right thing.

Juri, did not the BFQ folks also have something like that at some point?
