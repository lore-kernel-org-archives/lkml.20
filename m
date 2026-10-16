Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E764C9E18
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157246; cv=none; b=mlusdToM746LL7gRbDYyHLunRh1bZHq2Dt69Aw3WodVoJJH5GNj4h5O9YNNm2pTBFAk9ztzxPPGQKNOrXSGfrIqgpYG2rBs3jkgT7RvzsiMPJtiTm3Q+uH4Xzy2D5PHzaQjOKrG0acHMV6sYkBim6Sj6aaLwUTi2sPXq3LM5XXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157246; c=relaxed/simple;
	bh=ISWeu8QEzSrFqiBXeb7EFy71sqAccupUyBleU+xH4Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3HmInbmbuvbQQ/wvyL/5GZMuy3r8ttWB+ifrQ9DJA3jpVXXFjYLYrjvXVgXHthhGWIKZdU/+brbQ1+FG4+iKQYZ7KYKdLpbKwFXPeoqeI3Wgb215iQAYKCLUGtXlToQZHTVntckcFfm7Ye8+bHjbP/llLl3PVP5LDWxWq5oHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG5h5/JJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG5h5/JJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso26133565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157243; x=1792762043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YjOyRguzbQ9PKrv92k4FnDoKt53mMLhByiAMojhitA=;
        b=WG5h5/JJbmwsFmMPsBjmviIYBhCdOPPBRYKcYpNCW6ZV8W6XUgABurQJibcep0nav3
         eZqF2qxdOeOBomRfLo+0sbJZK20uIaNKhzy3yurarahQhS/KklXbNLOQsRUt4ndsdeY+
         pPndUUa9JWf2rAsqDgafX6aFrCBpg8RjhlPEJ+Mw92pgXlpiLJsQIWDmifOxaTKMgmYW
         ItJbqDEpI4TK0qAuXhgijkEHDywWghWiYUCRri3Jq2XffrsN2Jl6xYyv9rBSHGRkYlDm
         D1WhBy5v9WiMuZVUFqx+Qaxmg8WhnsMmfcuH2FrqRvm0oUfQh51ff1NHmNHLb6s7EDl4
         iwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157243; x=1792762043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4YjOyRguzbQ9PKrv92k4FnDoKt53mMLhByiAMojhitA=;
        b=CWOY71f/7Oere8hyNpI3UY162ACdTLHSPhtlr2OY6ZCctksp6bcf5hOwQjXcVOWEmv
         p22cqjwNeHP4pbr68suPU62YKjZe6wg08Oi9eGzL5Ne9574v0byVE8zt3lk5Hhl6ZWl/
         Xi/hZj7CzRLZYA4YcsV/TsTjtmiz+9MoMW7qrfc0hZpdim06is3Tzao10fBR5ptrdnJy
         gFZXdnRhGn8r2PjRB/cr+/1zBJwvIujXFFjOasYlTEzuwiTkIOrORqgHVYnj3Pt+96o+
         jAB6AQ0zHb+P0uqhiLxWtgu1iYEAoOt8ZFeSv2pfFYXvuVlAFKRHYxckvEF/cumDb4lV
         VXBg==
X-Forwarded-Encrypted: i=1; AKwUvBxb3Ux5jhR7iKbBvY9nfNyRJaUQ1fpWmHrpXGZEi0KGgbgBEZTZcoJWtylSR7JC5z7b6lb2PiKhvPpFX4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQTbhNpLxAs+rhgkSzYjoJEL7BJ0NoS7Z0Fb+60xfe966epzFN
	DaVEHebW5VK6/GgQBlZlqe9XUaZk5vTxFYMCcpf42Vs3wReYFgT4njLW
X-Gm-Gg: AYBFou35uj6jY4bK0ygL2mwZ++utNYWk1yS9PjAEGx3NUPCduinJT/WwVfQ5XewfBOL
	8eiG0b5YOBHzwUvqP/NrI3zJPmLnFGW+nVTRI820w7KRVGY/Jd/ZLHipVvnSYVt+HPjsgjutooO
	CI0pxcyOHeX8fcRz4jxvy9F6codG+jcVCTRdsJ4POp9gf5DaBhpK4XecEuhA16cURm/49/wuRY2
	wQkQzdmdgnJdB8TMt4SPZhxuClWEt8BJlfwDKa8msRX7Ej99lolGX3NXT/oKxC2o+5xUW4nuLeY
	tZVmzXrDwlufKn3kahi+qrDrhjYFRpxyHGvM3iKJRrvYlY36wckuezV3PMG3LadmeSTE9oAeoiE
	7H9ii8sEDxW3UGlmnadNfdUN3dNBX1ZqvGPGlz9AKeeOLnI71teGeEJEdhE3WIcuQT6ewIw56JZ
	VQnK2BxT1NAqS6dl3UqVgscPmzn2LNDJ3TBNBg11uG/xyZ+zDPUBirZBXtdoojw07Dtbx07aDw+
	vy0tT2W8NVD7UmK5ckxgSDyce7i6Y0pOXnaJJH/aFngQlQC2gW9FaLGDjQ=
X-Received: by 2002:a05:600c:3e87:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a18e4bacbfmr418899375e9.18.1792157242302;
        Fri, 16 Oct 2026 06:27:22 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm58114275e9.14.2026.10.16.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:27:21 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/3] vsock: support SO_INQ on stream sockets
Date: Fri, 16 Oct 2026 14:27:15 +0100
Message-ID: <20261016132716.272018-3-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016132716.272018-1-devnexen@gmail.com>
References: <20261016132716.272018-1-devnexen@gmail.com>
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
 include/net/af_vsock.h   |  1 +
 net/vmw_vsock/af_vsock.c | 35 ++++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

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
index ac2faac97462..6d77e6344840 100644
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
@@ -2018,6 +2019,7 @@ static bool vsock_sol_socket_custom(int optname)
 {
 	switch (optname) {
 	case SO_ZEROCOPY:
+	case SO_INQ:
 		return true;
 	default:
 		return false;
@@ -2065,6 +2067,19 @@ static int vsock_sol_socket_setsockopt(struct sock *sk, int optname,
 		sock_valbool_flag(sk, SOCK_ZEROCOPY, val);
 		break;
 
+	case SO_INQ:
+		if (sk->sk_type != SOCK_STREAM) {
+			err = -ENOPROTOOPT;
+			break;
+		}
+
+		err = vsock_sol_socket_get_bool(optval, optlen, &val);
+		if (err)
+			break;
+
+		vsk->recvmsg_inq = val;
+		break;
+
 	default:
 		err = -ENOPROTOOPT;
 		break;
@@ -2621,6 +2636,7 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	struct sock *sk;
 	struct vsock_sock *vsk;
 	const struct vsock_transport *transport;
+	bool do_cmsg = false;
 	int err;
 
 	sk = sock->sk;
@@ -2677,13 +2693,26 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
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

