Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADE331EB2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299531; cv=pass; b=JOx/zOVDk3NPan9GD0jvPAKBhjXlr975dnLUOiohmJjtvqkB+T6tJtts8B60RrF+90504TarcL1eE7OTHwIhtYbBVLJD+YERQYZT+/sh4i6ek0BD6EXNUz5fo7s8wPtzABx1RRF0ToH2aUpsZ/yoHlqOhcPkt65kqj9TKgOws+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299531; c=relaxed/simple;
	bh=2jacn7S1Q9FlxeVvnvAIlfCi8jr+ktJM+dSbhY55nxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFqKqVY9hLgvZBDdhQzsauSL3W/5QkVDtGXz7kA5852XDllQVmtdcSQp4tX1wv3WzsPLW4c7PvB0DVcuwyhem/E/sEsqpsgKjF4AFo4A2CWI1Ri7iy7A5GEIPEtLCPhIWAG51RFTKDxr1iUeStMtBo1koliNnvdLG8o9Lk6A2vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzCgfCFm; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzCgfCFm"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so111678885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792299527; cv=none;
        d=google.com; s=arc-20260327;
        b=iCyy5e5pWXdCpERV5j7oeZphbQTYKE9mqSkdXBXkai4L3K716iEecQE1V5eA/Qd447
         DYOgCNa++V+uM8P6X5hFNvjkmajrDGZ7AwIoVQZ0PXtyxC6x5SZSbbM+8vQQtYlEVY8P
         /VYxbulrwqAjJqB6/B7CHABZD6bNkyxpr7F9bMhu5lEq0M5xuQ2yZ/rWD6yOt1fzeNEQ
         RG5NZpjaVRf6x+aRnanp/WzkNCYbx0qJvYi3GHAu3ZRbdePh+YKk8g1ga3jZ6obS80gg
         NlFXig8SYrpmNMp5l7ez8O6lAKRUzvHTPJbX87AgB8I136aynBp15Zx2s/tkfJQEo3t0
         bn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVpEQObwWOIqtaAcnO44zwnUu1XsD27+z0cFMp5vI8I=;
        fh=UKyx5INPygj+Qe+Vg/g8fUu3OuO8+J4qCI2UXHcYzns=;
        b=lFzMA/ebjJq/TvEENBLae0Q8dBhYUg4MoafsNsT1LGtG3mS61ErSxM1rc4UWA1cnWV
         2EWbzj5X0DzTW06C8mktxYVz2d1UBvyXyXlRsewuizDLUwUvBkcDAUOttIacHUpwH+8Q
         D/BhFTlZeZYTJ+FWBqgpQn1Pipvq0hxmtY/WnzPWWP/ZLJGzqQXtQvCE0IlHXGcrEe3t
         1gbAGB+pnmERGWUlCsmKsVwNj2237Aj6WRVEnZC2Y3inI63XoIJ3VhOLYI12LrwSBBif
         z7V8xmEy1qBTkKIU9tkQCjTD3+wFqET8JvrhQOLki+VJlTuT3vCmCYrtDJoSIVK6IpEl
         XuFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792299527; x=1792904327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVpEQObwWOIqtaAcnO44zwnUu1XsD27+z0cFMp5vI8I=;
        b=AzCgfCFm9UJYnz3v7eaBujQsLz07MMN7oM0PDtsH02lGhb9MCpALQ9n/ZqNeLSyz73
         WhXPZkKBTuT/mxowQSlfMnXoZJOSlbvOJy8Yui89PYqILtdCxKOe9gGz5/ICGhuVhpGL
         +tc22ykRHPrM8E19o7GHz5p3X549sWfp5fLTI2FXeTi8f44/+aQNTiJCmUHG2FdVagpF
         OMq3LUAQs8XPcDOVkmN6kylIA0pvBsG/n5jgnn8YmxO7PFlzG5H++zq3Cb2jHzFhkguG
         x7u3DtgDrfzxbfZx1xua7iezWr/OtFyFIsst7upMmTimQEfzrKbueZa2NpWmhCcvPxV4
         iecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299527; x=1792904327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVpEQObwWOIqtaAcnO44zwnUu1XsD27+z0cFMp5vI8I=;
        b=F0kdE9PQW+4ZaYSElbEOT15cYW+wnlliOP69k89e/e+2RzM+8Z24Ngla45wJpqzAmH
         Htg1YfUWJLypEBB778MtvDSanq87ZlekEJnyNPgZ19dCv5t47dEfYpZ8vR7s9pERlER8
         gS4VXpvDiEKnWbJZlftY3J4ILn+NyO4tVFCSCQRhk4iiulilOL/F3Rd0lrm2V/99UJIc
         gLT1ZtklVZHkns3eDgBPCZkFSO/yfB8JuUhjmVJTyyGdA0s36J7t75ZppQhjTuDK6oWp
         BoxlXy40dSDNKVqGhdkZ+sdZtXrXGLTHMXk5pNX1ua6afZ7AA+s96dAyUALpWlgUcXLn
         g0yw==
X-Forwarded-Encrypted: i=1; AKwUvByEQzRTVgjNuixap6Gx56OtvmNmyNhEq9HF1Nm94ZiYS0jEOxxUwfD97cDJImN4NfDbrbXoDfnW6i7FpcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+agncjH5quSFyauqoUXeG49LN8oTPmWe6CiGWgO8kMcXFbhMo
	OMfB0cehypD5vsc698yPT8iscaD57UPCdz1tCqzP2Yb8h9XCWbxsZa+WK9rRHzraDvKFRaRqMab
	Yxzwb8+KH70qjaY7urHa1sZVei4aFSWQ=
X-Gm-Gg: AYBFou3lep+/9u7hdGLFl0SStusJbT8z888Wz8H9fAX+deCp0hEQMNivV5r8EsQH8PN
	LvQhmU+vK8tHpLkK5tUZ0idV7o677xoxhlVEygYF/aNvKCTgz7aE/lQDbyaZRH9nnrNaI9OofYT
	6OoKqkpZBdLOedDauZmmpUsIDa8tn1XMYBOXG+f30lPFI3wSnn4rv2ya8UpcjHNPer91tV3ldrz
	JaeTo6KAZ6NFz1XjkxWn47iFtOFvRoX9Dds8LrqDjlDanMNK/LVj98TV/+rSAyFDsWRAO8n5rAn
	buN4Yb1UnB2LIfmHBt+G3VjH7RKnrVAriXdoNMc6vMF2IU8ETI4YXyo=
X-Received: by 2002:a05:620a:171e:b0:93f:5ac:14a0 with SMTP id
 af79cd13be357-93f29de3496mr751682285a.67.1792299526279; Sat, 17 Oct 2026
 21:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014115640.184286-1-physicalmtea@gmail.com>
 <20261014115640.184286-4-physicalmtea@gmail.com> <atIvkN7GJTpsczu8@devvm29614.prn0.facebook.com>
In-Reply-To: <atIvkN7GJTpsczu8@devvm29614.prn0.facebook.com>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 18 Oct 2026 12:58:09 +0800
X-Gm-Features: AclHuK9AelIjvjLZl8EdKC4WfogWCvECErnvcMt1QyfPdt0mduLoNaQolEZS0YM
Message-ID: <CAJwVaMK-KYZyOkYyuH-CnPG=urE53hGXexVn_ezd6icdKFJ=-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] vsock/virtio: coalesce RX write-space
 notifications in lock batches
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: stefanha@redhat.com, sgarzare@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Wed, Oct 14, 2026 at 07:56:39PM +0800, Jia Jia wrote:
> > Each received packet updates peer credit and may call sk_write_space().
> > A writer cannot use that credit until the batch releases the socket loc=
k,
> > so one notification at batch finish is sufficient.
> >
> > Save the initial sk_write_space callback when the AF_VSOCK socket is
> > created and require it to remain installed for batching. This lets the
> > transport module deliver the deferred notification without referring to
> > the unexported default callback. Sockets with replaced callbacks retain
> > their per-packet behavior.
> >
> > Record the batch socket before processing its first packet so a batch t=
hat
> > ends on that packet cannot lose the pending notification.
> >
> > Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> > ---
> >  include/linux/virtio_vsock.h            |  1 +
> >  include/net/af_vsock.h                  |  5 +++
> >  net/vmw_vsock/af_vsock.c                |  1 +
> >  net/vmw_vsock/virtio_transport_common.c | 53 +++++++++++++++++--------
> >  4 files changed, 44 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.=
h
> > index 26dde6909c4ed..bf077ee0ded88 100644
> > --- a/include/linux/virtio_vsock.h
> > +++ b/include/linux/virtio_vsock.h
> > @@ -287,6 +287,7 @@ struct virtio_transport_rx_batch {
> >       struct sock *sk;
> >       unsigned int pkts;
> >       size_t bytes;
> > +     bool write_space_pending;
> >  };
> >
> >  void virtio_transport_recv_pkt_batch(struct virtio_transport *t,
> > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > index 5549298c1ec6b..9a40960d10cbe 100644
> > --- a/include/net/af_vsock.h
> > +++ b/include/net/af_vsock.h
> > @@ -63,6 +63,11 @@ struct vsock_sock {
> >       u32 peer_shutdown;
> >       bool sent_request;
> >       bool ignore_connecting_rst;
> > +     /*
> > +      * Initial callback, used to identify replacements and deliver de=
ferred
> > +      * write-space notifications.
> > +      */
> > +     void (*default_write_space)(struct sock *sk);
> >
> >       /* Protected by lock_sock(sk) */
> >       u64 buffer_size;
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 44cee74519555..fe7f49da6c4bc 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -958,6 +958,7 @@ static struct sock *__vsock_create(struct net *net,
> >               sk->sk_type =3D type;
> >
> >       vsk =3D vsock_sk(sk);
> > +     vsk->default_write_space =3D sk->sk_write_space;
> >       vsock_addr_init(&vsk->local_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY=
);
> >       vsock_addr_init(&vsk->remote_addr, VMADDR_CID_ANY, VMADDR_PORT_AN=
Y);
> >
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/vi=
rtio_transport_common.c
> > index ff74e805527a5..f4b5f0230493e 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -1820,6 +1820,7 @@ virtio_transport_recv_pkt_batchable(struct virtio=
_transport *t,
> >       return sk->sk_state =3D=3D TCP_ESTABLISHED &&
> >              sk->sk_type =3D=3D SOCK_STREAM &&
> >              READ_ONCE(sk->sk_prot) =3D=3D sk->sk_prot_creator &&
> > +            READ_ONCE(sk->sk_write_space) =3D=3D vsk->default_write_sp=
ace &&
> >              !sock_flag(sk, SOCK_DONE) &&
> >              vsk->transport =3D=3D &t->transport &&
> >              vvs && virtio_transport_rx_skb_has_headroom(vvs) &&
> > @@ -1828,13 +1829,15 @@ virtio_transport_recv_pkt_batchable(struct virt=
io_transport *t,
> >
> >  /*
> >   * The caller holds sk's socket lock.  Set @batchable if the socket ca=
n remain
> > - * locked for another ordinary STREAM/RW packet.  Return true if the c=
aller
> > - * must free @skb.
> > + * locked for another ordinary STREAM/RW packet.  When @batch is non-N=
ULL,
> > + * record a default write-space notification for batch finish instead =
of
> > + * delivering it immediately.  Return true if the caller must free @sk=
b.
> >   */
> >  static bool
> >  virtio_transport_recv_pkt_locked(struct virtio_transport *t,
> >                                struct sk_buff *skb, struct sock *sk,
> > -                              bool *batchable)
> > +                              bool *batchable,
> > +                              struct virtio_transport_rx_batch *batch)
> >  {
> >       struct virtio_vsock_hdr *hdr =3D virtio_vsock_hdr(skb);
> >       struct sockaddr_vm src;
> > @@ -1863,8 +1866,12 @@ virtio_transport_recv_pkt_locked(struct virtio_t=
ransport *t,
> >       if (vsk->local_addr.svm_cid !=3D VMADDR_CID_ANY)
> >               vsk->local_addr.svm_cid =3D le64_to_cpu(hdr->dst_cid);
> >
> > -     if (space_available)
> > -             sk->sk_write_space(sk);
> > +     if (space_available) {
> > +             if (batch)
> > +                     batch->write_space_pending =3D true;
> > +             else
> > +                     sk->sk_write_space(sk);
> > +     }
> >
> >       switch (sk->sk_state) {
> >       case TCP_LISTEN:
> > @@ -1931,7 +1938,7 @@ void virtio_transport_recv_pkt(struct virtio_tran=
sport *t,
> >       }
> >
> >       lock_sock(sk);
> > -     free_pkt =3D virtio_transport_recv_pkt_locked(t, skb, sk, NULL);
> > +     free_pkt =3D virtio_transport_recv_pkt_locked(t, skb, sk, NULL, N=
ULL);
> >       release_sock(sk);
> >
> >       /* Release refcnt obtained when we fetched this socket out of the
> > @@ -1949,22 +1956,27 @@ EXPORT_SYMBOL_GPL(virtio_transport_recv_pkt);
> >
> >  /*
> >   * Finish the RX batch.
> > - * For a non-empty batch, the caller must hold the socket lock acquire=
d with
> > - * lock_sock(). This function releases the lock and the batch's lookup
> > - * reference.
> > + * For a non-empty batch, the caller holds the socket lock acquired wi=
th
> > + * lock_sock(). Deliver any deferred write-space notification while th=
e lock
> > + * is held, then release the lock and the batch's lookup reference.
> >   * An empty batch is a no-op.
> >   */
> >  void virtio_transport_rx_batch_finish(struct virtio_transport_rx_batch=
 *batch)
> >  {
> > +     bool write_space_pending =3D batch->write_space_pending;
> >       struct sock *sk =3D batch->sk;
> >
> >       batch->sk =3D NULL;
> >       batch->pkts =3D 0;
> >       batch->bytes =3D 0;
> > +     batch->write_space_pending =3D false;
> >
> >       if (!sk)
> >               return;
> >
> > +     if (write_space_pending)
> > +             vsock_sk(sk)->default_write_space(sk);
>
> Any reason not to just do READ_ONCE(sk->sk_write_space)(sk) instead of
> storing this for later? If we setup the socket in a sockmap program
> mid-batch, doesn't this and sk_data_ready (from the next patch) go
> stale?
>

Thanks for the review, I tried loading the current callback in an
earlier version, but READ_ONCE() does not synchronize the load and
invocation with sockmap attach or teardown.
For example, it could load sk_psock_write_space, then invoke it after
the psock has been removed, in which case the wrapper would no longer
forward the
native wakeup. The sk_data_ready case is more serious: the stale
sockmap wrapper can dequeue a native skb and then drop it when its
actor finds no psock.

There is also an attach-side semantic issue: one deferred data-ready
notification may represent several native skbs, while one invocation
of the sockmap
callback consumes only one skb. The saved callbacks are therefore
intentional and represent the native path at packet admission, rather
than the callback
installed at batch finish. A packet boundary that observes a callback,
protocol, or psock change terminates the batch. I=E2=80=99ll document this
admission-time
rule more clearly and add sockmap attach/detach stress coverage.


> > +
> >       release_sock(sk);
> >       sock_put(sk);
> >  }
> > @@ -2019,7 +2031,8 @@ void virtio_transport_recv_pkt_batch(struct virti=
o_transport *t,
> >                       }
> >
> >                       free_pkt =3D virtio_transport_recv_pkt_locked(t, =
skb, sk,
> > -                                                                 &batc=
hable);
> > +                                                                 &batc=
hable,
> > +                                                                 batch=
);
> >                       if (!batchable)
> >                               virtio_transport_rx_batch_finish(batch);
> >                       if (free_pkt)
> > @@ -2059,23 +2072,31 @@ void virtio_transport_recv_pkt_batch(struct vir=
tio_transport *t,
> >
> >       lock_sock(sk);
> >       /*
> > -      * Sockmap removal restores the native protocol under sk_callback=
_lock.
> > -      * Serialize this initial eligibility check with that update.
> > +      * Sockmap teardown restores callbacks under sk_callback_lock. Ke=
ep the
> > +      * initial eligibility check consistent with that update.
>
> Why reword here?
>
> >        */
> >       read_lock_bh(&sk->sk_callback_lock);
> >       start_batch =3D virtio_transport_recv_pkt_batchable(t, sk);
> >       read_unlock_bh(&sk->sk_callback_lock);
> >
> > +     if (start_batch)
> > +             batch->sk =3D sk;
> > +
> >       free_pkt =3D virtio_transport_recv_pkt_locked(t, skb, sk,
> > -                                                 start_batch ? &batcha=
ble : NULL);
> > +                                                 start_batch ? &batcha=
ble : NULL,
> > +                                                 start_batch ? batch :=
 NULL);
> >       if (start_batch && batchable) {
> >               /* Keep the lookup reference until the batch is released.=
 */
> > -             batch->sk =3D sk;
>
> Seems like `batch->sk =3D sk` is moving around between patches?
>
> I don't know, feels like if the batching patch introduces
> sk_write_space/sk_data_ready bugs, then that patch should probably
> contain these patches too. Should minimize churn too?
>
>

My intention was to structure the series in two stages. Patches 1 and
2 form a complete batching change while retaining the existing
per-packet
notification behavior. Patches 3 and 4 then add notification
coalescing and after-unlock delivery. Therefore, Patch 3 is not a
correctness fix for Patch
2; the series through Patch 2 remains functional on its own.

The batch->sk assignment moves because Patch 3 introduces pending
notification state. Once the first packet can record a deferred
notification, the batch
must record its socket before processing that packet, even if the
packet subsequently ends the batch.

I agree, however, that this split causes avoidable churn.


> >               return;
> >       }
> >
> > -     release_sock(sk);
> > -     sock_put(sk);
> > +     if (start_batch) {
> > +             virtio_transport_rx_batch_finish(batch);
> > +     } else {
> > +             release_sock(sk);
> > +             sock_put(sk);
> > +     }
> > +
> >       if (free_pkt)
> >               kfree_skb(skb);
> >  }
> > --
> > 2.53.0
> >
>
> Best,
> Bobby
