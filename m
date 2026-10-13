Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72149516166;
	Tue, 13 Oct 2026 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908249; cv=none; b=V6rhmGI2M6hUKbKaQHQqz/Y1fRY6Hln5pmxVEyyfepLKqmALWQ6g9fzFba2Ypoz8de37hlmkygvXQ7sRsMMmCxVw3j91cDnsrlE2Qj5iqeUof0pwzH2dJk2ZftcWvoEQX9bV1gfhP9dZSCBZcGGjrmzzl3/pRfEkqnULt0M7p6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908249; c=relaxed/simple;
	bh=g5+8ErqXeZDKXcuP7eu3I4DDW1/JmNe0Tn4MK9wTx6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayTt54P5dpureDjaRbLEMukKYKhzMQw0/0OwifFWuia3Cxka4BmZndQOGUaZ06Rt0EQmtk+cpQQcAVXD+Y049SH12o2nkfpfMmKmpXw48IhUgUmo93muEy3cYErJg6leL8dyEauD4kGt/DrELcaw/Y7vehRHHmGj3px0w1/ZEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRtc0YuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRtc0YuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE441F000FF;
	Tue, 13 Oct 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908248;
	bh=d/AqZyAHTs/5Ze0NJawuBTwqntQ1EEyvYdHwstfLlgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oRtc0YuLUrkDiSZrEta9ZbfPGe4YcN4dg0b8m/8AWubxvc4grOmzg8WO6T7Oo3/QN
	 ITtmcNAysxUoKc9jlntXO14pj6PsLmUFLgPbw4C8oTZNyh5RAodoFEo09kFjLHcJHj
	 KgZrYZIlZfv6I6vPzxymih+kS+WwEMP4eDG+084gTWl+hskXlBuJ0vzzCffC0nzIeU
	 E5KX0q9UIqEbCHHkBr9FRcgQ+n098/teFuk3wxQJbC7N+Uo8Bw+jneIr0q3sPKgaXV
	 Sy70rxVC5TuezkUnhslo+Dgb3rttwfup3bKnsUEHtlMsvmGp23L591WZqSl2jqmvgw
	 KekC5BGC8/9/w==
Date: Tue, 13 Oct 2026 17:17:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Luo Liu =?utf-8?B?KOWImOe9lyk=?= <Luo.Liu@cixtech.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>,
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Wuyi Shen =?utf-8?B?KOayiOatpuS5iSk=?= <wuyi.shen@cixtech.com>,
	Eastlake Yang =?utf-8?B?KOadqOS4nOiZjik=?= <Eastlake.Yang@cixtech.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH v2 1/3] dt-bindings:
 phy: Add CIX Sky1 DP PHY
Message-ID: <20261013-retry-unturned-70c276adf382@spud>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
 <20261012123618.648930-2-Luo.Liu@cixtech.com>
 <20261012-founding-stench-55cff46fe1a3@spud>
 <JH0SPRMB0074821E0A55434A23B60E45F59E2@JH0SPRMB0074.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQxb2iB7MuCcOiZL"
Content-Disposition: inline
In-Reply-To: <JH0SPRMB0074821E0A55434A23B60E45F59E2@JH0SPRMB0074.apcprd06.prod.outlook.com>

--pQxb2iB7MuCcOiZL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 08:50:48AM +0000, Luo Liu (=E5=88=98=E7=BD=97) wrot=
e:
> HI Conor,=20
>=20
> 	Thank you very much for your reply and suggestions.
>=20
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Conor Dooley <conor@kernel.org>=20
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=
 2:55
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Luo Liu (=E5=88=98=E7=BD=97) <Luo.Liu@cixtec=
h.com>
> =E6=8A=84=E9=80=81: vkoul@kernel.org; neil.armstrong@linaro.org; mani@ker=
nel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Gary Yan=
g (=E6=9D=A8=E6=96=B0=E4=BC=9F) <gary.yang@cixtech.com>; Fugang Duan (=E6=
=AE=B5=E5=AF=8C=E5=88=9A) <fugang.duan@cixtech.com>; linux-phy@lists.infrad=
ead.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; =
cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; p.zabel@pengutronix.=
de; linux-kernel@vger.kernel.org; Wuyi Shen (=E6=B2=88=E6=AD=A6=E4=B9=89) <=
Wuyi.Shen@cixtech.com>; Eastlake Yang (=E6=9D=A8=E4=B8=9C=E8=99=8E) <EastLa=
ke.Yang@cixtech.com>
> =E4=B8=BB=E9=A2=98: Re: [PATCH v2 1/3] dt-bindings: phy: Add CIX Sky1 DP =
PHY
>=20
> On Mon, Oct 12, 2026 at 08:36:16PM +0800, Luo Liu wrote:
> > Document the dedicated DisplayPort PHY on CIX Sky1, including the=20
> > optional cix,external-dp board property for external connector swing.
> > Add a MAINTAINERS entry for the binding and driver.
> >=20
> > Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> > ---
> >  .../bindings/phy/cix,sky1-dp-phy.yaml         | 53 +++++++++++++++++++
> >  MAINTAINERS                                   |  8 +++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644=20
> > Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> >=20
> > diff --git=20
> > a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml=20
> > b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> > new file mode 100644
> > index 000000000000..c6914cab74e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CIX Sky1 DisplayPort PHY
> > +
> > +maintainers:
> > +  - Luo Liu <Luo.Liu@cixtech.com>
> > +
> > +description:
> > +  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
> > +  dedicated DisplayPort instance on CIX Sky1.
> > +
> > +properties:
> > +  compatible:
> > +    const: cix,sky1-dp-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: PHY hardware reset
> > +
> > +  cix,external-dp:
> > +    type: boolean
> > +    description:
> > +      Use voltage swing values suitable for an external DisplayPort
> > +      connector instead of the default low-voltage values.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#phy-cells"
> > +  - resets
>=20
> A reset but no clocks? That's a bit hard to believe.
>=20
> Seems fine otherwise, unless I am missing some sort of common property fo=
r the voltage swing stuff.
>=20
> Thanks,
> Conor.
>=20
>=20
> 1=EF=BC=8CRegarding the missing clocks property:=20
>=20
> 	The PHY APB clock is physically the same clock as the DPTx controller AP=
B clock. It is described and=20
>=20
> managed only by the DPTx controller driver, so the PHY node does not list=
 a separate clocks property.
>=20
> The PHY driver only implements the standard PHY callbacks. It does not to=
uch the hardware in probe;=20
>=20
> All PHY programming happens later, when the DPTx driver actively calls ph=
y_init() / phy_power_on() / phy_configure()=20
>=20
> and similar interfaces.=20
>=20
> 	By that time the shared APB clock is already under DPTx control.
>=20
> So from this binding's point of view there are no clocks to describe =E2=
=80=94 only the reset line owned by the PHY node.

This sounds wrong, if the PHY uses this clock then the "DPTx" (no idea
what that actually is) it should also have this clock as an input.

pw-bot: changes-requested

>=20
>=20
> 2=EF=BC=8COn the voltage swing property: there is no suitable common DT p=
roperty for this.
>=20
> 	The flag only selects which vendor calibration table to use for the same=
 PHY IP =E2=80=94 the DisplayPort swing/EQ table=20
>=20
> versus the eDP table.=20
>=20
> 	Runtime swing/pre-emphasis levels still come from phy_configure_opts_dp =
as usual.
>=20
> The old name cix,external-dp was misleading. I will rename it to cix,edp =
(present =3D> eDP table, absent =3D> DP table)

I dunno, I think "external" is clearer than "e", since eDP is also used
for embedded displayport?

Thanks,
Conor.

--pQxb2iB7MuCcOiZL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5ZkgAKCRB4tDGHoIJi
0jyPAQDRmqHdCBu+JEY6WYgMJc70ELue4zQ5RLYDWcTc2EDf6AEA8BKvY64jcv/u
g0LbGUnfGhL/p52BclTRXUFOId1YRgo=
=gF/s
-----END PGP SIGNATURE-----

--pQxb2iB7MuCcOiZL--
