Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038521;
	b=a1w9EB91Pi09lwfawkFux0raQWKhDcFHKX0Mn4EfsyGcz/i8Xn1gd/7giGa1oz+nFv04
	 WAuVqnY5CDuyyVnUOyTwORltB7bC1oHZp+s5LYHJ677OzuWKwJw69OZduuBPCEot1fXAk
	 p6thNVdIZ9uhzrFZnXCO1ozC5f159npmyc7ONSAqsTg+8riOsYFJyfFu4qwiEJvHNbruA
	 63/acBgWzNzb0a8kZOjiiR82ctJwfWcljN2dW0aRBgyGJqEko/XI/TL9zMymRNA8qPzxk
	 ckSH2GbpocQvWJEgGuaVuNqkcEEHbu1KuezRN0m6UPhHuYva+JmgWlY7DLJVRoq/RIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038521;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=nfjNkhxX77J93RceIXGzNLpDCodFx6WMI3/ifH9azws=;
	b=mrxbuv3ix5sTT0Vf6yJEipVyGuHRWo4+xa09CvcyOePohbTISQqWI9Z26upPbc/gfS8z
	 kB3r0//odqMwKEUB7jRCYWyhBMY80WtQ5vjDHvHE9k88zOXL8+QLsiukT6rcWIZVJCy5r
	 R1TbBngu/Pe5TVhdy18xsgqySpDle8E/hTRQ7SiZs+nlXmcKtN1DSIFckYO87vLqZsUmt
	 knf7FRJ3OhgpnlwIV5Du9gdem65F5rNJ1LG3snV/MzrRIsckON4YW1GfW0e7meI4qNOi7
	 cMI2L1Y5+gx605CQb8vVdTrceZQAjaa6Kjspre80n7mpLbE+jT/QxJbOu0EHeNLkGIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvmOoZya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CFB606A31D;
	Mon, 26 Oct 2026 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvmOoZya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC821F01825;
	Mon, 26 Oct 2026 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038520;
	bh=nfjNkhxX77J93RceIXGzNLpDCodFx6WMI3/ifH9azws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cvmOoZyaZr/+/mATirPdvEXjC9ygkCpysjMpe+V55XL6Ogy/Cmik4jSAWQn3LLXos
	 lWiRm0Lh5ULNRDtE6m8qBjNwMpsaM00zzKK0Cy9kNSe42TCSXs0tLQ7+UCFDJLvkUu
	 cALeZM9N9GWoidL5oIQ1u9QDuVoNovCp3whmhKHgudt1TGjbjZMY8DICDtAERYkvw0
	 dUcDPxM3zXqk+lYyqtfuT4YxmdovWPlqESELcwKiSgNYU4RtOip7r6dYWSRHnQw8k/
	 E1AnuNnOExoIFGNbkpPtgy+OhKeFwtDvxAokF7URSFxS4YNPPLlS8wP58hDOwHmwyu
	 tM6uJNoqBaGlg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id DD8031E5E172; Mon, 26 Oct 2026 18:15:04 +0000 (GMT)
Date: Mon, 26 Oct 2026 18:15:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: Missing signoff in the clk tree
Message-ID: <at-YqCa-RGEv7IJ4@sirena.org.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
 <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
 <atZqw7pdZjMwahdf@sirena.co.uk>
 <at9drMPrv1IvPovj@sirena.co.uk>
 <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="EXL3dzKB9Y94HpAk"
Content-Disposition: inline
In-Reply-To: <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--EXL3dzKB9Y94HpAk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:08:35AM -0400, Brian Masney wrote:
> On Mon, Oct 26, 2026 at 10:03=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > And today.  I see the commits were actually done by Brian (CCed), who
> > also appears to be a new maintainer for the clock tree - I guess the
> > contacts for the tree need updating to include him?

> I will fix that this evening. Sorry about that.

> Jerome and I were added as the new co-maintainers and we are listed in
> the MAINTAINERS file. Is there somewhere else that we should be added
> for linux-clk?

Yes, you need to tell me about it - there's a separate list of contacts
for the various trees in -next since there isn't a 1:1 correspondance
between them.

--EXL3dzKB9Y94HpAk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat+YnAAKCRAv73Ows9A4
idiZAQD6a2BSR6MnVtLtJdfGwXOcqlghCzqjTocRAnWWJveP7AD/a2sQi135iyvX
0qUtHgw5gmpKJWsgyD1QdnD+HvoxfQ4=
=qtJy
-----END PGP SIGNATURE-----

--EXL3dzKB9Y94HpAk--
