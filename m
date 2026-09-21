Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7703C09F5;
	Mon, 21 Sep 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997022; cv=none; b=nVTuI4PRehTBpxq4K6+mB70Yx68Zb5rO9ujGsBCPadWSIjzEM7VQWy013UWvp0aEYrUGfcxME+LgPDDTBVPab20dPmggAgTBHHulQqohSHu38w+a3j4bOFOYAXoY0ML9HWU2+T0lTN3Kqrp0Q8ICH03W9OTE436R0PxN44STJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997022; c=relaxed/simple;
	bh=ILTlNDUYmEiSeY4lDQxdQhoDTJaXJe9qCRQvipA5z9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT+O/trOhIXu9ngWED+YNXSt1XIg8hTR1bzsmu6622o9R4uSqkn8GUgnpjUYl9ywoqRwupOi7i2LT/0Ky3xg3VSkUuECeFzT6jiu4xbQpV3OaTpsYTVrZWa0DmWkhuMRV2FbXA4OBIR9zLeAM4nuF32EEdGe6ABqSBxCkS1ZMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGOY+fMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGOY+fMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC911F000FF;
	Mon, 21 Sep 2026 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789997021;
	bh=fLwZek4EyJluuj8Pslnv2cjb+sz2TFrNPKCV32ADyLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EGOY+fMqNA5ylxoHB89dFuqDWrLclQxP2VnMwnynEE9TCqwkecRAE/+qaVhX0EWf6
	 5pTUFes28jkjQsYb0w836v3Ll86VCBLOr8wFY5J1IzU0jSGtQ55dzcCZen3E9gDPc5
	 O4iZ804j0Zva0wJvybhHDohraX6mag++v3tYaL3eEPitJLZClauPkyc6eG2DAwysQz
	 kYk6I/65Q7SbpDZKrmeE+034ONkai+df34OnzaOFDSWKXovSoRGOnac0GCA0oW+GT1
	 grDWNUWlDupQHlH+8504vYXy1235/1VRMqPB+PxUFCTBrC+AGZaPgDYGBcoSTnXNPX
	 1MEWUBKgyS5ng==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 124771AC55A7; Mon, 21 Sep 2026 14:23:38 +0100 (BST)
Date: Mon, 21 Sep 2026 15:23:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 21/21] ASoC: rt5514-spi: Free the DSP context on
 component remove
Message-ID: <arEv2rLNkSo_2yXm@sirena.co.uk>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-22-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D9aeZTtAVC3gseBa"
Content-Disposition: inline
In-Reply-To: <20260921104640.1941554-22-chancel.liu@oss.nxp.com>
X-Cookie: Too clever is dumb.


--D9aeZTtAVC3gseBa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2026 at 07:46:40PM +0900, Chancel Liu wrote:
>  	if (rt5514_spi->irq) {
> -		ret = devm_request_threaded_irq(&rt5514_spi->dev,
> -			rt5514_spi->irq, NULL, rt5514_spi_irq,
> -			IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5514-spi",
> -			rt5514_dsp);
> -		if (ret)
> +		ret = request_threaded_irq(rt5514_spi->irq, NULL,
> +					   rt5514_spi_irq,
> +					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					   "rt5514-spi", rt5514_dsp);
> +		if (ret) {
>  			dev_err(&rt5514_spi->dev,
>  				"%s Failed to request IRQ: %d\n", __func__,
>  				ret);
> -		else
> -			device_init_wakeup(rt5514_dsp->dev, true);
> +			kfree(rt5514_dsp);
> +			return ret;
> +		}
> +
> +		device_init_wakeup(rt5514_dsp->dev, true);

Previously we would ignore the error and carry on without the IRQ, now
we pay attention.  I don't know if the device actually worked or not.

--D9aeZTtAVC3gseBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxL9kACgkQJNaLcl1U
h9ATtgf/a/Fz3QCAlWQKG+ReZJ9hu/D2Y7X7qK2QviFDO5Va2LdEZ0zw3TSctUls
Jx3C/OrpB+z7IE5EkMZme6tF2jdm4aHu1imze2LLQvwMjyCNeGX5ZoiIIq6NB7RJ
49nijn4N3xfMyE6JHPZfOSJv8xVP36B7TCP6T2mivNEyq1qmdN4ohpb86aCOW9U7
pVvY8wOSXjp7gyItxmzTcsxp6Aa560SUpMpx0UT0I5uLJ3TWPN+mhvchlHMBPSdI
QFDU/Z6I5RDToKUPehIINn2CXAXAScNZFx8DMh9+XY9uPn3sG+ayZYB+hiWZ+6H2
Ci2ZH/ubz1N/gEcDQK0e3GTrSCPDdg==
=/VAv
-----END PGP SIGNATURE-----

--D9aeZTtAVC3gseBa--
