Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618637;
	b=ONYXV+fRW/6kR6+7aVjXlnOTNA0I9+9Lvb7xQlGQgo+Jp1QKuv0AsxviaJqDiBbrW16z
	 u4dke40ybNYmbAS4kCTNyoMc84bcY3DFgl9gLhf9DWUh0bg/pSPR857rHb7XH7QjGhD/Q
	 xP/JJieADuCHBqTIGZN9bRK2AatUAM7cjMB0A3NJDhQ1qmrkYVwESWTWhSTZO4IEI9W4K
	 RFxi6ockpWpab2z1D+JEcqTL9RUJo8uGKBM5TDonQqpRU8Cj1h6CQNkiZA7JIc7gZEKBA
	 lHuUCqPfBwSGBWFnfOWVe8HgYkR54/BRAhlyy+0TA0nmAn/MUnUhTRyFcQDKulyMwjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618637;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VcjTCIQxHPy1RNYAHZs+gYCcjsuVMw4HX1QUflSdR9M=;
	b=KkTyLJuJwFFnz3sfFnSotG21BtlmCCu+tx2hcIRX/mjabkDMzTWxR1VobrKdU+ZJgKBS
	 c3Ef5kEToT5Cni+TUyBrjHoydUfz7LkRc/l+bp4PLOvG1Dzu0szLJRyCsNUZAPjKRxyWr
	 2cCRJwF66GaDoBtKjx0d4ewbqPerVHZUyfso4Ws87QklZoMH7zmFhkCp3V+TD+0g7Ykas
	 n5Y4IykAFAgwW+G5y2rqx4PM3KQEMmmFxZ5spCBcrUcrY/trQUZddxl/ofnD/j2iG8oXU
	 ui1ZfQlRl4PvQqmqfk5fE/BWPVuVKaUp0/qvklbvpJMEuL/+L9+eXr6KVcbPf+3JV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvQoKBoF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SWwUZ6iz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62777606CEF5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62777606CEF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvQoKBoF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SWwUZ6iz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793618635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VcjTCIQxHPy1RNYAHZs+gYCcjsuVMw4HX1QUflSdR9M=;
	b=GvQoKBoFANb8LawcelHDCJ8XJhnIcBlDlVhXf2mr//bdX/tCvBoVYBHcBRbIpDkRp8Ft/5
	JRShRkz6Mb3wvteOMvwDX75aZ39JMWAphVlVtmalzMZaCL9PwicQREN8JJ0bcC5yH0o0Nd
	7CzUdTujsE/RmA65ERpO059uV/dGuXo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-m5MUppXvPcuDid0V3tqhlw-1; Mon, 02 Nov 2026 06:23:51 -0500
X-MC-Unique: m5MUppXvPcuDid0V3tqhlw-1
X-Mimecast-MFC-AGG-ID: m5MUppXvPcuDid0V3tqhlw_1793618630
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af5a07314so1852932f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793618630; x=1794223430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcjTCIQxHPy1RNYAHZs+gYCcjsuVMw4HX1QUflSdR9M=;
        b=SWwUZ6iz2WD5fBWan0i1mgdfMtJJdZKgJAfmT1bSyzXgDTb1zc4Sw6Eq2d7ChRB7MJ
         4rwtD0CuvPmwaFr2rB1j4eAdCDhQ5zpeO6/wFlBN3/YnlxfIuNkEFvtUKljiGNEG+wc7
         1N6VExOTSTCuYOb8MEIqtBvWvcxjhGXG0YJvQ3r4/wIJVe/54wgzTSeW5FMbXUSWsGtT
         OK+NWpS6JjfixBboqueoosS7q3SqgvBw1I16wLuRj5Xy1tkPgHmsJG3x+SpqtoNo3xPb
         r2Wx0Bob4LA18wqCIUjwA9SKLUiUUUYuuMgMdkLCWBRdK0VDtTlfGNvAB5IThwkL+s2s
         9Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618630; x=1794223430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcjTCIQxHPy1RNYAHZs+gYCcjsuVMw4HX1QUflSdR9M=;
        b=vv/e1gPUek6SnyWCR80/aIpX+8+t0E3mJlwyWmTb9o8zofs1818ZrsttCuuEfZbAhY
         MIboJR6JF4lazm7cHpdw5iWy4HmLOVerUaHf3kbZJz4FG12fOG/LyuTRU/ZdopfuqanJ
         OYy+cOB31jEcj/A7U03Xs/HOKPIIgMpio6FypFYc4RV+++ilVtEepX+9NGf4o8WlwtCM
         Do0lf1FT8S2Vzwub4BKrmeTNq9X8dMbmyylEjQdgaj0svI0GwARYtdpaTSDcndlN3pia
         1ZNS9lLUqwSLwFD7gN4zq+XdnW6W311CKYtyxobe1IhQ6nhNS88Qv0Uuze+1HuCe0qkw
         X7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxccZZQrLuLHIn4YNxGR5Raz/ARYCYPA5HAG990unaJgCW4wukXIgKoZyAqnuYmlSexaTmjvzUvAGOX17k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiaLJwuROAtS9wv3IcFbdeAS3rK+vQtixtHoLqszBEwjZ6bwkr
	w7cG5fK/tXFys2KPz89HYnjhkgLdeGzuaqQoyCVKmeMBocBbVdwKeUy2hU6WIp5ZPupYt1aASgp
	h9dG1kE0njkUF6H/RV60Zz834Loeck6xTBpM6UxkQaNBUGTRBhZybCSSL3qGT3PI8SqrYX3RT/A
	==
X-Gm-Gg: AYBFou0B1RZXiQIyBqzy9WoTzldqK8IXsH6Y2U/HQ1m1zvtEDlcY6G46LDXYgAdE5jH
	taLfEqNfA0XmpIJ5gmej9zQssk9qfCy17kMKykAakh/BPtKcyFc3YSr5YvomBDhC9nRof0denip
	XGqe5HVOINKkB/5j0LXI0pLScTC4Z754qp2RJUpVi705JWwbfcLNw/Sypuev/qxJS1tQ8VS7GTD
	jAFG9yZ5Nva+uI5ngYlV7px2W2g6Q24ijbBEPb2z8bzRTahpDdJUl6+HXhUulvTeyILP5n0cn5x
	mh6hF/aUkTo0/dCoQbULE660Qa860erfByEprOXLvnnyuS0a9ia6ag97yc1EoG3y6hkxZGHk/tE
	tgGT8QLeliKhdS+HvIVHYcwVerTYortvfYVt64lbMxA==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr224771045e9.32.1793618630187;
        Mon, 02 Nov 2026 03:23:50 -0800 (PST)
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr224770425e9.32.1793618629674;
        Mon, 02 Nov 2026 03:23:49 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm120989945e9.2.2026.11.02.03.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:23:49 -0800 (PST)
Date: Mon, 2 Nov 2026 06:23:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2?=
 =?utf-8?B?XSBSZTogW1BBVENI?= =?utf-8?Q?=5D?= virtio_ring: reset IN_ORDER
 state in virtqueue_init()
Message-ID: <20261102062326-mutt-send-email-mst@kernel.org>
References: <20260910123903.1717-1-lirongqing@baidu.com>
 <CAAf7B_M=tfyL33WGkxSX68FwPaRRRBcASVx92EGwPMXaFtUdzQ@mail.gmail.com>
 <fe5e4fb1b68d4203812e253d722cbe69@baidu.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe5e4fb1b68d4203812e253d722cbe69@baidu.com>

Eugenio, could you look at the qemu side of this pls?

On Fri, Sep 11, 2026 at 06:05:25AM +0000, Li,Rongqing wrote:
> > >
> > > The IN_ORDER feature uses additional software state to track the next
> > > available descriptor and in-flight descriptor batches.
> > >
> > > virtqueue_init() resets the common virtqueue state, but free_head and
> > > batch_last.id are initialized only when the virtqueue is created. When
> > > an IN_ORDER virtqueue is reset, these fields can retain state from the
> > > previous queue instance.
> > >
> > > Reset free_head and invalidate batch_last when initializing an
> > > IN_ORDER virtqueue. Keep this in virtqueue_init() so the state is
> > > initialized consistently for both newly created and reset virtqueues.
> > >
> > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > 
> > I think this is needed for -stable.
> > 
> > > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > > ---
> > >  drivers/virtio/virtio_ring.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c
> > > b/drivers/virtio/virtio_ring.c index db678f5..d0dc464 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -559,6 +559,11 @@ static void virtqueue_init(struct vring_virtqueue *vq,
> > u32 num)
> > >         vq->in_use = false;
> > >         vq->last_add_time_valid = false;  #endif
> > > +
> > > +       if (virtqueue_is_in_order(vq)) {
> > > +               vq->free_head = 0;
> > > +               vq->batch_last.id = UINT_MAX;
> > > +       }
> > 
> > I would try to reuse or refactor virtqueue_vring_attach_split() to reduce code
> > duplication.
> > 
> > Btw have you checked Qemu shadow virtqueue as it might suffer from the same
> > issue.
> > 
> 
> I checked QEMU's shadow virtqueue implementation. batch_last is reinitialized in vhost_svq_start(), 
> but free_head is not. Since the SVQ object can be reused across stop/start, free_head may retain stale 
> state. So a corresponding fix should be needed
> 
> void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>                       VirtQueue *vq, VhostIOVATree *iova_tree)
>  {
>      ...
>      svq->shadow_avail_idx = 0;
>      svq->shadow_used_idx = 0;
> +    svq->free_head = 0;
>      memset(&svq->batch_last, 0, sizeof(svq->batch_last));
>      svq->last_used = 0;
>      svq->last_used_idx = 0;
> 
> thanks
>  
> [Li,Rongqing] 
> 
> 
> > Thanks
> > 
> > >  }
> > >
> > >
> > > --
> > > 2.9.4
> > >

