Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAB2BDC1C;
	Mon,  7 Sep 2026 23:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822379; cv=none; b=Kd2sn8Xb0hzRptrf8I96NAreyB3xepM4/oym8QY9G42yaUPpHQNFvPa+FFmGWgpaWihwDootN2uwEd0kAWbXjr1AgnkFRVJCe51n2JBlpKe4h9DAHhibczJyDAYjWeOZMBeWnWz1lC1hEKGjcLbGABvpEJFgXPNMjjbrgFdso1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822379; c=relaxed/simple;
	bh=e1DFGJ0cQMCqRzbCLWSyQHHzlKIL7J04VCwH4kpz+lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4KRpHyMbSHQGUzDJiMLLXjJ2dLCtiCNRdtebfEhCxZbEB4sDaEzm93hVy4wpiNJmetKptghbWoIvtlc7afj8jVlA/2V0QrDwLT6Oph4IkcXpK6r8d5fP+HpOdalGruw7qHB1QOG70BAGxfDgXcfZnVv5/o5JsmASROzT92XR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRZhsU5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRZhsU5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0101F1F00A3A;
	Mon,  7 Sep 2026 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788822378;
	bh=KCTFLO1tT5pwdbnxF7wWXZsJYwe6Z2FtB1nBwYK3C5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CRZhsU5k0zr9qkKn4AMghz+HvTFXTR4OGFvFLcaDF5u6hygJcQFmHuG/TDp2o5bVp
	 xANKEWY6YUpK4PzIu3PwJlSl0i22KJf6JhxrPu5etlspWhCQ/k4l8vQTWmLRIUNdqP
	 idvNG996ooVj2HwnqX3e0fTQ7GwHY+3jTPT8J2g+bGjblZNHKYayliYhWvMPTQvTmo
	 ywzks3OwX0usLRECOsn+79ZD3hkaxZ2XspbfWpeUxdE1Q3vaHNsH8qzDpiKpO8pqrJ
	 Oog9tDCFupQPvLfeF2PXJLH/U89OUw4dwhJbGVg3zqApfNd9n3Fr4+tqSqigUo7ksa
	 hRUnOLZFlnsjw==
Date: Tue, 8 Sep 2026 00:06:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <f72e69e3-42e7-4680-8fff-be41eab7268a@sirena.org.uk>
References: <ap6Ze-_ckuTFyCMH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gir8eWDCJrF6c6C0"
Content-Disposition: inline
In-Reply-To: <ap6Ze-_ckuTFyCMH@sirena.org.uk>
X-Cookie: I am NOT a nut....


--gir8eWDCJrF6c6C0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 12:01:15PM +0100, Mark Brown wrote:
> Commits
>=20
>   755cf7adf8dd2 ("Bluetooth: btintel_pcie: unified decoder coredump forma=
t")
>   61f725843b509 ("Bluetooth: btintel_pcie: add MDBGC multi-buffer DBGC al=
location")
>=20
> are missing a Signed-off-by from their committers

These issues are all still present today.

--gir8eWDCJrF6c6C0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfQ2UACgkQJNaLcl1U
h9DUYQf/Q/20YUdLWPwuW7yLn+8OgLwtfSVbviKD1g8uzaOnpKCIL+9WuXn9ffV6
Jpopax1/F9Dt4Ynk4cmnuyDtaMXjTkqwDx1Bgv9elPmMqcUVAB6BKbS200KELy/r
xkBddTWox2XMHhx2T491MPhkJLVFAwN0kD6Gg7I7gZZgHEIFEgQGz2XV/zXO+V7L
yb7c2QXHQOmlJnZ7QWq/tAtfu58b19iAexIv53PkVKhoRYjoeg5MvXDjfwj/Ftqh
ljOtoyQK8F4oNeBH2+uqNJXrHcWcKy4gKp6bORQ41ezROnzu41HQCeX9XBLJpNXh
KxSQCuLWcSZrZ9DpHZN8mz2QeA881A==
=GMWB
-----END PGP SIGNATURE-----

--gir8eWDCJrF6c6C0--
