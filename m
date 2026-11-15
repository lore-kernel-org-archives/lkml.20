Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709571;
	b=uNDQxDHT3VaNthPERoto44JhCMSbn9Fg6GtCZxG3YZqODCU617Az+/zP6rafF16FjHgt
	 7v/xe2LnkdA0s7WGl8fX67CmD6vWD7q2tXdWkD+BCrNccUUrGEbll0EDta9ZcJcBDqhPj
	 7YI2+pjtJlBBFJKmIhTvnHJaZYDEwWVB7SszPd2Q+2bAYPuoeU0jBKqBTfNbbhxdIrpj4
	 tPK/OARYYfRJSaajG6ZhgEMfq2Dgpln4aFlGyUUGXyLut7rDuXShp8cxKu9px5081EMgl
	 9nqvkiwEnsTEdiWAGLmDB0umrNOIG85yyF23BjZyH7OszvhDo+yMw1dQa5so2Vm7Vow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
	b=jiYbP6TulfDfqEAoC2OON+aBrD9DIB7OqaEGKoJe9axutTLGYZ2FNaAkENNwziwKYR9T
	 KIgaZ7YkBPl+dwrMqF8u18vrxC/rxc+o9ZA/F5tinSNbKVkiEwAinAW9MZaTGiFA0nX35
	 1sLAO9Ugbc95KqjLtXI1IeYb5CAj5N887uN+ofI9+At2A4seqpz2lsxXcAz9nfO5aojcU
	 eHCif2oCun+ObjkUMGCUvQhYY0Ck06rRA+q2bHNSYI2Kvl2qyfSAkOTvW+VynV353EGCm
	 2HdbVAIGRvqa3UGwQwAbwMkk0z+WY6l2cHRzwtvgsKpRsKYcxs0XSIZ9UIUpmOEPCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HSbeJN2w;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE51606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE51606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HSbeJN2w
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso9886189eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709570; x=1795314370; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
        b=HSbeJN2wdAlO+lKssibklIeKvmcUvkTY1LSslYrERBgA0MAoo3DRsYhuDEYqSFvhLW
         YfiQOqywrW5NfVj+4Eyzmmasux+AgXzBEJ0GbAvBlK84dDV22/VTq5u8nr+YE0x4SOSn
         VhwXA3c1l4EIu07NxeZhZ/PjXmUo0ylc98SfVAKqulH8kgU9qot3oUy1pFZA6zN4eitL
         bMzUo2/XDCurqgNY9mqjqsZO03kthiBfoAVfS8SNpyle5UpwpUi4pwk8m79wVoAkJiRU
         gvKlvKOjk0aADb46lR7Xuf7U30DE7Aw8OAzTxGfJPpTDiP+DwZI7Gog1GuevWKnVOkQj
         LBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709570; x=1795314370;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
        b=ntUSUgnqXoI8cVgzNDGdD87F4RSzJWP41EiOgqMuIGYuK+sJ8a4nLUMuD41K8OYSTT
         URNS9yzgbu2FgJzYk7sZlnE+/ZB6XiwxCl8C+v185B0IRllyqew2qzGCmJ7oyZbSnPGx
         v2KAVYKI90RbFzNKMerbApKUlR3rda54OT7yHJTF0WCadM86XkSKrazz1RWh1wyC3i5z
         Ys9wXUNyTvPPIxulnKXiMH91JuG/tSJ+AXqbnTAMdkq339X+8ACYNAj/XgsvhEH9k5Xy
         De5ervlgWiNyD51gU3FRDr+wXf9nqrcPPDcNNMclV89Y1mldv8ZG2SnSRsEzvLzz/3rG
         BIBg==
X-Forwarded-Encrypted: i=1; AL+hErGIXetxqlSk73E9TcKp5EDT4WJcJhRBf3n1gzlK2V2duLvFyXn0f0pK5SlktwgIKqErZ9qjzmuaxIPOzxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bLQ3PYaYRPBuOR5wCqvT/s6WdHh2d/m5cj/l5oA0cWFPsytTw
	rNNqj5xX+hC7Kcrr5P5RAheC7MaE8M+9+bWhpS9nXhG2IhdeyhWDqIpElg6PfKO9UQ5zQUTfvux
	33Tmrmj0wQDZLPIgt5UdMjUS+NQ==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3b81:b0:1b2:610b:878 with SMTP id a92af1059eb24-1b50306917dmr7669737c88.6.1794709569270;
 Sat, 14 Nov 2026 18:26:09 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:02 +0000
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-2-almasrymina@google.com>
Subject: [PATCH net-next v3 1/6] net: devmem: pass net_device pointer to net_devmem_lock_dev()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Upcoming changes for leased queue support will track the physical DMA
device and the bound device in separate net_device pointers on struct
net_devmem_dmabuf_binding, with different teardown paths locking
different pointers.

Generalize net_devmem_lock_dev() to take a struct net_device **dev_ptr
instead of struct net_devmem_dmabuf_binding *. No functional change.

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 36 ++++++++++++++++++------------------
 net/core/devmem.h      |  4 ++--
 net/core/netdev-genl.c |  2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 7eb91782585e3..6fa7b909b86e8 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -85,39 +85,39 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
 }
 
 /**
- * net_devmem_lock_dev() - lock a binding's net_device if still alive
- * @binding:		devmem binding whose @dev pointer to lock
+ * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
+ * @dev_ptr:		pointer to the net_device field on a devmem binding
  * @dev_tracker:	reftracker for the held net_device reference
  *
- * Safely dereference @binding->dev, acquire netdev_lock() on the device, and
- * verify that @binding->dev has not been cleared while waiting for the lock.
+ * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
+ * verify that *@dev_ptr has not been cleared while waiting for the lock.
  *
- * Invariant: @binding->dev is set once at bind time and is only ever cleared to
- * NULL while holding netdev_lock(dev) (in mp_dmabuf_devmem_uninstall(),
- * net_devmem_unbind_dmabuf(), or net_devmem_dev_unregister() during
- * NETDEV_UNREGISTER before synchronize_net() and netdev_run_todo() free the
- * net_device).
+ * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
+ * NULL while holding netdev_lock() on that device (in
+ * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
+ * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
+ * synchronize_net() and netdev_run_todo() free the net_device).
  *
- * Taking rcu_read_lock() guarantees that a non-NULL @dev read from
- * @binding->dev has not yet completed unregister_netdevice_many_notify()
+ * Taking rcu_read_lock() guarantees that a non-NULL device read from
+ * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
  * (which waits for an RCU grace period via synchronize_net() after
  * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
  * safely acquire a reference before sleeping on netdev_lock(). Once
- * netdev_lock(dev) is held, re-checking that READ_ONCE(binding->dev) == dev
- * guarantees that the device has not yet been detached from @binding and
+ * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
+ * guarantees that the device has not yet been detached from the binding and
  * cannot finish unregistering until net_devmem_unlock_dev().
  *
- * Return: The locked and held net_device if @binding->dev is still non-NULL,
+ * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
  * or NULL if already cleared.
  */
 struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
 {
 	struct net_device *dev;
 
 	rcu_read_lock();
-	dev = READ_ONCE(binding->dev);
+	dev = READ_ONCE(*dev_ptr);
 	if (!dev) {
 		rcu_read_unlock();
 		return NULL;
@@ -126,7 +126,7 @@ net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
 	rcu_read_unlock();
 
 	netdev_lock(dev);
-	if (READ_ONCE(binding->dev) != dev) {
+	if (READ_ONCE(*dev_ptr) != dev) {
 		netdev_unlock(dev);
 		netdev_put(dev, dev_tracker);
 		return NULL;
@@ -157,7 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	dev = net_devmem_lock_dev(binding, &dev_tracker);
+	dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c4f476947dfaa..c0aaba0041ff6 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -100,7 +100,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker);
 void net_devmem_unlock_dev(struct net_device *dev,
 			   netdevice_tracker *dev_tracker);
@@ -189,7 +189,7 @@ static inline struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
 }
 
 static inline struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
 {
 	return NULL;
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 9c5bf17b04e57..2826f7e328340 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1476,7 +1476,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(binding, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.0.611.g1030f0b940-goog

