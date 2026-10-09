Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E94EF15A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576902; cv=none; b=ho796Axj7Pd4terGtgjt22lY9bSd8jV8AtvcHBPeVBttc5sXx1+lUJ3yOXB+Y+nVe219tjI8boY2PFe21Wpzu1XWZcZSBItwnudbLWVIhpFG5HBD/eQtQcYFnfzCPKV4Gzl3NHmbtY6wpCkWUopSFw94gYYqcPU9s40xuw2S/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576902; c=relaxed/simple;
	bh=VY0TAGdJv85A2ijXW89CHS1kiI1orXTG/LqRzg+kjXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTWPwbSi2GbXPvsCjEJh04bONK1qAyLdzDsPVpSGLa1dSJHFGYFKdf2bDEzOGsCG/JMwQAFvw/Nu5T18il613Gd5mp/YH7os3JSwOp9Q3mwtzctTEwL3cRAA8vi3tlXSPOZT8J8+v/z2Sc4E9865cpY5pKzNays4e1nnXY1uGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=jzGtbcgr; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="jzGtbcgr"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-351767ef18cso203196eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791576900; x=1792181700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLAm1Mcy+oY7OHbF734SMCtUPAhjxFAoK6CtyMhqiYk=;
        b=jzGtbcgrq5KCCtTv2/muacSlLajLorQc7gfIozMNNkQiV3zUNEfuXTegygqpLeCF7Y
         aCznDDIccWQj99RCfagqWtTR8RV9sHYb30fGcoBkvWbTtowbwixwQnx3yeqAF923t+qN
         0faQ7haWD8TS7QW5s8wjLvAupnNniScuIXAwAu3TZM92oIc+BVVu2aBdo+c0XKlPCzdc
         4xJ8NwwKiLeSjtbNqexbfBjXfG27yvOw8lRTafYvDgSw7ThZ/kyz+84S5kWUNsCxnygH
         F/0sU2lcQAZNuULzE+l5GuWpREoWbpKiXu3gzpOYK80I6psDFdUQzloX6dTTeBq2sfR1
         7Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576900; x=1792181700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLAm1Mcy+oY7OHbF734SMCtUPAhjxFAoK6CtyMhqiYk=;
        b=y+XuYetFaAyf6lF3qqBvyBNBC5U5EC6A0k6vlburu3VLUKy6yRR9aQut/vnDlbygsa
         Ff6WnYUX6TBUuSJE/ce3cMdRmUeWdYOazQHKycVsordZiTym0KXtuu1ZPMoRB/+RVdcT
         kHX6JsHo5ElbZ02U/YjGYElfl+yNpDmICJgYmeqP4oGZ6C74ybdSDSs33n11LOHGO37R
         avK4Srb3p2rrAk4giK+vB3JTKSVrJbdSj5coFq0BYyecGbXlWjhetk25tRdj2nq4mReE
         h/kbzLLxgwi1GMIMCw2OkfB3gBPpMOF1Rr3hC+HsGK3p4YbEZnehgFWMS0KidyX0peXx
         UEsw==
X-Forwarded-Encrypted: i=1; AKwUvBybuAHQK2JlAu2suKoAmphLWGtCD2FoSVjfZQD/MHqSUX8qg7kQZWzVvjncTIAhQH2V4Nvy8hs3wfr7pko=@vger.kernel.org
X-Gm-Message-State: AFuF++kDkomB3BrhNjxQZ+z+rHuvpMhKWsMmoXM1bgBL5dXoy7+E4ZKs
	1wDnO/A4My0Tw6ve9yse1NmA8ERMUE/KHjujDWJlRk8Lkzxrt2IMDaNJwROHy04ZAj0=
X-Gm-Gg: AYBFou3D4IUAhAWTsoA9OtOJMOdvmL5fkC6sRab9xCBR78K2EXgAPuEXXevT2bs1Q1l
	dxafwvsMa/nUJPJAacRHIr755+8fQqL8puFgx0k5RTXfFbDEXrpqUvz77qOByh/PsO8C+OHhPd0
	upSyER7t9O8e24xuCbx+3sRt3u4F7f6j5/ObUrJUEnft7GtyxBLPMjX3rFOi6Tzn9CSZmgvV8bB
	lZ3iW5ofSxlhRLqxIKPwQJoWVMLQJ+5OC7pXbKb7/bsZlbnc4Rs617UGwq0NIvKHyd1k8gEMg7W
	ih7SyncrmnXlKdofvgVLBMVfR3p6jTwsK3DcR3hmPviCj3zrFU/q4Tz/te+yQ0GuQdKiWlmQvhn
	YGaMXCEHOL/jFQumTjputJanrwZRWDq0BA+xvXnyPtgvLooX6QTRZl2OKL+9TT2B7TFVpAqvqUK
	1OSrSUh9lZ0lLrYnwHGzP/Nrd78PrRbu5M7qqJfhHrbOOpYxWtkqO3dFi5Y2B0dZHFlyhrXcTyT
	9oRzgIV6CLlcbA+WKbjZ4NQPCvYZRfJ6V8pn0ki
X-Received: by 2002:a05:7300:7fa3:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3537e0858edmr5760942eec.36.1791576899760;
        Fri, 09 Oct 2026 13:14:59 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm8994643eec.5.2026.10.09.13.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:14:59 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v2 1/3] amt: key relay tunnel state on the (address, port) endpoint, not the address
Date: Fri,  9 Oct 2026 20:14:52 +0000
Message-ID: <20261009201455.1904698-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009201455.1904698-1-omar@blockcast.net>
References: <20261009201455.1904698-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_request_handler and amt_update_handler both look a tunnel up by the
outer source address alone:

	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
		if (tunnel->ip4 == iph->saddr)
			goto send;

RFC 7450 s4.2.2 defines the unit of relay tunnel state differently: "an
AMT 'tunnel' is identified by the IP address and UDP port pair used as
the destination address for sending encapsulated multicast IP datagrams
to a gateway", and "each unique combination represents a unique tunnel
endpoint".

Because the port term is missing, two distinct endpoints that share a
source address alias onto one tunnel. The second Request to arrive
reaches `send:`, overwrites tunnel->nonce and re-derives tunnel->mac, so
the first gateway's subsequent Membership Updates no longer match and
are dropped at the "Invalid MAC" arm. That arm returns rather than
continuing the walk, so there is no recovery path: the first gateway has
had its Request answered and its membership accepted, and simply never
receives data again. The failure is silent on both sides.

Two deployments reach this, and the same RFC section names both:

 - NAT, which s4.2.2 calls out explicitly ("this address may differ from
   that carried by the message when it exited the gateway as a result of
   network address translation"). CGNAT, a single-WAN site with a
   redundant gateway pair, or two subscriber devices behind one
   residential NAT all present as one source address.
 - A single gateway host, with no NAT anywhere, which s4.2.2 says "may
   use separate ports for the IPv4/IGMP and IPv6/MLD protocols".

Add the port term to both lookups. amt_update_handler snapshots the
source port before iptunnel_pull_header() strips the encap, alongside
the existing pre-pull reads.

With the endpoint keyed correctly, a gateway that re-Requests from a new
ephemeral port no longer aliases onto its own previous tunnel: it gets a
new one addressed to the port it is listening on, and the old one ages
out on gc_wq. That is the same stale-Membership-Query symptom addressed
by refreshing tunnel->source_port at `send:`, fixed at the cause instead
-- so this change supersedes that approach rather than stacking on it.

Also count the "Invalid MAC" drop in rx_dropped. It is currently a
netdev_dbg only, and an Update dropped for failing validation is the one
delivery failure a gateway cannot observe from its own side.

Note this removes an accidental bound: while tunnels were keyed on the
address alone, one source address could never hold more than one tunnel,
whatever it did. RFC 7450 s5.3.3 asks for that bound explicitly, and it
is restored in a companion net-next patch ("amt: bound relay tunnels
admitted per source address") rather than here, since it adds UAPI and
this is a fix.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b53f8ec5566..ed82f8fac3f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2471,6 +2471,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	u64 response_mac;
 	__be32 saddr;
 	__be32 nonce;
+	__be16 sport;
 
 	saddr = ip_hdr(skb)->saddr;
 
@@ -2484,6 +2485,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 
 	nonce = amtmu->nonce;
 	response_mac = amtmu->response_mac;
+	/* Snapshot the tunnel endpoint port before the encap is stripped. */
+	sport = udp_hdr(skb)->source;
 
 	if (iptunnel_pull_header(skb, hdr_size, skb->protocol, false))
 		return true;
@@ -2491,7 +2494,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	skb_reset_network_header(skb);
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == saddr) {
+		if (tunnel->ip4 == saddr &&
+		    tunnel->source_port == sport) {
 			if ((nonce == tunnel->nonce &&
 			     response_mac == tunnel->mac)) {
 				mod_delayed_work(amt_wq, &tunnel->gc_wq,
@@ -2499,7 +2503,13 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 								  * 3);
 				goto report;
 			} else {
+				/* The endpoint match is unique, so no other
+				 * tunnel can validate this Update. Count the
+				 * drop: an unauthenticated Update is not
+				 * observable from the gateway's own side.
+				 */
 				netdev_dbg(amt->dev, "Invalid MAC\n");
+				amt->dev->stats.rx_dropped++;
 				return true;
 			}
 		}
@@ -2705,7 +2715,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 		return true;
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
-		if (tunnel->ip4 == iph->saddr)
+		if (tunnel->ip4 == iph->saddr &&
+		    tunnel->source_port == udph->source)
 			goto send;
 
 	spin_lock_bh(&amt->lock);
@@ -2743,6 +2754,14 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	spin_unlock_bh(&amt->lock);
 
 send:
+	/* source_port is part of the tunnel's identity and is set once, in
+	 * the allocation path above; the lookup only reaches here on an
+	 * exact (address, port) match, so it is already udph->source. A
+	 * gateway that re-Requests from a new ephemeral port no longer
+	 * aliases onto this tunnel -- it gets its own, and this one ages
+	 * out on gc_wq. Do not "refresh" the port here: that is what made
+	 * a colliding Request steal an established tunnel outright.
+	 */
 	tunnel->nonce = amtrh->nonce;
 	mac = siphash_3u32((__force u32)tunnel->ip4,
 			   (__force u32)tunnel->source_port,
-- 
2.47.3

