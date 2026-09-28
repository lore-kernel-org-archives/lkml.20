Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3B4D9F92;
	Mon, 28 Sep 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604798; cv=none; b=d06V4Z/lZPoD80r113n1A/G+EKL5OxEj2r8VBxYZErbvIiqCQ2pwS0IvLG8ubsR6ydPZVIcAdo1TzG2oyuKGj3vrB7SfMhl1sIA4kwHgeYjTjfqnhN5X1AicvKkSBUnDMVAB0vqV5T+mMKwoWzcAiwbYIeVe6EMxk81hnMAAPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604798; c=relaxed/simple;
	bh=IUAN7Jdq7dwhB8ApQ28Nub7dVE9PLBfc24jMvPGKH4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFncSRtQWoYcX8vGe2OQd3/ons1FFGnE1MWvCVkb0QLxfeHnJzdaa/HHMOpzC0JoEIgXD1eljS+79X7n3a+oFyPsroSsS6VQobTVIdH7lpEs3izD8WdiV294fJ0YWRqSbbt5rXrcfNS8qHDTsvEq2UPWYo9nhWkWxcdDNOaHvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdbrwDOl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdbrwDOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F741F000FF;
	Mon, 28 Sep 2026 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604796;
	bh=e0LzV8lr6D65jb8CGDqHVINvgw6WnOtsMfP2KmC6kt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdbrwDOl5Iq6x3dh8vQE7aV0DoYxR+1WZYVT8Dbs/zInzxLs2fiPuBsMIBPvCumhb
	 XnOjpDV1U1Iy0dGqBD9Eb/EqCP2Ij3CZPHWAHQjdGQuGAS5fIXvIZqEFSmQuHVtPRS
	 uW9eQ07o1utkH0ZzcrqLaMx2WzhX9wmiJu1rrEMEcFpeckSKePPb/zR1obMHV1npvJ
	 inNyQEaGgar5ZXgVHTFMv979bMqSCpk5Bjz4ocI4te5pWnniDuhZDtDWpDnJPFhASJ
	 1NRbOydqjkELD/bFML7x9/kZ7sCeH3Gu7Y9AcCzd4fbpWXb9Xl/zGxVG2zR3Hfaads
	 KvuZFXPku3psg==
Date: Mon, 28 Sep 2026 15:13:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Odell <loganodell@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <6c7088c6-28dd-4e5b-bcb0-0d951183b884@sirena.org.uk>
References: <arac0WyK8MIbFeNP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fiOig3/y3+GjXi/8"
Content-Disposition: inline
In-Reply-To: <arac0WyK8MIbFeNP@sirena.org.uk>
X-Cookie: All is fear in love and war.


--fiOig3/y3+GjXi/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 05:09:53PM +0100, Mark Brown wrote:
> Hi all,
>=20
> In the final build today's linux-next build (i386 defconfig) failed like
> this:
>=20
> /tmp/next/build/drivers/pci/probe.c: In function 'pci_class':
> /tmp/next/build/drivers/pci/probe.c:1902:12: error: unused variable 'rev'=
 [-Werror=3Dunused-variable]
>  1902 |         u8 rev;
>       |            ^~~
>=20
> Caused by commit
>=20
>    8a2a9fa37b814 (PCI/IOV: Read VF config values that need not match PF)
>=20
> I have reverted that commit for today.

This issue is still present today.

--fiOig3/y3+GjXi/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6dfgACgkQJNaLcl1U
h9A3DQf+KYQ3pwvD+nJHa0hczsBFoZcAkquKrJOhEfMtxyAssSBXCzm4WxV2qzFj
Cp+AjU2x5MdA0VsxAkFPF3W6pAJeBGGWiha7Defvc7fejUGi32Foqj2da7lgIQyo
JWdsDfS3vQ0+pSLhX/Pbc+7Hq7U2/KdX0xHJmreWBoygMGTHKKipiCnMkRX2MnEw
JMwQZBXvsgc7/xXUnC4m6Juya5DJJOSGIeb146NEnzTcJXQdnSPW1LZuvi2OYOPO
c/tQNwAmFdPiWnX+/Zdmk5mcDH5hTqHDTPrrcvdrUo1m6CubQJ6eFftrQh4pZoeG
UOYmcdu2kG+6Z2D5LOQivJ7E4sqR4w==
=f22j
-----END PGP SIGNATURE-----

--fiOig3/y3+GjXi/8--
