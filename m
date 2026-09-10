Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA294A2070;
	Thu, 10 Sep 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052703; cv=none; b=RaiVSW8GOueflogUAtC3KWpNKZzfMvdDZqOdUQ8sjuacAXUPJLLg3XMU04NF4zWBkM8kCZbb9Yr09yCQbMOhV9w5KD2mmjEBO/GFceAxnD6GuXJnbu64CbpDA/dRUlYsjBwOMtt/aOD/Lbnfzz8SXXEo9x3h/ZSsxXBULDPa4Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052703; c=relaxed/simple;
	bh=dNV3aSQcFt34AeVZJe+EqTeTysO5AcNaMzAJeC3+ev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0yGAq2Wlv+buljottuF2C5HE4tmjM9bbZtssYJZ0yMTj1bR3k+RUC2/As+P74Dz6KyrP/re2+7zJ/I+FHuunNmLSGa7+nuvyMmomDZMW/HwtW4GRc6eHPij6HHb5GUr1PE2vgrqmHeMKdwdUedPMniLq4GsQujacE1NZ0OPGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PRpm+L73; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PRpm+L73"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CD5022B;
	Thu, 10 Sep 2026 17:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789052598;
	bh=dNV3aSQcFt34AeVZJe+EqTeTysO5AcNaMzAJeC3+ev0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRpm+L73T/S67lGfoKdH6zmIGw0sDpPp1iLwaLlCa5MOB6fPetg9MemEooFevTVUA
	 PDhSicpfYG0pnpyL9cClurfEJf9wqN92a+atfq/xoWnb/r4U6ltAbjf5GuSZxuw5CS
	 dJZ4sum1gklyuK/vBr+0XQEin6CwgM2HKz+DrucU=
Date: Thu, 10 Sep 2026 18:04:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v3 6/9] media: videobuf2: Allow exporting of a struct
 dmabuf
Message-ID: <20260910150454.GP1892234@killaraus.ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
 <20260717-b4-vchiq-isp-v3-6-fb8235e15c68@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-b4-vchiq-isp-v3-6-fb8235e15c68@ideasonboard.com>

(CC'ing Hans)

Tomasz, Hans, could you review this patch ? It is the only one in the
series that touches the V4L2 core.

On Fri, Jul 17, 2026 at 04:34:21PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> videobuf2 only allowed exporting a dmabuf as a file descriptor,
> but there are instances where having the struct dma_buf is
> useful within the kernel.
> 
> Split the current implementation into two, one step which
> exports a struct dma_buf, and the second which converts that
> into an fd.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 21 ++++++++++++++++++---
>  include/media/videobuf2-core.h                  | 15 +++++++++++++++
>  2 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index b0a6084f1757..0e62f3d97194 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,11 +2419,11 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  	return 0;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
> +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> +			   struct vb2_buffer *vb, unsigned int plane,
> +			   unsigned int flags, struct dma_buf **dmabuf)
>  {
>  	struct vb2_plane *vb_plane;
> -	int ret;
>  	struct dma_buf *dbuf;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
> @@ -2468,6 +2468,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  		return -EINVAL;
>  	}
>  
> +	*dmabuf = dbuf;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
> +
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> +		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
> +{
> +	struct dma_buf *dbuf;
> +	int ret;
> +
> +	ret = vb2_core_expbuf_dmabuf(q, type, vb, plane, flags, &dbuf);
> +	if (ret)
> +		return ret;
> +
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
>  		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b4f4c15c53a..15aeaaeaf8ad 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -954,6 +954,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
>   */
>  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>  
> +/**
> + * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
> + * @q:         videobuf2 queue
> + * @type:      buffer type

The type must be identical to the queue type. I would remove the
argument from the function, and move the type check to
vb2_core_expbuf().

A separate patch could then push the check out of vb2_core_expbuf() as
well, as in most cases the type received from userspace in the
v4l2_exportbuffer structure is used to get the corresponding queue.

> + * @index:     id number of the buffer

This isn't correct, the function takes a pointer to a vb2_buffer.

> + * @plane:     index of the plane to be exported, 0 for single plane queues
> + * @flags:     flags for newly created file, currently only O_CLOEXEC is
> + *             supported, refer to manual of open syscall for more details
> + * @dmabuf:    Returns the dmabuf pointer

Is there a reason not to return the dmabuf directly from the function,
with an error pointer for errors ?

> + *
> + */
> +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> +			   struct vb2_buffer *vb, unsigned int plane,
> +			   unsigned int flags, struct dma_buf **dmabuf);
> +
>  /**
>   * vb2_core_expbuf() - Export a buffer as a file descriptor.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
Regards,

Laurent Pinchart
