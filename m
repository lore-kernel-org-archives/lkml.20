Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5143B9D81;
	Tue, 15 Sep 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482995; cv=none; b=tZ02Oy2OQYSht5QR8A2uyBN5wQ6QJ7C2LA8CkqPPgGhxp2Ci60YIFBV1qeDiQDLEIkyFE2XV7Jv9OeWgw3QjQmIo+AX56nGkWPy27dslqjcHPH2b5dJsmwRGTqjL2q1w3Evwo3gvihqnPwrkVPBNFlAu4Dx69HxRIjx0RNjQOi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482995; c=relaxed/simple;
	bh=cnT2NDH0W3+AOUMlMBEWCpQelxBeGsZyc5CYQe5WgE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jc3a8FLNj1JO8InaPFMFDFqpElObZ6bX49M5ykOezNVZ2kQF//VURgglgdcDigQBCldjwanzi2DfrcjYPmJp+X7StljruUivWu5uuaPmc7ck6tDFImv4XhHwnKSDu8UQyQWwuVRzNaLS7J9RDAICEcPdSBYXWE3mwjju+9V4tGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8ElJrB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8ElJrB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674CF1F000FF;
	Tue, 15 Sep 2026 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482993;
	bh=pre5/60EdsoFZkP5TOwGJVFWOlszP98LTb5epi2ki04=;
	h=Date:From:To:Cc:Subject;
	b=j8ElJrB5V+9o+LZcYFz4zqm0Tq8+hnUpzLAhp/feErZU4vzNP9M10cnoEwNFH/kS3
	 TO0PObhPGpzA0M1WeWvLVgTEH/yy4IXNeJ9dMiFULZyJMOW/qjYNOdTIQqGdw1FaAs
	 HkbTS5vOqbZIZgRacvcZx1m4pUJUqWe+DvNqpL2ywvgPyBaMMk8ehfpqrnMwSHUEMs
	 8CFtmk0PZg7I5AzqZFdBsrajrIf+iOjyxbgeIM1sn1QuGSrSts9yJb+8k/dhyVeQib
	 GVF1vRmfIuUx3QuBsAJzmxrMX038nUg9dY6PWnuJNeu45wNgiucPb/VTw09iNMbJyu
	 05GNL1qZUZ+tg==
Date: Tue, 15 Sep 2026 15:36:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ath-next tree with the wireless tree
Message-ID: <aqlX7ecTiq6x0uMh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oVy3I7wzxgJhHRU8"
Content-Disposition: inline


--oVy3I7wzxgJhHRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/wifi7/ahb.c

between commit:

  ce9d5197d651c ("wifi: ath12k: ahb: Revert undocumented ABI and dead code")

=66rom the wireless tree and commit:

  c3bace8584ca7 ("wifi: ath12k: add support to load shared firmware on mult=
iPD")

=66rom the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 6e9e9034cba1a,a8f5cf8cc2a63..0000000000000
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@@ -57,7 -108,8 +59,8 @@@ static int ath12k_wifi7_ahb_probe(struc
  	ab->hw_rev =3D desc->hw_rev;
  	ab->hif.ops =3D desc->ops;
  	ab_ahb->scm_auth_enabled =3D desc->auth_enabled;
+ 	ab_ahb->supports_multipd =3D desc->supports_multipd;
 -	ab_ahb->userpd_id =3D ath12k_wifi7_ahb_get_userpd_id(ab);
 +	ab_ahb->userpd_id =3D ATH12K_AHB_USERPD_ID_0;
  	if (!ab_ahb->userpd_id)
  		return -EOPNOTSUPP;
 =20

--oVy3I7wzxgJhHRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpV+0ACgkQJNaLcl1U
h9DDPgf8CyjNTnzKVU1HignMgbwOc6nJKVE5GLApSRoQAB7dSjYGmMuPjABH6zvY
5PPjQfI/wXzyEeFWaMO6QgbnQhNZtOVe9LZoo5knWGYlb+P5JVRu+n1OZN/yfzrn
/Or4RiE0RR2TNF0Wyp9wpjgFGUxHwvOAotkkYSoN6BapjnfKR794nsrfVm4rxtUy
pG7ptYMIsgiBRadZD59Kv0NUryxEFZBSKV11t+XirVdFw6MQDKCJh72v2sXnivjC
lFdtNjy0ZDNpHBj7xsKpUZDos/skbGQTyRVfk5Xo05m1BpEQSfhkBtfsdXBeDVpl
9rkZfih1FWYbuqlVvp2RM2vEDG39ng==
=SBvH
-----END PGP SIGNATURE-----

--oVy3I7wzxgJhHRU8--
