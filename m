Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B637B02A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840727; cv=none; b=VwvktbbMQ00AcKSgq34VzX6BE9lWZppMrYnFIhvHEODstinEcDSSO3Ab5cjAv2RRE/MHBlFDxkVIq8lu2gZJt8Jgg5oLuAothsYh+48/YHkes6hkMtqhP95eBJKd2tz5OHa+UxgP8gZkaGvF/G3/CZDYLCVQgNxcfVtsszr4hc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840727; c=relaxed/simple;
	bh=MGMt/RMMDBNO2/JD74+3BMEa8RLiI1dlVPSAGtY4ZQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eezJLqPxj/8riR/LmVmqrAzvrRzauVHCUhRIrCS0rQdhTkicRMb2GGCLPCXIScHK9gqwPCELsJn7xXVafLIATmBlGTDOu/TGDpT2PDCPl4KptFAygODc8sU9hWTix0ltfsaIplZY/RU0DoDOL53L9jCY20+8DRQeUXGDH5fA1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osRi2eil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osRi2eil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA59E1F000E9;
	Thu, 27 Aug 2026 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787840725;
	bh=wOHcl+YD8gEtCi/bTLqLwavhY6q7rxK7kXxUHkLzivw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=osRi2eilwJMpP8iQBumtcvElkQY5/jAyAodwAUYUZpQIGAIonCFR/gATTVx/Cpx3t
	 Ts7zAsbkS4xom56+KVpOtjdAvfaSNjshVrGIAM8bjaxkJdUQLNkXLSfFQuzQp7LBcA
	 cB3aPDc0VGczsta8PXenJonGz1+gw3VcheKyWBLewo1GS7NJCyMsQruqejGX3xQOB2
	 Mjp2Jshitw9yDoq5YzBTLkpuh5d2yS42fIYx+iEFwWyqyygbw6kPHY+woutAqRUzd2
	 UdbVQTaYFCP9l8jlrao9qcXDtLoVVcRATIEjLjAt0HjemlpQAKhE2wnGKLF/azIReY
	 x5NnsCKwK3BQA==
Date: Thu, 27 Aug 2026 15:25:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apBG3YnZcHhlvU3m@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
 <054cf257-f5d6-4041-8c83-902af87c736d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054cf257-f5d6-4041-8c83-902af87c736d@linux.dev>

On Thu, Aug 27, 2026 at 03:15:47PM +0100, Usama Arif wrote:
>
>
> On 26/08/2026 12:31, Lorenzo Stoakes (ARM) wrote:
> > Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
> >
> > 	~107,000 words of review across 948 emails (in 279 distinct
> > 	threads), counting only prose you actually wrote — quoted text,
> > 	signatures and attribution lines stripped. That's a full novel's
> > 	worth of review commentary.
> >
> > 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> > 	and your longest single review was 2,404 words (mTHP collapse
> > 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> > 	of your top-10 longest reviews).
> >
> > 	Estimated review time: roughly 300–500 hours, centred around ~400
> > 	(i.e. ~7 hours/week for 14 months).
> >
> > 	1,615 THP-related emails in the window: 948 reviews of others'
> > 	work, 278 replies on your own THP-touching series threads (~31k
> > 	more words responding to review), 382 patch emails, and a handful
> > 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> > 	emails), June 2026 (113), August 2026 (111); quietest was December
> > 	2025 (5).
> >
> > Think I can be happy with that!
> >
> Ah so sorry to see you step down, you made THP genuinely better!
>
> The numbers show the amount of effort you have put in, but they don't capture
> how consistently useful and detailed your reviews are, with the aim of
> always trying to make the patches and THP better!
>
> Thanks for being an awesome maintainer and hopefully you will consider
> coming back soon!

Thanks Usama! :) I know we started off with some fireworks on review 😅 but
you've always been fantastic to work with and it's been great to see you
develop as a contributor.

BTW, I did want to say but never got around to it - I love how you've
approached the PUD THP stuff - i.e. getting the huge swap stuff sorted
first, gradually building things up, etc.!

You've always given interesting sessions + input at LSF and have had great
insights on how stuff interacts with the Meta fleet also! :)

It was especially interesting to hear that 512 MiB huge pages have actually
resulted in far less memory usage than you might expect :)

I will still be busy upstream with the 4 other maintainerships to keep me
busy, along with series both in kvmarm and core mm so don't worry I'm not
going anywhere :)

And as I said to David and others, always feel free to cc- me or ping me
off-list etc. if I can be of use for THP stuff, even though I'm taking a
break from the maintainership side!

>
> Thanks,
> Usama

--
Cheers, Lorenzo
