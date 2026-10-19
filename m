Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A144AB9D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380690; cv=none; b=hYlNCh6GZz1zijhCQRpyyemUir0qOP5dqWSdgqzrK6Yb+4k8PE+CGdbFwgx6Vfsvw7CL2E7d+yO8ZwKKFbbpZh/GMiYoIcfk42IfQmZC61yaPYMBwQ/cb1WA9SAgGE7mkttySrrDEIO5+3GZbk/Xdu654oWKH2Dh+b+QaMqZexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380690; c=relaxed/simple;
	bh=dIq6qrc1e9Bk4GIRyTfmsnU4wHw4dimFgnQZ0tYtgj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/zcwlgJNFuMgSwPdN6RrB2AwnDx5BHSbvWReB3iWUNJ+ta3HDdAVt3k9vu46PW32eVa1fJbzk93SUXoq2o4TQcP1FZU2LtXmsql/yltKO1ffEW8MoZs6netDJHLxxBAyS0Yiu/wjzGLlvSsP04KCqDGi6b8hPWXuTnw3dfFm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb/hrj5J; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb/hrj5J"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso826068eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380688; x=1792985488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhPFrORjmIGaZYE0+P1kAEa0ZZRQrSUJiPNFZU9S9p8=;
        b=Gb/hrj5J7rINp0C5NlliA3BSB6GQ/RPFtGl8q51NhgcLfEV0QxjEQTWKMyBeAMYGEu
         i3W/UXjw7VbadmFfSwvAMVJkx2cF4665fghxmNJYvJQ27eWEicZXVHbZYdvEeYBNLCW0
         RnTg0J25di3hvbVb1IBbs/qSiL+Wmaw7TiycvnB5Hna9nln9CTkFh2a3Ry0iUvPxcGNW
         hjc6tgbFnpc0lCi4CX9vds6XNO4ITJIzw0xajjOMC35fU+LH3rvqBwKsmSCwccTsCAPk
         OsShRiG0vYCjc4UsiDHV2OXGRFmzMJCUMlB+dRrSGRuCITo/vLBfJXlhMS8DA+uJmM98
         ZhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380688; x=1792985488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhPFrORjmIGaZYE0+P1kAEa0ZZRQrSUJiPNFZU9S9p8=;
        b=mVFbynWn6EgI8RKyq9dn8Zrc30sTMscjfnm0qp4BTwSyh6gg9iOP8+Ndd2wSANUPbs
         qLXZXCURRIQ7jxgXkyx8lUnYsLFjRCjS0Kd1xzvhhxly/CeDidjTKqnph4E019I2a2vS
         Yy7m82efJSXEkopY3JfRzCJ1iu8gTx6RPqH8Rrd8KkQpvBl9ZJ1eEd0m4SxHuDr1ryqC
         Dk1xkD9AAWcvJ7Ab7PjsldmvCQq2zscZN7eM4Ha++fRydT3xPL1Wdre3lpq+JKY9ikRo
         9TnqZpAcedECM4zn8CbV3HhuLsjcJXKaNZIGC5BPipoZIV7nlhnpwZ3HLmRhXhgAu0rQ
         HkoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/fUU9RUOuzJStwA6bactytScCb2muvCzefO++1jJUs5JXv0s4ADWAd+nleE4YZ882lgdvRNFyqHEGsm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtN7EiZkaB7PmMwavlJYZxzmf4veWumU0SRCJM8gGMLn7gDdnn
	PIX0uPp/mQzdw85sBr82AXTtBJGZA+4CixYfhdRSnwUEHtc0NYZnTLWf
X-Gm-Gg: AYBFou2KJB04+ZHFFHfTS/rjg+feKYCf1P4lF41+zvLJO6Rci+ELi3vIagwrMO1gNHV
	oLEjMWYmZiIPOSQ3lMFCS4i4RU2l6TkahxIv6T6+wcMx2FGr6AtRXhZkybot1A971UZqTjAarik
	pFcjmLdpH7yGKB2jVaCBEilpLyAw6N4NMLSXDMpU/PbsBehkEjG+c4v22+ywQYnLkwFaU2OoRzv
	bHMeQcKEgWj5do9xUTcNYamf71469/4SV1qayAPnnETFoWCsuLeWn9v2vm1Ke3iFfJHX2yfGciZ
	YlcNGkmHzQOZdoLsgyz1LfdhdkKY3SrciL689a+p9hreqSmmC3LQxJ04OISGGI7jf1NouvdM2kG
	hCDeXoAgrOIusxPIMcBu8xQIuTrR6TKRR9Vb/+96i32/50ZMhrtbgbztR/DrGb0q1iAAdWdJvJT
	Mx627ia6OgvoerlST/8k3ppqsxRZ5e0Zqg7UehJyf0yA2sUgPXkEHsaGWNQN32mMyaeA==
X-Received: by 2002:a05:7022:b881:b0:153:7a27:b89 with SMTP id a92af1059eb24-185139aa881mr8936290c88.21.1792380688183;
        Sun, 18 Oct 2026 20:31:28 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm24066888c88.5.2026.10.18.20.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:31:27 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 11:31:16 +0800
Subject: [PATCH net-next v2 2/3] ipv6: take fib6_sernum from a sequence
 shared by all netns
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-bug-net-netns-move-rcu-barrier-v2-2-b6eb7780c492@gmail.com>
References: <20261019-bug-net-netns-move-rcu-barrier-v2-0-b6eb7780c492@gmail.com>
In-Reply-To: <20261019-bug-net-netns-move-rcu-barrier-v2-0-b6eb7780c492@gmail.com>
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

Take every fib6_sernum bump from one sequence shared by all netns, which
only hands out values from 2 up: every netns still starts at 1, and 0
means there is no sernum to check. Every netns bumps its fib6_sernum
when a route is inserted, so before a route through it can be cached,
and the new netns does so before the moved device can transmit, when
NETDEV_UP adds a route through it. A cached route therefore never
matches the fib6_sernum of the netns its device moves to.
fib6_new_sernum() callers only hold their own table's tb6_lock, so two
tables of one netns can store their values in either order, and
fib6_sernum is no longer monotonic per netns. It is only compared for
equality, so this costs at most an extra invalidation.

A connected UDP socket in netns A caches a route through an IPv6 nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added to
and removed from B 0 to 20 times before the move, 63 trials:

                                before     after
  trials sending after move          1         0
  datagrams sent after move        251         0

Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 net/ipv6/ip6_fib.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 0dc6ebee6e568..28d20d6def401 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -89,13 +89,22 @@ static void fib6_walker_unlink(struct net *net, struct fib6_walker *w)
 	write_unlock_bh(&net->ipv6.fib6_walker_lock);
 }
 
+/*
+ * Draw fib6_sernum bumps from one sequence shared by all netns, so that a
+ * route cached against one netns never matches the sernum of another one,
+ * e.g. after its device moved. Every netns starts at 1 and the sequence only
+ * hands out values from 2 up: 0 means no sernum to check.
+ */
+static atomic_t fib6_sernum_seq = ATOMIC_INIT(1);
+
 static int fib6_new_sernum(struct net *net)
 {
-	int new, old = atomic_read(&net->ipv6.fib6_sernum);
+	int new, old = atomic_read(&fib6_sernum_seq);
 
 	do {
-		new = old < INT_MAX ? old + 1 : 1;
-	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
+		new = old < INT_MAX ? old + 1 : 2;
+	} while (!atomic_try_cmpxchg(&fib6_sernum_seq, &old, new));
+	atomic_set(&net->ipv6.fib6_sernum, new);
 
 	return new;
 }

-- 
2.43.0

