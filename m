Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A422D5932
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532506; cv=none; b=GZvwibSJu0UxWdSlYFqOQ2Asj30m97g6guD0K3FvjnexBXxUOfnWegypoqst251+DWsvz4cmAW8h8qOIxKycBZz0+DYnxYBGzzYrYOQH7X0hjfhiZiE0CuZ1BIFaVnC5LB27KtzW3EZ6k/eExYSImt38xdT5X0QafPyGcwVe8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532506; c=relaxed/simple;
	bh=VnksSJKPRCXI/vrcndYbIPt3bVkviDrdnJUbyS4gv74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRF8A8k3+RccMmhT7yNwhdsyLQ2guekTVhmt3IZC4qWDCkhREnwVBSdO2Beo6m3nf5ZaEzPwNrWUyPtoShqcrtmawXYIWXNaTX1pnGEDRjwS7ShKMJmyq/gfQN0rSenJ6MNZQByQpGwsLuCxGIs2s1xv5ewanKBijBIIYcjM0bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8Q1zjYq; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8Q1zjYq"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso282894eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532504; x=1791137304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PcQ0jxT47qaNp7QTdGykUGwrxjWzMt3AH/vKw1fjhoY=;
        b=L8Q1zjYqtvY+lHWn4dbMYt63GmYplYEcS57EeM4zRh+O/ibFaEV1QPo7XLR1QbVxfR
         tvqiJBDJ+XhJkd9CrDUzRMm3L9lPp+szth4BzDoaok8n9G5MRYLZjQthW2cp3/J29pkc
         Vb2pDtpDOtwX6pexnc4I2dl35hCrucq77Yma+DT8BILbMuCoeMU/8xmW8DmQe3oRoA2h
         abwOdJiwoNWDnxO3U+MQO50L3y2Rhpr34fBCqDDrJticczvGRgsCOU5wkYdPpLyG/UU9
         L2tjsle74PoPEvCGBVvycpWcwWLcGYZXQNoAUXycUqTEKOOa37/PvpROeCD4uAhfLFrv
         vORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532504; x=1791137304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcQ0jxT47qaNp7QTdGykUGwrxjWzMt3AH/vKw1fjhoY=;
        b=Ad0RvfIxyBkzxM27M/XPgqdCCJ2e8s+V5NDqwJMvf+RVI/AOIkARAA2sWNcIm132hx
         6xibzttvls7afFjQ31eV68sHcK6BHNxET7xBFj6xdXUc4MCUkK1NZKCJ9om+Ug2KwCWe
         iOHXGHGvT1sGqhjPjhVzJrPCti4wUG6VA3WR9aPsOkr/NNjXBmpoJxBtALEdCBWtWjo0
         NU1SXhSo25hgLm8GJaTNtVwFM32iu7Cer23j0oejLzg1CN1Oh6+Pg1j8/Dhvm0806f+9
         MKtvyMMSg+29IJmqWgMWn/ndunguWcmbICh73XS10OLwYta2LwXMT2IXUwsn5t2QpiGQ
         tXEg==
X-Forwarded-Encrypted: i=1; AKwUvBy9UKh38A+q8j+NUTX+qx08muJmMiO+KdDMN/5oGAMQwEyDuPls4CbUqtvWHxhOz+UIXnVCas7pDPzctwg=@vger.kernel.org
X-Gm-Message-State: AFuF++keaffBFdx7mj+/8KuJ9NRIWXHwQxut2Yr6Mho4bHiBDpbXXnV6
	pUS3d7nrt2JOFF7Yovml65E1rf46MruKHeB9EhIsGiQRs1urPM/2OZnhJM6TTfJTKnWs5A==
X-Gm-Gg: AYBFou3sQZjAlkzPvv5zAx+JUz8RZWLKJwWsX71WCX88e2e6o4Tx12NXYgGPz6DUqeX
	IFKrno6VqPVld8MUGq3opUPpuDn5JjX2K2y1KOOXkSyhDGG72SI3A/14HfgYmCBlQNrgOBsZzxx
	Ysdq0ufLUj2f/f+1IvIj28m2mvn2NcPTCo2o5m++3QU1z+YJ+v2tJRSe7JIGaIQ8GNL8zkCVB50
	7tKok6wrzh0RHIrIb2Im8HDdGTcW+LdP+LF4GY39UmCkzxo7yhCpBAFbFZ0y9zS4YLoa1TO3MgG
	Y8RuAlQqwVvC5DuWQHuqoxWW/ckdvhkiNTChI6ec1EcwLuVnQB4gK8FTZSeAXjwma7MrP368Sb8
	v+gx69smDkWEAMhF24F+uVSKHAq/gd8QxAbflL2h9BE+Kf2jgG3hNbQkabuGvh2cJbQle9rIOht
	k2Cy636q6134YXkB43a1PZDJssvd69YO7XkHjjvEV4AiFncvztc+H2M84R+2+al1yEwUpMYvi/T
	VFOYgY0pMpLbwmezp+sTPcH1jjIjdD6/B63BwaFpiEIQfM4xvD/t45AsqBKTCU6E49sMz0=
X-Received: by 2002:a05:7022:ed0e:b0:149:c766:2965 with SMTP id a92af1059eb24-149c7662eb8mr440548c88.2.1790532503606;
        Sun, 27 Sep 2026 11:08:23 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm19502616c88.15.2026.09.27.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:08:23 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>
Subject: [PATCH net] tipc: serialize publication purging with name table updates
Date: Mon, 28 Sep 2026 02:08:06 +0800
Message-ID: <20260927180806.1315902-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tipc_publ_notify() walks a failed node's publication list after the node
lock has been released. Its list iterator is not protected by the name
table lock, which is only acquired inside tipc_publ_purge().

CPU A can save the next publication before entering tipc_publ_purge().
CPU B then takes nametbl_lock in tipc_named_rcv(), processes a WITHDRAWAL
for that publication, unlinks it with list_del_init(), and queues it for
freeing with kfree_rcu(). CPU A advances to the removed publication and
loops on its self-linked binding_node, stalling the CPU.

The kernel reported:

  rcu: INFO: rcu_sched self-detected stall on CPU
  Call Trace:
   tipc_publ_notify+0x3b5/0x650
   tipc_node_write_unlock+0x49d/0x5d0
   tipc_node_link_down+0x15c/0x4a0
   tipc_node_delete_links+0xfc/0x190
   bearer_disable+0x111/0x270
   __tipc_nl_bearer_disable+0x1db/0x2f0
   tipc_nl_bearer_disable+0x1c/0x30

Locking the entire traversal would also prevent the race, but would hold
nametbl_lock with bottom halves disabled while purging every publication.
A node with many publications could therefore cause excessive lock hold
times and delay other name-table operations.

Move the failed node's publications to a private list under nametbl_lock,
then select and unlink its first entry under the same lock before purging
it. Concurrent withdrawals can still unlink entries from this private
list, while publications arriving after node recovery stay on the node's
live list. No publication pointer is carried across an unlocked interval.

Unlink before the table lookup to make progress even if the lookup fails,
and acquire and release the lock for each publication. Check the private
list under the lock on every iteration, since concurrent withdrawals can
still remove entries. Keep withdrawal notifications and the final
rc_dests update in their existing order.

Remove the failed-node address argument from tipc_publ_notify() and its
purge helper since unlinking no longer needs a node lookup.

Fixes: 9db9fdd1983e ("tipc: avoid to asynchronously notify subscriptions")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6-Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/tipc/name_distr.c | 34 +++++++++++++++++++++++-----------
 net/tipc/name_distr.h |  2 +-
 net/tipc/node.c       |  2 +-
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index ba4f4906e13b..34867b69044c 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -227,38 +227,50 @@ void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities)
  * tipc_publ_purge - remove publication associated with a failed node
  * @net: the associated network namespace
  * @p: the publication to remove
- * @addr: failed node's address
  *
  * Invoked for each publication issued by a newly failed node.
  * Removes publication structure from name table & deletes it.
+ * The caller must hold nametbl_lock and unlink the node subscription.
  */
-static void tipc_publ_purge(struct net *net, struct publication *p, u32 addr)
+static void tipc_publ_purge(struct net *net, struct publication *p)
 {
-	struct tipc_net *tn = tipc_net(net);
 	struct publication *_p;
 	struct tipc_uaddr ua;
 
 	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, p->scope, p->sr.type,
 		   p->sr.lower, p->sr.upper);
-	spin_lock_bh(&tn->nametbl_lock);
 	_p = tipc_nametbl_remove_publ(net, &ua, &p->sk, p->key);
-	if (_p)
-		tipc_node_unsubscribe(net, &_p->binding_node, addr);
-	spin_unlock_bh(&tn->nametbl_lock);
 	if (_p)
 		kfree_rcu(_p, rcu);
 }
 
 void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
-		      u32 addr, u16 capabilities)
+		      u16 capabilities)
 {
 	struct name_table *nt = tipc_name_table(net);
 	struct tipc_net *tn = tipc_net(net);
 
-	struct publication *publ, *tmp;
+	struct publication *publ;
+	LIST_HEAD(purge_list);
+
+	spin_lock_bh(&tn->nametbl_lock);
+	/* Leave new publications on the node's list during the purge. */
+	list_splice_init(nsub_list, &purge_list);
+	spin_unlock_bh(&tn->nametbl_lock);
+
+	for (;;) {
+		spin_lock_bh(&tn->nametbl_lock);
+		if (list_empty(&purge_list)) {
+			spin_unlock_bh(&tn->nametbl_lock);
+			break;
+		}
+		publ = list_first_entry(&purge_list, struct publication,
+					binding_node);
+		list_del_init(&publ->binding_node);
+		tipc_publ_purge(net, publ);
+		spin_unlock_bh(&tn->nametbl_lock);
+	}
 
-	list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
-		tipc_publ_purge(net, publ, addr);
 	spin_lock_bh(&tn->nametbl_lock);
 	if (!(capabilities & TIPC_NAMED_BCAST))
 		nt->rc_dests--;
diff --git a/net/tipc/name_distr.h b/net/tipc/name_distr.h
index c677f6f082df..8debe23469b2 100644
--- a/net/tipc/name_distr.h
+++ b/net/tipc/name_distr.h
@@ -74,6 +74,6 @@ void tipc_named_rcv(struct net *net, struct sk_buff_head *namedq,
 		    u16 *rcv_nxt, bool *open);
 void tipc_named_reinit(struct net *net);
 void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
-		      u32 addr, u16 capabilities);
+		      u16 capabilities);
 
 #endif
diff --git a/net/tipc/node.c b/net/tipc/node.c
index bd91378b7540..9a218d137c45 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -422,7 +422,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	write_unlock_bh(&n->lock);
 
 	if (flags & TIPC_NOTIFY_NODE_DOWN)
-		tipc_publ_notify(net, publ_list, node, n->capabilities);
+		tipc_publ_notify(net, publ_list, n->capabilities);
 
 	if (flags & TIPC_NOTIFY_NODE_UP)
 		tipc_named_node_up(net, node, n->capabilities);
-- 
2.43.0

