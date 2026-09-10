Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE14A4828;
	Thu, 10 Sep 2026 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055915; cv=none; b=DN9NzEdI+awDcFLRXXAaMDNDuvlRVbDgDNwhgZD6np9FccPLQegyQuitX3Ua7eX+ExYMejOK3FJ6rm0OtxwA/owqGRb5Cvrn3q/5xvmzAlgEq7g69Ays58kGhSLwakCkpPU+wYNe/bjWZ2LP8sby7ElOS6eKlid/QWJn46GgLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055915; c=relaxed/simple;
	bh=mtivQnJuoyYZo/CHk4ap6/0IFAKN/CSN0eD/OxTrYQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsUYG1emo4HBP2vbANaQlKEUUlG/z6uGGbpswSqD5m9RLnsOKVyALK30A//HoQOPUjXFPOFkvT7gerAn9ACc9FGDyCPwZ5m4OEOUwWWRIr0P1H5lZs8Ti46tHa2SJSXUNPXtMR3obqtQ/XFFcSjVBwZaYDL8OEDKV0yPqPZH6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhFVnzp5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhFVnzp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A0A1F000FF;
	Thu, 10 Sep 2026 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055913;
	bh=mtivQnJuoyYZo/CHk4ap6/0IFAKN/CSN0eD/OxTrYQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WhFVnzp50ZMzAinzBu3+V+LxJiL1ETZLztYuPRaNmD4TM4LKH/tAzaI2k4vHvEpre
	 KxvckaZoIhhd9MHHc+efQJYCjh4tGIKCBWxLjXNmR94nJsyP9HlJRxsg5Rwiwby43X
	 7u9k+c9OZpGPuWTZT6YPWziNRLZPks+rO19mGp5zbiLXc++8pB2lTvxzek1tRJssuq
	 roSU2s26UpZfbbdc0ZX+Hc9873iqBs6UycCnsSn2KTOWvf/9VWMEaJx377cvOpi2gH
	 CeR18u+EGJTzrdeammoAGOSALcrV9t9ITn16TSRjqTyJ3Sr3bbYqsf0inJDWZNr0yB
	 k9t5c2vFTaNlA==
Date: Thu, 10 Sep 2026 16:58:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] regulator: Add MPS MPQ4210 buck-boost regulator
 support
Message-ID: <cd0d2e42-5fbe-4cf9-81a7-cb102f543e67@sirena.org.uk>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsE3q8oCInVXG8I9"
Content-Disposition: inline
In-Reply-To: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
X-Cookie: The star of riches is shining upon you.


--tsE3q8oCInVXG8I9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2026 at 08:51:40AM +0000, Tapio Reijonen wrote:

> One consequence of the hardware worth spelling out: the MPQ4210 does not
> respond on the I2C bus while EN is deasserted. The enable GPIO is
> therefore claimed and asserted before the first register access and held
> for the lifetime of the device, rather than being handed to the core as
> regulator_config::ena_gpiod, which would drop the bus along with the
> output.

This is what regmap's cache only mode is for.

--tsE3q8oCInVXG8I9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi06QACgkQJNaLcl1U
h9AwXwf9EhDfR+7s0wsF+PpKppfHYz5n4/Q4A48fnAZvCChWNjKGdobPaZxQry4x
a9cejgulmZQuLjxj6dgurEKNodEyQaGeSR3hdhwQ4oPEL2ouqbgbeQML0qJDaIEi
g/rIGulc8gk/2TbV9FNBZcnJcSJo9wW1pD3l+nnHvifNpMvFwuRf587nEJ9DvHGA
YWZiBaer6qX5qbGSZpAkbWVgZVtsAIPchvTXPVEkZLFRoZ/rLSxWH8mBkBWZbg4L
Qn9S8gmqo1jehPILbBIF+/cgfFfisdyIUdMuWWMjRYnVUaUzmzGO8ozLfQmDJtak
9t3YgDAd1xNdbWCmwvq51M1ABOoBrw==
=ZQQS
-----END PGP SIGNATURE-----

--tsE3q8oCInVXG8I9--
