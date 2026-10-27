Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103837;
	b=1uzj61T5sZwyg4yOlvAD9nMrEkHVhKfsLad/hed55SHwVJ5bGcjMYuw/iDnulPsHaZyd
	 IT687dBe8MBHMrmgYibQV757qkV9oG7yj9gt6xgwu+2bSh6jQrN0PJ3TjBz045HuFgcaW
	 zUFvqwLDsXKXdzHc6AndOoYYKcf3Ixrpjlv1EVatgZSyDPzVqp6by3jnMaceiAmWQi9KR
	 0o4gbZsyj/6OtX168blxEvTDgTW+/Z8dOKN6WWCX7HF+URXRv642Q7cloxSHj+PdahVuS
	 KPBNhKAl3Q9guvLq7wGJbtPxHNoFaOVQXXq0Y/dqIINdMbhECh2iCBKIKYzOR9I1evw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103837;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3kyGnW26vs2sjKHmtrbQE7xnzfHT8gYFA7CSDPKdefg=;
	b=wiExJ0mO3x//m+aymB9q9PrII/xvaWXjhREr0LKqfj+sPpNZyIXGm/KwqpnKScp+kX8U
	 suBz/EsWj+QGU4XArJknqvrElr+g0/hgu1Xyzlpkr1nNPMl13x9hd9qrwRq66w7jXDbZk
	 rxgsU8C3BjYVSCAxap8fI/wFkFHzH8PJW/GKujOdOAdv93zRzwicZrWh/77Ygl9fg/QY/
	 w2JS0y5URXTKHBkd4z/fllQCRRtxqJnQneYYEyVlY49Y+ZJx/UCtZzH5O82c2YUXTxVL2
	 ClEVBHbHb0RAmcJdPwXOJy2hoaC6QgudUaBndZ8UvSGABGtEy3WL3lr2aPkyUfNvo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jQIi4Uwx;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A360A2613;
	Tue, 27 Oct 2026 12:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5A360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jQIi4Uwx
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DE7C4BB;
	Tue, 27 Oct 2026 13:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793103696;
	bh=zzDxincjtQ0aOBbrKV1WXfzsyTRV3EKgzJBcWliMlFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQIi4UwxmafaCWDVk4w/Ja6XrQqBxhlYfv/qJi7MXjagGTW4cqH3JlXuamGdB+xCs
	 oE7TB5Qb29+ejleWG7eUYv5bzsb5ayNXa5PqekoaHY2ERMw2qEuQfBaejKxpgr3AC3
	 eMGOtq0NBCSpuly4jWAWbw67eQDV5tVD0C30ab3w=
Date: Tue, 27 Oct 2026 14:23:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261027122346.GA2133989@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
 <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>

On Tue, Oct 27, 2026 at 09:10:33AM +0100, Geert Uytterhoeven wrote:
> On Mon, 26 Oct 2026 at 21:12, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 6:55 AM Krzysztof Kozlowski wrote:
> > > On 21/10/2026 08:49, Eric Biggers wrote:
> > > > On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> > > >> On 21/10/2026 08:39, Eric Biggers wrote:
> > > >>> On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote:
> > > >>>> On 20/10/2026 23:22, Eric Biggers wrote:
> > > >>>>> -Make sure that base commit is in an official maintainer/mainline tree
> > > >>>>> -and not in some internal, accessible only to you tree - otherwise it
> > > >>>>> -would be worthless.
> > > >>>>> +    If ``git format-patch`` with ``--base=auto`` (or
> > > >>>>> +    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
> > > >>>>> +    the current branch having no upstream tracking branch, it exits with
> > > >>>>> +    an error. In such cases, pass an explicit base commit to ``--base``
> > > >>>>> +    instead. This is also needed if git detects the wrong base commit,
> > > >>>>> +    such as when the upstream branch has local, unpublished commits.
> > > >>>>> +
> > > >>>>> +The base commit must be in a well-known public tree, such as the
> > > >>>>> +subsystem development branch the patch is targeting. See
> > > >>>>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
> > > >>>>> +can also be acceptable bases, depending on the subsystem.
> > > >>>>
> > > >>>> I disagree, that's pointlessly too hard requirement.
> > > >>>>
> > > >>>> For many of my contributions base is obvious and not needed to be
> > > >>>> explicitly defined. For all the patches I accept, answer is the same -
> > > >>>> base is either obvious or if not and patch does not apply, then the base
> > > >>>> does not matter.
> > > >>>>
> > > >>>> Requiring it is just bureaucracy without actual benefit.
> > > >>>>
> > > >>>> The only benefit would be if maintainer COULD change its base to apply
> > > >>>> some patch with odd base... but this cannot happen. Maintainer base is
> > > >>>> fixed - it's the HEAD of his development branch for given category of
> > > >>>> commits (e.g. DTS branch for SoC maintainers).
> > > >>>
> > > >>> There are many use cases for applying patches besides the final patch
> > > >>> acceptance, such as review (by anyone, not just a maintainer), testing,
> > > >>> CI systems, etc.
> > > >>>
> > > >>> HEAD of a branch is of course not fixed, and changes every time a patch
> > > >>> gets applied.  That's especially relevant when wanting to check out an
> > > >>> old patch for any reason.  Trying to guess a base commit based on the
> > > >>> date and patch subject is a waste of time.
> > > >>
> > > >> All these tools should just work on top of linux-next. Requiring people
> > > >> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" is
> > > >> pointless. I understand that base is helping, but helping and requiring
> > > >> an obvious information just do not go together.
> > > >>
> > > >> So again: base has ZERO meaning to the maintainer process. It has
> > > >> meaning to tools, so fix the tools to work on known and obvious trees.
> > > >
> > > > So what is your proposed algorithm to apply an arbitrary patch when
> > >
> > > Already provided that, so to recap:
> > >
> > > > there's no base-commit?  Including any historical patch (from
> > > > months/years ago), patches with dependencies, etc.
> > >
> > > Dependency is something else, but for every other patch:
> > > 1. For testing/CI: you apply on top of next
> > > 2. Every other case the maintainer knows where to apply it, because it
> > > is his HEAD of next-branch.
> > >
> > > I am repeating myself, but I really had no single problem of lack of
> > > knowledge where to apply a patch as a maintainer or reviewer of some
> > > subsystem, thus maybe I do not understand the actual problem you are
> > > experiencing.
> >
> > Look at our DT PW. There are numerous patches that don't apply and
> > then we silently don't test them at all. Here's one example[1] (3
> 
> That's a false positive, as the first two patches (the ones that really
> matter for you as DT maintainer) do apply to yesterday's linux-next ;-)
> 
> > actually as the whole series doesn't apply). The more base-commit
> 
> There are indeed patches in that series that cannot be applied, which
> is explained in the cover letter.
> 
> The problem boils down to how to present work that touches multiple
> target trees, and where some parts depend on other work that is
> not yet finished. Do you post it as single series, so people get an
> overview? Do you split it in multiple small series (which may still
> have interdependencies), so everybody looses context?

There's no one-size-fits-them-all solution to this problem. What I want
in those cases is information provided by the person posting the patches
about the dependencies and where to find them. I think there's value in
specifying that information in a machine-parseable way.

> > [1] https://patchwork.kernel.org/project/devicetree/patch/8b2c7719c301a445891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be/

-- 
Regards,

Laurent Pinchart
