Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0F3B14D6;
	Fri, 25 Sep 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355091; cv=none; b=N5LtX11HH76KgeMEKbLbcOK7wOc/Or8j6zukJzktohHU4y7NpD8iAM9wSqw4MMzA90Evk/JWc2yNYtWjIJ/rLRsXmdk2TnDrentqN9r5QxX8wZ2RQzftiwAWOaGJPy+ilHOMg6lZUWiesOi+zBVZH4bsVeZrCs9uj+PWHfL+AsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355091; c=relaxed/simple;
	bh=Z3fUZTE3iejd1JSQJvpyR4fIcnwo5FtiwrpLJ4h08/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFoZ8bTuYJ61kcijzNiSNKvR/EMiZUyWrGhEqorc2ylWcZE+/NHdH/gzM89x2ogNcHPAWhuJXCyjzEznacrr6SgXkwTmFSF8duckKwV8cQrDM8Z340hUpB6o42SanUt7InhYexINpGmdCp4gR+QaZ2xsCWxi2DZj9Eh3OKayCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff4ROM4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff4ROM4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F3F1F00893;
	Fri, 25 Sep 2026 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355082;
	bh=uTN2gUGLfjEmLI+kfBb4qKSBquVXwsBhaTfbpY2NRrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ff4ROM4KRn94F3daBy8gUc+QsXb8btPOPmOKC3Kv/YBuIY+QMg624xqfPAFN3I33m
	 t6SIDlDUtS2ifLCzs4Pi9sCZ03jW1xYlboCpY+JFD7BkO7P9At90Alwz3kQFDla8GL
	 JmN/1pvjr9C4zEqapYWo5EvdFYdNuBC7LREsNebx3fD/NFAQZ+PZjOB8lH2d2kmc4x
	 BhBbYyxRSXazwrYJ2ycjkxDVxR9w2cwGvK8OU5JNb/cPY87FDgxsmsnSWG+PK1IKuz
	 WHO4RJ1IWJ2FNakGrl34eJUYtq2UOa3xiswvAbGEbazt9+0GmcePAmkaSeW5KWDFFP
	 EjW22VqTYhlHg==
Date: Fri, 25 Sep 2026 17:51:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	p.zabel@pengutronix.de, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260925-generous-overbill-e5fa75aec1e7@spud>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
 <20260924-compare-useable-3e2863b66924@spud>
 <518ec010db104f6f0e7c85607a97af408da44eed.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mC0ZFJQ+JqSh31eF"
Content-Disposition: inline
In-Reply-To: <518ec010db104f6f0e7c85607a97af408da44eed.camel@collabora.com>

--mC0ZFJQ+JqSh31eF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 01:51:13PM -0400, Nicolas Dufresne wrote:
> Hi Conor,
>=20
> Le jeudi 24 septembre 2026 =E0 17:55 +0100, Conor Dooley a =E9crit=A0:
> > On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> > > nxp,imx8mq-vpu has been tagged has deprecated since a while.
> > > After driver clean up it is time to remove it.
> >=20
> > No users in linux doesn't mean no users, but I am guessing that there's
> > genuinely no users elsewhere and anyone using out of tree devicetrees
> > should have updated due to the warning at runtime?
>=20
> I've checked the vendor DT before they moved to the mainline driver, and =
they
> never used this binding (actually they never made bindings).=20
> Here's what the DT was:
>=20
> 		vpu: vpu@38300000 {
> 			compatible =3D "nxp,imx8mq-hantro";
> 			reg =3D <0x38300000 0x200000>;
> 			reg-names =3D "regs_hantro";
> 			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 8 IRQ_TYPE_LE=
VEL_HIGH>;
> 			interrupt-names =3D "irq_hantro_g1", "irq_hantro_g2";
> 			clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>, <&clk IMX8MQ_CLK_VPU_G2_ROOT=
>, <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> 			clock-names =3D "clk_hantro_g1", "clk_hantro_g2", "clk_hantro_bus";
> 			assigned-clocks =3D <&clk IMX8MQ_CLK_VPU_G1>, <&clk IMX8MQ_CLK_VPU_G2>=
, <&clk IMX8MQ_CLK_VPU_BUS>;
> 			assigned-clock-parents =3D <&clk IMX8MQ_VPU_PLL_OUT>, <&clk IMX8MQ_VPU=
_PLL_OUT>, <&clk IMX8MQ_SYS1_PLL_800M>;
> 			assigned-clock-rates =3D <600000000>, <600000000>, <800000000>;
> 			power-domains =3D <&pgc_vpu>;
> 			status =3D "disabled";
> 		};
>=20
> I've not aware of any other OS or booloader that offers media capabilitie=
s using
> Linux mainline DT. The now deprecated nxp,imx8mq-vpu compatible had a sho=
rt live
> in the Linux tree if my memory is correct. Hope this is enough justificat=
ion.

Yeah, and this kind of detail (plus the fact that the driver emitted a
warning) are very helpful in the commit message for patches like this.
Hint hint Benjamin!

--mC0ZFJQ+JqSh31eF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramhQAKCRB4tDGHoIJi
0vuwAP97l8f+kng/LRWQUycXlp59bH1E1WLY6HcLhXhNVw5eZQD+M4FadnRs+7cb
V/japjgTQ7Y+cGI9P1+T2PE+6OiOpgA=
=dwjl
-----END PGP SIGNATURE-----

--mC0ZFJQ+JqSh31eF--
