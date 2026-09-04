Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4827A10F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526830; cv=none; b=RWILEF20EjtxwUuj7tUPYUStUfbhshETuMp4SA+6yDZDV+gvxYm88V6E3U/XeK6uATKEDHMcgAsMTIOwPrIU8BD4W4zI2AbiKmRv5uvdfCR7BDqaO4PY19Qb4bEtvSavhfBdK32xToPZ2r4CvBRQK6ArNtaAxXvmisPnLmGMUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526830; c=relaxed/simple;
	bh=Ydv31/vgUq8AU53l8gZREKvZGMpW9JqKhtiuGxHvbpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKy1DuhuMsh8QlZE+ErpMu7StX+T/dkkCL+lKIktNQbDsZRuX4GAHFGmZyCd1yjBsh4jDr+GiPtHDw9OcE8EG5tpDfTXRCnZLiQ8z6teWAmnFCZZhlunSwistnU6Q40JDcVq4NQyxdAmTIfO59M9k4yDNkeWaCg5zSb6pop42iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hedEUAbZ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hedEUAbZ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so465140b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788526826; x=1789131626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DTIePpegKNFCm1xJl3uPsht9O3FJLaiNySzF0iZoEo=;
        b=hedEUAbZENQepfVI6dHi+OHBv40dvHOA/vB7dIjZOcPxrUS7dwkxyvAj9QWe75v6rM
         aHH8DK5oF/w3ERrS3RPLN7DYZCAFjzUziYSxM+FnpetnxTlnXMst5dDgKJE7x5yA3/gw
         Lb/1Oj8QGj/Gq+6RPha9WSyqd3SImHx58ZFAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526826; x=1789131626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7DTIePpegKNFCm1xJl3uPsht9O3FJLaiNySzF0iZoEo=;
        b=gYM1+/u6EaF0/+O3jwurViIgNAa/pjyswzA7Z7FxLgYXXdhUeo/ky0t6dQk3DP/sIb
         zysKzP+zbRCXsuHIwjMSPouR/74gHCXpjedFMV0Ueq1E09oVhCcULDT7l7cErMH5Ft96
         bGnhXAPizVHNc8VOBTMRzpvZhNRfa4Q8gpEBs08tvbN6CXFRrBdnNkZPgi2xiV7Lm9gE
         yLfhT4AxQoKboBX+enLEmDvlOxScgrpnmbkpJRgbudKlUstQkM3DhInWatEJYGCz+bUX
         l6JOWML8E9bxhrBgTQ1GjIaPI0Vy1FvmZhSKSPVjGZ/Pk+eQaedLnYUIQNkMQZozb1kS
         zHPg==
X-Forwarded-Encrypted: i=1; AKwUvBxYoCDPiA7wESWD7IwiyWZvWirgoBXkNHlVjaaVtzfsSUZPh6Deq9VemeZId4ryXVhLConobksg+aLh5SQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mlP28pchGYkeYImG9Lv45sqsf0g4ZGXiz51MmkHgCiRzym+V11
	45aJV/OYc6zy+YF1WE+oViapZFWoZf7rsYUBYQL7qHYI3ezhHMXRGGmLreJa9xbe2ifRYlEgMsx
	VvEMn/Q==
X-Gm-Gg: AYBFou2HG1Oc9IWaJDeATFngP2mZBYSiEC4Vr8qIS/NpFtLTgrsp89txuPV3HPCJsAa
	Kw7sYfBlRuU3UVaHCpiNxZuETz4MVoUerHHSH6t7kZux8+AhiEpSk6mIbIUbJSkcovauoJQTdnM
	ZlGQgnATtXDXukg25ieQV7IdrlzoerMTIaG7+vV1DDgXUWub3m8L9gP/GOHNRDNixK7DihpPAtH
	ZPqTkWGLaX22gdKWFB8VwKco3T0EzHzD8vwRchv5UYvsCOLlVG8TbJ/RKbnHzNhW+AU8x0b5S+D
	aZDkjoG3zZS/1U4B4kW9TU7tDbVK6keXVbnJtSCA/0gTlwei3FJdMMAcb1vzXrNWSjfZcsvp/A3
	dAfo+6+4ZDbCAHU+ID70v5OSYCDJ/KGjJfeagmFKjLd0Xd/3UXDnEQmfelCgdpbwuCd7rgnhFmn
	LejAru7HMq8javMLgFoqI1mNDcEcsQxFCUEGkHNbS3vpQPsrZFqv1IZAY5jvERlINVi8cvYrIbP
	Ztjt8Lsss20sEH5QDMnP1ByVg==
X-Received: by 2002:a05:6809:307:10b0:4ba:3ae0:b680 with SMTP id 5614622812f47-4ba3ae0bd38mr693720b6e.26.1788526825485;
        Fri, 04 Sep 2026 06:00:25 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c8ed6asm2139907b6e.17.2026.09.04.06.00.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:00:24 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso575033a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCgwNBOxOKy7jhTy7y3WoBaWAqf6c2+6JXeU/zVZL2mpXOzpmQbAZ7lra9eT4tyJcBTzFQDwYypM5MHyw=@vger.kernel.org
X-Received: by 2002:a05:6820:609:b0:6b1:67e1:fc8e with SMTP id
 006d021491bc7-6b6fd9c7a86mr4365581eaf.25.1788526822975; Fri, 04 Sep 2026
 06:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903131141.6368-1-huhb1@xiaopeng.com> <20260903141532.6693-1-huhb1@xiaopeng.com>
In-Reply-To: <20260903141532.6693-1-huhb1@xiaopeng.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Sep 2026 15:00:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCuxtH1wbXAwoWrbV6Y97dN3Ym-A2zSbkEpLVEGFToXLfg@mail.gmail.com>
X-Gm-Features: AcwNN1UnYF_YOwvF0cdMkhyo9nu_QNK48v5jfa70Pj-GAzCpgE_WUDV5GZ1ST1I
Message-ID: <CANiDSCuxtH1wbXAwoWrbV6Y97dN3Ym-A2zSbkEpLVEGFToXLfg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: defer cancelled buffer completion
 until copies finish
To: Hongbing Hu <huhb04@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hongbing

Let me rewrite the commit message for me, because it took me a while
to understand what was going on. (totally on me). Please correct me if
I miss-understood the issue.

The UVC driver processes frames in urbs. A frame usually is divided in
multiple urbs. The urb handler parses the header and the metadata, but
leaves the expensive memcpy to a workqueue.

At any given moment, during streamon we will have:
- the current frame with (0-N) async memcpys waiting to happen. The
current frame is in queue->irqqueue. It has a refcnt of 1 + N memcpy
- Previous frames with (N) async memcpys waiting to happen. They are
not in queue->irqqueue. They have a refcnt of N memcpy

With the current behaviour, when there is urb with an error we flush
the queue->irqque() irrespetively if they have any pending memcpys.

There can be situations where the memcpy occurs after we have flushed
the frames and they are returned to the user. Instead, we should
exploit the refcnt mechanism to return the frames only after the
memcpys have been completed.

This patch does so

On Thu, 3 Sept 2026 at 16:33, Hongbing Hu <huhb04@gmail.com> wrote:
>
> From: Hongbing Hu <huhb04@gmail.com>
>
> uvc_queue_cancel() returns queued buffers to videobuf2 directly via
> vb2_buffer_done(). This is unsafe because asynchronous memcpy workers may
> still hold a reference on the same uvc_buffer. Once vb2_buffer_done() has
> run, userspace can dequeue and requeue the buffer while the old worker is
> still running, leading to the same list_head being inserted into irqqueue
> twice and corrupting the list.
>
> The crash manifests in two ways depending on the drop-corrupted-frames
> module parameter:
>
> 1. With the drop corrupted frames enabled, the old worker's
>    final kref_put reaches uvc_queue_buffer_complete(), sees buf->error set,
>    and calls uvc_queue_buffer_requeue(). This performs list_add_tail() on
>    buf->queue even though userspace has already QBUF'd the same buffer and
>    added it to irqqueue.
>
> 2. With nodrop=1, uvc_queue_buffer_complete() calls vb2_buffer_done() a
>    second time. If userspace has already dequeued and requeued the buffer,
>    the second completion exposes it to userspace again, and the next
>    DQBUF/QBUF inserts the still-linked list_head into irqqueue a second
>    time.
>
> Both cases produce the kind of list_del corruption seen here:
>
>     list_del corruption. next->prev should be ..., but was ...
>     kernel BUG at lib/list_debug.c:64!
>
> Fix the cancel path to remove buffers from irqqueue and drop the queue's
> reference through uvc_queue_buffer_release() (i.e. kref_put()). The final
> VB2 completion then only happens from uvc_queue_buffer_complete() once the
> last async reference is released, so userspace cannot reuse the buffer
> while an old worker still accesses it.
>
> A buffer whose state is already UVC_BUF_STATE_ERROR is forced to complete
> as an error and must not be requeued by the corrupted-frame policy. Normal
> malformed frames are still requeued/dropped as before.
>
> Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongbing Hu <huhb04@gmail.com>
> ---
> v2: corrected author real name in From/SOB per maintainer feedback
>
>  drivers/media/usb/uvc/uvc_queue.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 3c002c8f44..9206e0a355 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -289,10 +289,19 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
>   */
>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>  {
> +       struct uvc_buffer *buf, *next;
> +       struct list_head local_list;
>         unsigned long flags;
>
> +       INIT_LIST_HEAD(&local_list);
> +
>         spin_lock_irqsave(&queue->irqlock, flags);
> -       __uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +       while (!list_empty(&queue->irqqueue)) {
> +               buf = list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
> +               list_del(&buf->queue);
> +               buf->state = UVC_BUF_STATE_ERROR;
> +               list_add_tail(&buf->queue, &local_list);
> +       }
>         /*
>          * This must be protected by the irqlock spinlock to avoid race
>          * conditions between uvc_buffer_queue and the disconnection event that
> @@ -303,6 +312,17 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>         if (disconnect)
>                 queue->flags |= UVC_QUEUE_DISCONNECTED;
>         spin_unlock_irqrestore(&queue->irqlock, flags);


I *think* that you do not need to call uvc_queue_buffer_release
outisde spin_unlock_irqrestore(). You could do it
inside the previous while() and simplify the code.

The only way to deadlock is  if uvc_queue_buffer_requeue() is called
and you are actively blocking that in your next snippet.

I would recommend to add a comment in uvc_queue_buffer_complete if you
go that way.
> +
> +       /*
> +        * Release the queue-owned kref outside the irqlock. The final VB2
> +        * completion only happens from uvc_queue_buffer_complete() once all
> +        * asynchronous copy references have been released, preventing userspace
> +        * from reusing the buffer while an old worker still accesses it.
> +        */
> +       list_for_each_entry_safe(buf, next, &local_list, queue) {
> +               list_del(&buf->queue);
> +               uvc_queue_buffer_release(buf);
> +       }
>  }
>
>  /*
> @@ -356,7 +376,13 @@ static void uvc_queue_buffer_complete(struct kref *ref)
>         struct vb2_buffer *vb = &buf->buf.vb2_buf;
>         struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);

If we called uvc_queue_cancel() buf->error is not 1, but the frame is
not complete.

You cannot return VB2_BUF_STATE_DONE in that situation. I think you
should set buf->error =1 inside uvc_queue_cancel

>
> -       if (buf->error && !uvc_no_drop_param) {
> +       /*
> +        * Buffers cancelled from uvc_queue_cancel() are forced to complete as
> +        * errors. They must not be requeued by the corrupted-frame policy even
> +        * when buf->error is set.
> +        */
> +       if (buf->state != UVC_BUF_STATE_ERROR &&
> +           buf->error && !uvc_no_drop_param) {
>                 uvc_queue_buffer_requeue(queue, buf);
>                 return;
>         }
> --
> 2.34.1
>
>


-- 
Ricardo Ribalda
