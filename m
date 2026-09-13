Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C92D8370
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268989; cv=none; b=ufkEX9mMFohV0Nej0JihNoFl8rXk0aFlGze0FoHkt1/UocMsd+Dnb3PwHV6iARfrTFZPM0ORAsCHh5YnC8atT5DYdVhiuMKDA8ONdh0rDgIgzB8KHM/qsjzSQ1/Z6zPzCESLInwIiFsm4GUqJ85TUr7M8nzVJTCLFtRT8ysQgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268989; c=relaxed/simple;
	bh=X2A/5d9QeOB9OKtd9sE5zXeKx9erBPPV4ajbPLRfhnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTgB8e4o/zw69BDhoEyLCfrmA99RJJNMxDsJvCaWfMMrvqRiJLOPn9JAASn8ykrIfBolmSTn9WmUfF5HFZRwoeebUFzD9DH9wZh9EHO+jkDYioRgYjqctSqmCdPDHzT+sQqG22hbZn2Gj4j9bMxVO9BdtPk0usfcZ4e78sMvreM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF5Bqf+S; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF5Bqf+S"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530c602630bso10543561cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789268987; x=1789873787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALKVDnESABRZmUOg2I7SKOBTtWppnEDzB82ISkvwYxg=;
        b=DF5Bqf+SR2b5x75uKyeq/kXHqxDQ3C2omaJeBolDDrbvmFS3Ok1epzq+GF6ZDIcJjl
         9aVnYXJXq/+n/Ekt73zVPut0lMU0THGU/mquIVN2Z/OV5KYDNQcHU38LRQcFMY9/K0Ws
         GjbbFTwORLymkqHluC1vho1A1gKvb38ZIafdfACgd38nPUzsPtNAST1ZgjaA9dA7qD1/
         nMyU9BQ5/DUfCCicGn4j2/yaOmZIXXP3wZQd1h4AtQeDqV7TKuI3I9tw1bgF8JL4SEqL
         5q0dA/BMUWxtfJkNg1iukcDfC3NrmrUvzWw75UXK0Zn83xdVKy+86xkaqkzDgjDqdJ+0
         Ctag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789268987; x=1789873787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ALKVDnESABRZmUOg2I7SKOBTtWppnEDzB82ISkvwYxg=;
        b=l3DACoz6T7WeQJNBEBpYEjGaICx4xyRwGS/sG84jL8XxOSCHSZSxJL1pB6DvzGX+GX
         XhG/WeizspEYFcnomJxbc/m8lO0ALOd+BW4qm+/ibxh1tRCeaqOuNg+rKCUEfb0srFnC
         USRlGASjmLt6lHzePODtut2emGMhKqmuFLDvEnCVYFjPTdKZQGuw/hF7XaQUpEaJYnyr
         YybWYUjTQvyyZQyGNOqS7dvuPTPKVV2eoroacgM7tu0KP7Azd6DxERC4r9LHc5o57SA3
         PUCvTYqW8wjSupyttUhFuX592UWoQdAysiAyDrEYUcHduRg89r8qm6z58qx03huIfnhq
         NY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwp9b+227uahOflb02ke0Y4g0T4riDjWyAz5/LKCAM6lFdacM5pQzU+AU0ggVK0hsFmAtGYrIB5WqNU55Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nOdAJUN8Z97GnESxJ0hEmdieJpsGp7k7BFwI/uddBgN7K6Py1G
	NG+U+nPnTXbkPtFcl+9Pe97jgzj7ItzhgPwFIhyukU16lwOvLZbSPZFVS1EEqW4Z
X-Gm-Gg: AYBFou1rqjG1e4O2EeBSg1No6Xj7j+4dq9ubtsHoVuY2+8EEh2OsVaRNJXFySMWdwvf
	fs9iAIRjfSzTlLN9kZB4j0zEr17VbZdvfvmlTbFWoFLxVGlvmfeg3FdQOpHs0YRTkVrC07M21xk
	9gsXncOC+6goOJyW8y1ZUlPbt4DzVlYLrquT43d+EQ/ys/wI/bIiyhR5lzNm1DRaoWULpmkx0P+
	LM5vnkicM6Hgm+NN/Pyx+f30BC7Xy5oGFHPO2Wk1ILFnfbmpDhANGODzg2T5i5bvi1AExse3/WH
	CTGfq+ZoYmyCYJimNmBfAoUcUgw6mer0p8j3TYCPWvlfllrAHVvROQ+V2yH4VxYxkEqVOx3HfUh
	05aUOsrzBw1XKYeLLVYVpvYE8zHJDgJ38Qzrsxd3jK3kj/93oHg9nuFuE5s6wn7IIFxx7ST4Yt3
	b36qkOgQz0DyHaDWGJhcHqMKrUzs+JtReZN4WhDsQ6T45KfTgsWuyPabznJaAOLNG+Dd5NEDOl+
	vvtq8zBMoip3hMypCpNIJNeaRKTvMSUB+CPGu3o9yR+LHlLxe/miwnQ1MknTjlU5lzQu566fFE1
	BEVRJ2texa4m6eLzt9h4wnGZlteUQ6GU0JTWSnmeDsqDZuvf3XUnhuqHPpUEiRtA0SpgYuGAk5Y
	eVj8YrFpo739uJYlPygCW
X-Received: by 2002:a05:620a:4089:b0:936:cda7:554d with SMTP id af79cd13be357-93a0363a407mr724272985a.14.1789268986948;
        Sat, 12 Sep 2026 20:09:46 -0700 (PDT)
Received: from MacBook-Pro ([2605:8300:17:166:1ca:862b:e953:e8d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fc4a9455sm427688985a.31.2026.09.12.20.09.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 20:09:46 -0700 (PDT)
From: Juan Perdomo <jcperdomo100@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com,
	Juan Perdomo <jcperdomo100@gmail.com>
Subject: [PATCH v2] Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
Date: Sat, 12 Sep 2026 23:09:45 -0400
Message-ID: <20260913030945.4011-1-jcperdomo100@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6aa2d63e.6e6c5f9e.28f11f.0036.GAE@google.com>
References: <6aa2d63e.6e6c5f9e.28f11f.0036.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rfcomm_sock_cleanup_listen() closes unaccepted child sockets through
rfcomm_sock_close(), which takes the child socket lock before
rfcomm_dlc_close() acquires rfcomm_mutex. The RFCOMM worker takes these
locks in reverse order while handling connections and DLC state changes,
so lockdep reports a possible deadlock.

Close dequeued children without taking their socket lock. The accept queue
owns a reference to each child, and bt_accept_dequeue() locks the child
while unlinking it and clearing its parent pointer.

Dropping the child lock makes it important to prevent a concurrent
rfcomm_connect_ind() from enqueueing a new child after cleanup observes an
empty queue. Set a listening socket to BT_CLOSED while its lock is still
held, before dropping the lock and draining the queue. The state check in
rfcomm_connect_ind() then rejects new children once cleanup starts.

Reported-by: syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cece8fa7d83523f47a3
Fixes: b7ce436a5d79 ("Bluetooth: switch to lock_sock in RFCOMM")
Signed-off-by: Juan Perdomo <jcperdomo100@gmail.com>
---
Changes in v2:
- Mark the listener BT_CLOSED under its socket lock before accept-queue
  cleanup, preventing new children from racing with teardown.
- Retest with syzbot after its v1 run exposed the accept-queue race. The
  revised patch completed without triggering an issue:
  https://syzkaller.appspot.com/x/bisect.txt?x=156ca925580000

 net/bluetooth/rfcomm/sock.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 958081adb..e2486bc11 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -242,9 +242,7 @@ static void __rfcomm_sock_close(struct sock *sk)
  */
 static void rfcomm_sock_close(struct sock *sk)
 {
-	lock_sock(sk);
 	__rfcomm_sock_close(sk);
-	release_sock(sk);
 }
 
 static void rfcomm_sock_init(struct sock *sk, struct sock *parent)
@@ -905,6 +903,7 @@ static int rfcomm_sock_compat_ioctl(struct socket *sock, unsigned int cmd, unsig
 static int rfcomm_sock_shutdown(struct socket *sock, int how)
 {
 	struct sock *sk = sock->sk;
+	bool cleanup_listen = false;
 	int err = 0;
 
 	BT_DBG("sock %p, sk %p", sock, sk);
@@ -915,9 +914,17 @@ static int rfcomm_sock_shutdown(struct socket *sock, int how)
 	lock_sock(sk);
 	if (!sk->sk_shutdown) {
 		sk->sk_shutdown = SHUTDOWN_MASK;
+		if (sk->sk_state == BT_LISTEN) {
+			/* Block new children before cleaning up without sk lock. */
+			sk->sk_state = BT_CLOSED;
+			cleanup_listen = true;
+		}
 
 		release_sock(sk);
-		__rfcomm_sock_close(sk);
+		if (cleanup_listen)
+			rfcomm_sock_cleanup_listen(sk);
+		else
+			__rfcomm_sock_close(sk);
 		lock_sock(sk);
 
 		if (sock_flag(sk, SOCK_LINGER) && sk->sk_lingertime &&
-- 
2.50.1 (Apple Git-155)
