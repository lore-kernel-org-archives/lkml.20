Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749883;
	b=Ix3/ct5GtJw4/z/CqSsMxHJoT+LWBDfsxELcjZsYctyRhtovRlNKSdkfnzzDoWaEa8Qy
	 BghI8lETncM9oDwo+CTEQJHqbt3roqDzk2Kxuf5/2cAmtoAgsk2Nqn6cMKMKeKTsTggl/
	 MOyHkct3/L2846FNO2oopS9ylaDHA0SdYC2Y/hLKOEKkYakA3QC3H5dk4OL9UcTjOSFOb
	 Xb+h4za5ZB5FR0tc3qtle5ww8xmeu+OUxHJ7aTERNjpQQmpUXy/JIDm0qygFxQKttpPuk
	 RHT6G9sTcpem84W+7zGakjrg54vSPD4Vqy2W8JT5A810co2tm6lVz828RYh8afEHhqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749883;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hYkBoQ6y82oxG++SCIxFzQ7YeSOVHLZCi1q8tJnSOY8=;
	b=VG7cQOn6HHuBKMu0O5JPgcbITfZqN+Q+7ZJj8iOafj6n+xSXQpL1H7aiaBUuBf3g1NyD
	 Y9LMtl63Twqyy50helz7tLRjyg+D9cg8/8oPXCPbgSktC/A6zlJeJe6sjtLkfxa57bNwE
	 BoYSBciFKdT3yQ4mSjMQFit5mRqQst9l22iPIsjXVpY39zI9jb+u5I3nw54oViReirfWv
	 oZtPrgnBl0D2VNL/XbeqLAJCGOFIcmIxM+3Ko0iQ0aubE+Q0h0VC/TE98n2EnTD8b12r6
	 kmNDlGBmjDT862rR3vTIQfHXnJGdMtfo6a2yTTNmv9TucpLiL99UyQSrKA1hzwFbrLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Re++0DCN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tFcjjcQt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCD606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Re++0DCN;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tFcjjcQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792749881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hYkBoQ6y82oxG++SCIxFzQ7YeSOVHLZCi1q8tJnSOY8=;
	b=Re++0DCNJmHVmYvBEj3CxMNSvzLAF7nKq3TyP7IJoS3MiYCrecE79mcHPrwFpLIXbHSKhS
	Zhqv+SzvBK1YWyaNbDTiCEQz1eKESxcbNOXYsiZgvr+XElBboEI4tzBhLX7t0xnx+Qa3q2
	dCnI74E8f32YldPEvnfkoARl9/QvqR8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-gDw9kf2VPtmyIC8H-fSN2A-1; Fri, 23 Oct 2026 06:04:40 -0400
X-MC-Unique: gDw9kf2VPtmyIC8H-fSN2A-1
X-Mimecast-MFC-AGG-ID: gDw9kf2VPtmyIC8H-fSN2A_1792749879
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af5a07314so425567f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792749879; x=1793354679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYkBoQ6y82oxG++SCIxFzQ7YeSOVHLZCi1q8tJnSOY8=;
        b=tFcjjcQtF0RbozmfU/UV6psd2SyNYjk6ltoNL7jCePChJ5UM2bI56csrfBJDx3HxnQ
         NZvAxFcHQLVCmQcSz+C2OSldtIfAt6p+VQ1YaOkQwLIEIIh8XvO/tY57vVDBA3HPYwP4
         hZfhxPTv0+n9CK2BRWGV/zi4Z/sXeT2kZXM/miCYE0CdGVChYbJZrI5Z9roT93rD6aot
         1ocTKYEO8zw010kqq3Zbx03r/kmpkhnGqMEVEseyfESSnfHP3qy02u9okt58+FCGx/lC
         z9UiMHaxlNrG78vRDe4RAMk6xXJ+4f7e8dySQFF2o3HJd+zTXLtMCUPWToL3F53j2u0m
         wxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749879; x=1793354679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYkBoQ6y82oxG++SCIxFzQ7YeSOVHLZCi1q8tJnSOY8=;
        b=bHKbuOyCFqm79U8SsmZmKHjjl9VeZa/pblm7YfXi6OpWjyaDLdrQf7NBYe5nUQJqIM
         GB+gbNx0+qYdTL4uqA83FNVwbw8Ikc6nHRQduSpRFElNBF6SI7lo/nUuOBW8SUUZ55qr
         bIjj66Da9KT3PWlrIDswHXeW72kDA4GaeMH4cGxDp4qT+Ook+6qmW51PIz7Dp0/J4+dI
         w6tYHUMCfFP80ZmmrnAeoVqTwM8dSlsKLoAx+uUJzju43hbVfwQbZH/CwgjZI8KVscwC
         qsRBPcu3aeRrrAQ7yrA5WKgzqSb1Vk6UdiDUTV1JWGzvmtv6O3lFgHt3omAar5SIDDmT
         acmA==
X-Forwarded-Encrypted: i=1; AKwUvBxtTtA/BoFoiZ0vMAd/4hFNBYzqurgVwl0vCHrjOF7CiOTobajtqgJLW8JaEGrLYQK/1CQDuHpuqfgxnNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWf9+Nie/vwxX7/ckJhzSQ1jUUyVx8AS94K7dUnPm0bJEQy+P5
	wSonFn65LyuM7DiJDICg8NEeC59RUDnRg5DJKHefkB9UMF5WFHOyXvjuvKEZi0yX9/b2kSZ2FKj
	mz8kRYLC5NChOXoXYvnTedKbVIt6GddpxlPDbTHhed4hXeOfS8LUcjTSkvmHoN1BhUg==
X-Gm-Gg: AYBFou0OqfEwyofp5bD76l/bT0qlf09eTjNJriOYdrut0SRcFASpeStrF7P+r4hLnBQ
	BEPENsF7Xf//7NJeehu3tqC1WpEugPdvVpMN5wHD4cr2locb5u2si2HU0VJochmIpqp6wCmY/hv
	Zz6V4q+vLuW3wswuZsPzDcp7WfmGlycFuJ8rX8XVZlFDB4JWKUB1xyRHg4kPVvDVAiWr2RpWWWH
	NU2u45hjhbc6b7e5DF0oiCuCnYi6M6CvPDj1Vcw7+UxMTD19gdaRJyGah84oj87G++qeKIFrWgR
	j3KPzT5XIXjb2x4cGzkc4gtbdOphthw8eYrrQ5vyY5EK27lSYDDK2pgwM0ZANtNEqoBcYlU=
X-Received: by 2002:a05:6000:2610:b0:48d:f14a:917f with SMTP id ffacd0b85a97d-48e38594e07mr2598910f8f.2.1792749878664;
        Fri, 23 Oct 2026 03:04:38 -0700 (PDT)
X-Received: by 2002:a05:6000:2610:b0:48d:f14a:917f with SMTP id ffacd0b85a97d-48e38594e07mr2598849f8f.2.1792749877952;
        Fri, 23 Oct 2026 03:04:37 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edd26dsm4700642f8f.2.2026.10.23.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:04:37 -0700 (PDT)
Date: Fri, 23 Oct 2026 06:04:33 -0400
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
Message-ID: <20261023042737-mutt-send-email-mst@kernel.org>
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

Great patch, thanks!

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

It's not just a question of convenient, is it?
Rust is buggy wrt to spec as it allows only U32_MAX.
So it is also to make it work.
So should we maybe fix Rust to be spec compliant and allow 2^32 too?

I think we should definitely recommend U32_MAX in the spec
because otherwise it can not fit in the used length.


> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html
> [2]
> https://github.com/rust-vmm/rust-vmm/blob/9f7250b1555ebe022ea4133fda676e6311040738/vm-virtio/virtio-queue/src/chain.rs#L183-L190
> 
> Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> Signed-off-by: Ruben Hakobyan <hruben@meta.com>
> ---
> The wording in the spec is a bit ambiguous because it uses "chain
> length" for both descriptor counts and the total size of the memory
> ranges referenced by the descriptors. My read is that the byte limit
> applies to the sum of descriptor lengths, which is also what rust-vmm
> checks.


quote what you are referring to please, also in the commit log
not after ---.

I would also CC virtio-comment@lists.linux.dev - spec should recommend
U32_MAX.

> 
> Another option I considered was to limit reporting capacity based
> on the largest possible block. E.g. for 64 KiB pages, the largest
> block is 512 MiB, so limit the reporting capacity to 7 to stay
> below 4GiB. Although simpler, I found that the time to reclaim
> was quite a bit longer.



So I was going to apply this actually:

https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/

which makes the question completely moot.

Does this have any effect on performance?

Thanks!


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
> +		 * Virtio spec 2.7.5.2

Please add spec version and chapter title, and quote the
spec text in question verbatim.

> limits the total buffer length of a
> +		 * descriptor chain to 2^32 bytes (4 GiB), so split larger
> +		 * reports into batches no bigger than that size.
> +		 */
> +		while (batch_nents < nents &&
> +		       sg->length <= U32_MAX - batch_len) {

here you actually limit to U32_MAX which is 2^32 - 1 as commit log says.

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

