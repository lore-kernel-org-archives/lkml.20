Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850B3E0C7A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120819; cv=none; b=pACh6BxuKOMrziY7oJdp5dgsOxD9MUiGocYVM7bvjTT2CJq9Oev7aasGuxoE+hYdGACaGL0uXYVJMZU1UIbFfMtwqnMahu86YFbRr8syfaJYuTAka5LhHGhlxu1BZAjiUMdMoXadk9eShYCtAYLwPW2e1COT0Fcgk/TV9mCAzEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120819; c=relaxed/simple;
	bh=FkPRZ9RiIxyrCzUjNcvLl26+fmDIGRF3rJH/Qfi6Q40=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=FINguJSLfA3RUc5tOAa6H3PWz7FJiDbhZP58HisKw4fmhV/b05UL8EnXbVtcZ40fjcSmBjj5mDMNLIhLN5MCi2F+5oo/9n2jZmol3gou1DZhBEnjBcQqgXpZbkgHwGOeZ4yXfvU7XMN078QsdxsOOmaSs1OlGQ3/xGfdhCcpxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRuUZf5C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRuUZf5C"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 500A71F000FF;
	Fri, 11 Sep 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120817;
	bh=yvZ8dPhqGtyqFlpdNYVTdyZOJ9BDsEyogEtTmfqIXWc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=gRuUZf5CAAkJtUt3NQVwF2rXGWEnMFFUob1UpAyPa4ij1oOsU1XZg9TYMM5ZUckYR
	 u8IPVHVXMMdDIyrEYCPgifgqoZX3azdcfzByB8Ozi/ORgvA8+m59kKEMb9XQOd84n4
	 BToJE5aGlY7VAUkoxF4vrVXkCXNb4kFMmhF4LFaIZCroBnEPdGEhju8NQYY/lrD0TR
	 KBtiSfGcXPRUBg6/cAnHZVtoFBpUwNqAAYutJkNi0AQFYvQesACZcmrmB9SFubTtnk
	 GZgPKuL65YpUF2pFkrGVX9JcI4hF02Yo3IA1ul8bUghmca2JGF5jP4iPmKoT9ZBHav
	 Vxt4kGyKI7zAg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 12:00:08 +0200
Message-Id: <DLCEE908FEIF.380PG73T1SQXV@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Jon Hunter" <jonathanh@nvidia.com>, "Steam
 Lin" <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com> <87ik4cqgha.fsf@bootlin.com>
In-Reply-To: <87ik4cqgha.fsf@bootlin.com>

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 11:34 AM CEST, Miquel Raynal wrote:
> On 11/09/2026 at 11:19:39 +02, Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:
>
>>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>> +	if (qe_mask[0])
>>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>> +	else
>>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>
>>> Shouldn't that be the other way around?
>>>
>>> +	if (qe_mask[1])
>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>> +	else
>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>
>>> I know qe_mask won't be spread across two SRs. Just to be
>>> correct and make it easier to grok.
>>
>> Why is the second version easier to parse? First version is maybe more
>> future proof since we are treating a specific case. Because either it is
>> a specific chip (Mxic) or we end up in the more common case. There is
>> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
>> that in the future we will mostly see new chips only using a qe_mask[1]
>> mask. So having this in the else doesn't sound so strange to me? I also
>> don't think we will ever see masks spanning the two registers.
>
> The problem still persists because there is the check which also fails
> reading SR2.

I don't get it. Why would you read SR2 if bit6 is set in qe_mask[0]?
Or do you mean in the spi_nor_write_sr1_and_sr2_and_check(). Yeah
that should also probably only write SR1 if qe_mask[1] =3D=3D 0, no?

> Michael, we moved to swp.c that handling, introducing a "careful"
> revision, was this actually relevant?

Yes, because I eventually want to get rid of that sr2 QE bit
guessing. I really can't imagine that this is necessary.

> the lack of SR2 read back into the main core like before?
>
> Possible steps forward:
> 1- Add extra logic in the "and_check" helper, kind of duplicating what
>    is in the swp.c file (not my favourite)
> 2- Move the "careful" handling (which does not return errors when a
>    register read is absent) back from swp.c into core.c.
>
> What do you prefer?

3- make the generic_quad_enable differentiate between "qe bit is in
SR1" or "qe bit is in SR2". If it's in SR1, just use
spi_nor_{read,write}_sr1. if it's in SR2, keep the current handling.

Do I miss something?

-michael

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPRKRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hM2wGA8L5BzBBDrm4P0kYjQ9rJiyR0ih4hK7e7
z6rp9lniW5kHwuNp6AN+Po3XiV9FtJi4AX4vrAdvX9IwSvnJ4IyLJ1nIB1X5g0hi
C0OeK2aLyL3u4i3GmlW2pMd9xuHJhEmRbow=
=rTO+
-----END PGP SIGNATURE-----

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357--
