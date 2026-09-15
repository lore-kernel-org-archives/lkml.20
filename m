Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C5519D07E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449624; cv=none; b=h6mOUUmMOuLaj7N37sRBglDXuQXdSBRtlvWdeN346ahwz6asEXWzegcGH9CP4hEqonKUEnlVXFu1/toIYYcduP/4ROb/hjVPrEuJF/e8keTqMgbZ04FRBlPanRdQoN6DSOG7Dzt0D0qxJvd80V6RAHmxbup8viTkNkLhJpHpiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449624; c=relaxed/simple;
	bh=v2CCytaW6WiDwVywAEisOXbYBfQ13KjtbAR0hDBrp9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6tkUFr74gSc1HC7Woa4GlbRFY1LZ8qWZGesQ0EkCbPRbjNFWScQZQpqQTOXqg9w7TiOG/nyXMC2WmHB6t10YJomNiVrqsl4JrwFtKJzUoBTbP1NTxrtAlGfyVfk2oFmFOrookutd+kIFWunbL5P7+xkFmt47MIsDxo7k+78+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IHllBFSq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IHllBFSq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h7pZGtE1OlV9lUYg7yr1DTNsLeDD7r6CrCofCUZPUR0=; b=IHllBFSqkQ9F9jq5syBgwkFD3T
	uFtAfTdgsBV26bRQ6J5dGqdNUAsGS3+OyysEWNFdXr+08mm+pe8NfuZP4gd1eusF2Qdtj6I6K6AWm
	pNecjkoGsZjjRqM5gAFgBhP4LN4t0gfN1KZE7V3gBpXquIHskkwipP5imMDCGmW78pYAVrwNvLVM4
	6dmgoQwO++pVHQPPqhGCp7tOFkAL0liDTSY2AuoCsQVj3qxMzTKQAykUdmr5kaSWUlnsi8BLy7mOP
	phS1UBqBcfXVWVsXADH9+txOUMJW65cAxLvhobNNwpFM/EiTiDck1FhvbsEthBXH4dN3dYCk+NMEk
	2KXDajfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6LZS-00000006HQN-3XZN;
	Tue, 15 Sep 2026 05:19:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 20CD73012C6; Tue, 15 Sep 2026 07:19:05 +0200 (CEST)
Date: Tue, 15 Sep 2026 07:19:05 +0200
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
Message-ID: <20260915051905.GB776954@noisy.programming.kicks-ass.net>
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

> > This doesn't make sense. You cannot argue that the code is correct as is
> > and still add Fixes.
> 
> That is true. I added this paragraph to show that it is not a serious bug,
> but I still think it is better to fix it or we have to explicitly say that
> it is not a real lock in term of how it can be used. I have taken it out to
> avoid confusion.

"It is not a real lock" will do. It has always been meant as a optimistic
spin queue -- very much not a lock.


