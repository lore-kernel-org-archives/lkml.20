Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741915;
	b=5Ta4CMT/t+hQceaRAeo/+YXXmw/QJBWInc/HBkYfPjtlxOcxr9naxbc3+mHXmkSBBYSt
	 59FGlkqgGZxP3AeiJzRDGGV1GAfmxUu8JlD6f0LzItiaV0F8kx5vXoqJsjwFdTd7k7rh/
	 tNzFohqrKXAy3RL6YYLQsZ/aK9oHY1tNfLydtEoccloJNER4jl1e3YV0A+XE+MzC9jDdf
	 lNqTynwftpkZhoVfvh45nnoWbr/ScjSX6krI7+EBcXXhpcnj7vnQK6giAs+gf50LWeRUj
	 3q0zqW9V536Is3wTgWCQFpGxCyuJaYB3rXmBMzV2Q7t21AX9FaVBZ/M+kPhcoII853Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=muNE5kIzhzmSy9zy/DQorm6Ec+5hmWxUkOFZe0Ib8VE=;
	b=QkYmwnqlUCreYiTDRfHpcOn5AmAXyHAI8GQ5PAGf9htVeTmgYTB0+a7k/Sv/i5kw8LOe
	 tYKLc7SJd2b4JZu+0CEJfpTduP978nNsd76n6uwyPxSkYIYjGbfzu87hhQh71MVHUPf8I
	 CIqdOyjng8ArFOL+Rx4HkvHdSGq+q68xFnSHEXJs5poKsGQHTV0ebkzJnKo0BKQcOwRBv
	 1/FY8JRod/zkQqSOumcVoF78q3MfRMM9JoMM9DQMCyj6AY+eW2jGnc4Tj6+4CgAV3mIzM
	 CoNvIp8dPVIxXLBj0G4yJJgypH2Nbr1LruahDzqJu9tSTPVz7dDMoVQRi8ZT7fi61gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSZWyNkd;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A6606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4A6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSZWyNkd
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e985106c0cso4563075ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741913; x=1793346713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muNE5kIzhzmSy9zy/DQorm6Ec+5hmWxUkOFZe0Ib8VE=;
        b=oSZWyNkd9tx0LydPfzyYjS/fMAlcBOgtM9UhRvjsW5u8xmv+y1Q3UTVfPiDl0VTyZa
         5cNKc1wDTG/jKS7SCyqAOGKo46llz8o7GuD7gifpoDafi33HLN7cq+nftOOWCUzfyH0F
         xl330z//hkf0zISYEJM2HnQ+Oh4oNkktA7qG32l6j+1VRDZJuRjipbJx8MGw5qHk5C8I
         zTA8/ulsz5ERDvSvMTKTPdhEJQLKC5y6wIj/5r7Ix1qfZrg4gkCMEupTJzU/hA6/3EWX
         SA9KnGIrNfizL8hqk/pOoiPpnQ7haxwUzmCAPcws8XDAU42KxNMosaLfk6erY4MgwkSb
         BdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741913; x=1793346713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muNE5kIzhzmSy9zy/DQorm6Ec+5hmWxUkOFZe0Ib8VE=;
        b=hQ26niFpGBs14uP6rinIVOJwNJIfisHl/IbPciOjytBy90IDIuXbiuEqXAYWhJvcV+
         QmAC4ytkq1u1zRhH6JRe0yiHfXuelItnM7wwehw0BRR7XeRGKIXn5Xtps3pS0l9hpygh
         T/4wfZQy+XUmtjjcw6dH9JHAwpJNE8JrhbIlD024NMbNh/LtMm2KorJoAHOshmy21YTo
         Y7Lh89+K4eAqWmUDIzth80ETxRfhOgPLUalC4UGLS0yBbr9+u1m059IkSs31T+eETTXh
         PqnI5mZ2d4IvMDiZs+alTllRSUs1UyOBqNQBUIM3/682F6Z9WQC5llhuQgqnCXfTw3sf
         oTbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfWBQaJ/ckJlxkcZ600ranlRqxPprGuNGX0ic7zBZr4HxVzOfeJIDJiagzym9w+KnXstHFCFh017gNOiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI01zrVbvvUTZX8dyDasbtvxu3s+A7sQjWfmwCIZeIj4wwkwK50
	N3Zw20iIl87ZqVmP8GT8NpeKS1ucE+h6A3EWIpOcUbRdYaNrHWr/5Dlx
X-Gm-Gg: AYBFou2LPmr9tX1NggJ2p7Fk+AKdMIYXElpBL6jJojWdAjOd+vKECrhHrFjXXuDZ1RB
	O4swThh0ZhIXZtxCg7qNbSoUvR9s8GmHNGdMZHlLOxUV7OE9pjvRip+rWAfzoKEfehr5iL5F9SZ
	xVrmRagRT6DK8Xp1uDPZO5+RBrkWRmj/kvHaovFLFUpDWVTlA9lD+pEHjEsQHG7JK7JE5nLbF0m
	dbEuGdfLhz5+KOEyERhJMt73G1Fs1xpMcjA9l52/8VCeQBn9+wZbB0t6dsfgNFoJJBvxVC+NdL9
	if/mEMl5fE9Wji7PQqcvzv256Pr3ILAi2ModhBNy9BUp1Qi71BbdKTM75SyXHZCHeDZZ6pylB7J
	fX0fNHOOVYOkjm1jdIi4iL90ljCl+PBY7zgeVKBDcy8LZnnIbs6t90Gm10gSsdABR6S0+S/zN0R
	NgKHGEOClXqKUJziZSCNi2xI3l5q9XFYJVB1VfZSzkH9av1HDWOfb8C+ltksySD5/AbuEU5QDH3
	6KwmGBFTE4F1Fds1Oa3aNauYL4e6IgZ1N/EQgunR/VLiDLvHO4IEe2DYA==
X-Received: by 2002:a17:903:2f44:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2ea7d09c285mr14383685ad.10.1792741913096;
        Fri, 23 Oct 2026 00:51:53 -0700 (PDT)
Received: from gmail.com ([185.220.236.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b368c90sm7208265ad.29.2026.10.23.00.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:51:52 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: netdev@vger.kernel.org
Cc: stefanha@redhat.com,
	sgarzare@redhat.com,
	bobbyeshleman@meta.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 1/5] vsock/virtio: split socket lookup from locked RX processing
Date: Fri, 23 Oct 2026 15:51:36 +0800
Message-Id: <20261023075140.9613-2-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023075140.9613-1-physicalmtea@gmail.com>
References: <20261023075140.9613-1-physicalmtea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split virtio_transport_recv_pkt() so socket lookup is separate from
processing that occurs while holding the socket lock. This prepares the
receive path to retain a looked-up socket across multiple packets in a
later change.

Keep virtio_transport_recv_pkt() on its existing per-packet locking path.
Pass the caller-provided network namespace to the locked helper so reset
handling retains its existing semantics. Preserve source validation and
failure handling.

Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 net/vmw_vsock/virtio_transport_common.c | 131 ++++++++++++++----------
 1 file changed, 78 insertions(+), 53 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index f225f53ed4bab..43325d7aebbb1 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1774,6 +1774,80 @@ static bool virtio_transport_valid_type(u16 type)
 	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
 }
 
+static struct sock *
+virtio_transport_find_socket(struct sockaddr_vm *src,
+			     struct sockaddr_vm *dst, struct net *net)
+{
+	struct sock *sk;
+
+	sk = vsock_find_connected_socket_net(src, dst, net);
+	if (!sk)
+		sk = vsock_find_bound_socket_net(dst, net);
+
+	return sk;
+}
+
+/*
+ * The caller holds sk's socket lock.
+ */
+static void
+virtio_transport_recv_pkt_locked(struct virtio_transport *t,
+				 struct sk_buff *skb, struct sock *sk,
+				 struct net *net)
+{
+	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
+	struct vsock_sock *vsk = vsock_sk(sk);
+	struct sockaddr_vm src;
+	bool space_available;
+
+	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
+			le32_to_cpu(hdr->src_port));
+
+	/*
+	 * The socket may have been closed or reassigned after lookup but before
+	 * its socket lock was acquired. Listener sockets have no assigned
+	 * transport.
+	 */
+	if (sock_flag(sk, SOCK_DONE) ||
+	    (sk->sk_state != TCP_LISTEN &&
+	     !vsock_check_source(vsk, &t->transport, &src))) {
+		(void)virtio_transport_reset_no_sock(t, skb, net);
+		kfree_skb(skb);
+		return;
+	}
+
+	space_available = virtio_transport_space_update(sk, skb);
+
+	/* Update CID in case it has changed after a transport reset event */
+	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
+		vsk->local_addr.svm_cid = le64_to_cpu(hdr->dst_cid);
+
+	if (space_available)
+		sk->sk_write_space(sk);
+
+	switch (sk->sk_state) {
+	case TCP_LISTEN:
+		virtio_transport_recv_listen(sk, skb, t);
+		kfree_skb(skb);
+		break;
+	case TCP_SYN_SENT:
+		virtio_transport_recv_connecting(sk, skb);
+		kfree_skb(skb);
+		break;
+	case TCP_ESTABLISHED:
+		virtio_transport_recv_connected(sk, skb);
+		break;
+	case TCP_CLOSING:
+		virtio_transport_recv_disconnecting(sk, skb);
+		kfree_skb(skb);
+		break;
+	default:
+		(void)virtio_transport_reset_no_sock(t, skb, net);
+		kfree_skb(skb);
+		break;
+	}
+}
+
 /* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
  * lock.
  */
@@ -1782,9 +1856,7 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 {
 	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
 	struct sockaddr_vm src, dst;
-	struct vsock_sock *vsk;
 	struct sock *sk;
-	bool space_available;
 
 	vsock_addr_init(&src, le64_to_cpu(hdr->src_cid),
 			le32_to_cpu(hdr->src_port));
@@ -1808,13 +1880,10 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 	/* The socket must be in connected or bound table
 	 * otherwise send reset back
 	 */
-	sk = vsock_find_connected_socket_net(&src, &dst, net);
+	sk = virtio_transport_find_socket(&src, &dst, net);
 	if (!sk) {
-		sk = vsock_find_bound_socket_net(&dst, net);
-		if (!sk) {
-			(void)virtio_transport_reset_no_sock(t, skb, net);
-			goto free_pkt;
-		}
+		(void)virtio_transport_reset_no_sock(t, skb, net);
+		goto free_pkt;
 	}
 
 	if (virtio_transport_get_type(sk) != le16_to_cpu(hdr->type)) {
@@ -1828,52 +1897,8 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
 		goto free_pkt;
 	}
 
-	vsk = vsock_sk(sk);
-
 	lock_sock(sk);
-
-	/* Check if sk has been closed or assigned to another transport before
-	 * lock_sock (note: listener sockets are not assigned to any transport)
-	 */
-	if (sock_flag(sk, SOCK_DONE) ||
-	    (sk->sk_state != TCP_LISTEN &&
-	     !vsock_check_source(vsk, &t->transport, &src))) {
-		(void)virtio_transport_reset_no_sock(t, skb, net);
-		release_sock(sk);
-		sock_put(sk);
-		goto free_pkt;
-	}
-
-	space_available = virtio_transport_space_update(sk, skb);
-
-	/* Update CID in case it has changed after a transport reset event */
-	if (vsk->local_addr.svm_cid != VMADDR_CID_ANY)
-		vsk->local_addr.svm_cid = dst.svm_cid;
-
-	if (space_available)
-		sk->sk_write_space(sk);
-
-	switch (sk->sk_state) {
-	case TCP_LISTEN:
-		virtio_transport_recv_listen(sk, skb, t);
-		kfree_skb(skb);
-		break;
-	case TCP_SYN_SENT:
-		virtio_transport_recv_connecting(sk, skb);
-		kfree_skb(skb);
-		break;
-	case TCP_ESTABLISHED:
-		virtio_transport_recv_connected(sk, skb);
-		break;
-	case TCP_CLOSING:
-		virtio_transport_recv_disconnecting(sk, skb);
-		kfree_skb(skb);
-		break;
-	default:
-		(void)virtio_transport_reset_no_sock(t, skb, net);
-		kfree_skb(skb);
-		break;
-	}
+	virtio_transport_recv_pkt_locked(t, skb, sk, net);
 
 	release_sock(sk);
 
-- 
2.53.0

