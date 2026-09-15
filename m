Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEFF3BCD15
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461348; cv=none; b=Il+BsXNubyNt3rdh5+fLxXcmsWA/HZerABUREWqeEV6rQzfwmKO2nRRuBDISAaXrWxLoZU4fB8JrZ30dI3emWLAZCg3iz8M15qFG0XsryPk99/iYvbL6+g8D2vt3jvDgYayZhB5he6xwGS1oc/Ov3DR7l8nsHUAwd3+qKKDuMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461348; c=relaxed/simple;
	bh=pITJvfUonXZZQX2dXh+3PEdpHvGOWWcgvVUkgHlLyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8yqN3IkvHabPHu8seluYbpYYns0Bmmh8Wdm9fTR4WG++6tIfkIapelim4xM57jX0C3m/GAfB0Zv4zOvwnPuoHxPJ44fTDMvpj/Ik5jZTKXSKDr9HHoJylFLqpkeq+zAhd9fvm5uD3EkAg7fH7EvLfna1pZ/CaLzYxkNbG6r4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMoCyjgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMoCyjgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D6F1F000FF;
	Tue, 15 Sep 2026 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789461346;
	bh=V5PMVhNm6w7vScOauxt2sn2fqUvvMTkE5qtbt52NA+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iMoCyjgyoF5Aia27jf1t2O0HSyVcKcUmOQA/DJ/7kOdR2uRikSSQXjTu2T9pU4uha
	 WMSv5gbH4lyfFjgNW5IWEIW6Yqgp/hG4upDDmYllejUuFHCb9MymHWCulFEl5OV+UB
	 0CLv6Lpcn5UoRCe0pALkn6kSC1v3joIYQJ0m0EiGmLQEd4uHlGixLo7WD8p7EcBsf8
	 wzYjmPtTSQVVzUGXkicNIDUp4Hp+LWYY7YLo0TXOljiQta9Yov8CimRzuw8PrTDqA2
	 dXFOfBtc2ZHOfngDM/5Fr9y8NhFVhovxz4qGp8h9M3X24ARuL9Wrmj8mhNuAlWUbt7
	 imvp2N00pk2Hw==
Date: Tue, 15 Sep 2026 09:35:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <aqkCXW12QFi03jX7@gremlin>
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>

[excise cc- list to mm]

On Mon, Sep 14, 2026 at 06:08:11PM -0700, Andrew Morton wrote:
> On Mon, 14 Sep 2026 15:57:20 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > The VM_SPECIAL / VMA_SPECIAL_FLAGS mask conflates several unrelated
> > properties:
> >
> > ...
> >
> > It's all rather a mess.
> >
> > This series brings some order to things by both limiting what drivers can
> > do with VMA flags and switching to using predicates that describe
> > behaviour, not arbitrary flags.
>
> That's a lot of patches.

Yeah I know :)

I held this back from last cycle to reduce workload, but I can't keep doing
that :))

It's a lot but each patch is relatively easy to review.

>
> Review is thin and I expect this won't improve a lot.  Lots of "no
> functional changes" changes.

Well, I think it will! Had a meeting last night where Suren committed to
going through, and I will nag people.

It's a very busy cycle I realise but this is mostly fairly straight-forward
to review.

>
> Perhaps it would be helpful if you were to identify those patches which
> you'd like to see reviewers focus on?

The mlock stuff is probably the most sensitive bit. But in general that the
semantics are what we want.

Already had some review on the driver-specific bits from relevant people (I
fixup a bunch as part of the changes)

>
> >  1153 insertions(+), 582 deletions(-)
>
> It's funny how often cleanup patches do this.

Well it's not just a cleanup per se actually, I add a whole new
mmap_prepare() action methodology and add a bunch of mmap hook validation
so it's adding functionality to the kernel.

And there's a bunch of kdoc documentation too (plus a whole bunch of
additional _actual_ documentation added to the mmap_prepare doc page), so
there's good reason for the additions :>)

>
> All queued up, thanks.

Thanks!

--
Cheers, Lorenzo
