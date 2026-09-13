Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22EC8EB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789264275; cv=none; b=c90p3uMmmkOXDUnuOTXRx1Qeo0zvpCY1m6AHUl8G0J3Mrw4J9knz7CXvjJXoVcDYfC5CYpWXFaDJdeHNLSv5s3V9SfDgK/+Kiruko9zKaL7C1S4IrciXe2VNSdeABqV0uA8fxxQ9ldsNzvjsu6ehqaCxRlDr/U0tQ22aB19AcyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789264275; c=relaxed/simple;
	bh=a9ySPMmoFfHf7cBCgt8ToSrN1Y4HJ8xpr2LS81FwAd8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nsRwVl1KTCejxFGDCvkDtJ6ZsNpGvdqxuF3TbBEW/WP3RqigQm5N0I/q7HzbBjxFhjzA0sSfITolRweh5mdNbMZ5wrZ8hMfhpBBWfVbjkFSvWvYJR7GhUC8jS/0P6N4gtAaoFX7ZQ0MJjv8cwW9yrnzkxlb2iGG3j5elt7aBRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4574f1cac98so3773232fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789264273; x=1789869073;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+I5G/uvGz80KLK2j9JI46yLh0+Yl7dVkaQTJYPRPP+A=;
        b=rMMXH+TaZRSa9MUi7aT9ovnzki9IkN0RcwjfdLfgtsp3D4Is2uiUzoEXmLFZmqYtTl
         +KPZ50PpIQRQlA9fOeNhIya2k4YBKak6wbLIpSQZqc376f44dZO1FZdRudmHi1MPnt0V
         YwKMt/0wXPKHRhEe4PqmphJaPXOgYeC4btEumM5PQkbAh+Jyx+DbEnypB1Dq9NarvvjF
         fkNQoKJX17eXpHkYx/Kb8FqmgjGT+3xvSzVsIuYDRitt05ype8vbyYCBMGr2oJLFKebi
         IefdF/5jgML5lydTj1NmHIFt2XBFuMhz6AQeKK4Jq5ig1q+yDej6u9TYiBHW91RZVkN4
         eQJQ==
X-Gm-Message-State: AFuF++nC/QN5E8dlVC/EKe23mHI/jl7oh6Y7qPLlRtSb38SzkwWHKi8q
	ogE/urewtImJHYMbuLAr+/Nr574kf5THpXKBFHffW82BX9Hna2tq/fAiIvhaGXAy+sfUfao/5K0
	nIcGCvFKTex6WsnYn6O9SyX5mgwm7xFHwAoYzZpIJEyhPrnSjSP7CdrYpdBE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:560b:b0:6b7:83c5:fe01 with SMTP id
 006d021491bc7-6c0bcfa88femr4222287eaf.66.1789264273373; Sat, 12 Sep 2026
 18:51:13 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:51:13 -0700
In-Reply-To: <6aa2d63e.6e6c5f9e.28f11f.0036.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa60191.f81106d8.2ab401.0031.GAE@google.com>
Subject: Forwarded: [PATCH v2] Bluetooth: RFCOMM: avoid socket lock inversion
 in listener cleanup
From: syzbot <syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v2] Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
Author: jcperdomo100@gmail.com

#syz test

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
