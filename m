Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A7F3D5221
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488681; cv=none; b=ibA6NIfy7C8z5R7w4Xod8F8/1kCQYyVFINCf6NEPbccpLankOF9AsswjPyCWmmgYXpIZOeQKUbba59W0EQmkgL716dLL0djAlyEb6d6lruS9poFZfg7rjAcQda+No25I2FDxyI2Ub8Kh9IJB1ZKZZ+Df2oU9XxTjbE7bMEfxaOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488681; c=relaxed/simple;
	bh=vURK01Pg69IDRwKJ25yz2eBjPQ8PBcJXeGwBr5Eb7Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToXOFQBu73RI6/DTPLROgDol1AYrhDkR0bu1VBk41rX7A4rdeVgDh5P9GncDPKvwBvmv/RbJLVyGB3LhRc8yeC0jaY6XVwaNOeM+f8iY9xi12I6uL38/2UKvGYp777iilRNpOifBtlBUHkEx1rqxiG9xQEqKTz+Oi3OphqJWYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbJSCygg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbJSCygg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1921F00893;
	Tue, 15 Sep 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789488680;
	bh=vURK01Pg69IDRwKJ25yz2eBjPQ8PBcJXeGwBr5Eb7Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbJSCygg9UkD5h2QVdO49gVFshVGjbi90as5UKs5oXnTw8Ndx7K/E6TcqA4bAOERT
	 Pg+Op5C+2RDrMkxlTRPXl5q8mIe5pSagJ6dxV0Fy0fjcHbMnp214jrNp4lB7qunV7v
	 9XZCrllKGq7/HKh19B2gXufrpHgpZnezPrIu8K+s1vFTaA5Ta6bc+3lR87tpKb5gG9
	 Agu/a8WKm5HjcH1c9B9EJzgh2Jszf62wjXFd4KOwjN9M4VIxfCEVL5KDiT6gn0loBz
	 1mZgonDugYo+mc3AFVnwSh1jmNa+OaBd3fagig+lHDT45IW6eG5rj97XiClkVtLCqp
	 mnJPjuSV2hzxQ==
Date: Tue, 15 Sep 2026 17:11:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>, Axel Lin <axel.lin@ingics.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] regulator: Add AB8500 and AB8505 buck regulator
 support
Message-ID: <d1afda4e-f2bd-4572-a0cb-e29ad034f3d6@sirena.org.uk>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5noPqvZEcpKOwMml"
Content-Disposition: inline
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
X-Cookie: You can't fall off the floor.


--5noPqvZEcpKOwMml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 11:11:13PM +0200, Linus Walleij wrote:
> While working on the Ux500 power domains it became apparent that the
> device trees were using the DB8500 power-domain regulator for supplies
> which actually come from buck converters in the AB8500 PMIC.

This conflicts with your other regulator patches in my tree, please
rebase on my current tree.

--5noPqvZEcpKOwMml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpbiQACgkQJNaLcl1U
h9BXDQf5AfbBwN8gMafkZVH1HF4pJQR+2Bui5zLVJ9F2mz1mnK4I1Dv9W6W/HZpP
FZ8lX2HGH7Xte+74Pkb+UizGtuABcjA3XXxd6xmCUyBahNxgpgmhlSMp67lezbhu
HtVPlBi6c+qfaTYdduRBp1OAdHNAWx67jT/1jSyO6/xbXAy80ZVjMwpNAQjybHMS
D4ibRq4QFd1kP5C5zDUd4txe5U12bHueCR59HQxsVs/zpCyFKUyGVwUZdNBWo5+F
W3Ifto//x8tXFr21wfItkAwFRLst3qfYnMVlArkLWT3qNYraXyUGlTqO2PAAhlxR
ugZrITZGa/GYce4bOD0aM93qX+mnbQ==
=zBcD
-----END PGP SIGNATURE-----

--5noPqvZEcpKOwMml--
