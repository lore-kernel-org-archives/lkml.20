Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792961;
	b=RLx5wHspeOVPIXfDCY4quTzpG70uXKUJjPPr82h72ZWm3qZtk2dCvypsh+f/yLp9Ysez
	 ylAUZHS2phTw50jY95vy8KefTV9ve6fpPKxOdqN1fiwb7Yr8IqCht8bR+avekEdVyz1RZ
	 leHmK/MGZJrU7cAcRgBWivROzh+KUFSX6soCpouG4RMzn1WzpUKj6elgvOn4eHi064mZ8
	 x0GWwR4B1DiIAFBB7fkLA/Edh7MYaGEoNYyCZUFTrFq9pYxCyrZjHrAZu5bM72Zi+doLI
	 HZPsRlVT1jCJVypm5elbc1dOyBw+HrfXdyg43pWWspu4UTWtQOpzvvjTmDttYE3sY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792961;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=OE7JtArYBg1e9RZUFDN34u6GCF6E+vc5+GFEmwRXSO8=;
	b=r9O4YewSx7EiMDNJGbRgSss+boQbsUUhP7UePYnKV6Fqx85T4f1ltgquvsda2XZ6CHRl
	 Ecl8OqHcYsUGoz96oCfbP7NYIzHuiYEOy/TqJ7TUIVvMdVeesMZR5otJalVX0h44SMJjr
	 z5hmmjHAgiCyEgtvIJxkYiYyjkVhYqSZl6w8fcDtMGFvah4vv10PgML3kYkKypbweZPXN
	 LIFvNIal3ioHWUo9m5MVHxR3uFfEHV+0+BoJkA9yfUOdPd/XyUiIQUugLQodYxBK16mij
	 mvubD+anYdhRbJzkpqT0qkNGfqW9ZohyVqFfyQN5TUExt3EOZuTFXdSPyR8JABBJRCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="vX/IWlPA";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F2606A326;
	Wed,  4 Nov 2026 11:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=vX/IWlPA
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D59175;
	Wed,  4 Nov 2026 12:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793792813;
	bh=VTae0VMPW1Ak7eZVU8tAuemLHpEMDjIcs5D7qQ12cMo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vX/IWlPAYV3St+QpTQPokYLS3k1j4wdA3A0PdYo5oP9jNgOk7FhoifUFb4IKgPosa
	 JTvFD1azG1GkhGkbtUSuE37tfOFIvDMLTxsaygnDCcudyjZhQu168YQArCtB5zwqPb
	 R6bLDE8GX7KZRNCjy6y+zaTe7jUTFFg0LesQWuq4=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com> <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
Subject: Re: [PATCH v5 01/10] media: videobuf2-core: Move type check out of vb2_core_expbuf()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Paul Elder <paul.elder@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
Date: Wed, 04 Nov 2026 17:19:05 +0530
Message-ID: <179379294564.10051.13070470195541850363@freya>
User-Agent: alot/0.13.dev199+g9722e8483

Hi Tomasz, Hans,

Quoting Jai Luthra (2026-09-17 13:53:07)
> vb2_core_expbuf() takes the type of the exportbuffer as an argument and
> checks if it matches the type of the vb2 queue. Move that check to the
> caller (vb2_expbuf).
>=20
> There is only one other user of this, which is dvb-core, where the check
> was anyway redundant as it passed the vb2 queue type instead. So update
> it too.
>=20

Are you okay with this change?

I see that rest of this series is more-or-less reviewed. I was planning to
rebase and post a v6 this week.

Thanks,
    Jai

> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.id=
easonboard.com
> ---
> Changes in v4:
> - New patch in v4
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 9 ++-------
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 ++++++--
>  drivers/media/dvb-core/dvb_vb2.c                | 3 +--
>  include/media/videobuf2-core.h                  | 5 ++---
>  4 files changed, 11 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index b0a6084f1757..5e318165659f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,8 +2419,8 @@ static int __find_plane_by_offset(struct vb2_queue =
*q, unsigned long offset,
>         return 0;
>  }
> =20
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -                   struct vb2_buffer *vb, unsigned int plane, unsigned i=
nt flags)
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +                   unsigned int plane, unsigned int flags)
>  {
>         struct vb2_plane *vb_plane;
>         int ret;
> @@ -2441,11 +2441,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, =
unsigned int type,
>                 return -EINVAL;
>         }
> =20
> -       if (type !=3D q->type) {
> -               dprintk(q, 1, "invalid buffer type\n");
> -               return -EINVAL;
> -       }
> -
>         if (plane >=3D vb->num_planes) {
>                 dprintk(q, 1, "buffer plane out of range\n");
>                 return -EINVAL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 5a1ee5eb9c0f..aee1a9244a7b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -877,14 +877,18 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exp=
ortbuffer *eb)
>  {
>         struct vb2_buffer *vb;
> =20
> +       if (eb->type !=3D q->type) {
> +               dprintk(q, 1, "invalid buffer type\n");
> +               return -EINVAL;
> +       }
> +
>         vb =3D vb2_get_buffer(q, eb->index);
>         if (!vb) {
>                 dprintk(q, 1, "can't find the requested buffer %u\n", eb-=
>index);
>                 return -EINVAL;
>         }
> =20
> -       return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
> -                               eb->plane, eb->flags);
> +       return vb2_core_expbuf(q, &eb->fd, vb, eb->plane, eb->flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_expbuf);
> =20
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dv=
b_vb2.c
> index 672b0efdca21..fe7a6554b30e 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -357,8 +357,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dm=
x_exportbuffer *exp)
>                 return -EINVAL;
>         }
> =20
> -       ret =3D vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
> -                             0, exp->flags);
> +       ret =3D vb2_core_expbuf(&ctx->vb_q, &exp->fd, vb2, 0, exp->flags);
>         if (ret) {
>                 dprintk(1, "[%s] index=3D%d errno=3D%d\n", ctx->name,
>                         exp->index, ret);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index 4b4f4c15c53a..feda638d0064 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -959,7 +959,6 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned =
int type);
>   * @q:         pointer to &struct vb2_queue with videobuf2 queue.
>   * @fd:                pointer to the file descriptor associated with DM=
ABUF
>   *             (set by driver).
> - * @type:      buffer type.
>   * @vb:                pointer to struct &vb2_buffer.
>   * @plane:     index of the plane to be exported, 0 for single plane que=
ues
>   * @flags:     file flags for newly created file, as defined at
> @@ -973,8 +972,8 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned =
int type);
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -                   struct vb2_buffer *vb, unsigned int plane, unsigned i=
nt flags);
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +                   unsigned int plane, unsigned int flags);
> =20
>  /**
>   * vb2_core_queue_init() - initialize a videobuf2 queue
>=20
> --=20
> 2.55.0
>
