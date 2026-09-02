Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372126D4C3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337214; cv=none; b=VbgzfaIxYzgN4SRWOgj9XaayHoJjiTgjYxvdBwZe1HPt09YKwAvOTU+cniaVP6Gae8DQZPMzhR3X/XPDYQIxHwjfIw8YG2pSf7dWKUCi5Ti2h+4zz/to31jBgjK7nOFC0BLlPQNf0+zwEPHBGBBMiDtpLV7f8Lmu0BVpWrOOp34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337214; c=relaxed/simple;
	bh=M55R/2cKFReZga6OrjtKFDOsbXYxom0KR7bfzQy7rx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsl1PZAff7G/8d8v5PNJ9/seb++XWLHhAB7SYbkuIkqH6a5QXTd7l8n4uJm+q5tz86zehQf7H5JaUx9JuMJIAKYm2zolz3l5pa96cyvyMM+tN8ByQeKM7GvpknQlxrff0F5uyFZEYfCNh9nyB7Nv21QgPw0i1WDTQ169MiKKd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lPM2CzwX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lPM2CzwX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9L2kS0Z8E+y+zU+XrRyW/JBaPTew5e3REOgQZp/zDuc=; b=lPM2CzwXI8vWcK1LGOjO25K+Oy
	vN7j7cQXO2DyPJRGdVxUJE8K6qRvJAnfSc0hGtEm5/BAhUO4bLYaTvqe9ziag3XqOK6nYACFsW0K/
	/M5iVg2rmLOyUzBE9rr9PdpzWAyPa+0Q9jvLGJ5k2Qc3BT9mRfheN6SBresBY1lUZdPDIeK4nSf1o
	kNdl6S54rCYMtBREqtrk4hG4MSNEP54qhHpnKOtTW0e3nYQsJ77u8cJFR1lsAS5EG0qKWpDRhY14m
	XfdSpB+pTcmR62EsXddEHbJnlGISafyRYVAXr+NFHLuIasTLPcWfn/xq13t5LoQYsd9Yqt8gWvvTR
	lO9p6ucw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1gCM-0000000Bjln-0gat;
	Wed, 02 Sep 2026 08:19:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E677930026C; Wed, 02 Sep 2026 10:19:55 +0200 (CEST)
Date: Wed, 2 Sep 2026 10:19:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jiazi Li <jiazi.li@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] sched: Move some scheduler fields to new static
 branch API
Message-ID: <20260902081955.GT4120091@noisy.programming.kicks-ass.net>
References: <20260819080932.11564-1-hongyan.xia@transsion.com>
 <20260819084438.GG1247881@noisy.programming.kicks-ass.net>
 <c29c0e12-8e31-477b-b9ae-162632bf1cfb@transsion.com>
 <20260819092803.GH1247881@noisy.programming.kicks-ass.net>
 <b61b830d-4c6f-4c35-8b8c-1adc4340aaed@transsion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b61b830d-4c6f-4c35-8b8c-1adc4340aaed@transsion.com>

On Wed, Sep 02, 2026 at 08:18:04AM +0000, Hongyan Xia wrote:
> Hi Peter,
> 
> On 8/19/2026 5:28 PM, Peter Zijlstra wrote:
> > On Wed, Aug 19, 2026 at 09:04:03AM +0000, Hongyan Xia wrote:
> >> On 8/19/2026 4:44 PM, Peter Zijlstra wrote:
> >>> On Wed, Aug 19, 2026 at 08:09:38AM +0000, Hongyan Xia wrote:
> >>>> From: Hongyan Xia <hongyan.xia@transsion.com>
> >>>>
> >>>> __cfs_bandwidth_used uses struct static_key directly which is
> >>>> deprecated. Fix.
> >>>>
> >>>> sk_dynamic_* uses static_key_{enable/disable}(), which aren't really
> >>>> deprecated, but take the opportunity to move to the new static_branch_*
> >>>> APIs to be consistent.
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> >>>> ---
> >>>
> >>> Your emails are encoded in a Microsoft special quoted-printable that my
> >>> scripts don't like.
> >>
> >> Hmm, this patch was sent through the normal git format-patch and
> >> send-email flow, which looks okay on my end and via lore. Do you have
> >> more details so that I can debug and avoid triggering future unhappiness
> >> in your scripts?
> > 
> > I think I fixed the script. But what the thing did was encode '\n' as
> > =0A=. This is two tokens: "=0A" for the '\n' and then "=$" for a
> > continuation line.
> > 
> > It does this for every line, including the last line. Marking the last
> > line as having a continuation resulted in no output, it would just eat
> > the whole message.
> > 
> > Marking the last line as having a continuation is well, bonkers. But my
> > script should now be able to deal with it.  Still, pretty idiotic
> > behaviour on whoever mangled that.
> 
> While working on the latest sched/core, I noticed two of my patches
> 
> d92d1a182dc2d5dc5e4418765739f56bcbde806a, and
> 087b40fe5934e4b8aa80b29b3debbd6542756ffd
> 
> have both changed my name into
> 
> Author: Hongyan Xia =0A= <hongyan.xia@transsion.com>
> 
> While =0A= is certainly a cute last name, I want to ask if this has 
> anything to do with the Outlook fix you mentioned last time. If not, 
> I'll see what else could have gone wrong.

Argh, sorry about that. Sometimes I fail to spot issues like this. Let
me go rebase those patches and fix.
