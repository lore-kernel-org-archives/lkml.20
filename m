Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212311;
	b=CGgFc+oksHF1R7jpV3/nPLZuq9K55RsEzM66zniQanu6ivnz6jigxrz3B02oxewPcVaR
	 UiBV1YyILbb6luu0mVB5i1/8CqjN8id8v/ocpDAi53/VRrgbMmCqf7XUeVfxVwTv1MMdj
	 5dyFw61AQw/KOpNr3b65kM+fgJwsajKasnyOj5zeS59Jazx4DNl9GfJ5dh7Fr8yFKMGHB
	 kUxs8mVvKA3ZL0Tbix/sW0NNFXawt5YeG2GFyHC32S8JX54UxRPCuwxMZZ0iXrk3QxwAt
	 v2+m4mNOWUrc4ZjFmleR5zanVCI5nQ2HT/E5JdmjfB7+YalPSUFL9vRwxLmYDPOv7LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212311;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=s1V/602Pvf6uE5BCQE9B8z2Cenl6Olf1l+jKmakHRg8=;
	b=Bms+9t7ey0v22VCbz2N+RGgAl4kZIjJ51IxCMNi3YXTdTsHilGRzTS59uRDx+8mVEGH3
	 tWmsu0CpbR0I68uCrqih0d+QJCgxQqpabLzPxYUXYuX5KZvHwPIRe550JqSCOSby6jqGQ
	 SBgTQa3UhYRTLPAB+tliAg5H5PVSSsfVzhYaaE+RQeS3P3SYMmvHLfvx4Mf5dQMpHXlNL
	 v6Q36ezTL3ZlPJSLu2A07BcYhbGDriSJHVtahcplr9Eet9TRpXxvDCriHnpDtJttU6RWz
	 vPrsq5LT+EU6/FQ4qx7rwx9xDlD+94hMZbQo8FzeL9ymY2aakL7Nf5rPmnBVyQsxmPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BkOQTj7X;
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0A606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E0A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BkOQTj7X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+uxdZdGdNJPaHe9dS43uJhHV3BwO0JbjvLd8aDJ6RQU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794212308; v=1; x=1794817108;
 b=BkOQTj7XinxkpwMPXbz0G/PIct5Z+LitNKtZcia8vb6+FWZ42bUxtjDP15HHYnqTM/hdglcQ
 yosH6a4eLAKqXGkLoP1KIc4QMzq+sFOX5VItDIReIyAAouJSK0QWBGy6TxC0bbFdaznrX6eWKfe
 oA7WWHrsQhhXuel4TMveGNAc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6fb67f112d4cb988;
	Mon, 09 Nov 2026 08:18:28 +0000
X-Mizu-Trace-ID: 6fb67f112d4cb988
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 09 Nov 2026 03:18:12 -0500
Subject: [PATCH net-next v3 1/4] ipv4: draw rt_genid from a sequence shared
 by all netns
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bug-net-netns-move-rcu-barrier-v3-1-6084b02610b3@linux.dev>
References: <20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev>
In-Reply-To: <20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

An IPv4 route records the rt_genid of the netns it was created in, and
rt_is_expired() compares it with the rt_genid of the netns its device
belongs to when the route is checked. Every netns starts its rt_genid
at 0 and increments it on each cache flush, so different netns often
hold the same value.

When a device moves to another netns, routes cached through it remain
usable until dst_dev_put() points them to blackhole_netdev. For a route
using a nexthop object this happens in nexthop_free_rcu(), which
free_fib_info_rcu() queues from inside an RCU callback, so the
rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
the rt_genid of the new netns matches the cached one in that window,
ipv4_dst_check() accepts the route and a socket in the old netns keeps
sending through a device that now belongs to another netns.

Take every rt_genid bump from one sequence shared by all netns, which
never hands out 0, the value every netns starts with. Inserting a route
bumps rt_genid, so the routes a netns caches carry values drawn from the
sequence, which no other netns holds until it wraps after 2^32 bumps.
Concurrent bumps of one netns can leave the older of two values, so
rt_genid is no longer monotonic per netns. It is only compared for
equality, so this costs at most an extra route lookup. A connected UDP
socket in netns A caches a route through a nexthop object on a veth. The
veth is moved to netns B and brought up with one RTM_NEWLINK, then the
socket sends 200000 datagrams. B's rt_genid is bumped 0 to 20 times
before the move, 63 trials:

                                before     after
  trials sending after move          3         0
  datagrams sent after move       3132         0

Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/net/net_namespace.h |  5 +----
 net/ipv4/route.c            | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index c29a22ca178fa..140858a2fe6d4 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -557,10 +557,7 @@ static inline int rt_genid_ipv6(const struct net *net)
 }
 #endif
 
-static inline void rt_genid_bump_ipv4(struct net *net)
-{
-	atomic_inc(&net->ipv4.rt_genid);
-}
+void rt_genid_bump_ipv4(struct net *net);
 
 extern void (*__fib6_flush_trees)(struct net *net);
 static inline void rt_genid_bump_ipv6(struct net *net)
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0a5f6d77094c..16d470ab50142 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -393,6 +393,27 @@ static inline int ip_rt_proc_init(void)
 }
 #endif /* CONFIG_PROC_FS */
 
+/*
+ * Draw rt_genid bumps from one sequence shared by all netns. A route keeps
+ * the genid of the netns it was created in, and is checked against the netns
+ * its device is in now, so distinct values make that check fail once the
+ * device has moved. Every netns starts at 0, which the sequence never hands
+ * out, and inserting a route bumps the genid, so cached routes carry values
+ * drawn from the sequence.
+ */
+static atomic_t rt_genid_seq;
+
+void rt_genid_bump_ipv4(struct net *net)
+{
+	int genid;
+
+	do {
+		genid = atomic_inc_return(&rt_genid_seq);
+	} while (!genid);
+	atomic_set(&net->ipv4.rt_genid, genid);
+}
+EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);
+
 static inline bool rt_is_expired(const struct rtable *rth)
 {
 	bool res;

-- 
2.43.0

