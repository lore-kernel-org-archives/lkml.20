Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759538;
	b=wH2zulsrK/jLj5DIT6eC5oY+q/d2N9M6DRAPaGjMfMpoWP2ALy7XVLn2JR7qt73PA0Cx
	 1kBkOP3UrFLdoi0dLiWXIHyGjMQ/cpO1Y4d4o3G44FcHqfZbRgHmuZfrrj2A33S5t1Y5G
	 73pmw20GEoxc0px7iJ32bP0GJ3+bUoDmnsCwEqLlJP6QXdusuaeQuYqYzAqE4KXCx8DHa
	 N7LFhits6C8O6tEymApx1IwW0EMkQNZXhlIg3aA67NIXR/qVq9+UMu9oQpFlPzRt1AB8X
	 KTNGTUwAEcUDkJDC2c+MldEM6sEv304K6mYWzdwYd1aFpg7BPK4yilVxbt76hQRxgkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759538;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=wLeP02jmayXugbf1gYu0sGHCjbqVPdP8sGgIACyUIa4=;
	b=12EJNkMnXAZSjvpvG77khtA9bR5pyHdc2vJDmGFJkCsiQLRxJZk61GwcF/xl/NNUKb7d
	 Yo/ZWqtH7I1mvOK87efQGj0cdXtd9sD01un7aGi+K727k5Tuo6o8Ktmw5zGDwMros9Xp7
	 v9r86hPkc7hr4xB2fYadQRw1mv2yjY+K5ziYW/GDqZwHmx09wVq8WwJjPom4rGr4ZTgbO
	 kaGKIal9vMYev1qeymE0Rgh+JUVmGEbStUtxKhYbPx2iM5+BiFNk/A17o6fxfHReFN2wo
	 kesMX2Y7YMobtSs5jtH58a5WB/UnTDflrHFYkfmtSZNcamBfz/0aPb5FjlBIYjOjpzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="ZM7Mi/Os";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53848606A31D;
	Sun, 15 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53848606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZM7Mi/Os
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wL
	eP02jmayXugbf1gYu0sGHCjbqVPdP8sGgIACyUIa4=; b=ZM7Mi/OsOHs4YY2TOv
	wugfopZjlrqJZ0V50EozqHHtQjEFBYlre0j+RsCw1Zn64H9+yuMAn7YP8nmQBbQ/
	pAAs0ICJXMIJnt2NgF6fZ4xIr6RJPSgF27B/QtwjBSsXqJiMyjQTcTiXxsNMiwP4
	1HpWNAYpq0B3q6+yR1JG6urkg=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCXDpxM2_lqrZVaGA--.8842S2;
	Mon, 16 Nov 2026 00:18:20 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: do not use SOCK_INODE() in sock_init_data_uid()
Date: Mon, 16 Nov 2026 00:18:20 +0800
Message-ID: <20261115161820.941166-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:QCgvCgCXDpxM2_lqrZVaGA--.8842S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF17Cw4DZryktrykuFWUXFb_yoW5JrWrpF
	y5tFW3J3yDAr4kZrn5JFWkXrWfAw1fCa17GFyrZ343AFZ0gr4rJrykt34DAFnrKrs5Ga1f
	ZF47W348ZasxCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9sqAUUUUU=
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7gwjc2r520w4WQAA3X

Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
sock_init_data_uid() calls sk_set_socket(), but its only direct users
are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
are embedded in struct tun_file and struct tap_queue, not in a struct
socket_alloc, so SOCK_INODE() points at whatever follows the socket in
those structures and both reads return unrelated data.

sk_uid is overwritten a few lines later with the uid passed in, and
nothing reads sk_ino of a tun or tap socket today, so the result is
not used. The reads themselves are still out of type, and with
CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
tap_queue.

sock_init_data_uid() was added so that tun and tap would not use
SOCK_INODE() on these sockets. Set sk_socket directly there, clear
sk_ino, and let sock_init_data(), whose sockets always come from
sockfs, fill in sk_ino.

Found by LLM-assisted source review and confirmed by code inspection
only; the out-of-type reads were not triggered at runtime. The fix was
build tested only; it was not run against selftests.

Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---

Notes:
    The changelog was drafted with an AI assistant from my analysis;
    I have reviewed the code, the fix and the text.

 net/core/sock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878d..b4499be84 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3831,7 +3831,11 @@ void sock_init_data_uid(struct socket *sock, struct sock *sk, kuid_t uid)
 	sk->sk_sndbuf		=	READ_ONCE(sysctl_wmem_default);
 	sk->sk_state		=	TCP_CLOSE;
 	sk->sk_use_task_frag	=	true;
-	sk_set_socket(sk, sock);
+	/* tun and tap pass a socket that is not part of a socket_alloc, so
+	 * SOCK_INODE() must not be used here. sock_init_data() sets sk_ino.
+	 */
+	WRITE_ONCE(sk->sk_socket, sock);
+	WRITE_ONCE(sk->sk_ino, 0);
 
 	sock_set_flag(sk, SOCK_ZAPPED);
 
@@ -3897,6 +3901,8 @@ void sock_init_data(struct socket *sock, struct sock *sk)
 		make_kuid(sock_net(sk)->user_ns, 0);
 
 	sock_init_data_uid(sock, sk, uid);
+	if (sock)
+		WRITE_ONCE(sk->sk_ino, SOCK_INODE(sock)->i_ino);
 }
 EXPORT_SYMBOL(sock_init_data);
 

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

