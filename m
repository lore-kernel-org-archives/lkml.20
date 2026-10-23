Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763285;
	b=avWsOzLhowm65R4FwIPYIkdJRJUtRYJDp1CRNbDGBCI1G7tB41bUpV4FEbS4nCXcNmA8
	 8EnaPKmg/b1HwccTxQ97p4nZOL7uIgEeTz/My1LJnmv++Zb9Ec1yh96nXieE5ZJaMzv5N
	 1iyuulGo0Cun2FbRJUEuK6erKvkfPbGjzmq6iESoHtdUIMccZCEs+EvCFfaCm4RzUji0+
	 xuNPGN+yXNPz8Tj8auTCVjOQcZpbLjAgxVA6BmwPvhknQ/aydLzG7TB6TaXFxx3JOywg2
	 dUVEMmrRG8xcH7Q9ppc2JvNZ3ar7vqPny8+QAVtkNInzBVjYei66Z9Nq2rnKbY+TH6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
	b=WmHduT2Q0KGB2zbcQYLPAqdfgVlsP5aZ/Perxsaay+KKIi88QVaYLEXh4v2bt2OwhTlb
	 Z/qxUvy1psKl3mEBgIkrblpLsH+yaZhMe5vcEaaezsG/ALdTWh75qJYjJMgm2cvk5Hskj
	 G/OBsUppPODpNCSfS+p9qcat50GWv583ErR4grxamFEqbjpvG8mri/ALtt8mTN/DA/omm
	 5dl3LFPHB3WUNGDz80eALIXvHOyN7cpkF0WTCdHNk1goFW4MU8lDrrIAUNmL+1aFYeyV5
	 f/ehZGT6vHwqK508svVp6hiWwcQ6Un6g/UXdczVWTFd9+OAZWGUsR7A3oG2Q88N1mQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qSTx99IP;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CB606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7CB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qSTx99IP
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd76b1361dso4559145ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763284; x=1793368084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
        b=qSTx99IPGHN/okREI1Oxbp0kniekncoVuUw7f0CRKSF9qwE7VkA52A/923tWg5hck8
         MhWL92cGMSAVRS2PU8PwTuDZ2YtJy6H+yi2saYe4+0pvoG0BRKOuPbgLYghAY2a1Goow
         eeKIXPtsYJJhzyoUMRFr4faL01WsOjy7MYNmI+s8trF3vPUPXXV/BFd79ci0ryF57PDo
         JrR18X2uodOn+fLXIWuAUv7Y08Ve/8FYKp1OiOmhwjhDI81JogcJ83IisGuKZuXm30r0
         TtPvX8xbhGNYzsYX/gE4QtNLL2YNlMCBke6CsUUJsJNq0cfrHVTuudYVjV4vuldrr9UI
         9BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763284; x=1793368084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFTPqd/iBvBr5Dd1zFhRBjxhT0+2tYQDrYubtNBroD4=;
        b=RdlwDqYWj2XH+2H2NBeViI4eppGI0DX34sEYxxVNh6RfdWYHiGiGnkEDQoi55vYAGd
         QWbImOcRYlS+Eklg3Pi07k/TFxSSOEt1Q6QziT59LRNihc7R6OxCszVxORo2liDg416V
         PlG6dPEBDOuN/IT0eLoggBdDBa3zP/3rwYQ7U1U/BGQG7CVcCC7mzptwMZrvrBR+cPPE
         tEXCfUsyQWpZTi74UbX1U0lRMmJVffvdeZsf6/Ms6tG6gs+x8Fyu8iGx8nOyShnH4uY9
         YAwoDfvqO3SflO2+amxaxQgOJl8JBxl12Ykhqy5vOrXiywGzzgVKettRS5kvjGczvS40
         cGOw==
X-Forwarded-Encrypted: i=1; AKwUvBwAR6INTCAVSaHT1uD5XysSndOCzsBWQvlu57XryvOaiviSrLNZ/+CLmak6eoS5GVJ7jpikR67vpGG42hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpZqYnJ75+tPTPYlLO8VBpFzWexH1WYwTyQl505S6m0UX2xyDz
	pLTnknAtjPUqiL8S4+29GdhnmpLbhr4+SJe8Xm6lh3hNaP5+KpdMaIoo
X-Gm-Gg: AYBFou2y9KgC4p3p+Z6k8/uiHfkSLsmJ+v5MPl/cYel3av2mbbAOXgelTuQuq7kGdU1
	B1LlrzYR2HsvTm3XROCwnk1g0UHnRm43bsei6che3nVRtUzeAVxU6OfxQZAm4GNTF7+1/MLpHyg
	A0cJKPOwWKyjfygpcnQa1TwkJIs7p9xrQrKIrzjsICZ+o+4xQnRaUYk/+5g2yI+jKKbSCLezDG6
	LxRVa832uOZVl45maO0bjftOLbFKX4stNa5eXliCiI2UsfPVlbX7oSiiiQhgyzx57R9VQmPWc2t
	AJIaf91+NWIQZSQF2Vgmw0XCxf7uWCLEl3SVbhLe2VABd23YlnzFa9EVRYcBEF+Br+DVfSDBg6w
	RJJvF/ZoFS9r7K/eXcx43n2tUjSd/glM78IVib3MDIgCOgoVtIGZvUZDF13FseIS6bT0fWXopt4
	r9OSwiKpKTydAnw5OzMKQY6/hdRGdvmythiUVDRF/IT8pqt5pT0t06ljcKRlf4VzRfxnd4XyevX
	unAQJ1cbRY9fLEiuf1cwdT49s3MM88G4ALqUpTurhRrVFbxU5REa41GWw==
X-Received: by 2002:a17:903:18a:b0:2df:a64a:756d with SMTP id d9443c01a7336-2ea7ced88bamr23649455ad.33.1792763283822;
        Fri, 23 Oct 2026 06:48:03 -0700 (PDT)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea946778ccsm521295ad.9.2026.10.23.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:48:03 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Fri, 23 Oct 2026 22:47:56 +0900
Subject: [PATCH net-next v4 1/2] seg6: skip the route refcount in seg6local
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
Message-Id: <20261023-seg6-lookup-noref-v4-1-0ad0a83960ef@gmail.com>
References: <20261023-seg6-lookup-noref-v4-0-0ad0a83960ef@gmail.com>
In-Reply-To: <20261023-seg6-lookup-noref-v4-0-0ad0a83960ef@gmail.com>
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
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBq22WMRkt0MP6INEApQnxXOrD7+CIjJEkGApSdU
 FbT9xGmC8GJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCattljAAKCRAq19F1Kl0b
 TRjhD/9WN//kpALPGBL8Ebh/7Uutgs/K7sSZ9frfn0ht0l0WXzRfjxp3viTZ/6jabTm09CF53tQ
 ZyftBMbrpkhVBB3Cdp1lqqn8yQgubtcomOTJcqiFjjehBGoUiIUyUJeH64oZqkrpnZreIiz59m9
 WfdqxLR9HKY0bW9pp9wHGfOdFvHmPUXQoemDerLuyzjOl0/t3C9ELAr0vGumR81PXbjE1/c0Av4
 kuAjzMvsYvyB7AZyEKWSKm7ABEn7FA+U5altm0eVojR0lRFKBV0X7CixFCSIsKCZZr3mBP3zEa3
 OjClbwrj6qseP6Jwd109hvYRxgFB32PE9rFcSa2gikZxY+FK+R3iYs/fFeKT5owkLvfqAAUVoHF
 tAQamLSxV+JLpGwodTf86sRqZ74FRaRVaiWOBDaMdmR+cxXeSz804SFNNLojEjmeHJK0jeY275e
 HMpNEyZEwoTRFnDyOL1W9hY3REQblILOFBMBUFhTNFCF9ZdS7VO9/ROpyl3oxRVAb/qCeFmQgYB
 fHnzxCzPlHkgJt4XXsRzzz6W72X+MWDJpDOCSVJbE+OXc8psMSQTps7KIGuass4V/dcJQtXanqa
 pHlcAIj+db0szUOLPc2mm2LKy5TciN+5NxpqS+wFZkXzjMLZFsOkzqgYT3FoL7e2qKWWYMMlkge
 E5mNhzXGqoAi3qw==
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

