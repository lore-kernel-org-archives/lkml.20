Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026107;
	b=VAT9YfsIcxs1yNPxnAsaFpkBmer7AOvz9ji9AbjstrA6F+Y7HsEJjp6sNsbRU7HWXLVT
	 MUtr6TLKuSsxXLq3Dri0Bxsd4aKimpwhAyUsAXQkShoyUbPtVtZYbw5SIdzbUKW93KhJh
	 ZGDZuL1YqmwgujOTOJ/HJhub4QbibWLyxHgUlsOXiAdfZQ348PCnXos0opvO+44xxhOEi
	 w9XIBQifvpfG0XE+oG7WbytfPQmmD4ue2MtxBMUp9zhGuQL07bkuQcG9a93/Afq7zBZCW
	 j3YQM51udT0Myu+KV0XN6p9HyxUsL0bGNH0HKYORWpOTFQ2WrNQ9LfyTCnL8oeN24Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=442TJjXt4vKnHWbQnMiG4TV2+d8tX1KqEwlL9mdaH/k=;
	b=X2qK5Urp1c/Y7/fd8o//O59nhMStB/gw1FTOSeOaGmAxzWieP4O2ghvYIiE7tDJkq3IN
	 cxWROHcfTIzTUWylIChmHwPkTaIuyU8QedBkSsHuOcsG2+WMVOsrHyycOfG6b80ss4YVQ
	 KS+i9Egr9XfMjihI5ty4YhKwL8ifvtXekQ015WyHhRYmxd0TY8sKRtd6Ggn1vuMJurLEw
	 9UKFyj4JBjiDy2eLJWmYGxK790vhiZ7CRzU1BNotkTKL1mDqLVhpUCgyHkw60I/QvGr5a
	 X8gsWU6AWcZRI9yWR0B01EYh7JdWP8mb0kusbwW67DZWUlD2WahvgyJTTor+0EkElUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eibNHlAv;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF7C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eibNHlAv
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2065601a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026106; x=1793630906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=442TJjXt4vKnHWbQnMiG4TV2+d8tX1KqEwlL9mdaH/k=;
        b=eibNHlAvtye8ze+fjqlWmQ/QzN6w7RSu/QYc7xyQurO8SYf4+rIjdzaMPmDxg+rotq
         Gg8jRxzz9HbeLXimQqyVZpWXUswfkssAf6n/aCeHxgXCgZ6vOVftHpTO/HuadlCEwleH
         iwnygPo7DX4Dz2BhDzyZZLWujcydwyXBe6O4ZJxlYfWONgzOMGZnawF0Wo8jkh6Dr3MO
         2E7Nf3gA346nF/k+VvLyq7Kljpot18ysqNdJKKrNGt2OVW4FgwNdWC7OCYPFVbeYsNtm
         ed/7jyiRckC5I2PV3s6P0ElXXvJk3hsv83tp9kb6xM9AjPl0nu2Zb5wEIm/U4qdf06Gf
         +Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026106; x=1793630906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=442TJjXt4vKnHWbQnMiG4TV2+d8tX1KqEwlL9mdaH/k=;
        b=RhXlCd2o+FSrdwkFN5zVpZwWyZKaVTwAI4hP64DKTQDv3UQCH1u93A0yocL26WEB+i
         R4ZBlFnci9j2rVIpIYJUXXEAKHS9oSCC2kNZIh5HhIqPcbe6iBZGWVp55mm/xG9QyNLO
         pAcXIeAjpP0MKsRVtpTrajHaosXGUWGGk9z4bbS31srtQXsYU+XBfLHy4zuw40f+ie6p
         4oSrdPE/4S7/pF5Trb5JiDg/5OvO7Xps8mGqWoKYtXcfbCq59EEKgqV/y9tuv8pCQjZ2
         NitsevjhxHX9a/8OfZcp5HtX/d7unMpLGEeNkfZXOcGB19As+quERmf8MawcOT5JF3op
         DDCw==
X-Forwarded-Encrypted: i=1; AKwUvByd04y3kn1Vt8qdBfDA2x1qP5+Jd+IeyeVSHxF2e5uL5agRkvw2V+3x0ep+hLBs7UkBiIxLPt78xfZnH6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPn38zHOOXpnLB9oZX8Ir/eOdc7up2EqHZERJzdVzva+snRCSg
	RL+4EWtuHiy0Su4EyyGMNO9DAbNx8oM9/pYsMF0AXzA6liIsPLNhK6YJ
X-Gm-Gg: AYBFou1mC177T4vqrfGjyRZKDEv5srDhYCulNykRmjzw2W3kGmnsdovxhviP4UsuNpN
	1tMzUnIZl/5l5+U9s6/vm22WTl+uc8wsj1jxOaCG9PFTrQ6k37RkcpW9rzlfwfZV19Ggi5DY/dj
	Tq3rEPWDoR3ESUDCWDi1odD6vKCLWkpxr/EuTL9pNaShVcxCvfwxH1aOupE9cWH8TfDl3e1OtnF
	NpLIpbBQKEytoq5nT7fAhOeq2MV2TQKj4/GRUBBPcwaFVWlCzy8VWEXNgjNkaaDkpCdSfstZaTJ
	7oARABlKbkUKz73u22BExwSD0+UgxKZ9Z6Z3RFPYYdAYsy+oxP/sHMbP/V2FPRjbPG/ME4zejyW
	cFwxl1geADPYOifY6uQuRu7/X3qTiwVqjWb1onVgW1xH3QZWwjYCwDOsUe7AYAfknkWsrcIbR3l
	qWl+tsRmW7azEZkSYH/mj7n1rm55d1ZVbDCOs5LlMNqSDDxYYP/fES/YjiLsLAr2fbYfhNaI+6A
	pG5NIkmV6eistsXbNpiKIW614k3zVWvJE+D70wMbQCW5vGiPPI=
X-Received: by 2002:a17:902:eccf:b0:2e2:be61:a882 with SMTP id d9443c01a7336-2ea9c6c8bc8mr60967235ad.11.1793026105945;
        Mon, 26 Oct 2026 07:48:25 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1499c4sm18570185ad.31.2026.10.26.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:48:25 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: matttbe@kernel.org,
	martineau@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: geliang@kernel.org,
	horms@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH net v2] mptcp: protect listener backlog reads in diagnostics
Date: Mon, 26 Oct 2026 22:48:16 +0800
Message-Id: <pm-mptcp-objects-candidate-0066-v5-4d1b83d62fcde2d57e8d@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mptcp_diag_get_info() reports the accept queue of a listening MPTCP
socket by reading msk->first. The token based dump and the exact token
query only hold a reference on the MPTCP socket, which pins neither the
first subflow nor the listener hash bucket, and __mptcp_close_ssk()
drops the last reference on the first subflow before clearing
msk->first.

An application can disconnect a connected MPTCP socket with AF_UNSPEC,
which removes the token but retains the first subflow, listen on it
again and close it. A dump that obtained the MPTCP socket before the
disconnect then reads the backlog of a freed TCP listener:

  Token diagnostic                 Application
  mptcp_token_iter_next()
    retain MPTCP socket
                                   connect(AF_UNSPEC)
                                     remove token, retain first
                                   listen()
                                     reuse first
  mptcp_diag_get_info()
    observe TCP_LISTEN
    lsk = msk->first
                                   close()
                                     mptcp_destroy()
                                       __mptcp_close_ssk()
                                         release first
    read lsk->sk_ack_backlog

The report below was decoded with scripts/decode_stacktrace.sh against
the 7.2.0-rc5 based test kernel that produced it, with the line numbers
mapped to this tree; only the relevant frames are kept:

  BUG: KASAN: slab-use-after-free in mptcp_diag_get_info (net/mptcp/mptcp_diag.c:209)
  Read of size 4 at addr ffff888111763818 by task python3/499

  Call Trace:
   mptcp_diag_get_info (net/mptcp/mptcp_diag.c:209)
   inet_sk_diag_fill (net/ipv4/inet_diag.c:330)
   mptcp_diag_dump (net/mptcp/mptcp_diag.c:23 net/mptcp/mptcp_diag.c:177)
   __inet_diag_dump (net/ipv4/inet_diag.c:823)
   netlink_dump (net/netlink/af_netlink.c:2351)

  Allocated by task 497:
   sk_alloc (net/core/sock.c:2337)
   inet_create (net/ipv4/af_inet.c:333)
   __sock_create (net/socket.c:1679)
   mptcp_subflow_create_socket (net/mptcp/subflow.c:1836)
   __mptcp_nmpc_sk (net/mptcp/protocol.c:111 net/mptcp/protocol.c:143)
   mptcp_setsockopt (net/mptcp/sockopt.c:313 net/mptcp/sockopt.c:916)

  Freed by task 0:
   slab_free_after_rcu_debug (mm/slub.c:6571)
   rcu_core (kernel/rcu/tree.c:2919)

  Second to last potentially related work creation:
   __call_rcu_common.constprop.0 (kernel/rcu/tree.c:3287)
   sk_destruct (net/core/sock.c:2446)
   __sk_free (net/core/sock.c:2459)
   sk_free (net/core/sock.c:2470)
   __mptcp_close_ssk (include/net/sock.h:2024 net/mptcp/protocol.c:2721)
   mptcp_destroy_common (net/mptcp/protocol.c:3579)
   mptcp_destroy (net/mptcp/protocol.c:3815)
   __mptcp_destroy_sock (net/mptcp/protocol.c:3421)
   __mptcp_close (net/mptcp/protocol.c:3523)
   mptcp_close (net/mptcp/protocol.c:3538)
   inet_release (net/ipv4/af_inet.c:442)

The first subflow is a TCP socket: TCP listeners carry SOCK_RCU_FREE
and tcp_prot/tcpv6_prot sockets live in SLAB_TYPESAFE_BY_RCU caches, so
reading the two backlog counters under rcu_read_lock() is safe, and a
stale value is acceptable for diagnostics. mptcp_diag_dump_listeners()
already runs the formatter inside an RCU read-side section; only the
token dump and mptcp_diag_dump_one() reach it without one. Take
rcu_read_lock() around the msk->first snapshot and the backlog reads.

Fixes: 4fa39b701ce9 ("mptcp: listen diag dump support")
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
Changes in v2:
- Take rcu_read_lock() around the first subflow reads instead of the MPTCP
  data lock plus an owner check, as suggested by Eric Dumazet; this avoids
  the new msk slock -> listener hash lock nesting and keeps ss reporting the
  accept queue while the socket is owned.
- Decode the stack trace with scripts/decode_stacktrace.sh, map the line
  numbers to this tree and keep only the relevant frames.

Link to v1: https://lore.kernel.org/r/pm-mptcp-objects-candidate-0066-v3-73df72b7a543d4cada0e@gmail.com

 net/mptcp/mptcp_diag.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/mptcp/mptcp_diag.c b/net/mptcp/mptcp_diag.c
index 136c2d05c0ee..28a42eee6651 100644
--- a/net/mptcp/mptcp_diag.c
+++ b/net/mptcp/mptcp_diag.c
@@ -200,8 +200,10 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 	r->idiag_wqueue = sk_wmem_alloc_get(sk);
 
 	if (inet_sk_state_load(sk) == TCP_LISTEN) {
-		struct sock *lsk = READ_ONCE(msk->first);
+		struct sock *lsk;
 
+		rcu_read_lock();
+		lsk = READ_ONCE(msk->first);
 		if (lsk) {
 			/* override with settings from tcp listener,
 			 * so Send-Q will show accept queue.
@@ -209,6 +211,7 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 			r->idiag_rqueue = READ_ONCE(lsk->sk_ack_backlog);
 			r->idiag_wqueue = READ_ONCE(lsk->sk_max_ack_backlog);
 		}
+		rcu_read_unlock();
 	}
 
 	if (!info)
