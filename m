Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C2448D01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772454; cv=none; b=rk6w/Lajd3cRmnkw/EeaJ2oxZ+gNvSXIWvFJ2ot/NOjv8wbEMFQKVbivt1X9IRjzNkkD2oOmFXK1BOmSQKJPjX9RnVy6Zz0+Tqkby6ccungxmDXa+1jNSTAuszQMxZoZIaTahazKaQicSouW1TWYqK3R56gRcDTo2LI5z56hczs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772454; c=relaxed/simple;
	bh=2jkM/aXnfe6UELFef2CwP2z67BUn60uRKDwPOtEudKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mgOXRW3bEJ0TVSQ4GJ0juUL2rHr5/UKXYLfizJPMVsX8BRF2JQri6LiQNIGPD5w5bWYUv6gTrJ9DIt+wvsFomv3Ly0+YCOCknFJ/OZ1rtrKi8t/1qFDBR5xeHncincQ/FHRu86DGE+zAiQHj0+wj1+lpy2atqSO9Z2J0OBteiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hdhDt0JmfzKHPbW
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:13:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 06BB44056D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:14:02 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnZbNWgJ5qMElGBA--.7816S5;
	Mon, 07 Sep 2026 17:14:01 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 3/4] mm, swap: return early from swap_extend_table_try_free() on first non-zero entry
Date: Mon,  7 Sep 2026 17:13:55 +0800
Message-Id: <20260907091356.53026-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260907091356.53026-1-shikemeng@huaweicloud.com>
References: <20260907091356.53026-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCnZbNWgJ5qMElGBA--.7816S5
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1Dur1rAF1rKF15Ar1xGrg_yoWDKwb_Ca
	4Ivws3JFW3trn7X397tasrXr1fGr4fK3Z5uF97tFyayry5X3y5uF9rXF4DZw48Ka1IyF9a
	y3Wvvr17Kw42yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Return immediately when the first non-zero swap count is found as
any non-zero swap count prevents freeing extend_table and further
iteration is pointless.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Youngjun Park <youngjun.park@lge.com>
Acked-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 767d83d89d0b..b73f34ff44f8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1527,20 +1527,17 @@ int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
 static void swap_extend_table_try_free(struct swap_cluster_info *ci)
 {
 	unsigned long i;
-	bool can_free = true;
 
 	if (!ci->extend_table)
 		return;
 
 	for (i = 0; i < SWAPFILE_CLUSTER; i++) {
 		if (ci->extend_table[i])
-			can_free = false;
+			return;
 	}
 
-	if (can_free) {
-		kfree(ci->extend_table);
-		ci->extend_table = NULL;
-	}
+	kfree(ci->extend_table);
+	ci->extend_table = NULL;
 }
 
 /* Decrease the swap count of one slot, without freeing it */
-- 
2.36.1

