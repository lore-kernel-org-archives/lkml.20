Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605545;
	b=j84rsMSFaRyfsQFsD9Yuaui14iHeZJt2IpKZmcO301rwdECCx6wI9zx4g9hTYY+zVt9n
	 Nix4MnaXXXQ/4QKLRVd73GNEG2Gurz2TyswwIueCbtgJE3ApHwIKwM8UhxyqUccOyTF7u
	 IQ5Fyog+S/Dt9fsPNg3rq7uzXO5excimtTcFy0/1HRbp+hJ48heQHC+GVKSapSOIRYaZR
	 fRbGY3hEL9z47HMA/4Snn/wQmex1AA3+cgCY7W+lU1ZO+iqbPbQ4yQI+z40/HNUmUoid9
	 rMmHZS5hee1weyWNPumKJ2oN9yvbyBuopDTsfp7/4iDaowkzHvtpxiPoOyc7F4nT8Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605545;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6VMduDmQMGNa5Y2H0M9gFEBcSWL8g4wfZV1TeE/oAPs=;
	b=5TVp4fYg7BPyLcolcwlFvdWDRDZkuvj0MIZeMamJtFWEoDqk/SveCh9R9LH1XOP/ySmr
	 ZoKYcfw/w/Qj/8c1nZ/e2TwYJ8iWt6ZW1pnjhvd51id6aimWPBonQzCqT2qvnJtJWKXcd
	 m9LypYJVO8Mcsm/+vqxnf/sosNPlJJ6Uehy/it9xaTB8IYTHa9wMRvGgoVmYtsfQnVqgw
	 yF7c1EBbSjVEXMRD4U5v0hgRCOhwnyslhW6Zfi2gHc3HXiQj4MAfwK4L41ofFOpiVhv/7
	 wvPacQLtBBgaBKC/XePeCkIqyEKYQbYfCsqQAqG1RCCiyRa9YDMOW3MeLqXPkPS1kkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nV8NGEa9;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22107606A319;
	Wed, 21 Oct 2026 17:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22107606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nV8NGEa9
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDEF88FD;
	Wed, 21 Oct 2026 19:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792605414;
	bh=CeGx70QYH+Vgr/XX91xzxQaYe29xYTykgTq8ekxCnbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nV8NGEa9DlItx0C5J8Wp+vK0ruYpHgQBz6kAry81+VG+fw+7Qb5YNJSYCq8+cdpkO
	 3rPaJHB/MCKouHvKdNaJibWs2kylG8d1cEee+DaLYnbuzxBIIXxzxqmS5DEAhI9Cco
	 7zVF+t5HCbpcwSKFuHv1tGzvzqOBO1YfN1EnQAk8=
Date: Wed, 21 Oct 2026 20:59:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-media@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
Message-ID: <20261021175900.GG15441@killaraus.ideasonboard.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
 <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>

On Thu, Oct 22, 2026 at 01:20:45AM +0900, Tomasz Figa wrote:
> On Mon, Oct 19, 2026 at 4:14 PM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > Drivers must bracket CPU access to imported DMA-BUFs with
> > dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
> >
> > Add a queue flag to do so from buf_prepare() through buf_finish(). Use
> > read access for output and write access for capture. Map imports
> > bidirectionally because CPU and device access directions are opposite.
> > Pass the mapping direction to attach_dmabuf() so USERPTR and MMAP keep
> > the queue's normal direction.
> 
> This isn't right. For the regular vb2 mem ops (dma-sg, dma-contig), a
> buffer in the prepared state is expected to be ready for hardware
> usage, meaning only the hardware can access it until the buffer is
> finished. The vmalloc ops are special in a way that CPU is the
> "hardware".
> 
> > Keep this opt-in because some vb2-vmalloc drivers pass buffers to
> > hardware. End access in process context because DMA-BUF callbacks may
> > sleep.
> 
> That is at least unexpected, but also probably wrong (I haven't
> checked all the drivers) - the vmalloc mem ops are expected to be used
> by drivers that only access the buffer contents from the CPU.
> 
> Putting all the above together, what I think we need is:
>  1) prepare/finish ops in vb2_vmalloc_memops to invoke the
> dma_buf_begin/end_cpu_access() API if the buffer is backed by a
> DMA-buf,
>  2) some vb2 API for drivers using the regular (dma-) memops to invoke
> the dma_buf_begin/end_cpu_access() API for them when they need to
> perform some CPU accesses to the buffers - typically they would do
> that in their vb2_ops::buf_prepare/finish callbacks, but definitelly
> must not after the buffer is already prepared.
> 
> It sounds like this series focuses on uvcvideo and vivid, which likely
> means that 1) alone would be enough to fix the original problem. WDYT?

I think the dma-buf API doesn't give us what we need. Cleaning the CPU
cache through end_cpu_access() when the producer is done writting to the
buffer is right in some use cases, but not in all of them. It assumes
that the next consumer will access the data through DMA, which isn't
always the case. What I think we need is to track the state of the
cache(s) in the dma_buf, and perform cache management operations
accordingly when needed. In the uvcvideo -> display use case for
instance, the dma_buf should track that the CPU cache is dirty when
finishing CPU access, and should be cleaned on the display side before
performing the DMA. In a use case where the producer would DMA to the
buffer, cache management would be skipped as the dma_buf would see that
the cache is not dirty.

> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 83 ++++++++++++++++++-
> >  .../common/videobuf2/videobuf2-dma-contig.c   |  5 +-
> >  .../media/common/videobuf2/videobuf2-dma-sg.c |  5 +-
> >  .../common/videobuf2/videobuf2-vmalloc.c      |  5 +-
> >  include/media/videobuf2-core.h                | 12 ++-
> >  5 files changed, 101 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index 460eaf4e82f78..d2a78cd0a86bb 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -371,6 +371,65 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
> >                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
> >  }
> >
> > +/* Output buffers are read by the driver; capture buffers are written. */
> > +static enum dma_data_direction vb2_cpu_access_dir(const struct vb2_queue *q)
> > +{
> > +       return q->is_output ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > +}
> > +
> > +static bool __vb2_dmabuf_is_duplicate(const struct vb2_buffer *vb,
> > +                                     unsigned int plane)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < plane; i++)
> > +               if (vb->planes[i].dbuf == vb->planes[plane].dbuf)
> > +                       return true;
> > +
> > +       return false;
> > +}
> > +
> > +static void __vb2_buf_end_cpu_access(struct vb2_buffer *vb,
> > +                                    unsigned int num_planes)
> > +{
> > +       struct vb2_queue *q = vb->vb2_queue;
> > +       enum dma_data_direction dir = vb2_cpu_access_dir(q);
> > +       unsigned int plane;
> > +
> > +       for (plane = 0; plane < num_planes; plane++) {
> > +               int ret;
> > +
> > +               if (__vb2_dmabuf_is_duplicate(vb, plane))
> > +                       continue;
> > +
> > +               ret = dma_buf_end_cpu_access(vb->planes[plane].dbuf, dir);
> > +               if (ret)
> > +                       pr_warn_ratelimited("[%s] failed to end CPU access to dmabuf plane %u: %d\n",
> > +                                           q->name, plane, ret);
> > +       }
> > +}
> > +
> > +static int __vb2_buf_begin_cpu_access(struct vb2_buffer *vb)
> > +{
> > +       struct vb2_queue *q = vb->vb2_queue;
> > +       enum dma_data_direction dir = vb2_cpu_access_dir(q);
> > +       unsigned int plane;
> > +       int ret;
> > +
> > +       for (plane = 0; plane < vb->num_planes; plane++) {
> > +               if (__vb2_dmabuf_is_duplicate(vb, plane))
> > +                       continue;
> > +
> > +               ret = dma_buf_begin_cpu_access(vb->planes[plane].dbuf, dir);
> > +               if (ret) {
> > +                       __vb2_buf_end_cpu_access(vb, plane);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  /*
> >   * __setup_offsets() - setup unique offsets ("cookies") for every plane in
> >   * the buffer.
> > @@ -1423,6 +1482,9 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> >         }
> >
> >         if (reacquired) {
> > +               enum dma_data_direction attach_dir = q->uses_cpu_access ?
> > +                       DMA_BIDIRECTIONAL : q->dma_dir;
> > +
> >                 if (vb->planes[0].mem_priv) {
> >                         vb->copied_timestamp = 0;
> >                         call_void_vb_qop(vb, buf_cleanup, vb);
> > @@ -1453,7 +1515,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> >                                                   vb,
> >                                                   q->alloc_devs[plane] ? : q->dev,
> >                                                   planes[plane].dbuf,
> > -                                                 planes[plane].length);
> > +                                                 planes[plane].length,
> > +                                                 attach_dir);
> >                         if (IS_ERR(mem_priv)) {
> >                                 dprintk(q, 1, "failed to attach dmabuf\n");
> >                                 ret = PTR_ERR(mem_priv);
> > @@ -1504,9 +1567,21 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
> >                 }
> >         }
> >
> > +       if (q->uses_cpu_access) {
> > +               ret = __vb2_buf_begin_cpu_access(vb);
> > +               if (ret) {
> > +                       dprintk(q, 1, "failed to begin CPU access to dmabuf: %d\n",
> > +                               ret);
> > +                       call_void_vb_qop(vb, buf_cleanup, vb);
> > +                       goto err_put_vb2_buf;
> > +               }
> > +       }
> > +
> >         ret = call_vb_qop(vb, buf_prepare, vb);
> >         if (ret) {
> >                 dprintk(q, 1, "buffer preparation failed\n");
> > +               if (q->uses_cpu_access)
> > +                       __vb2_buf_end_cpu_access(vb, vb->num_planes);
> >                 call_void_vb_qop(vb, buf_cleanup, vb);
> >                 goto err_put_vb2_buf;
> >         }
> > @@ -1756,6 +1831,8 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int c
> >
> >                 __vb2_buf_mem_finish(vb);
> >                 call_void_vb_qop(vb, buf_finish, vb);
> > +               if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
> > +                       __vb2_buf_end_cpu_access(vb, vb->num_planes);
> >                 vb->prepared = 0;
> >         }
> >
> > @@ -2160,6 +2237,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
> >         }
> >
> >         call_void_vb_qop(vb, buf_finish, vb);
> > +       if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
> > +               __vb2_buf_end_cpu_access(vb, vb->num_planes);
> >         vb->prepared = 0;
> >
> >         if (pindex)
> > @@ -2296,6 +2375,8 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
> >
> >                 if (vb->prepared) {
> >                         call_void_vb_qop(vb, buf_finish, vb);
> > +                       if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
> > +                               __vb2_buf_end_cpu_access(vb, vb->num_planes);
> >                         vb->prepared = 0;
> >                 }
> >                 __vb2_dqbuf(vb);
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index 9ce6284cd5f26..68c146c043fb1 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -768,7 +768,8 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
> >  }
> >
> >  static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> > -                                 struct dma_buf *dbuf, unsigned long size)
> > +                                 struct dma_buf *dbuf, unsigned long size,
> > +                                 enum dma_data_direction dma_dir)
> >  {
> >         struct vb2_dc_buf *buf;
> >         struct dma_buf_attachment *dba;
> > @@ -794,7 +795,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> >                 return dba;
> >         }
> >
> > -       buf->dma_dir = vb->vb2_queue->dma_dir;
> > +       buf->dma_dir = dma_dir;
> >         buf->size = size;
> >         buf->db_attach = dba;
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index b1d0695cda260..ab03f9d31391a 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -616,7 +616,8 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
> >  }
> >
> >  static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> > -                                     struct dma_buf *dbuf, unsigned long size)
> > +                                     struct dma_buf *dbuf, unsigned long size,
> > +                                     enum dma_data_direction dma_dir)
> >  {
> >         struct vb2_dma_sg_buf *buf;
> >         struct dma_buf_attachment *dba;
> > @@ -640,7 +641,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> >                 return dba;
> >         }
> >
> > -       buf->dma_dir = vb->vb2_queue->dma_dir;
> > +       buf->dma_dir = dma_dir;
> >         buf->size = size;
> >         buf->db_attach = dba;
> >         buf->vb = vb;
> > diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> > index 63f023696f3ee..c38faa0188bc9 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> > @@ -402,7 +402,8 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
> >  static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
> >                                        struct device *dev,
> >                                        struct dma_buf *dbuf,
> > -                                      unsigned long size)
> > +                                      unsigned long size,
> > +                                      enum dma_data_direction dma_dir)
> >  {
> >         struct vb2_vmalloc_buf *buf;
> >
> > @@ -414,7 +415,7 @@ static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
> >                 return ERR_PTR(-ENOMEM);
> >
> >         buf->dbuf = dbuf;
> > -       buf->dma_dir = vb->vb2_queue->dma_dir;
> > +       buf->dma_dir = dma_dir;
> >         buf->size = size;
> >
> >         return buf;
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 4b4f4c15c53a7..8dfe22fa4423c 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -78,7 +78,8 @@ struct vb2_buffer;
> >   *             to the userspace, also optional.
> >   * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
> >   *                used for DMABUF memory types; dev is the alloc device
> > - *                dbuf is the shared dma_buf; returns ERR_PTR() on failure;
> > + *                dbuf is the shared dma_buf; dma_dir is the DMA mapping
> > + *                direction; returns ERR_PTR() on failure;
> >   *                allocator private per-buffer structure on success;
> >   *                this needs to be used for further accesses to the buffer.
> >   * @detach_dmabuf: inform the exporter of the buffer that the current DMABUF
> > @@ -136,7 +137,8 @@ struct vb2_mem_ops {
> >         void            *(*attach_dmabuf)(struct vb2_buffer *vb,
> >                                           struct device *dev,
> >                                           struct dma_buf *dbuf,
> > -                                         unsigned long size);
> > +                                         unsigned long size,
> > +                                         enum dma_data_direction dma_dir);
> >         void            (*detach_dmabuf)(void *buf_priv);
> >         int             (*map_dmabuf)(void *buf_priv);
> >         void            (*unmap_dmabuf)(void *buf_priv);
> > @@ -510,6 +512,11 @@ struct vb2_buf_ops {
> >   *             ->finish().
> >   * @non_coherent_mem: when set queue will attempt to allocate buffers using
> >   *             non-coherent memory.
> > + * @uses_cpu_access: the driver transfers buffer data with the CPU instead of
> > + *             DMA. For imported dma-bufs, videobuf2 brackets the interval from
> > + *             buf_prepare through buf_finish with dma_buf_begin_cpu_access()
> > + *             and dma_buf_end_cpu_access(). Imported attachments use
> > + *             bidirectional DMA mappings.
> >   * @lock:      pointer to a mutex that protects the &struct vb2_queue. The
> >   *             driver must set this to a mutex to let the v4l2 core serialize
> >   *             the queuing ioctls. This lock is used when waiting for a new
> > @@ -614,6 +621,7 @@ struct vb2_queue {
> >         unsigned int                    uses_requests:1;
> >         unsigned int                    allow_cache_hints:1;
> >         unsigned int                    non_coherent_mem:1;
> > +       unsigned int                    uses_cpu_access:1;
> >
> >         struct mutex                    *lock;
> >         void                            *owner;

-- 
Regards,

Laurent Pinchart
