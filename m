Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863A538D91
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174699; cv=pass; b=H89s7JC8BnDu4oY5RSNxc5IBex+ZkyKtegkSMBzd8CkXsOZJq/2TmjXe/qq+VOlZ27cBU64XRRDWALb2W9tuE7gLWUiEcYhMPFcaY0C7Ip10/dPbYiy/RcyRTl7BCiovsOsgRqILDSUiQ5k1+Gq25TAqx9DtB/jBTxHe4dgaCrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174699; c=relaxed/simple;
	bh=I4CXC8CBXPsAi9J4cmSHK94u4GgKkC4ll7iirgr4BVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDnJGjvVh+EjjWcijREr+qoDH/nOooNWVT3Qmf8wxMn3gMSilyuWjpFaYWWnmJTvVBE3AGoSSnpWR47pQLPyEaUmL0RZCuuOhMQRPQbnnkVdwtA4cIT5f4bW/jHg1Of4pCR+ZI8R968ZyIcJa+z2lL888SPu1t9JKYJfyw9VVrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9rblD8S; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9rblD8S"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so1388451a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790174695; cv=none;
        d=google.com; s=arc-20260327;
        b=HkoRGEKGM9VqkF75TjuElvSX4W+DY1yKXtivnpOLu+Py/MHaMrdn74ZDFWieD1ekpi
         NhUPwvPLgH4+W37xNFP+ndXviSuuC1twcGPJOH2UdxemalV+js0eWRHZia/NUYnfdn09
         O0xYLT2QU/MC02fuyT7eIJOF0pOyG+nGx0OpBuPtAicCMcZgzZowUFiTMLAZncdIldPE
         9B3aegv26M9Fv86uF6GeUupTnSe2geaDRN6vXzDL435qVQCq4GAGIgsQ21P5zjRSao4F
         qmVDBkLaudjmYQIxYTL2AsZHC3mYaSkHvHAmyA7fE63leM0XzbAEAKNUFZP9jdl3bobE
         Kicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        fh=AKtRos7mwUz/ekGXz2nlGR/NdcBVzMhC5ejRjgBKCi0=;
        b=Ld0NeFRpNeCUM/NvN3gHn97zopW8lOeX3yuPCkAiXbiVP8mcSgQ3DIdBwfQ81S9oCz
         bOcK2bp3xDqCis34MsQWc5FeWUELCGShiT7eTz+zXe+g9FQiJ45sHF53YtqpWivZGhpB
         tP8MzEQAofpLqIQ7eJTEwcuTqepMdVOw6Ar2sa7lXr2/rjkLgVRQaal4KMklUj/R8+Dd
         3isgL6kZkyFD2O7edzfYIAvT+oSgIOxA8O7/L4j/zhTrW98scniOSIAJkejlI5PrsPqZ
         IFKhGTp5MOmLHK3NxBvBGIKkAYuHEPnnU/6M6KN41kgPUeNtOm7ik7jb9wGVGLJ5+Ulj
         k9Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790174695; x=1790779495; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        b=y9rblD8S13fR2oMy4fWiX8dM2/TAcI6Jqmw2jUQQ9pv/gDVVmsmxRCUQbwSPpPrzwK
         lnC6FgzTSP+4Q0H5v2KNuNSbNd6827A5QSOtiigkpL6/F0E8XUVQmvEjQVIckwSgZcYs
         jLlA1etvlQF4efiMTiVm+vKq1KqK8JyZ7vGO/bOwHpFg1y53fYb1mK3NjqHsK9jALjAL
         WnUkX5k+2qqsZn4++ThU6AjI/pV5tQVB+ao9Y48ICNYU55tqPBkR8KT4FzbftabPUWf7
         nyEv3aBrlyjg2N9MdxyTQPFDnqIxRHw23YB1PDNe+XLzaYMNFvOAEAOF3TrgDsXsRKny
         CzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174695; x=1790779495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        b=V/4I/Kif+8VrCRDhoBggpLAufY0sfxByvLeCe7aAygmejJl+eA9lu+JeDz3MGdG1qe
         BGbWpmyPwQlF31QWOYeNkYjQvEFsHh1b0EBziwPlGCQecBjM2gCMGZ+nxtJd7eDvI7uJ
         o1NbP8c568mRfvQF8ETiNiy4ZHg/7hAni3FaYM+4HpbJblCNbZ8WxqK40OxkfaBzZGwr
         McpEzviGKLDQ2egrwqy1AzvBhEs7FAQi1K+jcqbYI6p2l7HtufCSQ7h40DMW7D++d08w
         +JLtPqFyS+89oz5CwJm8PzroNjU4ab832STgTp8kYwn6NYMzOHDl032TdrC55yZ1xuOM
         WclQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpum0+ulF9cGI9OIihcFGkcAk3YUiixlqWfgpJFwLd2Yk3d/cUFEwmN94G2lf8NdWKsQ5pr3R9aBIpgp8=@vger.kernel.org
X-Gm-Message-State: AFuF++nElF4eWKkVfOQFF7IJLrTJcJKYTGyFrm8lbdrYWtd8vL4v6kXY
	Z7VXfk6ns33LosL/89IfHNxDX90GRxqyF0dgOlY8iw+pTge5TX4vG04WZe6kn+ZVnV2cOXKC8fu
	SDKmQgk0pqnLn+JVBxn6gVTE+68xnBvUVlJQPRjvjcA==
X-Gm-Gg: AYBFou2wWSe7qHgXMHozUTLdW4twr5wFmXbG/rX4eUw44X7BNFYjjS74033BC7TPnE3
	MBc+IjBs81E+6DHV7PIRIlx3MjXmUEz+BKvVWIEUwZS5sLOv2bjKzR1u12hC3/nzmkz3MHBD6WN
	W9J9iwWS5XLMq8srP+x5tlJZwfNybzEHbxakCettoRcCj7jPn7mn7WI2Hbf57z9672Q/4jU7ZdF
	LIgSXz3w7wADdutpUSTJUhL5OrqIq+iEz481zlZ+EF8jRMxkGyO6/RNi8jKOZ8/86NZ6BP1X0Ky
	GBdQkmEy/Xj2FstINeMocsEAcDLU6zL8LAOcg3uY7ulKqw7PIjPn/mqmXdQ4dvoEzWdakuEB1DP
	CD/3Exyj/DXk=
X-Received: by 2002:a05:6402:378a:b0:6aa:9851:6d5c with SMTP id
 4fb4d7f45d1cf-6aab3b2954fmr2562437a12.19.1790174694197; Wed, 23 Sep 2026
 07:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s> <arLXthhYbKkwZ9zY@bywater>
In-Reply-To: <arLXthhYbKkwZ9zY@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:44:41 -0600
X-Gm-Features: AclHuK98k2uTxSqJLFP90Hvvkb8R20Qb9iAi3e_cMJ5VQjy6TOoZ99TlQSDABtg
Message-ID: <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > Depending on the driver originating them, data buffers used for virtio
> > > communication can either:
> > >
> > >   - already be allocated from the coherent memory area that is
> > >     accessible by the remote processor; this is the case of rpmsg
> > >     and the rproc flavor of virtio-console;
> > >   - be allocated from generic kmem, and thus not accessible directly by
> > >     the remote processor.
> > >
> > > Exploiting the map operations, which are used by the virtio framework
> > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > bounce buffering for the second case: when the map() callback is called
> > > for a buffer, one or more pages of coherent memory are allocated and
> > > data is copied to them, then they are exposed to the remote processor;
> > > the data is  then bounced back on unmap().
> > >
> > > The first case is not impacted, since buffers already suitable for
> > > remote transmission are passed through.
> > >
> > > With the bounce buffering in place, any kind of virtio device can be
> > > supported through the remoteproc-virtio transport, at least from a
> > > data exchange standpoint.
> >
> > Is this _necessary_ for the imx93 platform you are implementing feature for?
> >
>
> If I don't want to fundamentally change how the remoteproc integration
> works (i.e.: using buffers only from a pre-shared area), yes. While in
> my test environment the Cortex-M33 serving as remoteproc is able to
> access the whole RAM space, that is not always the case.

The first sentence tells me it is mandatory while the second says it
is not.  I understand the use case but don't want to bloat the
subsystem with code that is trying to address a problem you currently
don't have.


> This is even more important for mixed-criticality-ready processors (say:
> i.MX95), where access to different memory areas si defined even before
> the various application cores are started.
>
> For the sake of completeness, there *might be* a completely different
> approach that would work: modify every virtio driver to make sure they
> allocate buffers from the pre-shared memory area (that is, the coherent
> memory pool). That approach would even avoid the bounce buffering and
> allow for zero-copy transmission. I even started working on that,
> defining virtio helpers to do the allocations instead of using raw
> kmallocs, but then I dropped the idea because of the magnitude of the
> changes required.
>
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 182 +++++++++++++++++++++++++++++++--
> > >  include/linux/remoteproc.h             |  14 +++
> > >  2 files changed, 190 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index cfd66d9d1c9e..d21b3b8044df 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -241,7 +241,14 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
> > >     dev_dbg(&vdev->dev, "reset !\n");
> > >  }
> > >
> > > -/* provide the vdev features as retrieved from the firmware */
> > > +/* Provide the vdev features as retrieved from the firmware, plus the following
> > > + * additional ones:
> > > + *   - VIRTIO_F_VERSION_1 that is required by some non-rpmsg virtio devices
> > > + *   - VIRTIO_F_ACCESS_PLATFORM to force usage of the map operations
> > > + */
> > > +#define RPROC_VIRTIO_STATIC_FEATURES \
> > > +   ((1ULL << VIRTIO_F_VERSION_1) | (1ULL << VIRTIO_F_ACCESS_PLATFORM))
> > > +
> > >  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  {
> > >     struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> > > @@ -249,7 +256,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >
> > >     rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >
> > > -   return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > > +   return rsc->dfeatures | RPROC_VIRTIO_STATIC_FEATURES;
> > >  }
> > >
> > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > @@ -275,16 +282,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >     /* Give virtio_rproc a chance to accept features. */
> > >     rproc_transport_features(vdev);
> > >
> > > -   /* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > +   /* Make sure we don't have any features > 32 bits */
> > >     if (WARN_ON_ONCE((u32)vdev->features !=
> > > -                    (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > +                    (vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES)))
> > >             return -1;
> > >
> > >     /*
> > >      * Remember the finalized features of our vdev, and provide it
> > >      * to the remote processor once it is powered on.
> > >      */
> > > -   rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > > +   rsc->gfeatures = vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES;
> > >
> > >     return 0;
> > >  }
> > > @@ -337,6 +344,151 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
> > >     .set            = rproc_virtio_set,
> > >  };
> > >
> > > +static inline unsigned int rproc_virtio_bounce_slot(struct device *dma_dev,
> > > +                                               dma_addr_t dma_handle)
> > > +{
> > > +   const dma_addr_t dma_base = dma_dev_coherent_base(dma_dev);
> > > +
> > > +   return (dma_handle - dma_base) >> PAGE_SHIFT;
> > > +}
> > > +
> > > +static dma_addr_t rproc_virtio_map_page(union virtio_map map, struct page *page,
> > > +                                   unsigned long offset, size_t size,
> > > +                                   enum dma_data_direction dir,
> > > +                                   unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > +   dma_addr_t dma_base = dma_dev_coherent_base(dev);
> > > +   size_t dma_size = dma_dev_coherent_size(dev);
> > > +   phys_addr_t paddr = page_to_phys(page) + offset;
> > > +   void *vaddr = page_to_virt(page) + offset;
> > > +   struct rproc_map_record *record;
> > > +   dma_addr_t map_handle;
> > > +   void *bounce;
> > > +
> > > +   // No need to allocate a bounce buffer if the memory to map is already
> > > +   // part of the device's coherent pool.
> > > +   if (paddr >= dma_base && paddr < (dma_base + dma_size)) {
> > > +           // The allocation details will be recorded also in this case,
> > > +           // indicating that no bounce buffer was allocated.
> > > +           map_handle = (dma_addr_t)paddr;
> > > +           bounce = NULL;
> > > +   } else {
> > > +           // Allocate bounce buffer from device coherent memory
> > > +           bounce = dma_alloc_coherent(dev, size, &map_handle, GFP_KERNEL | __GFP_ZERO);
> > > +           if (!bounce)
> > > +                   return DMA_MAPPING_ERROR;
> > > +
> > > +           // Copy data to bounce buffer
> > > +           memcpy(bounce, vaddr, size);
> > > +   }
> > > +
> > > +   // Save bounce details
> > > +   record = &rvdev->map_records[rproc_virtio_bounce_slot(dev, map_handle)];
> > > +
> > > +   record->original = vaddr;
> > > +   record->size = size;
> > > +   record->bounce = bounce;
> > > +
> > > +   return map_handle;
> > > +}
> > > +
> > > +static void rproc_virtio_unmap_page(union virtio_map map, dma_addr_t map_handle,
> > > +                               size_t size, enum dma_data_direction dir,
> > > +                               unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > +   unsigned int slot = rproc_virtio_bounce_slot(dev, map_handle);
> > > +   struct rproc_map_record *record = &rvdev->map_records[slot];
> > > +
> > > +   WARN_ON(size != record->size);
> > > +
> > > +   // If a bounce buffer was used, copy data back to original one
> > > +   if (record->bounce) {
> > > +           memcpy(record->original, record->bounce, record->size);
> > > +
> > > +           dma_free_coherent(dev, record->size, record->bounce, map_handle);
> > > +   }
> > > +
> > > +   record->original = NULL;
> > > +   record->size = 0;
> > > +   record->bounce = NULL;
> > > +}
> > > +
> > > +static void rproc_virtio_sync_single_for_cpu(union virtio_map map,
> > > +                                        dma_addr_t map_handle,
> > > +                                        size_t size,
> > > +                                        enum dma_data_direction dir)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_sync_single_range_for_cpu(dev, (map_handle & PAGE_MASK),
> > > +                                 offset_in_page(map_handle), size, dir);
> > > +}
> > > +
> > > +static void rproc_virtio_sync_single_for_device(union virtio_map map,
> > > +                                           dma_addr_t map_handle,
> > > +                                           size_t size,
> > > +                                           enum dma_data_direction dir)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_sync_single_range_for_device(dev, (map_handle & PAGE_MASK),
> > > +                                    offset_in_page(map_handle), size, dir);
> > > +}
> > > +
> > > +static void *rproc_virtio_alloc(union virtio_map map, size_t size,
> > > +                           dma_addr_t *map_handle, gfp_t gfp)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_alloc_coherent(dev, size, map_handle, gfp);
> > > +}
> > > +
> > > +static void rproc_virtio_free(union virtio_map map, size_t size, void *vaddr,
> > > +                         dma_addr_t map_handle, unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_free_coherent(dev, size, vaddr, map_handle);
> > > +}
> > > +
> > > +static bool rproc_virtio_need_sync(union virtio_map map, dma_addr_t map_handle)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_need_sync(dev, map_handle);
> > > +}
> > > +
> > > +static int rproc_virtio_mapping_error(union virtio_map map, dma_addr_t map_handle)
> > > +{
> > > +   if (unlikely(map_handle == DMA_MAPPING_ERROR))
> > > +           return -ENOMEM;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static inline size_t rproc_virtio_max_mapping_size(union virtio_map map)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_dev_coherent_size(dev);
> > > +}
> > > +
> > > +static const struct virtio_map_ops rproc_virtio_map_ops = {
> > > +   .map_page = rproc_virtio_map_page,
> > > +   .unmap_page = rproc_virtio_unmap_page,
> > > +   .sync_single_for_cpu = rproc_virtio_sync_single_for_cpu,
> > > +   .sync_single_for_device = rproc_virtio_sync_single_for_device,
> > > +   .alloc = rproc_virtio_alloc,
> > > +   .free = rproc_virtio_free,
> > > +   .need_sync = rproc_virtio_need_sync,
> > > +   .mapping_error = rproc_virtio_mapping_error,
> > > +   .max_mapping_size = rproc_virtio_max_mapping_size,
> > > +};
> > > +
> > >  /*
> > >   * This function is called whenever vdev is released, and is responsible
> > >   * to decrement the remote processor's refcount which was taken when vdev was
> > > @@ -355,6 +507,8 @@ static void rproc_virtio_dev_release(struct device *dev)
> > >     of_reserved_mem_device_release(&rvdev->pdev->dev);
> > >     dma_release_coherent_memory(&rvdev->pdev->dev);
> > >
> > > +   kvfree(rvdev->map_records);
> > > +
> > >     put_device(&rvdev->pdev->dev);
> > >  }
> > >
> > > @@ -429,13 +583,29 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >             of_reserved_mem_device_init_by_idx(dev, np, 0);
> > >     }
> > >
> > > +   /* Allocate one tracking record for each page of the device reserved
> > > +    * memory. Contiguous memory is not required for this array, which can
> > > +    * also be quite big (depending on the size of the coherent memory), so
> > > +    * let's use vmalloc for this allocation.
> > > +    */
> > > +   rvdev->map_records = kvcalloc(dma_dev_coherent_size(dev) >> PAGE_SHIFT,
> > > +                                 sizeof(*rvdev->map_records),
> > > +                                 GFP_KERNEL);
> > > +   if (!rvdev->map_records) {
> > > +           dev_err(dev, "failed to allocate memory for map records\n");
> > > +           return -ENOMEM;
> > > +   }
> > > +
> > >     /* Allocate virtio device */
> > >     vdev = kzalloc_obj(*vdev);
> > > -   if (!vdev)
> > > +   if (!vdev) {
> > > +           kvfree(rvdev->map_records);
> > >             return -ENOMEM;
> > > +   }
> > >
> > >     vdev->id.device = id;
> > >     vdev->config = &rproc_virtio_config_ops;
> > > +   vdev->map = &rproc_virtio_map_ops;
> > >     vdev->dev.parent = dev;
> > >     vdev->dev.release = rproc_virtio_dev_release;
> > >
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index c3ba51fe9e54..2ff48b505ac0 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -339,10 +339,23 @@ struct rproc_vring {
> > >     struct virtqueue *vq;
> > >  };
> > >
> > > +/**
> > > + * struct rproc_map_record - remoteproc map record
> > > + * @original:      original virtual address
> > > + * @num: allocation size
> > > + * @bounce: bounce buffer virtual address (NULL if not used)
> > > + */
> > > +struct rproc_map_record {
> > > +   void *original;
> > > +   size_t size;
> > > +   void *bounce;
> > > +};
> > > +
> > >  /**
> > >   * struct rproc_vdev - remoteproc state for a supported virtio device
> > >   * @subdev: handle for registering the vdev as a rproc subdevice
> > >   * @pdev: remoteproc virtio platform device
> > > + * @map_records: array of map records
> > >   * @id: virtio device id (as in virtio_ids.h)
> > >   * @node: list node
> > >   * @rproc: the rproc handle
> > > @@ -358,6 +371,7 @@ struct rproc_vdev {
> > >     unsigned int id;
> > >     struct list_head node;
> > >     struct rproc *rproc;
> > > +   struct rproc_map_record *map_records;
> > >     u32 rsc_offset;
> > >     u32 index;
> > >     unsigned int num_vrings;
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>
