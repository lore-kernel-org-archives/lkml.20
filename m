Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660975;
	b=otUfox/XEonJv401dXMaX0TvPhp4KbAwa258oDFu0ChOQoo77C5YiE3hM1B082Kw87Tv
	 cSHHVusiFoe7Z4Wx+/Eu6adP9zjft6xlTUNjiRvnEFPAWVS6mo5/pD7bNHlHvbvYkJNcX
	 rtMnymwgTZ0p2imhWaS/gfDYPaR6c0f6dIfWCYKjFPq1UE8lI7/NmmIHtidwSONfvF1pG
	 AQKITGyWGhQe5R8eZ31M6/MUrwbUvQ+rZtQ5G8qK7IQf6pveOtuYYfCoMSpcMTx95Lmc3
	 IipXSDVIvxJow7r5r3bf/yl7l1OyOP7rAeBHtr/7HrYF4U1H3WzGzZSIVet3SR5miyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
	b=4JCROnetEZPDgTU87grzxFg/PnZBI8CWCR84t6CMUp5h6YUvtcfY/xNBqbN9mJCJQt1q
	 QATtL+ApsQfrh/F3TlOqNswp+O4gBWpvqz6lL1ZC9z7hbFPswt8bWf20rW0Phz4aMC9Db
	 83Cv9em7lacAgVlslnTy1fQkEqA57rj/UbzjFt1mrE1J6MPahNVsCWSgLWtrCbK+8Ou0G
	 YtwQAicHCkLKWqGWdfqAZGdwPrCfXTgUZQOsDkK7W5lRqGOBULLduMOfZ8B9LQbR7fUsZ
	 9h6fqCGLEhI1R9M+uE9UnJUatU5foJQGXv/OKWX9NqadylWTD+sszQOsmK7PSLEItcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NICbofQR;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE30606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE30606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NICbofQR
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1952320a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794660974; x=1795265774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=NICbofQRsUoCCo0rtelZz8jSPL5MoUVsfXwtBkORVxRXVaNBLXDkdU/fKNqtO5PzU4
         KPlMLe+WRz6W3taJeYFH8NUIKOxcrlJdzyxd7SNbBacuxGci52/ERqLnkpd9tBSbcqP+
         dqIccPke+VaM2vOKGM5C14YDI+613R8DdS+rgv56ZsKn8kuDE3+PRusP0Wk/yR8UOAw6
         aothGZYHAhaljJov2ywLuIXZA2EJjSZzRcvHr5D8AKFUM8tZjTmYqWmHJ9bHYMq2zhs7
         iHHdTfSmoLVzPGXDLjyP4xj+R9DVAJzc/7QfzJyuhdttCNobUEfEuH/Kv2IHDEwWMCqP
         JINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660974; x=1795265774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=s6rWQNKv4y8U2Vs0le6OR46CodeQj0c6B2OKzEOx1hx/rIvJmA65GTsGH8h7qoW4Cf
         IYXCcb+GNfL2FTF5tvrDfTQr0QSBxUd37HM8uMV8kI1Bet4rShN3upYSi22p+pQC0Zmf
         5QY5l3glAcHS5KUHXpZQw/xRCX1VHNiTytWixY5BJYWHmnBt2We3kb2FPJLOVWtFj1pL
         4o02HStH7YetmTOxK9eh4A/Dd6vdUkKncEXy0SjANkzOcHiszpNljSxzA9FrWc4eE+ec
         It3QSGA/A6qz/W3ecJt/yfJVk58Or/BbFLwgD9DB32cPA3C1oPOmOy9EJ3NgeBEtw4Uc
         Thng==
X-Forwarded-Encrypted: i=1; AL+hErFAJ83jJ7cMLYfpbrodhUrEU7wiOaQpVa3suWkBgC8G9uhBWjYD8P7+nIbZgW305dxRJplfzqOCq+48bvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Vie1n1SIKq9fjupirEO2PBsOs/vJ0Q2xvVoctIhb+aYAnHGW
	W6jhW9udczSD5tlh+7bpMNJGomoOR5o4bvS5WJk+JDFmiF4Daucxh7F2Eh2ZodqlsBw=
X-Gm-Gg: AYBFou2r3c2rgib0Vb7WMbBhdsJnqmGXhyGsp+WNiVi0NWg0PvPGZSncw0d6P/5s3X3
	8AdpzYc/GHaUU+BnRevLxsUosHRFJRFYHs52rtFRIb+83EMsYK5sawbdQuvwgs4TTR+pyidToCD
	XNjMqjQnQe7wbO7OcMT3NQmvIhmzlvc6e3WI9x6A0Tm3DpW7SpOPh4wg4LIu9mPzfgOqidKUvLi
	uahnCIWpapTvBBWzJAlPXoyMJRxuaHZN8iNuhrnQf7IqeCgXonYwfJ8+nnrEvLkEDd1NwpiYmX7
	Gu5HMZ2c3uW5kqtf+rPeJeUT71s8UMZT5FVOWhhlWC79S/nYQwYjAMSFo9tmK+vJNoFmMA6GAvD
	WhHJg8N0hqb6HkPyNyiQMH62xJFEDTUpLkUML/HCLsZDnqKr8oOPFHv1xTWJll2IgX6NvbaxpTc
	iefOmEu1KWH4D9dFUBKOCgjehom6wjyWIs9sAIZrbX8lQni5Zay5UJ52JCgOaiXHX9RRnEcm22B
	Au7wt6Um2DTIZAAmz4VbUv3juIEjbLVD3zMH3Qo17ScaOkOGZ13XCfjz75a/GPod7JTLpWdhH+z
	OTr5IXyLKOcdFq4QJx6CPd0t2Zx62Y2ck07b84o=
X-Received: by 2002:a17:90b:2c8d:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b1b0d8a4d0mr5854784a91.64.1794660973616;
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c800esm2332710a12.29.2026.11.14.04.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm6: gate the local error on the frame's own socket
Date: Sat, 14 Nov 2026 19:55:52 +0700
Message-ID: <20261114125552.1319352-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

__xfrm6_output() decides to report a too big frame as a local error by
looking at its sk argument, but xfrm_local_error() reports to skb->sk
and dereferences it unchecked.  The two differ for a UDP tunnel: vxlan,
geneve and other udp_tunnel6_xmit_skb() users pass the tunnel socket as
sk, while a frame they forward has no skb->sk.  When such a frame takes
an IPv6 tunnel mode xfrm bundle and exceeds its MTU, xfrm_local_error()
oopses on skb->sk->sk_family in softirq context:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   <IRQ>
   xfrm6_output+0x599/0xae0
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   vxlan_xmit+0x1369/0x6540
   dev_hard_start_xmit+0xe3/0x5b0
   __dev_queue_xmit+0x18e7/0x3550
   ip6_output+0x360/0xec0
   ip6_forward+0x1573/0x35c0

Commit 1620c88887b1 ("xfrm: Fix the usage of skb->sk") changed this
test from skb->sk to sk.  Test skb_to_full_sk(skb) instead, as
xfrm6_tunnel_check_size() already does; commit 6973a21ee73c
("ipv6: xfrm: use full sockets in local error paths") made the IPv6
callees use full sockets the same way.

A frame without a socket then goes to ip6_fragment(), which sends an
ICMPv6 Packet Too Big to the source address of the outer header, the
local tunnel endpoint, and drops the frame, as before 1620c88887b1.  A
caller that passes a NULL sk while skb->sk is set, such as
ip6tunnel_xmit(NULL, ...) in ip6_tunnel.c, takes the local error path
again, also as before that commit.

Fixes: 1620c88887b1 ("xfrm: Fix the usage of skb->sk")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

Notes:
    Tested in virtme-ng on 7e1392a42ea2 (v7.4-rc2+) with KASAN: vxlan over
    an IPv6 ESP tunnel, a forwarded frame above the bundle MTU.
    Unpatched: the oops above.
    Patched: no oops in 3 runs.  A separate run with nstat in the
    forwarding netns shows Ip6FragFails 0->2, Icmp6OutPktTooBigs 0->2 and
    Ip6FragCreates 0->0.
    The reproducer script is available on request.
    
    Not changed here:
    - The xfrm6_local_dontfrag(sk) test in the same function still uses the
      argument.  Its callee xfrm6_local_rxpmtu() returns on a NULL skb->sk
      since 6973a21ee73c, so that mismatch does not oops.
    - iptfs_is_too_big() has the same sk vs skb->sk mismatch (IPv6 oops,
      IPv4 silent drop).  It is left for a separate patch; it was already
      pointed out in two reviews:
      https://lore.kernel.org/r/20260908224856.1591189-1-kuba@kernel.org
      https://lore.kernel.org/r/179369310739.488856.16665150928122536725@kernel.org

 net/ipv6/xfrm6_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 44b221a09a0c..54fcf4b43091 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -95,7 +95,10 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 	} else if (toobig && xfrm6_noneed_fragment(skb)) {
 		skb->ignore_df = 1;
 		goto skip_frag;
-	} else if (!skb->ignore_df && toobig && sk) {
+	} else if (!skb->ignore_df && toobig && skb_to_full_sk(skb)) {
+		/* xfrm_local_error() reports to skb->sk; a forwarded frame
+		 * sent through a UDP tunnel has none, sk is the tunnel's.
+		 */
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0

