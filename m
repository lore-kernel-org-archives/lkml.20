Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DD1A6824
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419773; cv=none; b=EaLAHxsWq4kwwSlq+rNXm5wlE2ekNuno6HONpgYkKK9iyEWs+R20N2R380y8OeOzoca6XOjigJhgqISQ+rQKD0g8F0AtNz3b3qddpu6muEISm/IO7CxF6Anh69sMOkwAtyihsZ5gEqH+FjdDOjDXn3AbemVmq5ee97wh1OSsYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419773; c=relaxed/simple;
	bh=t/TzlKYSXa7hAPi5SprlLWnzQl2k7hoWeJ1k7vb1H1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AN85022s8Vasd8QYzcZE9EV2laKwkr+0xUjkC9vKvzSVHJyio6WOs2flXwN0i4EC/R4M8Va4/l7d8NaNmKJ4tPquPtof7LK2H46pjN06H6whH7bqfVSilBOConm40iqA4l596DEF1/nguNhK6N86B55I+FUaJ5rVqUUfRoeTrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=kD+mFbio; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="kD+mFbio"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34ceab2900eso4245451eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791419771; x=1792024571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ousNqw0QCTdD4r+b67QvwnpUTVa1Mudn59A7LCdItDA=;
        b=kD+mFbioEPKh+A9kdWNWwwWQzf0omlu4tDEsnfzVmAe42c+tP0Mwwu+cJ7lRYjBLDu
         mxJTRtKoGc1mD8pN3cWbI+VQbOOeboezK4WLStTOAj/YPLRPeQFFsem6CQVvIuplJwoP
         ASB3hbduRYWrlWOYxGqIqO5lYyQK1f+/w5ScPkAJ+qAK4/K/JjWMpskZgQ/7k5hBrHQP
         s5K62upQydWo7HjKIHcmp8GoQYC5pyBhMvHQ8kdFvyde5qYBAqL68OYhnZ1zmOWTJrtU
         eyK25wAUmjCRmsrD+fwmOJb1szIsh5wvoDvhw/OnVUe66XY9WwPob7LYGsq6UA+eo3rc
         uGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791419771; x=1792024571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ousNqw0QCTdD4r+b67QvwnpUTVa1Mudn59A7LCdItDA=;
        b=1H+61B5zMiF4jgnPUpzhPsuPB65UeIFaYVOyFqPrJKWpoJAMLfGNLrJ/ZE4tKCi5cE
         Iwhq8dt63KnWTgItU0ko1u+u9lzKEqVbHYd9kVKAg/UR9kWXWm8Kt2r8rHkPZ7kIFfjG
         2Ku1fzmSt3Pls8R1ARW64SSIht7iU9WUst/3Zun3xwQ//TlydGu5xXJku4QFv1J3gn/v
         J90/gBDS3znkYgTX0Al3b2Ay8EE4F3wMiK/WQm2y16vTULYgW6VhSP7Obt7UeP9XbMiI
         PUMk6PBZRQp0ihoJOv2KDiERWwL4CPu8QV+dsVUD9UFtWDd7RA+YLcpoBuDBPmz2CQwM
         ihRw==
X-Forwarded-Encrypted: i=1; AKwUvBzq58t9fjUveF/u7dmzXdfvstze5lKWAU42iMCtzMtZjehBvPyO+U/0smoicQct7DTzKomLti2HYhQYNCo=@vger.kernel.org
X-Gm-Message-State: AFuF++mmVvZQgyJ64CCx2bllQrQ4rBet1307IYDJrO2Cpkf4bPrMN3Ic
	CnbeBOGSz5CCwVVyP8g5VP2H4sq5qv4tRom9MAZzbP4gwKXlcN+tIGrJ+yUl2d84DU0=
X-Gm-Gg: AYBFou2F2mA5l/I9JAsW5KC5IsnGVziAkLxPQO25vEgtktfnUzFtfupt2rrIlrVQsO0
	9WRdzIh+wdDa0eCiIEyPKpluL67FjobEGxPowLmyiX6q+LM6aY6SBxbEej8Y+POOu4Inb1OJql6
	od9Nez+pab4QXN3ehi/cpY5yghAXvLeSx/8m1YJLJFfrtaXeZMMnyJXqy3zBsYnP/zGImf2uqEu
	z2z0UOnSP8nJQwseB2XmbAJXnb+YzfcY3Jt9bz4LJYYIxhASkle4xoV3STukmF2clKeog2/nWfz
	ys+NR7J8eVcZgVIFv/HvSNOLVlqXmg7c+MseMMbClIX9mZcoyB/JZx7Ssudy54pa7yVKkIr9X0n
	DRnAQ7+zwEpRsnQWSnuLN27Y5Ns87Fw7IMyu0QBKj4roL7Ew9YDWmeV7/Pzmv+5BBzReICAHvGR
	zfKkiWjEVrRNmMVb1/PBAbicae9X/HdN4tKQ+XsmTYtKJeEZhJsKYSEi8f1xuHobHH26sEoZVLX
	Cli9HQh0CUH4G4WwWFhlxHRoNgNzZCmBw3MHmn7VJLpivNfdWY=
X-Received: by 2002:a05:7300:fb83:b0:34e:67d0:bbb4 with SMTP id 5a478bee46e88-3515ddb5e8bmr6230584eec.10.1791419770594;
        Wed, 07 Oct 2026 17:36:10 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm3496694eec.11.2026.10.07.17.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:36:09 -0700 (PDT)
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
Subject: [PATCH net 1/4] amt: key relay tunnel state on the (address, port) endpoint, not the address
Date: Thu,  8 Oct 2026 00:36:02 +0000
Message-ID: <20261008003606.3666617-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008003606.3666617-1-omar@blockcast.net>
References: <20261008003606.3666617-1-omar@blockcast.net>
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
 drivers/net/amt.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index f2f3139e3..a652c8c79 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2455,6 +2455,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct ethhdr *eth;
 	struct iphdr *iph;
 	int len, hdr_size;
+	__be16 sport;
 
 	iph = ip_hdr(skb);
 
@@ -2466,13 +2467,17 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (amtmu->reserved || amtmu->version)
 		return true;
 
+	/* Snapshot the tunnel endpoint port before the encap is stripped. */
+	sport = udp_hdr(skb)->source;
+
 	if (iptunnel_pull_header(skb, hdr_size, skb->protocol, false))
 		return true;
 
 	skb_reset_network_header(skb);
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == iph->saddr) {
+		if (tunnel->ip4 == iph->saddr &&
+		    tunnel->source_port == sport) {
 			if ((amtmu->nonce == tunnel->nonce &&
 			     amtmu->response_mac == tunnel->mac)) {
 				mod_delayed_work(amt_wq, &tunnel->gc_wq,
@@ -2480,7 +2485,13 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
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
@@ -2681,7 +2692,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 		return true;
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
-		if (tunnel->ip4 == iph->saddr)
+		if (tunnel->ip4 == iph->saddr &&
+		    tunnel->source_port == udph->source)
 			goto send;
 
 	spin_lock_bh(&amt->lock);
@@ -2719,6 +2731,14 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
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
2.43.0

