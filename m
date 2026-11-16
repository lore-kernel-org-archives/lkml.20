Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859797;
	b=QoC94d0zndT9MmiuUIqiscwihNoOlp4lSVDAIo1t7KvvYTrJj89VhADL47v9C6/tCY+g
	 ShacE17QENDN4MpBlK9gwFdLALk0nktU7t9RGTNvbed5EFrnv3N5eoBqu/XbJjaOFKLHj
	 kFPTz4/hDlAWRgzy+Ipcy9zab2GW5NEcmSue5tUMgtWgkxdPfHvlXFJ1oChGcEWxYFZG4
	 8FUusRcZgSw93jBNKXx5K/xXYP7S+f+zDRgsyrVjS5t5IOVtI9pvTeSKGLDLTwyvlhiDM
	 NKKcglrwfB7xnPXGsZAfAtuZeZyfY95xjUELn8V1OFCVH0fyzVtmPqMYIShqTEfOWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859797;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=7p+C/K4ReCbw2m1smmwxowTkxDKVQWnV5o6Aj+vh6cA=;
	b=V+Jq8hcsQJJMzMEMKNGm3RJoCcS2jlkpaGPIm2oRqdv/HEbEe72K3RnZdsf4yYs5w1r+
	 WNF0ex2Am7FWICCZGIhXkuvg+43nv8lqE64OM1PLDAL7xHHQB50QUYy6r2fDu/1csVZCl
	 4Exb9DNw3JlAtnR4u5QmP99thkqgBe1Fy7lGd1fhbosOcyW+bQJW+FYldDGY9m9kGerVt
	 n+0EQDEafm7XMOStqWUkxMimlrbw3HnTd3xYPSow7BmZcmYoU0zaRL9sk+QoROrE5VnPq
	 lCKTrmLZG2ZHw4ZkoBc8NuuHTIck60q2z55fIRYouvCtzapZxKboQpCnq9Bxke33ECQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0iL0+77;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBD606A31C;
	Mon, 16 Nov 2026 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0iL0+77
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A381F000C7;
	Mon, 16 Nov 2026 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794859797;
	bh=7p+C/K4ReCbw2m1smmwxowTkxDKVQWnV5o6Aj+vh6cA=;
	h=Date:From:To:Cc:Subject;
	b=k0iL0+77OnNpruACf8VdriSWzwDSEhUv5T/IFEzb+0LNzyWKUDrtx4UKtUru7jMzS
	 x0/5OWCfCpNrD4aBXWmHrKEpx2LMxqFtB9Z2h/uHim3GR20Ky/ytpvVXkVvR6TjJXN
	 hkg7jY6oqZ77ad4HB+pWdgrWrzIWQZqKC/E0kkDs11Ig5xQETk1krgv2OCqrZdgbHL
	 gULKpVmfqhjUrJgnTghQx2WLq4OmUvL5AEjWaFaI+rSJ4aQk1GoduiOerWtNILB3y+
	 mWJkQbWlnaCGrZs97Qx7EWSXLRniHF1+WiVR+ueHzmjaOQhkoTLN9oR8pDVdegPGG+
	 aUYTY3ir7+TYA==
Date: Mon, 16 Nov 2026 20:09:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <avtjEdUWiljJ5V7o@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fftLlh67Ku+hliAt"
Content-Disposition: inline


--fftLlh67Ku+hliAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib-shared.c

between commit:

  7d1d799d6251b ("gpio: shared: use atomic set_bit() for descriptor flags")

=66rom the gpio-brgl-fixes tree and commits:

  c402fd2961dd0 ("gpio: shared: factor out per-entry teardown helper")
  cda42ff53c4b5 ("gpio: shared: factor out per-entry setup helper")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpiolib-shared.c
index f34315a2059a2,cbb68ad646498..0000000000000
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@@ -532,7 -643,8 +643,7 @@@ int gpiochip_setup_shared(struct gpio_c
  				 * This is a shared GPIO proxy. Mark its
  				 * descriptor as such and return here.
  				 */
- 				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
 -				__set_bit(GPIOD_FLAG_SHARED_PROXY,
 -					  &gdev->descs[0].flags);
++				__set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
  				return 0;
  			}
  		}

--fftLlh67Ku+hliAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7YxAACgkQJNaLcl1U
h9C2gwf/ZZbVSTk4mGcYl6TEcp5zcdvBcFJHN89nNpBPY9c2fPJGwNRU1ar9vJhc
quQes0a9fOauSzfx1WhJ8KAllvlbazMK8eJPdf/rCC0U7g9ItK7ZkFrIHxU/T9xS
yeM6tn/aogCT07tt4fq2qxKibRYaKChcmLEPrxratnb+tnqY3FJMDVoX89afHaLY
G37PHF6kChnBY2EJtCV86GddwOiwTwfpGSf1f6DtjkdYv0ZVZI3eYQ4g7SC9HrOX
2q+4VCBuyTbx0B9Gw7+gAfj3F4MbWjlvn8vylsSf1v9N3h53Sh5iHVQVJdDgGThI
Rs2UsWBF+hbxh4TgNlfVTWwHUO/8ew==
=uggk
-----END PGP SIGNATURE-----

--fftLlh67Ku+hliAt--
