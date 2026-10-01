Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4547989A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879385; cv=none; b=qpEmGEIjDA5Z8CiETFVVrDCbQlM12es2qapSfhuAlU7UD3a04dqizj5lwdW6RAJinSYG0oRLqtRzYZCyQ22UCq0M92+dIc3VmFcUJQE33zjz6kS+UFGbQQhhHxVzbXoJp/SNA61h8GJ7dkXRo06lnxSMmj7KL1wIX/+TDvQQ9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879385; c=relaxed/simple;
	bh=+tSKOGm+RD0TxPAiimCSasZvCi4oE54RpY0Sh3kgh3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6xpI8KUKye80WqA3c6K/a8gLjH0PYfs64ZkAwBZVbERJbov7J0w2cxy9EPotWU5glfGgpKxxuCaOOCVNKywymkCuOSN07rsF9k5gcF1jF4N+1WQLp+8D+M0tPsvNapuWaW7HM57wZPbu2PDXbbOWsYCwXKhsomHvwNGLmn0NXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQQ8zgEY; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQQ8zgEY"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144ef651963so158834c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879382; x=1791484182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5md9S1nVYWF/VDlHTUOI2Swr9RpR1ryzS2tAkBfaDN0=;
        b=gQQ8zgEYi3Ekt2Y0j4KorHNF2cfYL1Aizo9zdiETyqged9Oiv83RYlkm8O8E/syBLP
         UwJHraenzA5lcXaFTi43IVfwJhQHeX+T4TUiAHK5cYR66nXX8ZvUZ+6JtZEeLQFMOp+T
         yhi+vZsrXdXXm1HIkdStXMgYgzL2Tt+lw17v9ZyTciHmQ9GwV7a4gffu4nY6ciCBP/9l
         5kvOUgqa5NbiV0sPCYbCutzGVhRH7PpvrHJN/LtonTLBxNDQI4kbdPb+Q17JN7yO3hqj
         FscAuTUpe9t0mFdySDt3vPWBuG4HWn1+KKa7BGr3DA5ujxHVjeQcCC9fengKYxoe6n3M
         byeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879382; x=1791484182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5md9S1nVYWF/VDlHTUOI2Swr9RpR1ryzS2tAkBfaDN0=;
        b=ajqau9c/o6Yxu2ycoN9I9YXtleo0ETSJGAQb2wXheAMyfBmRdvrFPfALJCyaRmQCYm
         0aySxDKfDoZsY4q+H6pj6vxKfru4Ax+2GJFtW8xWrWQLweqj9DcucumX6+MVj2MlZ+8L
         ZB8M5EMPaFdnRFcsbPmvHgA8/lyZ+Tw5s539e0YDQhPGpmG7BEHlVdiisU70nkgeF4eg
         1h7CTwiVh70daZbo7Ha7aTChB/z1XcjX3NJ6oAbKEAogfDCojaQUK7tLBR9SONQHn54c
         anIqjmTGjUR7DpIjKPhe4yAgsZYeZL0lS8+VRj9Us53aUeKTZx4hnhwvXIPw9G0uGCg9
         8G2w==
X-Forwarded-Encrypted: i=1; AKwUvBxzOHhJi3/q9Be+C4v338WrcAX/bJ+oWNphF/T0Ci2P6xqlva+WGGjm+98wvr9URNwtCklQsS+yQC0Z2fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nkx2VVDO+UdCygjWjDM2nAEOPpNT5P0uM2zBq7+IWb3t+zMJaO
	e575m5TfV8ExhxwE0m5/41XBPRJck53hP03bodgW3crwhO+gv7RHCMr6
X-Gm-Gg: AYBFou3K7W0gdcDfGv+vJFa0t98IgcZhNKb6Raxjush/5WweqvqqJYr3wo5MW1UzslJ
	kVqfbm31hEUeYF6Sbt8vkXOBwSEv8zXGL2dfBSuVlja7rGMPyRZIItGHkY8sF9LnVDh046Lfc0C
	jgNDb/a12HnuX6exuB22cT+lvZah95ivSeEthICUW5oUSTU08Lif3fWr4bN7f9JHGJX65TQvWNR
	ON+2k0ooYYWuagU3FKKIjWkIerGfA2hIH5ev/G76wkgFiEb5yYParb5lhYV2nFdLiIv+lFaKbL9
	QqIvApmbAmnHBFzB/jtmuP9VUBsjQ5X73B2KiWRbC9HZe+AeHtYujzH28RSgBdKk8irm5H7M+ud
	SZEAcT4e65CKeALwIIuGkumJI3olD7CuvoyHLDZ6bSE1dTH1kelUQmfjgXdFuIpLVsiQi/U4s1F
	uNo9QpBb4O5ngBwUhlWhzyrZ3AhdY08AO1/UIwlTHgi+8YQfu7c36dZ/lgnwsE1ufMrkY07N2V4
	P1AlkWfWMRrFBi6eC3LnPqHTQPRzvCL0keFk1FgkhlD89GL6aWWbjNAMcXkJDTUHWnfLA==
X-Received: by 2002:a05:701b:4519:10b0:144:ff51:2d73 with SMTP id a92af1059eb24-14d34dbc801mr8355239c88.2.1790879380890;
        Thu, 01 Oct 2026 11:29:40 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f43eba13bsm390711c88.2.2026.10.01.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:29:40 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] tipc: unlink publications without a node lookup
Date: Fri,  2 Oct 2026 02:29:23 +0800
Message-ID: <20261001182924.3928331-2-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001182924.3928331-1-nicoyip.dev@gmail.com>
References: <20260927180806.1315902-1-nicoyip.dev@gmail.com>
 <20261001182924.3928331-1-nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two remote-publication removal paths remove a publication from the
name table and call tipc_node_unsubscribe() before scheduling it for
freeing.

tipc_node_unsubscribe() looks up the publishing node by address and returns
without unlinking when the node has already disappeared from the hash. The
publication is then freed while its binding_node remains linked, so a later
publication-list traversal can access freed memory.

Both paths already run under nametbl_lock. Unlink binding_node directly
under that lock instead of performing another node lookup. For a valid
remote publication, binding_node is either on the node publication list or
is initialized as an empty list when subscription failed. Remove the
now-unused helper and address arguments.

Fixes: a8f48af587b0 ("tipc: remove node subscription infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/tipc/name_distr.c | 11 +++++------
 net/tipc/name_distr.h |  2 +-
 net/tipc/node.c       | 20 +-------------------
 net/tipc/node.h       |  1 -
 4 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index ba4f4906e13b..acf96562608b 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -227,12 +227,11 @@ void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities)
  * tipc_publ_purge - remove publication associated with a failed node
  * @net: the associated network namespace
  * @p: the publication to remove
- * @addr: failed node's address
  *
  * Invoked for each publication issued by a newly failed node.
  * Removes publication structure from name table & deletes it.
  */
-static void tipc_publ_purge(struct net *net, struct publication *p, u32 addr)
+static void tipc_publ_purge(struct net *net, struct publication *p)
 {
 	struct tipc_net *tn = tipc_net(net);
 	struct publication *_p;
@@ -243,14 +242,14 @@ static void tipc_publ_purge(struct net *net, struct publication *p, u32 addr)
 	spin_lock_bh(&tn->nametbl_lock);
 	_p = tipc_nametbl_remove_publ(net, &ua, &p->sk, p->key);
 	if (_p)
-		tipc_node_unsubscribe(net, &_p->binding_node, addr);
+		list_del_init(&_p->binding_node);
 	spin_unlock_bh(&tn->nametbl_lock);
 	if (_p)
 		kfree_rcu(_p, rcu);
 }
 
 void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
-		      u32 addr, u16 capabilities)
+		      u16 capabilities)
 {
 	struct name_table *nt = tipc_name_table(net);
 	struct tipc_net *tn = tipc_net(net);
@@ -258,7 +257,7 @@ void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
 	struct publication *publ, *tmp;
 
 	list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
-		tipc_publ_purge(net, publ, addr);
+		tipc_publ_purge(net, publ);
 	spin_lock_bh(&tn->nametbl_lock);
 	if (!(capabilities & TIPC_NAMED_BCAST))
 		nt->rc_dests--;
@@ -307,7 +306,7 @@ static bool tipc_update_nametbl(struct net *net, struct distr_item *i,
 	} else if (dtype == WITHDRAWAL) {
 		p = tipc_nametbl_remove_publ(net, &ua, &sk, key);
 		if (p) {
-			tipc_node_unsubscribe(net, &p->binding_node, node);
+			list_del_init(&p->binding_node);
 			kfree_rcu(p, rcu);
 			return true;
 		}
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
index bd91378b7540..0e333f952c4f 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -422,7 +422,7 @@ static void tipc_node_write_unlock(struct tipc_node *n)
 	write_unlock_bh(&n->lock);
 
 	if (flags & TIPC_NOTIFY_NODE_DOWN)
-		tipc_publ_notify(net, publ_list, node, n->capabilities);
+		tipc_publ_notify(net, publ_list, n->capabilities);
 
 	if (flags & TIPC_NOTIFY_NODE_UP)
 		tipc_named_node_up(net, node, n->capabilities);
@@ -671,24 +671,6 @@ void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr)
 	tipc_node_put(n);
 }
 
-void tipc_node_unsubscribe(struct net *net, struct list_head *subscr, u32 addr)
-{
-	struct tipc_node *n;
-
-	if (in_own_node(net, addr))
-		return;
-
-	n = tipc_node_find(net, addr);
-	if (!n) {
-		pr_warn("Node unsubscribe rejected, unknown node 0x%x\n", addr);
-		return;
-	}
-	tipc_node_write_lock(n);
-	list_del_init(subscr);
-	tipc_node_write_unlock_fast(n);
-	tipc_node_put(n);
-}
-
 int tipc_node_add_conn(struct net *net, u32 dnode, u32 port, u32 peer_port)
 {
 	struct tipc_node *node;
diff --git a/net/tipc/node.h b/net/tipc/node.h
index 154a5bbb0d29..a5f060b622a7 100644
--- a/net/tipc/node.h
+++ b/net/tipc/node.h
@@ -104,7 +104,6 @@ int tipc_node_distr_xmit(struct net *net, struct sk_buff_head *list);
 int tipc_node_xmit_skb(struct net *net, struct sk_buff *skb, u32 dest,
 		       u32 selector);
 void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr);
-void tipc_node_unsubscribe(struct net *net, struct list_head *subscr, u32 addr);
 void tipc_node_broadcast(struct net *net, struct sk_buff *skb, int rc_dests);
 int tipc_node_add_conn(struct net *net, u32 dnode, u32 port, u32 peer_port);
 void tipc_node_remove_conn(struct net *net, u32 dnode, u32 port);
-- 
2.43.0
