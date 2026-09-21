Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D994AD4B7;
	Mon, 21 Sep 2026 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002941; cv=none; b=jTXZqX83nUGz7T6GZ7u9PSYLbToKOXX1OI39E+KVNdMkefrj2dqpQRNBmdgL8cUS6Ps6+CGQEwP1IALOAiW9mI67mgpqeJrhh/yFDommR4iqnxZQ46TU879wWRrF8JFuh2lZNHbrna4lDAe+aUzEyTvNPWQWnoGSdR1QNimFaUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002941; c=relaxed/simple;
	bh=v4UVAeTU1JJaiw4t/Qj/n7SDGMX+yxvPEzMCHsSdNF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoLp23yPf0EWj6QwHHrqoWbQ1aHkAS5oP4ov1eAEq60p6JnDZ4uCDAkn6v2h+qoHs8euHDdXufu6dCrsRZDUMZbNQDQpNoemEAmHeW5UIbOsMW3jfEIRxnReC44yBbkiiK6+GHikdts3mDttsVHkVwUdpfeuoqG2MSOXqFBFl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVSpmy71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVSpmy71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5E91F00893;
	Mon, 21 Sep 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002940;
	bh=v4UVAeTU1JJaiw4t/Qj/n7SDGMX+yxvPEzMCHsSdNF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CVSpmy71UmB2ms8Rjz8minaI4YrhlvUAq/hKG21gKu5n5xyDm5fsQW8CZ2JM3NuMJ
	 JhfkZ/BG2dYqYExJdfI56O4f6W/zamyRSG2c0P6fQQaUUz9omjbvee6GFxe9M6Z79N
	 g/IVuovmT/fyf9DsTWq7xtHxuCAHg9JbnckZYYOKoNVswX0rNP3d7xsiKNR0FExLqs
	 LD0v5GA0KX+gJyCUw8hogylsV/F8FMEhJE4N3ZweV/dc0HVrspkxn1m9EJBW4jC2S0
	 17XVnA8L8KAJ9KzOp+kYbVYmYklvat1VXWsEJT38xNGNDnjkckDAmfkinUZSfnWgmy
	 FnXzF3NE0sv9g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 198661AC56A7; Mon, 21 Sep 2026 16:02:16 +0100 (BST)
Date: Mon, 21 Sep 2026 17:02:16 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <arFG-KXA9aGlXQ27@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBqIcINAN3k6lMdu"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--mBqIcINAN3k6lMdu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:40PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Add binding for Apple Silicon Macs machine-level integration of sound
> peripherals.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--mBqIcINAN3k6lMdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxRvcACgkQJNaLcl1U
h9Bnswf5Aa0Iwjwij4bsZ+RZaKJ4PAN5qntk+PDpED8uFPRsFPjxayfQQpln/+YE
sDuji25SQZ7OypbShQhRshvEwun3ovaP2m+Ha4hMrWdOFbsyUBT4/IYUaK7iGUF8
QU58uLXPlqNSj8Ea7cgKSEcnMMhcIYcvgDKxpbWcugCdpoJEWwLEpSGeRjQNHlzA
0PMiHY2MlW7mTys8yaPlq0b4N41vHWxzZN+zOD0pRWLf4K33boQziryFUy3K9wfH
mPY+XVYWGwsPVEq9P/9zFHg9GbLNDIx4LoMBDC1zOgK05uuGRrM5QVgtWp5jqWR8
G5J4yfk6TU1ORHvckcmhQbBuP1KTsw==
=Gras
-----END PGP SIGNATURE-----

--mBqIcINAN3k6lMdu--
