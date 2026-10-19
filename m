Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436964;
	b=RkBzk1Ncv2O3w2J+rEQBg6iyGEnV8si1a1R5hbyxlXocyFo4sh4GIFddCiJBCRy5cQkL
	 hrQdqM4CWVEHmeb2FXcYuFyh8tKJKYFWmQenpPyIomb7aQscgMRl/hReYhEx1LT0o+x3a
	 NKr0Zbo62ccEulck5Z5wvIifefAeXUpUOMFhsmoeLDPxI17nGRm4jBv6bmBG4Jp9SNz4s
	 aUe279NJsigEvH7sdkxN7KEJWcfIgIviMvfjYe3qVrfkkv54fHtxdslc6GGIyRdgiANpk
	 yk1rsw0r3aEo8R1eSdkLkKIPEIQgbPunZomRHc5oxwwFQvnalQXhHbhosfF/0Iu1prg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436964;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Zwx0Zfvus0Xk1yeHotW/4uixVNpLYsgssSnYcDdeGTM=;
	b=2cMCYOaM5wD1AEzmHhVeyT6a4dLNv7I6p5MRFN1gR1N4VxAeJdjJu6Zm0XNqD3DvJpLm
	 2UwRYXuq1c+hREvjMfHVDLxluHdUk9ArHMQtvwHUjb6sO5F16oBYeqaomDSzE4vx46i0j
	 hsDnC82AwZPVVdjU/sbH2UCkeepCL3v0wK06N3Ss4x+rk8bOIQSM9hxRWiD5e32E2xn8A
	 znzgRoeoZaw+sJyhOkwCbk71bklOTfH0HtbxRXCe0UZ2MYGI0LIMH0O4I6YRBzpGbQ6AH
	 IGw9H5pNZPzWaJSTJzce1u7V5Wz6wcdT65qS8ua6NVKzk5K27YSYxgnpXtdgkjAiqnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dyBcW/2k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA4606A321;
	Mon, 19 Oct 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyBcW/2k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9411F000C5;
	Mon, 19 Oct 2026 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792436964;
	bh=Zwx0Zfvus0Xk1yeHotW/4uixVNpLYsgssSnYcDdeGTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyBcW/2kWvBEXbjErbyeKX/rosIAsOoWfSxQQFjkg48NKHJNgC9qH5S5thwHXh1HF
	 xK1wNGu4W0DeQRH3xyhruTjypvDj3zuODrdO1pKA4YalnYpgd+QL5k1W7Hk9P+gkBK
	 IN2GWpOeOWa2NGJLO6bDVHWCJ24OrQZOy6lrgTcGoSLkBL2zeU1Jrg7UHsezt8EeCd
	 yQQ2ffbft0yp4k4eXWfuY1jqJg2WpOuu7cpRCiuV3YFYCxgCMAzV+ehz1ZuNuQxDxs
	 FOHtPKot8aqK+tGFJkCCkgCc0IkKQoJ3AqjwdMl8VrfOt9MkLIupVE6PrqBOd1qnBf
	 lUghHPnir/SIA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7DA5E1AC57D1; Mon, 19 Oct 2026 20:09:05 +0100 (BST)
Date: Mon, 19 Oct 2026 20:09:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the fuse tree
Message-ID: <atZq0WW6UqnzbVx2@sirena.co.uk>
References: <atYKkjN0WgEhpACL@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="f477xsd4/YSAqYhU"
Content-Disposition: inline
In-Reply-To: <atYKkjN0WgEhpACL@sirena.co.uk>
X-Cookie: If in doubt, mumble.


--f477xsd4/YSAqYhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 01:18:26PM +0100, Mark Brown wrote:
> Commit
>=20
>   5fda61d42e762 ("dax: add fsdev_dax_from_file()")
>=20
> is missing a Signed-off-by from its author

This is still present today.

--f477xsd4/YSAqYhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZq0QAKCRAv73Ows9A4
iZpuAQDB+3GBuGTmN1dVELO7hQoPce9cjbIRxuypujaWlgeJFgEA2q7BVpGf13Dj
S6Q8aeW3mn6t1Xk7VgH6Gv5+rJ0FkQQ=
=1dNT
-----END PGP SIGNATURE-----

--f477xsd4/YSAqYhU--
