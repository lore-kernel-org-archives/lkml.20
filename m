Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1295625E9;
	Wed,  9 Sep 2026 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959178; cv=none; b=rEaR3AyChO5LL1ScZ8CoRNJI7wWbdO2mRQzmOneyq1FDB9NLGkdHft9HsmubhU32uDGcpPOrEeZNTp1F2CbNaE7Giq8A3JRA5Kbh/iHESikKOu+/3NHi/+pwBl274bPPRzCdKRYjn2cxRW7wb6AZeQZK2OHXZU8v/L34HTeE8uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959178; c=relaxed/simple;
	bh=/B6d0F22DuEcL9GIPg44WlgWdqY4lB81oqXJ4p9IKVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWFqrioTELihO5L1t+nRm5CQtIaZVro+GG14gbde+7qzmIPmpF+VdwEVRIo1NM5CjM8ZvpaL520/sTnPoZAzdXhr+F8KNFbteSqXwV+kc4DE8VSj5axII7wPTPB5jr+DnYYWeYrz0JWKAApQ1zM42SBZ/K0GZi3a2NCmG02MJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNGgRUDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNGgRUDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4805B1F00A3D;
	Wed,  9 Sep 2026 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959175;
	bh=/B6d0F22DuEcL9GIPg44WlgWdqY4lB81oqXJ4p9IKVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bNGgRUDzrzc4l2KO4faBG4in9XGrlKy0NYd6vlG7M6nO6+TR3AJKTlFHSglXRVZU5
	 ybxnhXbu/6OqTi+gaYor1jgexHK7Bja321suCuUdLrtdaKTQ2wR7Dl4Gm2y2Hn7hnp
	 FK17I3EihvuPPyy1M3lSOdENM2SohBYqIMS0oDxlQHjpL2iTsVMAWtM97PCF04HwaU
	 R4Rodu4GOxi0EbglqMzF2Dq1SsiDoviI1ca1weq9x4UnlWgn6+Yzpc+wBX7QJrpxtD
	 EWPYVIYsA+l4oGuBlaIM93UsKjVG1qY8AQCc9K0/X4eyu8JmC6CkoQJvJ3HUQ9atrc
	 ehpcZJZQevnHQ==
Date: Wed, 9 Sep 2026 14:06:10 +0100
From: Mark Brown <broonie@kernel.org>
To: julianbraha <julianbraha@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for
 SND_SOC_DB1200
Message-ID: <b15e44fa-fd2f-4165-813c-68f590ae02c9@sirena.org.uk>
References: <20260909125636.3560050-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tT53Gi11+dvn+eN5"
Content-Disposition: inline
In-Reply-To: <20260909125636.3560050-1-julianbraha@gmail.com>
X-Cookie: Postage will be paid by addressee.


--tT53Gi11+dvn+eN5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 01:56:36PM +0100, julianbraha wrote:
> SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
> dependency, I2C is enabled. This causes an unmet dependency when
> SND_SOC_DB1200 is enabled without I2C.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--tT53Gi11+dvn+eN5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhWcEACgkQJNaLcl1U
h9DScgf+MvWdGDFO4kHd/52/kDikMZg+Kw3BkRTKRewimGRioIAaZBkLGFco38Ap
Gy4y4P4nPRpTAC6zf1fTQ3mNSCOo2wRRV3g/hd28jU/0a8ziJMFpVh557Jhml/vc
2fk2pn/fyNDMsyx1eJQXcV+4o9WOTJAftlfwnTZEanHpiyFh8lNszaOnbl/awGr1
dGruJZ3Y+GUKlEi7Jo9xAnCgeHdEwCWtUMV1Z8tFbuIhKrPVnAgLijvumdFgO2sl
xJfPz0x7ZiGMWlkB+9B8Uf3kOy1Fbxqkhb7DLXYM6urSssCuLPpDe7hlG1w6O3uL
N93mzTNfrxpnsLvjI7RNoGHy3UdlUg==
=Dl1w
-----END PGP SIGNATURE-----

--tT53Gi11+dvn+eN5--
