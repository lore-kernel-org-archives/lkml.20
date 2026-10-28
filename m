Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189381;
	b=LZ+yVC9k8NjKHs77B6cjRjG9NPI+auJDJCuUl6ysHRWFy4qOoczgUzaAsX6mzxl5PUDS
	 hRSWu4gF11VpXBUGTyv3vioPO4++vGrDyFvDYJ9ksPlVH0SRHoObuZyr7m/r0+JksK+bF
	 k6gTvvVEo+avGY7oZsnr9Hi1IMFBVUsCWRg+jfzetrvcj6TNxUOQUOeQDpPNKYXKsOQxR
	 p+vIl8ZXm4bZM/k8wb5MX5Q9K/Vlg4QdC8SpkFOSX/R6hJ+G/xQnvVMRTMC+lKyPJIL9I
	 kqmbUNenzjLaj6Ic2EoNotT3sfH5vlYWxm2s98sRGMOXoSeUESmlyUOrIXYzvw8ccMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189381;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=44FPlCOhpyB0hJOLZ9zbUC0W/Kn741CvEID6oPt0c9s=;
	b=IQV3+t0Xy7ohMVBurt5EMrkU4Bv6tzLo6KmI565LhqLUTyv4jmsXr8oQ0uTjg4ZWb5jQ
	 lPKd41fMdDW3mzDG6kXxWCT3lyz3R/qZaKF0ItGkSFeSb4S/opI1lythrzQSqt9Eq4nbJ
	 U/FdVW4CQCXxIXcyeoh0J3sQSs+oiNl1BZ1qnph9Uqt8wmb2JA/Yp+fprAdV57sUSjrpG
	 aPSGSekIi8qu26tJqwZ8DVE7NZAXTnTPJvBTD6JhJnyj5HXvYFf2dpmSeNpWsUAh6XUqU
	 zCaDhQSu9YrpSUM6W+zHX0UpeKpzIHdBYUgTfynxYanNOx3hFpTDFSVhtK48KyoQOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OO+BPV9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC6606A31A;
	Wed, 28 Oct 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OO+BPV9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F4F1F01825;
	Wed, 28 Oct 2026 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189380;
	bh=44FPlCOhpyB0hJOLZ9zbUC0W/Kn741CvEID6oPt0c9s=;
	h=Date:From:To:Cc:Subject;
	b=OO+BPV9bly7Yefmq6IsHn+YrDijOaVxj29lqAOdowgNFQuqifWuRkpQvXfwjFwJga
	 gC8Jht+R8nt1lUHduPJ3IZiKvtmUzeLVGfiSKqKGDF2TURi/R4xzhsKGzBSXzzfPZE
	 YYN4W5akMSAJ/E3OS2hbvo2FLAh6lj5/wk8/ftSRTZZV/HrvtCoKtQt8W4ppdVUJZa
	 Nf5I371acQuhWwxUvKxdpVI70JSNa1dO7yvqws7u5WjsxFXvYypDBHNoCPoTKc+WN2
	 xHW5+oLjh6FhM0bmrV+esUbNAKi/T8crHDBRXJUFSOrPdvlpwYO4PEeKloG556QkOi
	 6B2N/NPwDCBhw==
Date: Wed, 28 Oct 2026 12:09:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tal Zussman <tz2294@columbia.edu>, Zi Yan <ziy@nvidia.com>
Subject: linux-next: manual merge of the ceph tree with the origin tree
Message-ID: <auHmABrM3hZnrSVf@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="FEPWsNLghj1XOFXc"
Content-Disposition: inline


--FEPWsNLghj1XOFXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the ceph tree got a conflict in:

  fs/ceph/addr.c

between commit:

  6d1a85b306729 ("ceph: replace PagePrivate() with page_private()")

=66rom the origin tree and commit:

  81a949790a690 ("ceph: add ceph_folio_snap_context()")

=66rom the ceph tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ceph/addr.c
index 21d52d8498424,259e317981558..0000000000000
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@@ -65,12 -65,13 +65,13 @@@
  	(CONGESTION_ON_THRESH(congestion_kb) -				\
  	 (CONGESTION_ON_THRESH(congestion_kb) >> 2))
 =20
 -static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, un=
signed int len,
 +static int ceph_netfs_check_write_begin(struct file *file, uoff_t pos, un=
signed int len,
  					struct folio **foliop, void **_fsdata);
 =20
- static inline struct ceph_snap_context *page_snap_context(struct page *pa=
ge)
+ static inline
+ struct ceph_snap_context *ceph_folio_snap_context(const struct folio *fol=
io)
  {
- 	return (void *)page_private(page);
+ 	return folio->private;
  }
 =20
  /*

--FEPWsNLghj1XOFXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh5f8ACgkQJNaLcl1U
h9DNOwf/ahUIjtxYXnRNCNuEOCBWC8JbBYqGLHZqsuSn8G7DbUh7QdyonoQviu9t
QgMYWMYfKDbaEmotzhuxpd2x89H0r0rEbHvGrtpglH4+y9Btpw2hv2Z0HUVBKzhF
Q7rKTCakVcVEEmub5Jml7s8XRFSpJnVm3KTpH3DzIr+uc+FxvIOG1YcNPLCrzkmL
ao5z+Z1d4RFkMyHFzwlDew8zJww1WB5FH6blTQgGZ7tbQ+hsJFRF/b8wPdEVHZDh
pAwc6iIkQY/Gyt5IGmmyrpjQetr3HbTy+oaNjH2MAVumsa9kg97kTweSKYas3NtS
sJVBRWeeHZWq547MMUZyXWSGqadoFg==
=yUkR
-----END PGP SIGNATURE-----

--FEPWsNLghj1XOFXc--
