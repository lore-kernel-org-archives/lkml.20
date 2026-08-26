Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532084749D6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762864; cv=pass; b=srxHxgupSrfyRfoSnhassu1K3mHr921WWkBEkSHSyUdHMpniosjqa1SUCegemBuFUlwUYi3bpxBzQ2IYUHYsoURaNgR+rM57eg2LnTnpAk5bBDBARKwlOtuDcOu6uJHfmjb8jUQHe3Kh1VKhD/bIcTzZ8XI0051mh15hBvUJAi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762864; c=relaxed/simple;
	bh=ab2egvsBld0nMGLZl8JAAU2r7+iCaf83EahI3ZtOwWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luQM+HZqGCG92fPUT50IZ9fnIisISetuybzdzN+zQd2GHxm7CFjBUSrMHfSQS7zesq7uyurBnL9JUP9YhX12KRNs6+cvxB4lh5LjNlcPJuycTEqqOzM9TISM6Mjzovl05AaASthjlyxRz6ofy3TD3qGQraoZR9DOEgVGMDQWgUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BuZ1Afuh; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BuZ1Afuh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cede6375caso1155ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762843; cv=none;
        d=google.com; s=arc-20260327;
        b=C6MeuqKru0X2/+uWv5xYVJhildE62oR2XqAdUTlK53FTVze/HOMeaF9uP/ESyoMRyJ
         4OF1OCTaBpTpv7bcZN7zR7yCukkWiFPaIQqkuiRlvgEJ4ShnEfyST6pMVdctPYm4hGQa
         THQkImpVRMWGIxqsnV24k0jz1iL2Z8lCXAytP81nN6yyxdg1NjOZlJj+McJd1gFk3XAu
         /bWKF0svpAfP9RrXf9B+IGRKGYVtVULz6u2vyXb76IhE5x3I4pEK4Yd2zX5GUgE+Nv+G
         FsRNoQ7V1iph3aUZyGe60y1WRLoLjrfu2R/dUeYEA7VWimFZ2JqL+7XdhS0tcAAp3+wV
         EqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=22oiEAJZoFSB8o8j6j1senj1uwbqKPDbm/CFQd+EHIc=;
        fh=KBH+xW4ufZiZqsG4KSv4SBfWeJl/VmMJQeOGsVLW39Y=;
        b=f+ir8SbVPVxDaGx7bXRJu1AYE79gXqtzQ90j9+4b3Ee3Pn0qrAHPKvbZ0VfF9V8Pn4
         Ps8MlHLGzfAnp9bkvvzihLK2bZW2wtGIdVBmcKullfKxrZuC1WColIWvG35YEdapNdwC
         8ndtZAYmGDS5XEexPpzU30bS7kdprTRVKjmVlgwqLDM/q0UyYS+075xPQCyoduaAUVpk
         OTwHc1NWzWaS6crooW6wSozmdgf+P8loy8okJ9vut0Cp/qmSbpmXWbRA9K9ljoeiTqxb
         +QwrWRjFWBLWdJuuP8siwhXzPpIPJzVtF8RUskc//fRcigU2tJLBQM32y/UiCp/WbYTa
         pU4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787762843; x=1788367643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22oiEAJZoFSB8o8j6j1senj1uwbqKPDbm/CFQd+EHIc=;
        b=BuZ1AfuhegyVNXlmIiRN8n0ok5qZSuEzQS3b075nUgu7rWOOt7OwbNK0Nbt6GNl6Xf
         2dARJaS6qzxAFjNpHOZXG0r054LZk9OaJkxLk/sYoGdgN9YdfWved50RJCMqt/KgbXoC
         TVqY2pqex2LNAlpdgg5wDkZnl5FueLyTMWocmQcSCiwCFAjzXrfRMLLdGOf+rg1VM48E
         4BEJMwJyI7htuNY+9QPsNTmbbPA221DG/iZmLN2p5JGLcMWU95ki268DTZCNWZNu3JF6
         gfuHoAfbLq5Ip/n/eMXIaxBxypEHhtDKYncuVMvuQVUIQr7OUyEQIaz1bPuEG7mWN6rb
         0w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762843; x=1788367643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22oiEAJZoFSB8o8j6j1senj1uwbqKPDbm/CFQd+EHIc=;
        b=blefs1/lNqvlHFIhduhMaTha1WyQE/PWg3M0t4HsyJsgZcLB62JsT0VuQW1ypCihSu
         M6v0UzsoeMQmwPTT5pY2TcpwK/202SQ9ik8q8nqgZO0ULGdfjWXkAiNyOcut3F035oiQ
         IBiG3jxGRxSfI7NuqT4ilsUJFTl7FCr8QY36gzVeCcZPYmq2YVHIKqPnUnYpy8IxX1kG
         pSj/YT7/MMtoTlIATgGrbxyTy9FojssdkxBrr00cwcb8qsF8HTTsv2r2cA8Hcsmz+4oz
         zgcB5r/pXmiAj2bm7MAeTsKGLLH+rkUGSUQplabeKD1xo+RkTxXK/mBCZeGqzza4vCs+
         MEeA==
X-Forwarded-Encrypted: i=1; AHgh+Rqt80fAqZZVT9xjxmtdDJqyExbNI8x/uKvPt5CX3E479hSBVXbA3ppMFJ2w8fSXeawia4ZjLSsoOqe4J84=@vger.kernel.org
X-Gm-Message-State: AFuF++nKH/uwgjtubn7ULitzmmDfCdlcgZBTX2h4LBFF8wWuy/kx0F39
	E1h3bcCyC8AfVkn5acJGsLcERUOWpVaG37luk6ArMm7kBc/tUl2Kt0cBw533pMRyLnQBzNmsMR4
	lptsOBvUXcZ8EKscp1P7kqsHA3TiIp3ZpZqQ5Cqc=
X-Gm-Gg: AR+sD12Z/byxyMBOb9KX/IsUvPyQKUp4Chc3EvuHmB+f6j4M1Ogu3dyTAYhJYBKvmGa
	9HCUJCG9fXWyVA50Y/4ZDTcNwrZBiRwWtD8ScBce+F6LNDI8TbZwf8iWxWmfwK7B1rOEZjknk8s
	Fk4b6Q/GAKxwMOi9XscSqL3MJRvPPAYgLfrN9TWxUoK8eBtDKAj0J1Q3sdRY0QTLxAwnK0sa96v
	riJtmNkSmKbwP+PBwb93we6IG1WAfAjP2xsKuwXhVxu3AHyYFTbR6IIMzZfvE8yvncXHcx8LITh
	nuvJT5BTW7f5bej8CIqrCxETf/ikr/2BZ/9GvMaElfH1ogFBD6eZ7CswkdTWnTbua9PVx8PxiEg
	=
X-Received: by 2002:a17:902:d581:b0:2c7:a13a:7fe6 with SMTP id
 d9443c01a7336-2d70bb85ef7mr6755365ad.10.1787762841990; Wed, 26 Aug 2026
 09:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813180026.2636879-1-briandaniels@google.com>
 <20260813180026.2636879-2-briandaniels@google.com> <CACzuRyzeX9E4VhW7zA=q6md4byzC_+ydB9hU=+mYjui_vkWVig@mail.gmail.com>
 <CACzuRyx7+o9AuqdzkR-EGmWj5_ptbVqUAb6EJbxcpkOWWqwnyQ@mail.gmail.com>
In-Reply-To: <CACzuRyx7+o9AuqdzkR-EGmWj5_ptbVqUAb6EJbxcpkOWWqwnyQ@mail.gmail.com>
From: Brian Daniels <briandaniels@google.com>
Date: Wed, 26 Aug 2026 12:47:09 -0400
X-Gm-Features: AcwNN1V9wke4OrKnTVVRZqlC5LywCxhX_Wk82UUcKkoHKa5_KYU0_r8MquKZVsY
Message-ID: <CAD4i_GTmgS1=D3CDETjFYcVpBrJfvjb2rNT9qjjWu71neFNjNg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] media: virtio: Add skeleton virtio-media driver
To: Dorinda Bassey <dbassey@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:47=E2=80=AFAM Dorinda Bassey <dbassey@redhat.com=
> wrote:
>
> Hi Brian,
>
> I've been backporting the virtio-media v7 patches for libkrunfw and hit
> some failures on aarch64 when running make on the headers. The v7
> patches has UAPI headers issues in include/uapi/linux/virtio_media.h:
> 1. It's using `u32`/`u64` instead of `__u32`/`__u64`
> UAPI headers exposed to userspace must use the double-underscore
> types.
>
> 2. It's missing `#include <linux/types.h>`
> Without this, `__u32`/`__u64` are undefined when the header is included
> from userspace.
>
> causing errors like:
> ./usr/include/linux/virtio_media.h:27:9: error: unknown type name =E2=80=
=98u32=E2=80=99
>   27 |         u32 cmd;
>      |         ^~~
>
> See patterns:
>
> > +struct virtio_media_cmd_header {
> > +       u32 cmd;
> > +       u32 __reserved;
> > +};
>
> here
>
> > +struct virtio_media_sg_entry {
> > +       u64 start;
> > +       u32 len;
> > +       u32 __reserved;
> > +};
>
> here and more.

Thanks very much for raising this. I've prepped the corrections in v8.

>
> I've applied these fixes locally for the backport. These would fail
> on any system that runs UAPI header validation during build too.

Is there a specific command to run the uapi header validation? I did
some searching and only found the ``scripts/check-uapi.sh`` script,
which didn't raise any issues when I ran it. Could you share the
command you're using to validate the UAPI headers?

> BR,
> Dorinda.
>
>
> On Wed, Aug 19, 2026 at 12:54=E2=80=AFPM Dorinda Bassey <dbassey@redhat.c=
om> wrote:
> >
> > > From: Alexandre Courbot <gnurou@gmail.com>
> > > This patch adds a minimum viable virtio-media driver that binds to th=
e
> > > virtio device and registers a V4L2 device and a video device, but lac=
ks
> > > any actual functionality.
> > > It adds the UAPI header defining the protocol, internal driver header=
s,
> > > Kconfig and Makefile entries, and MAINTAINERS entry. Many of the stru=
cts
> > > in the protocol add reserved bits. These are present to ensure 64-bit
> > > alignment. They are not intended to be used as reserved expansion for
> > > the protocol in the future, so more reserved space is not required.
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> >
> >
> > Reviewed-by: Dorinda Bassey <dbassey@redhat.com>
> > Tested-by: Dorinda Bassey <dbassey@redhat.com>
> >
> > Thanks!
> >
> >
> > On Thu, Aug 13, 2026 at 8:00=E2=80=AFPM Brian Daniels <briandaniels@goo=
gle.com> wrote:
> > >
> > > From: Alexandre Courbot <gnurou@gmail.com>
> > >
> > > This patch adds a minimum viable virtio-media driver that binds to th=
e
> > > virtio device and registers a V4L2 device and a video device, but lac=
ks
> > > any actual functionality.
> > >
> > > It adds the UAPI header defining the protocol, internal driver header=
s,
> > > Kconfig and Makefile entries, and MAINTAINERS entry. Many of the stru=
cts
> > > in the protocol add reserved bits. These are present to ensure 64-bit
> > > alignment. They are not intended to be used as reserved expansion for
> > > the protocol in the future, so more reserved space is not required.
> > >
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > ---
> > >  MAINTAINERS                                |   8 +
> > >  drivers/media/Kconfig                      |  13 +
> > >  drivers/media/Makefile                     |   2 +
> > >  drivers/media/virtio/Makefile              |   7 +
> > >  drivers/media/virtio/virtio_media.h        |  95 +++++++
> > >  drivers/media/virtio/virtio_media_driver.c | 146 +++++++++++
> > >  include/uapi/linux/virtio_media.h          | 287 +++++++++++++++++++=
++
> > >  7 files changed, 558 insertions(+)
> > >  create mode 100644 drivers/media/virtio/Makefile
> > >  create mode 100644 drivers/media/virtio/virtio_media.h
> > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > >  create mode 100644 include/uapi/linux/virtio_media.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3785b8c1d..c3b5c5eb6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -28573,6 +28573,7 @@ F:      Documentation/devicetree/bindings/vir=
tio/
> > >  F:     Documentation/driver-api/virtio/
> > >  F:     drivers/block/virtio_blk.c
> > >  F:     drivers/crypto/virtio/
> > > +F:     drivers/media/virtio/
> > >  F:     drivers/vdpa/
> > >  F:     drivers/virtio/
> > >  F:     include/linux/vdpa.h
> > > @@ -28685,6 +28686,13 @@ S:     Maintained
> > >  F:     drivers/iommu/virtio-iommu.c
> > >  F:     include/uapi/linux/virtio_iommu.h
> > >
> > > +VIRTIO MEDIA DRIVER
> > > +M:     Brian Daniels <briandaniels@google.com>
> > > +L:     linux-media@vger.kernel.org
> > > +S:     Maintained
> > > +F:     drivers/media/virtio/
> > > +F:     include/uapi/linux/virtio_media.h
> > > +
> > >  VIRTIO MEM DRIVER
> > >  M:     David Hildenbrand <david@kernel.org>
> > >  L:     virtualization@lists.linux.dev
> > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > index 6abc9302c..ce7d088e7 100644
> > > --- a/drivers/media/Kconfig
> > > +++ b/drivers/media/Kconfig
> > > @@ -136,6 +136,19 @@ config MEDIA_PLATFORM_SUPPORT
> > >
> > >           Say Y when you want to be able to see such devices.
> > >
> > > +config MEDIA_VIRTIO
> > > +       tristate "Virtio-media Driver"
> > > +       depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || CPU_LITTLE=
_ENDIAN)
> > > +       select VIDEOBUF2_CORE
> > > +       select VIDEOBUF2_MEMOPS
> > > +       help
> > > +         Enables the virtio-media driver.
> > > +
> > > +         This driver is used to virtualize media devices such as cam=
eras or
> > > +         decoders from a host into a guest using the V4L2 protocol.
> > > +
> > > +         If unsure, say N.
> > > +
> > >  config MEDIA_TEST_SUPPORT
> > >         bool
> > >         prompt "Test drivers" if MEDIA_SUPPORT_FILTER
> > > diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> > > index 20fac24e4..357e786cc 100644
> > > --- a/drivers/media/Makefile
> > > +++ b/drivers/media/Makefile
> > > @@ -23,6 +23,8 @@ obj-$(CONFIG_DVB_CORE) +=3D dvb-core/
> > >  # There are both core and drivers at RC subtree - merge before drive=
rs
> > >  obj-y +=3D rc/
> > >
> > > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio/
> > > +
> > >  obj-$(CONFIG_CEC_CORE) +=3D cec/
> > >
> > >  #
> > > diff --git a/drivers/media/virtio/Makefile b/drivers/media/virtio/Mak=
efile
> > > new file mode 100644
> > > index 000000000..09d9834da
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/Makefile
> > > @@ -0,0 +1,7 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Makefile for the virtio-media device driver.
> > > +
> > > +virtio-media-objs :=3D virtio_media_driver.o
> > > +
> > > +obj-$(CONFIG_MEDIA_VIRTIO) +=3D virtio-media.o
> > > diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virt=
io/virtio_media.h
> > > new file mode 100644
> > > index 000000000..7acb2b842
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_media.h
> > > @@ -0,0 +1,95 @@
> > > +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> > > +
> > > +/*
> > > + * Virtio-media structures & functions declarations.
> > > + *
> > > + * Copyright (c) 2024-2026 Google LLC.
> > > + */
> > > +
> > > +#ifndef __VIRTIO_MEDIA_H
> > > +#define __VIRTIO_MEDIA_H
> > > +
> > > +#include <linux/virtio_config.h>
> > > +#include <media/v4l2-device.h>
> > > +
> > > +#include "uapi/linux/virtio_media.h"
> > > +
> > > +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> > > +
> > > +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> > > +
> > > +/**
> > > + * struct virtio_media - Virtio-media device.
> > > + * @v4l2_dev: v4l2_device for the media device.
> > > + * @video_dev: video_device for the media device.
> > > + * @virtio_dev: virtio device for the media device.
> > > + * @commandq: virtio command queue.
> > > + * @eventq: virtio event queue.
> > > + * @eventq_work: work to run when events are received on @eventq.
> > > + * @mmap_region: region into which MMAP buffers are mapped by the ho=
st.
> > > + * @event_buffer: buffer for event descriptors.
> > > + * @sessions: list of active sessions on the device.
> > > + * @sessions_lock: protects @sessions and &struct virtio_media_sessi=
on.list.
> > > + * @events_lock: prevents concurrent processing of events.
> > > + * @cmd: union of the device commands ``open`` and ``munmap``. The o=
ther
> > > + *       commands are handled by &struct virtio_media_session
> > > + * @resp: union of responses to device commands ``open`` and ``munma=
p``. The
> > > + *        other responses are handled by &struct virtio_media_sessio=
n
> > > + * @vlock: serializes access to the command queue.
> > > + * @wq: waitqueue for host responses on the command queue.
> > > + */
> > > +struct virtio_media {
> > > +       struct v4l2_device v4l2_dev;
> > > +       struct video_device video_dev;
> > > +
> > > +       struct virtio_device *virtio_dev;
> > > +       struct virtqueue *commandq;
> > > +       struct virtqueue *eventq;
> > > +       struct work_struct eventq_work;
> > > +
> > > +       struct virtio_shm_region mmap_region;
> > > +
> > > +       void *event_buffer;
> > > +
> > > +       struct list_head sessions;
> > > +       struct mutex sessions_lock; /* protects sessions list */
> > > +
> > > +       struct mutex events_lock; /* prevents concurrent event proces=
sing */
> > > +
> > > +       __dma_from_device_group_begin();
> > > +       union {
> > > +               struct virtio_media_cmd_open open;
> > > +               struct virtio_media_cmd_munmap munmap;
> > > +       } cmd;
> > > +
> > > +       union {
> > > +               struct virtio_media_resp_open open;
> > > +               struct virtio_media_resp_munmap munmap;
> > > +       } resp;
> > > +       __dma_from_device_group_end();
> > > +
> > > +       struct mutex vlock; /* serializes command queue access */
> > > +       wait_queue_head_t wq;
> > > +};
> > > +
> > > +static inline struct virtio_media *
> > > +to_virtio_media(struct video_device *video_dev)
> > > +{
> > > +       return container_of(video_dev, struct virtio_media, video_dev=
);
> > > +}
> > > +
> > > +/* virtio_media_driver.c */
> > > +
> > > +int virtio_media_send_command(struct virtio_media *vv, struct scatte=
rlist **sgs,
> > > +                             const size_t out_sgs, const size_t in_s=
gs,
> > > +                             size_t minimum_resp_len, size_t *resp_l=
en);
> > > +void virtio_media_process_events(struct virtio_media *vv);
> > > +
> > > +/* virtio_media_ioctls.c */
> > > +
> > > +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> > > +                              unsigned long arg);
> > > +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> > > +
> > > +#endif // __VIRTIO_MEDIA_H
> > > +
> > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/med=
ia/virtio/virtio_media_driver.c
> > > new file mode 100644
> > > index 000000000..25f2ceaa6
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_media_driver.c
> > > @@ -0,0 +1,146 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > > +
> > > +/*
> > > + * Virtio-media driver.
> > > + *
> > > + * Copyright (c) 2024-2026 Google LLC.
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/types.h>
> > > +#include <linux/module.h>
> > > +#include <linux/virtio.h>
> > > +#include <linux/virtio_config.h>
> > > +#include <linux/virtio_ids.h>
> > > +
> > > +#include <media/v4l2-dev.h>
> > > +#include <media/v4l2-device.h>
> > > +
> > > +#include "uapi/linux/virtio_media.h"
> > > +#include "virtio_media.h"
> > > +
> > > +static void commandq_callback(struct virtqueue *vq)
> > > +{
> > > +}
> > > +
> > > +static void eventq_callback(struct virtqueue *vq)
> > > +{
> > > +}
> > > +
> > > +static const struct v4l2_file_operations virtio_media_fops =3D {
> > > +       .owner =3D THIS_MODULE,
> > > +       .open =3D v4l2_fh_open,
> > > +       .release =3D v4l2_fh_release,
> > > +};
> > > +
> > > +static int virtio_media_probe(struct virtio_device *virtio_dev)
> > > +{
> > > +       struct device *dev =3D &virtio_dev->dev;
> > > +       struct virtqueue *vqs[2];
> > > +       static struct virtqueue_info vq_info[2] =3D {
> > > +               {
> > > +                       .name =3D "command",
> > > +                       .callback =3D commandq_callback,
> > > +               },
> > > +               {
> > > +                       .name =3D "event",
> > > +                       .callback =3D eventq_callback,
> > > +               },
> > > +       };
> > > +       struct virtio_media *vv;
> > > +       struct video_device *vd;
> > > +       int ret;
> > > +
> > > +       vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> > > +       if (!vv)
> > > +               return -ENOMEM;
> > > +
> > > +       INIT_LIST_HEAD(&vv->sessions);
> > > +       mutex_init(&vv->sessions_lock);
> > > +       mutex_init(&vv->events_lock);
> > > +       mutex_init(&vv->vlock);
> > > +
> > > +       vv->virtio_dev =3D virtio_dev;
> > > +       virtio_dev->priv =3D vv;
> > > +
> > > +       init_waitqueue_head(&vv->wq);
> > > +
> > > +       ret =3D v4l2_device_register(dev, &vv->v4l2_dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       ret =3D virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> > > +       if (ret)
> > > +               goto err_find_vqs;
> > > +
> > > +       vv->commandq =3D vqs[0];
> > > +       vv->eventq =3D vqs[1];
> > > +
> > > +       vd =3D &vv->video_dev;
> > > +       vd->v4l2_dev =3D &vv->v4l2_dev;
> > > +       vd->vfl_type =3D VFL_TYPE_VIDEO;
> > > +       vd->fops =3D &virtio_media_fops;
> > > +       vd->release =3D video_device_release_empty;
> > > +       strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > > +
> > > +       video_set_drvdata(vd, vv);
> > > +
> > > +       vd->device_caps =3D virtio_cread32(virtio_dev, 0);
> > > +       if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2=
M_MPLANE))
> > > +               vd->vfl_dir =3D VFL_DIR_M2M;
> > > +       else if (vd->device_caps &
> > > +                (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLAN=
E))
> > > +               vd->vfl_dir =3D VFL_DIR_TX;
> > > +       else
> > > +               vd->vfl_dir =3D VFL_DIR_RX;
> > > +
> > > +       ret =3D video_register_device(vd, virtio_cread32(virtio_dev, =
4), 0);
> > > +       if (ret)
> > > +               goto err_register_device;
> > > +
> > > +       virtio_device_ready(virtio_dev);
> > > +
> > > +       return 0;
> > > +
> > > +err_register_device:
> > > +       virtio_dev->config->del_vqs(virtio_dev);
> > > +err_find_vqs:
> > > +       v4l2_device_unregister(&vv->v4l2_dev);
> > > +       return ret;
> > > +}
> > > +
> > > +static void virtio_media_remove(struct virtio_device *virtio_dev)
> > > +{
> > > +       struct virtio_media *vv =3D virtio_dev->priv;
> > > +
> > > +       virtio_reset_device(virtio_dev);
> > > +       v4l2_device_unregister(&vv->v4l2_dev);
> > > +       virtio_dev->config->del_vqs(virtio_dev);
> > > +       video_unregister_device(&vv->video_dev);
> > > +}
> > > +
> > > +static struct virtio_device_id id_table[] =3D {
> > > +       { VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> > > +       { 0 },
> > > +};
> > > +
> > > +static unsigned int features[] =3D {};
> > > +
> > > +static struct virtio_driver virtio_media_driver =3D {
> > > +       .feature_table =3D features,
> > > +       .feature_table_size =3D ARRAY_SIZE(features),
> > > +       .driver.name =3D VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> > > +       .driver.owner =3D THIS_MODULE,
> > > +       .id_table =3D id_table,
> > > +       .probe =3D virtio_media_probe,
> > > +       .remove =3D virtio_media_remove,
> > > +};
> > > +
> > > +module_virtio_driver(virtio_media_driver);
> > > +
> > > +MODULE_DEVICE_TABLE(virtio, id_table);
> > > +MODULE_DESCRIPTION("virtio media driver");
> > > +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> > > +MODULE_LICENSE("Dual BSD/GPL");
> > > diff --git a/include/uapi/linux/virtio_media.h b/include/uapi/linux/v=
irtio_media.h
> > > new file mode 100644
> > > index 000000000..280fbbe94
> > > --- /dev/null
> > > +++ b/include/uapi/linux/virtio_media.h
> > > @@ -0,0 +1,287 @@
> > > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR B=
SD-3-Clause) */
> > > +
> > > +/*
> > > + * Definitions of virtio-media protocol structures.
> > > + *
> > > + * Copyright (c) 2024-2026 Google LLC.
> > > + */
> > > +
> > > +#ifndef __VIRTIO_MEDIA_PROTOCOL_H
> > > +#define __VIRTIO_MEDIA_PROTOCOL_H
> > > +
> > > +#include <linux/videodev2.h>
> > > +
> > > +/*
> > > + * Virtio protocol definition.
> > > + */
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_header - Header for all virtio-media comm=
ands.
> > > + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> > > + * @__reserved: must be set to zero by the driver.
> > > + *
> > > + * This header starts all commands from the driver to the device on =
the
> > > + * commandq.
> > > + */
> > > +struct virtio_media_cmd_header {
> > > +       u32 cmd;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_resp_header - Header for all virtio-media res=
ponses.
> > > + * @status: 0 if the command was successful, or one of the standard =
Linux error
> > > + *          codes as a positive integer.
> > > + * @__reserved: must be set to zero by the device.
> > > + *
> > > + * This header starts all responses from the device to the driver on=
 the
> > > + * commandq.
> > > + */
> > > +struct virtio_media_resp_header {
> > > +       u32 status;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> > > + *
> > > + * This is the equivalent of calling ``open`` on a V4L2 device node.=
 Upon
> > > + * success, a session id is returned which can be used to perform ot=
her
> > > + * commands on the session, notably ioctls.
> > > + */
> > > +#define VIRTIO_MEDIA_CMD_OPEN 1
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CM=
D_OPEN.
> > > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> > > + */
> > > +struct virtio_media_cmd_open {
> > > +       struct virtio_media_cmd_header hdr;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_=
CMD_OPEN.
> > > + * @hdr: header containing the status of the command.
> > > + * @session_id: if &struct virtio_media_resp_header.status =3D=3D 0,=
 contains the
> > > + *              id of the newly created session.
> > > + * @__reserved: must be set to zero by the device.
> > > + */
> > > +struct virtio_media_resp_open {
> > > +       struct virtio_media_resp_header hdr;
> > > +       u32 session_id;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> > > + *
> > > + * This is the equivalent of calling ``close`` on a previously opene=
d V4L2
> > > + * session. All resources associated with this session will be freed=
 and the
> > > + * session ID shall not be used again after queueing this command.
> > > + *
> > > + * This command does not require a response from the device.
> > > + */
> > > +#define VIRTIO_MEDIA_CMD_CLOSE 2
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_C=
MD_CLOSE.
> > > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> > > + * @session_id: id of the session to close.
> > > + * @__reserved: must be set to zero by the driver.
> > > + */
> > > +struct virtio_media_cmd_close {
> > > +       struct virtio_media_cmd_header hdr;
> > > +       u32 session_id;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> > > + *
> > > + * This command asks the device to run one of the ``VIDIOC_*`` ioctl=
s on the
> > > + * active session.
> > > + *
> > > + * The code of the ioctl is extracted from the VIDIOC_* definitions =
in
> > > + * ``videodev2.h``, and consists of the second argument of the ``_IO=
*`` macro.
> > > + *
> > > + * Each ioctl has a payload, which is defined by the third argument =
of the
> > > + * ``_IO*`` macro defining it. It can be writable by the driver (``_=
IOW``), the
> > > + * device (``_IOR``), or both (``_IOWR``).
> > > + *
> > > + * If an ioctl is writable by the driver, it must be followed by a
> > > + * driver-writable descriptor containing the payload.
> > > + *
> > > + * If an ioctl is writable by the device, it must be followed by a
> > > + * device-writable descriptor of the size of the payload that the de=
vice will
> > > + * write into.
> > > + *
> > > + */
> > > +#define VIRTIO_MEDIA_CMD_IOCTL 3
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_C=
MD_IOCTL.
> > > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> > > + * @session_id: id of the session to run the ioctl on.
> > > + * @code: code of the ioctl to run.
> > > + */
> > > +struct virtio_media_cmd_ioctl {
> > > +       struct virtio_media_cmd_header hdr;
> > > +       u32 session_id;
> > > +       u32 code;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA=
_CMD_IOCTL.
> > > + * @hdr: header containing the status of the ioctl.
> > > + */
> > > +struct virtio_media_resp_ioctl {
> > > +       struct virtio_media_resp_header hdr;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_sg_entry - Description of part of a scattered=
 guest
> > > + *                                memory.
> > > + * @start: start guest address of the memory segment.
> > > + * @len: length of this memory segment.
> > > + * @__reserved: must be set to zero by the driver.
> > > + */
> > > +struct virtio_media_sg_entry {
> > > +       u64 start;
> > > +       u32 len;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_MMAP_FLAG_RW - Bit position of the VIRTIO_MEDIA_MMAP=
_FLAG_RW
> > > + *                             flag.
> > > + */
> > > +#define VIRTIO_MEDIA_MMAP_FLAG_RW 0
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into th=
e driver's
> > > + *                         address space.
> > > + */
> > > +#define VIRTIO_MEDIA_CMD_MMAP 4
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CM=
D_MMAP.
> > > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> > > + * @session_id: ID of the session we are mapping for.
> > > + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> > > + * @offset: mem_offset field of the plane to map, as returned by
> > > + *          VIDIOC_QUERYBUF.
> > > + */
> > > +struct virtio_media_cmd_mmap {
> > > +       struct virtio_media_cmd_header hdr;
> > > +       u32 session_id;
> > > +       u32 flags;
> > > +       u32 offset;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_=
CMD_MMAP.
> > > + * @hdr: header containing the status of the command.
> > > + * @driver_addr: offset into SHM region 0 of the start of the mappin=
g.
> > > + * @len: length of the mapping.
> > > + */
> > > +struct virtio_media_resp_mmap {
> > > +       struct virtio_media_resp_header hdr;
> > > +       u64 driver_addr;
> > > +       u64 len;
> > > +};
> > > +
> > > +/**
> > > + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped u=
sing
> > > + *                           VIRTIO_MEDIA_CMD_MMAP.
> > > + */
> > > +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > > +
> > > +/**
> > > + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_=
CMD_MUNMAP.
> > > + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> > > + * @driver_addr: offset into SHM region 0 at which the buffer has be=
en
> > > + *               previously mapped.
> > > + */
> > > +struct virtio_media_cmd_munmap {
> > > +       struct virtio_media_cmd_header hdr;
> > > +       u64 driver_addr;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_resp_munmap - Device response for
> > > + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> > > + * @hdr: header containing the status of the command.
> > > + */
> > > +struct virtio_media_resp_munmap {
> > > +       struct virtio_media_resp_header hdr;
> > > +};
> > > +
> > > +/* The values for these events are set by the virtio-media specifica=
tion. */
> > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > +#define VIRTIO_MEDIA_EVT_EVENT 2
> > > +
> > > +/**
> > > + * struct virtio_media_event_header - Header for events on the event=
q.
> > > + * @event: one of VIRTIO_MEDIA_EVT_*
> > > + * @session_id: ID of the session the event applies to.
> > > + */
> > > +struct virtio_media_event_header {
> > > +       u32 event;
> > > +       u32 session_id;
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_event_error - Unrecoverable device-side error=
.
> > > + * @hdr: header for the event.
> > > + * @errno: error code describing the kind of error that occurred.
> > > + * @__reserved: must be set to zero by the device.
> > > + *
> > > + * Upon receiving this event, the session mentioned in the header is=
 considered
> > > + * corrupted and closed.
> > > + */
> > > +struct virtio_media_event_error {
> > > +       struct virtio_media_event_header hdr;
> > > +       u32 errno;
> > > +       u32 __reserved;
> > > +};
> > > +
> > > +/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/vid=
eodev2.h.
> > > + * It is renamed here to match the constant that is defined in the v=
irtio-media
> > > + * specification.
> > > + */
> > > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> > > +
> > > +/**
> > > + * struct virtio_media_event_dqbuf - Dequeued buffer event.
> > > + * @hdr: header for the event.
> > > + * @buffer: &struct v4l2_buffer describing the buffer that has been =
dequeued.
> > > + * @planes: plane information for the dequeued buffer.
> > > + *
> > > + * This event is used to signal that a buffer is not being used anym=
ore by the
> > > + * device and is returned to the driver.
> > > + */
> > > +struct virtio_media_event_dqbuf {
> > > +       struct virtio_media_event_header hdr;
> > > +       struct v4l2_buffer buffer;
> > > +       struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> > > +};
> > > +
> > > +/**
> > > + * struct virtio_media_event_event - V4L2 event.
> > > + * @hdr: header for the event.
> > > + * @event: description of the event that occurred.
> > > + *
> > > + * This event signals that a V4L2 event has been emitted for a sessi=
on.
> > > + */
> > > +struct virtio_media_event_event {
> > > +       struct virtio_media_event_header hdr;
> > > +       struct v4l2_event event;
> > > +};
> > > +
> > > +/* Maximum size of an event. We will queue descriptors of this size =
on the
> > > + * eventq.
> > > + */
> > > +#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event=
_dqbuf)
> > > +
> > > +#endif // __VIRTIO_MEDIA_PROTOCOL_H
> > > --
> > > 2.55.0.737.g08866a6d13-goog
> > >
>
