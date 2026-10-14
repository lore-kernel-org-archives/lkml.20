Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D0563FDD;
	Wed, 14 Oct 2026 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003667; cv=none; b=HiTqPdfImU7PqQRgq6tsUCiaBleOS8JKIrg3ADZMfMTadenNQfQHxDbd/zIhqAg4URoYOnnpGDHcohRMhVufPsb/km/AfXzCdj2pXheH1UQ+MGh+fPcWpM8+CEmXxiSJ/wy1JZliUFdZBm2yHV2P3yDhwbwT/tXT0s5GCCCZXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003667; c=relaxed/simple;
	bh=h6lmp4xibLx24No/EOQmMye1fmUOIkBhRr2353+kT6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=My5jwVtPorkWdl1QrVxqTkkRh5JgxbkD/wrfpAJirG5Tha5wPoknQkjfSEa6x96Ssz5lQVDO3HcPLsTHOZHNpZ9NEem0pr9CbEEi/l3yK1VP1oM7GUNpwGJsK4n3cb4UYyUC5u1e2+PJabJUJ2rrlHG75S3Boyzgik1frU8CyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7Mx3Hjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7Mx3Hjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3571F000C4;
	Wed, 14 Oct 2026 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792003666;
	bh=2HebUlT5neFwjNW4ckqFvgcxp/1U4hD9q1BVhBR5egg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S7Mx3Hjw7nTck7V3rARjeQwm6h1a+E3YC9LYr9jr6UKtisgkB6IiN/tj5sPEQbvUO
	 f2l2m0dL8wXbXj8C2dgnNQK3Wr1qsuyIOAwrYmrjoiI6Ii2DkkIzOAi8nvSjHyIzCG
	 lPPKIxb48ylB9hISXo7OtFNyQ4Qs4bF672Vp6+sUKlPo8IjH8+wo3V3Y7S6QwypEGC
	 Z5sf7Ej6e8feRIngYTx+OqfJek8iUa1Sp3HAUw23Yd20TnjxW0OZE9xeMwc1ckgVis
	 JI38OKraMYt7AeDbvaXdFf19sJ6p7846l2zixNLwks1OQiDtMa8u3wGgGEuRTXTJL/
	 NZazP7X/WUCXQ==
Date: Wed, 14 Oct 2026 11:47:46 -0700
From: Kees Cook <kees@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <202610140951.C3D6CBF73@keescook>
References: <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
 <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com>
 <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013201628.GO4214@killaraus.ideasonboard.com>

Oops, this reply ended up long, sorry! :P tl;dr: if you get bored,
please skip to my last paragraph.

On Tue, Oct 13, 2026 at 10:16:28PM +0200, Laurent Pinchart wrote:
> Perhaps, but I think that's missing the point. The SoB line is not
> enforceable either. Very few of our requirements and assumptions can be
> enforced. We're not telling people they can get backdoors merged in the
> kernel because we can't guarantee 100% that one won't sneak in.

I think the SoB is at least _more_ enforceable, in the sense that it
has mechanical validation attached to it ("sender matches SoB"), and
it's designed to be used to declare "chain of custody" in some way.
Specifically the SoB is about making a declaration of origin, DCO,
literally. :) So that tag does do what it says it does, and can be
meaningfully interrogated later.

But I agree, it's a statement that says "I brought this to the project",
and is _just_ a statement. What we want for the LLM stuff is "I
understand this change and am ready to convince other people about why
they, too, want it to be included in the project". "Assisted-by" never
did that. And I've always held that the place to do that is, and has
always been, in the commit message body itself.

> What this is about is setting our expectations, telling what we want and
> what we don't want. There's still value in that, and I'd argue there's
> even more value now. There will be people who won't care, there will be
> people who cheat. We've always had those, we'll keep having them, and
> we'll keep rejecting their contributions. I really don't get the
> unenforceable argument here.

I am perhaps using the wrong word, and maybe "enforceable" doesn't map
well. I think I mean "Assisted-by" is (and has always been[1]) irrelevant:
the thing we want to have is understanding, correctness, etc. This gets
called "patch quality" under the huge umbrella of what "quality" means.

And the LLMs change the nature of all of this, I agree, but the tag
didn't help at all. For example, I was (I think) responsible for
netdev's rule about "please don't send more than a dozen patches at
once; wait for us to process those before sending the next wave", due to
the treewide changes I've done over the years (where netdev also wanted
them broken up by driver, etc). And that was strictly a mechanical and
"trivial" set of changes (driven usually by Coccinelle). There was no
tag for that, and "enforcing" it was a social one. I did what they
asked, etc.

Recently we've seen an attempt to make that an enforceable delay by having
Sashiko hold off on patch reviews for 24 hours for netdev patches, etc.
In that case, there is a mechanical way to induce the result we want.
But "add a tag" wasn't it: that wasn't an "enforceable" solution to the
problem of quality and quantity.

> What would be your issue with writing commit messages manually ?

Up until about 4 months ago, I did 100% do that because the prose and
rationale coming out of the LLMs, even when guided toward specific
templates, was horrendously bad. But now it is, I think, substantially
better. I almost never take the result as-is still, but it produces a
commit message very close to what I want to see. And note that it's not
blindly producing it; I have extensive instructions about what I expect
and how it should go about it.

The resulting commit messages are better than what I would have written
alone. I spell poorly, I make typos, I forget to mention aspects that
were involved in coming to whatever design got implemented, I'm slow at
digging out the exact error or warning that was emitted into a build log,
I miss CCing someone who touched this area of code in a meaningful way
outside of get_maintainer's git history window, the list goes on and
on. The LLM reads faster, writes faster, and notices missed/forgotten
things better. So for me, I would be delinquent in NOT using its help
to write commit messages.

> Again, we're not aiming for 100% accuracy, we've never considered that
> goal reachable, LLMs or not.

I'm a maintainer for a bunch of subsystems, but I don't have remotely
anywhere near the level of patches coming in as other subsystems, so I'm
still in a little corner of gleeful obliviousness from the perspective of
dealing with review volume, but even I see drive-by patch dumps. I'm not
sure if/how this is scalable, or even the right answer, but the signals
I have for patch review tend to be:

- sender and area trust/reputation (If I'm getting a patch from someone
  that I've taken patches from before, I know I have in the past assessed
  their work as useful/helpful/robust/whatever. And I know what they
  have touched before: if I've landed a bunch of binfmt_elf patches from
  someone, and then later they send me pstore patches, I'm going to be
  surprised and then need to examine this new area of work from them.)

- testing (how was the change tested, how will it continue to be tested,
  etc. Compile-time? Run-time? Unit? Integration?)

- correctness, utility, maintainability, all the rest (the "core" review
  work)

Things like Sashiko give us some mechanistic view into "correctness"
(and I've been working on adding an analysis stage to Sashiko to cover
"testing"[2]). The first one (the matrix of trust across sender vs code
area) look significantly more filterable, though. (The parallel threads
on "ignore all new submitters" is an extreme, and IMO bad, form of
that filter.) Maintainers had been doing this filtering in their heads
basically, and the LLMs changed the volume of people sending patches,
and similarly disrupted the trust part too where suddenly people who
used to send good patches might be sending bad patches. The intent, as
I saw it, of "Assisted-by" was to give a signal about this latter form
(known person sending possibly bad patches suddenly), but it didn't really
work, and then both the LLMs got better and people using them figured out
(I hope) how to wield them better.

So, I'm kind of back to looking at some way to scale my understanding
of any given contributor's reputation[3], area of work, ownership
and responsibility of fixing mistakes, depth of understanding
of various topics outside of their common area of kernel work
(compilers? user-space?), rationality, friendliness, communication style,
etc. And my evaluative criteria is going to be different from other
maintainer's too, so outside of basic facts ("contributor has sent X
many patches"), this is highly subjective stuff that I suspect will
resist objective mechanistic handling.

-Kees

[1] https://lore.kernel.org/all/202507241337.F9595E1D@keescook/
[2] https://github.com/masoncl/review-prompts/pull/100
[3] https://lore.kernel.org/all/35426E86-9663-48D7-8899-B82D62D04A84@kernel.org/

-- 
Kees Cook
