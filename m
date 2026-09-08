Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF37569F36;
	Tue,  8 Sep 2026 17:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888394; cv=none; b=u0AJaE0RR1rfDIQdT3IrmDlyIleWqoO/33+krFDL4OedpQq3slQO9U3H3OnBbIG6rfFlboOihNRru3CJ01qFQjh9cNXDPUOSG9pEHah/9PtRCTJSjOdtreBdSMWr+NRcZOXAZNInk5QvPm4J34dlgM0Is1wJie/1IpiOclAN2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888394; c=relaxed/simple;
	bh=WlgBXwOzblyBFaYVS7iBaBu97IoJI6SwkmHW6zvBNqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/jgCkIH772t8lgtmt8OLN449HhsKNKSCXd4s1LU828YD3puqhzabWvkk/Yt4il5hTGDQFtII2ndR2HN0B1TVHtxiwNTdfjvNRnMAWZYKTrB1iCRfs3SRXzKOt32YYdd3aFI7gVoGOaIPqk8F2ECJiD59w3dt7H+pcbEARe9PW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfIDJdKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfIDJdKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603D61F00A3A;
	Tue,  8 Sep 2026 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888392;
	bh=uxWyRJzkqP7VbvZPWw1j5KCPbeYrZXoHr7DAYRRZAjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UfIDJdKDYVPd0we6fYvkFHuvoBYvrxg6IIwlSt4qi6P68F+N94WOxsxOSjQB6JfYc
	 rDtgIR6vinQAorilaIKJ0IrTNGwn0NHXxSgjF57Mm4dykf1qctetqnnhsNabL+e5Mh
	 JMF5IcYiaFjQY7ZDI/Q2SJ6SbalfAA0rVPfBbkuL8n1CG8T/99glgPKkDKWSO4hOWP
	 3Eo9tiZPlPe1ZUPgA+e/b36qYhsj6c499kB0cPtaJ0wKaHNBEkwNSeY84C3KgZhQvG
	 d7/DnZBev4bS9eGIaxNf5BS2lx6NjNIKASH/Cpw2gd200VH9rObpuDl8J9YBD2vXy2
	 5U/qWF5biAAQw==
Date: Tue, 8 Sep 2026 18:26:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e0PIkH4Kp0kfVB5+"
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
X-Cookie: The world is not octal despite DEC.


--e0PIkH4Kp0kfVB5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 DAC requires the SCK (system clock) input to be
> present for proper device operation. On platforms where SCK
> is provided by a controllable clock source, register accesses
> over I2C may fail when the clock is not enabled.

> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *clie=
nt)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	priv->sclk =3D devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret =3D clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");

It looks like the device needs a delay after the clock is enabled before
the register interface is available (see 8.3.2 of
https://www.ti.com/lit/ds/symlink/pcm1681-q1.pdf).

--e0PIkH4Kp0kfVB5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgRUIACgkQJNaLcl1U
h9BbEQf7BNinLOtudO8oaqLcTu1OZBgIxb1vIkvHUeTBwolSxrD9yRTOndswYTmx
mPOg+4X54Q+QOLuJQdRGDH+zONsSiIP9YVf9klpfANMFcZIafieAp8JgF/wxB1ah
+7LVPxFBfCFDr/50UStxMfHTBe4ZHAM4TUts5Gb6vY9gTdXueSDtD41Dqtta0jcw
nnawl7Qd4hzfAHm+Lk/U+HAnaqjSmrx8gI/F7gIoMZ7W2QA6DuVTNNVhW9d3IK/L
pgOErYI1aPx07VlbNacwNa5G6BTsz3AzpjXIln/1Zu6/g5RQHwTgSbrK08B9F3nG
m48w4kIR9nu0vQtpckInm9N3zI86Pg==
=nZsn
-----END PGP SIGNATURE-----

--e0PIkH4Kp0kfVB5+--
