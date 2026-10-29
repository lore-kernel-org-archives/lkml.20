Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268962;
	b=KL+5j4akATZmKItLr4LnoNeR5Hs0rEEmwu6eS6wh8nTUEznBYZlZHx0brPF6CgHH+qKt
	 ANFwz81bXT8QDOKL7Yfb/mb+OS7367lCweOb6TF+HNEPpmA9200EtR505o8GYv2yYGyqI
	 Qr89ppVy9d5H6I69JIExdkDfMaD7k3oNwEYVp4H9YCcH7LsTjLegpSdBYpBNRB6LBhw2T
	 XJhrGepOHm2M0RN52eJ7CmCB99jjopqTSXNLjVgTMR/w2ExDOs86YlWKSUUJXQQDH68iQ
	 9dEOkCGory88KBWGa2TPhrdzmlYGt/RUNm7q+dp/LXyXpXj7epDRXQcb+GJjc2nvhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268962;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pbmX/uqxn8yhCkWVdVToI34WWKoGFOjfs0mbjo3EsYk=;
	b=oQxkeu8vl+4rqvrfqRHU0M1kHxrU44xhQNQlE/x2BkqQWq3ipwXbkzP4/A7dSVYuJFX8
	 QDdcQLx+mnPiWMUA97s7QNuSgemtitl+FqNjLgxXFh8lm9dn+/V1bd0QupZdwu7rliThk
	 vxkbSoLUNTATz9aZ6s67DrRKFIAlpVsC6m+BzjiMVQyEDaHW86aujFJUsSqEgQCndcoRB
	 s3phJoWgX0niQoObTO1A+1/Ux+GHazSVfF6zWQphVaqrpiIHai+c3Q6zJcGjdM4N8WeWn
	 tY63AiFCHoMrgPKn78ADYk2+nrzQOY5wH/qBVqEDeogrf/xPgArIf/QasJZX8svXWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AgHrqpVw;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i0+hGs95;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AgHrqpVw;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i0+hGs95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793268960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbmX/uqxn8yhCkWVdVToI34WWKoGFOjfs0mbjo3EsYk=;
	b=AgHrqpVwQKOBxZ6IA2H+26OukXFmj9qOXPL+/OEWM5q0AFyucmfFREvqIawNU6wwx/aKIy
	jqgutNZYIsSTemxbDvpU4UspB5tEVxOHDCtedRyMh56vFv56dhLZaQNFBno5Vks1N4NB/7
	Sr28xJDe89H/zuCkqLu68TjS8ciUO1o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-jRW6RxENN4mC8DCqevNAwQ-1; Thu, 29 Oct 2026 06:15:59 -0400
X-MC-Unique: jRW6RxENN4mC8DCqevNAwQ-1
X-Mimecast-MFC-AGG-ID: jRW6RxENN4mC8DCqevNAwQ_1793268958
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so1591511f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793268958; x=1793873758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pbmX/uqxn8yhCkWVdVToI34WWKoGFOjfs0mbjo3EsYk=;
        b=i0+hGs95YUTipFf9kSiMlyWv91Lpv6rvdpvR2b2w227zSIu8lhgoRBxmCUJJMSh8jN
         RiaeMaKo25dnWCdMWhTt6HgzVRlsKz6KkB1qcdGDDbEqoQOzgpgRRYBsirnJM0krfYwp
         M0DSu48CRl6ocUiNNMZELcEVAia8cNYJtpiXYU8ReVZqRHKG52Z9UxZRm1gqajkNxrG2
         laYFCLBvtah6kKNPycQpohU+B3WFDPGyfOFLyvHXy/i+L1bg1sufvMP3EJn2AJyuppod
         AEGawCeHnabjMuLr6/udboAg7AU1HBCuJ1AIi+tEnPfjGR3enHEdlDRj3XLc117u54uj
         U3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268958; x=1793873758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbmX/uqxn8yhCkWVdVToI34WWKoGFOjfs0mbjo3EsYk=;
        b=Pfyu8t4EF1qmZR8dbbeGBACxg4X5Yv+HQ+lTdCJsax7aUWtiR4Rl4+S5W+HCsoHVde
         cUCx/tUbfeDDhaAvitaWEFWwF1aMoDmQRS0OyJShGVgwzWhawXXEg9DVPXBp39uP5aIx
         IjMEThv15O6RE1IEWW6ZmxEI9KYqCxW1z9e78y8qcV4nS5NYnEQB51VEsTQWuInEoRhd
         22nrjpS/nVSnSfdRZ7BtJkcJ3tOYE5WhjlaIKnb6n5HsLJ7yB6akXPBzkNUYbiGYQurZ
         Isuye26oZ1KhXCM5fbzdI69wzcI6dCrngREQysAw97wz9ae5yoTWdAEqA8ijaxPXA7LS
         WPxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhozHOrY+kKA8LPl5vyHZrYc0EAu/m+U2RqdY2/PzVjibC+uUiQQiff/Z8ilKdqM6DDO2iZeiSlJbwKKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSa6PWll0eX3c2YznOXNNwYtZUbR/7GZdOdaz+8HOQnL/dq93e
	j8gZ4m0eghANeIx2FGPgo8NCRB9HvN+HABATHQ/OE1bRpFcy/cXNd7u4v7g2GEhTbo5z3GhkWGB
	2J0bM448t7f98BZ1kn03ueQ4neufyeFTc28cUo/ZDDoMccNLa+VdTLpAN8zgGDAdKDA==
X-Gm-Gg: AYBFou2InKthFaEBcJGe6Vle4limuOItdKXa91xkdVaMsOU4sENvtD4kGCYNteGkbGM
	K0tN+LDlF7lnBy/gzGafG1GmTPw11pf/QmuC1XU42htwK1WhW7cSY0BfeDANCbdx4IJpvda8lS7
	TPXqfm7qZbhTKu3mPweOiWIpgEO+nvhIl23wXufhc91U1Z37D4xp2nXOajGR3tyzGrvwRuTGK1B
	S9+ArmPKFzbdy6Abc2b3/7faxtZuFppKCKc9t0jGvkk0lzsyIBMYDvpLfBXyoe9odRM0fbTP57c
	+zPmW/OSju9+hv74GtYgBBDzGoLsnJW/EW1fix322gsNZ4aBR660aMYiRJ1gwoJxs8s7qOp3Odj
	Fzjds3UsdxMa7hQ3xVN4Ki+Fr75gRawb/MPfXxhy9R+s=
X-Received: by 2002:a05:6000:41c9:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e5d5a45cbmr11729605f8f.36.1793268957650;
        Thu, 29 Oct 2026 03:15:57 -0700 (PDT)
X-Received: by 2002:a05:6000:41c9:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e5d5a45cbmr11729540f8f.36.1793268957034;
        Thu, 29 Oct 2026 03:15:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm35294599f8f.51.2026.10.29.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:15:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:15:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, nicolinc@nvidia.com, jgg@nvidia.com
Subject: Re: [PATCH] virtio_pci: don't take the MSI mutex under
 cpu_hotplug_lock
Message-ID: <20261029061405-mutt-send-email-mst@kernel.org>
References: <20261029084043.19409-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261029084043.19409-1-zenghui.yu@linux.dev>

On Thu, Oct 29, 2026 at 04:40:43PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> Lockdep reports the following circular locking dependency when a virtio-net
> device is probed with lockdep enabled on a system whose devices sit behind
> an IOMMU:
> 
>     ======================================================
>     WARNING: possible circular locking dependency detected
>     7.3.0-rc1+ #84 Not tainted
>     ------------------------------------------------------
>     kworker/u34:0/57 is trying to acquire lock:
>     ffff800104f83ee8 (&md->mutex){+.+.}-{4:4}, at: msi_domain_get_virq+0xf0/0x118
> 
>     but task is already holding lock:
>     ffffc00081edd930 (cpu_hotplug_lock){++++}-{0:0}, at: cpus_read_lock+0x10/0x1c
> 
>     which lock already depends on the new lock.
> 
>     Chain exists of:
>       &md->mutex --> &group->mutex --> cpu_hotplug_lock
> 
> The cycle is composed of three dependencies:
> 
> * cpu_hotplug_lock -> &md->mutex (which triggers the splat). virtio_net's
>   init_vqs() calls cpus_read_lock() around virtnet_set_affinity(), which
>   reaches vp_set_vq_affinity(). That calls pci_irq_vector(), which takes
>   the per-device MSI mutex (&dev->msi.data->mutex) via
>   msi_domain_get_virq().
> 
> * &md->mutex -> &domain->mutex -> &group->mutex.  MSI-X allocation of any
>   device behind the IOMMU holds the MSI mutex while allocating interrupts
>   through the IRQ domain hierarchy. The MSI parent domain (GICv2m, or ITS
>   likewise) calls iommu_dma_prepare_msi() from its .alloc() to map the MSI
>   doorbell, which takes the IOMMU group mutex.
> 
> * &group->mutex -> cpu_hotplug_lock. bus_iommu_probe() calls
>   iommu_setup_dma_ops() under the group mutex; initializing the IOVA
>   rcaches registers a cpuhp instance, which takes cpu_hotplug_lock.
> 
> The cycle only became complete since commit 288683c92b1a ("iommu: Make
> iommu_dma_prepare_msi() into a generic operation"), where
> iommu_dma_prepare_msi() switched to use the group mutex.
> 
> pci_irq_vector() is a pure lookup of a vector that is bound to the
> queue for the whole lifetime of the queue, so there is no reason to
> take the MSI mutex for it from cpu hotplug locked contexts.
> 
> Cache the IRQ number in virtio_pci_vq_info {} at vector binding time and
> make vp_set_vq_affinity() use the cached value.
> 
> This also covers the CPU hotplug callbacks
> (virtnet_cpu_online/virtnet_cpu_dead), which call virtnet_set_affinity()
> with cpu_hotplug_lock already held.
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  drivers/virtio/virtio_pci_common.c | 12 +++++++++++-
>  drivers/virtio/virtio_pci_common.h |  3 +++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index b90c174450b2..2f42300a8a84 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -224,6 +224,16 @@ static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned int in
>  		goto out_info;
>  
>  	info->vq = vq;
> +
> +	/*
> +	 * Cache the Linux IRQ number so that later users (e.g.
> +	 * vp_set_vq_affinity() from cpu hotplug locked contexts)
> +	 * don't have to take the MSI mutex via pci_irq_vector().
> +	 */

I don't think this comment is helpful. Commit log is enough.

> +	info->virq = 0;
> +	if (msix_vec != VIRTIO_MSI_NO_VECTOR)
> +		info->virq = pci_irq_vector(vp_dev->pci_dev, msix_vec);

	else
		info->virq = 0;

	Please.

> +
>  	if (callback) {
>  		spin_lock_irqsave(&vp_dev->lock, flags);
>  		if (!vp_is_slow_path_vector(msix_vec))
> @@ -571,7 +581,7 @@ int vp_set_vq_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
>  
>  	if (vp_dev->msix_enabled) {
>  		mask = vp_dev->msix_affinity_masks[info->msix_vector];
> -		irq = pci_irq_vector(vp_dev->pci_dev, info->msix_vector);
> +		irq = info->virq;
>  		if (!cpu_mask)
>  			irq_update_affinity_hint(irq, NULL);
>  		else {
> diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
> index 8cd01de27baf..18b15a5f84ae 100644
> --- a/drivers/virtio/virtio_pci_common.h
> +++ b/drivers/virtio/virtio_pci_common.h
> @@ -40,6 +40,9 @@ struct virtio_pci_vq_info {
>  
>  	/* MSI-X vector (or none) */
>  	unsigned int msix_vector;
> +
> +	/* Linux IRQ number of msix_vector, or 0 if not mapped */
> +	unsigned int virq;
>  };
>  
>  struct virtio_pci_admin_vq {
> -- 
> 2.56.0

