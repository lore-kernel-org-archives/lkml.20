Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590176;
	b=5NhF0es8U8bm2Vvm0i7LQWPgqmvCXw2zW5tpqzhA8gDQCdgYA/JafXcX5yRaasGHSrSs
	 f0R3+mlUqolgeGDKbo8LUAAUDi9Ex5pjniSVRaG+HIwySQaWJ45hSeGOGDDT4C1CNc9Sg
	 28r/vBaWhR0cbe4LLQ4CAwUfpbQK1UntbctO1QM06wFN7LSVpXLdlw4mnLk354lb6VKz7
	 ZHBrMv5NZJIftMqF4jByHQy7aQEGjaOdBan/dtkAjeynaOhy20Ijsb+EhlyzdY4U69RZt
	 uDrPDmrIiCCEs3gFvmUmIs15LCgxbpDrxyawkNN6Yk6dvGV3AJ+s64s8DgrmlEuegdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590176;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=QkW0fQj9RjNj1AO7xA9jvfIo/INrrrGAe76USPFlo04=;
	b=EaH5XlixmTN/i1P12n1yjFYwg3NYMs8gSjhriCwEi9pMIgHsyuyhRQvNGhNdzGyuuCgG
	 Ehoxb2PFV8HzeUhq1rmj/8+VKCs2xyVm3VpzFy11zvILOcuI2Yobpe+GySrIK1XWM6LvJ
	 FkJTf1r/ccVztQwwnY3DEaxU9L2K4bcMYpyXQ3vOYzoIH6rQiG6/gyHAA8dnzI4gY3KmU
	 SLwwsfLhDVLzpGHntjjRiJ4HruDayyza+okiOOweDDs7rAYuC8SrDuTqEtnwitWq0Iy3S
	 GGzXXKIkFcSsL6kjltmBQFZzdjcHcM4WWsrFFYOZVTwOLgh/bjaHY2H3FbSC0uvgpCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kPS/x7Ve";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23760606A339;
	Wed, 21 Oct 2026 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPS/x7Ve
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7881F000C7;
	Wed, 21 Oct 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590175;
	bh=QkW0fQj9RjNj1AO7xA9jvfIo/INrrrGAe76USPFlo04=;
	h=Date:From:To:Cc:Subject;
	b=kPS/x7VeOoKYHyxcZ4iUkPmIdo4qGuoyOXTwfTLiAgKVddigh+vju2toetgFNjitx
	 2hlaj0pF0iY7zvV/GKhSGdVAfIlWgiefAv9eE77VEI1ZNA7qCwnPQnDM3dKunyz0sZ
	 bUQNNqniQpxSIwbNJQ0XathzKy2OGL60pfGB3lfJlmWg1Is1JEHmaZptco13jZlWZe
	 JDAkfbvgJT7u6dYqw3ZX6hAyyvb1XWeCPzBpphSymSOUp8WYoTnSvqiflMo88ZQ8ZX
	 3FNsjWouMsh1kzEqtljJQbywyGtik9GwJCdXdAubG4SkJaTs+ep3+T88apb1We4Ixe
	 zSebqaEPJQtAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0E2A51AC5996; Wed, 21 Oct 2026 14:05:54 +0100 (BST)
Date: Wed, 21 Oct 2026 14:05:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the origin tree
Message-ID: <ati4sVaUOZm_N6pa@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="/kRsCuVibXfu5WDr"
Content-Disposition: inline


--/kRsCuVibXfu5WDr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib-kunit.c

between commit:

  851bb4a429916 ("gpio: kunit: fix GPIO device reference leak with __free()=
")

=66rom the origin tree and commit:

  c3e8906112e0c ("gpio: kunit: factor out common code for waiting for devic=
e probe")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpiolib-kunit.c
index 6a2c8b34f34bb,c5d4637ea2c58..0000000000000
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@@ -27,9 -29,21 +29,23 @@@
 =20
  #define GPIO_TEST_PROVIDER_NGPIO	4
 =20
 +KUNIT_DEFINE_ACTION_WRAPPER(gpio_device_put_wrapper, gpio_device_put, str=
uct gpio_device *);
 +
+ static void gpio_test_device_check_bound(struct kunit *test,
+ 					 struct device *dev, bool expected)
+ {
+ 	bool bound =3D false;
+=20
+ 	wait_for_device_probe();
+ 	scoped_guard(device, dev)
+ 		bound =3D device_is_bound(dev);
+=20
+ 	if (expected)
+ 		KUNIT_ASSERT_TRUE(test, bound);
+ 	else
+ 		KUNIT_ASSERT_FALSE(test, bound);
+ }
+=20
  /*
   * The test provider tracks per-line direction and value so that lines ca=
n be
   * driven as both inputs and outputs - this is needed to exercise input a=
s well
@@@ -772,9 -737,7 +739,8 @@@ static void gpio_hog_assert(struct kuni
  	struct property_entry properties[2];
  	struct platform_device *pdev;
  	struct fwnode_handle *fwnode;
 +	struct gpio_device *gdev;
  	struct gpio_desc *desc;
- 	bool bound =3D true;
  	int ret;
 =20
  	fwnode =3D software_node_fwnode(&gpio_test_provider_swnode);
@@@ -792,12 -755,10 +758,12 @@@
  	wait_for_device_probe();
 =20
  	/* The hog must have configured the line with the expected direction. */
- 	gdev =3D gpio_device_find_by_label(GPIO_CONSUMER_NAME);
 -	struct gpio_device *gdev __free(gpio_device_put) =3D
 -			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
++	gdev =3D gpio_device_find_by_label(GPIO_TEST_PROVIDER);
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
 =20
 +	ret =3D kunit_add_action_or_reset(test, gpio_device_put_wrapper, gdev);
 +	KUNIT_ASSERT_EQ(test, ret, 0);
 +
  	desc =3D gpio_device_get_desc(gdev, offset);
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
 =20

--/kRsCuVibXfu5WDr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCati4sQAKCRAv73Ows9A4
iQ37AQCoe9UJxGwNP4aJD7FDDIVAaaOXQmuCNZULNGC0DOxpBwEAs1uqqnTuvWxv
uJMciNuJ+aQPZu56042eBHIWO0E6KQg=
=M5eQ
-----END PGP SIGNATURE-----

--/kRsCuVibXfu5WDr--
