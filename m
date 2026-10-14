Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EC63A0E86
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948312; cv=none; b=gTGKB6PyBYX/iDMZmQtaIkEGW5lMnsDY79UNbp8dql3qnwgVaTJyhu31ri7cHhvt7tsEf0ofw5LGh7v9HfldS30YbMrqnUpVtjXmFjIxN+Otf5xYt0ji5sc61w8QXpoC0c5YpdSi2HLX9EvwW52qCg3JIcxX0gumhnHeM5PRGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948312; c=relaxed/simple;
	bh=Cvzf8DygOJrI+qQl9SJJL+k/akBvvsnBIBK/RZNZ074=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rax2pcWN78ksipK+dHSgPZPyBwfA0W6LyLng9l6t42uK/CLu+kojgluvXOqJsrzw09gN+ch7j/vI9K1Jl8s+Ku16bxwGskR6WiUBE/1eWS2DdGfBr4nPwrtwCOFCyL81WSBTHJ5IWIJMuQZfvpxDMyGTOPGWWaaFPxYIHSHJ+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=kpcODCCS; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="kpcODCCS"
Received: from macsyma.thunk.org (pool-173-48-111-204.bstnma.fios.verizon.net [173.48.111.204])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69E3Nv6V019206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 23:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1791948244; bh=z3yqKHRDrqQQiz8tqpY89YBl4PBNpsH6SLTwbnMqKdc=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=kpcODCCSK+XafIp5lMILCnfvJkpUUutPJswB1SG7jeHDeBvO68RqAkYE9ltoiMiWI
	 NM69IE/qYMyrLQXFg/zT3mY6K1DkZcUyegrEV5wdfCfL+/diijwZSawKOCQ2IuHACk
	 3njDVYDja+Fzc40udyQPI8GkyZRlFTCzdzSAMpgM/OVV7HVwqncJ3XdXS8d7fcxYUD
	 m/dfSjhFatFR1zqVuaClBD6KVSXXqz4W9Lxz1kQbAMzi5PjCs8qb11EWVrf/c/x327
	 8+C1CPDEp3ChH9y9w/3i/7SS374K7DX9XinedOaEPP9QqmzisXEHRKiWq66p9zf2Ky
	 CO7ya/+erg0qA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 0EB932070BE3; Tue, 13 Oct 2026 23:23:54 -0400 (EDT)
Date: Tue, 13 Oct 2026 23:23:53 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Justin Stitt <justinstitt@google.com>,
        Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jori Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <as7uqZn9rQ52USwy@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as4xMnT8a75pIw9v@gremlin>

On Tue, Oct 13, 2026 at 02:29:08PM -0500, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> > On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > Ignoring is the only workable long-term solution.
> > How do you decide which patches to ignore ?
> Anything that looks schloppy. ATM it's very easy to tell.

I think we're going about this the wrong way.  What we want is high
quality contributions.  If they are high quality, who cares if they
are AI-generated or not?

If we get a contribution which is sloppy, it could be because the
contributor doesn't know how to drive the LLM, or they are using an
insufficiently powerful or badly chosen LLM --- or both.

This isn't actually a new problem.  In the pre-AI era, we would
sometimes get marginal patches, and there is always a question of
whether it is the maintainer's time to try to engage with a new
contributor who might turn into the next valued senior contributor and
reviewer --- or who might be resistant to education and/or who might
disappear very shortly.  AI makes the problem worse in that there are
many more newcomers with new contributions, but it's really not a new
problem.

If AI is making the review problem more challenging, the good news is
that there are ways that AI can help.  For example Sashiko can help
with the early AI review.  And if a newcomer sends 7 versions of the
patch set in resposee to Sashiko reviews, I will generally not bother
looking at it personally until a couple of days go past before I waste
my limited human review bandwidth.  So it's not a case of permanently
ignoring a patch --- but I may very well down-prioritize when I do pay
attention.

I also suspect it should be possible to use something like Jev or some
other System One LLM to help with an initial prioritization for the
patch, and then have that prioritization be set in patchwork.  Each
subsystem might have their own criteria which they could encode in
their prioritization prompt.  For example, if the bug requires root
privileges and/or a maliciously fuzzed file system, for ext4 it will
automatically get down-priotized to low priority.

Using AI-assited priotization may have some collateral damange because
it might not get the prioritization correct.  But ultimately, if we
get a flood of patches from newcomers, the choices is either to (a)
load-shed, or (b) burn out.  And of the two, (a) is the better of two
bad choices.

						- Ted
