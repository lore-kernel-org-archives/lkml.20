Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7B469854
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128399; cv=none; b=WgTvlnvKaz7udnukGv5vYqbHuMeFpoVjbedZ1l8gyP/jcI9CjoJ4z6KLESmq2MM71HaqK1WOwrazlOU7o/YANO6ZWTOyCV1BE8CTAlu3qKg5CWB+WaCH2N9z49LBOs+qeGqdREK5Cr6SD31mb9nkmiHEXETgSwtBKjptXizsIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128399; c=relaxed/simple;
	bh=LLtLW6hP1c87wGBe9gp0xI+RzZhPk/kHeqWQrBfV6TI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=htY5TXtALePCBpmRW35hmtywQ3BTu5u4AzeylxuM28APfAh1OLxVL64HjbvIoA/HCeWRbHndTt/Ff9hPxB/UbBQZsDQFPStkggVSjQjyIZZZYI6ODJlYSSQLmiW3ACefVC/3oLxvWjYbpLovg+djaszNRqiBrruAI2WY+hRl55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXa2ZxrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXa2ZxrU"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 35B3A1F000FF;
	Fri, 11 Sep 2026 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128397;
	bh=rQk8H8XNPNF9GDtCSo4fzrpYj34vcGV2wYZRP68vo0w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=nXa2ZxrURe2DgvwTpfN+X/GKtfXRFe7Fu7Kk50+CERIlAW9M39fSFdcrvLN/6g5Vd
	 24jHMUJ33/29ECU6QBcIqGeXRR9Mpnvp9jzde7cv2A0RDW0QiwbMZJcUZ0nabhEY3y
	 uQOvcCGZeJM59CuWxxpumxV4JnZwp382riciCV0X1w/3sABUlCzEHNSOnHZSJT/uVt
	 LUu6UL277yV6evM+kf0g+znBCfdmwi67+W27rupNVwsjuzejH2GNlWAkiCnIBqtVNm
	 B1VnuewKaQodbheWwTmLuSonq9yKdyifAgQtqSsdIDyvotasKGqRN8CSC6fakkwxsD
	 MaSrhVTu+eSAg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 14:06:33 +0200
Message-Id: <DLCH314FE40X.3R6WPHTKXK5AG@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <79b104a2-a76d-415b-b98c-6833d8cd298f@nvidia.com>
In-Reply-To: <79b104a2-a76d-415b-b98c-6833d8cd298f@nvidia.com>

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 12:33 PM CEST, Jon Hunter wrote:
>
> On 11/09/2026 09:55, Miquel Raynal wrote:
>> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
>> means they do not have an SR2 to read from/write to. The new generic QE
>> helper was supposed to accommodate this situation but in the last versio=
n
>> that got merged, parts of that specific handling has been moved to a
>> more contained location, swp.c (which needed most of the extra code),
>> yet the Macronix case has been forgotten about in that generic QE
>> handling helper. Booting with such flashes will always fail probing.
>>=20
>> Fix the situation by making sure we do not attempt to read SR2 if the QE
>> bit is in SR1.
>>=20
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.144516250=
37676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
>> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status su=
pport")
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>   drivers/mtd/spi-nor/core.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index e2b6efafdd8d..ac909dfb9657 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_n=
or *nor)
>>   	if (!qe_mask[0] && !qe_mask[1])
>>   		return 0;
>>  =20
>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>> +	if (qe_mask[0])
>> +		ret =3D spi_nor_read_sr1(nor, sr);
>> +	else
>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>   	if (ret)
>>   		return ret;
>
> I know that there is still some discussion going on about this
> patch, but FWIW this does fix the issue I was seeing.

Thanks, could you give the new version [1] a quick test and a
Tested-by tag?

-michael

[1] https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c32=
4e9f30e@bootlin.com/

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPuyRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ge0gF/T98FSz+QIb/WQ95yaiw93I/691kqZ5KV
KswMGkEoxMY7zdQhXA5vDmLpWY4c4t8gAYCArU+ldBxMbP+gp5JuR+iZ+rf6KnCe
Lhg2SkRjC/Xm+CLHS82gLP6sGdhsqNfBuMA=
=b+wG
-----END PGP SIGNATURE-----

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57--
