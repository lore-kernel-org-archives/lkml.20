Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF073EAC75
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079035; cv=none; b=YeK0ReHg/YfyRpQ2rThi/wpJOVpPph61tNS0AO9dWc345p3SAyvXSTivKTzF9UtSaoa9rc0ceSb9AoT7kxKHp6jbBvXvwZLHIFNOMUC+ZsEMzCLzFYfdOpFNn2ny2gQMo4aS3oAsefk9zLxsztoeKZAvvZOoWwpNkUWyHBKDgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079035; c=relaxed/simple;
	bh=QPUr45PzMu/8RpW9lNwZfx8Bpv3qdCpILxrSxT0z04s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOBo7QkzzvuyP8HOiHzQ+q6c8t+qttrPDuyAqGe3eGOhs37twB0l+Okqsqp0JfeF3MCl+2B+qEbJLGm10KynIKvOHTNZkotE1w3mCtd+c9F8Uy0kYldVpn4dfDtj7YJpqWCpk6XSVtGIy6yTbSFRfM+H682jGUwvt9fw2v+WXbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZIPP3xT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZIPP3xT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so46411035e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079021; x=1792683821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HffmXfJKy6j0voVhf7+euRmSr6xXXF4Ar0m+br65Sq0=;
        b=AZIPP3xTvimIHo5ikMV3LtLGis15wbOMDwi9hi3jdsqFEdkn4bYRiR9JnoTHRF1+g7
         KgYuqRtbVUgLJ2yofQbPs+HWpABK0QxB33UmFKM95jIdNKB/GaxHKzcdfLKTq3EGsa+N
         nqlAbheTKj/7FfWToWOZCMNP6vkFDkvI3lHWTrw5gi0QR8Li1lSC7nqSlOm0CxWE9UTQ
         3KbId33D1Ad8416o2DVzXXMIMENjB8mhh5wC2NivhO39DEpJZUyW1070urwD51AhQlNa
         FZwWEesTSfFdXdgTHVNM2Gvtnz4bwBZ/UmLCC33owrYk3PaaijUW64DpfrkWgpG2vXUB
         HMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079021; x=1792683821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HffmXfJKy6j0voVhf7+euRmSr6xXXF4Ar0m+br65Sq0=;
        b=w9RXqHx9xhYLXVPGy6IfD+vU3Vo/ZEFOpPICeqyVFe2S4zH/mw3Q5GBZJ1ESsIklkU
         WfPN98b7X6+6+Veu+bwuF3JCxwaVgk3UOxIq4QycTLRwvjHuAxRyvGQQpR4BueCPzonN
         ZAQBK7cWXSJupbx+39sD+Je4n+9ovef4XBsw4c0roT+jhJKaK2YPfyh5+5iZZ98YFVLg
         BJGJagsb6gru4Ooci7IPRYXYl2LXo4vdQFf+fj3KZDewAN/mxyFHGafI/gcljo16/Nrt
         FmvuhUgQH/oYOoY/hnLfdrq7qhAvq9fZx2r5epQ1VICVoyrHuK66DeSpaoj9XPRZTUPn
         2yqQ==
X-Forwarded-Encrypted: i=1; AKwUvByYPr/Y1Ik+eliXwA+SnfcxbmrnSA1DZsHbM9tAWRUMem/ig9PyN4zFjWRouB2Id/UZYFBEfr/XTSSLiSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ssT/CdVxZvBwZZGml/CKt5yt88qlCSxniu3/ey4plE4hj5L7
	fqcPF5AN1CE50z9whLkSN58iWvfXJzbp7W4Ekv/5hTKQKeBVQSg7HJud
X-Gm-Gg: AYBFou2+GfTCA2nGfrIap4GS8pjZL33Be0eTSZhl+k2kD0npY0oko+vmBa+Ce4lhXEy
	Ci+6xDhksRr+jgzImhFUVgwRFONHiE6j2NDOdO2XN8BV96Emfh7f0P+l1OoeVhWzF0i9ideWZXy
	WxFhvqYqrdiZWQyJsy/eph2t/0agqRgrouCRv9HhQHb1dd79ITb35C0bB5vCJnANelQmYO2uH2i
	aOU5dZ/UVawIFgghL8mESzAPm3l+eMYT543F9LsQPWKCRr0twrrWmDXLsmT+NnceiLz2M9wobLw
	rYOmL5k14vcAZBP9ReQp9OclQbwAyNLKI14WsMKgzPJg4o/8kt/XnIRsKgEfuRXRpcX14JTAulY
	YzmOiDUCVlVsI8FEb1/s68lFQws6+EOnYjLtO89XayqX/jgHEALlDqm8Wo1okljisRltJaLA0zf
	bQkItUMXrynOvG5O6y3mSJK1FE778YupcS6dMuoyVEfn/HNVNfgZQlNip56y4Ot/QC+IbUkXO2C
	0+rjyj4d0hbyw5U+QBA7htFmUpNnwtUhe/ESGYMjwg+6bMHUWSnGiGBYI1x
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr184426785e9.21.1792079020615;
        Thu, 15 Oct 2026 08:43:40 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm61940825e9.1.2026.10.15.08.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:43:40 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v2 1/2] vsock: support SO_INQ on stream sockets
Date: Thu, 15 Oct 2026 16:43:33 +0100
Message-ID: <20261015154334.3217358-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015154334.3217358-1-devnexen@gmail.com>
References: <20261015154334.3217358-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SO_INQ makes recvmsg() return the bytes left in the receive queue in an
SCM_INQ cmsg, saving a SIOCINQ call per receive. AF_UNIX stream sockets
support it, AF_VSOCK fails with ENOPROTOOPT.

Add it for SOCK_STREAM, reusing the hint already computed for io_uring.
As with TCP_INQ, 1 is reported once the stream is finished so the caller
reads again and sees EOF, and accepted sockets inherit the setting from
the listener. No cmsg is sent when the transport cannot report the queue
length.

SOCK_SEQPACKET is refused, as on AF_UNIX: its transport callback counts
messages, not bytes.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 include/net/af_vsock.h   |   1 +
 net/vmw_vsock/af_vsock.c | 111 +++++++++++++++++++++++++++++----------
 2 files changed, 84 insertions(+), 28 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index 5549298c1ec6..e8481f12312e 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -68,6 +68,7 @@ struct vsock_sock {
 	u64 buffer_size;
 	u64 buffer_min_size;
 	u64 buffer_max_size;
+	bool recvmsg_inq;
 
 	/* Private to transport. */
 	void *trans;
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 1c2d1cea67f4..186ed57fd797 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -984,6 +984,7 @@ static struct sock *__vsock_create(struct net *net,
 		vsk->buffer_size = psk->buffer_size;
 		vsk->buffer_min_size = psk->buffer_min_size;
 		vsk->buffer_max_size = psk->buffer_max_size;
+		vsk->recvmsg_inq = psk->recvmsg_inq;
 		security_sk_clone(parent, sk);
 	} else {
 		vsk->trusted = ns_capable_noaudit(&init_user_ns, CAP_NET_ADMIN);
@@ -2014,6 +2015,66 @@ static void vsock_update_buffer_size(struct vsock_sock *vsk,
 	vsk->buffer_size = val;
 }
 
+static bool vsock_custom_sockopt(int optname)
+{
+	switch (optname) {
+	case SO_ZEROCOPY:
+	case SO_INQ:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int vsock_sol_socket_setsockopt(struct sock *sk, int optname,
+				       sockptr_t optval, unsigned int optlen)
+{
+	struct vsock_sock *vsk = vsock_sk(sk);
+	int err = 0;
+	int val;
+
+	/* Use 'int' type here, because variable to
+	 * set these options usually has this type.
+	 */
+	if (optlen < sizeof(val))
+		return -EINVAL;
+
+	if (copy_from_sockptr(&val, optval, sizeof(val)))
+		return -EFAULT;
+
+	if (val < 0 || val > 1)
+		return -EINVAL;
+
+	lock_sock(sk);
+
+	switch (optname) {
+	case SO_ZEROCOPY:
+		if (vsk->transport && !vsock_msgzerocopy_allow(vsk->transport)) {
+			err = -EOPNOTSUPP;
+			break;
+		}
+
+		sock_valbool_flag(sk, SOCK_ZEROCOPY, val);
+		break;
+
+	case SO_INQ:
+		if (sk->sk_type != SOCK_STREAM) {
+			err = -ENOPROTOOPT;
+			break;
+		}
+
+		vsk->recvmsg_inq = val;
+		break;
+
+	default:
+		err = -ENOPROTOOPT;
+		break;
+	}
+
+	release_sock(sk);
+	return err;
+}
+
 static int vsock_connectible_setsockopt(struct socket *sock,
 					int level,
 					int optname,
@@ -2045,36 +2106,16 @@ static int vsock_connectible_setsockopt(struct socket *sock,
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
 
-	lock_sock(sk);
-
-	transport = vsk->transport;
-
 	if (level == SOL_SOCKET) {
-		int zerocopy;
-
-		if (optname != SO_ZEROCOPY) {
-			release_sock(sk);
+		if (!vsock_custom_sockopt(optname))
 			return sock_setsockopt(sock, level, optname, optval, optlen);
-		}
-
-		/* Use 'int' type here, because variable to
-		 * set this option usually has this type.
-		 */
-		COPY_IN(zerocopy);
 
-		if (zerocopy < 0 || zerocopy > 1) {
-			err = -EINVAL;
-			goto exit;
-		}
+		return vsock_sol_socket_setsockopt(sk, optname, optval, optlen);
+	}
 
-		if (transport && !vsock_msgzerocopy_allow(transport)) {
-			err = -EOPNOTSUPP;
-			goto exit;
-		}
+	lock_sock(sk);
 
-		sock_valbool_flag(sk, SOCK_ZEROCOPY, zerocopy);
-		goto exit;
-	}
+	transport = vsk->transport;
 
 	switch (optname) {
 	case SO_VM_SOCKETS_BUFFER_SIZE:
@@ -2581,6 +2622,7 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	struct sock *sk;
 	struct vsock_sock *vsk;
 	const struct vsock_transport *transport;
+	bool do_cmsg = false;
 	int err;
 
 	sk = sock->sk;
@@ -2637,13 +2679,26 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
 
 out:
-	/* Seqpacket has_data counts messages, while io_uring treats msg_inq as
-	 * a byte length when sizing retries, so only streams report a hint.
+	/* Seqpacket has_data counts messages, while SCM_INQ reports bytes and
+	 * io_uring treats msg_inq as a byte length when sizing retries, so
+	 * only streams report it.
 	 */
-	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM)
+	if ((vsk->recvmsg_inq || msg->msg_get_inq) && err >= 0 &&
+	    sk->sk_type == SOCK_STREAM) {
 		msg->msg_inq = vsock_stream_inq_hint(sk);
 
+		/* A negative hint means the transport could not tell. SCM_INQ
+		 * has no encoding for that, so report nothing.
+		 */
+		do_cmsg = vsk->recvmsg_inq && msg->msg_inq >= 0;
+	}
+
 	release_sock(sk);
+
+	if (do_cmsg)
+		put_cmsg(msg, SOL_SOCKET, SCM_INQ, sizeof(msg->msg_inq),
+			 &msg->msg_inq);
+
 	return err;
 }
 
-- 
2.55.0

