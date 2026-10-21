Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600372;
	b=w3i/mOOzDWH9M2fBY26+lkQBfu44fwBmF0FWAkV0Zk02gF1nGYDf+y+HNxiJuI5QdulC
	 EbNdfHKduVo71KMICaShHFmzZklUciI9UTP7Oxow8R6aqTlrwJrMm2uX5YRuYhRocMJal
	 yC2e9VufqSxuNOf3n0FWvDo8TsVmpsGHqN0XtHAqlmvoPsgW54x3VI8vCOUzkVYAAoUlz
	 UgeeefEYZgn9cI986Z7lp2Ll6kIFJueQ8oAh72eMkuvMEj0xddvEXdO5+F/dUGNCjejPq
	 nhp8D+8XwieWCM/YB5/bceBuDJdyHoU14yoHxRLch3aMMdL22/nFZXxQB7iua3Stcgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600372;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/4fDPFQq8kEv5tYMLq0Kn317wl6GBDnlbl/tyaxklaQ=;
	b=o8G9fGmQnUJMSJu+6bUJDeYA2zd7O2J41cGTpU2xY5VoUg0dDfK3MgD/PPdd7jyHl2JF
	 mDoMI0JJA92iXyJ4nFwxt3oGGq/MF4o01l9n/noS3GFZUrTeFnIiKA9SI8OUvH0ioSs84
	 Z3N3/rIAlUWPGFcZKbLVdZiCc/UootiqTMulnarYSn4jbWPeOTQYzrWCsf3fqHG1Vsv4C
	 ym6sQt3s+7Rf9xuFSgcXpJlILWFEflrfhS3m2S60VMrwNC2y2FGtzFAkHwDwDrOSr8Onv
	 1+7fb6elRDVzNZR4C95grsXwUkdijCXXF+y5STJpZUtzZx9HMA9Qe2pm9R2gzuQezEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=NNY0Go1p;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99888606A32D;
	Wed, 21 Oct 2026 16:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99888606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=NNY0Go1p
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DC251F8;
	Wed, 21 Oct 2026 18:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792600236;
	bh=CEaI4acfak2EQ+4Yx8UeRxPKVO6MW1c1FcRLi3pNih0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNY0Go1phCuFQVGH+GmwW501sbdSJAcZc7mbDXoxBDQ60Tmz9EyhGEwD6kdDUsPIH
	 ejifUPPiSq4SpyNxpFrBWBFCMyjBzzIZyXMj1MGyT7+479zwKpMM4I7d9TsOMFOxy4
	 /Np0BFJG55n6YEuG5xa8W/0tV5JZJM9dJkX8BweQ=
Date: Wed, 21 Oct 2026 19:32:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021163242.GB325924@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
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
In-Reply-To: <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>

On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 08:49, Eric Biggers wrote:
> > On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/10/2026 08:39, Eric Biggers wrote:
> >>> On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 20/10/2026 23:22, Eric Biggers wrote:
> >>>>> -Make sure that base commit is in an official maintainer/mainline tree
> >>>>> -and not in some internal, accessible only to you tree - otherwise it
> >>>>> -would be worthless.
> >>>>> +    If ``git format-patch`` with ``--base=auto`` (or
> >>>>> +    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
> >>>>> +    the current branch having no upstream tracking branch, it exits with
> >>>>> +    an error. In such cases, pass an explicit base commit to ``--base``
> >>>>> +    instead. This is also needed if git detects the wrong base commit,
> >>>>> +    such as when the upstream branch has local, unpublished commits.
> >>>>> +
> >>>>> +The base commit must be in a well-known public tree, such as the
> >>>>> +subsystem development branch the patch is targeting. See
> >>>>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
> >>>>> +can also be acceptable bases, depending on the subsystem.
> >>>>
> >>>> I disagree, that's pointlessly too hard requirement.
> >>>>
> >>>> For many of my contributions base is obvious and not needed to be
> >>>> explicitly defined. For all the patches I accept, answer is the same -
> >>>> base is either obvious or if not and patch does not apply, then the base
> >>>> does not matter.
> >>>>
> >>>> Requiring it is just bureaucracy without actual benefit.
> >>>>
> >>>> The only benefit would be if maintainer COULD change its base to apply
> >>>> some patch with odd base... but this cannot happen. Maintainer base is
> >>>> fixed - it's the HEAD of his development branch for given category of
> >>>> commits (e.g. DTS branch for SoC maintainers).
> >>>
> >>> There are many use cases for applying patches besides the final patch
> >>> acceptance, such as review (by anyone, not just a maintainer), testing,
> >>> CI systems, etc.
> >>>
> >>> HEAD of a branch is of course not fixed, and changes every time a patch
> >>> gets applied.  That's especially relevant when wanting to check out an
> >>> old patch for any reason.  Trying to guess a base commit based on the
> >>> date and patch subject is a waste of time.
> >>
> >> All these tools should just work on top of linux-next. Requiring people
> >> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" is
> >> pointless. I understand that base is helping, but helping and requiring
> >> an obvious information just do not go together.
> >>
> >> So again: base has ZERO meaning to the maintainer process. It has
> >> meaning to tools, so fix the tools to work on known and obvious trees.
> > 
> > So what is your proposed algorithm to apply an arbitrary patch when
> 
> Already provided that, so to recap:
> 
> > there's no base-commit?  Including any historical patch (from
> > months/years ago), patches with dependencies, etc.
> 
> Dependency is something else, but for every other patch:
> 1. For testing/CI: you apply on top of next
> 2. Every other case the maintainer knows where to apply it, because it
> is his HEAD of next-branch.
> 
> I am repeating myself, but I really had no single problem of lack of
> knowledge where to apply a patch as a maintainer or reviewer of some
> subsystem, thus maybe I do not understand the actual problem you are
> experiencing.

When I review patches, I often need to apply them to a tree, mainly to
see the context, but sometimes also to test them. I have encountered
many cases where the patch wouldn't apply on the current for-next branch
of the relevant subsystem. That's often because the patch had
dependencies. When I'm lucky they are listed manually in the cover
letter with a link to a branch, but that's far from being the common
case. I then have to ask the submitter to provide a branch, or enough
information to recreate a branch. Having base information (base-commit,
prerequisite-patch-id, and possibly base-tree) would save me quite some
time.

I understand your concern about maintainers cherry-picking and sometimes
introducing issues as a result. In that case I also prefer asking the
submitter to rebase, retest, and resubmit. That's not what I want to use
base information for, in my case it helps with the review process.

-- 
Regards,

Laurent Pinchart
