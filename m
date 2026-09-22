Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C024915B4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102035; cv=pass; b=cD5u7eJrmCTcifTbzoB9bN2ePqJTN1pCEEB2s0jCHD/bXpOKpzRQXPxetcpd8qQixY7/6S0XpUuRezdXhMl6TIjXDSOLMYFac4uCRICAAQ9ILF0YoJHQWjvc+ThDvJFLBJwfwjmh3mDxSQhZ0qkruyTkr2GVn+iCaM+cmlx7/m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102035; c=relaxed/simple;
	bh=xgqp5FtMTyOcWRlq1vTHqDHXERP/UnZZ9RWhxwLeOQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBM8I9H77db4z+RnqiViX7CdUs+CJPuW+ntpyYijImJwVI2+eD3pcLAkPmbt9Ag9cSB/NV79cesXDHFE/tS73VsNligTGvZhgXoBBD7K/p8ndoRrajK1aAH25z0E/+ArpAKYiXtDz21xKgqhUG9D3eV16Qhfi7IIDpmN3sXf5WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOi5YQ0h; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOi5YQ0h"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db33db4de9so13545ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790102031; cv=none;
        d=google.com; s=arc-20260327;
        b=LAGzbw8STZ3WadL7Zu4rrS8RJOHbqZ5s5R5ZUNI/BzAbK+QiHPD2V9Bmnam448wsaV
         sSzyDDP0a5ujSfut6Y2QJn0vD0FvxGfgvHrGmkAeATR6Ts3Col0qK4tc7XQNaP+tPEPC
         LTN8pSFrBAeX/k9ig++e1GF81wDMzSwQnCbnsTHKGe4YiXS0FzRRCRSMvtISI/Dn0L82
         jLi8nTfYWQ/mRM8DZ4PolpFrTPV1Wv4Cyzr2WgfFQ61fJCttdFtoPE/ARwnb5uqlcVTg
         xW0Hm1asC53f41LyDrHtqnT6rFNjA/6oYqCGDj9VmI8E3zlpA68NWf53IYrsFLTvq3L2
         Lbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqSvUmvywswAOE6fxaj1MZy7synAW9lVIfsjinCoqZ8=;
        fh=mpD2Uq2AaBphp8w2G2pj8dDTIziboLum2w5LWUWMXFw=;
        b=mSQO4mjK+Z5JPmlF29tc2jPxxgMMjmnEdzfB7iLSnEhhXm8nhSYbfC82w+gugMDTPx
         Q1653fl+V5jvFhbVsg3pQmM0k5eQfSxGmJH5fGHqaZ2gaRcOJgPc/kJ0bHANWnFOIoTO
         DyUdhyLrAMtykxOJlot7EZd2X9L8EP0eXzi130MvNP9STAs9oDLjP2cq/3ppfRDi7uCT
         tKtT9k5/bv49YMEfF/T6nGjrh0Bz0ZVvtqEgHRz1eUlKAzYlgUWW0b/aNY2m8qrgPa7C
         FWb26+NPaMptxbA9LjNdFHsskF9nYeKIzudNzAYwjKCCYtJX4Fxr1kCdR8TrKZaipQwO
         Hjzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102031; x=1790706831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqSvUmvywswAOE6fxaj1MZy7synAW9lVIfsjinCoqZ8=;
        b=aOi5YQ0hxl48wTys+E1KMZWhe73GkSVpnAkRksWLe29QBY8hH4Wu5o1hyrRbhGeS9e
         9VBAKvO4brLjM6UV3UoqDsu283Z0iNkJ46nFHSYKlNyhz8pesFEG5J/JyicrKs+RquW1
         BDGA7wPWdKGBHaAuntAXMzUrdCSTlFqhjcPRAgpkspQBygJCe03bb1KRCAr+j1CRqytb
         FvYTkgxRS32HLbUFE8NG7taHmQh6Op6q118GwDJtwq/gZzAho3nwAdxkUmLM0ke/VkqH
         9A+LlVMgWHRtmBs/rgdqBE0faYrGMT95qmYUOxgDsOsCuVfZaL7mG7+qaJdZB7emsmY2
         k+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102031; x=1790706831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqSvUmvywswAOE6fxaj1MZy7synAW9lVIfsjinCoqZ8=;
        b=i9XQy2qe9F+PqBUSXI0LIT3/1huA/gTQa1Ym3hrzAQup1FWeG6CP94SF55GQiyLEec
         SPWH3Z17CYKm2IsBUl4m9VjgNiFoP79sEJInDn63smjw7IAMBf3OSiqsp9WtqXh4gkS3
         Kjr0IOKDPYRUYVPtIHRjnBrPZw9+oZWax6k6Mq6UyZ8SYlxCorgNtZ01a10j6dlcW07k
         SXANgqXJVGXx5lacahAIa84Wz+dPTk5R5KDilRndA5YD5FQ/bwq3od7K7vWA2zMo7ckj
         vTClpeVFgP2PUtHMMEN8NK5JVfDM71ixPYFQ4hVdAvKQ0U6FrutqthCRw6tXpdHMbqk3
         f17w==
X-Forwarded-Encrypted: i=1; AKwUvBzSAGz5s4kVDesBZ6GXd2X3K+rj9YPaCdKqozySvFOii8GUFTwrYZ+G6Fm4MXUaeIX8B9fduwRvC4v8q7w=@vger.kernel.org
X-Gm-Message-State: AFuF++l/lEHGy1TPiaN16YYrPA6cupjGvSTLwEmhJ4IfnwmLrIyOisRh
	zIuQhUUK5dW6CZlB+yp2BF69moswXeFobbYvfSmV9iI565hCvuHiUUPRxbjWEqZMSuMSIb+onuq
	FF+Aq0VIO7D0KW+5DJH078urg8Qh/xIKuYJmX6E0=
X-Gm-Gg: AYBFou0XVo8pRehVdC/ToL4xBBUmdo9Gw3/ZvqJrfHozZcUe5Mkqyyq562+SZSym4rX
	t1pCzQEEEy7HRX8R2ArRbnasGVpFkrDBYoWeDu8Iwim64FiKtAjqA87puuvMldggbH9glz2wWhL
	YEfJSwV31Zv2hhoCYzR5inmYn8imPe2sapXvH4kaOWtxwdWGuJ5UibfwNVrI1owbXbLyU4Bv93Q
	ahnsZVGohgo3mmuQl2ThrejmhkZpLDagvNHlqeiapV6XqiOMKXeIAQtOcOhATUSrscbPQiOxe4+
	35aI2XHPvgk+0osH7qsh0ADDB5IKCHZksbtGZb7h0YxjUFDr4kJJQw==
X-Received: by 2002:a17:902:d58a:b0:2cf:9ec1:ea6e with SMTP id
 d9443c01a7336-2df69d9c68dmr749185ad.8.1790102030179; Tue, 22 Sep 2026
 11:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917171921.2810550-1-briandaniels@google.com>
 <20260917171921.2810550-2-briandaniels@google.com> <CADSE00++bx4Jn_sGdME5f6qhHURH9phmV9ZNGrWwd82nPvOXrg@mail.gmail.com>
In-Reply-To: <CADSE00++bx4Jn_sGdME5f6qhHURH9phmV9ZNGrWwd82nPvOXrg@mail.gmail.com>
From: Brian Daniels <briandaniels@google.com>
Date: Tue, 22 Sep 2026 14:33:37 -0400
X-Gm-Features: AcwNN1U5UuJZcI9LIex7vg6k0BnHLvbO_5l1kLu1QgN8r2etlxhp7yt_v-sXc1M
Message-ID: <CAD4i_GSM0+5siAvWQyND1JA2Q37yNn8mKf5-ESJshHmN1aL6SA@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] media: virtio: Add skeleton virtio-media driver
To: Albert Esteve <aesteve@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:11=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
>
> On Thu, Sep 17, 2026 at 7:19=E2=80=AFPM Brian Daniels <briandaniels@googl=
e.com> wrote:
> >
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
> > @@ -28886,6 +28886,7 @@ F:      Documentation/devicetree/bindings/virti=
o/
> >  F:     Documentation/driver-api/virtio/
> >  F:     drivers/block/virtio_blk.c
> >  F:     drivers/crypto/virtio/
> > +F:     drivers/media/virtio/
> >  F:     drivers/vdpa/
> >  F:     drivers/virtio/
> >  F:     include/linux/vdpa.h
> > @@ -28998,6 +28999,13 @@ S:     Maintained
> >  F:     drivers/iommu/virtio-iommu.c
> >  F:     include/uapi/linux/virtio_iommu.h
> >
> > +VIRTIO MEDIA DRIVER
> > +M:     Brian Daniels <briandaniels@google.com>
> > +L:     linux-media@vger.kernel.org
> > +S:     Maintained
> > +F:     drivers/media/virtio/
> > +F:     include/uapi/linux/virtio_media.h
> > +
> >  VIRTIO MEM DRIVER
> >  M:     David Hildenbrand <david@kernel.org>
> >  L:     virtualization@lists.linux.dev
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 6abc9302c..ce7d088e7 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
> >
> >           Say Y when you want to be able to see such devices.
> >
> > +config MEDIA_VIRTIO
> > +       tristate "Virtio-media Driver"
> > +       depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || CPU_LITTLE_E=
NDIAN)
> > +       select VIDEOBUF2_CORE
> > +       select VIDEOBUF2_MEMOPS
> > +       help
> > +         Enables the virtio-media driver.
> > +
> > +         This driver is used to virtualize media devices such as camer=
as or
> > +         decoders from a host into a guest using the V4L2 protocol.
> > +
> > +         If unsure, say N.
> > +
> >  config MEDIA_TEST_SUPPORT
> >         bool
> >         prompt "Test drivers" if MEDIA_SUPPORT_FILTER
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
> > +       struct v4l2_device v4l2_dev;
> > +       struct video_device video_dev;
> > +
> > +       struct virtio_device *virtio_dev;
> > +       struct virtqueue *commandq;
> > +       struct virtqueue *eventq;
> > +       struct work_struct eventq_work;
> > +
> > +       struct virtio_shm_region mmap_region;
> > +
> > +       void *event_buffer;
> > +
> > +       struct list_head sessions;
> > +       struct mutex sessions_lock; /* protects sessions list */
> > +
> > +       struct mutex events_lock; /* prevents concurrent event processi=
ng */
> > +
> > +       __dma_from_device_group_begin();
> > +       union {
> > +               struct virtio_media_cmd_open open;
> > +               struct virtio_media_cmd_munmap munmap;
> > +       } cmd;
> > +
> > +       union {
> > +               struct virtio_media_resp_open open;
> > +               struct virtio_media_resp_munmap munmap;
> > +       } resp;
> > +       __dma_from_device_group_end();
> > +
> > +       struct mutex vlock; /* serializes command queue access */
> > +       wait_queue_head_t wq;
> > +};
> > +
> > +static inline struct virtio_media *
> > +to_virtio_media(struct video_device *video_dev)
> > +{
> > +       return container_of(video_dev, struct virtio_media, video_dev);
> > +}
> > +
> > +/* virtio_media_driver.c */
> > +
> > +int virtio_media_send_command(struct virtio_media *vv, struct scatterl=
ist **sgs,
> > +                             const size_t out_sgs, const size_t in_sgs=
,
> > +                             size_t minimum_resp_len, size_t *resp_len=
);
> > +void virtio_media_process_events(struct virtio_media *vv);
> > +
> > +/* virtio_media_ioctls.c */
> > +
> > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > +                              unsigned long arg);
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
> > +       .owner =3D THIS_MODULE,
> > +       .open =3D v4l2_fh_open,
> > +       .release =3D v4l2_fh_release,
> > +};
> > +
> > +static int virtio_media_probe(struct virtio_device *virtio_dev)
> > +{
> > +       struct device *dev =3D &virtio_dev->dev;
> > +       struct virtqueue *vqs[2];
> > +       static struct virtqueue_info vq_info[2] =3D {
> > +               {
> > +                       .name =3D "command",
> > +                       .callback =3D commandq_callback,
> > +               },
> > +               {
> > +                       .name =3D "event",
> > +                       .callback =3D eventq_callback,
> > +               },
> > +       };
> > +       struct virtio_media *vv;
> > +       struct video_device *vd;
> > +       int ret;
> > +
> > +       vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> > +       if (!vv)
> > +               return -ENOMEM;
> > +
> > +       INIT_LIST_HEAD(&vv->sessions);
> > +       mutex_init(&vv->sessions_lock);
> > +       mutex_init(&vv->events_lock);
> > +       mutex_init(&vv->vlock);
> > +
> > +       vv->virtio_dev =3D virtio_dev;
> > +       virtio_dev->priv =3D vv;
> > +
> > +       init_waitqueue_head(&vv->wq);
> > +
> > +       ret =3D v4l2_device_register(dev, &vv->v4l2_dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> > +       if (ret)
> > +               goto err_find_vqs;
> > +
> > +       vv->commandq =3D vqs[0];
> > +       vv->eventq =3D vqs[1];
> > +
> > +       vd =3D &vv->video_dev;
> > +       vd->v4l2_dev =3D &vv->v4l2_dev;
> > +       vd->vfl_type =3D VFL_TYPE_VIDEO;
>
> vdev->vfl_type is overwritten below with video_register_device(), so
> this is redudant.

Thanks, I'll take out the assignment.

> > +       vd->fops =3D &virtio_media_fops;
> > +       vd->release =3D video_device_release_empty;
> > +       strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > +
> > +       video_set_drvdata(vd, vv);
> > +
> > +       vd->device_caps =3D virtio_cread32(virtio_dev, 0);
> > +       if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_=
MPLANE))
> > +               vd->vfl_dir =3D VFL_DIR_M2M;
> > +       else if (vd->device_caps &
> > +                (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE)=
)
> > +               vd->vfl_dir =3D VFL_DIR_TX;
> > +       else
> > +               vd->vfl_dir =3D VFL_DIR_RX;
> > +
> > +       ret =3D video_register_device(vd, virtio_cread32(virtio_dev, 4)=
, 0);
>
> I feel it'd be nicer to pass -1 to the third argument so that the
> 'first free' device node number is assigned. With that it would
> support multiple virtio_media devices without warnings.

Agreed!

> Also, the virtio_media_config struct is not defined in the series. I
> think defining it would be nice so that it can be imported and used in
> QEMU/other VMMs. And it would allow to do `virtio_cread32(virtio_dev,
> offsetof(struct virtio_media_config, device_type))` here instead of
> hardcoding the offset.

Looks like Michael left similar comments, I'll add that to the next version=
.

>
> > +       if (ret)
> > +               goto err_register_device;
> > +
> > +       virtio_device_ready(virtio_dev);
> > +
> > +       return 0;
> > +
> > +err_register_device:
> > +       virtio_dev->config->del_vqs(virtio_dev);
> > +err_find_vqs:
> > +       v4l2_device_unregister(&vv->v4l2_dev);
> > +       return ret;
> > +}
> > +
> > +static void virtio_media_remove(struct virtio_device *virtio_dev)
> > +{
> > +       struct virtio_media *vv =3D virtio_dev->priv;
> > +
> > +       virtio_reset_device(virtio_dev);
> > +       v4l2_device_unregister(&vv->v4l2_dev);
> > +       virtio_dev->config->del_vqs(virtio_dev);
> > +       video_unregister_device(&vv->video_dev);
>
> virtio_reset_device() documents that the caller must already have
> stopped other contexts (syscalls, workqueue...) from using the
> virtqueues. Here reset and del_vqs() run while /dev/video0 is still
> registered, so an open fd can still ioctl/mmap and kick commandq.
> video_unregister_device() only happens afterwards, and sessions are
> freed in remove() even if a file might still be open.
>

The sashiko-bot left similar comments, so yes it looks like the
ordering here needs to be addressed. I'll take a closer look and
address it in the next version.


> > +}
> > +
> > +static struct virtio_device_id id_table[] =3D {
> > +       { VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> > +       { 0 },
> > +};
> > +
> > +static unsigned int features[] =3D {};
> > +
> > +static struct virtio_driver virtio_media_driver =3D {
> > +       .feature_table =3D features,
> > +       .feature_table_size =3D ARRAY_SIZE(features),
> > +       .driver.name =3D VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> > +       .driver.owner =3D THIS_MODULE,
> > +       .id_table =3D id_table,
> > +       .probe =3D virtio_media_probe,
> > +       .remove =3D virtio_media_remove,
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
> > +       __le32 cmd;
> > +       __le32 __reserved;
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
> > +       __le32 status;
> > +       __le32 __reserved;
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
> > +       struct virtio_media_cmd_header hdr;
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
> > +       struct virtio_media_resp_header hdr;
> > +       __le32 session_id;
> > +       __le32 __reserved;
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
> > +       struct virtio_media_cmd_header hdr;
> > +       __le32 session_id;
> > +       __le32 __reserved;
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
> > +       struct virtio_media_cmd_header hdr;
> > +       __le32 session_id;
> > +       __le32 code;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_C=
MD_IOCTL.
> > + * @hdr: header containing the status of the ioctl.
> > + */
> > +struct virtio_media_resp_ioctl {
> > +       struct virtio_media_resp_header hdr;
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
> > +       __le64 start;
> > +       __le32 len;
> > +       __le32 __reserved;
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
> > +       struct virtio_media_cmd_header hdr;
> > +       __le32 session_id;
> > +       __le32 flags;
> > +       __le32 offset;
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
> > +       struct virtio_media_resp_header hdr;
> > +       __le64 driver_addr;
> > +       __le64 len;
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
> > +       struct virtio_media_cmd_header hdr;
> > +       __le64 driver_addr;
> > +};
> > +
> > +/**
> > + * struct virtio_media_resp_munmap - Device response for
> > + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> > + * @hdr: header containing the status of the command.
> > + */
> > +struct virtio_media_resp_munmap {
> > +       struct virtio_media_resp_header hdr;
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
> > +       __le32 event;
> > +       __le32 session_id;
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
> > +       struct virtio_media_event_header hdr;
> > +       __le32 errno;
> > +       __le32 __reserved;
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
> > +       struct virtio_media_event_header hdr;
> > +       struct v4l2_buffer buffer;
> > +       struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
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
> > +       struct virtio_media_event_header hdr;
> > +       struct v4l2_event event;
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
> >
>
