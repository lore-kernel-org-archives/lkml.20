Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880842;
	b=rJJsosfM5uVRUrg8MmFN7TNGjNLP6mqvva3jq5Kwx+z6ROgheVIP3heLSLdpbFk38Y0E
	 kcW+XsHoDW46g/UncPexmwySeL6uCKCdUAVmLdFbSBcKKKRVAz5RbTUEYE0ZZFcB814rF
	 QwkcA2XBH9pYNEV00Ee5MmVPhHYsP2OxnwFNzhz+wTPA1+MLxI/0L/RpBRaBKaGoJagq7
	 jXgAvm1FUzcwkUcRf1x6zshYeW6UZQNfIk9aROFYY6lOBAKXxux0vPOw4foDqfdbC2g7p
	 kGatBxEXYijSHyaosG0v1r9jtPN1RJEgffZiL64S97vmsPx0Up4EeGk/tUlXWV8Vsxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880842;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7tZFNYWjq0Tv4v1EOQ8aYiWXutcjoQ6qAUekOhoVqGE=;
	b=sR784Ptcpw+ibKIQ5brRSl1BeIT1mGsVUB/RHmh5Lgfm91+B0+DsfdgPDT6hWDVWV5tu
	 OUkOqwXL5p7IROzpmxoi2S1ZNkrrqOOEfcoQTeIaoz20Qiu6rAH5WE0nRJrrezkXT1J6O
	 ql1eU8E67vGK1NaxEX6+DjFkohEst4GpZVDgpkIRcPRickJrpvjUpbOveICKWwS8OlkNU
	 2sjOBefq2cVtScuu+Ms2WSVGrZQPxfZdbkE2xAMVlpFqPwYfYiOPIiP16KIekwcF4yCp7
	 nnWsVDXmyn/6rKFRDXxORcGODKHVZpwVBZKlBqIDPqN16yXlCfR1xRlWtFy3Yng6u4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SngBk4MZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5902606A333;
	Thu,  5 Nov 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SngBk4MZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BAF1F00919;
	Thu,  5 Nov 2026 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880841;
	bh=7tZFNYWjq0Tv4v1EOQ8aYiWXutcjoQ6qAUekOhoVqGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SngBk4MZJ5p600WnEXGEN/FoivGWmVuar2svtJwxjWZXVTEmHxeOWdhKERsqo4TrU
	 FKY3T8EZ/xv51PcJ7nf73xCfcdEanNMrn++Z2SgHZPOF/CInoafLmAjCIiPwHg5vM2
	 V5wZjDEh0trDN10oMYEJbTzsbPU1xZCcBiMNweFaYwctn8zWSZ+c4WiOOmtLpd0zVs
	 1puqrNIYMZieqIWcjYbNAHCJmOeyWGQsSdJl1z/iRXZwM/8uW3IRMIv0XWpIh9Hx07
	 HIAfhpbahQXGrp3mEmeRvOkV7txzMemUHhi8ZiFT06i9k6Wu0zUbiImNjumGm84v3C
	 PuHwAP8iDTb5g==
Message-ID: <0923d843-b621-495e-8573-d55c65eb5e27@kernel.org>
Date: Thu, 5 Nov 2026 13:13:57 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] media: videobuf2: Allow exporting of a struct
 dmabuf
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
 <20260917-b4-vchiq-isp-v5-7-2d8870add2c0@ideasonboard.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20260917-b4-vchiq-isp-v5-7-2d8870add2c0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:23, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> videobuf2 only allowed exporting a dmabuf as a file descriptor,
> but there are instances where having the struct dma_buf is
> useful within the kernel.
> 
> Split the current implementation into two, one step which
> exports a struct dma_buf, and the second which converts that
> into an fd.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> Changes in v5:
> - Update documentation of return type to only ERR_PTR and not NULL
> Changes in v4:
> - Return a pointer to struct dmabuf instead of passing it as a double
>   pointer argument and returning an int for errors (Laurent)
> - Document the return type (Paul)
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 45 ++++++++++++++++---------
>  include/media/videobuf2-core.h                  | 16 +++++++++
>  2 files changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 5e318165659f..7b99d39d7cb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,50 +2419,63 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  	return 0;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> -		    unsigned int plane, unsigned int flags)
> +struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
> +				       struct vb2_buffer *vb,
> +				       unsigned int plane, unsigned int flags)
>  {
>  	struct vb2_plane *vb_plane;
> -	int ret;
> -	struct dma_buf *dbuf;
> +	struct dma_buf *dmabuf;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
>  		dprintk(q, 1, "queue is not currently set up for mmap\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (!q->mem_ops->get_dmabuf) {
>  		dprintk(q, 1, "queue does not support DMA buffer exporting\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (flags & ~(O_CLOEXEC | O_ACCMODE)) {
> -		dprintk(q, 1, "queue does support only O_CLOEXEC and access mode flags\n");
> -		return -EINVAL;
> +		dprintk(q, 1, "queue supports only O_CLOEXEC and access mode flags\n");
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (plane >= vb->num_planes) {
>  		dprintk(q, 1, "buffer plane out of range\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (vb2_fileio_is_active(q)) {
>  		dprintk(q, 1, "expbuf: file io in progress\n");
> -		return -EBUSY;
> +		return ERR_PTR(-EBUSY);
>  	}
>  
>  	vb_plane = &vb->planes[plane];
>  
> -	dbuf = call_ptr_memop(get_dmabuf,
> -			      vb,
> -			      vb_plane->mem_priv,
> -			      flags & O_ACCMODE);
> -	if (IS_ERR_OR_NULL(dbuf)) {
> +	dmabuf = call_ptr_memop(get_dmabuf, vb, vb_plane->mem_priv,
> +				flags & O_ACCMODE);
> +	if (IS_ERR_OR_NULL(dmabuf)) {
>  		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
>  			vb->index, plane);
> -		return -EINVAL;
> +		if (!dmabuf)
> +			dmabuf = ERR_PTR(-EINVAL);
>  	}
>  
> +	return dmabuf;
> +}
> +EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
> +
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags)
> +{
> +	struct dma_buf *dbuf;
> +	int ret;
> +
> +	dbuf = vb2_core_expbuf_dmabuf(q, vb, plane, flags);
> +	if (IS_ERR(dbuf))
> +		return PTR_ERR(dbuf);
> +
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
>  		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index feda638d0064..45bfe8a2a12a 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -954,6 +954,22 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
>   */
>  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>  
> +/**
> + * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue
> + * @vb:		pointer to &struct vb2_buffer
> + * @plane:	index of the plane to be exported, 0 for single plane queues
> + * @flags:	file flags for newly created file, as defined at
> + *		include/uapi/asm-generic/fcntl.h.
> + *		Currently, the only used flag is %O_CLOEXEC.
> + *		is supported, refer to manual of open syscall for more details.
> + *
> + * Return: returns a pointer to &struct dma_buf on success; an ERR_PTR otherwise.
> + */
> +struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
> +				       struct vb2_buffer *vb,
> +				       unsigned int plane, unsigned int flags);
> +
>  /**
>   * vb2_core_expbuf() - Export a buffer as a file descriptor.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> 

