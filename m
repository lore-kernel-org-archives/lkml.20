Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D84457AF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544856; cv=none; b=evXfVO2UGVZpZfbqGC4I5N8nsRli8HvlcCKG28D+BnphGusRCv96w/KEIeCaSSNGuEGXRN2dEm+GrK3+NvW6/MAAfCaiCdKyAFCc6eQIiiYmLxHHbVIth2GAGEW1/xnD5FQCVTs13prnS4Zhl1sgo1iHIP8p5jtS6dHP30dXIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544856; c=relaxed/simple;
	bh=qgKS7dxZ54LH9TyyMA3DN7DTKS1t5qTApglr9V4IyGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erw2Li3NGgEnBI4vYnwnm6DNpseXbY3sox5qJ4MdfofO3mLvo9CwXr3dCSC7NA6hw/zwBW+4Ht8DFr0G6XWaN03r9WQhvAJKnW3RKuIyWXDD5EqviycQT2330e8RfZd1nU87Y97g3lRcgjFWwCWL10PWP6TenyqNcwHpsn4LtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KkYSaVSk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KkYSaVSk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hkwACd9EK0Y++fkR813YuVyjEpvlJRaFChoIQ/KealA=; b=KkYSaVSkHMPgqpuGxxzd0QAkQo
	7MkKoACsU7bKi2ZTEAXxyNU1er0yvlWDMLjC7q2HqjMS20n4fNJPsn/SPTZ+7qol7ZQ+aP8H82v8P
	UiCvkvui1pFj1udS8c/HK5zTYhxpPF8oBoFZ5jfl/OVE4KWLYS/go3Vinj47cFE3rp99T9s4elVid
	cme3oa3my5R/puhVSy509FdopQr9/Bq3TD4jIMcUUHXM6VwB0004NUdRloEXOmhtJhYXDNhXJMSxX
	DmQV2Lo9OJY8aetHsERPSyyAs+/lQIq4mxSWQ3rmh4P1q2T/xOiG9TREUwevRvvNGkCtx3BmaNpYZ
	yin29csw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kM4-00000007azi-3w0v;
	Wed, 16 Sep 2026 07:47:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2BB2F3012C6; Wed, 16 Sep 2026 09:46:56 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:46:56 +0200
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
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260916074656.GL4120091@noisy.programming.kicks-ass.net>
References: <20260914202102.551333-1-longman@redhat.com>
 <20260915082655.GX4121339@noisy.programming.kicks-ass.net>
 <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>

On Tue, Sep 15, 2026 at 01:53:05PM -0400, Waiman Long wrote:

> In your comment to David's "locking/osq_lock: Set prev_cpu=0 instead of
> locked=1" patch, you suggested adding smp_acquire__after_ctrl_dep() after
> finding that the lock had been granted which is exactly what the change from
> smp_cond_load_relaxed() to smp_cond_load_acquire() is doing. Right?

It is similar, yes.

But all I did there was restore an ACQUIRE that David lost, silently.
That loop exit condition was smp_load_acquire() and he made it go away.

Now, you're right in that we can probably survive making it
smp_cond_load_acquire(). However:

 - you get to re-run the numbers from 036cc30c6b6a to show it doesn't
   regress

 - you don't put on Fixes, *unless* you put in a solid argument showing
   what is broken how. And so far, nothing actually needs this ordering
   because osq isn't actually a stand-alone lock -- it was never meant
   to be.
