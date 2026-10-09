Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7949AA3D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537592; cv=none; b=bkiD7KKTU0e2aY+xGWp5MEBbSqmretjsfs0sOvFJcaJp8i5lkHAttuY8+s1Pmm9aaYdrqwO5ovjRBmXyQEsz++zIOZYZS2h8SPgY5ZawODP2FfCMqRySTV2soHrKTUFEPlmy8fGkl7WEckPqzTcIZp4UUUbWRQNMWjubaESwuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537592; c=relaxed/simple;
	bh=ksBroh4OF2plcmIbcovrByuMBHM7UNbgzBZb/2QTmvE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=idKC5m4tH3oy1qdYbVjHYApFWF4CxOKwEVUOEL5X+Zt0ilSKOrI0mTERMDFKzbJk8/Cwb7Iwtep4xOZIbwP7O+uwRTHxm1yMBUzRv63xAudF2wtWsNAbouZ/eHxy4/Iv3YkKv+OVDBAHTr0kpkTBu/seKZFrmK8r6gf/DPuq6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EBkeodVV; arc=none smtp.client-ip=91.218.175.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EBkeodVV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ksBroh4OF2plcmIbcovrByuMBHM7UNbgzBZb/2QTmvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791537585; v=1; x=1792142385;
 b=EBkeodVVszkZHqmSIuCNd/bn2uVilfdiSSa30Cyfq+EF9mrC74AQRjD4+fXx+sahDHJBCCIe
 ciwWDqscJKsVSOI0x3ht9k5F3y2QP/1onsYti1RyswpBOw722jjrov0g4y2Oew6wmI5Y/VFlENq
 B0VWJ2zar1cJpQHhjUQ1pTdE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38152ee524beeb58;
	Fri, 09 Oct 2026 09:19:45 +0000
X-Mizu-Trace-ID: 38152ee524beeb58
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com
Cc: qiang.zhang@linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] neighbour: Move the netdev_put() out of RCU callback
Date: Fri,  9 Oct 2026 17:19:41 +0800
Message-Id: <20261009091941.5837-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

For builts with CONFIG_NET_DEV_REFCNT_TRACKER=y kernels, netdev_put()
records the caller's stack trace via ref_tracker_free() for debugging
reference leaks. however, the netdev_put() is within pneigh_destroy()
RCU callback, this recorded stack is uninformative, it does not reveal
which code path initiated the deletion.

This commit therefore move netdev_put() from the RCU callback into the
caller's process context, and replace call_rcu() with kfree_rcu().

Fixes: d539d8fbd8fc ("neighbour: Free pneigh_entry after RCU grace period.")
Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 net/core/neighbour.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 6ed8eb075146..4263689fc415 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -818,14 +818,6 @@ int pneigh_create(struct neigh_table *tbl,
 	return err;
 }
 
-static void pneigh_destroy(struct rcu_head *rcu)
-{
-	struct pneigh_entry *n = container_of(rcu, struct pneigh_entry, rcu);
-
-	netdev_put(n->dev, &n->dev_tracker);
-	kfree(n);
-}
-
 int pneigh_delete(struct neigh_table *tbl, const void *pkey,
 		  struct net_device *dev)
 {
@@ -849,7 +841,8 @@ int pneigh_delete(struct neigh_table *tbl, const void *pkey,
 			if (tbl->pdestructor)
 				tbl->pdestructor(n);
 
-			call_rcu(&n->rcu, pneigh_destroy);
+			netdev_put(n->dev, &n->dev_tracker);
+			kfree_rcu(n, rcu);
 			return 0;
 		}
 	}
@@ -891,7 +884,8 @@ static void pneigh_ifdown(struct neigh_table *tbl, struct net_device *dev,
 		if (tbl->pdestructor)
 			tbl->pdestructor(n);
 
-		call_rcu(&n->rcu, pneigh_destroy);
+		netdev_put(n->dev, &n->dev_tracker);
+		kfree_rcu(n, rcu);
 	}
 }
 
-- 
2.17.1

