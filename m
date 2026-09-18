Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADFB4FDA53
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744392; cv=pass; b=e9Gqosnt0esrAMMDfjPz1Sp38lXWVh8TeMqY54dO3gXhkWqM2TLYuCsWiLDLLZ6aEO2NE69a+iIg7mVFnwSxg0G+2XhzYjwk8btM7wSDHONiAzrMDzUbYu7Xd/WPz/DkYRRlW3UUIijl+qH8/CuXOZeNHVHsFF7n/RPthJzwrPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744392; c=relaxed/simple;
	bh=mc109JOmtAD/BxUQ4GBQQF3Lo63WE/ay8BUiNsr49EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imCP96VYcTcfSKMmdibMftrYlb2a1jZgudac25D1W8KFwmQyiNm/cnjlUP/kjUpFah7TUnCk+gc6WCYKDCGTKkHjHjHaz6OdaoGplSfjvMqcmklU4iJ2ZSw+SjxJhz/ue1GRUor8YA3wo9AEwoQa9qI2T5Eew1odnYPQSc4gxDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WV2frhp4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNywd8Kh; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WV2frhp4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNywd8Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789744388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZyGM9XbAjS5FQaVJ61z1uZ7LBeIP+0QGe59Kg9qCLs=;
	b=WV2frhp4vLf7S+pZ5WEYVPqVitSwp6x50DEjzzI1YgtgOI/HVWcxi4L9RFeM+wfhoVuXz2
	bbqFthLcWd1dGSc5oBOerceM6PgD788UuXp7ud5tZp6tD7VLQtGFVSmhRJ5BZWljTkB2jw
	x+AKcsSql5XEZ1XKURMlAI8t+RygSm4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-Z5zKaUjwPdGZMwf4y73FiQ-1; Fri, 18 Sep 2026 11:13:06 -0400
X-MC-Unique: Z5zKaUjwPdGZMwf4y73FiQ-1
X-Mimecast-MFC-AGG-ID: Z5zKaUjwPdGZMwf4y73FiQ_1789744385
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c9f68dcbso10197347b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744385; cv=none;
        d=google.com; s=arc-20260327;
        b=cqAz5q41A72jFV8JLjss3as8i1mrSNjkviI7sQTUQ6KIdaVI7PkcpgWmPR6a+O1drR
         8Kqo1p+zdD7TXfQgIYj7h8PLaypuaq1jL2TjIzRIKVcsVnGMKUeh02VMYEFtffuliTqt
         xGAvXT9q0xIEoixytSKbuDcng5VUdSSQvgvxcZ6njs+sx23koqsgy0lQxUiz5H2W+CnH
         hukt4vYbQeDR0i77ixQ4rQZ7G3NqLnAdAVn/ysp6vG/ecTJY1nMPV6E/sJ3RFw3kK3AS
         2ENIzOUWHRcY0AT4CX372rgtO+YeYNE9ckm9ah5zEooXI74NYXHPiGcj6BJRyngN+801
         SPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ZyGM9XbAjS5FQaVJ61z1uZ7LBeIP+0QGe59Kg9qCLs=;
        fh=+Io2qdUFyGJOlvXcpp/FiB7AzMCvJ4iXPXASGfy1ykk=;
        b=eBYip9QtAsLz1uxlLP8wC8mm0xB5h0s+3JnnipAG660+QSSJkrUckgaFOypEO+UJ+a
         HeJeAwCeSLclloqB8e/dXxTy4TrpTWi/P0etRNbJLYhLBHNOt0+f0VPZDRLAPmmoIUgu
         81xYcmpwpOyGLXZuTJyLIBYDa1hFT4+peoMD4C4l+xiAq2qYncO0kLb8mkm9ie1MwXGM
         LMr6p7frQSWhmoFo9k/NXmfpLETjBb9m/0aOVAq6Dwl5sk/uqxOn2yBWL6IQ7B2BiRsA
         53qF0gLeqDPL+oMXUqbFuND4RiGlHporpn8VGmfzU4Ylk4uVTjiDBnKWMRuBzKttH2br
         v1Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789744385; x=1790349185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZyGM9XbAjS5FQaVJ61z1uZ7LBeIP+0QGe59Kg9qCLs=;
        b=cNywd8KhhEw7xs4HSmV7mKJkW47b1mRdiyDplAWgJHFTH2QbHMyLhzWd6Xt9qUqd5q
         anQ6Nmw5mQ9k8T0JSzfn9s4pTHq/EzGnLbMPz8nIHZJAlkp2lLsYNqSopCcuXz+rTYF4
         m6jRMxn/zUifkH1yTxDmhaF7SZRFyPxWkrDscnek1/WP+ounCpxoY2f4RLxWhmXnmq3q
         0AtfN7B0SPxMQ6H/aNBE1ioBU7kwJlm+O2KkqWSokyoAXmDEmFEbCfwmqWKp89xav05p
         qilM4M9COfbOItl21sL42poKKk+YgLOlYaGwucLI1TNHpSkAx/NP0KtxiHi6UFu7Yk4f
         vz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744385; x=1790349185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZyGM9XbAjS5FQaVJ61z1uZ7LBeIP+0QGe59Kg9qCLs=;
        b=jUWQXjCaUXk6bG5VjiBhCIA4+K5C2sBxmxI4EWmg4CiOEjlNQB1XOsry1/aXdQtqPS
         B/FbZ5WfP4e1woiFrGxUpIBzW8Pn/oxp0+M5Gs4EzW7LeceAEa30Smvghnz/kZoSdeny
         7iJP+8mdPrG+7i/My1U09TU5bBR8jVra9XKNvrFY/PSAmMOrU/nilezRO4rHOWXkjyVb
         ye/V98yG60RpG87xdqGiQhgmo+7CDklH6i3jh8daknfWy9ivJsOTpXiJskqHa4YkFr0X
         a9aO6HoE7Z03QxGXanPNJV3AVP4fbUgsGW+/Vvjy8AYE9dXVSfHEUX2lJSCn64YgoGiK
         u0Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxTjcnoMKftZxbZKnaq9T4rK2bHw29ezSIJRHWsyxJhKvo/0+FJV/PEH9GslRXpDZk9QqI2xZpsqSW9DJU=@vger.kernel.org
X-Gm-Message-State: AFuF++ny7lObcAKOI1P815dDpt07A1yOVl5itPZu+AoEXJg2dJx7tLud
	8Pc8mhSZuEpAXFhXKN1WhRgwmA2osjcHYW9s0ehnCbhKVC62Xud9thLLQ7b1unEjnHf5YTjXHQV
	l/MG8ajZ1V4m29YDaZ/CBwl50AzlEJ2BgfaGOro/n3Fv+VZ2ELhC+HjCoHnutM51cKZsWXmIZ30
	NNC6A1f2LNpb7WF8cFAuupyGVIjGsU5ECFmpnA2c1Y
X-Gm-Gg: AYBFou24lvgaLqAgUCzBgdd5wnxejgLVd5zm7pJVe82o0QIGDzLvDbqVOhZYYpxST7F
	NH/nX7Ewl1t1UkVxB0srwVPS20bx+IAeNvAvbhxgTYYrgD3CrOau8VCzfzeJqpTNkPy5Tj5f+w+
	8xfDBqYzsXPzWKQ+O7+2Z/FimzhwMtnpMf/yaFpWxg8hohuJrVSPwPZA==
X-Received: by 2002:a05:690c:c6d2:b0:873:5bb2:6c33 with SMTP id 00721157ae682-8973636575bmr8357777b3.58.1789744385029;
        Fri, 18 Sep 2026 08:13:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c6d2:b0:873:5bb2:6c33 with SMTP id
 00721157ae682-8973636575bmr8357627b3.58.1789744384386; Fri, 18 Sep 2026
 08:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917171921.2810550-1-briandaniels@google.com> <20260917171921.2810550-3-briandaniels@google.com>
In-Reply-To: <20260917171921.2810550-3-briandaniels@google.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 18 Sep 2026 17:12:53 +0200
X-Gm-Features: AcwNN1UnUogZmGxGnsFVXylZ8Yt58UFcqlui0jiq9d9Ch2A83FPSpNk9y7YAZSM
Message-ID: <CADSE00LepQLECJcs2JhvM1gjx_VWdoaizyBCw=4OoYr6W1ti0g@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] media: virtio: Add session management
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, adelva@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:19=E2=80=AFPM Brian Daniels <briandaniels@google.=
com> wrote:
>
> From: Alexandre Courbot <gnurou@gmail.com>
>
> This patch adds session management to the virtio-media driver.
> A session is created when the /dev/videoX device is opened, and
> destroyed when it is closed.
>
> Opening a session sends VIRTIO_MEDIA_CMD_OPEN to the host, and closing
> it sends VIRTIO_MEDIA_CMD_CLOSE.
>
> It adds drivers/media/virtio/session.h and implements the open and
> release fops.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Assisted-by: Antigravity:gemini-3.5-flash
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  drivers/media/virtio/session.h             | 132 +++++
>  drivers/media/virtio/virtio_media_driver.c | 604 ++++++++++++++++++++-
>  2 files changed, 732 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/media/virtio/session.h
>
> diff --git a/drivers/media/virtio/session.h b/drivers/media/virtio/sessio=
n.h
> new file mode 100644
> index 000000000..d523c8171
> --- /dev/null
> +++ b/drivers/media/virtio/session.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> +
> +/*
> + * Definitions of virtio-media session related structures.
> + *
> + * Copyright (c) 2024-2026 Google LLC.
> + */
> +
> +#ifndef __VIRTIO_MEDIA_SESSION_H
> +#define __VIRTIO_MEDIA_SESSION_H
> +
> +#include <linux/scatterlist.h>
> +#include <media/v4l2-fh.h>
> +
> +#include "uapi/linux/virtio_media.h"
> +
> +#define VIRTIO_MEDIA_LAST_QUEUE (V4L2_BUF_TYPE_META_OUTPUT)
> +
> +/*
> + * Size of the per-session virtio shadow and event buffers. 16K should b=
e
> + * enough to contain everything we need.
> + */
> +#define VIRTIO_SHADOW_BUF_SIZE 0x4000
> +
> +/**
> + * struct virtio_media_buffer - Current state of a buffer.
> + * @buffer: &struct v4l2_buffer with current information about the buffe=
r.
> + * @planes: backing planes array for @buffer.
> + * @list: link into the list of buffers pending dequeue.
> + */
> +struct virtio_media_buffer {
> +       struct v4l2_buffer buffer;
> +       struct v4l2_plane planes[VIDEO_MAX_PLANES];
> +       struct list_head list;
> +};
> +
> +/**
> + * struct virtio_media_queue_state - Represents the state of a V4L2 queu=
e.
> + * @streaming: Whether the queue is currently streaming.
> + * @allocated_bufs: How many buffers are currently allocated.
> + * @is_capture_last: set to true when the last buffer has been received =
on a
> + *                   capture queue, so we can return %-EPIPE on subseque=
nt
> + *                   DQBUF requests.
> + * @buffers: Buffer state array of size @allocated_bufs.
> + * @queued_bufs: How many buffers are currently queued on the device.
> + * @pending_dqbufs: Buffers that are available for being dequeued.
> + */
> +struct virtio_media_queue_state {
> +       bool streaming;
> +       size_t allocated_bufs;
> +       bool is_capture_last;
> +
> +       struct virtio_media_buffer *buffers;
> +       size_t queued_bufs;
> +       struct list_head pending_dqbufs;
> +};
> +
> +/**
> + * struct virtio_media_session - A session on a virtio_media device.
> + * @fh: file handler for the session.
> + * @file: file pointer associated with the session's file handler.
> + * @id: session ID used to communicate with the device.
> + * @nonblocking_dequeue: whether dequeue should block or not (nonblockin=
g if
> + *                       file opened with O_NONBLOCK).
> + * @uses_mplane: whether the queues for this session use the MPLANE API =
or not.
> + * @cmd: union of session commands ``close``, ``ioctl``, and ``mmap``. A
> + *       session can have one command currently running. The rest of the
> + *       commands are handled by &struct virtio_media.
> + * @resp: union of responses to session commands ``close``, ``ioctl``, a=
nd
> + *        ``mmap``. A session can wait on one command only. The rest of =
the
> + *        responses are handled by &struct virtio_media.
> + * @shadow_buf: shadow buffer where data to be added to the descriptor c=
hain can
> + *              be staged before being sent to the device.
> + * @command_sgs: SG table gathering descriptors for a given command and =
its
> + *               response.
> + * @queues: state of all the queues for this session.
> + * @queues_lock: protects all members for the queues for this session.
> + * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`` need=
s to
> + *              block or when polling.
> + * @list: link into the list of sessions for the device.
> + */
> +struct virtio_media_session {
> +       struct v4l2_fh fh;
> +       struct file *file;
> +       u32 id;
> +       bool nonblocking_dequeue;
> +       bool uses_mplane;
> +
> +       __dma_from_device_group_begin();
> +       union {
> +               struct virtio_media_cmd_close close;
> +               struct virtio_media_cmd_ioctl ioctl;
> +               struct virtio_media_cmd_mmap mmap;
> +       } cmd;
> +
> +       union {
> +               struct virtio_media_resp_ioctl ioctl;
> +               struct virtio_media_resp_mmap mmap;
> +       } resp;
> +       __dma_from_device_group_end();
> +
> +       void *shadow_buf;
> +
> +       struct sg_table command_sgs;
> +
> +       struct virtio_media_queue_state queues[VIRTIO_MEDIA_LAST_QUEUE + =
1];
> +       struct mutex queues_lock; /* protects queues array and states */
> +       wait_queue_head_t dqbuf_wait;
> +
> +       struct list_head list;
> +};
> +
> +static inline struct virtio_media_session *fh_to_session(struct v4l2_fh =
*fh)
> +{
> +       return container_of(fh, struct virtio_media_session, fh);
> +}
> +
> +static inline void
> +virtio_media_session_fh_add(struct virtio_media_session *session,
> +                           struct file *file)
> +{
> +       v4l2_fh_add(&session->fh, file);
> +       session->file =3D file;
> +}
> +
> +static inline void
> +virtio_media_session_fh_del(struct virtio_media_session *session)
> +{
> +       v4l2_fh_del(&session->fh, session->file);
> +}
> +
> +#endif // __VIRTIO_MEDIA_SESSION_H
> diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/v=
irtio/virtio_media_driver.c
> index 25f2ceaa6..ef8065e34 100644
> --- a/drivers/media/virtio/virtio_media_driver.c
> +++ b/drivers/media/virtio/virtio_media_driver.c
> @@ -14,25 +14,589 @@
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> +#include <linux/slab.h>
> +#include <linux/scatterlist.h>
> +#include <linux/vmalloc.h>
> +#include <linux/workqueue.h>
> +#include <linux/dma-mapping.h>
>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-event.h>
>
>  #include "uapi/linux/virtio_media.h"
> +#include "session.h"
>  #include "virtio_media.h"
>
> -static void commandq_callback(struct virtqueue *vq)
> +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> +
> +/**
> + * virtio_media_session_alloc() - Allocate a new session.
> + * @vv: virtio-media device the session belongs to.
> + * @id: ID of the session.
> + * @file: file associated with the session.
> + */
> +static struct virtio_media_session *
> +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> +                          struct file *file)
> +{
> +       struct virtio_media_session *session;
> +       int i;
> +       int ret;
> +
> +       session =3D kzalloc_obj(*session, GFP_KERNEL);
> +       if (!session)
> +               goto err_session;
> +
> +       session->shadow_buf =3D kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNE=
L);
> +       if (!session->shadow_buf)
> +               goto err_shadow_buf;
> +
> +       ret =3D sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> +                            GFP_KERNEL);
> +       if (ret)
> +               goto err_payload_sgs;
> +
> +       session->id =3D id;
> +       session->nonblocking_dequeue =3D file->f_flags & O_NONBLOCK;
> +
> +       INIT_LIST_HEAD(&session->list);
> +       v4l2_fh_init(&session->fh, &vv->video_dev);
> +       virtio_media_session_fh_add(session, file);
> +
> +       for (i =3D 0; i <=3D VIRTIO_MEDIA_LAST_QUEUE; i++)
> +               INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> +       mutex_init(&session->queues_lock);
> +
> +       init_waitqueue_head(&session->dqbuf_wait);
> +
> +       mutex_lock(&vv->sessions_lock);
> +       list_add_tail(&session->list, &vv->sessions);
> +       mutex_unlock(&vv->sessions_lock);
> +
> +       return session;
> +
> +err_payload_sgs:
> +       kfree(session->shadow_buf);
> +err_shadow_buf:
> +       kfree(session);
> +err_session:
> +       return ERR_PTR(-ENOMEM);
> +}
> +
> +/**
> + * virtio_media_session_free() - Free all resources of a session.
> + * @vv: virtio-media device the session belongs to.
> + * @session: session to destroy.
> + *
> + * All the resources of @session, as well as the backing memory of @sess=
ion
> + * itself, are freed.
> + */
> +static void virtio_media_session_free(struct virtio_media *vv,
> +                                     struct virtio_media_session *sessio=
n)
> +{
> +       int i;
> +
> +       mutex_lock(&vv->sessions_lock);
> +       list_del(&session->list);
> +       mutex_unlock(&vv->sessions_lock);
> +
> +       virtio_media_session_fh_del(session);
> +       v4l2_fh_exit(&session->fh);
> +
> +       sg_free_table(&session->command_sgs);
> +
> +       for (i =3D 0; i <=3D VIRTIO_MEDIA_LAST_QUEUE; i++)
> +               vfree(session->queues[i].buffers);
> +
> +       kfree(session->shadow_buf);
> +       kfree(session);
> +}
> +
> +/**
> + * virtio_media_session_close() - Close and free a session.
> + * @vv: virtio-media device the session belongs to.
> + * @session: session to close and destroy.
> + *
> + * This sends the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and =
frees
> + * all resources used by @session.
> + */
> +static int virtio_media_session_close(struct virtio_media *vv,
> +                                     struct virtio_media_session *sessio=
n)
> +{
> +       struct virtio_media_cmd_close *cmd_close =3D &session->cmd.close;
> +       struct scatterlist cmd_sg =3D {};
> +       struct scatterlist *sgs[1] =3D { &cmd_sg };
> +       int ret;
> +
> +       mutex_lock(&vv->vlock);
> +
> +       cmd_close->hdr.cmd =3D VIRTIO_MEDIA_CMD_CLOSE;
> +       cmd_close->session_id =3D session->id;
> +
> +       sg_set_buf(&cmd_sg, cmd_close, sizeof(*cmd_close));
> +       sg_mark_end(&cmd_sg);
> +
> +       ret =3D virtio_media_send_command(vv, sgs, 1, 0, 0, NULL);
> +       mutex_unlock(&vv->vlock);
> +       if (ret < 0)
> +               return ret;
> +
> +       virtio_media_session_free(vv, session);
> +
> +       return 0;
> +}
> +
> +/**
> + * virtio_media_find_session() - Look up a session with a given ID.
> + * @vv: virtio-media device to lookup the session from.
> + * @id: ID of the session to lookup.
> + */
> +static struct virtio_media_session *
> +virtio_media_find_session(struct virtio_media *vv, u32 id)
> +{
> +       struct list_head *p;
> +       struct virtio_media_session *session =3D NULL;
> +
> +       mutex_lock(&vv->sessions_lock);
> +       list_for_each(p, &vv->sessions) {
> +               struct virtio_media_session *s =3D
> +                       list_entry(p, struct virtio_media_session, list);
> +               if (s->id =3D=3D id) {
> +                       session =3D s;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&vv->sessions_lock);
> +
> +       return session;
> +}
> +
> +/**
> + * struct virtio_media_cmd_callback_param - Callback parameters to the v=
irtio
> + *                                          command queue.
> + * @vv: virtio-media device in use.
> + * @done: flag to be switched once the command is completed.
> + * @resp_len: length of the received response from the command. Only val=
id
> + *            after @done flag has switched to %true.
> + */
> +struct virtio_media_cmd_callback_param {
> +       struct virtio_media *vv;
> +       bool done;
> +       size_t resp_len;
> +};
> +
> +/**
> + * commandq_callback() - Callback for the command queue.
> + * @queue: command virtqueue.
> + *
> + * This just wakes up the thread that was waiting on the command to comp=
lete.
> + */
> +static void commandq_callback(struct virtqueue *queue)
> +{
> +       unsigned int len;
> +       struct virtio_media_cmd_callback_param *param;
> +
> +process_bufs:
> +       while ((param =3D virtqueue_get_buf(queue, &len))) {
> +               param->done =3D true;
> +               param->resp_len =3D len;
> +               wake_up(&param->vv->wq);
> +       }
> +
> +       if (!virtqueue_enable_cb(queue)) {
> +               virtqueue_disable_cb(queue);
> +               goto process_bufs;
> +       }
> +}
> +
> +/**
> + * virtio_media_kick_command() - send a command to the commandq.
> + * @vv: virtio-media device in use.
> + * @sgs: descriptor chain to send.
> + * @out_sgs: number of device-readable descriptors in @sgs.
> + * @in_sgs: number of device-writable descriptors in @sgs.
> + * @resp_len: output parameter. Upon success, contains the size of the r=
esponse
> + *            in bytes.
> + */
> +static int virtio_media_kick_command(struct virtio_media *vv,
> +                                    struct scatterlist **sgs,
> +                                    const size_t out_sgs, const size_t i=
n_sgs,
> +                                    size_t *resp_len)
> +{
> +       struct virtio_media_cmd_callback_param cb_param =3D {
> +               .vv =3D vv,
> +               .done =3D false,
> +               .resp_len =3D 0,
> +       };
> +       struct virtio_media_resp_header *resp_header;
> +       int ret =3D virtqueue_add_sgs(vv->commandq, sgs, out_sgs, in_sgs,
> +                 &cb_param, GFP_ATOMIC);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "failed to add sgs to command virtqueue\n");
> +               return ret;
> +       }
> +
> +       if (!virtqueue_kick(vv->commandq)) {
> +               v4l2_err(&vv->v4l2_dev, "failed to kick command virtqueue=
\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Wait for the response. */
> +       ret =3D wait_event_timeout(vv->wq, cb_param.done, 5 * HZ);
> +       if (ret =3D=3D 0) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "timed out waiting for response to command\n");
> +               return -ETIMEDOUT;

In https://sashiko.dev/#/message/20260917175228.D2AAB1F00893%40smtp.kernel.=
org
there is a UAF comment on this part that looks legit (returning
-ETIMEDOUT while the vq still owns &cb_param). It would be better to
wait_for_completion as virtio_scsi does?

It is not the only issue from sashiko that sounds like a real problem
in the series. Please take a look.

> +       }
> +
> +       if (resp_len)
> +               *resp_len =3D cb_param.resp_len;
> +
> +       if (in_sgs > 0) {
> +               /*
> +                * If we expect a response, make sure we have at least a
> +                * response header - anything shorter is invalid.
> +                */
> +               if (cb_param.resp_len < sizeof(*resp_header)) {
> +                       v4l2_err(&vv->v4l2_dev,
> +                                "received response header is too short\n=
");
> +                       return -EINVAL;
> +               }
> +
> +               resp_header =3D sg_virt(sgs[out_sgs]);
> +               if (resp_header->status)
> +                       /* Host returns a positive error code. */
> +                       return -resp_header->status;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * virtio_media_send_command() - Send a command to the device and wait f=
or its
> + * response.
> + * @vv: virtio-media device in use.
> + * @sgs: descriptor chain to send.
> + * @out_sgs: number of device-readable descriptors in @sgs.
> + * @in_sgs: number of device-writable descriptors in @sgs.
> + * @minimum_resp_len: minimum length of the response expected by the cal=
ler
> + *                    when the command is successful. Anything shorter t=
han
> + *                    that will result in %-EINVAL being returned.
> + * @resp_len: output parameter. Upon success, contains the size of the r=
esponse
> + *            in bytes.
> + */
> +int virtio_media_send_command(struct virtio_media *vv, struct scatterlis=
t **sgs,
> +                             const size_t out_sgs, const size_t in_sgs,
> +                             size_t minimum_resp_len, size_t *resp_len)
> +{
> +       size_t local_resp_len =3D resp_len ? *resp_len : 0;
> +       int ret =3D virtio_media_kick_command(vv, sgs, out_sgs, in_sgs,
> +                                           &local_resp_len);
> +       if (resp_len)
> +               *resp_len =3D local_resp_len;
> +
> +       /*
> +        * If the host could not process the command, there is no valid
> +        * response.
> +        */
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Make sure the host wrote a complete reply. */
> +       if (local_resp_len < minimum_resp_len) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "received response is too short: received %zu, e=
xpected at least %zu\n",
> +                        local_resp_len, minimum_resp_len);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * virtio_media_send_event_buffer() - Sends an event buffer to the host =
so it
> + * can return it with an event.
> + * @vv: virtio-media device in use.
> + * @event_buffer: pointer to the event buffer to send to the device.
> + */
> +static int virtio_media_send_event_buffer(struct virtio_media *vv,
> +                                         void *event_buffer)
> +{
> +       struct scatterlist *sgs[1], vresp;
> +       int ret;
> +
> +       sg_init_one(&vresp, event_buffer, VIRTIO_MEDIA_EVENT_MAX_SIZE);
> +       sgs[0] =3D &vresp;
> +
> +       ret =3D virtqueue_add_sgs(vv->eventq, sgs, 0, 1, event_buffer,
> +                               GFP_ATOMIC);
> +       if (ret) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "failed to add sgs to event virtqueue\n");
> +               return ret;
> +       }
> +
> +       if (!virtqueue_kick(vv->eventq)) {
> +               v4l2_err(&vv->v4l2_dev, "failed to kick event virtqueue\n=
");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * eventq_callback() - Callback for the event queue.
> + * @queue: event virtqueue.
> + *
> + * This just schedules for event work to be run.
> + */
> +static void eventq_callback(struct virtqueue *queue)
> +{
> +       struct virtio_media *vv =3D queue->vdev->priv;
> +
> +       schedule_work(&vv->eventq_work);
> +}
> +
> +/**
> + * virtio_media_process_dqbuf_event() - Process a dequeued event for a s=
ession.
> + * @vv: virtio-media device in use.
> + * @session: session the event is addressed to.
> + * @dqbuf_evt: the dequeued event to process.
> + *
> + * Invalid events are ignored with an error log.
> + */
> +static void
> +virtio_media_process_dqbuf_event(struct virtio_media *vv,
> +                                struct virtio_media_session *session,
> +                                struct virtio_media_event_dqbuf *dqbuf_e=
vt)
> +{
> +       struct virtio_media_buffer *dqbuf;
> +       const enum v4l2_buf_type queue_type =3D dqbuf_evt->buffer.type;
> +       struct virtio_media_queue_state *queue;
> +       typeof(dqbuf->buffer.m) buffer_m;
> +       typeof(dqbuf->buffer.m.planes[0].m) plane_m;
> +       int i;
> +
> +       if (queue_type >=3D ARRAY_SIZE(session->queues)) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "unmanaged queue %d passed to dqbuf event",
> +                        dqbuf_evt->buffer.type);
> +               return;
> +       }
> +       queue =3D &session->queues[queue_type];
> +
> +       if (dqbuf_evt->buffer.index >=3D queue->allocated_bufs) {
> +               v4l2_err(&vv->v4l2_dev,
> +                        "invalid buffer ID %d for queue %d in dqbuf even=
t",
> +                        dqbuf_evt->buffer.index, dqbuf_evt->buffer.type)=
;
> +               return;
> +       }
> +
> +       dqbuf =3D &queue->buffers[dqbuf_evt->buffer.index];
> +
> +       /*
> +        * Preserve the 'm' union that was passed to us during QBUF so us=
erspace
> +        * gets back the information it submitted.
> +        */
> +       buffer_m =3D dqbuf->buffer.m;
> +       memcpy(&dqbuf->buffer, &dqbuf_evt->buffer, sizeof(dqbuf->buffer))=
;
> +       dqbuf->buffer.m =3D buffer_m;
> +       if (V4L2_TYPE_IS_MULTIPLANAR(dqbuf->buffer.type)) {
> +               if (dqbuf->buffer.length > VIDEO_MAX_PLANES) {
> +                       v4l2_err(&vv->v4l2_dev,
> +                                "invalid number of planes received from =
host for a multiplanar buffer\n");
> +                       return;
> +               }
> +               for (i =3D 0; i < dqbuf->buffer.length; i++) {
> +                       plane_m =3D dqbuf->planes[i].m;
> +                       memcpy(&dqbuf->planes[i], &dqbuf_evt->planes[i],
> +                              sizeof(struct v4l2_plane));
> +                       dqbuf->planes[i].m =3D plane_m;
> +               }
> +       }
> +
> +       /* Set the DONE flag as the buffer is waiting to be dequeued. */
> +       dqbuf->buffer.flags |=3D V4L2_BUF_FLAG_DONE;
> +
> +       mutex_lock(&session->queues_lock);
> +       list_add_tail(&dqbuf->list, &queue->pending_dqbufs);
> +       queue->queued_bufs -=3D 1;
> +       mutex_unlock(&session->queues_lock);
> +
> +       wake_up(&session->dqbuf_wait);
> +}
> +
> +/**
> + * virtio_media_process_events() - Process all pending events on a devic=
e.
> + * @vv: device whose pending events we want to process.
> + *
> + * Retrieves all pending events on @vv's event queue and dispatches them=
 to
> + * their corresponding session.
> + *
> + * Invalid events are ignored with an error log.
> + */
> +void virtio_media_process_events(struct virtio_media *vv)
> +{
> +       struct virtio_media_event_error *error_evt;
> +       struct virtio_media_event_dqbuf *dqbuf_evt;
> +       struct virtio_media_event_event *event_evt;
> +       struct virtio_media_session *session;
> +       struct virtio_media_event_header *evt;
> +       unsigned int len;
> +
> +       mutex_lock(&vv->events_lock);
> +
> +process_bufs:
> +       while ((evt =3D virtqueue_get_buf(vv->eventq, &len))) {
> +               /* Make sure we received enough data */
> +               if (len < sizeof(*evt)) {
> +                       v4l2_err(&vv->v4l2_dev,
> +                                "event is too short: got %u, expected at=
 least %zu\n",
> +                                len, sizeof(*evt));
> +                       goto end_of_event;
> +               }
> +
> +               session =3D virtio_media_find_session(vv, evt->session_id=
);
> +               if (!session) {
> +                       v4l2_err(&vv->v4l2_dev, "cannot find session %d\n=
",
> +                                evt->session_id);
> +                       goto end_of_event;
> +               }
> +
> +               switch (evt->event) {
> +               case VIRTIO_MEDIA_EVT_ERROR:
> +                       if (len < sizeof(*error_evt)) {
> +                               v4l2_err(&vv->v4l2_dev,
> +                                        "error event is too short: got %=
u, expected %zu\n",
> +                                        len, sizeof(*error_evt));
> +                               break;
> +                       }
> +                       error_evt =3D (struct virtio_media_event_error *)=
evt;
> +                       v4l2_err(&vv->v4l2_dev,
> +                                "received error %d for session %d",
> +                                error_evt->errno, error_evt->hdr.session=
_id);
> +                       virtio_media_session_close(vv, session);
> +                       break;
> +
> +               /*
> +                * Dequeued buffer: put it into the right queue so user-s=
pace
> +                * can dequeue it.
> +                */
> +               case VIRTIO_MEDIA_EVT_DQBUF:
> +                       if (len < sizeof(*dqbuf_evt)) {
> +                               v4l2_err(&vv->v4l2_dev,
> +                                        "dqbuf event is too short: got %=
u, expected %zu\n",
> +                                        len, sizeof(*dqbuf_evt));
> +                               break;
> +                       }
> +                       dqbuf_evt =3D (struct virtio_media_event_dqbuf *)=
evt;
> +                       virtio_media_process_dqbuf_event(vv, session,
> +                                                        dqbuf_evt);
> +                       break;
> +
> +               case VIRTIO_MEDIA_EVT_EVENT:
> +                       if (len < sizeof(*event_evt)) {
> +                               v4l2_err(&vv->v4l2_dev,
> +                                        "session event is too short: got=
 %u expected %zu\n",
> +                                        len, sizeof(*event_evt));
> +                               break;
> +                       }
> +
> +                       event_evt =3D (struct virtio_media_event_event *)=
evt;
> +                       v4l2_event_queue_fh(&session->fh, &event_evt->eve=
nt);
> +                       break;
> +
> +               default:
> +                       v4l2_err(&vv->v4l2_dev, "unknown event type %d\n"=
,
> +                                evt->event);
> +                       break;
> +               }
> +
> +end_of_event:
> +               virtio_media_send_event_buffer(vv, evt);
> +       }
> +
> +       if (!virtqueue_enable_cb(vv->eventq)) {
> +               virtqueue_disable_cb(vv->eventq);
> +               goto process_bufs;
> +       }
> +
> +       mutex_unlock(&vv->events_lock);
> +}
> +
> +static void virtio_media_event_work(struct work_struct *work)
>  {
> +       struct virtio_media *vv =3D
> +               container_of(work, struct virtio_media, eventq_work);
> +
> +       virtio_media_process_events(vv);
> +}
> +
> +/**
> + * virtio_media_device_open() - Create a new session from an opened file=
.
> + * @file: opened file for the session.
> + */
> +static int virtio_media_device_open(struct file *file)
> +{
> +       struct video_device *video_dev =3D video_devdata(file);
> +       struct virtio_media *vv =3D to_virtio_media(video_dev);
> +       struct virtio_media_cmd_open *cmd_open =3D &vv->cmd.open;
> +       struct virtio_media_resp_open *resp_open =3D &vv->resp.open;
> +       struct scatterlist cmd_sg =3D {}, resp_sg =3D {};
> +       struct scatterlist *sgs[2] =3D { &cmd_sg, &resp_sg };
> +       struct virtio_media_session *session;
> +       u32 session_id;
> +       int ret;
> +
> +       mutex_lock(&vv->vlock);
> +
> +       sg_set_buf(&cmd_sg, cmd_open, sizeof(*cmd_open));
> +       sg_mark_end(&cmd_sg);
> +
> +       sg_set_buf(&resp_sg, resp_open, sizeof(*resp_open));
> +       sg_mark_end(&resp_sg);
> +
> +       cmd_open->hdr.cmd =3D VIRTIO_MEDIA_CMD_OPEN;

cmd_open->hdr.cmd =3D cpu_to_le32(VIRTIO_MEDIA_CMD_OPEN);

> +       ret =3D virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_ope=
n),
> +                                       NULL);
> +       session_id =3D resp_open->session_id;

session_id =3D le32_to_cpu(resp_open->session_id);

There are multiple places where this happens. I think sashiko also
commented on this, so there may be a more exhaustive list of
occurrences.


> +       mutex_unlock(&vv->vlock);
> +       if (ret < 0)
> +               return ret;
> +
> +       session =3D virtio_media_session_alloc(vv, session_id, file);
> +       if (IS_ERR(session))
> +               return PTR_ERR(session);
> +
> +       file->private_data =3D &session->fh;
> +
> +       return 0;
>  }
>
> -static void eventq_callback(struct virtqueue *vq)
> +/**
> + * virtio_media_device_close() - Close a previously opened session.
> + * @file: file of the session to close.
> + *
> + * This sends the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and =
closes
> + * the session on the driver side.
> + */
> +static int virtio_media_device_close(struct file *file)
>  {
> +       struct video_device *video_dev =3D video_devdata(file);
> +       struct virtio_media *vv =3D to_virtio_media(video_dev);
> +       struct virtio_media_session *session =3D
> +               fh_to_session(file->private_data);
> +
> +       return virtio_media_session_close(vv, session);
>  }
>
>  static const struct v4l2_file_operations virtio_media_fops =3D {
>         .owner =3D THIS_MODULE,
> -       .open =3D v4l2_fh_open,
> -       .release =3D v4l2_fh_release,
> +       .open =3D virtio_media_device_open,
> +       .release =3D virtio_media_device_close,
>  };
>
>  static int virtio_media_probe(struct virtio_device *virtio_dev)
> @@ -51,12 +615,23 @@ static int virtio_media_probe(struct virtio_device *=
virtio_dev)
>         };
>         struct virtio_media *vv;
>         struct video_device *vd;
> +       int i;
>         int ret;
>
>         vv =3D devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
>         if (!vv)
>                 return -ENOMEM;
>
> +       const size_t virtio_media_event_aligned_size =3D
> +               ALIGN(VIRTIO_MEDIA_EVENT_MAX_SIZE, dma_get_cache_alignmen=
t());
> +
> +       vv->event_buffer =3D devm_kzalloc(dev,
> +                                       virtio_media_event_aligned_size *
> +                                       VIRTIO_MEDIA_NUM_EVENT_BUFS,
> +                                       GFP_KERNEL);
> +       if (!vv->event_buffer)
> +               return -ENOMEM;
> +
>         INIT_LIST_HEAD(&vv->sessions);
>         mutex_init(&vv->sessions_lock);
>         mutex_init(&vv->events_lock);
> @@ -77,6 +652,7 @@ static int virtio_media_probe(struct virtio_device *vi=
rtio_dev)
>
>         vv->commandq =3D vqs[0];
>         vv->eventq =3D vqs[1];
> +       INIT_WORK(&vv->eventq_work, virtio_media_event_work);
>
>         vd =3D &vv->video_dev;
>         vd->v4l2_dev =3D &vv->v4l2_dev;
> @@ -100,10 +676,21 @@ static int virtio_media_probe(struct virtio_device =
*virtio_dev)
>         if (ret)
>                 goto err_register_device;
>
> +       for (i =3D 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
> +               void *ebuf =3D vv->event_buffer +
> +                            virtio_media_event_aligned_size * i;
> +
> +               ret =3D virtio_media_send_event_buffer(vv, ebuf);
> +               if (ret)
> +                       goto err_send_event_buffer;
> +       }
> +
>         virtio_device_ready(virtio_dev);
>
>         return 0;
>
> +err_send_event_buffer:
> +       video_unregister_device(&vv->video_dev);
>  err_register_device:
>         virtio_dev->config->del_vqs(virtio_dev);
>  err_find_vqs:
> @@ -114,11 +701,20 @@ static int virtio_media_probe(struct virtio_device =
*virtio_dev)
>  static void virtio_media_remove(struct virtio_device *virtio_dev)
>  {
>         struct virtio_media *vv =3D virtio_dev->priv;
> +       struct list_head *p, *n;
>
> +       cancel_work_sync(&vv->eventq_work);
>         virtio_reset_device(virtio_dev);
>         v4l2_device_unregister(&vv->v4l2_dev);
>         virtio_dev->config->del_vqs(virtio_dev);
>         video_unregister_device(&vv->video_dev);
> +
> +       list_for_each_safe(p, n, &vv->sessions) {
> +               struct virtio_media_session *s =3D
> +                       list_entry(p, struct virtio_media_session, list);
> +
> +               virtio_media_session_free(vv, s);
> +       }
>  }
>
>  static struct virtio_device_id id_table[] =3D {
> --
> 2.55.0.1082.g2b9226bbc0-goog
>

