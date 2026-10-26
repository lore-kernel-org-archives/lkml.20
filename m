Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026427;
	b=Ut1nN8SV1n/pdjT4M9Qj7N5kJG/RbGOPzJW6TlmfDp3abYN1A1BrqXvby6O2E+tMIkTJ
	 7dwLEb8zkhGJIQmZ7LDQMsg8a3m1RBxtP5+mPBVjDi+xXCEExOMvKv4omoUCxgpjbeJ3P
	 2KWKN9KxX3QCwQOhpAkk/WvNUlUuu/7Uc8ha4QivKSPQyAHX7Ye4GkknFmPW7vlSw4LlK
	 Y6bR7BYPAO8w1PejWkOUhIecqzre0xscKBHlY3AqW9LFcRpqv7nDdRIb11fxpK0a3v6nk
	 HxTvulSILqPgxwfWEKabUOZ5JEpV00JjHVpbImVNySoagxKgDJ3dkZFheB5n1D7fGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026427;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PovOlb+ViPnZVAmFT0VrCtXgV130f8z4As9X4XzcH+o=;
	b=ST63AGf8EB5eJK0z0tWAul/0ThpXK33Axm0qtq4blQWbZChGdi56w8kX6GlQC73yvWvR
	 7y7qOusXvOMA5LYPwrvNneXhR65CzSf+AL+jrLbZSbvaViPIl7dvH8VcTGMRIw68eeMy9
	 9zdYv+u7a0uKM9X142SyKoOZ4DrZKJZeHzVjHjn+xBVG2s9yqbzmENFlDJoKGk2VYPq7o
	 wlmCIZrjq3V8iyxW+xFgCxx7M8AKkHiJ749LzVgr5ziVVSRRJzqDELib6mnxmnuU5lZ40
	 BXiDdM2cSRyDcU7+9H0uwEv9cUri14xqfhxYDvRvlSBSMRhWJCmUesJGVfFAEpxw8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CH4ifcOu;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424B606A31A;
	Mon, 26 Oct 2026 14:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D424B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CH4ifcOu
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04477268;
	Mon, 26 Oct 2026 15:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793026294;
	bh=EkcGHCcelF+tAJbM5ZBC1oXZxEZ0XvlGOAAkeXNcQ+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CH4ifcOuKZwLrh7P+8/dzLP6VYLWt9qKbGy7pTJDN/pBnvAomxKrbIZCpmpc6/xhb
	 D2H9fj4dVpfHchYEOPi1u5RAH6dKeYExYrJFfF2VYQlr9e+jwwetxOoRD3vE7RkFw1
	 1YwZGHFKYc9Njg8ehipFKOgtgr9G40z7kuOqs9SQ=
Date: Mon, 26 Oct 2026 16:53:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261026145343.GC1001933@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>

On Mon, Oct 26, 2026 at 03:02:27PM +0100, Geert Uytterhoeven wrote:
> On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart wrote:
> > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > > >>
> > > >>> there's no base-commit?  Including any historical patch (from
> > > >>> months/years ago), patches with dependencies, etc.
> > > >>
> > > >> Dependency is something else, but for every other patch:
> > > >> 1. For testing/CI: you apply on top of next
> > > >> 2. Every other case the maintainer knows where to apply it, because it
> > > >> is his HEAD of next-branch.
> > > >>
> > > >> I am repeating myself, but I really had no single problem of lack of
> > > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > > >> subsystem, thus maybe I do not understand the actual problem you are
> > > >> experiencing.
> > > >
> > > > When I review patches, I often need to apply them to a tree, mainly to
> > > > see the context, but sometimes also to test them. I have encountered
> > > > many cases where the patch wouldn't apply on the current for-next branch
> > > > of the relevant subsystem. That's often because the patch had
> > > > dependencies. When I'm lucky they are listed manually in the cover
> > > > letter with a link to a branch, but that's far from being the common
> > > > case. I then have to ask the submitter to provide a branch, or enough
> > > > information to recreate a branch. Having base information (base-commit,
> > > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > > time.
> > > >
> > > > I understand your concern about maintainers cherry-picking and sometimes
> > > > introducing issues as a result. In that case I also prefer asking the
> > > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > > base information for, in my case it helps with the review process.
> > >
> > > That's valid and for 95% (guessing the number...) of cases will be
> > > solved by having linux-next as a base, thus requiring the base
> > > information is redundant. It's just linux-next.
> > >
> > > When patchset does NOT apply on linux-next or maintainer tree is
> > > non-obvious, the base should be provided, but that is only "if ->
> > > should". I think the proposal here is a bit different.
> >
> > What's the downside though ? As git can easily provide the base
> > information once configured to do so, what's the downside of asking
> > contributors to include it ?
> 
> My base is usually not in your or anyone else's tree...

Hence the prerequisite-patch-id and base tree information. Or do you
mean your base is not public at all, neither in the form of a branch
pushed to a public tree, nor as prerequisite patches sent to a public
list ?

-- 
Regards,

Laurent Pinchart
