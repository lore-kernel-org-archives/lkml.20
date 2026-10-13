Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA04D37B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894521; cv=none; b=EUnRBjoOM2gkBxaYoN45ZOEdKhhYsPkPW0E9zR+0eDTtXkKWcW4DtPS9q+6SVxAQwzZ/VR8G2uuqmiuR/pn1dHteasjKc5NZR7ARpr80UYnu7UxIugNpNHh0ArIo7+Ks/X+FtV41iEnol+U7l6SBAL/AX3/6OFWyXnU6jG+6ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894521; c=relaxed/simple;
	bh=JWf/7Ql3mg0wK7JVxD5fr/uHoFulazGk9KeOtknc5u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+QEIU1mRhPCvyVaTnNjr+GnljxeBLESdtRPBSFfkbYnWlvm7PrHwf6WGc/CwTsNwR1/XOOhdZyMKXPGfIlj9R0IFJdmcRgmS1tcwvckiCNPAogJp0UwEEEJxNX3XVY/4U4wBIzpgtjHmbImHwPzIP2Zmo3kUejdLos3T8pXArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=uAhTfQ/K; arc=none smtp.client-ip=195.121.94.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="uAhTfQ/K"
X-KPN-MessageId: 7291b9eb-c701-11f1-a05e-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 7291b9eb-c701-11f1-a05e-005056abad63;
	Tue, 13 Oct 2026 14:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=8xiPlt+dR34GNav402HcEF7QzICIXRbp/lrL5V9cJBA=;
	b=uAhTfQ/KQ+zQbWjxCZV5Z+xBM0Xf0/owr1qRg2QdaOLjhyiEf0eJh+A5vqq2E6zUh+Gd7p4Cv2Mir
	 Qx6E8TdHj1v9aOLMkQQuPT3sPB6d4LBxuslBQxuGtDNmnfhweXqPNFMoRYUZZaXzn1m9IrhFaG+ju8
	 QoN7JyrYd8sXqwd0PDJLDXmaCtEpXfN5VxUPoKNb1b+FdyhlnuxNDLutXzqHnXPHNWijl/PAr7AkuK
	 qt/Tw6SEPzqXBjprwZpnUFxGRTwg2N4Lo8ryFVQlIV2RFJmngw9a0MGOChRcNP+QADAdr0uibfQ+vw
	 MQRtlX6YZlt5e1zNdpOCkiRY+iDyDHA==
X-KPN-MID: 33|WhPSMgOYBNFpKbw6Mp+oTrHSoBniEy/7wiow5c4bm6YfptCFeSCtcnSfLWXj8Mh
 xyAFriXTzAmVJ/KjHVjny9n0FZG67eL/aT3zgwEeiZmU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|JrogimTguernWkVNqpz7//pL7JtfgEQHZ0bj4mlN8QZVDLTZx9l1eRxLyCGb0ud
 dpjBhLrQVcu07a0pPa8bcuw==
Received: from localhost (unknown [178.227.247.3])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 7262184a-c701-11f1-86d1-005056ab7584;
	Tue, 13 Oct 2026 14:27:25 +0200 (CEST)
Date: Tue, 13 Oct 2026 14:28:43 +0200
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Kees Cook <kees@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <as4gLo_6acb_zZu0@daedalus>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610130120.E43D236E@keescook>

On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > >> tag. Remove the documentation requiring it.
> > >>
> > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > 
> > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > 
> > > Reviewed-by: Kees Cook <kees@kernel.org>
> > 
> > and for those of us who don't know details about the discussion,
> > how is it redundant?
> 
> No, I mean I use an LLM constantly for almost all aspects of my
> development work, in multiple dimensions, so if the old tag requirement
> held, my email body template would just put "Assisted-by: LLM" in there
> because at the very least, it drove the build and test stage. It was
> redundant in the sense of "yeah, of course I used an LLM at some point
> for this patch". ("This tag means nothing *from* me")
> 
> > Do you assume that everyone now uses it (LLM), just as everyone
> > uses an editor?
> 
> I don't make that assumption, but I always held the position that the
> tag was meaningless because it's the human wielding it that matters:
> they either sent a good patch or a bad patch, and if it was mangled by
> gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> me")

I think the tag did have a genuine purpose for a while. Now we have just
decided to implicitly attach it to every new submitter (because
basically that is the case.) The point was that a patch that was
obviously LLM generated could be rejected for not carrying the tag, and
a patch that carried the tag could be asked to explain further (if they
had not done so.) Or at least, that is how I felt and have understood
Greg, for instance :)

Essentially, the way I read it, is that Linus said we don't need this
roundabout way because we can just reject effortless LLM generated
patches outright. This is good and an improvement.

What do you think about requiring people to explain how they used an LLM
for code generation? I don't care if someone uses it for review, or
brainstorming, or whatever, and I have never understood the tag to be
required for that. But if the code is LLM generated, it would be nice to
know for instance what prompts you used. We should have some way to not
devolve into the maze that Jonathan Corbet has sketched, where no one
really knows what's going on.

Best,
Jori.

> 
> -Kees
> 
> -- Kees Cook
