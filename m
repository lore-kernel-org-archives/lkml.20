Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855678;
	b=s9ey1hMU81aWKXUTBYGDuZWR3/Vq9p+UEq5+6ZqNQYA+s8vld07T5NYefdMvihby+qw8
	 YDxCfk34ZDSGWehi5XzNwIiMYMKPJHYs5kTp+AWmqD9/CyiGPVPB+buUrD3MYZMjBGf/f
	 z2cFZ0lGFgJVRYNQ5IryH9pKR8GlXdy8HQ+eUikRGD8Yqn9dAeClGUWEzghaeX9jCPPc7
	 VBgDjWOJWMQ7TvtQbSXtLBTmNDAkWPN5L+6kxpZtvsuo4ZUfZBOtRbJZkXDkuTaOhbyaG
	 D7uyu88UtRVLRQcvbY8nJ7pn+3MWpQHZrug5ln2wHc4qa5TTyla0tjFHjgFiKcVhmtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mElhP/ecybx1CHryPEfZ2rqVqQNJPxmya9RqbFWTsKg=;
	b=hN/DOk1ydTIjnNghiOAaQIQMJxS8Nn4osVOlO8DFnAvCaDNrNtwTl+9+nySmU2rOmK6f
	 c7KK2khJAOuRIgt48dOPp35XWnuqz4InOmwDLA4J+15xJVFHnSsFbUOe4dTZzjzsf/6f7
	 9s/+n1+NFkHP7dvMd9lxzhEVFlesooaIZ1EROypXr/uPi41fqQGrPRhV+c/9bkUbqnwti
	 0Vhv5qpF5CLn57/+/96HEdtrQgQDb1/6tIUWDgkvkZecOzTzmxGuB9TEBXsV/JVmT9CGF
	 74K3oowHNmCOz8T6TSiuiGl/c0K3KjIp7ntBdju6xj6rMC0XOZQVoCRAzY4zxBOimug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=MIGThasu;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7417E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=MIGThasu
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1991530a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794855678; x=1795460478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mElhP/ecybx1CHryPEfZ2rqVqQNJPxmya9RqbFWTsKg=;
        b=MIGThasu67UTC+QQ89EKRNcs0Hu3rQJi1FQP2JeEHovAQ/8sluTZBgMC5zcpkSt2Oy
         WEc9VNlLZwFWyuh9tURYWWRTaQwpLYN2EaYrmw6XZ8SKuq7limgeDx4hZYABIliYxZKb
         cQosdCN8wW8EfzSWdz4HtIgkfvWp4PEjqcnCZvrwsyQrNVZnPxv/LLHxdcLPsu1XiAhM
         Y4QwpzbN/gLRTgKH7rPF5B3Wyv56+Ghgq2YSFMb3MQHuaXY2uzQwVaepIOgpt060CH8x
         IGDyery1M2x4IPwSkUd+3CwIdpUNeoU3Ldml3ovEIlgpFrnN+C9aki2nL8OjJcGIS1v7
         RrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855678; x=1795460478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElhP/ecybx1CHryPEfZ2rqVqQNJPxmya9RqbFWTsKg=;
        b=zDZsnVRKBKQh/gtT8PjBu7THVYSTu7qnLyUoS7w1D+efS7CyQ7rpBaZ98BaO9Z4CYf
         by46JCS7NeZcmLemS6uOjtr0PWan+U/P/PKdWKHkg80ncLR+y3qqA1Aj/lObyDtt3IB9
         gc2hSuqOGDiXoQxrtQvRadgyaZgd+EmPiCWEefQsd/up3+8FD9sGtzeDqt+uMdgjqKwW
         ZNC2TE8SpPCkoGhHTCeCWnHOWq8sglpnImUx2Z+zQmpIoFehp5oGEOwgnaEzYySuIG2d
         xnh5lZ3IlQXBe2HqoxXX7jjgc/5PFqNoqryIWnLKjspEdlz9pNNToDflWkcSgf6mlvht
         q76g==
X-Forwarded-Encrypted: i=1; AL+hErEzhzSwZH3FE316kZ2sxqgA1GXRvASTtkZBsNZ/HmxlHwGwMMSTELS75eDAhbf/khqd+M/ZvNOoixs5k9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sqr8bgaQDdxX3/5zL+z3tf1AtY1gHp5lyZSPFWhdzI/osppbQ
	7uN8tchc85GWFEAMMtxIFjFi2ZBGr2WzxyWrjT3e8PWIJon2dmu4KT39cZj4TedAkJH+l+IaLhI
	HyUtqI1trPpUcIkd+z1Wjn9KQyx+CVeP1I0kO9KeSsLbH/0xxmaeM
X-Gm-Gg: AZFdTZdxo63c8QuWgmjLzQRWzq/xu7kqE0gigu7h+hfY/chGCKCupRqFnqWCCpSfViW
	R0Rwk2C8iRM3i9+sjBnF+QoTWcxz+SrdnKU04GRFBqLXYY06jsNHkz6HlPjy9qST3ntBDQ2NWPe
	ga9icKyZrEJhMNbgmDjllVDm2BX2JK6xEYyAoQAuIj2U6WP13KJ5TQQzehy3N+xwcE4G2T+Zf1R
	6DBxy4JPtVHaWj5t3cEaMGQcb8XiCI5X7/CZWUlkvQBDzLigAJS8m96v48ofllhbORy8SRZyfcc
	gw5dO1ld2wrlUlGD3cRncSvPDYDVyDe47XIaTYyi0FxJSOSVi3YD4Xq04pcMeFLc05c1OR0pm7w
	NCD6QayMv8XK5U9U1BDcl
X-Received: by 2002:a17:90a:c88b:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3b1b0b5316cmr11493330a91.45.1794855677419;
        Mon, 16 Nov 2026 11:01:17 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3af69e8d4sm8366a91.2.2026.11.16.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:01:17 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 88344401CE;
	Mon, 16 Nov 2026 12:01:16 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 8205DDC0D05; Mon, 16 Nov 2026 12:01:16 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: jiayuan.chen@linux.dev,
	Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Dave Watson <davejwatson@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v8] kcm: reject TLS on attached TCP sockets
Date: Mon, 16 Nov 2026 12:01:08 -0700
Message-ID: <20261116190111.3317976-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

Neither kcm_attach() nor tls_init() rejects the other, so KCM and kTLS RX
can be stacked on the same TCP socket in either order. This breaks in
several ways:

- KCM calls read_sock() from its receive callback in atomic context.
  With kTLS RX this reaches tls_sw_read_sock(), which can sleep.
- Before tls_sw_read_sock() existed, read_sock was tcp_read_sock(), so
  KCM consumed raw ciphertext from the receive queue that TLS parses.
- Both install socket callbacks. kcm_unattach() restores the pre-KCM
  sk_data_ready over tls_data_ready, so TLS RX stops getting notified.

The sleep in atomic context was reproduced on an unmodified kernel with
CONFIG_DEBUG_ATOMIC_SLEEP.

Reject sockets with a ULP in kcm_attach(), and make tls_init() fail while
KCM is attached. A tcp_sock boolean, present when CONFIG_AF_KCM is
enabled, tracks attachment. It is set and cleared under the transport
socket lock.

Also switch the transport check to sk_is_tcp(). The family and protocol
checks alone also accept raw IPPROTO_TCP sockets, which have no tcp_sock.

Validated with KASAN and lockdep: connected IPv4/IPv6 raw sockets, both
attach orders, detach, and concurrent installation.

Backports without commit 8cc3aef0cb198 ("tcp: Do not allow buggy
transitions between ehash and lhash2.") must also prevent attached
sockets from becoming listeners after disconnect.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Cc: <stable@vger.kernel.org> # needs 8cc3aef0cb198 or equivalent, see above
Link: https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55@linux.dev/
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 Documentation/networking/kcm.rst |  3 +++
 include/linux/tcp.h              |  3 +++
 include/net/tcp.h                |  9 +++++++++
 net/kcm/kcmsock.c                | 16 +++++++++++++---
 net/tls/tls_main.c               |  3 +++
 5 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/kcm.rst b/Documentation/networking/kcm.rst
index 71f44d0beaa3..07778f29211c 100644
--- a/Documentation/networking/kcm.rst
+++ b/Documentation/networking/kcm.rst
@@ -167,6 +167,9 @@ The kcm_attach structure contains:
   - fd: file descriptor for TCP socket being attached
   - bpf_prog_fd: file descriptor for compiled BPF program downloaded
 
+The transport socket must be a TCP stream socket with no TCP ULP installed.
+TLS cannot be enabled on a transport socket while it is attached to KCM.
+
 Unattach transport sockets
 --------------------------
 
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index e6b79cf4798f..d4b07fbae2d5 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -516,6 +516,9 @@ struct tcp_sock {
 #if IS_ENABLED(CONFIG_MPTCP)
 	bool	is_mptcp;
 #endif
+#if IS_ENABLED(CONFIG_AF_KCM)
+	bool	kcm_attached;
+#endif
 #if IS_ENABLED(CONFIG_SMC)
 	bool	syn_smc;	/* SYN includes SMC */
 	bool	(*smc_hs_congested)(const struct sock *sk);
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 5c9203aae834..5e99d3142f5e 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -2882,6 +2882,15 @@ void tcp_cleanup_ulp(struct sock *sk);
 void tcp_update_ulp(struct sock *sk, struct proto *p,
 		    void (*write_space)(struct sock *sk));
 
+static inline bool tcp_kcm_attached(const struct sock *sk)
+{
+#if IS_ENABLED(CONFIG_AF_KCM)
+	return tcp_sk(sk)->kcm_attached;
+#else
+	return false;
+#endif
+}
+
 #define MODULE_ALIAS_TCP_ULP(name)				\
 	MODULE_INFO(alias, name);		\
 	MODULE_INFO(alias, "tcp-ulp-" name)
diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index a7f94d42036f..ca789812124e 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -30,6 +30,7 @@
 #include <net/kcm.h>
 #include <net/netns/generic.h>
 #include <net/sock.h>
+#include <net/tcp.h>
 #include <uapi/linux/kcm.h>
 #include <trace/events/sock.h>
 
@@ -1259,9 +1260,10 @@ static int kcm_attach(struct socket *sock, struct socket *csock,
 
 	lock_sock(csk);
 
-	/* Only allow TCP sockets to be attached for now */
-	if ((csk->sk_family != AF_INET && csk->sk_family != AF_INET6) ||
-	    csk->sk_protocol != IPPROTO_TCP) {
+	/* Only allow TCP sockets to be attached for now. A raw socket
+	 * created with IPPROTO_TCP has that sk_protocol but no icsk.
+	 */
+	if (!sk_is_tcp(csk)) {
 		err = -EOPNOTSUPP;
 		goto out;
 	}
@@ -1272,6 +1274,12 @@ static int kcm_attach(struct socket *sock, struct socket *csock,
 		goto out;
 	}
 
+	/* KCM and ULPs cannot share the receive path and socket callbacks. */
+	if (inet_csk_has_ulp(csk)) {
+		err = -EOPNOTSUPP;
+		goto out;
+	}
+
 	psock = kmem_cache_zalloc(kcm_psockp, GFP_KERNEL);
 	if (!psock) {
 		err = -ENOMEM;
@@ -1305,6 +1313,7 @@ static int kcm_attach(struct socket *sock, struct socket *csock,
 	psock->save_write_space = csk->sk_write_space;
 	psock->save_state_change = csk->sk_state_change;
 	csk->sk_user_data = psock;
+	tcp_sk(csk)->kcm_attached = true;
 	WRITE_ONCE(csk->sk_data_ready, psock_data_ready);
 	WRITE_ONCE(csk->sk_write_space, psock_write_space);
 	csk->sk_state_change = psock_state_change;
@@ -1386,6 +1395,7 @@ static void kcm_unattach(struct kcm_psock *psock)
 	WRITE_ONCE(csk->sk_write_space, psock->save_write_space);
 	csk->sk_state_change = psock->save_state_change;
 	strp_stop(&psock->strp);
+	tcp_sk(csk)->kcm_attached = false;
 
 	if (WARN_ON(psock->rx_kcm)) {
 		write_unlock_bh(&csk->sk_callback_lock);
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index b8d5a843f761..fa71c75c2861 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -1067,6 +1067,9 @@ static int tls_init(struct sock *sk)
 	if (sk->sk_state != TCP_ESTABLISHED)
 		return -ENOTCONN;
 
+	if (tcp_kcm_attached(sk))
+		return -EBUSY;
+
 	/* allocate tls context */
 	write_lock_bh(&sk->sk_callback_lock);
 	ctx = tls_ctx_create(sk);
-- 
2.50.1

