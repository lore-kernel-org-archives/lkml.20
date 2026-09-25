Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD44C8C79;
	Fri, 25 Sep 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352618; cv=none; b=f6qm+Hf15Pfbil9B2Bn+bg4Pvmyt1w2GJ6iaxyWFmzSvse2dhrfRAqQBnahCLKTmwcEn9VTpnTB/tSFbpZPPz6NoRRQrCkh+XLvqi9byIZaHVvSon47NWqQLK7m4YMpkLSuO7h/kEkyAyZC/us4zUHENqJGHI9DpQvXf51OK+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352618; c=relaxed/simple;
	bh=+RnBDG6hynOMdrVEE6FY2Idr0Li1EK80FZcbTmHU2zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9GU1AWwtkvWS0Scse/G8IHwysonvqtdY8BjipsjRsn3cXrCd9kyEvtWvmtNaOrmkc/ytiUOnou45ioCMq7GJMwNPtKLngQkfPe61Dps8daCIxiQl7n6vSK5d+WuLONJtlbnGCtfJfO+BNwnwI7KyL4zY3WS4TFkRigmpOmUXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXPWffaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXPWffaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74C1F000FF;
	Fri, 25 Sep 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352609;
	bh=EA+FFNYseBcPPX97eFDDYxa+xQgS6g1rsIxsyuASVf0=;
	h=Date:From:To:Cc:Subject;
	b=LXPWffaBMBJE+kgUgaWl+NbRlHsZo1XUg4jMqsDhCkJmNiOAId16SIvw/wEpwUOeN
	 8+D6wCTNwJjf0czPKZfvUHuW2GOgx1wLOOKRgS+BFgol4ZC+asm2o9BFWKBpgLXaxD
	 ty417aE1riVAzCkpHrU8tqxahgXMuNh19qmOeNuNjN+l8yLpfyS9MXJsYYMDTBNgv4
	 8fjdlPXeFr4Dy0i0ph8N3J+PJMhzF/diOt5S+/tzEyUqjODFb9Ma2GQsvBWC0oYeYN
	 u5oKkiEiEEY54tHTuR243nalz55fRUFW5yQHipJE3MQyyiHWmrOMBGT1dheEI1rF2F
	 M8jSr+dMm/byg==
Date: Fri, 25 Sep 2026 17:10:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kivan <vaknins33@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateo Borda <mateob226@gmail.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-intel-fixes tree
Message-ID: <arac3fNw4DFKnguy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuLkGaeDHBnP2fwE"
Content-Disposition: inline


--iuLkGaeDHBnP2fwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib-acpi-quirks.c

between commit:

  8d37f20173a27 ("gpiolib: acpi: Add quirk for Lenovo IdeaPad Slim 3 15ABR8=
")

=66rom the gpio-intel-fixes tree and commit:

  1900b5a41493e ("gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX4=
25UA_UM425UA")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpiolib-acpi-quirks.c
index 22c5fb1493778,dd4db58d36ad0..0000000000000
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@@ -392,19 -392,19 +392,32 @@@ static const struct dmi_system_id gpiol
  			.ignore_wake =3D "VEN_0488:00@355",
  		},
  	},
 +	{
 +		/*
 +		 * Lenovo IdeaPad Slim 3 15ABR8: the touchscreen wake IRQ fires as soon
 +		 * as the system enters suspend, causing an immediate spurious resume.
 +		 */
 +		.matches =3D {
 +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 +			DMI_MATCH(DMI_PRODUCT_NAME, "82XM"),
 +		},
 +		.driver_data =3D &(struct acpi_gpiolib_dmi_quirk) {
 +			.ignore_wake =3D "GTCH7503:00@10",
 +		},
 +	},
+ 	{
+ 		/*
+ 		 * Spurious wakeups from GPP3 PCIe bridge interrupt
+ 		 * Found in BIOS UX425UA.301
+ 		 */
+ 		.matches =3D {
+ 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+ 			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA_UM425UA"),
+ 		},
+ 		.driver_data =3D &(struct acpi_gpiolib_dmi_quirk) {
+ 			.ignore_wake =3D "AMDI0030:00@24",
+ 		},
+ 	},
  	{} /* Terminating entry */
  };
 =20

--iuLkGaeDHBnP2fwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2nNwACgkQJNaLcl1U
h9CvJAf+NynHy8l4+/GUDw0FOzIX4YVGzD0iu9tH6Jm/qAqaSm6xoG6GU0QpXFCK
FHAzI/A5joq1ctwTxSBxy+nARFF7ASXB4m/B5WwGW+7WAOAwLxRqTCDkUWXD/nD6
tuMd69G57hVOSDF2ZcRb/fo0DkooVDraO7vEpj452gg+MP/oRG5HCW+uscG/WV4z
cmn0sU0hZgstg+pfqpofrrrvstD5x6H8ja66AacvVe9W+Zb1Sz1I5pnt42OkWWYL
mnsPRfhowvhQmFxn7jU6dsl1FLvKcE2e1w6Bp26I5lA8qJsUPh3WY3tVr69NZs2d
qJkzmJz+99mLGpkZR9eVFLGUHtUhdQ==
=pF/j
-----END PGP SIGNATURE-----

--iuLkGaeDHBnP2fwE--
