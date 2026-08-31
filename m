Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBEA38DC78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156532; cv=pass; b=EKwBnS1n0OQQk7bfNN+mAyirFnURcpewZtPeAvFjgJ4GDb7P16M/6aroDiWZk0dXED7JP/qqpvwjIguic3UKVQ+hMQCLWdFu6cELCXBOXBIkESRn2jAzPFhcJj8jSuda4M+0vRlvyZLbRY2g9LzyxrvrLFu2Sy2kAPbnIKXpVYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156532; c=relaxed/simple;
	bh=pwulQUv9gZsC/GJfP2VzbiSF0sxinrqd2Wl9IhDEGYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN0Q+esFhGYy6VKuFvXFJyIG0UWpgHN7EO23GzsVI834xcx5uUFyYBgpa56263bxKMoe7KcDwcF4QZRXNqOXhEY81wDeU6Z84migqYDjPrIPBZSDycTJ5wqcamJyrjAnp1C5duZuAkaZXBr0a6DhUAd/r4zAZMgdYySEJSzjhMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qr6uId6I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5XAvpi9; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qr6uId6I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5XAvpi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788156529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aju6BdZ5xAFpYdgophff3vv4nrJMZLqTEjhajzjNvs=;
	b=Qr6uId6IR1N1AeYa6ZesxSCV8jUtShp08Zy9u3xtao0o50TWS6TxitromKs2qR6svJPTeW
	tbUAYWNU4kptym25oWDAM8Fsf0LX1oqeHnxyH61bxxR7BUnDRTF2dp9ESb+wZyMwAoWUfb
	kf4OGPUkpsVkqNqDYYFaBveJXYxygJI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-Yd2OHK2vNnuPWus7e1v7gg-1; Mon, 31 Aug 2026 02:08:48 -0400
X-MC-Unique: Yd2OHK2vNnuPWus7e1v7gg-1
X-Mimecast-MFC-AGG-ID: Yd2OHK2vNnuPWus7e1v7gg_1788156528
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c670254c88so2908663e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788156528; cv=none;
        d=google.com; s=arc-20260327;
        b=MfCVo+TtcVslx1UDnMyDL1wAeoSc5RvkTsohsXQqyYDZ+x/mXLuoukOEz3ygMKaqwW
         KzAPRqWHTARUOWGgLg/c1Eu1FfuE17I8Lbw8kv/dKOkfIg8Pkmqu535JMjoWBTDU4Ig/
         FAffhNNq4jMXQMzuTwEXwrXREjkhfbCYIZX9FBCIgw2h9zl32QZS2BSWol8D5lu5otCz
         yOSbqdau7djaSiCxL+PG25irhfpEgVEHmdNHrkX2HjWM8yFEZuuVoEyRGC+N9A2SxAwG
         liywco2f+cGj+Tqh/8wPtGR+dvBpMb4EiOSlwHm2c/dAo3lzeIbQi0gKJV4WDJ3Wqk2w
         ITng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5aju6BdZ5xAFpYdgophff3vv4nrJMZLqTEjhajzjNvs=;
        fh=Ge94eXpNFrd/7Lkq79AIBW5wxdqHkmoP1adntF/IN/E=;
        b=Eth+tkNoFcqvCbnExNwBT/qY9pyIr2cjRSTlx9dDuy14VPyOPTkx9yVBmIHO2IG+qN
         s70AIX0fK1Ud7rXFlEdsOTd0o7yEwLHfEs6MrQ9uPdDcTMtChpRlapyX+NcdgYFvdsUe
         OoZDPeuXX44yXLtt1uBe9OevbSDuZQmLfKb8WpnBb9R+N+tfUipbE+WkdDkBG5PYs1dV
         eVrd1sIPO6kGf1uO6+LwYWKVUunC+tvXzyhOLknE39IDQWXA4p8i0KMIrl0Md6uBYfB3
         vY+AwEEiNxr88b9FDJ3+J4jIm33B0yx/5d7ACsvHNxnC/zqV//8oEYcmlf9/e359V0op
         2gwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788156528; x=1788761328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5aju6BdZ5xAFpYdgophff3vv4nrJMZLqTEjhajzjNvs=;
        b=a5XAvpi90lNk40/jLYfms/JW9Fdsvmsw5hxf2NVwG/2OjUQXiB7MCiQSUamja09DFL
         iZDop3jyUfERe8BmcTHWHx5m0/e4537a1danSML/41Tfd0Ws65c9dNnVNEWVzbVxSUT2
         8RrbPQ4MCJKOBKRPXQEYyMaGF6wEBTX4nbTUuHHIxcn9El69bmuYWmeXm62cbKaXx3nk
         vbD4OQ+XC6JkW3Rp7vskmlvxrj/Jy+Q79d9QxhHrhemymI51uMgaYFlxGSSikgzaz7Zt
         pWBZLwTunL/L6O1NbcG2QVAZTzbrhnKNekxmo/iKXUHhcBhZ2LRB+53V2aXQPDxpAHfv
         LpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156528; x=1788761328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aju6BdZ5xAFpYdgophff3vv4nrJMZLqTEjhajzjNvs=;
        b=ZusC+CxrkyOi/aAAiU2uppPlOkgu/s7p/WloX2z8ry445nLBnzTQ337dZawvAdTzdA
         y7LW+Rd7K2nfiwW2ELQOmK+7IOcKMYD8uVi+/6lrYp3Cbm+LIyHINX2K+FDcW6ngRZWs
         pvkbbHshSwiyRP6UBIdz2ldVt0M6oJxsLRZp2TfH7hKskRl/HOaHwZGVy7XTK3E+mniP
         m+s6ZAwWdcJAv3oLrU8oi+iYz6rF79WXWQbvZhAnJ9e/Tc3EZnlbKod7Cw1UHK6TDI/e
         pTFFPB2Y70PZ2pKapj49zot7ZUCr6iVazlrLSAce3dbL8V4Tz2fhSYwDipN9Fh2tbcMw
         AElA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhzcmdqpta/FgJM09HqG9x36MatyD34EGZN8uPWItYy1fa40VtQQvFnTdPHjf4xr34R6xvz1lhWEIeeM8=@vger.kernel.org
X-Gm-Message-State: AFuF++k9THEHpaEnuI6sChMvQKD9Vs7Xcuxb78Vl1W499dX/pfD2Fg/Q
	/r8SDUP+J4ohjcl3Jxe+9LMCm623xC6fzRnbYR80Y23xdRlvSbZRlDxZ+QzfvdK5Dz3hymQIq5U
	esf/zZrh7aUkiouKOJnt++cIE66OlVY/eB/qMERs9FZB/6+9KpdXD57XKCwjofUJ1Y95cPhqSUv
	Cobx9cUyoR3GOIP32eHw/47oIRAM+JaSZkDAMoOdAf0TH0wxx+imY=
X-Gm-Gg: AR+sD10KrGlfT94t1x5+ZPTqqy8Pu6EE0+KOL/5x13YZn72DQQ/dD95IVkiBMnTW7eQ
	YVNycv0BAy2eZ4UUJoSx6sTyK70jSAHDWmUDS9HcZom8V4SZQKA9gaT9Eg3gX6TmYMinZMNAwLg
	z5oc9f+R2hULIeg4MH2nizzYaGUGAWuj2u2c88mIVZfBucouwnd3Xpph1IcqS6xPnm0JtgVSmK7
	TUMnZXVIvdyAl2FovQG54PWYY0KtPGXVHkOxS0tHvCN+XcJo4UFKDgbDok=
X-Received: by 2002:a05:6122:4fa2:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c6814a1cc0mr10654352e0c.7.1788156527607;
        Sun, 30 Aug 2026 23:08:47 -0700 (PDT)
X-Received: by 2002:a05:690c:a5c6:b0:820:b24:27c7 with SMTP id
 00721157ae682-85d6781d12fmr77480637b3.14.1788156104475; Sun, 30 Aug 2026
 23:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818211425.91009-1-graf@amazon.com> <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
In-Reply-To: <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Aug 2026 08:00:00 +0200
X-Gm-Features: AcwNN1WLAReXxpXSMD_jxVe_A_ReDuw9NQ79ameMLXkVS-IUg_KF2QZWm084ooc
Message-ID: <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
To: Alexander Graf <graf@amazon.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, nh-open-source@amazon.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Aug 18, 2026 at 11:15=E2=80=AFPM Alexander Graf <graf@amazon.com>=
 wrote:
> >
> > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> > fails") moved virtqueue_add_split() and virtqueue_add_indirect_packed()
> > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR and
> > the request fails. We still return -EIO from virtqueue_add_packed(),
> > and virtqueue_add_packed_in_order() copied that when it was added later=
.
> >
> > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 secure
> > execution) run the pool out with enough I/O in flight. On a split ring
> > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requeues
> > the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOERR
> > instead and the error reaches the filesystem.
> >
> > Return -ENOMEM from the packed unmap_release paths too. Both are reache=
d
> > from a single goto on a failed mapping, which is where
> > vring_map_one_sg() already produces -ENOMEM.
> >
> > That way every ring layout reports the same errno, and the block layer
> > requeues the request instead of failing it.
> >
> > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping fails=
")
> > Fixes: f6a15d854986 ("virtio_ring: add in order support")
>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>

Even if I'd like to see this merged, I'm having second thoughts
because it introduces userland visible changes in some drivers. Are
them acceptable?

---
1. virtio_crypto (skcipher) =E2=80=94 errno changes via AF_ALG socket

userspace: socket(AF_ALG, SOCK_SEQPACKET, 0)
           bind(fd, {ALG_SET_KEY, "cbc(aes)"}, ...)
           sendmsg(fd, plaintext, ...)     =E2=86=90 submits data
           recvmsg(fd, ciphertext, ...)    =E2=86=90 triggers encryption,
waits for result

The kernel path:
recvmsg()
  =E2=86=92 skcipher_recvmsg()           [crypto/algif_skcipher.c:180]
      =E2=86=92 _skcipher_recvmsg()      [crypto/algif_skcipher.c:84]
          =E2=86=92 crypto_skcipher_encrypt(&areq->cra_u.skcipher_req)
              =E2=86=92 virtio_crypto_skcipher_encrypt()
                  =E2=86=92 crypto_transfer_skcipher_request_to_engine()
                  [enqueues req; engine kthread picks it up]
          =E2=86=92 crypto_wait_req(err, &ctx->wait)
              waits on completion

In the crypto engine kthread:
crypto_pump_requests()           [crypto/crypto_engine.c:~100]
  =E2=86=92 op->do_one_request(engine, async_req)
      =3D virtio_crypto_skcipher_crypt_req()  [virtio_crypto_skcipher_algs.=
c:530]
          =E2=86=92 __virtio_crypto_skcipher_do_req()
              =E2=86=92 virtqueue_add_sgs(data_vq->vq, ...)
                  =E2=86=92 virtqueue_add_packed()   =E2=86=90 changed here

Error propagation =E2=80=94 before commit:
virtqueue_add_packed()                returns -EIO
  __virtio_crypto_skcipher_do_req()   returns -EIO (err propagated
directly)
  virtio_crypto_skcipher_crypt_req()  returns -EIO
  crypto_engine.c:155:  crypto_request_complete(async_req, -EIO)
    =E2=86=92 crypto_req_done(wait, -EIO)
    =E2=86=92 wait->err =3D -EIO; complete(&wait->completion)
  crypto_wait_req() returns -EIO
  _skcipher_recvmsg() returns -EIO
  skcipher_recvmsg() returns -EIO
  userspace recvmsg() returns -1, errno =3D EIO (5)

Error propagation =E2=80=94 after commit:
virtqueue_add_packed()                returns -ENOMEM
  ... same chain ...
  userspace recvmsg() returns -1, errno =3D ENOMEM (12)

---
2. spi-virtio =E2=80=94 errno changes via spidev ioctl

A userspace SPI application using /dev/spidevX.Y:

userspace: ioctl(fd, SPI_IOC_MESSAGE(n), &xfer)
  =E2=86=92 spidev_ioctl()           [drivers/spi/spidev.c]
      =E2=86=92 spidev_message()
          =E2=86=92 spi_sync(spi, &msg)
              =E2=86=92 __spi_sync()       [drivers/spi/spi.c:4687]
                  =E2=86=92 __spi_transfer_message_noqueue()
                      =E2=86=92 spi_transfer_one_message()
[drivers/spi/spi.c:~1603]
                          =E2=86=92 ctlr->transfer_one(ctlr, msg->spi, xfer=
)
                              =3D virtio_spi_transfer_one()
[drivers/spi/spi-virtio.c:148]
                                  =E2=86=92 virtqueue_add_sgs(priv->vq, ...=
)
                                      =E2=86=92 virtqueue_add_packed()   =
=E2=86=90
changed here

Error propagation:

Inside virtio_spi_transfer_one() at line 251=E2=80=93253:
msg_done:
    if (ret)
        ctrl->cur_msg->status =3D ret;
    return ret;

In spi_transfer_one_message() at line 1637=E2=80=931655:
ret =3D ctlr->transfer_one(ctlr, msg->spi, xfer);
if (ret < 0) {
    ...goto out;
}
// out: msg->status =3D ret  (line 1708)

Back in __spi_sync() at line 4723: return message->status;

The errno from virtqueue_add_packed() propagates all the way to the
ioctl() return value: before the commit, ioctl() returns -EIO; after,
-ENOMEM. Any spidev userspace code that checks errno would observe the
difference.
---

Claude also found another issue in gpio but the code has more
ramifications and I couldn't verify it:

3. gpio-virtio =E2=80=94 errno changes via GPIO character device ioctl

A userspace GPIO application using the character device API (/dev/gpiochipX=
):

userspace: ioctl(fd, GPIO_V2_GET_LINE_VALUES_IOCTL, &data)
  =E2=86=92 linereq_ioctl()          [drivers/gpio/gpiolib-cdev.c]
      =E2=86=92 linereq_get_values()
          =E2=86=92 gpiod_get_value_cansleep(line->desc)
              =E2=86=92 gpio_chip_get_value()   [drivers/gpio/gpiolib.c:341=
2]
                  =E2=86=92 gpiochip_get(gc, offset)  [drivers/gpio/gpiolib=
.c:3394]
                      =E2=86=92 gc->get(gc, offset)
                          =3D virtio_gpio_get()   [drivers/gpio/gpio-virtio=
.c:194]
                              =E2=86=92 virtio_gpio_req(vgpio, ...)
                                  =E2=86=92 _virtio_gpio_req()
                                      =E2=86=92
virtqueue_add_sgs(vgpio->request_vq, ...)
                                          =E2=86=92 virtqueue_add_packed() =
  =E2=86=90
changed here

_virtio_gpio_req() at line 100=E2=80=93104:
ret =3D virtqueue_add_sgs(vgpio->request_vq, sgs, 1, 1, line, GFP_KERNEL);
if (ret) {
    ...
    goto out;
}
// out: return ret

Apart from that, Claude also detected a change in behavior worth
checking, regardless of whether this patch is applied.
drivers/scsi/virtio_scsi.c:virtscsi_queuecommand will complete the
command if the return of virtscsi_add_cmd is -EIO, but it will not do
it if ret is different than 0 and -EIO.

> > Assisted-by: Kiro:claude-opus-5 checkpatch sparse
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> > ---
> >  drivers/virtio/virtio_ring.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.=
c
> > index ea8e774b6d8e..b7b03166a301 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -1810,7 +1810,7 @@ static inline int virtqueue_add_packed(struct vri=
ng_virtqueue *vq,
> >         }
> >
> >         END_USE(vq);
> > -       return -EIO;
> > +       return -ENOMEM;
> >  }
> >
> >  static inline int virtqueue_add_packed_in_order(struct vring_virtqueue=
 *vq,
> > @@ -1966,7 +1966,7 @@ static inline int virtqueue_add_packed_in_order(s=
truct vring_virtqueue *vq,
> >         }
> >
> >         END_USE(vq);
> > -       return -EIO;
> > +       return -ENOMEM;
> >  }
> >
> >  static bool virtqueue_kick_prepare_packed(struct vring_virtqueue *vq)
> >

