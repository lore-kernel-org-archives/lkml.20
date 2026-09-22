Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73584078D2;
	Tue, 22 Sep 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066526; cv=none; b=ZNhYVppi6G6C0eX3ppUkeQTNf6jvH48h5B7sFuibYErHX4VWeFHioDUvuga0W4ogX5vTIYUFM0QQ8+EZMOyvfocQyyf6BD7Ty9ADAPS+R9xA60+fPqqARcZvWdN6j7k5GuO08IHLb/JqbUTQUIVhcHNAkV0ApxsdD+A3HkdruLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066526; c=relaxed/simple;
	bh=FFsjs4ESWmdts0zlqN6O8WEy/yRacfVrrc5HjsOyJCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d05YLUbWDhL8agbw3Y4icFn+Vm4wX5aryajBohMlUwmP6HwHet1KvKJKtSQ8kVB8kgrp+IPG1P+wTxgGPpqGr4OsL24H7RRfcJUIsEdy28aX3RuvR2U8St1rlFbYWJkae94+iIMpBCfh4Stwik2hbvHycMzcSrQsKh+f6QO7aSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFlRLSj/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFlRLSj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE281F000FF;
	Tue, 22 Sep 2026 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066524;
	bh=pnd03EBNuWEwjSdIig4kBY/EOnB3yq2LdeOMhSVSNvg=;
	h=Date:From:To:Cc:Subject;
	b=jFlRLSj/LACMEgMRob6IyDH7k3YEUnHyU4SL2qO+7I2dh7SkR2tqMk9CU0g7xIS5t
	 nQ/LKg7MoDbv3m5PYxRa3TblIXrU7xjtDYwhVkCenYjEaf4141dxllfBZ2rTp9QNEH
	 3VbT6zOF+QgZorqdXRBtFgQzjzJEgCGQCOeMcv7CjRTmOcthCrY0bpcSxTQ6npc/YU
	 L5chOtQaHnLM/vbr9CnaCynfWeOCl7oJRURdTGTu+tJg3I7Rb6eMT21hOdjND/BH/x
	 o862AWRZV7ksiggvCkbt4d8iQMaKz0xNGRsixJodyAeXO/Zomup1GtRBKc9dzGFnVI
	 7nVZjxH1nh/Mg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B4C891AC56BF; Tue, 22 Sep 2026 09:42:00 +0100 (BST)
Date: Tue, 22 Sep 2026 10:42:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Anna Schumaker <anna.schumaker@hammerspace.com>,
	Chuck Lever <cel@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the nfsd tree with the nfs-anna tree
Message-ID: <arI_WB7f4jx0kziZ@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pc+4+nKgVEbRsPzC"
Content-Disposition: inline


--Pc+4+nKgVEbRsPzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  net/sunrpc/xprtsock.c

between commits:

  ced837addad37 ("SUNRPC: fold xs_sock_process_cmsg() into its only caller")
  2e3f0f157f227 ("SUNRPC: treat every client-side TLS error alert as fatal")
  adc5399386f7b ("SUNRPC: reject a client-side TLS alert record that is not=
 two octets")

=66rom the nfs-anna tree and commits:

  21bcc6ccc6cd0 ("SUNRPC: Fold xs_sock_process_cmsg() into its only caller")
  6b91817001fb1 ("SUNRPC: Treat every client-side TLS error alert as fatal")
  91bdf2ae4a279 ("SUNRPC: Reject a client-side TLS alert record that is not=
 two octets")

=66rom the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(The comments were different, I took nfs-anna's version)

diff --combined net/sunrpc/xprtsock.c
index f5a5136327ba8,ca22ca8f2fea7..0000000000000
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@@ -386,20 -386,17 +386,20 @@@ xs_sock_recv_cmsg(struct socket *sock,=20
  		if (tls_get_record_type(sock->sk, &u.cmsg) !=3D
  		    TLS_RECORD_TYPE_ALERT)
  			return -EAGAIN;
 -		/* An Alert record carries exactly one two-octet message
 -		 * (RFC 8446 Section 5.1). alert_kvec caps the receive at
 -		 * two, so the count alone cannot reliably detect an
 -		 * oversized record.
 +		/* RFC 8446 Section 5.1: a record with an Alert type carries
 +		 * exactly one message, and an alert is two octets.
 +		 * tls_alert_recv() reads both without checking the length.
 +		 * alert_kvec caps the count at two, so a longer record
 +		 * fills it as well. kTLS sets MSG_EOR only once the
 +		 * record has been drained.
  		 */
  		if (ret !=3D sizeof(alert) || !(msg.msg_flags & MSG_EOR))
  			return -EACCES;
  		iov_iter_revert(&msg.msg_iter, ret);
  		tls_alert_recv(sock->sk, &msg, &level, &description);
  		/* RFC 8446 Section 6: every alert but a closure alert is
 -		 * an error alert.
 +		 * an error alert, whatever the legacy AlertLevel octet
 +		 * says.
  		 */
  		switch (description) {
  		case TLS_ALERT_DESC_CLOSE_NOTIFY:

--Pc+4+nKgVEbRsPzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyP1cACgkQJNaLcl1U
h9AJ+gf9FBOXNlVQfkrNyoPe8UM5lRDBZPECl2DuDctUveZUem/MmgKuxC3x0OC3
P2uemcUfxQTIpndDQmqDgadsJhIBNIFsYJ+tiXIbbh38bwG/pPzIetcPq2aJKeS5
WIlQfuAHholOj8p28Vq1sGcEYe6vI8GNq5o06k4SOLP5KNSn9UthaM1Okp6qVf7D
0xhgz9lmH/ALlI9fBh8rcq0LwjWsoMWrjaWP3hvNdysVYhDD4T1rs+z8TJawP6FZ
Y8y8fLninQ2bgAFYBvrQyDVaI+7JZRW6NrqO74dbEgIrhHWCVIf8IvIQm8tN0NEF
K+++wMSOBKxRUs/VZ5RqZO+ksb4cJQ==
=nMM3
-----END PGP SIGNATURE-----

--Pc+4+nKgVEbRsPzC--
