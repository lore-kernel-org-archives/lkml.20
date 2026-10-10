Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703774570D6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627048; cv=none; b=cvzBDW4dw1TcoKruF7XuPb5njcnIBTjVeHVqIvb6KcDZe/V28TH7Ll67chyvBwwhaZo6EE9PDVYuXzbSRWycIjDbh3W5f7eQ1rqS3fsDAXpt6qfUloM9iwT+E5MJN4NOc6ayIAwXLx1S21tUUg1wLJwCTpriyS/rXyzCK/8o9+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627048; c=relaxed/simple;
	bh=6+Co2Zx5KpoZRtv9y1QI6IVaFfbA9GFUmjerQu63RJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzNMBS8vkY9sYLk18k9ytkAgbnFIY6SOYvA3q4Eb0U648IgWv2ON9sc5MzNfj6RyO5j+oSeoX9ZumcCW6ULpmOXlRqsqLraGVWgt78RJ87X0bbrUhb4z1RADNQWcautWS0yyX9yCJT5atDdAaeOCNFuxO7c+MAvNhBiGagdcPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbwNyt/D; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbwNyt/D"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8874539bccbso196752b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627047; x=1792231847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGgAdtMsM68+kEQC26JSjKBLK+GU4QU18+YP9/Nryjg=;
        b=CbwNyt/D5fj5pRW6uoT9lGaN5lePsEOSmbscSPkV9TtmkGtBqqo4Y4ukp9dsuEFXCe
         3Mf+NOX1esZLjZ4HMso8RtV8T2zE5DfJZEn+Pv553ogLtdZ2N9kVmrFKVkwlHsjefTvu
         7k18LRWIxRrWMvR7N3jthNJQH6ByYvQxZt33CxW8+EMUf8vvOmZ4mSCoRfSZb00O1lkN
         MuC+KhUmIO6uwf0oT0fzWEtUJqiCMj3CuWgAPxPSgxnyEFvb89I5yPxidAlRxcOXeQZV
         CAE7OAGzJmW2K4Y/We+YQ+6iGvjFVkUgEWDNtP6iO1mg7nqWS2m+VK2TZQuEm+ZyDBHu
         G2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627047; x=1792231847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGgAdtMsM68+kEQC26JSjKBLK+GU4QU18+YP9/Nryjg=;
        b=iEoA4Hfpa+16kHQwu5ugqZ85K4omq+BbH5yfjj1X6R/o3RZm2syuCoSN4tnjyqapo9
         IxnIZbcKW1cFFfQODea6+Hy1Q9pRNtYPVgfmaHPZ9l3tnjO8Qoe9FZGqCQqVcCxpAPtM
         hAwL807aq0Fklva4bQszFXCpXQ+CyeEgTUmHgHh+vXkWfXcVLFEBpq9C5BOJLXTPHXkX
         5E3ufFZyVL/vDQ/tVGF5umryXWEkyS6FmodOo3mdPINWvf4VdM/u8aKlh2/gNTZe6D9F
         TkxLffQzqGYIAjYNfIcJ86Xjvz/OxaHx8o5WpQ+P4FyjFb6IJk2R4KuHkDVJDKrPDdiQ
         x5yQ==
X-Forwarded-Encrypted: i=1; AKwUvBylP6TSvDRYRijwCb+x3FaPz7sD8u/z7hMhmmjyRGWEmx4i/51YBJkAEhM3ev9Lg7omo/QYoBoJCsfkguM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM9L43uvqpUYoUMb26M7J632H/L3VJIL5ErQG0g2pNSzeAyJvG
	zdAs/5lWdjpvXq2fGuZAloE+JGK3u3LolsdNxpYdj7vIJoj8LmMW3xzaJJWoW/jh
X-Gm-Gg: AYBFou0tI9KvSvtPEkWlpd9hz3F3a1GTcGb6FQyO8rQ7e6DdTdm+1+s4NLkMi2M2nfE
	oadd1K2HOzt6BDKFUexU9mzoMy1+QCr9HJjdp63sa0gjg2VfYeyPgbUnLesKbUqGIiDiUpo3qcr
	PjSn/DGxi7vjdCO487rnW9wfocC7eDsYw5HZTdBT/u7Wqpj/RukhuQS+Jwo/lSvnIUyTlqMbpTo
	qn7r267erN7i/2LWW18nFkqzNoZCPufGRBG/IQzPX7k/mPFYixB0LTMJZYjGAkQ3JPM3bQTN8+4
	es6JlvH4zbPLvIppYAPucqwb76q4rTCwRlUvncSLGHuhMYyQmiKQVv3pS52CYaJTIrYwkfA8SxX
	YziO04Mr0oEFCZdeTSgZuBJ0klzQ+ptUERaGfbHP+SAYnTDg2wuhIc5jgwf0LdG0UM+kkBkbfqJ
	uzX/XvDnIC/4mGwQJxafNnpl4KLGNozP8jpyUBTSsKgbbofP+Iv30QxHo9l0Hs4sJGk9/F6Bs=
X-Received: by 2002:a05:6a00:4212:b0:893:428b:5e4a with SMTP id d2e1a72fcca58-897c79de74cmr3735147b3a.34.1791627046689;
        Sat, 10 Oct 2026 03:10:46 -0700 (PDT)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37de99fsm2069988b3a.25.2026.10.10.03.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:10:46 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sat, 10 Oct 2026 19:10:39 +0900
Subject: [PATCH net-next v2 1/2] seg6: skip the route refcount in seg6local
 IPv6 lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-seg6-lookup-noref-v2-1-51c09dd98197@gmail.com>
References: <20261010-seg6-lookup-noref-v2-0-51c09dd98197@gmail.com>
In-Reply-To: <20261010-seg6-lookup-noref-v2-0-51c09dd98197@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7098;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=6+Co2Zx5KpoZRtv9y1QI6IVaFfbA9GFUmjerQu63RJs=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqyg8fdfReFhDPnLzyI65uhLnM3MmPNwAxivUDC
 SJysid7Y7yJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCasoPHwAKCRAq19F1Kl0b
 Tc9MEACBjBDhQnsazwO5Ji6HgZ/M2dfYD+4A2EFr4nOqK7D2MJ2w6fMERq4NRVJrNxchwm3GEEh
 H7UhXveVfOxQMlr7xcZ+4Xv8DijGpqCmuBoAwzAtqAM7tQAeHl9OU4WmWmLX1vutO80dajCo3Mz
 vi7sqkb+0V4fKyoZfM2CCK4JBBM101TwzL9dE1jtUtp1zEPxkxcEry7KzQ1j3HXprSbZlVYiaja
 2xx69OENMyY47mA9G8xOv0oxo11/sKsScbhemv7XKhnCg15NU1H8JVt/wD6qYRKwQnV1dDy8ZPg
 v8du2XzEsTlToAPtnby11ltw7wZWPDIL1a9GyP1wWAP2jVYqueTkyxPLlKssJrE3gLjaabfXChP
 AtuBMrJ9BMPK9qckMcWUOpW4xQKVKXyrlxO5QA6GXp9eXKyXjfvG9OHX2cW/pmjxYlgo2OtKEkT
 puEzI3c8DNsPWSlMMCt9Fex4l/HTKt7YjmmYL0S0FyjzVB9DdYhfGJ+rnuoexirSntfyAIjQvIh
 6f7u26wUnWXz4J1RVxNLBevw7WscR1qBuWKjmWKndB62RNpn59RsH9MZLhXE+EtAdpZc8IR6oby
 S/1N2Vc4wwtyOqCJZKx+g940LJJEFlXg4e4E/KFo/eCNnaGzUiAkRE+RtSd/DldSohAgUSzuO9k
 3ILmyYxxfc6x5dw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

ip6_route_input() attaches the input route to the skb without taking a
reference, relying on the RCU read-side section of the receive path.
The seg6local input actions run in that same section, either directly
from the seg6local input handler or from a netfilter okfn, yet
seg6_lookup_any_nexthop() takes and drops a route reference for every
packet.

Look the route up with RT6_LOOKUP_F_DST_NOREF, as ip6_route_input()
does, for the input and table lookups of those actions.  Keep
seg6_lookup_nexthop(), which the BPF LWT helpers also call, refcounted:
BPF_PROG_TEST_RUN runs them repeatedly on the same skb and may leave
the RCU read-side section between runs.  Like ip6_route_output_flags(),
it now takes the reference on top of the noref lookup.

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

Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_local.c | 54 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 0c3d1be7f129..f23330278922 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -318,8 +318,8 @@ static struct ipv6_sr_hdr *advance_nextseg(struct sk_buff *skb,
 }
 
 static int
-seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
-			u32 tbl_id, bool local_delivery, int oif)
+seg6_lookup_any_nexthop_noref(struct sk_buff *skb, struct in6_addr *nhaddr,
+			      u32 tbl_id, bool local_delivery, int oif)
 {
 	struct net *net = dev_net(skb->dev);
 	struct ipv6hdr *hdr = ipv6_hdr(skb);
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
 
@@ -372,17 +374,41 @@ seg6_lookup_any_nexthop(struct sk_buff *skb, struct in6_addr *nhaddr,
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
+	int err;
+
+	rcu_read_lock();
+	err = seg6_lookup_nexthop_noref(skb, nhaddr, tbl_id);
+	if (!skb_dst_force(skb)) {
+		struct dst_entry *dst;
+
+		dst = &dev_net(skb->dev)->ipv6.ip6_blk_hole_entry->dst;
+		dst_hold(dst);
+		skb_dst_set(skb, dst);
+		err = dst->error;
+	}
+	rcu_read_unlock();
+
+	return err;
 }
 
 static __u8 seg6_flv_lcblock_octects(const struct seg6_flavors_info *finfo)
@@ -446,7 +472,7 @@ seg6_next_csid_advance_arg(struct sk_buff *skb,
 static int input_action_end_finish(struct sk_buff *skb,
 				   struct seg6_local_lwt *slwt)
 {
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 }
@@ -497,7 +523,7 @@ static int end_next_csid_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 static int input_action_end_x_finish(struct sk_buff *skb,
 				     struct seg6_local_lwt *slwt)
 {
-	seg6_lookup_any_nexthop(skb, &slwt->nh6, 0, false, slwt->oif);
+	seg6_lookup_any_nexthop_noref(skb, &slwt->nh6, 0, false, slwt->oif);
 
 	return dst_input(skb);
 }
@@ -939,7 +965,7 @@ static int input_action_end_t(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	seg6_lookup_nexthop(skb, NULL, slwt->table);
+	seg6_lookup_nexthop_noref(skb, NULL, slwt->table);
 
 	return dst_input(skb);
 
@@ -1023,7 +1049,7 @@ static int input_action_end_dx6_finish(struct net *net, struct sock *sk,
 	if (!ipv6_addr_any(&slwt->nh6))
 		nhaddr = &slwt->nh6;
 
-	seg6_lookup_nexthop(skb, nhaddr, 0);
+	seg6_lookup_nexthop_noref(skb, nhaddr, 0);
 
 	return dst_input(skb);
 }
@@ -1383,7 +1409,7 @@ static int input_action_end_dt6(struct sk_buff *skb,
 	/* note: this time we do not need to specify the table because the VRF
 	 * takes care of selecting the correct table.
 	 */
-	seg6_lookup_any_nexthop(skb, NULL, 0, true, 0);
+	seg6_lookup_any_nexthop_noref(skb, NULL, 0, true, 0);
 
 	return dst_input(skb);
 
@@ -1391,7 +1417,7 @@ static int input_action_end_dt6(struct sk_buff *skb,
 #endif
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_any_nexthop(skb, NULL, slwt->table, true, 0);
+	seg6_lookup_any_nexthop_noref(skb, NULL, slwt->table, true, 0);
 
 	return dst_input(skb);
 
@@ -1446,7 +1472,7 @@ static int input_action_end_b6(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 
@@ -1482,7 +1508,7 @@ static int input_action_end_b6_encap(struct sk_buff *skb,
 
 	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
 
-	seg6_lookup_nexthop(skb, NULL, 0);
+	seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 
@@ -1571,7 +1597,7 @@ static int input_action_end_bpf(struct sk_buff *skb,
 	local_unlock_nested_bh(&seg6_bpf_srh_states.bh_lock);
 
 	if (ret != BPF_REDIRECT)
-		seg6_lookup_nexthop(skb, NULL, 0);
+		seg6_lookup_nexthop_noref(skb, NULL, 0);
 
 	return dst_input(skb);
 

-- 
2.50.1

