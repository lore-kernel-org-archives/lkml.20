Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919646;
	b=16Fy06V3IOgerLhDICME5gbcVRh2/lr8N2bClr7P9Umpwz0/k2FLPKyhjdsy1ETZ/0Q2
	 17QFRysWC0pr0mTjUBbDm78pDd3c9QYY/HBz+APJ+jtWQHbyAdKQLPufUgNWoiICnXtuL
	 D+Pd9Xrc6nZtB7iMWdDUh+70jlZ/St2LJqUlVHviCa9dvcbSI7TVui5pdDn34kikcnDRZ
	 WiLzD5XXobWFfHeQgA4LtHtatlQ4q0XA+J5aLqSfFQ+artQPG4xy1kM5B/l3WijZNFkHM
	 JXbol5C1GMeJxsCP5MwcZ/35YhNQKqXw+OOXBEkjnX8nqwBGPVzz0JnVwXu9DQxaUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
	b=aS7g8MDO1XebxexqdG1g4YJa4BY0yJKPhyeFTmtv2n0j/hH7MMn3lSVzLKjEvwVYdE4n
	 7hiEt79k9hSeyFlqZQoNuI2YfIkxEauvKG+uKYGzQryGp8a4mqXvPwSTWUx1TKAzCD95l
	 nHxxY+anSeXN+qFeosRio00LobSnSBsXSZuFyDMyZwINxXcViL69QduqzZE/VnTWrYV10
	 5RA9QyKZiNdZqJ5FjQNV77WrNDiDgFN2tBvu4Sy07tkMaSvVpUemv70HN7jGH2KwugM1/
	 GFVbFNuil6q6pY8G+3CAz/l8U70CkPOzbgyOD5NYlR8OoNkdork972GiYrZ+qsNODSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=To3UIYjd;
	arc=none smtp.remote-ip=209.85.222.70
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81543606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81543606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=To3UIYjd
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907de400a6so731708241.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794919644; x=1795524444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
        b=To3UIYjdPEAyPbw3qcZfxGVZiWl/clOJ7HZsQaT2mwgD/TQcdpR1G1hhS1av3Mf0pB
         kg9IIVr5/cMlJ5Fl1UVpC2Yv1YZRiikvhGW/1X68BeIrGIgq0kn1tPqRyg0hmsNI5sYI
         0GcFosR0CBgNJfxShY3X5NXEq+34gMSBKmHtu3ljbbYR0mok/XVxzsk3pRXBV1bQd0kI
         n4QqBY4luczdXUxgvjiiUZsSUzE8cW0JabBX+UQLoFCCtXtb6zatXIozZh4CZ+4nVfK+
         BapfmM0XFTWkJdAomVlFTrAURY29RQ94VF+JMMMhJHeIfdGMhOTqS+Cna+VGbEznEx+L
         Xe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919644; x=1795524444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
        b=vYJjUVMbQCCpMKvdtnhQZi94jFx5o/h0UrdNb4kPKOvkuIcn32ccVQaGSh12M/Dljg
         4WnYrwd7/+Uxf4rV7VEBcfQrdEoYh52q/liYcFVCL4Q5w+2RFWhjsNA8m4IJuntCUVK2
         pp2HZtCyzxysX9zEvwunbjQ2EASofMOeIVhzLqVq47NglB5uW4h/2hJkYNlkpCaDXZyh
         9fdfsUb2Uwbg/MGSA0kuwD7kM9dfUOC7a3cs2qo8EyV1SOMh9sc+5Ex6yNiieIDzifo7
         AHm2V4Nx3l9DhvfRh3pidM7bmSzB3P9T+RubaGNo9HtGx7UcuUMAn8h7hpL6jaSQ+dl/
         +FnA==
X-Forwarded-Encrypted: i=1; AL+hErEEVNhJ32ELH5kbK/gNNwd9FrmbjPAgTILspxqwADNy5FfRom3Q7VUAO9t73vLzrJDc18qJr+44Vvs0j9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bVSqp+ULUJfdobv+iffp6q+zChTd0BPTpZJjFOUTwRA8t3Gjt
	u0dj4pIEcq96U+bppAYjvrZ4FKBY20vrxDyh8RkuxI5uoDSZnZMr8QVNN6QSOf5RHhGpxh53EK0
	hPjWHGLRwYwcvbeqZ7W7vjqsOYg==
X-Received: from vsbjy25.prod.google.com ([2002:a05:6102:4c19:b0:7aa:fcdb:c675])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr3262568137.34.1794919644167;
 Tue, 17 Nov 2026 04:47:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:47:09 +0000
In-Reply-To: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117124710.1338951-2-thaisonphan@google.com>
Subject: [PATCH net v3 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
v3:
  - no changes
v2: https://lore.kernel.org/netdev/20261116023709.132684-2-thaisonphan@google.com/
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
2.56.1.703.gf848ed807c-goog

