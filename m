Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF3047FB16;
	Tue, 13 Oct 2026 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911820; cv=none; b=hExbyusxHYGIobmwV9hQK3Ou7J4jCsqpW/pl9rZU9u2G2chaMTRIt3Mw/eKY7dKqMvKftLl5UiTm34JE5eIZdeQnEpVPN4s0EXmvnWqRM1Kd/CAPJK9bN+TS1a+kCOzpWMCYsR2Clgngh7V22SNZaiSWpqO2I7GvQJlWcCU6J08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911820; c=relaxed/simple;
	bh=PGCSoeEfv+bM30Yk2IeWEXcrAs8LTLv0uy4qZo6Fbx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwpYaUaOAmBqdOXec0s1ZfCsSitWpbt4gAPAOoFyy7IoVVeZyx2CUBMuGeim0EQ1r+Pbk8xlPO/rpkdbMSOd1rdpDy624A5O7eAmdh76zGT0dHMn1pJHI5CIUWLqSyI0O7hx6XrkClCZaM2VTsNJRK07sZs7KRY0fgufSpgl3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hHl0VPFI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hHl0VPFI"
Received: from killaraus.ideasonboard.com (85-76-151-95-nat.elisa-mobile.fi [85.76.151.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE8D9C42;
	Tue, 13 Oct 2026 19:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791911694;
	bh=PGCSoeEfv+bM30Yk2IeWEXcrAs8LTLv0uy4qZo6Fbx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHl0VPFICh1FhiwMz1ixUgzX7X2M8W2RLCcpEMioB5IMRjak7+h12uDIf9PNi/3hM
	 hburuJh6c/va1GHUywDk+FJqPjS7InOHzYqBohoWMwrgx7k1RTM0ivrcqXxTKguJbb
	 SDjxSjt8uReCZAcjez41TqgrR9OvHlVEvNxTymuc=
Date: Tue, 13 Oct 2026 19:16:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261013171628.GB178151@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
 <as4mYQGQFbjh4jVq@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as4mYQGQFbjh4jVq@gremlin>

On Tue, Oct 13, 2026 at 01:49:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 01:19:40PM +0200, Jori Koolstra wrote:
> > > The only long-term solution to that is to hit mark read 1,000 times :)
> >
> > There's a way to nuke drive-by authors and that is to require them to do
> > some kind of "proof-of-effort." So you want to contribute to the kernel?
> > Good, come to one of the OSS conferences, or LPC, or have some well-known
> > maintainer vouch for you, or do the kernel mentorship program. The point
> > is not that this cannot be gamed, but that the "gaming" in itself requires
> > some kind of investment, like proof-of-work.
> 
> Yeah that is a neat idea :) like universities requiring people to be in
> person for exams and shifting grading weight mostly to that.

That's a bad analogy. Try telling those university students that will
have to travel across the globe to sit that exam, and pay for it from
their own pocket.

> Let's not encourage people to ask maintainers for backing though! Maybe
> leave that bit unsaid.
> 
> > We may miss the savant that for whatever reason cannot show up to a conference,
> > but Linux Foundation is already very supportive of funding people. And besides,
> > Linus has already made it clear that we can expect of people to be able to grow
> > into serious community members (which may include being able to effort time and/or
> > money for LLM access.)
> 
> True. I did worry about people from countries/with lack of means where they
> might struggle with this requirement, but LF help I guess addresses that.

I'm willing to discuss that only based on hard data.

> > This would solve most slop immediately, and we will know about LLM found bugs
> > anyway from cooperation with Anthropic and just the maintainers using LLMs.
> 
> In mm we're more and more dealing with bug 'fixes' by taking over the
> patch, which is its own workload but will figure out how to do TODOs for
> that in time.

-- 
Regards,

Laurent Pinchart
