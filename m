Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7BB38550C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460791; cv=none; b=MmiTnJ1rBGdeYlpNvjxtZnsVaEFCY/pz7eurRKoiG1Cc7gcTC3GKAHXUOzuP8odeGyRPIlIzz9hCGKS78mi75rqjiAnSICkoUVAsBbdzxz3cAakW/7++iBMDY8lRPj6xoS287SqacaSikJ++xFs99LnfBUhcueyh54VFOaVB9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460791; c=relaxed/simple;
	bh=FCYAM/+IxeOfbu8JaL0+BYZVm7VgF32pKJdWlGO2l/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1MCVaJsUfdnlPpSLatyacDh81vO6zNR3AAskE+YMOK5Ow81KD05qtZwF/dOrQPib5I+2t2hA+p2Mtil9Mr1aMh27QnQhlO7d3obO87bypnMdyevnQUHCZoLt44Mkn9BQglhmqM01REWBcW2GJ9mp3DA0HgW4DwOKuGijuITgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NLb5pd16; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NLb5pd16"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FCYAM/+IxeOfbu8JaL0+BYZVm7VgF32pKJdWlGO2l/g=; b=NLb5pd16eFlLJbxjBcDozgPEQh
	S7zrUGJy0WtXetEcCXgnNdB3oQHlu7bTJ03zzfEWpSqujGAY+uGyLgBy9bf1wkt2yYIbRWH0m+lqi
	66bimd8iwb9iYUSEmjj9dqPNwO+Sozbtho5BPj5fcwXwJSNyfsKieEOkWJf42i2A8sDaCtNiBT6no
	cUE2b90fjAYAqtml3fpUpfUcK+HevGvlGBcHnoQpUfvJFpJtMAZhAaTUbpZrSnLKf2610yXJmXs9d
	mU03g9f7kUiyT3Gu4nbbiXprhO2PzdWpwHw0asY6yCgeYyKkpzoh01cxjYNMycMKW+6mMVATnXfMq
	sHDtSjBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OUT-0000000FFcb-19Vg;
	Tue, 15 Sep 2026 08:26:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 52F7C301BD5; Tue, 15 Sep 2026 10:26:08 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:26:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Haakon Bugge <haakon.bugge@oracle.com>,
	David Laight <david.laight.linux@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260915082608.GW4121339@noisy.programming.kicks-ass.net>
References: <20260910141908.592414-1-longman@redhat.com>
 <20260914112225.GA3500130@noisy.programming.kicks-ass.net>
 <eeb26779-1423-4487-80d9-bcf6d6fbe097@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb26779-1423-4487-80d9-bcf6d6fbe097@redhat.com>

On Mon, Sep 14, 2026 at 10:30:12PM -0400, Waiman Long wrote:
> On 9/14/26 7:22 AM, Peter Zijlstra wrote:

> > > The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6ba
> > > ("locking/osq: No need for load/acquire when acquire-polling") a while
> > > ago as the smp_load_acquire() loop was causing a performance hit due to
> > > the repeated acquire barriers in the loop and it argued that an earlier
> > > atomic_xchg() call could provide the needed barrier. That may not be
> > > enough especially if we have to loop for a while before the lock is
> > > released. Now with the new smp_cond_load_acquire() helper, only one
> > > acquire barrier is added at the end of the loop. So it shouldn't have
> > > the performance hit noted in that commit.

> > You need to substantiate this *should*.

> I don't have a good benchmark that can show any noticeable performance
> difference by adding an acquire barrier. My suspicion is that a repeating
> acquire barrier can be expensive depending on the actual processor used.
> Anyway the other osq_lock/osq_unlock() entry and exit points all have
> suitable barrier. I doubt adding one more acquire barrier will have a
> noticeable impact given that it is one-off at the end instead of a repeating
> one like the original osq_lock() code.

The obvious benchmark is the one that got used for 036cc30c6ba, no?


