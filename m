Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56FA217F27;
	Tue, 13 Oct 2026 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897073; cv=none; b=rf1gbqb+/91rKxxO9jbv5TffXwDP1j2Pf5x+8j2j2PC9ets2JYMysx6bDCLFH6UwPkEsgjz8OqxLpY32i0Uvhx+zGZokaKrPMggyge7cpWYcZwDTdJm5qjZtTxqp4GLbwxIt7qZl3lB0FkqA81u8gIKaPcNP1wB6fY0QPp+5PNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897073; c=relaxed/simple;
	bh=sc4YgeHLA3DSN0LORoNUIYzR5PrIZ1JxYbTYLLbLY8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C21rxLSYlHGone0yltqw25vD8naseItQaPxN2EaYeKijRrTLjqVdgRPhZHBDHGJFvcCnAE+EQYGDoI3LVSiHWFjVjxxYe1WvB09xu/Ubp9u6OnStOLhgk13rr6YaaWw1GiknRK4pXzFsG1j3XdFyzFRv+jRpVYlYmPhvLJtEBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tbgO+uEG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tbgO+uEG"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E802230;
	Tue, 13 Oct 2026 15:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791896948;
	bh=sc4YgeHLA3DSN0LORoNUIYzR5PrIZ1JxYbTYLLbLY8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbgO+uEG8y0ny0gtFl+V+3tblulwRVEr8RGfKQivrxbFjRMmZSbZGUC11rdQQ1kQG
	 HYV4ChIztG4CjjJzUlI2bCiGy0Xsf+yPAxJleg8SQH2eyXNhD6aEmuqQ6xVnQYDSD7
	 P9IuOk1kH/t1OThTxPUoHh/lBvH6xPGADjnYG9i8=
Date: Tue, 13 Oct 2026 15:10:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <20261013131056.GI4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>

On Tue, Oct 13, 2026 at 03:03:08PM +0200, Jori Koolstra wrote:
> > Op 13-10-2026 14:55 CEST schreef Laurent Pinchart:
> > On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> > > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > >> tag. Remove the documentation requiring it.
> > > > > >>
> > > > > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > > 
> > > > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > > > > 
> > > > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > > 
> > > > > and for those of us who don't know details about the discussion,
> > > > > how is it redundant?
> > > > 
> > > > No, I mean I use an LLM constantly for almost all aspects of my
> > > > development work, in multiple dimensions, so if the old tag requirement
> > > > held, my email body template would just put "Assisted-by: LLM" in there
> > > > because at the very least, it drove the build and test stage. It was
> > > > redundant in the sense of "yeah, of course I used an LLM at some point
> > > > for this patch". ("This tag means nothing *from* me")
> > > > 
> > > > > Do you assume that everyone now uses it (LLM), just as everyone
> > > > > uses an editor?
> > > > 
> > > > I don't make that assumption, but I always held the position that the
> > > > tag was meaningless because it's the human wielding it that matters:
> > > > they either sent a good patch or a bad patch, and if it was mangled by
> > > > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> > > > me")
> > > 
> > > I think the tag did have a genuine purpose for a while. Now we have just
> > > decided to implicitly attach it to every new submitter (because
> > > basically that is the case.) The point was that a patch that was
> > > obviously LLM generated could be rejected for not carrying the tag, and
> > > a patch that carried the tag could be asked to explain further (if they
> > > had not done so.) Or at least, that is how I felt and have understood
> > > Greg, for instance :)
> > > 
> > > Essentially, the way I read it, is that Linus said we don't need this
> > > roundabout way because we can just reject effortless LLM generated
> > > patches outright. This is good and an improvement.
> > 
> > The absence of the tag on a suspicious series offered a low-effort way
> > for maintainers to push back. What's the proposed low-effort replacement
> > ?
> 
> To ignore it, really. Even less effort :)

Are you saying that we should ignore series when we have even a slight
suspicion they're not perfect ? If not, I don't understand what you're
proposing exactly.

> > > What do you think about requiring people to explain how they used an LLM
> > > for code generation? I don't care if someone uses it for review, or
> > > brainstorming, or whatever, and I have never understood the tag to be
> > > required for that. But if the code is LLM generated, it would be nice to
> > > know for instance what prompts you used. We should have some way to not
> > > devolve into the maze that Jonathan Corbet has sketched, where no one
> > > really knows what's going on.
> > 
> > Listing the prompts seems fairly useless to me. Not only do prompts
> > capture only a small submit of the information you would want (many
> > people use custom agent files with lots of rules that supplement the
> > prompts), they don't show that the submitter understands what they're
> > doing.
> 
> I'm not sure. Maybe requiring prompts is not the best way to go about it,
> it may be a lot of annoyance to go back through your conversations and
> see what prompts were relevant. I do think the prompts still likely show
> whether you understood what you're doing, assuming they were authentic.
> 
> > Mesa has a policy that LLM-generated code *must* have a human-written
> > commit message. They go one step further by requiring all comments in
> > the code to also be human-written. That seems a better (but possibly not
> > good enough) way to try and gauge the level of understand from the
> > submitter.
> 
> Yes, requiring human written commit message sounds like a good idea. Only
> leaves the issue of people using LLMs for translate. But I think we could
> find a way around that.

Automatic translations are fine. They may alter meanings slightly, but
overall the result should be very close to the original message. Unless
I'm mistaken Mesa allows computer translations of comments and commit
messages.

-- 
Regards,

Laurent Pinchart
