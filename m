Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288A3DF01F;
	Mon, 19 Oct 2026 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415615; cv=none; b=d0fthWFCiV5mxJnNAIWk1g3Oyw9QRmwMfEJef+BlMm5LApQPHjhzP0dS7t1BSc23nhZsP0+HnfeVx5YXylgl+VQIPZHq8XrV/drpC9lWn1U5USn/j4HOFe+X8sc+5YVPCyr5+YdO7bWmvBnnGiGGqiwnGgRgEu/XtAsb4PBWx3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415615; c=relaxed/simple;
	bh=fHyLx8e/mvzfdb90xSdk8Z/wJtNteHVW1xhS8unvT14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcqE3CwRkyisKrmmidGklbhBFuOYq3nJIvlvMLXgzoIJ0xRa4qu1Ny8KlZ9QTQVpHLEAGE148gKkZ55BdIq1SsC4UrUfUeCumvBim7vSzSQPwTWc4bPBu9JxceNo/2Yij3CrPc69hci6LD6kKMxadxEiS53OqETz8HWo+IPnQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lntdw7zE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lntdw7zE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5231F000C4;
	Mon, 19 Oct 2026 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415612;
	bh=P1yKaRSp7P8GDnHS3UQ51523o4SiuSpwVGuTKweDtEQ=;
	h=Date:From:To:Cc:Subject;
	b=lntdw7zEybCuQkg6hwFuzpss5Sc1uJne0FRNhf2LxxR3a/xFIL8wmCw9x9Rj2pFqX
	 mlPTFXoUOLmrs4+FkoNVAyPkJXAw4XLxSN/6r5jKTsOhU3M+5NpvJI3c1ZE/N+KYlA
	 +Th4KXckJuklbxK/JxjTMnqNxqdoOTJtrMKsSHvU9AGgHofHWrDkCEUQcHFoWD28a0
	 hN/6DNwXmrvKMNbp9wLIqjAI+t+5qRaVAnt2ha5mi3HU/it8vz6vvBQ44ly9kMYbS5
	 TQYds77yaKXStOS5lNZdihhJvtk8+3WmpsfovrTTCPnvo7kGwwAka7HwzNHfxhswm9
	 aiOXxcKp4UH0g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3A8EE1AC57D1; Mon, 19 Oct 2026 14:13:30 +0100 (BST)
Date: Mon, 19 Oct 2026 14:13:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-intel-fixes tree with the
 gpio-brgl-fixes tree
Message-ID: <atYXeq9z_aVSt_df@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MrbHReloBJOPgGpQ"
Content-Disposition: inline


--MrbHReloBJOPgGpQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-intel-fixes tree got a conflict in:

  drivers/gpio/gpiolib-acpi-quirks.c

between commit:

  5a088d1b72662 ("gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S=
 AI")

=66rom the gpio-brgl-fixes tree and commit:

  6da1f3437435c ("gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 1=
6S AI")

=66rom the gpio-intel-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpiolib-acpi-quirks.c
index c1ce4700e2a4d,dbfd82056c3e0..0000000000000
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@@ -343,20 -343,22 +343,36 @@@ static const struct dmi_system_id gpiol
  			.ignore_interrupt =3D "AMDI0030:00@11",
  		},
  	},
 +	{
 +		/*
 +		 * Same camera power enable on GPIO 11 as the Acer Nitro V 16S AI
 +		 * above. It also powers the internal microphones.
 +		 * Found in BIOS V1.53
 +		 */
 +		.matches =3D {
 +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
 +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Acer Nitro 16S AI"),
 +		},
 +		.driver_data =3D &(struct acpi_gpiolib_dmi_quirk) {
 +			.ignore_interrupt =3D "AMDI0030:00@11",
 +		},
 +	},
+ 	{
+ 		/*
+ 		 * GPIO 11 is the power enable of the internal USB camera.
+ 		 * The firmware drives it high but also lists it in _AEI with
+ 		 * an empty handler. Requesting it as an input turns the camera
+ 		 * off, so it never enumerates.
+ 		 * Found in BIOS V1.14
+ 		 */
+ 		.matches =3D {
+ 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+ 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Acer Nitro V 16S AI"),
+ 		},
+ 		.driver_data =3D &(struct acpi_gpiolib_dmi_quirk) {
+ 			.ignore_interrupt =3D "AMDI0030:00@11",
+ 		},
+ 	},
  	{
  		/*
  		 * Wakeup only works when keyboard backlight is turned off

--MrbHReloBJOPgGpQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatYXeQAKCRAv73Ows9A4
iUM6AP9kleCTjVpXO8iwUCmyIBKqTkzyKcBjaBPyW+6s0dppqQD/QfVkZ9iTKngZ
PNobnzGBxPK4Rrk91W5gp3rOLBvewQY=
=Y5gT
-----END PGP SIGNATURE-----

--MrbHReloBJOPgGpQ--
