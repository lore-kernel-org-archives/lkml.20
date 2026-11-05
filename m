Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880576;
	b=uh1KhTo6mBfMhbthgU+cZF2SL1RBvWFg3R4fFxm2Pzu6QlkyRpKJ1Opok3yFG2M1q9XF
	 9cp1yi+3YnfXIkJlosLS7ZpKDxPk0cbbOx0dbh7GbswYF0XOOAPk87Cqkv2KPxE/0xE9o
	 pna9tL32wVlZ6T+ycL3rUyNNfn3KqJ7fCr+O2QWqO38EshdzzGckezhV2rquhn9pf62J+
	 B0JqXkG/91lTVdvlWMkzuBlIr/TsMRMc6QP3UhAlWEGUx4bXsFsq1Ji6rpvewG6ix31Qp
	 GxlMguwa0jwoYA4iPcF2jUmMnO9FcRUCL3urYwbZa6t1E4yCZfqgIkj5iFke/VCilTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880576;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=L+eDSiHoLUW5kbF6XazVmwGSSMqijnyueqwHSwCo6BQ=;
	b=gx11cU+pghaautQtNv/D/czFAvO1KMW4ZLKwb3nx/DITG5ydjqecDoTnJaffJUUjca6Z
	 FlOj5StEPwpqbNX0pUNLYbDI+S7eaF03kQZS0Vd5pUow307ZfO7oR2VtGq/23n60mtPyi
	 HZKb3cxIk3wCAib462kqGgLuJlHYd97GjyaTMcd/z462LlsAN1f802GBNqQTtiy4++1eO
	 j07I8bZIDcQa+kMaatH80vuiMlI0mWO1r9jxHqLWDhx+wJLL3fxui2wSDH21b1nwkKvb3
	 +UGOAQvWRAxjjqblQxZIHp4X5krc0Zh5p43rzJsc3X7hGcTqXd+fbned20ViXQcdOhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f03AMJoN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147F606A32F;
	Thu,  5 Nov 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f03AMJoN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A971F000C1;
	Thu,  5 Nov 2026 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880575;
	bh=L+eDSiHoLUW5kbF6XazVmwGSSMqijnyueqwHSwCo6BQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f03AMJoN513tmNiUuReJOdW33YtbH5qCNn/9ufkRfZSFQHc82fWUoafoqz6Xm8Szu
	 vpUmUzLQ6oihshNS4dUZSXloQBPbwdWv29DkBL3Njkl0eiuL91JrclU25WYW0ATk8K
	 L8GBwwfHnMANHiAk3D5nd7hPCXjr/qWTHi8ERZMcRnBzhr03sbIj8YDvOZ5ebq47xn
	 PCMaNgFIHv4qhpGHpYN/zjkVf6+rUbeOl8w+3xLmd1wNdf8pTely2gX6fGGBWUbTpu
	 tjszEf2Ctv1DWCz2EmMSyjlReN7D1ApTI5xYWtBqaSc6Vw18YgKFIdCA+eW9qaUlTH
	 LCNi5qXszqycQ==
Message-ID: <b2a906ae-6744-4778-a897-f690f111416a@kernel.org>
Date: Thu, 5 Nov 2026 13:09:31 +0100
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
Subject: Re: [PATCH v5 01/10] media: videobuf2-core: Move type check out of
 vb2_core_expbuf()
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
 <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:23, Jai Luthra wrote:
> vb2_core_expbuf() takes the type of the exportbuffer as an argument and
> checks if it matches the type of the vb2 queue. Move that check to the
> caller (vb2_expbuf).
> 
> There is only one other user of this, which is dvb-core, where the check
> was anyway redundant as it passed the vb2 queue type instead. So update
> it too.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.ideasonboard.com


Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> Changes in v4:
> - New patch in v4
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 9 ++-------
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 ++++++--
>  drivers/media/dvb-core/dvb_vb2.c                | 3 +--
>  include/media/videobuf2-core.h                  | 5 ++---
>  4 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index b0a6084f1757..5e318165659f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,8 +2419,8 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  	return 0;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags)
>  {
>  	struct vb2_plane *vb_plane;
>  	int ret;
> @@ -2441,11 +2441,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  		return -EINVAL;
>  	}
>  
> -	if (type != q->type) {
> -		dprintk(q, 1, "invalid buffer type\n");
> -		return -EINVAL;
> -	}
> -
>  	if (plane >= vb->num_planes) {
>  		dprintk(q, 1, "buffer plane out of range\n");
>  		return -EINVAL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 5a1ee5eb9c0f..aee1a9244a7b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -877,14 +877,18 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>  {
>  	struct vb2_buffer *vb;
>  
> +	if (eb->type != q->type) {
> +		dprintk(q, 1, "invalid buffer type\n");
> +		return -EINVAL;
> +	}
> +
>  	vb = vb2_get_buffer(q, eb->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
>  		return -EINVAL;
>  	}
>  
> -	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
> -				eb->plane, eb->flags);
> +	return vb2_core_expbuf(q, &eb->fd, vb, eb->plane, eb->flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_expbuf);
>  
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 672b0efdca21..fe7a6554b30e 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -357,8 +357,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
>  		return -EINVAL;
>  	}
>  
> -	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
> -			      0, exp->flags);
> +	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, vb2, 0, exp->flags);
>  	if (ret) {
>  		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
>  			exp->index, ret);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b4f4c15c53a..feda638d0064 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -959,7 +959,6 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @fd:		pointer to the file descriptor associated with DMABUF
>   *		(set by driver).
> - * @type:	buffer type.
>   * @vb:		pointer to struct &vb2_buffer.
>   * @plane:	index of the plane to be exported, 0 for single plane queues
>   * @flags:	file flags for newly created file, as defined at
> @@ -973,8 +972,8 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags);
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags);
>  
>  /**
>   * vb2_core_queue_init() - initialize a videobuf2 queue
> 

