Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CC53163B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072181; cv=none; b=mU7+Cche2F1rfRXjCTE9sSNJd/5S87LDcyU5EFYTxjuo9cZHi6t/MPD9sRtrUNeCQ4/FBp5ravexDxY6ySCvNqLL/UaFgK1zv0Do3Vk/ogQ3dlgU/7VBa+omGUy/nLOY7N52qFqqQefyyXJAbQF8EcgzjgKU/5Q9udgIyrFVPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072181; c=relaxed/simple;
	bh=5jon+ifDWFP5QwYioELCR5y1JdhGgZVy832hXqPL/DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIChxRDUbPORbyoYhpbsystNYygiTbnazsSN+wTXuROPsUnB+QI0Lwpv61/vY+J43KIobwY7m7VkswOSZXqGcZOnImu2StNBzVumCh2mVxwL9jUsLL/ey3xr8WyKIQ9BxC0V16KxJoACStmM9tBwdwSG1+hDXnXvzac+j52pkg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bExyxdh5; arc=none smtp.client-ip=95.215.58.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bExyxdh5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5jon+ifDWFP5QwYioELCR5y1JdhGgZVy832hXqPL/DU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790072168; v=1; x=1790676968;
 b=bExyxdh5sDOiZYr1QNADmKoB6kGZkhKROLcRmrFJcy01VhZyyHcR9oVg3/IILTftOWSqVUqU
 4sfnqqMGsjMvA9sw7dFGmNnRlOlhHO5jr83EzwXHsYhONhKVmWInKzMoS+4F9h5b3oxkAHZm1Vy
 dVptl4/7nSPP4KrEFTWwj4lw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2d792f7ed8adce60;
	Tue, 22 Sep 2026 10:16:07 +0000
X-Mizu-Trace-ID: 2d792f7ed8adce60
X-Migadu-Flow: FLOW_OUT
Message-ID: <07aced0d-35d4-4c4f-95e4-9d3168e24617@linux.dev>
Date: Tue, 22 Sep 2026 11:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
To: Tal Zussman <tz2294@columbia.edu>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Christian Brauner <brauner@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
 "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
 <20260921-blkdev-fixes-v4-5-e2801f71ede9@columbia.edu>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260921-blkdev-fixes-v4-5-e2801f71ede9@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 03:54, Tal Zussman wrote:
> On a partial page pin, __blkdev_direct_IO_simple() and
> __blkdev_direct_IO_async() submit what was pinned with REQ_ATOMIC set
> and leave the rest to the buffered fallback, tearing an IOCB_ATOMIC
> write.
> 
> This can be triggered deterministically. A 16K pwritev2(RWF_ATOMIC)
> whose last page is PROT_NONE, on a scsi_debug device with atomic_wr=1,
> completes short with only three of the four pages written, violating
> RWF_ATOMIC semantics.
> 
> Make bio_iov_iter_get_pages() release the pins and return -EINVAL when
> a REQ_ATOMIC bio doesn't cover the whole iterator, since an atomic
> write is submitted as a single bio and a short one would be torn. That
> covers iomap as well, where a partially unmapped buffer could trip the
> WARN_ON_ONCE() in iomap_dio_bio_iter_one(). The async block device path
> currently sets REQ_ATOMIC after pinning, so set it before, and move
> REQ_NOWAIT along with it.
> 
> Fixes: caf336f81b3a ("block: Add fops atomic write support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>   block/bio.c  | 29 ++++++++++++++++++++++-------
>   block/fops.c | 12 ++++++------
>   2 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/block/bio.c b/block/bio.c
> index f95b63c0604a..14429a5d4e68 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -1285,6 +1285,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>   			   unsigned mem_align_mask, unsigned len_align_mask)
>   {
>   	iov_iter_extraction_t flags = 0;
> +	int ret;
>   
>   	if (WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED)))
>   		return -EIO;
> @@ -1304,34 +1305,48 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>   		flags |= ITER_ALLOW_P2PDMA;
>   
>   	do {
> -		ssize_t ret;
> +		ssize_t size;
>   
> -		ret = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
> +		size = iov_iter_extract_bvecs(iter, bio->bi_io_vec,
>   				BIO_MAX_SIZE - bio->bi_iter.bi_size,
>   				&bio->bi_vcnt, bio->bi_max_vecs,
>   				mem_align_mask, flags);
> -		if (ret <= 0) {
> +		if (size <= 0) {
>   			/*
>   			 * A misaligned vector fails the whole I/O.  Release any
>   			 * pages pinned by earlier iterations before returning
>   			 * since this bio won't be submitted to release them.
>   			 */
> -			if (ret == -EINVAL) {
> +			if (size == -EINVAL) {

*

>   				bio_release_pages(bio, false);
>   				bio_clear_flag(bio, BIO_PAGE_PINNED);
>   				bio->bi_vcnt = 0;
>   			}
>   			if (!bio->bi_vcnt)
> -				return ret;
> +				return size;
>   			break;
>   		}
> -		bio->bi_iter.bi_size += ret;
> +		bio->bi_iter.bi_size += size;
>   	} while (iov_iter_count(iter) && !bio_full(bio, 0));
>   
>   	if (is_pci_p2pdma_page(bio->bi_io_vec->bv_page))
>   		bio->bi_opf |= REQ_NOMERGE;
> -	return bio_iov_iter_align_down(bio, iter,
> +	ret = bio_iov_iter_align_down(bio, iter,
>   			&bio->bi_io_vec[bio->bi_vcnt - 1], len_align_mask);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * An atomic write is submitted as a single bio, so it has to cover
> +	 * the whole iterator or it would be torn.
> +	 */
> +	if ((bio->bi_opf & REQ_ATOMIC) && iov_iter_count(iter)) {
> +		bio_release_pages(bio, false);
> +		bio_clear_flag(bio, BIO_PAGE_PINNED);
> +		bio->bi_vcnt = 0;
> +		return -EINVAL;

There is some commonality here with iov_iter_extract_bvecs() failing, 
above *. You could add an error out label for both error scenarios.

If that does not work:
Reviewed-by: John Garry <john.garry@linux.dev>

> +	}
> +	return 0;
>   }
>   
>   static struct folio *folio_alloc_greedy(gfp_t gfp, size_t *size,
> diff --git a/block/fops.c b/block/fops.c
> index a3a709697b40..90777e8a9a6c 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -342,6 +342,12 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>   	bio->bi_end_io = blkdev_bio_end_io_async;
>   	bio->bi_ioprio = iocb->ki_ioprio;
>   
> +	if (iocb->ki_flags & IOCB_ATOMIC)
> +		bio->bi_opf |= REQ_ATOMIC;
> +
> +	if (iocb->ki_flags & IOCB_NOWAIT)
> +		bio->bi_opf |= REQ_NOWAIT;
> +
>   	/*
>   	 * Users don't rely on the iterator being in any particular
>   	 * state for async I/O returning -EIOCBQUEUED, hence we can
> @@ -371,12 +377,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
>   			goto out_bio_put;
>   	}
>   
> -	if (iocb->ki_flags & IOCB_ATOMIC)
> -		bio->bi_opf |= REQ_ATOMIC;
> -
> -	if (iocb->ki_flags & IOCB_NOWAIT)
> -		bio->bi_opf |= REQ_NOWAIT;
> -
>   	if (iocb->ki_flags & IOCB_HIPRI) {
>   		bio->bi_opf |= REQ_POLLED;
>   		submit_bio(bio);
> 

