Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448658;
	b=n8QGS7OatpF4NnmeMRg4+5uUcd2PG09qA1XNj3lczi3gA/qrPUrV6RktnQFiWr/d/1/C
	 r5HnRX3NyvnbtGYFa6j4zpIoxPRGIw99eeaghCyseWY3mJr3SK8CW1DbK6SE9kVTKi9uQ
	 4+dWDGdjvnFr/4lMGNuYHeZjusjFb+Pk00oWF2H3KRpaH5pLRDHC0fE0nbGamrqKLNWTP
	 hsNX7xrnsDp2sOMti/7HRI1kaKEFrZc8mzTgEPl0TS0acJaDGHyGQuDzm7gBSa8TrsXeK
	 dwOucOi4KSTet1zGVGUxrjt+m7Y+2c+q8E4E7dWQtt96RJF1lYS2NIlcWQo8risGqAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448658;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=onPvjPRqQVZnDMviAeqzCOS3WIpD/+3wg/ABjaKSJFA=;
	b=Y7UKzHFgt+CK5KekCewePbeaXhtIgAbIG+xQSxLMg7RUFmic6i7/IvYTEbzu6xwz/sx+
	 HB4aKgQrLAMdlwwtpcXUxpUznSYsfafewAsWBc6bGMymdyEOeL3LGJVq/uzmW6I/FOB1h
	 aaoh1xt3Rm3QdRABEi0PF6Ilwu6MUy7s47epNi9oMQwWzbDT0OTaHnNg89EFIj9e3kOd3
	 fPqIGuHcT+jdUplJsqBPrKvnB49T1MiQm/DNMDR4b8dnoOcojw5PGlHX7s5r7p3q2owph
	 FtxG+wHc5gRYmuZlfDAezy9Vd9fCeKlv5jffAc6PWy99Lij5Btna+FsJYcMVtsHGUcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bQa37Apa;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8005606A319;
	Mon, 19 Oct 2026 22:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8005606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bQa37Apa
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 138214B0;
	Tue, 20 Oct 2026 00:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792448529;
	bh=WNeWnMyzEEWtGttKeBP65gkCdPp6pYJORJeLpSXSXCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQa37ApaE/sqXRb4EvmGJeQsSdF1UBnWYAHgLb0o39h/B4tE89v923371ZnK372KC
	 dFNk8yIQfs3Q9c6hgGNoSM/JWGKB6hGYwqL6k/RnNoGxKddRFJhHuyz0NXCCHlsoQq
	 IMoZCxRnVjy8IF+INZyAlHOIOl8ivMNLq87Sp48M=
Date: Tue, 20 Oct 2026 01:24:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Theodore Tso <tytso@mit.edu>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261019222413.GB15441@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
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
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>

On Tue, Oct 13, 2026 at 11:23:53PM -0400, Theodore Tso wrote:
> On Tue, Oct 13, 2026 at 02:29:08PM -0500, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> > > On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > Ignoring is the only workable long-term solution.
> > > How do you decide which patches to ignore ?
> > Anything that looks schloppy. ATM it's very easy to tell.
> 
> I think we're going about this the wrong way.  What we want is high
> quality contributions.  If they are high quality, who cares if they
> are AI-generated or not?

I do.

Nobody disagrees that quality of patches is important, and I also hardly
see anyone seriously saying that the fact that a patch is human-written
or LLM-generated is by itself a good measure of quality. If all you care
is that the code performs as described, we can probably stop this
conversation.

What I think makes the value of the Linux kernel is its contributors. I
want passionate developers who will grow in the community and drive the
kernel forward. I want them to understand what they're doing to
contribute meaningfully to the project, and I want to encourage them to
become reviewers and maintainers. I've long believed that it's the
people who make Linux.

This is ultimately why this discussion saddens me. There is a small
number of very vocal long term maintainers who all of a sudden appear
like they've never really cared about the people making the kernel. That
some show a very strong enthousiasm for LLMs doesn't surprise me. What
does is hearing sudden proposals about AI-assisted reputation ranking
where contributors are called "collateral damage". It's borderline
sickening.

> If we get a contribution which is sloppy, it could be because the
> contributor doesn't know how to drive the LLM, or they are using an
> insufficiently powerful or badly chosen LLM --- or both.
> 
> This isn't actually a new problem.  In the pre-AI era, we would
> sometimes get marginal patches, and there is always a question of
> whether it is the maintainer's time to try to engage with a new
> contributor who might turn into the next valued senior contributor and
> reviewer --- or who might be resistant to education and/or who might
> disappear very shortly.  AI makes the problem worse in that there are
> many more newcomers with new contributions, but it's really not a new
> problem.
> 
> If AI is making the review problem more challenging, the good news is
> that there are ways that AI can help.  For example Sashiko can help
> with the early AI review.  And if a newcomer sends 7 versions of the
> patch set in resposee to Sashiko reviews, I will generally not bother
> looking at it personally until a couple of days go past before I waste
> my limited human review bandwidth.  So it's not a case of permanently
> ignoring a patch --- but I may very well down-prioritize when I do pay
> attention.

What else are you expecting the newcomer to do when maintainers tell
they won't look at the patches before sashiko is happy ?

> I also suspect it should be possible to use something like Jev or some
> other System One LLM to help with an initial prioritization for the
> patch, and then have that prioritization be set in patchwork.  Each
> subsystem might have their own criteria which they could encode in
> their prioritization prompt.  For example, if the bug requires root
> privileges and/or a maliciously fuzzed file system, for ext4 it will
> automatically get down-priotized to low priority.
> 
> Using AI-assited priotization may have some collateral damange because
> it might not get the prioritization correct.  But ultimately, if we
> get a flood of patches from newcomers, the choices is either to (a)
> load-shed, or (b) burn out.  And of the two, (a) is the better of two
> bad choices.

-- 
Regards,

Laurent Pinchart
