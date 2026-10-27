Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104394;
	b=pOzH43ZzQXF1lealwo4Oo9EYvF203LDpHJq2mbrFvG4tnr0aOoQ05+rAs+SMbq5qIZR0
	 Tpc1YDFzmm/cUXgLyrocfG2LAjyXcCT7WHcXDd9v2pMxhAGpt1CewkEw/2ovfYeeAH9nd
	 o9ovB85Ot/lXKm2CuVB+Tkvpur7OPSf20en4Mz7PvPj7Vh4DBKKfgzerBEXgXM4QMAdyO
	 toPmFAFR2nWXFCp5zNvoKLBQ29k31asFODaOuUPKx+vae8MJD5W4oWUK4kpm34AfMbJii
	 jCSpr/QY8gD1nMKjGkzI6FF7klJsjZomnLxwt/+GFrUw9ygLUuBXCrUgnVHQQ5yMdCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104394;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=EgOm60Rz2Y4VTbeDvdZCrLunNHahC8nUQ4aFV0rXVpg=;
	b=JsR2UDLm8VoEfc1brpcAtvhye4X4f2kSRi4XFwMFEhcFAhUbEVdr/vkfsvYkCJ60amWk
	 th6RyIRXI0hWWpxuivEap4RJnEuaD2rdTXRmZ2ehfRFFqY51w62sjKm05U+MVFe1W/SZw
	 N6dJFz9uSg8cqI89qFLEU++KbVZE8N7Eh8DUFPRKQ+gTIzZIvE+nR/A93DC42Mn0NxuKK
	 4N4yoAv7HzJh6jG1w5cGtLIGBI408M1AgnodRoOZ1CV+cv/8TWGRzoSA8PrYukowTQZfC
	 vWabYEvEuocALbKks+43Er1QdC95Z3cfNmmYT2enCPPIcuZ9AikYLEpgIm3iTrgdgQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=auKSwgZT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A64606A31D;
	Tue, 27 Oct 2026 12:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A64606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=auKSwgZT
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E2EABE;
	Tue, 27 Oct 2026 13:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793104260;
	bh=8hdXfrYD+fkRQ9eLvRERPhck6E+IFpYJytDXTgJJYNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auKSwgZTP6uLuJF43v69AaRpgRUMLujjnm5qJnTkhTStDz02Db5s8/XK5u5eWVn32
	 UtUsB/njklTB+WpoCidKo1Nai/stI4t51xhHHgtXR6l2rLnGzffPfFQMioYSUmghVx
	 sRWzfKhXcK5m6h8VjgkVhYDm2sHU7OLHi0JANCVc=
Date: Tue, 27 Oct 2026 14:33:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261027123310.GB1829830@killaraus.ideasonboard.com>
References: <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
 <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
 <20261026201905.GC2005298@killaraus.ideasonboard.com>
 <at-9VwE3BL_3OXNP@sirena.org.uk>
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
In-Reply-To: <at-9VwE3BL_3OXNP@sirena.org.uk>

On Mon, Oct 26, 2026 at 08:51:35PM +0000, Mark Brown wrote:
> On Mon, Oct 26, 2026 at 10:19:05PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 26, 2026 at 04:37:28PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart wrote:
> > > > 
> > > > Hence the prerequisite-patch-id and base tree information. Or do you
> > > > mean your base is not public at all, neither in the form of a branch
> > > > pushed to a public tree, nor as prerequisite patches sent to a public
> > > > list ?
> > > 
> > > Correct.
> > 
> > How am I supposed to review or apply something that depends on work that
> > is not public ?
> 
> It depends a lot on what the base commit is doing, if it's directly
> relevant to the patch it's an issue but if it's unrelated work for
> platform enablement that's needed for testing the changes then it
> isn't so relevant.

Indeed. I was thinking about the case where the dependencies are
relevant, but there can of course be patches at the bottom of the branch
that are entirely unrelated.

> This isn't insurmountable, you can cherry pick the
> changes over to a clean branch or something, but there's new failure
> modes introduced by being explicit about the commit (the number of times
> I've had to unwind a series apply in b4 because it paid attention to an
> unsuitable sender specified base...).

I've seen that too. So far it has bothered me less than not having base
information. With an unsuitable base I can apply the patches ignoring
the base, while with missing base I have to ask the submitter. The
latter interrupts review. Your mileage may vary though, depending on how
often you hit either case.

-- 
Regards,

Laurent Pinchart
