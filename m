Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907835;
	b=ifUsncBFBjLRoP6JnxEhYy8KWGl2hLcTBYlQ8PP1D2PKouXwzI7+X3lqfEdddQMu95da
	 1mdu9cd+RhBIqITKfXM+8WC3QR8Xug3nORZj/jOQ9V3Djsd2mFMG6XpJTyiAu7feXyOtZ
	 VwOcGDzvKt4wK7beCYYqa5BVsKzQ5MjcZ922c3iwmZ7NTl9XRQoDuU8qDAffxg6yaB3it
	 1hhlL7gIXwYuVDIG5YiiEpqwHhbVtjj46AZMi/ziHUbv3SpBPlDat7zRddEOOEl42+ySR
	 d39SeVIfgy5NMJj8mG91/1CKKzy6nfPn3JDF9RVyUzOKJYxb2PVXKrYpDFHNWQ4UnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907835;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aFGBHAMRbC8gjr7H7RJhMUHxgVniv6NNOgtYNglESN4=;
	b=neO5hI8cXE1evPYBfNHwjZKhRCPbHst1tQ3chiT9Wco+6hEAcoQgdtgpobF+6paMiz0K
	 A3RjE/Oc8m8TmSimzop8I1se1kCBTrmswvz9cN7fLFLPFAx7EizMalfZ6J6BgCmufi71u
	 6Corp/Rv6di1GhH9WXYuNGIyV5/udcM4b4poewrJ3Mqc3n6O0wHU035ld6kerSzXlAGiv
	 MzjZCiqKuZXU6YWHBjt7RVhyZ9/V2UBEAFUP9U3kVXuXWaGHKSNw2XT0FAwaNrG+euptA
	 md8wMwme83FRekJ2+rts8pomIeXfA+CgcBfFleO4eSuIDHDWEYOzIyQ8UN6FY72+Epg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Fmn/fXVf";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ttPBOFVs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175A606A6C4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8175A606A6C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fmn/fXVf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ttPBOFVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793907833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aFGBHAMRbC8gjr7H7RJhMUHxgVniv6NNOgtYNglESN4=;
	b=Fmn/fXVfNdNlT6GrQULYzxYBXWyaR8e07+pMlezd47myrKNIgta710knhIFk136G64c/Ej
	piWKsE6bVVcST17Xk1dh0UiznnfbKCLFfnNt1EGYk77eSPNXX4OFvw1fgStTbD4x0SvMwv
	QijRSesGM+yizLtaP+KYtwNrhGqDvYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-dcwySVICPKGuO0XxSdhOJQ-1; Thu, 05 Nov 2026 14:43:52 -0500
X-MC-Unique: dcwySVICPKGuO0XxSdhOJQ-1
X-Mimecast-MFC-AGG-ID: dcwySVICPKGuO0XxSdhOJQ_1793907831
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso12591785e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793907831; x=1794512631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFGBHAMRbC8gjr7H7RJhMUHxgVniv6NNOgtYNglESN4=;
        b=ttPBOFVs6NhaJnp2fTh3+qTNFTElSrrKwWT8A54LFwBlwetj/JtCEJgyG5e2kjD4T1
         nnO+gOcDMw7odnrw0SNH4visIFGQYXaZxKUjFvlpTkk0zFEUeenUdhhXEHxxufXR3iGT
         DoJDC8nG+GJYzukl1QbjEIDIl9XfpXGBjMixef113++E1RZGxf7hLIZ17RLRGsq/8tPf
         Q5lGJ7d/DHBDZ13RWxf2hbIUo7ntNa45jgm0M27Nbro8gxxIIhjLW3HALgVMP0CPF7ny
         roputxNYHJnFtamQ5uSxqnPiGrCFN20kdw9Lu67uL3XwbdZxmI7/yfV0TrA+jD5G98Df
         I61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907831; x=1794512631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFGBHAMRbC8gjr7H7RJhMUHxgVniv6NNOgtYNglESN4=;
        b=OKefwIH8pbxw1iYM31UHF9ljEVa366d/oqb8ifLqIC20SNXBcohT8d4/6brKLkZ2ql
         S1qBBHjxwxFFsh8klRiddPmiu07LGXQk5SWlSY/veSp26jlwp/QhpjG9lqR8QArfgODe
         fjvdCXsxVUPTWXJYQaW9MXDolX3UBVlpfpWtOQA06VlvAdMkayraGbEVn5R9UP/gyRbX
         QLHYX+ZgoVKi/p7ZfV6CX7rq7svkoRpuHZ1BidCZF6+87Yhi7mmOPHF5XNAr86gHBGHF
         55WVu53wT81cii37drJZKs41QPxDAfByxHrir7E9djhFFtxy94R41Px7kZy0d1V2EHt8
         8XaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/K7FXJzGXRPY2YDB90SHPVmmnEV+7XKjtQzdSg+6Ipfc06EUksX5qwr0lDhuhmHRwcCUnH2wH8fHmXE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ks+1WBMBWOvYvL1mUkjJxSdg0LOctlyiT428P+Tge3JO/U/gm
	j45aF9+3VWrI4wY+rTVA0ulnFS3ENEup+iGkCW9XKbCaN6r2fYkln2WSD3x/6RBMBPreozfEgiy
	+9Bkg+kgQgpXBcW/435QuLeJZjP0+cd9RPUAITi5q+C+9BmXCNQ1OLGsmr6jFBNvzGQ==
X-Gm-Gg: AYBFou2RHbaHjCHQC0VmLiQBoAFVvryuUAIMjnav9XhXMxafJdONq9bqmAI5UY8uOJ3
	5hGr5utm+6Q5cCsITwLkPYiejZa807VZF0FD6ySEKGMY1Stoh24i5Tf0nwEzfyHd9uXCRBjSwTR
	r082MZoFp3vscL1iMRrQIZXyt/DJ6SSPD0DtyRk7sIBCFq7roYawv+uFXglt0RDNscWqbxM4dQw
	LDCDhikyOq+PPf7p6oimtZK1559rlrzPJVu5SAdxUbcC8v71YohWW6/LVL4LMF2cr7YQ66OB2rq
	Cd/Sc3skZ0j9rsMMruKdl0D2U8srsI4NNad38S88xf24erTJ1X05BqNwSoTnXK7HtIqujDmc9mq
	RWJEwq37topBpurDy0DGwVQhytxNg0UkDAJ1/HStiKA==
X-Received: by 2002:a05:600c:19cf:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4b6dff85599mr2217275e9.33.1793907830795;
        Thu, 05 Nov 2026 11:43:50 -0800 (PST)
X-Received: by 2002:a05:600c:19cf:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4b6dff85599mr2216835e9.33.1793907830232;
        Thu, 05 Nov 2026 11:43:50 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1401:db00:7367:7b9e:e66f:2b7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm206845465e9.3.2026.11.05.11.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:43:49 -0800 (PST)
Date: Thu, 5 Nov 2026 14:43:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>, virtualization@lists.linux.dev,
	linux-um@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_ring: return an error pointer from
 vring_create_virtqueue()
Message-ID: <20261105144316-mutt-send-email-mst@kernel.org>
References: <20261105193426.2999631-1-stjepan.poljak@gmail.com>
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
In-Reply-To: <20261105193426.2999631-1-stjepan.poljak@gmail.com>

On Thu, Nov 05, 2026 at 08:34:25PM +0100, Stjepan Poljak wrote:
> vring_create_virtqueue() and vring_create_virtqueue_map() return NULL
> on any failure, so the error returned from vring_alloc_queue_split()
> is lost and turned into -ENOMEM. This is especially misleading if
> vring_alloc_queue_split() rejects a queue size with -EINVAL (i.e. if
> queue size is not a power of two):
> 
>   virtio_blk virtio0: Bad virtqueue length 100
>   virtio_blk virtio0: probe with driver virtio_blk failed with error -12
> 
> So the error points whoever debugs it at an allocation failure that
> never happened.
> 
> Return an ERR_PTR() instead: the error from vring_alloc_queue_split()
> or vring_alloc_queue_packed(), or -ENOMEM when allocating the
> virtqueue itself fails. Make the callers, virtio_pci (modern and
> legacy), virtio_mmio, virtio_vdpa, virtio_ccw and virtio_uml, check
> with IS_ERR() and pass the error on. The error path in virtio_ccw
> deletes a non-NULL vq, so clear vq there before taking it.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

not how you ae supposed to attribute LLM use.

> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>


> ---
> Tested on x86_64 with a virtio-mmio virtio-blk device offering a
> 100-entry queue: the probe now fails with -22 instead of -12, and a
> 128-entry queue probes as before. The other transports are only
> compile-tested (x86_64, ARCH=um, s390 with clang, W=1).
> 
> No Fixes: tag, since the error has been -ENOMEM since 2010 and nothing
> regressed.
> 
> This conflicts trivially with patch 07/12 of Alexander Graf's "virtio:
> support devices that own their virtqueue memory" v2:
> https://lore.kernel.org/virtualization/20260818211425.91009-1-graf@amazon.com/
> ---
>  arch/um/drivers/virtio_uml.c       |  4 ++--
>  drivers/s390/virtio/virtio_ccw.c   |  5 +++--
>  drivers/virtio/virtio_mmio.c       |  4 ++--
>  drivers/virtio/virtio_pci_legacy.c |  4 ++--
>  drivers/virtio/virtio_pci_modern.c |  4 ++--
>  drivers/virtio/virtio_ring.c       | 12 +++++++-----
>  drivers/virtio/virtio_vdpa.c       |  4 ++--
>  include/linux/virtio_ring.h        |  6 +++++-
>  8 files changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
> index 881c34098a74..8b645523277f 100644
> --- a/arch/um/drivers/virtio_uml.c
> +++ b/arch/um/drivers/virtio_uml.c
> @@ -984,8 +984,8 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
>  
>  	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
>  				    ctx, vu_notify, callback, info->name);
> -	if (!vq) {
> -		rc = -ENOMEM;
> +	if (IS_ERR(vq)) {
> +		rc = PTR_ERR(vq);
>  		goto error_create;
>  	}
>  	vq->priv = info;
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 552d77998012..c5a30f0a2bc2 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -590,10 +590,11 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
>  				    vdev, true, may_reduce, ctx,
>  				    notify, callback, name);
>  
> -	if (!vq) {
> +	if (IS_ERR(vq)) {
>  		/* For now, we fail if we can't get the requested size. */
>  		dev_warn(&vcdev->cdev->dev, "no vq\n");
> -		err = -ENOMEM;
> +		err = PTR_ERR(vq);
> +		vq = NULL;
>  		goto out_err;
>  	}
>  
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index e2ec0ec01d67..c403a025006e 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -396,8 +396,8 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
>  	/* Create the vring */
>  	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
>  				 true, true, ctx, notify, callback, name);
> -	if (!vq) {
> -		err = -ENOMEM;
> +	if (IS_ERR(vq)) {
> +		err = PTR_ERR(vq);
>  		goto error_new_virtqueue;
>  	}
>  
> diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> index 8115aa39e01e..9d94fffff344 100644
> --- a/drivers/virtio/virtio_pci_legacy.c
> +++ b/drivers/virtio/virtio_pci_legacy.c
> @@ -130,8 +130,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>  				    VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
>  				    true, false, ctx,
>  				    vp_notify, callback, name);
> -	if (!vq)
> -		return ERR_PTR(-ENOMEM);
> +	if (IS_ERR(vq))
> +		return vq;
>  
>  	vq->num_max = num;
>  
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> index 922e2df027de..28ccb2130e27 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
> @@ -720,8 +720,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>  				    SMP_CACHE_BYTES, &vp_dev->vdev,
>  				    true, true, ctx,
>  				    notify, callback, name);
> -	if (!vq)
> -		return ERR_PTR(-ENOMEM);
> +	if (IS_ERR(vq))
> +		return vq;
>  
>  	vq->num_max = num;
>  
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..6dd4a7651bde 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1421,13 +1421,13 @@ static struct virtqueue *vring_create_virtqueue_split(
>  	err = vring_alloc_queue_split(&vring_split, vdev, num, vring_align,
>  				      may_reduce_num, map);
>  	if (err)
> -		return NULL;
> +		return ERR_PTR(err);
>  
>  	vq = __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
>  				   context, notify, callback, name, map);
>  	if (!vq) {
>  		vring_free_split(&vring_split, vdev, map);
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	to_vvq(vq)->we_own_ring = true;
> @@ -2671,15 +2671,17 @@ static struct virtqueue *vring_create_virtqueue_packed(
>  {
>  	struct vring_virtqueue_packed vring_packed = {};
>  	struct virtqueue *vq;
> +	int err;
>  
> -	if (vring_alloc_queue_packed(&vring_packed, vdev, num, map))
> -		return NULL;
> +	err = vring_alloc_queue_packed(&vring_packed, vdev, num, map);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	vq = __vring_new_virtqueue_packed(index, &vring_packed, vdev, weak_barriers,
>  					context, notify, callback, name, map);
>  	if (!vq) {
>  		vring_free_packed(&vring_packed, vdev, map);
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	to_vvq(vq)->we_own_ring = true;
> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> index f9559b6b2e0b..c1b6134b2267 100644
> --- a/drivers/virtio/virtio_vdpa.c
> +++ b/drivers/virtio/virtio_vdpa.c
> @@ -208,8 +208,8 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
>  	vq = vring_create_virtqueue_map(index, max_num, align, vdev,
>  					true, may_reduce_num, ctx,
>  					notify, callback, name, map);
> -	if (!vq) {
> -		err = -ENOMEM;
> +	if (IS_ERR(vq)) {
> +		err = PTR_ERR(vq);
>  		goto error_new_virtqueue;
>  	}
>  
> diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
> index c97a12c1cda3..c808ca7e8d58 100644
> --- a/include/linux/virtio_ring.h
> +++ b/include/linux/virtio_ring.h
> @@ -66,6 +66,9 @@ struct device;
>   * may_reduce_num is set, then this may allocate a smaller ring than
>   * expected.  The caller should query virtqueue_get_vring_size to learn
>   * the actual size of the ring.
> + *
> + * Returns the virtqueue or an ERR_PTR() on failure: -EINVAL if num is
> + * not a valid ring size, -ENOMEM if the ring could not be allocated.
>   */
>  struct virtqueue *vring_create_virtqueue(unsigned int index,
>  					 unsigned int num,
> @@ -80,7 +83,8 @@ struct virtqueue *vring_create_virtqueue(unsigned int index,
>  
>  /*
>   * Creates a virtqueue and allocates the descriptor ring with per
> - * virtqueue mapping operations.
> + * virtqueue mapping operations.  Returns the virtqueue or an ERR_PTR()
> + * on failure, like vring_create_virtqueue().
>   */
>  struct virtqueue *vring_create_virtqueue_map(unsigned int index,
>  					     unsigned int num,
> 
> base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
> -- 
> 2.53.0

