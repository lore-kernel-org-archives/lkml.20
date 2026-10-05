Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E5F4BA1D8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231505; cv=none; b=pKLGCp0TsytpEeyTf1CVhoYrNUxW+lXfTaDq2cArJh4za6UeMJt2FlZ43349KGHYJVzOJcbHVhBwPeKKDkiGQxGnrp1jOxSEOY0QlkDZlmkTeAW3F5m44jxWb9Zo6CM7WKQMw+ry4bp4irLibmgp2LKWKlRPjrXbDKSyoyhgdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231505; c=relaxed/simple;
	bh=BXoFvpeLE9KoGidUa4e0smSWqKCrh9rC2ND9HlaDXpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDNFzl/kR25cyS4eZZMdehyWk8N042oHGU0XdzPkT3e8nM7201vd4pCx3xRpKcJN2j3mzzqu7IgGAIsMSlcE7Kc7c8VKdA2fNkPEKe4YKWyB4niSn/OhVDFaeXao2PGPTag3Li/o81QKx9vFN/CS11aOSmelpOuE9z4h2mQwZCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q92ijepU; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q92ijepU"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3a7a8e9a874so159966a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231503; x=1791836303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UaqXT4ErWO3i859O4DLN6R0LDK8LuXc4vcaqlzX/HHc=;
        b=q92ijepUkteqdvbpwBJ+Q9rqk5H07n+2J55qNuy1I1QxHjZ6pwiTUJ0MBn5WmxPYcn
         XsPKR/miPhuuHD5Rg76ez7Gn8ScmGkTNNHJNakzLEHqr1zsfIYbQrHWQptOKnwEU4rdz
         bgRpOuhrEgtk0LJRqeVqyNtD6Lo1FIJiJ3MUbVnpvnicu3B6K6WacbZPskjtuBvqC/OQ
         QQT/kOpyXxiQF88mB5KXGUeNjgSPbofTUBXNvhkc5fPz6TFYv4I9wSvol/MSqFe/XBws
         N/NG/yj/wBX9aDAXCv2XQZ8wB0ZwRxTPIpRpKXwuYOx125w7tDftDATSzzHQp2syMVGd
         HmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231503; x=1791836303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaqXT4ErWO3i859O4DLN6R0LDK8LuXc4vcaqlzX/HHc=;
        b=enl+oCx/2kq+rZ5/ae+z+ekJeaohv70kTkmC1LED66jAqBZKXtO89DdFeRQLUp0QJv
         oosA53XiUPEeDB2J8NIBL1bfP7P5mnYRAc4SgrLAKsuRMnoBWGt3cHFtCALzj06hohw0
         3Hhpt9+yCHznH1PJyvkPvK73IZmjmiZNrA+LhjQlA+8iOlFD3FCHNqUd8z5fCe3/LHTg
         CnJFPfN/BXuMrG6dGyhjwzmJFM7FblWUUtvyzPPRxdr6aG9XjNk7XapXeONvG5niGptJ
         AKYWP94zcdHL/DiO5othIpWAKZDfF4JqOEMOXvn/svkM0beEsXJ318KfImq+DiYexpCe
         wDow==
X-Forwarded-Encrypted: i=1; AKwUvBwrXB4fsZKlXFt7KePSqGpPVL9/nVPZ8WVxnPRWRXBYo5KsgfQajBYY9mZqD8f0UlcZwKQuy/Z8nDTxq0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlRmDJOkc/W5X0biR87V43c7G2Bx0cYPN5d85/ON/p74BdtkTU
	4NVsYEeigmSL2Ev6DdPPEUPCoafr59eU/gZ0dDhqGYXdpKd2mYB6jP1S
X-Gm-Gg: AYBFou1ue1djoeYOlQWsDV/aitwWtV8Q6V3M7zV84+5HW0SBSx15GYYR/egA+O9JV8k
	ZclOfoByz4f12oLF/KNMN+LufyLMFWrYRiXjT8zzw8/bbl9ryArCYZ6hlWU4ohUTUDTy1Gxd3xS
	/oUNftd3PyIuhH5MKJsLc5J56DQanSn5YfsAU94SWg7+nMRRctO0LPW/he/jfsK2P2NOW8aKnwi
	Q0qO132rrm3D95DHOirHoXthuSV1qe6d9Vj32ktNXJ43qz+DIY3JjZp+gVrlv1g2/UBXo1B53XU
	oaekNc3Q9G/4y6huEWLFmOFJfQG0EJSWTcXYrJj987QkGBbQP7UF5Yb5MbyR12TtkVWRxYSOCqI
	AKzHiFFmk3iC5K7eXKwmw/s9xC0USH4sTX4SSsOQkZi2IMoH2Vdrpq/e1XwWA0ftsZ2iu0sC7Jh
	JGN8pQNm8uHheWGyY5LVypOuKaLdHlxzixV9xxs1BQMKzJJsX8rS+jjNRRUsNIxWMc2n6M1y/jW
	Xo=
X-Received: by 2002:a17:90b:582f:b0:3a4:ee64:f492 with SMTP id 98e67ed59e1d1-3a85439e2camr322431a91.33.1791231503215;
        Mon, 05 Oct 2026 13:18:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853d00fc5sm1125229a91.16.2026.10.05.13.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:18:22 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: devmem: remove net_iov_area base_virtual
Date: Mon,  5 Oct 2026 13:18:22 -0700
Message-ID: <20261005201822.3060658-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 083e64a3af77 ("net: devmem: replace gen_pool with
freelist"), a binding has a single net_iov_area covering the whole
dma-buf, and base_virtual is always 0. Its only reader is
net_iov_virtual_addr(), where it adds nothing. io_uring zcrx never
uses it.

Drop the field and the store, and compute the dma-buf offset from the
net_iov index alone.

No functional change. From review feedback on:
https://lore.kernel.org/netdev/asPUZ8DPllHd6Yu9@devvm7509.cco0.facebook.com/

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/netmem.h | 3 ---
 net/core/devmem.c    | 1 -
 net/core/devmem.h    | 3 +--
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index cc97611632dc..0cc8572f62ca 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -102,9 +102,6 @@ struct net_iov_area {
 	/* Array of net_iovs for this area. */
 	struct net_iov *niovs;
 	size_t num_niovs;
-
-	/* Offset into the dma-buf where this chunk starts.  */
-	unsigned long base_virtual;
 };
 
 static inline struct net_iov_area *net_iov_owner(const struct net_iov *niov)
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 71c83730d73d..07c62e2e3088 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -252,7 +252,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		goto err_unmap;
 	}
 
-	binding->area.base_virtual = 0;
 	binding->area.num_niovs = dmabuf->size >> niov_shift;
 	if (direction == DMA_TO_DEVICE) {
 		binding->tx_vec = kvmalloc_objs(struct net_iov *,
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 28d6fa7bcb57..1cec10f0257c 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -112,8 +112,7 @@ static inline unsigned long net_iov_virtual_addr(const struct net_iov *niov)
 	struct net_devmem_dmabuf_binding *binding =
 		net_devmem_iov_binding(niov);
 
-	return net_iov_owner(niov)->base_virtual +
-	       ((unsigned long)net_iov_idx(niov) << binding->niov_shift);
+	return (unsigned long)net_iov_idx(niov) << binding->niov_shift;
 }
 
 static inline bool
-- 
2.53.0-Meta

