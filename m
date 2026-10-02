Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FB46F483
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945143; cv=none; b=uEn/A4pdjsY86p8e9u2bEhl+Bud8Jmj5eBpZ4ut9ZXJlGHYMNFY6Ox6KQDZbgJoLbC5Iwcc9a9WlPb1L7Csx3mEibgU5Qzi600GmylPDqmAcsgvo5cRYzTQmy+9G6uGWTqHZ6H7CHmqjAcNVoMKMyHrlffqBdl7uz3PnRTEI3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945143; c=relaxed/simple;
	bh=RE8eRXCcdd6IL89jJFGqZThlhfyeVIPzFWTLDOZGVLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=crgbFtBLNg7YS96EwRNwc3btxgqWzv/iVvrXc8CgylzuwH37GGv6N7AeM7zDbMJVmE/syRBtH4PCon1477zg6DULhevUNtyKJjj7CKF+f9HAPR/KVrABbULbFOXDkZMACIwzf06H3nPayOsavDiO0JkzGimdKS55uQW7hosY9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLk02lqH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLk02lqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFB41F00893;
	Fri,  2 Oct 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945142;
	bh=xKTWeEYvEnq79Yxip4eR9Mt6akyZMfafUd0tpMec7X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bLk02lqHk6sLm/Y9/eL3x80KpG1VpyNYAA3SY/0XMGLKrqq/EvbsUSBRqZ71a1gAP
	 wOAsukhqRyamJGmYiW5kqlum2Awu52uz3BEQG8vc4OIl32A7pHL5IHRNKX5ibqWGCl
	 Z/vbdDVWzFlcwEvIg9gSejzjgmQk76ggul9PwyJrtg/+DudTaEyuUCJoPDF9JkG7DH
	 YfMDavAXO50DKNzh6g7xL0kjZHWHHIs9JGOiElFsb4d+S12itXfol4gKXn95udrnBR
	 uHnQ0slVIHTUiw4EU9Xshm3NKcBF4+JOIRfeNAxeFzu8kuc9rXzHuvBewKJa8s2hF7
	 T/qlfCpXyK0XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/15] mtd: spi-nor: winbond: Prepare the introduction
 of W35TxxNW parts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-9-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-9-a22a2f95c26e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:45:41 +0000
Message-Id: <20261002124541.7EFB41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: winbond: volatile dummy cycle config lost on resume
--

commit 61a4c1418798804759dbb5ceb316bd56196b68ad
Author: Miquel Raynal <miquel.raynal@bootlin.com>
mtd: spi-nor: winbond: Prepare the introduction of W35TxxNW parts

This commit introduces support for the Winbond W35TxxNW octal DTR flash
family. It implements callbacks for entering octal DTR mode and configuring
the number of dummy cycles via volatile VCR registers.

> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c

[ ... ]

> +static int winbond_w35txxnw_nor_set_dummy(struct spi_nor *nor, u8 dummy_=
cycles)
> +{
> +	return winbond_w35txxnw_nor_write_vcr(nor, WINBOND_NOR_VCR_DUMMY_CFG_RE=
G,
> +					      dummy_cycles);
> +}
> +
> +static int winbond_w35txxnw_nor_set_octal_dtr(struct spi_nor *nor, bool =
enable)
> +{
> +	enum spi_nor_protocol proto_aft;
> +	u8 *buf =3D nor->bouncebuf;
> +	u8 rdid_dummy_aft, val;
> +	int ret;
> +
> +	if (enable) {
> +		val =3D WINBOND_NOR_VCR_IO_MODE_ODDR;
> +		proto_aft =3D SNOR_PROTO_8_8_8_DTR;
> +		rdid_dummy_aft =3D 16;
> +	} else {
> +		val =3D WINBOND_NOR_VCR_IO_MODE_SSDR;
> +		proto_aft =3D SNOR_PROTO_1_1_1;
> +		rdid_dummy_aft =3D 0;
> +	}
> +
> +	ret =3D winbond_w35txxnw_nor_write_vcr(nor, WINBOND_NOR_VCR_IO_MODE_CFG=
_REG, val);
> +	if (ret)
> +		return ret;

[Severity: High]
Will this lose the dummy cycle configuration upon system resume?

When the system resumes, the SPI NOR subsystem invokes spi_nor_resume(),
which calls spi_nor_init(). The spi_nor_init() function calls
spi_nor_set_octal_dtr() to re-enable octal DTR mode, which invokes
winbond_w35txxnw_nor_set_octal_dtr():

spi_nor_resume()
  spi_nor_init()
    spi_nor_set_octal_dtr()
      winbond_w35txxnw_nor_set_octal_dtr()

Since winbond_w35txxnw_nor_set_dummy() writes to a volatile register
(WINBOND_NOR_VCR_DUMMY_CFG_REG), that configuration is lost during sleep.

Because the core does not call the nor->params->set_dummy() callback on
resume, and winbond_w35txxnw_nor_set_octal_dtr() does not explicitly
reconfigure the dummy cycles when Octal DTR is re-enabled, will the SPI
controller and the flash chip disagree on the number of dummy cycles used
for read operations?

Can this cause data corruption on read operations after a system
suspend/resume cycle?

> +
> +	/* Read flash ID to make sure the switch was successful */
> +	ret =3D spi_nor_read_id(nor, 0, rdid_dummy_aft, buf, proto_aft);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-winbond-ma=
ster-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com?part=3D9
