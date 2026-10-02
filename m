Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867A399D00
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944327; cv=none; b=a/D38cdaSQG5bInitseUKRWA2HTFHv/ub5VG0XuMWcqRundAVDg9sO/pudis4SeYcgmZ6F/uhgezNBwOYcELf+ovP1q6pRI0Mq8/lpyHnkNBmWkNuZCpdQ63Wacqh5AgGBtaAsIGqtc57zSB32C8uC4LJzWttL3eBpQogxLvkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944327; c=relaxed/simple;
	bh=2MGQRDDAI1k577IOX9WUkBgVhKyIN2RmBau/i8I5FO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tNr9g4VOcDBYahN1xPoToReW0TymkjhDzbtpKlw4FbK3WI5aFpXgWtPYHpTYty7KMaB0yx0bHO/xHPnEIVzaWDDBdOSgnAcLmeFTuTb4ucawzIxHe4uufrAW/QsOkwLvsE4zWYamZ40oHhHWf1t5mAs+EIkldlyLzjelrDyndeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXf51IBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXf51IBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1791F00898;
	Fri,  2 Oct 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944325;
	bh=ZHC2G7Dqj4RURbiI1DmU8aCMw9IuodpVw5CWt6N1StU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXf51IByO6TJ4sixU60Qd8VoJH42RU6CgKrQNGOo4lJJmM13swdOxawDL8fT/arLw
	 DbokJ95rQ/pK7BE+94dUmed08L4vceILPAg1XH+ZZZxgYxBK/RJZWznucPMoy4Y/tQ
	 +eWg3yReUVSKzd1lAu8EYEtucKR+oZPiV3xEWX3Sp/eIzMsb3viZ7/KVJDUH6l5BHQ
	 DNxwH0OUmQcdxSB2MsVtbU7Ax4GfCDI0Sdn3JDKo9QWiHb1Sh+BKAyr0Cmim58jz5o
	 RDSIKhikGoE6BNc7jS/F6viZMByN1PP2cGsehGpgjpW48UIUdDkYHPa4UdQGYMSo9d
	 1sitZWByln8gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/15] mtd: spi-nor: winbond: Add support for
 W35T51NW-C/E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-13-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-13-a22a2f95c26e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:32:04 +0000
Message-Id: <20261002123205.0A1791F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: uninitialized memory read in write_sr1_and_sr2_and_c=
heck_careful()
--

commit db0463242c1b895f1a8729e983049e5010571c6d
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: winbond: Add support for W35T51NW-C/E

This commit adds support for the Winbond W35T51NW-C/E SPI-NOR flash
devices. It defines their JEDEC ID and configures features like block
protection and locking by setting SPI_NOR_HAS_LOCK and related flags.

> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 05a80af3a6b93..0e350dcfbb755 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
[ ... ]
> @@ -633,6 +633,11 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x5b, 0x19),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP,
> +	}, {
> +		/* W35T51NW-C/E */
> +		.id =3D SNOR_ID(0xef, 0x5b, 0x1a),
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
> +			 SPI_NOR_4BIT_BP,

[Severity: High]
Does enabling SPI_NOR_HAS_LOCK on this chip lead to an uninitialized memory
read and random failures during lock/unlock operations?

Since W35T chips disable reading SR2 via winbond_w35txxnw_nor_late_init()
by setting nor->params->opcodes.read_sr2 =3D 0, lock operations eventually =
reach
spi_nor_write_sr1_and_sr2_and_check_careful() with an uninitialized buffer:

drivers/mtd/spi-nor/swp.c:spi_nor_write_sr1_and_sr2_and_check_careful() {
	u8 tmp[2];
	int ret;
	...
	ret =3D spi_nor_read_sr1_and_sr2_careful(nor, tmp);
	if (ret)
		return ret;

	if (sr[0] !=3D tmp[0] || sr[1] !=3D tmp[1])
		return -EIO;
}

Because read_sr2 is 0, spi_nor_read_sr2_careful() safely returns 0 but leav=
es
tmp[1] completely uninitialized.

When the code unconditionally evaluates if (sr[1] !=3D tmp[1]), tmp[1] cont=
ains
stack garbage, which will randomly not match sr[1]. Can this cause spurious
-EIO failures for lock and unlock functionality on these chips?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-winbond-ma=
ster-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com?part=3D13
