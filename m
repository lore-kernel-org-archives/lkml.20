Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183021;
	b=nPFUj+44WWTUa8Ma2PGb8Zt0/YD7vPGOlxTvnOhg0akL/ixDOyDrJuuxH5Vsy/pfoHaz
	 m/Kl9qRDgNO18rfaSVOhNc6acBWKIXZKadkpr0pbpA8ZEcSuvvKzURCVuYqCwywCs6lzz
	 00wpjUwd2dzzN/bJ+oEOJRcXko1xyr/tUMfhM/YXFYA1mKacSSoxNszJDqDAfIgPswYpv
	 aIXeYQNrjeXqs2uBcdu30cZINO5uMse/Oo40ZILdPIcAGfFkyDYnEsbuin+w9X+AtsCgv
	 L0lD1BiZmfGUpfj3vPK6p2+Y2vU2NsiwRYXcowf1nMRH7n9SzEKLwYAvsjvFC8Qft5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
	b=VYAWcA5BdU0pTcO/rHYwMl41LfgKq2l6MnuAjVENwEu5e36SEhYljcCwS54fz+vVjXRk
	 6p9IBrhjFhnmPxU9ouRukGi/Nw5VQ14uQExpGT4tuOCLXnWEnbYMdSpbuw3cTewRpuav6
	 KPcT+3fnZsZrBZQqk4zqJYfyuKAklv4RguUrj5hJTZHENV/E3Vr+TBmqo0mmzuGp7IM8q
	 AAMl+6VdnTctaW2VroQxvZ/bwSpLes71sWlxX+PXZFnTFk6xFtWjs9cbb/0eOB5TVIQL9
	 iBqV6RKkI9G8/q3gbq4MmAcLPvEv597R49DAMq/DhUEJI3Qps7qZv/breydLI9m5/9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tlDDlaP2;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BF606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tlDDlaP2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so597623eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183020; x=1794787820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
        b=tlDDlaP2b8axvYSSSWSScnLGrcYjVXQFVkpd5vmVQiLi7qvhmlAg5SG+zXrya5xEYQ
         uoCX2PH0tT1DPHx+BVRvwdVbX6ScpiuLmAeLdqsuBg/mYfK332d0pt4lw1m7z1H96Pj9
         Eax4E0PZ1qe9xWH6A8jXNFJLX8u116+li7nAKxhHQYyWo2UXUUT5ERmjkVwSIPtM5BBU
         rIpFvXLcyND3rN+FIqo01BUhSS2IklIGXQM+blCYV1ZPk7dDLomqwWpBvjYsoLXUDWhB
         BOBq5YzA7vR/fwwG9Tuc2+eXMHCzBrag/1p87lrUbK4kIzewsmnzChsjRZNwY0tLUg3L
         C0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183020; x=1794787820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
        b=C6QnZc3qcXd7wu5sdYxdtUxxfX0ShF7o3TGy0VMlPzqgyQbNkHunlBGqgcKOKmupb5
         pPPJUNQld4WB+IUsmrI3dCKnE2jSA+M8aKnskAFuDanpYV3NEbyCyulXj6FaMMBiigeh
         uCfMSdkXwd+fvWphRgpnilTrpILa4Xybm86Wx+jrSrW09Sb9TIaJa4ulg45XFQJwx/+F
         v3FwBySaEIxKQZvkHEUuaMdn795wKrk54kbtS8eGV1NjskW3rojGkMKlYwRbiiJ9mrhF
         eZIzjytJokQTRSpzzS8A/dpJK3mHSp9GRxizFs169V+UDVbRIswcQHeKiOFf1yStSeyv
         1EVQ==
X-Forwarded-Encrypted: i=1; AL+hErH+7tsQNTMdzZoUuBkancNyztvGjzuabtAdR46HPpEw+gJxeduMG21lVhPt0qSFReFklVrjbXYBl3roWy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S7ZM6bUjfPmQn1mxCh405DL75Z5y6kOBw2ILcuasXcIclyHY/
	0TrTJL8nFweB2aiEUOiHyHsxpBjMYB9byhvcJgV2cIH6Rrl2Rv94av2E
X-Gm-Gg: AYBFou2bz5vaSif4F5HhCTLlB86Iz2M3Q263gnvOB0eznl9YpCAYqd0eCezizYAAZ8Q
	IoeEQiXgEFIByyrne3ttNXwuoZBf2g4kgn45Qgw6KQfvSqqEZwNbkDpAqWxWzS9yppNB5ASE3eM
	y1/J/xEPilD7J5W2xSe5yPezprYbITgZ3GipsKMtOXOZPfuJILUuTRmH2JR4ZaSqF2qIyN8/fAq
	aLxGLTxtqPYPmJvFzxPjRy2l9b3q45c+/hAKoqqQEHHcDAyFFfuKTylTvRiOeDPPUsxX1WEY9VC
	I6F9A9VVum9ISz3VIShZvxaGqEf4fc+tFRCx2MrqayBwJLUgnGJDmT58mL1oF3UzdAEOJMY8rXa
	38QIX8VjZ1RklREX48VGIE+tCjx0oVsUgn3LknHGA1//ehpkKML4cVB9GhaIsBjrBysx4REc8rr
	fi2Z1zCZ3fUm1bUxH9sFsXbnlj1YdWSMffWcnLLVn2i84iRJjk2syO0dUS4BfJ4lxJ8iIstfhb/
	oksoUjsxuLOjJiVqBw+Fr0YWJeZsnd91+stE7K6jVFqxbr47Vp+7OVMarR3OExlk5m0G2HJw0eU
	QTqogSaMkBoz9juAPYQdtxwaWXQVVw==
X-Received: by 2002:a05:7300:2a91:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-372573d107dmr5311768eec.12.1794183020347;
        Sun, 08 Nov 2026 16:10:20 -0800 (PST)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm7790873eec.18.2026.11.08.16.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:10:19 -0800 (PST)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Mon, 09 Nov 2026 09:10:14 +0900
Subject: [PATCH net-next v5 1/2] seg6: skip the route refcount in seg6local
 IPv6 lookups
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
Message-Id: <20261109-seg6-lookup-noref-v5-1-96dc6a652c7e@gmail.com>
References: <20261109-seg6-lookup-noref-v5-0-96dc6a652c7e@gmail.com>
In-Reply-To: <20261109-seg6-lookup-noref-v5-0-96dc6a652c7e@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7267;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=Z0jFrXtM3BdpUHhSaTMX+ea4Tho3Ot9LI7vxEfjmtpk=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBq8Q9n/AQBYQ7Xlslo7gzsE7Qg2Yro2JD/Hf6hC
 OT7uWo/tXqJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCavEPZwAKCRAq19F1Kl0b
 TeHWD/4m3OuYF1kwFPEC4BzSCe84/ExMum2p6oaJGdsWRSn/cperLaGpkao+4l448Uxx4wfxaPP
 6XcuDwrfu2U/YVhX8qfDZta7B8tpJ4021Lqf6S29FFLdfIjkgsvo3YTjsFpHXQ4OGz3MHDgPPO7
 R1FETjvjoLN0C7HjbV2f8XzGuxz8CYFckhDdiOrifA+p9saFp+d5G3lp7Sj2BBf/rI58QVKSECi
 tlmHLmCOjeJa60rkni7btsVbqmc7zRhe7GUWOIUAHJSZJsLrxVABHZfhGRq2s5XOtOt/+BRoKoc
 IFEPxMVR7rGhW25cxlFyrfCGF9V/rlPPTrhF3jdDst4lspc7OKZUnMGIoGbXi2WkT6mXazJqtOD
 lekiDuHEPBp1kG+WuY/an3GZ4RostLCXZF7+gekjeAtMKJdtKMxUcfaV2bzomkHLXYLvQqCwx4u
 G7K8nzbHifbfkNleXmnzBB/U5JiMceqiDJE6pmm/u3VgVpYJ3D0aytgrgOZMRbSR2PUqYODGev2
 hmh5SuthjM/iwH4LARhut5qoS47ThOpaXYktMx7a2WBi7KEg1bWmhgewRsQUdS5aZnokCyqMnB+
 pBa1FSvNoAmUmG37wP9ni0oOQa7OWeY8a1b9LjmX2xSsaDaMQT1T0uD2sfWKEoK92E9Zdd4ORpN
 cK9ZheQNVDTOQtA==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

ip6_route_input() attaches the input route to the skb without taking a
reference, relying on the RCU read-side section the lookup runs in.
The seg6local input actions also look the route up and hand the skb to
dst_input() within one RCU read-side section: the one of the receive
path, or that of the nfnetlink verdict handler for a packet reinjected
from NFQUEUE.  Yet seg6_lookup_any_nexthop() takes and drops a route
reference for every packet.

Give seg6_lookup_any_nexthop() a noref argument, and set it for the
input and table lookups of those actions, as ip6_route_input() does.
A packet that races with the release of its route can then be dropped
without an ICMPv6 error, where ip6_hold_safe() used to send it on to
the next rule or to ip6_null_entry; ip6_route_input() has the same
window.  seg6_lookup_nexthop(), which the BPF LWT helpers also call,
keeps the refcounted lookup: BPF_PROG_TEST_RUN runs them repeatedly on
the same skb and may leave the RCU read-side section between runs.

Throughput at 0.5% packet loss of 94-byte End packets (two-segment
SRH, no payload), spread by RSS on an ixgbe 82599ES across two 2.30 GHz
Xeon E5-2650 v3 with 10 cores each, offered by TRex and binary-searched
over 10 runs of 10 s, in Mpps:

  queues  cores                   before   after
  1       1                        0.740   0.756  (+2.2%)
  10      10 on the NIC's socket   6.404   6.950  (+8.5%)
  16      10 + 6 on two sockets    6.550  10.124  (+54.6%)

With the default rules, fib6_rule_lookup() tries the local table
first, and the miss takes and drops a reference on ip6_null_entry,
one route shared by every CPU.  At 16 queues that cache line bounces
between the sockets, and ip6_hold_safe() and dst_release() together
take about a third of the cycles.

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_local.c | 55 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 0c3d1be7f129..7fbcf590297d 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -319,7 +319,7 @@ static struct ipv6_sr_hdr *advance_nextseg(struct sk_buff *skb,
 
 static int
 seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
-			u32 tbl_id, bool local_delivery, int oif)
+			u32 tbl_id, bool local_delivery, int oif, bool noref)
 {
 	struct net *net = dev_net(skb->dev);
 	struct ipv6hdr *hdr = ipv6_hdr(skb);
@@ -342,10 +342,14 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		fl6.flowi6_flags = FLOWI_FLAG_KNOWN_NH;
 
 	if (!tbl_id && !oif) {
+		if (noref)
+			flags |= RT6_LOOKUP_F_DST_NOREF;
 		dst = ip6_route_input_lookup(net, skb->dev, &fl6, skb, flags);
 	} else if (tbl_id) {
 		struct fib6_table *table;
 
+		if (noref)
+			flags |= RT6_LOOKUP_F_DST_NOREF;
 		table = fib6_get_table(net, tbl_id);
 		if (!table)
 			goto out;
@@ -363,26 +367,45 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
 		dev_flags |= IFF_LOOPBACK;
 
 	if (dst && (dst_dev(dst)->flags & dev_flags) && !dst->error) {
-		dst_release(dst);
+		ip6_rt_put_flags(dst_rt6_info(dst), flags);
 		dst = NULL;
 	}
 
 out:
 	if (!dst) {
-		rt = net->ipv6.ip6_blk_hole_entry;
-		dst = &rt->dst;
-		dst_hold(dst);
+		dst = &net->ipv6.ip6_blk_hole_entry->dst;
+		if (!(flags & RT6_LOOKUP_F_DST_NOREF))
+			dst_hold(dst);
 	}
 
 	skb_dst_drop(skb);
-	skb_dst_set(skb, dst);
+	if ((flags & RT6_LOOKUP_F_DST_NOREF) && !dst->rt_uncached_list)
+		skb_dst_set_noref(skb, dst);
+	else
+		skb_dst_set(skb, dst);
 	return dst->error;
 }
 
+/* rcu must be held from the lookup until dst_input() */
+static int
+seg6_lookup_any_nexthop_noref(struct sk_buff *skb, struct in6_addr *nhaddr,
+			      u32 tbl_id, bool local_delivery, int oif)
+{
+	return seg6_lookup_any_nexthop(skb, nhaddr, tbl_id, local_delivery, oif,
+				       true);
+}
+
+/* rcu must be held from the lookup until dst_input() */
+static int seg6_lookup_nexthop_noref(struct sk_buff *skb,
+				     struct in6_addr *nhaddr, u32 tbl_id)
+{
+	return seg6_lookup_any_nexthop_noref(skb, nhaddr, tbl_id, false, 0);
+}
+
 int seg6_lookup_nexthop(struct sk_buff *skb,
 			struct in6_addr *nhaddr, u32 tbl_id)
 {
-	return seg6_lookup_any_nexthop(skb, nhaddr, tbl_id, false, 0);
+	return seg6_lookup_any_nexthop(skb, nhaddr, tbl_id, false, 0, false);
 }
 
 static __u8 seg6_flv_lcblock_octects(const struct seg6_flavors_info *finfo)
@@ -446,7 +469,7 @@ seg6_next_csid_advance_arg(struct sk_buff *skb,
 static int input_action_end_finish(struct sk_buff *skb,
 				   struct seg6_local_lwt *slwt)
 {
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 }
@@ -497,7 +520,7 @@ static int end_next_csid_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 static int input_action_end_x_finish(struct sk_buff *skb,
 				     struct seg6_local_lwt *slwt)
 {
-	seg6_lookup_any_nexthop(skb, &slwt->nh6, 0, false, slwt->oif);
+	seg6_lookup_any_nexthop_noref(skb, &slwt->nh6, 0, false, slwt->oif);
 
 	return dst_input(skb);
 }
@@ -939,7 +962,7 @@ static int input_action_end_t(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	seg6_lookup_nexthop(skb, NULL, slwt->table);
+	seg6_lookup_nexthop_noref(skb, NULL, slwt->table);
 
 	return dst_input(skb);
 
@@ -1023,7 +1046,7 @@ static int input_action_end_dx6_finish(struct net *net, struct sock *sk,
 	if (!ipv6_addr_any(&slwt->nh6))
 		nhaddr = &slwt->nh6;
 
-	seg6_lookup_nexthop(skb, nhaddr, 0);
+	seg6_lookup_nexthop_noref(skb, nhaddr, 0);
 
 	return dst_input(skb);
 }
@@ -1383,7 +1406,7 @@ static int input_action_end_dt6(struct sk_buff *skb,
 	/* note: this time we do not need to specify the table because the VRF
 	 * takes care of selecting the correct table.
 	 */
-	seg6_lookup_any_nexthop(skb, NULL, 0, true, 0);
+	seg6_lookup_any_nexthop_noref(skb, NULL, 0, true, 0);
 
 	return dst_input(skb);
 
@@ -1391,7 +1414,7 @@ static int input_action_end_dt6(struct sk_buff *skb,
 #endif
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_any_nexthop(skb, NULL, slwt->table, true, 0);
+	seg6_lookup_any_nexthop_noref(skb, NULL, slwt->table, true, 0);
 
 	return dst_input(skb);
 
@@ -1446,7 +1469,7 @@ static int input_action_end_b6(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 
@@ -1482,7 +1505,7 @@ static int input_action_end_b6_encap(struct sk_buff *skb,
 
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 
@@ -1571,7 +1594,7 @@ static int input_action_end_bpf(struct sk_buff *skb,
 	local_unlock_nested_bh(&seg6_bpf_srh_states.bh_lock);
 
 	if (ret != BPF_REDIRECT)
-		seg6_lookup_nexthop(skb, NULL, 0);
+		seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 

-- 
2.50.1

