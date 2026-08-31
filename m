Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609842C513
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201335; cv=none; b=g8nWYuJc83DTwJNeZAPWAXH2VXfKFkNvGdJA9vsk0T+GTt2ldiym56+erxHi/sZu2HMyVvkAp6omjI/jmVrQWhr2sRDTLSNEbRtz2aq5nfYK7QqDSVHeeCRs3P6x9GyDjGUx9Cgx5wVDFmDrvwy8xj8GQzN3tC6vNTTUYLgWUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201335; c=relaxed/simple;
	bh=NN9RB+UvxFIqkqJWr7T3pFDa1lKUJrny2eyl/BMu+w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFrMYDlFTp+jIcyCNK3+K79O9GpUHMOaX/OBPoZNC2QA+3waPMm/xMi5906njMFLGpHaG7UJIHBi1Di8APuzHjUUqgOCEU9+OxVWWdLTliPNuzhTxq9XgxnnDMkeVSYCPCv51NaTDn20R2jztAHtg0CJNLSUvprvjSAokP1/P3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rly8/87g; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rly8/87g"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1726608a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788201333; x=1788806133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYHUgXJZIM+DZyQFo+r/5qYhcMe//+wlRuuS60og9lY=;
        b=Rly8/87g06FH5N065cAZD4ytQ0QijaPy9iNa8qvYHk+8VMeFStjDKVKuKAyeaKw479
         Votdp08GJr5dG6HPZJyVu502vjisHJ7EQVtiIIBOz0W96EeSIHW2VhaRZgzzC/KRsARF
         QhFsrexzY+Uw/nmdJ47fOrCWhBBnWxw3QOftXqkHSQQHHbeBud/seeyF1lKkPoi2iRz3
         +4c7BI+uvnrGG2iIHrEzUi5qs+5SE66syLM3TYnME0DiEsP4E9OSsJHIvLPMHwakYXPm
         +0jzDGgzWkFq0g8KhNkTjWIMrFA2xde3s8eYtw17T+yCZPdCyZorrwOYrSHDIs4R+tfU
         Q/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201333; x=1788806133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYHUgXJZIM+DZyQFo+r/5qYhcMe//+wlRuuS60og9lY=;
        b=ZXSJq/bbXg9RXywdKZmHUdg368MeHUmLiA4LxUkXI/oYKWKi4WBhmn1+DEzIHXkw0+
         MkISIYPdVBwDZXODoFOxQWpCo2f1K+20kx+MRkhpUKHWYC+ElBKbQrMVKcsSmtwEaOVq
         G63yvRH4Bcfe4Xa8dv8wfkFF3/ciLWaf0j3OS2nXnht6P7UuRegDsMOZyMPFoInM13CL
         j/v5hvBQ4MijyZL65Te3NPWclcWbuHLEwmK4nZHLuwwEUrCqfI5kUC5ypZRhvo7YJUOp
         6JYDc5skQeWzH+TyHW/LejQU873eM7OQoC2V6sCe7ttfdLJAPlrcELB/U71106HYLUQ/
         hW4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqxt1M8OJQRJHX+po4ZnjxX8ssDTxZShbSegs6nrJSMl3whaSH9tsLlH2itKu0LNDuIjC0Ij0O2utdZAp0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjjONWQXBg/BE9zPULjVf8gRnMxyU81yCSuqasac7Gbv80aTEZ
	POXB3U548osp6Zk9EcThJpW+c7YDiSc/SdIxlJyRNjxoHzn9HZ2zkoid
X-Gm-Gg: AR+sD10LkK3X56g7WDpDNdNUVo+AdeKXDMmgo+dBgH2CnqJzMy9yGoGKQ3G5Iiz6rSl
	kdZ5JiMGBY17WxmjmzbP7A6DkmO+w9/+2PJQFA//w6bPGhBkH+AtBQhpNVj+xnuLJ6IwcbdJg9W
	QztsmriP/qdiipmEuyz4cd1/xoQ2T/sVFEYaKN4CULWHvql/gwxVagBh+GX/bMDzUxfB1kgAdWc
	79/zwrDqjnWoEGnY5Daeh714f0jFThqSOXM93BrXCptoDCSNll3a2aXZhxBsfKgURkD6A2P9ybX
	2Abdqk1rAKPxqYOIoURzlD2tqRL50odogEneJz6D6lSOwyj8bVOpn2vArM/hRlmDYoxcgXR5R2s
	5TeBHLsKkAcTNtn72XeSnLrXu1T8OwLSoaH+J/kZXNmBoSj7mahqjO6Ir27nN1swPO2dqz6Vwox
	O8dZcVtW8VrH80q5UC12Bc3IOnnRF29uC8Txw9OM1nCiJFFPFYWf4pEQ==
X-Received: by 2002:a05:6a00:4c9a:b0:84f:dd30:1890 with SMTP id d2e1a72fcca58-85b5ba0d535mr4453364b3a.15.1788201333063;
        Mon, 31 Aug 2026 11:35:33 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea7c76sm4324211b3a.39.2026.08.31.11.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:35:32 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: devmem: embed net_iov_area in binding
Date: Mon, 31 Aug 2026 11:35:29 -0700
Message-ID: <20260831183529.2517322-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831183529.2517322-1-sdf@fomichev.me>
References: <20260831183529.2517322-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After replacing the gen_pool with a binding-level freelist, devmem no
longer needs a separate chunk owner object. There is only one
net_iov_area for the binding, so store it directly in struct
net_devmem_dmabuf_binding.

Derive the binding from net_iov_owner() with container_of(), matching the
pattern used by io_uring zcrx. This removes the leftover
dmabuf_genpool_chunk_owner wrapper and its allocation/free path.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/devmem.c | 42 ++++++++++--------------------------------
 net/core/devmem.h | 26 +++++++-------------------
 2 files changed, 17 insertions(+), 51 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 34b3157677e1..84d6c30516c8 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -29,15 +29,6 @@ static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
 
 static const struct memory_provider_ops dmabuf_devmem_ops;
 
-static void
-net_devmem_dmabuf_free_chunk_owner(struct dmabuf_genpool_chunk_owner *owner)
-{
-	if (owner) {
-		kvfree(owner->area.niovs);
-		kfree(owner);
-	}
-}
-
 static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
 {
 	struct net_devmem_dmabuf_binding *binding =
@@ -55,7 +46,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 	     "can't destroy dmabuf binding. total=%zu, free=%zu",
 	     binding->total_niovs, binding->free_count);
 
-	net_devmem_dmabuf_free_chunk_owner(binding->chunk_owner);
+	kvfree(binding->area.niovs);
 	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
 					  binding->direction);
 	dma_buf_detach(binding->dmabuf, binding->attachment);
@@ -177,7 +168,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	static u32 id_alloc_next;
 	struct scatterlist *sg;
 	struct dma_buf *dmabuf;
-	struct dmabuf_genpool_chunk_owner *owner;
 	unsigned int sg_idx;
 	size_t total_niovs;
 	size_t niov_idx;
@@ -271,23 +261,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	}
 	binding->total_niovs = total_niovs;
 
-	owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
-			     dev_to_node(&dev->dev));
-	if (!owner) {
+	binding->area.num_niovs = total_niovs;
+	binding->area.niovs = kvmalloc_objs(*binding->area.niovs,
+					    binding->area.num_niovs);
+	if (!binding->area.niovs) {
 		err = -ENOMEM;
 		goto err_free_freelist;
 	}
 
-	owner->area.num_niovs = total_niovs;
-	owner->binding = binding;
-	owner->area.niovs = kvmalloc_objs(*owner->area.niovs,
-					  owner->area.num_niovs);
-	if (!owner->area.niovs) {
-		err = -ENOMEM;
-		goto err_free_owner;
-	}
-	binding->chunk_owner = owner;
-
 	niov_idx = 0;
 	for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
 		dma_addr_t dma_addr = sg_dma_address(sg);
@@ -296,8 +277,8 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		size_t nr_niovs = len >> niov_shift;
 
 		for (i = 0; i < nr_niovs; i++, niov_idx++) {
-			niov = &owner->area.niovs[niov_idx];
-			net_iov_init(niov, &owner->area, NET_IOV_DMABUF);
+			niov = &binding->area.niovs[niov_idx];
+			net_iov_init(niov, &binding->area, NET_IOV_DMABUF);
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      dma_addr);
 			if (direction == DMA_TO_DEVICE)
@@ -311,17 +292,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			      binding, xa_limit_32b, &id_alloc_next,
 			      GFP_KERNEL);
 	if (err < 0)
-		goto err_free_chunk_owner;
+		goto err_free_niovs;
 
 	list_add(&binding->list, &priv->bindings);
 
 	return binding;
 
-err_free_chunk_owner:
-	net_devmem_dmabuf_free_chunk_owner(binding->chunk_owner);
-	goto err_free_freelist;
-err_free_owner:
-	kfree(owner);
+err_free_niovs:
+	kvfree(binding->area.niovs);
 err_free_freelist:
 	kvfree(binding->freelist);
 err_tx_vec:
diff --git a/net/core/devmem.h b/net/core/devmem.h
index a5ee2d8d9169..20a3eb90ea7f 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -14,9 +14,9 @@
 #include <net/netdev_netlink.h>
 
 struct netlink_ext_ack;
-struct dmabuf_genpool_chunk_owner;
 
 struct net_devmem_dmabuf_binding {
+	struct net_iov_area area;
 	struct dma_buf *dmabuf;
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sgt;
@@ -27,7 +27,6 @@ struct net_devmem_dmabuf_binding {
 	 * dereferenced.
 	 */
 	void *vdev;
-	struct dmabuf_genpool_chunk_owner *chunk_owner;
 	/* Protect dev */
 	struct mutex lock;
 
@@ -83,11 +82,6 @@ struct net_devmem_dmabuf_binding {
 };
 
 #if defined(CONFIG_NET_DEVMEM)
-struct dmabuf_genpool_chunk_owner {
-	struct net_iov_area area;
-	struct net_devmem_dmabuf_binding *binding;
-};
-
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
@@ -102,18 +96,12 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack);
 
-static inline struct dmabuf_genpool_chunk_owner *
-net_devmem_iov_to_chunk_owner(const struct net_iov *niov)
-{
-	struct net_iov_area *owner = net_iov_owner(niov);
-
-	return container_of(owner, struct dmabuf_genpool_chunk_owner, area);
-}
-
 static inline struct net_devmem_dmabuf_binding *
 net_devmem_iov_binding(const struct net_iov *niov)
 {
-	return net_devmem_iov_to_chunk_owner(niov)->binding;
+	struct net_iov_area *owner = net_iov_owner(niov);
+
+	return container_of(owner, struct net_devmem_dmabuf_binding, area);
 }
 
 static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
@@ -123,11 +111,11 @@ static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 
 static inline unsigned long net_iov_virtual_addr(const struct net_iov *niov)
 {
-	struct dmabuf_genpool_chunk_owner *co =
-		net_devmem_iov_to_chunk_owner(niov);
+	struct net_devmem_dmabuf_binding *binding =
+		net_devmem_iov_binding(niov);
 
 	return net_iov_owner(niov)->base_virtual +
-	       ((unsigned long)net_iov_idx(niov) << co->binding->niov_shift);
+	       ((unsigned long)net_iov_idx(niov) << binding->niov_shift);
 }
 
 static inline bool
-- 
2.53.0-Meta

