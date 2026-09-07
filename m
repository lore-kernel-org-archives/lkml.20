Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52246C84A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778844; cv=none; b=SMSt4rKMgpHYTeQNIyzjk5KbVOhK/0BxMj5K9DdXJUPFXZu+ugOzBP8aLYKSNctqT0EYZbBTIyLvv22/+1b2jzpmXh/dy0XDdgjhhhbUG+xGLMyruwU9aECJrQgDJkEMr77R6mT3yTk0bvh/A04LhU4sLJ7xd8kTRTXyIVZVN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778844; c=relaxed/simple;
	bh=hSbWcPg05KVdFqFuBKVec1C2BhxVnKddy8QAZg8aOrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoIuvudmoFiI77lV2/wZqVEAoqSM3iY72AyHRl7uNT6ma2QU9O1lS4MODMZ3VvVmdKliusHNAR3PHpUiEKAVws+Hv8rZ+bVggU59M1C6isMhKvWzzcdt6hdcI1YR/TaDW6Vo5AjNFjzOt8WZiTUhCTKdagL7hW25vw03kSz3JOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KgNuOq3/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KgNuOq3/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2472025b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788778841; x=1789383641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ttp/KYYLgftsnk1qhEW1Mdud2MrrLLmZu152prkmqBo=;
        b=KgNuOq3/I/B1PghgF9D3l5tJuD8JZN2DZGdPcVpvwrmXEh0zMwnmr1Z24A62ubGQfK
         +we5vNMysDskD7JDDVAmZUhKSAGRRrVO5Ox96unLxuLxza00t/v9GNKKlmfjiOhuvu7V
         Svp43R9F+Qb4IWDvykqHC99Gq+I9g3tqRgHFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778841; x=1789383641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttp/KYYLgftsnk1qhEW1Mdud2MrrLLmZu152prkmqBo=;
        b=Zdh/ulv2kMcNTy3WkRdjkS2U1bF/X4HobkZvsEHrOOPY1hA4KUJsArlx4yppcCDK4X
         Yulu1KEtMXbm0aIuFwHNXsIpbqVileo6/RBcf9AaMHaIH9o4JW6QF91l2l+x1Yoz7OV9
         rOXT2a+Seehb2h0w6uuQ8k+0MdtiVqNbYmIduoXRxLB2RI1u1c9QHdhYGnqhqXaHhyJZ
         sPsaJQ6IRkBGUv8mcNN80GdqFYDAPorJhVuP//IDsRJ9ECdano74t2wiDOrTPz2kWpBz
         +jtotYsajhZlc5H/8/knis3qj6l8Ugi/gVMOncaDv1kuVr4yAMrvxr9MHmKCJr0XALpL
         ljBQ==
X-Forwarded-Encrypted: i=1; AKwUvBziPbQQjGSALeehepfZETaBZYPfBfsoJz0tuKRJxb93EIODsFG36BjBjgocAM9ftZTvBtbUf1ikFu9UKYA=@vger.kernel.org
X-Gm-Message-State: AFuF++milR8JeAbtiOv63RkT/2TfcC4sWycf6D+RX2sp8/rejAtw3SEG
	FtnqtaTu4TZyLsp13WWfR+oi4EUwab38bZDtOjCa9wA/hGGE5H5ghjmtOo01T+gD8PUdSrSd4iL
	FXWj8XA==
X-Gm-Gg: AYBFou2+2iIb7otJ04/miDEN1EJ0rgFGfnwB4r5b60ifo0/pawAtsUGJKOUsNrssh3G
	eDSpByQ38G7Wut158KOn/5MPU4bGJWSCJ9QftZuATTfC2iNPh9koYlDyVQeF41UBhqbeb3H4sdI
	BEFRjP9u/RcCtgoWG84xskNv74ts0ulXrZRsnTXc7ql5glLCn+j1cf8QRNTXoxlnVbivR8pMUzh
	4QfPY4jtSHlh+GrnRDvriEqQ5tB0ZtvAt3lfsKvxZN+yKgENQj+aleexsuz2FYNLaNFbzjzFnff
	1jyuAJiNw+2xbo7Hb3nazoPRbU10iuOzgm78hkRce+WIp253YE9ji1f622zWgmm3Ltlzh7MSEdE
	IDStEEvRW9/S5ZeHmE8AtHVtt9IA7CNe6l3xb5mdcP/Xofjrtca5T87PuNMvx3/UwEJgQIBR8fV
	JsnLYGQHUyYJ+MPhBOhiRs4Kt+l9Y00osip2boF0rD9kDFllJDj/RUx9HrfxzYdRHWdt/8Ec9KZ
	Cu8wf4HHEuXxoq4y0D/IpjIDQ==
X-Received: by 2002:a05:6a00:2994:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-86169f6cbcbmr36277071b3a.24.1788778840756;
        Mon, 07 Sep 2026 04:00:40 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c31726sm4193817b3a.32.2026.09.07.04.00.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:00:39 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2435367a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuRIruT5fKDJ59xVx6i79WCfDKwmiWo3hkO1KdhAOaAxzoPmqzPbCyh16+IbGY6VMwUmcp3Q909/6O52w=@vger.kernel.org
X-Received: by 2002:a17:90b:4d85:b0:37d:f206:a2ac with SMTP id
 98e67ed59e1d1-39b2617abf0mr33879466a91.7.1788778837689; Mon, 07 Sep 2026
 04:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903131141.6368-1-huhb1@xiaopeng.com> <20260903141532.6693-1-huhb1@xiaopeng.com>
 <CANiDSCuxtH1wbXAwoWrbV6Y97dN3Ym-A2zSbkEpLVEGFToXLfg@mail.gmail.com> <CAEN5SX-wJO0b+uMufCpQCDXCaiHGaucAE+t7ahLTtbtNFyop7Q@mail.gmail.com>
In-Reply-To: <CAEN5SX-wJO0b+uMufCpQCDXCaiHGaucAE+t7ahLTtbtNFyop7Q@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 13:00:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCup31OTP-5WEDn8AMrFiidJfWFCNEp+FhpHQjN57-16_w@mail.gmail.com>
X-Gm-Features: AcwNN1W9-U8mY4AEQJHpdqp1e0wOFY5D0ghBJlMwS6FiBhL70-ervQyzAw3j7wY
Message-ID: <CANiDSCup31OTP-5WEDn8AMrFiidJfWFCNEp+FhpHQjN57-16_w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: defer cancelled buffer completion
 until copies finish
To: =?UTF-8?B?6IOh5rSq5YW1?= <huhb04@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, 7 Sept 2026 at 05:23, =E8=83=A1=E6=B4=AA=E5=85=B5 <huhb04@gmail.com=
> wrote:
>
> Hi Ricardo,
> Sorry for the late reply and thanks for your review.
> The issue is exactly as you described.
>
> Ricardo Ribalda <ribalda@chromium.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=884=
=E6=97=A5=E5=91=A8=E4=BA=94 21:00=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi Hongbing
>>
>> Let me rewrite the commit message for me, because it took me a while
>> to understand what was going on. (totally on me). Please correct me if
>> I miss-understood the issue.
>>
>> The UVC driver processes frames in urbs. A frame usually is divided in
>> multiple urbs. The urb handler parses the header and the metadata, but
>> leaves the expensive memcpy to a workqueue.
>>
>> At any given moment, during streamon we will have:
>> - the current frame with (0-N) async memcpys waiting to happen. The
>> current frame is in queue->irqqueue. It has a refcnt of 1 + N memcpy
>> - Previous frames with (N) async memcpys waiting to happen. They are
>> not in queue->irqqueue. They have a refcnt of N memcpy
>>
>> With the current behaviour, when there is urb with an error we flush
>> the queue->irqque() irrespetively if they have any pending memcpys.
>>
>> There can be situations where the memcpy occurs after we have flushed
>> the frames and they are returned to the user. Instead, we should
>> exploit the refcnt mechanism to return the frames only after the
>> memcpys have been completed.
>>
>> This patch does so
>>
>> On Thu, 3 Sept 2026 at 16:33, Hongbing Hu <huhb04@gmail.com> wrote:
>> >
>> > From: Hongbing Hu <huhb04@gmail.com>
>> >
>> > uvc_queue_cancel() returns queued buffers to videobuf2 directly via
>> > vb2_buffer_done(). This is unsafe because asynchronous memcpy workers =
may
>> > still hold a reference on the same uvc_buffer. Once vb2_buffer_done() =
has
>> > run, userspace can dequeue and requeue the buffer while the old worker=
 is
>> > still running, leading to the same list_head being inserted into irqqu=
eue
>> > twice and corrupting the list.
>> >
>> > The crash manifests in two ways depending on the drop-corrupted-frames
>> > module parameter:
>> >
>> > 1. With the drop corrupted frames enabled, the old worker's
>> >    final kref_put reaches uvc_queue_buffer_complete(), sees buf->error=
 set,
>> >    and calls uvc_queue_buffer_requeue(). This performs list_add_tail()=
 on
>> >    buf->queue even though userspace has already QBUF'd the same buffer=
 and
>> >    added it to irqqueue.
>> >
>> > 2. With nodrop=3D1, uvc_queue_buffer_complete() calls vb2_buffer_done(=
) a
>> >    second time. If userspace has already dequeued and requeued the buf=
fer,
>> >    the second completion exposes it to userspace again, and the next
>> >    DQBUF/QBUF inserts the still-linked list_head into irqqueue a secon=
d
>> >    time.
>> >
>> > Both cases produce the kind of list_del corruption seen here:
>> >
>> >     list_del corruption. next->prev should be ..., but was ...
>> >     kernel BUG at lib/list_debug.c:64!
>> >
>> > Fix the cancel path to remove buffers from irqqueue and drop the queue=
's
>> > reference through uvc_queue_buffer_release() (i.e. kref_put()). The fi=
nal
>> > VB2 completion then only happens from uvc_queue_buffer_complete() once=
 the
>> > last async reference is released, so userspace cannot reuse the buffer
>> > while an old worker still accesses it.
>> >
>> > A buffer whose state is already UVC_BUF_STATE_ERROR is forced to compl=
ete
>> > as an error and must not be requeued by the corrupted-frame policy. No=
rmal
>> > malformed frames are still requeued/dropped as before.
>> >
>> > Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buf=
fer handling")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Hongbing Hu <huhb04@gmail.com>
>> > ---
>> > v2: corrected author real name in From/SOB per maintainer feedback
>> >
>> >  drivers/media/usb/uvc/uvc_queue.c | 30 ++++++++++++++++++++++++++++--
>> >  1 file changed, 28 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc=
/uvc_queue.c
>> > index 3c002c8f44..9206e0a355 100644
>> > --- a/drivers/media/usb/uvc/uvc_queue.c
>> > +++ b/drivers/media/usb/uvc/uvc_queue.c
>> > @@ -289,10 +289,19 @@ int uvc_queue_init(struct uvc_streaming *stream,=
 struct uvc_video_queue *queue,
>> >   */
>> >  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>> >  {
>> > +       struct uvc_buffer *buf, *next;
>> > +       struct list_head local_list;
>> >         unsigned long flags;
>> >
>> > +       INIT_LIST_HEAD(&local_list);
>> > +
>> >         spin_lock_irqsave(&queue->irqlock, flags);
>> > -       __uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>> > +       while (!list_empty(&queue->irqqueue)) {
>> > +               buf =3D list_first_entry(&queue->irqqueue, struct uvc_=
buffer, queue);
>> > +               list_del(&buf->queue);
>> > +               buf->state =3D UVC_BUF_STATE_ERROR;
>> > +               list_add_tail(&buf->queue, &local_list);
>> > +       }
>> >         /*
>> >          * This must be protected by the irqlock spinlock to avoid rac=
e
>> >          * conditions between uvc_buffer_queue and the disconnection e=
vent that
>> > @@ -303,6 +312,17 @@ void uvc_queue_cancel(struct uvc_video_queue *que=
ue, int disconnect)
>> >         if (disconnect)
>> >                 queue->flags |=3D UVC_QUEUE_DISCONNECTED;
>> >         spin_unlock_irqrestore(&queue->irqlock, flags);
>>
>>
>> I *think* that you do not need to call uvc_queue_buffer_release
>> outisde spin_unlock_irqrestore(). You could do it
>> inside the previous while() and simplify the code.
>>
>> The only way to deadlock is  if uvc_queue_buffer_requeue() is called
>> and you are actively blocking that in your next snippet.
>>
>> I would recommend to add a comment in uvc_queue_buffer_complete if you
>> go that way.
>
> OK=EF=BC=8C good idea=E3=80=82
> I checked the code again.
> Reusing `buf->state` might make the code look a little confusing. Would i=
t be better to add a new member "buf->cancelled"? For example, modify it li=
ke this:
> vc_queue_cancel()=EF=BC=9Abuf->cancelled =3D true; buf->error =3D 1;uvc_q=
ueue_buffer_release(buf);
> uvc_buffer_prepare()=EF=BC=9Abuf->cancelled =3D false;
> uvc_queue_buffer_complete: !buf->cancelled && buf->error && !nodrop
>
> What do you think of this change? Thanks!


Both approaches work for me. I have no strong preference for one or
the other. Lets wait for Laurent or Hans. They might think otherwise.

>
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uv=
c_queue.c
> index 3c002c8f44..1026d7def3 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -122,6 +122,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>
>   buf->state =3D UVC_BUF_STATE_QUEUED;
>   buf->error =3D 0;
> + buf->cancelled =3D false;
>   buf->mem =3D vb2_plane_vaddr(vb, 0);
>   buf->length =3D vb2_plane_size(vb, 0);
>   if (vb->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> @@ -289,10 +290,17 @@ int uvc_queue_init(struct uvc_streaming *stream, st=
ruct uvc_video_queue *queue,
>   */
>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>  {
> + struct uvc_buffer *buf;
>   unsigned long flags;
>
>   spin_lock_irqsave(&queue->irqlock, flags);
> - __uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> + while (!list_empty(&queue->irqqueue)) {
> + buf =3D list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
> + list_del(&buf->queue);
> + buf->error =3D 1;
> + buf->cancelled =3D true;
> + uvc_queue_buffer_release(buf);
> + }
>   /*
>   * This must be protected by the irqlock spinlock to avoid race
>   * conditions between uvc_buffer_queue and the disconnection event that
> @@ -356,7 +364,12 @@ static void uvc_queue_buffer_complete(struct kref *r=
ef)
>   struct vb2_buffer *vb =3D &buf->buf.vb2_buf;
>   struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_queue);
>
> - if (buf->error && !uvc_no_drop_param) {
> + /*
> + * Buffers cancelled from uvc_queue_cancel() are forced to complete as
> + * errors. They must not be requeued by the corrupted-frame policy even
> + * when buf->error is set.
> + */
> + if (!buf->cancelled && buf->error && !uvc_no_drop_param) {
>   uvc_queue_buffer_requeue(queue, buf);
>   return;
>   }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index b6bcee4a22..1b611715fa 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -317,6 +317,7 @@ struct uvc_buffer {
>
>   enum uvc_buffer_state state;
>   unsigned int error;
> + bool cancelled;
>
>   void *mem;
>   unsigned int length;
> --
> 2.34.1
>
>> > +
>> > +       /*
>> > +        * Release the queue-owned kref outside the irqlock. The final=
 VB2
>> > +        * completion only happens from uvc_queue_buffer_complete() on=
ce all
>> > +        * asynchronous copy references have been released, preventing=
 userspace
>> > +        * from reusing the buffer while an old worker still accesses =
it.
>> > +        */
>> > +       list_for_each_entry_safe(buf, next, &local_list, queue) {
>> > +               list_del(&buf->queue);
>> > +               uvc_queue_buffer_release(buf);
>> > +       }
>> >  }
>> >
>> >  /*
>> > @@ -356,7 +376,13 @@ static void uvc_queue_buffer_complete(struct kref=
 *ref)
>> >         struct vb2_buffer *vb =3D &buf->buf.vb2_buf;
>> >         struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_que=
ue);
>>
>> If we called uvc_queue_cancel() buf->error is not 1, but the frame is
>> not complete.
>>
>> You cannot return VB2_BUF_STATE_DONE in that situation. I think you
>> should set buf->error =3D1 inside uvc_queue_cancel
>>
>> >
>> > -       if (buf->error && !uvc_no_drop_param) {
>> > +       /*
>> > +        * Buffers cancelled from uvc_queue_cancel() are forced to com=
plete as
>> > +        * errors. They must not be requeued by the corrupted-frame po=
licy even
>> > +        * when buf->error is set.
>> > +        */
>> > +       if (buf->state !=3D UVC_BUF_STATE_ERROR &&
>> > +           buf->error && !uvc_no_drop_param) {
>> >                 uvc_queue_buffer_requeue(queue, buf);
>> >                 return;
>> >         }
>> > --
>> > 2.34.1
>> >
>> >
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda
