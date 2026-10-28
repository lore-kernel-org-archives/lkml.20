Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166354;
	b=e9d4szZmWRuIDzpiAxfkdiXud7ql5B9DwP8h2BXFuZhaqHNHarBXpkCv3tkjfjkcu3jg
	 b8/3OolenJ/0G/nbyRIgcpk5AemDiqOvqMRkdfNmZn+XyVEe/pZQKNVMUCHMar9zudgbe
	 Rs5EgOvL+iA66zm0yLnPcjiK5PMxgCM8KrSr40J9KdGjlPl0lkqdBW0M1YhkSzfZXLfk6
	 8iwzYezQSj1qoovSgt8lxnGyEcCJyt6jtKOxjit43xzw/caQ9M+Oc+No7FVmIUcGwe3/m
	 +Xb9yWIBNRJoZ4x/t/Y/TWupEMOQo+haWqxKJFeIGTZGTvKS++d2lW7+3UjAcdzVsjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166354;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=yj7L+72PD7aHrJWB0DLLMVVXMwai780qHbsLZ1S6gHU=;
	b=mMV53IKr7cwgrP8xgfrm0UuzMB8g5R5EeEMebSQ0uhi1muCW7Cbg+A1mRLS9+G5jU17w
	 cZt9lFo99mx/ioKPKbt2MRv+4P1JFf6yvMsqbdihQdLZlwPenhGj6dgP82KCjd+PlGet2
	 H9isdOunYVbAMXXDZqVPtkczKEvYvSk9H1o4ubd5k6Vy91o9X3pDYSxqKopClNxYLTndZ
	 32804+/Lhu9UNlfKJDo6OEE01mI30Mp5Xk5TmvvkvfB9IPqlPxczUjpp4Jw6u0mCIqaIf
	 X+iCsgroLb4uGZTyYBCdesBTDzyT/GdsWqWQFpdeH7Kw017Eq/4RMPsBLFuNO7MPqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ApDW2Kbx;
	arc=none smtp.remote-ip=91.218.175.62
Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31348606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31348606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ApDW2Kbx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j0Qu1XgRq35aA+BKu/TxzJV9xpTE48zIi0YFSiTzRe8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793166351; v=1; x=1793771151;
 b=ApDW2KbxiQocrJNSxh9bTjKHZUsWi9oilR/VfnesSl3GG44IrYzJ28fzpgtjLfDNckD9ofOE
 ETPBfp5Y3b6jcX0bobwftrRVVkhSqRVNybsdUIqjkMHGWiXbu1wgVlLA+lcCrArYN+Pj04q3MR8
 aMb24kkqKJ6Qt43DycfbTfF8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id dc5dc47eab3f402b;
	Wed, 28 Oct 2026 05:45:51 +0000
X-Mizu-Trace-ID: dc5dc47eab3f402b
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 28 Oct 2026 13:45:29 +0800
Subject: [PATCH 1/3] ipv6: route: consider IOAM options in ECMP hash policy
 0
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
Message-Id: <20261028-ipv6_ioam_ecmp-v1-1-9b6715b6f4c0@kylinos.cn>
References: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
In-Reply-To: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

RFC 9486 (C2) requires that the ECMP hash of a packet carrying IOAM
options is the same as the hash of the identical packet without them.

The default multipath hash policy (0) hashes basic.ip_proto, which
ip6_multipath_l3_keys() fills from the raw IPv6 nexthdr. An IOAM
Hop-by-Hop option is inserted ahead of the original next header, so a
transit router sees NEXTHDR_HOP (0) instead of e.g. IPPROTO_TCP and
may pick a different ECMP sibling than for the same packet without
IOAM.

Recover the nexthdr the packet would have had if its Hop-by-Hop
header carried only IOAM options (0x31, and 0x11 for DEX) plus
padding, and use it for the policy-0 key and for the ICMPv6-error
check, so errors that quote a flow keep hashing that flow. Any other
Hop-by-Hop option (Router Alert, Jumbo, ...) keeps hashing exactly as
before. The walk only runs for the rare nexthdr == NEXTHDR_HOP case
and is safe: ipv6_parse_hopopts() has already pulled and validated
the header before routing. ICMPv6-quoted inner headers are not
walked: they are payload and may be truncated.

Fixes: 3edede08ff37 ("ipv6: ioam: Support for IOAM injection with lwtunnels")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
The ECMP path with and without IOAM is verified by
tools/testing/selftests/net/ioam6_ecmp.sh in the next patch.
---
 include/uapi/linux/in6.h |  1 +
 net/ipv6/route.c         | 67 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/in6.h b/include/uapi/linux/in6.h
index 5a47339ef7d7..2e66dc37e1e5 100644
--- a/include/uapi/linux/in6.h
+++ b/include/uapi/linux/in6.h
@@ -145,6 +145,7 @@ struct in6_flowlabel_req {
 #define IPV6_TLV_PADN		1
 #define IPV6_TLV_ROUTERALERT	5
 #define IPV6_TLV_CALIPSO	7	/* RFC 5570 */
+#define IPV6_TLV_IOAM_DEX	17	/* RFC 9486 */
 #define IPV6_TLV_IOAM		49	/* RFC 9486 */
 #define IPV6_TLV_JUMBO		194
 #define IPV6_TLV_HAO		201	/* home address option */
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 94e5ef1c4f83..d0761f05d326 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2342,6 +2342,60 @@ struct dst_entry *ip6_route_input_lookup(struct net *net,
 }
 EXPORT_SYMBOL_GPL(ip6_route_input_lookup);
 
+/* RFC 9486 (C2) requires that the ECMP hash of a packet carrying IOAM
+ * options is the same as the hash of the identical packet without them.
+ * Recover the nexthdr if its Hop-by-Hop header carried only IOAM options
+ * and padding, every other packet is hashed exactly as before.
+ */
+static u8 ip6_nexthdr_without_ioam(const struct sk_buff *skb,
+				   const struct ipv6hdr *iph)
+{
+	const struct ipv6_opt_hdr *hhdr;
+	struct ipv6_opt_hdr hbuf;
+	bool has_ioam = false;
+	u8 obuf[2], *opt;
+	int off, len, i;
+
+	if (iph->nexthdr != NEXTHDR_HOP)
+		return iph->nexthdr;
+
+	/* The Hop-by-Hop header was already pulled and validated by
+	 * ipv6_parse_hopopts() before routing, so this walk is safe.
+	 */
+	off = sizeof(*iph);
+	hhdr = skb_header_pointer(skb, off, sizeof(hbuf), &hbuf);
+	if (!hhdr)
+		return iph->nexthdr;
+
+	len = (hhdr->hdrlen + 1) << 3;
+
+	for (i = 2; i < len; ) {
+		opt = skb_header_pointer(skb, off + i, sizeof(obuf), obuf);
+		if (!opt)
+			return iph->nexthdr;
+		if (opt[0] == IPV6_TLV_PAD1) {
+			i++;
+			continue;
+		}
+		if (opt[0] == IPV6_TLV_PADN) {
+			i += opt[1] + 2;
+			continue;
+		}
+		if (opt[0] != IPV6_TLV_IOAM && opt[0] != IPV6_TLV_IOAM_DEX)
+			return iph->nexthdr;
+
+		has_ioam = true;
+
+		/* Keep searching for the next TLV. As long as non-IOAM
+		 * options (Router Alert, Jumbo, etc.) exist in the HBH
+		 * header, we should preserve the original NEXTHDR_HOP.
+		 */
+		i += opt[1] + 2;
+	}
+
+	return has_ioam ? hhdr->nexthdr : iph->nexthdr;
+}
+
 static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 				  struct flow_keys *keys,
 				  struct flow_keys *flkeys)
@@ -2353,8 +2407,10 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 	const struct icmp6hdr *icmph;
 	struct ipv6hdr _inner_iph;
 	struct icmp6hdr _icmph;
+	u8 nexthdr;
 
-	if (likely(outer_iph->nexthdr != IPPROTO_ICMPV6))
+	nexthdr = ip6_nexthdr_without_ioam(skb, outer_iph);
+	if (likely(nexthdr != IPPROTO_ICMPV6))
 		goto out;
 
 	icmph = skb_header_pointer(skb, skb_transport_offset(skb),
@@ -2383,7 +2439,14 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
 		keys->addrs.v6addrs.src = key_iph->saddr;
 		keys->addrs.v6addrs.dst = key_iph->daddr;
 		keys->tags.flow_label = ip6_flowlabel(key_iph);
-		keys->basic.ip_proto = key_iph->nexthdr;
+		/* Only for the outer header: an ICMPv6-quoted inner header
+		 * is payload, and its (possibly truncated) extension
+		 * headers must not be walked here.
+		 */
+		if (key_iph == outer_iph)
+			keys->basic.ip_proto = nexthdr;
+		else
+			keys->basic.ip_proto = key_iph->nexthdr;
 	}
 }
 

-- 
2.56.0

