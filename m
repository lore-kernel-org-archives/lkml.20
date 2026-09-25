Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131B46E000
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367334; cv=none; b=SBH1NzPgXu6wmX7NuKOxX8o/3Fe9yBqJptXE3bKz/Lt7cfaGCIs7LEpHJnmfmi31stUELyvAcCyGMQyDGeBOh6t+Pr0eqKo7JuTrykqMDY0sTEwkcvXjSMYrIvy8BLhSzekPDKPd+5smrxu0AjCRthmSuJY7O8+qCMUPjPRb/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367334; c=relaxed/simple;
	bh=jrIbSXe0ghXJB/LQBJtfthNss+7v+XteNQd1NuJe2A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDWQNRmbyxzQO5y+koJ0TSetQaSbQnUbk52vaV1Dbsz8tuzXhVTTbnHFy64nM0iIkFFC4JyKq8sNMOFTbFTngKfBrBz0Ur1PWC7JEceYW45Yv0FMF09EkU5HhNqurtdc5mV992Il/9wnAElWYnybbkODJlT/fs8weOwTLb0M3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptzb8zPF; arc=none smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptzb8zPF"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-91055adb192so7418026d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367329; x=1790972129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBCpiQtKggPdnqKhH+gXIj3CyY2qPAcaPpMrgmzXM9E=;
        b=Ptzb8zPFgBNw2JC2pn3qDInZe2miPuh2aHqmn02I+Pqq6sicogpwGv3+2GmJTLF4Q0
         BSERH196PR9geIkqB//SYyvq1SPJmcb6n9JxwHyYy8TSpOlRzjkTk0p+VcYCjmS9ltUY
         GW1mFqUEweA1LhsKi7Q88mh9dW5d3c1U87ps3HM6B2fwFk06XtXm2RLJ/AeGAkzxj06h
         EjbItWLA2HqukAYD49WbculcM05cZTH240H2jlIgPHLuS9DyWkSP0hGbRP/Rl61YStBb
         Jec35mN/DrOT7jQNbh6iHw3aDNUHyH0u2sgHPhQq9jWmnc8uZPI06uNxllPxwVuQMVLY
         c4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367329; x=1790972129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBCpiQtKggPdnqKhH+gXIj3CyY2qPAcaPpMrgmzXM9E=;
        b=qoSDPquXbyCjMvwAP0/A5PvI2PpiYZniWZnnv3roTXxP8KpfhHMaqfo5k4DAbwKTn4
         VLHPZ/zexZKjAX1S1Z1Ff8J6ZI8UNS6n6z2jSqHw6EFr9mU5BbQFc+5HkTsUsR6STbxJ
         bi2OZlCJy9Au8aj1OWTXixLOvHSV1idTZTx4aeLur7KM1G0XJyRBo9xiR0x5iE3IJOpp
         zdWMAllr8gc0KISI8GBS7y++9aRNsQR4h1+5oAEY5NF7TNHXszOlj7rKQld9xZe2Bjox
         JDUR6OlDXDrKscPphUn0y8fLfNv3dNy/vyjz6iztdr+dBTv81Jejm7IGN+C6Ojp29RL6
         jDdw==
X-Forwarded-Encrypted: i=1; AKwUvBy6oRKNe6WUlbLt/u4HzkeJAOs7revT+OnDYQTDaeU2myCdmSE8MMpeAbhKEtlmviTKsh78hYou7SSgHgA=@vger.kernel.org
X-Gm-Message-State: AFuF++lA9be8QVPcaI7UDIX2nYxgAxcVhq5m4+Ukk25mtXegULLQFgTU
	DTCXKEBKewbia6f25Zc7jXND53yCYtunaMT7vsK6x5TxOqg46dNYbZ93
X-Gm-Gg: AYBFou1mDyPwh3ZCnqzrhSeFm3vD32lEYNQC1UOta9d20QHed/ZMPEYXk1w0GmORwfu
	TjchGGtr3R0AFCfNW47L462A88oYcT/8z9dwI0dVr5w5xwAn3nfcPWbPHyYZ0pmE3/wvLMlikFk
	oqtecbhLARR7C3pfY0vV0EUUBtXt2IpxZaSiQY8YAeMJMyeN2mN9KnK2S9F5dTqdMUYMxRpYe8I
	QZgyxlhr4mz3kt/G9GpAVXQLnwegABJ9LpztWijzrGWOfb2/KAYfaLgIKMrsk5x46/x6LWfO7nC
	C9OOenI2dWLpQ5E4VYhNKO4ex7/YVdilh5vDOgHguFOUSC82MJSczoTADi1txow6NWpk0bR0iR3
	PKdFHuk1uQL4xxes3QBylc5G5cv8tpJJtJZ+Ai1rgKlfFHY9+GQLB4cdeAZPn9cG2bGNZ8c9fWR
	YAnh7z9qk2/7s9X3HU7iWZzjVrfPE90rZFdNy1vSmnlUiyoy/MFNYipthZ1buCXYML
X-Received: by 2002:a05:620a:198a:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c43ca66cemr669890885a.38.1790367329292;
        Fri, 25 Sep 2026 13:15:29 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44949469sm259420285a.35.2026.09.25.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:15:28 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/3] net: devmem: decode DMA addresses for TX
Date: Fri, 25 Sep 2026 13:15:22 -0700
Message-ID: <20260925201522.254717-4-sdf@fomichev.me>
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

On 32-bit architectures where dma_addr_t is wider than unsigned long,
page_pool_set_dma_addr_netmem() stores page-aligned DMA addresses shifted
by PAGE_SHIFT. The net_iov branch of __skb_frag_dma_map() adds byte offsets
to the encoded value, so the NIC is programmed with an invalid DMA address.
This can trigger an IOMMU fault or DMA from unintended memory.

Consolidate DMA address encoding, decoding, and representability checks in
netmem helpers. Use the common decoder from the page pool and net_iov TX
paths so both interpret stored addresses consistently.

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/linux/skbuff.h          |  7 +++++--
 include/net/netmem.h            | 27 +++++++++++++++++++++++++++
 include/net/page_pool/helpers.h | 10 +---------
 net/core/page_pool_priv.h       | 14 ++------------
 4 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 84308498a3a8..38b7d7389452 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3816,9 +3816,12 @@ static inline dma_addr_t __skb_frag_dma_map(struct device *dev,
 					    size_t offset, size_t size,
 					    enum dma_data_direction dir)
 {
+	dma_addr_t addr;
+
 	if (skb_frag_is_net_iov(frag)) {
-		return netmem_to_net_iov(frag->netmem)->desc.dma_addr +
-		       offset + frag->offset;
+		addr = netmem_dma_addr_decode(
+			netmem_get_dma_addr(frag->netmem));
+		return addr + offset + frag->offset;
 	}
 	return dma_map_page(dev, skb_frag_page(frag),
 			    skb_frag_off(frag) + offset, size, dir);
diff --git a/include/net/netmem.h b/include/net/netmem.h
index bccacd21b6c3..cc97611632dc 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -358,6 +358,33 @@ static inline bool netmem_is_pfmemalloc(netmem_ref netmem)
 	return page_is_pfmemalloc(netmem_to_page(netmem));
 }
 
+#define NETMEM_32BIT_ARCH_WITH_64BIT_DMA	\
+	(sizeof(dma_addr_t) > sizeof(unsigned long))
+
+static inline unsigned long netmem_dma_addr_encode(dma_addr_t addr)
+{
+	if (NETMEM_32BIT_ARCH_WITH_64BIT_DMA)
+		addr >>= PAGE_SHIFT;
+
+	return addr;
+}
+
+static inline dma_addr_t netmem_dma_addr_decode(unsigned long addr)
+{
+	if (NETMEM_32BIT_ARCH_WITH_64BIT_DMA)
+		return (dma_addr_t)addr << PAGE_SHIFT;
+
+	return addr;
+}
+
+static inline bool netmem_dma_addr_fits(dma_addr_t addr)
+{
+	/* We assume page alignment to shave off bottom bits,
+	 * if this "compression" doesn't work we need to drop.
+	 */
+	return addr == netmem_dma_addr_decode(netmem_dma_addr_encode(addr));
+}
+
 static inline unsigned long netmem_get_dma_addr(netmem_ref netmem)
 {
 	return netmem_to_nmdesc(netmem)->dma_addr;
diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 87a4e13886e1..cd021832c3fa 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -408,9 +408,6 @@ static inline void page_pool_recycle_direct_netmem(struct page_pool *pool,
 	page_pool_put_full_netmem(pool, netmem, true);
 }
 
-#define PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA	\
-		(sizeof(dma_addr_t) > sizeof(unsigned long))
-
 /**
  * page_pool_free_va() - free a va into the page_pool
  * @pool: pool from which va was allocated
@@ -427,12 +424,7 @@ static inline void page_pool_free_va(struct page_pool *pool, void *va,
 
 static inline dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
 {
-	dma_addr_t ret = netmem_get_dma_addr(netmem);
-
-	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
-		ret <<= PAGE_SHIFT;
-
-	return ret;
+	return netmem_dma_addr_decode(netmem_get_dma_addr(netmem));
 }
 
 /**
diff --git a/net/core/page_pool_priv.h b/net/core/page_pool_priv.h
index 2fb06d5f6d55..430b97cd88da 100644
--- a/net/core/page_pool_priv.h
+++ b/net/core/page_pool_priv.h
@@ -18,18 +18,8 @@ void page_pool_unlist(struct page_pool *pool);
 static inline bool
 page_pool_set_dma_addr_netmem(netmem_ref netmem, dma_addr_t addr)
 {
-	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
-		netmem_set_dma_addr(netmem, addr >> PAGE_SHIFT);
-
-		/* We assume page alignment to shave off bottom bits,
-		 * if this "compression" doesn't work we need to drop.
-		 */
-		return addr != (dma_addr_t)netmem_get_dma_addr(netmem)
-				       << PAGE_SHIFT;
-	}
-
-	netmem_set_dma_addr(netmem, addr);
-	return false;
+	netmem_set_dma_addr(netmem, netmem_dma_addr_encode(addr));
+	return !netmem_dma_addr_fits(addr);
 }
 
 static inline bool page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
-- 
2.53.0-Meta

