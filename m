Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD80199EAD;
	Tue, 13 Oct 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896173; cv=none; b=PDdBF/8rKjD2y70xxcchqt5SIXlw953gT+eNyHEFFEsH1DLvClFSyFfne0BZdbhNzIuWyUc4U5nABPFRofSiRQ0s+kNIZRmeSk708AKp8LznZTUkLRBmhyKTsoRuCWBrPY+l75ISOLrcpeaEkICzEpQUKVt1yij3rj3Zg9nDNC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896173; c=relaxed/simple;
	bh=i5TTd5EpEwRGqjaeKmwJZyvVeQHKs7QXG0k5nXK/izU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEfVGSyQHCo5L0qOGfr6o7N6fWUKjOxp3EtB/Gddl2aFqHCmeSEzPF+Ud5Hshs6Qwz/XKMbTT0xhn68kX4rVTjKnEgCxCeYkDS7D/uiC64vG7N5NaBZ/+/gh9uwBJBGUrEvwTq2hxneyUNX/zBjuLFzMJZlpP4QJu6rcyILFtm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VYuBpQQq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VYuBpQQq"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F246B1E4;
	Tue, 13 Oct 2026 14:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791896048;
	bh=i5TTd5EpEwRGqjaeKmwJZyvVeQHKs7QXG0k5nXK/izU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYuBpQQqo3+RGfvaIRHim0upgn0O/SIm//xEMRl0iXvJV+eSd+5uDT1p5xDEVN+M1
	 GAbvmOZwbq90aYJzAaUkBqWrQgwPwYYImj241GScdawWnuNYZOIAy+kGNOPgOwFJZZ
	 1gHKuAQZ8UWBCtkzE9RDTTbW6RhchXZ3DittGJfc=
Date: Tue, 13 Oct 2026 14:55:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <20261013125559.GG4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as4gLo_6acb_zZu0@daedalus>

On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > >> tag. Remove the documentation requiring it.
> > > >>
> > > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > 
> > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > > 
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > 
> > > and for those of us who don't know details about the discussion,
> > > how is it redundant?
> > 
> > No, I mean I use an LLM constantly for almost all aspects of my
> > development work, in multiple dimensions, so if the old tag requirement
> > held, my email body template would just put "Assisted-by: LLM" in there
> > because at the very least, it drove the build and test stage. It was
> > redundant in the sense of "yeah, of course I used an LLM at some point
> > for this patch". ("This tag means nothing *from* me")
> > 
> > > Do you assume that everyone now uses it (LLM), just as everyone
> > > uses an editor?
> > 
> > I don't make that assumption, but I always held the position that the
> > tag was meaningless because it's the human wielding it that matters:
> > they either sent a good patch or a bad patch, and if it was mangled by
> > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> > me")
> 
> I think the tag did have a genuine purpose for a while. Now we have just
> decided to implicitly attach it to every new submitter (because
> basically that is the case.) The point was that a patch that was
> obviously LLM generated could be rejected for not carrying the tag, and
> a patch that carried the tag could be asked to explain further (if they
> had not done so.) Or at least, that is how I felt and have understood
> Greg, for instance :)
> 
> Essentially, the way I read it, is that Linus said we don't need this
> roundabout way because we can just reject effortless LLM generated
> patches outright. This is good and an improvement.

The absence of the tag on a suspicious series offered a low-effort way
for maintainers to push back. What's the proposed low-effort replacement
?

> What do you think about requiring people to explain how they used an LLM
> for code generation? I don't care if someone uses it for review, or
> brainstorming, or whatever, and I have never understood the tag to be
> required for that. But if the code is LLM generated, it would be nice to
> know for instance what prompts you used. We should have some way to not
> devolve into the maze that Jonathan Corbet has sketched, where no one
> really knows what's going on.

Listing the prompts seems fairly useless to me. Not only do prompts
capture only a small submit of the information you would want (many
people use custom agent files with lots of rules that supplement the
prompts), they don't show that the submitter understands what they're
doing.

Mesa has a policy that LLM-generated code *must* have a human-written
commit message. They go one step further by requiring all comments in
the code to also be human-written. That seems a better (but possibly not
good enough) way to try and gauge the level of understand from the
submitter.

-- 
Regards,

Laurent Pinchart
