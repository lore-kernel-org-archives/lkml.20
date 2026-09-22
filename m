Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5E4E2F0B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109853; cv=none; b=BDMAK/6NRJJobZP3hIu5Agv3vcOSAt1QLBzmsCI9KH5UjdgaKPxvF9qAJ/uSahLOHXlVyyH67/4F9GKJ7QKN9UhnpHZvvHIOUO4HKU7uR+INhabn+LkPr6n1UztdT8s5rI8ZJEmQ0eYEhnrA+IZRzRVQl/XPyRRxjFEKzVl72xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109853; c=relaxed/simple;
	bh=skCoc+C0hEQPVu18sCy3a39JKiwa3vnAiGPPaMNlYOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWcLypLBgr7HSEDowBXaGsm/cAb4T2qwZk/qzcBTXp4XqVwieN911Rn3dExlFT6Z2yfp+51/us4eUO2z8ATX2MQmU1G/g3o9HAJVdcby4RDRdzsL+z2m/59BGFEQ6HfioKhjVQA4WJDORG+CZo7UwMk2KT54VCLZf3LFgy+FHrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlfHmxgS; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlfHmxgS"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc7323540dcso17582a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109832; x=1790714632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2XSgCg/L+gcV4fc8+Srep5u/tQwTGnGLQScsN2YpZw=;
        b=XlfHmxgSl9Gx8kKDvp+jLClKQMTvp2SYLnbKzqwZ31Kb4Ja/CLHhgiqwBl+N0/0qMY
         Kqi0KRaktuTsVx+4Nj5+hv3XbUobKMoAdU3IL/ZTBakEsu3M+gRG5k8lYMt5f3GX2Cs7
         dOqrTrTjAQDj1+WdKUC+oWp/xkigxsO+gWSj2cB3gEy/pH7KSReqVYK2Bfa5mElhKgho
         aXtOE8tl0onrPyj3ktK9suPZlnSkdkhJHf55WRWVk7EIyrvRg6zegZUaAPIjDDTxyAFh
         7AwFZQXQdtP2FW5ZiqePHpyFRgZ3rL4jr9Zhi4RUwuy1YyNjsVj96b6XeYIDCjU8aBx1
         Z4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109832; x=1790714632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2XSgCg/L+gcV4fc8+Srep5u/tQwTGnGLQScsN2YpZw=;
        b=zZIJ6VzWofwi4ufed+3zc8h54Hp4uCg8206Jyh+Y3JQsfIvc2n9c1NYc3CiqDeS7Ij
         ebNfXmQy3aQEgk2Kq7rMMTZIgS6VxXG9TvFt4lumRHCxDW81K5P0ME2BKGp+WlYdOuzh
         lJaRQamf6ol1nEnQnIZUk8Fn76HZOh+K5/tEcrAjw2A7pFOCWynrxdQnxVq7Pjw5axlj
         ea5oKZ3m6dqzRnOFyjrGRC7szQQn9tL+RNOnmyR2k2eU0zxvvV3KpxHA/OyIym4mo5P6
         rEfVHNlbev946OqqFWHbJYKbCmwr9vaD/LThxtzRyiN4ngjbZG85tBFV/RGne6W2mqQ+
         4a0g==
X-Forwarded-Encrypted: i=1; AKwUvBwhXM0mfCHLDq+rq1pYK+U7QKVnaEN5Wv7kps9o+9YnO7BI3s3FR441LxsPmVYfSE5J7W6AYfu2cGhW+48=@vger.kernel.org
X-Gm-Message-State: AFuF++ndwuleZi/3tSA345Wm2k2hb5bzLfzGhHgnA5T8cTN+qxechTQo
	V1BBBnFoMQQI9qrPG9IGfDuvNN3xGwQ5bXQLH0W+RWbBeAusn9GtzN70
X-Gm-Gg: AYBFou18Gz3JSVpdpunBp/LmNfXmAmgfojZJbTjd3vjSQyOeAYU/UVeE/roHjpD6J3d
	i9PXhvp3ZQ5zypXfOCxEsJjJUrcpzWSE6U4ChRs8hubGPafup0+qba25nlkXk7Urvl82/otsMq9
	AFD7XXRGC2l48k5RJ2H09vyq1Kdc7lRE1XRTXpK6fjIptDfm7Vzvzc6QLdDj1VrfNB0JDL3nNeZ
	jSSTV4IaEmXlsfQSik5uiY14Gu4xBFVy6HZ5aQdXZ6Q+uLzn9zu3lq22Pmo65/yh9eWOGQ9V1u/
	0/BPn7XfCrPgsvNSGh9syqsd61xY/qCQzWfefqhuFQjubjIYS0gaXnjnghZ0JmzRUKsIU12RV46
	iNVHvLlX5VM7Wjlmdd1Q+jYXkm/Yi7G2oTqbGS/XCV5t/ZI5UPG4XJlVA5dzM6PygCg1Lc6y4X0
	lT1Z3tVdZfH1m/k6I+IZRDj/NdBfmd3+NipVBnjmzx7p/qNLkr06GfpguFZob6k7vc
X-Received: by 2002:a05:6a00:b807:b0:857:72f8:dca6 with SMTP id d2e1a72fcca58-87d2374c350mr495409b3a.12.1790109831832;
        Tue, 22 Sep 2026 13:43:51 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9769sm280202b3a.46.2026.09.22.13.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:43:51 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	hawk@kernel.org,
	ilias.apalodimas@linaro.org,
	asml.silence@gmail.com,
	axboe@kernel.dk,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	kaiyuanz@google.com,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: [PATCH net-next 2/3] net: devmem: use memory provider helpers for net_iovs
Date: Tue, 22 Sep 2026 13:43:47 -0700
Message-ID: <20260922204348.717198-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922204348.717198-1-sdf@fomichev.me>
References: <20260922204348.717198-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use public memory-provider helpers for DMA address storage and page-pool
association instead of open-coding page_pool state and accounting.

Zero the net_iov array because net_mp_niov_set_page_pool() ORs
PP_SIGNATURE into pp_magic. Reject DMA addresses that cannot be
represented in net_iov metadata.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/devmem.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index c1c1872b88de..0fc77c1a2956 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -17,11 +17,9 @@
 #include <net/page_pool/memory_provider.h>
 #include <net/sock.h>
 #include <net/tcp.h>
-#include <trace/events/page_pool.h>
 
 #include "devmem.h"
 #include "mp_dmabuf_devmem.h"
-#include "page_pool_priv.h"
 
 /* Device memory support */
 
@@ -247,7 +245,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			goto err_unmap;
 		}
 	}
-	binding->area.niovs = kvmalloc_objs(*binding->area.niovs,
+	binding->area.niovs = kvzalloc_objs(*binding->area.niovs,
 					    binding->area.num_niovs);
 	if (!binding->area.niovs) {
 		err = -ENOMEM;
@@ -274,8 +272,12 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		for (i = 0; i < nr_niovs; i++, niov_idx++) {
 			niov = &binding->area.niovs[niov_idx];
 			net_iov_init(niov, &binding->area, NET_IOV_DMABUF);
-			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
-						      dma_addr);
+			if (net_mp_niov_set_dma_addr(niov, dma_addr)) {
+				err = -EFAULT;
+				NL_SET_ERR_MSG(extack,
+					       "dmabuf DMA address cannot be represented");
+				goto err_free_niovs;
+			}
 			if (direction == DMA_TO_DEVICE)
 				binding->tx_vec[niov_idx] = niov;
 			else
@@ -439,19 +441,9 @@ netmem_ref mp_dmabuf_devmem_alloc_netmems(struct page_pool *pool, gfp_t gfp)
 	if (unlikely(!allocated))
 		return 0;
 
-	for (i = 0; i < allocated; i++) {
-		struct net_iov *niov = netmem_to_net_iov(netmems[i]);
-
-		niov->desc.pp_magic = 0;
-		niov->desc.pp = NULL;
-		atomic_long_set(&niov->desc.pp_ref_count, 0);
-
-		page_pool_set_pp_info(pool, netmems[i]);
-
-		pool->pages_state_hold_cnt++;
-		trace_page_pool_state_hold(pool, netmems[i],
-					   pool->pages_state_hold_cnt);
-	}
+	for (i = 0; i < allocated; i++)
+		net_mp_niov_set_page_pool(pool,
+					  netmem_to_net_iov(netmems[i]));
 
 	/* Return the last one, the rest stay in the page_pool cache. */
 	allocated--;
@@ -476,8 +468,7 @@ bool mp_dmabuf_devmem_release_page(struct page_pool *pool, netmem_ref netmem)
 	if (WARN_ON_ONCE(refcount != 1))
 		return false;
 
-	page_pool_clear_pp_info(netmem);
-
+	net_mp_niov_clear_page_pool(netmem_to_net_iov(netmem));
 	net_devmem_free_dmabuf(netmem_to_net_iov(netmem));
 
 	/* We don't want the page pool put_page()ing our net_iovs. */
-- 
2.53.0-Meta

