Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794024163;
	b=VilrDgMj6FGwP77hA7Kb6y/ivd9ziWh50P9m6RK303CHiAJhX1DLmJ/GmIsZpsQu5g7L
	 fxd3D3bgJEIizNQvM6uzS431gA1pq8rPlHReYEt6MTSkuVHnxiNDoe/ZU6UZseCFAmmwe
	 gz/jN5rSFDit2Yh4IgM7FhqVDuTPpeN5tapsdg5Ar5OGJvLSpTSmB6zcuH5twEEGo4hvq
	 mU3kvaqQw8anwZt9wqeML/i1T8vh0UDAfTpJxTCQGRybrcI6jbOfRi71xPlvZiUJyP9Xt
	 eOfDkG77OVviXq+fEU5iG972Dc4TX43btLg2NuHRsc464axgZV8twDEXeMrRJFu/OrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794024163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iDNBUXlZYHZzJ9wp74s8HsM2SQUSI7+qOI3EN8FHBMw=;
	b=4JNUmufYUoxSTguedZa8XB066p/l1mY0322Mgxm0uMWcdlIZlzm5HWC7eVpnZkBY7VIy
	 UiV395Zfp4VX5t0Rg2WS6iM/3sSqe1dMtjv6+AYfvXypeoOAsM/MOKQY+A7QwgvPPqkAn
	 LAoJVvbpp+811fFWXGXrzErhU6Y/U1nnvLTsrjILSXZtKpHBCsNqnpKx61Vs+Do0K7L3N
	 VhjuSpqfCDmEDis8HQTCxY8tUFQ5V6lx88BctnyzzU2qJF1pc5+d5wbk45hs0b345coZy
	 KshZfF7IgNQQ/SpyN11YWZ3sH6Zpxe7th7dWYAeHLKVTxUnKZx637JiFa9e3SXFj/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b="Zx4lXM/Y";
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B412C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Zx4lXM/Y
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d290b10a35so583020eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794024161; x=1794628961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDNBUXlZYHZzJ9wp74s8HsM2SQUSI7+qOI3EN8FHBMw=;
        b=Zx4lXM/YLmu98OuBoXL0bPIqITK6E0AeA/i/VUJXhJAd7XkOdbDo3F7W9wEXV2cAgL
         OwM9/GJt2AnVBheOesg7wWIk3kElkAe7491IDsIuQvigM1GEIbDUBynUI2hqydxSuB/p
         nU/mwi/Y+sEmTKaVcgeFfKk5B084RG5mxNV+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794024161; x=1794628961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDNBUXlZYHZzJ9wp74s8HsM2SQUSI7+qOI3EN8FHBMw=;
        b=pzCsvS/ZNvrQkv0cELEOF+gw97VrzBHENFwmcOtyGoQVxREGmfqqz1/QdRc2rlk1ao
         mr7XEUfTiTkmszfn5dIrGElY1GEtWjUIYbBQBCv2haMVf6fC5pwKuxjY/KC6EUiGML4l
         Rum3bwb246ZO1q/JnI5yFlkDaQfMEKxup4VudumL568OF1IEnMh5/FLFpXiPlBxXsb4u
         2Sb7eS0jIUwPsylHh3Rb6sj3D5EQsVFSWZdDAoeMNGOGuJWVijxZ3ykSJC4yrEXVK4qj
         FOBHTNlWfG2U4k6cfWXF4VpahslXpbneE0+yzJWLElTiBIInFZ/xavRm14l78Vk6P4Tm
         Mtaw==
X-Forwarded-Encrypted: i=1; AKwUvBz0ptRlq/RR6sVgGpR71XCid6SIosLARffASDxT0FkbxN2fLrDIN8PZbwA+WJBfCYzp8Fy3KnVYsPOtXK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i4EhZv1ESyLEOKgeUHt/4cP96fQJt02jvfnL2RQV9em8ULjem
	n9swZC8wuLUL+dNbddT97IjT/X6wjoHQvBU7TGqkD+vlskceS9VCh/fWI+6L0W6FhnM=
X-Gm-Gg: AYBFou2zN/BOKUgeegUwsVvt3z+isr4Crz577pIpgoHNr+WNbw0iAceFGTZAtod/PN9
	1nXLb6dfk7I5+vmtqWgq2qRW7XWc/yAL/vsKYnL/eaOfV8nxSNEFwOpHgACMUFv5hI5CCkYCaRq
	u6FlEaE9Auiboc0AvLVkTvVqcSel2/S/AWhNgB2uQ0AFTtDNiwc9R04rMFrwkC4lvUVD/Qy4R3j
	bCPwVbAjAUg+fwCJHj1T8OK9ZEkIwSZgwN7SjGszSF9jQdWh/WiSRCuh+0A3cVNcZG1dtw0VIUG
	QpdbFo4GBy6DlbdrDAsyyXdk/sGQfx/RJaIwbMgHF+bnlj9tvcy6baIUB28613rXvAzT3Kd5nkg
	RKBHwbeT+EVlMZ3TfcouOo2sz/AkMttGsIY4xGk9cRfPURb+nQ5yikVVW9dx0Ius0WvDnQVVy2L
	95vNzF0Y46bdb//xPefluxdmp2jc7GRxsVzdZ7wsYWfDF9PzqLf+0gqVkJHfbJEAxPEVHavZ2ez
	IBZbV3OMguaNRLPCEUEaxI9yAn9uigRS+CXanvKIg4UNSqWsXzUQsEHE7ueRMccaJpEfsk2g2l8
	mpA0wseoRHinTaydQaCjcWDiOv8FLd2o6D+5kQdz3X1tzxjANDsu4TwIc7njSMlnt1Yc6FQPr4m
	DF9ln1aBAPPtQ+14R2YrrKP5Pv/yE8g==
X-Received: by 2002:a05:6820:448b:b0:6ef:1250:1064 with SMTP id 006d021491bc7-716e788c04amr2164318eaf.30.1794024161505;
        Fri, 06 Nov 2026 20:02:41 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e9cb331fsm3118162eaf.2.2026.11.06.20.02.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:02:41 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: dev@openvswitch.org,
	netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: openvswitch: make transport checksums writable
Date: Fri,  6 Nov 2026 20:02:38 -0800
Message-ID: <20261107040238.27606-1-kylebot@openai.com>
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

An IP address rewrite can execute even if the transport-header pull in
key_extract_l3l4() failed. In that case the transport key is cleared,
but the IP protocol and transport offset remain available. The address
rewrite helpers check the total skb length before updating the transport
checksum. This does not guarantee that the checksum is in the linear
head, or that it is writable.

An AI-assisted source review identified the missing writability checks.
The supplied userspace reproducer sends non-linear IPv6 packets with
long, valid extension-header chains through TAP and Open vSwitch. It
triggers a size-2 KASAN access in inet_proto_csum_replace16() as UID
1000 in an owned user/network namespace. The reproduction uses natural
allocation pressure, without kernel changes or error injection. IPv4
TCP/UDP and IPv6 TCP/UDP/ICMPv6 address rewrites have the same issue.

Replace the total-length checks with skb_ensure_writable() immediately
before each transport-checksum access. Keep an unavailable transport
checksum nonfatal, as with the existing truncated-header handling.
Preserve the old address values across the operation and reload packet
pointers afterwards, since even a failed pull can have moved the skb
head. Retain the existing unchanged-address, later-fragment, and IPv6
routing-header behavior.

The Open vSwitch module builds with GCC and W=1. The changed object
also builds with allyesconfig and allmodconfig. Code review covers the
common SET action paths and adjacent checksum writers. The supplied
reproducer and kernel selftests have not been rerun against the rebuilt
module. Codex assisted with the patch review, validation, and report
preparation.

The issue was found by an LLM.

Fixes: ccb1352e76cf ("net: Add Open vSwitch kernel components.")
Fixes: 3fdbd1ce11e5 ("openvswitch: add ipv6 'set' action")
Link: https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com
Suggested-by: Ilya Maximets <i.maximets@ovn.org>
Suggested-by: Aaron Conole <aconole@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v2:
- Put writability checks directly in the transport-checksum branches.
- Keep an unavailable L4 checksum update nonfatal.
- Save the original addresses and refresh all potentially stale packet
  pointers, including after a failed pull.
- Target net, include all maintainers, and describe discovery and testing.
v1: https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com

I have a reproducer for this issue and can share through DM.

 net/openvswitch/actions.c | 56 +++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..fe472e950cb1 100644
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
+					       sizeof(struct tcphdr))))
 			inet_proto_csum_replace4(&tcp_hdr(skb)->check, skb,
 						 addr, new_addr, true);
 	} else if (nh->protocol == IPPROTO_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+					       sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -345,11 +347,15 @@ static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
 	}
 }
 
-static void set_ip_addr(struct sk_buff *skb, struct iphdr *nh,
-			__be32 *addr, __be32 new_addr)
+/* May move the skb head; callers must reload packet pointers. */
+static void set_ip_addr(struct sk_buff *skb, __be32 *addr, __be32 new_addr)
 {
-	update_ip_l4_checksum(skb, nh, *addr, new_addr);
-	csum_replace4(&nh->check, *addr, new_addr);
+	unsigned int addr_offset = (u8 *)addr - skb_network_header(skb);
+	__be32 old_addr = *addr;
+
+	update_ip_l4_checksum(skb, old_addr, new_addr);
+	addr = (__be32 *)(skb_network_header(skb) + addr_offset);
+	csum_replace4(&ip_hdr(skb)->check, old_addr, new_addr);
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
 	*addr = new_addr;
@@ -358,19 +364,17 @@ static void set_ip_addr(struct sk_buff *skb, struct iphdr *nh,
 static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 				 __be32 addr[4], const __be32 new_addr[4])
 {
-	int transport_len;
-
 	if (l4_proto == NEXTHDR_FRAGMENT)
 		return;
 
-	transport_len = skb->len - skb_transport_offset(skb);
-
 	if (l4_proto == NEXTHDR_TCP) {
-		if (likely(transport_len >= sizeof(struct tcphdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+					       sizeof(struct tcphdr))))
 			inet_proto_csum_replace16(&tcp_hdr(skb)->check, skb,
 						  addr, new_addr, true);
 	} else if (l4_proto == NEXTHDR_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+					       sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -381,7 +385,8 @@ static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 			}
 		}
 	} else if (l4_proto == NEXTHDR_ICMP) {
-		if (likely(transport_len >= sizeof(struct icmp6hdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+					       sizeof(struct icmp6hdr))))
 			inet_proto_csum_replace16(&icmp6_hdr(skb)->icmp6_cksum,
 						  skb, addr, new_addr, true);
 	}
@@ -396,12 +401,19 @@ static void mask_ipv6_addr(const __be32 old[4], const __be32 addr[4],
 	masked[3] = OVS_MASKED(old[3], addr[3], mask[3]);
 }
 
+/* May move the skb head; callers must reload packet pointers. */
 static void set_ipv6_addr(struct sk_buff *skb, u8 l4_proto,
 			  __be32 addr[4], const __be32 new_addr[4],
 			  bool recalculate_csum)
 {
-	if (recalculate_csum)
-		update_ipv6_checksum(skb, l4_proto, addr, new_addr);
+	unsigned int addr_offset = (u8 *)addr - skb_network_header(skb);
+	__be32 old_addr[4];
+
+	if (recalculate_csum) {
+		memcpy(old_addr, addr, sizeof(old_addr));
+		update_ipv6_checksum(skb, l4_proto, old_addr, new_addr);
+		addr = (__be32 *)(skb_network_header(skb) + addr_offset);
+	}
 
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
@@ -479,16 +491,18 @@ static int set_ipv4(struct sk_buff *skb, struct sw_flow_key *flow_key,
 		new_addr = OVS_MASKED(nh->saddr, key->ipv4_src, mask->ipv4_src);
 
 		if (unlikely(new_addr != nh->saddr)) {
-			set_ip_addr(skb, nh, &nh->saddr, new_addr);
+			set_ip_addr(skb, &nh->saddr, new_addr);
 			flow_key->ipv4.addr.src = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_dst) {
 		new_addr = OVS_MASKED(nh->daddr, key->ipv4_dst, mask->ipv4_dst);
 
 		if (unlikely(new_addr != nh->daddr)) {
-			set_ip_addr(skb, nh, &nh->daddr, new_addr);
+			set_ip_addr(skb, &nh->daddr, new_addr);
 			flow_key->ipv4.addr.dst = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_tos) {
@@ -537,6 +551,7 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 				      true);
 			memcpy(&flow_key->ipv6.addr.src, masked,
 			       sizeof(flow_key->ipv6.addr.src));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (is_ipv6_mask_nonzero(mask->ipv6_dst)) {
@@ -559,6 +574,7 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 				      recalc_csum);
 			memcpy(&flow_key->ipv6.addr.dst, masked,
 			       sizeof(flow_key->ipv6.addr.dst));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (mask->ipv6_tclass) {

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.55.0.openai.911.g06873a30d2f3

