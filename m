Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706294;
	b=MuCnAiE6JwAyFpQz37b8VwAt6q0tLOtDmBK43s0z9UtvdjhqtVsVyCHFRCrmV3ItzeoQ
	 pUiDsu+IWNdrYJs59wgaZYRG4bPN8q4VLr5OC4KZozxwf95jTODAO3nyjeKIuVSodpYRH
	 kdhlw89SauuIR7Riteqx5uQyLAWr8CG5F1YB1tQKJHSh1IgJC5jISigyJDcu8dywCfzFo
	 wXT1PRi8yBnqafwHRB8b3s0WYPi5SPCc06rnCRpV2D0I5AyLx/0nes7+fC3t+rOztyP0U
	 HLXaVHAtep8yin3pCl9eo80RPlzO+2J33DwiqB1Yl5r+FXwD/Wa9yH8pMtLt7ZOLNvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706294;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=RuFn4W6phgVUBUCM7NSjX2wTX8POdULpQTYDzkp30Zk=;
	b=hMRvMmGIRxKFsCZ/uaQrJY1DXnLH9jraDKloy18trJft9M6HPjF4ac3L7935KGw2pFEM
	 vOe2b5CTJUurkO0lWSJHmR62hO/Mgglw2mf6lq7RCWkmDKlaohWoLvAdP/a3n4WpahMks
	 yNcJCUyH/UqQBYkfSMOAaBID8N+AcVePpbLU+OLT1mbBeSVTQnT1MCBvU9KCNDFAiSxD8
	 cjGbqO8kB0KgPFvA0e6arMvyRjW5jz7C/4gaqShUoQ3/tMpmXAz5DVvUesCQCGMm7RDii
	 rY/KbC12iLaj+Ggx3WSDXhObpj6kj37SdiU0PZikejAhzE+my5i6dvEbUDDH68cNTmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hM584ALV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="rzKvdq/3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AE4606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AE4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hM584ALV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rzKvdq/3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793706293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RuFn4W6phgVUBUCM7NSjX2wTX8POdULpQTYDzkp30Zk=;
	b=hM584ALVaV7Ge7WiODzliJrdcDf9XNjajIJtEpIjKEaLh0ZiQj+GSN7cCLF9VUxTT7DfoB
	tvU1EiENVJ8ILqeyqsKkOxby1KVZRIQYx2mFKtICBeZBGfE4cYKPcC2FI6JgChkCFzsxBw
	kScnsYdG+RFrmU0EjLcI8sv+KGZC6yY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-P8nWli0nMWq1GucaCqg0ug-1; Tue, 03 Nov 2026 06:44:50 -0500
X-MC-Unique: P8nWli0nMWq1GucaCqg0ug-1
X-Mimecast-MFC-AGG-ID: P8nWli0nMWq1GucaCqg0ug_1793706290
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0e878f574so10364437b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706290; cv=none;
        d=google.com; s=arc-20260327;
        b=MnknOedEVzqpio1RJKIEIcsA9a69LGVEx/XUWLuLk70Y77Lblx3cxy+4nZAvcFezxt
         gnEjiQGCpcEJBULVaBDXolzKRfE9QFXZfpU0NnLXzUtvlVRL7Z1bUGBbZFzwEZTfCSn7
         cTmSrzL/HsNTG0pN4Q8UfhNwfrkqZjcUh5fomUKFlAnBYbm12sH7lN/cf4PqeTUYxGlx
         BUtlMVxgb5wlHJ0L4nR2LupLr++lI/xuMniHQ+iDxNug0MVkNTjNRsI7hNz9dAccPS5C
         1j6eJHr7rvKEEmH0TQe1itXnmpftMiAx+Yqkq9nTsqqC8at2TimXGpPRshxSetUctfOD
         1Akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuFn4W6phgVUBUCM7NSjX2wTX8POdULpQTYDzkp30Zk=;
        fh=/vnW5DcGAlZSgco0KPAT0myDipftgBSa7eXDFrfyMeM=;
        b=LBoEj6I5Tdxuwn9txK0EFHnS4/8vkJqYHGjeY2K7yFApui2z/rys6q1a5xKoID8dvZ
         cuagftcqK5P4daUqMbLL9cw2HnjdvDMtk5k2DRNctSaREDjpUufdDrW42ijWaf+Dc+h7
         3R3m+1mA6kODdwvsw/MsokYj4lmOAoJZyFIW8fjkdaNn/hoB73MvtogB/kFjayov/sRT
         6FklScP+LSMc2aVkmM+ghup1dYo7XR1V8tTXGP28ZIlQbTZm59UUvlQfRbm22OeKsWJ+
         jOwBhboVbrU/bbnga0LcP46xNPv/LQYV7x5Qs5QnnWPoZB7BQj7zqPR9Oq34eb+NnwfT
         BAbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793706290; x=1794311090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuFn4W6phgVUBUCM7NSjX2wTX8POdULpQTYDzkp30Zk=;
        b=rzKvdq/3UhGvBHJJRvX8KvQ0VtQJmH7erJMyZvJ7XJdQz8mPEG7k+GVn6vm+TuUgdJ
         hVdQJKyrtl62BRxyJ1JZVUxXz9lB/Ax/8xI97PhX9GzKK2SFmiYJRv+g/2x9urFLc+3n
         tVsjk9DKtfvIqfSi6fv4yW6xMeSV20Z2lg5zXzMaek9jHaOKoSbZZMgPqgYJzIYtTQop
         8QhAcRWZnKv/1aIAqkvXwE/MafeEtdSsY7SraBss8pOccFCZ73BlquYQtT55WIAk16yQ
         PBfDIUTdTfKDtWfMXPVr2uqzK3QaL7SCvxWVANpMFMFe9ygfB42wLtkJxF6DMklnUzLR
         hcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706290; x=1794311090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuFn4W6phgVUBUCM7NSjX2wTX8POdULpQTYDzkp30Zk=;
        b=Vfx22qbCMgNuOawPIiLZ63WPfbyDQu7DPyJutvrVCEd5imUMjjnffsaPZKieIS/Zlw
         amqJL8G3pouCALPyPleyCsuVQ1e6kHQoQ8vK7+XvG54iu8tKfXuYdUsjPYz8rU1sM5mG
         FV5lfpA+OxVPHW4vrW2b5O844VMpCSMYPWM7fN0689f9TmIA40KTy0RxOzlCrCZCe7om
         cqT5/3+vhXmukEQLgdD4hj4/8l5OiJbvEAk5uetv/PHb6n0/u7tH7PzMdarEIdL1NnEo
         Gfr9HL/uNtHvznuc7v7OpuZmLiObJNvzdxa/bY+1IveYi2G14hd5uwGvgEY5jH5hWMgb
         Ig3w==
X-Forwarded-Encrypted: i=1; AKwUvBwqwTDTrtctWxpc8JZJyqdTbGes6p0hHZAvncksainMV3X7GTgcsVW2P0kdYpEYvia/KJ3h6Zr+EyM2nME=@vger.kernel.org
X-Gm-Message-State: APuU4Z++dpHa1MdLkO6A5+AUreSo5yRDXSpIPXefFWPNgYjjfXE4hIUG
	/fNxYNcRTls6YF8aJuWEHGityp2ceDXuI+LFyjsqRP/UEhql2n4sXAaihbGNWXiMU+iGQOr00rc
	ZZa8fMEezrFpoTG6G6HgzFGSYqDZsg5+tjUszVoP/bVrSKhmqf3Brc6QAJB/MTb1heSHyQsUOrT
	p0CzshBRAnOvc+bPRh+J7KjXu2LXYmaopv/lpz1qwC
X-Gm-Gg: AYBFou1EhC7G/HXMHEBBl34HAKrTWpOA8jQCD+QA10479qdqCHns0IkZVdPfcQx0D43
	EwYatnKBCAc3SFqiMT1FtKiL/mcDowm0MQBntdB8vKWoev/nw5pgSuGXMQtWVO6qRgWdYDmltle
	i9Y0ObfmWeLHLnro1XHz0l4NIFe78WlQ462uPSviMH+/B2S2vd6lkBqqtELvq7dpJuHch9JusCf
	6j66FONO3jo1e+iaKIDlYHJ7jVOhVHmF7NNSLl7B/mNqsW8swtUrTEnFCk=
X-Received: by 2002:a05:690c:6609:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b2b6756fb4mr93647177b3.22.1793706290273;
        Tue, 03 Nov 2026 03:44:50 -0800 (PST)
X-Received: by 2002:a05:690c:6609:b0:8b0:bc8e:9d75 with SMTP id
 00721157ae682-8b2b6756fb4mr93647097b3.22.1793706289728; Tue, 03 Nov 2026
 03:44:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910123903.1717-1-lirongqing@baidu.com> <CAAf7B_M=tfyL33WGkxSX68FwPaRRRBcASVx92EGwPMXaFtUdzQ@mail.gmail.com>
 <fe5e4fb1b68d4203812e253d722cbe69@baidu.com> <CAJaqyWc6OzMF2yvrSjOfRE8g4-Y=JD50iq42zPuXWKjb00FdCg@mail.gmail.com>
 <20261103044056-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261103044056-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 3 Nov 2026 12:44:12 +0100
X-Gm-Features: AclHuK-F8To7UGQU7Iu1DNSDfs2cRh-mK5wzoN11M5svVnnNyzaiwQ7PTsM9EcE
Message-ID: <CAJaqyWdVpXPU=JpgsqrdAvjwdx+L_aUxUJpp4DmjHjWNiTCCZw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdIHZpcnRpb19yaW5nOiByZXNldCBJTg==?=
	=?UTF-8?B?X09SREVSIHN0YXRlIGluIHZpcnRxdWV1ZV9pbml0KCk=?=
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Li,Rongqing" <lirongqing@baidu.com>, Jason Wang <jasowangio@gmail.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:41=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Nov 03, 2026 at 10:36:26AM +0100, Eugenio Perez Martin wrote:
> > On Fri, Sep 11, 2026 at 8:05=E2=80=AFAM Li,Rongqing <lirongqing@baidu.c=
om> wrote:
> > >
> > > > >
> > > > > The IN_ORDER feature uses additional software state to track the =
next
> > > > > available descriptor and in-flight descriptor batches.
> > > > >
> > > > > virtqueue_init() resets the common virtqueue state, but free_head=
 and
> > > > > batch_last.id are initialized only when the virtqueue is created.=
 When
> > > > > an IN_ORDER virtqueue is reset, these fields can retain state fro=
m the
> > > > > previous queue instance.
> > > > >
> > > > > Reset free_head and invalidate batch_last when initializing an
> > > > > IN_ORDER virtqueue. Keep this in virtqueue_init() so the state is
> > > > > initialized consistently for both newly created and reset virtque=
ues.
> > > > >
> > > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > > >
> > > > I think this is needed for -stable.
> > > >
> > > > > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > > > > ---
> > > > >  drivers/virtio/virtio_ring.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_ring.c
> > > > > b/drivers/virtio/virtio_ring.c index db678f5..d0dc464 100644
> > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > @@ -559,6 +559,11 @@ static void virtqueue_init(struct vring_virt=
queue *vq,
> > > > u32 num)
> > > > >         vq->in_use =3D false;
> > > > >         vq->last_add_time_valid =3D false;  #endif
> > > > > +
> > > > > +       if (virtqueue_is_in_order(vq)) {
> > > > > +               vq->free_head =3D 0;
> > > > > +               vq->batch_last.id =3D UINT_MAX;
> > > > > +       }
> > > >
> > > > I would try to reuse or refactor virtqueue_vring_attach_split() to =
reduce code
> > > > duplication.
> > > >
> > > > Btw have you checked Qemu shadow virtqueue as it might suffer from =
the same
> > > > issue.
> > > >
> > >
> > > I checked QEMU's shadow virtqueue implementation. batch_last is reini=
tialized in vhost_svq_start(),
> > > but free_head is not. Since the SVQ object can be reused across stop/=
start, free_head may retain stale
> > > state. So a corresponding fix should be needed
> > >
> > > void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> > >                       VirtQueue *vq, VhostIOVATree *iova_tree)
> > >  {
> > >      ...
> > >      svq->shadow_avail_idx =3D 0;
> > >      svq->shadow_used_idx =3D 0;
> > > +    svq->free_head =3D 0;
> > >      memset(&svq->batch_last, 0, sizeof(svq->batch_last));
> > >      svq->last_used =3D 0;
> > >      svq->last_used_idx =3D 0;
> > >
> >
> > I'll ack this patch if it is sent to the QEMU mailing list, but the
> > guest is not able to reset a virtqueue without deallocating it
>
> what would "deallocating" mean here? who's doing the deallocating?
>

I meant that QEMU free the shadow virtqueue members on vring stop, but
I was wrong about free_head. What QEMU actually free is each
descriptor state (and the queue itself), as it could be resized on
each reset. free_head member should be set to 0 too. Li RongQing,
would you mind sending a patch to the QEMU mailing list with that?

Thanks!

