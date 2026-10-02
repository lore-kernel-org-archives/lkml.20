Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B9346E7A;
	Fri,  2 Oct 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938579; cv=none; b=WDPOEyxXOpQ6mpQxuiTLnUUSnntrsZBpYbaysID6uebaKzHqB2L//j+4edTOJKSAaIPZBBslqnEx2Xc5qtIXXOdpaWV3H/+7G0v372psfzzTefgInRVSj25OYoD2CRKTZIuloNtGgm5RzwPQf3K/YDTzG4MzUcBXC3zCaB7yDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938579; c=relaxed/simple;
	bh=27VIebOdemG9T5ca6BWhEY+8CtLt41/av6vw9HfavOc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=JncCpatVHBIgnApcWPRzkJ9nIfijubdthyHXyuw2e1pLVOPlfdRBpQ9TwD7Ra8uAFdN0oJSsUum1eZA3DR+los79jH115Q+x0I2lmGGTQUDZAhZPjyQkxARlOIaR9s3evU401j9AiDzTXHUOwAK2Ux3sWWEcWjuc7f/nE4V2ftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FMzcZymg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FMzcZymg"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1EA455E;
	Fri,  2 Oct 2026 12:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790938461;
	bh=27VIebOdemG9T5ca6BWhEY+8CtLt41/av6vw9HfavOc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FMzcZymgYE/oFN568A2xjEE7vCRdRQKE81Reizz992PKbvqFmGAGg/A5h74kXQz1N
	 +RjfC+7KjAotd9qb0fnGI23EnjqnYEgPzoqCtPO2NVlZS8EgPtCrmAUf9D6fn5M28n
	 u4hvBPP/Rj6WCMtfuItykZsZAnXRqOdVxaycMujI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com> <20260917-b4-vchiq-isp-v5-1-2d8870add2c0@ideasonboard.com>
Subject: Re: [PATCH v5 01/10] media: videobuf2-core: Move type check out of vb2_core_expbuf()
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Hans Verkuil <hans@jjverkuil.nl>, Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 02 Oct 2026 19:56:07 +0900
Message-ID: <179093856721.2882041.12643031022518584760@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-09-17 17:23:07)
> vb2_core_expbuf() takes the type of the exportbuffer as an argument and
> checks if it matches the type of the vb2 queue. Move that check to the
> caller (vb2_expbuf).
>=20
> There is only one other user of this, which is dvb-core, where the check
> was anyway redundant as it passed the vb2 queue type instead. So update
> it too.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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
