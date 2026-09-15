Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41448D88E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486806; cv=none; b=pWU1IueVpAbAAvCf7hJqhYxnLhVpf/8Zc2svh1zif/ymbHv6xyCveE7VQciLOs8VKIiCdhBpVWd99R76NNa8oSnNFI2qIUgVDDHDM4sAg3QZuI2Ox0iTT4LQHNSlnMZ1ZYf8o5Ghd5LmJ6yeXLkOmw/zcS2b9Yg8vvndjxTQg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486806; c=relaxed/simple;
	bh=Jj8X5O1SgXpKzQJfWQYbcPFVhC1C4jybDaLTXPkMxLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pf+NVdJTZ6Sv8s5O7BzDZXdxPhUOGcjwBUyFBIkqDSICmUnmuWmWgNMlNAzE5xN8MBa+S+CG3KlWI/r3KbomE5lFArxucC3lSdsdIc9BWs2w9k15selRFEbEr3drPui5pezjhzq5A2X2wQjLUXJG1JaCKNPvAjiURtygoPHMDjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3FpMMC0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3FpMMC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFBD1F000FF;
	Tue, 15 Sep 2026 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486804;
	bh=wcyR/bGfXL5gPDxcsGzYiWbR/PG+CYJDAdyG4vGuWfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3FpMMC0OPz4PreqDW6y8GvSaYVeuMBiNPg21NNpAFDDAsfTC1IAN5HP4kxigJbz1
	 cyOmCtvVqBV5jwFt5mjwM2nr0GGDVwcVsEtm6l2TUVyTmgjX6b0HTkcCUa2enM8OTb
	 xAy5k9k0pY6h/B/UaoTJeUVFk9dx4TAiws6DC8ZrsODvzIQui7NJztslFpVHekrpFO
	 Tep4s7D0wHlNYBwXP1qFBENwKTYUKoowBFPUkLIiOQ1jKcYYfj+Zvp+eywgJs3R/mS
	 xEw7N9sPJ/N/2ml3XzuKKc07h0Ohf5jM42BbxOVuPzGScnHnISY1dg5+UWjdKHSlQB
	 jLD0UZx+SOEBA==
Date: Tue, 15 Sep 2026 16:40:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>, Axel Lin <axel.lin@ingics.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] regulator: ab8500: Add buck converter support
Message-ID: <b5e2d9e4-d0f6-46d0-9e66-861517def816@sirena.org.uk>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
 <20260914-ux500-dts-snowball-regulator-v4-8-dfc453a3031f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SPOyiFtfyIweaJ1F"
Content-Disposition: inline
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-8-dfc453a3031f@kernel.org>
X-Cookie: You can't fall off the floor.


--SPOyiFtfyIweaJ1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 11:11:21PM +0200, Linus Walleij wrote:
> Register the SMPS1, SMPS2, SMPS3, ARM, APE and MOD buck converters on
> AB8500 and the VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM buck
> converters on AB8505 so that the new device tree nodes can supply
> consumers. Match each variant through its own device tree node names.

> +static const struct regulator_ops ab8500_buck_ops = {
> +	.enable			= ab8500_regulator_enable,
> +	.disable		= ab8500_regulator_disable,
> +	.is_enabled		= ab8500_regulator_is_enabled,
> +	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
> +	.set_mode		= ab8500_regulator_set_mode,
> +	.get_mode		= ab8500_regulator_get_mode,

Without of_map_mode() at least the set part of this will be unusuable.
Not a blocker though.

--SPOyiFtfyIweaJ1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpZtAACgkQJNaLcl1U
h9DF4gf/apbN31QJsphlerSPekwvqdaHVFt6JV+7PNt/fJfVG+nELRviAnJiOwRE
9+Bl0sfE+bPIE6MBIEPHo+H5kwMPV5dY7WPNRNEe53G1kNv4nJZBbXUTJZ6jO0S5
fvwKG2X9MsyIafOj1dhvoDiNnIPdUxS2UreFovCRv27NosCr5sEMiCB2BrmGiZK3
WO35KPSdDVKRO0UjbvlzQzR4FNitlcXvSB+Dny8MHTq4eJeLMbma5DJhy1+64ZSn
WmWGBm/5Dl6bn1OIpJP8ed0TRHZNDT1gOEAbc4gy1FqcN21udvuZ4qmjGFJIRfGg
4qsmc5yVD0bBSMamsqGjBJA7uHxQTA==
=sOUV
-----END PGP SIGNATURE-----

--SPOyiFtfyIweaJ1F--
