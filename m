Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027461;
	b=Mg0xZoktwlUzeBFZfmFtsSdaRz02CZ0pcjcsdRUSSkxHTCgP+k+yIbCLEYZi8rYkn7rn
	 cSh1qODX/BLsmPoGlw6l16sifegj3GLsBk9jb3zzWU62KWEjDqpoVj7twptO7fUKshnOZ
	 sIBYHFNr4iQQLgZq+/PCqRMqQ8lqjxXNh20T/kBX6p/u/tqqPLX/bddXHwYUxyA56GxQn
	 gqOA36GiI4P8Pd6vQMlXXvcMbBeq/RMBf0BiGEKkakAXQc53ZCLVnJXTeMUDe5JUw4QYk
	 cek9X3DOFPii4fFs6OX53QsnXLreyTFCbilgLiVn1EK1BX/Ssk2Qven5VVtmaZUtOvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027461;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4f7t4kSuzzBVEK1HrUbPSVuQTcXA7ncMoRgV6e6y21c=;
	b=Sfy+ekrChiRT+hybRw9uCbNMwfOOlaiXw3T5+6CJkEzStwF5r6sW4tqf7OX9qAtWlPHT
	 oa3NTdQgTJEkjbMbeR0/4EjqARksfVAKfrnAFOu8PK7IbGlBOfnUXFVOKgGPrlkvl1Gv5
	 Pn2l8HMa6kKO1todD/HlrYRg1lRA1k494CrFRPNF58Ng9kMh/3Vn8O61Ov4VoO07U8uzD
	 Igjux9/ASKAxPJdBbaFzE5PIgPsxRGNdU4CzZN78ohycoJPtH3Cq7zjeVBZz8qc2ySu8S
	 wwMrh03aKlDf3itICCCUDo5TqgXT6kXbY3Tfy9JoB+j94O+rYaaGT84bt0bLe20PRaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVKdr7OM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="k6qU/14m";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D375606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D375606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVKdr7OM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k6qU/14m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793027460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4f7t4kSuzzBVEK1HrUbPSVuQTcXA7ncMoRgV6e6y21c=;
	b=fVKdr7OMXQFDPLqEeZvmEIQQV7+sJCfQFdphX3dPT46IMAUV5cE2njKapF+sOcW3c19rtx
	8sxtZ1ZvVlI46oq6R01IJcJwOEfiaSiq7IxeM0jD9XLFIq16Hhefdo18ljf6fRIm4x7a5h
	ib6xJ+TevkzPb00/oy1VHXHr0so+cqk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-bs9dbHnXMe-qnXnJk2yStQ-1; Mon, 26 Oct 2026 11:10:58 -0400
X-MC-Unique: bs9dbHnXMe-qnXnJk2yStQ-1
X-Mimecast-MFC-AGG-ID: bs9dbHnXMe-qnXnJk2yStQ_1793027458
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so29608865e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793027457; x=1793632257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4f7t4kSuzzBVEK1HrUbPSVuQTcXA7ncMoRgV6e6y21c=;
        b=k6qU/14m1nzijbESy9Y6jhpZYSnUA4Msr38GAUqjH43C00pLrMgLZ4AszE512wr7KA
         6uG3p28641TfcE9dXcS0gjb3DLpaG2WxdDuuiHewog7PU0/PKwFugYy/YbCqs+uDbeqH
         n12B9qkL9n0hueiNnzRDAKu+cBMX590YlYO9lAAOBG/SybdwRJYR5JnQEYE296THsfSE
         96gb3GQK7lcpPtAGnkxOFqTYwe5Aa7gD6nEbwUOnte5qwUB3xv8fcOcq/ijiuDrzRoed
         LRK+zl+5wqFOgMht+9Qx+URf6pUoxb309dfkh/JEyx5i9JP5eCEslSK7IjZn8EVWCEf2
         in7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027457; x=1793632257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4f7t4kSuzzBVEK1HrUbPSVuQTcXA7ncMoRgV6e6y21c=;
        b=fwu1dtqMgbeavaGJDR/7oorRvJ/IcqKqDYn9VAy7ADHoJYgANPMO8YM0zW5ljARjVo
         i9i4sjwq4qD62lUQmDMZJKLLxVxE/Yl6P24jXiaiTpHdlrjusES7xBYtvyjwcca/J63m
         7hCEd02iy01hx+7hHXFL3qMoZ8ZEhnZsCiIpSQIcAeYnakTvBeCcJNKhjIH1d6IUYBMi
         jVtoGANubH9CMsB5zPq+xdg4YRz/9c+i0ZE9spOvcImvLvbiuN6oUoH9olOGixJ8mgZ/
         Kpurglen57mf8KLlE+SLlmOCjTU4Jej1FYnJERn1mKwDjWu9++15wN1mZFZhsmrqqLQx
         Rt8A==
X-Forwarded-Encrypted: i=1; AKwUvByk9SuQ0Y0dN9dDAx2M8lWb1kaYOw5gT3S2dHZW1Sf9sQp6/g8gYl5f6dY2khg5R4aZ4irtFyZXQhBjtEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmh00vqzoLmc0tGpEUFC1DLcZsx4zzTzCZYIMhbiFt83iO9Bw3
	E7xbGfOAyutw5JaWzqIafsVtd93SpzOoLqQF9Uhw8kNX5+6sjgQ7Mf5Qf4+2Thes+iCFH9irVQt
	Dimk1AxC1QqMCjmq8nh2mW72fZHfSijMJu5DbkD1Xy0aHdn+8C8n3v4RZbt5ss6LyWA==
X-Gm-Gg: AYBFou1Tf+Sof0P9EDZ9psusNQXzR6Bw5+ZMEZoOU1p3ogQLsNoOfMWZ9RWS21TH3Tf
	K6WGTp8CMUX8n7966ZTI732rHkKL/5vXCL1DMkzXrswZFmCrxECORC90Q8uud7spCtRiuu/SgCP
	6iIR0tquF/XKXPbm0cSEWt3kQoExg8NBKW9qgDhpIw7Ey6hfpNnjj0oUGHtlv3XrUz/YE5/Mdqt
	yygC6JaeQWElE1YMIIXpmK11zeWAnUH4YpTiPRTlFVUSIIrUpPj4uDQkX17hKm73//qlb8iDs84
	W3r2E0uEeN9HCGUHlEwendqrOI2IYrCSGC6UzC8ajz+Q7kk0JGuTKCNDJ3jVdpK+aFI=
X-Received: by 2002:a05:600c:6212:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a35acdd912mr123088355e9.27.1793027457415;
        Mon, 26 Oct 2026 08:10:57 -0700 (PDT)
X-Received: by 2002:a05:600c:6212:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a35acdd912mr123087815e9.27.1793027456804;
        Mon, 26 Oct 2026 08:10:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm15531155f8f.22.2026.10.26.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:10:56 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:10:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
	Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page
 reporting
Message-ID: <20261026111005-mutt-send-email-mst@kernel.org>
References: <20261023081923.164950-1-hruben@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023081923.164950-1-hruben@meta.com>

On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> The virtio_balloon driver reports a scatter-gather list of free pages
> to the VMM so it may discard unused pages.
> 
> For an arm64 kernel with 64 KiB pages, the default reporting and
> allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> report contains a sufficient number of large entries, we will end up
> with a descriptor chain that represents over 4 GiB of memory. This
> violates virtio spec section 2.7.5.2, which requires that the total
> buffer length of a descriptor chain be at most 4 GiB [1]. A VMM that
> faithfully follows the spec may stop processing the descriptor chain
> when it exceeds 4 GiB, and discard less memory than it could. For
> example, this is the case for the virtio-queue in Rust-VMM [2].
> 
> Batch the requests into descriptor chains of at most U32_MAX bytes
> (4 GiB - 1 byte). We use U32_MAX here so we can conveniently represent
> the batch length in a u32.
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html
> [2]
> https://github.com/rust-vmm/rust-vmm/blob/9f7250b1555ebe022ea4133fda676e6311040738/vm-virtio/virtio-queue/src/chain.rs#L183-L190
> 
> Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> Signed-off-by: Ruben Hakobyan <hruben@meta.com>
> ---


thanks a lot for the report. I posted a patchset for your
consideration. if you test it, pls let us know the results.
if you see a need for more changes, pls feel free to take
over the work on it.

> The wording in the spec is a bit ambiguous because it uses "chain
> length" for both descriptor counts and the total size of the memory
> ranges referenced by the descriptors. My read is that the byte limit
> applies to the sum of descriptor lengths, which is also what rust-vmm
> checks.
> 
> Another option I considered was to limit reporting capacity based
> on the largest possible block. E.g. for 64 KiB pages, the largest
> block is 512 MiB, so limit the reporting capacity to 7 to stay
> below 4GiB. Although simpler, I found that the time to reclaim
> was quite a bit longer.
> 
> I tested this patch on Cloud Hypervisor (which uses Rust-VMM)
> and QEMU (which doesn't enforce this limit).
> 
>  drivers/virtio/virtio_balloon.c | 47 ++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index ab3e3d887e00..68ce627c8e04 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/balloon.h>
> +#include <linux/limits.h>
>  #include <linux/oom.h>
>  #include <linux/wait.h>
>  #include <linux/mm.h>
> @@ -207,21 +208,43 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
>  	struct virtqueue *vq = vb->reporting_vq;
>  	unsigned int unused, err;
>  
> -	/* We should always be able to add these buffers to an empty queue. */
> -	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
> +	while (nents) {
> +		bool unmark_end;
> +		struct scatterlist *sg_batch_start = sg;
> +		u32 batch_len = 0;
> +		unsigned int batch_nents = 0;
>  
> -	/*
> -	 * In the extremely unlikely case that something has occurred and we
> -	 * are able to trigger an error we will simply display a warning
> -	 * and exit without actually processing the pages.
> -	 */
> -	if (WARN_ON_ONCE(err))
> -		return err;
> +		/*
> +		 * Virtio spec 2.7.5.2 limits the total buffer length of a
> +		 * descriptor chain to 2^32 bytes (4 GiB), so split larger
> +		 * reports into batches no bigger than that size.
> +		 */
> +		while (batch_nents < nents &&
> +		       sg->length <= U32_MAX - batch_len) {
> +			batch_len += sg->length;
> +			batch_nents += 1;
> +			sg = sg_next(sg);
> +		}
> +		unmark_end = !sg_is_last(&sg_batch_start[batch_nents - 1]);
>  
> -	virtqueue_kick(vq);
> +		if (unmark_end)
> +			sg_mark_end(&sg_batch_start[batch_nents - 1]);
>  
> -	/* When host has read buffer, this completes via balloon_ack */
> -	wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
> +		err = virtqueue_add_inbuf(vq, sg_batch_start, batch_nents, vb,
> +					  GFP_NOWAIT);
> +
> +		if (unmark_end)
> +			sg_unmark_end(&sg_batch_start[batch_nents - 1]);
> +
> +		if (WARN_ON_ONCE(err))
> +			return err;
> +
> +		virtqueue_kick(vq);
> +
> +		/* When host has read buffer, this completes via balloon_ack */
> +		wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
> +		nents -= batch_nents;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.53.0-Meta

