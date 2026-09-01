Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1B370ACA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238993; cv=none; b=chubOd4efIrCQjXXWcbaB5VuOId1x+jG/mPd9AFgJrn07DP3YaZbNjGn7JK2fUXNpEEj4o3n8pg09NG78671SAl8SZy0pFHqzrpt82n8lIn4zSAGHpal+A1TlGDb1D1aEF6WMo0WtJC8RG9U11vE6Fz9H5wnXbj6hMIgUlMQtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238993; c=relaxed/simple;
	bh=mxLAjIGvo/CJp2UIrwHx7VBoRPp28nCjUt1T9FBm2jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l0ORIt3ng+mM6jgyLLOGRScEmTN4aA0skgFhyWjhuUlRkfpBN009QttAbmHTkELfZAGp+Ahjl1ksBWrQPzbXyDuV9viNbDnCLmvluLNiGq01iV85H3fYyh2jzpg1F69kTexUXYm+U6wIeEIdVN6Ffd0dGPjXYYD8FYd/DExnWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ajou.ac.kr; spf=pass smtp.mailfrom=ajou.ac.kr; dkim=pass (1024-bit key) header.d=ajou.ac.kr header.i=@ajou.ac.kr header.b=imWNqMMc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ajou.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ajou.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ajou.ac.kr header.i=@ajou.ac.kr header.b="imWNqMMc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso741431a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajou.ac.kr; s=google; t=1788238986; x=1788843786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZOAuf91GeJPRlB4hQQIOwIR/2cbyKo6tpg0ZFIeQ7c=;
        b=imWNqMMcYbC9Q/LCScKrr7E/IWOG/5BP2r2ix4z4T7h0gZMYLyaQQkZvuIidzl4Y00
         I+NyTROsoqrncdHjlxI5OXRza/NjUjX22GFA6qaMq0pIvbugo6ym+zpPkq3PMaHPSq9i
         D2BdFdfBWF1T+got1hsLt3K/V8EWc7H3fGDec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238986; x=1788843786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZOAuf91GeJPRlB4hQQIOwIR/2cbyKo6tpg0ZFIeQ7c=;
        b=Y48yf/fNx6eRo0ONmuDNGLSxdOHs8DhGcVDZ1vyLiKEPogyPDf65b4xbHH5qrFNB68
         wRG5Lc+kCtQx53KXmnjBWTbdFvkcAQFBKC7BzFOjTDNNRSMmlbynlb56X4wIx+1n3FEw
         L1JdQfMqsM2Gsq+dqvbHcnl41w+dOG83aKZ7KxzGhlqCpbVW2WSWJ8OD5CfJqR0gauTI
         TJK7zzlwx/F284YRnksGcFL7KVZN2NSQge78DodjdZw7DafjhY5fThA38nuoC/xiz0Tt
         /FO0eLxDuLAtzpsLbV008N70ALXKNxMMVb1xYjzaMwZ5DzCx7yCHp8YX0E/mpTH4io6U
         rPGw==
X-Forwarded-Encrypted: i=1; AHgh+Rpx3k04rV1xJvsxyWQ755tAaAUSPNTZwTmFTMAoDui19CLsTLjBD5cfDTJG56vQ6huBEuBuFs+yo9IPQ+4=@vger.kernel.org
X-Gm-Message-State: AFuF++nQURZzlcLRPjQsN/UUvlEcJW/vkREHPH6A/CC/0O0LqYIS2fTQ
	hqSPmXxotaY9EcjJqn7zAAleCBSX5vLQsVQ4PdJf6aStfX4VoVu4Crw7DZD/vq/0wbM=
X-Gm-Gg: AR+sD10cF5yIWwDYCfF+Gx402AtTSersCiHM3h6lbRYps/J4e6RUGfKcMQrxGBlpXBz
	nFlnQ4i0Nmmp3uDLnJGNbG376fWUM4l8/p26ZWIWxnhPN3Yh3ZfZ4iumhpDJSR0Ijui7amg3gmx
	H413XhkcYd0W4wz/SX/PKKtsnOyNEd8hLNPIKPVS1l7eseowwuFtDMH4JMkBWePuCC335x9VmdR
	p/jvDlmYVYbkMP5e+KfHMHhxjWhqhakqyvnw2hH9lSgQPpGvr0q4SzTY1GPdbbr3louG34n0QT0
	bqxA8vB8ajhdbdb3Ph29+NsBcxbjINSyMr637Xnb+kWqk0GA2d1oAhkSVBV/go8v1vmNXzHkteG
	wnUgtl0VCQB73+5KIwmDls8S3hmwMb/CIqIcf5imaZ3E4vliwaVK22wdXCH6LsDmXVdQisKqr6k
	5OwUHI83gPgEQa9m95emYAzMNm4a/+SN4Hk/bEFNjJGMmKqpI4iL7vV/b8JGsQoyS7tDAFMHsZs
	hiMx7RlXPCVNjaqlvDWcG3yhwJE1WJ1r0CkSugIcMPF
X-Received: by 2002:a05:6a21:e081:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3d26720dffdmr41931451637.9.1788238986109;
        Mon, 31 Aug 2026 22:03:06 -0700 (PDT)
Received: from DESKTOP-2P4OM44.localdomain ([175.195.197.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36f2a29sm5558745a12.31.2026.08.31.22.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 22:03:05 -0700 (PDT)
From: Seungwon Bae <qotmddnjs@ajou.ac.kr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungwon Bae <qotmddnjs@ajou.ac.kr>
Subject: [PATCH] vxlan: serialize nexthop fdb_list against cross-device concurrent updates
Date: Tue,  1 Sep 2026 14:02:53 +0900
Message-ID: <20260901050253.47197-1-qotmddnjs@ajou.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct nexthop.fdb_list is a per-nexthop global list of the vxlan fdb
entries that reference an fdb-nexthop.  vxlan serializes it only with the
per-device vxlan->hash_lock.  When two vxlan devices reference the same
fdb-nexthop, their entries share one nh->fdb_list but each device takes
only its own hash_lock.  vxlan_cleanup() (the aging GC timer) runs in
softirq with only its device's hash_lock and calls vxlan_fdb_destroy() ->
list_del_rcu(&f->nh_list); a concurrent list_add_tail_rcu()/list_del_rcu()
from the other device corrupts the shared list, leaving a freed
kmalloc-128 struct vxlan_fdb linked on nh->fdb_list (use-after-free later
consumed by vxlan_fdb_nh_flush()).

On CONFIG_DEBUG_LIST/KASAN this reproduces as:

  list_del corruption. next->prev should be ..., but was dead000000000122.
  __list_del_entry_valid_or_report <- vxlan_fdb_destroy <- vxlan_cleanup
  <- run_timer_softirq
  BUG: KASAN: slab-use-after-free in vxlan_fdb_destroy

Serialize all nh->fdb_list mutations with the nexthop's own spinlock
(nh->lock), which - unlike rtnl/hash_lock - is usable from the softirq
aging path.  Lock order is hash_lock -> nh->lock at every mutation site;
vxlan_fdb_nh_flush() keeps traversing under rcu_read_lock().

Verified with a KASAN + CONFIG_DEBUG_LIST kernel and an unprivileged
(userns+netns) reproducer that runs two vxlan devices churning
add + aging-delete on a shared fdb-nexthop: BEFORE = 490 list_del
corruptions + slab-use-after-free; AFTER = 0 corruptions, 0 KASAN
reports, no deadlock.

Signed-off-by: Seungwon Bae <qotmddnjs@ajou.ac.kr>
---
 drivers/net/vxlan/vxlan_core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index ac88d1c85..2a427e89e 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -843,11 +843,15 @@ static int vxlan_fdb_nh_update(struct vxlan_dev *vxlan, struct vxlan_fdb *fdb,
 	}
 
 	if (old_nh) {
+		spin_lock_bh(&old_nh->lock);
 		list_del_rcu(&fdb->nh_list);
+		spin_unlock_bh(&old_nh->lock);
 		nexthop_put(old_nh);
 	}
 	rcu_assign_pointer(fdb->nh, nh);
+	spin_lock_bh(&nh->lock);
 	list_add_tail_rcu(&fdb->nh_list, &nh->fdb_list);
+	spin_unlock_bh(&nh->lock);
 	return 1;
 
 err_inval:
@@ -938,6 +942,7 @@ static void vxlan_fdb_free(struct rcu_head *head)
 static void vxlan_fdb_destroy(struct vxlan_dev *vxlan, struct vxlan_fdb *f,
 			      bool do_notify, bool swdev_notify)
 {
+	struct nexthop *nh;
 	struct vxlan_rdst *rd;
 
 	netdev_dbg(vxlan->dev, "delete %pM\n", f->key.eth_addr);
@@ -956,7 +961,14 @@ static void vxlan_fdb_destroy(struct vxlan_dev *vxlan, struct vxlan_fdb *f,
 	hlist_del_init_rcu(&f->fdb_node);
 	rhashtable_remove_fast(&vxlan->fdb_hash_tbl, &f->rhnode,
 			       vxlan_fdb_rht_params);
-	list_del_rcu(&f->nh_list);
+	nh = rcu_dereference_protected(f->nh, lockdep_is_held(&vxlan->hash_lock));
+	if (nh) {
+		spin_lock_bh(&nh->lock);
+		list_del_rcu(&f->nh_list);
+		spin_unlock_bh(&nh->lock);
+	} else {
+		list_del_rcu(&f->nh_list);
+	}
 	call_rcu(&f->rcu, vxlan_fdb_free);
 }
 
-- 
2.43.0

