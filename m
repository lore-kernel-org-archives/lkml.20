Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698890;
	b=4+4LA3XF3IlKPIpHh2bumdKSpZ1w0jbvwCH+dSekNkQkwe5yiPQTeADkw/mzUxhkzgpd
	 GZkx2O9adrgc9qkb/M8pxpK5eB2n0JrawKoCBi2FvyKcRwnqT/VphZSUazxH7VX9VNcA+
	 PCOshRHStZvxnAzd7TuokniSz+/v40K6bJcNhxX0CDrXNthno0JbZbyhF+pj9lgbNQRBZ
	 VKYFvz2WnZkZAunJFvwVZYWzMy8JZcBRPaPvl4tnodAK0vWH2o4+Lu3Yoa80HLqbW4ecz
	 HwniP2CPo7Ua0AFuDGXLtmML8Lj+kGY5k7lfoDtTd8i8fyneJD5iLF0zgt5rb4yLmmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698890;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=R/lFJKDhJJZ0txuBvnSbtzyJ6egVpzp4MgRqqSeZeow=;
	b=TexZpYOQ+atd7jvhOJXUVl+ildtI3Ci6up2dKBqfBcAlJtKn92wmpzTpG3Hd+PozNF+l
	 cijwT0JiMubka8TXd6Ts6F+2MW2Oc5NXrN0cslAELGFdVFqmFlfQ8MyMxk+BIkvyWFxeO
	 CpuBJdkTTCks9LAkhInu8cwi/uNgPlM2q8i03WIsoJrWdUH6LstSqgxB2+vPUNeIOK6yM
	 XpRF0A6CtMDLUJlRefF0mdtrjU9dlPWzwG6RD74niLtCTLBW2ZpO27OktFRWn7h0T4xgp
	 UZlx2s8S2/6hctmEwtKpsHTC61xt21SpnTotbYYN66mORJDowgJdBHRw5uU85AFR15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BynTmWyn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="q/JhL8KV";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7383606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7383606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BynTmWyn;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=q/JhL8KV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/lFJKDhJJZ0txuBvnSbtzyJ6egVpzp4MgRqqSeZeow=;
	b=BynTmWyncU8JPtwbjzglvEeoNwK3bL8SytXukrXW+mvgcgMnymNu2JqoA53wCZrU+8CvHl
	ty7I4Dvwa7XiDB/S/qXXhOL+HLBk9atjK/xSkC2ccR2wCYulDEgrlTKPi2epotzZjCmfCL
	yYrTB9UqU63rkxRr8ELAJv4Z4RHRIxE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-kx_coY8PMaSKMxW2WGAKEw-1; Tue, 03 Nov 2026 04:41:27 -0500
X-MC-Unique: kx_coY8PMaSKMxW2WGAKEw-1
X-Mimecast-MFC-AGG-ID: kx_coY8PMaSKMxW2WGAKEw_1793698886
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso3401687f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793698886; x=1794303686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/lFJKDhJJZ0txuBvnSbtzyJ6egVpzp4MgRqqSeZeow=;
        b=q/JhL8KVo2pJV5SvQI5G0aQq97TYydlfMoevwEMFwAtpEDp9qEHR4p9tTJ3kiqAZsj
         I8TxGCoXjeLeNX/zKKFsekKml2we4vLSitmnJ1nwV0DAhNyUPwzXGFzCf8JdjcZT9B8b
         ZG6gfmTVsh0ieTLZVBq3RT3vbnEZX8neYSEBbZTErWuYWpydWDkgcRAmxKQaK/qQE4h0
         ZWdL15SI+Wh4gs09Ns2Z9NB2cymhYp32YIBQub6U30BwOqPZpCMCzOdgrr1gDr+B0Nem
         EF0+qDq0KzlOrc+l63rqJOlP8ymoM4L4t2TcfQGUGbrdJeVkE+Q+Rg5yGc7acilPwsbK
         BG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698886; x=1794303686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R/lFJKDhJJZ0txuBvnSbtzyJ6egVpzp4MgRqqSeZeow=;
        b=s0in5CFxVAO3HqAA5xlDBklrkzeVmGVQZKuFoQ4ItzDfYCk/gMHFAxeCH7a1cg0RSb
         oOM6I17IBdCLtXtKSoohsx939KFaBKSOizc3KSO8E6rgg5g86N61eQ7MNBYHr/qQBvSe
         D7vzZgNTRQVEpN73HVbkX8wS65o9fFdxGGXqsy68svB17edCUZdkJ+mMOhyMoi6pkBCY
         1H4rRb3guQlc8i7AE0RbVeGlxNDLVziwc8RSgQRgn0tDLTg3XHWZnRd09V49WdE7kaII
         aWaWYn5nyu4h47pF7w8+rLQtyvKKAO/4LpTfuShHDZv3xstCHjEm+GwG8/5mkp1x8RHu
         wnpw==
X-Forwarded-Encrypted: i=1; AKwUvBzP+EyQe2SMQlmdWscHvnZ9mqJZHwpTedwbHHf6Tgmb8pfeZ6x3p8ffnkeWrqTEtS06vLDKKUx9vVlBBCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dQyayS6IVZNmNMuFaNw3gzuJDJl+zyBJFbpvMZiBmofnUc9vt
	tc0BJPtZZKM430uojFf6DI8wGtcmUREQgrai2u+Zm0AaM3FHYEbaC2ApcHvFMeeSSgNjV284yIs
	MisDR/SFiVzgQ90DEJBqHxdwSTzdNoqrrut5rLUVdQOxz1SObGk11TiT36J3Q50DHWA==
X-Gm-Gg: AYBFou1DEDSBXZhyNd3sjAKmIv5J439EkGTVkuPm3vbtMwQVlQIK6Q6L+wP2XYEqUcj
	Rbp80cSTCdbuOhfTLb/xRVy1WNQr3gbtzPVklO1409tnFjk2gXXANHDFWkPm+RmGhJdAk3+fnz1
	Z3J5y0OX7RGyUz+JK4Vnmp6iOyIH/mqX/ISrWmdG+Q8gNQGJjEeckE+vmYKuBX8SL4f+V6kOD/B
	F8wUdmLQi9nYKfpjFIg50DW44AhYjXpGgJruV4ynfYITz7IP1FcFt2UiCjtLiSu41quDpEqYvX/
	0v8jctmKnejq96OvXlAm0g3VqpLBI8FfSlzwmuun8L1kDKm53oNYRYfZgPNsMpE33xwIdZY+qSb
	WbRZJPDRTqEtqhKijw5zHUAoPsa9ZhyUWajXsTDy5tQ==
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr28209556f8f.43.1793698886325;
        Tue, 03 Nov 2026 01:41:26 -0800 (PST)
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr28209499f8f.43.1793698885760;
        Tue, 03 Nov 2026 01:41:25 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm24468482f8f.40.2026.11.03.01.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:41:24 -0800 (PST)
Date: Tue, 3 Nov 2026 04:41:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Li,Rongqing" <lirongqing@baidu.com>, Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQ?= =?utf-8?Q?ATCH=5D?=
 virtio_ring: reset IN_ORDER state in virtqueue_init()
Message-ID: <20261103044056-mutt-send-email-mst@kernel.org>
References: <20260910123903.1717-1-lirongqing@baidu.com>
 <CAAf7B_M=tfyL33WGkxSX68FwPaRRRBcASVx92EGwPMXaFtUdzQ@mail.gmail.com>
 <fe5e4fb1b68d4203812e253d722cbe69@baidu.com>
 <CAJaqyWc6OzMF2yvrSjOfRE8g4-Y=JD50iq42zPuXWKjb00FdCg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWc6OzMF2yvrSjOfRE8g4-Y=JD50iq42zPuXWKjb00FdCg@mail.gmail.com>

On Tue, Nov 03, 2026 at 10:36:26AM +0100, Eugenio Perez Martin wrote:
> On Fri, Sep 11, 2026 at 8:05 AM Li,Rongqing <lirongqing@baidu.com> wrote:
> >
> > > >
> > > > The IN_ORDER feature uses additional software state to track the next
> > > > available descriptor and in-flight descriptor batches.
> > > >
> > > > virtqueue_init() resets the common virtqueue state, but free_head and
> > > > batch_last.id are initialized only when the virtqueue is created. When
> > > > an IN_ORDER virtqueue is reset, these fields can retain state from the
> > > > previous queue instance.
> > > >
> > > > Reset free_head and invalidate batch_last when initializing an
> > > > IN_ORDER virtqueue. Keep this in virtqueue_init() so the state is
> > > > initialized consistently for both newly created and reset virtqueues.
> > > >
> > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > >
> > > I think this is needed for -stable.
> > >
> > > > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > > > ---
> > > >  drivers/virtio/virtio_ring.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/virtio/virtio_ring.c
> > > > b/drivers/virtio/virtio_ring.c index db678f5..d0dc464 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -559,6 +559,11 @@ static void virtqueue_init(struct vring_virtqueue *vq,
> > > u32 num)
> > > >         vq->in_use = false;
> > > >         vq->last_add_time_valid = false;  #endif
> > > > +
> > > > +       if (virtqueue_is_in_order(vq)) {
> > > > +               vq->free_head = 0;
> > > > +               vq->batch_last.id = UINT_MAX;
> > > > +       }
> > >
> > > I would try to reuse or refactor virtqueue_vring_attach_split() to reduce code
> > > duplication.
> > >
> > > Btw have you checked Qemu shadow virtqueue as it might suffer from the same
> > > issue.
> > >
> >
> > I checked QEMU's shadow virtqueue implementation. batch_last is reinitialized in vhost_svq_start(),
> > but free_head is not. Since the SVQ object can be reused across stop/start, free_head may retain stale
> > state. So a corresponding fix should be needed
> >
> > void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> >                       VirtQueue *vq, VhostIOVATree *iova_tree)
> >  {
> >      ...
> >      svq->shadow_avail_idx = 0;
> >      svq->shadow_used_idx = 0;
> > +    svq->free_head = 0;
> >      memset(&svq->batch_last, 0, sizeof(svq->batch_last));
> >      svq->last_used = 0;
> >      svq->last_used_idx = 0;
> >
> 
> I'll ack this patch if it is sent to the QEMU mailing list, but the
> guest is not able to reset a virtqueue without deallocating it

what would "deallocating" mean here? who's doing the deallocating?

> as far
> as I know. Do you have a reproducer or something similar?

