Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7150472081
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461654; cv=none; b=iHYHhcvkCA8iMYWyJJk9SzKBzCkWAv6+/OsD9jyQQZAMJXNYcnTrJyzQGxvFTfETAWIAbBFhdES69P7HB7rKMLyxAnIMzZLxnNiVrIh54uxfmrnn7jKu6sbj2qz3pDyKpmubzX427+x1GliGAkkb2WfCpAI51/laRTwe0q/kphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461654; c=relaxed/simple;
	bh=1H2C+xlCW4YPQ3HVe+N/EXdhKLaNvF9cgHQV4zIKcPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I680i3WtjQ1s4lJNZHIDIUp5wswNBAYgNpt4CPc+JvgS+oCK2iNuavquC6AB/h1U2MkCHBPj7Gvu1fP9G46QW/G1sMHc19TdwRA6lsapGcLrIjO+UkptSYhyi1g8DlLis99vKiYSjnKYmIZCUEmt/hhVDsyKs8zyF/l1dFVDV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XkY5nUZ7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XkY5nUZ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jABC/jOzBZVbCrRD3hAyTtBBgrGnvhnmrIGZHtQ5piE=; b=XkY5nUZ7Q93cuW2/Vc+5xrlCVj
	Ht+IGhtFojG4GECLym3E8yVHdDtzA3jVg/SQP5uPrmRp7XVzgMyxM0+Y5iDk6NzCLTvHhdjEWKfvY
	nfOWTtDUyLaTsWrFylirUyGMaH6HzOKru7nIJPAkygU489SBJg6W2MTqTEe6o9fqMRmgiLnrzddOs
	JpUXlZGdAM5Jny3Kx8/xTqFAH9z7ifGDRprTmgI9x3ksutpqFUzM9u+p95JNgHNCrBPXSjVvjkdfP
	hrVV2mKr2yXqmBaq33BZ+dZ9ZYn5mHfGvVYyZXiXEoCe+00UUUMBRROiqSy5RxJ4snl9BTQQGtucg
	IzkYTl7Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Oie-00000006RW0-1IKM;
	Tue, 15 Sep 2026 08:40:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C3C4301BD5; Tue, 15 Sep 2026 10:40:47 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:40:47 +0200
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
Message-ID: <20260915084047.GZ4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <20260914120352.GE3500130@noisy.programming.kicks-ass.net>
 <20260914140832.676eb1ad@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914140832.676eb1ad@pumpkin>

On Mon, Sep 14, 2026 at 02:08:32PM +0100, David Laight wrote:
> On Mon, 14 Sep 2026 14:03:52 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> > 
> > > -	for (;;) {
> > > -		/*
> > > -		 * cpu_relax() below implies a compiler barrier which would
> > > -		 * prevent this comparison being optimized away.
> > > -		 */
> > > +	for (;; prev = READ_ONCE(node->prev)) {
> > > +		if (!prev)
> > > +			/* Lock acquired */
> > > +			return true;  
> > 
> > This lacks {}, but also, is not ACQUIRE like the return you remove
> > below. Did you want smp_acquire__after_ctrl_dep() in there?
> 
> I need to get my head around the acquire/release logic.
> I think the READ_ONCE() in the for(;;) needs to be an acquire
> (matching the smp_cond_load - which seems to have been wrong for ages).
> I may have decided that because the smp_cond_load was relaxed this
> read could be as well.
> (They both need to be the same.)

You cannot change ordering and not mention in the changelog. If you're
unsure, retain existing ordering and make note in changelog.

> > 
> > > +
> > > +		prev_ptr = decode_cpu(prev);
> > > +
> > >  		if (data_race(prev_ptr->next) == node &&
> 
> I'm also going to remove that 'optimisation' check.
> It is there to avoid the atomic below - but it only fails under
> race conditions.
> 
> David
> 
> > >  		    cmpxchg(&prev_ptr->next, node, NULL) == node)
> > >  			break;

Someone will put it back eventually. It is typically good form to have
this pre check. It improved the contended behaviour of these loops. The
regular load can be a forward, while CAS requires an exclusive load --
or something along those lines.
