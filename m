Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766134;
	b=nguzJzCjI/j8cAN2StisqsxV9zI1zlCIUcXQedoI05DlmsIasrS9cRv70Z9KkrBIY6iZ
	 9+Lgd13hnjpZHJVLOAB2DQZxyic/znUWoyZmQNUz57/CBcwr4bqMF6LC/52aGf0HdnoP3
	 cwQ+DFvI+ozNgPPWnH2khFS0kfN5YmHIOxvocYXFv3gyHccMej2/JQhEEumvqe8yGdbHr
	 R1cDyTNM5+Ex96gHu4jwwE32iHbgkAJgYGjjsuzABosQt2Wrnbd+EqTO+HGCSfuYj/luR
	 lGAUHNbtZGr3xaCUyEmqDFKy43ty3YJvhQ1U1/W89GKI922/p0BGC0Qp1MK+5GaZgdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766134;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=1QoN6cdYjd7lccIt+f66hMTmtEPYBbKaaVE8fnfLrr0=;
	b=wU3F5XOruzLCnC1608QSUWNwATrOWx967HNLdBIsR36T/3V0d16ED0155camqcUJlm7K
	 Ek8CHBYM+p2gZzlG7I7XfURfK73HcVFhWxrH15QxDWexjDU5V7Ov1TXAAAi1eONv8Umdm
	 v5Htc4tY94PG3raHnyT6nMUmpwyOolj2584Xq0ViFetiRNf5pax8HZ1xtqCwsNKFDveyb
	 L33XqAGwbhgqQkuzB+oOg4LguccQmJiBCsb1+LqFCaRYD35kCuU6K0XgpJVHIU9Zb78fK
	 ssqnfsOvi2DQJxgUthwFk6kr6BT2d4cqhKojWI4ovkIGfpXL+3OoyjqJz2a/wSV28NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR96nJz8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03146606A31A;
	Fri, 23 Oct 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR96nJz8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761E21F01825;
	Fri, 23 Oct 2026 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792766133;
	bh=1QoN6cdYjd7lccIt+f66hMTmtEPYBbKaaVE8fnfLrr0=;
	h=Date:From:To:Cc:Subject;
	b=CR96nJz8Ew3Av5ozmSqGwVxXtRZFk1iQI1GxgjmvketBo7CwFraT3cpr+CTKGc5Fv
	 snZHDFHP0XXphWI3sx0WDM+zvVmJUuN0fOfg3l4xHuev4S22EHOjxBcyng5OvY4pHl
	 tz1Q2vt+zghzFISjHXJQ2gXigCKDFt54HGPS40td6x1pPFJouLcEZnrxwKCC9IM6+l
	 /nWJunz0AWqEf2mVayqle1JIFsEPpzFST6eWkmcLoYBhBX5p5ZLetg8LAAHwKsFHS+
	 CZx6AJ/4Lj9WNqlaudaqHN1IuMBYuK+ULPvs+cZJQbWEZQp5ChfV2fohuwJFi2+54W
	 609VsjyYUAmIg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E37261AC5994; Fri, 23 Oct 2026 15:35:30 +0100 (BST)
Date: Fri, 23 Oct 2026 15:35:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the arm-soc tree with the origin tree
Message-ID: <attwspRf09lDVPrZ@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="zOAHGtiWWHZFc3B5"
Content-Disposition: inline


--zOAHGtiWWHZFc3B5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got conflicts in:

  drivers/soc/Kconfig
  drivers/soc/Makefile

between commit:

  2e51c645fee24 ("Merge tag 'soc-drivers-7.4' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/soc/soc")

=66rom the origin tree and commit:

  3cd9904284fba ("Merge branch 'soc/drivers' into for-next")

=66rom the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/soc/Kconfig
index 483cbdcae1534,be933b2d9c32a..0000000000000
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@@ -24,8 -24,8 +24,8 @@@ source "drivers/soc/renesas/Kconfig
  source "drivers/soc/rockchip/Kconfig"
  source "drivers/soc/samsung/Kconfig"
  source "drivers/soc/sophgo/Kconfig"
 -source "drivers/soc/starfive/Kconfig"
  source "drivers/soc/st/Kconfig"
 +source "drivers/soc/starfive/Kconfig"
  source "drivers/soc/sunxi/Kconfig"
  source "drivers/soc/tegra/Kconfig"
  source "drivers/soc/ti/Kconfig"
diff --combined drivers/soc/Makefile
index 5a3efd68355cd,5bedcf8d513c4..0000000000000
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@@ -30,8 -30,8 +30,8 @@@ obj-y				+=3D renesas
  obj-y				+=3D rockchip/
  obj-$(CONFIG_SOC_SAMSUNG)	+=3D samsung/
  obj-y				+=3D sophgo/
 -obj-y				+=3D starfive/
  obj-y				+=3D st/
 +obj-y				+=3D starfive/
  obj-y				+=3D sunxi/
  obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
  obj-y				+=3D ti/

--zOAHGtiWWHZFc3B5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCattwsgAKCRAv73Ows9A4
iafkAP9WiJ9Y7PYhzxpNazQz45hZzMoChDJTV1f53lCJHYJUOAEA0DmsqpgJG+mN
YShMCQOwe75/P4grI5mDFdA3kEVmqwE=
=VNnH
-----END PGP SIGNATURE-----

--zOAHGtiWWHZFc3B5--
