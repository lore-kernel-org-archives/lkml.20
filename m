Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B041A504
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367332; cv=none; b=bus8fLYQXf4O1tSwLX6GZAGRnActFWStWmgrWjq0F1yKpINgDS6RUUPSPSQyHCTz9ry3Er2g3cZAS8cFb3dFAHvB4HwzIc6QfdmLIHNAPl6jycCRhrtJUBYRLmjT9y6XTAtetJdQmUyCUERlZM3CEg6iDUOQ4z45ipaBhxab9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367332; c=relaxed/simple;
	bh=GxxPmTBlqbkJEX3Y0QUdmhQk9+36K3g7N4gwnnbIfmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B37XVlxOVi2Ec3IVJTmV19HsAHyb9/2fKQiwVuJcLo72oKy6J/1Q8eRprs6DYIKhWcFA3yv9mwBj2ipZmoibQjzJxZ26JmZBrmxostYRKa1yqz8YGM9hJl/JrtPf9vEZBOCPFCqRXI+QpVkFwVPQzZfPc7cYUZWrZf9N3XtvUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5fNlO80; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5fNlO80"
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-939fcb15713so46248485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367327; x=1790972127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDsxnmMFwcqjzQxUG7fH5CvkUKPGejMwFETw/62JdIo=;
        b=d5fNlO80abGLIVpMN28Tvib4WM6M/O8gYyGtbqMeFnPdXGB0PaRhKfbd9pQudW9uWu
         IkPlMuzXOanYFtLfkxGXC0GwIAiNvO+Lz9dkSpw6Ry1n871YPOaaaV++fbgOuy3rxzd7
         FfVJhcZDCyGJC2SlbW4KqjeVCGpI/q79R6sVCz41aRDzGq340ZJt3elxj6DdJJI2Rbij
         tcUYQo9HAzG6zhFJsepfCblwTrSZuBi3EXYuZwuUUDidlu20fqkE9YCLkJnWAAk1Ij1q
         ZcEa9XDEroFY9ABYxsyuboRvmG7zzFLYnJNtfsZDrFQcSZ2BL99eku85ZmwzZfOvFD28
         YBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367327; x=1790972127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDsxnmMFwcqjzQxUG7fH5CvkUKPGejMwFETw/62JdIo=;
        b=vgypB4dgbohujksOZz243nn8mKFCv6r/AE8KsKlggqk8z+I3t5X85kLedfH3NR4f5H
         5NnuT2PI2QTbvbnjqEpRK9OzN8D9grBi5eze1HjeB/Q/I6nL/nn7VXG1IRqbltSc/71Z
         Skm6fbtWPMrS9p8ivUWJBGKMM2nKtuQMCxjtBUGWocLRIsvcFFWGPP/mQ8SYGj2O0miV
         4aJSYzqCQ9i5+hJS6hcRGkHNJ3tUi6HtGx2tXF6aeZmt0KO3c1EcEzGShmLsgXZt9PNT
         iMuBqrGH607KRlVMNz3t1tL2RG6zzHMI6n8ddSUJpy4MtrZ821agGk/Qy2E788In9/70
         RLmw==
X-Forwarded-Encrypted: i=1; AKwUvBy0LtDkmBvhyw4wF60jCowSBA9BhaaCS6M1arARmyX/P+f+1cTF/Cs98nVNque9nK6VdF3YwUs1a1K+H6A=@vger.kernel.org
X-Gm-Message-State: AFuF++kAElzSTvOkgWzTOScHZXmXBoq8bwp6SDxFgIDgT9JQS4O/B63m
	5h3cNGGGMqkeq8WVka4VrsoZmAa/fUgRTTD3Q1NHu8XCxIeuPzM5ZRyN
X-Gm-Gg: AYBFou1rlkA3RRDEgojwTSYHQK7e/rkKSxcxrx/FR7A7s50D4PLRpOcoLmPNYt8rMz0
	vBWaMOrxIoRDlXwiwpjtv9QZhW2F/icqd2/Q0GKFM6c+uppL3h/fJenpwGYHesAR5ikPQdpgaHo
	/MfFekfxWJpOOPpuFs8LgdRSryazB2xsKb6rll2zI1/PtHRZCltpm1gVXlIKMlHb3eY4Zl4wX/t
	6Px+oCe2h08qkbrp0uqJFL+5EJGnrM3T/1aTVLby2xIVe7X1fds72K7iGVdYhCdpmDO0wQlzPoC
	K+qbHJAkTF/ozqArkkobMe2kwWNpPzogIsRhDKk6wXT+rfs1w8QGK40oTxHQr0fMXUV+8vPSI+/
	rNNHwRFZ9o5VzzBVl9PxqFe1SxsJOj9c9pG7fiafyAHuqkb28lxyC7BuAyTaw6hLnUIMa0ijS/D
	Aq12LAuyavCYh+j8Ds+ZMeHIzxaZyldi+zfXeeMPS1CMfdpkWnouzuIalkwh8KRkasHA==
X-Received: by 2002:a05:620a:3190:b0:93b:d79e:18fa with SMTP id af79cd13be357-93c43d34755mr660573485a.61.1790367327532;
        Fri, 25 Sep 2026 13:15:27 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448adc24sm263441885a.8.2026.09.25.13.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:15:27 -0700 (PDT)
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
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	kaiyuanz@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/3] net: devmem: use memory provider helpers for net_iovs
Date: Fri, 25 Sep 2026 13:15:21 -0700
Message-ID: <20260925201522.254717-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925201522.254717-1-sdf@fomichev.me>
References: <20260925201522.254717-1-sdf@fomichev.me>
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

Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/devmem.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 704d02bd8bc8..71c83730d73d 100644
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
 
@@ -273,7 +271,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			goto err_unmap;
 		}
 	}
-	binding->area.niovs = kvmalloc_objs(*binding->area.niovs,
+	binding->area.niovs = kvzalloc_objs(*binding->area.niovs,
 					    binding->area.num_niovs);
 	if (!binding->area.niovs) {
 		err = -ENOMEM;
@@ -300,8 +298,12 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
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
@@ -467,19 +469,9 @@ netmem_ref mp_dmabuf_devmem_alloc_netmems(struct page_pool *pool, gfp_t gfp)
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
@@ -504,8 +496,7 @@ bool mp_dmabuf_devmem_release_page(struct page_pool *pool, netmem_ref netmem)
 	if (WARN_ON_ONCE(refcount != 1))
 		return false;
 
-	page_pool_clear_pp_info(netmem);
-
+	net_mp_niov_clear_page_pool(netmem_to_net_iov(netmem));
 	net_devmem_free_dmabuf(netmem_to_net_iov(netmem));
 
 	/* We don't want the page pool put_page()ing our net_iovs. */
-- 
2.53.0-Meta

