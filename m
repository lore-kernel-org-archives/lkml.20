Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F546C4B3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117476; cv=none; b=ulwnSFbzlqq/UocI2mWbODXDfG/CTnvOahKMwU2h5nbypaemjX2cWTXrkjvzy6xZEfX9Kby2F9BVdUeP3vaTkgP2AXxCWbuBwKjqpTFcjwjl7iBxaBn1Cl093VRSz7zt2s3eTmWPAoGs/WFseFlelbhrvU/XxR4p6myrwjQbtrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117476; c=relaxed/simple;
	bh=DNoOp7/clztJLzkhXfGP7dsKnU3KBGk4VvezhWWNEXs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=nhq7KDv6BWbBmP2LdVuhOEjX9D8KA0OLiM/2eoiPZ6eVj/Y48T7sjAlWyZP9e+LnK9LVdzYBgaUCXPSO7UvK/+5n8alUnweuNPRofIVgzxA2BZ8m3pyO+eZppboMmu2YLzynhzVOCzuBsWW3Jwgt4rB7rEuUoW7UzrsBgbIE6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON8unehk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON8unehk"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 83E9B1F000FF;
	Fri, 11 Sep 2026 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117475;
	bh=7JlIneF+Aa5Fd5sLqEGclf6Gn+1k3hyJj/xN5+NfGIU=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=ON8unehkxMbl8hUzsRRW6Oi0xftSeUBy/1gKfDj5YyVbh6CBJmZYAMhzNBoz2ZBsd
	 bEQiZePmAmLx+JFaaCY0KdNUwFTMn1Vt8nxRdnVKi6I6xEvLSW6IPYqLMXRIrmH8GH
	 tPe0wrbWwg/UtSDetHjKr5vtuQsLRO9eQCNVd87148RxSJYMQNxWeh/XIa50RgsSDX
	 sRrG4IRg3+7vr6lSE0ElYs2Z4dNPmdv/6t6vcHiiBJ/91efSENZVwkFOCdiq0cQ/m1
	 e8b6NLiGChkDsn+RRt08Cul7NkYoIKqBJ5N+EO3YiX4kdBi5RRgVSfYxGdtMur+3st
	 KakB4Qno7jXdA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 11:04:31 +0200
Message-Id: <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Jon Hunter"
 <jonathanh@nvidia.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 10:55 AM CEST, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
>
> Fix the situation by making sure we do not attempt to read SR2 if the QE
> bit is in SR1.
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.1445162503=
7676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status sup=
port")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d..ac909dfb9657 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_no=
r *nor)
>  	if (!qe_mask[0] && !qe_mask[1])
>  		return 0;
> =20
> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
> +	if (qe_mask[0])
> +		ret =3D spi_nor_read_sr1(nor, sr);
> +	else
> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);

Shouldn't that be the other way around?

+	if (qe_mask[1])
+		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
+	else
+		ret =3D spi_nor_read_sr1(nor, sr);

I know qe_mask won't be spread across two SRs. Just to be
correct and make it easier to grok.

-michael

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPEHxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jolwF/alhIN5hGOwBv+D0Xlr76orhmahxlL5O3
7dCJ1w4daF42qHsdouevHxRJvizdCpauAX49wTeAp088AC1HLRGNGsGFiQe2Oblv
WtEU95UDTAtgrl+UWzqJNUdZKIiS1DCpKmE=
=phm2
-----END PGP SIGNATURE-----

--5547c09f0e843a1932eaeed78f9af3fc67fcc0e543a7f179a5bf860cb855--
