Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097234B2057;
	Thu, 24 Sep 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272281; cv=none; b=PKLlF+6LkdBNH8FtkthKTp1CuRL7W77xEw/Mlf7sRca1oJ8J+GHq1c+kpQwHrI0RCSACRqbx/Kim2hut+mW3e4WDWqQaK6ZOHxZZIbupu4tvZg/6yPQHA8wp0/BSQtNFLsVylIWj6JmK1W/gCyjgN/MWfXQIeRKthRmNRhioGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272281; c=relaxed/simple;
	bh=E5sOGZv4PsnQ9lebGLSxJFxuo51klyzvMHE8CDz7Q9Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j2dZwIdI3M58T4gu37EJM7/wGMPYQpkPDZGVxVyAOfPIHi0mjEWekzhAW48MzXu3R7SplpZrsstcTDfOVIidoZsF0wJs/z7R7AjmSHOBMB+QKwUHQfZrstKFd0cqSU+XYUh0zuP2LlHW2LD37L20ctkev8q3a9buXC+eXq7Ypio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kE0AuB1U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kE0AuB1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790272277;
	bh=E5sOGZv4PsnQ9lebGLSxJFxuo51klyzvMHE8CDz7Q9Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kE0AuB1UulmjZhIOgwAwnOV/ZisIZPnLZDoiyztMOMVPai48Y0BDuo/TRzky24oKV
	 BlU9BEI4mZqG1Zlw1mVvQIYMrua6m3+ZB4SMpqjomLxLwKxRnKZD1aJegtjVBwx6+z
	 CbIEHai48Yp7bNY3Wlw8r8I7ChBrePh90mWCOnUqe1hGHc0NEZpFj2u4M8Xuv35hKu
	 nV4vHYIOyCRKaJw/bW5OtsrBhJZSmMtHVTM+IQYaLzYHuLYpQNSOD16EHKVWFW4+fe
	 2Jm8pc6q3POOIqco4Mrd2T6Z8VABOLfb10GpZzShkUCYPUDWri0vL3v/ckrSFN85F8
	 XqipsgWgav70A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2567017E0082;
	Thu, 24 Sep 2026 19:51:15 +0200 (CEST)
Message-ID: <518ec010db104f6f0e7c85607a97af408da44eed.camel@collabora.com>
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 kernel@collabora.com
Date: Thu, 24 Sep 2026 13:51:13 -0400
In-Reply-To: <20260924-compare-useable-3e2863b66924@spud>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
	 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
	 <20260924-compare-useable-3e2863b66924@spud>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ufgeUgCb5bgTB+Z5csz7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ufgeUgCb5bgTB+Z5csz7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Le jeudi 24 septembre 2026 =C3=A0 17:55 +0100, Conor Dooley a =C3=A9crit=C2=
=A0:
> On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> > nxp,imx8mq-vpu has been tagged has deprecated since a while.
> > After driver clean up it is time to remove it.
>=20
> No users in linux doesn't mean no users, but I am guessing that there's
> genuinely no users elsewhere and anyone using out of tree devicetrees
> should have updated due to the warning at runtime?

I've checked the vendor DT before they moved to the mainline driver, and th=
ey
never used this binding (actually they never made bindings).=20
Here's what the DT was:

		vpu: vpu@38300000 {
			compatible =3D "nxp,imx8mq-hantro";
			reg =3D <0x38300000 0x200000>;
			reg-names =3D "regs_hantro";
			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 8 IRQ_TYPE_LEVE=
L_HIGH>;
			interrupt-names =3D "irq_hantro_g1", "irq_hantro_g2";
			clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>, <&clk IMX8MQ_CLK_VPU_G2_ROOT>,=
 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
			clock-names =3D "clk_hantro_g1", "clk_hantro_g2", "clk_hantro_bus";
			assigned-clocks =3D <&clk IMX8MQ_CLK_VPU_G1>, <&clk IMX8MQ_CLK_VPU_G2>, =
<&clk IMX8MQ_CLK_VPU_BUS>;
			assigned-clock-parents =3D <&clk IMX8MQ_VPU_PLL_OUT>, <&clk IMX8MQ_VPU_P=
LL_OUT>, <&clk IMX8MQ_SYS1_PLL_800M>;
			assigned-clock-rates =3D <600000000>, <600000000>, <800000000>;
			power-domains =3D <&pgc_vpu>;
			status =3D "disabled";
		};

I've not aware of any other OS or booloader that offers media capabilities =
using
Linux mainline DT. The now deprecated nxp,imx8mq-vpu compatible had a short=
 live
in the Linux tree if my memory is correct. Hope this is enough justificatio=
n.

regards,
Nicolas

>=20
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yam=
l b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > index 19528262810a..69619d2c86fa 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > @@ -14,12 +14,10 @@ description:
> > =20
> >  properties:
> >    compatible:
> > -    oneOf:
> > -      - const: nxp,imx8mq-vpu
> > -        deprecated: true
> > -      - const: nxp,imx8mq-vpu-g1
> > -      - const: nxp,imx8mq-vpu-g2
> > -      - const: nxp,imx8mm-vpu-g1
> > +    enum:
> > +      - nxp,imx8mq-vpu-g1
> > +      - nxp,imx8mq-vpu-g2
> > +      - nxp,imx8mm-vpu-g1
> > =20
> >    reg:
> >      maxItems: 1
> > --=20
> > 2.53.0
> >=20

--=-ufgeUgCb5bgTB+Z5csz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarVjEQAKCRDZQZRRKWBy
9C4tAQD1qA+Ux1mXqgQgjzQg11/HgxYGtNNRdQM1ljOMoDXTQgD+IP4kVkw14aJT
a6/hPh+9+Z/YwRaFTKestaGBrvZAkgI=
=UaxT
-----END PGP SIGNATURE-----

--=-ufgeUgCb5bgTB+Z5csz7--
