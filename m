Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773904;
	b=GEdj2x30qEQl2gVnGzeXQ4ZqHiduFhzbgq+RRrjTpbixB6hTaEW4SjlPx6IGBha8TT8B
	 b2hUt3eZYG0gIysZG6I/wVmN5uSV6bAzenuhPrptNZEZRdsZR6ouxx02aG0bUitr26Ykh
	 IXzeSLA1i6nz8sxuscTHT4G17pgky3O0keK1JYnphBFE6Jt8BiMYNJWJLz/kfT1FPwcn4
	 mgTl8rhZTqGelyu+iL+MqDe9epzSCVr+bBBeBhAJGAtKEicLZMGnjAC7FVZg9PCi5bL6J
	 tKWe4kOsHKr7j56UoR4o90cSECV19s8AE7qXgKBie6a19lEC+KnckrtJmJhujt9VsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773904;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s4ne8OLtVs38lLgCbdFGLaiV4oqCFgQ7TwUBJCJlioo=;
	b=3gOx1isA1oUXSrYbf1PvRZtBU+xvqmL8dT03ZVv4yQBDoGEu3E1+NgUZzzg5xhKs2TL6
	 8RqHwP6USnaih6MmWr4iNxX64O8PBnIDHFQjXHH1OwZIhtnuvU22jwbG3YcxLRnWmnUZV
	 mhI3lT4rT5L8/+4cjpR4clKDehZhUc4WQJCdsumKRTyxl+8BDrJ4MfB6wkKRNabz7zA95
	 kyQ6fvIeYjSrcCGZ9LIHxuFUBY0J900ec7Oa4slTB9cHduVvK+Z0wXNfY76poFDpfOwsy
	 GtUiZFDjs9B4ZiuaouWETNfqE9PWBiJvX6npcX+eO1oqYYOsp8XYsHI98MbEmVJZQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOU8EpdI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4A606A31F;
	Fri, 23 Oct 2026 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOU8EpdI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805E31F01825;
	Fri, 23 Oct 2026 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773903;
	bh=s4ne8OLtVs38lLgCbdFGLaiV4oqCFgQ7TwUBJCJlioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOU8EpdI+MOaw2yWS4AhxtlYPeA7u9wLlEwJkTmYQrKrx2Ig40QH2E0JcXp+dL0Gk
	 EfYPqqtixfl0hLqJMiaOU7m7SiwIfx80/wDN9HCiDo9VuYWWfQbl1JRq2urCkPWyvT
	 omBHB8NeYp5mSpiZKOaDplxd+UlRyiXXwUbkbOC2BiqhiUXQErbIxqxmzADpPfUaq7
	 kyIH/2xw2lfZIpLzAc0RqUlc7nAeVjFTF+cW0nDSmOXkVY0PCbDodf0Jk7wZf54eaK
	 kFxR7PEX+nxxjzjPbwZ2OemZ7fuGwhc0Xr75WDIKImcww9NV4/TEg0j36O1MvJFt0y
	 d0WCBK4QSrUHg==
Date: Fri, 23 Oct 2026 17:44:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atuDosjEibZI9exi@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
 <20261020211532.GD15441@killaraus.ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020211532.GD15441@killaraus.ideasonboard.com>

On Wed, Oct 21, 2026 at 12:15:32AM +0300, Laurent Pinchart wrote:
> On Fri, Oct 16, 2026 at 05:14:02PM +0100, Lorenzo Stoakes (ARM) wrote:

> > So now maintainership and review is thankless at an unprecedented scale,
> > which leads to only one thing - burnout. Possibly even the medical variety,
> > where you don't come back for a long while, if ever.
>
> I hear your pain, and I'm sure it's more painful than what I experience
> in my corner of the kernel. I know how the sense of duty feels as a
> maintainer. It may not make a big difference, but I want to say you have
> no duty to burn out. If you decided to slow down merging patches in MM

Kind words always make a difference :) so thank you. And agreed, I am
working on... working less :P

I take my maintainership duties seriously, so there's always stuff I _have_
to do, though. I suppose the point is that for me and likely many others,
things are _already_ overloaded.

> > The only solution that can possibly work is large-scale ignoring, because
> > the number of submissions can grow exponentially, and even small
> > effort-per-submission is vastly beyond available resource.
>
> It increasingly feel we need to also look at long term solutions.
> There's a sort of knee-jerk short term reaction that I can understand.
> On the longer term, I agree with Lyude that any solution will involve
> increasing the number of reviewers and maintainers.

I have a fair bit of experience on this front, as I did a lot of work
establishing mm maintainers/reviewers once the community had decided on
establishing submaintainers, etc.

Aside from being technically competent, maintainers must have 'soft' skills
(misnomer, they are the most important), need sufficient experience to do
the job, importantly must be able to say 'no' (when taste or technical
concern dictates), and must also be willing to put up with what it entails
(now including slop).

That filters it down to a very small number of people, unfortunately, and
in any case even if we had hordes of maintainers, the number of people
sending slop can always exponentially exceed them.

On reviewers and reviewing I agree, but it is _really_ hard to get people
to review more, and I've noticed the slop has clearly discouraged people
from doing more.

> I fully understand that many maintainers currently feel they're too
> pressured to invest time in the next generation. We need to find
> solutions to make that possible.

That's not what I'm saying, at least, myself :)

With the best will in the world if we start getting 500 mails a day, or
1,000, or 10,000, even reading the mail becomes intractable.

>
> > The alternative is maintainers quitting en masse and the project dies at that
> > point. So it's a choice between two bad options, but one of them is 'linux
> > dies'. So the other one seems better.
>
> If we stop investing in the next generation, the project will die too,
> in a worse way in my opinion.

Again, to me, it's just a scaling issue - nobody can read hundreds or
thousands of mails a day effectively, and maintainers and reviewers are
past capacity even now.

And agreed, we need talented young people coming up and it kills me that
they might be discouraged both by 'AI will take over so what's the point'
and the hordes of 'competing' people sending slop.

Perhaps there are ways and means of getting talented new people involved
via side-channel, though.

I did the 'eudyptula challenge' many years ago, which was a sort of boot
camp for kernel developers (with a lot of 'are you patient enough' bits :)

That can't work in identical form anymore because of AI (sigh), but perhaps
we can figure out some AI-proof version of this?

> > So it's very far from the case of 'oh wow now I can just ignore everybody'.
>
> Thank you for taking the time to clarify this. I'm happy to read I
> misunderstand you. E-mail communication is horrible to discuss these
> topics, especially in public.

You're welcome! Thanks for your kind and thoughtful response.

And yes, text sucks, and I have myself both communicated poorly and
misinterpreted people via email more times than I'd care to admit... :)

It does seem text, while useful for asynchronous comms, is often very poor
at conveying tone and intent.

>
> This is something we really need to improve quickly. Over the past week
> multiple active kernel developers asked me if I thought they needed to
> find a job elsewhere, thinking maintainers will now ignore anything but
> perfect patches and dismiss contributions from developers who don't use
> LLMs. That's a wrong impression (at least I very much hope so, and you
> clarified that you're not advocating for that), but it's a disastrous
> impression that many people got from the maintainers summit and the
> following mailing lists discussions.

The intent of what I said was to be totally honest, and to _own_ the
'collateral damage', rather than to deny that, which felt, to me,
dishonest.

Perhaps I could have conveyed that better, but that was the intent at
least! :)

>
> I'd like to see more maintainers clarifying this publicly, like you have
> done.

I'm sure the other maintainers who've said similar things feel the same
way.

None of us are enjoying this I wouldn't say, and none of us want to harm
genuine newcomers.

So yeah, the TL;DR is 'scaling is the big problem' and I probably should
have limited my response to that many mails ago :)

--
Cheers, Lorenzo
