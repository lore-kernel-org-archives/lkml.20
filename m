Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D347ACD3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254804; cv=none; b=L9WzkOoRrZPHC+iwbVzSVHyOJDO4H1y9L4MZx0OsURqFhmR4BVZSKmoQWwL1gYIIJCNSDUq+I3BjU+qm+DOdGW1jf9luopXEsLYl2Kw/cFwRatc+oPxa+GaHQzPv01E4cFuNvcrNh8zD9rLBph1pFxjBnXv5mUBEe37+K9LWaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254804; c=relaxed/simple;
	bh=486JyvxoR2eg9x09oSX4uB43Q8gO3J5bOat7K487kfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxD+VmIyZwHHLIy2L0tzXQoWkPsStKF+dz5CiDn+JSGuAAT4lzd4WeDecBJRsUkZM4OLdHKts58PHPewkVS36P4efvDY30Lr+IJz+ErYyICKSycJwMZbDSd3EyZSvuOld1iD1eJ/P/kb0wDOGE/Z5XBg6NweNeKpl1B2cwz6Uqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=qOrJRXdB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="qOrJRXdB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20e70a0962so597840266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788254799; x=1788859599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W02+miOc40enO8Kk7fWVAuXmWTmU4/GB4n7lg/BSofo=;
        b=qOrJRXdB3HevmYq39yGXrM7ck8HCbpJ1c9eIxEPRGaxZlJ0Ezsmh0YH9LhCcuZAtBA
         RMw8pYaT1/FGIf+fQ8DWDWGMabT9eIS0kX5RDP3Hkp5j3/AWignHYUZFBqEGGt6gBOOs
         ijwBmOZIiakVWW5j7pjbjPLYFbC5xNfAAYgKYVQVLIPL0eRwo7lRDoFEYyCA3f/gKrVd
         iCMe26eb2xzVyJxRXa5ioBrFe0c8TPuZoH42YLe0isoZfZsu4g28tln0CVda3SCFMsdP
         HvE/nSHzg4Au2RdpVreOs9CX2riK1Khr2U+9mMoq4TRAQsDCdSElbkG6TXr7PODkEOF1
         CFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254799; x=1788859599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W02+miOc40enO8Kk7fWVAuXmWTmU4/GB4n7lg/BSofo=;
        b=ouPX7XuV/NA3+Dce8SvUWWmjkl++L0x77xtrp6VgJjE/S7Z7KnUuSby2YnKCTMvKfT
         +KQduRk3y6PCexcKCoh1pU4HDQxoGRiaS7QXQWQghSanLYEp00EjPigrfUuoRA41meHx
         YLn0QsG6FLXlyyU9yU3sXr88YhsBSkSefTzgISHCgC7ADpmyb9NNGZCHrROTQqNsKK9y
         ug1dE8Alzg2yGhhpbJlvowquTAvcvzoNUtMA5SKO+SXGJJGdungwkdbt+xrYRqB3dfQW
         KIY++0SDapBAC0Qp5o0PakHNy6/h5KmNVcy+QGQTsv0VRt8hzUO5ODAfFV12vPTSaLiP
         3Kag==
X-Forwarded-Encrypted: i=1; AHgh+RomJU3+lIHDHq0olF3+fbkJK5kblMuAz2FjfHydhkCm9tBIKrGC8VK+NneBLe+jw0AoXW0sHXQYfJkHqbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ls9O8WNyk1YefGjTUMw5xcrY3JdMqQO56oO4tE/gcAbe8S22Ok
	KlhLwB5Y+bQhRLAkI/5XYhIBq9xRzWORdgmjU5Gueevk9K5nGgEQm7hYz45zBWIVsQ==
X-Gm-Gg: AR+sD10E8XQ1JrohYTg4VEkccBB1sGmPKOj6C3WK4b/UM1Tg3AbWVOgyxoHoyqnLWYj
	8luAOqmTXbX7E1rWiKhwMhM3l4eHErKCKEkB7II7yN1jjh3TEuWYIAiQ7IkWlxT95lym+Ie5Pt5
	A+ecyJzJnYHMZ/lgWvi2BesCI4V5Ul4KygMe6sFE9C7/wU2e/kf87ixoDaNY/NL0y3OrSFXK9ga
	MEPnM6VqfTXPASiVF+SylvjfWDWWzCZ6dPSeDulLLvdTYAD1E4MTUvHYxKZG8RwgxldgwozAOgW
	+K1CKlxkH2JwZSK+rKucIgWO3TQERocV/l1c+n+/5teu3smZV65uBhVsUgU40KOgFkOE7amFRjr
	Th+yuqIgMYdzH2DHyhN4a5U7lb3bLgwwBCcwn35ys6rNnjpIpS9C3mWU5f9ztn5gOzZ/hc48sPC
	XgJorto3f9S1M6qrcSOVuv1ec2nh5BcNqPmRVx64NgmNt08OdRS/OH0jyInW+rB/72b+LHrc1Vd
	CYaPz4OrrFFlx1aT5siLXsJ05i+DCT0uwKuxaTjjxVHP/xjTGyVCSz9t+hSRNCAxU5VYylG23UR
	I0PJ6RK9kO/3UpaXfR5h8iZHKrjpAGJKIPNiYgJahQf+gehaXJ5jDP5aOJsNkWTrOBu6+hhsRlH
	voy1MDkEfjDzFNO1DIQb3CTaOfGyOoXJQX1OgZr4U8XFrapkmgxjim4BckWQvWYXvbF7o5OCQ
X-Received: by 2002:a17:907:1c28:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c25b3cc9a35mr447457466b.11.1788254799343;
        Tue, 01 Sep 2026 02:26:39 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.129.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb965sm574724766b.49.2026.09.01.02.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next] netfilter: flowtable: carry a priority into the offload
Date: Tue,  1 Sep 2026 11:26:32 +0200
Message-ID: <20260901092632.369248-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flow rule handed to a driver describes NAT, encapsulation and the
output device, but not how the flow should be treated on the way out,
so hardware with priority queues can only fall back on the DSCP the
packet carries.

Carry skb->priority of the packet that created the flow and emit it as
FLOW_ACTION_PRIORITY, the action act_skbedit already emits on the tc
path. "meta priority set" before "flow add" then reaches the hardware.
A flow without a priority emits no action; mtk and airoha, the two
in-tree consumers of these rules, ignore the new one as they do
FLOW_ACTION_CSUM.

The flowtable holds one flow for both directions and the expression
runs once, so the priority applies to both; per-direction
classification is not carried.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
maintained in OpenWrt; measured there, "meta priority set" ahead of
"flow add" places offloaded flows in the port's hardware priority
queues. The mtk and airoha hunks are compile-tested only. The new field
grows struct flow_offload by eight bytes on 64-bit; the entry allocates
from its own kmem_cache, so no allocation-class change.

 drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
 include/net/netfilter/nf_flow_table.h           |  1 +
 net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
 net/netfilter/nft_flow_offload.c                |  7 +++++++
 5 files changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..2afce76ad131 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 99b28aaa7cc4..4ee99e8e4a34 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..23218c8cbc3d 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -202,6 +202,7 @@ struct flow_offload {
 	unsigned long				flags;
 	u16					type;
 	u32					timeout;
+	u32					priority;
 	struct rcu_head				rcu_head;
 };
 
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 801a3dd9ceea..caaadffc2563 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
 		return -1;
 
+	if (flow->priority) {
+		struct flow_action_entry *entry;
+
+		entry = flow_action_entry_next(flow_rule);
+		if (!entry)
+			return -1;
+
+		entry->id = FLOW_ACTION_PRIORITY;
+		entry->priority = flow->priority;
+	}
+
 	tuple = &flow->tuplehash[dir].tuple;
 
 	for (i = 0; i < tuple->encap_num; i++) {
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 32b4281038dd..dd3ac2b9c963 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,13 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
+	/* Whatever classified this packet before it reached the flowtable also
+	 * describes every packet the hardware will forward in its place, so
+	 * carry it into the offload rather than losing it with the software
+	 * path.
+	 */
+	flow->priority = pkt->skb->priority;
+
 	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)

base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
-- 
2.53.0

