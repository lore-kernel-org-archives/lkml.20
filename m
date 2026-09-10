Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87472F3C37;
	Thu, 10 Sep 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050094; cv=none; b=q288Qb5eUPq5DKeYL8+n74K/Y1IZfGPEE2hVYhiou3M3eH/sU9ncjF+Zi6zkd4Nh4qB0Pyc5EycGLNdegiWZn3NXd72jIJp4g/oYTsWoY201Jdd9HPeDUVpO0kVq4tx/7MySHKCAI27rVWaOtsAr9Ywd+tFlBboSpoYf46KQL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050094; c=relaxed/simple;
	bh=2L1HOyKWYExRLoeqyGDfhSzzWOvB21McjUxXIdxHUz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCUG70lPfsW9wtpsMfTF/Wouxpvs1oYOkWfXd2djUEpoVVkBeKTBnW2/94aaT2ZVgYs9DL+SjnHJDkuqfkH5EV4bdyAvzHz/+srC00SbCLo15fx5T1ox80u4C/UiOELkYIL3Im0PPB2hx58lepeuu3MDPI8hmeFqL7IkPcrXuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGiMMoTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGiMMoTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B671F000FF;
	Thu, 10 Sep 2026 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050092;
	bh=YfBaycR/Z43YxfS9mwxL4vXi2ltcq1wGJh8U5xyax10=;
	h=Date:From:To:Cc:Subject;
	b=CGiMMoTdbtSWmwhsIDjPTKunr5sYre8wfjMslFEb1QP7neJJEVl6F6zx5PlwSE8/c
	 PS0jZLXOuquUtM7bu4a+DdS9GCGJb8hhDrR40O/ge13fg9u/0+4GE2D5LYXo0No+pL
	 Mu73C0nzO4l0DHDEqZOCHwtFZ7R9T6QYZomhTT7OW1UAGqlIDLAAxOlbDbyr/j1o9R
	 xpwpKeIDfnG6pBHOwhAyMKXcLtJBmcZUnrwCL2iK6c6myRyVqr8ke3y40NLeQkGtSB
	 G1n7SRJKohQpIZzGkBBQGbKYiAvDbiQHQpms0b/B7CYo1f9v7elD4gFLpZoNkd2uDT
	 EYv05aeVdgKXQ==
Date: Thu, 10 Sep 2026 15:21:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Andi Shyti <andi.shyti@kernel.org>, Carlos Song <carlos.song@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: linux-next: manual merge of the i2c-rust tree with the origin tree
Message-ID: <aqK86A1SuLKQP5Gi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pd+SUwXocuFe51Dz"
Content-Disposition: inline


--pd+SUwXocuFe51Dz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c-rust tree got a conflict in:

  drivers/i2c/busses/i2c-imx-lpi2c.c

between commits:

  d1f112e2fa9b7 ("i2c: busses: drop redundant dev_err_probe() around irq he=
lpers")
  cbd043b00ee3f ("i2c: imx-lpi2c: properly unwind resources on probe failur=
e")
  a4c419356a333 ("i2c: imx-lpi2c: reset controller in probe stage")
  27c9445be86b1 ("i2c: imx-lpi2c: avoid accessing target registers on maste=
r-only controllers")

=66rom the origin tree and commits:

  d2b83deba536d ("i2c: busses: drop redundant dev_err_probe() around irq he=
lpers")
  c19f6f452664a ("i2c: imx-lpi2c: properly unwind resources on probe failur=
e")
  90311787f483a ("i2c: imx-lpi2c: reset controller in probe stage")

=66rom the i2c-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/i2c/busses/i2c-imx-lpi2c.c
index 1cfd7a4c82370,e1a4338bc51e9..0000000000000
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@@ -29,7 -29,6 +29,7 @@@
 =20
  #define DRIVER_NAME "imx-lpi2c"
 =20
 +#define LPI2C_VERID	0x00	/* i2c version ID */
  #define LPI2C_PARAM	0x04	/* i2c RX/TX FIFO size */
  #define LPI2C_MCR	0x10	/* i2c contrl register */
  #define LPI2C_MSR	0x14	/* i2c status register */
@@@ -137,9 -136,6 +137,9 @@@
  #define I2C_PM_LONG_TIMEOUT_MS	1000 /* Avoid dead lock caused by big cloc=
k prepare lock */
  #define I2C_DMA_THRESHOLD	8 /* bytes */
 =20
 +/* Bit 0 indicates the presence of the target feature */
 +#define VERID_FEATURE_TARGET_PRESENT	BIT(0)
 +
  enum lpi2c_imx_mode {
  	STANDARD,	/* 100+Kbps */
  	FAST,		/* 400+Kbps */
@@@ -198,7 -194,6 +198,7 @@@ struct lpi2c_imx_struct=20
  	bool			can_use_dma;
  	struct lpi2c_imx_dma	*dma;
  	struct i2c_client	*target;
 +	bool			target_supported;
  	int			irq;
  	const struct imx_lpi2c_hwdata *hwdata;
  };
@@@ -1335,10 -1330,6 +1335,10 @@@ static int lpi2c_imx_register_target(st
  	struct lpi2c_imx_struct *lpi2c_imx =3D i2c_get_adapdata(client->adapter);
  	int ret;
 =20
 +	/* Reject target-mode registration on controllers that don't support it.=
 */
 +	if (!lpi2c_imx->target_supported)
 +		return -EOPNOTSUPP;
 +
  	if (lpi2c_imx->target)
  		return -EBUSY;
 =20
@@@ -1555,23 -1546,13 +1555,13 @@@ static int lpi2c_imx_probe(struct platf
  	pm_runtime_enable(&pdev->dev);
 =20
  	/*
- 	 * Reset all internal controller registers to avoid effects of any
- 	 * state left over from a previous stage (e.g. the bootloader).
- 	 *
- 	 * The Master block (MCR) is present on every controller, so reset it
- 	 * unconditionally. VERID shows whether the target feature is supported.
- 	 * Do not touch the Target block (SCR) on a master-only controller to
- 	 * avoid an asynchronous SError.
+ 	 * Reset all internal controller registers of both Master and Target
+ 	 * to avoid effects of previous status.
  	 */
  	writel(MCR_RST, lpi2c_imx->base + LPI2C_MCR);
+ 	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
  	writel(0, lpi2c_imx->base + LPI2C_MCR);
-=20
- 	lpi2c_imx->target_supported =3D !!(readl(lpi2c_imx->base + LPI2C_VERID) &
- 					 VERID_FEATURE_TARGET_PRESENT);
- 	if (lpi2c_imx->target_supported) {
- 		writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
- 		writel(0, lpi2c_imx->base + LPI2C_SCR);
- 	}
+ 	writel(0, lpi2c_imx->base + LPI2C_SCR);
 =20
  	ret =3D devm_request_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx_isr, IRQF=
_NO_SUSPEND,
  			       pdev->name, lpi2c_imx);

--pd+SUwXocuFe51Dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqivOcACgkQJNaLcl1U
h9BuJAf8D01z/Vq00PKgX/MYimzFuYR11gfkmsskRH+fu3xVH/ONyN0yIoIQz+Yh
NXjVsfa42PiDJ1OM66nXzxECMZCzhYSsSs4BcE+psHkvSybgZiBsEHwLWRhonkz2
8xgRLoEMZvbmxpl6wsNDgaBdNOrPD6RN930bMABCryeTX0NJnNxeNyFQAVRmI12d
UAEL3hlpBtGP1C+PAuMkusRfiSW0EDXrQGjI3B7NRH90b9juOYpxqwh4NU3vp8ge
GUQvaYZAT0rBtW0Q1iN63qAsazFH/cw5Ilg/n13HvbVUSuSe4CgFE3HKs5zn/fc3
Ot5mbF1sJE3EtPPCYNk33SsC+7SRhg==
=JRL7
-----END PGP SIGNATURE-----

--pd+SUwXocuFe51Dz--
