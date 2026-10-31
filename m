Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487490;
	b=p7LU/vw0K2YH3qQdCAlcxIrvAltewELRxhAb2znIfD56XlULFzdF+bNtAsizIQBkt4Fk
	 3mvJcEd7dqcs3Ujkodnm/yd/MLdyeVWlQc5zLOGoTI5OPIeAvnoiPOc9ZipPnjkeFRVGe
	 UhIcTMAIX44DeGhaek5KGzUDCYkmlF77CrHuU1k0APv3XCDU30B0CvzPS18pWZiImndMC
	 cvFaNB4rxFZO6ZgcB1KHPiyUJLZmjcMNvD2i1yv/dDr5ZJQK+9KCFtGqoaYURAKIcamAb
	 +tudKn1ErgF1NXWehsP2agSVjhLmQmhnOkc+2i6pNC+xFZ1TIAfejERE8QxkwG00Ttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yua6VmYG+rPT0EJdFP1ydV4LtFe2Ecs40LvHqDhT5L4=;
	b=hYFgKwcUKe5RPyP+Ct//EJuq0lbJDnrXm0lv7qfdubTRhrQH8EeSnKjO9FUaheaQQH5N
	 RlwQWK7m0c01+zIAbQgOe1+lebRa30QqWAfeEJWeWW8qoxx3t5jSfQF/l4pF8Exe5QjLF
	 0kOa6oXVELer2bMpUDRvVCSRrJMqlNXBKsNZygxrcbSXg6oIBfcEBMaEM4aCnecUdgwj2
	 csHpxEzjt7dczyM50to5HLPb6yF4f2iyZ5tqZ9tUhXNeeW1Cb+DJrp1/IuJFfnlnKPxYD
	 pBFXr6Ty1T8VaNVioBCOJ6IbGBJ8PyguGDpFc7Xw43IjyJ5V2r202AkO/NYWbTV8dsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ah0RW83o;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB9606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ah0RW83o
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14186935e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793487488; x=1794092288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yua6VmYG+rPT0EJdFP1ydV4LtFe2Ecs40LvHqDhT5L4=;
        b=Ah0RW83o0vWcaYoOAYnX0fCqd2bAS3joFH5VcC0MFdkv1gNZTCOkcdPggdJr59OYhR
         /+jjLbJmh0D7nJQ8bpw59wnGHdMCn1cIYVkz3mSrrAJwhOQo2m/7deY6X+z9YE4GenRh
         KRadVFQsKdgUhl8lqm3DoxTjjnSDPJYesWPSkTpgWpqXE9hWa84/dNvitSjMsb+bKPzZ
         y7ZImqjXw+nxAIGCEdLZczfVCsoV6OJqLH0+FLNr2zJ7pnxeI5GlufdYtAryO+UuHGWf
         Rxf5T9NfR00DvzV+wcObSia3cWdWMksVe8+BeSqzLMDpKPub+kI6eq+sgnqR8y9+sZOl
         k1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487488; x=1794092288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yua6VmYG+rPT0EJdFP1ydV4LtFe2Ecs40LvHqDhT5L4=;
        b=LNFQxUps9Tu8zGw8MGGcQ9WqNUWtsTz7byNKD/P0ok4hl26i88PR3wryIGuYd5dyQH
         ulhQl0nVgeYC8ifq+MLDRrxGEmnZpiX2blG8WLmsBhoGBCatkszGQExIrD9GCwYzIqXG
         aqmoAqzsf/HDz+grY/xw9A9qHk7BD/OLWPH/d9PgVa/k+WCz7RfBjytDMQmFyKlPUTFa
         Uy0H919fvYguuRPpwKZ88z8Ie8crhN+TrWsm8Q1rFCIGZ44YPHOa7oFgqIOnYtrsntfc
         lq7zwntgEcp6aqn9gTU2vOKwrGqgxDOj20O4yZU5Wijv5cx6YVDzFWWPfkfmYMHzEfDB
         UnAg==
X-Forwarded-Encrypted: i=1; AKwUvBxXWhQZAIQR2jwN3qGvin2iNcCxvLvvlcntN8Kvr9VCDPxrtB4/Gm8JuX4aa5ejgMiayMD3W52Env583l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZmx6+kLSWXeUuQTA1kp91LlDziMwzsvvD/ttR9hirsFoWme03
	G4yOBm1XToZ/6FhbEyMJDVr4VvJgqvS7v8LFalRVrBbGUSvNjh+7rMXs
X-Gm-Gg: AYBFou16YGynxcj+Ua8Vowdm48dt7hWtf33Yb6TwjGk3z0mBW53qB7cTZe7iJmhqjod
	lqdxBeEpLOzBWw5xZcwjmxmd/Zzp7hoMCxvsLKJ0d38BsLQSA0JTY6sMiFvAXfu9kD5S/o11SWB
	KwzB225u+Fe4/8GzS3c434WzgzSWVLVXTh35GZXycJczS9aF6dilsG2Kvic49obOeWkZD5UzdiG
	jkEU27k3GXSl2tbf3uKEbNDiZ9E/JV+9x7BSS0+7Fq7Rqb0rYGNqN+U7dqLKidGyqzlaFNsLxHr
	WR/p8PtveZFsUbwNoNQ34KqN4Qym2Q0pR0zPUqvj3wolU/YH63CJfSFMavELUw5OgmQqZwL/2hd
	y5skqnLlsTpWkoNmuGe5zo2xZeeZ2QjK8gwugJmUhQYYlsFZk7o+NxFB1AgyUOWIwymKJg0anTH
	fWK8g6ZC/1+niNohpqA5oxfOV8lVhcILOtXHEHTDubUk+jsFz84CgiJFn7zeBFO0yucsMVbaN9v
	OfW8+4WLudl5yfuWDISvGoJxq9yDwEnV8pFRkwk3yEVeeO0KgUI/ybd2k+c2FekDERxkfg918YB
	YwiPu3umS/tcvWUfaweiJwjBt2/GzG+PFhhlUdgBwLvCHyJwVJFUKmlGjGyFeM8U3udOEwETTQ+
	JDq5kaBjgJXc8o4coZJgkGAVUkeKQ0ETH/fQq2BWtPupDFwFPI4bgXgOSkEv6owSArPwfxr4ABx
	4Ys1ROn/mx
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr138514985e9.15.1793487488222;
        Sat, 31 Oct 2026 15:58:08 -0700 (PDT)
Received: from SD.cable.virginm.net (cpc117822-heme13-2-0-cust760.9-1.cable.virginm.net. [81.111.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm329882745e9.15.2026.10.31.15.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:58:05 -0700 (PDT)
From: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: dtatulea@nvidia.com,
	Prathamesh Deshpande <prathameshdeshpande7@gmail.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>,
	Erez Shitrit <erezsh@mellanox.com>,
	Alex Vesker <valex@mellanox.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/mlx5e: IPOIB, Fix QPN lookup race
Date: Sat, 31 Oct 2026 22:57:13 +0000
Message-ID: <20261031225749.14214-1-prathameshdeshpande7@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent RX completion path can load a QPN hash entry before
mlx5i_pkey_del_qpn() unlinks and frees it, then dereference freed memory.

Use RCU hlist operations and defer freeing with kfree_rcu(). The existing
RCU read-side section in mlx5e_napi_poll() covers the lookup. Keep ht_lock
for writers and acquire it before looking up the entry to delete.

Fixes: 7e7f4780c340 ("net/mlx5e: IPoIB, Use hash-table to map between QPN to child netdev")
Signed-off-by: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
---

Changes in v2:
- Replace the RX spinlock with RCU traversal and deferred freeing.
- Narrow the description to the parent CQE lookup race.

v1: https://lore.kernel.org/all/20261030002241.8508-1-prathameshdeshpande7@gmail.com/
Review: https://lore.kernel.org/all/ade46454-e575-43e4-85aa-eeb5ad79408a@nvidia.com/

 .../ethernet/mellanox/mlx5/core/ipoib/ipoib.h |  2 +-
 .../mellanox/mlx5/core/ipoib/ipoib_vlan.c     | 26 +++++++++++--------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.h b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.h
index d67d5a72bb41..8c0039c5425e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.h
@@ -82,7 +82,7 @@ void mlx5i_pkey_qpn_ht_cleanup(struct net_device *netdev);
 int mlx5i_pkey_add_qpn(struct net_device *netdev, u32 qpn);
 int mlx5i_pkey_del_qpn(struct net_device *netdev, u32 qpn);
 
-/* Get the net-device corresponding to the given underlay QPN */
+/* Get the net-device for a QPN. Caller must hold rcu_read_lock(). */
 struct net_device *mlx5i_pkey_get_netdev(struct net_device *netdev, u32 qpn);
 
 /* Shared ndo functions */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
index 4120afd097c3..5edc39247525 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
@@ -31,6 +31,7 @@
  */
 
 #include <linux/hash.h>
+#include <linux/rculist.h>
 #include "ipoib.h"
 
 #define MLX5I_MAX_LOG_PKEY_SUP 7
@@ -39,11 +40,12 @@ struct qpn_to_netdev {
 	struct net_device *netdev;
 	struct hlist_node hlist;
 	u32 underlay_qpn;
+	struct rcu_head rcu;
 };
 
 struct mlx5i_pkey_qpn_ht {
 	struct hlist_head buckets[1 << MLX5I_MAX_LOG_PKEY_SUP];
-	spinlock_t ht_lock; /* Synchronise with NAPI */
+	spinlock_t ht_lock; /* Serialize hash table updates */
 };
 
 int mlx5i_pkey_qpn_ht_init(struct net_device *netdev)
@@ -68,13 +70,14 @@ void mlx5i_pkey_qpn_ht_cleanup(struct net_device *netdev)
 	kfree(ipriv->qpn_htbl);
 }
 
-static struct qpn_to_netdev *mlx5i_find_qpn_to_netdev_node(struct hlist_head *buckets,
-							   u32 qpn)
+static struct qpn_to_netdev *
+mlx5i_find_qpn_to_netdev_node(struct mlx5i_pkey_qpn_ht *ht, u32 qpn)
 {
-	struct hlist_head *h = &buckets[hash_32(qpn, MLX5I_MAX_LOG_PKEY_SUP)];
+	struct hlist_head *h = &ht->buckets[hash_32(qpn, MLX5I_MAX_LOG_PKEY_SUP)];
 	struct qpn_to_netdev *node;
 
-	hlist_for_each_entry(node, h, hlist) {
+	hlist_for_each_entry_rcu(node, h, hlist,
+				 lockdep_is_held(&ht->ht_lock)) {
 		if (node->underlay_qpn == qpn)
 			return node;
 	}
@@ -96,7 +99,7 @@ int mlx5i_pkey_add_qpn(struct net_device *netdev, u32 qpn)
 	new_node->netdev = netdev;
 	new_node->underlay_qpn = qpn;
 	spin_lock_bh(&ht->ht_lock);
-	hlist_add_head(&new_node->hlist, &ht->buckets[key]);
+	hlist_add_head_rcu(&new_node->hlist, &ht->buckets[key]);
 	spin_unlock_bh(&ht->ht_lock);
 
 	return 0;
@@ -109,16 +112,17 @@ int mlx5i_pkey_del_qpn(struct net_device *netdev, u32 qpn)
 	struct mlx5i_pkey_qpn_ht *ht = ipriv->qpn_htbl;
 	struct qpn_to_netdev *node;
 
-	node = mlx5i_find_qpn_to_netdev_node(ht->buckets, qpn);
+	spin_lock_bh(&ht->ht_lock);
+	node = mlx5i_find_qpn_to_netdev_node(ht, qpn);
 	if (!node) {
+		spin_unlock_bh(&ht->ht_lock);
 		mlx5_core_warn(epriv->mdev, "QPN to netdev delete from HT failed\n");
 		return -EINVAL;
 	}
 
-	spin_lock_bh(&ht->ht_lock);
-	hlist_del_init(&node->hlist);
+	hlist_del_rcu(&node->hlist);
 	spin_unlock_bh(&ht->ht_lock);
-	kfree(node);
+	kfree_rcu(node, rcu);
 
 	return 0;
 }
@@ -128,7 +132,7 @@ struct net_device *mlx5i_pkey_get_netdev(struct net_device *netdev, u32 qpn)
 	struct mlx5i_priv *ipriv = netdev_priv(netdev);
 	struct qpn_to_netdev *node;
 
-	node = mlx5i_find_qpn_to_netdev_node(ipriv->qpn_htbl->buckets, qpn);
+	node = mlx5i_find_qpn_to_netdev_node(ipriv->qpn_htbl, qpn);
 	if (!node)
 		return NULL;
 
-- 
2.43.0

