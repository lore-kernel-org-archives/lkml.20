Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23963368D4A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478115; cv=none; b=MDWkcBRw4fQgRmS+sIIHnzdTPz+slozj3arCFBOpatpp+cfdXUKjJS9B7VOWm1BGT5Ko6nsvcW2LntAGWnaJa+dG9KrXOZS3LWKcSDcip/mO4dlOyDZ01rLrE5R7wYLX5AxqX50q0ignBhcY8PwJjwd3OME87NWIBJmFaMo6BDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478115; c=relaxed/simple;
	bh=1fAqN2Hmj00mBN2MauPqVpeRsaDH4ENoIOT9+clisXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJJZdZus2Yx1GLEtLGjDReC0CZfi9FzUUP7cuMZrF4PmWgVpOyOF2N9zeMO95vULlD900sQzxOsKIJP1b8HfTFsyYHrokvvwmYvLGTpnFV12/fLJwdpHTHy2BbPvoDbblW+1vdrycD5EHivkEeeChI0MLFaRKCgjX4WoxNEY+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=udvVsOLG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="udvVsOLG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x6mNe2qU+brDp+XEHWP0KkrYWNUS60gvoqvnxlNQ03g=; b=udvVsOLGWUIsGvtAj/GBFJupXO
	Tq0AY+0s2Ije803aaqEz0ZIjzlSnQxmXchmXz05VpzF/ve2HQ9W/1kCH+BmUTYBvaHdIvznBO28Im
	mddjMbxls/O2XVRAFyDXnSwlQ7taMYqX291PTDGWF6KM+6vUDVrlSUe/3zRBUKkudUajrjSQTL/rc
	IGD8LrKINAvUUNl0DIn4B5LSEJm3gtHuO2Odg5L+6FeUhAFrkui8WU3MbHjrP0Et6PQULhatWcVAe
	SZ7wTetlAyOQSB1FMD/mOjCUxgo3JRAz52mjZryNJTkKDWUb7vMiGOP087Q/yF+hjxi0sO5hblzjs
	/5IXd4gQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T0A-0000000GA9I-279V;
	Tue, 15 Sep 2026 13:15:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 14EA4300969; Tue, 15 Sep 2026 15:15:10 +0200 (CEST)
Date: Tue, 15 Sep 2026 15:15:10 +0200
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
Message-ID: <20260915131510.GD4121620@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <20260915131314.GB2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915131314.GB2009045@noisy.programming.kicks-ass.net>

On Tue, Sep 15, 2026 at 03:13:15PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> 
> > +	/*
> > +	 * If 'prev' tries to remove itself from the list before we write
> > +	 * a new value to prev->next it will spin in osq_wait_next().
> > +	 */
> 
> This comment pertains to what? 
> 
> > +	/* Invalidate prev_cpu matching osq_unlock() */
> > +	node->prev = 0;
> 
> I'm confused, osq_unlock() does no such thing.

The next patch adds a comment stating that this store is not strictly
needed. And only serves to ensure node->prev ends up being 0 in all
paths.

That comment *should* obviously have been here. Also, I would *much*
rather have this store at the top, next to node->next = NULL; That is
much saner.
