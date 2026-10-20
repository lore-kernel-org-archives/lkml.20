Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499242;
	b=mVgsfmsoo3ptuVVP56O4Bx0JIriwM5ezKVCMACJXHTI6mgw8aJ05yM1srU8cKmf9AM+3
	 EA+nV33GOwkJHRqx17k8vUOC+/l8yMtMXubHCB99zvNV0qjy0WDbkvQYP6R3mBEs/cMNY
	 5/WriO/KODqGVf4rhqsBymQyWclr3tEADA43yt6MlwhaVth6TlingT06U3gK+DrFd+Imp
	 COJU8r7csbmeAmxMhJTkaQ1UjrRLcNFQpcMs0DmU56R0a4HSjs/qOFuUuk0GOLxTez/BJ
	 K0olJCdZpW/3bohdF47SlF+hClzrlrMv0IhxOlNgqHVpGnAYAVNtd0ceIN1NbmVYOOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499242;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=EtsZ8r/SGiyK0hppa0l+VctodUPOQfcuG0Rd9GxCXh0=;
	b=twUvnlFhe0JfNTAUHYXYuKg3HJT3rd36P0W0xGYgTL8gzAt5vLjSNKqZ5YgzD2RuU/cn
	 bnProdg6EJy7JNm6IuoOAaCQcBiqK0EYbwGedCG4dGaNnOvoinLm096tHmULvoDSYG2h4
	 75hDwF//RJp9QGtmzgCNS2SHaZVuQUz4k9fGLXGqw5LCxKwGHzSaCN4SV57GZ8axBBKmp
	 JBq5kzV70kmsimTkK7tiWbOSzfqSpQLWDacicYe6Kr4VhC/3rwkorHunjQNMOvvhJ9MBo
	 ljLQOwJ92Ynnjf1KvQmLyBrpRLDlTdXE3qVxDSjmK25niOt7g/O1ETHly78Qqplm+OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MDL/dPqy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607E606A32A;
	Tue, 20 Oct 2026 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDL/dPqy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3D21F000C8;
	Tue, 20 Oct 2026 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499242;
	bh=EtsZ8r/SGiyK0hppa0l+VctodUPOQfcuG0Rd9GxCXh0=;
	h=Date:From:To:Cc:Subject;
	b=MDL/dPqyQHJkYjBPG9v0ZsMTNag+ZvOkBPkTkKPtli2iriMem5EJFW+GFkRKXT3LG
	 o6l56EJvHtpRoF/jHhDTEjIz9WLgyxNvTSDUq9kS3bJZwRBrHTI3OzP4OKItRym0Vm
	 TRCWSynbE6BiW4RiIjqrnVIGUe5NNhkFO9YlF0UN/wS+k10Vccea6TGXhJ5xs8bxu5
	 0rXkMBi5z5y+LyqJbNHl5pEQyNUIY0nmTK84gRBuq35l7Sqaj+p9fJU6vjfjGeAaDR
	 atowAvlwMEeAYq+wDQYMOs8twZmx1TPRIrQ6oUr1UlcFdJb7cb8bEaojnLm5Vo5LIT
	 psAKArmOteHYw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA9311AC5994; Tue, 20 Oct 2026 13:27:19 +0100 (BST)
Date: Tue, 20 Oct 2026 13:27:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Tal Zussman <tz2294@columbia.edu>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the block tree with the mm tree
Message-ID: <atdeJ-91RQrqLke6@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="vOS7LxOfm8CwR0Zn"
Content-Disposition: inline


--vOS7LxOfm8CwR0Zn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/bio.c

between commit:

  d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned b=
io")

=66rom the mm tree and commit:

  73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages(=
)")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc block/bio.c
index f5f866bfd89e4,8b3f6dc075275..0000000000000
--- a/block/bio.c
+++ b/block/bio.c
@@@ -1308,7 -1345,7 +1345,8 @@@ int bio_iov_iter_get_pages(struct bio *
  			   unsigned len_align_mask)
  {
  	iov_iter_extraction_t flags =3D 0;
 +	struct iov_iter saved_iter;
+ 	int ret;
 =20
  	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
  		return -EIO;
@@@ -1329,11 -1366,10 +1367,11 @@@
  	if (bio->bi_bdev && blk_queue_pci_p2pdma(bio->bi_bdev->bd_disk->queue))
  		flags |=3D ITER_ALLOW_P2PDMA;
 =20
 +	saved_iter =3D *iter;
  	do {
- 		ssize_t ret;
+ 		ssize_t size;
 =20
- 		ret =3D iov_iter_extract_bvecs(iter, bio->bi_io_vec,
+ 		size =3D iov_iter_extract_bvecs(iter, bio->bi_io_vec,
  				maxlen - bio->bi_iter.bi_size,
  				&bio->bi_vcnt, bio->bi_max_vecs,
  				mem_align_mask, flags);
@@@ -1358,7 -1386,27 +1388,28 @@@
 =20
  	if (is_pci_p2pdma_page(bio->bi_io_vec->bv_page))
  		bio->bi_opf |=3D REQ_NOMERGE;
- 	return bio_iov_iter_align_down(bio, iter, len_align_mask);
+ 	ret =3D bio_iov_iter_align_down(bio, iter, len_align_mask);
+ 	if (ret)
+ 		return ret;
+=20
+ 	/*
+ 	 * An atomic write is submitted as a single bio, so it has to cover
+ 	 * the whole iterator or it would be torn.
+ 	 */
+ 	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter))
+ 		goto out_release_pages;
+ 	return 0;
+=20
+ out_release_pages:
+ 	/*
+ 	 * Release the pages pinned so far before failing, since this bio won't
+ 	 * be submitted to release them.
+ 	 */
+ 	bio_release_pages(bio, false);
+ 	bio_clear_flag(bio, BIO_PAGE_PINNED);
+ 	bio->bi_vcnt =3D 0;
++	*iter =3D saved_iter;
+ 	return -EINVAL;
  }
 =20
  static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,

--vOS7LxOfm8CwR0Zn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdeJwAKCRAv73Ows9A4
idJjAP9j/pDIwdiWjc/uxgewi3SmmnYV6NkqyZFx/YwD63vkvQEA6z4i50YlRv/w
w9q4Pb8YglO6Rhvts0+ta2F72vYBMQo=
=up0d
-----END PGP SIGNATURE-----

--vOS7LxOfm8CwR0Zn--
