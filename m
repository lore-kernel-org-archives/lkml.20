Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883913;
	b=rFe/NfeZaaQC6AuQ+bKrnVcKIhNk3zf7E9lsV4TEblfaUCI6UItKVHPf97xRjSSbWDYy
	 0oSjeBqcWRbfQT2Vqxk18KTpZCN6Piys8etJpAQwwo8KjeeEoRSM7uWcSiG2vlD/1Hnt0
	 GMaERyznSYBvX/J5ZXPRksbMQtjDgkyXon5bLrI7kdjDplBCBOTo7KYL0sU5OeBxiXhBQ
	 s1D7puqzjh5XUNLAXaLMb4DPK7af8c/7EbTTtiKwluHIANH5ud1s9OfoeQvAiZQ2AA6yk
	 Nn4tDBaZgJwQR9R0EcyT02flhihULdTqruGikA+PzMCLbLff10UMms2F0R5KrFSi5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883913;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=3RgQWlmxjKmIIIaRP+hCX7cVIije+8zVOuEZz3JeD74=;
	b=nIFlzbDy2jbYR4jIM1wXVBaerd4D4uuqUhnngQOv0glxv8uCxb871demh7nq7iTtoc0/
	 K69NSKT65ZH4rtWrJEpxz3qX9D7yXdk0jn4lN5cGFV72YP7rwEccdDxaeQpQbxuB6RSqJ
	 23vK18csWPP42T12/dP1LRSNZgpk4x+l1qNKPCNDV7PL/5k82Ck8tK18/ozvyxOjaR/ao
	 0sjzZO0hAG65Ay6guA/SgGDHXAaX81Kz/h7VAzNlGgeeZ7wA4oc41zvku8i5mXIONOVaW
	 PtP5i4O/RkeQBHY/LrRnKG5sUlR4vuRDv2GBTXWC/4pICWNrOc0q2aMz4l3SzmzAtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BukH0N2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A434606A335;
	Thu,  5 Nov 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BukH0N2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103D21F00A17;
	Thu,  5 Nov 2026 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883912;
	bh=3RgQWlmxjKmIIIaRP+hCX7cVIije+8zVOuEZz3JeD74=;
	h=Date:From:To:Cc:Subject;
	b=BukH0N2fCETNXA66jDzpOA0i4+m17lLR1TYpBzvT0XW9HDiBvX3GqEpXIN7TsObNl
	 qfqKjKsHytAK/dCoyTN4DmhfnyI6Khatb8msr0u2T1CwK/B3YJL3J51WM20Qrav47U
	 km7e7/RmcvQr7G2tf8mE5LpAMn4iin9HHFBmDw9a8LPK4qxCBA62VQMxMQFpFD5uRC
	 NsB+fSisuwSBBe/Vny6uZULUiBxNUOYBZDpqnklk5ZBA9rQnsSz2anCrJ9/my7rf7A
	 RtoogUiOErtdvGfYhTbwyoJJeTfmxbg68SW+c/iAjNso8kw5tmLh+885YGAl0hxCb+
	 EGglWqKqMeVOQ==
Date: Thu, 5 Nov 2026 13:05:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <greg@kroah.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivy Lopez <skunkolee@gmail.com>, Josef Bacik <josef@toxicpanda.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the w1 tree with the char-misc.current
 tree
Message-ID: <aux_BMw8rXApWEu6@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="9R7HviFh8MulKpa5"
Content-Disposition: inline


--9R7HviFh8MulKpa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the w1 tree got a conflict in:

  drivers/w1/masters/ds2482.c

between commit:

  e4f673632fa82 ("w1: ds2482: set the strong pull-up with its byte")

=66rom the char-misc.current tree and commit:

  8847bbf3adfc5 ("w1: fix spelling mistakes in comments across the subsyste=
m")

=66rom the w1 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/w1/masters/ds2482.c
index 5498bb04f7cec,70854336a1731..0000000000000
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@@ -437,16 -423,24 +437,16 @@@ static u8 ds2482_w1_set_pullup(void *da
 =20
  	/* if delay is non-zero activate the pullup,
  	 * the strong pullup will be automatically deactivated
- 	 * by the master, so do not explicitly deactive it
+ 	 * by the master, so do not explicitly deactivate it
 +	 *
 +	 * The setting is used up by the next byte on any channel of the chip:
 +	 * ds2482_w1_write_byte() makes it, in one go with the byte.
  	 */
 -	if (delay) {
 -		/* both waits are crucial, otherwise devices might not be
 -		 * powered long enough, causing e.g. a w1_therm sensor to
 -		 * provide wrong conversion results
 -		 */
 -		ds2482_wait_1wire_idle(pdev);
 -		/* note: it seems like both SPU and APU have to be set! */
 -		retval =3D ds2482_send_cmd_data(pdev, DS2482_CMD_WRITE_CONFIG,
 -			ds2482_calculate_config(DS2482_REG_CFG_SPU |
 -						DS2482_REG_CFG_APU));
 -		ds2482_wait_1wire_idle(pdev);
 -	}
 +	if (!delay)
 +		return 1;
 =20
 -	return retval;
 +	pchan->spu =3D true;
 +	return 0;
  }
 =20
 =20

--9R7HviFh8MulKpa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrsfwMACgkQJNaLcl1U
h9BOhgf+Ne7LH5lVBBM1f4bSreJmCPTjHajTkiQTLTI/U8GspLKDixbnowDAX/Mg
1OVg4Ktia9BbYmT2w2j/BEiFfvEq4yZDwopUyAlvnl1fEMw4I+3dhWQ/FPd6UMbw
QR2dad1vZjZB6mB4ZkO8KYXWjI4JNfmC7IemjZaIsHeNASmWgEERO6uefucJXIgJ
uODZcaTG4V0soM2ZSA92vguwa54lX0PBuSAE6rWGhOe/4OmdHaCDgpiWjHRPP5Ha
gLMPL4LhRGelggrSokzdlS3h/6DD69tDaiBTAla6VqdnNd9m8gSvkZZa7HQwXaB7
XRKUt3fsfV/lEcjwn8+3LywuVrzhYQ==
=f/lE
-----END PGP SIGNATURE-----

--9R7HviFh8MulKpa5--
