Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13B265621
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788663875; cv=none; b=GO2WAEiLpX/HbdZp8TjX3ZxVQdGoVIlDSGBwlqRysQC3HDQofchXOzVca/upIItPDtseMuCuUAcp20u8K9rkdLoaN4qC8FoFSojj/34YiK0BKXYGR1KEiBMwBTfu2rG7Wycf6rhslM0SpLNz5pAUW/T8OApj7hbhTHAnbav9tbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788663875; c=relaxed/simple;
	bh=G4GRjeZ7ZuoicUEADUkv/wpoQdlO4Nb1xEV5wlPJtDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QsqQtx4JnJLN+hvEREhlozz9squ7EtIW0FUTjKInUOtDNpunBmzEV/nhsWT4pOb+wTMFkuY9lh/CgKtCwAff8f0wJgW1xWmfbOlsIqvTqU37fETVPHGksIj2uVxJjfQIYTLNCOGUptu+2clkOionqRIcMA5Yn9PIMHsFUdhV794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=ploXi4lL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="ploXi4lL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d58efc7356so28895105ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788663873; x=1789268673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRZI0fpRvwpo1rk6Yx6qBeQUKH3Q/bkR9HOdevrf27c=;
        b=ploXi4lLxCo3J+wV8CR95cZmee7gy8eVm3sgEwigbFUe6ByNHjo9N6L9OOC7ou1rIq
         n+lhWH41a+jFm7dCkSmImkP3CkuiuqVvBocZEvQZ97iMs3AcdXZC577so68uQ7aMx0nx
         kuGy18oOOmSjVev83G8uEBqm67ZLql7gk4aTSDb1IUBhO3t1LnLFi4nXd8Ow2pMWZyPn
         73E+zl2mMKDYJDv6OP0h2h56lnzyqDco2ZXHq2fkrRhdS38C1WAFYu+Qh7Wfdn+xPDYU
         uRK2ye9veXNNGGFNgz4ebD7P5jvJXj2iGIfG+/qbOnZexdFHa/jdtb3WziNBgXvMNaxv
         rXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788663873; x=1789268673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRZI0fpRvwpo1rk6Yx6qBeQUKH3Q/bkR9HOdevrf27c=;
        b=LGrIIochpPTjkwaWXH24rgRxm4QyWzaGvjdopcbyXetLwYEuQJf/O7a7xuEYZ2Ps8K
         smyW75HxZKsRKxsprACc6hzSTtwHsmAsvO6GAIDz3UN2/WCSfHLHook2PjBCgYddInls
         7WZjvU4i4O+3R9UNus/9T/5j3jP2/VpF6dHYxm2tAbWhT5YQwnzyZnHEI2oBHJVynwGs
         q4ch84KdOFMNpIttn5EZ86SO1Xb4NTUkZbhX8z3Udmt6SBzSf6uXoeA+MpPmatVVNZOW
         ZBEi1iY+BykExoaFHpQSIWPEZ+knQ7+kLno4idRtEOQpTYdKm8I8vnsG2UzmPLEux1u3
         HOgg==
X-Forwarded-Encrypted: i=1; AKwUvByMPS9NJnNja4KK7U1W4mDM7rLHNqQG8DIwWy5jxuMk6JxyCPcqBzG2JpJzMb9uDjRxhFMWmCaEwjeI+kM=@vger.kernel.org
X-Gm-Message-State: AFuF++lHsC7m20+/aciBm93/mahSNPTveszZZ+T03JT0BDO3GnZobqZR
	RTU5KV46PptpAnivMyCmCeWesSc53PiaC4Ob4f4/4SzXN5ekgqYCh4P+DQMAbiJ5LQ==
X-Gm-Gg: AYBFou1c9Dbc4H4JEV3Z2dBrJ+9Rns9AN+FvxHiHZbE2RJIsBarleXCvNm5ETi5LVn4
	zP2xHoz4NrJHiYYrz/fkf6Ilj3EW445Be66ClCaiupGWQaz3woeDGWbI031LD1IRBs8mHqm3SDR
	o96XQ8VE9t7wO3N3ggwR06m+f1CeEdEBecd3mRVtzdjrMQOxMV6AtHTpIFLn7skG3ld3n+Ak0Ib
	S04LcKsGORzAQY7+kKfvI1PSkEJQ7Y6f9sFS+woXsundEhbuZzAOTrfvphmX29tH9Gx4MDeHxxi
	ZBCLJOYVKdxdeP3/W3X62DvDdUgogBhZRnePtr8HToOtLNYq7vshSe9txevgVznk+p7mwtMJ2En
	tAVY/Pxi6Ynj6w7KdK5WE9XNoHRRStGhKkJYM8r27+NDh8qR4cOcu8t9M0A2ISHjL9j6PBpqzTY
	mEkPleFT5OWtPy3FNMpTrooHYHpHT+MpOHe+LPhqWH0AhPdr4py4L5TboHzDdrTHX/1+WeGAr+8
	/aU1Sev/jxo9+vXzZ23DJbB
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr230738585ad.14.1788663872960;
        Sat, 05 Sep 2026 20:04:32 -0700 (PDT)
Received: from p1.. (129-219-8-31.nat.asu.edu. [129.219.8.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm1493584eec.20.2026.09.05.20.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:04:32 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Salam Noureddine <noureddine@arista.com>,
	David Ahern <dsahern@kernel.org>,
	co+2c72469dbbec34af@bugs.sh,
	stable@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net v2] net/tcp-ao: don't dereference NULL current_key/rnext_key
Date: Sat,  5 Sep 2026 20:04:28 -0700
Message-ID: <20260906030429.2085375-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCP_AO_DEL_KEY with del_async=1 is accepted in TCP_LISTEN and NULLs
current_key and rnext_key; tcp_ao_connect_init() clears them on a
reconnect.  Five readers dereference them without a check.

tcp_ao_time_wait() leaves tp->ao_info pointing at the tcp_ao_info it
hands the TIME_WAIT socket, and tcp_done() skips inet_csk_destroy_sock()
on the tcp_fin() FIN_WAIT2 path, so the full socket stays in TCP_CLOSE
with its fd open, sharing that object.  An unprivileged
connect(AF_UNSPEC) + listen() then clears rnext_key while the TIME_WAIT
socket reads it from softirq, and tcp_v4_timewait_ack() dereferences it.
The segment need not be authenticated: tcp_v4_rcv()'s do_time_wait: path
skips tcp_inbound_hash().

Check both fields and drop the segment when the key is gone; without one
no valid signature can be produced.  In tcp_inbound_ao_hash() this must
be a drop rather than a fallthrough to the keyid lookup, which would let
the peer pick the verification key that rnext_key pins.

This removes the dereferences only; the two sockets still share one
mutable tcp_ao_info, leaving snd_sne, lisn and sk_omem_alloc racy.  The
first Fixes: is where the unchecked read came from, not the sharing.

  Oops: general protection fault, probably for non-canonical address
    0xdffffc0000000010: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000080-0x0000000000000087]
  RIP: 0010:tcp_v4_rcv (net/ipv4/tcp_ipv4.c:1055 net/ipv4/tcp_ipv4.c:2333)
  Call Trace:
   <IRQ>
   ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207)
   ip_local_deliver (net/ipv4/ip_input.c:262)
   ip_rcv (net/ipv4/ip_input.c:612)
   __netif_receive_skb_one_core (net/core/dev.c:6264)
   process_backlog (net/core/dev.c:6728)
   net_rx_action (net/core/dev.c:8007)
   handle_softirqs (kernel/softirq.c:645)
   </IRQ>
  Kernel panic - not syncing: Fatal exception in interrupt

Fixes: decde2586b34 ("net/tcp: Add TCP-AO sign to twsk")
Fixes: 0a3a809089eb ("net/tcp: Verify inbound TCP-AO signed segments")
Cc: stable@vger.kernel.org
Reported-by: co+2c72469dbbec34af@bugs.sh
Closes: https://lore.kernel.org/all/YG9s0PiBKJZcXAKld3MToa1IVRJOUoKiaA57%40bugs.sh/
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: drop the incomplete v1 fix; adding missing checks to avoid null-deref

 net/ipv4/tcp_ao.c   | 6 ++++++
 net/ipv4/tcp_ipv4.c | 4 ++++
 net/ipv6/tcp_ipv6.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..9c2e5c8c8fe3 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -857,6 +857,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			return -ENOENT;
 		*traffic_key = snd_other_key(*key);
 		rnext_key = READ_ONCE(ao_info->rnext_key);
+		if (!rnext_key)
+			return -ENOENT;
 		*keyid = rnext_key->rcvid;
 		*sne = tcp_ao_compute_sne(READ_ONCE(ao_info->snd_sne),
 					  snd_basis, seq);
@@ -1026,6 +1028,8 @@ tcp_inbound_ao_hash(struct sock *sk, const struct sk_buff *skb,
 		 * matching the rcvid in the mkt.
 		 */
 		key = READ_ONCE(info->rnext_key);
+		if (!key)
+			goto key_not_found;
 		if (key->rcvid != aoh->keyid) {
 			key = tcp_ao_established_key(sk, info, -1, aoh->keyid);
 			if (!key)
@@ -1045,6 +1049,8 @@ tcp_inbound_ao_hash(struct sock *sk, const struct sk_buff *skb,
 		if (err)
 			return err;
 		current_key = READ_ONCE(info->current_key);
+		if (!current_key)
+			return SKB_DROP_REASON_TCP_AOFAILURE;
 		/* Key rotation: the peer asks us to use new key (RNext) */
 		if (unlikely(aoh->rnext_keyid != current_key->sndid)) {
 			trace_tcp_ao_rnext_request(sk, skb, current_key->sndid,
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 9f053eb8b46e..93e073065b1b 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1052,6 +1052,10 @@ static void tcp_v4_timewait_ack(struct sock *sk, struct sk_buff *skb,
 		key.traffic_key = snd_other_key(key.ao_key);
 		key.sne = READ_ONCE(ao_info->snd_sne);
 		rnext_key = READ_ONCE(ao_info->rnext_key);
+		if (!rnext_key) {
+			inet_twsk_put(tw);
+			return;
+		}
 		key.rcv_next = rnext_key->rcvid;
 		key.type = TCP_KEY_AO;
 #else
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index df9c29eb5c1f..0fb75d139430 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1182,6 +1182,8 @@ static void tcp_v6_timewait_ack(struct sock *sk, struct sk_buff *skb,
 		key.traffic_key = snd_other_key(key.ao_key);
 		/* rcv_next switches to our rcv_next */
 		rnext_key = READ_ONCE(ao_info->rnext_key);
+		if (!rnext_key)
+			goto out;
 		key.rcv_next = rnext_key->rcvid;
 		key.sne = READ_ONCE(ao_info->snd_sne);
 		key.type = TCP_KEY_AO;
-- 
2.43.0

