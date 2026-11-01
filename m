Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551363;
	b=C6S9JsLAfIWj6TkRq/zvwHNt5VYEH9TnaBHX0XTaK/zSXkttCYnPx1a8kgco2JAWk/t4
	 dBAlyDHVjxsLTJNL0cUHSk4YxALMiLQFJIepos/F2GwEUnofmupms3l60MZehzEcJXJbR
	 qqnmGhshKn+qf7Tvi29FNxJU37o+0ZL2NMfoRvDXfhzO8rT6zHxYZMSRPEYYYgaMqNswN
	 ZK1Kr4kcJ4MiCB1Bk7VR6yMZzMhOG3DTFxepgLp0Etwu8OsHcvP8ZVsM0sTON21j7lPCh
	 n3EVm45esANA6OkjHAT2FSc6vO49ZA8CO2st4fr67Z3JQMsxBI3B+ILTWOos5HOmzew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/WNAnBkrbcrEaDn+R+l43ZtITCPYDHBaXxtP7LcdE9A=;
	b=Z9byOB7RU1qdBB1jp3fvz4MXMFu5HdEeRu1ee/2Zz9peksNtLTB5BhFkY/gsLu0ghk7d
	 1dfeiD11C974803pVPFeZfsEJb7YSdJPypQ6luwEQ+7cnTK2ObXrWoceqxoDm/nMN+sa+
	 JpjOupupaHZGGQlWUQrrggijVA8rEeZ42BkHE2AZT7j//P6/wgmWJOWXHhgOkrosUQNgn
	 oQBWl41q0zze0itVF3iLy7tjMt49maNyNckwObTMQLwAY/JUMVUtN6kI6NUFyI/wdgvUW
	 m5JjBN3NcSpEZC8GNSiNGAQr4afd4N80F+cBXx8gHkYfc4qK9jyQwCmF9sBbs7BWX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="rqw60U8/";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736760A260F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A736760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rqw60U8/
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so2364425a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551358; x=1794156158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WNAnBkrbcrEaDn+R+l43ZtITCPYDHBaXxtP7LcdE9A=;
        b=rqw60U8/IjWMUYGZp3rGQovjPuSBBIYlg+7Lc3yabzijOBiIqmAASC3rLs2LmMpKVY
         k60DNa7TR0hpQ+J1DJfyuz2v+QkRX2vRZrC0961PtLqU8ktNbmVi+Nzx5TMT5m8wg+DB
         OWoe9zWHx6XEfzxLz8SlJjWgYcgbkJ2/pTtucC0gXseKwYgEheH1soB7h5Q8xApaqCMY
         l0m4YLA25C/cGGbE+ZvgPUYe66YkHmGgKsq+2gffTQIXuw4ABarfaNRsIb1s2ZeN40Ny
         NOZVHKPQs7+II8fcs4sSzDFCB7nQxCwNsylVN1cFblrtuzuh/RDGfot5vgSSswOLbGV6
         fukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551358; x=1794156158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WNAnBkrbcrEaDn+R+l43ZtITCPYDHBaXxtP7LcdE9A=;
        b=Sar5b1u4QIlrgAIv/ACry96VNywIOABb/wQnQ8UFWx8Xc/19gOJWl0KcR8IkifedJr
         dzri9E+yKNtOvhJUfHIDda2Gp/UB2a9p1dE61ci7YVq+c3gZBEcUbOvhHxDYv9VuOGZO
         dOjWx56MYJ4qlM0chlPblD2H/24vFsJ0rOGqTcEJvHB9i8wHDvNI2/SHPKIGeuzr8yX2
         KvxL2pbfXyS1TTijf5U/xYRfGm6eJZYWs8ThusA1wfNK/aM2LoZFDmxaFaUDHsh/wspp
         Zr8dRTlMeWckur0kHdCvm0had/XxGFw0rRJGLiqAJpmjyjuUl84Yhx32Qe9g1qzwCHUO
         LYoA==
X-Forwarded-Encrypted: i=1; AKwUvBzWAGYSaX/uovNx09Gm4UEdb1isdpRwXfzacBASbwK92elYLDl7goXTCBPyJ0Uy0naqFYm9hh5Yn7ncnjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgdUgx8tIc5AaKgmDxudcIPIqJavAKL4nWGqx9pK2aH5WX63A7
	YguHPa11q0o4H1xghZFgLmrVb5+40BvezFnZ3QK1W3tS2BDqycHMwokkOXSRL2hyZw==
X-Gm-Gg: AYBFou2F3lPusznUqjS/oOa3mcaAdZx1nlh3K2AjGyqScKwZLe6ht8YddYf4+EkS6SW
	NnB1uPVo4mzpAlERekB7S4tIOW8Qw4//vSUZxLI62jkg/jwANDGwshM9X7ed4DK/RcV4/uLw55O
	bE0zM0is1WK6tMsNn+ne2k48wjmyJcRDhswg3cVluqh5xQ/1aE7nuXJW93Pm2QgxnFD9PKqymaI
	AsvEqbdKeUJ+1hrXRg2DZb2EuQnNFSCdA+JhNWsX9+B1yOet9PU73AaXdYm8pjhbo7hEXMheLQO
	DvUbP6PGmK7THUnAiS3I2AmH2n9JWDZ8uDGaVFkeQctYLUAkAbJR4Pruy+3lBjmtD42DFjpiWWm
	DXtadXwrDO1LrtDfRVa9cKRDy7rPeagRpKEr17QZdCx7MBNYY88H2F9yhmqOSHUM/Rdv5Ezk7zc
	jIZn9p3Evsa2al/Zd9bQ52viBn2CxZrmg4dWakRvFTUxXvH1JYdLJrt6WPXMYbj5Mf/O2+ruxEj
	jb51aCxqaB9Pjoc1mUpoIde0FTbl+sxLERS5vugonHL1MpyuJZRgthuaPZShYBZUO9xG1LtJ4xx
	BYiv8yO4lzP/TfweHV7G0vHtBBRa09XoJ8RnVdCKJraWjXoJyoVzoGhOxHyUufgdfKdpHP2fvtX
	FcjlPzew8kcMA5P9oXZd9HXynhocLMW/1qDhP82T125AXx+yNOuJ/5GQjf2jTj8k8AHdYTj+a6K
	44dBZSz8IdOOYpE8vdvVdHdn4ma2MpZn3cfCjSag2iAvJibYvHq4pFt1VQVHDBDkGpU8l/epPGF
	lyj6F/MZkRwchptEiiBWlk+F1fYh2FCUt+RyQoVPuxfFEzyMgvKQtgXktSaVrnxOHf1Hwy+/ANg
	fQd+QBHOc7lSMHrj0EM=
X-Received: by 2002:a17:907:9283:b0:c41:a5da:1511 with SMTP id a640c23a62f3a-c4ca7a88ad4mr596253366b.25.1793551357608;
        Sun, 01 Nov 2026 08:42:37 -0800 (PST)
Received: from Desktop (p54aff88b.dip0.t-ipconnect.de. [84.175.248.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm296622966b.33.2026.11.01.08.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sun,  1 Nov 2026 17:42:32 +0100
Message-ID: <3733295a358d34df6220ea924d2b710ca537cf6d.1792838740.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792838740.git.julius@bairaktaris.de>
References: <cover.1792838740.git.julius@bairaktaris.de>
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

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 98e38839f8ccb..1fb728fb15741 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1932,6 +1932,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1964,7 +1965,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst);
+	if (skb->len + encap > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && mtu > encap &&
+	      skb_gso_validate_network_len(skb, mtu - encap))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

