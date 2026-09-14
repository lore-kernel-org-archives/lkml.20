Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA5372B50;
	Mon, 14 Sep 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403209; cv=none; b=pLaWRwA5MPIZlSbry8Pt9lezLYTb7o2BNjf+u50JqMVs0HtNjeoxbdmOIMP/lnSfGSyrT6Q4geXy77MQpUXH6f5hPCf9VElpB8nPcPds3wyxYOKeScEol+xZUDdtW5EIej7plgWGuTsmFZWRSWe5Jm1IisNTEVSnhp4vXA4Kmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403209; c=relaxed/simple;
	bh=ZCQLVHT+Dh1ir+Ktts221gzAJPeRS1B2L9HG89dYlWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfEyn7KgREHWa+RiQoZAPypXjIfJZPjOVV+oi+lIJG4bEHHSJp1uT0rV0E+j10MR1SpDmMqeyyQZOjVyDjHhhs7rRUEad821K06/LvpQsv4kUbjagar30qAn0D92+MsNLec5kO2ofNXwNUGN1LD3i+uORkNbvmmVpVUjYFHRwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaE9Sbod; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaE9Sbod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB4A1F000FF;
	Mon, 14 Sep 2026 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789403207;
	bh=ZCQLVHT+Dh1ir+Ktts221gzAJPeRS1B2L9HG89dYlWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eaE9Sbodrj2weVMz8nk5OrxJ7DImP4eXRd46T20vXRfAXMObiu+tFjg+Z3GWvnjUR
	 3Grr2bUHWQttabO+G9XU64H2Bl+x+NXlbBAZYLxh+pgEKAAFky7ot6sX/0cyAXAjX2
	 kmfqqttJnckAnPq7SrKSvWg57dsYzrcUSfqyiFQngUGNMVXZbKK3Gx5IpSbvGGA8nO
	 S2L/JpcOlZdGjq+1Cxc66rUw4rlQhWaG2dNC1RMgRkK1A3Al325y/3Y1TNTEPl52Yb
	 yWSi/Vji17777F//jAUXV32jsAE/AWHJQRj8HvmwkOCKB6UGaZl98IX3iZjcUYo1yb
	 0TIzafwJ3juNA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BEC291AC52F1; Mon, 14 Sep 2026 17:26:43 +0100 (BST)
Date: Mon, 14 Sep 2026 17:26:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.3-rc3
Message-ID: <aqggQ58YXnibP6fh@sirena.co.uk>
References: <aqgf-6P5reFfRbAt@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="40ql1KVcm193c2Z4"
Content-Disposition: inline
In-Reply-To: <aqgf-6P5reFfRbAt@sirena.co.uk>
X-Cookie: My vaseline is RUNNING...


--40ql1KVcm193c2Z4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 05:25:31PM +0100, Mark Brown wrote:
> Hi Linus,
>=20
> Things are starting to get busy again, but not in a particulary unusual
> fashion other than a big amdgpu conflict that I totally messed up, you
> should ignore my resolutions around that in the unlikely event that the
> drm people don't sort it before sending stuff to you.

Great though my ability to see the future may be my ability to typo
things is greater.

--40ql1KVcm193c2Z4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoIEIACgkQJNaLcl1U
h9Di+Af7BV9ZrCuesarBeKSVAMHWAkF6Bf1spdg/jgcvzocXwUe+LeNFHEJm00Eo
Y47zd5tfSFQ2iBe16bIN6TlJs0ejXPqHqJMPRn+olNeGg32U+1GOS8xtz7FJLoRr
6tlA5IH5KCElZ8Mzfh8XjknZ/B94Y0UOPKKnTycUvWSM9YCD2C5zwlcBxkm35y2f
n58iaZIgkPtwg4Pox2H4LpkZexRuPWb+oxdsVzcUCe8BgKdFde4lDhZqwp0hRm3c
8iJQAUvNim3VilEn28ihYFvu1QRQoFZbL4GRdnZ56SDrtsQ6FXTCJ0RZ+HyVrJvj
QX5shWespPHesZpKg1bd/2lWcIuBNw==
=LSJL
-----END PGP SIGNATURE-----

--40ql1KVcm193c2Z4--
