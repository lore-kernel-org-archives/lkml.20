Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011268;
	b=u/8AyV4kkXvgmOoRexSkdPu4oXP3Yy5MwWhGaB8jgCBMlMWtJflpFqbzmyFZFOUAD1JH
	 bb+gtWCEo7PVqs8P+FqdfhyIvF5uV07xyz+1HvT5ZSz6D2x8RqLut2w/oaJ5aKAjnBlzO
	 PPiXLq4i1X9dDb/3otOqhb54rRsCsVQ/U37cR/wlZiPL6uItLheC8n6wwXItaxd1m3bE0
	 apZiS2hfIJtEu8GSFari9gzlafyuyRT2g83e+Fjp+Us/n/FXbn8E6Gniqv5xQg0+ox7Wm
	 m8suN1S1tpG9oIkwN1lNbQVz16pQm41BKbq9Jf1k7v+G3iL7pA6ocdtln9unjCwMtEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011268;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qV4ZHJFXjIYgpG7WVAH0k5qU5yzw+vLtfj/KzRxTo3U=;
	b=Ekg8rxcfvEcn1qtFHs61m50LqYfh2VFtrHujnPyFi0fkalzrj33fmndxpXzLcQjT8Xsk
	 Ac3T1Q7JtHsHyjzPP3ZO6zGGo/EgG4h7/kyT0X2bHwu21slN861PJRT/GdkC4DnRw3Y8s
	 t2AghE+Ets271nIm6miXbFWrq48ri6FaiPSKq55BgpTARFXtCeh1vkLBwj7YHqg4m4sSQ
	 6FmFcRIyu1kRTOs1xCrb2SPPwcqP7ubu58dgwsJwlnSIAMBQNBC0JsKr2dS9UmYc2lquv
	 fYucPNFN3+/kuR+nQdlTpZEuwvgr4L37dNpMJhcORTmXOMr9wvM6W+n/o9QMsD9zzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mUk35RM6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25487606A31A;
	Mon, 26 Oct 2026 10:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25487606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mUk35RM6
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FDD9269;
	Mon, 26 Oct 2026 11:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793011126;
	bh=ze4wP+aSFuxF6kwJKEwmj5+aDh4YZVbDYD1zVIzKoow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUk35RM63pPwTNvFC8/1J2kr0lWcAlBAmAG8BcVBBp/Fxbo9f6Uk/nkkGcqILi6DE
	 6E9y8JQzqswYZzkPxVskrX7v3aYD+4t8XJIpTiXTmdzWRrc8WDZ/+FMIhaXvWtphlo
	 Audz7q7mNwe2WDmqMiGiwd8pjb7YnKlQv2ADRbZc=
Date: Mon, 26 Oct 2026 12:40:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261026104056.GH15441@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
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
In-Reply-To: <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>

On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 18:32, Laurent Pinchart wrote:
> > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> >>
> >>> there's no base-commit?  Including any historical patch (from
> >>> months/years ago), patches with dependencies, etc.
> >>
> >> Dependency is something else, but for every other patch:
> >> 1. For testing/CI: you apply on top of next
> >> 2. Every other case the maintainer knows where to apply it, because it
> >> is his HEAD of next-branch.
> >>
> >> I am repeating myself, but I really had no single problem of lack of
> >> knowledge where to apply a patch as a maintainer or reviewer of some
> >> subsystem, thus maybe I do not understand the actual problem you are
> >> experiencing.
> > 
> > When I review patches, I often need to apply them to a tree, mainly to
> > see the context, but sometimes also to test them. I have encountered
> > many cases where the patch wouldn't apply on the current for-next branch
> > of the relevant subsystem. That's often because the patch had
> > dependencies. When I'm lucky they are listed manually in the cover
> > letter with a link to a branch, but that's far from being the common
> > case. I then have to ask the submitter to provide a branch, or enough
> > information to recreate a branch. Having base information (base-commit,
> > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > time.
> > 
> > I understand your concern about maintainers cherry-picking and sometimes
> > introducing issues as a result. In that case I also prefer asking the
> > submitter to rebase, retest, and resubmit. That's not what I want to use
> > base information for, in my case it helps with the review process.
> 
> That's valid and for 95% (guessing the number...) of cases will be
> solved by having linux-next as a base, thus requiring the base
> information is redundant. It's just linux-next.
> 
> When patchset does NOT apply on linux-next or maintainer tree is
> non-obvious, the base should be provided, but that is only "if ->
> should". I think the proposal here is a bit different.

What's the downside though ? As git can easily provide the base
information once configured to do so, what's the downside of asking
contributors to include it ?

-- 
Regards,

Laurent Pinchart
