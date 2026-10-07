Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D163B47F5;
	Wed,  7 Oct 2026 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389579; cv=none; b=rNWG7pC6mWP4+6oWfxbJo645sxvuuvyoK1AMoxYCBGtFkLVUNagg6FGCjBgdDZiCZWcna7vgICLF13fKdKbkMu5/vvjOmg1U/3vakeodjjDuwSzNwCMeJvwSSSo3U22yOsjFzLOSMu+ZoepZIMSupUApCKadbvPC8Z/biBhDPXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389579; c=relaxed/simple;
	bh=R4CCfJlk4XGrk35U12jLt1NTvgL1jrwtTkBsBwzKCSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh2zdv9FnZFGax+N5VZvvcpnRaUSKFc2mPiCk6+z0W/8rypneCZ9zw2w4IY0CaHfdC0xDLWTFZF9T+LrzraQ80ichq+IpvnmCYe9EtV2sDcTwlbcoywB4AABHHwox2ssn/vFkVFjVu7E7MyCjGUm0UXi4DcbQ+TrCi9vsWlRZ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFJ/+D9x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFJ/+D9x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086B91F000FF;
	Wed,  7 Oct 2026 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791389578;
	bh=fVktTGrO7R5lVTCr7QVFGV1ppHSb8AmJ2KvaPJ7wjYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lFJ/+D9x0OUlhe+//JwvazAMOf2SzM16QDTvMl/pS0Vm3zfku1EH9vnKJJtCTpy3m
	 jbWbXE6yHyA0frfqd/iQO/gG5czE1QjAH/JFXmy7bPN4NHHv3xk78KS4CJYk3lHbz/
	 XtZSgpUoBqm11ov8EwPgHcKOi473A4Z36sFPTkBELzsuDjxbOrWJhEmu39ZadCrp9Q
	 5/b6T3PQea/1pOaNJaHqh96WZ3+oXA5wZlZvZJUZ5R3nIfy5/H9R8ycZuhbZ3rbUxn
	 2o/I1TBJBspyy486aomfreF/VjuD3N3fXtWosp+QMEy7dE4N6+FIjDb+QhjvG/CMIL
	 UxwE/EB4JuOOw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F068019B8B97; Wed, 07 Oct 2026 17:12:54 +0100 (BST)
Date: Wed, 7 Oct 2026 18:12:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Saikiran <bjsaikiran@gmail.com>
Subject: Re: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Message-ID: <asZvhvK5kB9DyemI@sirena.org.uk>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BrG3VPW4PPGtSIeE"
Content-Disposition: inline
In-Reply-To: <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
X-Cookie: Use the Force, Luke.


--BrG3VPW4PPGtSIeE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 06:16:29PM +0530, Jishnu Prakash wrote:

> Add support for parsing the 'regulator-off-on-delay-us' property from
> the device tree to enforce this physical constraint.
>=20
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++

Since this is a generic property I would expect it to be parsed by the
regulator core, is there some reason for making it driver specific?

--BrG3VPW4PPGtSIeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrGb4IACgkQJNaLcl1U
h9DW5Af/cASFIq2XiLZVpKSAz/PHCh/lLPA1v+WSj17KoXxIZY6L2XikRXPgVh2B
8THOW1ojWWbUWsFsUtLN2mBt+Y9rfD7ab20XhnQzgd1nyJycMgK0LUIxqjUEd+oW
0QcpL4hfa7WrAadNQEJNAiMIYY9mEZ75Zq4o8GDUeuS8ZAxpeF612JY//luWDiwv
m7WcMs4xB/eV3zvzo0lHuzJq6TRjM06VZOjCINiuv2WeVoxSuWHKJCcDWATei6p4
w8HmVRnQq7LtPHBSCtGMqSbTuDyesX9013TvJYYMFelk2qLze4eLgR//bq/NQ7Wz
a41W9sO7FjpNk+GRNHaEMbIlJL3V2A==
=a81H
-----END PGP SIGNATURE-----

--BrG3VPW4PPGtSIeE--
