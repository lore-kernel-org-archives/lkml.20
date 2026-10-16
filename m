Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7630D3AA9D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131005; cv=none; b=V7tXcxx1F0TQ59t4lLpxxccXBKN9bjsMlN8kMsaIeBLBpBoStvrFW+uja6eqC7+CJFjBY8CgXBOxZLq5CojN5jQM9COtcRi0ibyVHATZsh+7tWmD2ukDZg773XpRSYXfEAHghc0BLIxvKJ8DE3Qq+2w9eBnZYivRTjbWUBqLFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131005; c=relaxed/simple;
	bh=+7sClc0UlZ/ro+c8Ux340SLqfAT2DdVzKZer1dA6xpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCAMpS6o+M6eCMSzFcl9IGWfHjr/hV4oTelr8+2MlHpl6T+eNIqRy/hjSTUMuw3eEl5zj1nRs6uLsQa0HegXU3NXstolPusSobRhEF5re12Yv7Lufk1fl5Y06dLLynTIioR3UXLDrX/TZWv4oB0wFeBZncqTH4cL+jZ8Stkfs/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSVcxPEj; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSVcxPEj"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1794194eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131003; x=1792735803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f13zQM70fxdWdbIX13XHJ7wfdDe1cyyalRnX7KMTblc=;
        b=qSVcxPEjabkcsv5GCWo4O5LB2mwzO2Z2u+ie/gkugHfRdxaa4oZtcK2I0Q1eOlIzZM
         5+h5gVdjT/ILJquJlfrNVVd8yWzOQK7yuVTtSqq4UJPWYqDRC6qmb6RzLf+4XO2HZW5O
         UJy/4UdhEKtnLh1xgKghIHFyqTx+Nkwp0tNtXRqoPXKNOhnfRahaKq8yEoCV+fCdEKv/
         9Ht27bI7M2tjsh8GSiwVxOd6B4FJTfKS5T13TCOzC7rHrlbPVIMIohv4yIY1F/LHgvRk
         Dw87EfFXJAOe3c139JUxwSeVG7f7L+oR3JV7TIppc1pml+fY4I/HYuv5q3FmuMlIKA+m
         AKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131003; x=1792735803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f13zQM70fxdWdbIX13XHJ7wfdDe1cyyalRnX7KMTblc=;
        b=ylfxjafQEI7M0/BWt3P0DibKLXfpEvqcYm9RPTpzNpvfGwjVY0rUCSCEK58/xrNd97
         fPsfpbizB4bmDzaT/K/SfF4EqJbRQIIZDezoPBW4XNomrqTngvGTeBGX7tD4goHBZCAe
         hIlI+GYApKCSokGoYj1oAM3JHL1vYsrdVzgLP6aCbevOXflLgwuJVYHs/VPKHitJ16G/
         NiNVPLFp8dJUp9l/MbJ4WKpjxsE8ixNCgCjFddBgeEsAKUmuQiaC3UgaaIO8v95wBK7k
         A/f9CU35YRuWMtN0Ua8TmHUkJskqtFoNa/nNRy4MhlD1Yuau0sY7GoJ5GWNbVw7RskxF
         EQXw==
X-Forwarded-Encrypted: i=1; AKwUvByvsMWiHF5scAUW9W1xgspqLO4X7drYNG7GeozeI0wMrQ8jCdhlG3M0nFO0aM8ALByVTa4cfQnWuuHYr8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV8jG0bDuxb4nvPcbcEDOng8IC7pd1gMW4o1te3I3u8WZB87AC
	XhfEqafdnOZRh/dEea20xfYyeY9pWFExlr4FeQOfNU2AKtviS8oha5S6tvx8KJcGdso=
X-Gm-Gg: AYBFou2SajzD7hm4hHOindEB9NKMKcvsuCBo2mmoemfaslUOIQ2SsTtBLv8z+AiWW/W
	nlKW1Ojda7COT56MQvcmcL+BR+dr6Rv8qo2l/fpqb8uMkBYqw8aQVBL/Qh3V1iQ/g/E72Ele7l5
	knM0gkAtx+vgABWNbbCtoJnI0TcFzEUpCdFSZpd0a0s0SlGViXlqZVhGIK8szfHoBSoPBsOk859
	XyiHtJyT08StFrcwFpDYck3OFLANqFwpA74bohK5AKc/DI3qIAXcE7fNwCKJwwUBtASMjp0u6dC
	RKgYBDKOXiYgOSUDdbELeZaQ8cVQw9V9Twzc842DTOwPYZhAcXcvTpN6cL+NCVYjsnCKajnmSF9
	nMw7QalUGQJ6u+HsGulQHQFNLQSMaIcwkHbhHRsTffWAUugzBpTjthOw/+FK5POONCWPlu3jMgu
	IHuUcdvssCMiVt1/TN4A34nQ0bPqntazd6WxsE2QGEcPUDkgSQTdv1bRSZRFjWsLHyUA==
X-Received: by 2002:a05:701b:420c:20b0:17c:5435:cdad with SMTP id a92af1059eb24-17c5435d082mr12519029c88.12.1792131003386;
        Thu, 15 Oct 2026 23:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm3309068c88.4.2026.10.15.23.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:10:02 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 14:09:53 +0800
Subject: [PATCH net-next 1/3] ipv4: draw rt_genid from a sequence shared by
 all netns
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-net-netns-move-rcu-barrier-v1-1-4157d798658f@gmail.com>
References: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
In-Reply-To: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

An IPv4 route records the rt_genid of the netns it was created in, and
rt_is_expired() compares it with the rt_genid of the netns its device
belongs to when the route is checked. Every netns starts its rt_genid
at 0 and increments it on each cache flush, so different netns often
hold the same value.

When a device moves to another netns, routes cached through it remain
usable until dst_dev_put() points them to blackhole_netdev. For a route
using a nexthop object this happens in nexthop_free_rcu(), which
free_fib_info_rcu() queues from inside an RCU callback, so the
rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
the rt_genid of the new netns matches the cached one in that window,
ipv4_dst_check() accepts the route and a socket in the old netns keeps
sending through a device that now belongs to another netns.

Take every rt_genid, including the initial one, from one global
sequence, so that a cached route never matches the rt_genid of another
netns.

A connected UDP socket in netns A caches a route through a nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
bumped 0 to 20 times before the move, 63 trials:

                                before     after
  trials sending after move          2         0
  datagrams sent after move       2353         0

Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/net/net_namespace.h |  5 +----
 net/ipv4/route.c            | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 46b4c67e2966f..9c78f1d90fb62 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -556,10 +556,7 @@ static inline int rt_genid_ipv6(const struct net *net)
 }
 #endif
 
-static inline void rt_genid_bump_ipv4(struct net *net)
-{
-	atomic_inc(&net->ipv4.rt_genid);
-}
+void rt_genid_bump_ipv4(struct net *net);
 
 extern void (*__fib6_flush_trees)(struct net *net);
 static inline void rt_genid_bump_ipv6(struct net *net)
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f17830..bd52d14476f6f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -393,6 +393,20 @@ static inline int ip_rt_proc_init(void)
 }
 #endif /* CONFIG_PROC_FS */
 
+/*
+ * Draw every rt_genid from one sequence shared by all netns. A route keeps
+ * the genid of the netns it was created in, and is checked against the netns
+ * its device is in now. Distinct values make that check fail once the device
+ * has moved to another netns.
+ */
+static atomic_t rt_genid_seq;
+
+void rt_genid_bump_ipv4(struct net *net)
+{
+	atomic_set(&net->ipv4.rt_genid, atomic_inc_return(&rt_genid_seq));
+}
+EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);
+
 static inline bool rt_is_expired(const struct rtable *rth)
 {
 	bool res;
@@ -3716,7 +3730,7 @@ static struct pernet_operations __net_initdata ip_rt_ops = {
 
 static __net_init int rt_genid_init(struct net *net)
 {
-	atomic_set(&net->ipv4.rt_genid, 0);
+	rt_genid_bump_ipv4(net);
 	atomic_set(&net->fnhe_genid, 0);
 	atomic_set(&net->ipv4.dev_addr_genid, get_random_u32());
 	return 0;

-- 
2.43.0

