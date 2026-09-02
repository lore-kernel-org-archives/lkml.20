Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CDF4AF9DA;
	Wed,  2 Sep 2026 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368474; cv=none; b=VD7XL/lUoUA0/9oFtugTENM+gfAwQFTNgDuGxfeciDVkWyv4h4LKI+Y6/9PSDDvXWdkZlSdHiIrg6JrXkSLDkC/YiIKlYzYo6LFw/rI5dPqgS6nZ0FLHeSXgWqUM2jeMZZx62b14HC1DHbhGoIksR/QvIyAClxy2w74WG5d0RXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368474; c=relaxed/simple;
	bh=Gwt3M8c16qFKjAizc60XazGddbU35HXrs6EDLGqsr38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enljVomehWswPcv7Y2Sf5Hleke3gmMowh3oKdHKPxcIcxho/LYiH+xiM4p3FVpYe5SbRLbSe8GIYLuqol43Tnb26CQ/R1NQLJqohqwp6kAAswNAhHO8ddvNyb2kKfKJ0TWxwlVfYgtf7fT6wttOY8LzBkbx8limmJ4seoGjyA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLaDzKYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLaDzKYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A13E1F00A3A;
	Wed,  2 Sep 2026 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368472;
	bh=/7fv2ruudY4O7ZTNXcdhmsegrQSkGzb4hyE70Cml4sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GLaDzKYUSZVMye2SSMoNuIDIxegxYnEhVTBPwo4tt/sji4h7vPK2nOq5CtHtD6LvU
	 tKywE/XfKoML/LDJJ/A13Shd3wXzoLI49Is0JLqB2igPgoXxFYH3vGRxGbQA8yPRan
	 1LnY9xXeiFzFpT5LAZJ71vLBNKQDAysq5nNeku0B+eeNWTZV0uHT7o8SOgEtFD9SiJ
	 0W8c35ixUX5Yly7BkLekLtedUYPydxVwz3wHMCaRKyGQM2+n1w568X2xgnd3i3crql
	 Lt6jz26OOGX3wpd5/kbkSnzIvUzS07T690usB2wKIU7IYjdIdySRCXuDtkuq92ZVtc
	 IxcX0LGSVER6Q==
Date: Wed, 2 Sep 2026 18:01:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	Support Opensource <support.opensource@diasemi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260902-varied-unsent-b99f9f007685@spud>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260902102532.GQ2943942@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OGMRXVt5Rcvj6VVq"
Content-Disposition: inline
In-Reply-To: <20260902102532.GQ2943942@google.com>

--OGMRXVt5Rcvj6VVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 11:25:32AM +0100, Lee Jones wrote:
> On Tue, 01 Sep 2026, Conor Dooley wrote:
>=20
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
> > I doubt the legacy platform ever worked properly, and this is what shou=
ld
> > have been explained in the PR that Krzysztof denied not just blindly
> > citing a dtbs_check problem.
> >=20
> > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> At first glance this looks like an Acked-by.
>=20
> IMHO, this is going to cause issues - please rethink this.

As in, use NAKed-by instead or just say NAK without the name/mail?
Not entirely sure what you're getting at.

Cheers,
Conor.

--OGMRXVt5Rcvj6VVq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphWUwAKCRB4tDGHoIJi
0ihnAQC+sM72UQewHQsSjnn+AW0eqHdzt/R0KAaLAwUBiwA+AwEAqOV3gLKg3Hz2
Jy6DuQe9rageS3PSAzTM9yRM4q8hMgg=
=+u7D
-----END PGP SIGNATURE-----

--OGMRXVt5Rcvj6VVq--
