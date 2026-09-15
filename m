Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974443AFCF4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487239; cv=none; b=KmrWwJwDxxAVR42/dCfYJsYyAP6op4AZ0Kq1tefV38g+fj6drTZQqcTssAufMfyZfZR83uyZ8jFo/YJT+J6A9YTTldahDS+ucruVukITSCFB1o1Hy46NzrmrzyV4HcgoX4SCUDEN33wgA+atnZiRvx9HSWp8OUy8QDumip3h9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487239; c=relaxed/simple;
	bh=8MNWOZVbUM9+qIbH/qe53BIN87Z+DiijyIQXccjKz0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOYpWf3K1deYD8FuqNGZJGltzr9HIRqsAvY4eDrtTzyYMvwACnIYYIC4VfI0bFi19O+ohXjS+J9Fu4HcoUthF3w74+NEsOtNjYgwRYK8LsB70WobgNRXy0ZxuZbB0lbl2ymU458Awqb6sJdFfm68ikYT6xHBw7F2w4JeFBTXSx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFq6Wa1C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pe5AqwX5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFq6Wa1C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pe5AqwX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789487232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BBSTiFiICLW/KYf65rwgeCPALG3azRBCohXrrfoupYc=;
	b=FFq6Wa1C9QoUrGEONZR/8xu6edRk4w1rzsU1K4Q1inaBTN20E7DhkttFF4Q7QGx6OTzJ+t
	qyyWdLaMrI1P3/22m3cA3DvvXI/ClRGFHmpXfECOJ8QwIsB8nS99gS5E10IqWIolWlTRMu
	MJMce5d0eg9X6NXX0mtZV6fpWmRjukM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-sPdi8xDjOJCixhRMzB1YZw-1; Tue, 15 Sep 2026 11:47:10 -0400
X-MC-Unique: sPdi8xDjOJCixhRMzB1YZw-1
X-Mimecast-MFC-AGG-ID: sPdi8xDjOJCixhRMzB1YZw_1789487229
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so34747145e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789487229; x=1790092029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBSTiFiICLW/KYf65rwgeCPALG3azRBCohXrrfoupYc=;
        b=Pe5AqwX5dlJipFc3223AWSKxxmKaPKm2FkdolAL3qcxYge5Xgr1zgwz0VNdzx+PSDi
         IMl5e2q4I90AMyB+oVnLHVk9UFuejosjajEbNLUV//eYrtLYIjKjUF3jeUlk5XcV/NPl
         XtZS1cltelWfK8QX3PyfUd+N4Bca4GMoauTGZamczUgprlYmXNCDftySN5wC0XeVSM3F
         46I8Wu28XRLvevNhmZgOwsBqM7afDzfmoddb2vvhFbMujAGCpHvRTQTyj9jqa5dNO6mM
         94I+vzMZDNhyG6LikDD7+mLUTVp+A8xCq43XaD2Tycn7pUnQ4K/DKtpo4auqd0YOprKQ
         t2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487229; x=1790092029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBSTiFiICLW/KYf65rwgeCPALG3azRBCohXrrfoupYc=;
        b=RNYCL7RNWX/cW4MaAI9ZdXC9e6IA305taptk9G/Wwf6DVqgtAZK/65Bbkjm6HtPOcM
         7tG8XzsSH9nqtWffsYi7A7FqVGl2YwTbOxtDRdL3PLsQh6HDtMF2vpFSRSNp46xP+v01
         gubpEmzF4t2VBEgTvIW6X84O31eW1HTrO+3ym3cIuOnVipjdc1qIK7Zf8qTnlE0xzUZJ
         YLjl/LDX2M+gYaMnan2Mt5B+rmBRfkwpOjVAIsbdiohlD1BwDEqOSokuSo6xWcn3Sn+N
         9oRJ0m2whyLa4IzJhZhWVk9JXwMQtWBgrpok/oGWc0SJB7MJCMWOZyZt0hII6ChFCiQc
         KrrA==
X-Forwarded-Encrypted: i=1; AKwUvBwzUWCokbJU41oNVErnVMae6Sl5+5FGhembRo2cfqcUiC1pIiE3JqpLty3mOMFe4ckpeQH/SheWDB1G3p8=@vger.kernel.org
X-Gm-Message-State: AFuF++n7TwXgqDVk0IfwSUKIM/75gr2YnOjcoIz0n9TehPC+fsLWJYDz
	JqUA7dMlF+wQxTZUwvsPyrnNW416FBO4q7fj0jh1PrVVhqESWdI7ivldDkQVT4xQQMuzEolbwnd
	wRTB+828jubj1uJoBSMAxW0f9pEn1+9/Ub2fJhSIS8r59HemL9nI6gtgNq288StuLMw==
X-Gm-Gg: AYBFou0IdKHQSsm4zIWfpgv5Qd6/KmQTY7Jer5NUEsgP44C1IhjyZSsMnOjgt/6WrR8
	v67thItOOBUMnxOSGvlYg1XPz/pXmFarahkVAhE2OAeVI2F5YkXjRjXf0eySJIqIObuCGROwklQ
	B0RC3u1HY8AeG7l87kuIVhZYmXmyncaxUEPGasTbDz3tnaXOFKPVAMFbO+ooucB+iorPm34xurm
	gDzkihjyuA0QxH35v5iFMEP12WdxS3W59e/mqV6sTuT+pha7dY/6pN2QRivRLwE5mBKfCy+VAMf
	iHTyKT/Rk/GHjpWK12QxOBj9BNvMInxW067VN7DGd1sEYYezve1RS2wUdNoCnB273ZfAdQZrAaI
	dWyzeUoVS4GTDQINNFFThQMV2Sw+8gB10zQXwnR92bMMSOw==
X-Received: by 2002:a05:600c:19cb:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49e7a6692afmr89061555e9.8.1789487229312;
        Tue, 15 Sep 2026 08:47:09 -0700 (PDT)
X-Received: by 2002:a05:600c:19cb:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49e7a6692afmr89060745e9.8.1789487228579;
        Tue, 15 Sep 2026 08:47:08 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d23b7e7sm52958155e9.1.2026.09.15.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:47:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:47:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/6] vsock/virtio: support guest device network
 namespace
Message-ID: <aqlkWGyoUYrgQUzz@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-3-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902-vsock-guest-ns-v1-3-9995383e9a8b@meta.com>

On Wed, Sep 02, 2026 at 04:00:49PM -0700, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>virtio-vsock did not have namespace support (the device was always
>accessible to any global namespace).
>
>Make the virtio-vsock device assignable to a namespace and initialize it
>to init_net. Because virtio-vsock and init_net are both hardcoded to
>global mode, nothing changes until the assign ioctl is issued.
>
>When the device's local-mode namespace is being destroyed, received
>packets are reset until new valid a namespace has been assigned and/or
>automatically returned to, and the next RX batch begins (in
>virtio_transport_rx_work). They are reset rather than dropped because
>vsock does not retransmit, so a silent drop would leave the host waiting
>for a timeout, and a connection request arriving in that window has no
>socket whose teardown would tell it otherwise. This requires making
>virtio_transport_reset_no_sock() available outside of the common code.
>
>When a device is assigned to a namespace, every already established
>vsock socket that is no longer able to reach the device is forcibly
>reset. For that reason, adding new sockets to the connected table must
>be performed atomically with regards to namespace assignment. This
>ensures that when the socket is added to the connected table that it
>actually passes the new reachability conditions set by ns assignment. If
>it wins the race to the table and does NOT pass the reachability tests,
>then the reset sweep will correctly catch it. This is the purpose
>of the new helper 'vsock_maybe_set_connected()'.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> include/linux/virtio_vsock.h            |  2 ++
> net/vmw_vsock/virtio_transport.c        | 28 ++++++++++++++++++++++------
> net/vmw_vsock/virtio_transport_common.c | 28 +++++++++++++++++++++-------
> 3 files changed, 45 insertions(+), 13 deletions(-)
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index f91704731057..9c68ce1d7fb4 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -286,6 +286,8 @@ void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *
> u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
> void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
> void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
>+int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>+				   struct sk_buff *skb, struct net *net);
> int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
> int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
> int virtio_transport_notify_set_rcvlowat(struct vsock_sock *vsk, int val);
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4f9aa9c4c3aa..a453a4f828dc 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -540,9 +540,14 @@ static bool virtio_transport_msgzerocopy_allow(void)
> 	return true;
> }
>
>+static bool virtio_transport_netns_assign_allow(void)
>+{
>+	return true;
>+}
>+
> bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
> {
>-	return vsock_net_mode_global(vsk);
>+	return vsock_g2h_net_reachable(sock_net(sk_vsock(vsk)));
> }
>
> static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
>@@ -587,6 +592,7 @@ static struct virtio_transport virtio_transport = {
> 		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
>
> 		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
>+		.netns_assign_allow       = virtio_transport_netns_assign_allow,
>
> 		.notify_poll_in           = virtio_transport_notify_poll_in,
> 		.notify_poll_out          = virtio_transport_notify_poll_out,
>@@ -616,7 +622,7 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
> 	struct virtio_vsock *vsock;
> 	bool seqpacket_allow;
>
>-	if (!vsock_net_mode_global(vsk))
>+	if (!vsock_g2h_net_reachable(sock_net(sk_vsock(vsk))))
> 		return false;
>
> 	seqpacket_allow = false;
>@@ -634,6 +640,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 	struct virtio_vsock *vsock =
> 		container_of(work, struct virtio_vsock, rx_work);
> 	struct virtqueue *vq;
>+	struct net *net;
>+
>+	net = vsock_g2h_net_get();
>
> 	mutex_lock(&vsock->rx_lock);
>
>@@ -682,10 +691,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
>
> 			virtio_transport_deliver_tap_pkt(skb);
>
>-			/* Force virtio-transport into global mode since it
>-			 * does not yet support local-mode namespacing.
>-			 */
>-			virtio_transport_recv_pkt(&virtio_transport, skb, NULL);
>+			if (unlikely(!net)) {
>+				virtio_transport_reset_no_sock(
>+					&virtio_transport, skb, &init_net);

Why init_net?

>+				kfree_skb(skb);
>+				continue;
>+			}
>+
>+			virtio_transport_recv_pkt(&virtio_transport, skb, net);
> 		}
> 	} while (!virtqueue_enable_cb(vq));
>
>@@ -694,6 +707,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 		virtio_vsock_rx_fill(vsock);
> out_nofill:
> 	mutex_unlock(&vsock->rx_lock);
>+
>+	if (net)
>+		put_net(net);

put_net() should handle NULL net, right?

> }
>
> static int virtio_vsock_vqs_init(struct virtio_vsock *vsock)
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 88df82364f77..313ef263fd2d 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1315,8 +1315,8 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
>  * loopback, this is the namespace of the socket. For vhost, this is the
>  * namespace of the VM (i.e., vhost_vsock).
>  */
>-static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>-					  struct sk_buff *skb, struct net *net)
>+int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>+				   struct sk_buff *skb, struct net *net)
> {
> 	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> 	struct virtio_vsock_pkt_info info = {
>@@ -1355,6 +1355,7 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>
> 	return t->send_pkt(reply, net);
> }
>+EXPORT_SYMBOL_GPL(virtio_transport_reset_no_sock);
>
> /* This function should be called with sk_lock held and SOCK_DONE set */
> static void virtio_transport_remove_sock(struct vsock_sock *vsk)
>@@ -1478,9 +1479,14 @@ virtio_transport_recv_connecting(struct sock *sk,
>
> 	switch (le16_to_cpu(hdr->op)) {
> 	case VIRTIO_VSOCK_OP_RESPONSE:
>-		sk->sk_state = TCP_ESTABLISHED;
>+		/* An assign cannot see a socket that is not connected yet. */
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
>@@ -1736,8 +1742,6 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
>
> 	lock_sock_nested(child, SINGLE_DEPTH_NESTING);
>
>-	child->sk_state = TCP_ESTABLISHED;
>-
> 	vchild = vsock_sk(child);
> 	vsock_addr_init(&vchild->local_addr, le64_to_cpu(hdr->dst_cid),
> 			le32_to_cpu(hdr->dst_port));
>@@ -1758,7 +1762,17 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
> 	if (virtio_transport_space_update(child, skb))
> 		child->sk_write_space(child);
>
>-	vsock_insert_connected(vchild);
>+	/* An assign cannot see a socket that is not connected yet, and the
>+	 * check in vsock_assign_transport() above has since dropped
>+	 * vsock_register_mutex.
>+	 */
>+	if (!vsock_maybe_set_connected(vchild)) {
>+		release_sock(child);
>+		virtio_transport_reset_no_sock(t, skb, sock_net(sk));
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

