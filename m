Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010337E5D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119034; cv=none; b=Ih1MF7dyGcT9nQKQUczbVfOb9w7bCe4TsOIBGJN3N63w8C5CGao0IY80yejQlzc4HTJXFmGRz0CrkP0azcYdodYIqpGLtyruSBL9+ADAXTP1EFzwEzLTNZ62/tZ62jeiEBxthK2X+JosVbT8uNPEYQ2E1bp8ka/qQRnthWGgZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119034; c=relaxed/simple;
	bh=630poMWQzgcbZPW1krsIlacK+TXkVKw7zMWvcU5xltQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=fuNMp0AXkbC3sKl5gDFJVigizoEgAZmBvRP2VvIbAjmtsMvFgMuYq/0TrwLbShFPFJ8NJyZrtUAdFyC4Wdt1RV7mCozGs6AflbgIsLoZR29jKjFMexwv9Z/P4B/vnYcrhXiK+/yj5mQIkRpfx3p58MXu46JPvJnQbSvYV3AK1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duEllfOM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duEllfOM"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A95E1F000FF;
	Fri, 11 Sep 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119032;
	bh=rz4T8CBZwQqzwi0m3a2/ZBRyZSVhbKnDKVE9J0f6yUI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=duEllfOMN4cmFPg1neMONWzv1LcnzeFR7WrZN/h3FSFMD/HyxpfMQu5yYo5aZFI52
	 7uw1XxdsjXsRJBnmL2tYLjlGMNhCMaZ32yVAeKhkRRaULaiseLX/1aTD5visBZONoR
	 POjWrOF0btei7PIlweD/vHwE2Do6ohyrZkQOf0k0QQtblFpZZLDb+IYMAI1GtgxQ1Z
	 V8LIATKU3HK5pz136Mwa+0K3ethLUPXdCcxLRIcEl/6B+xRrSfOVGf2TBgO8wUIFPb
	 pFm1vk1z2nbp6VEITBcw1lDZHJ94Kq1hQ+uz43BrGOLzwpBLvg0bf9+R2LLTBKHma8
	 X95QHSARBoCIQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 11:30:29 +0200
Message-Id: <DLCDRJG22PDM.UPGN3KXWKND4@kernel.org>
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
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
In-Reply-To: <87o6e4qh5g.fsf@bootlin.com>

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 11:19 AM CEST, Miquel Raynal wrote:
>
>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>> +	if (qe_mask[0])
>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>> +	else
>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>
>> Shouldn't that be the other way around?
>>
>> +	if (qe_mask[1])
>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>> +	else
>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>
>> I know qe_mask won't be spread across two SRs. Just to be
>> correct and make it easier to grok.
>
> Why is the second version easier to parse? First version is maybe more
> future proof since we are treating a specific case. Because either it is
> a specific chip (Mxic) or we end up in the more common case. There is
> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
> that in the future we will mostly see new chips only using a qe_mask[1]
> mask. So having this in the else doesn't sound so strange to me? I also
> don't think we will ever see masks spanning the two registers.

Because for the first one you'll have to know that qe_mask wont span
two different registers, where with my proposal, you don't have to
have that knowledge, no?

If qe_mask[1] is used regardless of qe_mask[0], you know you have to
write sr2, otherwise you'd be skipping something.

With the former, qe_mask[1] might or might not be 0 and you could
end up in spi_nor_read_sr1().

What do you mean with future prove? In the end it's the very same
logic iff there will only be one bit set in qe_mask[] and
sizeof(qe_mask) =3D=3D 2.

-michael

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPKNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ib/wF+IbYzfExispJ6WUUDK1Tad18sAqKeIw8l
ViPZ6kqaJgPZ2jhyY3d+k/Jt/JFkNxqOAX9AqsfgLcNR8IzSZoya04+VPRlc1/Nc
On6SXRPYPLktuFU2LjKMo6mNJVALf/L+D0g=
=H6a2
-----END PGP SIGNATURE-----

--059ea684f812920f19099ef40d45683ff7173b765f8d76345088bce21655--
