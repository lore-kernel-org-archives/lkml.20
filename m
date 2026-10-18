Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F4729AAEA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299377; cv=pass; b=kQezFiCFUocmSLdGbYBMQvFHE14Uw6wl0T80obpBR92v7Chyxlnkcf8iGvRNv8jeSKodfvOzbkm0voZr2NabtpA1e/2pFF963+d+uhLYHYkhXm9Gm3csjnXNihWgtgdV564vx8pAULEbuVqOgiGluO2MxC8U+h2zEumFJdDZzBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299377; c=relaxed/simple;
	bh=MUEoAola7xyeL8jdr8fQAQfZf/diWg/Fw9X+u3QZMEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMV6yJExdyPjBQLbtl13g81h12RExJpp2oj/ulBdsozK3zey2/EzHX4482qtLB0HrC6Ra6BCpL0qMViSbL67a7x7txsoK6IVjs2GOU/7E76ums4pqgQZv/GmM9TudoHb2xamvOWpxp+znFiG3uO91SlEkY+PX9UEvg0IP7M0Vts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7ZRdn2k; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7ZRdn2k"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1e5d7450so114881185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792299374; cv=none;
        d=google.com; s=arc-20260327;
        b=GnHA4ATGfGzajhjwOb3vlPs210mgNfwOLlRxZIyVtEI/IIN/g14qPdSmkBw8DL37s+
         i7e0FT/sd76XRaHYnoaGRAJp9QbtF2qHH4r5ClbMiJ6D5gVT14b3MzagvKIeENegdDNv
         WyHdgC7IhrDWH7UFN2hnb4DDbS/re2cqe3Y76uVrE8XVz9clAIE/fKeini5VRK8Q/3qn
         jj5lG71VWatJ/NeUaJvbnuOSlNXuIjKjoKjtb+Rvo5LOeO5/J0xVrTUE0hnP7eS2Lc/q
         RTt1l61iRL44B+5r+c/dpzKrBVc8Q8wpbrL2tTNDxevc8U7XImjgX9ROCAtAG6m4R/+2
         BVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2mQWxR6q9iheemcDETg0gh7emahGPmRGuMQCH/R1v9s=;
        fh=tkVhmcRRNA871vveTlO46Irq2RNqO0h7uDiItWnAa9Q=;
        b=ekDiwLqIRrfqq8uqAR/Gc5m8POfgEMp32McTQpXLK7tcLQGWAKehz7NITbL54ymkNP
         M+3Cjk1HyL6doXrUg+/yJ5NIxuP4nI2Z/XdyIGDBUwe/lhpo1A1nNGgEe8QiC2NuoU4r
         dGMLu/xNsGUaBtaAJN1Xa55CIMA8gtd/DKrNdWXvWjwWdbb3r2VnlVeRVI7r+B2EK5ND
         RwH6rVF0V4XVtzlCMjUVIN9FYYgIt6k2GSeC9O8qDkB6XRMjUZN8apbVikWUlrnRnNeS
         ldjgSAH06DT6dG/QGJrdDhr+a/Iw1aSAJVLHf3hmflNOEJPlLB1Sgg8I1Cl+34ubatcd
         Zqsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792299374; x=1792904174; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mQWxR6q9iheemcDETg0gh7emahGPmRGuMQCH/R1v9s=;
        b=B7ZRdn2kQ9lNmfNqDrcKvyCQYbOPRwCTJ+dnQo2T9MrEx4Mqi8Gxc/aULGnzg2UicA
         amKCZjF/Jf5Lk7C32XWAPl+FlnVgXYd995fNmxkTsWGYisXYkiYjDDkI9ojkB8z9S3jw
         jKxZP+o+sAt28y2cYKWHr8NKRaWb9l5HBGiIjYMlrTNaWSb3Km2Kjwy9oPrGyGmgeWb+
         zH4iNqmUtaqfMqZ6S1oGRjb1cY4EY8BMM0/eAzcqKstreihOhjs+rt55R8RtYPJfwMAw
         A8PuSFacCl71+FKUl5Zux4qHY5hsTYva1QTh+XGgqnSgXjFFLtUGQxu7bXaiCk8chhJp
         s8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299374; x=1792904174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2mQWxR6q9iheemcDETg0gh7emahGPmRGuMQCH/R1v9s=;
        b=svSdryZY90wJwDWJkYAUU6FjRjXfMkYhlABpRfUPHQqyEsLe//3NvmNovS8PFbCf8P
         aZw3tH6JgkpQvX1NmUsgRc1mxXicL4A5woV1PaAdmYGRlQy2rKIvA9Uc3STrjnie1Ru1
         Vg/qfyqhp3TdvLC1TGOzvU4iC/1JoTHFOBKh31k4T52Mqp6rroBpjd8+ni7OGiKFXTCl
         3lwn/K0POgy9SbVRwQHXDJtOJVzLLpasrS+6UEJZTlVpSez5hdw/m0CUAeYafv0Ta3PM
         uwHd0fjaYHh9jOFiaJyW+kzy79oKkJam77nr/MWMDNV4jSOJFakt+4bhzQWaKaivxCzs
         KUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBya77/4mUgDK0RUOCVvcXzxpO7/omUIozGC1bAqOh0Wv9cN8ryif8i0HEU3VRbCkNxO3dhVW3/VBwUzABs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjdPy1TQ1NUQnkSEdSR5eG+fabm4PLx+pGiHQKL9GDFeMQZcCL
	hSiHmck9Nj2boXbXRVrJfypWaYVKHIJ8k0j17Is2Cduf2HMPJWPvU/Kl7Y2pQsxdGJyyb/K6hv/
	AZOI1tq+RZpipiNU0iW15iYXmtcJyT1ku5LUcyN4=
X-Gm-Gg: AYBFou0ukbWsqxgK58V1b/x+WnAboTeb/mPdltZWRYDieVbzGFXr5QxvfPsKyNWDVSc
	nSMFMeIx0SoA0KbqNbjFzUOpHaRrQTFK8a0NPnuBy7sCaffnKddv43hQVra0ebhbhuVghl7GHeP
	ix9Swg77dXu8ib45BZVTmt77C0iGlM91YUclV50Sf0wjulQWfl1OOWCkUYDx5HUF8flm0oObj3b
	cCZafjRpNHDr/VNmw67em4CBCE5XHejkDaVGm/r8hz01mHGdEZC85UWuLyKJ4VYz52yGMroHxnZ
	Bkz4fjhFE087R4mqFnbYPgFs2iBsPCwZdJ6oi06az+iyyt2B8UCZTzQ=
X-Received: by 2002:a05:620a:319a:b0:93c:5958:9de9 with SMTP id
 af79cd13be357-93f29d0113dmr748988685a.33.1792299372805; Sat, 17 Oct 2026
 21:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014115640.184286-1-physicalmtea@gmail.com>
 <20261014115640.184286-5-physicalmtea@gmail.com> <atI3neoHXhgiEpYJ@sgarzare-redhat>
In-Reply-To: <atI3neoHXhgiEpYJ@sgarzare-redhat>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 18 Oct 2026 12:55:35 +0800
X-Gm-Features: AclHuK8ZjEQAvoPM-RXyUG0NK0crmCQ-P3Tq8bClk6mg9VpnN4cPAvs-UmxgqI4
Message-ID: <CAJwVaMLmMf1iyWmoZMAJuS2551DsSWSkcRsUVz3M5xi9AXWsWg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] vsock/virtio: defer RX notifications
 until batch unlock
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bobbyeshleman@gmail.com
Content-Type: text/plain; charset="UTF-8"

>
> On Wed, Oct 14, 2026 at 07:56:40PM +0800, Jia Jia wrote:
> >An RX batch can make a socket readable while the worker still holds its
> >socket lock. Waking a blocking reader then only moves it to waiting for
> >the same lock.
> >
> >Record the existing low-watermark condition and notify once after
> >release_sock(). Move the coalesced write-space notification after the
> >unlock as well, since both callbacks wake sk_sleep(sk). Deliver
> >write-space before data-ready and keep the lookup reference until both
> >callbacks complete.
> >
> >As with write-space, save the initial sk_data_ready callback and batch only
> >while both saved callbacks remain installed. Sockets with replaced
> >callbacks retain their per-packet behavior.
> >
> >The existing psock-marker check also covers a concurrent sockmap attach:
> >at most the already admitted packet completes on the native path, and the
> >next packet ends the batch.
> >
> >Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> >---
> > include/linux/virtio_vsock.h            |  1 +
> > include/net/af_vsock.h                  |  5 ++--
> > net/vmw_vsock/af_vsock.c                |  1 +
> > net/vmw_vsock/virtio_transport_common.c | 35 ++++++++++++++++++-------
> > 4 files changed, 31 insertions(+), 11 deletions(-)
> >
> >diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> >index bf077ee0ded88..f1396ca3ad9b5 100644
> >--- a/include/linux/virtio_vsock.h
> >+++ b/include/linux/virtio_vsock.h
> >@@ -288,6 +288,7 @@ struct virtio_transport_rx_batch {
> >       unsigned int pkts;
> >       size_t bytes;
> >       bool write_space_pending;
> >+      bool data_ready_pending;
> > };
> >
> > void virtio_transport_recv_pkt_batch(struct virtio_transport *t,
> >diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> >index 9a40960d10cbe..78bab5820f528 100644
> >--- a/include/net/af_vsock.h
> >+++ b/include/net/af_vsock.h
> >@@ -64,9 +64,10 @@ struct vsock_sock {
> >       bool sent_request;
> >       bool ignore_connecting_rst;
> >       /*
> >-       * Initial callback, used to identify replacements and deliver deferred
> >-       * write-space notifications.
> >+       * Initial callbacks, used to identify replacements and deliver deferred
> >+       * notifications.
> >        */
> >+      void (*default_data_ready)(struct sock *sk);
> >       void (*default_write_space)(struct sock *sk);
> >
> >       /* Protected by lock_sock(sk) */
> >diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> >index fe7f49da6c4bc..f40659ec29df0 100644
> >--- a/net/vmw_vsock/af_vsock.c
> >+++ b/net/vmw_vsock/af_vsock.c
> >@@ -958,6 +958,7 @@ static struct sock *__vsock_create(struct net *net,
> >               sk->sk_type = type;
> >
> >       vsk = vsock_sk(sk);
> >+      vsk->default_data_ready = sk->sk_data_ready;
> >       vsk->default_write_space = sk->sk_write_space;
> >       vsock_addr_init(&vsk->local_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
> >       vsock_addr_init(&vsk->remote_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
> >diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> >index f4b5f0230493e..8b62b789b71c5 100644
> >--- a/net/vmw_vsock/virtio_transport_common.c
> >+++ b/net/vmw_vsock/virtio_transport_common.c
> >@@ -1588,7 +1588,8 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
> >
> > static int
> > virtio_transport_recv_connected(struct sock *sk,
> >-                              struct sk_buff *skb)
> >+                              struct sk_buff *skb,
> >+                              bool *data_ready_pending)
> > {
> >       struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> >       struct vsock_sock *vsk = vsock_sk(sk);
> >@@ -1607,7 +1608,13 @@ virtio_transport_recv_connected(struct sock *sk,
> >                       vsock_remove_sock(vsk);
> >                       break;
> >               }
> >-              vsock_data_ready(sk);
> >+              if (!data_ready_pending) {
> >+                      vsock_data_ready(sk);
> >+              } else if (!*data_ready_pending &&
> >+                         (vsock_stream_has_data(vsk) >= sk->sk_rcvlowat ||
> >+                          sock_flag(sk, SOCK_DONE))) {
> >+                      *data_ready_pending = true;
> >+              }
> >               return err;
> >       case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
> >               virtio_transport_send_credit_update(vsk);
> >@@ -1820,6 +1827,7 @@ virtio_transport_recv_pkt_batchable(struct virtio_transport *t,
> >       return sk->sk_state == TCP_ESTABLISHED &&
> >              sk->sk_type == SOCK_STREAM &&
> >              READ_ONCE(sk->sk_prot) == sk->sk_prot_creator &&
> >+             READ_ONCE(sk->sk_data_ready) == vsk->default_data_ready &&
> >              READ_ONCE(sk->sk_write_space) == vsk->default_write_space &&
> >              !sock_flag(sk, SOCK_DONE) &&
> >              vsk->transport == &t->transport &&
> >@@ -1830,8 +1838,9 @@ virtio_transport_recv_pkt_batchable(struct virtio_transport *t,
> > /*
> >  * The caller holds sk's socket lock.  Set @batchable if the socket can remain
> >  * locked for another ordinary STREAM/RW packet.  When @batch is non-NULL,
> >- * record a default write-space notification for batch finish instead of
> >- * delivering it immediately.  Return true if the caller must free @skb.
> >+ * record default write-space and data-ready notifications for batch finish
> >+ * instead of delivering them immediately.  Return true if the caller must
> >+ * free @skb.
> >  */
> > static bool
> > virtio_transport_recv_pkt_locked(struct virtio_transport *t,
> >@@ -1883,7 +1892,9 @@ virtio_transport_recv_pkt_locked(struct virtio_transport *t,
> >               kfree_skb(skb);
> >               break;
> >       case TCP_ESTABLISHED:
> >-              virtio_transport_recv_connected(sk, skb);
> >+              virtio_transport_recv_connected(sk, skb,
> >+                                              batch ?
> >+                                              &batch->data_ready_pending : NULL);
> >               break;
> >       case TCP_CLOSING:
> >               virtio_transport_recv_disconnecting(sk, skb);
> >@@ -1957,27 +1968,33 @@ EXPORT_SYMBOL_GPL(virtio_transport_recv_pkt);
> > /*
> >  * Finish the RX batch.
> >  * For a non-empty batch, the caller holds the socket lock acquired with
> >- * lock_sock(). Deliver any deferred write-space notification while the lock
> >- * is held, then release the lock and the batch's lookup reference.
> >- * An empty batch is a no-op.
> >+ * lock_sock(). Release the lock, deliver any deferred write-space and
> >+ * data-ready notifications in that order, then drop the batch's lookup
> >+ * reference. An empty batch is a no-op.
> >  */
> > void virtio_transport_rx_batch_finish(struct virtio_transport_rx_batch *batch)
> > {
> >       bool write_space_pending = batch->write_space_pending;
> >+      bool data_ready_pending = batch->data_ready_pending;
> >       struct sock *sk = batch->sk;
> >
> >       batch->sk = NULL;
> >       batch->pkts = 0;
> >       batch->bytes = 0;
> >       batch->write_space_pending = false;
> >+      batch->data_ready_pending = false;
> >
> >       if (!sk)
> >               return;
> >
> >+      release_sock(sk);
> >+
>
> Why in the previous patch we release the socket after calling
> default_write_space() and now we are moving before?
>

My intention was to keep the two behavioral changes separately
testable. Patch 3 is a complete intermediate state: it coalesces
repeated sk_write_space()
notifications while preserving the existing under-lock callback
context. Patch 4 then adds data-ready coalescing and moves both
deferred notifications
after release_sock(). Patch 4 therefore builds on Patch 3 rather than fixing it.

> >       if (write_space_pending)
> >               vsock_sk(sk)->default_write_space(sk);
> >
> >-      release_sock(sk);
> >+      if (data_ready_pending)
> >+              vsock_sk(sk)->default_data_ready(sk);
> >+
> >       sock_put(sk);
> > }
> > EXPORT_SYMBOL_GPL(virtio_transport_rx_batch_finish);
> >--
> >2.53.0
> >
>
