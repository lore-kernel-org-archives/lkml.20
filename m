Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B28948EC8A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809997; cv=none; b=Ic4X4dnV9oEOQeNPKwzrLEEvpNhMTH6d0pmStlTOGTFfUxwlfoD0iZhZL3JGREr6rRBNH+iqqy5HM/CZbj/zkOVH5rN7O2HMWpsmZlSxeRp61kGXZKDVrynRStXK53HP7PbdE/Jz03s8OFZB5hzbPmXbcnxLWzQjYuM9aUzB9rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809997; c=relaxed/simple;
	bh=+sguhb5W5A9ufBhXXrUOEbtvslc2+EnOPXa+UGtdZxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SS2d+FVIJM0HBQARH5EbZ4dTM0grwgteNX9QX0FHLxoTV2vA3UKHMvq05WRhSZs+S+DdGQVMJqKSMomQvt46CBNTtECynTZb46ooJnuLS4dB4CPWql87LEwImKVv7YQfAoCfkTeAYdgCZJkVNHLepRM3+qwX7U2HdVL1SRbVEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=FZ3novAk; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="FZ3novAk"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso4758566eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791809995; x=1792414795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/YD2PthIXuKbIegQAp4lU8CkrkTGnFWWU88rL4EQAU=;
        b=FZ3novAkRp2UwGiAqhgkSijmBV7Q0P5D5/HUisApXZo8gfLfkbqzDnLFOdqw6iFCwW
         qwt4tONpOzGOWJjn9fVl5AOHNcLoIqN+JgoTlMGlvjsCl+TaxT8/Yax8U4bjMmVd9h+T
         NPZMVoMw9JsFqGH89UTWO8K5GfRoOczqQaCi/EtR+2llGepm+Zimh/EiY5WDm6XFDnFU
         o/+BNBaiYVUjz7SEbc5/Av6xRKmxKdShrnz//2GXK1x3WaEJ1uS6FNwcC+OAIr1+C3eo
         Aj38iZyIbo0/X5ZBt2MTsUFf66Ok/M8rA1TwJltTegP7pO7EcetxtcgGtw6qiNcy6IHs
         wi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809995; x=1792414795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/YD2PthIXuKbIegQAp4lU8CkrkTGnFWWU88rL4EQAU=;
        b=xjoBvX9ScxLZeY9SUiCAYhVOtE/qevXCZnB+cm9SGE/i/qM0d5bSG+2yaFRZl/zlSH
         qgOK2ADLGzavB7TgLbzQJjtYjTuyGPzCjJrwYCpV0SSzoRTED07hpSqlNxxhWQQaJVc2
         u5ff3d5h9COJyIIu2EjsHPkeUlBnFQ5ZHGkBY1DGwqUKNipY6ohscEpLrC8/enE6k7sV
         foLUErPeu+28CN4KsCFx3kq8zEWiRS/I14DXvXZW3wHlAy1BDGUI9BRqVgeY6HxzCi5G
         2mbt0v9kF8eHjnXV0+m/rR3ZPyi59Bn5Z1REFztIKkXYPPaxUw1Y9kU4czZlcKgwcTWi
         1J4w==
X-Forwarded-Encrypted: i=1; AKwUvBxUua+hZSnMl6v4Jfd8XIoZwKG75u87mALASZmiNTFRJZvh//r4NKSGKtk1KfoBSfDbzf8SGFoowdjx5TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5LW5BhhEmzhIiASjet5OLZ1YxRqnaWRU0memdcpNmzCba4woY
	E7u+J/pfpbltRAuOecZn9rSGchMa4uKyNlM1hYlI02gLIjSzrkShdc9leNSRyfmW0T4=
X-Gm-Gg: AYBFou0UfE1SXJ+u+Dpfi5ro+gL+Fr0sON6QmeyWiW6+shOvxkO8BL2UVYsvU8I+jXr
	5PGse+3e9FLbaCEKQQDEgDuvRkbqTj/CQdDk8xsbA4QZj+Av6U+RV4q8jp6/zzZA5aTIH/KsKLM
	F/6UMe+42EmNRODuqFN2sdo0mxWQnbtLb21Kca2Nu/LiWj2lycc4PkXEfyPqcMk8cp2sDrk1zvy
	N6oxqsNq2k1WrXDM1IHO6B05crd3PRKyW0Nj+J/vG/KvJlyJVw5xHstyLCkDHlbrJD85ajyBkK3
	OblXv99Ly8oWYLh3Lg0tzCx+5bJGks++MRKOqaYj25n8JngDigTqmroUgKUZGawZwU3SBcmjzwE
	kjBgOvsZN5cGykrwR3JDMjv9vubobCsEsvBdyAewq0u/ai6DIv41vceutqqTLRLyuafBliBO0MZ
	icDhle2bOzSmmd4/aDuwMtJC5MXbqXKMOAJIKi1Iw7OtrYBJtUfQ0tc/nkTp8yCF/EpEm8IExzd
	Nzf/enM37b8z7KwhXJ9lKa6aMlL4FqC5P0pSNyyU7Fk8jCYewuGzLBctldP6/m0pUEv4ECT7w==
X-Received: by 2002:a05:7301:3f07:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-3588f02e0f2mr12060523eec.9.1791809995129;
        Mon, 12 Oct 2026 05:59:55 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm35348067eec.21.2026.10.12.05.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:59:54 -0700 (PDT)
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
Subject: [PATCH net v3 4/6] amt: key relay tunnel state on the (address, port) endpoint, not the address
Date: Mon, 12 Oct 2026 12:59:41 +0000
Message-ID: <20261012125943.558629-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125943.558629-1-omar@blockcast.net>
References: <20261012125943.558629-1-omar@blockcast.net>
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

Note this removes an accidental bound: while tunnels were keyed on the
address alone, one source address could never hold more than one tunnel,
whatever it did. RFC 7450 s5.3.3 asks for that bound explicitly, and it
is restored in a companion net-next patch ("amt: bound relay tunnels
admitted per source address") rather than here, since it adds UAPI and
this is a fix.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 550b0a5..2feb418 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2492,6 +2492,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	u64 response_mac;
 	__be32 saddr;
 	__be32 nonce;
+	__be16 sport;
 
 	saddr = ip_hdr(skb)->saddr;
 
@@ -2505,6 +2506,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 
 	nonce = amtmu->nonce;
 	response_mac = amtmu->response_mac;
+	/* Snapshot the tunnel endpoint port before the encap is stripped. */
+	sport = udp_hdr(skb)->source;
 
 	if (iptunnel_pull_header(skb, hdr_size, skb->protocol, false))
 		return true;
@@ -2512,7 +2515,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	skb_reset_network_header(skb);
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == saddr) {
+		if (tunnel->ip4 == saddr &&
+		    tunnel->source_port == sport) {
 			if ((nonce == tunnel->nonce &&
 			     response_mac == tunnel->mac)) {
 				/* Refresh liveness only.  gc_wq is re-armed by
@@ -2729,7 +2733,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 		return true;
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
-		if (tunnel->ip4 == iph->saddr)
+		if (tunnel->ip4 == iph->saddr &&
+		    tunnel->source_port == udph->source)
 			goto send;
 
 	spin_lock_bh(&amt->lock);
@@ -2768,6 +2773,12 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	spin_unlock_bh(&amt->lock);
 
 send:
+	/* source_port is part of the tunnel's identity and is set once, in
+	 * the allocation path above; the lookup only reaches here on an exact
+	 * (address, port) match, so it already equals udph->source.  Do not
+	 * "refresh" it here: doing so let a colliding Request from a new port
+	 * steal an established tunnel outright.
+	 */
 	tunnel->nonce = amtrh->nonce;
 	mac = siphash_3u32((__force u32)tunnel->ip4,
 			   (__force u32)tunnel->source_port,
-- 
2.43.0

