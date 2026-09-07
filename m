Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590E51E428;
	Mon,  7 Sep 2026 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803813; cv=none; b=OhQiCEAFmvPEsff5YW8w4+SQvD/6lPCV8IuGT2nijODqDD7antf+rFCM6w5A6E3AeLdxpoV5XxYkA3tXZomNYVt/89/lcADCyG3MC8tJmpcO7y0uhhyJFlxnD0zZwklriQwgV3kg71ChppcIu/So5H4rbRSL5ji7oDe1KExKpU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803813; c=relaxed/simple;
	bh=rCd4o72CV3YBNJvCw9LIZAl21978v8is8bJfbltmLjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfQFYgPKL6IDSwa6N8jzeNPs8rhv3nRvYnsuNDrri0IhzGoXGVMRwB3W4z1dRrNG0y7rRfxcCaeiGk+EbhZRVxX0+5k8JjOfbi3kd1Y7RLQr1tnw15VP7K4I+q7+4SorBwqTTLV0vAm7PStiehAm5cg3FeAHJhQemQUPbI/5788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpRAbb9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpRAbb9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC51F00A3A;
	Mon,  7 Sep 2026 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803811;
	bh=rCd4o72CV3YBNJvCw9LIZAl21978v8is8bJfbltmLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpRAbb9L1Yeg4B/lx2Tj+Pbl3HLpbW+qtQveIL0Q6vVYEwoWthFXvUqU0/KgWvjxJ
	 FUVIndAkvHEIypc2g7ece7QOJHuIApF7/jEyF2aLFpTbkfCGtSu0qP7YtzvukN+ODz
	 espsLqlHDOsj80qkOElIVa+WqFBEsYoZ/RMBkmv11sYB2Pz3JtVFlPWJJD9+S51i3/
	 nCy8ISV/JENiOI4rdjWKzagaYVluQ841lYbYrMCeKfw383tvpOGzxuVph7zZagUuS6
	 wtWGqOaA74uAH4hlv8tUDd25X4I88yRbBPbnIbSp7rITxhM5Jj5sH5kqLQqQs3CTwp
	 zzGjZR15L9S/g==
Date: Mon, 7 Sep 2026 18:56:46 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <20260907-fasting-greeter-2fa47ec21b6f@spud>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
 <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>
 <20260907-huddling-sprain-33272820a361@spud>
 <CADvTj4qMvPWsXOYMOBS23RHAx0_pDoHDWd89cRyaL_T5GAyKWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/sdxA34ElGpUXAJP"
Content-Disposition: inline
In-Reply-To: <CADvTj4qMvPWsXOYMOBS23RHAx0_pDoHDWd89cRyaL_T5GAyKWA@mail.gmail.com>

--/sdxA34ElGpUXAJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 11:34:05AM -0600, James Hilliard wrote:
> On Mon, Sep 7, 2026 at 11:19=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sun, Sep 06, 2026 at 04:30:46PM -0600, James Hilliard wrote:
> > > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > > audio, video, RTC and Fast Ethernet PHY functions.
> > >
> > > Describe the parent device and its shared input clock together with t=
he
> > > audio codec and TV encoder child nodes. Keep their analog supplies on=
 the
> > > function consumers and describe the TV encoder display graph and opti=
onal
> > > bandgap calibration cell.
> > >
> > > Add the shared interrupt-controller properties and interrupt numbers =
used
> > > by the TV encoder. The Ethernet PHY is represented by a PHY package o=
n its
> > > MDIO bus, with a phandle back to this device for access to the package
> > > control registers, so it does not require an MFD child node.
> > >
> > > Keep the INTB connection and TV encoder interrupt optional, including=
 when
> > > the TV encoder is enabled. Cable detection status is readable over I2C
> > > without an interrupt. If a TV encoder interrupt is described, require=
 the
> > > parent interrupt domain and its upstream connection. Include examples
> > > with and without INTB connected.
> > >
> > > The input clock must run at 24 or 27 MHz when the Ethernet PHY is use=
d,
> > > matching the rates encoded by its documented clock selector.
> >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
> >
> > This should have been dropped when you merged the patches.
>=20
> Oh, forgot to do that.
>=20
> > Not sure why you sent v10 without waiting for a reply from me on the v9.
>=20
> I had figured I had enough pending fixes(i.e. sashiko reported issues and
> combining the patches) that it made sense to spin an updated series.

Please don't, it leads to fragmented discussions and missed comments.

Thanks,
Conor.

--/sdxA34ElGpUXAJP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap763gAKCRB4tDGHoIJi
0qyCAQDYxECXRiFpC3t/1yVnuSe8Hxl8YEVdwAxcVcA2zKxlEgD/cZe/U24fe85C
kK9fOwf5kgVTg/WSgrzU5GTfChzm0gE=
=ayHH
-----END PGP SIGNATURE-----

--/sdxA34ElGpUXAJP--
