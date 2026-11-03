Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748424;
	b=E7lxeCksHtaeGTjj96DeJwjnKZu8tcic70/hXh6w7hWHEMwC90Ztk+bQ181y+eT0Sr7w
	 FTuXsiCxzKWb8uA+T9FugdcDk42MSf9mPCp04uZTdSAuYQXqBxnzKT3V7kv4G7VZCg80p
	 Q32fV338gXEnpcTOV82bFNSk2HV2WLJinqjPuf0qWqkLq9mecDkYeghIaGC+cx7aybuxC
	 5UDIWS0Wsr0llu7cJlt24U7OQxEsxV/t359xeo6nxeXbdRNrd0q7/XR7BkWyEXvqCngAv
	 rFd8/KFP7fX8aUJcIvXyx0dMnDsWuge2UmH+2WjOSS4ZnVziuf9G43Jj462830pglxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MebmRBveJEh1RLpVrBtQeo9PZtGpmHmmHeKqfvaeWFg=;
	b=LnafA6mUjsPeA8lwQrXWt7U/X/wNMPvdiSK88thcnMvFou19NjeFzvHkgco7bhce7F1N
	 XAbtXh2pCOjjRl68vKOKf5V6CGRzt8rsdcXcl9KMTl/LgVwGfOJRXz48F459oTAdss3mt
	 +yvr37nOsxTw6XUftRO5qIge5JLt4f50LuC20yE/HkAxhlhtHYlktAbtR//f/H5yHMzbi
	 wurXTotV65qJIkbLzJK+gbFsgqTXZHyuSOFqwawQ8rLOStdx+pNq05qZInF2ONUInIVhL
	 2a+IEn/bt8wJL0mTTA9gS6eiXD4K4CaRDQ7ouEFxKq564Ok6QJ8AOb4uvp16jlpTMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HxATmQ49;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25581606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25581606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HxATmQ49
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso111657eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793748423; x=1794353223; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MebmRBveJEh1RLpVrBtQeo9PZtGpmHmmHeKqfvaeWFg=;
        b=HxATmQ49xaahOw5CRQYG8UxrShhva95gs+4hyppdcbt6HbI7fn8FeZWMbOUsUTtyTw
         xxDUfCxrEvHOx7xXQ4Vsnj9P8cnbL88dUbTHQzWd9iv2hWTALwhY8P3mkbWfuK/4OScY
         ezqUj+lEqWOyMHjp4qdK24l7dtnMwaOjfZssimTlDA4Ov8ZAzf3ne4gS69NrD6MFLQIM
         1qdh5JG9Ege7bm/iN2NoMswmZHahmr5M6s2stHadHeYjAj6dkwPYYnYz5ByFxv4vbqIL
         yWPlv+CBddeKcOlyfeZL1vPT3omuNNoyf3oIE0P+t6m2wQbEoxu6mEzBfHkM3LVILYUn
         lO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748423; x=1794353223;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MebmRBveJEh1RLpVrBtQeo9PZtGpmHmmHeKqfvaeWFg=;
        b=lKRtzTWvVCckAF2HQBzUrtTKpa5Nxne+qm9e01VaWFgsUzN5AmVF6YQymtT1sDZgx3
         GACwF+WcgV9mQLnvDtsq5bsEKRMkxRb1jkLDJn2i+93E4mG2IIbAzsC6BKlk+/vcUeWD
         QObLJWhmXIfdWe1IHphtGu9oErIRP45YLtBsqRFZZB5pOwRn9v4u5XjwzUkiI0u6SCPd
         q6JDDOE03a5fWy5Z38zCFvlblnudwnOyDSNHc4fslEf2BQzAxQS/fCCWgDRV47+NS337
         h5bSzjT7vX0eXzK+Gl38Hvv2P0b8uJzEPunmr/fKitPQcfPD1OuVNbi7W2ZDp5NsTkti
         fZ0g==
X-Forwarded-Encrypted: i=1; AKwUvBxNnrtRC//kZgLSPWyqGvXHIw/+BIvIzqjA8k2lpbjiyFmeVvmMuIuPePDPluMqpPy5+WWGXSXiOdikGAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PmzvybsEsME3Xml7hGAnE46OlzAAGoFCarxuBUs3exeiriRDI
	N/BMrK1TdyXq/CMPFP24dR3Hq40dXzQxZBiHQzmxm3GVkXHUObkRPGQaai5SUCbNoY3Lzw68Uyz
	/HcjHyXtJCg0qCJxh+gaeZzG3Tg==
X-Received: from dydxu27-n2.prod.google.com ([2002:a05:693c:895b:20b0:36c:a643:f3ad])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:41dc:10b0:36a:180f:3154 with SMTP id 5a478bee46e88-36a423f27afmr23020990eec.18.1793748423031;
 Tue, 03 Nov 2026 15:27:03 -0800 (PST)
Date: Tue,  3 Nov 2026 23:26:57 +0000
In-Reply-To: <20261103232659.1340283-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103232659.1340283-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103232659.1340283-3-almasrymina@google.com>
Subject: [PATCH net-next v1 2/4] net: devmem: rename binding dev and vdev to
 map_dev and bind_dev
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	David Wei <dw@davidwei.uk>
Content-Type: text/plain; charset="UTF-8"

struct net_devmem_dmabuf_binding currently tracks two device pointers
under the names 'dev' and 'vdev':

- 'dev' is the physical net_device whose dma_dev holds the DMA mapping.
- 'vdev' is the virtual net_device the user bound to when using leased
  queues.

Rename 'dev' to 'map_dev' and 'vdev' to 'bind_dev' (typed as struct
net_device *), and rename the matching local variable in
netdev_nl_bind_tx_doit() from 'bind_dev' to 'map_dev' to match. No
functional change.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/dev.c         |  2 +-
 net/core/devmem.c      | 38 ++++++++++++++++++++------------------
 net/core/devmem.h      | 17 +++++++++--------
 net/core/netdev-genl.c | 31 +++++++++++++++----------------
 4 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 1aece2fe2429f..e61ab67fb7e17 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4186,7 +4186,7 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
 		if (net_is_devmem_iov(niov) &&
 		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
-		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
+		     READ_ONCE(net_devmem_iov_binding(niov)->map_dev) != dev))
 			goto out_free;
 	}
 
diff --git a/net/core/devmem.c b/net/core/devmem.c
index f164c90e90b3b..6446355e787d4 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -157,7 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+	dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
@@ -227,13 +227,14 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 
 		rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
+		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
 			busy = true;
 	}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->dev && !busy) {
+	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
+	    !busy) {
 		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -252,16 +253,16 @@ void net_devmem_dev_unregister(struct net_device *dev)
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
 		if (binding->direction == DMA_FROM_DEVICE) {
-			if (READ_ONCE(binding->dev) != dev ||
+			if (READ_ONCE(binding->map_dev) != dev ||
 			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE))
 				continue;
 		} else {
-			if (READ_ONCE(binding->vdev) == dev)
-				WRITE_ONCE(binding->vdev, NULL);
-			if (READ_ONCE(binding->dev) != dev)
+			if (READ_ONCE(binding->bind_dev) == dev)
+				WRITE_ONCE(binding->bind_dev, NULL);
+			if (READ_ONCE(binding->map_dev) != dev)
 				continue;
-			WRITE_ONCE(binding->vdev, NULL);
+			WRITE_ONCE(binding->bind_dev, NULL);
 			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE);
 		}
@@ -270,7 +271,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 		if (!netif_is_queue_leasee(dev))
 			net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 	xa_unlock(&net_devmem_dmabuf_bindings);
 }
@@ -304,7 +305,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 }
 
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -332,14 +334,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		return ERR_CAST(dmabuf);
 
 	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
-			       dev_to_node(&dev->dev));
+			       dev_to_node(&map_dev->dev));
 	if (!binding) {
 		err = -ENOMEM;
 		goto err_put_dmabuf;
 	}
 
-	binding->dev = dev;
-	binding->vdev = vdev;
+	binding->map_dev = map_dev;
+	binding->bind_dev = bind_dev;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
 	binding->niov_shift = niov_shift;
@@ -559,8 +561,8 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 */
 	dst_dev = dst_dev_rcu(dst);
 	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->dev) &&
-		     dst_dev != READ_ONCE(binding->vdev))) {
+	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
+		     dst_dev != READ_ONCE(binding->bind_dev))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
@@ -684,8 +686,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 		if (xa_empty(&binding->bound_rxqs)) {
 			if (!rxq->lease)
 				net_devmem_dmabuf_binding_unmap(binding);
-			ASSERT_EXCLUSIVE_WRITER(binding->dev);
-			WRITE_ONCE(binding->dev, NULL);
+			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
+			WRITE_ONCE(binding->map_dev, NULL);
 		}
 		break;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c0aaba0041ff6..9dcb629e10bfd 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -22,14 +22,13 @@ struct net_devmem_dmabuf_binding {
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sgt;
 	/* Physical NIC that does the actual DMA for this binding. Set at bind
-	 * time and cleared to NULL under netdev_lock(dev).
+	 * time and cleared to NULL under netdev_lock(map_dev).
 	 */
-	struct net_device *dev;
-	/* Opaque cookie identifying the virtual device (e.g. netkit) the user
-	 * called bind-tx on. Used only for pointer comparison via READ_ONCE()
-	 * and cleared with WRITE_ONCE() on unregistration. Never dereferenced.
+	struct net_device *map_dev;
+	/* Device the user called bind-rx or bind-tx on. Set at bind time and
+	 * cleared to NULL on unregistration.
 	 */
-	void *vdev;
+	struct net_device *bind_dev;
 	possible_net_t net;
 	kuid_t uid;
 	/* Serialize net_devmem_dmabuf_binding_unmap() on attachment and sgt */
@@ -91,7 +90,8 @@ struct net_devmem_dmabuf_binding {
 #if defined(CONFIG_NET_DEVMEM)
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -171,7 +171,8 @@ static inline void net_devmem_net_iov_dec_ref(struct net_iov *niov)
 }
 
 static inline struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 2826f7e328340..962d7a8c75e9a 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1195,9 +1195,8 @@ netdev_find_netmem_tx_dev(struct net_device *dev)
 int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	struct net_device *bind_dev;
+	struct net_device *netdev, *map_dev;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	struct device *dma_dev;
 	u32 ifindex, dmabuf_fd;
 	struct sk_buff *rsp;
@@ -1245,27 +1244,27 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
-	bind_dev = netdev_find_netmem_tx_dev(netdev);
-	if (!bind_dev) {
+	map_dev = netdev_find_netmem_tx_dev(netdev);
+	if (!map_dev) {
 		err = -EOPNOTSUPP;
 		NL_SET_ERR_MSG(info->extack,
 			       "No DMA-capable device found for netmem TX");
 		goto err_unlock_netdev;
 	}
 
-	if (bind_dev != netdev)
-		netdev_lock(bind_dev);
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
 
-	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
+	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
 
-	binding = net_devmem_bind_dmabuf(bind_dev,
-					 bind_dev != netdev ? netdev : NULL,
+	binding = net_devmem_bind_dmabuf(map_dev,
+					 map_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
 					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-		goto err_unlock_bind_dev;
+		goto err_unlock_map_dev;
 	}
 
 	/* rsp was allocated large enough */
@@ -1273,16 +1272,16 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 
 	genlmsg_end(rsp, hdr);
 
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	netdev_unlock(netdev);
 	mutex_unlock(&priv->lock);
 
 	return genlmsg_reply(rsp, info);
 
-err_unlock_bind_dev:
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+err_unlock_map_dev:
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 err_unlock_netdev:
 	netdev_unlock(netdev);
 err_unlock_sock:
@@ -1476,7 +1475,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.0.385.gac671c819a-goog

