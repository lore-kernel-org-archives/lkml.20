Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416914;
	b=4BXQlYRqduUqccH8iCacsn2dR39l2MibPYtkL1t602Ie+tI0PA6tgLo1BLL9TUpMzie+
	 R95a2DJAi90uupPThG/zyAJRvz+cAbP1Ky2DO4pc+sKJl6INlJmXcZchySwyXlwRMaDeE
	 zkXNS0r03miwD53K4FyPKEW7cAab7povWfFmt1raxV3uhJQSixFpKT5tbB262JihhO3Wa
	 RFXnQ9x/n7ITMevDLvQo1sS0nDZnoNe/fGn13AWlW3QIk1YHJ2QmnJUpbWQNbRROPgIao
	 dSolwFnthxPcd6QB/qtU9pbgog9MT2wo51xiexqjNp9chHohoKYr880mWtZZ81vHMlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kVPjB5hQmOFQLlE+4NngKPps2k6g7Y4uA9ABWeTM8QU=;
	b=ssG3eKMPOKkOJdtMb+MaN1DzA7o6xDler/7gl86lGTOEWW/VjXoCe7yCpeVrbMpvP4lp
	 WU9a27jjYQPyh3+D/p7BPXV8mIQj6BwqmFEqYBW+GMdrAiO4A0MS83wcD7ZtlNg6UCUXy
	 p6mSvSZWW5Er+GWcgzvLzJD2QwVxTfboJdsopTwKAIPP1sU0nyeX25Ib6kqCtyYNdjbdH
	 V1NO/TDvV/mZTy4Juzr+w36VJUdQCTgnMXTpgx5w3TiLcfupQ/0ooQI1JtDqTVtCQnLuN
	 9QXUO7oyaRd+klPcM5GTu9hXQ3VG8Gm2Tr8rqnPNeSPy4p66KVyX1ed4JvIrsEbS1mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYn6BD6C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E47E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYn6BD6C
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49429181ce9so2000447fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416913; cv=none;
        d=google.com; s=arc-20260327;
        b=L9Uez6leDTZxyG54I/hvt+JL8s8xI7pRvAujcjR4Z+zqvMXE6fceg8zmVM0FdyetEw
         DNJ/9+hDc5BEUtrAOk1fl6u74OsInyPNGLH3YIYwAOnOuVYmRvGwR00iDmcZ3+lZpXjz
         Le0e9JqQ1DUXDW2XaxpPFUF8bdnDIr4VLRYJhIld1+YkS6PRbQfj0NiWYxoeeJ4qn2Ot
         al9Kk+krKtdNzCEQyFj5Z7SrsEamh3GgLJ38H/SCGODKWhQGuhcn140LyK0dfMNKmsDS
         UN+eFvoNw5XEaDG4kXxzHiCIb9b+qJvbKfPGPJ/zvJm2kpf59M3beymTDETbJ4J4+doV
         8k/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kVPjB5hQmOFQLlE+4NngKPps2k6g7Y4uA9ABWeTM8QU=;
        fh=SVIKw7OelgE93nWVI+n06K1qltjByb2wSu51Rzeh28E=;
        b=EBdDBO0fIJLBGeQQQFJ+bppG7KNidNZ2p3jqeDeEPi440VtxBZNddyS49PgdwWsUxX
         vrsiqBFzAvALSw82Sv1r0EYruVbKaVJAzxOkbo9FMPhBTG0IAuxfAqi+lL/mi9QLDB60
         FFg7Dngrk+IgeZ9FA8Ou5aY1U1pP/b5AxQEwspjd1dHyfzryTrRUoDGuoMc4vFmt7Z7s
         fMnI+PE9yOn5Ufah6bMi1VXHHsAMuOSMGERY1DoaZxYstOHYU/ED9iEP6nzeLTPD8N+F
         6lHwR7R5/N9AXQ/o4nzQ7JmO1OHCI9FL+FttHyxRTsqg1Qqe4kDFK/P3AWUrw7w7Rc1s
         uI9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416913; x=1795021713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVPjB5hQmOFQLlE+4NngKPps2k6g7Y4uA9ABWeTM8QU=;
        b=nYn6BD6CUX9gme9MPd+NlAxvtjGEe4YLguh+WUpvSJG1Y0+g3Alk1Ussecat3u3WfW
         jEV4O/mIjO5fCUP4BNczKc3QLn4a/YmM15+g3un9dnJEEdQ57hsHzLpRT3qvzobSJs+T
         f1avt9jjy+eLz3dHP6a1wnZegKqZTgVDTkE9fyAdlvqI2KhekNRqJrlW4pMmvKlRa6fq
         X+LUETfFER7Pim14vSrfD9bhIrXmpscE4+8jPHzVtQqIUJOUxxGV3d7IQ0zVOxijdLcA
         46ZF8Yy5r1mdB7/me3f66izO3aDkqmI0MskFbSr8TXQBURqBvXLB8y6Co1LUP96z82Vm
         41oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416913; x=1795021713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVPjB5hQmOFQLlE+4NngKPps2k6g7Y4uA9ABWeTM8QU=;
        b=aickyVJdqTUOJXX7OCn6HJoWSQ9XUORlxFDV2ofRvwRCvU5Xn+QyI94eBJqlUyIANT
         4bLAATDsVK8XRAvtynoFTOxrDT05508pzaErY3S9H9e42iR17Wch2BiLDzXaKQWPiGG6
         cAPnkopyus3dPlI9HKkbu+f8SrqdQE8P0+/HqvO/BC3OZ4hJ31dAD23QttlrUy+dLuBz
         oPZwprhzPhQztNhpFeEN4kO0wB6Xa00yyRAW9uCTGaIbiR9wQ8BCM8u4eNDItVtSSTIJ
         7MrgG8RINNd7I3cnUFjWWmSGvEsCroDh++AHU12GvtVnFcR09a6o1tHHjbc+cjDG82e1
         DR9Q==
X-Forwarded-Encrypted: i=1; AL+hErGFzoUuGLGbwBI2YzYTlr2PgQA8RG4b26HWlMP49G5q9YYZEw5pvY6Qe1dY0ewEiA1cc5pBZJd5siV0u8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rao1OcCQasklyfTH2VhZCytRmiIoBnoumL4TmfZ2OnSE+/6W/
	Qoqb4gKOBUa5GViMFloTJ5Liwyo3WZuXTKM7MUjCnzJaoB7X2HqGmD6ufVVbtApOnVdgWlEhcRE
	GfcpHezBriOwYHxWuYcWJRmnE9VDiZpe98IZd
X-Gm-Gg: AYBFou0agcWParOkaOMb1mbh3/6L3ufIH/s49mDq3bO2iSwTpb6ebzQOgXk9D5jPnGN
	4y6+8BpMPsQHpQC7Azj1RDoo++LCTYNPWLjkE+SPALs0XZb3wlOhwntkYxP1QHsWaDfcIUrHGxK
	kaKw/+RLQdXdar+U+stbrrFp2MJmQhVTU9qE9CJHgmqcITpQZWJbxA3jm1SgAh1tRBIoKtv23bi
	ywnBH0pdfvdIcR8eueBCTtmusOydXMMwiOWvZrmkyA7elwwZ09AC3EL7Frn2riz+pjDJZQ54R5s
	Yw7kAcUlVXE/vEOZ4VpnNpZvGxnthTdWwxrwyqHKjGP53/cFThsvOYn4R3QOjVlkAX2E15SLNrD
	P4FG08ZE4sup3O4a0GsyXOf8+4RAUU66fKEhJ7CWX3hoHFo3Ud/CUbvEx+BEMV8tSSmvMygSQ7r
	MsZULI17YLC72kWDgFnr6gbsAQduupeC0=
X-Received: by 2002:a05:6870:3927:b0:439:a524:a29d with SMTP id
 586e51a60fabf-4ae467f98fbmr2595794fac.1.1794416912718; Wed, 11 Nov 2026
 09:08:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026112843.69795-1-hjf3108@gmail.com> <1b25256b-5fb5-4b4a-bc05-7a2bfc309128@suse.de>
 <CABOQOSWGUmaR2wSso37rYgg0QoJL3K1qoDPqsp8OzOk_ifpgCw@mail.gmail.com> <5dbac304-65a4-45c6-8c9f-01416951c293@suse.de>
In-Reply-To: <5dbac304-65a4-45c6-8c9f-01416951c293@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 12 Nov 2026 01:07:56 +0800
X-Gm-Features: AclHuK-8Nfci6G0cOgHqvxMVo-Wx05JTLMB6lBtW9UjkLuL40BKWP-vTQnFqEw0
Message-ID: <CABOQOSXQvHG_7-S1UxErfF3crhAMPHjtcpPzS_zim9VVHHEecQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/tiny: trigger5: Add MCT Trigger 5 USB display driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, cyrozap@gmail.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 23:21, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 10.11.26 um 16:49 schrieb Jie Feng:
> > On Tue, 10 Nov 2026 at 22:23, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Hi,
> >>
> >> sorry for letting you wait for so long. You'll find a review below.
> > Thanks for the review! Since this driver shares many similarities
> > with the ms91xx driver I am submitting too, I will be making
> > the changes in that driver too.
>
> I've briefly seen that other driver. Let's focus on one of them first.
> The other will then be easier, I guess.
Sure, let's focus on the review here, this is a much smaller driver.
>
> >
> >>> +     ret = drm_gem_fb_begin_cpu_access(state->fb, DMA_FROM_DEVICE);
> >>> +     if (ret < 0) {
> >>> +             complete(&current_transfer->frame_complete);
> >>> +             goto exit_save_pending;
> >>> +     }
> >>> +
> >>> +     drm_fb_xrgb8888_to_rgb888(&data_map, NULL,
> >>> +                               &shadow_plane_state->data[0],
> >>> +                               state->fb, &current_rect,
> >>> +                               &shadow_plane_state->fmtcnv_state);
> >>> +
> >>> +     drm_gem_fb_end_cpu_access(state->fb, DMA_FROM_DEVICE);
> >>> +
> >>> +     flush_kernel_vmap_range(current_transfer->buf.data, frame_len);
> >>> +
> >>> +     queue_work(trigger5->transfer_wq, &current_transfer->transfer_work);
> >>> +     trigger5->current_transfer = !trigger5->current_transfer;
> >> Why do you need a separate work item for the transfer. Can't you just
> >> send from here?  We do this in udl.
> > I want to make the send async, so drm_fb_xrgb8888_to_rgb888 can run
> > in parallel with the usb transfer. This is done since drm_fb_*_to_*
> > functions are slow when copying on write-combined memory due to
> > dma-buf sharing between the main GPU and this device.
>
> We do this in other drivers as well. Neither is supposed to be fast.
> There's always this memcpy from the imported buffer.
>
>
> >
> > udl does usb_submit_urb, which is async, but the usb_sg_wait has no async
> > counterpart, so I opted for putting it in a worker.
>
> Why do you use usb_sg_wait() in the first place? It appears to be a loop
This part is referenced from gud. I thought it makes sense since I need a large
vmalloc buffer, so using usb_sg_* looked like the right approach instead of
asking for kmalloc(8MB).

Alternative I considered are:
- usb_alloc_noncoherent: but that requires implementing a fallback if a
  controller doesn't support scatter gather DMA, while usb_sg_* does
  handle all of these cases.
- pool of fixed kmalloc buffers: 64K seems too small, too many URBs
  for a 1080p frame, and tuning the number so that kmalloc will likely
  to succeed on a fragmented system while keeping the number
  of URBs per 1080p frame small doesn't seem like the right
  approach to me.

Are there other possible approaches to this?

> around usb_submit_urb() plus the waiting. (The comment at [1] is
> actually quite funny.
>
> [1]
> https://elixir.bootlin.com/linux/v7.3.1/source/drivers/usb/core/message.c#L761
Indeed!
> >
> > I saw there's a TODO within the format helpers for io memory, so
> > maybe in a future patch I could change it to use drm_memcpy_from_wc
> > to speed it up. Currently it couldn't run at full 1080p at 60fps on bare-metal,
> > but on a VM it is fine due to not copying from WC memory.
> >
> > There's also the other issue of some compositors calling _update
> > in the render loop or something that causes visible stutter when a device's
> > _update callback is slow.
> >
> > The ideal way to solve this, with both low latency and low memory footprint
> > is to take inspiration from gm12u320 and store the fb and update rect in
> > the device struct, and let a worker obtain the latest one from the struct.
>
> It's not. None of our USB-based drivers are well optimized. You can take
> some inspiration from them, but don't take them as they are.
>
> At the end of each page flip, DRM sends out a FLIP_COMPLETE event, [2]
> telling the compositor that it's done with the display update. This
> gives the compositor an idea about the performance of the device.  It
> can adapt to that and end out less updates. By moving out the actual
> work into a separate thread, you break that feedback. The compositor
> will see an early complete from the page flip and queue up the next
> frame immediately. The driver will pile up updates for the worker to
> send out. Hence, leave the copying and sending operations in the regular
> update code.  If you build this with usb_submit_urb(), there's no
> waiting necessary.
In that case, assuming I keep the usb_sg_wait, doing something like
wait_for_completion(previous_transfer) would be more correct.

> [2]
> https://elixir.bootlin.com/linux/v7.3.1/source/include/uapi/drm/drm.h#L1395
>
> What I have in mind for udl is this logic:
>
> 1. send the current frame's updates as usual using usb_submit_urb()
>    - transfer runs in parallel to current display update
>    - count the number of submitted urbs
> 2. in each complete handler, decrement the urb count.
> 3. in the next frame's atomic_begin, wait until the urb counter reaches zero
>    - most parallelism
>    - max out USB
>    - maintains correct transfer statistics and events
> 4. if the second frame takes longer than expected, the FLIP_COMPLETE
> event wil be late; the compositor can throttle the page-flip rate
For this one, wait_for_completion(previous_transfer) looks to be
similar in behaviour.

> I made a nicely working prototype from this.
>
> Best regards
> Thomas
>
>
> > The transfer is then sent in blocks, while overlapping the drm copy
> > and usb transfer in parallel. I think this is a bit too much complexity
> > for a drm/tiny driver though.
>
>
>
>
> > ...
