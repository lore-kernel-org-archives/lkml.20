Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333A35B636
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131012; cv=none; b=nxJb80ws4DLF9Nhy3q6CW9bkyUurR5VZp7XEchV8zsoUuFTfzM4MiACpjR2tRPFyk8i4ttxyp10kaO8VzBESpJ5CZisAG9POSHaJnku9lf6GOT9cUfvBtrOzEZz9eJMfAuXkxpkv5Ckgq+ZWM2Vz+u4ZE+eZdWYDfeE8N5GgIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131012; c=relaxed/simple;
	bh=oBBEDYoVBZtuJY69FsKWBiD2DNZT5QEbmq45iuoyTxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFIv2VTi7PxIrQblm0Od92riBiErp4OEwYlSdiQ5EMgewkjz9iC65FZhGa0E/EeR9nCHlJm0AIrenmsxJPhho//f1P5dYfN7A2MyPTe/pn9BH4waH4E0QVwDDB0ly2zCthdrGZ912ponUAkDF74HxWuWc29jvap3GgPxrrtd/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8TCKSoE; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8TCKSoE"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35ef6b49813so3494278eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131009; x=1792735809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBPraKpKQkaoyQ92vsNpEY13vYFcSFQS5byJNd4kDPo=;
        b=Y8TCKSoEKYgQjhLixSqPqs7pOkTVmevaUa/BXKKCDrTVWa38JLBMKNupdMymTOD+Ti
         Ut+lybLYlpdpoZHgzBUaWKNAu5OvcqmNYCiuliOVHbm2UIJMZ8rlzPmVxO2xUC7hkI/T
         Kd1J3q80RCweQcskBDCbLJJrbqY6NhyI34bAKrJ6OPBfrK9mLAFG+2QkciMHXY/+GEtX
         KA+/gQtr7Dpf4gxLt9y2aMeEUdASO6OsTwOvFTojQixbwuQmGHavvwzWkk7hDl29HvNF
         Ez8DxBRWI7lXwVsyP4oly6JTU8axj0THbTOhAA1IvghL0XZvxGheq/eU5nn0JqjlW7C9
         MBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131009; x=1792735809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBPraKpKQkaoyQ92vsNpEY13vYFcSFQS5byJNd4kDPo=;
        b=WDSLn+cLw630yfuPx5TJELxfoAw/+B6zrwD9lLkRrXU7ZWIu9Hd/VybYGOFdxzzNyv
         gLhOAaiL4tb60BY84R1qyeWzrd/YHR9Uen2+PXybS0s4u0R3sllgMnWYH7zM+jsmAB4C
         6plvjCyLHMfHp8ZW4oraCTfql5d2bBmKSCkPawGnCBdXn0OkNuF+4Aqutxp2etB8/SZh
         dEWn2e2s1nC9OWipblHNdCfPLZNieqhRb+E3063mYPNtAK6nDrZPPxsf7PMRveGptbCI
         Eot7MUpYB7X6Ypz8Ca1Nj3+YtR8TYdfW8TV5oIVBtgHXR/2CvHGHViA+RELGDC/LhVCN
         Db9w==
X-Forwarded-Encrypted: i=1; AKwUvBw+ROvhx32gGUEFnYiQB/hBQUyZmOZMbay7DFt+RRzwvlS/b8vjxxd/yirb00kcAK2cJ4nKSIzcaqFIHMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxraNLtBnycXgMe+CeQoLM+HhWnyM2lVn3yh9yLOb6fPb7LXR2
	o3talrVmaoNND+T+xt60v5+lzAktzV/ldRbJ9YprAVwYE7bxv2LgIRNT+VN75tV6Yr4=
X-Gm-Gg: AYBFou1BKnvn+YjARwiN56y421HITJ2NBk4BgmJWa9a7Cw5uWqEJhCGaOLTagnRXqxi
	sfJu9RDBs5JlD4vMPg5pGR1YDoXCD/1MiTcjweziiECMu8N4ASK6y2rgL9RD9/8tV0Bma4cf4rI
	uyRiKolPN0OjJE3XOJpY76+9agFFfZ2OIVp4/sIzOGWhAJPy5eag7CmU93jyf2nte3BMdxs6sfn
	yDmwnza92G3dS5BHC5c9K75dldbbjDTauNFNrGYfIv1QlLfiFx1g6EsRhvJpVChu3c/L6Os32CD
	NwpceuJWRo5CgGSRGDYr1uqa5YflZFtulegpUTyc4enWpnzsdHPNseF18V80XxwSxdbuBEvuMBj
	ZkwH74JDnMgfxomcNZmeSRQLKTpqLbbQlTa+Czr4Mgmf5QKxeB+h7c0BKsg3WoyyrrHDyT2La+z
	W9ijr6f57vtFJYmkLtDIg+1Km0KcmmB0zzqeFz8o9X09DHJ5eFhT+B4PzoTixwBmpQ5Yw=
X-Received: by 2002:a05:7022:b052:20b0:152:9e88:daaa with SMTP id a92af1059eb24-16a62eaad21mr31386939c88.36.1792131008661;
        Thu, 15 Oct 2026 23:10:08 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm3309068c88.4.2026.10.15.23.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:10:07 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 14:09:54 +0800
Subject: [PATCH net-next 2/3] ipv6: take fib6_sernum from a sequence shared
 by all netns
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-net-netns-move-rcu-barrier-v1-2-4157d798658f@gmail.com>
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

A per-cpu IPv6 route of a nexthop object records fib6_sernum of the
netns it was created in, and rt6_is_valid() compares it with fib6_sernum
of the netns its device belongs to when the route is checked. Every netns
starts its fib6_sernum at 1 and increments it on each tree change, so
different netns often hold the same value.

When a device moves to another netns, such a route remains usable until
nexthop_free_rcu() releases it, and fib6_info_destroy_rcu() queues that
callback from inside an RCU callback, after the device has moved. If the
fib6_sernum of the new netns matches the cached one in that window,
ip6_dst_check() accepts the route and a socket in the old netns keeps
sending through a device that now belongs to another netns.

Take every fib6_sernum, including the initial one, from one global
sequence, so that a cached route never matches the fib6_sernum of
another netns.

A connected UDP socket in netns A caches a route through an IPv6 nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added
to and removed from B 0 to 20 times before the move, 63 trials:

                                before     after
  trials sending after move          3         0
  datagrams sent after move       8187         0

Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 net/ipv6/af_inet6.c |  1 -
 net/ipv6/ip6_fib.c  | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1af..db4cccfdc565c 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -945,7 +945,6 @@ static int __net_init inet6_net_init(struct net *net)
 	net->ipv6.sysctl.max_dst_opts_len = IP6_DEFAULT_MAX_DST_OPTS_LEN;
 	net->ipv6.sysctl.max_hbh_opts_len = IP6_DEFAULT_MAX_HBH_OPTS_LEN;
 	net->ipv6.sysctl.fib_notify_on_flag_change = 0;
-	atomic_set(&net->ipv6.fib6_sernum, 1);
 
 	net->ipv6.sysctl.ioam6_id = IOAM6_DEFAULT_ID;
 	net->ipv6.sysctl.ioam6_id_wide = IOAM6_DEFAULT_ID_WIDE;
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 0dc6ebee6e568..c66466be64451 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -89,13 +89,21 @@ static void fib6_walker_unlink(struct net *net, struct fib6_walker *w)
 	write_unlock_bh(&net->ipv6.fib6_walker_lock);
 }
 
+/*
+ * Draw every fib6_sernum from one sequence shared by all netns, so that a
+ * route cached against one netns never matches the sernum of another one,
+ * e.g. after its device moved.
+ */
+static atomic_t fib6_sernum_seq;
+
 static int fib6_new_sernum(struct net *net)
 {
-	int new, old = atomic_read(&net->ipv6.fib6_sernum);
+	int new, old = atomic_read(&fib6_sernum_seq);
 
 	do {
 		new = old < INT_MAX ? old + 1 : 1;
-	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
+	} while (!atomic_try_cmpxchg(&fib6_sernum_seq, &old, new));
+	atomic_set(&net->ipv6.fib6_sernum, new);
 
 	return new;
 }
@@ -2466,6 +2474,8 @@ static int __net_init fib6_net_init(struct net *net)
 	size_t size = sizeof(struct hlist_head) * FIB6_TABLE_HASHSZ;
 	int err;
 
+	fib6_new_sernum(net);
+
 	err = fib6_notifier_init(net);
 	if (err)
 		return err;

-- 
2.43.0

