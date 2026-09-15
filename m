Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF76345EDA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480924; cv=none; b=AnUtPuUN0Fd7YmZaKsO0qUf2NNoWFpQVP2jlJtIhzo5vVHpFLB4hn5G4ypVy+4EeUN8UfjS8g/9usZwgAplURhhALD/AMsOHB7O/s86CNobTipwsWyENULwGvL61/hF+lNQXRPhRDfvfILDoARPZtCOMXendWcmsz5wmH9paeYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480924; c=relaxed/simple;
	bh=atqLn9YTZzHIsSCLFCAMch6kfGgyfpPvW5CXpOJeEHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN50jcTd0GxDyEepEJ1Hxpr91iQkkEm0/4cEKbsFhT8iCwKDh7VWuZGtAH1VtIK/2YIzUUThtSwGvJMVC/7Sw2Kdr6AO4D9Ysldzccwj5A75J0IHA2c7katfhW00BFOlRBZF7TaqvBFSnvRxVqBtyufh9qZ1TechWptc6f8Plss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EhDOoL0c; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EhDOoL0c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dMBRG/YE17xeIr6m/05W2wOiH8cDV6qURT3JG4pWQSQ=; b=EhDOoL0cqmbhj6NW3Ur14l7iF8
	45/VkFHyO8ldrChizjz5HC/ALAs/HpBd0chV+LLIHCVTLd4cUuZ9xqifZawrPTW9WPZ6TG+fKrRII
	5IERH8uG2exWiF2M6a7j5vGwoXFIniJiNLDa1kiV3GDZ01wuh1TH4/L9JtCvi4z1SpfU4dL5HAAm3
	cMXy4Q7i0Nsd7rYlHYXutPtHbPnuBvWL09wdf6Sphy2lgi1osfnn1W0jY+2nrCW6aSAQLEe4wYYgW
	zaNFCs2K0GKmDM4XfVV+/V/c0XWbbdg2HFDl0PLTBykXKJDbLj5dGB/k5AOGsWO1RDMQiT1PLe1uq
	ynRDv/dQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TjN-00000006rGx-29hR;
	Tue, 15 Sep 2026 14:01:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 376383005AA; Tue, 15 Sep 2026 16:01:52 +0200 (CEST)
Date: Tue, 15 Sep 2026 16:01:52 +0200
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
Message-ID: <20260915140152.GC4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <20260915131314.GB2009045@noisy.programming.kicks-ass.net>
 <20260915131510.GD4121620@noisy.programming.kicks-ass.net>
 <20260915145513.111c4a23@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915145513.111c4a23@pumpkin>

On Tue, Sep 15, 2026 at 02:55:13PM +0100, David Laight wrote:

> > That comment *should* obviously have been here. Also, I would *much*
> > rather have this store at the top, next to node->next = NULL; That is
> > much saner.
> 
> 
> Part of the original reason I started these patches was to remove
> the writes to the current cpu's 'node' in the fast path acquire.
> That completely saves reading the cache line.
> It also means the initial xchg need only have acquire semantics.

That makes no sense... you *have* to write node->prev_cpu, and since you
get to have the line dirty for that, a few more stores to the same line
are 'free', no?

Trying to make the code keep invariants like that also makes it
needlessly convoluted.

If you need a store -- and you do, then you might as well write the
whole thing.

And if you think it makes a difference, your changelogs completely lack
any factual data to that effect. That is, there are no numbers. And
without numbers, we're just not doing this.
