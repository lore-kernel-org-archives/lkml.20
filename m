Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127441;
	b=uGAU+sSRweL+/1w6VYIXAn/TOMdm3WhzI6jANua5TbzjS3W6ScxJ7Xjy7HXSFCfU0tKZ
	 tutOj/cfntDaeEpTRqwon9raDe+IGbYacLaWvQoFTEbbooB02pqVhktdPcYSUkdd5nv0A
	 /HdaTFhBQMYDpI5T9dlZp3s90ow0sGyCpZeAorKvCUv+AyG071eIJBLsHgHQTruDxaQym
	 nO4rlVzXvutTZMRqlbd8F+T0Szj5gurhpifJWWF3iYX11Pp8evaoLvs1tzfDuuFv4yUL0
	 QDJA1MJgS3/SMCjCcGsBNO5WRNqPzvkgVJgycIL40Pk2z2cQdbDsXzeg2waBEuG7+9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127441;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=RqMmeEuAURO9PC7K8VIbJDFKl16EvOusSLDd6yaNy/0=;
	b=0vbMMFVlP8u1cGnf4Q4iNBj4x9pGoScXDrymZj0//MTGjuz5+8jmMxao6xgTMW4WTXho
	 KW6OCy7PktWJxczqiqP/in8SBNLhAljc8Qbvf7/zDkg4q+29hFr24HlGHoy/Y0pDQQ69E
	 FG8ydS3/jZyxQm+ec0cFT2MGVLvEXie+ukJ1XJeEjZBCBky/Cwwyq9xdW9H8e5MplPUfP
	 nA8lJ9zSRSXNkwKWaMhc37OmP0AY++S30MF/h0ZS2PDzkGd+LfC23n2QmuM/mMiri8cOx
	 Z0KK0IOVKRHCYUzxtqJ9k91F9qxsSv7ugc1OlOEuq9uASOGNhm+968Kb6jP9MmhlK2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ety8LAqE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D0606A31A;
	Tue, 27 Oct 2026 18:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ety8LAqE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B21E1F01825;
	Tue, 27 Oct 2026 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793127440;
	bh=RqMmeEuAURO9PC7K8VIbJDFKl16EvOusSLDd6yaNy/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ety8LAqEcAa967NA02YPHq3pDtDRLD25aw5Fy9U2Uu1l2e8ondDp5I2b5CNuuvZje
	 dZInfatQjOo3p4phkJQfDjYrUhVwuLQUJTK24HoBlmE6ifgTLDsMxBU/bAePa9ehWr
	 59FElkuNKod4lCB0avnEu+Csf5CO/qu9en60j7A9+UaJ6f9/bSIeYrJOxwVXv/whaj
	 l9T2NHSBSGMvN/ZLxRm4ZFdi4rMemvsMnKRnOPJH903KA12IZ/+6ETOoIFiwzorqiV
	 bQCT+9PetC7w4CU7EIywcjyR+YOYNw+SK0mrsJ/OOP4lg4fGsjrUfAqH0vrE2g6TdT
	 cCTNJp96rHxqg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 77D171FB712B; Tue, 27 Oct 2026 18:57:17 +0000 (GMT)
Date: Tue, 27 Oct 2026 18:57:17 +0000
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
Message-ID: <auD0DXpvKayLQJNy@sirena.org.uk>
References: <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
 <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
 <20261026201905.GC2005298@killaraus.ideasonboard.com>
 <at-9VwE3BL_3OXNP@sirena.org.uk>
 <20261027123310.GB1829830@killaraus.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="PeFWeuB8IhHv6OUB"
Content-Disposition: inline
In-Reply-To: <20261027123310.GB1829830@killaraus.ideasonboard.com>
X-Cookie: Whoever dies with the most toys wins.


--PeFWeuB8IhHv6OUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 02:33:10PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 26, 2026 at 08:51:35PM +0000, Mark Brown wrote:

> > This isn't insurmountable, you can cherry pick the
> > changes over to a clean branch or something, but there's new failure
> > modes introduced by being explicit about the commit (the number of times
> > I've had to unwind a series apply in b4 because it paid attention to an
> > unsuitable sender specified base...).

> I've seen that too. So far it has bothered me less than not having base
> information. With an unsuitable base I can apply the patches ignoring
> the base, while with missing base I have to ask the submitter. The
> latter interrupts review. Your mileage may vary though, depending on how
> often you hit either case.

Some of it is a consequence of how I handle these situations - if I
can't work out how to apply the patch against something I'm likely to
apply the patch to I'll just ask the submitter to rebase before I get
terribly far into things, if I get as far as pulling the patch in before
I notice b4 used a weird base (usually picked up from the submitter) and
I didn't override it then that's pretty cumbersome to unwind.

--PeFWeuB8IhHv6OUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauD0CgAKCRAv73Ows9A4
iaDKAQDIAEH03940sQ4djk54qH3DuSYiPFU18cab4RMX2YVPGwD9ExVKvoZ3d1QW
sek5YtqiFy0Db7uBC5mhDvNlc3XXAA8=
=BGxh
-----END PGP SIGNATURE-----

--PeFWeuB8IhHv6OUB--
