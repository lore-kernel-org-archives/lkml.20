Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BB32F75B;
	Wed, 26 Aug 2026 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754265; cv=none; b=U+r1Ln5Cr1wZmXYu8Tpg5jiXH9XXPkOzl5B6Y36ZnsTA2sEulzseQRp9Xoj3WY27Z7OeNZLn91/NA/CJ3VeYEJ5m1cKeZggTjjHsAyUorGZVpRIvwbkOYEukrcZesgBmIKKHObXwRKH0i0xXe5qXZYgpeoSCNFOLaghey+N1/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754265; c=relaxed/simple;
	bh=NEOLQuhe/G3SC0/e44Zfkr3aith8vgHVgBMr15qCbi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXqRoTrg7CwfVWzA+3C70RoQzEH+gzuvYPgHRjpM+6UzukqxX1+91SYMw/e/zWRuyS7weToU81LtUIhW8H9aPx5ByRg6BYfb/SUfNtUq1A09IelyqZ7QtFGbficPPmFVbMzPjD2cPPiwJYp2e24dfVtlXcYEN6izdrsA7bnbDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgHxYs04; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgHxYs04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91181F000E9;
	Wed, 26 Aug 2026 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787754263;
	bh=ObJu7VA70v/U06F8ZJibXS73zrK6G1viDxAXAhkRoPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZgHxYs04JwgbjyIPUDGTR8IJw57LZdCOloEsaHTOTBO8EyNwgI2TdQwPLxRBmuJ1j
	 zCYcvAITneaix2+uyBRMlHXAtMOnrzebkcMC5f7uuse0CcKjPn/Vse4kvqkG5YKPNU
	 EOA44M8wm/NVz7R9oq7hbUFMYfYc/IizWVpZPZmpWunpsTMnIOnSP2qa1j6uS8l0hu
	 k5l4ermEjjpsAsIAFePND/M8rA271jMwK8AZo7GNHyED/0by88FjvBObnpE0+0Absa
	 RUW9M47P08DECoDc84ybiYC4QESA6mBOtAuYcRReUyeEz+0AeWir3OtzcCHYD2TR+B
	 54Pm9s+6dlZcw==
Date: Wed, 26 Aug 2026 15:24:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengyu Qu <wiagn@4d2.org>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	Syed.SabaKareem@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, wiagn233@outlook.com
Subject: Re: [PATCH] ASoC: amd: acp-config: add quirk for more ASUS FA401EA
 variants
Message-ID: <358dac57-4c5c-453a-a82f-41258e664be6@sirena.org.uk>
References: <20260826094209.29299-1-wiagn@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9DtbH6Ah+pq2AKo8"
Content-Disposition: inline
In-Reply-To: <20260826094209.29299-1-wiagn@4d2.org>
X-Cookie: Obey all traffic laws.


--9DtbH6Ah+pq2AKo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2026 at 05:42:09PM +0800, Shengyu Qu wrote:
> Existing quirks doesn't cover all known exising FA401EA devices, so add
> more quirk items to cover them.

> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A14 FA401EA"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TX Air FA401EA"),
> +		},
> +	},

Do we need all these entries, DMI matches use substr() so I'd expect the
first entry to match on all the machines that the other two matches,
unless I'm misunderstanding somehow?

--9DtbH6Ah+pq2AKo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO9xIACgkQJNaLcl1U
h9BhyAgAgGr3ZbDLxcansrn1RsdEb9DiI6bowv+eCw+yE68nmfF6F8ztjxnsJo1y
TcTNYmjwbZD/1AMACDD6G0fZQPXQIYH4mK2DaYDm1H2t2jBqc6gTNuIkJp7u0m+P
aovEM6fGipHwXVhr/Eg9OMcKyh5cYFU4+7ipagb6tIrQuwlCY083mFWLkkyDPWNQ
1XrlxByJpZ2yhU83hHNw4BD66cSSNVa3sSFqHZoT2IwszKBvFwhQdoq6jU51HjGT
9G1ynW9evn8AC7ZZh5rCJ2SZt6oDzjzU2wN/wC4Rt9XqWp3b1fun8g7gWyoCeqKa
Ps7tKSxDbN6liSx8l61tlx/hkLSbmA==
=g/jI
-----END PGP SIGNATURE-----

--9DtbH6Ah+pq2AKo8--
