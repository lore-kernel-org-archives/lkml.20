Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F741B8EE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751241; cv=none; b=F04+QLh2FoHkW3QEfxnH5dX2UOhvs2KDIIUR8oI2CPHc2KmYIsnVW8G+VF8A++ziMYWlnbGPg0rRAwwylRstAtW0x9UYUpdqCq8y3l5HfZWVjuOj+Ew8OEtsTQSS7x4MW5/G7nj9hUveuXosSiA1zaT7C0VGBnCgf36lAu1Y/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751241; c=relaxed/simple;
	bh=8v4PpP4g5a1k8oQjRhuEBG2Gtnnr1HsLkc+sCxSrUm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj+mRGwi5nMU19ynB6sFndPyEGjG7Bt4ALxwo+L/zx+VBWp2VEOSyjcqXlRVHUZZZXu/yKr9VHr5AfVWI/a2c/Uxpn4cyS1gOyheMPbusIggyrrzxxTlNmqR/oNGJzpn4G/GZkfKoTStXujgImAmveIaOvlgmAr3LP7KReiWJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z56TJO1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z56TJO1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91CD1F000E9;
	Wed, 26 Aug 2026 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787751239;
	bh=8v4PpP4g5a1k8oQjRhuEBG2Gtnnr1HsLkc+sCxSrUm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z56TJO1/Qqm0jXK+mOfusBMO2UyIB5EPNX1z5DaHXOh0/hI1Hq7ugr4fp8bjwrS8O
	 oCjuIUP/N3248xthHsZAfUWoAK6syzoD4cUPt9xOsjK4f72/MoEQWO0b14z9jpzhLN
	 cX4kb3lBJc/EHqgA3SCy9aHQhl1CVysInio38092wfToP68zmtqetyOxsr6CEUCder
	 7uym4VJS2BBIbDyo9jmT0LILFRXAEiQokFcAZzJpNCn03O4om6Xm8I2A6a/3bS3GAp
	 MCvJzpNQRq2nmkKlZmJyaT/q3bHLWn05/4aTUeg7KPwMB8mKVFGSbECRl9y1/Ou5Pl
	 auHnxAm1ZjKUg==
Date: Wed, 26 Aug 2026 14:33:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Yang Zi <2959243019@qq.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: max1586: Fix NULL pointer dereference in probe
Message-ID: <e00355df-0bcb-4f4b-a2f2-92d04f4dd7f1@sirena.org.uk>
References: <tencent_750CA7EA651F7A05893D87B278179E41CF0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3NuYK8i4Ep5euwf"
Content-Disposition: inline
In-Reply-To: <tencent_750CA7EA651F7A05893D87B278179E41CF0A@qq.com>
X-Cookie: Obey all traffic laws.


--q3NuYK8i4Ep5euwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 05:00:42PM +0800, Yang Zi wrote:
> max1586_pmic_probe() dereferences pdata->v3_gain without first checking
> that platform data is available. When the device is instantiated without
> a device tree node and without platform data, pdata remains NULL and probe
> crashes with a NULL pointer dereference.

This doesn't apply against current code, please check and resend.

--q3NuYK8i4Ep5euwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO60MACgkQJNaLcl1U
h9AOPAf/bIIzO2m/aRsI3I9vZ23r08TNPBDm49p5N/L/1ZNVNMxSoqcanYPmLjrN
gQzB2erX9S4iP0jjuoO/O6fEr7axUMsAVo/DXfoiwcbivDS3XdEJYGt8yRqvPClZ
0p2gqrT7N9HARWVDJdhUFhoSJo+I0yz5nWYS0fx4n1RhWwJF4/dV7nkG7+XcXCmJ
fXJW4HtYrUATeghoD/siWHmrwkn6ZipDALCJSdIrWPLWgTvwwd1e5dTXR/49P6+0
eQAC04gJlBb7iYj2MRLsuzyAktyEqKcHGnMncYEE5Drbl4gwgRub+zl1gBS6vxsf
s0t31xooadvT6FaMyIhtbiy5I+8DhQ==
=Nvgj
-----END PGP SIGNATURE-----

--q3NuYK8i4Ep5euwf--
