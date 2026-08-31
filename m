Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222702C15A5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172810; cv=pass; b=VvI1u3z6OXBdxxRP/XoqZucL5XqKFcxDXnW7226vRzdZbVOjgHOTPFZSLIcSRe6O+8I1xvZGt9yvvXeiUBOLW/uEWwr0iuvHpT9p3LpxILZ0nadgoZztZJxQhCBgNc9PUOFw8kUUBugyXa98YYaaqqvrnnLgsp1a0ZhJUeSaPp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172810; c=relaxed/simple;
	bh=zPd7uNGErn7MGI9vtI7+1qSA8cY6vjT2EFeY8ANUrWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCBH0ySujX8u7Ee7dK6Uy3gZBAoWwFzwDB5gqICJ0zgxKrTnJY9AEKX8V8b+qV9MH22+AkQHtLW0aAmRMH2JJCD9ITGPuzvpmcXxaL3qE/2VL/R9nTR5Vleoqruq1Xf9KvYsYvW9LVbGqQuA4Zy1zSNTZyD+LQoiHHtnKfiS0FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuhTNQg/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=meRXm2bx; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuhTNQg/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="meRXm2bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788172807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPd7uNGErn7MGI9vtI7+1qSA8cY6vjT2EFeY8ANUrWs=;
	b=iuhTNQg/pPsLzht2Tf6aTOQNcc5VSvMfw4n8yW/ABS40A44Tf8UpmSZo3DPoKNuHF2sBDw
	JTGb2mre3wQ+6EdL+x7Jo94BJlVcR+HHPxttLa6V1G7BAooevKxZDJOMulFm1uvhFVeO+V
	w/+TExpJJgjq4E1ZKDlbzO/wRxHuSD8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-pqSJpyUKNrGIxgWQhrXGKg-1; Mon, 31 Aug 2026 06:40:05 -0400
X-MC-Unique: pqSJpyUKNrGIxgWQhrXGKg-1
X-Mimecast-MFC-AGG-ID: pqSJpyUKNrGIxgWQhrXGKg_1788172805
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8461ade272bso45113407b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788172805; cv=none;
        d=google.com; s=arc-20260327;
        b=AldGQcRS8k4n28xLFVszQu1Hg93+vF1zDqxZduoZ+g5OWANyjXv0tQkxh+knOZb5QS
         i64SfrInXXKFUk4zbA7rUBdRjZCm4yyPTyZmqwALzy52SYlrPK1080Pae0dDWEzQHuJK
         wglrJ0/dG/OwII0DeFpKdPuQluNVqeFnuJ7zD9ISohJYbrdyHcQmAhoLcN+2NSONrHmD
         ZoGnTZSL8Z4lG6/+ggkjegRfO0l+lehRLyoHlOIyORr8odxpUJw8pqnDaXXVtHEWgXVd
         sPOE7VFpykgrrFIeXZldCR97NbKVk/p5Qg9TGTR+TGRymGbPK7Y6cUMjKOaN21r/Jd3k
         v2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPd7uNGErn7MGI9vtI7+1qSA8cY6vjT2EFeY8ANUrWs=;
        fh=/gD6BJzjucEil0s0ier+EifQIU+fEJll5oqXS6AFETk=;
        b=AZESu7/sqgksikGL4nFaPstfdDNvRo2czQYsipOh+xEvIRYsWR5q7B7cxK42esAoB9
         gAnDPltPXceidwFhN3mK8EPnmkMraBRkvDeQwkQ0pL4wNHrslza+AY4Dt/95Xs+rFp5/
         T3JN4gl2Tbx0zRES5QBAjC07sttdBP9Cjl9EQhPA6o2SpFo1ZAooJfzeGlnEWSf/FeMZ
         7ZB9TKd7VkODg8yWG9//vJidm1c9H9xNy2/VAC28vTzer4gs9ubP5azoOGXE28wIFI5Z
         v3rwP4hPijcVorBA1OEl24pbZ+OYOEKGdGE4R4nERY+iET4YtFhVoh2fgpNGI7JDvmXl
         Sayw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788172805; x=1788777605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPd7uNGErn7MGI9vtI7+1qSA8cY6vjT2EFeY8ANUrWs=;
        b=meRXm2bxFthDhg3EXIkCov5Re7sAx0/F2GRbB0RwutW1QqYYauZkyt/z44ffiZyp5B
         U6MyKYFyxeTIvh7ybJbbm7NxXQrkPdt2nwiQEsdp/gUoNaNN/g7W+46g/nIXAz9rkt1T
         6dfdZ7Y8VLesucOi9vFFeZbVmwEcSu8kPho2YykowHUpnN3sBZqzM8X1zImYL/wEDwkt
         qMY6j8/kfl8HOOKaEBJj8X5Lz/56FfjrtGEmlSoLFb6XhgNvRfQ/l1PXojlu8emnWUEk
         CxdVBNjr4GSC5zW15omxhj+T+11CrzeB2olrZMoW8QzruahPFE1zUhE1itjtYK+0Aq9F
         VQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172805; x=1788777605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPd7uNGErn7MGI9vtI7+1qSA8cY6vjT2EFeY8ANUrWs=;
        b=Fcryds4N/58sg0ZtdMa1bGpOWVMeBztTSfLjMIpT9u02B6j9CPFkbCT2GKFYx8bhRg
         wmkGSQoNXmYjsfz+6/dzBx46o+/1b1FLM6Val36vWfksSjkcX9LhvmwmIQdHhfMWluHi
         253Zm8LDwut2ITIiQBX4OhS4d44kxM/O5denDN5AbKQquDbAK+jpGlbdd3el4PGe3DeS
         kLX1XwziW9PkBqoPe0UuKl2p/5Svc8yFuo3unfx7lVZ+C5IwB2/zvd3R1SciEvf5POeF
         O01T05/np8kB+s/Z91DcX4S0FcVmqQd5Xmk83Kur2/N+tNilGjP+i6PL+b72uk9h72ui
         g2aw==
X-Forwarded-Encrypted: i=1; AKwUvBwiJIM8PYoMxeAndcXCCyfy4tfydbtkzT9n0kgL/zL1eoFKzJ2wf9leIv86UvtWkWCKhUrYOqN151DVPx4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+dSQ+lOXI/rqini1H55mR1HwJ7AcdhY7j93bH8UM6La7Sk8CI
	IQzDK6+Ayd+/UfUfc62Axnxk4+re3hWWV2QEvu1s29R0kPQ1zFxpzLcNxEm8L58rw0nuoZBcW89
	YDpON2zJBQdToSRRYd87/4yWJRDY90dC7SCzz/wFNxsnoSGu52vZZCyaQLzVa4G9vT7TrbtYZ2V
	sV0ZqFc+rgyDKQZKIz1cMfuOyaMlETgseqtMeacfKf
X-Gm-Gg: AYBFou2lQQAoGp+zz6aHTtqOOH9+RuFZTo+qF3Wo03E6riMOAiSKFIkc2rT6XAVtZy7
	+rbPR0uvL9mr9xgiOkQ6div8g4mIDPKLzQMwRtC1LZhKoT157Xu+KSqzI/XBd7ZQ1B8X0z0ovMw
	KXPGgXapmncBsKG0PpvYGbTSrewOow+1ZbqwV2Cd6yfTFcrQu0PUzQ2tj92d7oZRMnVmpsMKdQY
	f4xJ0zenJxJp3QIZzvTd5u1ZnBpNq5NmCh3XhxmKC3VXv70R6ukw9b73uA=
X-Received: by 2002:a05:690c:309:b0:834:fadf:6050 with SMTP id 00721157ae682-864f57aea38mr31053007b3.16.1788172805024;
        Mon, 31 Aug 2026 03:40:05 -0700 (PDT)
X-Received: by 2002:a05:690c:309:b0:834:fadf:6050 with SMTP id
 00721157ae682-864f57aea38mr31052797b3.16.1788172804630; Mon, 31 Aug 2026
 03:40:04 -0700 (PDT)
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
 <20260831042123-mutt-send-email-mst@kernel.org> <CAJaqyWcRwoAWMU9EQE-qDNmpzjc4xheU4Y+MxTx2EF8vP6wEKg@mail.gmail.com>
 <20260831063307-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260831063307-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Aug 2026 12:39:28 +0200
X-Gm-Features: AcwNN1XqixT9XX9ulqXuds_8-rOHhQ_YFOF-lOx_ulmYah9DsENr0BDNXy5BV5c
Message-ID: <CAJaqyWfKK7A2mgi1uJ_DqF-XhAsXOGmko19emTwdFfQEhrCX0g@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>, nh-open-source@amazon.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Mon, Aug 31, 2026 at 12:04:57PM +0200, Eugenio Perez Martin wrote:
> > On Mon, Aug 31, 2026 at 10:22=E2=80=AFAM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Mon, Aug 31, 2026 at 10:17:56AM +0200, Eugenio Perez Martin wrote:
> > > > On Mon, Aug 31, 2026 at 8:21=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Eugenio Perez Martin
> > > > > > <eperezma@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, Aug 18, 2026 at 11:15=E2=80=AFPM Alexander Graf <graf=
@amazon.com> wrote:
> > > > > > > >
> > > > > > > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA m=
apping
> > > > > > > > fails") moved virtqueue_add_split() and virtqueue_add_indir=
ect_packed()
> > > > > > > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_=
IOERR and
> > > > > > > > the request fails. We still return -EIO from virtqueue_add_=
packed(),
> > > > > > > > and virtqueue_add_packed_in_order() copied that when it was=
 added later.
> > > > > > > >
> > > > > > > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX,=
 s390 secure
> > > > > > > > execution) run the pool out with enough I/O in flight. On a=
 split ring
> > > > > > > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block la=
yer requeues
> > > > > > > > the request. On a packed ring virtio_queue_rq() reports BLK=
_STS_IOERR
> > > > > > > > instead and the error reaches the filesystem.
> > > > > > > >
> > > > > > > > Return -ENOMEM from the packed unmap_release paths too. Bot=
h are reached
> > > > > > > > from a single goto on a failed mapping, which is where
> > > > > > > > vring_map_one_sg() already produces -ENOMEM.
> > > > > > > >
> > > > > > > > That way every ring layout reports the same errno, and the =
block layer
> > > > > > > > requeues the request instead of failing it.
> > > > > > > >
> > > > > > > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA m=
apping fails")
> > > > > > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > > > > > >
> > > > > > > Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > >
> > > > > >
> > > > > > Even if I'd like to see this merged, I'm having second thoughts
> > > > > > because it introduces userland visible changes in some drivers.=
 Are
> > > > > > them acceptable?
> > > > >
> > > > > I mean, fixing the kernel for the userspace is kinda what we do, =
right?
> > > > >
> > > >
> > > > Yes, but changing error codes returned from the kernel to userland
> > > > always reminds me of this old thread so I wanted to give a heads up=
:
> > > >
> > > > https://lkml.org/lkml/2012/12/23/75
> > > >
> > > > Now I don't think we're in the same situation, though; probably no
> > > > userland app checks the actual errno in these operations. However, =
the
> > > > userland apps are not limited to VMMs; they include actual subsyste=
m
> > > > users that do not know the backend is a virtio device, so the base =
is
> > > > large. If you still think that will not be a problem, I'm totally i=
n
> > > > :).
> > > >
> > > > Thanks!
> > >
> > > Well actual subsystem users for sure expect EIO on actual io errors n=
o?
> > >
> >
> > Yes, but code like drivers/scsi/virtio_scsi.c:virtscsi_queuecommand in
> > the kernel explicitely checks for -EIO, and had a different code path
> > to handle it than -ENOMEM. Even if both are valid, the visible
> > behavior of the code changes.
>
> For the better.
>

Yes, I agree on that :). So, if you're ok with the change,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

