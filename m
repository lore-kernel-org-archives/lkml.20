Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A172C0274
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625012; cv=none; b=dsoU2Xi1a7FEqYNiqmr2X8zG6Fdn9MuFnGXIVPFY8wEZYojYhXp9KM0KYe0I9a1RHiSkpvPPt3HHpdiGwktNjYC8FQmmyZCmhx+FOXMOzX+15wSkEh40vVxHwQMBfTS33TwfTM1CkXpHSVlCzWDxDUJwP0Cc5OzJoQtr2ZkGkRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625012; c=relaxed/simple;
	bh=uU/AkRLezVTwR+ZvTPr5/ujyfJwiRMNbNcKM5g9iDRI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Mb0100Z8FhNsaPRB+pat0o3LFTl2qIY9gBJShtHukMhh3keuf14+p7+ugj7u82/VKJA8d+KHdcFj1/PhMs3K8yuzUl01vgCAUvRg6bqqa+a3mscDkMSZN7O1WTtqW/3XCG5NQCkvJH50icDqmkKgvJJhD0o2elF/kJzuJVUSJOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Wd9u84st; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wd9u84st"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C4D1F000FF;
	Thu, 17 Sep 2026 06:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789625011;
	bh=HSrhie3ypuW83vFReYxjzy5OGcpm75lW5CqYyN+TEsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Wd9u84st6s+3ZhZdO82k19nVHM8EAnqO3+U/8oQITZkdGudQybJigXBMhtM6CAyGW
	 baMfzhKJwf9EVmkJ87qdiD1rcmBHgV4FNMaU0FXOgWAzme9oBLXFcOFwQ5Ef7yKHyy
	 /XvF2GFD9UzKCTU0nX38fqf2qtJk3AijlOthZw6k=
Date: Wed, 16 Sep 2026 23:03:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Michal Hocko" <mhocko@kernel.org>, "Qi Zheng" <qi.zheng@linux.dev>,
 "Shakeel Butt" <shakeel.butt@linux.dev>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Kairui Song" <kasong@tencent.com>, "Barry Song"
 <baohua@kernel.org>, "Axel Rasmussen" <axelrasmussen@google.com>,
 "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>,
 "Baoquan He" <baoquan.he@linux.dev>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Ridong Chen" <chenridong@xiaomi.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized
 warning, again
Message-Id: <20260916230330.f0923cdb679de0b39d1c5d3a@linux-foundation.org>
In-Reply-To: <75939625-482c-464f-83fb-fa12d3e1d79c@app.fastmail.com>
References: <20260916083456.4136132-1-arnd@kernel.org>
	<20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
	<20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>
	<75939625-482c-464f-83fb-fa12d3e1d79c@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 07:50:43 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Sep 17, 2026, at 01:30, Andrew Morton wrote:
> > On Wed, 16 Sep 2026 16:28:16 -0700 Andrew Morton  <akpm@linux-foundation.org> wrote:
> >> >
> >> > --- a/mm/vmscan.c
> >> > +++ b/mm/vmscan.c
> >> > @@ -3274,8 +3274,10 @@ struct ctrl_pos {
> >> >  	int gain;
> >> >  };
> >> >  
> >> > -static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
> >> > -			  int tier_max, int gain, struct ctrl_pos *pos)
> >> > +/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
> >> > +static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
> >> > +				  int tier_min, int tier_max, int gain,
> >> > +				  struct ctrl_pos *pos)
> >> >  {
> >> >  	int i;
> >> >  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> >> 
> >> Current code has changed here somewhat, but I expect the error is still
> >> there.  I fixed that "uninitizled" while in there.  Altered patch is
> >> below.
> >
> >
> > Then the build blew up in unexpected ways.  gcc-15.2.0.
> >
> > The failure looks like a legit min() signedness thing which has been
> > there quite a while.  I'm thinking that __noipa surfaced this for some
> > reason?
> 
> Right, I now saw the same thing here on the current linux-next.
> 
> What I found now is that the __noipa is only needed on top of 
> "mm/mglru: use explicit tier range in read_ctrl_pos()", which was
> in next-20260915 but disappeared in next-20260916. This patch
> also removed the min().

So we don't need cc:stable?

> I think the reason why __noipa causes the warning about min() is
> that it prevents the constant propagation into read_ctrl_pos() and
> in turn the hack that suppresses warning about mixed types in
> minmax.h when both sides are constant.
> 
> Is the mglru series currently expected to make it into 7.4?

Yes, "mm/mglru: use explicit tier range in read_ctrl_pos()" is in
mm-unstable at present.

> If not, I would withdraw my __noipa and hope that the next
> round of changes to read_ctrl_pos() does not run into this
> problem again.

OK, I'll drop "mm/vmscan.c: fix min() signedness mismatch" and shall
rely on "mm/mglru: use explicit tier range in read_ctrl_pos()" to fix
the min() thing.

And I'll stage "mm/vmscan: avoid false-positive -Wuninitialized
warning, again".  ahead of "mm/mglru: use explicit tier range in
read_ctrl_pos()" to fix the build glitch wihout a bisection hole.

Does that sound sane?
