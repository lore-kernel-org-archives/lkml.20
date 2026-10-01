Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AB47F3B6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879389; cv=none; b=AdqLdagSw++QguEZgo7fqwsaRNMKuPWQDb2d4+0OYKixNZhbpCKQAxGsodxGHtBE/+jJjWAf8NWaPUUcgnK1QMSLwRK7WJzStFHChAgI/8Cv5zsAurV/MsnKn4iTlR56/56LnDB8OaliPFsNA1/mbtGqgUqYdTTqCwqdJOn6euo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879389; c=relaxed/simple;
	bh=H0OQ9fbBz4C1CdWWm6C/9Oh0gz6pi2shWsBxRl4Fc2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2Zp80YAvtJpNPAIn1EgLAqM6T3WC++gO2RX3tx37Y0a+7BYkWu5yH0gpLuFDX7flUa4R10fUCLhx/Lqk7AdS/RrVwWguJPx1jzsbyjiS5pWItjGyUBnrwhbX83afWYxKPFse6n/5WraE3DTESiyg2sxOHRWalPwCQRuUBKi3lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtR/ocEp; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtR/ocEp"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so284822c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879387; x=1791484187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFSAdUm5yxIFTZmO3YoJ4yT8H8a/ZBsns03lqQcOJvg=;
        b=XtR/ocEpbBeaOrr0wtm+q/xjL6clwC2fQq+/RJbobQsIZIpEG1uviMiVo8ycHQwIne
         6rbstSsr+ToJUgoaBsX4YIP/l2XS4yyMhAITmhfqTMFGLOMCELw+kQ+sgxSMx2D4clR5
         jpQbmxGL7UuSXaC6/gWdKYIQhGY5Bnei4yTfLyecGV391it3yFfxFVhs0Xf+5yNPbZ6Z
         1mtdjGyFU6T9PGc9WidX0Nt4b83Me2Q87j/gP9O2HYbG7lSVIhpyV5xJ/KfTPt7JCnr1
         X0y+5AsscyEGxEdPI7X6pmKG4/j2I+eTaI2e28xGBh3N0C7F1mkDy+dpWyWtHnGL3T7W
         +juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879387; x=1791484187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFSAdUm5yxIFTZmO3YoJ4yT8H8a/ZBsns03lqQcOJvg=;
        b=LQDVJdGcJBI/oFqrRwfcAT3NSkIOh+Bm3ZazVBp8Kq1Xo4Qd3hKw+BLVsSi9jQY9Fz
         EAGsFCPQsB4ES5eZtHtYWB1kH6GmJAya5HOrdjzGnad675O+UZnwXF4ul5k5eWf7HBBl
         YuGPDZtSqhGzDa73olL0APo6QLOEPGxCgea02T2p8ilB2Fp0p4P18x3Lki6pQZ12go+W
         ebXul92rvzyknBPbyIqWOu6/x3jQHpTLWY5igCFBRsvHdrThj7qQDaYhqPrsyXjJEJLs
         3Re9NKf5pTSxyWJVG0dqTYJ9BWLcC0Q/mgoFLKD07hDKBBxDhcatHby2jJZYbFV0U2N5
         3jhg==
X-Forwarded-Encrypted: i=1; AKwUvBzmgssjQ8nSyp0zSkOD9CuElwQEho2smmYTqdMci6olA4mNGCCYXnFFo88GfhKrTnpBt+VaQEcvsz9gZaU=@vger.kernel.org
X-Gm-Message-State: AFuF++n5ZEt2IG0rtA+r9hNSdUdePl1039ryAtIMtFoxbtNnHhEkprZ5
	Xvir0JUTDu3iQxbsSNhBlwWOvVR1W5uu+7rO767IW3w5sTrzkV5MazeL
X-Gm-Gg: AYBFou1szzBE5PVZcj96CEl8f7RTaLQj6BvbpP4WMwzjTsZlLeyJJmYc3A56KPqIzsU
	OS24+RJznMBVfj7rz1ttel/hzdWtqUd+ddCoRhhum/gfvvTESUJodbrtj1De7p0XYEpdCXcOToG
	g8ln286LXyR86G2kEjQiOpf6MyuAGg1FG/iT5kleASx4Dojsd8kRGFxughx7LZ3pa827eZwF1bO
	aQH4FEFSj/z1uenOc3clWNgupe0RXAj+wvfqUkJcbCRpN/ZJNRheoueELaaVib7bnnSv0CJj7jS
	hI9F9XNnaXtw3bceuLY6RjaYaxIkywb+HD1jgluwViZUL5QIQeODVTellO0m3n5qoWXiOYrvmXp
	ZUkhxhlY/yH9u1KHmOSv3pIUIa+UgSqSaOYcLujHxoPRFZ7vBebHCf4wgPjX8rdYiOhAOax1Nl5
	qQwQzJp7YNyiTUzERS5qEq+TFDprw71VeKOuTo6ofZZEf3hqvAfGm8D0lhbedCMQX+QZfUzWBoR
	wicco5nnIrL7SaDOGD3TW6W3JK8Hyol2ii9kV+HafGncPiTzkvyK0+ZZbhydi8ySkbXRQ==
X-Received: by 2002:a05:7023:a4b:10b0:127:def:dd72 with SMTP id a92af1059eb24-14d32ec218amr9146225c88.2.1790879386731;
        Thu, 01 Oct 2026 11:29:46 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f43eba13bsm390711c88.2.2026.10.01.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:29:46 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] tipc: serialize publication purging with name table updates
Date: Fri,  2 Oct 2026 02:29:24 +0800
Message-ID: <20261001182924.3928331-3-nicoyip.dev@gmail.com>
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

tipc_publ_notify() walks a failed node publication list after the node lock
has been released. Its safe iterator is not protected by nametbl_lock,
which is acquired only inside tipc_publ_purge().

A concurrent withdrawal can unlink and schedule the saved next publication
for freeing. The purge iterator then advances to that removed publication.
It may access freed memory after the RCU grace period, or repeatedly follow
the self-linked binding_node before then.

The decoded causal stack is:

  tipc_nametbl_remove_publ net/tipc/name_table.c:543
  tipc_publ_purge          net/tipc/name_distr.c:244
  tipc_publ_notify         net/tipc/name_distr.c:261
  tipc_node_write_unlock   net/tipc/node.c:425
  tipc_node_link_down      net/tipc/node.c:1094
  tipc_node_delete_links   net/tipc/node.c:1325
  bearer_disable           net/tipc/bearer.c:414
  __tipc_nl_bearer_disable net/tipc/bearer.c:992
  tipc_nl_bearer_disable   net/tipc/bearer.c:1002

Move the failed node publications to a private list under nametbl_lock.
Select, unlink and purge one publication during each lock acquisition, so
no publication pointer is retained across an unlocked interval. Concurrent
withdrawals can remove entries from the private list under the same lock.

Holding the lock for the whole purge would keep bottom halves disabled
while removing every publication. Releasing it after each entry avoids
an excessive lock hold for nodes with many publications.

node_lost_contact() purges queued name-table updates before scheduling the
node-down notification. An update already dequeued by tipc_named_rcv()
holds nametbl_lock until it updates the publication list, so it completes
before the snapshot and is included. A publication accepted after the
snapshot remains on the live node list for a later contact.

Fixes: 9db9fdd1983e ("tipc: avoid to asynchronously notify subscriptions")
Cc: stable@vger.kernel.org

Link: https://lore.kernel.org/netdev/20260927180806.1315902-1-nicoyip.dev@gmail.com/
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/tipc/name_distr.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index acf96562608b..9a400a1fa4d7 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -230,20 +230,16 @@ void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities)
  *
  * Invoked for each publication issued by a newly failed node.
  * Removes publication structure from name table & deletes it.
+ * The caller must hold nametbl_lock and unlink the node subscription.
  */
 static void tipc_publ_purge(struct net *net, struct publication *p)
 {
-	struct tipc_net *tn = tipc_net(net);
 	struct publication *_p;
 	struct tipc_uaddr ua;
 
 	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, p->scope, p->sr.type,
 		   p->sr.lower, p->sr.upper);
-	spin_lock_bh(&tn->nametbl_lock);
 	_p = tipc_nametbl_remove_publ(net, &ua, &p->sk, p->key);
-	if (_p)
-		list_del_init(&_p->binding_node);
-	spin_unlock_bh(&tn->nametbl_lock);
 	if (_p)
 		kfree_rcu(_p, rcu);
 }
@@ -254,10 +250,27 @@ void tipc_publ_notify(struct net *net, struct list_head *nsub_list,
 	struct name_table *nt = tipc_name_table(net);
 	struct tipc_net *tn = tipc_net(net);
 
-	struct publication *publ, *tmp;
+	struct publication *publ;
+	LIST_HEAD(purge_list);
 
-	list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
+	spin_lock_bh(&tn->nametbl_lock);
+	/* Preserve publications learned after this node-down snapshot. */
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
 		tipc_publ_purge(net, publ);
+		spin_unlock_bh(&tn->nametbl_lock);
+	}
+
 	spin_lock_bh(&tn->nametbl_lock);
 	if (!(capabilities & TIPC_NAMED_BCAST))
 		nt->rc_dests--;
-- 
2.43.0
