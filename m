Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698626;
	b=e9Ogymw3lrqaCGaobvmqtAAxiio7kUzQlQdtclZ5NFsUJQQJfpCpi0jG4GIBMZ4nj7Wf
	 V98oaj4gopkYa12A5DMNnPFTezR3g/u3EgkR7JI6KC97IByd4JnT8JOXkVBf+pV7zEale
	 ExCOlRySUj86R3QPJwIVYZoWIVdfaNZTq2fd+NS48tV4z6SqsKnVA6etHSzbdYYzHbo6M
	 6p2hMjLK6c6d/QyHP2KRycChS25dnH9J/nKFOue56qf67bw13fUmV4kIAUSlKMlK2/4Qf
	 YhNbAG981ixomp5QE9T4hFcAp7gM3fz2PFWwsDk3Do6UefgrWq52sL9yn4iBgnnypjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698626;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=mhbekvYvf/VcPDAp6AWk4T9uCuPGyMlX9BkrPLgsRjo=;
	b=mGuoJtd3DQPYOgkYoJ6Pt/QYnwdOIksQUsLsDZrcYFE0jOQ1WRLy1gU4/bu7uzVG1pc/
	 B9zNsT0rr+qtQKqvPGgDMiLQVP/OHjbrXETFkjMe99JSbmHkjudxx2Q4j+Pn2956LiTar
	 JwcwXShHLE6JbgdkWFWD5Kc8aWy+tJQ4rbptTWj+XX37ktZol6lr9pNZyaruzbeoV7toH
	 2yucG9R4mnTlyzPahSwShmqDsvXTguaobSABaDr6sbKsW7N0RFVwzZJE3lAZVnmOb9g+J
	 HpKVAx3l/QqKY19Z01LO1EXtH9RrgrMXrKryhZYd3/VSBi83qgbR2HbwlMXowZiFC1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YM8KNHny;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="a3/wVSfh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44652606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44652606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YM8KNHny;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a3/wVSfh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhbekvYvf/VcPDAp6AWk4T9uCuPGyMlX9BkrPLgsRjo=;
	b=YM8KNHnyG77Iv3RkA9AXv25QxTTAkfp2RjPPOaq766dd24cP1M0oSJ+t34H7uKmIS0E43A
	mkjMqipdUldA9GD2ATKe3P0E8ngIqlacSoPp4W86H/12o/fln4tf/OEZmLvmrn0F6qvfBj
	ttIlf9fUBB2++O3HD/4StHipQZ0ANYc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-A1KTUoudO_KhJzg4DWRxfA-1; Tue, 03 Nov 2026 04:37:04 -0500
X-MC-Unique: A1KTUoudO_KhJzg4DWRxfA-1
X-Mimecast-MFC-AGG-ID: A1KTUoudO_KhJzg4DWRxfA_1793698623
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c416b236so59863167b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698623; cv=none;
        d=google.com; s=arc-20260327;
        b=HkHsUjcZ9kbzpXw3MBCmDf0jO7DDbaN5I/n+v/8pRBv8qCj0G6dwY8v0enf27xgpNy
         T4/NHrqlVU3OrgXORmgHftA2VG/mxNXcKd9b412B2G38HyTbqfB+3zdR9TYTt4M8KmAP
         98VnKBFJCsijcixIguRihZDBF8nR6kc0wvb0Cg05vyW753QH8UprJheX6lHc4KVow6py
         ZFWs+5LyhpghunuI1m9y2JujpugBR0y9N9QjV8Z40sBCALQHa7gP/2y2LOkUILVMccOm
         XMu17VPjqnqEc2/UcpsCHmQIeDfLQ33myFIuDxYZR4nVDWUn/WV4CW0Ip08zvE+6eNM6
         youg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhbekvYvf/VcPDAp6AWk4T9uCuPGyMlX9BkrPLgsRjo=;
        fh=R6dQpoQszanPdE19XmzI2hqC97TwAGEX0cPTuNfFAP0=;
        b=N92G+KqN5BEtKesXX8sIcxB0zSPigmzQejftfsWtANdeSkTvzQFnk43bm7gEALcw4q
         0Xl2oc/809ju4g5CfMM3F230wYcQ1jnELqrK+79uVo5w0W8NGTLkjLX8dWvx2ZXhlmcL
         ls6I3Qmoc1h90Xj9dA9JWNV6s/kLzCL2amfEicK32Y5uDkpUSPk9apgyYTsb7JQ6HaVm
         jpwCnG3bLxKxz2l7QL41XQdp4GnyWFr6CM6UsVvYWVKV+zpQKdMtbCip8Hvdncbgp8QW
         Iy3MKt2HS8C5PY+ImpqCEK6l7PllxivZkm0kz9c69hn8JwltBZgdMY7FA8K3u2dAUQ02
         gApg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793698623; x=1794303423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhbekvYvf/VcPDAp6AWk4T9uCuPGyMlX9BkrPLgsRjo=;
        b=a3/wVSfhziceVNEgEK8valoI2KKOapw5HlXQgSAp5QnRhjEH4vbFGGcVQh7SKcNtM4
         imEdzswp3z94j2Jh4A6PPX517Hf/nULjYCmjjcMZZvGFpUtae7/s4cvtR66rhDidYnBQ
         P5vkQM0Gar9m5ha0ihyz5s/lD2kghGtfRxDh3MDIP46W8M6+AF2kgM6Fx715MhOtUaCu
         YKPhj0b9N+AvfBKoPwYCSmN2BuqITAgBuongJ4NZysagytnY417V0828HJ97+U/x3hqF
         ebMca/uG97loOOUaQPBaH1q6DsLC9Cthq1yIAw3io6rXLUYBjIxVllQu5c82Ho3kvgW5
         MORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698623; x=1794303423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhbekvYvf/VcPDAp6AWk4T9uCuPGyMlX9BkrPLgsRjo=;
        b=hu0rDAoE1DQJruDe8p13q99L3QUKTJbFd9bN0pHy3lAJfPCVXRXUX324CdnaxgQtdX
         bk9aA4HJhCQ85csuxRPMY+Z7o2sQtF+IH24dJtWEfiBxSD/uXjv9Vx6gKz6Vjk991R/l
         T0I2DQ0MINC9MyU+K3/uBdALnecWCyafyzgiO9zaDbxtKm6D37muqR/nEDiwjKJrnfuJ
         UknDaest8sQJvaxwXPfzkOUzQs35BfB/B+k1wZ1MELxvhyqmqYGkQXm0cX379Jv3oq2L
         mApe9+WBkzFXt0sDEDCxLCLkADhc/PmAC2NVkmfu9htOKY9BwojCQtiu998P/ePObIfZ
         oJIw==
X-Forwarded-Encrypted: i=1; AKwUvBxL9mItICxvMJIJX9qtJKWO++nKUrAVy5nOwK23M1z+th0plKLZU+gVHKdvMZGNgSXILrRFW1XJpU822OU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nICupnMnTMXUy5jUVzDpN/ovwmmjTvrLJAWpFs1AaCipmd1C7
	KWMH3/TeG5k9To76e1L442z1QgXSNSS0DMk5LppOaWAtFTWL1bUuh7dx+0Ub9Ehk/KYxmVdFAY5
	o1EG+XdrDxgQqYNnHX5nMPkTyDAuWVNh+asJwMKt9OwtCtE4/a5HePd4IC/YFSeckiDIYXVcVTX
	xpJTrHKvD5bEG1ZgggYPQVyVkEbwtr4fcGwLuT50LE
X-Gm-Gg: AYBFou2Cp82rjQ/pndOtEVpfKJkJ2Pcm0yY6aTNpu1cuZ7BHzexcVt5ppqNx+7gx/nX
	Si2RTJj901OP5ZWjQBAECOiEKLuNAlmhCRWf6Myh50Gw4AUBvpJdJumJoabWu9f0BChB7ooA33a
	lDcsL8tN4054Bb7HtlUYG2dfWl+H82gxkzhnXAIzxME7RC88cftOnJweTyYFxYzMufQvWxohsI3
	v/F9XiCuXNsADEkjdk+q0LIpU7AwJhkgl5zerMTbJ+3ttJEF7REjKNODM8=
X-Received: by 2002:a05:690c:6b01:b0:8b1:691f:aaf8 with SMTP id 00721157ae682-8b2b67d25c7mr65056177b3.65.1793698623307;
        Tue, 03 Nov 2026 01:37:03 -0800 (PST)
X-Received: by 2002:a05:690c:6b01:b0:8b1:691f:aaf8 with SMTP id
 00721157ae682-8b2b67d25c7mr65055947b3.65.1793698622686; Tue, 03 Nov 2026
 01:37:02 -0800 (PST)
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
 <fe5e4fb1b68d4203812e253d722cbe69@baidu.com>
In-Reply-To: <fe5e4fb1b68d4203812e253d722cbe69@baidu.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 3 Nov 2026 10:36:26 +0100
X-Gm-Features: AclHuK8UC18carL_1XitgmWfN_M9_0x8flqyKuWRSZ5lwlwQ6wfohwWQCS9BJYk
Message-ID: <CAJaqyWc6OzMF2yvrSjOfRE8g4-Y=JD50iq42zPuXWKjb00FdCg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdIHZpcnRpb19yaW5nOiByZXNldCBJTg==?=
	=?UTF-8?B?X09SREVSIHN0YXRlIGluIHZpcnRxdWV1ZV9pbml0KCk=?=
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: Jason Wang <jasowangio@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:05=E2=80=AFAM Li,Rongqing <lirongqing@baidu.com> =
wrote:
>
> > >
> > > The IN_ORDER feature uses additional software state to track the next
> > > available descriptor and in-flight descriptor batches.
> > >
> > > virtqueue_init() resets the common virtqueue state, but free_head and
> > > batch_last.id are initialized only when the virtqueue is created. Whe=
n
> > > an IN_ORDER virtqueue is reset, these fields can retain state from th=
e
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
> > > @@ -559,6 +559,11 @@ static void virtqueue_init(struct vring_virtqueu=
e *vq,
> > u32 num)
> > >         vq->in_use =3D false;
> > >         vq->last_add_time_valid =3D false;  #endif
> > > +
> > > +       if (virtqueue_is_in_order(vq)) {
> > > +               vq->free_head =3D 0;
> > > +               vq->batch_last.id =3D UINT_MAX;
> > > +       }
> >
> > I would try to reuse or refactor virtqueue_vring_attach_split() to redu=
ce code
> > duplication.
> >
> > Btw have you checked Qemu shadow virtqueue as it might suffer from the =
same
> > issue.
> >
>
> I checked QEMU's shadow virtqueue implementation. batch_last is reinitial=
ized in vhost_svq_start(),
> but free_head is not. Since the SVQ object can be reused across stop/star=
t, free_head may retain stale
> state. So a corresponding fix should be needed
>
> void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>                       VirtQueue *vq, VhostIOVATree *iova_tree)
>  {
>      ...
>      svq->shadow_avail_idx =3D 0;
>      svq->shadow_used_idx =3D 0;
> +    svq->free_head =3D 0;
>      memset(&svq->batch_last, 0, sizeof(svq->batch_last));
>      svq->last_used =3D 0;
>      svq->last_used_idx =3D 0;
>

I'll ack this patch if it is sent to the QEMU mailing list, but the
guest is not able to reset a virtqueue without deallocating it as far
as I know. Do you have a reproducer or something similar?

