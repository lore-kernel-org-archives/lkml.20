Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869507;
	b=a6wLHgig8CyBOk6EiRRiieutYd9V3ErkEqxoddAaeWWN98vkVutZHgW8VSa5t+YzoljA
	 8n6qAa/NT3O54ynaAGSwcKntC2x0grrB1HOtvscjVWdcH7ZLtbJs5j7Sigd3HoZzpofuY
	 fj3dZSFcojmb3v4CJKF7ZCm0cLi03DHz+G0dk67Wn65/dfwq091Y8xXEWAVGRL/zhpKUD
	 vofxbmuuMzqyUZsZBhUQnLY00K2M/lvnnu5wcPBhw7uXme/A7baxIx+/NBurHZ9AyBnnH
	 5oYkh7HR0Ko9/OSogLzCMmd6kIc3CCPQ6/sjdAaDvoI2Oow9zZ9GCTCEbUaoxZm119Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869507;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OKDdMZ8wV3aSy4GLecm7p1foBFtioFQmSifyw+llv2w=;
	b=CzLeAZV94sJcMHhZSanQgeLiIl/c3h2Lnh7efnwmHpwDIG9HDneQnJ9spScPFMmASmz1
	 MPI5dFTpmdcPWtyjll59Z0NPFTQuKkhqLESo01FCsUUjHBP8la8vZinEXfgAzCFoygLUX
	 VpBTylgm49EkaZhdgTiT/wsxAUruEe51nJCkqmAzfX9TTU8uTMuCePMFwJXRLXZ16bt8W
	 eTf2YDFZacnbV8000nvL1GDkSnEMa7vqkTtR123e2tLL9cEoA7N4YNK+5OZYhKI6CD5U+
	 z1DbrBvY1nAcg7D4jIGiZL60qdw8I7Lq5ljeVprYwJwCpyPKiK6DDuzR++MP8HrcnkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJ7y1TK0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zjkqfzi1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749C606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D749C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PJ7y1TK0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zjkqfzi1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793869506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKDdMZ8wV3aSy4GLecm7p1foBFtioFQmSifyw+llv2w=;
	b=PJ7y1TK0IYUwZMMaXDKddNJKKrR3AfDNMy81zLlyl2VUeRqo4ut3HokPgmiDa8vdhq9Tq8
	InZo1FncmgHoy8rq8QFX8CoGtkAmLFd4GyafwTWXDljwbEUEiMnI1hwl8v+XR0fOq0PAQz
	cKO2EvYQc2FTZXDulaFaQLZWHr9+yGo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-CwwHOOd6Oniww1U1Stcb_g-1; Thu, 05 Nov 2026 04:05:01 -0500
X-MC-Unique: CwwHOOd6Oniww1U1Stcb_g-1
X-Mimecast-MFC-AGG-ID: CwwHOOd6Oniww1U1Stcb_g_1793869501
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c49df8fe86eso79114266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793869500; x=1794474300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKDdMZ8wV3aSy4GLecm7p1foBFtioFQmSifyw+llv2w=;
        b=Zjkqfzi1MWta00GniQ2T3iaOq7QaWrGWHBrjm3wGbwf+Omg7xAfKv6IWRHFNWLn81C
         yoizp/7IxrrSAvhCIylo4riHR6BOmgb2dhc9emTSyjtO/7t8stsIr1ScnrSaxSmGbluR
         qZU1uhwoJsk7JaKEq3VrskbTQbJK+hpMFf2DxND9NenV7MIw7ekaxqn7G+1fRdqA/wsl
         DvWTfOm14x1vSDODySng+rZcUPuQnrTlxBa6KM+HpwOh5vB0PwyPPkHi18DndTMXzROS
         1zMgUL/MNX3vxnyyw6T3fsUtclzECAtIUWpPqHTP5AA/zmJP5SD0yOyBYacqj01xvFc/
         L3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869500; x=1794474300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKDdMZ8wV3aSy4GLecm7p1foBFtioFQmSifyw+llv2w=;
        b=icYueH50XYuXVTVkq+oDjEqGnkUXBtB1Qyc7nEZByvvAYmsE+zOdj3rot0xLgET7VD
         Ga/xIFSIN4EyGspQXlhB3UsFPvnXLDreghc8roLXrGTkuSfdEuQkVZmHqMbGGxlHeWN7
         YluhVKb5tWPX+4VheUkL7C0AQYTEm2W50NqP2erOngHWCY0FJs0ax6J9fNNuLVyp9zwU
         i8xTbv/ew5vqXPZRbA2Ex8LcLm+jhoL7DSvAqpW4hcQjV71OrsJnaVDiPe9IiT8IEF+a
         OkEVR6YQyem36QNF11w7kWHRMs1aJuVn3K1DPjjhX8ONXE31Zuz/sT/AJU63xCbOUYvy
         Rqeg==
X-Forwarded-Encrypted: i=1; AKwUvBy5H0LuNkFslpbY1TiT2zgO14Ai74YKbzilrBfx+C//RzVC9DxzsmSpZWTUYbAqPReMTkSth98WTG6hFSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/st/O/ZUywVnGfkr4OAriyNtHwoO7V6KR8zXyo5XRlN3GOsVQZ
	TQvuYCqNlRjoFpYr0sKOkDiEgaE3fBZ92wdHByZQ5zYsKB9atGSw+4BrUKxJquxJdr/y1zINA08
	aa/75RrVd9+qnjY0/enGc2tZDC6o03WlYu7SZuYWm38qwL5UZ+B2XuPWx38/Zdix2kQ==
X-Gm-Gg: AYBFou1SlIa7P4Hdy1s1BYSobLJfjgiCCTnuPZCyEvpDOkx3N39tu7LP7urnttookYD
	akk8fGs/ePJL3GheRYH1AKp2p9NBndSNSdWbups+01qd34CBFs9kAkinpNPuoIZ9pl3NR0Sxtnf
	UuzQgB5/PsTCCyWeI1ri/BbNIChHHoZB5Ts8srJkG6SgddlM57CiXnvPPOS23z9OhBlPAGSpHe7
	OQ32qr8fUnowqh/MuiU/MNInIKxXozyAhBQUPCtFNlnP+/XY8t1HB5EW79UROk1Y4I2fKPZQU4N
	eeFO98dwHQbOnsBc28XpAPo6qsvuIY4c/RHuLz2gBtHLUeBQN2caIrAdj/fH3TgFtUktuwLiZLX
	kKt7iZkJRT1Bx1BGkyjRhlYP0yuw0JgptXRmac+IYPix+9aoQNPzf
X-Received: by 2002:a17:907:86a7:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c4ca73f6a56mr1619383966b.0.1793869500493;
        Thu, 05 Nov 2026 01:05:00 -0800 (PST)
X-Received: by 2002:a17:907:86a7:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c4ca73f6a56mr1619380866b.0.1793869499953;
        Thu, 05 Nov 2026 01:04:59 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm8597436f8f.14.2026.11.05.01.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:04:58 -0800 (PST)
Date: Thu, 5 Nov 2026 10:04:49 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: netdev@vger.kernel.org, stefanha@redhat.com, bobbyeshleman@gmail.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/5] vsock/virtio: split socket lookup from
 locked RX processing
Message-ID: <auxGc7T-7vCsGWlE@sgarzare-redhat>
References: <20261103041134.33310-1-physicalmtea@gmail.com>
 <20261103041134.33310-2-physicalmtea@gmail.com>
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
In-Reply-To: <20261103041134.33310-2-physicalmtea@gmail.com>

On Tue, Nov 03, 2026 at 12:11:30PM +0800, Jia Jia wrote:
>Split virtio_transport_recv_pkt() so socket lookup is separate from
>processing that occurs while holding the socket lock. This prepares the
>receive path to retain a looked-up socket across multiple packets in a
>later change.
>
>Keep virtio_transport_recv_pkt() on its existing per-packet locking path.
>Pass the caller-provided network namespace to the locked helper so reset
>handling retains its existing semantics. Preserve source validation and
>failure handling.
>
>Signed-off-by: Jia Jia <physicalmtea@gmail.com>
>---
> net/vmw_vsock/virtio_transport_common.c | 131 ++++++++++++++----------
> 1 file changed, 78 insertions(+), 53 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index f225f53ed4bab..43325d7aebbb1 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1774,6 +1774,80 @@ static bool virtio_transport_valid_type(u16 type)
> 	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
> }
>
>+static struct sock *
>+virtio_transport_find_socket(struct sockaddr_vm *src,
>+			     struct sockaddr_vm *dst, struct net *net)
>+{
>+	struct sock *sk;
>+
>+	sk = vsock_find_connected_socket_net(src, dst, net);
>+	if (!sk)
>+		sk = vsock_find_bound_socket_net(dst, net);
>+
>+	return sk;
>+}
>+
>+/*
>+ * The caller holds sk's socket lock.
>+ */
>+static void
>+virtio_transport_recv_pkt_locked(struct virtio_transport *t,
>+				 struct sk_buff *skb, struct sock *sk,
>+				 struct net *net)
>+{
>+	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
>+	struct vsock_sock *vsk = vsock_sk(sk);
>+	struct sockaddr_vm src;
>+	bool space_available;
>+
>+	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
>+			le32_to_cpu(hdr->src_port));
>+
>+	/*
>+	 * The socket may have been closed or reassigned after lookup but before
>+	 * its socket lock was acquired. Listener sockets have no assigned
>+	 * transport.
>+	 */
>+	if (sock_flag(sk, SOCK_DONE) ||
>+	    (sk->sk_state != TCP_LISTEN &&
>+	     !vsock_check_source(vsk, &t->transport, &src))) {
>+		(void)virtio_transport_reset_no_sock(t, skb, net);
>+		kfree_skb(skb);
>+		return;
>+	}
>+
>+	space_available = virtio_transport_space_update(sk, skb);
>+
>+	/* Update CID in case it has changed after a transport reset event */
>+	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
>+		vsk->local_addr.svm_cid = le64_to_cpu(hdr->dst_cid);
>+
>+	if (space_available)
>+		sk->sk_write_space(sk);
>+
>+	switch (sk->sk_state) {
>+	case TCP_LISTEN:
>+		virtio_transport_recv_listen(sk, skb, t);
>+		kfree_skb(skb);
>+		break;
>+	case TCP_SYN_SENT:
>+		virtio_transport_recv_connecting(sk, skb);
>+		kfree_skb(skb);
>+		break;
>+	case TCP_ESTABLISHED:
>+		virtio_transport_recv_connected(sk, skb);
>+		break;
>+	case TCP_CLOSING:
>+		virtio_transport_recv_disconnecting(sk, skb);
>+		kfree_skb(skb);
>+		break;
>+	default:
>+		(void)virtio_transport_reset_no_sock(t, skb, net);
>+		kfree_skb(skb);
>+		break;
>+	}
>+}
>+
> /* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
>  * lock.
>  */
>@@ -1782,9 +1856,7 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
> {
> 	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> 	struct sockaddr_vm src, dst;
>-	struct vsock_sock *vsk;
> 	struct sock *sk;
>-	bool space_available;
>
> 	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
> 			le32_to_cpu(hdr->src_port));
>@@ -1808,13 +1880,10 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
> 	/* The socket must be in connected or bound table
> 	 * otherwise send reset back
> 	 */
>-	sk = vsock_find_connected_socket_net(&src, &dst, net);
>+	sk = virtio_transport_find_socket(&src, &dst, net);
> 	if (!sk) {
>-		sk = vsock_find_bound_socket_net(&dst, net);
>-		if (!sk) {
>-			(void)virtio_transport_reset_no_sock(t, skb, net);
>-			goto free_pkt;
>-		}
>+		(void)virtio_transport_reset_no_sock(t, skb, net);
>+		goto free_pkt;
> 	}
>
> 	if (virtio_transport_get_type(sk) != le16_to_cpu(hdr->type)) {
>@@ -1828,52 +1897,8 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
> 		goto free_pkt;
> 	}
>
>-	vsk = vsock_sk(sk);
>-
> 	lock_sock(sk);
>-
>-	/* Check if sk has been closed or assigned to another transport before
>-	 * lock_sock (note: listener sockets are not assigned to any transport)
>-	 */
>-	if (sock_flag(sk, SOCK_DONE) ||
>-	    (sk->sk_state != TCP_LISTEN &&
>-	     !vsock_check_source(vsk, &t->transport, &src))) {
>-		(void)virtio_transport_reset_no_sock(t, skb, net);
>-		release_sock(sk);
>-		sock_put(sk);
>-		goto free_pkt;
>-	}
>-
>-	space_available = virtio_transport_space_update(sk, skb);
>-
>-	/* Update CID in case it has changed after a transport reset event */
>-	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
>-		vsk->local_addr.svm_cid = dst.svm_cid;
>-
>-	if (space_available)
>-		sk->sk_write_space(sk);
>-
>-	switch (sk->sk_state) {
>-	case TCP_LISTEN:
>-		virtio_transport_recv_listen(sk, skb, t);
>-		kfree_skb(skb);
>-		break;
>-	case TCP_SYN_SENT:
>-		virtio_transport_recv_connecting(sk, skb);
>-		kfree_skb(skb);
>-		break;
>-	case TCP_ESTABLISHED:
>-		virtio_transport_recv_connected(sk, skb);
>-		break;
>-	case TCP_CLOSING:
>-		virtio_transport_recv_disconnecting(sk, skb);
>-		kfree_skb(skb);
>-		break;
>-	default:
>-		(void)virtio_transport_reset_no_sock(t, skb, net);
>-		kfree_skb(skb);
>-		break;
>-	}
>+	virtio_transport_recv_pkt_locked(t, skb, sk, net);
>

nit: if you need to resend, please remove this blank line or add a blank 
line after lock_sock().

The rest LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


> 	release_sock(sk);
>
>-- 
>2.53.0
>

