Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493334;
	b=tnVNlkh3+YMFATNB1URaCN0NOsfX6feTt7gJOnYkqNs6x4RJ4m2eQQxFP+F/zKOMd83B
	 nnMr5sbjrsOuszoii67o3dSSytSmMHYBO5r00GXCoY/kY+2erexqQ2FyWb0rgg1ox+MhF
	 i14l0YzkjH28ix45fHTdR075CjCa4WhuMmvaEOgmV3UhWfwVajV6M2armu2MrKtFn1dMx
	 SWuZCZxjSAs+a9Kxpe9vUhsguybzmUsZ3b80/uZSNUFy2BeZBB7TnipVU5st17Tk8ZHJI
	 bKnuSFShR6JnU0XQL+t2EifcsMsMHWvZ4dXyRobZw0lVkcyd109IPfX8UU0o07GrtOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493334;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q5ycgM6KpIgl8GosUfIZQ6wJ8AxoFNABYsI2jhCC9jo=;
	b=KCBaLfYzJtBCcPkNRjtnCU3dxCRuuaXioFx6JQJTvxNy1n+oNvYjIbvYkZ/GyZCFDL3x
	 7ICBkdXcWlERi7hjB2aP7wVm0OvLNtuPkj7a84mk5synafv2cvZOMQRG568Eq1KHbvTqk
	 5OC3Jb/gDrlj4Nfq1qNarzmDD/lqcKru7cHvA0cLQwBI0MJurCVJ8eTBxGdLS2L9P0lZO
	 xIAJx7+BQLlIzYJA70fUCEFjF7TjZevMaPMhfdChdN2wQPnDGoqt5/PvXReVH8IFX3Fs1
	 DUadACKWKV3GXJOlfOwKSwGXwMBLwWTXNthpe8WGo36ri0NbN/iWJvmvI01NLospSCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XPQ5ehng;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PqIaq6tp;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE12B606D56F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE12B606D56F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XPQ5ehng;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PqIaq6tp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794493333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q5ycgM6KpIgl8GosUfIZQ6wJ8AxoFNABYsI2jhCC9jo=;
	b=XPQ5ehngwUs98qcMvC29CzVPYCf57n6bPjE+GYYGQHNG2EBN0+utuP8cVMhAzN4roc6LYW
	Ha2jvFlyfeASW+LCHEEYTZzwDbsZEX/oLBNjhwJY9KqaBSyGVDYa6K1ZlK83ck6j+jDM73
	pmcVF3e52m3bLNPgrU3e224N627hY2g=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-F067Z-brPxuXaLNiOIK3Og-1; Thu, 12 Nov 2026 09:22:11 -0500
X-MC-Unique: F067Z-brPxuXaLNiOIK3Og-1
X-Mimecast-MFC-AGG-ID: F067Z-brPxuXaLNiOIK3Og_1794493331
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so5821957b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794493331; x=1795098131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5ycgM6KpIgl8GosUfIZQ6wJ8AxoFNABYsI2jhCC9jo=;
        b=PqIaq6tpC3qulR4Jy7cYgsLAsKcRKjTfd+W1Zx/p92JVotlZkNLwJOjvEXnB2U/9hh
         aEM4/hvy4HCjf6aatFLi0NjUjD+R9TaMzZlqjQ1pqv8x375HgB/q1ttcZAPJgjPxQAOo
         hLl8KuBqTu/Bm7P/POJMrXnu9OsA1i0ukxm6EuPox763QDa3wzazZOvJV5FJah0tsvOg
         c4DtdIxFVsSeMrHUlrqLjAjVoEshb/woPzb14frNfnJx872mITsv3cqXRRXvyTBImpxh
         IDOVklDCjjyB1NeGDr5os4/s2mwdAQi5BJ+/C5C5IwL4NjDjYF/ZS+dg5ByCiBQjbd+W
         FRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493331; x=1795098131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5ycgM6KpIgl8GosUfIZQ6wJ8AxoFNABYsI2jhCC9jo=;
        b=eqAT1iudDQN4KyGpsyRcAY+IVdMqeIUooxfjgkl5isN7wrCA0Xt6r4YpecNDkmb24K
         bA9bKT++MZCcSFTju583/WV9SAj/QXbPYqf7bRtaf4DwOxrTBtknWMr0tamL0D4oxUP2
         FyZlfC4kLyV6PfmcZrcIZBRt0AD5tJ0bRsKpG/rtKNWVsT1vQ2Bi5xi54WpkIJvjh7fU
         kLG9e4oNeFiepROPJUoW6SsNm3J3Hy1ikxz8qOGf/or8f67lHRn1SOH/OoViUypDxprD
         vnXA5Y98bSL0LPi3lPtDTbAmhaJ0Jjz2kJy72oAX9OBSRVolkMBGZV/iI4aq3OTgOYpM
         TvMw==
X-Forwarded-Encrypted: i=1; AL+hErFSpZkxP2RERwe2uX/z068bNqVeIBY0X8WiqQv/jI4a90PRHfv0JO+9W6p/XWTMScDrERL3OGr3k0lbeBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hijTAkk7woSWgAdv6cNs0hFy/Be1nufbQv7ki1a2w9NHpoKHv
	GIacPtnXS53Io8IvYi1yh53/HWA/VubEzTdtJbCcCS+blH3qFKhgeU4slPPxV5l8XiOA/mQRRS8
	I7onwGise6sBl0wSRoX36epcv9sJ0ucff20o7ac0z8vNBzu7G9o9vKeC8lEqgaVl7IQ==
X-Gm-Gg: AYBFou2y74Ssq3x+/4/Hkjeu2yY6p0pp6HR5CDm5y425oSEErdapA4kuBctmJTUZcdy
	gLxOgPaU/e9DfQ1RxnK9M3GCwMhNMaOIodRRzHdQsWtmc6LNFyq0oFemBn8T4EUvMpwnULV0avb
	YatyhUi5XpsPYmrmT+9/hMH57mHwpJwQQvvW3KxGIVZlfHKipd7Pb01KrU3ve+8JQ0B4c7/h9Yg
	FIUG+1gbam+iIhdJjaPdJ/c7mQwEeTOIIpB01IqVyMaKZ5HfikrQswHECWCy7//R/4kfByDVlt3
	3KCTiyueZaf8nNicibrWt2QlXuf0+EuM2+muR7B9uzrXQnwsnWmdODnWzVctX1SW+hvRqcvMUXF
	bflZ88MPLWypY5SI4u03ZwmnUUKXk8ZoIGkKC/kgVfewXvCO4B5XM
X-Received: by 2002:a05:6808:5198:b0:4f4:9314:af39 with SMTP id 5614622812f47-56b96bd3b81mr4468301b6e.28.1794493330983;
        Thu, 12 Nov 2026 06:22:10 -0800 (PST)
X-Received: by 2002:a05:6808:5198:b0:4f4:9314:af39 with SMTP id 5614622812f47-56b96bd3b81mr4468260b6e.28.1794493329942;
        Thu, 12 Nov 2026 06:22:09 -0800 (PST)
Received: from sgarzare-redhat ([209.52.143.85])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fbc9c5sm5819481fac.9.2026.11.12.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:22:09 -0800 (PST)
Date: Thu, 12 Nov 2026 15:21:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Oleg Drokin <green@linuxhacker.ru>
Cc: stefanha@redhat.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, bobbyeshleman@meta.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] vhost/vsock: release the accounting of
 packets dropped on rx errors
Message-ID: <avXG51ibBiap9tG9@sgarzare-redhat>
References: <20261106050244.602625-1-green@linuxhacker.ru>
 <20261106050244.602625-2-green@linuxhacker.ru>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261106050244.602625-2-green@linuxhacker.ru>

On Fri, Nov 06, 2026 at 12:02:42AM -0500, Oleg Drokin wrote:
>When vhost_transport_do_send_pkt() fails to deliver a packet to the guest
>(unexpected output buffers, a buffer smaller than the header, a fault
>while copying the header or the payload) it frees the skb with
>kfree_skb() and gives up. The success path does more:
>virtio_transport_consume_skb_sent() subtracts the payload from the
>socket's bytes_unsent (SIOCOUTQ), and for a reply the queued_replies
>counter is decremented, restarting the guest's tx queue once it drops
>below the ring size.
>
>The error paths skip both. Every such drop leaves SIOCOUTQ too high for
>the life of the socket, and every dropped reply permanently takes one
>slot of the queued_replies budget, so that after a ring's worth of them
>vhost stops processing the guest's tx queue for good.
>
>Release both on the error paths, as the success path does.
>
>Found by an LLM-assisted security review of vhost-vsock, done while
>porting a project from Xen to KVM. These error paths were not
>reproduced: they need a guest that posts malformed rx buffers.
>
>Fixes: 433fc58e6bf2 ("VSOCK: Introduce vhost_vsock.ko")
>Fixes: e6ab45005772 ("vsock/virtio: add SIOCOUTQ support for all virtio based transports")

Why this Fixes tag?

>Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
>---
> drivers/vhost/vsock.c | 23 +++++++++++++++++++----
> 1 file changed, 19 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 88a310390eb0..b0004cb48999 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -104,6 +104,21 @@ static bool vhost_transport_has_remote_cid(struct 
>vsock_sock *vsk, u32 cid)
> 	return found;
> }
>
>+/* Undo the send accounting of an undelivered skb; true if tx may restart. */
>+static bool vhost_vsock_drop_skb(struct vhost_vsock *vsock, struct sk_buff *skb)
>+{
>+	bool restart_tx = false;
>+
>+	if (virtio_vsock_skb_reply(skb)) {
>+		int val = atomic_dec_return(&vsock->queued_replies);
>+
>+		restart_tx = val + 1 == vsock->vqs[VSOCK_VQ_TX].num;

Can we add a comment to explain this check?

>+	}

nit: try to follow the style, e.g. leave a blank line here.

>+	virtio_transport_consume_skb_sent(skb, false);

mmm, this entire function is very similar to the code we have in 
vhost_transport_do_send_pkt() where we also call 
virtio_transport_consume_skb_sent() but with consume=true.

What about renaming this entire function to vhost_vsock_release_skb(), 
adding a new `delivered` parameter to be passed to 
virtio_transport_consume_skb_sent() (and to be used to call or not 
kfree_skb()) ?

Thanks,
Stefano

>+	kfree_skb(skb);
>+	return restart_tx;
>+}
>+
> static void
> vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 			    struct vhost_virtqueue *vq)
>@@ -162,14 +177,14 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 		}
>
> 		if (out) {
>-			kfree_skb(skb);
>+			restart_tx |= vhost_vsock_drop_skb(vsock, skb);
> 			vq_err(vq, "Expected 0 output buffers, got %u\n", out);
> 			break;
> 		}
>
> 		iov_len = iov_length(&vq->iov[out], in);
> 		if (iov_len < sizeof(*hdr)) {
>-			kfree_skb(skb);
>+			restart_tx |= vhost_vsock_drop_skb(vsock, skb);
> 			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
> 			break;
> 		}
>@@ -212,7 +227,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>
> 		nbytes = copy_to_iter(hdr, sizeof(*hdr), &iov_iter);
> 		if (nbytes != sizeof(*hdr)) {
>-			kfree_skb(skb);
>+			restart_tx |= vhost_vsock_drop_skb(vsock, skb);
> 			vq_err(vq, "Faulted on copying pkt hdr\n");
> 			break;
> 		}
>@@ -221,7 +236,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> 					   offset,
> 					   &iov_iter,
> 					   payload_len)) {
>-			kfree_skb(skb);
>+			restart_tx |= vhost_vsock_drop_skb(vsock, skb);
> 			vq_err(vq, "Faulted on copying pkt buf\n");
> 			break;
> 		}
>-- 
>2.56.0
>

