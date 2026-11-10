Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342028;
	b=ec8gsbRQcPfTHvfFCMe6ZiLvJElUmZzJoRMDY2lB/TCvFQrnIKevFx1JyMcrOmGWxveg
	 +wBwXj1M9f4hvA4G6P80dMIqGzfs394MI+YA7AbMgUhsvESNi5a0u9DVLJAhn89nnuM4/
	 q5Dn2hz20TMPyLHxYMtSWuGbAw7abd3mMHaIpgnQfB7gY6ZEzlLmy9HxLxiuVBPtsKOgw
	 56dwg1I94cx3J28cloYVww9lbBRe9VUeG65VMUUuYZhilixVej1PPtJio9IxdvYHwmnnd
	 /B1hvxPAdfs3MiXXtybtU7V+BswKpwbevM6Uf4wRSdeQluOqUj8NrQxysCNJnX+aB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIj8u929GVc3WDfh5vUX6nGJWdvQEzEmOyyq8qoXzIU=;
	b=k2QqeeGqCQKUwS2cxE55GR1UZsvenAFHh4fJhmol8wjztk1iCIC/9qHUuGDlJI1fukkx
	 u5RzROMd7mJDernX7cxuhXt/v80EENighyFT/DpS2U7BwlpZXlz6ZRuVeJRYGpaldM0/U
	 6g1duXbT6JpHXAoggkPDO467TwWKLjrQ63AHQbuqpYDCNVbQ5nQ9NBJ5GrD9I3fbl/zvg
	 ifbB84bDAoM+0v0LegsFhnzWe6lEC1lpUdBMnOiEu0AEBre6MTxFyxc/qIeopkujyb3+h
	 45czQlMRMF+9ABbezmZii3rOYDczHeSN/gPSC5xmZmlQdNhxfduIjpWuy9eKAeBskwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT3Dq4Cq;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B94606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B94606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT3Dq4Cq
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3aae7df0971so27384951fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342026; x=1794946826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIj8u929GVc3WDfh5vUX6nGJWdvQEzEmOyyq8qoXzIU=;
        b=hT3Dq4CqVSQT2nZKbJDxqH6Q0rPluglsO5fL7/gO9KKkf2Kld04HIX5SC7qkjuQBoP
         Fxp+oEVlHfTVZ/EDOEOJpPBIi0TZjHS0a8wVo9LyIswRQrngUAfZeWSRXBYIts4h04Pt
         lD4E5WeUHiUxVOnYdnbuOQwRtfurQhnGpr7VrtIynxMzr5vEx5Xdrv8LDXxWg0GUk0x0
         JArL6rQtoS/9JuUqiagJHul85CxER6vEeX2K7A1InZDiY0IZQQHOLKzWLPaxeUVLoSIy
         F4/H48iOxZvvlpSsb2oH1jgwa+q0i+Fpz2KBPJVWHfJGlYJAeuUkSa8bAroEvLt1owdM
         jkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342026; x=1794946826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIj8u929GVc3WDfh5vUX6nGJWdvQEzEmOyyq8qoXzIU=;
        b=lXdfls8JKUm+4zazKS9bNjPDzKIOP/ujWhui/0c5mM8f+UYSe9vTAShWN7HLhq6fZi
         pIWZkVYIcaujxTcGLKZye3tb5AZ0AhCZ9BkJeBD3zAPlouAVg15MbqcEIPBAmhlgtImR
         +lryZ9RcGM6dHGPGgGP/2d4kWPYH+12KjPDlcIOx36kAghwOBP8mg/yL218u9AHakN4I
         dEz77DccYQSQRH0tLA4gr/JcktyzZGxHZW9AOP0BhiwiFpTGkULQf2tcGPYCflbIqbyo
         d0ek4S8H8vZ4zNBNa1ViNTUE+eK83L76PpQP073b4DCDDsE/urJRh2uMe7ciUpF9PIEd
         h0xQ==
X-Forwarded-Encrypted: i=1; AL+hErH6XysDzuPGSYKbbjZhR1rzdPmxEwU7aS/gRWGhRSkqWaCKi0b9BvVPB1LM3b9nXt9mUzSWTFXwqq/Nbqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HWuin6O2EdIzI3bRni6tBK/Oz952fsVqbxiUS+NkKb9s99yPa
	pZPIaTcvZHpXyR7mCCZc703lIO7hOT0gl9qnhAXKOXtqSG4ZYdWwiFnl
X-Gm-Gg: AYBFou3UubvGxPmL5L3mM09CpjiRJqU3knkjIcTHyIBppoQu28xpRwRBEirgGHS0Gtf
	QUatOpixlZ2h8MRNYVP4FUkbKFLFIQwN1iX+7iDgYHzu9pk4Rlnl3h0A8+6eBiKFKrszgd907ae
	BhrZi2am7+kF1j8jh34BDCB20ZoIHaFQ5dKxyPgcgptI4uMgtx84FcYd/boAdj7GBS18X4NkXi8
	Y5SB0Nx131wiclbnfHEkLBf1BdmdZs2HaGPdZg2Rg6WFdbVE5NWr+HVcs2cWWgNGl4KJUZWvZZb
	VO0O/aLRkBCU7HUWASeZVMmTaWhedZDeoAgcCmPU9RhjhPFXIsV13nlyU6QqQe0Szf3yfr5UiZ8
	K9lcoNSZQaLHfmgAHnH0bLkIIPA3pyV3ogpBB7eZ0aNaUtT4Ip7gjqRX4URaGf9kNsbcZAcrJjs
	078m9eqWvo/lXvWa35iFRV3/o5bLCVBoLFDUORdx4vNGzPyMtXJqG0T+OR0r0gr/j3XfpyNYj4x
	iwOsIzx9hcPKxDXGB3RDRQg0yGiMzp2pARGt/GG6UxcIzI9QQFP3OogfNKTZ+JwigpCktemi90z
	Wc/Jd4azj88uMkPb+dFNxRYVyLS+YOtO3TiafQpFX1f7XztK/IR9unMvZ30Wtika45PQK2R49DI
	fyxk2XNhYuPgzyjn9FCs+OjwLJERQOUXgfpcmfA==
X-Received: by 2002:a05:651c:a333:b0:3ac:f011:4863 with SMTP id 38308e7fff4ca-3ae0963d670mr7828721fa.20.1794342025931;
        Tue, 10 Nov 2026 12:20:25 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.137.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm5945401fa.0.2026.11.10.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:20:25 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 1/8] ip_tunnel: add drop reasons to the generic RX path
Date: Tue, 10 Nov 2026 23:20:14 +0300
Message-ID: <20261110202021.821224-2-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
References: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
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

ip_tunnel_rcv() collapses four distinct failures into the single
kfree_skb() under its drop label:

 - the tunnel options carried by the packet do not match the tunnel
   configuration (checksum or sequence number),
 - the sequence number is older than the expected one,
 - the inner network header cannot be pulled,
 - the ECN decapsulation check fails (RFC 6040).

drop_monitor and the skb:kfree_skb tracepoint do see these packets, but
all four as SKB_DROP_REASON_NOT_SPECIFIED from the same call site, so
neither the reason nor the location tells the failures apart. Only the
device error counters (rx_crc_errors, rx_fifo_errors, rx_length_errors,
rx_frame_errors) hint at the cause, and they are not tied to the
dropped packet.

Add two drop reasons for the tunnel specific cases and reuse the
existing ones for the rest:

 - SKB_DROP_REASON_TUNNEL_OPT_MISMATCH is used when the packet lacks the
   checksum or the sequence number option the tunnel is configured for,
   or carries a checksum the tunnel is not configured for, as the
   checksum check compares both ways. This is a configuration mismatch
   between the two endpoints rather than a corrupted checksum: the
   checksum itself is validated earlier, in gre_parse_header().

 - SKB_DROP_REASON_TUNNEL_OLD_SEQ is used when the sequence number is
   older than the expected one. Unlike the previous one, this is not a
   configuration mismatch: the packet may have been reordered, in the
   network or by the receive steering of this host, and a remote
   endpoint that restarts and resets its sequence numbering can have all
   of its packets dropped until its sequence numbers catch up with
   i_seqno.

 - pskb_inet_may_pull_reason() already computes a drop reason,
   SKB_DROP_REASON_PKT_TOO_SMALL or SKB_DROP_REASON_NOMEM, which has so
   far been discarded.

 - SKB_DROP_REASON_IP_TUNNEL_ECN already exists and documents exactly
   this check, but until now it was only used by vxlan.

The sequence number check is split in two so that the two cases can be
told apart. The error counters are left unchanged.

ip_tunnel_rcv() is the RX path of ip_gre, ipip and sit, the latter for
IPv4 and MPLS payloads only: ipip6_rcv() handles IPv6 in IPv4 on its
own. The checksum and the sequence number options only exist for GRE,
so the two new reasons are meant for ip_gre. ipip and sit carry
neither option and only hit SKB_DROP_REASON_TUNNEL_OPT_MISMATCH if their
i_flags are given those bits, for instance through IFLA_IPTUN_FLAGS;
such a device then drops every packet that reaches ip_tunnel_rcv(),
with or without this patch. The ECN reason applies to all three, while
the length ones can only be hit through ip_gre: tunnel4_rcv() has
already pulled the inner IPv4 header for ipip and sit, and
pskb_inet_may_pull_reason() has nothing to pull for an MPLS payload.

ip_tunnel_rcv() initializes the reason to SKB_DROP_REASON_NOT_SPECIFIED,
as its first statement does not set it, and every jump to its drop
label comes with a reason of its own. The rest of the series follows
the same rule wherever a function has a drop label: an initializer
unless the first statement sets the reason, and a reason of its own for
every jump to the label.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h | 17 +++++++++++++++++
 net/ipv4/ip_tunnel.c          | 19 +++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index fa2fe8990557..5c0d9b0211bc 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -128,6 +128,8 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(TUNNEL_OPT_MISMATCH)		\
+	FN(TUNNEL_OLD_SEQ)		\
 	FNe(MAX)
 
 /**
@@ -612,6 +614,21 @@ enum skb_drop_reason {
 	 * itself.
 	 */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OPT_MISMATCH: the tunnel options carried by
+	 * the packet do not match the tunnel configuration, e.g. a GRE tunnel
+	 * configured with 'icsum' or 'iseq' received a packet with no checksum
+	 * or no sequence number, or a GRE tunnel without 'icsum' received a
+	 * packet with a checksum.
+	 */
+	SKB_DROP_REASON_TUNNEL_OPT_MISMATCH,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OLD_SEQ: the sequence number carried by the
+	 * packet is older than the one expected by the tunnel, e.g. the packet
+	 * was reordered in the network or by the receive processing, or the
+	 * remote endpoint restarted and reset its sequence numbering.
+	 */
+	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 0875474a578a..7d8744ed1664 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -384,6 +384,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		  const struct tnl_ptk_info *tpi, struct metadata_dst *tun_dst,
 		  bool log_ecn_error)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct iphdr *iph = ip_hdr(skb);
 	int nh, err;
 
@@ -398,14 +399,22 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno && (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OLD_SEQ;
 			goto drop;
 		}
 		tunnel->i_seqno = ntohl(tpi->seq) + 1;
@@ -419,7 +428,8 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 
 	skb_set_network_header(skb, (tunnel->dev->type == ARPHRD_ETHER) ? ETH_HLEN : 0);
 
-	if (!pskb_inet_may_pull(skb)) {
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -434,6 +444,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -457,7 +468,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_rcv);
-- 
2.47.3

