Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045950;
	b=y/CSEoT5mpcWiGh0jr8uHxK9AWJjSF+lKLoHTT4qGRioWn/F/Wyzjpro5GFj6QB2C3Uz
	 Xs2fu+BLnd1rcG0QiTeuTDdqQfORdLNP0WRbWw6vhNieTCoZQ0eRoNg8i3VT8hXvjvI2s
	 tNHHSwxDdAKSc7CTotMGgh6QUD1zJl/lYc0qcn5u9RzoU87T8Pc7i3eZ3r1vw+f7q0aq/
	 OElAJDVGF2khHkhhDpAtb/3FF4Xwo38JcLd6TsCmTGPbLDNIZG4MBmwflB4BKPPKl6lHR
	 VmcXchnn0ax+zs/DI13atbpqYoBJZVu43U8hVlUx1fKX8B3qi3dpmkBkSr/CKlAOfgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045950;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=iqkFxV8nP7M3bMS76DwvwvlKzwURwpGSoPVOPM1lQCo=;
	b=0qPT0o1UoVJ7z39a3eNlcAHHd9i2T7Og5cq1FjEvD20X6dugN5XaxKNQHE/Ju3r2jHrC
	 MLyHOBnEy4pbKjxzlfeUrSQT6pIXUqGDxXrsXfPjptiG8fEJl/GpGelS1HifpipPiGY7b
	 0No+u24HJz9fHGS8v3EUdno8b9ohMQOJOFNM+6DgLv1tnJRxA55seqXOeJQRnhOb8tv5Q
	 fl7sHRrg6BRgVAAsAs4DtoPdnWdWfrariKQipgbXO9RUGF28ky0xhmcD9cowY99eTE4NT
	 UcVVGOcgzZo9mqo8v/c5CljwNarBNM06Z6uAjZOePgS9AIr6s/H9FQ0yWU4iuc9igiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Jb96OtKf;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B437606A31A;
	Mon, 26 Oct 2026 20:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B437606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Jb96OtKf
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9463E268;
	Mon, 26 Oct 2026 21:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793045815;
	bh=L/9HwRDz85cCABU3qYtp39PE1AHoYvEdp7B/YfRsDvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb96OtKf+PJCsGX/AzL77Y9mQMwv6hiCuJC6eGx9UhFdbYhSikGJjo46ytK2tR/iA
	 eGBWaAOkjjJ1sbfC/QTovhQviY4wsLwDBdMrwKTIqhsllYorDQd+DOigDC4EKsD7/c
	 tW8dMfAbEPJDpE4uCKAa3NhuFvCqNE4NOXZZ4FPM=
Date: Mon, 26 Oct 2026 22:19:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261026201905.GC2005298@killaraus.ideasonboard.com>
References: <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
 <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>

On Mon, Oct 26, 2026 at 04:37:28PM +0100, Geert Uytterhoeven wrote:
> On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart wrote:
> > On Mon, Oct 26, 2026 at 03:02:27PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart wrote:
> > > > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > > > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > > > > >>> there's no base-commit?  Including any historical patch (from
> > > > > >>> months/years ago), patches with dependencies, etc.
> > > > > >>
> > > > > >> Dependency is something else, but for every other patch:
> > > > > >> 1. For testing/CI: you apply on top of next
> > > > > >> 2. Every other case the maintainer knows where to apply it, because it
> > > > > >> is his HEAD of next-branch.
> > > > > >>
> > > > > >> I am repeating myself, but I really had no single problem of lack of
> > > > > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > > > > >> subsystem, thus maybe I do not understand the actual problem you are
> > > > > >> experiencing.
> > > > > >
> > > > > > When I review patches, I often need to apply them to a tree, mainly to
> > > > > > see the context, but sometimes also to test them. I have encountered
> > > > > > many cases where the patch wouldn't apply on the current for-next branch
> > > > > > of the relevant subsystem. That's often because the patch had
> > > > > > dependencies. When I'm lucky they are listed manually in the cover
> > > > > > letter with a link to a branch, but that's far from being the common
> > > > > > case. I then have to ask the submitter to provide a branch, or enough
> > > > > > information to recreate a branch. Having base information (base-commit,
> > > > > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > > > > time.
> > > > > >
> > > > > > I understand your concern about maintainers cherry-picking and sometimes
> > > > > > introducing issues as a result. In that case I also prefer asking the
> > > > > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > > > > base information for, in my case it helps with the review process.
> > > > >
> > > > > That's valid and for 95% (guessing the number...) of cases will be
> > > > > solved by having linux-next as a base, thus requiring the base
> > > > > information is redundant. It's just linux-next.
> > > > >
> > > > > When patchset does NOT apply on linux-next or maintainer tree is
> > > > > non-obvious, the base should be provided, but that is only "if ->
> > > > > should". I think the proposal here is a bit different.
> > > >
> > > > What's the downside though ? As git can easily provide the base
> > > > information once configured to do so, what's the downside of asking
> > > > contributors to include it ?
> > >
> > > My base is usually not in your or anyone else's tree...
> >
> > Hence the prerequisite-patch-id and base tree information. Or do you
> > mean your base is not public at all, neither in the form of a branch
> > pushed to a public tree, nor as prerequisite patches sent to a public
> > list ?
> 
> Correct.

How am I supposed to review or apply something that depends on work that
is not public ?

-- 
Regards,

Laurent Pinchart
