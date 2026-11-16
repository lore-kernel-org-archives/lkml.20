Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854502;
	b=BOlUWTPk4CT/7LyccqCIXBJpZrxA8kcNuDCFQWNSnsBZGOn0IfM1JOh0avO9Cc1Z6LJX
	 4SgG/BFgYzApqn9UlCkY5e7HYw/2AelqDJaM25a33SgsjlgjLuMQAew/LB88e5pBsfcT4
	 gpmpIKlMIrylaUS6WWPmDFWPQXiTwYi0cnMUD6UAlexj1XWyUs0cFkZiUYbOB9LbhKl+b
	 pFiCugK8vJf3iCeHghWknZ27B/7iFaFGa+r5mSPOxik2LjHEs6g+hhGWA4sH5hGW7VaJP
	 uNsI9CiY4Fxxjr5vA38L058BIyn76kWZwG/XkxcgsGCplSY8HokoMcH8vsL0o0z5Y7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854502;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=8Tq7njCcXOYIy4o4/OBFLNM5MG4m0/CbYzKoNH87dnw=;
	b=CSVIlJnDPheDIg09czxlejgP5wPut7YoPgBzlfIKfHypTcdTBow2Y/iA1WpokocagFlw
	 dKMd+iAbB/drTMpKpbWnCVNVFwvBkKa+3wsTvxygkBwNieGQ4RMmfUhyQGjjLPN8PdH7d
	 KiSAJ3WOKI9WurSdalvShVSiEx1typqwVyAC8uXrdc6foMMuTf7BfR1H/r9x10SGe6uTf
	 rcWkdlv7FpngJeNWCxjkDCBnQVoCU9s6yYcIyfUn/jy3LARjwD92b5k8dvOm91BWLFtyw
	 7AeOpK3qyhd6hdy9v872ohk4jF7DvbmmBxuT8V8Q3wNgIAScK0qyWgvbIl44Gyd2wgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=O9yVefhZ;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B1606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945B1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=O9yVefhZ
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261116184138euoutp015131a8179499bcd9162fa45815abb1ee~omqgoBHmw1687616876euoutp01Q
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:41:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261116184138euoutp015131a8179499bcd9162fa45815abb1ee~omqgoBHmw1687616876euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794854498;
	bh=8Tq7njCcXOYIy4o4/OBFLNM5MG4m0/CbYzKoNH87dnw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=O9yVefhZftyE05qVBfPITaWZHL/YiIZ1XPbWtLcqWiRfO6eq4YQNXTzFPoIMoupuH
	 rqDo7HTdHgtCRrKMolYP0MmkOjSkpQzvMgo/ZAG9+rOH+hpMqJDy3Q91hdZRuDeppx
	 Pq3T+nYmMDUbRO1mu56KOfyJBNvZEp2YbGDH15Kc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261116184137eucas1p29562c752d4c67581cb6e47e86f36c844~omqgEMg-_2938829388eucas1p20;
	Mon, 16 Nov 2026 18:41:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261116184137eusmtip1d921ccf16694521ce4ced30071c5eb2f~omqfulzit0625106251eusmtip1E;
	Mon, 16 Nov 2026 18:41:37 +0000 (GMT)
Message-ID: <daf356f6-0c3c-45a3-934a-78c1ed193d8c@samsung.com>
Date: Mon, 16 Nov 2026 19:41:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: mark pinned pages dirty when
 unpinning them
To: Tal Zussman <tz2294@columbia.edu>, Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261031-vb2-unpin-dirty-v1-1-701a22f124a5@columbia.edu>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261116184137eucas1p29562c752d4c67581cb6e47e86f36c844
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261031164430eucas1p111cf227e6a9eed66a0e09af1afd879a0
X-EPHeader: CA
X-CMS-RootMailID: 20261031164430eucas1p111cf227e6a9eed66a0e09af1afd879a0
References: <CGME20261031164430eucas1p111cf227e6a9eed66a0e09af1afd879a0@eucas1p1.samsung.com>
	<20261031-vb2-unpin-dirty-v1-1-701a22f124a5@columbia.edu>

On 31.10.2026 17:44, Tal Zussman wrote:
> The three USERPTR release paths each loop over the pinned pages with
> set_page_dirty_lock() before vb2_destroy_framevec() unpins them. Use
> unpin_user_pages_dirty_lock() instead by passing a dirty argument to
> put_vaddr_frames(). unpin_user_pages_dirty_lock() works a folio at a
> time, so a pinned THP is marked dirty once rather than once per page.
>
> This removes the last callers of set_page_dirty_lock() in videobuf2.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/media/common/videobuf2/frame_vector.c         | 11 ++++++-----
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 15 +++------------
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 10 +++-------
>  drivers/media/common/videobuf2/videobuf2-memops.c     | 10 ++++++----
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 14 +++-----------
>  include/media/frame_vector.h                          |  2 +-
>  include/media/videobuf2-memops.h                      |  2 +-
>  7 files changed, 23 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 41f289c75cbb..d4da45cc5624 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -72,12 +72,13 @@ EXPORT_SYMBOL(get_vaddr_frames);
>   * put_vaddr_frames() - drop references to pages if get_vaddr_frames() acquired
>   *			them
>   * @vec:	frame vector to put
> + * @dirty:	whether to mark the pages dirty first
>   *
> - * Drop references to pages if get_vaddr_frames() acquired them. We also
> - * invalidate the frame vector so that it is prepared for the next call into
> - * get_vaddr_frames().
> + * Drop references to pages if get_vaddr_frames() acquired them, marking them
> + * dirty first if @dirty is set. We also invalidate the frame vector so that it
> + * is prepared for the next call into get_vaddr_frames().
>   */
> -void put_vaddr_frames(struct frame_vector *vec)
> +void put_vaddr_frames(struct frame_vector *vec, bool dirty)
>  {
>  	struct page **pages;
>  
> @@ -92,7 +93,7 @@ void put_vaddr_frames(struct frame_vector *vec)
>  	if (WARN_ON(IS_ERR(pages)))
>  		goto out;
>  
> -	unpin_user_pages(pages, vec->nr_frames);
> +	unpin_user_pages_dirty_lock(pages, vec->nr_frames, dirty);
>  	vec->got_ref = false;
>  out:
>  	vec->nr_frames = 0;
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 9ce6284cd5f2..94e00e6bc0fb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -533,8 +533,6 @@ static void vb2_dc_put_userptr(void *buf_priv)
>  {
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
> -	int i;
> -	struct page **pages;
>  
>  	if (sgt) {
>  		/*
> @@ -543,21 +541,14 @@ static void vb2_dc_put_userptr(void *buf_priv)
>  		 */
>  		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>  				  DMA_ATTR_SKIP_CPU_SYNC);
> -		if (buf->dma_dir == DMA_FROM_DEVICE ||
> -				buf->dma_dir == DMA_BIDIRECTIONAL) {
> -			pages = frame_vector_pages(buf->vec);
> -			/* sgt should exist only if vector contains pages... */
> -			if (!WARN_ON_ONCE(IS_ERR(pages)))
> -				for (i = 0; i < frame_vector_count(buf->vec); i++)
> -					set_page_dirty_lock(pages[i]);
> -		}
>  		sg_free_table(sgt);
>  		kfree(sgt);
>  	} else {
>  		dma_unmap_resource(buf->dev, buf->dma_addr, buf->size,
>  				   buf->dma_dir, 0);
>  	}
> -	vb2_destroy_framevec(buf->vec);
> +	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
> +			     buf->dma_dir == DMA_BIDIRECTIONAL);
>  	kfree(buf);
>  }
>  
> @@ -676,7 +667,7 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  	kfree(sgt);
>  
>  fail_pfnvec:
> -	vb2_destroy_framevec(vec);
> +	vb2_destroy_framevec(vec, false);
>  
>  fail_buf:
>  	kfree(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index b1d0695cda26..c80d3232436d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -271,7 +271,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  userptr_fail_map:
>  	sg_free_table(&buf->sg_table);
>  userptr_fail_sgtable:
> -	vb2_destroy_framevec(vec);
> +	vb2_destroy_framevec(vec, false);
>  userptr_fail_pfnvec:
>  	kfree(buf);
>  	return ERR_PTR(-ENOMEM);
> @@ -285,7 +285,6 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>  {
>  	struct vb2_dma_sg_buf *buf = buf_priv;
>  	struct sg_table *sgt = &buf->sg_table;
> -	int i = buf->num_pages;
>  
>  	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
>  	       __func__, buf->num_pages);
> @@ -293,11 +292,8 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>  	if (buf->vaddr)
>  		vm_unmap_ram(buf->vaddr, buf->num_pages);
>  	sg_free_table(buf->dma_sgt);
> -	if (buf->dma_dir == DMA_FROM_DEVICE ||
> -	    buf->dma_dir == DMA_BIDIRECTIONAL)
> -		while (--i >= 0)
> -			set_page_dirty_lock(buf->pages[i]);
> -	vb2_destroy_framevec(buf->vec);
> +	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
> +			     buf->dma_dir == DMA_BIDIRECTIONAL);
>  	kfree(buf);
>  }
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
> index f9a4ec44422e..605e24aa710b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> @@ -59,7 +59,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
>  	}
>  	return vec;
>  out_release:
> -	put_vaddr_frames(vec);
> +	put_vaddr_frames(vec, false);
>  out_destroy:
>  	frame_vector_destroy(vec);
>  	return ERR_PTR(ret);
> @@ -69,13 +69,15 @@ EXPORT_SYMBOL(vb2_create_framevec);
>  /**
>   * vb2_destroy_framevec() - release vector of mapped pfns
>   * @vec:	vector of pfns / pages to release
> + * @dirty:	whether to mark the pages dirty first
>   *
>   * This releases references to all pages in the vector @vec (if corresponding
> - * pfns are backed by pages) and frees the passed vector.
> + * pfns are backed by pages), marking them dirty first if @dirty is set, and
> + * frees the passed vector.
>   */
> -void vb2_destroy_framevec(struct frame_vector *vec)
> +void vb2_destroy_framevec(struct frame_vector *vec, bool dirty)
>  {
> -	put_vaddr_frames(vec);
> +	put_vaddr_frames(vec, dirty);
>  	frame_vector_destroy(vec);
>  }
>  EXPORT_SYMBOL(vb2_destroy_framevec);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 63f023696f3e..bf6273f3bc86 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -116,7 +116,7 @@ static void *vb2_vmalloc_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  	return buf;
>  
>  fail_map:
> -	vb2_destroy_framevec(vec);
> +	vb2_destroy_framevec(vec, false);
>  fail_pfnvec_create:
>  	kfree(buf);
>  
> @@ -127,25 +127,17 @@ static void vb2_vmalloc_put_userptr(void *buf_priv)
>  {
>  	struct vb2_vmalloc_buf *buf = buf_priv;
>  	unsigned long vaddr = (unsigned long)buf->vaddr & PAGE_MASK;
> -	unsigned int i;
> -	struct page **pages;
>  	unsigned int n_pages;
>  
>  	if (!buf->vec->is_pfns) {
>  		n_pages = frame_vector_count(buf->vec);
>  		if (vaddr)
>  			vm_unmap_ram((void *)vaddr, n_pages);
> -		if (buf->dma_dir == DMA_FROM_DEVICE ||
> -		    buf->dma_dir == DMA_BIDIRECTIONAL) {
> -			pages = frame_vector_pages(buf->vec);
> -			if (!WARN_ON_ONCE(IS_ERR(pages)))
> -				for (i = 0; i < n_pages; i++)
> -					set_page_dirty_lock(pages[i]);
> -		}
>  	} else {
>  		iounmap((__force void __iomem *)buf->vaddr);
>  	}
> -	vb2_destroy_framevec(buf->vec);
> +	vb2_destroy_framevec(buf->vec, buf->dma_dir == DMA_FROM_DEVICE ||
> +			     buf->dma_dir == DMA_BIDIRECTIONAL);
>  	kfree(buf);
>  }
>  
> diff --git a/include/media/frame_vector.h b/include/media/frame_vector.h
> index 541c71a2c7be..daf40b9b3d3d 100644
> --- a/include/media/frame_vector.h
> +++ b/include/media/frame_vector.h
> @@ -17,7 +17,7 @@ struct frame_vector *frame_vector_create(unsigned int nr_frames);
>  void frame_vector_destroy(struct frame_vector *vec);
>  int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
>  		     bool write, struct frame_vector *vec);
> -void put_vaddr_frames(struct frame_vector *vec);
> +void put_vaddr_frames(struct frame_vector *vec, bool dirty);
>  int frame_vector_to_pages(struct frame_vector *vec);
>  void frame_vector_to_pfns(struct frame_vector *vec);
>  
> diff --git a/include/media/videobuf2-memops.h b/include/media/videobuf2-memops.h
> index 4b5b84f93538..8a66ec46bc71 100644
> --- a/include/media/videobuf2-memops.h
> +++ b/include/media/videobuf2-memops.h
> @@ -36,6 +36,6 @@ extern const struct vm_operations_struct vb2_common_vm_ops;
>  struct frame_vector *vb2_create_framevec(unsigned long start,
>  					 unsigned long length,
>  					 bool write);
> -void vb2_destroy_framevec(struct frame_vector *vec);
> +void vb2_destroy_framevec(struct frame_vector *vec, bool dirty);
>  
>  #endif
>
> ---
> base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
> change-id: 20261015-vb2-unpin-dirty-912660272e32
>
> Best regards,
> --  
> Tal Zussman <tz2294@columbia.edu>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

