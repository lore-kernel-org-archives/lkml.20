Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796655;
	b=gqNrVe0KIT8SCCU//2jk/BwL9SB8RaE/Zc0rs74kS7rlo8xII8lRmqrxVFJC8cW2qh+L
	 G4Oc6bpDeTeN7PRyjYCVwos2Ul4UWe+004ILiucia3TJsMOCWFtPiCJEjFpVxnZKMe1md
	 UDqjS4CjWia+m4PTk5GpKlClvIjo0rz1tZvuJnUT4oHPPrsOVfWttgGLqa2lgOXkujU5z
	 pfl7Z7gSdPESQ/93Agj6VVc0+P5Qvyd0pD2sDzmydGwdYTzTEVfJm/oaAhwLR3h4dQCBT
	 PDhN18QKNVML2qQPpBSdkcFbmQ63rQuas5TyiA42knGpUcB4SC+4Rz35iEBf0X0w+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UPGLnT3o5TFQ+obI7scJKkNfnpr4A9jykSubldPZ8ds=;
	b=mBCib3DmVuP2g4Nk0Yof7rle0oSjn7MJZFyZ12Fu8lB4YuEQN0WmuVYhWs+Zam5Z7ia4
	 yYhDiisiLf8QBcCqYG7v6oYQ8u9eVjGa7+0DfoLtniYBn1AqFGPNNfjVN4xYoyIY4UULB
	 Z2fea/re+Ix1MdGo32A4Tm5O52bSys7jiaYnw6sdLGz3c/v0ewTyqtuNu1n43i+yvYCqg
	 Ww4ia142PgWRhJzZK3IFsusUANJh8qctK5/PRmO3Oy440Z420t7WyONqU+ClCDMBTucV1
	 Ox5fCR6egYrk8rhRiIJiPXIktsRsSDd/Olp6acaWAaMBuRJaZ7jnT/Z0RuKV7iFlFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mvHWxbEJ;
	arc=none smtp.remote-ip=209.85.222.70
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F98606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mvHWxbEJ
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0a55e4b4so357401241.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796654; x=1795401454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPGLnT3o5TFQ+obI7scJKkNfnpr4A9jykSubldPZ8ds=;
        b=mvHWxbEJhqO1FyR/SWdfvbTphNNOtCT2h1mTUKcZNjX6LNGYbziuDqcn5XZjsEtXih
         Vr86zCSMkXxK2t6lwUkbaQo9wFIHJIu9RNkKIgkzmMAJuFhTZ/VC3ABe7sOM2wJSAN2G
         hBY4ddxQMz9OTb1yWLncxZllzfRtD0vLQF8DL6VlcvwdEXlqkiso+JMELoVVWNhx9k95
         GxQZ9uZqiRKRxfcVmyooWesE6sptw5JSYbxWvYleco8lrYlA8gFafp4dB9hVI8/UujXy
         0Z57e+44Exb5B9vvlD9ubmy22oEYA4VmvD0V7cC792Mc+5kCjE+RvM4wEsaIYabAh5HJ
         d/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796654; x=1795401454;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPGLnT3o5TFQ+obI7scJKkNfnpr4A9jykSubldPZ8ds=;
        b=lQ5kId29s05rXl71xwqtubdMsIDjrV404sScutoaiFm/CnUGGLeULVzHS7VBvSKpeO
         D9IarW25llNpCbzzvyOifrzjUU8ftKA0jcj8m3zAGZB+2bEt3lW72b0klWYtRIiWCjv0
         idvahDxK+CnkVOwdVNQhYU8CtxNPskBCtZRg3iaPPmZZ0ubqfCqAIEyhUdV5KQ+IFTrP
         N95hgCb94LzrIUrEJmH+IIyrA9LVZo6hGI3wXfRxOunK4/NlJ3BoC07Rx39q3DNWXN7j
         xX8WbSSe9I+sYvLHvy06Ocj5oxl3nggtdOgG2lDI9NGeTXAJ6ETnsKe+BCjXeBUO3F9t
         7waQ==
X-Forwarded-Encrypted: i=1; AL+hErH3a704mS0HQg0r5lCXSPt6R52w+FplbX2mOrQfN+130tGyhlNbe/jodj9DAg7XZzwJvMSDPZoEiMYh3BA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bwew35T7cNDh37vrX5blznid2mWUbA4tkAATE5TZzEH47Ufrj
	G0Hfdve+y+C2QIgGDVHB8PwlqktN78kjmQ63ScTQTkoUgt4r/TlqzoifUiEMfbK1ViriGLm8RKG
	LQGX9i0HNX/865oRoVYyKc2NtVw==
X-Received: from vksv23-n1.prod.google.com ([2002:a05:6123:5d7:10b0:5ee:384e:95e])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:4192:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d64d8cab8emr2681411137.31.1794796653906;
 Sun, 15 Nov 2026 18:37:33 -0800 (PST)
Date: Mon, 16 Nov 2026 02:37:08 +0000
In-Reply-To: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023709.132684-2-thaisonphan@google.com>
Subject: [PATCH net v2 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()") moved
the LOOPBACK4_IPV6 initialization for passive IPv6 TCP sockets from
tcp_v6_syn_recv_sock() to tcp_v6_init_req().

IPv6 SYN cookie connections allocate a fresh request_sock without
__GFP_ZERO and call tcp_v6_syn_recv_sock() without tcp_v6_init_req(),
leaving ireq->ir_rmt_addr and ireq->ir_loc_addr uninitialized in
cookie_v6_check(). inet_csk_clone_lock() then copies uninitialized slab
bytes into sk_daddr, sk_rcv_saddr, and inet_saddr, exposing them to
tracepoints and bpf_sock and causing inet_daddr != LOOPBACK4_IPV6 checks
(such as IP_OPTIONS in do_ip_setsockopt()) to misclassify native IPv6
child sockets as IPv4-mapped.

This was originally noticed via an out-of-tree socket hook observing
inet_sk(sk)->inet_saddr != LOOPBACK4_IPV6 on KASAN test runs. KASAN
enables SLUB_RCU_DEBUG by default, introducing an RCU grace period that
prevents cookie_v6_check() from reusing the warm request_sock initialized
during the initial SYN. Upstream, with tcp_syncookies=2,
SLUB_RCU_DEBUG=y, and slub_debug=P, sock:inet_sock_set_state shows slab
poison instead of 127.0.0.6:

  ... sock:inet_sock_set_state: family=AF_INET6 protocol=IPPROTO_TCP \
      sport=59839 dport=41050 \
      saddr=90.90.90.90 daddr=90.90.90.90 \
      saddrv6=::1 daddrv6=::1 \
      oldstate=TCP_LISTEN newstate=TCP_SYN_RECV

Initialize ireq->ir_rmt_addr and ireq->ir_loc_addr to LOOPBACK4_IPV6 in
cookie_v6_check() to match tcp_v6_init_req(). Tested against a QEMU
reproducer checking inet_sock_set_state and IP_OPTIONS, as well as the
packetdrill syncookie selftests.

Fixes: a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v2:
  - clarify how KASAN (via SLUB_RCU_DEBUG) exposed the uninitialized
    request_sock, how the issue was observed, and include the
    inet_sock_set_state trace line (Eric Dumazet)
  - add Reviewed-by tag from Eric Dumazet
v1: https://lore.kernel.org/netdev/20261114161248.3428695-2-thaisonphan@google.com/

 net/ipv6/syncookies.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
index b581cb1ee2e8..b33011b71fff 100644
--- a/net/ipv6/syncookies.c
+++ b/net/ipv6/syncookies.c
@@ -17,6 +17,7 @@
 #include <net/ipv6.h>
 #include <net/tcp.h>
 #include <net/tcp_ecn.h>
+#include <net/transp_v6.h>
 
 #define COOKIEBITS 24	/* Upper bits store count */
 #define COOKIEMASK (((__u32)1 << COOKIEBITS) - 1)
@@ -205,6 +206,8 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
 
 	ireq->ir_v6_rmt_addr = ipv6_hdr(skb)->saddr;
 	ireq->ir_v6_loc_addr = ipv6_hdr(skb)->daddr;
+	ireq->ir_rmt_addr = LOOPBACK4_IPV6;
+	ireq->ir_loc_addr = LOOPBACK4_IPV6;
 
 	if (security_inet_conn_request(sk, skb, req)) {
 		SKB_DR_SET(reason, SECURITY_HOOK);
-- 
2.56.0.611.g1030f0b940-goog

