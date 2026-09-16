Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F74BFE61;
	Wed, 16 Sep 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562215; cv=none; b=cneHUxrGhTE6Pgkxdn/oP/X5giCIvhW2lS+R8K3bNIHF7GSZKKnM0H/ucV4LwTtX90Aa4D6iw6oqW/a31QBtMoXGNEvPHc/T5uEjvsaz3ENf/hX9+kuV6/FrYvpHXAhQENLt5HwrMEDjvwc1y+ncUZ03VSPBVcW+F9G8wd17gfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562215; c=relaxed/simple;
	bh=0LW71PouHHktZa1YIkYIgClU73+QOea0uGztFe9oOjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHtAQrpm5/7ZWsIp2aURUg8ZhuyibM5ROFjxun3e+wNv9nrmgkU4Nkj6tM11UYj9oJHWCyr7C0Ctfc9+zX21BKn9BT0E6drngdFgrP7IOVX4GOTpvdBqFXygfPbUofo9JmWO6ImVgEJEqGrTrgsXGmXb+ODWGaDOK/nRUYTRXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jESI25aT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jESI25aT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EF11F000FF;
	Wed, 16 Sep 2026 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789562214;
	bh=0LW71PouHHktZa1YIkYIgClU73+QOea0uGztFe9oOjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jESI25aT2rHcwXFv8TTFfQwkIkTMNxdAay/CiAJRNch4fUco6CjYnOB9zbryjfPUV
	 1YOVviLzlKkrvDE+FU9XeUKzt2ClAhuUcXrv4Q89msiQg7HWS9A+4SRcEU7+HWWVhf
	 o5jLD7JWqM5k/H3ZJG3JNn0mXjLw1goIvRumx2wB4MaQAbKZSB3YcOtnSuCHbZ3Hyl
	 HGSn5smm2llrtJGXpn08HQB4xu53LLMmaVpvwkYIll2qJ6pjANIy8btsRtTf2kigjy
	 0UdH+Dt0u/8HOfJpg5Na1OFb0AKoEviu8DxMRXdN0ZHcUe3gMnOsO0kR5jaBIgBLNQ
	 Q+VUGWsPvmkvw==
Date: Wed, 16 Sep 2026 13:36:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ux500: avoid -Wparentheses warning
Message-ID: <9448f046-5756-4461-a932-652f9c72d65a@sirena.org.uk>
References: <20260915202038.3534453-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R2lxQCchsB5UkCkH"
Content-Disposition: inline
In-Reply-To: <20260915202038.3534453-1-arnd@kernel.org>
X-Cookie: Double!


--R2lxQCchsB5UkCkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:20:31PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> gcc warns about a slightly confusing expression in two lines
> of this driver:

Sasha already posted a fix for this which I'd been hoping Linus would
review.

--R2lxQCchsB5UkCkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqjWEACgkQJNaLcl1U
h9D1Cgf6A/t9t/PWFfilRqStSsgb6hbF36VbcOz4aL3RmyZFr0QvPGoaC53etQBQ
Hn5FmkQP2vGFjkmRiSZuPLyEw5YBVGF0jXQsNTky71Q3+AgyS0P0UpQ7QVw5iPeN
zYRmTlSqMZS18CoaJ0pLahLZv7wmX7YLMYkHXSKGpHJfSN5QbtF4tI/30OtZGhQ9
TPEn9FiTUlaNVf3DUnfrKjtswYGWaSDlkJAvEk7t62yv73TZwHnmLir/X0E/kcLc
gdKYpMO3xmwbk+zuFug3fe7aCO/GXI/dsQqL383q/FaDk6IIEm5mf+25PT1vhB1C
+GfhBHdjT2Nh9MO9VjvnB0XTUQ/0xw==
=1Bsm
-----END PGP SIGNATURE-----

--R2lxQCchsB5UkCkH--
