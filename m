Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A844B540A;
	Thu,  3 Sep 2026 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449681; cv=none; b=L08N47eVnPEO3xNvC8F/Gvn1NtWgt0cMUZvPhespC/abRZ0EjfSAkxxYjm8I7tLmJ/LyQSUCwm2iXL4sXUKRlMIO6eH7n1JnVoHiiFe6wGPouYFeQSZh6aFxi0GSSSse9ex/gzeC/Ao3qhA2f24BPn8PX+OEeOD/3bBIPdT56A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449681; c=relaxed/simple;
	bh=ghM4FSZQmHOtCtW/UfYTfnb8D4wLQaKNMfbZUlhpDs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVxhIcI99dpgC3NrbmPB1sVSozNa0lN3JSYsY+lcuoolk9TwNEviqAAYtVhy6V2L/ygAVjweR9uAt5SoOseXBIw00x6CDGCfpsc8ZatdsbhdhLkkEJJM4B/SqPO58fSgwjyeEucrUXHGBqdOFSQSz+MOHzZUSGhvAWCDL+nZ2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GingWM12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GingWM12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9CE1F000E9;
	Thu,  3 Sep 2026 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449679;
	bh=LVwvRtVb/M7XR6K0WzybbRVJHJwpcA9imnhXDdDApaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GingWM12wQ/VrQAt4riQCZaejzKuTAkOQdvGF1UWFzneWfzOmVr023rDpfESFdqPE
	 f3r+hN7lfQTzcBblrk5mqV7U6MALbUnpBL0pNPDdbH1uC0WsASPyl9L/GEKyMGmDQJ
	 /uQB86o9adOWLc4lcjPkFrurM7r0kvaBnIhXR0FhbCLfAIfLwhfPwO8PXcTTcUbedl
	 iBCsP70e4D7nzT20oETW86SVuqJnvrOObOlJ5JJfJJ640n7jpRX8Pv72VvG8RVgDni
	 p90mRLzy1Sa1tNit5NYw7LDVoQvT5eUVgBBYUWhwOrYcfJvd2PhwEU94N+GTwQMOJv
	 zvEiSZ21tA33w==
Date: Thu, 3 Sep 2026 16:34:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903-agenda-lividly-41c3b6eb56fc@spud>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260903-succinct-military-macaw-9e6e71@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cGOoTxa1hXWtpxP5"
Content-Disposition: inline
In-Reply-To: <20260903-succinct-military-macaw-9e6e71@quoll>

--cGOoTxa1hXWtpxP5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 12:04:42PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 06:00:31PM +0100, Conor Dooley wrote:
> > On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >=20
> > > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> =
10
> > > years) check_dtbs warnings:
> > >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da90=
53-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> > >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052=
=2Eyaml
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Previous try drop dlg,da9052 at
> > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da=
@quoll/
> > >=20
> > > but Krzy have concern about compablity.
> > >=20
> > > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@=
spud/
> > >=20
> > > Conor prefer update old dts.
> >=20
> > I don't think these devices are actually compatible, so this fallback
> > would be wrong.
> > The data comes from the match data, be that spi or i2c, and there's
> > explicitly different behaviour for the da9052 and da9053aa.
>=20
> Maybe I looked at wrong driver, where is the difference? I made a very
> quick glance and I found the only difference in da9052_i2c_fix():
>=20
>  59         switch (da9052->chip_id) {
>  60         case DA9052:
>  61         case DA9053_AA:
>  62         case DA9053_BA:
>  63         case DA9053_BB:
>=20
> No differences in "da9052-core.c" and SPI, while looking for these
> device type enum values.

If you look further afield, since this is an mfd, in the regulator driver
there's a lot of conditions there that depend on the chip_id. E.g. current
limits and voltage steps differ. There's also one in the battery driver.

> > I doubt the legacy platform ever worked properly, and this is what shou=
ld
> > have been explained in the PR that Krzysztof denied not just blindly
> > citing a dtbs_check problem.
>=20
> Well, yeah, I wanted an accurate reason with actual analysis, not
> necessarily making devices compatible if they are not.
>=20
> >=20
> > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Best regards,
> Krzysztof
>=20

--cGOoTxa1hXWtpxP5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmTiwAKCRB4tDGHoIJi
0hyCAPwMTGNQ5Lu7AdcSDddXHf86j3pCRARUzL2yMiCKEUScqwEA5pirDPWI6ion
otwPCYxMPDfiTDWz4YC0Dxa3L+qpxQk=
=Teac
-----END PGP SIGNATURE-----

--cGOoTxa1hXWtpxP5--
