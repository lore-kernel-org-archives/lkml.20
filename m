Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC526656D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913721; cv=none; b=p5qy4X0rmiUwQ2kBEefUskw8Uk3GjkFOAw1IGiAw8rY/mtTW+No8EQ3ItCbqKdlJXkYUFhcUYfEUBmAYZ/AoyLJvEh808I7E5b3hKM09ipQ2+Ktr7hoQrkReKU/veeRd5mtMTNZjOuaBFsuVpolZOfxxARx+AG9DYHzTD9Z4UFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913721; c=relaxed/simple;
	bh=w6oVNXUWp5wNL2g61flzeVZH3nIHeF0IGkmsF6z87OU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L0/ljKkM4A24+Bk4VUNiGzLo7KrEqqqDZsENkp3gVtfWLu81Ugzb9/pElGTf2zgPiHmfNiep/jQzKid5vDcnXlUjuSAZhB3G5KCvt6x8+6gXbLyWWCNR9slcDcqomFbzsKYffTqx9ukPt63cavRPTYOt+tlRaC+tdvj8zjrl1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exHKC9Cv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exHKC9Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0AD1F00893;
	Sun, 20 Sep 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789913717;
	bh=ReGGZzAYsZltabeSMuN4ZGudrxIWtzp842ALLhTAZPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exHKC9CvcY0ze0A9bjUCK5R3j1ln4DTMDPHz7+yIzuj+VADq9iw0MMjF0bDdXCJcW
	 dQa19jmiUQFGT+lxfcGqbI7KoaEYydqOcFQZyzVK+Nr9yFY+LY5yiHtaoBIeEmokkg
	 eRJ/Xt8enpORxbynJmIgj06NC/o+wMUgZ17s8mZscUrNUAy5aFfakWfz9ihYsb37yG
	 AKwklQWa3gZFsyVPd2iBZiasX9PkFCxnhz8n1tvqOsy+IuknZJieMTzvaE3oh/VvgR
	 yl3QlZEkx2Mo+zSULuZQmEDZuLxJO3ZNmiex9m71vxZpDLCbaivJ0zS6Y7GkQpPmxg
	 QqtcrHwrcI5jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-M
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Steam Lin" <STLin2@winbond.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-22-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
 <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-22-ab9c9688d071@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 14:15:16 +0000
Message-Id: <20260920141517.2A0AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: winbond: W25Q33PW-M inline ECC incorrectly disabled =
by density check
--

commit a82dcd60aac8f24c79cf246f21c0a7afd4ac0ae0
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: winbond: Add support for W25Q33PW-M

There is an ID collision with chips of same density from the JW family
(which it self conflicted with yet another family). Chips are very
similar in practice, it is mostly a matter of electrical differences
(mostly power consumption being lower) as well as the addition of inline
ECC capability.

> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index c1792b12db630..c56bb01c197b2 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -467,7 +467,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.size =3D SZ_64M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
> -		/* W25Q32JW-M */
> +		/* W25Q32JW-M, W25Q33PW-M */
>  		.id =3D SNOR_ID(0xef, 0x80, 0x16),
>  		.name =3D "w25q32jwm",

[Severity: High]
The commit message states that the W25Q33PW-M chip supports inline ECC, but
does this newly added chip actually get its ECC configuration applied?

Looking at winbond_pw_with_ecc_match() in drivers/mtd/spi-nor/winbond.c:

static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
{
	...
	/* W25QxxPW densities <=3D 32 Mbit (id[2] <=3D 0x16) do not have built-in =
ECC support */
	return id->len =3D=3D 3 && id->bytes[2] >=3D 0x17;
}

Since the W25Q33PW-M has an ID of 0xef, 0x80, 0x16, the density byte is 0x1=
6.
This causes winbond_pw_with_ecc_match() to unconditionally evaluate to fals=
e,
preventing the winbond_nor_ecc_configuration_post_sfdp_fixups from being
applied.

As a result, SNOR_F_ECC is never set and writesize remains 1 instead of 16.
Will this cause writes to be unaligned to the chip's 16-byte chunks, which
according to the commit message disables ECC locally until the next erase?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-winbond-ma=
ster-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com?part=3D22
