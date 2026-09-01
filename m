Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B6472076
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252221; cv=none; b=tBRIef5wo/PUv9luJw8CZGq+SKVzJhCLlz3UlneEmY5FMW0woLUFClbigww/HQYIobxWGYpgGUmjqRHFUD60MwFvhxTKlaKExLnxUTXJarVa5PLHs5JKQP17cTrjSdKXpizWYbvWhAyZKNi8FAib0Fy+/We+XL8xuO4N3TzHNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252221; c=relaxed/simple;
	bh=fpSg8SZj0wuZT7mTd0XitnhxIgRcQCGbPDm6uMJ3YGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMdbIG0p139Y53FMmYs77bOm0MJFwlQqOb6HAoKPIHgFHBpOhx7ghL0yNhNf4QTcdbf73+GWxIwO6CLHLi6BWgxY6DMTktaN7v57bkrzGxueUr91sR3ySh/RLJ0Q1OWPRSutLm6PIMKpNhhwQjAlAnS8NKOSba9tE5OBUSCGQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+q94mKI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=biOkjB9E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+q94mKI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="biOkjB9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788252213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cOksFdL0zhMREEMQlcCrWMjyvNLEaJ3NZ0IB+qtaUvg=;
	b=Q+q94mKI0lBPqoMS5Ag4/Zba4RbWoqolg368iUzkD7vIh68u1UilQWLV6CDL5+2dIFO9Bk
	Jc66qgQyiahjVr1u5aGeBRlGRbCGNdbFAVJ8ZvVo1o6WZjEKaAr1Oi0sbhUldWqhz98kLk
	VFoeeIbGbcsrCCBT8F3MEgylIGB3dXs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-FZKUYUnyO92f1u03GIDWQQ-1; Tue, 01 Sept 2026 04:43:27 -0400
X-MC-Unique: FZKUYUnyO92f1u03GIDWQQ-1
X-Mimecast-MFC-AGG-ID: FZKUYUnyO92f1u03GIDWQQ_1788252206
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495569acf8dso21376015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788252206; x=1788857006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cOksFdL0zhMREEMQlcCrWMjyvNLEaJ3NZ0IB+qtaUvg=;
        b=biOkjB9ElVIBZiYIoyHM6ENMQ/YQoc5eRk1lZIH9s7G4i1vglYfbVaJuORSOZ6GBtM
         YHIKCt6E2+hpz4Hwi+tliXffkExyjtMvmCacZzViYclpLc7+EtjHSnbVRcuAhxsAow6W
         5gRb9shD6x5yaAG3rHc/vOoE+NfFZT/XdPZDOODfrN7p8BCEHbAYRDHym3FKnKU/klOe
         NoqVChrFHFr+kxyvSBigRsXMFet3h0P4SP8P5qMo/NUZPdquHenXFG3P50PFx7c1lM15
         1jpsYX+2e4Sfd5Bh5/RK6dHyLnI7Q+GvdgkzYnEMj2cESH37kSsZpFdDQ/PNeV24qbYe
         pbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252206; x=1788857006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOksFdL0zhMREEMQlcCrWMjyvNLEaJ3NZ0IB+qtaUvg=;
        b=aYaxztzCGqFfsewbbjMyx3WlWZ5WjdVdPmKqX3vETBZsYrfIDH4yEDqI1dvE1q8ZFZ
         bCdfuGL0as0ddKILYjoCtZUgzJzSt7xtf77R/b/8JzSVZ5QxTKQSuY+4dINSaAVD/PF2
         XmNovWEyE/1jjpt74BMzMpmogzJHYH0KMfawutxN+hu4euKLBmiAtCUewWkiSmHqVFTX
         utWNaeT/7/uM6IYU8seK4mYTHPgvTjXD/oV+3nC+XjsZJHiTIO9cURBtswEs/jCtkz/9
         Q/aEC51KJ9jqBibfQpeJ7Wz5B/w/H5EZbRwisCG8xCWfUuQDz7k7Fa71gpt+A8477puR
         9eTw==
X-Forwarded-Encrypted: i=1; AHgh+RqejclsEekWOum2iuTeaMvuRssffofKqQa56tFJffMWwvFgUYAIgfCXZ+zdH2uzcMaCLqs0fA44DFTCqXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mZzlrqAj1e1WTTJE3hmsEf7fHCSQtyklgKWz5gt0j+EMpWp+BR
	rqJ6G7gKwb4pMnNB5bVUJZv5Oddea0ftUQS93IztQdd9SiHi+/cNtrToAtiXWr/rpOqL/mQbafs
	GBGuNaRzXj1hsUH256npcMtFAfJ6q2jtCryI9MLUYTBKazPq069DUz6zxiPMQ6j7QmA==
X-Gm-Gg: AR+sD13G4ASqMxyWLndZVCg+byAof43FMePdMs1R+PabmNNFp2AnYHBY6ypien/6tf8
	ss2UJ8k4MfyRS2rajiFww6/aid9OMbFuGE3kW/oAVP4QszwzKJkRboceltfHx+BghV6fbN3kr4V
	84VFlEpRaDShzmQPJ+XFTylOLd/R7pcC2XG9jV6i9rcH4kplO7c3nog3Kr1VfltUKIF/DHWBob+
	Kg3Dnx1MTma2CpwSFjiZOCXocx2WXxR5r0Rg0xFGKS9GsCi6LWEGSRdrxNcy+rZTOX23CfSxBgV
	aZBmEI4LjE4693AMSarJNJEknoSvSun76ejg52d0/zWD/TkgsUigNpKqas/JhfoZ0uD+TM+XVMQ
	5zf6sVT7ClmkCrxoa8Y6z7y0=
X-Received: by 2002:a05:600c:6215:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49cdc422c50mr130236005e9.1.1788252205628;
        Tue, 01 Sep 2026 01:43:25 -0700 (PDT)
X-Received: by 2002:a05:600c:6215:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49cdc422c50mr130234645e9.1.1788252204945;
        Tue, 01 Sep 2026 01:43:24 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0d4f3sm55085995e9.5.2026.09.01.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:43:24 -0700 (PDT)
Date: Tue, 1 Sep 2026 04:43:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: alistair23@gmail.com
Cc: eperezma@redhat.com, linux-kernel@vger.kernel.org,
	xuanzhuo@linux.alibaba.com, jasowangio@gmail.com,
	linux-scsi@vger.kernel.org, mkp@kernel.org,
	virtualization@lists.linux.dev,
	James.Bottomley@hansenpartnership.com, alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 1/2] virtio_pci: Add a quirk to force DMA Map API for
 certain legacy devices
Message-ID: <20260901043810-mutt-send-email-mst@kernel.org>
References: <20260901014650.2728658-1-alistair.francis@wdc.com>
 <20260901014650.2728658-2-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901014650.2728658-2-alistair.francis@wdc.com>

On Tue, Sep 01, 2026 at 11:46:49AM +1000, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Legacy virtio devices only have 32 feature bits and therefore can't
> set the VIRTIO_F_ACCESS_PLATFORM (bit 33) feature. This means the
> vring_use_map_api() function will return false.
> 
> Currently Linux endpoint devices use the legacy virtio interface as
> they aren't able to advertise the Common configuration capability.
> As most PCI endpoint capable PCIe controllers do not allow modifying the
> capability list, and thus are unable to advertise the Common configuration
> capability. This means the device's inbound TLPs fault on the host
> SMMU because the vring descriptors carry raw physical addresses.
> 
> This quirk forces a subset of legacy virtio devices to use the
> DMA Map API (vring_use_map_api() will return true), which fixes this
> issue.
> 
> This doesn't affect existing devices as we are checking for an
> otherwise invalid vendor ID.
> 
> Ideally we would update the endpoint devices (like scsi-pci-epf)
> to not use the legacy virtio interface, but lots of endpoint
> hardware (like the one in the RK3588) doesn't allow us to add
> custom capabilities.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

I don't much like hacks around DMA API, it is very fragile already.

So, here's an idea:

put all the capabilities simply at a fixed offset in a memory BAR.

it's a small spec extension, but saves a lot of trouble IMHO.

And in fact, people already complained that legacy pci config space
should be avoided.

What do you say?


> ---
>  drivers/virtio/virtio_pci_legacy.c | 27 +++++++++++++++++++++++++++
>  drivers/virtio/virtio_ring.c       |  7 +++++++
>  include/linux/virtio.h             |  5 +++++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> index d9cbb02b35a1..7b529bd451bb 100644
> --- a/drivers/virtio/virtio_pci_legacy.c
> +++ b/drivers/virtio/virtio_pci_legacy.c
> @@ -16,6 +16,7 @@
>  
>  #include "linux/virtio_pci_legacy.h"
>  #include "virtio_pci_common.h"
> +#include <linux/virtio_ids.h>
>  
>  /* virtio config->get_features() implementation */
>  static u64 vp_get_features(struct virtio_device *vdev)
> @@ -220,6 +221,32 @@ int virtio_pci_legacy_probe(struct virtio_pci_device *vp_dev)
>  
>  	vp_dev->vdev.config = &virtio_pci_config_ops;
>  
> +	/*
> +	 * Legacy virtio devices only have 32 feature bits and therefore can't
> +	 * set the VIRTIO_F_ACCESS_PLATFORM (bit 33) feature. This means the
> +	 * vring_use_map_api() function will return false.
> +	 *
> +	 * Currently Linux endpoint devices use the legacy virtio interface as
> +	 * they aren't able to advertise the Common configuration capability.
> +	 * This means the device's inbound TLPs fault on the host SMMU because
> +	 * the vring descriptors carry raw physical addresses.
> +	 *
> +	 * This quirk forces a subset of legacy virtio devices to use the
> +	 * DMA Map API (vring_use_map_api() will return true), which fixes this
> +	 * issue.
> +	 *
> +	 * This doesn't affect existing devices as we are checking for an
> +	 * otherwise invalid vendor ID.
> +	 *
> +	 * Ideally we would update the endpoint devices (like scsi-pci-epf)
> +	 * to not use the legacy virtio interface, but lots of endpoint
> +	 * hardware (like the one in the RK3588) doesn't allow us to add
> +	 * custom capabilities.
> +	 */
> +	if (pci_dev->subsystem_vendor == 0xFFFF &&
> +	    pci_dev->subsystem_device == VIRTIO_ID_SCSI)
> +		vp_dev->vdev.force_use_map_api = true;
> +
>  	vp_dev->config_vector = vp_config_vector;
>  	vp_dev->setup_vq = setup_vq;
>  	vp_dev->del_vq = del_vq;
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 5c169fbb418a..c8f62180c9d3 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -384,6 +384,13 @@ static bool vring_use_map_api(const struct virtio_device *vdev)
>  	if (!virtio_has_dma_quirk(vdev))
>  		return true;
>  
> +	/*
> +	 * A quirk set by certain legacy devices to force us to
> +	 * pretend the VIRTIO_F_ACCESS_PLATFORM feature is enabled.
> +	 */
> +	if (vdev->force_use_map_api)
> +		return true;
> +
>  	/* Otherwise, we are left to guess. */
>  	/*
>  	 * In theory, it's possible to have a buggy QEMU-supposed
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index f923e42cfd01..305c331f33f1 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -151,6 +151,10 @@ struct virtio_admin_cmd {
>   * @config_driver_disabled: configuration change reporting disabled by
>   *                          a driver
>   * @config_change_pending: configuration change reported while disabled
> + * @force_use_map_api: A quirk set by certain legacy devices to force us
> + *                     to pretend the VIRTIO_F_ACCESS_PLATFORM feature is
> + *                     enabled. Set by transports that have no way to
> + *                     negotiate ACCESS_PLATFORM but sit behind a real IOMMU.
>   * @config_lock: protects configuration change reporting
>   * @vqs_list_lock: protects @vqs.
>   * @dev: underlying device.
> @@ -173,6 +177,7 @@ struct virtio_device {
>  	bool config_core_enabled;
>  	bool config_driver_disabled;
>  	bool config_change_pending;
> +	bool force_use_map_api;
>  	spinlock_t config_lock;
>  	spinlock_t vqs_list_lock;
>  	struct device dev;
> -- 
> 2.55.0

