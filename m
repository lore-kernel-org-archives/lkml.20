Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E03B19B7;
	Mon, 12 Oct 2026 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831803; cv=none; b=gowWvZFJBFuIidYNvN9nm2m8iob7wpphCsnDVpVN2Fxy7wRtwnGEzBTkxcPXWUvKh7GzWPm9Lpq0cajSbTeafppyJsAj9Dq527xxirBf60mHAW4GnQXFbLwd4wBxTNUqA4JsXp5zAfG4NV2bJJc4WlqPb/0dDm0okJr9lAUDh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831803; c=relaxed/simple;
	bh=dB+PUYv6kgWAGHRSBrkj2Gxq08CSA/BuRMhHJm/mM1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjKbC6vQ8VAjvnNGHphFzxy2tzkXqLgY6WsPq1WKxyZub+e1qrQY4ZZhxe4EcO9rGTTp1XZPeh1Lm1gjb8D9HShzkPzzQkVXQSeI2EoXE5y5sy9sLl9H0MQ0WliTUUJ26BidnhaT6LyrZqDJhSRS3Kt46rfscK3eS0jqFN6iryM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQo7gV2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQo7gV2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352471F008A1;
	Mon, 12 Oct 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831801;
	bh=Cq5A+t08/RNvZ7w5Ni+Dn50dSQduAra1MlmRgk2XthI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQo7gV2Z3qEo9VQVXJ7aFudoCfxDxXH+z1wwz2EVV6+sb+B9/7JzalxpgKohq36gI
	 QUhDY599wE316p9ILtlwtqQ2DNaHsZy9GExTpJz+W+fYTR73EvJIx2s9fDna4wyuCB
	 QH8OGOzV/AIIjbLrDS0rS/LkRNUGnYuUsQfV07x9VqC+7WKR3Rs+yXX82UyywbH51L
	 5Gsy043d0A2rhnpUz+SD19K+OO4K66rgj9wo8R1biVoMLFzK03e0hIuIQb+FLtM88U
	 WW9s0T4M3cdWo2owpjK1o3YorXPVD0pCF3zLDdNufFsm+ve6wLO1jKdWqb27CJAZSx
	 HoKN+gXhpnDHg==
Date: Mon, 12 Oct 2026 20:03:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
 <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
 <asOdosd0zROmuzu1@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mDOG4ulw0T6D8Fm"
Content-Disposition: inline
In-Reply-To: <asOdosd0zROmuzu1@sirena.co.uk>
X-Cookie: Save gas, don't eat beans.


--/mDOG4ulw0T6D8Fm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
> On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> > On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> > > Commits
> > >=20
> > >   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 su=
pport")
> > >   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in=
 fan_curve_get_factory_default()")
> > >=20
> > > are missing a Signed-off-by from their authors
> >=20
> > This issue is still present today.
>=20
> And today.

And today - should Ilpo be added to the list of contacts for this tree?

--/mDOG4ulw0T6D8Fm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNLvUACgkQJNaLcl1U
h9AxGgf+NzwY6ZyWEZFTv8/gR+mqYKt1RLYgs5gSFa5AE9sMik1PkbZ4b3IlqfHy
Ver5izp1imkXMG5xV8up7dOYOFAjqAtNpDvH8gLmt/q7mxwyVGEh5EFK17p+nxZl
0zu6Eub66CFkOpsGjIwHIIsm4SGlzRrE2xFYWbLPTtl8yLMad1tbmif9dPjCnELc
/7+SmssQcAn1ggVXxQ1MAD/eGQ7sRuRUsFmrk8dpkIyL438yUxyBi8IbmSlW8xJL
k+HqYALZbp17b/B3b1tVBuaANixtBRB+tCCpEyKe3i65EF51aOxrlr35R11SvbeE
iKSKuSbz97wnf6XGcQfV32Nsb7Tu3Q==
=RkKI
-----END PGP SIGNATURE-----

--/mDOG4ulw0T6D8Fm--
