Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612126;
	b=MselmdJFgfifQZ+yn88o3xKTq3O/jOOQYQlYpQz7Oo3wnAb5RfmYPNpP7bAfTeMZhgKx
	 cEv1nrK/Tv2aatT/7VgumMDocRR2m0K/Ta97eW4vbjVNPLWtChXAH5yzpOrn0ds8uUamX
	 3JcYFOhDVFgMflhyYP3ZUkOERkOqrpMCKEypgCt16K+TlgLXMxkZ5jHh2P6PiKgK69iVU
	 J9jd8W2nsA7AKVa+uO7mi8IV3JCP9BcRdnCUKqoMwGKMlFw+xMFQ9S+ecBfkxV2rdg3X4
	 av1VqEgkoP9yt446omb6A7yhgv9mNPgLzpvj7l4yoAphHZlf9Y4b13SKv44YmIHXlgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eG8sIetC7zpwDTaN+oZEyMcNNgTpFmawbIcCT4kAbrI=;
	b=Y/rfgOykPPaCoMlsyUuSMrhCG79O+vJQ4cT7ES9ezANEVCe9+xOBWzxh9dhMgIgb0FZY
	 PbF4r8mNuTGNQ0bcOb4njE+3ayyF0V82G3MwCn5Bm22pXuXDrr6nWQoKZtY9UbMCEB+oM
	 DdpvjNMQytctTq7qXzgnoer1lKjqAFIbLvjTPkBCiONRGjpE5Hdu1ocAWl+gzSW7qyBl0
	 4MT3QBlHm341E1k3t3LvcFOqVQIhw3F4z4lr/1VUZaYAn45DiyD9uG8NEYB1rVsBX8xmF
	 wkBZlq0+/K/8QY9XxxbpMPnyuQHtc17njWxkJN176HaG8T1P18kBSbrWgKfW/qDND+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=NDNfvu1w;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CBB606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CBB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=NDNfvu1w
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ecbdf5343so37529656d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794612125; x=1795216925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eG8sIetC7zpwDTaN+oZEyMcNNgTpFmawbIcCT4kAbrI=;
        b=NDNfvu1wf2iRj16DT3eUT5BRV92q1asM15vPRmZxAqSpfgP3gBLrjzeJaET6RmRZM6
         0qfP2ZejcU0vRUhpJwVNKqJheYuxmBuOIZWRPaqnj0Pc8gc1g3wmsdeyqxVqeD1r1uaw
         mStX/kqos1G2GzJnUkZEWO/pQAF7tie370CcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612125; x=1795216925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG8sIetC7zpwDTaN+oZEyMcNNgTpFmawbIcCT4kAbrI=;
        b=bFhcWfllH6bItYr4QezrxDq1j3sF5rnRccNTIwyHESct4FutOsHxLJzK2tJDB9bsku
         PgKbK46yMuDuszPlYhH5u/KFlHmIRw7cxg02ViEW9PDe9rCJx5AeCkQCpQ2G7U6Wfan+
         quVCAPyJ7utPbFGghME/LMlzjC9OuDaQvCrUaJOktc8gcv1Dtd4cr8PfiXxh7tl4voum
         UeMuUjFMZz9YtAIIKiiHn4QpgwMsNPuL1DVUtPepPPdZookLh5DlBq4GAb+iponA/AHc
         MB+2JqIQvAjpVLJp8ZMLtD4cKNkT+HKZSyliR2k6+UDZiN5Uy+BmFa32d9PpX8nXIG9e
         S+PA==
X-Forwarded-Encrypted: i=1; AL+hErEdM/H6jHdlZIXGBGJ4ED6Cyq4ZqEBLo3F+oqrlrjw8NLKVlrX+N3/kc0viocDRQ75I1ZyIwhUZBlWI3lM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JjPaJoBJGdgpciTfnLARXn7Y5Cew565u885cZQTzqc2kpHX1L
	RXmjD5fWfAQwdx/aYn+vkmNItZhO3CTZ761d8naoMiX7pIQaj5nA5NydLEvs42L4Kuk=
X-Gm-Gg: AYBFou07NC9tf0V/cWN9/m8F8eKHObULsSNgZ649xEea60D4tJ8HFdIc7rdTu45XyZZ
	hx0nXOS7mdhwFcVvgWknucsgW3n4nJ1Ksadohr4vlqq1X4lshg0oCIh5jBTvWW/+e+ZrT7QGIeB
	wqWOofgD1AQyRbk7Bz6iLyyqK+wzez7RrS6JYK/ItR+nFzl1RmEjEBgIg59lN6k1Iw269b2eAFV
	W+pwOQaYLUodVV2JsloJu3dCq/O3RguCAK14wBAsQ/L2FSjCZtbfLMeYUZlk0ylSERwlvOKV3md
	FyZIyiMlf/P+TklQ8wOwjW1T+NRLxxBCsJnrV0D9Q+IB7NLOEqpuLU4SBG2KnaTdMEweORrLOzj
	rQrGqzC16j7FSgZ57mEp5OeF547uUJ0gUydvNQsotuWklv2MawzVuWHaUB1dAgJU9+OPAOAZ7BX
	0+/97p2S82uWnTTaxuTscVt/bjqtngYRG5LUepo7/4G1C//UieMzJtKY/7sAJ2G8PCsMzo0DKf7
	vKQ8XMyqDDXwb1OzPh4fgsSj/RM9A9tInnrJUVJ51/di4aWMIu0Gco5kPLfJSQf7N1XvqtAVRUy
	jgvNwox8wN9KzOG5C3pP8JMhzqIWa0iTvIS1JMKdZrx477w8xYzK3XX4wmV8W+RH6mtk8GJ5bkd
	eA6qNP0JrX6ktUHO/pj7W1nT8jzdNxKcDz6NcQn4leQTfewicMjI=
X-Received: by 2002:a05:6214:d8d:b0:91f:ffc:69cf with SMTP id 6a1803df08f44-91f13a9513emr121471506d6.35.1794612124812;
        Fri, 13 Nov 2026 15:22:04 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm31147806d6.26.2026.11.13.15.22.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 15:22:04 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: dev@openvswitch.org
Cc: netdev@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH net v3] net: openvswitch: make transport checksums writable
Date: Fri, 13 Nov 2026 15:21:58 -0800
Message-ID: <20261113232158.61174-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

OVS can still rewrite an IP address after transport-header extraction
fails. The checksum helpers check skb->len, which includes non-linear
data, before directly accessing the L4 checksum. If the transport header
was not pulled into the linear head, the checksum update can read or
write beyond it.

Call skb_ensure_writable() before IPv4 TCP/UDP and IPv6 TCP/UDP/ICMPv6
checksum updates. Save the original addresses and reload header pointers,
since even a failed pull can move the skb head.

Keep failures nonfatal to preserve the existing policy of rewriting IP
addresses when the transport header is unavailable. A failed pull or
unshare may leave a stale checksum or CHECKSUM_PARTIAL seed; the receiver
may discard the packet.

The issue was found by an LLM.

Fixes: ccb1352e76cf ("net: Add Open vSwitch kernel components.")
Fixes: 3fdbd1ce11e5 ("openvswitch: add ipv6 'set' action")
Suggested-by: Ilya Maximets <i.maximets@ovn.org>
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v3:
- Select source and destination addresses with booleans instead of
  calculating offsets. Keep the saved IPv6 address across head movement.
- Remove the redundant IPv6 fragment check and correct tab alignment.
- Move testing details below the separator and clean up attribution.

v2: https://lore.kernel.org/r/20261107040238.27606-1-kylebot@openai.com
v1: https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com

I have a reproducer for this issue and can share through DM.

 net/openvswitch/actions.c | 77 +++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..3b10b3fbadc3 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -319,20 +319,22 @@ static int pop_nsh(struct sk_buff *skb, struct sw_flow_key *key)
 	return 0;
 }
 
-static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
-				  __be32 addr, __be32 new_addr)
+static void update_ip_l4_checksum(struct sk_buff *skb, __be32 addr,
+				  __be32 new_addr)
 {
-	int transport_len = skb->len - skb_transport_offset(skb);
+	struct iphdr *nh = ip_hdr(skb);
 
 	if (nh->frag_off & htons(IP_OFFSET))
 		return;
 
 	if (nh->protocol == IPPROTO_TCP) {
-		if (likely(transport_len >= sizeof(struct tcphdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct tcphdr))))
 			inet_proto_csum_replace4(&tcp_hdr(skb)->check, skb,
 						 addr, new_addr, true);
 	} else if (nh->protocol == IPPROTO_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -345,32 +347,34 @@ static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
 	}
 }
 
-static void set_ip_addr(struct sk_buff *skb, struct iphdr *nh,
-			__be32 *addr, __be32 new_addr)
+/* May move the skb head; callers must reload packet pointers. */
+static void set_ip_addr(struct sk_buff *skb, __be32 new_addr, bool saddr)
 {
-	update_ip_l4_checksum(skb, nh, *addr, new_addr);
-	csum_replace4(&nh->check, *addr, new_addr);
+	__be32 old_addr = saddr ? ip_hdr(skb)->saddr : ip_hdr(skb)->daddr;
+
+	update_ip_l4_checksum(skb, old_addr, new_addr);
+	csum_replace4(&ip_hdr(skb)->check, old_addr, new_addr);
+
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
-	*addr = new_addr;
+
+	if (saddr)
+		ip_hdr(skb)->saddr = new_addr;
+	else
+		ip_hdr(skb)->daddr = new_addr;
 }
 
 static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 				 __be32 addr[4], const __be32 new_addr[4])
 {
-	int transport_len;
-
-	if (l4_proto == NEXTHDR_FRAGMENT)
-		return;
-
-	transport_len = skb->len - skb_transport_offset(skb);
-
 	if (l4_proto == NEXTHDR_TCP) {
-		if (likely(transport_len >= sizeof(struct tcphdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct tcphdr))))
 			inet_proto_csum_replace16(&tcp_hdr(skb)->check, skb,
 						  addr, new_addr, true);
 	} else if (l4_proto == NEXTHDR_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -381,7 +385,8 @@ static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 			}
 		}
 	} else if (l4_proto == NEXTHDR_ICMP) {
-		if (likely(transport_len >= sizeof(struct icmp6hdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct icmp6hdr))))
 			inet_proto_csum_replace16(&icmp6_hdr(skb)->icmp6_cksum,
 						  skb, addr, new_addr, true);
 	}
@@ -396,16 +401,28 @@ static void mask_ipv6_addr(const __be32 old[4], const __be32 addr[4],
 	masked[3] = OVS_MASKED(old[3], addr[3], mask[3]);
 }
 
+/* May move the skb head; callers must reload packet pointers. */
 static void set_ipv6_addr(struct sk_buff *skb, u8 l4_proto,
-			  __be32 addr[4], const __be32 new_addr[4],
+			  const __be32 new_addr[4], bool saddr,
 			  bool recalculate_csum)
 {
-	if (recalculate_csum)
-		update_ipv6_checksum(skb, l4_proto, addr, new_addr);
+	struct ipv6hdr *nh = ipv6_hdr(skb);
+	__be32 old_addr[4];
+
+	if (recalculate_csum) {
+		memcpy(old_addr, saddr ? &nh->saddr : &nh->daddr,
+		       sizeof(old_addr));
+		update_ipv6_checksum(skb, l4_proto, old_addr, new_addr);
+		nh = ipv6_hdr(skb);
+	}
 
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
-	memcpy(addr, new_addr, sizeof(__be32[4]));
+
+	if (saddr)
+		memcpy(&nh->saddr, new_addr, sizeof(__be32[4]));
+	else
+		memcpy(&nh->daddr, new_addr, sizeof(__be32[4]));
 }
 
 static void set_ipv6_dsfield(struct sk_buff *skb, struct ipv6hdr *nh, u8 ipv6_tclass, u8 mask)
@@ -479,16 +496,18 @@ static int set_ipv4(struct sk_buff *skb, struct sw_flow_key *flow_key,
 		new_addr = OVS_MASKED(nh->saddr, key->ipv4_src, mask->ipv4_src);
 
 		if (unlikely(new_addr != nh->saddr)) {
-			set_ip_addr(skb, nh, &nh->saddr, new_addr);
+			set_ip_addr(skb, new_addr, true);
 			flow_key->ipv4.addr.src = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_dst) {
 		new_addr = OVS_MASKED(nh->daddr, key->ipv4_dst, mask->ipv4_dst);
 
 		if (unlikely(new_addr != nh->daddr)) {
-			set_ip_addr(skb, nh, &nh->daddr, new_addr);
+			set_ip_addr(skb, new_addr, false);
 			flow_key->ipv4.addr.dst = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_tos) {
@@ -533,10 +552,11 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 		mask_ipv6_addr(saddr, key->ipv6_src, mask->ipv6_src, masked);
 
 		if (unlikely(memcmp(saddr, masked, sizeof(masked)))) {
-			set_ipv6_addr(skb, flow_key->ip.proto, saddr, masked,
+			set_ipv6_addr(skb, flow_key->ip.proto, masked, true,
 				      true);
 			memcpy(&flow_key->ipv6.addr.src, masked,
 			       sizeof(flow_key->ipv6.addr.src));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (is_ipv6_mask_nonzero(mask->ipv6_dst)) {
@@ -555,10 +575,11 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 							     NULL, &flags)
 					       != NEXTHDR_ROUTING);
 
-			set_ipv6_addr(skb, flow_key->ip.proto, daddr, masked,
+			set_ipv6_addr(skb, flow_key->ip.proto, masked, false,
 				      recalc_csum);
 			memcpy(&flow_key->ipv6.addr.dst, masked,
 			       sizeof(flow_key->ipv6.addr.dst));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (mask->ipv6_tclass) {

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.55.0.openai.911.g06873a30d2f3

