Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E445D91C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125536; cv=none; b=dC39Oksap30bE/urbTLgSFXdQNyv66apzuKRS4ScBtlJ90qlpPFjje3Jy/YijlrqkygllsDVNfO7whogdiVM40hhPhxqKuqLBYWJf6gaiiAEsmJo8OgjqrUeQ78mr87nPTOV0+T3QJJEYaPZx5ZY1U1usTTdlwtv0ch/Rnui3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125536; c=relaxed/simple;
	bh=3PSXjUUgkP+CTkZuRfK+qx3dquiLCcTTSglpG8kopjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/Eh5DfelyQAVK3wFveTY3nd9afrAYMuuLSOqlfNtvuUoFYG/Wod8GjtfQ8K+lJncTDr7PrS3NlxIt+0qMBU4o1w3Nky/zpIPOogxT5Uejf6EoXUALFuWxcalVqhjdPMNrcBdUCdUC9B4XR5gMQtPRJnWW/boFdRN0UkJ2+4OgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAnsVz5/; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAnsVz5/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso763466e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791125530; x=1791730330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcvaVcm7AzJh6OuMh0IbSjO1x/AShhDM4lk+aq/Dp1g=;
        b=eAnsVz5/SUnTqJP1to58ZQ/GocqiqUktGmRmlcOT0kguh4PJr1hzCuXPb7vzyEVBO5
         YQcA3ihao5ZqLaGAhuGhS+q8GrZONTHlW6MRXFQbAsGxOVcX2dJ8xKGqwN/lJoY0VDrn
         STm5IDTvgDYtkHvXyP8uXuveaW6YsUIkvjiYf3c+HojHRM4q1EZ3Vk27d2rqbbIokuqp
         XxPmByE0+F4R616D+p8tYc4yrDXYMmbyMZMdjDLLqbnXv/tsSDHEIa50vh0aEAtNRdBg
         jTbpfD7mWjZOiOoXXxY95bve20/cA8D+gvA2nVZl7fJSioArKfVfJq8CSSBpMr7f+efw
         NllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791125530; x=1791730330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcvaVcm7AzJh6OuMh0IbSjO1x/AShhDM4lk+aq/Dp1g=;
        b=K5AbAU7kiW9XMF/TYD/Y6NBQaeJxGyx2Fa/Z8/7MtjnAY0asjObQg+xiwLSWoIkfZm
         oGRAJDkJrhwYtj19RP3PJMlwPbrBPgR7i8rX3wI2pv+5ziCjb0N4/6/j6EGt8s+igHXa
         o3MEmyJZPJ1CuF9ea+4ECRASOOIbSDVP10czRSDQczB9OyRYkW5SI3FvuuYNZWOavtKL
         DIuXL7+3c1zPv9MHdhWBy4oVZMQowEufjhg+uhLhrDPLEYzbVwrXhPG3lrrijOHLoZiD
         h6sDB/aIgiefU9XnUK6ZulT6qmG3acaipugiXVSsyHht9vK1zmd8+N6DBnlW8Y7+Hcq+
         XIbA==
X-Forwarded-Encrypted: i=1; AKwUvBzG1kpJ8PpyyRR0f4T1mOuRQz+LTb/syW4oFJSI2/I3T3EVtbbVsixzB4u8kgMtS3c1ZUjMUvS/X/NUs3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYImHM92nGHkDpYW0rr5L6NCM7wJIzpiREJRTA0M7y5AIffo886s
	kfN75WvtUa/nZysX9cspfYFHC/ftMaClYzIACBp+p4bS4nj8wG/+2JPb
X-Gm-Gg: AYBFou0Y6/901MGj3YK0sOuBF5W99vy1UkrW52JhWCuqx+2KRLfUoq8C4sJKQv/B+sL
	dHgoYN04InKn+MjI2uJr/3zvoy97CjS5O0m8srZIxPxA1Ug96U5GP9a67NUBSSDB2O7BymIUR9q
	4Mt5DUPas0QwpP8xW8vxJF0/YuAan9/HbsNC8AOa97feRCbR8aFZK21XapXjX4wi+SnWUn4Qr5L
	aU0/H50snSj7MklWNx3f2uNBs2Vi8P/J/3ct8WYk5vjRr/6nr89zFGadkLWlEG1gsdWoc4Zv+7P
	UPKHIi/gTBu1DRWENA2kUr5glQEtzcnOjBceDk1NTJd4Iz+owvIB8hkA903t8LFujKNVxjO0NFv
	82MepQcj92G7DxEg24zvJcZAMGbotpiqqI0D8kLVXxS8uEOSFlbUNZnbLntiVtjUwqrETPias1Q
	R5RtboFequnBe9Sp+QgkK8+UWN5cdpGfGWScO2Kmy3FLq+WMqpzKfAekEKOdvv42Ih9dfN61ecC
	GQe8r5cQ/XUD1pd4KPrRbbzkRlfCQFIg2NKQZeIeQ==
X-Received: by 2002:a05:6512:65d4:10b0:5ba:4329:1c6c with SMTP id 2adb3069b0e04-5bb93812b49mr2768336e87.6.1791125530191;
        Sun, 04 Oct 2026 07:52:10 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795b22sm2360569e87.36.2026.10.04.07.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:52:09 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Mazin Al Haddad <mazin@getstate.dev>,
	Matthias May <matthias.may@westermo.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v4] ip6_gre: use skb_vlan_inet_prepare() instead of pskb_inet_may_pull()
Date: Sun,  4 Oct 2026 17:52:04 +0300
Message-ID: <20261004145205.226974-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip6gre_tunnel_xmit() and ip6erspan_tunnel_xmit() check the packet length
with pskb_inet_may_pull(), which looks at skb->protocol only, while the
code that follows parses the packet through VLAN tags with
skb_protocol(skb, true). The parsing started to look through the tags
with the two commits in the Fixes tags; the check was left as it was.
A VLAN-tagged frame whose inner IPv4/IPv6 header is not in the linear
area passes the check, and the inner header is read anyway. A 20 byte
tagged frame on ip6gretap and a 10 byte frame on ip6erspan are sent
out, while an untagged frame that is too short for its IP header is
already dropped.

Use skb_vlan_inet_prepare(), as the IPv6 receive path does since
commit 81c734dae203 ("ip6_tunnel: use skb_vlan_inet_prepare() in
__ip6_tnl_rcv()"). The second argument (inner_proto_inherit) depends on
the device: ip6gre_tunnel_xmit() serves both ip6gre (ARPHRD_IP6GRE, no
MAC header) and ip6gretap (ARPHRD_ETHER), so it is
dev->type != ARPHRD_ETHER there; ip6erspan is always an Ethernet device,
so it is false. vxlan does the same with no_eth_encap.

The tag walk starts at skb->mac_len - VLAN_HLEN, or at ETH_HLEN if
skb->mac_len is 0, and on transmit skb->mac_len is still what the skb
was received with. For a packet that came in through an NBMA gre
device and is routed out of a VLAN on ip6gretap or ip6erspan, the walk
starts inside the inner IPv4 header. Clear skb->mac_len for Ethernet
devices first.

An ip6gre device created without a remote uses ip6gre_header_ops, and
ip6gre_header() pushes a pseudo IPv6 header in front of the packet, so
there skb->data is not where the packet starts. skb_vlan_inet_prepare()
would move the network header onto that pseudo header, whose payload
length and GRE words are never written, and an ICMPv6 error for the
packet then quotes them: KMSAN reports uninit-value in
icmpv6_push_pending_frames(). Keep pskb_inet_may_pull() for that case,
as before this change.

With this change the two short frames above are dropped. gre_gso.sh,
l2_tos_ttl_inherit.sh and the mirror_gre, mirror_gre_vlan,
mirror_gre_bridge_1q and mirror_gre_changes forwarding selftests pass.
A constant true instead breaks the ip6gretap cases of mirror_gre.sh,
and a constant false breaks the ip6gre GSO cases of gre_gso.sh.

Fixes: 3f8a8447fd0b ("ip6_gre: use actual protocol to select xmit")
Fixes: b09ab9c92e50 ("ip6_tunnel: allow to inherit from VLAN encapsulated IP")
Reported-by: syzbot+6023ea32e206eef7920a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6023ea32e206eef7920a
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>

---

v4: Anton Danilov takes over the patch, as Eric suggested in the v3 thread.
 - inner_proto_inherit follows the device type instead of being a
   constant.
 - Clear skb->mac_len for Ethernet devices before the VLAN walk.
 - Keep pskb_inet_may_pull() for ip6gre with header_ops.
 - Fixes tags point at the commits that made the parsing look through
   VLAN tags, instead of d8a6213d70ac ("geneve: fix header validation
   in geneve[6]_xmit_skb"), which only added the helper.
 - Discussion: https://lore.kernel.org/netdev/20261003220513.107668-1-littlesmilingcloud@gmail.com/
v3: https://lore.kernel.org/netdev/20260119112512.28196-1-fw@strlen.de/
v2: https://lore.kernel.org/netdev/20260106144529.1424886-1-edumazet@google.com/
v1: https://lore.kernel.org/netdev/20260105100330.2258612-1-edumazet@google.com/

 net/ipv6/ip6_gre.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index e61cb10b50dc..f48141820fb5 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -883,8 +883,22 @@ static netdev_tx_t ip6gre_tunnel_xmit(struct sk_buff *skb,
 	__be16 payload_protocol;
 	int ret;
 
-	if (!pskb_inet_may_pull(skb))
-		goto tx_err;
+	if (dev->type != ARPHRD_ETHER && dev->header_ops) {
+		/* ip6gre_header() has pushed a pseudo header in front of
+		 * the packet, so skb->data is not where the packet starts.
+		 */
+		if (!pskb_inet_may_pull(skb))
+			goto tx_err;
+	} else {
+		/* The VLAN tag walks below start at skb->mac_len - VLAN_HLEN,
+		 * or at ETH_HLEN if it is 0, and a forwarded skb still has
+		 * the mac_len of the device it was received on.
+		 */
+		if (dev->type == ARPHRD_ETHER)
+			skb->mac_len = 0;
+		if (skb_vlan_inet_prepare(skb, dev->type != ARPHRD_ETHER))
+			goto tx_err;
+	}
 
 	if (!ip6_tnl_xmit_ctl(t, &t->parms.laddr, &t->parms.raddr))
 		goto tx_err;
@@ -934,7 +948,12 @@ static netdev_tx_t ip6erspan_tunnel_xmit(struct sk_buff *skb,
 	__u32 mtu;
 	int nhoff;
 
-	if (!pskb_inet_may_pull(skb))
+	/* The VLAN tag walks below start at skb->mac_len - VLAN_HLEN, or at
+	 * ETH_HLEN if it is 0, and a forwarded skb still has the mac_len of
+	 * the device it was received on.
+	 */
+	skb->mac_len = 0;
+	if (skb_vlan_inet_prepare(skb, false))
 		goto tx_err;
 
 	if (!ip6_tnl_xmit_ctl(t, &t->parms.laddr, &t->parms.raddr))
-- 
2.47.3

