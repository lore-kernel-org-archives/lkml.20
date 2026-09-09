Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067C476078;
	Wed,  9 Sep 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948527; cv=none; b=lH8dpjU/EWi8NBa8WBapCoSZDVmBqBJZP9CVRJMz/+M55QFuXXFKuT67iOI1pXfa6RhTxo4nZPFJCtfFvVpWtPHwa6cYP+npDRSQ/sNXXhsNbLcbYLWGVgqOlW3YBKs1r4WCJHIwM3RCfkd+ixvQXuZiFRiTnLrYO+2JNUgBimg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948527; c=relaxed/simple;
	bh=HK8VnG/XZ9lrsQW05O+qPsxWNzlbKc76uEQwuCHmMDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFGD5dyPDJJmC5QCewzsMhIzyw9FWcyfbV3MrSWTM7roKdAEwSCS/IvJh5al4JLVLJUCJyYHgqD8GoKf0Pi42Ihs81v28iCxSk+1/YE/aUTbWvl1rPTMYVaY2psmXKz3KBMHYUJ2ov39r6X16qsE0TlMUFeT4AP8fBBlyfXWUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhmdSef+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhmdSef+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788948526; x=1820484526;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HK8VnG/XZ9lrsQW05O+qPsxWNzlbKc76uEQwuCHmMDE=;
  b=ZhmdSef+Fmp5mBM7wThTyPC4iA4B+qQxCLKf7xFD0BRY3X0LfeAcWJzA
   Wpa7cqm4yZ50010D8poWmIa94xMWE0tsiNOcpzkRtlmbId2Xyjp/AKGCj
   1TYc+6dbSOjR/h716A1iFvAHYt6HFu8I1VYdv3r8lqew2rcczVaXKrCWw
   8vmua0L2I7k5JH+/R2ArTzepQvllF7HUkpIt9DgDccpIl6cBl7J7FBy63
   32Q4CJqPMgmmWKs/4xEXJB6ghoksqQwwvEmz60rTuVueGyPtweIyuoh23
   /DOUT9fDeCsyTOWwBsataNL8yGvDYBYDmrumfdejm+/xFXzABuspOvDUQ
   g==;
X-CSE-ConnectionGUID: AjMYcWrsTPmhbpOvAEbXPw==
X-CSE-MsgGUID: LQEJtuiKQnSUf5CBa7uE6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99962417"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99962417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:08:45 -0700
X-CSE-ConnectionGUID: j4N20+G6SVur9sW8GyJRyA==
X-CSE-MsgGUID: rGqh34zyT/+3MlEbXpybwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="270776174"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.245.69]) ([10.245.245.69])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:08:42 -0700
Message-ID: <3e8baa09-2ecf-413b-9ced-73479add6f8b@linux.intel.com>
Date: Wed, 9 Sep 2026 13:08:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
 <20260903-16k_offload_v1_b4-v3-2-135928dc2408@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-2-135928dc2408@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 09:57, Wesley Cheng wrote:
> Ring segments are normally allocated from a shared DMA pool sized and
> aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
> larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
> at a non-page-aligned offset within its enclosing CPU page, and
> multiple segments can share the same physical page.
> 
> A sideband client that maps a ring buffer directly via the IOMMU
> (which operates at page granularity) needs to know exactly which
> page(s) back the ring, and only pages that are actually intended to
> be exposed to that client should ever be mapped this way.
> 
> Allow each xhci_sideband endpoint to pass its own segment_pool, allocated
> separately from the core xhci->segment_pool, so every segment backing
> a sideband-tagged endpoint always comes from a page that is meant to
> be visible by the entity handling the offloaded endpoints. Normal
> (non-offloaded) endpoints are unaffected, as they keep allocating from
> xhci->segment_pool.
> 
> The offload client owns the pool's full lifetime, and since
> that lifetime is no longer tied to the sideband instance itself,
> xhci_sideband_unregister() must free any ring still backed by a
> client-supplied pool before returning, rather than leaving it for xhci
> to free later when the client and its pool may already be gone.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-mem.c       | 63 +++++++++++++++++++++++++--------------
>   drivers/usb/host/xhci-sideband.c  | 40 ++++++++++++++++++++++---
>   drivers/usb/host/xhci.h           | 16 +++++-----
>   include/linux/usb/xhci-sideband.h | 20 +++++++++++--
>   sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++--
>   5 files changed, 121 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 7a21ac81f9c8..a041a35fcd4f 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -28,6 +28,7 @@
>    * "All components of all Command and Transfer TRBs shall be initialized to '0'"
>    */
>   static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
> +					       struct dma_pool *pool,
>   					       unsigned int max_packet,
>   					       unsigned int num,
>   					       gfp_t flags)
> @@ -40,7 +41,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>   	if (!seg)
>   		return NULL;
>   
> -	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
> +	seg->trbs = dma_pool_zalloc(pool, flags, &dma);
>   	if (!seg->trbs) {
>   		kfree(seg);
>   		return NULL;
> @@ -50,7 +51,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>   		seg->bounce_buf = kzalloc_node(max_packet, flags,
>   					dev_to_node(dev));
>   		if (!seg->bounce_buf) {
> -			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
> +			dma_pool_free(pool, seg->trbs, dma);
>   			kfree(seg);
>   			return NULL;
>   		}
> @@ -62,10 +63,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>   	return seg;
>   }
>   
> -static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
> +static void xhci_segment_free(struct xhci_hcd *xhci, struct dma_pool *pool,
> +			      struct xhci_segment *seg)
>   {
>   	if (seg->trbs) {
> -		dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
> +		dma_pool_free(pool, seg->trbs, seg->dma);
>   		seg->trbs = NULL;
>   	}
>   	kfree(seg->bounce_buf);
> @@ -81,7 +83,7 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
>   
>   	while (seg) {
>   		next = seg->next;
> -		xhci_segment_free(xhci, seg);
> +		xhci_segment_free(xhci, ring->segment_pool, seg);
>   		seg = next;
>   	}
>   }
> @@ -334,7 +336,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
>   	struct xhci_segment *prev;
>   	unsigned int num = 0;
>   
> -	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
> +	prev = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len, num, flags);
>   	if (!prev)
>   		return -ENOMEM;
>   	num++;
> @@ -343,7 +345,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
>   	while (num < ring->num_segs) {
>   		struct xhci_segment	*next;
>   
> -		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
> +		next = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len,
> +					  num, flags);
>   		if (!next)
>   			goto free_segments;
>   
> @@ -362,15 +365,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
>   	return -ENOMEM;
>   }
>   
> -/*
> - * Create a new ring with zero or more segments.
> - *
> - * Link each segment together into a ring.
> - * Set the end flag and the cycle toggle bit on the last segment.
> - * See section 4.9.1 and figures 15 and 16.
> - */
> -struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
> -				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
> +static struct xhci_ring *
> +xhci_ring_alloc_from_pool(struct xhci_hcd *xhci, unsigned int num_segs,
> +			  enum xhci_ring_type type, unsigned int max_packet,
> +			  struct dma_pool *pool, gfp_t flags)
>   {
>   	struct xhci_ring	*ring;
>   	int ret;
> @@ -382,6 +380,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
>   
>   	ring->num_segs = num_segs;
>   	ring->bounce_buf_len = max_packet;
> +	ring->segment_pool = pool;
>   	INIT_LIST_HEAD(&ring->td_list);
>   	ring->type = type;
>   	if (num_segs == 0)
> @@ -398,6 +397,20 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
>   	return NULL;
>   }
>   
> +/*
> + * Create a new ring with zero or more segments.
> + *
> + * Link each segment together into a ring.
> + * Set the end flag and the cycle toggle bit on the last segment.
> + * See section 4.9.1 and figures 15 and 16.
> + */
> +struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
> +				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
> +{
> +	return xhci_ring_alloc_from_pool(xhci, num_segs, type, max_packet,
> +					 xhci->segment_pool, flags);
> +}
> +
>   void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
>   		struct xhci_virt_device *virt_dev,
>   		unsigned int ep_index)
> @@ -422,6 +435,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
>   	new_ring.num_segs = num_new_segs;
>   	new_ring.bounce_buf_len = ring->bounce_buf_len;
>   	new_ring.type = ring->type;
> +	new_ring.segment_pool = ring->segment_pool;
>   	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
>   	if (ret)
>   		return -ENOMEM;
> @@ -1424,6 +1438,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>   	unsigned int mult;
>   	unsigned int avg_trb_len;
>   	unsigned int err_count = 0;
> +	struct dma_pool *pool;
>   
>   	ep_index = xhci_get_endpoint_index(&ep->desc);
>   	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
> @@ -1487,8 +1502,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>   		avg_trb_len = 8;
>   
>   	/* Set up the endpoint ring */
> +	pool = virt_dev->eps[ep_index].priv_seg_pool ?
> +	       virt_dev->eps[ep_index].priv_seg_pool : xhci->segment_pool;
>   	virt_dev->eps[ep_index].new_ring =
> -		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
> +		xhci_ring_alloc_from_pool(xhci, 2, ring_type, max_packet, pool, mem_flags);
>   	if (!virt_dev->eps[ep_index].new_ring)
>   		return -ENOMEM;
>   
> @@ -2291,7 +2308,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>   }
>   
>   static struct xhci_interrupter *
> -xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
> +xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
> +		       struct dma_pool *pool, gfp_t flags)
>   {
>   	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
>   	struct xhci_interrupter *ir;
> @@ -2308,7 +2326,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
>   	if (!ir)
>   		return NULL;
>   
> -	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
> +	ir->event_ring = xhci_ring_alloc_from_pool(xhci, segs, TYPE_EVENT, 0, pool, flags);
>   	if (!ir->event_ring) {
>   		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
>   		kfree(ir);
> @@ -2356,7 +2374,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
>   
>   struct xhci_interrupter *
>   xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> -				  u32 imod_interval, unsigned int intr_num)
> +				  struct dma_pool *pool, u32 imod_interval,
> +				  unsigned int intr_num)
>   {
>   	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>   	struct xhci_interrupter *ir;
> @@ -2367,7 +2386,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   	    intr_num >= xhci->max_interrupters)
>   		return NULL;
>   
> -	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
> +	ir = xhci_alloc_interrupter(xhci, segs, pool, GFP_KERNEL);


Passing a custom dma pool to xhci_create_secondary_interrupters() shuld be optional.
Callers shoudn't need to be aware of the xhci->segment_pool, and pass it in the default case.

Instead use the default xhci->segment_pool if caller passes NULL for pool.


>   	if (!ir)
>   		return NULL;
>   
> @@ -2498,7 +2517,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   	if (!xhci->interrupters)
>   		goto fail;
>   
> -	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
> +	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, xhci->segment_pool, flags);
>   	if (!xhci->interrupters[0])
>   		goto fail;

I would split the patch here.

Do all xhci "core" code above in one patch, and the sideband changes in a separate patch.
Only sideband change needed in first patch would be passing NULL for pool when
creating the secondary interrupter:

  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval,
-						   intr_num);
+						   num_seg, NULL,
+						   imod_interval, intr_num);

Thanks
Mathias

