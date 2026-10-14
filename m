Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4664FC339
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979042; cv=none; b=o33Rp8JpOa/btdWBjj8WXwIqhj/bcUoZvMT45qmwD84yqiLp1zPI7Slg/9Z6IE3h4pR441+HbMa8AO0D2p0O6zCRphfoaLd2VCmlu7s382RaBZOv7qrCq8XhRE91Gbjf89U00aobN4ILkKZGa6mWjHITrvZTqVC4lZ846v1LABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979042; c=relaxed/simple;
	bh=UT+gUDWpvYvdUO59q70uyFIuGW+1dknIwp9YCivhP4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PVf3TAEdjye7RWRX10B+nkGXHCx23O7aymMM90m0QgSxuU4QgJvivRABVfcJh7bjK3JS6QuqnWS6n6F037U8sgJAKjqYCDZZTngy15EaBDRFiOIYyuPdjbt0SX0BT2ZohZE51ZH94JMUxMRZmbhsUD3KgCjNf3ztaYxGyVpNdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDe5riTH; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDe5riTH"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3316910a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979039; x=1792583839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeRAz8u7YOmHATBxCqeG7zchbKWr3JF2MUxcRFYnHbo=;
        b=aDe5riTHp27jFVIfMsUREA6JlInM+8kjINyhyZFbJnpTKXbBjcQlk8M5YiuOXwOfm1
         PKH3qToWErUfd0AsyFi3ZvfL56NmHanHdCeA2g82ZCx9O7bCSndmHXpXOOxC/4ANoW1+
         emNmmQkqHYL9gtE83Rl68ss3EdCcH8IXd5IdPhXT8+8JavXucJJIr6OII6tZpTXi9Bww
         uvq41O/4Cd55vwYLkCqIbwia0exgqJRuL4XceF+znVAryjNH2aQsvZUpUdU9DfnMZfyG
         9WyDXrPghcnfD9p7esvp9HYQLSORyOXxTMg08zHJIg7nv05ObaZIBgh+FKHVo7ct5lIY
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979039; x=1792583839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DeRAz8u7YOmHATBxCqeG7zchbKWr3JF2MUxcRFYnHbo=;
        b=G4g5ksYKs9Vh6IM5rMO5/KImpfnMaYzlq+CXPcz69lYjZaY5BLEhsWgxz32lW52ZXD
         L2cUIKsCtHizkce5cAM7FtWzRakGYtaaqwSh1VDjSqnVmPzhN0pnR3e9Y0YUjZB6hY6P
         FctOj37kh/gpLYC3S02q6VEIyk3fXnM+8OWRRgKcKdbQsNDuH2IObKMz+7PHEc7LzCyX
         YE0q0AfSMgmOJAnV1OY9/jh+eQrZfLIRJhMYV8Z9UX/Zr4+z7D6iJsyjS4qWE1vma6Tt
         jVNUAThpFBh9SlMHJ2hBg8+lGfVjdwbFvS8dUAZgQyLXQGbucGwydz0J0w3Y5qS1Gr4+
         qn/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHqngOuOCpCETg9FSCK8zPuoeNslD9lSojupy3h/V+h6WkfqggRTPu/UMJlRkC1ECGx9a5VcgWQZZggQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPJ/KBd9EdxgQ/wQf3wwpyIFfCADSxik8++mFHZLbiItCSykpu
	oYXsX8XlNcDh++VtgIODRHuXnY9lxBShhZI6ozMMlytvoigFzrEEwZf1
X-Gm-Gg: AYBFou14s5TMbk/2BTIoXajsqtIosNaB1iapsrg4EkL6xX+Eox6xCVJ+38KETzxLpJv
	+mj4uPG2KXVJ+H/6iYcJ2m9aHT2Vc6I57YbX+Q/4y9MAHLxlPmiS6LnOQvjETScwA9NY3vKKv/s
	r7OK4r8ZYJxrkj9irXdfb3buCtZlxNm1TUzLIFZB9LMXrAIqA+elEAnmFdaBdLdnSyuOqkNTTW4
	Y57+rWQO9Z/oMMg3Ns4gg2wke30LWoiYAq3UpwS4bImFj/SI3okzIyso+OJE+gYidjAI5mjimSe
	lTi24AoHVE4fFasj/F1iURozaZaKRdoYlcbCcFeOzO4uv3Jj5+zxJ/Ldw9FzXHtosqg3jcAAnPx
	OMsxz6Xvj3lbzGwsyJ8445W9PCf9Hp1r+WoB9nAviGJkG/W2XN8cl+ykRpuaCgjRqUxk8VKE2aB
	dNlGreB/sE1HXUEZ6zxmYl6MpOMAPo6lj+CGbxyXpW2fHBw9ExPdqkLBU3HH+whgP8SdI+5Q==
X-Received: by 2002:a17:90b:55c3:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3ac3e426341mr4595338a91.33.1791979038286;
        Wed, 14 Oct 2026 04:57:18 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm4795691a91.7.2026.10.14.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:57:18 -0700 (PDT)
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
Subject: [PATCH net-next v4 4/4] vsock/virtio: defer RX notifications until batch unlock
Date: Wed, 14 Oct 2026 19:56:40 +0800
Message-Id: <20261014115640.184286-5-physicalmtea@gmail.com>
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

An RX batch can make a socket readable while the worker still holds its
socket lock. Waking a blocking reader then only moves it to waiting for
the same lock.

Record the existing low-watermark condition and notify once after
release_sock(). Move the coalesced write-space notification after the
unlock as well, since both callbacks wake sk_sleep(sk). Deliver
write-space before data-ready and keep the lookup reference until both
callbacks complete.

As with write-space, save the initial sk_data_ready callback and batch only
while both saved callbacks remain installed. Sockets with replaced
callbacks retain their per-packet behavior.

The existing psock-marker check also covers a concurrent sockmap attach:
at most the already admitted packet completes on the native path, and the
next packet ends the batch.

Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 include/linux/virtio_vsock.h            |  1 +
 include/net/af_vsock.h                  |  5 ++--
 net/vmw_vsock/af_vsock.c                |  1 +
 net/vmw_vsock/virtio_transport_common.c | 35 ++++++++++++++++++-------
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index bf077ee0ded88..f1396ca3ad9b5 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -288,6 +288,7 @@ struct virtio_transport_rx_batch {
 	unsigned int pkts;
 	size_t bytes;
 	bool write_space_pending;
+	bool data_ready_pending;
 };
 
 void virtio_transport_recv_pkt_batch(struct virtio_transport *t,
diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 9a40960d10cbe..78bab5820f528 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -64,9 +64,10 @@ struct vsock_sock {
 	bool sent_request;
 	bool ignore_connecting_rst;
 	/*
-	 * Initial callback, used to identify replacements and deliver deferred
-	 * write-space notifications.
+	 * Initial callbacks, used to identify replacements and deliver deferred
+	 * notifications.
 	 */
+	void (*default_data_ready)(struct sock *sk);
 	void (*default_write_space)(struct sock *sk);
 
 	/* Protected by lock_sock(sk) */
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index fe7f49da6c4bc..f40659ec29df0 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -958,6 +958,7 @@ static struct sock *__vsock_create(struct net *net,
 		sk->sk_type = type;
 
 	vsk = vsock_sk(sk);
+	vsk->default_data_ready = sk->sk_data_ready;
 	vsk->default_write_space = sk->sk_write_space;
 	vsock_addr_init(&vsk->local_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
 	vsock_addr_init(&vsk->remote_addr, VMADDR_CID_ANY, VMADDR_PORT_ANY);
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index f4b5f0230493e..8b62b789b71c5 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1588,7 +1588,8 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
 
 static int
 virtio_transport_recv_connected(struct sock *sk,
-				struct sk_buff *skb)
+				struct sk_buff *skb,
+				bool *data_ready_pending)
 {
 	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
 	struct vsock_sock *vsk = vsock_sk(sk);
@@ -1607,7 +1608,13 @@ virtio_transport_recv_connected(struct sock *sk,
 			vsock_remove_sock(vsk);
 			break;
 		}
-		vsock_data_ready(sk);
+		if (!data_ready_pending) {
+			vsock_data_ready(sk);
+		} else if (!*data_ready_pending &&
+			   (vsock_stream_has_data(vsk) >= sk->sk_rcvlowat ||
+			    sock_flag(sk, SOCK_DONE))) {
+			*data_ready_pending = true;
+		}
 		return err;
 	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
 		virtio_transport_send_credit_update(vsk);
@@ -1820,6 +1827,7 @@ virtio_transport_recv_pkt_batchable(struct virtio_transport *t,
 	return sk->sk_state == TCP_ESTABLISHED &&
 	       sk->sk_type == SOCK_STREAM &&
 	       READ_ONCE(sk->sk_prot) == sk->sk_prot_creator &&
+	       READ_ONCE(sk->sk_data_ready) == vsk->default_data_ready &&
 	       READ_ONCE(sk->sk_write_space) == vsk->default_write_space &&
 	       !sock_flag(sk, SOCK_DONE) &&
 	       vsk->transport == &t->transport &&
@@ -1830,8 +1838,9 @@ virtio_transport_recv_pkt_batchable(struct virtio_transport *t,
 /*
  * The caller holds sk's socket lock.  Set @batchable if the socket can remain
  * locked for another ordinary STREAM/RW packet.  When @batch is non-NULL,
- * record a default write-space notification for batch finish instead of
- * delivering it immediately.  Return true if the caller must free @skb.
+ * record default write-space and data-ready notifications for batch finish
+ * instead of delivering them immediately.  Return true if the caller must
+ * free @skb.
  */
 static bool
 virtio_transport_recv_pkt_locked(struct virtio_transport *t,
@@ -1883,7 +1892,9 @@ virtio_transport_recv_pkt_locked(struct virtio_transport *t,
 		kfree_skb(skb);
 		break;
 	case TCP_ESTABLISHED:
-		virtio_transport_recv_connected(sk, skb);
+		virtio_transport_recv_connected(sk, skb,
+						batch ?
+						&batch->data_ready_pending : NULL);
 		break;
 	case TCP_CLOSING:
 		virtio_transport_recv_disconnecting(sk, skb);
@@ -1957,27 +1968,33 @@ EXPORT_SYMBOL_GPL(virtio_transport_recv_pkt);
 /*
  * Finish the RX batch.
  * For a non-empty batch, the caller holds the socket lock acquired with
- * lock_sock(). Deliver any deferred write-space notification while the lock
- * is held, then release the lock and the batch's lookup reference.
- * An empty batch is a no-op.
+ * lock_sock(). Release the lock, deliver any deferred write-space and
+ * data-ready notifications in that order, then drop the batch's lookup
+ * reference. An empty batch is a no-op.
  */
 void virtio_transport_rx_batch_finish(struct virtio_transport_rx_batch *batch)
 {
 	bool write_space_pending = batch->write_space_pending;
+	bool data_ready_pending = batch->data_ready_pending;
 	struct sock *sk = batch->sk;
 
 	batch->sk = NULL;
 	batch->pkts = 0;
 	batch->bytes = 0;
 	batch->write_space_pending = false;
+	batch->data_ready_pending = false;
 
 	if (!sk)
 		return;
 
+	release_sock(sk);
+
 	if (write_space_pending)
 		vsock_sk(sk)->default_write_space(sk);
 
-	release_sock(sk);
+	if (data_ready_pending)
+		vsock_sk(sk)->default_data_ready(sk);
+
 	sock_put(sk);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_rx_batch_finish);
-- 
2.53.0

