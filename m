Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2B3955EB;
	Tue, 13 Oct 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899773; cv=none; b=XfmT3TKjb040ccnPQkzpX0O7kNvdXYGOWPLV8R6sPuyBf6TNzzsdfPk4gO9Yj554UpD8ETY4q5AgQLNZxlGqg0rv9bzug8NhZNErz665k+oggTYceLygJwTLokN8s+KXcdenEcfCrcAR5JDKajCdKhFGfrsZtvpHbQ5PAJLQ2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899773; c=relaxed/simple;
	bh=4Gd7CRlI8kHfcSrkg3umhUme9cQhOQ2/wMZTRkDN27w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JipngasEFxH2BZegGxmozIzbhzALXqfAAhgIgoJNFBcELWtltAXs4Qugcx0Rk936bkeJuG+cHjY+kzbnOcEaSWo5uh8JQk3Lm+aAnyraGofoXLYKacQ1KgqKqzOOxVWmXODSkmY9ZV1NIuQ/JFACbDOveQsH0za3RHB/L+XH9Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N5RW+SkD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N5RW+SkD"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04584230;
	Tue, 13 Oct 2026 15:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791899648;
	bh=4Gd7CRlI8kHfcSrkg3umhUme9cQhOQ2/wMZTRkDN27w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5RW+SkDsM0fpi7wpwv60+4Y64bvNe9afz9Y9wdA4lk6sDBnXtH7+EXVIPviE17OK
	 JkR7b3u59rLWxFOcxhxKvBxAFuqV+8ksQTqLNzqf/5bHp0oZ8LIJRqeeMC1UzRWscx
	 YIhcOWfb++fNOij663KNIYjoJZ1aoz/SnmJlAEpo=
Date: Tue, 13 Oct 2026 15:55:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <20261013135559.GA161185@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>
 <20261013131056.GI4214@killaraus.ideasonboard.com>
 <28216768.791900.1791897606751@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28216768.791900.1791897606751@kpc.webmail.kpnmail.nl>

On Tue, Oct 13, 2026 at 03:20:06PM +0200, Jori Koolstra wrote:
> Op 13-10-2026 15:10 CEST schreef Laurent Pinchart:
> > On Tue, Oct 13, 2026 at 03:03:08PM +0200, Jori Koolstra wrote:
> > > > Op 13-10-2026 14:55 CEST schreef Laurent Pinchart:
> > > > On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> > > > > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > > > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > > > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > > > >> tag. Remove the documentation requiring it.
> > > > > > > >>
> > > > > > > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > > > > 
> > > > > > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > > > > > > 
> > > > > > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > > > > 
> > > > > > > and for those of us who don't know details about the discussion,
> > > > > > > how is it redundant?
> > > > > > 
> > > > > > No, I mean I use an LLM constantly for almost all aspects of my
> > > > > > development work, in multiple dimensions, so if the old tag requirement
> > > > > > held, my email body template would just put "Assisted-by: LLM" in there
> > > > > > because at the very least, it drove the build and test stage. It was
> > > > > > redundant in the sense of "yeah, of course I used an LLM at some point
> > > > > > for this patch". ("This tag means nothing *from* me")
> > > > > > 
> > > > > > > Do you assume that everyone now uses it (LLM), just as everyone
> > > > > > > uses an editor?
> > > > > > 
> > > > > > I don't make that assumption, but I always held the position that the
> > > > > > tag was meaningless because it's the human wielding it that matters:
> > > > > > they either sent a good patch or a bad patch, and if it was mangled by
> > > > > > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> > > > > > me")
> > > > > 
> > > > > I think the tag did have a genuine purpose for a while. Now we have just
> > > > > decided to implicitly attach it to every new submitter (because
> > > > > basically that is the case.) The point was that a patch that was
> > > > > obviously LLM generated could be rejected for not carrying the tag, and
> > > > > a patch that carried the tag could be asked to explain further (if they
> > > > > had not done so.) Or at least, that is how I felt and have understood
> > > > > Greg, for instance :)
> > > > > 
> > > > > Essentially, the way I read it, is that Linus said we don't need this
> > > > > roundabout way because we can just reject effortless LLM generated
> > > > > patches outright. This is good and an improvement.
> > > > 
> > > > The absence of the tag on a suspicious series offered a low-effort way
> > > > for maintainers to push back. What's the proposed low-effort replacement
> > > > ?
> > > 
> > > To ignore it, really. Even less effort :)
> > 
> > Are you saying that we should ignore series when we have even a slight
> > suspicion they're not perfect ? If not, I don't understand what you're
> > proposing exactly.
> 
> I am saying it is up to the maintainer.

That has always been the case. It may have been voiced again in a way
that is more noticeable to some, but maintainers have always been in
charge of deciding that they accept.

And at the same time it has never been the case. Maintainers can be
overruled. One of the most recent examples to have made the news was the
merge of rust bindings for the DMA mapping API.

If the situation hasn't fundamentally changed, I hope I'm misreading
this mail thread. I see people who seem to rejoiced at the news they
have gained a power in their fiefdom that they can use and abuse at
will. Being on the receiving end of patches I wish I would have never
received I sympathize and understand we need to adjust processes. On the
flip side, I hope I won't see a patch being rejected on the grounds that
the submitter hasn't attended the same boys' club as the maintainer.

Sanity often prevails after people cool down, I assume that will be the
case here too.

> The word is out and we are allowed to
> ignore poor contributions, in particular if they are LLM generated. The whole point
> is that in the past poor contributions were still a signal someone was trying and
> it might be worthwhile to help them to grow. It is not that signal anymore per se.
> We need other avenues to identify talent. The kernel mentorship program is one of
> those, as is showing up in person at conferences.

I think mailing lists are still a proper avenue. LLM-generated series
(so far) never made me think there was someone trying and interesting in
growing.

> The tag helped some maintainers to push back (like Lorenzo). The tag isn't needed
> anymore, because the push back isn't needed. I think that's an improvement, and at
> any rate was inevitable.

Ignoring is one way to push back. I still stand by what I say, I find
the requirement of disclosure (regardless of whether it comes from an
Assisted-by tag or something else) helpful for the middleground cases
that don't necessarily require being ignored.

-- 
Regards,

Laurent Pinchart
