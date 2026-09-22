Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D4490BF0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102234; cv=pass; b=HqVXHrbhhXJ//r3IyPpvbxxt7Yqc1dJUjddG+RWqPjXYhhbvdp+x6P/KPNuJxiyGLciCdlldmYitXHEUrHhbUrXlpEpJMggvyfeTr/p2hZLpwwsTkw8Is8z3UsEWiOU7EkNN52M9z09y0QMOH8URwqXiiVD4Y9ZSgBNHmF0dpEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102234; c=relaxed/simple;
	bh=rnHVfxRLkxrfC2X/JrRH7SXq33Nyv/9lZ/llakOoOJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRth7gnVX2kSkgCq4GL7iwyH8aaiKFG1IpK9lZnmkKIQNhJWvjypuykdPS+1ldiZ+0C/IcEyRxKGZ9F3I0SO+IlYNrpG5Fb+NUUaW3KbJhRRIaFFDHjDylI3gKcTugBxV5AU7oEM483j7UxfJDwsNbFoeBlRQzvzdG0ZB+5ljGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mRAM14nQ; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mRAM14nQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8facae850so13615ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790102231; cv=none;
        d=google.com; s=arc-20260327;
        b=VpRnr85ws5axCfFt5BlBKLG8KdwTyUcYGoYaqb8vZpTw25F0fMF8XwVmb6NwBRuQ0k
         bJC5VxEK+tyhKKA3QudQ8uB32GYmi8FbXXQlg93ursoBbTE/rYidy22jmoIOU30IIoxp
         VKFoafJag1E9TOkE7WFciPkZeW3VG/kXmuPUKM9dLe4R2VfwgttR4IIBLFB1tb2FjbNy
         1JeRPyOkK+Ltb0lv1ucrvtB0z2JHd+xDh6jTeSfPNkP/Qv7Ja9FqNNhhNNIHtUmChU8t
         5p6JgbjE/lrN1crsENORu7Up1qtp1rZKMXTfnnAbliTQ1Ix7xXXFMo3g7djkSIZIyCio
         CbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpala58T80XtNEXVFk/kyfJQMDM4aNUtQaSa/5dA71o=;
        fh=Wbpo+RHDo0FDVFX2c/xjpnOGKNf1ADwklXEmTgOuZJI=;
        b=C7K6E6g8q5jJoIY4msg8NVilV/fr87+7fdViCANmMx65AYw4gbT2IJK6Rb8RbI1iry
         G47HfuxcqZZi0ISZKyRL7Fi58GujYmGZltMH63717zaASdCNvBASTVzTPI71dlo6feFc
         7xbuib8TRZu5iBTX1Rlfnod6A0CzGAmuhiZdbzsO43XgKGP4U+cZ1uRspzbCJczlN/AZ
         J5Y7v/xpgVa4w09ktoXpoX8YRPZje1bqOwg1+doQRQTlVHsdeoBBXM3+p2FBmXlleWYk
         6mL9s11fx83XoBGgba6nQoOQHAMbI0MwNmNxUPDqLalTmKYA3oOXcK0z+z6zkzdAme7q
         /Dkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102231; x=1790707031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lpala58T80XtNEXVFk/kyfJQMDM4aNUtQaSa/5dA71o=;
        b=mRAM14nQJMogL3mlHtvh3XUzwxpWp/UcD3FPKiDVt6cHtYqpFFkJb9lYUTC0jiwfQ9
         l9gQlp/S9MuloJcImI8NN9DMAJcW1cOmPyfgppdUCrQd0XDHoUFLsi++T3zhEbEp/X/D
         DkKkuKk7KH93Ex9f3JFVZfhUPpm8Go7A0DAmL9BiHTVSyQUwCah7EP/EoIGiUdgTPQOm
         9it7CU5Jw6rkykzoCgkRRAvBacwk9M7+ZeH+SGcBWfNK98yirDji7YbC5k3J6QQvVov1
         +35H36tdG/Kxt0eMQIikuNCP1MyZOJFICyN4sAptrIcPzRqmcul0pBXPy71riG6sttzu
         Obpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102231; x=1790707031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpala58T80XtNEXVFk/kyfJQMDM4aNUtQaSa/5dA71o=;
        b=tjuepdHFudzAlFS8rsUigM2oeU9Ho3BO6qbe0DGQWHQns6lIwdhqvQHRbUofmoN0gV
         wQe176V4VclMS089aQ4WlZF8caDDzs1m8Fm+sjTa1WxoS4mkImvMBwJVqYoxkF6TscHE
         29JXSEF0YvGWHzVfWqmwXBHbiVdkhTGCP+WfJrtPG3EKp27axuWDt23kalcos55G9dKK
         6m45kbvcG9YMuMdx8Z3Z6WwbzMNiAgllKOhCojCcNFgiyN1u+37ebbfygCROCGCM58Xm
         nOgpYGCeNr0PHWBzXYS8FyIX1T73MOOsajFhxLcIq3VgDTsMVrYlQgX5tKWDDEq8V5VY
         yKxw==
X-Forwarded-Encrypted: i=1; AKwUvBwubjnVvVe3LC/Y70MXhNOZ26wMzMQ/U4tOFoMJDPjZ3hRDJHR6u8phfqyBjpWyl2hGPm4yVvqvlEYegII=@vger.kernel.org
X-Gm-Message-State: AFuF++loVCLdc7XRAZ7fK+SCXIUA7xupYTHjrJKwJkoUt+VGzr3nKRf4
	Deq0hv+v43xhScUYD5RJv13zFl+vtYNUVkM6FpHhF1PXvHBpaPXucdt9PlLVFkp4mHYsQ1PLBbe
	cQuQHYAaT7lhUWgGHMoxL+RRA5ONPAKm1WKgyr+4=
X-Gm-Gg: AYBFou0B8WeQ0paWTmsUelk5uHS49ybfBN3ThHrLxJm7GzUQqVvxdFOfUeun4c5bmXr
	WdEllzAKesMaJ3HBAHFI1+TjYeYqc+UWB2qe1VJShRC9I7zy2ABYtdiJE9mD4FcKPNuUCObj/Qo
	0zT0dVp+ojnNPTw9/cZtjaRhU17m6XYj5pGTAfACV+8hUjvLTbS/udbsTcCzZo5tbWI/uKgykW3
	gmO0aMWsowKDi7hjzpLbCcqj4o++y9gm27kJoLfeO+xm8zIpvBg5WF9dyDzqh/9/G37qglhzoxi
	r3a+Odvherk2mVeSpLmCa/IRJB3SubFgWiiuD1ThkmcRYxZqETsbGWQ=
X-Received: by 2002:a17:902:e80c:b0:2d3:153d:acae with SMTP id
 d9443c01a7336-2df69b92393mr958145ad.0.1790102230685; Tue, 22 Sep 2026
 11:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917171921.2810550-1-briandaniels@google.com>
 <20260917171921.2810550-2-briandaniels@google.com> <20260919154110-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260919154110-mutt-send-email-mst@kernel.org>
From: Brian Daniels <briandaniels@google.com>
Date: Tue, 22 Sep 2026 14:36:58 -0400
X-Gm-Features: AcwNN1VaOVuGEw8P3BG9MLi-fRb7W9KpK1nDZUD5qmMHTW4L28mo84TJwjh7dK8
Message-ID: <CAD4i_GR9p0x+6wgecspf-kQ6gvHSiJzEr4NYHebM5usf2QU7pQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] media: virtio: Add skeleton virtio-media driver
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com, dbassey@redhat.com, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 3:52=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Sep 17, 2026 at 01:19:17PM -0400, Brian Daniels wrote:
> > From: Alexandre Courbot <gnurou@gmail.com>
> >
> > This patch adds a minimum viable virtio-media driver that binds to the
> > virtio device and registers a V4L2 device and a video device, but lacks
> > any actual functionality.
> >
> > It adds the UAPI header defining the protocol, internal driver headers,
> > Kconfig and Makefile entries, and MAINTAINERS entry. Many of the struct=
s
> > in the protocol add reserved bits. These are present to ensure 64-bit
> > alignment. They are not intended to be used as reserved expansion for
> > the protocol in the future, so more reserved space is not required.
> >
> > The UAPI header includes videodev2.h, which itself does not currently
> > pass UAPI header validation (CONFIG_UAPI_HEADER_TEST=3Dy). I've added
> > virtio_media.h to the same test exception list.
> >
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  MAINTAINERS                                |   8 +
> >  drivers/media/Kconfig                      |  13 +
> >  drivers/media/Makefile                     |   2 +
> >  drivers/media/virtio/Makefile              |   7 +
> >  drivers/media/virtio/virtio_media.h        |  95 +++++++
> >  drivers/media/virtio/virtio_media_driver.c | 146 +++++++++++
> >  include/uapi/linux/virtio_media.h          | 288 +++++++++++++++++++++
> >  usr/include/Makefile                       |   1 +
> >  8 files changed, 560 insertions(+)
> >  create mode 100644 drivers/media/virtio/Makefile
> >  create mode 100644 drivers/media/virtio/virtio_media.h
> >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> >  create mode 100644 include/uapi/linux/virtio_media.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d..d6b1e0b30 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28886,6 +28886,7 @@ F:    Documentation/devicetree/bindings/virtio/
> >  F:   Documentation/driver-api/virtio/
> >  F:   drivers/block/virtio_blk.c
> >  F:   drivers/crypto/virtio/
> > +F:   drivers/media/virtio/
> >  F:   drivers/vdpa/
> >  F:   drivers/virtio/
> >  F:   include/linux/vdpa.h
> > @@ -28998,6 +28999,13 @@ S:   Maintained
> >  F:   drivers/iommu/virtio-iommu.c
> >  F:   include/uapi/linux/virtio_iommu.h
> >
> > +VIRTIO MEDIA DRIVER
> > +M:   Brian Daniels <briandaniels@google.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/media/virtio/
> > +F:   include/uapi/linux/virtio_media.h
> > +
> >  VIRTIO MEM DRIVER
> >  M:   David Hildenbrand <david@kernel.org>
> >  L:   virtualization@lists.linux.dev
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 6abc9302c..ce7d088e7 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
> >
> >         Say Y when you want to be able to see such devices.
> >
> > +config MEDIA_VIRTIO
> > +     tristate "Virtio-media Driver"
> > +     depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || CPU_LITTLE_END=
IAN)
> > +     select VIDEOBUF2_CORE
> > +     select VIDEOBUF2_MEMOPS
> > +     help
> > +       Enables the virtio-media driver.
> > +
> > +       This driver is used to virtualize media devices such as cameras=
 or
> > +       decoders from a host into a guest using the V4L2 protocol.
> > +
> > +       If unsure, say N.
> > +
> >  config MEDIA_TEST_SUPPORT
> >       bool
> >       prompt "Test drivers" if MEDIA_SUPPORT_FILTER
> > diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> > index 20fac24e4..357e786cc 100644
> > --- a/drivers/media/Makefile
> > +++ b/drivers/media/Makefile
> > @@ -23,6 +23,8 @@ obj-$(CONFIG_DVB_CORE) +=3D dvb-core/
> >  # There are both core and drivers at RC subtree - merge before drivers
> >  obj-y +=3D rc/
> >
> > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio/
> > +
> >  obj-$(CONFIG_CEC_CORE) +=3D cec/
> >
> >  #
> > diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Makef=
ile
> > new file mode 100644
> > index 000000000..09d9834da
> > --- /dev/null
> > +++ b/drivers/media/virtio/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for the virtio-media device driver.
> > +
> > +virtio-media-objs :=3D virtio_media_driver.o
> > +
> > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio-media.o
> > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio=
/virtio_media.h
> > new file mode 100644
> > index 000000000..7acb2b842
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > +
> > +/*
> > + * Virtio-media structures & functions declarations.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#ifndef __VIRTIO_MEDIA_H
> > +#define __VIRTIO_MEDIA_H
> > +
> > +#include <linux/virtio_config.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#include "uapi/linux/virtio_media.h"
> > +
> > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > +
> > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> > +
> > +/**
> > + * struct virtio_media - Virtio-media device.
> > + * @v4l2_dev: v4l2_device for the media device.
> > + * @video_dev: video_device for the media device.
> > + * @virtio_dev: virtio device for the media device.
> > + * @commandq: virtio command queue.
> > + * @eventq: virtio event queue.
> > + * @eventq_work: work to run when events are received on @eventq.
> > + * @mmap_region: region into which MMAP buffers are mapped by the host=
.
> > + * @event_buffer: buffer for event descriptors.
> > + * @sessions: list of active sessions on the device.
> > + * @sessions_lock: protects @sessions and &struct virtio_media_session=
.list.
> > + * @events_lock: prevents concurrent processing of events.
> > + * @cmd: union of the device commands ``open`` and ``munmap``. The oth=
er
> > + *       commands are handled by &struct virtio_media_session
> > + * @resp: union of responses to device commands ``open`` and ``munmap`=
`. The
> > + *        other responses are handled by &struct virtio_media_session
> > + * @vlock: serializes access to the command queue.
> > + * @wq: waitqueue for host responses on the command queue.
> > + */
> > +struct virtio_media {
> > +     struct v4l2_device v4l2_dev;
> > +     struct video_device video_dev;
> > +
> > +     struct virtio_device *virtio_dev;
> > +     struct virtqueue *commandq;
> > +     struct virtqueue *eventq;
> > +     struct work_struct eventq_work;
> > +
> > +     struct virtio_shm_region mmap_region;
> > +
> > +     void *event_buffer;
> > +
> > +     struct list_head sessions;
> > +     struct mutex sessions_lock; /* protects sessions list */
> > +
> > +     struct mutex events_lock; /* prevents concurrent event processing=
 */
> > +
> > +     __dma_from_device_group_begin();
> > +     union {
> > +             struct virtio_media_cmd_open open;
> > +             struct virtio_media_cmd_munmap munmap;
> > +     } cmd;
> > +
> > +     union {
> > +             struct virtio_media_resp_open open;
> > +             struct virtio_media_resp_munmap munmap;
> > +     } resp;
> > +     __dma_from_device_group_end();
> > +
> > +     struct mutex vlock; /* serializes command queue access */
> > +     wait_queue_head_t wq;
> > +};
> > +
> > +static inline struct virtio_media *
> > +to_virtio_media(struct video_device *video_dev)
> > +{
> > +     return container_of(video_dev, struct virtio_media, video_dev);
> > +}
> > +
> > +/* virtio_media_driver.c */
> > +
> > +int virtio_media_send_command(struct virtio_media *vv, struct scatterl=
ist **sgs,
> > +                           const size_t out_sgs, const size_t in_sgs,
> > +                           size_t minimum_resp_len, size_t *resp_len);
> > +void virtio_media_process_events(struct virtio_media *vv);
> > +
> > +/* virtio_media_ioctls.c */
> > +
> > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > +                            unsigned long arg);
> > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > +
> > +#endif // __VIRTIO_MEDIA_H
> > +
> > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media=
/virtio/virtio_media_driver.c
> > new file mode 100644
> > index 000000000..25f2ceaa6
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media_driver.c
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > +
> > +/*
> > + * Virtio-media driver.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +#include <linux/module.h>
> > +#include <linux/virtio.h>
> > +#include <linux/virtio_config.h>
> > +#include <linux/virtio_ids.h>
> > +
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#include "uapi/linux/virtio_media.h"
> > +#include "virtio_media.h"
> > +
> > +static void commandq_callback(struct virtqueue *vq)
> > +{
> > +}
> > +
> > +static void eventq_callback(struct virtqueue *vq)
> > +{
> > +}
> > +
> > +static const struct v4l2_file_operations virtio_media_fops =3D {
> > +     .owner =3D THIS_MODULE,
> > +     .open =3D v4l2_fh_open,
> > +     .release =3D v4l2_fh_release,
> > +};
> > +
> > +static int virtio_media_probe(struct virtio_device *virtio_dev)
> > +{
> > +     struct device *dev =3D &virtio_dev->dev;
> > +     struct virtqueue *vqs[2];
> > +     static struct virtqueue_info vq_info[2] =3D {
> > +             {
> > +                     .name =3D "command",
> > +                     .callback =3D commandq_callback,
> > +             },
> > +             {
> > +                     .name =3D "event",
> > +                     .callback =3D eventq_callback,
> > +             },
> > +     };
> > +     struct virtio_media *vv;
> > +     struct video_device *vd;
> > +     int ret;
> > +
> > +     vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> > +     if (!vv)
> > +             return -ENOMEM;
> > +
> > +     INIT_LIST_HEAD(&vv->sessions);
> > +     mutex_init(&vv->sessions_lock);
> > +     mutex_init(&vv->events_lock);
> > +     mutex_init(&vv->vlock);
> > +
> > +     vv->virtio_dev =3D virtio_dev;
> > +     virtio_dev->priv =3D vv;
> > +
> > +     init_waitqueue_head(&vv->wq);
> > +
> > +     ret =3D v4l2_device_register(dev, &vv->v4l2_dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> > +     if (ret)
> > +             goto err_find_vqs;
> > +
> > +     vv->commandq =3D vqs[0];
> > +     vv->eventq =3D vqs[1];
> > +
> > +     vd =3D &vv->video_dev;
> > +     vd->v4l2_dev =3D &vv->v4l2_dev;
> > +     vd->vfl_type =3D VFL_TYPE_VIDEO;
> > +     vd->fops =3D &virtio_media_fops;
> > +     vd->release =3D video_device_release_empty;
> > +     strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > +
> > +     video_set_drvdata(vd, vv);
> > +
> > +     vd->device_caps =3D virtio_cread32(virtio_dev, 0);
>
> please use offsetof device_caps not hard coded "0".
>
> Also, the spec says:
>
>
>   struct virtio_media_config {
>       le32 device_caps;
>       le32 device_type;
>       le8 card[32];
>   };
>
>
> you (and v4l) should define them as le32 and use virtio_cread_le.

Albert left similar comments, I'll be sure to do this in the next
revision, thanks!

>
>
> > +     if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MP=
LANE))
> > +             vd->vfl_dir =3D VFL_DIR_M2M;
> > +     else if (vd->device_caps &
> > +              (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE))
> > +             vd->vfl_dir =3D VFL_DIR_TX;
> > +     else
> > +             vd->vfl_dir =3D VFL_DIR_RX;
> > +
> > +     ret =3D video_register_device(vd, virtio_cread32(virtio_dev, 4), =
0);
> > +     if (ret)
> > +             goto err_register_device;
> > +
> > +     virtio_device_ready(virtio_dev);
> > +
> > +     return 0;
> > +
> > +err_register_device:
> > +     virtio_dev->config->del_vqs(virtio_dev);
> > +err_find_vqs:
> > +     v4l2_device_unregister(&vv->v4l2_dev);
> > +     return ret;
> > +}
> > +
> > +static void virtio_media_remove(struct virtio_device *virtio_dev)
> > +{
> > +     struct virtio_media *vv =3D virtio_dev->priv;
> > +
> > +     virtio_reset_device(virtio_dev);
> > +     v4l2_device_unregister(&vv->v4l2_dev);
> > +     virtio_dev->config->del_vqs(virtio_dev);
> > +     video_unregister_device(&vv->video_dev);
> > +}
> > +
> > +static struct virtio_device_id id_table[] =3D {
> > +     { VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> > +     { 0 },
> > +};
> > +
> > +static unsigned int features[] =3D {};
> > +
> > +static struct virtio_driver virtio_media_driver =3D {
> > +     .feature_table =3D features,
> > +     .feature_table_size =3D ARRAY_SIZE(features),
> > +     .driver.name =3D VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> > +     .driver.owner =3D THIS_MODULE,
> > +     .id_table =3D id_table,
> > +     .probe =3D virtio_media_probe,
> > +     .remove =3D virtio_media_remove,
> > +};
> > +
> > +module_virtio_driver(virtio_media_driver);
> > +
> > +MODULE_DEVICE_TABLE(virtio, id_table);
> > +MODULE_DESCRIPTION("virtio media driver");
> > +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> > +MODULE_LICENSE("Dual BSD/GPL");
> > diff --git a/include/uapi/linux/virtio_media.h b/include/uapi/linux/vir=
tio_media.h
> > new file mode 100644
> > index 000000000..ac3d75c75
> > --- /dev/null
> > +++ b/include/uapi/linux/virtio_media.h
> > @@ -0,0 +1,288 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD=
-3-Clause) */
> > +
> > +/*
> > + * Definitions of virtio-media protocol structures.
> > + *
> > + * Copyright (c) 2024-2026 Google LLC.
> > + */
> > +
> > +#ifndef _UAPI__LINUX_VIRTIO_MEDIA_H
> > +#define _UAPI__LINUX_VIRTIO_MEDIA_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/videodev2.h>
> > +
> > +/*
> > + * Virtio protocol definition.
> > + */
> > +
> > +/**
> > + * struct virtio_media_cmd_header - Header for all virtio-media comman=
ds.
> > + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> > + * @__reserved: must be set to zero by the driver.
> > + *
> > + * This header starts all commands from the driver to the device on th=
e
> > + * commandq.
> > + */
> > +struct virtio_media_cmd_header {
> > +     __le32 cmd;
> > +     __le32 __reserved;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_header - Header for all virtio-media respo=
nses.
> > + * @status: 0 if the command was successful, or one of the standard Li=
nux error
> > + *          codes as a positive integer.
> > + * @__reserved: must be set to zero by the device.
> > + *
> > + * This header starts all responses from the device to the driver on t=
he
> > + * commandq.
> > + */
> > +struct virtio_media_resp_header {
> > +     __le32 status;
> > +     __le32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> > + *
> > + * This is the equivalent of calling ``open`` on a V4L2 device node. U=
pon
> > + * success, a session id is returned which can be used to perform othe=
r
> > + * commands on the session, notably ioctls.
> > + */
> > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > +
> > +/**
> > + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_=
OPEN.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> > + */
> > +struct virtio_media_cmd_open {
> > +     struct virtio_media_cmd_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CM=
D_OPEN.
> > + * @hdr: header containing the status of the command.
> > + * @session_id: if &struct virtio_media_resp_header.status =3D=3D 0, c=
ontains the
> > + *              id of the newly created session.
> > + * @__reserved: must be set to zero by the device.
> > + */
> > +struct virtio_media_resp_open {
> > +     struct virtio_media_resp_header hdr;
> > +     __le32 session_id;
> > +     __le32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> > + *
> > + * This is the equivalent of calling ``close`` on a previously opened =
V4L2
> > + * session. All resources associated with this session will be freed a=
nd the
> > + * session ID shall not be used again after queueing this command.
> > + *
> > + * This command does not require a response from the device.
> > + */
> > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > +
> > +/**
> > + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD=
_CLOSE.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> > + * @session_id: id of the session to close.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_cmd_close {
> > +     struct virtio_media_cmd_header hdr;
> > +     __le32 session_id;
> > +     __le32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> > + *
> > + * This command asks the device to run one of the ``VIDIOC_*`` ioctls =
on the
> > + * active session.
> > + *
> > + * The code of the ioctl is extracted from the VIDIOC_* definitions in
> > + * ``videodev2.h``, and consists of the second argument of the ``_IO*`=
` macro.
> > + *
> > + * Each ioctl has a payload, which is defined by the third argument of=
 the
> > + * ``_IO*`` macro defining it. It can be writable by the driver (``_IO=
W``), the
> > + * device (``_IOR``), or both (``_IOWR``).
> > + *
> > + * If an ioctl is writable by the driver, it must be followed by a
> > + * driver-writable descriptor containing the payload.
> > + *
> > + * If an ioctl is writable by the device, it must be followed by a
> > + * device-writable descriptor of the size of the payload that the devi=
ce will
> > + * write into.
> > + *
> > + */
> > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > +
> > +/**
> > + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD=
_IOCTL.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> > + * @session_id: id of the session to run the ioctl on.
> > + * @code: code of the ioctl to run.
> > + */
> > +struct virtio_media_cmd_ioctl {
> > +     struct virtio_media_cmd_header hdr;
> > +     __le32 session_id;
> > +     __le32 code;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_C=
MD_IOCTL.
> > + * @hdr: header containing the status of the ioctl.
> > + */
> > +struct virtio_media_resp_ioctl {
> > +     struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_sg_entry - Description of part of a scattered g=
uest
> > + *                                memory.
> > + * @start: start guest address of the memory segment.
> > + * @len: length of this memory segment.
> > + * @__reserved: must be set to zero by the driver.
> > + */
> > +struct virtio_media_sg_entry {
> > +     __le64 start;
> > +     __le32 len;
> > +     __le32 __reserved;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_MMAP_FLAG_RW - Bit position of the VIRTIO_MEDIA_MMAP_F=
LAG_RW
> > + *                             flag.
> > + */
> > +#define VIRTIO_MEDIA_MMAP_FLAG_RW 0
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the =
driver's
> > + *                         address space.
> > + */
> > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > +
> > +/**
> > + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_=
MMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> > + * @session_id: ID of the session we are mapping for.
> > + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> > + * @offset: mem_offset field of the plane to map, as returned by
> > + *          VIDIOC_QUERYBUF.
> > + */
> > +struct virtio_media_cmd_mmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     __le32 session_id;
> > +     __le32 flags;
> > +     __le32 offset;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CM=
D_MMAP.
> > + * @hdr: header containing the status of the command.
> > + * @driver_addr: offset into SHM region 0 of the start of the mapping.
> > + * @len: length of the mapping.
> > + */
> > +struct virtio_media_resp_mmap {
> > +     struct virtio_media_resp_header hdr;
> > +     __le64 driver_addr;
> > +     __le64 len;
> > +};
> > +
> > +/**
> > + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped usi=
ng
> > + *                           VIRTIO_MEDIA_CMD_MMAP.
> > + */
> > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > +
> > +/**
> > + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CM=
D_MUNMAP.
> > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @driver_addr: offset into SHM region 0 at which the buffer has been
> > + *               previously mapped.
> > + */
> > +struct virtio_media_cmd_munmap {
> > +     struct virtio_media_cmd_header hdr;
> > +     __le64 driver_addr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_munmap - Device response for
> > + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @hdr: header containing the status of the command.
> > + */
> > +struct virtio_media_resp_munmap {
> > +     struct virtio_media_resp_header hdr;
> > +};
> > +
> > +/* The values for these events are set by the virtio-media specificati=
on. */
> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > +
> > +/**
> > + * struct virtio_media_event_header - Header for events on the eventq.
> > + * @event: one of VIRTIO_MEDIA_EVT_*
> > + * @session_id: ID of the session the event applies to.
> > + */
> > +struct virtio_media_event_header {
> > +     __le32 event;
> > +     __le32 session_id;
> > +};
> > +
> > +/**
> > + * struct virtio_media_event_error - Unrecoverable device-side error.
> > + * @hdr: header for the event.
> > + * @errno: error code describing the kind of error that occurred.
> > + * @__reserved: must be set to zero by the device.
> > + *
> > + * Upon receiving this event, the session mentioned in the header is c=
onsidered
> > + * corrupted and closed.
> > + */
> > +struct virtio_media_event_error {
> > +     struct virtio_media_event_header hdr;
> > +     __le32 errno;
> > +     __le32 __reserved;
> > +};
> > +
> > +/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/video=
dev2.h.
> > + * It is renamed here to match the constant that is defined in the vir=
tio-media
> > + * specification.
> > + */
> > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> > +
> > +/**
> > + * struct virtio_media_event_dqbuf - Dequeued buffer event.
> > + * @hdr: header for the event.
> > + * @buffer: &struct v4l2_buffer describing the buffer that has been de=
queued.
> > + * @planes: plane information for the dequeued buffer.
> > + *
> > + * This event is used to signal that a buffer is not being used anymor=
e by the
> > + * device and is returned to the driver.
> > + */
> > +struct virtio_media_event_dqbuf {
> > +     struct virtio_media_event_header hdr;
> > +     struct v4l2_buffer buffer;
> > +     struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> > +};
> > +
> > +/**
> > + * struct virtio_media_event_event - V4L2 event.
> > + * @hdr: header for the event.
> > + * @event: description of the event that occurred.
> > + *
> > + * This event signals that a V4L2 event has been emitted for a session=
.
> > + */
> > +struct virtio_media_event_event {
> > +     struct virtio_media_event_header hdr;
> > +     struct v4l2_event event;
> > +};
> > +
> > +/* Maximum size of an event. We will queue descriptors of this size on=
 the
> > + * eventq.
> > + */
> > +#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_d=
qbuf)
> > +
> > +#endif // _UAPI__LINUX_VIRTIO_MEDIA_H
> > diff --git a/usr/include/Makefile b/usr/include/Makefile
> > index ee69dd9d9..df106b5d9 100644
> > --- a/usr/include/Makefile
> > +++ b/usr/include/Makefile
> > @@ -37,6 +37,7 @@ no-header-test +=3D linux/usb/audio.h
> >  no-header-test +=3D linux/v4l2-mediabus.h
> >  no-header-test +=3D linux/v4l2-subdev.h
> >  no-header-test +=3D linux/videodev2.h
> > +no-header-test +=3D linux/virtio_media.h
> >  no-header-test +=3D linux/vm_sockets.h
> >  no-header-test +=3D sound/asequencer.h
> >  no-header-test +=3D sound/asoc.h
> > --
> > 2.55.0.1082.g2b9226bbc0-goog
>
