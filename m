Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530938;
	b=0M+SyygyIaWNCahfyciEI+3KaTyBc3oNOS3l6qnCy53dBTFHmgR5cGKhKh8FlltuXmZ+
	 RhEzVWcSz+aemhpLpeIwRgX8JDUKLaDPlgFMNhYh+9EjdCWrmRuxCGKEJV2eTVMcaKetJ
	 fVVgnXRz2dnvoY2/OkKcG6jaDs7Z9/uP0oTXKuZF9t47ZLpMVfs8mJVUDQ9W2HUkl4A3V
	 sjrjRH5a0y2HCJuc4aFzWwY5BLkeU1Dtjq5lrlTT+7XAsuechMbLCfrahSIHDT5+MTMrx
	 LDecft6fJTB4gMw+mdztO9AjEFRsD18mJD9O2KRQMyuiR6jnjh5vA/dzB9UsL+XownA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530938;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wHd3cMifOHT8XJzNmW+BScYMJPe67YDL+EZuUsiYtiE=;
	b=fN9ippP15JgsxTuMkD6f15UYXpY7fkTIk9XKERfruJMcRJXnkpxsA6yHSG+KHNn3/udH
	 oB/ltuDSVGCyM8pgIzmA4vozvv+jiSPD71XJAcs2UGfZ6nEAr3CRu4RizbBUCXaqXmxVW
	 p6KyTCjubQlL/F9FPb4t0Pjq6lD2735B8JZOlqQLbyH0eKIEaRBKLJhAAM9fUi9gasqMS
	 ZSZ/LPJKoH7B/l0MrHhy4rBr2qR56pdQzNn9vRgkO5d5d8sGBKtvhUDeKxFBRLwUKfyrX
	 RKKsrtEsXj2RXsS9XX6EfXsNajGDP3Oc4iHIs7kBZXg0jal4I6E6euSYP4icefmf2PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fFpyAJLd;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39C606A31A;
	Tue, 20 Oct 2026 21:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D39C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fFpyAJLd
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2414224A;
	Tue, 20 Oct 2026 23:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792530807;
	bh=u/yfSmPUydbUTto1BYzeKolJfPU9hLQ11kPO+5MbNp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFpyAJLdB9ER1nQO6qbzFR0WTuRAXjnP7KEN1UQeHThTizOX+EFrP0L36caTqTRdD
	 ulH6ALapjRULM3l1uykAR3dpbSn0bBUFDdGdFMn6JEo6agD/HlQ0RexcSrfPkP3UhG
	 sJHm2YaJC1WlLoOphYWD7HvhFUpDbczL9KA1DXeY=
Date: Wed, 21 Oct 2026 00:15:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261020211532.GD15441@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atI_TSQXzAQFWBfx@gremlin>

On Fri, Oct 16, 2026 at 05:14:02PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 07:32:40PM +0200, Laurent Pinchart wrote:
> > > Yes there will be collateral damage, but it's that or no more open source (we're
> > > not the only ones going through this!)
> >
> > Think how you will feel the day you will be treated as collateral
> > damage.
> 
> I'm already working evenings and weekends to deal with AI slop to the point
> of burnout (finished work at 9pm last night, for instance), so I already
> feel like I'm collateral damage.
> 
> And it's utterly thankless work. You get negativity no matter what you do
> with this stuff.
> 
> I accept all that, I do it because I care. So you take it on the chin. But
> the AI slop wave has changed everything.
> 
> What was already an unsustainable review load has now doubled, or tripled,
> and there's every reason to believe it's only the beginning.
> 
> So now maintainership and review is thankless at an unprecedented scale,
> which leads to only one thing - burnout. Possibly even the medical variety,
> where you don't come back for a long while, if ever.

I hear your pain, and I'm sure it's more painful than what I experience
in my corner of the kernel. I know how the sense of duty feels as a
maintainer. It may not make a big difference, but I want to say you have
no duty to burn out. If you decided to slow down merging patches in MM
to get more sleep until we find a better solution to cope with the
unsustainable work load, I would support that.

> The project simply cannot function like this, it can't. And nothing that
> requires per-submitter effort scales.
> 
> There are people sending 500 patches in 2 hours already, for instance.
> 
> The only solution that can possibly work is large-scale ignoring, because
> the number of submissions can grow exponentially, and even small
> effort-per-submission is vastly beyond available resource.

It increasingly feel we need to also look at long term solutions.
There's a sort of knee-jerk short term reaction that I can understand.
On the longer term, I agree with Lyude that any solution will involve
increasing the number of reviewers and maintainers.

I fully understand that many maintainers currently feel they're too
pressured to invest time in the next generation. We need to find
solutions to make that possible.

> The alternative is maintainers quitting en masse and the project dies at that
> point. So it's a choice between two bad options, but one of them is 'linux
> dies'. So the other one seems better.

If we stop investing in the next generation, the project will die too,
in a worse way in my opinion.

> > I find this mail thread it taking an almost cynical and violent turn.
> > Are people rejoicing at the prospect of actively discriminating against
> > sincere contributors, or am I misreading it ? The kernel community needs
> > more care.
> 
> You're misreading it.
> 
> I feel _terrible_ for newcomers. Really. It hurts me that this situation
> exists.
> 
> I came up as a hobbyist from nowhere. I wrote a book thinking nobody would
> care, part-time, while doing a busy non-kernel job.
> 
> And the kernel being what it is let me get where I am, for which I'm
> eternally grateful.
> 
> I want to encourage talented newcomers. They are rare, and are the future
> of the kernel.
> 
> I explicitly spent time at LPC encouraging newer people, in person, for
> instance. I have (often behind the scenes) encouraged young, talented
> developers. So in general, I've _actively_ worked on this.
> 
> And new people sending small, sensible, non-slopped patches/series will
> still most likely get their stuff merged in mm.
> 
> So it's very far from the case of 'oh wow now I can just ignore everybody'.

Thank you for taking the time to clarify this. I'm happy to read I
misunderstand you. E-mail communication is horrible to discuss these
topics, especially in public.

This is something we really need to improve quickly. Over the past week
multiple active kernel developers asked me if I thought they needed to
find a job elsewhere, thinking maintainers will now ignore anything but
perfect patches and dismiss contributions from developers who don't use
LLMs. That's a wrong impression (at least I very much hope so, and you
clarified that you're not advocating for that), but it's a disastrous
impression that many people got from the maintainers summit and the
following mailing lists discussions.

I'd like to see more maintainers clarifying this publicly, like you have
done.

-- 
Regards,

Laurent Pinchart
