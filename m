Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702954;
	b=w7uw81hRjcertH8cOtsq2P24UjKoiPvwjY214HLrtDMS2Y+FFTTDLP+xworn1WkGbwvu
	 9jF1+ErLX+xRaLxd2k50T2T2TM7p4gS3vQZKDhTUfndQ8ggfVCgyK5uJ1ObiUsDUePM6O
	 QOkTH8d3rfolvliIZQpuTxJ76DyG9VkrR5V5aEJ0apZs/ljYnSpQjPIL+x6kWihsDk0gf
	 m7ccvUn92gBQLPGPrNm6OHpPbDxpLfQhup7L5jkLKeGz1bzsq2174ZsWURnVvrdtOfX79
	 y3dd8wSkium1CCpj0paoF+4TfMQY9GDAwXLQH+JYGxk0mkUU5NdIVbjIvwXPFOuXSxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sn9U2ObGxsBVI2V7plt+qBCJ+syS6s6USf+HPG9H5yY=;
	b=UyIhKQsO6UN7j294gox6fYG1kX4D3IGXPg8q3ezTBN8K06m2cf56xxFuHM4qPGJAQXWX
	 hshUSDQKbd1sq1XP7tWhk6kjtZ16GkSBDQLTAeDzTwbL9lcWUSNGWOmR9cdYg81PjGH8z
	 tuKkWybFVsB/G8193X7Wv0Uxi8JL7R168fP0ZJoIgz3KzaC5yBC5fYvi3rUzcDE66FqXh
	 XTNIsqIt3z9CD0vyzd/De6x5DXHr9v3PI/7ZeANTgp97283UOw+rVq/ACizocj/XbSWIX
	 HzZr/AhPHPH5J7AVovTFwYqjXHd6gvWP8Uhj2anStc4ueD1IIIL5pieX65HSnho43KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PxqJjDdu;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F644606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F644606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PxqJjDdu
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1667304a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793702953; x=1794307753; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn9U2ObGxsBVI2V7plt+qBCJ+syS6s6USf+HPG9H5yY=;
        b=PxqJjDduGbLn2oiBadfJxW3m4isWbDvjOFJX8qv7MHKvrmqTrO2ahWuS60jE2VWwmm
         JkbjkI0bvLU4jXXPVYGScsNspANulTFT6Ei/l7tnxTqQJOBQHVSlOLxNwuNv0Iy6hILy
         BAAmni9+q/ASrSmaryZLZy+8cFhI04XhKL3lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702953; x=1794307753;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sn9U2ObGxsBVI2V7plt+qBCJ+syS6s6USf+HPG9H5yY=;
        b=Rhn3vYpDVn56DX3ACVzjwoRzPfJ9f/Easa9FE23H8XJ5MiIMizkjuXSptio+FgsZQK
         7RBsietzgZnV3ol/rfb/FHAvS18NkS2QGgmqxg+OOy+2tgDOTUg9ut/OBgbLNhE1L4JR
         K45IWsyqQGNQVn5fYhVuBz01gul7WHSOXFesWoGvoymT0vVSYmjevzPIqmpdO7SQurSA
         oV7o7m2lMIkXGmpTu5qZQlM6O7AdDUefarBRFUbFAsjdrqJlzXmBksOkcY1jbL14VvWN
         39GzWI1HRshfeuXQTxuZ3NXHg6UK5YbUxJn8+VeKHfKlXDTwtRktXSLshTrRjxG1ktKm
         H10g==
X-Forwarded-Encrypted: i=1; AKwUvBy/fUBSgMNljm/GbTcqUAVOUCc8Ik+mLw09YG5J4eC+HyPtXbwffx1l9hNHnXKRAO2HyUGe7GXDEHtbIQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uR8BVbfTr4ku/iVM5YhLwIlqTG4byjgekm89+ifeIsGpwL3TU
	t6fpsLxc/diW/SUCeI7iXXdM92O8lfUIBjzPq6rOCeV24hjCXf59Smym286xMaI2q2OVcFke1oR
	e36zdeYUB
X-Gm-Gg: AYBFou2EfJruard4A20gy0w9vt/z2lS9oZJXYq4s/H0FiXPR6ijDdUagn2ok8gfdKps
	xEni3KAE0KYUNKMAEVDJWFuf5O/ir73wcPBYetWwH+coVA5kM+UbueT5f5wFPkDQ+7qUYb7/esU
	ATpIMEZXbYmsszCHAdRiNC1SY7E+oU2IK6XEW4odMuSCoUcrkcg4OvfmmC8oALxuwObAy1vp5MP
	sxaR83bOIom3zS+hXUqIAalIgcWKghaHGLv4h0hFhrVtgPwSCrGWwM7K7L2tpME9EMTsH/F1arb
	NE9KWuk46cxAwBd3EemH3F5DssNPJNpRxOLFeHDCuaFI/9BgwN6MpJX2IF51eARS6nDepGgAbXE
	xGifZk+b8Dj1WPCppFV07b4UxHZ1gwQzFfAQoYlimgRSWk4hLCtAdm7/aUZIsw6X7oOKsBqSqw5
	a70k3CGw4YAjCGGkAO5yCdFCV7Ln3+zIaCnRgzFpGpZPK66vzkQBQxtlv6ZD3sWt4brTCImUGgi
	qzgkEy4Yli+PsryL/7hXfpk8H7Jd00Qjhpfwdgirh8mt/RaOFOE3ow4cuKw44NWCHGI9kX0yZN6
	FCMl5BLdYXkpQ5fbng1xmf7FIsXgSd7xN5UGisx1Db+kXvuE+VV/LoyxGB9qEuhZ
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr9229999a91.30.1793702953283;
        Tue, 03 Nov 2026 02:49:13 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c627260sm3875210a91.8.2026.11.03.02.49.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:49:12 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so6808658c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxx6vdRJOGrHGbxsqPax/g7L6WPOIc9QvBC+F89jFmSLd0CiCU3/sOYrIPoRltV8Uebbtqn++59DoEL1ok=@vger.kernel.org
X-Received: by 2002:a05:701b:4348:b0:19a:9a93:c9b2 with SMTP id
 a92af1059eb24-1ac5a0b8872mr19808473c88.13.1793702950522; Tue, 03 Nov 2026
 02:49:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-vb2-mmap_lock-v1-1-fe550fe03ed8@chromium.org> <129153ba-7e5e-470d-86a7-78c346c03d6c@kernel.org>
In-Reply-To: <129153ba-7e5e-470d-86a7-78c346c03d6c@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Nov 2026 11:48:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCs0fkR4rWRphN2wCFj8cu+Xba4aAGjCNrzhaN=f0g2tAQ@mail.gmail.com>
X-Gm-Features: AclHuK_zfnWl5j6LtxXjut-id7HGG9gpHTqLQYxEO-efN2CHfwJKqkOEbwFfY_I
Message-ID: <CANiDSCs0fkR4rWRphN2wCFj8cu+Xba4aAGjCNrzhaN=f0g2tAQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: publish buffers in bufs_bitmap under mmap_lock
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Tue, 3 Nov 2026 at 09:50, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch, some comments below.
>
> On 02/11/2026 18:12, Ricardo Ribalda wrote:
> > vb2_mmap() only takes q->mmap_lock, not the main queue lock (q->lock).
> > To keep vb2_mmap() safe, newly allocated buffers must not become visible
> > in vb2_get_buffer() until they are fully initialized and q->mmap_lock is
> > held.
> >
> > Commit a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
> > started setting q->bufs_bitmap inside __vb2_queue_alloc() before buffer
> > memory is allocated and without holding q->mmap_lock. As a result:
> >
> > - A concurrent mmap() can find a half-initialized buffer, and if buffer
> >   allocation or .buf_init() fails, __vb2_queue_alloc() frees that buffer
> >   without holding q->mmap_lock, causing a use-after-free in vb2_mmap().
> > - If fewer buffers are allocated than requested, they are already
> >   counted as active in q->bufs_bitmap before .queue_setup() checks
> >   whether the smaller count is acceptable.
> >
> > Fix this by keeping new buffers only in q->bufs[] during allocation and
> > setting their bits in q->bufs_bitmap under q->mmap_lock once allocation
> > and .queue_setup() succeed. Add a memory barrier pair on q->bufs_bitmap
> > so lockless vb2_get_buffer() readers also see fully initialized buffers,
> > and let __vb2_queue_free() read q->bufs[] directly when cleaning up
> > unexposed buffers.
> >
> > Fixes: a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > This patch was generated by an LLM, but supervised and reviewed by a
> > human (not the most handsome human, but a human).
> > ---
> >  drivers/media/common/videobuf2/videobuf2-core.c | 97 +++++++++++++++++++------
> >  include/media/videobuf2-core.h                  | 13 +++-
> >  2 files changed, 85 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> > index b0a6084f1757..185393078ce3 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -427,19 +427,36 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
> >  }
> >
> >  /**
> > - * vb2_queue_add_buffer() - add a buffer to a queue
> > - * @q:       pointer to &struct vb2_queue with videobuf2 queue.
> > - * @vb:      pointer to &struct vb2_buffer to be added to the queue.
> > - * @index: index where add vb2_buffer in the queue
> > + * vb2_queue_add_buffers() - publish buffers staged by __vb2_queue_alloc()
> > + * @q:               pointer to &struct vb2_queue with videobuf2 queue.
> > + * @start:   index of the first buffer to publish.
> > + * @count:   number of buffers to publish.
> > + *
> > + * Set the @q->bufs_bitmap bits of the @count fully initialized buffers that
> > + * __vb2_queue_alloc() stored in @q->bufs[] starting at @start, which makes
> > + * them visible to vb2_get_buffer().
> >   */
> > -static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
> > +static void vb2_queue_add_buffers(struct vb2_queue *q, unsigned int start,
> > +                               unsigned int count)
> >  {
> > -     WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap) || vb->vb2_queue);
> > +     unsigned int i;
> > +
> > +     lockdep_assert_held(&q->mmap_lock);
> >
> > -     q->bufs[index] = vb;
> > -     vb->index = index;
> > -     vb->vb2_queue = q;
> > -     set_bit(index, q->bufs_bitmap);
> > +     /*
> > +      * Order the buffer initialization and the q->bufs[] stores done by
> > +      * __vb2_queue_alloc() before the bits that publish them. Pairs with
> > +      * test_bit_acquire() in vb2_get_buffer(), which is also called
> > +      * without q->lock or q->mmap_lock held, e.g. by vb2_find_buffer()
> > +      * from a mem2mem .device_run().
> > +      */
> > +     smp_mb__before_atomic();
>
> Move the memory barrier changes to a separate patch. I'm not at all certain these
> are needed. I noticed before that LLMs are very 'generous' with such things and
> I am not sure they know what they are doing.
>
> > +     for (i = start; i < start + count; i++) {
> > +             if (WARN_ON(i >= q->max_num_buffers || !q->bufs[i] ||
> > +                         test_bit(i, q->bufs_bitmap)))
> > +                     continue;
> > +             set_bit(i, q->bufs_bitmap);
> > +     }
>
> So if I understand it correctly, the root issue is that vb2_queue_add_buffer
> sets the bit in bufs_bitmap, even though __vb2_queue_alloc() might free it
> again.
>
> I think these changes are a bit too extensive. How about just dropping the
> set_bit from vb2_queue_add_buffer()? And at the end of the reqbufs/create_bufs
> function call bitmap_set() to update bufs_bitmap?
>
> >  }
> >
> >  /**
> > @@ -448,6 +465,8 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
> >   */
> >  static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
> >  {
> > +     lockdep_assert_held(&vb->vb2_queue->mmap_lock);
>
> It doesn't hurt to have these asserts. But put these in a separate patch please.
>
> > +
> >       clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
> >       vb->vb2_queue->bufs[vb->index] = NULL;
> >       vb->vb2_queue = NULL;
> > @@ -460,6 +479,11 @@ static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
> >   * @first_index: index of the first created buffer, all newly allocated buffers
> >   *            have indices in the range [first_index..first_index+count-1]
> >   *
> > + * The allocated buffers are stored in q->bufs[] but not published in
> > + * q->bufs_bitmap: the caller must either publish them with
> > + * vb2_queue_add_buffers() or free them with __vb2_queue_free(), both under
> > + * q->mmap_lock.
> > + *
> >   * Returns the number of buffers successfully allocated.
> >   */
> >  static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> > @@ -506,7 +530,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> >               }
> >
> >               vb->state = VB2_BUF_STATE_DEQUEUED;
> > +             vb->vb2_queue = q;
> >               vb->num_planes = num_planes;
> > +             vb->index = index + buffer;
> >               vb->type = q->type;
> >               vb->memory = memory;
> >               init_buffer_cache_hints(q, vb);
> > @@ -515,7 +541,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> >                       vb->planes[plane].min_length = plane_sizes[plane];
> >               }
> >
> > -             vb2_queue_add_buffer(q, vb, index++);
> >               call_void_bufop(q, init_buffer, vb);
> >
> >               /* Allocate video buffer memory for the MMAP type */
> > @@ -524,7 +549,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> >                       if (ret) {
> >                               dprintk(q, 1, "failed allocating memory for buffer %d\n",
> >                                       buffer);
> > -                             vb2_queue_remove_buffer(vb);
> >                               kfree(vb);
> >                               break;
> >                       }
> > @@ -539,11 +563,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> >                               dprintk(q, 1, "buffer %d %p initialization failed\n",
> >                                       buffer, vb);
> >                               __vb2_buf_mem_free(vb);
> > -                             vb2_queue_remove_buffer(vb);
> >                               kfree(vb);
> >                               break;
> >                       }
> >               }
> > +
> > +             /*
> > +              * Stage the initialized buffer in q->bufs[]; it becomes visible
> > +              * to vb2_get_buffer() only after vb2_queue_add_buffers() sets
> > +              * its bit in q->bufs_bitmap under q->mmap_lock.
> > +              */
> > +             WARN_ON(vb->index >= q->max_num_buffers ||
> > +                     q->bufs[vb->index] ||
> > +                     test_bit(vb->index, q->bufs_bitmap));
> > +             q->bufs[vb->index] = vb;
> >       }
> >
> >       dprintk(q, 3, "allocated %d buffers, %d plane(s) each\n",
> > @@ -562,7 +595,8 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
> >       struct vb2_buffer *vb;
> >
> >       for (i = start; i < start + count; i++) {
> > -             vb = vb2_get_buffer(q, i);
> > +             /* See __vb2_queue_free() for why vb2_get_buffer() isn't used */
> > +             vb = q->bufs[i];
> >               if (!vb)
> >                       continue;
> >
> > @@ -580,6 +614,11 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int
> >   * __vb2_queue_free() - free @count buffers from @start index of the queue - video memory and
> >   * related information, if no buffers are left return the queue to an
> >   * uninitialized state. Might be called even if the queue has already been freed.
> > + *
> > + * Buffers are looked up directly in q->bufs[] instead of through
> > + * vb2_get_buffer() so that buffers staged by __vb2_queue_alloc() that were
> > + * never published in q->bufs_bitmap (because a later .queue_setup() call
> > + * rejected the allocated number of buffers) are freed as well.
> >   */
> >  static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
> >  {
> > @@ -587,9 +626,19 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
> >
> >       lockdep_assert_held(&q->mmap_lock);
> >
> > +     /*
> > +      * No buffers were ever allocated (e.g. REQBUFS(0) on a fresh queue),
> > +      * only the queue state needs to be reset.
> > +      */
> > +     if (!q->bufs) {
> > +             q->memory = VB2_MEMORY_UNKNOWN;
> > +             INIT_LIST_HEAD(&q->queued_list);
> > +             return;
> > +     }
>
> This change looks dubious. It doesn't appear to have anything to do with the actual
> change. If it is meant as an optimization, then I would just drop this: this situation
> almost never happens in practice, so it just adds code for no benefit.

It is not an optimization. now we do not call vb2_get_buffer(), whic
is doing the !q->bufs check.
I have droppend the q->memory and INIT_LIST_HEAD() to have the same
behaviour as now, but the check needs to stay.

>
> > +
> >       /* Call driver-provided cleanup function for each buffer, if provided */
> >       for (i = start; i < start + count; i++) {
> > -             struct vb2_buffer *vb = vb2_get_buffer(q, i);
> > +             struct vb2_buffer *vb = q->bufs[i];
> >
> >               if (vb && vb->planes[0].mem_priv)
> >                       call_void_vb_qop(vb, buf_cleanup, vb);
> > @@ -624,7 +673,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
> >               q->cnt_unprepare_streaming = 0;
> >       }
> >       for (i = start; i < start + count; i++) {
> > -             struct vb2_buffer *vb = vb2_get_buffer(q, i);
> > +             struct vb2_buffer *vb = q->bufs[i];
> >               bool unbalanced;
> >
> >               if (!vb)
> > @@ -676,7 +725,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned i
> >
> >       /* Free vb2 buffers */
> >       for (i = start; i < start + count; i++) {
> > -             struct vb2_buffer *vb = vb2_get_buffer(q, i);
> > +             struct vb2_buffer *vb = q->bufs[i];
> >
> >               if (!vb)
> >                       continue;
> > @@ -1000,14 +1049,16 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> >
> >       if (ret < 0) {
> >               /*
> > -              * Note: __vb2_queue_free() will subtract 'allocated_buffers'
> > -              * from already queued buffers and it will reset q->memory to
> > +              * Note: the buffers allocated by __vb2_queue_alloc() were never
> > +              * published in q->bufs_bitmap, __vb2_queue_free() frees them
> > +              * straight from q->bufs[] and resets q->memory to
> >                * VB2_MEMORY_UNKNOWN.
> >                */
> >               __vb2_queue_free(q, first_index, allocated_buffers);
> >               mutex_unlock(&q->mmap_lock);
> >               return ret;
> >       }
> > +     vb2_queue_add_buffers(q, first_index, allocated_buffers);
> >       mutex_unlock(&q->mmap_lock);
> >
> >       /*
> > @@ -1125,14 +1176,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> >
> >       if (ret < 0) {
> >               /*
> > -              * Note: __vb2_queue_free() will subtract 'allocated_buffers'
> > -              * from already queued buffers and it will reset q->memory to
> > -              * VB2_MEMORY_UNKNOWN.
> > +              * Note: the buffers allocated by __vb2_queue_alloc() were never
> > +              * published in q->bufs_bitmap, __vb2_queue_free() frees them
> > +              * straight from q->bufs[] and resets q->memory to
> > +              * VB2_MEMORY_UNKNOWN if no buffers are left.
> >                */
> >               __vb2_queue_free(q, *first_index, allocated_buffers);
> >               mutex_unlock(&q->mmap_lock);
> >               return -ENOMEM;
> >       }
> > +     vb2_queue_add_buffers(q, *first_index, allocated_buffers);
> >       mutex_unlock(&q->mmap_lock);
> >
> >       /*
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index 4b4f4c15c53a..0b32ac7bc8fc 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -565,8 +565,11 @@ struct vb2_buf_ops {
> >   * @memory:  current memory type used
> >   * @dma_dir: DMA mapping direction.
> >   * @bufs:    videobuf2 buffer structures. If it is non-NULL then
> > - *           bufs_bitmap is also non-NULL.
> > - * @bufs_bitmap: bitmap tracking whether each bufs[] entry is used
> > + *           bufs_bitmap is also non-NULL. __vb2_queue_alloc() fills in
> > + *           an entry before its bit is set in bufs_bitmap, so buffers
> > + *           must be looked up with vb2_get_buffer().
> > + * @bufs_bitmap: bitmap tracking which bufs[] entries hold a fully
> > + *           initialized buffer. Bits are set and cleared under @mmap_lock.
> >   * @max_num_buffers: upper limit of number of allocated/used buffers.
> >   *                If set to 0 v4l2 core will change it VB2_MAX_FRAME
> >   *                for backward compatibility.
> > @@ -1286,7 +1289,11 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >       if (index >= q->max_num_buffers)
> >               return NULL;
> >
> > -     if (test_bit(index, q->bufs_bitmap))
> > +     /*
> > +      * A set bit guarantees that the buffer is fully initialized, pairs
> > +      * with smp_mb__before_atomic() in vb2_queue_add_buffers().
> > +      */
> > +     if (test_bit_acquire(index, q->bufs_bitmap))
> >               return q->bufs[index];
> >       return NULL;
> >  }
>
> Regards,
>
>         Hans
>
> >
> > ---
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> > change-id: 20261102-vb2-mmap_lock-959e0cc4edb3
> >
> > Best regards,
>


-- 
Ricardo Ribalda
