Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E15218AB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911561; cv=none; b=kVcxx94cdcrfg4QI3rpSNJYqVv8PUHctLT84Z/Eivd67mQZFgC6eDHOanpcoaafi8tx31k58HzfzYeYSqYqEZ4Eh+IJlSa6Sf0Yh6QkwGAZzOh4Vz5eYpJTqOJp4uiod85RZ1c1NyOZCwHAT6p6tdt8vq7lS4o64ZdGHXHiBGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911561; c=relaxed/simple;
	bh=vZ3XOjh7+MDb5NRUrgu7NjsmjoO7dxSF5Zx4rb2v0VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxB8wclj9uiWIWKzgUltF+deIKTleuXDKxhXn3F7mID2ArlLc47z3CTHvY6DGoBow8Vf6P+KlkZSoCjdhFhqitrO0e4tDaDb8twdEmZTN1nTIz9ocDJa/bkHvF3a+V5L/X5l4g1h+6xSh7ReK9w2Zk8/okyDe3emo+H932e+xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r37FN6L/; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r37FN6L/"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1217647eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911559; x=1792516359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZU7pSaZGKiPMSZYCfmxHQiJ5B/e9tRYMINwq527v7w=;
        b=r37FN6L/d+i/jv5W+11aBknnhl3GxGc/URzqP1CBPParoTG94fsQa4vNWU9DshV76u
         VuOAdkOy5FiseB4e8fPYIlBnlZzN+0UmEz/0ZupcFghZRBlFwxRG9Y0OsTp8QDYmGgHv
         rL2r9OIWNCHAV7LvJxE7ouU6jK3+i8NPNaVOhoZIukroPExR/J1pcBpGP11Z6uOJneYU
         pVqWpL7XoikaMWNWEYhj2vBZ+TbsEgl3chHaXSnfYRwEfU4fZkpiPZO57JdrEufi+G6s
         yJMhfzXTWuanLW45rfaMQvaE3syj9MElR86NeVixn3IdL8l0Bxlw7Z76hplV/HinfOTY
         5Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911559; x=1792516359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZU7pSaZGKiPMSZYCfmxHQiJ5B/e9tRYMINwq527v7w=;
        b=qdW3CGfSohFwSYtqvXSf4WFjh+NKC3H+tUBnbyaJ81k7q4JaCX8SnAnoS2Eys3xAMj
         LY03mbs9eZm/FlQ+5t7lPEtAOoMh24v8h4qsfknFq9WffHiNWF80w2rpR+psVOU7SiyV
         T5HM1HrX/D7JDO8a71cy42NXFSPxWDhi576O8m2YExyt6xkUZRM8kGjck1WnRLrS+BEr
         LpIGkE9gKfauZxckmI1u0cc2+th0okdZxUjy+UDILPke35uQBNimsUSpBiJMD4pCV9Zt
         ZLLi5ZwGRyAT02qKn8+C2CmYWvzdlKnUeQBasy4fOEkPlIyTVTHSCfr6DAwBSL3zfKTH
         0uEw==
X-Forwarded-Encrypted: i=1; AKwUvBxTFnjA7KDwYOzXcSyVq0Si5CYpq183MbkFKVWw56SxMr8KgKinGgESg4bLiOrBgh9PbJPwyr2gO6mi83E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUx8JOVT0iViTxidqF+jwOg6spNeCkFVT/Kjr9upGSw8dxGHZ0
	z+qiEGQotEt7cuT6VD6Khs1jnON9/ttuIz/mkiLCrvFeMK4kk5F/e5Tc
X-Gm-Gg: AYBFou0brL2xaW4aEKs1q7lMZ2U2p0sP1iuSSC+ohvQ7e8k+dAEwLD5eAHtFuQuWRcF
	LykLb+TRHWn4pV9z4yD5Goc4U3QDqeRsLQEuAtEWdudoYN4QaT6w3HxGqF30eivrJa/Goweq7RX
	HXZFu3W3q2GmsCRDttt3crXMMiAItYJ/50fjimq6cFEC7H8qsSlBUbnq03Nek9FlQ4ylYck5pys
	e6tknBwdKJ57dvEI1Yz6xWZShV0tKRRpr9+0WzaBQfy8p9yfNynEqK6JexJpta9u664xJR9LKAI
	fP9fiQF8fzbTXXeB7zz63m5fKhul67fqhsxaRP3beUCQxGA+o35lLOs2E9y0pDqJrqR7ZyZk8FP
	30/AjMCSBhaQ64y4oQG17RQwSWBUDhZBr94UV+Dpny+jok4ZYynDaki23JcRmRgglnE4SuTYDQm
	c00Cf3GwxWGE1cGXevKaUQ5cpC5pQ3escwfFnfyyKM4MdTV9KN/n+rXNnzmwDy3IEw7ijGmWW2B
	3gBfuH1KN3JLqdaYHY3jqwf0cA6cnO6utOVsgLzHGzkPyFOMZSIR584
X-Received: by 2002:a05:693c:4159:20b0:34c:8c69:529d with SMTP id 5a478bee46e88-3537e0a9695mr19809272eec.26.1791911558689;
        Tue, 13 Oct 2026 10:12:38 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm25620546eec.19.2026.10.13.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:12:37 -0700 (PDT)
From: samarth.colleges@gmail.com
To: Jason Gunthorpe <jgg@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] iommufd/iova_bitmap: fail GET_DIRTY_BITMAP when a bitmap page cannot be pinned
Date: Tue, 13 Oct 2026 10:10:45 -0700
Message-ID: <20261013171045.3104619-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samarth Narang <samarth.colleges@gmail.com>

The iova_bitmap_set() function reports dirty IOVAs into a user-provided bitmap, it does so by
pinning the bitmap pages lazily one chunk at a time as the reported IOVA advances.
When advancing to the next chunk fails, the function simply returns without recording the dirty bits.

	if (iova_bitmap_advance_to(bitmap, iova))
		return;

So on an IOMMU_HWPT_GET_DIRTY_BITMAP ioctl, if any bitmap chunk past the
first cannot be pinned, the dirty pages in that chunk are cleared in the page table,
not set in the bitmap, and the ioctl will still return success.
This means that the destination VM will observe stale memory.

This patch records the first such error in the iova_bitmap and propagates it so the
ioctl fails instead of silently succeeding.

Fixes: 4a00f9434891 ("iommupt: Add read_and_clear_dirty op")
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 4e447ce74..e6540b0a2 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -589,7 +589,7 @@ iommu_read_and_clear_dirty(struct iommu_domain *domain,
 	arg.iopt = iopt;
 	arg.domain = domain;
 	arg.dirty = &dirty;
-	iova_bitmap_for_each(iter, &arg, __iommu_read_and_clear_dirty);
+	ret = iova_bitmap_for_each(iter, &arg, __iommu_read_and_clear_dirty);
 
 	if (!(flags & IOMMU_DIRTY_NO_CLEAR))
 		iommu_iotlb_sync(domain, &gather);
diff --git a/drivers/iommu/iommufd/iova_bitmap.c b/drivers/iommu/iommufd/iova_bitmap.c
index dac3e657d..483f0cc84 100644
--- a/drivers/iommu/iommufd/iova_bitmap.c
+++ b/drivers/iommu/iommufd/iova_bitmap.c
@@ -116,6 +116,9 @@ struct iova_bitmap {
 
 	/* length of the IOVA range for the whole bitmap */
 	size_t length;
+
+	/* first error from pinning a bitmap chunk; -EFAULT etc. */
+	int err;
 };
 
 /*
@@ -384,7 +387,9 @@ static int iova_bitmap_advance_to(struct iova_bitmap *bitmap,
 int iova_bitmap_for_each(struct iova_bitmap *bitmap, void *opaque,
 			 iova_bitmap_fn_t fn)
 {
-	return fn(bitmap, bitmap->iova, bitmap->length, opaque);
+	int ret = fn(bitmap, bitmap->iova, bitmap->length, opaque);
+
+	return ret ? ret : bitmap->err;
 }
 EXPORT_SYMBOL_NS_GPL(iova_bitmap_for_each, "IOMMUFD");
 
@@ -411,8 +416,13 @@ void iova_bitmap_set(struct iova_bitmap *bitmap,
 		 * may fail if it's out of bounds, or pinning the pages
 		 * returns an error.
 		 */
-		if (iova_bitmap_advance_to(bitmap, iova))
+		int ret = iova_bitmap_advance_to(bitmap, iova);
+
+		if (ret) {
+			if (!bitmap->err)
+				bitmap->err = ret;
 			return;
+		}
 	}
 
 	last_page_idx = mapped->npages - 1;
