Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589963;
	b=b1t90XNlSWMED6s6t6wLsLsvJf7zXe9VRxZcSTHtzTJEIo+QoZ9+4Co0HfHDjj6enxXM
	 b8wd/7U2WQ/aUaGrnLutLWP2st8fiiwWt75BZbUhbCa9RuzYUtp6Z2fsD808jOmBJa99H
	 G6WvAjNdlvfcJGQX189I0q6r3q4Ie1obhHjdtE/8do2HGTn0/KFWkCe6YsmgmnA5Spcp1
	 iJkqb0fc9as3cxDWmuhweuInRDomMVP4OykhcnSfIZeyk5IpfQIPSuj0vze9Mf+ezl/L9
	 /mHOMShvPOlgk6NokZmlN3cHelGyalVoDRtzpf35R9j1PN1ITmjIk9ztthRa5pz/ozA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TOb078lsago8a0KkxFs3YjV+tnlupXKQCizlFrbKWzk=;
	b=BYjIB3AgmSokg0hzuI20UhO5TCHA7rfljb081m0x3mpLScwo8r3vxmmOQgXmA85Jy+KX
	 gkQWqVpEK99mCvNarE6Zt4G8sAzYGUxIz3bK4ijDIxyeRLzPXkDnn4SfDQfILs/qCyfZq
	 IUMsTvIf4giEwG+l9aPVZuW7tx83v5BT6qoo3vUvcuwSymhcE1hkQXES0l1kt7f3Hnmkw
	 uCWMJWNz0BqMUHY/z5/92DUYr/0mhReVW0zsBLYrM/PJK1HXtwqzycaBLZV5r09B9Xkaa
	 gOOhQeeom8DdLuF+FHyFMO+kotEe5G5a5d3BK/W9KIwZtiAjP7+HHHCQdFiaOtiMErw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WEeci/xn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19296606A331;
	Fri, 13 Nov 2026 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEeci/xn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B4D1F000C8;
	Fri, 13 Nov 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589962;
	bh=TOb078lsago8a0KkxFs3YjV+tnlupXKQCizlFrbKWzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WEeci/xnaiuQGQByLuyrzwe58dxVS1MuSoI1GwT0W8JZy2Z2u9ty4Xwp5s+xxr0ET
	 X+m11IqFqy5T35F3VBzZsjS3YfAgAqRlPAzedW4Tbof64A/ANcNSD9IN44f/n3/1Q0
	 GTLzs2X2QcU+igqs+quFcVecM/mjKlLKr6ZR+WGdylsrkkEzICz61hWSxSDs6hu8SK
	 ICnyfXMkPPeiTPDF19gWYYp6ho+qJ1OxIt65CXweXmDLVItdmc/XV5v/VLwbPRgbg8
	 gq47i5xyEhq6K1y0Imhb2rBpZR6cFGBDJwGSvKj+X3SmLsQckO53yMvzDEBggDYIE5
	 /ROeRdUH2BllQ==
Date: Fri, 13 Nov 2026 17:12:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
Message-ID: <20261113-crafty-quilt-2a9b9d3b0754@spud>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
 <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gH/mmR2uiZkdhUOA"
Content-Disposition: inline
In-Reply-To: <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>

--gH/mmR2uiZkdhUOA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:10:39PM +0100, Patrick Delaunay wrote:
> These bindings will be used for the SCMI voltage domain.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

I don't believe these are bindings at all. Where is your software that
is using it?
They're no more bindings that interrupt numbers are, since they're
defined by the firmware, rather than what binding headers are normally
for: inventing meaning for numbers so that we can have an ABI.
These numbers arent even fixed, changing the firmware can change what
regulator these IDs represent, although anyone who would do that should
probably be taken around back.

IMO, if you want these definitions for your dts, move the header to the
dts directory.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>=20
>  .../regulator/st,stm32mp21-regulator.h        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/regulator/st,stm32mp21-regulator.h
>=20
> diff --git a/include/dt-bindings/regulator/st,stm32mp21-regulator.h b/inc=
lude/dt-bindings/regulator/st,stm32mp21-regulator.h
> new file mode 100644
> index 000000000000..fcafcfb6dc54
> --- /dev/null
> +++ b/include/dt-bindings/regulator/st,stm32mp21-regulator.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
> +#define __DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H
> +
> +/* SCMI voltage domains identifiers */
> +
> +/* SOC Internal regulators */
> +#define VOLTD_SCMI_VDDIO1		0
> +#define VOLTD_SCMI_VDDIO2		1
> +#define VOLTD_SCMI_VDDIO3		2
> +#define VOLTD_SCMI_ADC			3
> +#define VOLTD_SCMI_VREFBUF		4
> +
> +/* STPMIC regulators (STPMIC25/STM32MP2L/STPMIC1L) */
> +#define VOLTD_SCMI_STPMIC_BUCK1		5
> +#define VOLTD_SCMI_STPMIC_BUCK2		6
> +#define VOLTD_SCMI_STPMIC_BUCK3		7
> +#define VOLTD_SCMI_STPMIC_BUCK4		8
> +#define VOLTD_SCMI_STPMIC_BUCK5		9
> +#define VOLTD_SCMI_STPMIC_BUCK6		10
> +#define VOLTD_SCMI_STPMIC_BUCK7		11
> +#define VOLTD_SCMI_STPMIC_LDO1		12
> +#define VOLTD_SCMI_STPMIC_LDO2		13
> +#define VOLTD_SCMI_STPMIC_LDO3		14
> +#define VOLTD_SCMI_STPMIC_LDO4		15
> +#define VOLTD_SCMI_STPMIC_LDO5		16
> +#define VOLTD_SCMI_STPMIC_LDO6		17
> +#define VOLTD_SCMI_STPMIC_LDO7		18
> +#define VOLTD_SCMI_STPMIC_LDO8		19
> +#define VOLTD_SCMI_STPMIC_REFDDR	20
> +#define VOLTD_SCMI_STPMIC_GPO1		21
> +#define VOLTD_SCMI_STPMIC_GPO2		22
> +#define VOLTD_SCMI_STPMIC_GPO3		23
> +#define VOLTD_SCMI_STPMIC_GPO4		24
> +#define VOLTD_SCMI_STPMIC_GPO5		25
> +
> +/* External regulators */
> +#define VOLTD_SCMI_REGU0		26
> +#define VOLTD_SCMI_REGU1		27
> +#define VOLTD_SCMI_REGU2		28
> +#define VOLTD_SCMI_REGU3		29
> +#define VOLTD_SCMI_REGU4		30
> +
> +#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP21_REGULATOR_H */
> --=20
> 2.43.0
>=20

--gH/mmR2uiZkdhUOA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdFBgAKCRB4tDGHoIJi
0o0zAQD/HtnpN/mSs+nWUOkbzquwYOk2tL/upMS4luxmfuwosQEA+GeFByT7n+/b
u4Ur3KYnuJMGSdV9lRadXirqfBgwJAs=
=kOMh
-----END PGP SIGNATURE-----

--gH/mmR2uiZkdhUOA--
