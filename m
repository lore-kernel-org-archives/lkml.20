Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E0C49CF2B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141562; cv=none; b=gvfgL8Z7s3kP3PKCcPryc11Jg43i1rwv7/5FZNKiuUoY0W7Gdn+xHa/KGzMFQ/ykoN4Wq7OtsgO0pKMVDOCC/TlZmGgUiYhWBwqNXQFDmg5Og3gEs4WdCYwJo2jp2//LdWAnUpEXmYRMl0sXmvAEsEiwCPquKvIrzjOhiZKWulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141562; c=relaxed/simple;
	bh=dwidtErhUY0SPgza+QmVGqpbGK/gB5oWWj/NKusH69E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcCscxTrwSXZ2ps07llmRdv2m843gazVNBR4Y0Y4pEq4njcKNNnHeO2rWAvv0SS5aQob4gewQGu7OVaNR/hepVYc+Gv/+oyll6DAlebyFxGeOh4rxtK92s7+5rfhjE40qdMtt1+98y7++0qBiKja0XkCOiv2mW0TKPvCU0wWXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSAvZuPj; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSAvZuPj"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso470356a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141559; x=1789746359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjLjJHsnoGr4hoUce+r9jZNs+03YVIaRC1YD0zIjtuk=;
        b=jSAvZuPjOIcf520SmN2LHt/v8fV2WlFFhEpvExors8CvLVAqNs8brpLv3+XcDWB8fE
         3qoWJ8e3lJbEopaJuzAkqc46XtnuBclSEot7/RIT8l6R2ksd+UihdYQB/LhIX7tiKYEC
         IRFlU+kK5D+BRfYO3HeDYaKWEz9KbA9PyU+Zud+Qxyje+lSoF6Pinn/VZ17t1jStZK9v
         ynAgnJT8qYfzxNTpDjC/iyKVlFJUeS644tzE98oEt+ijIeWEvkolWGdmNmqgM0A2fg2f
         syvJz3g2NDnzI4e7vryRlsO5aaqiqIt0OYxWoOcWM/6038g24UFGQ+q5IDpo8/SXqD/Z
         QPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141559; x=1789746359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjLjJHsnoGr4hoUce+r9jZNs+03YVIaRC1YD0zIjtuk=;
        b=fEbpeyo1QVcpPalG9VnLayZsMOf+H0uuZoSd++TkZlbFBu/+oQM6upAG9axBuxq6jW
         O6JAASaxTkiufL4XS4L+hZQioZgRVSpDKLQ18KFbjGgiF1+QS03fs6Q6LbWbIND4l2NP
         Qec+p/VfcAcdgsI57MeS9O9t3Hiv8ByE/+cFs4M4pmyg+fy76DVCqbctLj34nFrl9ZtG
         ejwvO5olHsYuGJdoIDPLEbfF1o1aLLZLCEwuk/gsTM+/56HioJNDi+N8qR0UoCj6Lzd5
         tiaLldGp6BwSwAHQc1xU7rcvd3UIU+qwbV8DBSzuE649IKM8uqLGJ4gla3AjhPa2eqQi
         XsKg==
X-Forwarded-Encrypted: i=1; AKwUvBzuhioLI6UE8NXENrjUIdtkiD6sl4z9USvlnZ6MtTad5TCvkD2zs8Sq0fr+hc5cIlB8wtMA5FbmnndLbOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxgb1JsOf9Ed128EJep3gpAcdfI9Hio3cfvXuN9pEmaoAhcMaK
	iKOf3fdi5nJ2UF6Yt0nhVLjBEkfEipvUD6wl1k49VNGcbNFYZfMTKnQH
X-Gm-Gg: AYBFou3b/ydk1m927sfbdqyLCpNX3+Pl5Z4axxO1/RlgzyK2ODzmFeiGBCRXP+ZuHCf
	UTTvkUEBjnOHLOS77p8/n/nOofRPeogdf0BljOCvlb0YuiBMExmBFCKkTyWD88g4yP5ghf+y766
	fcs4cdHKBqkvjnv1KOtVlhKztF71OnL0coE6FehHVwCiiz6PraTB/5WDiba5g/MRqAlZZrbCHD7
	tYCT3v76jwLsuQrvsmmQFcCcbXs3DF66TOlxJN4U8jIkRSxbGbGhgySpGezgS++cXN8a4SNtoOW
	q9ikXRywtqTE2F7lUafOg9cujQ9hMph/v8Y/1nrqqItGIYlskZQYE+x6mHZQGGpheD9LAECkxoh
	FpMYXczTfiOJ0stDxEDSDdK8C7vtR83qXN6z8knGivSOtuzcc+x4MSRyx2pvOeNIFhPQSNMcLHo
	XKuIXwm+T0ZMwCwdqruu1lKcAU7S8Uqadp06iuZKbGmarRa1F/OsZaioUREu0a6NYx
X-Received: by 2002:a05:6a00:4106:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-86b325e5d14mr8976131b3a.25.1789141559536;
        Fri, 11 Sep 2026 08:45:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a3bc011sm1325837b3a.57.2026.09.11.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:45:59 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/3] net: devmem: batch net_iov allocations into the page_pool cache
Date: Fri, 11 Sep 2026 08:45:55 -0700
Message-ID: <20260911154555.739041-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911154555.739041-1-sdf@fomichev.me>
References: <20260911154555.739041-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename net_devmem_alloc_dmabuf() into net_devmem_alloc_dmabuf_bulk() and
make it refill page pool with up to PP_ALLOC_CACHE_REFILL NIOVs,
similar to io_pp_zc_alloc_netmems(). That should amortize recently
introduced freelist_lock.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/devmem.c | 59 +++++++++++++++++++++++++++++------------------
 net/core/devmem.h |  8 -------
 2 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 7949f8425bcd..a0dcc896dd12 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -58,25 +58,25 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 	kfree(binding);
 }
 
-struct net_iov *
-net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+static unsigned int
+net_devmem_alloc_dmabuf_bulk(struct net_devmem_dmabuf_binding *binding,
+			     netmem_ref *netmems, unsigned int count)
 {
-	struct net_iov *niov;
+	unsigned int i;
+
 	spin_lock_bh(&binding->freelist_lock);
-	if (unlikely(!binding->free_count)) {
-		spin_unlock_bh(&binding->freelist_lock);
-		return NULL;
+
+	count = min_t(size_t, count, binding->free_count);
+	for (i = 0; i < count; i++) {
+		struct net_iov *niov = binding->freelist[--binding->free_count];
+
+		binding->freelist[binding->free_count] = NULL;
+		netmems[i] = net_iov_to_netmem(niov);
 	}
 
-	niov = binding->freelist[--binding->free_count];
-	binding->freelist[binding->free_count] = NULL;
 	spin_unlock_bh(&binding->freelist_lock);
 
-	niov->desc.pp_magic = 0;
-	niov->desc.pp = NULL;
-	atomic_long_set(&niov->desc.pp_ref_count, 0);
-
-	return niov;
+	return count;
 }
 
 void net_devmem_free_dmabuf(struct net_iov *niov)
@@ -434,20 +434,35 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
 netmem_ref mp_dmabuf_devmem_alloc_netmems(struct page_pool *pool, gfp_t gfp)
 {
 	struct net_devmem_dmabuf_binding *binding = pool->mp_priv;
-	struct net_iov *niov;
-	netmem_ref netmem;
+	netmem_ref *netmems = pool->alloc.cache;
+	unsigned int allocated, i;
+
+	if (WARN_ON_ONCE(pool->alloc.count))
+		return 0;
 
-	niov = net_devmem_alloc_dmabuf(binding);
-	if (!niov)
+	allocated = net_devmem_alloc_dmabuf_bulk(binding, netmems,
+						 PP_ALLOC_CACHE_REFILL);
+	if (unlikely(!allocated))
 		return 0;
 
-	netmem = net_iov_to_netmem(niov);
+	for (i = 0; i < allocated; i++) {
+		struct net_iov *niov = netmem_to_net_iov(netmems[i]);
 
-	page_pool_set_pp_info(pool, netmem);
+		niov->desc.pp_magic = 0;
+		niov->desc.pp = NULL;
+		atomic_long_set(&niov->desc.pp_ref_count, 0);
+
+		page_pool_set_pp_info(pool, netmems[i]);
+
+		pool->pages_state_hold_cnt++;
+		trace_page_pool_state_hold(pool, netmems[i],
+					   pool->pages_state_hold_cnt);
+	}
 
-	pool->pages_state_hold_cnt++;
-	trace_page_pool_state_hold(pool, netmem, pool->pages_state_hold_cnt);
-	return netmem;
+	/* Return the last one, the rest stay in the page_pool cache. */
+	allocated--;
+	pool->alloc.count = allocated;
+	return netmems[allocated];
 }
 
 void mp_dmabuf_devmem_destroy(struct page_pool *pool)
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 20a3eb90ea7f..7195769b8bd1 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -133,8 +133,6 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
 void net_devmem_get_net_iov(struct net_iov *niov);
 void net_devmem_put_net_iov(struct net_iov *niov);
 
-struct net_iov *
-net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
 void net_devmem_free_dmabuf(struct net_iov *ppiov);
 
 
@@ -191,12 +189,6 @@ net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 	return -EOPNOTSUPP;
 }
 
-static inline struct net_iov *
-net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
-{
-	return NULL;
-}
-
 static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
 {
 }
-- 
2.53.0-Meta

