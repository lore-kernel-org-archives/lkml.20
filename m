Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511C3F4DDD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788681333; cv=none; b=Q1bXjKjUJQ2yhr6WM9GAETFo1+UzmpVN1ugfbL6HuWe5Uioio9o6+ZNkJHlBvpYBncsRthQK91SE8tQeWpM4dmkI7Izdm7tV8bXxowQsiP58w8Dt6EqODWLq3aC/M4NF28p72e5GDWvlc65pjyHjXvvx8wImtNzBlZmFxai6Z6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788681333; c=relaxed/simple;
	bh=qNTDOlPILV3T04HAjwGIZq4By932gRZYYSompesDPNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gUNQquy6FMM1fU2M/BrEO95P8nmPpl1XOFWdWke3431mX9jfbC7nVbrO9TzPtGoRoZVDdSIm36VQSNMgnEQRWaAsftW7N8cLyIbaXxLs4EBxiM2AzL37rlIqL4G9CY15cBcH/4YDbPQOm1AdvMnlHOuo237itUN/2bTlyE2JDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5K1D/2k; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5K1D/2k"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d9201076b3so28663845ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788681325; x=1789286125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/l1qLwJSS6D6HFID29WNOWsYoWwOmZTzkLIw+IBHN20=;
        b=j5K1D/2k29HcTJ+qa0lx2BCGIjrj0+232m5KUNbxLr83GgA7rPw6Mf3FyNU5Ia+++6
         UejkdeMIJXGBge8ahwgfVzcGgChwxn9BuOO6ucNmcbgb9XSe83BJdX0BujjTsoBxaJrA
         hvhroZa7yOc8bNbhCX289xeiClq2y8qEWz0zkyAHZV3O22WNrMqvQl8GeocJnVqHWfuf
         qZDxKq4zm8VuVmk2fk6hdaHlG4I7PANIr1ZG1NAQPad3FSvmj2aBKkPg5ED1JJBfuIUp
         UWiEVGYK2dKR/rqvPwVz7SVevJrEObIXrqWxls3sDyDZh5z1h29iJld9tQC/x+1SIizs
         fdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681325; x=1789286125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/l1qLwJSS6D6HFID29WNOWsYoWwOmZTzkLIw+IBHN20=;
        b=l7oXdQAo54gsloHetHzRHnQLv63VqMYDGpCOuSeD1xdYCUmZ7GiFjjNauFpRkP7y1J
         kcDqDiR1+ZLl2OP+LunEGhRrEAtpIs/JRi/8uAG9GZwKskIwBXR6qGskVzOrco9+dz5N
         clrflSXG8jCJAzS8uempAuKcUDszTNiSruAh52SmdwXVpTeZFXU4yImaTZeR068bI59c
         +RB9Ig+AKK0WQSLtwJ1a+TqJwWXBEhDW9mgd5sl01qmRp4hBxMU6ga0R2sKBORQ4UPpU
         DG6skzUC6ZsKuwL0mrH2sRmBMOcd9UWvAZIi2AWknVWUQdBo8umJJm93d+2Zv5Y36VEM
         R5Ew==
X-Forwarded-Encrypted: i=1; AKwUvByZb6xRdcm0t+Z+Ol88TEQzf2FH1RKPN34GN8bgUsQrt40EMLzqRcEG7LvabvUj2Rm6Pk4sDtWMc4ZoWQA=@vger.kernel.org
X-Gm-Message-State: AFuF++nchWG2fz6Co41zWpreUrKIJNH5t2ZWB25z/z4NL7zGkMRRpRtl
	abJ3dfzuzFCQM3XxgOR0dOXDAuBQKghBcV7hYIhArwipt37hFFXSnvsg
X-Gm-Gg: AYBFou3cUcwMdpi82S2Igdm1a/TXRnuAQftyfdCyupVYt6D5/JdGME8IH/t3SISKj/7
	YRf938pCMRY4imyMxYzx4EUDVrK2ryEQZd5yYhPvOsO+N4JzcNebDGtYd8+rMeAFFa+8RauLhd2
	2A2NerypneUxVHlYUMrK74goLGvI60F5AgUqBmtcbXGEdyyTyw0G5vApk/KjEXNds/uT7bQFQ4b
	pI3Kwe8lWhjSK4PyZJPc3hvqMTUmFRIYJJr1lzMoKCTHBWIrZCnOmVycClsTDAE5avm/opTzVFb
	oS6UbK7CkTCj6jkv/meeVz/HpHM/bF7Zst0v/2hp7LN990fYW70mie8EGgIq/CSOjIJPGMvBfCp
	heQDRIIVJIIbdlCDBhnCEGstki7ijC7+reML4sTM/5+vB25BQtGww87P49tnoDbgx5/heyKbAK4
	BD1xicNTSBlKQR86ITYba+XZNSl2ttk/2qoHpeXWiaPJihI5SJSc4aHCGOaWLRyZUv7JM2kCOZ7
	zAzGM5rLfj+VWEvIQlR
X-Received: by 2002:a17:902:c40f:b0:2d7:107c:917b with SMTP id d9443c01a7336-2db1212ee51mr225631555ad.0.1788681324676;
        Sun, 06 Sep 2026 00:55:24 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm29936115ad.24.2026.09.06.00.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:55:23 -0700 (PDT)
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
Date: Sun,  6 Sep 2026 15:54:40 +0800
Message-ID: <20260906075440.4123076-1-bestswngs@gmail.com>
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
