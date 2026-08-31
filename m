Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89F93E3D98
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170741; cv=pass; b=Ie3xX0YQ4CLyYXeCixXtP7vI0kwMMos1M6NLl13eFtgzOvPX0MD0UP/fhF6uFvmPpWH8ksQtctJGhgyoq7DiWqS9iZjeCquTEiWnqKilS/JB42+GZInR73rMwEjsYZsPfmANxZT3Rggcw/nGo7u8fIaCC/zmtgZlBfiK9Ndqx/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170741; c=relaxed/simple;
	bh=CuN+bOp7XPvvUDBhgRONwpopOkvVIRZtG41BqdWZ5/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ti79D+w7PnowCNnyz8Z2vDWh0pJ73pytRQoHp3fMnr84Cj5Hx3t5c98zo5od+xWOLnFRLtgCsf48efavLdDUTHCbFOBWlfzbQr9jUF+CgyevWJUlcace/jck+k5ttqGBXIoWygAjo+lUCgOPn7Gr1eUl81Bdde8lJPJcY5Y2Hfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKV1Mguo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2NAOK/9; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKV1Mguo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2NAOK/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788170738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CuN+bOp7XPvvUDBhgRONwpopOkvVIRZtG41BqdWZ5/A=;
	b=IKV1MguoMID20Zxy7XAYulkem2ZE7n10xK1d16fqVV4KoC8y5tKd1T8NoxpbGcl+llu3kY
	wl8VmfcaCFQl/S0+7pNsl8dFhYZtW9GMOQMDiNxMEjTOTrdyfyBQYzY5qyuRq21Ooo08cp
	wpsF8wjAjb7dtnB7Ibwny/aj6PzVyyw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-5Aqr2pJvMLSu0PVFBo6fcw-1; Mon, 31 Aug 2026 06:05:36 -0400
X-MC-Unique: 5Aqr2pJvMLSu0PVFBo6fcw-1
X-Mimecast-MFC-AGG-ID: 5Aqr2pJvMLSu0PVFBo6fcw_1788170736
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c416b236so46846857b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788170736; cv=none;
        d=google.com; s=arc-20260327;
        b=OQUs6+mMlQpkpr3U3k5BxWyyC7B8uec5SSEeOgkEpTf1axlGLZtf1e2IkcRY2jv3X3
         6fP0Gneugmzu68p0HwFVvnPrOGTIidWnk2BnuUJITh5/nLmIJ/QbcG6C91Rth8+UD+Lz
         /W5ORIlOKu80+Qusb86LeOWTPhIYCzAr4nm8+XoVfvcbvpl9hOr/m88iXuq8Lxe+cU/Y
         jCHErCZ/hut7tYLbSlnaiGUsN5WSeHESJdoAx+tB462f6Y6cK4FSdyuL7iNZQbDd4gWT
         jUefbThXriqa7dCbCbgcj4ZEUl1Bb+kLpDoYu2e45B6HgY4hWSrZO5TNVqh4I5vM3k/Y
         8v+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CuN+bOp7XPvvUDBhgRONwpopOkvVIRZtG41BqdWZ5/A=;
        fh=4C6NOgUDc4jOKhwQu0M+V6UDDElb6okWkpPRQO/gvfo=;
        b=YfG2eJeN4jKYwJ6AScdpbG8xH89h9PdURGGnd7bINcQNf2k3bKvqOFzRClmp+E++H+
         vTiEd+DOv0lmHy6ssR/DZ1b6ud2WEh/Px27M0ORNwhhjJoVxfeN+pU4bn5yvqTJT/pXi
         SUlTy23lH0DRP8ANSqiFid7tXK/W1m/3hOCfsJChGtrYHfeoZi/Mumfa2FMgoVfQuFRF
         WGCjSCSKtEsPyBx2fC0YGyJkjtobkbU+TS9MvYpPKXBRBGiKcE7LG0IHW1bJBt2DK14z
         esMQbOSB/UjiR36eCrZ7WHmTJssg8d7SxkEWiwqYR0bU8lripP+BA+nkHaryWb5z4R5A
         UbAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788170736; x=1788775536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuN+bOp7XPvvUDBhgRONwpopOkvVIRZtG41BqdWZ5/A=;
        b=h2NAOK/9ymTsRi6elrwHjzn+8t7vk48BcfKtrcwe8EVWGoG8k8xj5FBqwb6cdCFdX1
         +HAWCfCFQJy7kEfYTYNTMYDJ7v39laQFEvF7+PiIAx8hLqQSByZkQ6EhnFdKtJrRQ8nO
         XGlF1j8Ib1yFHOkTHBkL6WK8b+w8pkNVcgwuVDBqWviSwRFMJJMbpHeeo8woVjGmpQ2c
         /Tjp/GizTvEAY3VkyUlzPzES55F0oaPT7d8HJ7/l1npPlSQh2L+JekaqBDxzkIgKyPNy
         tpbHw+8YF05dW3AfFDO5yvxWYs3Cpl+p2IN7s2JRfGrU/gjDwNu4N2tvAzposAABaavD
         V4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170736; x=1788775536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuN+bOp7XPvvUDBhgRONwpopOkvVIRZtG41BqdWZ5/A=;
        b=Qvn4vWDfxMw8hrRmwKBXPM4WmWMO8bkki1ZG82n8M0Q2FGRUzk91EYw8t/V1ilAxVu
         +mYhWSeex/+t5SMS8A5ozgV5d1Efa81kUGjVpjS1jrtVni9vxbAZY1CtVf8m0ObjAly6
         l5q/6mGx4KLUsRMLFcpphf9kDD9YgN6zLHS14MHnD8AApzIkMABQ3aaJuToe2mYLdHJ8
         2wmVmiuugRgOrSFoVQCLUb8mJ336i21wxKcmp7A7VzpEqEYReT5m+2U3eZqlSMpWCB1P
         yAXfe7gKkm3VZx4V9kaZK5jzI9pXYTSbUOOoY7kH10BTac2Oty8Ltrqni3g2+nZJ3j9q
         E6rw==
X-Forwarded-Encrypted: i=1; AKwUvBzEDJPwqgKisMZdXq2nmq82D0RzEbhyJMH8MQ4L9j6oZsTllkGFKmeyp/WQdZz4JXegVcw1x9McHT314I0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGboyzqJW+biioAnoxfMKGq3e8YOSd9XAEsmM/5BRGacR/a01M
	liNwVoKVLaf24qp1ALdy/rZD7mX7xShaCNedlVW/Q36A4wduY1B5654HlL0BiyzaWLjqYmGUXHF
	A/pyWkjfFnbRRPCVHskztI6yVPGgrMeQP5TeZ55UC6zIsf8LtzwFftO4bMvS2C8pg47Zn5pKu0W
	B7cfonDfTu4TPmwipG/YCjt3hKdAGBxAfv27cXJ9/l
X-Gm-Gg: AYBFou3PeFq74tv0jXra5lEz8DCAtAiqoOJ09srqagd+tx8DEtqutnYtn0wXJAHPWYE
	tQio+AnV83FPpyzDg/pSRmvJSOrBzi0UO1Gu2LBjoxYM/rKDMmkvXE1bZd20hEjVd5gKxjgou2v
	ccouZZ0Kwt0PZ+DJzGzm+yMz/rCN5bV9FJNUdJ86qSP4x+PmMGGDEKBkPuLlM/6//E3T88rDgcJ
	sGA2xGH1FgGwIcEzy0bQalL/A/xE5sXhxgGCVTZYn8rVrjj08fJMYk+rrU=
X-Received: by 2002:a05:690c:85:b0:81f:238a:1709 with SMTP id 00721157ae682-85d7055d29bmr74565917b3.34.1788170735805;
        Mon, 31 Aug 2026 03:05:35 -0700 (PDT)
X-Received: by 2002:a05:690c:85:b0:81f:238a:1709 with SMTP id
 00721157ae682-85d7055d29bmr74565757b3.34.1788170735365; Mon, 31 Aug 2026
 03:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818211425.91009-1-graf@amazon.com> <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
 <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>
 <20260831022012-mutt-send-email-mst@kernel.org> <CAJaqyWc-a5orY1Rg2S_PmdPWt6gcGFM7-FyN4Pqk5hPd8vi0PQ@mail.gmail.com>
 <20260831042123-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260831042123-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Aug 2026 12:04:57 +0200
X-Gm-Features: AcwNN1VlIGzZbrNlA6oR2V3j0xwPLBh0QARcrVS5gn5j0el32_TFBhTZtzi0e84
Message-ID: <CAJaqyWcRwoAWMU9EQE-qDNmpzjc4xheU4Y+MxTx2EF8vP6wEKg@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>, nh-open-source@amazon.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:22=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Mon, Aug 31, 2026 at 10:17:56AM +0200, Eugenio Perez Martin wrote:
> > On Mon, Aug 31, 2026 at 8:21=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wrote:
> > > > On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Tue, Aug 18, 2026 at 11:15=E2=80=AFPM Alexander Graf <graf@ama=
zon.com> wrote:
> > > > > >
> > > > > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mappi=
ng
> > > > > > fails") moved virtqueue_add_split() and virtqueue_add_indirect_=
packed()
> > > > > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOER=
R and
> > > > > > the request fails. We still return -EIO from virtqueue_add_pack=
ed(),
> > > > > > and virtqueue_add_packed_in_order() copied that when it was add=
ed later.
> > > > > >
> > > > > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s39=
0 secure
> > > > > > execution) run the pool out with enough I/O in flight. On a spl=
it ring
> > > > > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer =
requeues
> > > > > > the request. On a packed ring virtio_queue_rq() reports BLK_STS=
_IOERR
> > > > > > instead and the error reaches the filesystem.
> > > > > >
> > > > > > Return -ENOMEM from the packed unmap_release paths too. Both ar=
e reached
> > > > > > from a single goto on a failed mapping, which is where
> > > > > > vring_map_one_sg() already produces -ENOMEM.
> > > > > >
> > > > > > That way every ring layout reports the same errno, and the bloc=
k layer
> > > > > > requeues the request instead of failing it.
> > > > > >
> > > > > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mappi=
ng fails")
> > > > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > > > >
> > > > > Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > >
> > > >
> > > > Even if I'd like to see this merged, I'm having second thoughts
> > > > because it introduces userland visible changes in some drivers. Are
> > > > them acceptable?
> > >
> > > I mean, fixing the kernel for the userspace is kinda what we do, righ=
t?
> > >
> >
> > Yes, but changing error codes returned from the kernel to userland
> > always reminds me of this old thread so I wanted to give a heads up:
> >
> > https://lkml.org/lkml/2012/12/23/75
> >
> > Now I don't think we're in the same situation, though; probably no
> > userland app checks the actual errno in these operations. However, the
> > userland apps are not limited to VMMs; they include actual subsystem
> > users that do not know the backend is a virtio device, so the base is
> > large. If you still think that will not be a problem, I'm totally in
> > :).
> >
> > Thanks!
>
> Well actual subsystem users for sure expect EIO on actual io errors no?
>

Yes, but code like drivers/scsi/virtio_scsi.c:virtscsi_queuecommand in
the kernel explicitely checks for -EIO, and had a different code path
to handle it than -ENOMEM. Even if both are valid, the visible
behavior of the code changes. My fear here is that we have similar
code in userland that we don't handle. I admit it is not very likely,
and I actually prefer making both split and packed to return the same
ERRNO, so if you're ok with the change I'm ok too.

