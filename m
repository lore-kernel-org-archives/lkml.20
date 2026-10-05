Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFC31B130
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178320; cv=none; b=IvR4mX2uzFrxeiZfAmAxG3rEyhQ2+2AwGzGoYwSwZU6zZNPhpJj7zx13tQwiKJWixAy1ZWRgDXuoqXwTvAhOyEDfo+kFfC8lt7XVpY7GXEIo2lPw6Gto6R3aZ1mgLj/P+sHuZZaC/l0WeoJg7uRa6aFsPWf9PNemMMbVkaPUzQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178320; c=relaxed/simple;
	bh=w1AU6g65zu16iPcWxPf1T5Zy+nRGvXgJVdBYyvWwTJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqR/BxOt05WbiH+6ijf0CzMBSG/UcOrQ3So7nSG3zuAjB//JR0KPtI9dCqPac4j6dzUPOaDHPBoX2C6Xi50Z9jco1CwoF531SbX7CFOn5lv98A+Z5W1yXBnJnMTP77iq+XqTbpzyPL8s2DjDk/JSsm3I24ELJjjMjYEbKrgfsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eut5GczQ; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eut5GczQ"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7e7717676so289499a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791178319; x=1791783119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbaBJP1Y6rIzs9mS+9NicAQDid/y2eJWfZoQJnhCAQ8=;
        b=eut5GczQb1borskkHC9KjejdHgKsmAkVW7HL8nimz/+FfybLfz1pP7Xx/RSTtTVORA
         OEgFLzq0kLkffc658E47Rc4wi2sll1s+zYwTnTX7awc5FfotD8C4btrEqoM3Z8iKnvk0
         wGYYQ7pQbI+xWQdewG0IP2PZdeY7IxBi1rAQIQNovCjOnD2jarcFMB5jxqp+RrTCirAu
         AfNxppRmKWpFNkpJLgOOMn8VNeyH81p+cnWsWshFBvoDWAA3Tl/SqNj9+1TMbXWQoF/m
         LiugdrS0wflW6Re+4XreEnt0Y+VlMcQ9UqmCZ1EfrHtKXPe15QAiSE7GZTbLz6zCQgqZ
         nmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791178319; x=1791783119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbaBJP1Y6rIzs9mS+9NicAQDid/y2eJWfZoQJnhCAQ8=;
        b=cFeplCQYTbXVtD7xkwqZV95hQCL7N33CkERq0Z8VwkFN7wSTJJnnDGXl1JAmLVU2aD
         N2WZF7ZaHOoLgk1o6Zs0vVhMaXntBFTKHwJPYYqz7aCB2dwGdipKre0kl+OB/V0mtdu+
         GTK5uf9jqJU+DMoFzsFY+cPoIH6LnDddKsUamMFDw6bLtu2bywcsPZ1yeAqrjN36NAxp
         +ufsrw497Wd+x+kV4vVn/p+3WGLEs5dgH3nS4SwOB8GZitvJx5Ome/JPNIY9qIZXtrJY
         +UAv3G2J36wNAuaGANbK/2ya79m+qpcq06G+1Pbde8W3EKID0e/8MJnPUMPwZpTLjpT+
         ZLYA==
X-Forwarded-Encrypted: i=1; AKwUvBw04SsTmhKbXuL7x3GODgSBF2vNwB3dFWvLSuZf04R9oDUQKaESmg8oJ4Y47MJnQrjIdJM/slDAvWQ++bE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJe2GBCbiFp+AyOnH7eqVOXxMYlA5xXrkVQQeV/PpNH1M2kGP4
	UbLwrYBD3LsmZeBlMqYrBOjMCTEdbfXBa8qYQuESgpC7l5iqOTndRTPG
X-Gm-Gg: AYBFou2IzTAs7f70mMyUA0PM7S977sgokHD39eHJyH6maxjHfQuzVY1da28zPbQ9HGJ
	ynpLSCfRiqCAmzI1kvWzEYloZ5JUmECXZCqOZWCRQiLjJGk24Ua8OFSor/4+DOX2WKpNTrDphlO
	brVi1Xyh447QKipMisnu4gBPFxKbG8a0LIcy/5JgiBtMYZrP+ZNSvN0G5ymx4EyUSe3S+WgX3mc
	Z65S5OqKbub+Z9k0z9EINfwu++gVVaQI/OvNZcrpUGPz7P4OP0xsX4kqFkeNDyrWwhjGT1dmYQ2
	FgrHKnqIdN+ASbN0iNPNfTvJbOgG1MmNkfTH2/YFXO9aOAh1z20jYrl3gg/DxLY75KQZO7j68Vf
	DXmcpIbxzVaILLtyav10Pdezff1iZPuysE5n3ZEj5FLNl6XXm076xqmj/c2j1hGQ/BSdL+z/xIC
	yvdfa4HuN9/mO/pGg8Ff6J+3Urube8t0Yi4RilGAm+0VKYZPccehyxBCwxYE78tq+VP6+ToE4hC
	MA7qp9Y
X-Received: by 2002:a17:90b:3ec4:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a6ce6e7c05mr7678297a91.14.1791178318604;
        Sun, 04 Oct 2026 22:31:58 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d59f1cdsm9419306a91.0.2026.10.04.22.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 22:31:58 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Mon, 05 Oct 2026 14:31:53 +0900
Subject: [PATCH net-next 1/2] seg6: skip the route refcount in
 seg6_lookup_any_nexthop()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-seg6-lookup-noref-v1-1-092e84774e80@gmail.com>
References: <20261005-seg6-lookup-noref-v1-0-092e84774e80@gmail.com>
In-Reply-To: <20261005-seg6-lookup-noref-v1-0-092e84774e80@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=w1AU6g65zu16iPcWxPf1T5Zy+nRGvXgJVdBYyvWwTJk=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqwzZJh8DOcMbZNIqKDpz+ahxbhv/BXOYnUDneo
 TCKLtZfsh6JAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCasM2SQAKCRAq19F1Kl0b
 TXo2EACKWn8NsBfLQ6ySDolEihbdyQDuUDwUuwY2ZD0LZYfCYIPkwLEBNfbwa5odpRkJfYFk60W
 2K/i0EbmTiQYJeMNyh9Jt/BqTVjyfAG8qwXQBj4T48CesdsZn4ZH+DkDtlOr8EynAoBTaT8MiTW
 OWrBZzHinKEGPim25EYPEVTNX168kwRAjVZTsC1I02H6ZicUFBF6oUZb05BTZg/6RrM2iV9t2Vj
 u6h0XnZ5TqtuktmhxrAaD14inkdWHQ+z8sHz9PKSgg5YqwbrAuR4voUE5sCO93GsOxywoTGbXEm
 oz9wlPRf2cjkurBrfv92qJJBkGiRMGYlYBt7fd/LjADZ7smfCDPl9+b01TKUiWmnhDkQ8IMmsBh
 NXhRGWyMm2sDJR1OcBLpybKKhNA/omP8kgfBOYfJBGOyLKa2vQBzF1cXmg7aUwprcwxGUigH4R1
 Obuc/rv0F+WHyiY4W/dkxegZqqVqieoQsZgndt/v/6dyxICyHFKFSdlEWV4CgDrlLn6vQwRefDy
 JcffhH0JYGMfjGrSMlNpOLgfNujQTsCIyyLCkurzAZOo8Wr1Car2Du1TbCgiyvE5/AaD3T4Lu54
 s/+is/t8BMZ9DONT/USHwvYc0wDZeqCgcxp/aJ/hEbyNLD9rzbRMuAIj4XwdXYXnmjXW663UOcY
 cADgUgHpoaAajqw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

ip6_route_input() attaches the input route to the skb without taking a
reference, relying on the RCU read-side section of the receive path.
seg6_lookup_any_nexthop() is called from that same section, either
directly from the seg6local input handler or from a netfilter okfn,
but still takes and drops a route reference for every packet.

Look the route up with RT6_LOOKUP_F_DST_NOREF, as ip6_route_input()
does, for the input and table lookups.

Throughput at 0.5% packet loss of 94-byte End packets (two-segment
SRH, no payload), spread by RSS on an ixgbe 82599ES across two 2.30 GHz
Xeon E5-2650 v3 with 10 cores each, offered by TRex and binary-searched
over 10 runs of 10 s, in Mpps:

  queues  cores                   before   after
  1       1                        0.735   0.770  (+4.8%)
  10      10 on the NIC's socket   6.468   6.976  (+7.9%)
  16      10 + 6 on two sockets    6.931  10.128  (+46.1%)

With the default rules, fib6_rule_lookup() tries the local table
first, and the miss takes and drops a reference on ip6_null_entry,
one route shared by every CPU.  At 16 queues that cache line bounces
between the sockets, and ip6_hold_safe() and dst_release() together
take more than a third of the cycles.

Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_local.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 0c3d1be7f129..4bde3669d0dd 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -342,6 +342,7 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		fl6.flowi6_flags = FLOWI_FLAG_KNOWN_NH;
 
 	if (!tbl_id && !oif) {
+		flags |= RT6_LOOKUP_F_DST_NOREF;
 		dst = ip6_route_input_lookup(net, skb->dev, &fl6, skb, flags);
 	} else if (tbl_id) {
 		struct fib6_table *table;
@@ -350,6 +351,7 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		if (!table)
 			goto out;
 
+		flags |= RT6_LOOKUP_F_DST_NOREF;
 		rt = ip6_pol_route(net, table, oif, &fl6, skb, flags);
 		dst = &rt->dst;
 	} else {
@@ -363,7 +365,7 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		dev_flags |= IFF_LOOPBACK;
 
 	if (dst && (dst_dev(dst)->flags & dev_flags) && !dst->error) {
-		dst_release(dst);
+		ip6_rt_put_flags(dst_rt6_info(dst), flags);
 		dst = NULL;
 	}
 
@@ -372,10 +374,14 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		rt = net->ipv6.ip6_blk_hole_entry;
 		dst = &rt->dst;
 		dst_hold(dst);
+		flags &= ~RT6_LOOKUP_F_DST_NOREF;
 	}
 
 	skb_dst_drop(skb);
-	skb_dst_set(skb, dst);
+	if ((flags & RT6_LOOKUP_F_DST_NOREF) && !dst->rt_uncached_list)
+		skb_dst_set_noref(skb, dst);
+	else
+		skb_dst_set(skb, dst);
 	return dst->error;
 }
 

-- 
2.50.1

