Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226511;
	b=hYbEVSvRZKGe4rxRGB7y05VZcBBgfsTPmvaig3wfjX6bO21DTgFH7f2byE63OcM79uNz
	 uzuAKQxyzcsetGErrkdCCQP2iyaUjSLE3KXWyhBZSaNswqjW3LgOkIT5tkLvmaQHwtFZW
	 o7Z1jVId6JXWFBSPd/7yg33EeDrLKACkTFNFignjnMQLVtfXNNY/q1LCzVxFBJHERWM3N
	 0aVHKjG1AhuM0kvASwvHq9snS0YqWXda9q3vt/IrllA+ZqE+gtFALzZRHWXXV4F8N2X+i
	 ZAgyGOLlFn7GzVFAG8gpYwUTVdpIyOv1jfDpFbL1xlnoIxZYPtzHCcNK+TtEDq/maMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226511;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=A3ooDFzXWuof+Uqz7Tb5PxsCWT00FTue5p/TJRaYjuc=;
	b=UVsEaFTDxd8wgtaN2OgAVg2J/YZiXBnCWCAP0YaJj3LYvVYzMiaOOKy0sclITky9okTr
	 lEW3lplbE5HyGwcSQT6uKrCbe3sAWPYRTaBwT11k34mosn2ZZDcQ2LYcVr61r3ZUdDopz
	 E6fDUVnNgsVrdGRVTi/4PHt9NjcU3qZAE292zsSjp6l9lGrsEz8MkRAOmCQvUN+rzoBSb
	 DZxXHItXMNYybm2xJyq45pcdYo0/V7kGmkVmHYp9AxDeGwkH3bdcTQfM6dIhuoZxWqKJY
	 hDXlbUlJb9ZWylTvUOZJFc+lcS9VuYDgiYC48ZewAuXUPceSACUFk4vc3+bJLr8phEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OK7wKWp3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE3606A321;
	Mon,  9 Nov 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OK7wKWp3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96F11F008A2;
	Mon,  9 Nov 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226509;
	bh=A3ooDFzXWuof+Uqz7Tb5PxsCWT00FTue5p/TJRaYjuc=;
	h=Date:From:To:Cc:Subject;
	b=OK7wKWp33JHRae3L9Ri9um+jw6LUF/erIdwaRHP64GBC2qvF/nOrL/nzoRhD4gV4+
	 gLij+mwThMVp8ozKnAX9ck1as502dt9172PYOGCYBl0U8A+ZlT/ADSGDlvcj4hU4So
	 IT3/hyejjjlutwzhEnMf+3ambexdAn38yDwZ9NfzPlZN6F7RzPXAaICq9jH6J0XtcL
	 HayGJahvuaV+7vPcvu78B1x0g5SPtR5eBfoMk9gACA79/4hKdDmnMwlT+3CSV69wQk
	 BSvxkwEqLUa/Ptwwt40pKIr8RhKkLaU01KsMsjhBH3OIzZ4NfV03zV7kGUZJUu9oNW
	 KLRnx7/me1EDg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D09121AC5995; Mon, 09 Nov 2026 12:15:05 +0000 (GMT)
Date: Mon, 9 Nov 2026 12:15:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Reid Downing <skibletz@gmail.com>
Subject: linux-next: manual merge of the exfat tree with the origin tree
Message-ID: <avG5SRXy_zr28fVi@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="dPhCCSQmYZzqMW8E"
Content-Disposition: inline


--dPhCCSQmYZzqMW8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the exfat tree got a conflict in:

  fs/exfat/nls.c

between commit:

  0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commit:

  6a221c33aa528 ("exfat: validate upcase table bounds and length")

=66rom the exfat tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/exfat/nls.c
index 47aa187c54ccc,bec4d9e5e5bd9..0000000000000
--- a/fs/exfat/nls.c
+++ b/fs/exfat/nls.c
@@@ -655,7 -655,14 +655,14 @@@ static int exfat_load_upcase_table(stru
  	unsigned char skip =3D false;
  	unsigned short *upcase_table;
 =20
+ 	if (!tbl_size || (tbl_size & 1)) {
+ 		exfat_fs_error(sb,
+ 			       "bad upcase table size (%llu bytes). Please run fsck",
+ 			       tbl_size);
+ 		return -EINVAL;
+ 	}
+=20
 -	upcase_table =3D kvcalloc(UTBL_COUNT, sizeof(unsigned short), GFP_KERNEL=
);
 +	upcase_table =3D kvzalloc_objs(unsigned short, UTBL_COUNT);
  	if (!upcase_table)
  		return -ENOMEM;
 =20

--dPhCCSQmYZzqMW8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavG5RgAKCRAv73Ows9A4
idIiAQC1EbHfmleONq4WmJB97wx/7vMADT07nIUFTke/sgtZNQD8Ct2t+84XEwFc
Vz0mMw6ikJavxUCDjqK5qWqCvCyOvg4=
=k2ie
-----END PGP SIGNATURE-----

--dPhCCSQmYZzqMW8E--
