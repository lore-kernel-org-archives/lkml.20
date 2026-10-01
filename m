Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189FF51DAEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866886; cv=none; b=mH304+vhh+k+0TTDyW1JHOPXK+LiscwXcOG5b6wB0Ve0tRE/E/MQ9+FTEvb5cglkZtUXOXKpCteJQ5aOTPKSOW5tNvVQkpz14s/38+DT+LOdfScDqCz67HveJsuLonsVeEz1Qujv7+0d+Jmhp9uQjmQ8/hrP7RpZ1xc2jEez5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866886; c=relaxed/simple;
	bh=Fx9LIzRQJ1dzk3z4FsDRixuZiDh43a0l/JdqUOahWUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFO2cTIbP2LSpi0F+KLacHMzpsx6ozhOB3uVYtuqx7ZOmDxPfUbgi5d8oFmtxRvnPWtO0DlSgYckFheeTgErYkvp/Dzg2ZLXcgukn5G0sd08j810mpsyqnSFE5Lf0ML3J97FR84QcUQdaoQEtOEyP/FDv5Xwe/fd8KsUFlDAWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFRhmVIX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFRhmVIX"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so42873585ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866884; x=1791471684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/18g52fyWi7SSiANKI+3d34RdqiQMPghAW+kS4u7wIQ=;
        b=cFRhmVIXNcXMpkZaRLPackH4eRSLTEU9Ph9fTL8N/FqaWAXISpN1OuSND3TP8rBQg6
         fbRxXEuBQKMx3a80Pi1g5QetGv0mhEDYCACKVAYPcMfxZ9eBczGcZ5YPRRXotcYK7EjL
         EJLRIEf8YjsDiPupNj+hh3eRW/l7BUv+gHq6HAADVCJVZedNBGU8l/nOsB9hPPLdQgBO
         mTVVLxVZeXbKSsq2Gj6mIQUj8mnSEB0d2hDxTnl5RZfEU+Eu6r2c/Te14G5+FVW5MPx0
         yCOHU3uHVGR5vYGUx3OSOTchkZFGHH5/nxNqomXj15XlYvVL/5wLwzahgdpFBJpvZ4qX
         5zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866884; x=1791471684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/18g52fyWi7SSiANKI+3d34RdqiQMPghAW+kS4u7wIQ=;
        b=0gd8iM0UD2M78tqowSN8IWnHngT+tkNnP4vii8Ct2dssHCKlIp7WjqKGgWTsx0MpnX
         ATjQ/1D0g4joD5crJdFxMX5gXqKWDbqHC02OnH6C1ChpajCgFxF8i59pjOi2bsuBn7pI
         eUYu/oUhLqql7IzCG8upJ85aEi4yuvCu9BXXdFyHkM68hAj2tO3cxPq+S4+sOckuivfj
         J7wFZvO1bznx4BbtDjy2pmFwqk8Ncf2Am3ukcHB7lGJ9J+9jMmZbkcl3DZS0CQqQXevE
         4uNFI4I+z84DmAW2+iHJh/z3zBEOdJSaluj2fUNeKEbxuUiVwhfMIUXSXIGxPbrbyvxF
         OxyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1R+M3WBfXLqrdZgLoWHD6KvjzjtXwdI0xu80QZioLKSu8FLPOYh8EjoLAIxU4Aqo4tvBO5/QJjONHz1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTjzRmSCYhLhxBzbqB2qPF8pSJgviz9n4Ui0bLiUGL34U2JzON
	Rwe5trx6xEz1f5sblnvy+g0QDy7mBakh3Zi/LNeSC2oikQOibk1z82SM
X-Gm-Gg: AYBFou1OXEB6z/FkKYmlcRuKUEmcQueFCEd9GHn9FnW3pNKhb/T8/Obf29VuO7SZ6Jr
	wIkrITDUo2KgpzuZj0eyQm/Vp5MIPCyhzFd/i/qjfXtPyK9b/K+XIjcB2hE7YrX5qu6kq3ekCzC
	Mf8SfbH6FLldcksONDKdnRhV0gquKgA26aTdIEf3JZcINBgjLDevo5BDvMBJ63ab6/cLlFN+Xvg
	OtJDR0EAHbggZJPF0BMc9Q62m91b+BCl409CN3XZBqjp0dN0uISnK+EOm95A6tKrPuDVGg47Vzk
	5QTWTc9BcNDVVREQL/T1P5ChSX5T1SFiK0DD0VJNx7mvwOTBHTaS2K68EcsgZDVR4CTeEyMH8G7
	2wn6l8L9J/ZnIMNZ9PUPHTuEmHXV/M52miS5gm95q/JMa31978L4962xIMgsLY7w3hqDjP7AK3O
	gynjCRr06nBwOqsm5EACwaVoB6Y99PSqIEmMYokGc3CRjD6SH8AnbR41eztR3qayHq6Zs6ZOlD
X-Received: by 2002:a17:902:fc4d:b0:2dd:7646:35cd with SMTP id d9443c01a7336-2e2e43cc01dmr47103035ad.0.1790866883936;
        Thu, 01 Oct 2026 08:01:23 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d457:2e1e::498:2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e31cf35578sm5718675ad.80.2026.10.01.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:01:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Duoming Zhou <duoming@zju.edu.cn>,
	Lin Ma <linma@zju.edu.cn>,
	linux-x25@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9faa82ae2e94c5c7d2ef@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH net] net/x25: don't call lock_sock() from softirq in x25_kill_by_neigh()
Date: Thu,  1 Oct 2026 22:01:18 +0700
Message-ID: <20261001150118.128470-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x25_kill_by_neigh() is reached from the receive path when the link layer
goes away or the peer restarts:

  net_rx_action()
    lapbeth_napi_poll()
      x25_lapb_receive_frame()
        x25_link_terminated() / x25_link_control()
          x25_kill_by_neigh()
            lock_sock()

lock_sock() may sleep, which is not allowed in softirq context:

  BUG: sleeping function called from invalid context at net/core/sock.c:3832
  in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 29, name: ktimers/1
  RCU nest depth: 2, expected: 0
  ...
   lock_sock_nested+0x56/0x130 net/core/sock.c:3832
   x25_kill_by_neigh+0x134/0x2a0 net/x25/af_x25.c:1778
   x25_lapb_receive_frame+0x1b0/0xfb0 net/x25/x25_dev.c:138

Take the socket spinlock instead, the same way the x25 timers and receive
path already do. If the socket is not owned by user, disconnect it right
away. If it is, mark it with X25_KILL_FLAG and let a new release_cb do
the disconnect when the owner releases the socket. This keeps the
serialization against x25_sendmsg()/x25_recvmsg()/x25_connect() that
commit 7781607938c8 ("net/x25: Fix null-ptr-deref caused by
x25_disconnect") added lock_sock() for. Sockets that already have the
flag set are skipped, so the rescan loop always terminates.

NETDEV_DOWN runs in process context and the device may be freed right
after, so keep waiting for socket owners there as before: a sleeping
sweep makes sure no socket still uses the neighbour on return.

Fixes: 7781607938c8 ("net/x25: Fix null-ptr-deref caused by x25_disconnect")
Reported-by: syzbot+9faa82ae2e94c5c7d2ef@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9faa82ae2e94c5c7d2ef
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU with the syzbot config (PREEMPT_RT, KASAN, lockdep) and
the syzbot C reproducer: the unpatched kernel hits the BUG twice in 240s,
the patched kernel runs 300s clean. The owned-by-user branch was
exercised with a temporary debug hack forcing the deferred path:
release_cb disconnected the socket and userspace saw ENETUNREACH.
"ip link set lapb0 down" with a connecting socket also disconnects it
right away. No lockdep splats in any run.

syzbot also has an AI-generated workqueue variant of this fix in
moderation. This version keeps the teardown synchronous for sockets
that are not owned, so a link that comes back quickly cannot have a
stale work item kill freshly connected calls. Owned sockets are cleared
when their owner releases them.

 include/net/x25.h |  1 +
 net/x25/af_x25.c  | 62 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/include/net/x25.h b/include/net/x25.h
index 414f3fd99345..ed8ba01fa3cb 100644
--- a/include/net/x25.h
+++ b/include/net/x25.h
@@ -118,6 +118,7 @@ enum {
 #define X25_Q_BIT_FLAG		0
 #define X25_INTERRUPT_FLAG	1
 #define X25_ACCPT_APPRV_FLAG	2
+#define X25_KILL_FLAG		3
 
 /**
  *	struct x25_route - x25 routing entry
diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 033e7d059f58..4f9ca22231ac 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -200,6 +200,32 @@ static void x25_remove_socket(struct sock *sk)
 	write_unlock_bh(&x25_list_lock);
 }
 
+/*
+ * Process context only: wait for owners that x25_kill_by_neigh() deferred,
+ * so no socket still uses nb once the device goes away.
+ */
+static void x25_kill_by_neigh_sync(struct x25_neigh *nb)
+{
+	struct sock *s;
+
+again:
+	write_lock_bh(&x25_list_lock);
+
+	sk_for_each(s, &x25_list) {
+		if (x25_sk(s)->neighbour == nb) {
+			sock_hold(s);
+			write_unlock_bh(&x25_list_lock);
+			lock_sock(s);
+			if (x25_sk(s)->neighbour == nb)
+				x25_disconnect(s, ENETUNREACH, 0, 0);
+			release_sock(s);
+			sock_put(s);
+			goto again;
+		}
+	}
+	write_unlock_bh(&x25_list_lock);
+}
+
 /*
  *	Handle device status changes.
  */
@@ -222,6 +248,7 @@ static int x25_device_event(struct notifier_block *this, unsigned long event,
 			nb = x25_get_neigh(dev);
 			if (nb) {
 				x25_link_terminated(nb);
+				x25_kill_by_neigh_sync(nb);
 				x25_neigh_put(nb);
 			}
 			x25_route_device_down(dev);
@@ -495,10 +522,20 @@ static int x25_listen(struct socket *sock, int backlog)
 	return rc;
 }
 
+/* Finish a link teardown that hit while the socket was owned by user. */
+static void x25_release_cb(struct sock *sk)
+{
+	struct x25_sock *x25 = x25_sk(sk);
+
+	if (test_and_clear_bit(X25_KILL_FLAG, &x25->flags) && x25->neighbour)
+		x25_disconnect(sk, ENETUNREACH, 0, 0);
+}
+
 static struct proto x25_proto = {
 	.name	  = "X25",
 	.owner	  = THIS_MODULE,
 	.obj_size = sizeof(struct x25_sock),
+	.release_cb = x25_release_cb,
 };
 
 static struct sock *x25_alloc_socket(struct net *net, int kern)
@@ -1764,6 +1801,23 @@ static struct notifier_block x25_dev_notifier = {
 	.notifier_call = x25_device_event,
 };
 
+/* May run in softirq, so lock_sock() is not an option. */
+static void x25_kill_sock(struct sock *sk, struct x25_neigh *nb)
+{
+	struct x25_sock *x25 = x25_sk(sk);
+
+	local_bh_disable();
+	bh_lock_sock(sk);
+	if (x25->neighbour == nb) {
+		if (sock_owned_by_user(sk))
+			set_bit(X25_KILL_FLAG, &x25->flags);
+		else
+			x25_disconnect(sk, ENETUNREACH, 0, 0);
+	}
+	bh_unlock_sock(sk);
+	local_bh_enable();
+}
+
 void x25_kill_by_neigh(struct x25_neigh *nb)
 {
 	struct sock *s;
@@ -1772,13 +1826,11 @@ void x25_kill_by_neigh(struct x25_neigh *nb)
 	write_lock_bh(&x25_list_lock);
 
 	sk_for_each(s, &x25_list) {
-		if (x25_sk(s)->neighbour == nb) {
+		if (x25_sk(s)->neighbour == nb &&
+		    !test_bit(X25_KILL_FLAG, &x25_sk(s)->flags)) {
 			sock_hold(s);
 			write_unlock_bh(&x25_list_lock);
-			lock_sock(s);
-			if (x25_sk(s)->neighbour == nb)
-				x25_disconnect(s, ENETUNREACH, 0, 0);
-			release_sock(s);
+			x25_kill_sock(s, nb);
 			sock_put(s);
 			goto again;
 		}
-- 
2.43.0

