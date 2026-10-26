Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047911;
	b=2iDJea73Kcdhl+gk2JbNZaLbO7b1S0aKr5P+Pf1I1ImsILdq8fWraywVdYjPsXvsyNml
	 FDXz4PifQaMm5gTU0WztR39v1xXbA2zZERF/hcMC4u7w54vaGAWAdzUan1W34HYOlnrL3
	 6WvW00DbCdM+hfeaZMOFVbzkn6TgW2Gg+jvyzTii36Ab3+nxtMDTVH6hOcF5mx+E0jQsw
	 xX1ADld0X3xUqPpZ83mBtw0ARCMaU23OMlNG1iMn5c1tYvqB3m37zwlxORm4Duslfsh1e
	 8c0m+S24vR1q+wdmRACFtEaDsTzR00sKxj2dn6cuJ2Po5XK6W8axwwQyR4IMVnTnFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047911;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=EMwwMqahgboirWOcgB53+0fKRS6bS5S7YcakkhnqaJc=;
	b=CVl7UTMJk5q4w48z5HIUrn10V6eYFCojYnSr6OzZ0YmsW7A/wJUxBUHnHWN8W3SXP1jO
	 ZzpUo1mgi1WSKLgMFMYZabNhXaHrUwgfG+08RefDkrYAx92fjX+LaSG81WZF+39km1RSH
	 sFLg3nCjRNPbgOV7JyKKeQSM6jxa0+c96F0SkpxzqHORtAlboIdUJarFZBr3YbiYGD4dl
	 77uULTnmA0F5D0Kj9POk6R3iNEtdlZIt2NjzDzKdWamUazMWRQVA4i5pvgaYGBzAQOd+Q
	 GPFVp3bP+5TSVOUofv5dSbkVT37uLyvy4wPhOO3XgV3zAQDd+DJnQ5kDkVCc1tP2a/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNARWyDp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BF606A31E;
	Mon, 26 Oct 2026 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNARWyDp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104FA1F01828;
	Mon, 26 Oct 2026 20:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793047910;
	bh=EMwwMqahgboirWOcgB53+0fKRS6bS5S7YcakkhnqaJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNARWyDpXYqXr3lGfUz2nhb9BLj7UqFxfUPA+Rj5c258s7H0fRi0w0qqJpNIvYGK0
	 qtnnfsEZBQvOup3Wagl2OGiUlJI6C88VZp1Y7UX+dbLxQhhWadcVKGbB5UaExR9oYf
	 HcPYuRo+hBI7JJ3RC3CAuNDbMyJLzbGRpINvVTpUHJrntCbAHqajAQkd5wDDmj8DiN
	 Ph2gSDEwmeG+T5TjSc1Uk/4w1Te+hnhZwUm9Njzs697Yq5UXNsjzQppszzX3ix4HIN
	 XKE2K6fYea9PcvDwpGPCCPnkkO8Ei6r5kmlE4BN7/8aHzY3MrrDSiU4bgElOfScX6v
	 K+iX9nalLc56Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8770B1F2885F; Mon, 26 Oct 2026 20:51:35 +0000 (GMT)
Date: Mon, 26 Oct 2026 20:51:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <at-9VwE3BL_3OXNP@sirena.org.uk>
References: <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
 <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
 <20261026201905.GC2005298@killaraus.ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GEhra4p179ZZD1O3"
Content-Disposition: inline
In-Reply-To: <20261026201905.GC2005298@killaraus.ideasonboard.com>
X-Cookie: Whoever dies with the most toys wins.


--GEhra4p179ZZD1O3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2026 at 10:19:05PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 26, 2026 at 04:37:28PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart wrote:

> > > Hence the prerequisite-patch-id and base tree information. Or do you
> > > mean your base is not public at all, neither in the form of a branch
> > > pushed to a public tree, nor as prerequisite patches sent to a public
> > > list ?

> > Correct.

> How am I supposed to review or apply something that depends on work that
> is not public ?

It depends a lot on what the base commit is doing, if it's directly
relevant to the patch it's an issue but if it's unrelated work for
platform enablement that's needed for testing the changes then it
isn't so relevant.  This isn't insurmountable, you can cherry pick the
changes over to a clean branch or something, but there's new failure
modes introduced by being explicit about the commit (the number of times
I've had to unwind a series apply in b4 because it paid attention to an
unsuitable sender specified base...).

--GEhra4p179ZZD1O3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat+9VwAKCRAv73Ows9A4
iQ7ZAQD4SazBBorMIJ2QGVlerzaNRIQFxgGBw116X7ix9Q1oSAD/esZfxalFst5J
bZf+JHJdm6mRcPjd53s5e16N6NbU2gI=
=nsJ3
-----END PGP SIGNATURE-----

--GEhra4p179ZZD1O3--
