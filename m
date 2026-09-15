Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92E466B57
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468809; cv=none; b=MBX5oaPiCgovDPwApEhdkeuTH0SaRnXVjNdcAZa3vq4dBPb59PY1/23GPhXA4KcJM1Tt6W2JFUxYWS3JGsIiPqTAKXZ/f08nMC4TPu1yXpEJA+GwVnSTd4O9pfxknsPBYVErQYRICqp0ZXNMLjMETd+hGnA3RxdnBSyykv8IRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468809; c=relaxed/simple;
	bh=NIraYXDp/fxyqxO4wzrCLlq1kNorvdh0ECMaqNqvvkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djNEj0AndHON7BdMNaBi21AQbX9OMPmdMYlaKwOP8wFVBOzC6SUwPat2jf1LXr/z+St+nmNM8eyC4eteqEWxn+LnlaO8nxPp7ftOp08yXS4dODuDDAuqYKHRDx0z1+Icp3RLawM/eAWqFErep6stLC/JubJ9JFthORxQvRwnid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=evWLG7jV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="evWLG7jV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BuKhZrrtNARqNYZKtU/QHngxbkcBqdtJrV5U3gN/9XQ=; b=evWLG7jVrdUKv2Uify52b9PWAK
	2I174IflCvi6rSWLyL8d0m3+PKSnXieHV83yXk6NbMJZw2Cse/9O35Fa8DXBbn1TuLZhxV5dOwuld
	2dEuXq+YOoFSsa5prvaMo4hAsOjFpelTbHHWAojqkOGvylQ6ipy0ix1tMyNBUMTKLeWtwYZXow9Xm
	hzjCNqVELDjEKG4T4Kopm0qxe+crA37IlGoWyUyjQy7T1EwXfSdiuCgeoONNyPj7Jl34iS6u8JbQn
	ARh3BDAcXVuNJqTwJ9XgITeBhVZEMDS0wpHwEIsFFhAYDsjcBjnYctIqMhG8T5FZrAusbl5tsWwZ4
	aaB9ZvsQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qa2-0000000FhFf-4A5I;
	Tue, 15 Sep 2026 10:40:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D638300328; Tue, 15 Sep 2026 12:40:02 +0200 (CEST)
Date: Tue, 15 Sep 2026 12:40:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915104002.GB4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <20260915085013.GA4121339@noisy.programming.kicks-ass.net>
 <20260915112058.309b5317@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915112058.309b5317@pumpkin>

On Tue, Sep 15, 2026 at 11:20:58AM +0100, David Laight wrote:
> On Tue, 15 Sep 2026 10:50:13 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> > > There is no need for separate prev_cpu and locked members of
> > > struct optimistic_spin_node.
> > > Using a single field simplifies the code slightly.
> > > It also removes any possibility of the two values being out of sync.
> > > 
> > > When cancelling a lock request explicitly set prev_cpu to zero.
> > > Nothing actually looks at the field, but it means that it will be zero
> > > after a subsequent 'fast path' osq_lock() call making things consistent.
> > > The cache line is likely to be dirty (or be dirtied) so there shouldn't
> > > be a performance hit.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---  
> > 
> > 
> > --- a/kernel/locking/osq_lock.c
> > +++ b/kernel/locking/osq_lock.c
> > @@ -170,10 +170,11 @@ bool osq_lock(struct optimistic_spin_que
> >  	 * is per-cpu data the memory can always be read.
> >  	 */
> >  
> > -	for (;; prev = READ_ONCE(node->prev)) {
> > -		if (!prev)
> > -			/* Lock acquired */
> > +	for (;;) {
> > +		if (!prev) {
> > +			smp_acquire__after_ctrl_dep();
> 
> Do you think the equivalent might fix the existing code?

I am not sure what you and waiman are on about. The wall of text with
that commit did not contain anything resembling a solid description of
any problems that might need fixing.
