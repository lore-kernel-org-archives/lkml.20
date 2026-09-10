Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13746374E45;
	Thu, 10 Sep 2026 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050607; cv=none; b=qJxKCnuiWhk8HX2fJ2E0/LLa4/RhTYl3Qrl3tGLdl+MhBD3jYIqfv8kzLOaDUghPb1IZEdx5oqPUc65PjOoCDszkXADGnlSYkGHfhH3LfCv2TTLKLbERB0KZVYMCTq/aQ05nIrfFD8f1Y1wocs4fdox07wBV7g6yVR/5zqiZgl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050607; c=relaxed/simple;
	bh=QQyWej2txng32091z0iviYaYVTQOUG0ucR+SBx+iOds=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bR9Ui1rEKUqhuGTk8o7em6UoEVbYufMYmeHdJWphk2zeQ8dxQ5Az5l0nH791FHm1/5VeQXf8FGtKplBTyEjp8AjB1J61BhcIr5aXdXdOItfwhp5E51ALX5mOjlQzhffTBATUL3tYHos06YS6r1ucHU7wVH9c4C9R3ziepdKUjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ck0asgSJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ck0asgSJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31E4C5B3;
	Thu, 10 Sep 2026 16:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789050504;
	bh=QQyWej2txng32091z0iviYaYVTQOUG0ucR+SBx+iOds=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ck0asgSJIXbDKqfT2oFs+Y3V+COHbE8V5O9/8tP8TuT54MC8wpbJgnavHwOZesz02
	 Qytevun6ONBNHJlMeWEH5alynmLYNLGDeOdi3q8jtDtk8R54cvOdKZBEzPTVbfaeiP
	 e9j6uA7UKRXXzOlFKchcMrD1G8xM3WZ9YjU8r93Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178815930536.1005982.4207748174695263962@neptunite.rasen.tech>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-6-fb8235e15c68@ideasonboard.com> <178815930536.1005982.4207748174695263962@neptunite.rasen.tech>
Subject: Re: [PATCH v3 6/9] media: videobuf2: Allow exporting of a struct dmabuf
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Thu, 10 Sep 2026 19:59:56 +0530
Message-ID: <178905059651.11722.17244519350344277577@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Paul Elder (2026-08-31 12:25:05)
> Quoting Jai Luthra (2026-07-17 20:04:21)
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >=20
> > videobuf2 only allowed exporting a dmabuf as a file descriptor,
> > but there are instances where having the struct dma_buf is
> > useful within the kernel.
> >=20
> > Split the current implementation into two, one step which
> > exports a struct dma_buf, and the second which converts that
> > into an fd.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-core.c | 21 +++++++++++++++++=
+---
> >  include/media/videobuf2-core.h                  | 15 +++++++++++++++
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index b0a6084f1757..0e62f3d97194 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -2419,11 +2419,11 @@ static int __find_plane_by_offset(struct vb2_qu=
eue *q, unsigned long offset,
> >         return 0;
> >  }
> > =20
> > -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> > -                   struct vb2_buffer *vb, unsigned int plane, unsigned=
 int flags)
> > +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> > +                          struct vb2_buffer *vb, unsigned int plane,
> > +                          unsigned int flags, struct dma_buf **dmabuf)
> >  {
> >         struct vb2_plane *vb_plane;
> > -       int ret;
> >         struct dma_buf *dbuf;
> > =20
> >         if (q->memory !=3D VB2_MEMORY_MMAP) {
> > @@ -2468,6 +2468,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd=
, unsigned int type,
> >                 return -EINVAL;
> >         }
> > =20
> > +       *dmabuf =3D dbuf;
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
> > +
> > +int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> > +                   struct vb2_buffer *vb, unsigned int plane, unsigned=
 int flags)
> > +{
> > +       struct dma_buf *dbuf;
> > +       int ret;
> > +
> > +       ret =3D vb2_core_expbuf_dmabuf(q, type, vb, plane, flags, &dbuf=
);
> > +       if (ret)
> > +               return ret;
> > +
> >         ret =3D dma_buf_fd(dbuf, flags & ~O_ACCMODE);
> >         if (ret < 0) {
> >                 dprintk(q, 3, "buffer %d, plane %d failed to export (%d=
)\n",
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 4b4f4c15c53a..15aeaaeaf8ad 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -954,6 +954,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigne=
d int type);
> >   */
> >  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
> > =20
> > +/**
> > + * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
> > + * @q:         videobuf2 queue
> > + * @type:      buffer type
> > + * @index:     id number of the buffer
> > + * @plane:     index of the plane to be exported, 0 for single plane q=
ueues
> > + * @flags:     flags for newly created file, currently only O_CLOEXEC =
is
> > + *             supported, refer to manual of open syscall for more det=
ails
> > + * @dmabuf:    Returns the dmabuf pointer
> > + *
>=20
> For completeness of the documentation, imo you're missing documentation f=
or the
> actual return value.
>=20
>  * Return: returns zero on success; an error code otherwise.
>=20

Good catch! Will fix in v4.

>=20
> Other than that, looks good to me.
>=20
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>=20

Thanks,
Jai

>=20
> > + */
> > +int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
> > +                          struct vb2_buffer *vb, unsigned int plane,
> > +                          unsigned int flags, struct dma_buf **dmabuf);
> > +
> >  /**
> >   * vb2_core_expbuf() - Export a buffer as a file descriptor.
> >   * @q:         pointer to &struct vb2_queue with videobuf2 queue.
> >=20
> > --=20
> > 2.54.0
> >=20
> >
