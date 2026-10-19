Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449893;
	b=JhhaqX1tXQqUVeLsj862Pf9/QjuIX2H1HDre+Ecmi1Rx8NxvCinyfW+sRSQzoe5KqPw/
	 so+adXWfWY5wWGPwTVSoO1ePHP1RD5bHDEQFbwJxgX7HesCQo3avqkV3jkNO0nRhp3vhp
	 O6lbpjorbmfD69O8H5rWcs4GBBVWhwU4dsBKDB53o+ws0i6LIm0gav3aB9z2UYBDf5H/I
	 zvHvUbvaEKfkOBUbVryoi78FnwVYCIdHXwIqhEr/Or/A2iHv5LDCWdKR7+qKr2LRadQhk
	 5GLBVcS7KHLGCwIs/ZwGD+uUYyS+sgmtAjLRYR+3Eb8ExYMng99wthIy8ph8SkJBqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449893;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=87IXxZqsowa9WY0C27LLwmzXedneWOVTtTPcbXwZCjk=;
	b=2wy7oClRnyf3TfAS+/hZHFsN7NjfnTzkPH7YlGKmUVmko+Nk8R/PPJzMSyozvId1H1FJ
	 lTDez/s5zdUbYb0x+r1B8WU5mPeTQyFamRxry1+TW1vuaGsAGmFVmQLqBpIGzM32a8SAW
	 TLz/bulYI2rM4oxWYpouZuowl9hbPeu4OCQIH6DXXR9NvsVMaEsApf9n1thysBpiVz2dc
	 uZgmdDM0cPVN4gZcNtHcg44iGmZexGKc2tdzrzTYZdrAZzQl32NzG/Kc1bLhK76MWbbdf
	 2dDp8COEUE6ApGpW2GhYtOmVIrYAk8wX9zJ8VsK1/ESt3OhbIPetWLV3XI+2jNc5wGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UZiFLgVo;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BF606A319;
	Mon, 19 Oct 2026 22:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42BF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UZiFLgVo
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD9F04B0;
	Tue, 20 Oct 2026 00:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792449764;
	bh=GjiflgJjyYsS6WFluUw0flEVnXTtdzMofp1CJbun8dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZiFLgVoafmWTtKpkHNdzLnR6LkGkUa+dzsBOluBO2OEzBahJDUey2LEd6EBjhz7M
	 z1aMKuPPmPoYAAif37t+6iAhfoGMyglBkeL8+02eDRYS6kHvFlU9wLa9LOSkhzH2+w
	 BszRJJv7r2HLKUEGnNf+06T0k7hbQhbQqXysZCts=
Date: Tue, 20 Oct 2026 01:44:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
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
Message-ID: <20261019224448.GC15441@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
 <as-Dwg8DcEOYMXki@gremlin>
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
In-Reply-To: <as-Dwg8DcEOYMXki@gremlin>

On Wed, Oct 14, 2026 at 02:42:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 11:23:53PM -0400, Theodore Tso wrote:
> 
> > I think we're going about this the wrong way.  What we want is high
> > quality contributions.  If they are high quality, who cares if they
> > are AI-generated or not?
> 
> Recently 2 people sent 1,000 patches over 2 hours. Care to check each and
> every patch for 'quality'? :) Only the beginning.

That's the kind of behaviour that should be easy to detect, and I have
absolutely no issue with sending all those patches to /dev/null. This is
script kiddies behaviour, not the work of someone with good intentions.
Ignoring those patches is not "collateral damage".

We could go a step further. There's also an increase in patches from
newcomers who send a few patches only, with the usual signs of not
understanding what they're doing: code changes that give an eerie
feeling, very large comment to code ratios, and commit messages longer
than the three volumes of Lord of the Rings combined. As far as I
understand, those are also the kind of contributions that many
maintainers in this e-mail thread would like to ignore. Perhaps with an
automated reply to tell that the kernel expects submitters to understand
what they're doing and own their code, as this category is less of an
obvious on-purpose DoS attack.

There's some irony there though. I wouldn't be surprised if the
headlines about kernel maintainers loving LLMs made the flood of patches
even worse, and we now have maintainers essentially saying they don't
want to receive most of the LLM-generated patches.

> > If we get a contribution which is sloppy, it could be because the
> 
> Schloppy, not sloppy :) I.e. tells. Turn of phrase, certain 'shapes' in the
> code/commit msgs, newcomer/recently reactivated? Sent a bunch of mails
> across many subsystems? etc.
> 
> To be scaleable the check has to be very quick. In the end it'll sadly
> probably just have to be 'newcomer?'. It sucks but this is existential.
> 
> > This isn't actually a new problem.  In the pre-AI era, we would
> 
> Sorry you're completely wrong, it's entirely a new problem.
> 
> Nobody could drive thousands of at least plausible patches end-to-end with
> little to no input in the past. INCLUDING replies.
> 
> > If AI is making the review problem more challenging, the good news is
> > that there are ways that AI can help.  For example Sashiko can help
> 
> Sashiko only checks if the code is buggy or not, not whether it's worth
> having or is a total mess or not. So completely unhelpful (speaking from
> experience).
> 
> > I also suspect it should be possible to use something like Jev or some
> > other System One LLM to help with an initial prioritization for the
> > patch, and then have that prioritization be set in patchwork.  Each
> 
> Using AI to detect AI right now works, who knows in the future. But that's
> an arms race which we'll eventually lose. Which also costs money...

I'm sure AI companies will disagree with you :-)

> > Using AI-assited priotization may have some collateral damange because
> > it might not get the prioritization correct.  But ultimately, if we
> 
> Any solution will incur collateral damage, sadly inevitable.

-- 
Regards,

Laurent Pinchart
