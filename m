Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201934F68BD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895895; cv=none; b=iIX4Mg2/CtDIQ7OVyEME3mQfiABw+WgxMZgmGzDxm9nAF1GgTkYLoAJjiHW4iCo38vSFAtpxSRw7tS+PF0ZsMhQkF5gEYjK2CN3XhElsJ0T/qZmRzW2GkhzeC5TtV3yDL0HmCWUi5kbBw4ILyQ9eNsmKKyCIGt04W+cLVBybVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895895; c=relaxed/simple;
	bh=46TQsVYY1GtoBPuMPUF/LXOW/imQRBFLnJEO1nH6ETU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ryuP8gvujCNtXmBJdB61xUDZKpg6k5+KmaSNGP9vXyMDwSDUha1w8jOqsGkEcFXIS2B50PuXpL42SCW4O1fN/m9ZM42RRMb+6QnfTfy/9Ly0s4kPtDGdOPgeFVmN3R3DXxfFq9S4KpvtszF3TwFvjJE4p1H04XWpdQGZcGr+84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=tJC9UaDt; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="tJC9UaDt"
X-KPN-MessageId: a6f91dd4-c704-11f1-a5a4-005056994fde
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a6f91dd4-c704-11f1-a5a4-005056994fde;
	Tue, 13 Oct 2026 14:50:22 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id a6f64b1b-c704-11f1-a0c5-0050569981f5;
	Tue, 13 Oct 2026 14:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=e7bAULIOthl2bJgXVMyo9UFqPnpNyyHYitYw9irJUN4=;
	b=tJC9UaDtO/IRj5wB7eCEvhH+bGXl4AqkFvmnZTkpr2Kq2rDIHV5Gb9MbYMcsaKdvyStrjSCn6S6uE
	 XaPlhgrs1/3PWwV3cxEOG/QUVw5NghdAKKPkM8OSXU+JIPmTDSR9Yuvi55GkcKIY0jkyfuMYa+A7x+
	 KNRLAAt02/JCrbdfqeNBe420OWruC6aaIviqgHD24fvqUhCbp/rw+jusqjWD++MpfR7FTYmxBy9oUa
	 ijkgeQqogP2ie2mFiDOVvCSZccXYfTxuytNASpy+AI8GE9hInK4uhnAsohCKfpbna7u6g0430TMcB8
	 yU4DBzji155DSFV7JjmDB4fzuJq28/g==
X-KPN-MID: 33|8N1gRlhHZkaZTTCT3xDz94/on8A3bynP1dd7ahrML2O2JQ7IZ4w9k14rz1i0gyE
 TwKQIv6T/R9VLR4SbkbIXJSE8sDhvDElqSL02rGY399o=
X-CMASSUN: 33|BuwFCznQeDudkeR63GrOr8k1TKzbTO6RPVAN0TnAY1XLul7HwrZEOKXXnEYZT+P
 Bt8JnM07HNZp99f76AN1lwg==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id a6e9e19d-c704-11f1-916a-005056995d6c;
	Tue, 13 Oct 2026 14:50:21 +0200 (CEST)
Date: Tue, 13 Oct 2026 14:50:21 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
Message-ID: <353766590.785601.1791895821929@kpc.webmail.kpnmail.nl>
In-Reply-To: <20261013123853.GD4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
 <20261013123853.GD4214@killaraus.ideasonboard.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 13-10-2026 14:38 CEST schreef Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> 
>  
> On Tue, Oct 13, 2026 at 01:19:40PM +0200, Jori Koolstra wrote:
> > > Op 12-10-2026 17:42 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> > >  
> > > +cc the participants from that thread FYI. The original patch is at [2].
> > 
> > Thanks, Lorenzo.
> > 
> > > On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
> > > > On 09/10/2026 10:31, Sasha Levin wrote:
> > > > > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > tag. Remove the documentation requiring it.
> > > >
> > > > Please provide here some sort of arguments used in that summit
> > > > consensus/discussion. This basically reverts/changes previous consensus
> > > > [1], which is fine itself, but it lacks reasoning.
> > > >
> > > > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> > > 
> > > Thanks for linking that! It is important to ack previous discussion on
> > > this. Also LWN article is up now at [3].
> > > 
> > > I'm less bothered than you might think by this change.
> > > 
> > > The tag's useful for push back on review, but the only long-term strategy for
> > > slop is to aggressively ignore it.
> > > 
> > > Linus has made that clear that that's fine.
> > > 
> > > What kills the project is having 1,000 slop submissions that 2 or 3 people have
> > > to do something with.
> > > 
> > > The only long-term solution to that is to hit mark read 1,000 times :)
> > 
> > There's a way to nuke drive-by authors and that is to require them to do
> > some kind of "proof-of-effort." So you want to contribute to the kernel?
> > Good, come to one of the OSS conferences, or LPC, or have some well-known
> > maintainer vouch for you, or do the kernel mentorship program. The point
> > is not that this cannot be gamed, but that the "gaming" in itself requires
> > some kind of investment, like proof-of-work.
> > 
> > We may miss the savant that for whatever reason cannot show up to a conference,
> 
> We'll miss all the contributors who started small and put time and
> effort in learning. I'm pretty sure that's a majority of the people on
> the CC list, and it certainly includes myself. Making it much more
> difficult for true hackers to contribute to the kernel, including by
> requiring paying for travel to conferences, is the kind of policy that
> would make me stop contributing to the kernel.
> 

But you were there at LPC! Sorry, was planning to go to your talk, but
couldn't :( . Would have loved to chat with you.

I doubt how many people are like this. You have to contribute A LOT of
time to get to a meaningful level of understanding of even just one
subsystem, even with LLM support. I know some people don't travel, but
I didn't suggest that conference attendance should be the only avenue
to participate.

> > but Linux Foundation is already very supportive of funding people.
> 
> How many people with very little history of kernel contributions has the
> LF funded ?
> 

Well, me, for instance :)

Best,
Jori.
