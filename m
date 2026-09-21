Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC549CF34;
	Mon, 21 Sep 2026 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996715; cv=none; b=hRojODyJoP92kUQb2mRmy5dbyERd/JULSlA7lHWlExEQlr9uW0fonC4/kuk/17Ro51sMCByCsrJynITMWf2Rc9RY3SymI5GtO46oFYFEldexDGGwJHkwZwkezfS7ZDGtKPtZhqmCElEPklR5UAMSCEqGoC1fCO2GYlbXroM2QIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996715; c=relaxed/simple;
	bh=NS73iJrn+raxR5BcOY5mVGjEP110dw52cnSqDsOPPvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfuE9iLspdkQ48zxkoOsMXFpWyDZ6MLEP4ofK3Fqh7uuNxahGcMntG403y8rggxJ3LiO5U3sSrmq+8EO7bR6XfLnm6JJt4Srrte3O4lMBcpMpoYwWNxq1XbX0ngAF2JEaDE/J3WYPF1fTW8yXFemdTlhave/sgmLJFdpcSCV1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ2Ef+W0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ2Ef+W0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FD1F000FF;
	Mon, 21 Sep 2026 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789996714;
	bh=NS73iJrn+raxR5BcOY5mVGjEP110dw52cnSqDsOPPvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQ2Ef+W0sH5cls2TiFWvpr6nTM0KEsLVvbANROZLvMjKLI3g9P5DQx1EjmYW0dUJN
	 e9lqtRwYdKBEdD9epr6Mm03nMpx5L+76A/xAwWUiob+tIjf3d6WMrp3Ca8eBpjVL0v
	 8DWblPiFO7+P1eN5Uf32fxG+nFL+hVd3tlbDiwS+MQYO1JYKRSJTS2KSZ9dAHCrt7P
	 gg44Sp5NQyERWXVRbRQJvxACwkGlDvxT66tE+FWpWlqdW9RNhrUxjq5yIlLBKpcu2T
	 UgX7sXyFbxACDzIIHOQ9q1o3PXuBz6plBTiPpPUZB7B5O95jlxZ2gQYY28ThzsS2AC
	 2CkXmSCVyLS8A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5FCFD1AC55A7; Mon, 21 Sep 2026 14:18:31 +0100 (BST)
Date: Mon, 21 Sep 2026 15:18:31 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 06/21] ASoC: es8323: Move mclk acquisition to the i2c
 probe
Message-ID: <arEup68eG4XrhnpI@sirena.co.uk>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-7-chancel.liu@oss.nxp.com>
 <arEuUlpxzLbIYetu@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euY1IN0dHp66xbny"
Content-Disposition: inline
In-Reply-To: <arEuUlpxzLbIYetu@sirena.co.uk>
X-Cookie: Too clever is dumb.


--euY1IN0dHp66xbny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 03:17:07PM +0200, Mark Brown wrote:
> On Mon, Sep 21, 2026 at 07:46:25PM +0900, Chancel Liu wrote:
> > From: Chancel Liu <chancel.liu@nxp.com>
> >=20
> > component->dev is the underlying i2c device whose devres is only
> > released on physical device removal, not on ASoC card unbind. Getting
> > the mclk with devm_clk_get_optional(component->dev, ...) in the
> > component probe therefore leaks a clk reference on every card
> > bind/unbind cycle.
> >=20
> > Move the devm_clk_get_optional() to es8323_i2c_probe() so the clk
> > reference is tied to the i2c device lifetime.
>=20
> There's also some devm memory allocations in the DT parser which is run
> in component probe.

Sorry, meant to send this on the da7218.

--euY1IN0dHp66xbny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxLqYACgkQJNaLcl1U
h9DmsQgAhiCoHYwR163qCrxkQV9Ox5z+W5yFU8JuM8zF+85X/YwaGGFe0BEGOehy
fWps06UxAo+nsJ3aU1jgPYW+GUw4T+hUbwynW1pFmtFptLX3WAhGVSZfeIOLGIXT
uQwH0MW/D1Mkya8nYwktRnaKYg2L500OPCslJ1J+MSjFGgZqpISxi6nmJ6hMofm5
w5mBu1SS1ZUB56jHpjl9wkWZ7ekET2H5x7vTSUiW2PMQUqyRBMWyZdg57cKq7+lc
6e/WqrY0Mhy8UM636o57UK8tqV+P2f4l14vY0nrG8+rstvYrjCO4LOTFHyfe+q+0
idclyyiVbLlMy0Gr6idLNC8JdQGGgw==
=f+BP
-----END PGP SIGNATURE-----

--euY1IN0dHp66xbny--
