Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436926;
	b=PeTf9H9m5S9Zcc2Ap+9uXeVIODjKbYpbwny/f7UiFpx3xVhp6EfqL7th/fz3Fmrs2/L+
	 geHHCN9XtLk9SgWlPKhZ7zmkPoUItf8OpouwOac4LjLNmDNiI5b4PumIOAVHKJGQaybu1
	 CqlseZvHI8ksUoS4u2HBdOf7/kb8Y0grshdub5tDyoKTWDlGVEQTyVnNHau1D8ZyEzjta
	 ttLWCfik9iOarid/ACzGuj8vL76sCg7kqGPhK4SrnwDAh9Nv0sHavsUS9E2I4qD/L5hsI
	 L1x2KSLOdGKpoeW3kutU8fHxTQ2sL6uA3fi6mDV9udzywZqjZDvnDz/BK+gpjnNghcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436926;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=y7may8bEy+aaFtVpETlHcyaiUosd9joW4BXuC+gQJMc=;
	b=KPs8neb/O7DXBJnAdUzyHgV6mYmPO6dM5iLjHJtpIvKMS3Xbva9AF6hmHxY/56ZumqX+
	 WAQzmIjhkgEnE4rsKqDan64n/C+96/7CyiQQAK6MXZWDbEL/prHbWN7rJfyQeXzlLpx6N
	 uTMLf8mCcXj/i6Rq8YaMRaTilK56V4meIeX5IGbU5xk+sqStDh2f5HwJ9iJjnfo1JRTMw
	 8VriTsajuEBU+N8cKlTVMzLdOsuL8To5lyXZOP1FcS+NlF0+u0H33wCS9Yb+iNQOSQsVX
	 AAGVvFyA0YFT08A9mcOeF/Md6SI2vTqh0L7Z6oBDqoWpr7neOGe4j3chkwjQq5OF0xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fS0dp0x/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8A606A31B;
	Mon, 19 Oct 2026 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fS0dp0x/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE5F1F000C4;
	Mon, 19 Oct 2026 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792436925;
	bh=y7may8bEy+aaFtVpETlHcyaiUosd9joW4BXuC+gQJMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fS0dp0x/OM4Opzlfkkst1/GOuuwSN+QHCfpFe/i9WxSqGy8RezR1cQpX8C2H0MB7O
	 JVk0r7REeCJyOzcq/rPj2kjOt73ziQDgcHoYArSEIqWu+EYn7djzL3SxiFAEirmczo
	 tjT9l/rNPtzuIQjaJjLN8vJz0BX/DNUSrn0dt2+J71S1r08kXqZys7m4S7Ayu67eIP
	 h2zzJPE01RvjBbi9XpnI+mBRe8/rZD1k5WUKRafZn4lE08BKOZWocaLFeV4Z/cYeBT
	 jtr3E1cAxkLC2XLH4Kq86rt9eOwM5/apYF6FmsHeZmutNsvUsrtsGUGQm/RLEj9bgM
	 LGwDzeheS4fAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D51AE1AC57D0; Mon, 19 Oct 2026 20:08:17 +0100 (BST)
Date: Mon, 19 Oct 2026 20:08:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <atZqoXnT_27rGAn9@sirena.co.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
 <asOdosd0zROmuzu1@sirena.co.uk>
 <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="nf+Kwa6RWyLzcWNb"
Content-Disposition: inline
In-Reply-To: <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
X-Cookie: If in doubt, mumble.


--nf+Kwa6RWyLzcWNb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 08:03:17PM +0100, Mark Brown wrote:
> On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
> > On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> > > On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> > > > Commits
> > > >=20
> > > >   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 =
support")
> > > >   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning =
in fan_curve_get_factory_default()")
> > > >=20
> > > > are missing a Signed-off-by from their authors
> > >=20
> > > This issue is still present today.
> >=20
> > And today.
>=20
> And today - should Ilpo be added to the list of contacts for this tree?

And today.

--nf+Kwa6RWyLzcWNb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZqoQAKCRAv73Ows9A4
iVjcAQDZUVy4LAWFb6mkGfvPIIAI2mrV1h213ZcPQe3fj05WfwEApd5r7WLCVJyi
8PD+bbAPF9w9+je4VLBfZN2pLzUzdAw=
=DrW9
-----END PGP SIGNATURE-----

--nf+Kwa6RWyLzcWNb--
