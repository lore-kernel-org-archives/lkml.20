Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B84D9F9C;
	Wed, 14 Oct 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985339; cv=none; b=OZHFoptiFS+MK8DQ7I3x8ps9g39f6daEZNG1pcpHQwhK7cAN90m/51XiVFMNTahs7wQve3SowVt3IxIi/t0mfiypCRzrmGmsm4sOf4eKmVG6YPxMNZHQ8k+gP/NUmxwCww1xFQ6zTmMmU4+MSfUH4T+KIJ0/jvPKtKwY87Ru/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985339; c=relaxed/simple;
	bh=gKom46KYHi3Ug8rNqRkBYTq7WsJJsb/Y/B9p/oLEB9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMBrGPCDIlMUdWcZ3a6cpZ///sOtr2kYLUhdnHAjAahO3r9GCIQR+fAUxmucjkqvgG1B4KmDU6kT9jgG3NlgM9BQkF1DMIouXL51rG9GxNosY6qF/ZlT2epZ6C/h2SrkKRWRXfQHbUmW8SNlNSBQPhvOkppiJvrhPbQezuBFFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBQ/7lsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBQ/7lsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A712B1F000FF;
	Wed, 14 Oct 2026 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985337;
	bh=mzcFQtKFlPS4VvT83K21ZA+ElcJoZ8GBpvRbKSDyLok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBQ/7lsyMfT7atJIM6A4CXtsHvKUcUKgDOzUwWLCZ2WSdFUf5P41a9dtDetYjLziF
	 L2eBXEdioe/w8rVGP2GZ6RBy8zMkVi9r9EbYl9TDuSunoEhiRklcnqZY9rGOwAU3Fw
	 JZ2cucwv4hzgfzSScxF5Ai28MJGFC6F4arTToCR2TezWL5gdIXfLA3zymiVHQk/Dti
	 QcoUEjwY1uXBh8y5OFdY3wQTRLSVPJ69aDZLS98uY/Rl72gydQRAyAmrPp5qCFIliE
	 PUU3bHMbW76o3/3A5Mo9mZa7toApSmQPOS7ZZajsuOtIIPSaHhrS+3CpAKnr9B1qKG
	 8EKahsGZogoEg==
Date: Wed, 14 Oct 2026 14:42:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
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
Message-ID: <as-Dwg8DcEOYMXki@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>

On Tue, Oct 13, 2026 at 11:23:53PM -0400, Theodore Tso wrote:

> I think we're going about this the wrong way.  What we want is high
> quality contributions.  If they are high quality, who cares if they
> are AI-generated or not?

Recently 2 people sent 1,000 patches over 2 hours. Care to check each and
every patch for 'quality'? :) Only the beginning.

>
> If we get a contribution which is sloppy, it could be because the

Schloppy, not sloppy :) I.e. tells. Turn of phrase, certain 'shapes' in the
code/commit msgs, newcomer/recently reactivated? Sent a bunch of mails
across many subsystems? etc.

To be scaleable the check has to be very quick. In the end it'll sadly
probably just have to be 'newcomer?'. It sucks but this is existential.

> This isn't actually a new problem.  In the pre-AI era, we would

Sorry you're completely wrong, it's entirely a new problem.

Nobody could drive thousands of at least plausible patches end-to-end with
little to no input in the past. INCLUDING replies.

> If AI is making the review problem more challenging, the good news is
> that there are ways that AI can help.  For example Sashiko can help

Sashiko only checks if the code is buggy or not, not whether it's worth
having or is a total mess or not. So completely unhelpful (speaking from
experience).

> I also suspect it should be possible to use something like Jev or some
> other System One LLM to help with an initial prioritization for the
> patch, and then have that prioritization be set in patchwork.  Each

Using AI to detect AI right now works, who knows in the future. But that's
an arms race which we'll eventually lose. Which also costs money...

> Using AI-assited priotization may have some collateral damange because
> it might not get the prioritization correct.  But ultimately, if we

Any solution will incur collateral damage, sadly inevitable.

--
Cheers, Lorenzo
