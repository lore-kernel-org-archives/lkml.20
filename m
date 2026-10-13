Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5772E06E4;
	Tue, 13 Oct 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896509; cv=none; b=EctUjEdeIA9yxphkWJGtwzqYbxkNo9jeeDtX/OsKTgJFhbxXSwx38vTRb3tChx/LG/6dYEkwOk806GqO6It8xX6GLh8y4F7AepE7bH0NsgndJP5xbZcxjUh2AXbS5lkBcVkpJVfk8voZLEYLXq4uqA6RVXqACJdW2elHM6dRb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896509; c=relaxed/simple;
	bh=Q/jYL8BfCc2XZBjNa/XDCDhEq8sNzI4qwahH4HimM54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnlBoFCBDE/O1J6pLg6H8V+nU6E3mPLi8spZe6AKHEWuf21ZzgTpdtl2fhs3tcDSxljb+UNRya3hIbj6q4dVcRBT26dlJtnEjc3EIBt1xGs0k+0R8JPLBMjQLwU3trQFiupk0JUOMgf6P20Ds8oZvolCU5zcJ4M287G35EuZlPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=abpf6wUz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="abpf6wUz"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88F271E4;
	Tue, 13 Oct 2026 14:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791896384;
	bh=Q/jYL8BfCc2XZBjNa/XDCDhEq8sNzI4qwahH4HimM54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abpf6wUzqQRqFcalJJS6I0Qju+lIW63B/WfA6tWuYk+OVOxGvQ7XHg+BLRdT6l6VH
	 YAEnySapCd9kQw6kLZ62vTFN2EF57wGEBUO+Ap+S3GIkNut2Geve0HP0N60+/UZwax
	 LyCx0+TfKCYNZ+Zbw8oFKmJstCSsdx6gU4juli1I=
Date: Tue, 13 Oct 2026 15:01:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
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
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261013130134.GH4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
 <20261013123853.GD4214@killaraus.ideasonboard.com>
 <353766590.785601.1791895821929@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <353766590.785601.1791895821929@kpc.webmail.kpnmail.nl>

On Tue, Oct 13, 2026 at 02:50:21PM +0200, Jori Koolstra wrote:
> > Op 13-10-2026 14:38 CEST schreef Laurent Pinchart:
> > On Tue, Oct 13, 2026 at 01:19:40PM +0200, Jori Koolstra wrote:
> > > > Op 12-10-2026 17:42 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> > > >  
> > > > +cc the participants from that thread FYI. The original patch is at [2].
> > > 
> > > Thanks, Lorenzo.
> > > 
> > > > On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
> > > > > On 09/10/2026 10:31, Sasha Levin wrote:
> > > > > > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > > tag. Remove the documentation requiring it.
> > > > >
> > > > > Please provide here some sort of arguments used in that summit
> > > > > consensus/discussion. This basically reverts/changes previous consensus
> > > > > [1], which is fine itself, but it lacks reasoning.
> > > > >
> > > > > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> > > > 
> > > > Thanks for linking that! It is important to ack previous discussion on
> > > > this. Also LWN article is up now at [3].
> > > > 
> > > > I'm less bothered than you might think by this change.
> > > > 
> > > > The tag's useful for push back on review, but the only long-term strategy for
> > > > slop is to aggressively ignore it.
> > > > 
> > > > Linus has made that clear that that's fine.
> > > > 
> > > > What kills the project is having 1,000 slop submissions that 2 or 3 people have
> > > > to do something with.
> > > > 
> > > > The only long-term solution to that is to hit mark read 1,000 times :)
> > > 
> > > There's a way to nuke drive-by authors and that is to require them to do
> > > some kind of "proof-of-effort." So you want to contribute to the kernel?
> > > Good, come to one of the OSS conferences, or LPC, or have some well-known
> > > maintainer vouch for you, or do the kernel mentorship program. The point
> > > is not that this cannot be gamed, but that the "gaming" in itself requires
> > > some kind of investment, like proof-of-work.
> > > 
> > > We may miss the savant that for whatever reason cannot show up to a conference,
> > 
> > We'll miss all the contributors who started small and put time and
> > effort in learning. I'm pretty sure that's a majority of the people on
> > the CC list, and it certainly includes myself. Making it much more
> > difficult for true hackers to contribute to the kernel, including by
> > requiring paying for travel to conferences, is the kind of policy that
> > would make me stop contributing to the kernel.
> 
> But you were there at LPC!

It took a decade between my first kernel contribution and my first time
at LPC. And luck played a great role there, it could easily have taken
longer.

> Sorry, was planning to go to your talk, but
> couldn't :( . Would have loved to chat with you.
> 
> I doubt how many people are like this. You have to contribute A LOT of
> time to get to a meaningful level of understanding of even just one
> subsystem

And that's what people have been doing since the start of the kernel.

> , even with LLM support. I know some people don't travel, but
> I didn't suggest that conference attendance should be the only avenue
> to participate.
> 
> > > but Linux Foundation is already very supportive of funding people.
> > 
> > How many people with very little history of kernel contributions has the
> > LF funded ?
> 
> Well, me, for instance :)

I note a count of 1 out of thousands.

-- 
Regards,

Laurent Pinchart
