Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960284570E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387322; cv=none; b=BVwhoLAKVaX1+UK7ILlUF1EMEXqOgOI5PbrKj+9/qZq+lIhRVzkpN5Wcjk1smvP76MyU0LnApWDFtPqtHFm3QYU7msm1dRmggdvz00zYT9R03swIlPnfNG65Wt0OzoFw6EybC6K6AUhiAh/B2vddD8xuC9744mqAVfMiuC1wfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387322; c=relaxed/simple;
	bh=tjinD+FfRAtk8WrbROZ7EAJtf0D5Fc15WkyTHnKBjKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpRaxExdAlSYZ9WEf+sm5+X5EXAdd9oDIE5pNlMXuLfvuPgCS0Yx3LJ0HlNIz/zPuoRwzH7r6Ut+Qlt71fNsPOAVZOgWqAwTrl2YxH8cCPbr1zZisaXHThdPIoDvPwPKQgSmH0xlW8IXHZ9uR5aPxTtCF7CKBHLg++gDSRUSrWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VzVJMkjA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VzVJMkjA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NbiT735p4jaxfe/T6rxavVu/caEaiyKAUHLxHqA03IU=; b=VzVJMkjAkiSJzm/iL0kVY4Tp7V
	wv4y+tJBC+G8cXQrOwbD45Ckaj02kRmH+0iJ0k7K2Om6Wt+gbRI1UxQjF6gsAZkfXN6Ljy+b45clI
	jkiVfjzrXKU9mnzKDHLIP0MCSnzS1FrgDnPCOFzB6yjbXm2svnb+TdHa8Be3rHHFHEBbsTexZcWr1
	u73t/yIywWviD4Lcy0U26/utu/TW4V34IplLXiJrQ0fcaRROG4JmNVZOBa8ZuDFD1ti3gXNuf7lEY
	clXxMmAl6oqRPHgrNM/ymgXb8kMwjymk6pStnW0sF66akCCP6GRqkPJi2rY+HfbeGgFghdgzjxS7t
	jlRTFBBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x65Nc-00000005ZqP-0zXE;
	Mon, 14 Sep 2026 12:01:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7B94530066A; Mon, 14 Sep 2026 14:01:47 +0200 (CEST)
Date: Mon, 14 Sep 2026 14:01:47 +0200
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
Message-ID: <20260914120147.GD3500130@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <ac626425-08d8-4967-bbe5-2ceb971af668@redhat.com>
 <20260909195223.4d2dbe86@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909195223.4d2dbe86@pumpkin>

On Wed, Sep 09, 2026 at 07:52:23PM +0100, David Laight wrote:
> On Wed, 9 Sep 2026 14:01:59 -0400
> Waiman Long <longman@redhat.com> wrote:
> 
> > On 9/7/26 4:41 AM, David Laight wrote:
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
> > >   kernel/locking/osq_lock.c | 57 +++++++++++++++++++--------------------
> > >   1 file changed, 28 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > > index 01988d00c480..23f00c670507 100644
> > > --- a/kernel/locking/osq_lock.c
> > > +++ b/kernel/locking/osq_lock.c
> > > @@ -35,7 +35,6 @@
> > >   
> > >   struct optimistic_spin_node {
> > >   	struct optimistic_spin_node *next;
> > > -	int locked; /* 1 if lock acquired */
> > >   	int prev; /* CPU number offset by 1 */
> > >   };
> > >     
> > I think we should document the fact that prev=0 can be viewed as a 
> > marker that the osq lock has been acquired.
> 
> I think that happens a bit later in the series.
> Trying to keep the comments in step is quite hard work.

Still, that's what you gotta do. Now you're asking us to try and reverse
engineer things while reviewing.
