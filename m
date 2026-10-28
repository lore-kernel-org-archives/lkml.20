Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166364;
	b=CMrqv1nYGZKrRi4goh31VajbOEXBCd5xGs3oYTuYi2IkFOJm2ceifvDyYLWRwyHbtL9w
	 BjAUN4Diap7kvxmU9NiDFvn2r8oZH6n7KBm19Yx397IQSnZ+CID9ytr5vxQ7kcovCJ8CV
	 zgMIGzK47G+99xehFMHDFXXx07dHo9duJP7hNPTAJ+dezXvRy+uEJn6EwVozLeYuxMWAq
	 zXPcbopBEXGc81hLC0bfKmDs7GDMOhOLe59Kv4OZAyl8iSHGdyhGGGa6OjQllU+OHI5JW
	 LZOFJ77CPAb6X/XMYk/5Ha5guTtEaUTAN0Nw0r0B70KPGOY/LaTj6lWeuCb+qiVGHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166364;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kjFfc0DyBz/PhoEfh4CFGhSYK0Li8U1aA84+IyfHCTM=;
	b=uhSJTWZyyLhvc1rnJJj4CDlwYxSQkTHoCHCTqL+F0hLMbvG4DlkYIcdUiSjEyjfLPO/Y
	 A2uT9TvPYi0LjPdse9sJ+/dOcpjXplWBWsEYQwYe0NOnhD9VAFahNmjUqO2nsOIDNud7T
	 QLJmrJCTbkp5YRT8vV4OmvsdOzKhZpZNj8Yhc/BEZzIQzBaxPa58OLBvFc66rmBFbKmK1
	 XwsFQn3WO+mH2w0Sg4lv7nDaNqPdIUfdxD1Od49hvJQyEYf+tbe9s//SrFc8fJJeKXt72
	 a1VgFItddpOUMWMUtgQcJYgrXADiEB8qv0LczoFxh+UcrVCAQDxvQLLTnIAyn0qXuUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VOw+vpTk;
	arc=none smtp.remote-ip=91.218.175.70
Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB15606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VOw+vpTk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q7cdOCTYN1OsRVYA/tnnim8OAfOBZPX8C+UEQBNvTwM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793166361; v=1; x=1793771161;
 b=VOw+vpTkTqI+uMYqdT+N+xUSyXCGL5KMwWJdAteFa17ZDaueyU34Vvw9pe7Vo6RwUD7apEy2
 +L9lTbVsNd/BBrDsSgMI95qCgNMN02kmAzQbT59mcv7O7P1DeRrGBMMV/FiPPnTr2nvUcFcsbwP
 pCQ92n+6/IrJhnNohtJXAEwo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1372610438f61ffd;
	Wed, 28 Oct 2026 05:46:01 +0000
X-Mizu-Trace-ID: 1372610438f61ffd
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 28 Oct 2026 13:45:30 +0800
Subject: [PATCH 2/3] ipv6: ioam6: use transformed packet nexthdr for ECMP
 re-lookup
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
Message-Id: <20261028-ipv6_ioam_ecmp-v1-2-9b6715b6f4c0@kylinos.cn>
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

When the ioam6 output path misses the destination cache, it re-looks
up the route for the transformed packet. Under the default hash
policy 0 that lookup hashed NEXTHDR_HOP rather than the nexthdr the
identical packet without IOAM would carry, so it could pick a
different ECMP sibling.

Use the Hop-by-Hop nexthdr already stored by do_inline()/do_encap()
(eh.nexthdr) for the re-lookup, and precompute the multipath hash
from the packet: ip6_route_output() lookups carry no skb, so without
this ICMPv6 errors would stop hashing their quoted flow and L4 hash
policy packets would lose their ports.

Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 net/ipv6/ioam6_iptunnel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
index cfb2c41634a0..713e625bfa3a 100644
--- a/net/ipv6/ioam6_iptunnel.c
+++ b/net/ipv6/ioam6_iptunnel.c
@@ -13,6 +13,7 @@
 #include <linux/ioam6.h>
 #include <linux/ioam6_iptunnel.h>
 #include <net/dst.h>
+#include <net/ip6_route.h>
 #include <net/sock.h>
 #include <net/lwtunnel.h>
 #include <net/ioam6.h>
@@ -412,7 +413,8 @@ static int ioam6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 		fl6.saddr = hdr->saddr;
 		fl6.flowlabel = ip6_flowinfo(hdr);
 		fl6.flowi6_mark = skb->mark;
-		fl6.flowi6_proto = hdr->nexthdr;
+		fl6.flowi6_proto = ilwt->tuninfo.eh.nexthdr;
+		fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);
 
 		dst = ip6_route_output(net, NULL, &fl6);
 		if (dst->error) {

-- 
2.56.0

