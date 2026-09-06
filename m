Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD233A6B67
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684265; cv=none; b=p58Xehn8WaY0aiL2Tb7ZWPHgrWYbki6U1VsYiiPxqZxhTeockCDfslmBFEQjK9r7nKrB8JkPcK+MUuoR+PF1kfj8muds9/X1KicO5l+jdmXzzIvO5bJe+kB/LFINexJdiwD6xRAgVH7cDLtKuXW3EoPTmdU1B5xQ8l59MnlLK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684265; c=relaxed/simple;
	bh=qNTDOlPILV3T04HAjwGIZq4By932gRZYYSompesDPNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7+alnV8dwkhAUoKuMhRibgiObA6fqO2NRi2LFY8alEDVSVgewMRGA0CEfxgf5IYjKb994/qieVoUIxifv2P4m57Btoqn/5vJ0bqGdnQSNX91082tnD9a9awssha5jhf2Ietbh8mjuj98nVrJ4CJRj+2GgRn2X3O0LWFN1yVYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+N8muI9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+N8muI9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6d28aa26cso13983565ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684263; x=1789289063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/l1qLwJSS6D6HFID29WNOWsYoWwOmZTzkLIw+IBHN20=;
        b=s+N8muI935x/XJrIVxbQJKnJDcod/ClhFST8qVlYz/Tv8bcLq3D8xXbsH0ZzhpJ8+u
         n8xl9SprMXFaeOdI3asZhL9dBj52/sLIzfzha8OE2pFoVpQt6Z+pMKhZCwBrQjirft2P
         GavT9ouD9Lp4hQtBL2MFngYmrseYDOzaDSj3neb/jLvyio/zR3gMphfTIXK++mZzVy8P
         BTS9B0RmtARKFlF8LPJODcPM/ryAYPzDWU9XbyHbGnvI/2GicI1GUivw4lReC5DdpZ/s
         yYSyhhzrw2ps75Xm4W2bVXLBEn4ofJP7gC95S4jPe4TX0VuReL7vl2mNNO6Hs9VVpCsA
         4Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684263; x=1789289063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/l1qLwJSS6D6HFID29WNOWsYoWwOmZTzkLIw+IBHN20=;
        b=MCsYW7GpvDlqYb0ir0C8AnkAxg5DgvRLA22JlSmIkW8NvmUSFz84CYQqX5cFDDBsdk
         zN8dnEwUsJK1cYDH+cEaIgDJJF9YuKOTF8cCSGTqZ2OGlbUe3NDcBj1BKhgTwZMvIdbs
         aOHNq7V9S5ZB4eOwSNrXYYG6jRtmU1INVcpyI1Oanhs2k7AYaz02Xe7ao3R+IMUcI7iq
         ANWX+3jSdu1Fk/VNAr+WV5arQhY5A8Ay/j2dwFAO/MpL5sVl9sX0hGqh7sH2eQbhACEm
         MaUD7NaXvajB+U2hm3o3eFI/Jy5V4UeIF1aer05CRz2FYz1ybME85xiNCdG+l5QncgwA
         0A8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZQlYIg1kpzNykYnHTFbJh4aKoI7P1dm4hVuhyXdyU+akQif19L51zYnQ1wm6i3+K3JQbywp1TGJTA5Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqM+V1ZuSMw3YMIoijqp4p2uTKmD6ES1QWuo4+4jwaHpTpzDZK
	nQvXhc1pTz+eL0o6rA+QzUzspQhpnjQ+Eqp8CUpm3639yr4mbhDPEMm/
X-Gm-Gg: AYBFou2cRtjNNtxi3n1DRAO8DUSdpZs2QunUcitpkwNC3AKiIoU2R3XyFCnGj/DqoL7
	dlxkZN/R6RcZkBG5j8tFnvlHPinHD17VYm4Y/8cMwmLidahss5EB+7I3Y3bys1brUY341akxkTM
	pC/ZrsZC2Oa0bXmUUv8wUsePpqQmqaqgSujDOPMbhz8VztMxesbCoCuB2yETvMOQCn+pPcHuMwh
	T+LbVKV/qBdz6DlxMqT5Rb6IKc872THVip+DIuAoVA56QH7ycmWl8ubtm0AX1Zo6jG+3pfXHuWW
	OqMwPXEX7cPpquXzJZZNJNaJD0VKbOBU2KXt0Gm2o5hxhG9mvyuDemnAz4e//igEKIsme/kaKey
	He51yc8mUYJHeoR8vVjEfl72rrmpDB0BFULa/si0CXuxK/O2X823i9OW4E2cn9WoMvGTouig0NU
	Udhv1pZ0V59rryQAuTb/D6yoytYqGGe3sbPUbcBRrVAmKzNf4oF/ycM1HegVv8JnQ7YjSJYq5Ig
	s8XiYe6bRg4ivk+zjI4
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id d9443c01a7336-2db1258c686mr229715195ad.8.1788684263408;
        Sun, 06 Sep 2026 01:44:23 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db190f6fb0sm28470765ad.51.2026.09.06.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:44:22 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+459f67f4d8af8ce6@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH nf v2] netfilter: ip6t_rpfilter: reject routes without inet6_dev
Date: Sun,  6 Sep 2026 16:44:10 +0800
Message-ID: <20260906084410.5601-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip6_route_lookup() can return an error-free route whose rt6i_idev is
NULL. Lowering an external nexthop device's MTU below IPV6_MIN_MTU tears
down its inet6_dev while fib6_ifdown() leaves routes using nexthop objects
in the FIB. An unprivileged user can construct this state with rtnetlink
in a private user and network namespace, then trigger a NULL dereference
through an IPv6 rpfilter lookup:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000000
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: rpfilter_mt (net/ipv6/netfilter/ip6t_rpfilter.c:75)
  Call Trace:
  ip6t_do_table (net/ipv6/netfilter/ip6_tables.c:316)
  nf_hook_slow (net/netfilter/core.c:619)
  ipv6_rcv (net/ipv6/ip6_input.c:351)
  __netif_receive_skb_one_core (net/core/dev.c:6216)
  process_backlog (net/core/dev.c:6680)
  __napi_poll (net/core/dev.c:7739)
  net_rx_action (net/core/dev.c:7959)
  handle_softirqs (kernel/softirq.c:622)
  do_softirq.part.0 (kernel/softirq.c:523)
  __local_bh_enable_ip (kernel/softirq.c:450)
  __dev_queue_xmit (net/core/dev.c:4913)
  packet_sendmsg (net/packet/af_packet.c:3139)
  __sys_sendto (net/socket.c:2252)
  __x64_sys_sendto (net/socket.c:2259)
  do_syscall_64 (arch/x86/entry/syscall_64.c:94)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Kernel panic - not syncing: Fatal exception in interrupt

Reject routes without an inet6_dev immediately after lookup. Such routes
are not eligible for reverse-path filtering, and the check protects all
later rt6i_idev dereferences.

Fixes: e26f9a480fb6 ("netfilter: add ipv6 reverse path filter match")
Reported-by: co+459f67f4d8af8ce6@bugs.sh
Closes: https://lore.kernel.org/all/VtWUkE8QzJt5CroTj2V2v3ZQ0gwbXZ7nq7I3@bugs.sh/
Suggested-by: Florian Westphal <fw@strlen.de>
Assisted-by: Claude:gpt-5
Cc: stable@vger.kernel.org
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
v2:
- Reject routes without inet6_dev in both loose and strict modes, as
  suggested by Florian.
v1: https://lore.kernel.org/all/20260906034939.3746540-1-bestswngs@gmail.com/
---
 net/ipv6/netfilter/ip6t_rpfilter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/netfilter/ip6t_rpfilter.c b/net/ipv6/netfilter/ip6t_rpfilter.c
index 67c87a88cde4f..b5def30c3127e 100644
--- a/net/ipv6/netfilter/ip6t_rpfilter.c
+++ b/net/ipv6/netfilter/ip6t_rpfilter.c
@@ -61,7 +61,7 @@ static bool rpfilter_lookup_reverse6(struct net *net, const struct sk_buff *skb,
 		fl6.flowi6_oif = dev->ifindex;
 
 	rt = (void *)ip6_route_lookup(net, &fl6, skb, lookup_flags);
-	if (rt->dst.error)
+	if (rt->dst.error || !rt->rt6i_idev)
 		goto out;
 
 	if (rt->rt6i_flags & (RTF_REJECT|RTF_ANYCAST))
-- 
2.55.0
