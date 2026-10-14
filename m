Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D84F85D4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979026; cv=none; b=eGWvL3GNjyZNnOQ9CHWTa1c1gy/Zuc0W7iPmsR/wYjHGZP5bnUSTILSoZSulH/15lcNVAyyluKeoeOynXO6jS3GOzwOaocLz5O1rDzxVT9UPSNCPCIcKJ2FjXM9aLhIvrsepXAL7Yd82Ddi1sgZzrC1qgpTBK+yQdQdEDlhbbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979026; c=relaxed/simple;
	bh=hbtnE8W7pRRMU/4pmxjsxU1MHonesorrNXzdBRBb6sE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PDZefX0zAlrqvI1C99RY46tHp8MGTFNWoj2I8cwgRLaSPysAKZoq2p3hIPegw7tpiF1h79XCet7l800d8k2KeXHiGe9Inp5IKTXl/7rhaS8xWEH6rZesO7Zk9sJ9+nEX5dWuqlFTu35DVEp5gHpcJY7RvRX0T28Yh3Szbtzl0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHl4vUuZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHl4vUuZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a706146559so2440993a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979021; x=1792583821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7y+RyZF/0euqEMjj6lXHC52QPFtTJhGKHy9NrMHBD0=;
        b=YHl4vUuZmTW4zy/+P2E9D+pr7RYKa54zK0Q4UCPou40cMoVCv2lFIwRNvu8XirSIEJ
         QAt25qdgo8u39nrR811BR+wQ5UcpkYR+9lL9aba/fksHCwSGs5WCf2Xomr9GF5Hkj7b6
         Em5/0AIjZpVElhC1xOCvpibS6mkFRYRWp5+hrXhIk34ESpwE68pfudqUhj6di0oZUasp
         bY5BvlcZ/uT6JsxNhIzKdQc3ITk20Q51pjN4/rlJiDTsWMAlqwipeIwtFpZcRZ4SDd3M
         F7WvoaSaDCt9zQvtbpSKYEoGqlUqB+puOZ/68sr1PFtr1aS/76Ia2iOsIImvtCRTocIj
         KxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979021; x=1792583821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w7y+RyZF/0euqEMjj6lXHC52QPFtTJhGKHy9NrMHBD0=;
        b=JtBqe2ssAPXtinsEz8xg2uslkXBI8zyD53lk/EmhSOSPNGj4mGw7I9ajra0CLV7d2j
         AiBgXqMwBSfci2TAqOdi9Esbpk2iXb4Y+OtfBhDPqYJcuPekINdsRNF98UdqTCtspo33
         nvNd6i8MfvFbEEyc/XJAP2HbUqAnftTR8h0fzZS2Ftj9ft5kVjfiO05rpFnbuY393uMv
         U3wSTe8vNHhvgoCrID0tqed6CB0fox4vAQ2MJR8MCShB18nJ4dUCyA75lJ/+j7WYt+0V
         VS4LWdqLIrQX8yyHpCTTMjbNt/FPG32/kEYaBfo7uHbieYBks/PmBnJMwxJgWtGBusMK
         4zcA==
X-Forwarded-Encrypted: i=1; AKwUvBxIYomf3QSyYfiFI+h3ra7PiCFryt3uKMeX0cefiqpeO1yiR6yFxTU0Y8eOLXWWPij4bvn8WeOtWFrlvxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLncoc7KL1H8NDL4C2PKs42wg+zXD9HGohEb81N2NrXcQiqRYBU
	PnQ8m6GqIOEwZxBT9a6kgC6qiBnEufeZrmrSGe+HsB7Nn7MIRpnb0ZUm
X-Gm-Gg: AYBFou2pvNkAG5Ck9cxnhc7njm8fboZaReD+sRR/2nfrsELDOKIF28qAhy5e1W8pNK2
	PAELBpjTmyYPtZhEs4hHOCeWpL47z7VDpPHFyl75MWL24clmXiulmCfMVbpaH11hkvvSaLresC7
	NjVqJHGOH1N06ubhfF4H8zF8CTdGuwEZ4k5/DjqxFzjZljhhx5xTGExRoS4BsBYcptsVtEWX8wU
	xx/M4s2wTCYjVG1k2uYObsV/9lkd7Ab2lBYnBnSBV6k7VOnB7kNS2d+PebT5A29wMcdI7jiRJir
	Vw1ZtdyDNMhoSCYoXRTiZPWfcgnNYLqn9KqHoTfJyJyTT2X2wvXSk8lhx6rAX8zf6Js4X0fmN7G
	mRVBJm+mjlSxSgpSvZYS0DvRzBtkFCG+mQr166tCEu3TZ2ypnmLBYE22KO9NF5pYdn78E/TFTgo
	avd/saVOtEr1Y2jbq04GITEIxMXd3elf29+ue2A5Upvowp0Hew6Ic9+H2knSTKnIQ2PlXSDw==
X-Received: by 2002:a17:90b:2e0e:b0:3ac:7556:8ee6 with SMTP id 98e67ed59e1d1-3ac7556a46bmr1378653a91.16.1791979021010;
        Wed, 14 Oct 2026 04:57:01 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm4795691a91.7.2026.10.14.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:57:00 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: stefanha@redhat.com,
	sgarzare@redhat.com
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bobbyeshleman@gmail.com
Subject: [PATCH net-next v4 1/4] vsock/virtio: split socket lookup from locked RX processing
Date: Wed, 14 Oct 2026 19:56:37 +0800
Message-Id: <20261014115640.184286-2-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014115640.184286-1-physicalmtea@gmail.com>
References: <20261014115640.184286-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split virtio_transport_recv_pkt() so socket lookup is separate from
receive state machine processing under the socket lock. This prepares the
receive path to keep a looked-up socket across multiple packets in a later
change.

Keep virtio_transport_recv_pkt() on its existing per-packet locking path.
The locked helper obtains packet-specific addresses from the skb and uses
the matched socket namespace for reset replies. Preserve source validation
and failure handling.

No functional change intended.

Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 net/vmw_vsock/virtio_transport_common.c | 128 ++++++++++++++----------
 1 file changed, 75 insertions(+), 53 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index f225f53ed4bab..61ee3bc205d5d 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1774,81 +1774,60 @@ static bool virtio_transport_valid_type(u16 type)
 	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
 }
 
-/* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
- * lock.
- */
-void virtio_transport_recv_pkt(struct virtio_transport *t,
-			       struct sk_buff *skb, struct net *net)
+static struct sock *
+virtio_transport_find_socket(struct sk_buff *skb, struct sockaddr_vm *src,
+			     struct sockaddr_vm *dst, struct net *net)
 {
 	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
-	struct sockaddr_vm src, dst;
-	struct vsock_sock *vsk;
 	struct sock *sk;
-	bool space_available;
-
-	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
-			le32_to_cpu(hdr->src_port));
-	vsock_addr_init(&dst, le64_to_cpu(hdr->dst_cid),
-			le32_to_cpu(hdr->dst_port));
-
-	trace_virtio_transport_recv_pkt(src.svm_cid, src.svm_port,
-					dst.svm_cid, dst.svm_port,
-					le32_to_cpu(hdr->len),
-					le16_to_cpu(hdr->type),
-					le16_to_cpu(hdr->op),
-					le32_to_cpu(hdr->flags),
-					le32_to_cpu(hdr->buf_alloc),
-					le32_to_cpu(hdr->fwd_cnt));
 
-	if (!virtio_transport_valid_type(le16_to_cpu(hdr->type))) {
-		(void)virtio_transport_reset_no_sock(t, skb, net);
-		goto free_pkt;
-	}
+	if (!virtio_transport_valid_type(le16_to_cpu(hdr->type)))
+		return NULL;
 
-	/* The socket must be in connected or bound table
-	 * otherwise send reset back
-	 */
-	sk = vsock_find_connected_socket_net(&src, &dst, net);
-	if (!sk) {
-		sk = vsock_find_bound_socket_net(&dst, net);
-		if (!sk) {
-			(void)virtio_transport_reset_no_sock(t, skb, net);
-			goto free_pkt;
-		}
-	}
+	sk = vsock_find_connected_socket_net(src, dst, net);
+	if (!sk)
+		sk = vsock_find_bound_socket_net(dst, net);
+	if (!sk)
+		return NULL;
 
 	if (virtio_transport_get_type(sk) != le16_to_cpu(hdr->type)) {
-		(void)virtio_transport_reset_no_sock(t, skb, net);
 		sock_put(sk);
-		goto free_pkt;
+		return NULL;
 	}
 
-	if (!skb_set_owner_sk_safe(skb, sk)) {
-		WARN_ONCE(1, "receiving vsock socket has sk_refcnt == 0\n");
-		goto free_pkt;
-	}
+	return sk;
+}
 
-	vsk = vsock_sk(sk);
+/*
+ * The caller holds sk's socket lock and must free skb if this returns true.
+ */
+static bool
+virtio_transport_recv_pkt_locked(struct virtio_transport *t,
+				 struct sk_buff *skb, struct sock *sk)
+{
+	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
+	struct sockaddr_vm src;
+	struct vsock_sock *vsk = vsock_sk(sk);
+	bool space_available;
 
-	lock_sock(sk);
+	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
+			le32_to_cpu(hdr->src_port));
 
-	/* Check if sk has been closed or assigned to another transport before
-	 * lock_sock (note: listener sockets are not assigned to any transport)
+	/* Listener sockets accept packets from any source and are not assigned to
+	 * a transport.
 	 */
 	if (sock_flag(sk, SOCK_DONE) ||
 	    (sk->sk_state != TCP_LISTEN &&
 	     !vsock_check_source(vsk, &t->transport, &src))) {
-		(void)virtio_transport_reset_no_sock(t, skb, net);
-		release_sock(sk);
-		sock_put(sk);
-		goto free_pkt;
+		(void)virtio_transport_reset_no_sock(t, skb, sock_net(sk));
+		return true;
 	}
 
 	space_available = virtio_transport_space_update(sk, skb);
 
 	/* Update CID in case it has changed after a transport reset event */
 	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
-		vsk->local_addr.svm_cid = dst.svm_cid;
+		vsk->local_addr.svm_cid = le64_to_cpu(hdr->dst_cid);
 
 	if (space_available)
 		sk->sk_write_space(sk);
@@ -1870,17 +1849,60 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 		kfree_skb(skb);
 		break;
 	default:
-		(void)virtio_transport_reset_no_sock(t, skb, net);
+		(void)virtio_transport_reset_no_sock(t, skb, sock_net(sk));
 		kfree_skb(skb);
 		break;
 	}
 
+	return false;
+}
+
+/* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
+ * lock.
+ */
+void virtio_transport_recv_pkt(struct virtio_transport *t,
+			       struct sk_buff *skb, struct net *net)
+{
+	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
+	struct sockaddr_vm src, dst;
+	struct sock *sk;
+	bool free_pkt;
+
+	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
+			le32_to_cpu(hdr->src_port));
+	vsock_addr_init(&dst, le64_to_cpu(hdr->dst_cid),
+			le32_to_cpu(hdr->dst_port));
+
+	trace_virtio_transport_recv_pkt(src.svm_cid, src.svm_port,
+					dst.svm_cid, dst.svm_port,
+					le32_to_cpu(hdr->len),
+					le16_to_cpu(hdr->type),
+					le16_to_cpu(hdr->op),
+					le32_to_cpu(hdr->flags),
+					le32_to_cpu(hdr->buf_alloc),
+					le32_to_cpu(hdr->fwd_cnt));
+
+	sk = virtio_transport_find_socket(skb, &src, &dst, net);
+	if (!sk) {
+		(void)virtio_transport_reset_no_sock(t, skb, net);
+		goto free_pkt;
+	}
+
+	if (!skb_set_owner_sk_safe(skb, sk)) {
+		WARN_ONCE(1, "receiving vsock socket has sk_refcnt == 0\n");
+		goto free_pkt;
+	}
+
+	lock_sock(sk);
+	free_pkt = virtio_transport_recv_pkt_locked(t, skb, sk);
 	release_sock(sk);
 
 	/* Release refcnt obtained when we fetched this socket out of the
 	 * bound or connected list.
 	 */
 	sock_put(sk);
+	if (free_pkt)
+		kfree_skb(skb);
 	return;
 
 free_pkt:
-- 
2.53.0

