Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602248;
	b=xi7YIGSrA3/LT9RceNkch8zMFv3HGxQY0xNeKyKRf0gVKTsxmztH83z1asHHudGyJeZL
	 4exlOCe/yBuRz+RukQ63mxb+4zKHv9acip7AFQDLzD18eAkEeZAjGde/2vDsrqbUJwVEi
	 q+jWzv/UDKfWspZDVdeffxifkyytczv1C8MbXDAg5g/TnvuwgfCsv5wUIaMIST6coGuEI
	 pm2+Ejjuu5tCIywNv+Ci8NVIkWCi6maO0Ps3hSysiKFNyt5Blw+vw8Rcz1MrqQoE/5MQb
	 Td13ex0ApJNtBXKhuugAz8f/qS80DapDfPhBR79261Dex+0STcK5e0ctDFvVFZQMVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602248;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qofc/C3ulxNQPffK4mS2418qbHbzkMfHjhjhVdFF1AY=;
	b=f5zgIgtVyI/lusdcG4szQO9UI9FFFGNjjpApb8BOOSj/RkMxDbB7S+zUxxk1Ta7yIKXM
	 hbLj3ppl/DUKvcdn2WGTfXelvUZYFluSPbeMTHHNtlnRDAoxFqKfP4XUoruTa20VpdKYT
	 l5N+yvRQeBDBaO0jX0Ab/4KnBNckWcA0nrlXIIqlG5Z58EUl3+fEjkslo0Dfl6v2yiISa
	 KUvl5jHk8ejFylnfSX7DU/lsjCAM5l5P0yVu47lCrOQM0OoBGqJiXQ7yFx2AfnD2ibawZ
	 0D8YP1seFXv0bBctNWNIrXfyxAz/dIgep1YqN9cLVVHZFatu1lt0fibD7IGOOZxpkKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsttbSeQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ev15ecuS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5434606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5434606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsttbSeQ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ev15ecuS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792602247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qofc/C3ulxNQPffK4mS2418qbHbzkMfHjhjhVdFF1AY=;
	b=NsttbSeQialear4n2QwpqftILY2gYJNS4pQ4iHlPGpfB7buZTjLPpQkMv8fB4BPRS14eEd
	+KWNzdw5iRl5zY1oqwNti1cnZSL5Xdq1N9qrrOU3qKKd7b0cYds0WiX/La3GF1MyHjYGWS
	wsALsIgGevM5kcb/jo1PFzB502/0eYQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-A0zL9VcvO_2tmREpD-u1qA-1; Wed, 21 Oct 2026 17:04:05 +0000
X-MC-Unique: A0zL9VcvO_2tmREpD-u1qA-1
X-Mimecast-MFC-AGG-ID: A0zL9VcvO_2tmREpD-u1qA_1792602244
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dff112136so677635f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792602244; x=1793207044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qofc/C3ulxNQPffK4mS2418qbHbzkMfHjhjhVdFF1AY=;
        b=Ev15ecuSDBQIpfU30tw3kVnKUZ8wKo2z/jxmtv40Shaw6vlWGs+ABOt5h4N+oafAiA
         Rx82URgokALhp1LQFylA7CzLn+J1arpjVuKF2HPy4d0RQhNsuIO5SSfg1VpP8FrlJJrY
         tFRHaVx2ZaKGnowmNQfcJm8VtPjTjdatvneJQXHkuq0+QlMQvh5XPmC/AHkG0+nXBulH
         Yi5R0iqHnBNz6NV7MpJMnj1Dcf7vBs884YrC8ULNUImBDhcuMp7RfnPtpedCE3II3LZP
         R2cdOFOWGTEJ0CCbOsr4d4C0LZZWXO45nv1L2J4RMjV8zRZHQiqGCgHs1t7myGzueOTf
         +YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602244; x=1793207044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qofc/C3ulxNQPffK4mS2418qbHbzkMfHjhjhVdFF1AY=;
        b=MNno6C/scDoSxwJtFv10Uouxfon5GDlh6qC3OVSSFohLvYVIagmLHzHUThJJ19X3nh
         Nf5iCc/fPI0Chuo0Fv3F550ixyVqNE8ZnMoodRwrRwtYLpPeTWRqKYIYdQC1yJLuLL4A
         WwpGB830OqyvkjXwsrdwhN2YC/hupr7wghFb7UfXaDugdNf9CCJj6ALWo22I6DDrKGoZ
         ady908N30efQPwEFPfS4u+zwrH5IVhjrNt0erNxF6fnczz95OOVYk/DzDo5FF6g6xhpg
         N2mAUflNt+naPTZOQBz1j2sQGBgUJFauzCx7WlXuMIfAcPBho3iErRUck7OoPkvdg7yn
         GViQ==
X-Forwarded-Encrypted: i=1; AKwUvBykpUsxGF1zNB4rhUu6WjKd0uJSkhGuYtBe7KmtZ+NRT5aGWUc+QDyX1veGajnYNHDapF8rIrBp2GAbcYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHtOGW7rxDDJbEOftIx6jegp/WIioWxs5N0BHN0PGjNokXi1LR
	joSQJ9liIGO7oe8g4tHs/TjsdU9RcekX5WilHEIrNXlbJ/8EPgWvH8b3WNWjsuMhMpGFQBajAB3
	V6EFppcx6LmgSHLDigvcl9QW1+oDzvLUbQEHTyLxNGu0yXPznb50o2pRmYxdRaxIiCg==
X-Gm-Gg: AYBFou2osgicUmxQeAFNfcMoowgShY8ueDlMGUDr4sIZr4U/haYT2nyqSNTwoaUc79P
	41swEHLLnRNBAFYlHdXiMQFdpV44FVrEbDeFpGeie5WSqGFL+ZS1puXVZQpY+NEpDjTM8dU68CG
	9/QFf5gTRwS32Mz9aTHjFKzwj++VGE/JwbjfTefxIkSV3OLNwWKtPA+mSz7OA1xQa9nbsRsbYLs
	QfPDJDM8t9MEMKUi1mXZQSZE7RCMj+vGYR3t95KXK2TS3H9AH5wpLrymOqhE4c953Fa+HxAF8yw
	owz3SeEGlRNJx+3X6nLDeAOznFh8RuBCMwN8X+P+ZN8JeyJqiUWP/erddPOHNs3d4EYonFjXqyn
	XHN9G1w==
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr60550925e9.12.1792602244038;
        Wed, 21 Oct 2026 10:04:04 -0700 (PDT)
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr60550105e9.12.1792602243508;
        Wed, 21 Oct 2026 10:04:03 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.143.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a350b0sm6349215e9.9.2026.10.21.10.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:04:02 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:03:42 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 5/7] vsock/virtio: support guest device
 network namespace
Message-ID: <atjvzn-zPYJjLAhy@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-5-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-5-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:08PM -0700, Bobby Eshleman wrote:
>virtio-vsock did not have namespace support (the device was always
>accessible to any global namespace).
>
>Make the virtio-vsock device assignable to a namespace and initialize it
>to init_net. Because virtio-vsock and init_net are both hardcoded to
>global mode, nothing changes until the assign command is issued.
>
>An assign can land while virtio_transport_rx_work() is draining a
>batch, so the assigned namespace is re-read per packet rather than once
>per batch. Matching the rest of the batch against the namespace the
>device has left would reset connections that belong to the new one.
>
>When a device is assigned to a namespace, every already established
>vsock socket that is no longer able to reach the device is forcibly
>closed. For that reason, adding new sockets to the connected table must
>be performed atomically with regards to namespace assignment. This
>ensures that when the socket is added to the connected table that it
>actually passes the new reachability conditions set by ns assignment. If
>it wins the race to the table and does NOT pass the reachability tests,
>then it will be reset. This is the purpose of the new helper
>'vsock_maybe_set_connected()'.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Changes in v4:
>- Drop packets in virtio_transport_send_pkt() from a netns that cannot
>  reach the device, e.g. shutdown() or credit updates on a swept socket
>  (Sashiko)
>
>Changes in v3:
>- Re-read the assigned netns per packet in virtio_transport_rx_work()
>  rather than once per batch, so a mid-batch assign cannot reset the new
>  namespace's connections (Sashiko)
>- Drop the NULL netns reset in virtio_transport_rx_work(), the assigned
>  netns is now pinned
>- Drop the .reset op and the virtio_transport_reset{,_no_sock}() exports,
>  the sweep no longer sends a RST (Sashiko)
>
>Changes in v2:
>- Export virtio_transport_reset(), wire it to the new .reset op (Stefano)
>- netns_assign_allow is now a bool (Stefano)
>- Pass NULL, not &init_net, in virtio_transport_rx_work(), and
>  comment why (Stefano)
>- Drop the if (net) guard around put_net() (Stefano)
>- Drop the comments at the vsock_maybe_set_connected() call sites,
>  the commit msg seems sufficient
>---
> net/vmw_vsock/virtio_transport.c        | 32 +++++++++++++++++++++++++++-----
> net/vmw_vsock/virtio_transport_common.c | 18 +++++++++++++-----
> 2 files changed, 40 insertions(+), 10 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index eced6929405d..06df82b130cf 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -256,6 +256,15 @@ virtio_transport_send_pkt(struct sk_buff *skb, struct net *net)
> 		goto out_rcu;
> 	}
>
>+	/* A socket reset by an assign can still send credit updates from
>+	 * recvmsg() and setsockopt(SO_RCVLOWAT).
>+	 */
>+	if (!vsock_g2h_net_reachable(net)) {
>+		kfree_skb(skb);
>+		len = -ENETUNREACH;
>+		goto out_rcu;
>+	}
>+
> 	/* If send_pkt_queue is empty, we can safely bypass this queue
> 	 * because packet order is maintained and (try) to put the packet
> 	 * on the virtqueue using virtio_transport_send_skb_fast_path.
>@@ -542,7 +551,7 @@ static bool virtio_transport_msgzerocopy_allow(void)
>
> bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
> {
>-	return vsock_net_mode_global(vsk);
>+	return vsock_g2h_net_reachable(sock_net(sk_vsock(vsk)));
> }
>
> static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
>@@ -587,6 +596,7 @@ static struct virtio_transport virtio_transport = {
> 		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
>
> 		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
>+		.netns_assign_allow       = true,
>
> 		.notify_poll_in           = virtio_transport_notify_poll_in,
> 		.notify_poll_out          = virtio_transport_notify_poll_out,
>@@ -616,7 +626,7 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
> 	struct virtio_vsock *vsock;
> 	bool seqpacket_allow;
>
>-	if (!vsock_net_mode_global(vsk))
>+	if (!vsock_g2h_net_reachable(sock_net(sk_vsock(vsk))))
> 		return false;
>
> 	seqpacket_allow = false;
>@@ -633,7 +643,12 @@ static void virtio_transport_rx_work(struct work_struct *work)
> {
> 	struct virtio_vsock *vsock =
> 		container_of(work, struct virtio_vsock, rx_work);
>+	struct virtio_transport *t = &virtio_transport;
>+	netns_tracker ns_tracker;
> 	struct virtqueue *vq;
>+	struct net *net;
>+
>+	net = vsock_g2h_net_get(&ns_tracker);
>
> 	mutex_lock(&vsock->rx_lock);
>
>@@ -682,10 +697,15 @@ static void virtio_transport_rx_work(struct work_struct *work)
>
> 			virtio_transport_deliver_tap_pkt(skb);
>
>-			/* Force virtio-transport into global mode since it
>-			 * does not yet support local-mode namespacing.
>+			/* Only grab a reference if the net changes underneath
>+			 * us.
> 			 */
>-			virtio_transport_recv_pkt(&virtio_transport, skb, NULL);
>+			if (unlikely(!vsock_g2h_net_eq(net))) {
>+				put_net_track(net, &ns_tracker);
>+				net = vsock_g2h_net_get(&ns_tracker);
>+			}
>+
>+			virtio_transport_recv_pkt(t, skb, net);
> 		}
> 	} while (!virtqueue_enable_cb(vq));
>
>@@ -694,6 +714,8 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 		virtio_vsock_rx_fill(vsock);
> out_nofill:
> 	mutex_unlock(&vsock->rx_lock);
>+
>+	put_net_track(net, &ns_tracker);
> }
>
> static int virtio_vsock_vqs_init(struct virtio_vsock *vsock)
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 1e762a480df4..0c864db2bc65 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1478,9 +1478,13 @@ virtio_transport_recv_connecting(struct sock *sk,
>
> 	switch (le16_to_cpu(hdr->op)) {
> 	case VIRTIO_VSOCK_OP_RESPONSE:
>-		sk->sk_state = TCP_ESTABLISHED;
>+		if (!vsock_maybe_set_connected(vsk)) {
>+			skerr = ECONNRESET;
>+			err = -ENETUNREACH;
>+			goto destroy;
>+		}
>+
> 		sk->sk_socket->state = SS_CONNECTED;
>-		vsock_insert_connected(vsk);
> 		sk->sk_state_change(sk);
> 		break;
> 	case VIRTIO_VSOCK_OP_INVALID:
>@@ -1736,8 +1740,6 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
>
> 	lock_sock_nested(child, SINGLE_DEPTH_NESTING);
>
>-	child->sk_state = TCP_ESTABLISHED;
>-
> 	vchild = vsock_sk(child);
> 	vsock_addr_init(&vchild->local_addr, le64_to_cpu(hdr->dst_cid),
> 			le32_to_cpu(hdr->dst_port));
>@@ -1758,7 +1760,13 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
> 	if (virtio_transport_space_update(child, skb))
> 		child->sk_write_space(child);
>
>-	vsock_insert_connected(vchild);
>+	if (!vsock_maybe_set_connected(vchild)) {
>+		release_sock(child);
>+		virtio_transport_reset_no_sock(t, skb, sock_net(sk));

We might be facing the same issue here that we were discussing a few 
days ago in another patch.

I mean, is it correct to send the reset to `sock_net(sk)`?
Or should we use the one of the sender?

Thanks,
Stefano

>+		sock_put(child);
>+		return -ENETUNREACH;
>+	}
>+
> 	vsock_enqueue_accept(sk, child);
> 	virtio_transport_send_response(vchild, skb);
>
>
>-- 
>2.53.0-Meta
>

