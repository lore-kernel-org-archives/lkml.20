Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871265;
	b=hb6zeFzjcNdfnTo4mXjTYlvN5OZxzeKPtXdQ/Pwxt5W59LVpO7j04xYZQC8Wt5o4NytM
	 BAZYD1J9EY7T8kXQTtn3JIjiw5XWReNK/1YHKVBCS6tTBYmI8/198axQmGYG7EwBelAFQ
	 bXIiWj/yGKWTJ6kxHph3mWyKdyl+2OIM9HOnk00MIZMhUkglPAr2zLHec8kz0yRxnsmNq
	 FOocIVY0PwUakpDGIVnCYEkG9gn0OjtQCWj+ghu8K+GMyyXINCkkdJZ/7teyV0cSJAQ7s
	 OytggUOxCsgyUwKlRrEXsCreKv3v6oOVwAk0AxXJEHCbUYiiwsHoHWK82jdBGyS50OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871265;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=C/Y2LuddsDyNRSAMdBdz/n0l5K5m+Ze0flCJFO7KlMA=;
	b=cHrB0Xqbc5cFIOp1cnf6XJiGGpKw2ubFj2tDz7v8XCHPTmM/KN0QPhhQQe5cqmyiIeDA
	 jColkLSoocZrcQPn945fNRB814JZAopG4b2k82o9VkBFcO88wiEnCC30XKU3cPt19CVpz
	 DgrNjxZdCP45cGK/0Ap/S7AOwLuR4Dm/Jff/KIsvdLD1NRg01pdi4z2DRgmX7KaX8npTx
	 P1VqKg4xofnxxhmoQVbfgSLLP8TcCIdpJhGFjpt8W16qCFh8oVtK1dzV3XRiLWXaKuiOC
	 0NmYr4BeJ7V50BDyavTQ3xMtbvn5gUzeNS/33eTWe6HVFdLkYBOeOenKTgxDWNQ9Rog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXFEcZpE;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4CE606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXFEcZpE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HrqW5Nh36zw/NtuHC90IBBkHwA99AGwOxSLsencfKfQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793871262; v=1; x=1794476062;
 b=lXFEcZpEoat8IKmQmJ8tqHbx4WeJanHUacy6QF28P5x2XIX7mUcPuG+dNatf5Syt2aQtDNDZ
 R49GK9Lp2AmaIu8R0XA626hPKA40OcwlQlXX9jBNXpc4JBtE9FSUJs7AsZ9YS87JFLVKyDPeLME
 /ud5RPbh9JLgeNuyLA2O8iVU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f5021da18e182925;
	Thu, 05 Nov 2026 09:34:22 +0000
X-Mizu-Trace-ID: f5021da18e182925
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 05 Nov 2026 17:34:06 +0800
Subject: [PATCH net v2] ipv6: ioam6: do not modify shared tuninfo
 eh.nexthdr
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
Message-Id: <20261105-ipv6_ioam_lock-v2-1-8f0ea30c4ffa@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBREr0L+2pr+Woi68h6GEKhFvmBL2tpIC
 He3oCuXM3kzbwavHWkP52wGpyN5siYFsctAdbW5a0a3lEFwUSDyA6MxFhXZ+lkNVvWsyJELVef
 yxI+QRqPTLb23wysYHaD8lv7VPLQK69WKdeSDddOmjbjBP4P8N0RkyGQrpJLYJKS59NNAxvq9M
 lAuy/IBRYOQMsQAAAA=
X-Change-ID: 20261103-ipv6_ioam_lock-65102ca54908
To: Justin Iurman <justin.iurman@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

ioam6_do_inline() and ioam6_do_encap() stored the next header into
the shared ilwt->tuninfo template and then memcpy()ed it into the
skb. The lwtstate is used from multiple CPUs without locking, so
another packet can overwrite eh.nexthdr between the store and the
memcpy.

The packet can then leave with an HBH nexthdr that does not match its
payload (e.g. TCP labelled as UDP, or a local packet labelled
IPPROTO_IPV6). Set nexthdr on the per-packet Hop-by-Hop copy after
memcpy instead, leave the shared template read-only.

Fixes: 3edede08ff37 ("ipv6: ioam: Support for IOAM injection with lwtunnels")
Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")
Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/netdev/179336082844.3134.1265197633714491521@kernel.org
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
The issue is reported by Sashiko. It was confirmed with concurrent TCP
and UDP traffic through a shared ioam6 inline route on a multi-CPU host.

Without the fix, a packet can leave with an HBH nexthdr that does not
match its payload (e.g. hbh->nexthdr=17 with a TCP segment after the HBH,
or hbh->nexthdr=6 with a UDP segment). With the fix, the same load reports
no HBH/L4 mismatch: nexthdr is written only on the per-packet Hop-by-Hop
header after memcpy, never on the shared tuninfo template.
---
Changes in v2:
- Add one missed Fixes tag. No code change.
- Link to v1: https://patch.msgid.link/20261104-ipv6_ioam_lock-v1-1-4f24c41b261b@kylinos.cn
---
 net/ipv6/ioam6_iptunnel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
index cfb2c41634a0..b23f8a0cbaa9 100644
--- a/net/ipv6/ioam6_iptunnel.c
+++ b/net/ipv6/ioam6_iptunnel.c
@@ -276,12 +276,12 @@ static int ioam6_do_inline(struct net *net, struct sk_buff *skb,
 
 	hdr = ipv6_hdr(skb);
 	memmove(hdr, oldhdr, sizeof(*oldhdr));
-	tuninfo->eh.nexthdr = hdr->nexthdr;
 
 	skb_set_transport_header(skb, sizeof(*hdr));
 	skb_postpush_rcsum(skb, hdr, sizeof(*hdr) + hdrlen);
 
 	memcpy(skb_transport_header(skb), (u8 *)tuninfo, hdrlen);
+	((struct ipv6_opt_hdr *)skb_transport_header(skb))->nexthdr = hdr->nexthdr;
 
 	hdr->nexthdr = NEXTHDR_HOP;
 	hdr->payload_len = cpu_to_be16(skb->len - sizeof(*hdr));
@@ -314,8 +314,8 @@ static int ioam6_do_encap(struct net *net, struct sk_buff *skb,
 	skb_mac_header_rebuild(skb);
 	skb_set_transport_header(skb, sizeof(*hdr));
 
-	tuninfo->eh.nexthdr = NEXTHDR_IPV6;
 	memcpy(skb_transport_header(skb), (u8 *)tuninfo, hdrlen);
+	((struct ipv6_opt_hdr *)skb_transport_header(skb))->nexthdr = NEXTHDR_IPV6;
 
 	hdr = ipv6_hdr(skb);
 	memcpy(hdr, inner_hdr, sizeof(*hdr));

---
base-commit: c3e67bd82b9b9b1a5118f09a429ccefe2aab0741
change-id: 20261103-ipv6_ioam_lock-65102ca54908

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

