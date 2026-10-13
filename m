Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011A41F5C7;
	Tue, 13 Oct 2026 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910840; cv=none; b=l+mt5KPWtEmQRdO4spGiJSknGxGLYvDV1IV9jOyaFbGAOMfiA1hysWucePzyHVlK01G78kJOeGQctUIr3jaCU7q80w9wzjtjIlgjWcTlk3TqbeYLQAn8dUxiQTrPZxZp1eAWXWA/gK6SCXAu/hWKQ0mKXJnz+Avu/z23wrT5hKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910840; c=relaxed/simple;
	bh=Iqbwx/CbIlQoqVgWE7oywqNoNffH8VyTU6SHfyafiqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDHyhpCdbp92GwLH8268TLJ+E2qPfINCHw3sLQp+b1sdjyVpfLjGsgZL1VFBAT5p87ALTlFgyKzYcOtoPTgVEvS2PENpZXx9IzKhmYkm/yvZXzeekClpFbKsKKf+vf9Lj7AnmG3kefF5cT8QunllO1w3o5EXRvLGzPiBqcg7csg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VK9TE4Hm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VK9TE4Hm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756B1F000FF;
	Tue, 13 Oct 2026 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910838;
	bh=OwD/NxgVGso+rnqoQSlZ8YYZGYv52l9wdG3DBRW1ivU=;
	h=Date:From:To:Cc:Subject;
	b=VK9TE4HmOJN8ZVF3N+xKOR6WMiw1Y2ieI0arVecitlidBAUVFMQocMLnTsFxZh8uH
	 HYC4HjuuteMCswXnEuCF3YQDFYE1shNhG65WFAc/ZGyvspeP9UXdfDbnTeqTTXFqVu
	 zqfjECtYzIDmwv3LrDeMA3l6GDgo3+SEgM2vl7c9JkneRWrfVYOr3UYD0piX1UAHrW
	 wP5dtqgif15LS+kP1fR0778W9DEVBCeHHUIkPLXnEQkSpyBnnD+svzDfToFbYD1l7d
	 Y7II+8xjFyNcPn8cbDY6vNeXH/Iw0EFDVZQi6R2DoJe+S6/MnZEn5AJMHxGi3yP1FG
	 3oZdsPiiSf0OA==
Date: Tue, 13 Oct 2026 18:00:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <as5jshrJawQ6M1Mv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2R5WbIykSaLbUi/"
Content-Disposition: inline


--J2R5WbIykSaLbUi/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  lib/iov_iter.c

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

diff --combined lib/iov_iter.c
index 72cef6a79c3eb,6831a5d9396e1..0000000000000
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@@ -538,45 -538,45 +538,46 @@@ static void iov_iter_iovec_advance(stru
  	i->__iov =3D iov;
  }
 =20
 -static void iov_iter_folioq_advance(struct iov_iter *i, size_t size)
 +static void iov_iter_bvecq_advance(struct iov_iter *i, size_t by)
  {
 -	const struct folio_queue *folioq =3D i->folioq;
 -	unsigned int slot =3D i->folioq_slot;
 +	const struct bvecq *bq =3D i->bvecq;
 +	unsigned int slot =3D i->bvecq_slot;
 =20
  	if (!i->count)
  		return;
 -	i->count -=3D size;
 +	i->count -=3D by;
 =20
 -	if (slot >=3D folioq_nr_slots(folioq)) {
 -		folioq =3D folioq->next;
 -		slot =3D 0;
 -	}
 -
 -	size +=3D i->iov_offset; /* From beginning of current segment. */
 +	by +=3D i->iov_offset; /* From beginning of current segment. */
  	do {
 -		size_t fsize =3D folioq_folio_size(folioq, slot);
 +		size_t len;
 =20
 -		if (likely(size < fsize))
 -			break;
 -		size -=3D fsize;
 -		slot++;
 -		if (slot >=3D folioq_nr_slots(folioq) && folioq->next) {
 -			folioq =3D folioq->next;
 +		if (slot >=3D bq->nr_slots) {
 +			if (!bq->next)
 +				break;
 +			bq =3D bq->next;
  			slot =3D 0;
 +			continue;
  		}
 -	} while (size);
 =20
 -	i->iov_offset =3D size;
 -	i->folioq_slot =3D slot;
 -	i->folioq =3D folioq;
 +		len =3D bq->bv[slot].bv_len;
 +
 +		if (likely(by < len))
 +			break;
 +		by -=3D len;
 +		slot++;
 +	} while (by);
 +
 +	i->iov_offset =3D by;
 +	i->bvecq_slot =3D slot;
 +	i->bvecq =3D bq;
  }
 =20
  void iov_iter_advance(struct iov_iter *i, size_t size)
  {
  	if (unlikely(i->count < size))
  		size =3D i->count;
- 	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i))) {
+ 	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i)) ||
+ 	    unlikely(iov_iter_is_dmabuf_map(i))) {
  		i->iov_offset +=3D size;
  		i->count -=3D size;
  	} else if (likely(iter_is_iovec(i) || iov_iter_is_kvec(i))) {
@@@ -584,39 -584,38 +585,39 @@@
  		iov_iter_iovec_advance(i, size);
  	} else if (iov_iter_is_bvec(i)) {
  		iov_iter_bvec_advance(i, size);
 -	} else if (iov_iter_is_folioq(i)) {
 -		iov_iter_folioq_advance(i, size);
 +	} else if (iov_iter_is_bvecq(i)) {
 +		iov_iter_bvecq_advance(i, size);
  	} else if (iov_iter_is_discard(i)) {
  		i->count -=3D size;
  	}
  }
  EXPORT_SYMBOL(iov_iter_advance);
 =20
 -static void iov_iter_folioq_revert(struct iov_iter *i, size_t unroll)
 +static void iov_iter_bvecq_revert(struct iov_iter *i, size_t unroll)
  {
 -	const struct folio_queue *folioq =3D i->folioq;
 -	unsigned int slot =3D i->folioq_slot;
 +	const struct bvecq *bq =3D i->bvecq;
 +	unsigned int slot =3D i->bvecq_slot;
 =20
  	for (;;) {
 -		size_t fsize;
 +		size_t len;
 =20
  		if (slot =3D=3D 0) {
 -			folioq =3D folioq->prev;
 -			slot =3D folioq_nr_slots(folioq);
 +			bq =3D bq->prev;
 +			slot =3D bq->nr_slots;
 +			continue;
  		}
  		slot--;
 =20
 -		fsize =3D folioq_folio_size(folioq, slot);
 -		if (unroll <=3D fsize) {
 -			i->iov_offset =3D fsize - unroll;
 +		len =3D bq->bv[slot].bv_len;
 +		if (unroll <=3D len) {
 +			i->iov_offset =3D len - unroll;
  			break;
  		}
 -		unroll -=3D fsize;
 +		unroll -=3D len;
  	}
 =20
 -	i->folioq_slot =3D slot;
 -	i->folioq =3D folioq;
 +	i->bvecq_slot =3D slot;
 +	i->bvecq =3D bq;
  }
 =20
  void iov_iter_revert(struct iov_iter *i, size_t unroll)
@@@ -633,7 -632,8 +634,8 @@@
  		return;
  	}
  	unroll -=3D i->iov_offset;
- 	if (iov_iter_is_xarray(i) || iter_is_ubuf(i)) {
+ 	if (iov_iter_is_xarray(i) || iter_is_ubuf(i) ||
+ 	    iov_iter_is_dmabuf_map(i)) {
  		BUG(); /* We should never go beyond the start of the specified
  			* range since we might then be straying into pages that
  			* aren't pinned.
@@@ -650,9 -650,9 +652,9 @@@
  			}
  			unroll -=3D n;
  		}
 -	} else if (iov_iter_is_folioq(i)) {
 +	} else if (iov_iter_is_bvecq(i)) {
  		i->iov_offset =3D 0;
 -		iov_iter_folioq_revert(i, unroll);
 +		iov_iter_bvecq_revert(i, unroll);
  	} else { /* same logics for iovec and kvec */
  		const struct iovec *iov =3D iter_iov(i);
  		while (1) {
@@@ -680,28 -680,9 +682,28 @@@ size_t iov_iter_single_seg_count(const=20
  		if (iov_iter_is_bvec(i))
  			return min(i->count, i->bvec->bv_len - i->iov_offset);
  	}
 -	if (unlikely(iov_iter_is_folioq(i)))
 -		return !i->count ? 0 :
 -			umin(folioq_folio_size(i->folioq, i->folioq_slot), i->count);
 +	if (!i->count)
 +		return 0;
 +	if (unlikely(iov_iter_is_bvecq(i))) {
 +		const struct bvecq *bq =3D i->bvecq;
 +		unsigned int slot =3D i->bvecq_slot;
 +		size_t offset =3D i->iov_offset;
 +
 +		for (;;) {
 +			while (slot >=3D bq->nr_slots) {
 +				bq =3D bq->next;
 +				if (!bq)
 +					return 0;
 +				slot =3D 0;
 +				offset =3D 0;
 +			}
 +			if (bq->bv[slot].bv_len > offset)
 +				break;
 +			slot++;
 +			offset =3D 0;
 +		}
 +		return min(i->count, bq->bv[slot].bv_len - offset);
 +	}
  	return i->count;
  }
  EXPORT_SYMBOL(iov_iter_single_seg_count);
@@@ -739,33 -720,34 +741,33 @@@ void iov_iter_bvec(struct iov_iter *i,=20
  EXPORT_SYMBOL(iov_iter_bvec);
 =20
  /**
 - * iov_iter_folio_queue - Initialise an I/O iterator to use the folios in=
 a folio queue
 + * iov_iter_bvec_queue - Initialise an I/O iterator to use a segmented bv=
ec queue
   * @i: The iterator to initialise.
   * @direction: The direction of the transfer.
 - * @folioq: The starting point in the folio queue.
 - * @first_slot: The first slot in the folio queue to use
 - * @offset: The offset into the folio in the first slot to start at
 + * @bvecq: The starting point in the bvec queue.
 + * @first_slot: The first slot in the bvec queue to use
 + * @offset: The offset into the bvec in the first slot to start at
   * @count: The size of the I/O buffer in bytes.
   *
 - * Set up an I/O iterator to either draw data out of the pages attached t=
o an
 - * inode or to inject data into those pages.  The pages *must* be prevent=
ed
 - * from evaporation, either by taking a ref on them or locking them by the
 - * caller.
 + * Set up an I/O iterator to either draw data out of the buffers attached=
 to an
 + * inode or to inject data into those buffers.  The pages *must* be preve=
nted
 + * from evaporation, either by the caller.
   */
 -void iov_iter_folio_queue(struct iov_iter *i, unsigned int direction,
 -			  const struct folio_queue *folioq, unsigned int first_slot,
 -			  unsigned int offset, size_t count)
 +void iov_iter_bvec_queue(struct iov_iter *i, unsigned int direction,
 +			 const struct bvecq *bvecq, unsigned int first_slot,
 +			 unsigned int offset, size_t count)
  {
 -	BUG_ON(direction & ~1);
 +	WARN_ON(direction & ~(READ | WRITE));
  	*i =3D (struct iov_iter) {
 -		.iter_type =3D ITER_FOLIOQ,
 -		.data_source =3D direction,
 -		.folioq =3D folioq,
 -		.folioq_slot =3D first_slot,
 -		.count =3D count,
 -		.iov_offset =3D offset,
 +		.iter_type	=3D ITER_BVECQ,
 +		.data_source	=3D direction,
 +		.bvecq		=3D bvecq,
 +		.bvecq_slot	=3D first_slot,
 +		.count		=3D count,
 +		.iov_offset	=3D offset,
  	};
  }
 -EXPORT_SYMBOL(iov_iter_folio_queue);
 +EXPORT_SYMBOL(iov_iter_bvec_queue);
 =20
  /**
   * iov_iter_xarray - Initialise an I/O iterator to use the pages in an xa=
rray
@@@ -795,6 -777,20 +797,20 @@@ void iov_iter_xarray(struct iov_iter *i
  }
  EXPORT_SYMBOL(iov_iter_xarray);
 =20
+ void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+ 			 struct dma_buf_io_map *map,
+ 			 loff_t off, size_t count)
+ {
+ 	WARN_ON(direction & ~(READ | WRITE));
+ 	*i =3D (struct iov_iter){
+ 		.iter_type =3D ITER_DMABUF_MAP,
+ 		.data_source =3D direction,
+ 		.dmabuf_map =3D map,
+ 		.count =3D count,
+ 		.iov_offset =3D off,
+ 	};
+ }
+=20
  /**
   * iov_iter_discard - Initialise an I/O iterator that discards data
   * @i: The iterator to initialise.
@@@ -859,39 -855,6 +875,39 @@@ static unsigned long iov_iter_alignment
  	return res;
  }
 =20
 +static unsigned long iov_iter_alignment_bvecq(const struct iov_iter *iter)
 +{
 +	const struct bvecq *bq;
 +	unsigned long res =3D 0;
 +	unsigned int slot =3D iter->bvecq_slot;
 +	size_t skip =3D iter->iov_offset;
 +	size_t size =3D iter->count;
 +
 +	if (!size)
 +		return res;
 +
 +	for (bq =3D iter->bvecq; bq; bq =3D bq->next) {
 +		for (; slot < bq->nr_slots; slot++) {
 +			const struct bio_vec *bvec =3D &bq->bv[slot];
 +			size_t part =3D min(bvec->bv_len - skip, size);
 +
 +			if (part) {
 +				res |=3D bvec->bv_offset + skip;
 +				res |=3D part;
 +			}
 +
 +			size -=3D part;
 +			if (size =3D=3D 0)
 +				return res;
 +			skip =3D 0;
 +		}
 +
 +		slot =3D 0;
 +	}
 +
 +	return res;
 +}
 +
  unsigned long iov_iter_alignment(const struct iov_iter *i)
  {
  	if (likely(iter_is_ubuf(i))) {
@@@ -907,10 -870,10 +923,10 @@@
 =20
  	if (iov_iter_is_bvec(i))
  		return iov_iter_alignment_bvec(i);
 +	if (iov_iter_is_bvecq(i))
 +		return iov_iter_alignment_bvecq(i);
 =20
 -	/* With both xarray and folioq types, we're dealing with whole folios. */
 -	if (iov_iter_is_folioq(i) || iov_iter_is_dmabuf_map(i))
 -		return i->iov_offset | i->count;
 +	/* With the xarray type, we're dealing with whole folios. */
  	if (iov_iter_is_xarray(i))
  		return (i->xarray_start + i->iov_offset) | i->count;
 =20
@@@ -925,7 -888,7 +941,7 @@@ unsigned long iov_iter_gap_alignment(co
  	size_t size =3D i->count;
  	unsigned k;
 =20
- 	if (iter_is_ubuf(i))
+ 	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
  		return 0;
 =20
  	if (WARN_ON(!iter_is_iovec(i)))
@@@ -963,158 -926,62 +979,158 @@@ static int want_pages_array(struct pag
  	return count;
  }
 =20
 -static ssize_t iter_folioq_get_pages(struct iov_iter *iter,
 -				     struct page ***ppages, size_t maxsize,
 -				     unsigned maxpages, size_t *_start_offset)
 +/*
 + * Count the number of virtually contiguous pages coming up next in an
 + * ITER_BVECQ iterator, up to the specified maxima.
 + */
 +static unsigned int iter_count_bvecq_pages(const struct iov_iter *iter,
 +					   size_t maxsize,
 +					   unsigned int maxpages)
  {
 -	const struct folio_queue *folioq =3D iter->folioq;
 -	struct page **pages;
 -	unsigned int slot =3D iter->folioq_slot;
 -	size_t extracted =3D 0, count =3D iter->count, iov_offset =3D iter->iov_=
offset;
 +	const struct bvecq *bvecq =3D iter->bvecq;
 +	unsigned int slot =3D iter->bvecq_slot;
 +	ssize_t remain =3D umin(maxsize, iter->count);
 +	size_t count =3D 0, offset =3D iter->iov_offset;
 =20
 -	if (slot >=3D folioq_nr_slots(folioq)) {
 -		folioq =3D folioq->next;
 -		slot =3D 0;
 -		if (WARN_ON(iov_offset !=3D 0))
 -			return -EIO;
 -	}
 +	do {
 +		const struct bio_vec *bv;
 +		size_t boff, blen;
 =20
 -	maxpages =3D want_pages_array(ppages, maxsize, iov_offset & ~PAGE_MASK, =
maxpages);
 -	if (!maxpages)
 -		return -ENOMEM;
 -	*_start_offset =3D iov_offset & ~PAGE_MASK;
 -	pages =3D *ppages;
 -
 -	for (;;) {
 -		struct folio *folio =3D folioq_folio(folioq, slot);
 -		size_t offset =3D iov_offset, fsize =3D folioq_folio_size(folioq, slot);
 -		size_t part =3D PAGE_SIZE - offset % PAGE_SIZE;
 -
 -		if (offset < fsize) {
 -			part =3D umin(part, umin(maxsize - extracted, fsize - offset));
 -			count -=3D part;
 -			iov_offset +=3D part;
 -			extracted +=3D part;
 -
 -			*pages =3D folio_page(folio, offset / PAGE_SIZE);
 -			get_page(*pages);
 -			pages++;
 -			maxpages--;
 +		if (slot >=3D bvecq->nr_slots) {
 +			if (!bvecq->next) {
 +				WARN_ON_ONCE(remain > 0);
 +				break;
 +			}
 +			bvecq =3D bvecq->next;
 +			slot =3D 0;
 +			offset =3D 0;
 +			continue;
  		}
 =20
 -		if (maxpages =3D=3D 0 || extracted >=3D maxsize)
 +		bv =3D &bvecq->bv[slot++];
 +		boff =3D bv->bv_offset;
 +		blen =3D bv->bv_len;
 +
 +		/* bv_page is not allowed to be NULL unless bv_len =3D=3D 0. */
 +		if (WARN_ON_ONCE(!bv->bv_page && blen > 0))
 +			break;
 +		if (!PAGE_ALIGNED(boff) && count > 0)
  			break;
 =20
 -		if (iov_offset >=3D fsize) {
 -			iov_offset =3D 0;
 -			slot++;
 -			if (slot =3D=3D folioq_nr_slots(folioq) && folioq->next) {
 -				folioq =3D folioq->next;
 -				slot =3D 0;
 -			}
 +		boff +=3D offset;
 +		blen -=3D offset;
 +		offset =3D 0;
 +		if (!blen)
 +			continue;
 +
 +		blen =3D umin(blen, remain);
 +		remain -=3D blen;
 +		blen +=3D offset_in_page(boff);
 +		count +=3D DIV_ROUND_UP(blen, PAGE_SIZE);
 +
 +		if (!PAGE_ALIGNED(blen))
 +			break;
 +	} while (remain > 0 && count < maxpages);
 +
 +	return min(count, maxpages);
 +}
 +
 +/*
 + * Get a list of virtually contiguous pages from an ITER_BVECQ iterator a=
nd pin
 + * them.
 + */
 +static ssize_t iter_bvecq_get_pages(struct iov_iter *iter,
 +				    struct page ***ppages, size_t maxsize,
 +				    unsigned int maxpages, size_t *_start_offset)
 +{
 +	const struct bvecq *bvecq =3D iter->bvecq;
 +	struct page **pages;
 +	unsigned int slot =3D iter->bvecq_slot, nr =3D 0;
 +	size_t extracted =3D 0, offset =3D iter->iov_offset;
 +
 +	for (;;) {
 +		if (slot >=3D bvecq->nr_slots) {
 +			if (!bvecq->next)
 +				return 0;
 +			bvecq =3D bvecq->next;
 +			slot =3D 0;
 +			offset =3D 0;
 +			continue;
  		}
 +		if (offset >=3D bvecq->bv[slot].bv_len) {
 +			slot++;
 +			offset =3D 0;
 +			continue;
 +		}
 +		break;
  	}
 =20
 -	iter->count =3D count;
 -	iter->iov_offset =3D iov_offset;
 -	iter->folioq =3D folioq;
 -	iter->folioq_slot =3D slot;
 +	/* Count the next run of virtually contiguous pages. */
 +	maxpages =3D iter_count_bvecq_pages(iter, maxsize, maxpages);
 +	if (!maxpages)
 +		return 0;
 +
 +	maxpages =3D want_pages_array(ppages, maxsize,
 +				    (bvecq->bv[slot].bv_offset + offset) & ~PAGE_MASK,
 +				    maxpages);
 +	if (!maxpages)
 +		return -ENOMEM;
 +	pages =3D *ppages;
 +
 +	/* Now transcribe the page pointers. */
 +	do {
 +		const struct bio_vec *bv;
 +		size_t boff, blen;
 +
 +		if (slot >=3D bvecq->nr_slots) {
 +			if (!bvecq->next) {
 +				WARN_ON_ONCE(extracted < iter->count);
 +				break;
 +			}
 +			bvecq =3D bvecq->next;
 +			slot =3D 0;
 +			offset =3D 0;
 +			continue;
 +		}
 +
 +		bv =3D &bvecq->bv[slot];
 +		boff =3D bv->bv_offset;
 +		blen =3D bv->bv_len;
 +
 +		/* bv_page is not allowed to be NULL unless bv_len =3D=3D 0. */
 +
 +		if (offset < blen) {
 +			struct folio *folio;
 +			size_t poff =3D (boff + offset) % PAGE_SIZE;
 +			size_t part =3D min(maxsize - extracted, blen - offset);
 +			size_t pix =3D (boff + offset) / PAGE_SIZE;
 +
 +			if (poff + part > PAGE_SIZE)
 +				part =3D PAGE_SIZE - poff;
 +
 +			if (!extracted)
 +				*_start_offset =3D poff;
 +
 +			/* Get a ref on the page if it's not a slab page. */
 +			folio =3D page_folio(bv->bv_page + pix);
 +			if (!folio_test_slab(folio))
 +				folio_get(folio);
 +
 +			pages[nr++] =3D bv->bv_page + pix;
 +			offset +=3D part;
 +			extracted +=3D part;
 +		}
 +
 +		if (offset >=3D blen) {
 +			offset =3D 0;
 +			slot++;
 +		}
 +	} while (nr < maxpages && extracted < maxsize);
 +
 +	iter->bvecq =3D bvecq;
 +	iter->bvecq_slot =3D slot;
 +	iter->iov_offset =3D offset;
 +	iter->count -=3D extracted;
  	return extracted;
  }
 =20
@@@ -1269,8 -1136,8 +1285,8 @@@ static ssize_t __iov_iter_get_pages_all
  		}
  		return maxsize;
  	}
 -	if (iov_iter_is_folioq(i))
 -		return iter_folioq_get_pages(i, pages, maxsize, maxpages, start);
 +	if (iov_iter_is_bvecq(i))
 +		return iter_bvecq_get_pages(i, pages, maxsize, maxpages, start);
  	if (iov_iter_is_xarray(i))
  		return iter_xarray_get_pages(i, pages, maxsize, maxpages, start);
  	return -EFAULT;
@@@ -1341,38 -1208,6 +1357,38 @@@ static int bvec_npages(const struct iov
  	return npages;
  }
 =20
 +static size_t iov_npages_bvecq(const struct iov_iter *iter, size_t maxpag=
es)
 +{
 +	const struct bvecq *bq;
 +	unsigned int slot =3D iter->bvecq_slot;
 +	size_t npages =3D 0;
 +	size_t skip =3D iter->iov_offset;
 +	size_t size =3D iter->count;
 +
 +	for (bq =3D iter->bvecq; bq; bq =3D bq->next) {
 +		for (; slot < bq->nr_slots; slot++) {
 +			const struct bio_vec *bvec =3D &bq->bv[slot];
 +			size_t offs =3D (bvec->bv_offset + skip) % PAGE_SIZE;
 +			size_t part =3D min(bvec->bv_len - skip, size);
 +
 +			if (part) {
 +				npages +=3D DIV_ROUND_UP(offs + part, PAGE_SIZE);
 +				if (npages >=3D maxpages)
 +					goto out;
 +			}
 +
 +			size -=3D part;
 +			if (!size)
 +				goto out;
 +			skip =3D 0;
 +		}
 +
 +		slot =3D 0;
 +	}
 +out:
 +	return umin(npages, maxpages);
 +}
 +
  int iov_iter_npages(const struct iov_iter *i, int maxpages)
  {
  	if (unlikely(!i->count))
@@@ -1387,8 -1222,11 +1403,8 @@@
  		return iov_npages(i, maxpages);
  	if (iov_iter_is_bvec(i))
  		return bvec_npages(i, maxpages);
 -	if (iov_iter_is_folioq(i)) {
 -		unsigned offset =3D i->iov_offset % PAGE_SIZE;
 -		int npages =3D DIV_ROUND_UP(offset + i->count, PAGE_SIZE);
 -		return min(npages, maxpages);
 -	}
 +	if (iov_iter_is_bvecq(i))
 +		return iov_npages_bvecq(i, maxpages);
  	if (iov_iter_is_xarray(i)) {
  		unsigned offset =3D (i->xarray_start + i->iov_offset) % PAGE_SIZE;
  		int npages =3D DIV_ROUND_UP(offset + i->count, PAGE_SIZE);
@@@ -1647,11 -1485,12 +1663,12 @@@ EXPORT_SYMBOL_GPL(import_ubuf)
  void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state)
  {
  	if (WARN_ON_ONCE(!iov_iter_is_bvec(i) && !iter_is_iovec(i) &&
- 			 !iter_is_ubuf(i)) && !iov_iter_is_kvec(i))
+ 			 !iter_is_ubuf(i) && !iov_iter_is_kvec(i) &&
+ 			 !iov_iter_is_dmabuf_map(i)))
  		return;
  	i->iov_offset =3D state->iov_offset;
  	i->count =3D state->count;
- 	if (iter_is_ubuf(i))
+ 	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
  		return;
  	/*
  	 * For the *vec iters, nr_segs + iov is constant - if we increment
@@@ -1672,86 -1511,64 +1689,86 @@@
  EXPORT_SYMBOL_FOR_MODULES(iov_iter_restore, "vmw_vsock_virtio_transport_c=
ommon");
 =20
  /*
 - * Extract a list of contiguous pages from an ITER_FOLIOQ iterator.  This=
 does
 - * not get references on the pages, nor does it get a pin on them.
 + * Extract a list of virtually contiguous pages from an ITER_BVECQ iterat=
or.
 + * This does not get references on the pages, nor does it get a pin on th=
em.
   */
 -static ssize_t iov_iter_extract_folioq_pages(struct iov_iter *i,
 -					     struct page ***pages, size_t maxsize,
 -					     unsigned int maxpages,
 -					     iov_iter_extraction_t extraction_flags,
 -					     size_t *offset0)
 +static ssize_t iov_iter_extract_bvecq_pages(struct iov_iter *iter,
 +					    struct page ***pages, size_t maxsize,
 +					    unsigned int maxpages,
 +					    iov_iter_extraction_t extraction_flags,
 +					    size_t *offset0)
  {
 -	const struct folio_queue *folioq =3D i->folioq;
 +	const struct bvecq *bvecq;
  	struct page **p;
 -	unsigned int nr =3D 0;
 -	size_t extracted =3D 0, offset, slot =3D i->folioq_slot;
 +	unsigned int slot, nr =3D 0;
 +	size_t extracted =3D 0, offset;
 =20
 -	if (slot >=3D folioq_nr_slots(folioq)) {
 -		folioq =3D folioq->next;
 -		slot =3D 0;
 -		if (WARN_ON(i->iov_offset !=3D 0))
 -			return -EIO;
 +	/* Count the next run of virtually contiguous pages. */
 +	maxpages =3D iter_count_bvecq_pages(iter, maxsize, maxpages);
 +	if (!maxpages)
 +		return 0;
 +
 +	if (!*pages) {
 +		*pages =3D kvmalloc_array(maxpages, sizeof(struct page *), GFP_KERNEL);
 +		if (!*pages)
 +			return -ENOMEM;
  	}
 =20
 -	offset =3D i->iov_offset & ~PAGE_MASK;
 -	*offset0 =3D offset;
 -
 -	maxpages =3D want_pages_array(pages, maxsize, offset, maxpages);
 -	if (!maxpages)
 -		return -ENOMEM;
  	p =3D *pages;
 =20
 -	for (;;) {
 -		struct folio *folio =3D folioq_folio(folioq, slot);
 -		size_t offset =3D i->iov_offset, fsize =3D folioq_folio_size(folioq, sl=
ot);
 -		size_t part =3D PAGE_SIZE - offset % PAGE_SIZE;
 +	/* Now transcribe the page pointers. */
 +	extracted =3D 0;
 +	bvecq =3D iter->bvecq;
 +	offset =3D iter->iov_offset;
 +	slot =3D iter->bvecq_slot;
 =20
 -		if (offset < fsize) {
 -			part =3D umin(part, umin(maxsize - extracted, fsize - offset));
 -			i->count -=3D part;
 -			i->iov_offset +=3D part;
 -			extracted +=3D part;
 +	do {
 +		const struct bio_vec *bv;
 +		size_t boff, blen;
 =20
 -			p[nr++] =3D folio_page(folio, offset / PAGE_SIZE);
 -		}
 -
 -		if (nr >=3D maxpages || extracted >=3D maxsize)
 -			break;
 -
 -		if (i->iov_offset >=3D fsize) {
 -			i->iov_offset =3D 0;
 -			slot++;
 -			if (slot =3D=3D folioq_nr_slots(folioq) && folioq->next) {
 -				folioq =3D folioq->next;
 -				slot =3D 0;
 +		if (slot >=3D bvecq->nr_slots) {
 +			if (!bvecq->next) {
 +				WARN_ON_ONCE(extracted < iter->count);
 +				break;
  			}
 +			bvecq =3D bvecq->next;
 +			slot =3D 0;
 +			offset =3D 0;
 +			continue;
  		}
 -	}
 =20
 -	i->folioq =3D folioq;
 -	i->folioq_slot =3D slot;
 +		bv =3D &bvecq->bv[slot];
 +		boff =3D bv->bv_offset;
 +		blen =3D bv->bv_len;
 +
 +		/* bv_page is not allowed to be NULL unless bv_len =3D=3D 0. */
 +
 +		if (offset < blen) {
 +			size_t part =3D umin(maxsize - extracted, blen - offset);
 +			size_t poff =3D (boff + offset) % PAGE_SIZE;
 +			size_t pix =3D (boff + offset) / PAGE_SIZE;
 +
 +			if (poff + part > PAGE_SIZE)
 +				part =3D PAGE_SIZE - poff;
 +
 +			if (!extracted)
 +				*offset0 =3D poff;
 +
 +			p[nr++] =3D bv->bv_page + pix;
 +			offset +=3D part;
 +			extracted +=3D part;
 +		}
 +
 +		if (offset >=3D blen) {
 +			offset =3D 0;
 +			slot++;
 +		}
 +	} while (nr < maxpages && extracted < maxsize);
 +
 +	iter->bvecq =3D bvecq;
 +	iter->bvecq_slot =3D slot;
 +	iter->iov_offset =3D offset;
 +	iter->count -=3D extracted;
  	return extracted;
  }
 =20
@@@ -2017,8 -1834,8 +2034,8 @@@ static ssize_t iov_iter_extract_user_pa
   *      added to the pages, but refs will not be taken.
   *      iov_iter_extract_will_pin() will return true.
   *
 - *  (*) If the iterator is ITER_KVEC, ITER_BVEC, ITER_FOLIOQ or ITER_XARR=
AY, the
 - *      pages are merely listed; no extra refs or pins are obtained.
 + *  (*) If the iterator is ITER_KVEC, ITER_BVEC, ITER_XARRAY, the pages a=
re
 + *      merely listed; no extra refs or pins are obtained.
   *      iov_iter_extract_will_pin() will return 0.
   *
   * Note also:
@@@ -2053,10 -1870,10 +2070,10 @@@ ssize_t iov_iter_extract_pages(struct i
  		return iov_iter_extract_bvec_pages(i, pages, maxsize,
  						   maxpages, extraction_flags,
  						   offset0);
 -	if (iov_iter_is_folioq(i))
 -		return iov_iter_extract_folioq_pages(i, pages, maxsize,
 -						     maxpages, extraction_flags,
 -						     offset0);
 +	if (iov_iter_is_bvecq(i))
 +		return iov_iter_extract_bvecq_pages(i, pages, maxsize,
 +						    maxpages, extraction_flags,
 +						    offset0);
  	if (iov_iter_is_xarray(i))
  		return iov_iter_extract_xarray_pages(i, pages, maxsize,
  						     maxpages, extraction_flags,

--J2R5WbIykSaLbUi/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOY7EACgkQJNaLcl1U
h9CShwf8De/7V5UdNXIMsV2YjM9RYcW++geSx449oiPVzY4sS9Ln4gnC1tLYJ4XH
4urkDjNOt4i2esSWovImCPXCpFsO7CNAoHtqRlIIR6OyzamNNv4w4s05hkcpnGsv
kPRJYn6x+stt7WqpredQZXbKEQ6DNe+VQYS5G5N/cND6u8+rVenByeQvOdXV2XoY
N8Uyg4tlzRdTbog8CmfExMo+2SZ7B/jLeA1BHdepKyApXKOgU8r0u06SEX3nJWeY
OpAcy81iu4WWrVv7M9Cs/3W1e69C8ack6zQiwLPtFms2MGf3j6G3FMOoSfBrqXGd
jsLla7Nq6dIpCSoSbPElyuBNnWg3PA==
=Yagr
-----END PGP SIGNATURE-----

--J2R5WbIykSaLbUi/--
