Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582707;
	b=KGpHhWJ8krYEin/D5FmoKaPx2IKMIfYZL/2qolsropp2eYuSDMvfFd+tKWQEWduE7eDH
	 LS3wZHnAXrCnoSWvl40c6wk8bj7QPHzDSF9H6Hj8EpS9/5D6r1Z/knOAeIEGFlr4t0ivT
	 gwHtVUdFZ3Pc+5RvOtSvuTEnJCdnSs67zyJ/auEcGohSYhRPbnNP/cG6WbIg5dJN9sI05
	 G7buq1Kjrehv7yk6GKVHhOw+yYdRkQYi49ZPuOBYhUJ9v+CZFpm42/kxyM3C+ayRhDfib
	 3KQ6mNsVQ1w/XUQXelMsCHEDSF3x72QCqK48g1vtZBhe7d+ocrR5K9mVT2jCp3RF7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582707;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PhZrpXSWKLob1K6iXcNzbngtFju4yYIYv30ukHeiNmQ=;
	b=q9/nmMx0Gnzo+Ube2MwRtlplLhKhEoU42HMnF8+8wlHEqWUjPajSiBaoc8r6KFl2tmC3
	 P7hwiknzdb1d90MfccglEiJNDloxSQ1tSfgBVIFDyvo8zgGXeGRTBkUnDOcAwTzfviFC+
	 mQ5dymgWK/W0HclQg2J2qHjpNnyNzVff8T69fcG/IgqFs+CnpjjclFedpAFiIaqPDH8iq
	 IGNYQC2syz1hCnEMLWaieH1RVdl3t0un54gTbmzCLbKZCWCbD2cPn1a81dFfHZO3p/4QP
	 GJbHC8Nty+E4/Yi5lCbVt5ptKSGbFtwTPAT/Cb8XRSFkVo0Ajs2UNOMiPB5aSPkWdJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M+8Bfdny;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6A606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A6A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M+8Bfdny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PhZrpXSWKLob1K6iXcNzbngtFju4yYIYv30ukHeiNmQ=; b=M+8Bfdnyb5EJydi7DJAAI6YKwu
	Yjol/jpMtLRNedssTU3jtRukt6CxH1F+Jo76NWNYCHJ4nMp1OvqYwRck+K/8HfHAkEyA+8VuDwzXg
	QKFusQUugTRFKfKtSB/Qw09AevVUsJdd2Nsw+N58pPqKAb+X/j5gLIJPDzYpEzXavwVMUeL4ntHG5
	IU7F671CSYQXQXVNnB7nVHqqYrK1Q8t3zMZFLKbgxNL1o3209E8cnw2dVeygDrKw9az/KZ4YH+tCd
	GZuoPZx4mRXCi6k2etFqS0SkYfNFHQcQlBSYgCskl0uPcEhO8zwH+GRSjFHfd7C6iXueizsbhVlpX
	cO4UpmmQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUdz-00000008rtt-2yqs;
	Wed, 21 Oct 2026 11:38:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6EA413007A4; Wed, 21 Oct 2026 13:38:06 +0200 (CEST)
Date: Wed, 21 Oct 2026 13:38:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: John Stultz <jstultz@google.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Qais Yousef <qyousef@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Wei Wang <wvw@google.com>,
	Patrick Bellasi <patrick.bellasi@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
Message-ID: <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
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
In-Reply-To: <20261020152933.16989549@gandalf.local.home>

On Tue, Oct 20, 2026 at 03:29:33PM -0400, Steven Rostedt wrote:
> On Tue, 20 Oct 2026 11:53:47 -0700
> John Stultz <jstultz@google.com> wrote:
> 
> > Maybe should the jump_label_update() logic be using something like
> > stop_machine? Or should there still be a conditional on key->enabled
> > in the unlikely case to make the behavior consistent? Or is there just
> > something about the uclamp usage that is off?
> 
> There's never been any guarantee that all call sites would update
> atomically. The first user of jump labels was tracepoints and I really do
> not want stop machine involved with them.
> 
> Perhaps we could add an api like static_key_enable_atomic() and
> static_key_disable_atomic() that would go through a stop_machine() and
> update everything that way for those locations that need an atomic view of
> the updated jump labels.

Argh, no, we do not want people to 'accidentally' add stop_machine()
usage, which we then have to spend tons of time on removing again.

And yeah, its always been the case that jump_labels (and static_branch)
updates are non-atomic. Most of them are init time, and don't care.

Now, I'm sure we've ran into this particular problem before, and it
always requires care.

Also note that a simple global boolean has the exact same problem.
Adding runtime conditionals isn't going to fix this.

