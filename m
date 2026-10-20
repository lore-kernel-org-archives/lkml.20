Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499257;
	b=hVr1bdGnXP0fyfxdqtgTbrVRkrHUpLWlNbFqidkzQ/qKhoIsIZJsO/T7+PPP8Gzd81NY
	 B4xU9OLfms9wjYPG2F+cfHv6h7+2vgKS24HTNtu2ao+g/CMShAaW1l6LEquuwDxzeb+Jl
	 MRbQtlB/PFmXZhW64B5EaYz8/cOHJTSX57y2AUlprhbVoG12rU0eaIkdHAKafFuDuppSR
	 ZfUNzyiFPUOB1/KhreuffBtQqhMEO9mHFIYMAkjA0w0YrgF45Hktij5Rc3wHUobcAiFfy
	 g2WrZJa3/yKBvUahyDiOYDv+tFUaDaC6jw/ZeddCO+V0LW4YdAn214Wo55OR7K2fxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499257;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=L1v052d8qMDLag8+odb7NTz38FPumz84h/F352bNnq8=;
	b=jT52F4Y/65UYvxPCoQEcBaKndbnnJ7ib117eJvbBw3UmN8ABfg4HPKzDglXymp0SMthN
	 zgFxFj3avqKe4E1a5/BtPlJQ6lnF6KJDr7bkzfAvqmYtmqsroI42VkCQewoIVJfwpMD5+
	 dhqlkbVg+XM8djl38pzfbFf5lFoshHv+JzvsgsVnbRbQxIbfZO/LvZ5sXz3LoAgZrNfex
	 BQo63N8cqym1z+Zn0IfLMcvZYXYgFvm/0qdHx6alnoWF6Td3BTvfD2+o+dfkntLBUubPb
	 yjYCdDbJYmTykV2R4zvyEh7A9nYCcne32oePqkacAux5cg6VTartDgAvdSk/gXCLp2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ac9X0yiH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C687E606A320;
	Tue, 20 Oct 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ac9X0yiH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB801F000C4;
	Tue, 20 Oct 2026 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499256;
	bh=L1v052d8qMDLag8+odb7NTz38FPumz84h/F352bNnq8=;
	h=Date:From:To:Cc:Subject;
	b=Ac9X0yiHCHzDB0uiusHtrC8VWUPe19x9gFZetkBBwO+XqeRS6ltT2MdkPe+iLyyNF
	 HUY00HJXOhxKRPefVRxnqfBDcPBPDYFrPx9zX/W/lBnZCgMtbRazvikZEblqyG1ae0
	 LfZ6xcRJzlXDgM+I9lyVKTa81OWNIRbjmr7tLKXXxC6IuwFRk1Rgl+0lmXhijuqOqh
	 8NpQRAiZNNggQPdhvz+3jkLCBVBdTn3S85HiWGCAywa3ccBELvslpbpbtSVCz7zzE5
	 ITmTo1mNKQWd0w2mNN0Ve63at7agsmLWKR9zFbOT3JRTA0HTCQ2jnbTuorjvayB5tu
	 BWNzA76xa7r3Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 46DDC1AC5994; Tue, 20 Oct 2026 13:27:34 +0100 (BST)
Date: Tue, 20 Oct 2026 13:27:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the rust tree
Message-ID: <atdeNvRKFuQd2qHz@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="TWQOKtDu1zPACboN"
Content-Disposition: inline


--TWQOKtDu1zPACboN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binder/thread.rs

between commit:

  a12f22b2c9398 ("rust_binder: use pr_*_ratelimited! for printing")

=66rom the rust tree and commit:

  985955d8e6b2b ("rust_binder: wake epoll on self-work queued to poll threa=
d")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/android/binder/thread.rs
index e0ed20f510fd1,177e90a1e5a3f..0000000000000
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@@ -344,13 -345,13 +345,13 @@@ impl InnerThread=20
          }
      }
 =20
-     fn push_return_work(&mut self, reply: u32) {
+     fn push_return_work(&mut self, reply: u32) -> PushWorkRes {
          if let Ok(work) =3D ListArc::try_from_arc(self.return_work.clone(=
)) {
              work.set_error_code(reply);
-             // Not notifying: Reply to current thread.
-             let _ =3D self.push_work(work);
+             self.push_work(work)
          } else {
 -            pr_warn!("Thread return work is already in use.");
 +            pr_warn_ratelimited!("Thread return work is already in use.\n=
");
+             PushWorkRes::Ok
          }
      }
 =20

--TWQOKtDu1zPACboN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdeNgAKCRAv73Ows9A4
iR59AQDlqUGZ6Vp+3/y0UQ78owUpIT+jhBd2nwa1ygn08VYnfgD9F2krcTtGbic0
f1pXPtLsMTnBLatpqZSldkj8fednbws=
=a/Xh
-----END PGP SIGNATURE-----

--TWQOKtDu1zPACboN--
