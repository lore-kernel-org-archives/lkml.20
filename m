Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3451FCB2;
	Tue, 13 Oct 2026 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910147; cv=none; b=aOpYXAlJ1ZEXPoFcwm6921loXYR2aXYuccXICgxGP6NSlI1QrDN0M0YoNU04NutsfRpaKU1C7I26xrXIP0bZdu4F0g5HYCUSjxbZ5HhbiZaATbxhhlX/28kP3bFf1F0twBqkbkdb6B/c30Q3I3XM6YigCQd5tfxY5EsK/t9t7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910147; c=relaxed/simple;
	bh=4tuxXnaf6uxMCZG/TOhCmny2Ps0CtLEBX6nq8ARx7Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIwaFKEQ3rbFQ34ZbCdv5FkFIW2xASOBmEIEbafWtd+gmD1N1qk8xh/5ItGt0aXNhgpo6X8wLW/Zdbn3k+e3rpTpX4xb06VzFanKnaNRosHr/IQCIeNwkZypq9oh17xDDFVVW4JYDqT/Xk3fcrBuKpmWhBzIfBZxrijFrt5ICpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MV8qtdH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MV8qtdH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2247A1F000FF;
	Tue, 13 Oct 2026 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910145;
	bh=SGzotbvqbuqaim8zpJpEFD2bdh/G3cc6X0UT2YzceZE=;
	h=Date:From:To:Cc:Subject;
	b=MV8qtdH7g2grTdsW9Ib+y6poVGbZvtuLzcBQopJfQ6AkwrY1e+zMpbV4iHwbked1O
	 5RzevGOjXX9EYr5n/N+Kz/n1CBEesXnFL0ZxGF14rVNIPDEM0Vb2e4yST8flWngXZa
	 /bqLzr09WILiQux1X4dwb+40V7+o/RnZZyBSMYFEJlgDOpK0LrXJoDL4kJkg/ogP5c
	 y2NNfJKQI7V3eU04HjU08/7bAwmEGagejYpkGMTTcataYuvtyhaM3Pf3ar7AV2yIkn
	 cMfj3J9WrvbvHdb2rLF9BM7Z3nUE1FZYWwxD8T4k5GB+x3+edogtGM0+xMZ/ffOdyi
	 LNfLcAG0++L5w==
Date: Tue, 13 Oct 2026 17:49:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <as5g_SH0Y8TTC3J3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gmXTgqZlqFIU6FBH"
Content-Disposition: inline


--gmXTgqZlqFIU6FBH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/uio.h

between commit:

  58194689921d8 ("iov_iter: Remove ITER_FOLIOQ")

=66rom the vfs-brauner tree and commit:

  f41f84796a112 ("iov_iter: add iterator type for dmabuf maps")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/uio.h
index 8d82a8258ef11,638c1116e912e..0000000000000
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@@ -11,6 -11,8 +11,7 @@@
  #include <uapi/linux/uio.h>
 =20
  struct page;
 -struct folio_queue;
+ struct dma_buf_io_map;
 =20
  typedef unsigned int __bitwise iov_iter_extraction_t;
 =20
@@@ -25,9 -27,10 +26,10 @@@ enum iter_type=20
  	ITER_IOVEC,
  	ITER_BVEC,
  	ITER_KVEC,
 -	ITER_FOLIOQ,
 +	ITER_BVECQ,
  	ITER_XARRAY,
  	ITER_DISCARD,
+ 	ITER_DMABUF_MAP,
  };
 =20
  #define ITER_SOURCE	1	// =3D=3D WRITE
@@@ -67,9 -70,10 +69,10 @@@ struct iov_iter=20
  				const struct iovec *__iov;
  				const struct kvec *kvec;
  				const struct bio_vec *bvec;
 -				const struct folio_queue *folioq;
 +				const struct bvecq *bvecq;
  				struct xarray *xarray;
  				void __user *ubuf;
+ 				struct dma_buf_io_map *dmabuf_map;
  			};
  			size_t count;
  		};
@@@ -294,11 -303,14 +302,14 @@@ void iov_iter_kvec(struct iov_iter *i,=20
  void iov_iter_bvec(struct iov_iter *i, unsigned int direction, const stru=
ct bio_vec *bvec,
  			unsigned long nr_segs, size_t count);
  void iov_iter_discard(struct iov_iter *i, unsigned int direction, size_t =
count);
 -void iov_iter_folio_queue(struct iov_iter *i, unsigned int direction,
 -			  const struct folio_queue *folioq,
 -			  unsigned int first_slot, unsigned int offset, size_t count);
 +void iov_iter_bvec_queue(struct iov_iter *i, unsigned int direction,
 +			 const struct bvecq *bvecq,
 +			 unsigned int first_slot, unsigned int offset, size_t count);
  void iov_iter_xarray(struct iov_iter *i, unsigned int direction, struct x=
array *xarray,
  		     loff_t start, size_t count);
+ void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+ 			struct dma_buf_io_map *map,
+ 			loff_t off, size_t count);
  ssize_t iov_iter_get_pages2(struct iov_iter *i, struct page **pages,
  			size_t maxsize, unsigned maxpages, size_t *start);
  ssize_t iov_iter_get_pages_alloc2(struct iov_iter *i, struct page ***page=
s,

--gmXTgqZlqFIU6FBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOYPwACgkQJNaLcl1U
h9Dv1gf/TXh1jgzPAVWBnV8oiSVDBjhWUfXE0JE/FgTIG1p/nBmTHO5QeWt3P5ro
ki25s0MHkKmE602SDYEuigT+697nCvx4bbQY4unlTprB4MjBwovR/uUd0wpib8bA
mZiwNDcWpW1VEBSkWnoCQyZu51QYU8sWDWH9hjRiyzolu6eUTh8G8RCfgxyNbPqb
zUSSRw0UiykNqO4BMzyuUGRvuVQDtObLAliV+qMVtoFIn4N+Jx0VIPOxYw6M4yW8
HBv58GyFTOXpUCJH9leIZPt4H36YWicBmHN5sLKDrUG72WRnIo0ouGeYw51Lb5ml
QrjPu0vTb/qTi7qVY+yNoUSLH4Vnew==
=qp06
-----END PGP SIGNATURE-----

--gmXTgqZlqFIU6FBH--
