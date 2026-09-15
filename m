Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC83CB57F;
	Tue, 15 Sep 2026 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480042; cv=none; b=eufv40Ub7IxqbUrn3a0uJgu/S+BMTLBtbqf9rCGbRYtSfmQEaWS8GZA0P1yOZ/2R+7dWD8pXnP65O9TMPGy2t37ZVl+eaJZe5C4oG2OApTHP/m8yfnPY+ASQaQnjZwpa27nf/YF0Evrb7mKjgCwY773Ul9WIvPrrVUstAHM6Wb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480042; c=relaxed/simple;
	bh=ZRcbsblfilKh97aHUvnTvnGgTE0SnKVXCZ2wCDvust8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onlWKOdWDeXDBED0v0q+TdIw0MfNaUhp43E0FN2rnYqZXmnNQjPLdvyEuX45MtghZLZ0xU1I+U4DyS5tnV4h42G0nH0ksVevBC+CcwVZQl5mSUQRGygSGMM+dBmYYHPEiyOer3DqUbmMHHtelsGV1FQrASUkJYrWggyvsxLo+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhPsN+U/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhPsN+U/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC61F1F000FF;
	Tue, 15 Sep 2026 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789480041;
	bh=D8qP32Wiuwqk/ekGQfIn50CnOyZx3Es2XJqohXpkSEE=;
	h=Date:From:To:Cc:Subject;
	b=VhPsN+U/VXfy54RlSdveDbRjqQpC3RgrRcealmBXspiBHobXTiBauXyhG2jvy1QGz
	 fAFl2RfrZShrCTftjqvLkCOvc98gaYFm30mY/y2+bRQ2vTX186gAS96EuWxzbqUpSa
	 Wd9cJd6855NQBMKQQ30bNf4fs4Xgv1ejhjV9UIVO82EqVj3929x3GMKuVZYpSTypuB
	 PCNWu4/UzZGwVbqw8cq8ZblKebA1AgR8SxCwgM+fzfAPdW1+3EjVL1txbg30OO7Jy1
	 ShxGUYy9ZB4eyz/MC1ufOBzTHRRztex/XOgPMYzO7lAcrjG1lTgDKjztoHdRcm8FmU
	 Z9wYguOulzodQ==
Date: Tue, 15 Sep 2026 14:47:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <aqlMZfcfK-y7_GX2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YbR8VftxmjTNlWG4"
Content-Disposition: inline


--YbR8VftxmjTNlWG4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btusb_main.c

between commits:

  f92634ad91863 ("Bluetooth: btusb: Build the driver from multiple source f=
iles")
  8b1bfabebfa40 ("Bluetooth: btusb: Add support for Qualcomm multi-subsyste=
m QCC2072")

=66rom the bluetooth tree and commits:

  f92634ad91863 ("Bluetooth: btusb: Build the driver from multiple source f=
iles")
  8b1bfabebfa40 ("Bluetooth: btusb: Add support for Qualcomm multi-subsyste=
m QCC2072")

=66rom the bluetooth tree.  Yes, that's the same two commits.  I suspect
something to do with your constant cherry picking and prior fixes having
been merged managed to generate a conflict on the source file spilt, I
imagine it's something pulled over from another file.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/bluetooth/btusb_main.c
index 002b9f975710f,be47ac894b6cc..0000000000000
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@@ -69,8 -71,18 +71,21 @@@ static struct usb_driver btusb_driver
  #define BTUSB_ACTIONS_SEMI		BIT(27)
  #define BTUSB_BARROT			BIT(28)
  #define BTUSB_BROKEN_EXT_SCAN		BIT(29)
++<<<<<<< HEAD:drivers/bluetooth/btusb.c
++=3D=3D=3D=3D=3D=3D=3D
+ #define BTUSB_QUALCOMM			BIT(30)
++>>>>>>> bluetooth/master:drivers/bluetooth/btusb_main.c
 =20
  static const struct usb_device_id btusb_table[] =3D {
+ 	/*
+ 	 * NXP IW610 (0471:0215): the composite device reports Bluetooth
+ 	 * class at the whole-device level, so the generic entry below
+ 	 * would also match this WiFi vendor interface. Ignore it here
+ 	 * first so mwifiex-nxp can bind it instead.
+ 	 */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0471, 0x0215, 0xff, 0xff, 0xff),
+ 	  .driver_info =3D BTUSB_IGNORE },
+=20
  	/* Generic Bluetooth USB device */
  	{ USB_DEVICE_INFO(0xe0, 0x01, 0x01) },
 =20
@@@ -983,6 -1016,9 +1019,12 @@@ struct btqca_data=20
  #define BTUSB_HW_SSR_ACTIVE	17
  #define BTUSB_WAKEUP_BROKEN	18
  #define BTUSB_RESET		19
++<<<<<<< HEAD:drivers/bluetooth/btusb.c
++=3D=3D=3D=3D=3D=3D=3D
+=20
+ #define BTUSB_PROTO_LEGACY	0x00
+ #define BTUSB_PROTO_H4		0x01
++>>>>>>> bluetooth/master:drivers/bluetooth/btusb_main.c
 =20
  struct btusb_data {
  	struct hci_dev       *hdev;
diff --cc net/bluetooth/hci_sync.c
index 2a651a4d60e64,51d03cd3c963a..0000000000000
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
diff --cc net/bluetooth/l2cap_core.c
index 644e31160d55b,a22edd2baf5e5..0000000000000
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@@ -3900,7 -4009,8 +4009,11 @@@ static void l2cap_ecred_rsp_defer(struc
  	struct l2cap_ecred_rsp_data *rsp =3D data;
  	struct l2cap_ecred_conn_rsp *rsp_flex =3D
  		container_of(&rsp->pdu.rsp, struct l2cap_ecred_conn_rsp, hdr);
+ 	bool locked;
+=20
++	if (chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL)
++		return;
 +
  	if (chan->mode !=3D L2CAP_MODE_EXT_FLOWCTL)
  		return;
 =20

--YbR8VftxmjTNlWG4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpTGQACgkQJNaLcl1U
h9Ci3wgAgHIqjDx6NCLL/0Dt8TGs1HogbyxWKPxyEiF46Qc2eNPHAR4/l9k6s9ti
87xIm6BX+qWEiLjIi6aZUZBIMEbOqNtqofqiOtI/TTTkdQGZc1fabXkkynd3cWpc
DH71r+UEWxMPgaZ4Y1fU9h3k4bRCyTU/LvO5DCofPxkTFOQKH03t4ubQOu07MbJd
Hx5d92R/9ZxHO3aZ3AQELUVV18Sd4Qm8XxTUDktkEpyXgZu94tjt+r+rvNWp5GoA
nFL89Ruo+bA6FH2g8Rai78OFtvpYrlr7zIyV2H93pTQ3XpL74DAjREOlDSGCPU6l
4T7hVFJ9r/Qeg9ZQnjf5flKxXANqUA==
=qiCJ
-----END PGP SIGNATURE-----

--YbR8VftxmjTNlWG4--
